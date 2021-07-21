def sum_to(n)
    return nil if n < 0
    return n if n == 1
    n + sum_to(n -1)
end

def add_numbers(nums_array)
    return nil if nums_array.empty?
    return nums_array.first if nums_array.length <=1
    
    nums_array.pop + add_numbers(nums_array)

end



def reverse(str)
    return str if str.length <= 1

    str[-1] + reverse(str[0..-2])

end
