class Card

    SUIT = ["D", "S", "C", "H"]
    CARDS = {
        "A"=> 14,
        "K"=>13,
        "Q"=>12,
        "J"=>11,
        "10"=> 10,
        "9"=> 9,
        "8"=> 8,
        "7"=> 7,
        "6"=> 6,
        "5"=> 5,
        "4"=> 4,
        "3"=> 3,
        "2"=> 2
    }


    attr_reader :num, :suit
    def initialize(num, suit)
        raise "That is not a valid type of card" if !SUIT.include?(suit)
        raise "That is not a valid num" if !CARDS.has_key?(num)
        @num = num
        @suit = suit
    end


end