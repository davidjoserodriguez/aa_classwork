def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sentence, &prc)
    words = sentence.split
    
    new_sent = words.map { |word| prc.call(word) }

    new_sent.join(" ")
    
end

def greater_proc_value(num, prc1, prc2)
    val_1 = prc1.call(num)
    val_2 = prc2.call(num)

    return val_1 if val_1 > val_2
    return val_2 if val_2 > val_1
end

def and_selector(arr, prc1, prc2)
    arr.select { |el| prc1.call(el) && prc2.call(el) }
end

def alternating_mapper(arr, prc1, prc2)
    arr.each_with_index.map do |el, i|
        if i.even?
            prc1.call(el)
        else
            prc2.call(el)
        end
    end
end