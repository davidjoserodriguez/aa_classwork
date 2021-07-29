require "tdd.rb"

describe "#my_uniq" do
    it "takes out duplicates" do
        expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
end

describe "#two_sum" do
    it "returns an array of indexes of sum of zero" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
end

describe "#my_transpose" do 
    it "will convert between the row-oriented and column-oriented respresentations" do
        expect(my_transpose([[0,1,2],[3,4,5],[6,7,8]])).to eq([[0,3,6],[1,4,7],[2,5,8]])
    end
end

describe "#stock_picker" do
    it "returns an array of stock prices and the most profitable pair" do 
        expect(stock_picker([5,2,7,6,10])).to eq([1,4])
    end
end