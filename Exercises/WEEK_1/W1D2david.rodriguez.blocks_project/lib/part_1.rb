def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count { |subArr| subArr.sum > 0}
end

def aba_translate(string)
    vowels = "aeiou"
    new_string = ""

    string.each_char do |char|
        if vowels.include?(char)
            new_string += char + "b" + char
        else
            new_string += char
        end
    end
    new_string

end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end