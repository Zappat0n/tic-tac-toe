#!/usr/bin/ruby
require_relative '../lib/player'
require_relative '../lib/game_logic'
def player_name(order)
  puts "Please introduce #{order} player's name:"
  name = gets.chomp
  player_name(order) if name == ''
  name
end

def start_game
  @player1 = Player.new(player_name('first'), 'X')
  @player2 = Player.new(player_name('second'), 'O')
  Game.new(@player1, @player2)
end

def print_board
  puts '  1 2 3', '--------'
  i = 0
  arr = %w[a b c]
  @data.each do |line|
    text = "#{arr[i]}|#{line.join('|')}|"
    puts text, '--------'
    i += 1
  end
  ' '
end

def player_move(player)
  puts "Turn of #{player.name}"
  gets.chomp
end

def player_wrong_move
  puts print_board, 'Wrong move!'
end

def player_won(player)
  abort("Congratulations #{player.name}, you won the Game!")
end

def this_is_a_draw
  abort('This is a draw')
end
puts 'Welcome to tic-tac-toe!'
start_game
