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
    arr.transpose
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


#