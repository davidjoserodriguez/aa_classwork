def partition(array, num)
    first = array.select { |n| n < num }
    second = array.select { |n| n >= num }

    [first, second]
end

def merge(hash_1, hash_2)
    hash = {}

    hash_1.each { |k, v| hash[k] = v }
    hash_2.each { |k, v| hash[k] = v }

    hash
end

def censor(sentence, array)
    words = sentence.split

    new_words = words.map do |word|
        if array.include?(word.downcase)
            vowel(word)
        else
            word
        end
    end
    new_words.join(" ")
end

def vowel(word)
    vowels = "AEIOUaeiou"
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
    product = 1

    while product < n
        product *= 2
    end
    product == n
end