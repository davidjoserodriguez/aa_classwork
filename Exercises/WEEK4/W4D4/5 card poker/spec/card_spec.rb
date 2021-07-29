require "card"

describe "Card" do
    describe "#initialize" do
        it "set up instance variables" do
            num = "5"
            suit = "D"
            card = Card.new(num, suit)
            expect(card.num).to eq(num)
            expect(card.suit).to eq(suit)
        end

        it "should raise error if suit is invalid" do
            num = "5"
            suit = "A"
            expect {Card.new(num, suit)}.to raise_error("That is not a valid type of card")
        end

        it "should raise error if num is invalid" do
            num = "1000000"
            suit = "D"
            expect {Card.new(num, suit)}.to raise_error("That is not a valid num")
        end
    end

end