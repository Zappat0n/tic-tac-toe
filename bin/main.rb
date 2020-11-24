#!/usr/bin/ruby

# Main Class
class Main
  puts 'Welcome to tic-tac-toe!'
  @round = 0

  def initialize
    @board = Board.new
  end

  def user_info
    puts "Please introduce first player's name:"
    @player1 = gets.chomp

    puts "Please introduce second player's name:"
    @player2 = gets.chomp
  end

  def print
    @board.to_s
    @board.move(9, 'X')
  end

  def iteration1
    i = 0
    while i < 6
      moves
      i += 1
    end
  end

  def moves
    @player_input = gets.chomp
    case @player_input[0]
    when 'a'
      @board.move(@player_input[1].to_i, 'X')
    when 'b'
      @board.move(3 + @player_input[1].to_i, 'X')
    when 'c'
      @board.move(6 + @player_input[1].to_i, 'X')
    end
  end
end

# Board class for UI
class Board
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
    p ' '
    p "#{symbol} puts in #{position}"
    @data[(position - 1) / 3][position % 3 - 1] = symbol
    to_s
  end
end

main = Main.new
# main.user_info
# main.print
main.iteration1
