class Array
    def my_uniq
        arr = []
        self.each do |el|
            if !arr.include?(el)
                arr << el
            end
        end
        arr 
    end
    def two_sum
        arr = []
        self.each_with_index do |el, idx|
            (idx + 1...self.length).each do |idx2|
                arr << [idx, idx2] if self[idx] + self[idx2] == 0
            end
        end
        arr
    end 
end

# [[0,3,6],
# [3,4,7],
# [6,7,8]]

# (0...2).each do i
#  (0..3)

def my_transpose(arr)
    return false if arr.any?{ |row| row.length != arr[0].length}
   
    array = []
    (0...arr.length).each do |row|
        insideArray = []
        (0...arr.length).each do |col|
            insideArray << arr[col][row]
        end
        array << insideArray
    end
    array
end

#[5,2,7,6,10]
# 5 2 - 2 is smaller so skip
# 5 7 - 7-5 = 2 gain    < -- current biggest [0,2]
# 5,6 = 6- 5 = 1
#5 , 10 = 5 gain <---new biggest
#2,7

def stock_picker(arr)
    biggest = 0
    biggestArray = []
    (0...arr.length - 1).each do |idx1|
        (idx1+1 ... arr.length).each do |idx2|
            current = [idx1,idx2]
            profit = arr[idx2] - arr[idx1]
            if profit > 0 && profit > biggest
                biggest = profit
                biggestArray = current
            end
        end
    end
    biggestArray
end

class Tower
    attr_reader :polls
    attr_writer :polls
    
    def initialize
        @polls = [[1,2,3], [], []]
        # @won = false
    end

    def won?
        @polls == [[],[],[1,2,3]]
    end

    def move(pos1, pos2)
        val = @polls[pos1].shift
        if  @polls[pos2].empty? || val < @polls[pos2][0]
            @polls[pos2].unshift(val)
        else
            @polls[pos1].unshift(val)
            puts "That was an invalid move"
        end
        @polls
    end

    def play

        until won?
            p @polls
            puts "Please enter a position in the format #{0} #{1} "
            pos = gets.chomp
            break if pos == "exit"
            #"0 2"
            positions = pos.split(" ")
            #["0","2"]
            move(positions[0].to_i,positions[1].to_i)
        end
        puts "Game is over!! Congrats"
    end
end

t = Tower.new

t.play

