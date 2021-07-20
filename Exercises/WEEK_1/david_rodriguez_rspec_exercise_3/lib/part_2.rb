def element_count(array)
    hash = Hash.new(0)

    array.each do |el|
        hash[el] += 1
    end
    hash
end

def char_replace!(string, hash)

    string.each_char.with_index do |char, i|
        if hash.has_key?(char)
            string[i] = hash[char]
        end
    end
    string 
end

def product_inject(array)

    array.inject { |accum, el| accum * el }
end