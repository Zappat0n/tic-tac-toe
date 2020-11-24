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
    @player1 = Player.new(gets.chomp, 'X')

    puts "Please introduce second player's name:"
    @player2 = Player.new(gets.chomp, 'O')

    @board.to_s
  end

  def random_winner
    random = rand
    puts "Player #{@player1.name} has won!" if random < 0.2
    puts "Player #{@player2.name} has won!" if random > 0.2 && random < 0.4
    puts 'This is a Draw!' if random > 0.7
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

      if i >= 5
        random_winner
        break
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

# Players playing
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

# Board class for UI
class Board
  def initialize
    @data = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def to_s
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

  def move(position, symbol)
    @data[(position - 1) / 3][position % 3 - 1] = symbol
    to_s
  end
end

main = Main.new
# main.user_info
# main.print
main.iteration
