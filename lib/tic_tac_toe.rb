require "./lib/game_status.rb"
require 'pry'

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    input = input.to_i 
    input -= 1
end

def move(board, index, player)
    board[index] = player
end

def valid_move?(board, index)
    valid = true
    if position_taken?(board, index) || index > 8 || index < 0
        valid = false
    end
    valid
end

def turn(board)
    puts "Enter number 1-9"
    index = input_to_index(gets.strip)
    if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
    else
        puts "invalid"
        turn(board)
    end
end

def turn_count(board)
    count = 0 
    (0..board.length).each do |el|
        if board[el] == "X" || board[el] == "O"
            count += 1
        end
    end
    count
end

def current_player(board)
    player = "O"
    turn_count = turn_count(board)
    if turn_count % 2 == 0 
        player = "X"
    end
    player
end

def congrats(winner)
    puts "Congratulations #{winner}!"
end

def play(board)
    until over?(board)
        turn(board)
    end
    if won?(board)
        winner = winner(board)
        congrats(winner)
    end
    if draw?(board)
        puts "Cat's Game!"
    end
end


    