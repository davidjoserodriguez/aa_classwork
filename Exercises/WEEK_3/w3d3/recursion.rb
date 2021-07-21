
# # iterative
# def range(start, end)
#     arr = []
#     (start...end).each do |num|
#         arr << num
#     end
#     arr
# end

#recursion

def range(min, max)
    # # return [] if end < start
    # if its the last one, 1, using start and end

    return [] if max <= min

    range(min, max - 1) << max - 1
    # ^ treat it like it is the same data type as base case, so treat it like an array, <<, .map

    # [min] + range(min + 1, max - 1)
    # ^ num       ^ same data type our base case
end

# p range(5, 10)

def exp1(base, power)
    return 1 if power == 0
    base * exp1(base, power - 1)
end

def exp2(base, power)
    return 1 if power == 0
    return base if power == 1

    if power.even?
        base * exp2(base, power / 2) ** 2
    else
        base * (exp2(base, (power - 1) / 2) ** 2)
    end
end

def deep_dup(arr)
    return [arr] unless arr.is_a? # == if !array.is_a?
    deep_copy = []

    arr.each do |ele|
        deep_copy << deep_dup(ele)
    end
    
    deep_copy
end


# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# print robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

def fib(n)
    return [0] if n == 1
    return [0, 1] if n == 2
    return [] if n == 0

    previous_fib = fib(n - 1)
    last_fib = previous_fib[-1] + previous_fib[-2]
    previous_fib << last_fib
end

# puts fib(5)

# [1,2]
# arr.length / 2 == 1
# mid_idx = 1

# lower_half is [1]
# upper_half is nil



# bsearch - ONLY for sorted arrays
# merge sort - for unsorted/sorted arrays

def bsearch(array, target)
    return nil if arr.length < 1

    mid_idx = array.length / 2
    lower_half = array[0...mid_idx] 
    upper_half = array[mid_idx + 1..-1]

    return mid_idx if array[mid_idx] == target

    if target < array[mid_idx]
        bsearch(lower_half, target)
    else
        result = bsearch(upper_half, target)
        
        if result.nil?
            return nil # return nil to indicate target is not in the array
        else
            lower_half.length + 1 + result
#                                     ^ will return index, but from upper half


#             [10,21,34,89,100, 110, 150]
# + length of lower_half    + 1        ^ 2
#             target is 100
        end
    end
end


# [10,21,34,89,100, 110, 150]

#             89 != 100
#             but 89 < 100, so we know that we need to search in the upper half
# target is 100

# hey, what's the middle ele, then check is its == target?
#     No? okay, they is it lower higher than the target
#         then choose to continue search (call method again via recursion) in upper or lower half
#         base case: return nil is arr.length < 1


def merge_sort(arr)
    return arr if arr.length <= 1

    mid_idx = arr.length / 2 # this is really for breaking down the array into singletons
    left_side = arr[0...mid_idx]
    right_side = arr[mid_idx..-1]

    left = merge_sort(left_side)
    right = merge_sort(right_side)

    merge(left, right) # this does the actual sorting
end

def merge(left, right) # [34], [27]
    # goal: return some sorted array
    sorted = []

    until left.empty? || right.empty?
        if left.first < right.first
            sorted << left.shift
        else
            sorted << right.shift
        end
    end

    # sorted = [3,9,10,27,38,43]
    # left = []
    # right = [82]

    # sorted += [82]
    # #=> [3, 9, 10, 27, 38, 43, 82]

    if left.empty?
        sorted.concat(right)
    else
        sorted.concat(left)
    end

    sorted
end

# p merge_sort([38,27,43,3,9,82,10])

# class array
#     # Array.sort
#     # Array.merge_sort

#     arr --> self
#     ||=

#     prc ||= Proc.new { |a, b|  a <=> b} # in merge_sort

# end

def subsets

end
