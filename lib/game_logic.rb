# Module to get if there is a winner
module GameLogic
  def check_winner(data)
    @data = data
    return 1 if check_row == 1 || check_column == 1 || check_diagonal == 1
    return 2 if check_row == 2 || check_column == 2 || check_diagonal == 2
  end

  def check_row
    @data.each do |arr|
      return 1 if arr.all?('X')
      return 2 if arr.all?('O')
    end
  end

  # @data = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  def check_column
    0.upto(2) do |i|
      ar = []
      @data.each do |arr|
        ar << arr[i]
      end
      return 1 if ar.all?('X')
      return 2 if ar.all?('O')
    end
  end

  def check_diagonal
    ar = []
    arrr = []
    i = 0
    j = 2
    @data.each do |arr|
      ar.push(arr[i])
      arrr.push(arr[j])
      i += 1
      j -= 1
    end
    return 1 if ar.all?('X') || arrr.all?('X')
    return 2 if ar.all?('O') || arrr.all?('O')
  end
end
