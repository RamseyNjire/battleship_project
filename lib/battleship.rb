require_relative "board"
require_relative "player"

class Battleship
    attr_reader :player, :board
    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "There are #{@board.num_ships} ships on the board"
        @board.print
    end
end
