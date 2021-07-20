def strange_sums(array)
    count = 0
    array.each_with_index do |el1, i1|
        array.each_with_index do |el2, i2|
            if i2 > i1 && el1 + el2 == 0
                count += 1
            end
        end
    end
    count 
end

def pair_product(array, n)

    array.each_with_index do |num1, i1|
        array.each_with_index do |num2, i2|
            return true if i2 > i1 && num1 * num2 == n
        end
    end
    false
end

def rampant_repeats(str, hash)
    new_str = ""

    str.each_char do |char|
        if hash.has_key?(char)
            new_str += char * hash[char]
        else
            new_str += char
        end
    end 
    new_str
end

def perfect_square(n)
    (0..n).each do |i|
        return true if i * i == n
    end
    false
end

def num_factors(n)
    (1..n).count { |i| n % i == 0 }
end

def anti_prime?(n)
    count = num_factors(n)
    (1...n).all? { |i| count > num_factors(i) }
end
p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0