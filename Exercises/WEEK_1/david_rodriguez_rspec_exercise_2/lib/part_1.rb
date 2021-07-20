def partition(array, n)
    first = array.select { |el| el < n}
    second = array.select { |el| el >= n }

    [first, second]
end

def merge(hash1, hash2)
    new_hash = {}

    hash1.each { |k, v| new_hash[k] = v }
    hash2.each { |k, v| new_hash[k] = v }

    new_hash
end

def censor(sentence, array)
    words = sentence.split

    new_sent = words.map do |word|
        if array.include?(word.downcase)
            censored(word)
        else
            word
        end
    end
    new_sent.join(" ")
end

def censored(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_word += "*"
        else
            new_word += char
        end
    end
    new_word
end

def power_of_two?(n)
    i = 1
    while i < n 
        i *= 2
    end
    i == n 
end