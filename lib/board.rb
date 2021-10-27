require "byebug"
class Board
    attr_reader :size

    def self.print_grid(grid)
        length = grid.size
        grid.flatten.each_with_index do |element, index|
            if index % length == length - 1
                puts element
            else
                print "#{element} "
            end
        end
    end

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

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "You sunk my battleship!"
            return true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        quarter = @size.fdiv(4).floor.to_i
        
        length = Math.sqrt(@size).to_i

        positions_array = []

        quarter.times do
            position = [rand(length - 1), rand(length - 1)]
            while positions_array.include?(position)
                position = [rand(length - 1), rand(length - 1)]
            end

            positions_array << position
        end
        positions_array.each { |position| self[position] = :S }
    end

    def hidden_ships_grid
        @grid.map { |row| row.map { |element| element == :S ? :N : element } }
    end
end
