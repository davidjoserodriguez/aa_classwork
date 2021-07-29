require "tdd.rb"

describe "#my_uniq" do
    it "takes out duplicates" do
        expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
        expect([1,1,1,1,1,1,1].my_uniq).to eq([1])
    end
    it "handles empty array correctly" do
        expect([].my_uniq).to eq([])
    end
end

describe "#two_sum" do
    it "returns an array of indexes of sum of zero" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
    it "should return an empty array if no pairs are found" do
        expect([1,2,3,4,5,6,7].two_sum).to eq([])
    end
end

describe "#my_transpose" do 
    it "will convert between the row-oriented and column-oriented respresentations" do
        expect(my_transpose([[0,1,2],[3,4,5],[6,7,8]])).to eq([[0,3,6],[1,4,7],[2,5,8]])
    end
    it "will return false if not a square array" do 
        expect(my_transpose([[3,3,3],[2,2],[3,3,3]])).to be(false)
    end
end

describe "#stock_picker" do
    it "returns an array of stock prices and the most profitable pair" do 
       expect(stock_picker([5,2,7,6,10])).to eq([1,4])
    end
    it "returns an empty array if the stock picker recieves no prices" do
        expect(stock_picker([])).to eq([])
    end
    it "if there are duplicate profits, keep the first one" do 
        expect(stock_picker([5,2,7,6,10,10])).to eq([1,4])
    end
end

describe "Towers" do 
    describe "#initialize" do
       it "should create a new tower" do
        tower = Tower.new()
        expect(tower.polls).to eq([[1,2,3], [], []])
       end
    end

    describe "#won" do 
        context "return true" do 
            it "if game is won" do
                tower = Tower.new()
                tower.polls = [[],[],[1,2,3]]
                expect(tower.won?).to be(true)
            end
        end
        context " return false" do 
            it "if game is not won" do
                tower = Tower.new()
                tower.polls = [[],[1],[2,3]]
                expect(tower.won?).to be(false)
            end
        end
    end

    describe "#move" do
        it "should move a block from position 1 to position 2" do 
            tower = Tower.new()
            expect(tower.move(0,1)).to eq([[2,3], [1], []])
            expect(tower.move(0,2)).to eq([[3], [1], [2]])
        end
        it "should remain unchaged if move is unvalid" do
            tower = Tower.new()
            #[[1,2,3],[],[]]
            tower.move(0,1) 
            #[[2,3],[1],[]]
            expect(tower.move(0,1)).to eq([[2,3], [1], []])
        end
    end

    # describe "#play" do
    #     context "keep playing until won" do
    #         it "should recieve a valid position" do
                
    #         end
    #     end
    # end
end

