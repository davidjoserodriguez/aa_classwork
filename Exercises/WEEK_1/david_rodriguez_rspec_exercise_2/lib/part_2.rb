def palindrome?(string)
    string.each_char.with_index do |char, i|
        return false if char != string[-1 - i]
    end
    true
end

def substrings(string)
    substrings = []
    (0...string.length).each do |i|
        (i...string.length).each do |j|
            substrings << string[i..j]
        end
    end
    substrings
end

def palindrome_substrings(string)
    substrings = substrings(string)

    substrings.select { |substring| substring.length > 1 && palindrome?(substring) }
end