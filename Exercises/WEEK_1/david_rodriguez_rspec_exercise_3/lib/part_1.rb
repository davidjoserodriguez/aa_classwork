def is_prime?(num)
    return false if num < 2

    (2...num).each do |divisor|
        return false if num % divisor == 0
    end
    true
end

def nth_prime(n)

    count = 0
    num = 0
    while count < n
        num += 1
        count += 1 if is_prime?(num)
    end
    num
end

def prime_range(min, max)
    (min..max).select { |n| is_prime?(n) }
end