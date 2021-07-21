
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


robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# but it does
print robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
