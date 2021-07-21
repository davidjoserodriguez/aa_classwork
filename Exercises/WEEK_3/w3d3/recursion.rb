
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
