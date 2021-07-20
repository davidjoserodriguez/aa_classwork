def first_letter_vowel_count(sentence)
    vowels = 'aeiouAEIOU'
    words = sentence.split(' ')

    words.count { |word| vowels.include?(word[0]) } 
end

def count_true(array, prc)
    
    array.count { |ele| prc.call(ele) }

end

def procformation(array, prc1, prc2, prc3)
    arr = []
    array.each do |ele|
        if prc1.call(ele)
            arr << prc2.call(ele)
        else
            arr << prc3.call(ele)
        end
    end
    arr
end

def array_of_array_sum(array)
    array.flatten.sum
end

def selective_reverse(sentence)
    vowels = 'aeiouAEIOU'
    words = sentence.split(' ')
    new_sentence = []

    words.each do |word|
        if vowels.include?(word[0]) || vowels.include?(word[word.length - 1])
            new_sentence << word
        else
            new_sentence << word.reverse
        end
    end
    new_sentence.join(' ')
end

def hash_missing_keys(hash, *nums)
    arr = []

    nums.each do |num|
        arr << num if !hash.has_key?(num)
    end
    arr
end


