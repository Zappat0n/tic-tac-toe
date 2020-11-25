#!/usr/bin/ruby
require_relative '../lib/player'
require_relative '../lib/game_logic'
# Main Class
class Main
  puts 'Welcome to tic-tac-toe!'
  @round = 0

  def user_info
    puts "Please introduce first player's name:"
    @player1 = Player.new(gets.chomp, 'X')

    puts "Please introduce second player's name:"
    @player2 = Player.new(gets.chomp, 'O')
    @board = Board.new(@player1, @player2)
    @board.to_s
  end

  def iteration
    user_info
    i = 0
    player = @player1
    while i < 9
      if moves(player)
        player = player == @player1 ? @player2 : @player1
        i += 1
      else
        puts @board.to_s, 'Wrong move!'
      end
    end
  end

  def right_move?(first, second)
    @player_input.length == 2 && !first.nil? && !second.nil? && @board.data[first][second] == ' '
  end

  def moves(player)
    puts "Turn of #{player.name}"
    @player_input = gets.chomp

    first = %w[a b c].index(@player_input[0])
    second = [1, 2, 3].index(@player_input[1].to_i)
    if right_move?(first, second)
      @board.move(first, second, player.symbol)
      true
    else
      false
    end
  end
end

# Board class for UI
class Board
  include GameLogic
  attr_reader :data

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @data = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def to_s
    puts '', '-------'
    @data.each do |line|
      text = "|#{line.join('|')}|"
      puts text
      puts '-------'
    end
    ' '
  end

  def move(first, second, symbol)
    @data[first][second] = symbol
    result = check_winner(data)
    to_s
    abort("Congratulations #{@player1.name}, you won the Game!") if result == 1
    abort("Congratulations #{@player2.name}, you won the Game!") if result == 2
  end
end

main = Main.new
main.iteration
