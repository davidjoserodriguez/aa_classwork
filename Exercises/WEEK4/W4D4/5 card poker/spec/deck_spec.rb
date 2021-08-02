require "deck"


describe "Deck" do 
    describe "#initialize" do 
        it "set up the instant variables" do 
            deck = Deck.new
            expect(deck.length).to eq(52)
        end
    end
    describe "#length" do 
        it "should return the length of the deck" do 
            deck = Deck.new
            expect(deck.length).to eq(52)
        end
    end
    describe "#my_shuffle" do 
        it "should shuffle the deck" do 
            deck = Deck.new
            expect(deck.stack[0].num + deck.stack[0].suit + deck.stack[1].num + deck.stack[1].suit).to_not eq("2D2S")
        end
    end
    describe "#draw" do
        it "should take a card from the deck" do 
            deck = Deck.new
            length = deck.length
            deck.draw
            expect(deck.length).to eq(length - 1)
        end
    end
end