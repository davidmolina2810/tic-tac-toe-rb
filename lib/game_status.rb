require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                [0,1,2], #top row
                [3,4,5], #middle row
                [6,7,8], #bottom row
                [0,3,6], #left column
                [1,4,7], #middle column
                [2,5,8], #right column
                [0,4,8], #left to right diagonal 
                [2,4,6] #right to left diagonal
              ]

def won?(board)
  win = false
  WIN_COMBINATIONS.each do |win_indices|
    ["X","O"].each do |player|
      position1 = board[win_indices[0]]
      position2 = board[win_indices[1]]
      position3 = board[win_indices[2]]
      if position1 == player && position2 == player && position3 == player
        win = true
        return win_indices
      end
    end
  end
  win
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  draw = false
  if !(won?(board))
    if full?(board)
      draw = true
    end
  end
  draw
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  end
end

def winner(board)
  if !(draw?(board)) && over?(board)
    indices = won?(board)
    return board[indices[0]]
  end
end

  