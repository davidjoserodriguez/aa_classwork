class Human
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value    
    end

    def get_position
        puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(" ")

        if pos.length != 2
            raise "please give row, col"
        elsif pos.any? { |input| input != 0 && (input.to_i.to_s != input) } 
            raise "one of both of your inputs are incorret"
        else
            pos.map!(&:to_i)
        end


    end

        
end
