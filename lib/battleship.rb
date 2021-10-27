require_relative "board"
require_relative "player"

class Battleship
    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end
end
