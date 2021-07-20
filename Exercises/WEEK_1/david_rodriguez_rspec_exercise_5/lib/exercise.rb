def zip(*arrays)
    length = arrays.first.length 

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def prizz_proc(array, prc1, prc2)
    array.select { |el| (prc1.call(el) || prc2.call(el)) && !(prc1.call(el) && prc2.call(el) )}
end

def zany_zip(*arrays)
    length = arrays.map { |array| array.length }.max 

    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def maximum(array, &prc)
    large = array.first

    array.each do |el|
        if prc.call(el) >= prc.call(large)
            large = el
        end
    end
    large
end

def my_group_by(array, &prc)
    hash = Hash.new { |k, v| k[v] = [] }

    array.each do |el|
        hash[prc.call(el)] << el
    end
    hash
end


def max_tie_breaker(array, tie, &prc)
    large = array.first

    array.each do |el|
        if prc.call(el) > prc.call(large)
            large = el
        elsif prc.call(el) == prc.call(large) && tie.call(el) > tie.call(large)
            large = el
        end
    end
    large
end

def silly_syllables(sentence)
    words = sentence.split

    new_sent = words.map do|word|
        if indices(word).length < 2
            word
        else
            new_word(word)
        end
    end
    new_sent.join(" ")
end

def indices(word)
    arr = []
    vowels = "aeiou"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            arr << i 
        end
    end
    arr
end

def new_word(word)
    arr = indices(word)
    word[arr.first..arr.last]
end