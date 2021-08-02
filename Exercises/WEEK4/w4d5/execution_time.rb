require 'byebug'

#PHASE I

def my_min(arr)
  sorted = false
  until sorted
    sorted = true
    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i+1]
        sorted = false
        arr[i], arr[i+1] = arr[i+1], arr[1]
      end
    end
  end
  arr.first
end


# PHASE II

# def my_min(arr)
#   smallest = arr[0]
#   arr.each do |ele|
#     if smallest > ele
#       smallest = ele
#     end
#   end
#   smallest
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(array)
  arr = []
  (0...array.length).each do |i|
    (i + 1...array.length).each do |j|
      arr << array[i] + array[j] 
    end
  end
  arr.max
       
end


def largest_contiguous_subsum(array)
  largest_sum = array[0] # 5
  current_sum = 0        # 1
   # arr[i] + arr[i + 1] to sum; if i add 6 would it increase or not

  (0...array.length).each do |i| # 4
    if current_sum <= 0
      current_sum = 0
    end
    current_sum += array[i]
    if current_sum > largest_sum
      largest_sum = current_sum
    end
  end
  largest_sum
end
list = [2, 3, -6, 7, -6, 7]
list = [-5, -1, -3]

p largest_contiguous_subsum(list)

    # current_sum = array[i] + array[i +1]
    # if current_sum > largest_sum
    #   largest_sum = current_sum
    
     


