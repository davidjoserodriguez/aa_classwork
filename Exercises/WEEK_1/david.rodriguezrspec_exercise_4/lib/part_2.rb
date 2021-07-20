def proper_factors(n)
  
    (1...n).select { |i| n % i == 0 }
   
end

def aliquot_sum(n)

    proper_factors(n).sum

end

def perfect_number?(n)

    n == aliquot_sum(n)

end

def ideal_numbers(n)
    
    num = 1
    array = []
    while array.length < n
        array << num if perfect_number?(num)
        num += 1
    end
    array 
end