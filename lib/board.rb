class Board
    attr_reader :size
  def initialize(length)
    @grid = Array.new(length){ Array.new(length, :N) }
    @size = length * length
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    @grid.reduce(0) do |sum, array|
        sum + array.count{ |element| element == :S }
    end
  end
end
