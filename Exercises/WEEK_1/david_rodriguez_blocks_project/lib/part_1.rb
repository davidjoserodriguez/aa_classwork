def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(array)
    array.count { |subarray| subarray.sum > 0 }
end

def aba_translate(string)
    vowels = "aeoiouAEIOU"
    new_string = string.split("").map do |char|
        if vowels.include?(char)
            char + "b" + char
        else
            char
        end
    end
    new_string.join("")
end

def aba_array(array)
    array.map { |el| aba_translate(el) }
end