def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sentence, &prc)
    words = sentence.split
    new_words = words.map do |word|
        prc.call(word)
    end
    new_words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    result1 = prc1.call(num)
    result2 = prc2.call(num)

    if result1 > result2
        result1
    else
        result2
    end
end

def and_selector(array, prc1, prc2)
    array.select { |el| prc1.call(el) && prc2.call(el) }
end

def alternating_mapper(array, prc1, prc2)
    array.each_with_index.map do |el, i|
        if i.even?
            prc1.call(el)
        else
            prc2.call(el)
        end
    end
end