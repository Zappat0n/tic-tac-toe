#!/usr/bin/ruby

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
    @board.move(9, "X")
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
#main.user_info
main.print
