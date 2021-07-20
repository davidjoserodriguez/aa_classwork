def palindrome?(str)
    str.each_char.with_index do |char, i|
        if char != str[str.length - 1 - i]
            return false
        end
    end
    true
end

def substrings(str)
    substrings = []

    (0...str.length).each do |i|
        (i...str.length).each do |j|
            substrings << str[i..j]
        end
    end
    substrings
end

def palindrome_substrings(str)
   

    substrings(str).select { |str| palindrome?(str) && str.length > 1 }

    
end