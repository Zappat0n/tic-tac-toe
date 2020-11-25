#!/usr/bin/ruby
# frozen_string_literal: true

@data = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]

def user_info
  puts "Please introduce first player's name:"
  @player1 = gets.chomp
  puts "Please introduce second player's name:"
  @player2 = gets.chomp
  board_to_s
  iteration
  @symbol = 'O'
end

def random_winner
  random = rand
  puts "Player #{@player1} has won!" if random < 0.2
  puts "Player #{@player2} has won!" if random > 0.2 && random < 0.4
  puts 'This is a Draw!' if random > 0.4
  abort
end

def iteration
  player = @player1
  0.upto(9) do |i|
    if moves(player)
      player = player == @player1 ? @player2 : @player1
    else
      puts board_to_s, 'Wrong move!'
    end
    random_winner if i >= 5
  end
end

def board_position(player_input)
  case player_input[0]
  when 'a'
    player_input[1].to_i
  when 'b'
    3 + player_input[1].to_i
  when 'c'
    6 + player_input[1].to_i
  end
end

def moves(player)
  puts "Turn of #{player}"
  @symbol = @symbol == 'X' ? 'O' : 'X'
  @player_input = gets.chomp
  if @player_input.length == 2 && @player_input[1].to_i < 4 && %w[a b c].include?(@player_input[0])
    board_move(board_position(@player_input), @symbol)
    true
  else
    false
  end
end

def board_to_s
  puts '  1 2 3'
  puts '--------'
  i = 0
  arr = %w[a b c]
  @data.each do |line|
    text = "#{arr[i]}|#{line.join('|')}|"
    puts text
    puts '--------'
    i += 1
  end
end

def board_move(position, symbol)
  @data[(position - 1) / 3][position % 3 - 1] = symbol
  board_to_s
end

puts 'Welcome to tic-tac-toe!'
user_info
