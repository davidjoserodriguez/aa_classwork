def average(num1, num2)
    return (num1 + num2) / 2.0
end

def average_array(arr)
    (arr.sum * 1.0) / arr.length 
end

def repeat(str, n)
   str * n
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(string)
    words = string.split.map.with_index do |word, i|
        if i % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end
    words.join(" ")
end