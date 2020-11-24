# Module to get if there is a winner
module GameLogic
  def check_winner(data)
    @data = data
    puts "check_row=#{check_row}"
    puts "check_column = #{check_column}"
    puts "check_diagonal = #{check_diagonal}"
  end

  def check_row
    @data.each do |arr|
      return 1 if arr.all?('X')
      return 2 if arr.all?('O')
    end
  end

  # @data = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  def check_column
    ar = []
    @data.each do |arr|
      ar << arr[0]
    end
    return 1 if ar.all?('X')
    return 2 if ar.all?('O')
  end

  def check_diagonal
    ar = []
    i = 0
    @data.each do |arr|
      ar << arr[i]
      i += 1
    end
    return 1 if ar.all?('X')
    return 2 if ar.all?('O')
  end
end
