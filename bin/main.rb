#!/usr/bin/ruby
require_relative '../lib/player'
require_relative '../lib/game_logic'
# Main Class
class Main
  puts 'Welcome to tic-tac-toe!'
  @round = 0

  def initialize
    @board = Board.new
  end

  def user_info
    puts "Please introduce first player's name:"
    @player1 = Player.new(gets.chomp, 'X')

    puts "Please introduce second player's name:"
    @player2 = Player.new(gets.chomp, 'O')

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
    puts "Turn of #{player.name}"
    @player_input = gets.chomp

    if @player_input.length == 2 && @player_input[1].to_i < 4 && %w[a b c].include?(@player_input[0])
      @board.move(board_position(@player_input), player.symbol)
      true
    else
      false
    end
  end
end

# Board class for UI
class Board
  include GameLogic

  def initialize
    @data = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def to_s
    p '-------'
    @data.each do |line|
      text = "|#{line.join('|')}|"
      p text
      p '-------'
    end
  end

  def move(position, symbol)
    if position > 8
      puts po
      puts 'Wrong move!'
      return
    end
    @data[(position - 1) / 3][position % 3 - 1] = symbol

    puts check_winner(@data)
    to_s
  end
end

main = Main.new
# main.user_info
# main.print
main.iteration
