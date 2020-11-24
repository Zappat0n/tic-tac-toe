# Module to get if there is a winner
module GameLogic
  def check_winner(data)
    @data = data
    puts chec
  end

  def check_row
    @data.each do |arr|
      return 1 if arr.all?('X')
      return 2 if arr.all?('O')
    end
  end
end
