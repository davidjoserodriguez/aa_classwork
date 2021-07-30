require "card.rb"
class Deck

    attr_reader :stack

    BASESTACK = [
                 Card.new("2","D"),
                 Card.new("2","S"),
                 Card.new("2","C"),
                 Card.new("2","H"),
                 Card.new("3","D"),
                 Card.new("3","S"),
                 Card.new("3","C"),
                 Card.new("3","H"),
                 Card.new("4","D"),
                 Card.new("4","S"),
                 Card.new("4","C"),
                 Card.new("4","H"),
                 Card.new("5","D"),
                 Card.new("5","S"),
                 Card.new("5","C"),
                 Card.new("5","H"),
                 Card.new("6","D"),
                 Card.new("6","S"),
                 Card.new("6","C"),
                 Card.new("6","H"),
                 Card.new("7","D"),
                 Card.new("7","S"),
                 Card.new("7","C"),
                 Card.new("7","H"),
                 Card.new("8","D"),
                 Card.new("8","S"),
                 Card.new("8","C"),
                 Card.new("8","H"),
                 Card.new("9","D"),
                 Card.new("9","S"),
                 Card.new("9","C"),
                 Card.new("9","H"),
                 Card.new("10","D"),
                 Card.new("10","S"),
                 Card.new("10","C"),
                 Card.new("10","H"),
                 Card.new("J","D"),
                 Card.new("J","S"),
                 Card.new("J","C"),
                 Card.new("J","H"),
                 Card.new("Q","D"),
                 Card.new("Q","S"),
                 Card.new("Q","C"),
                 Card.new("Q","H"),
                 Card.new("K","D"),
                 Card.new("K","S"),
                 Card.new("K","C"),
                 Card.new("K","H"),
                 Card.new("A","D"),
                 Card.new("A","S"),
                 Card.new("A","C"),
                 Card.new("A","H")
    ]
    def initialize
        @stack = []
        BASESTACK.each {|card| @stack << card}
        my_shuffle
    end
    
    def length 
        @stack.length
    end

    def my_shuffle
        @stack.shuffle!
    end
    
    def stack
        @stack
    end

    def draw
        val = @stack.shift
        return val
    end
end