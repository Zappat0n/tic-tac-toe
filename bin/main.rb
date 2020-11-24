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

  def iteration
    i = 0
    while i < 6 do
      iteration
      i += 1
    end
  end

  def moves
    @player_input = gets.chomp
    case @player_input
    when 'a1'
      @board.move(1, 'X')
    when 'a2'
      @board.move(2, 'X')
    when 'a3'
      @board.move(3, 'X')
    when 'b1'
      @board.move(4, 'X')
    when 'b2'
      @board.move(5, 'X')
    when 'b3'
      @board.move(6, 'X')
    when 'c1'
      @board.move(7, 'X')
    when 'c2'
      @board.move(8, 'X')
    when 'c3'
      @board.move(9, 'X')
    end
  end
end

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
main.moves
