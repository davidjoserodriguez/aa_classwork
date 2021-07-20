# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(n)
    i = n
    while i >= 2
        return i if is_prime?(i) && n % i == 0
        i -= 1
    end
end

def is_prime?(n)

    (2...n).each do |divisor|
        return false if n % divisor == 0
    end
    n > 1
end

def unique_chars?(string)
    hash = Hash.new(0)

    string.each_char { |char| hash[char] += 1}

    hash.each do |k, v|
        return false if v > 1
    end
    true
end

def dupe_indices(array)
    hash = Hash.new { |h,k| h[k] = [] }

    array.each.with_index { |el, i| hash[el] << i }

    hash.select { |k,v| v.length > 1 } 
end

def ana_array(arr1, arr2)
    
    arr1.each do |el|
        return false if !arr2.include?(el)
    end

    arr2.each do |el|
        return false if !arr1.include?(el)
    end

    true
end