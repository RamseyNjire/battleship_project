class Player
    def get_move
        puts "Enter a position with coordinates separated by a space, like '4 7'"
        position = gets.chomp.split(" ").map{ |element| element.to_i }
    end
end
