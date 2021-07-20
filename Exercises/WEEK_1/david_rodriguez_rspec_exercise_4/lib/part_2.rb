def proper_factors(n)
    arr = []
    (1...n).each do |num|
        arr << num if n % num == 0
    end
    arr
end

def aliquot_sum(num)
    factors = proper_factors(num)
    factors.sum
end

def perfect_number?(n)
    aliquot_sum(n) == n 
end

def ideal_numbers(n)
    arr = []

    num = 0
    while arr.length < n
        num += 1
        arr << num if perfect_number?(n)
    end
    arr
end