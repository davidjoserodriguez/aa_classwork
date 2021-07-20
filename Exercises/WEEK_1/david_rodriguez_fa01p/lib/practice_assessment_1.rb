def first_letter_vowel_count(sentence)
    vowels = "aeiouAEIOU"

    words = sentence.split(" ")

    words.count { |word| vowels.include?(word[0]) }
end

def count_true(array, prc)
    array.count { |el| prc.call(el) == true }
end

def procformation(array, prc1, prc2, prc3)
    array.map do |el|
        if prc1.call(el)
            prc2.call(el)
        else
            prc3.call(el)
        end
    end
end

def array_of_array_sum(numbers)
    numbers.flatten.sum
end

def selective_reverse(sentence)
    words = sentence.split
    vowels = "AEIOUaeiou"

    new_sentence = words.map do |word|
        if vowels.include?(word[0]) || vowels.include?(word[-1])
            word
        else
            word.reverse
        end
    end
    new_sentence.join(" ")
end

def hash_missing_keys(hash, *n)

    n.reject { |num| hash.has_key?(num) }

end