class Board
  def initialize(length)
    @grid = Array.new(length){ Array.new(length, :N) }
    @size = length * length
  end
end
