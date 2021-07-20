def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(numbers)
    sum = numbers.sum * 1.0
    length = numbers.length

    sum / length 
end

def repeat(string, n)
    string * n
end

def yell(string)
    string.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split
    new_words = words.each_with_index.map do |el, i|
        if i.even?
            el.upcase
        else
            el.downcase
        end
    end
    new_words.join(" ")
end
