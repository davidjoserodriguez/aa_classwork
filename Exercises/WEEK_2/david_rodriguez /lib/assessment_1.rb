def my_map!(array, &prc)
    
    array.each_with_index do |el, i|
        array[i] = prc.call(el)
    end
    array
end

def two?(array, &prc)
    count = 0

    array.each do |el|
        count += 1 if prc.call(el)
    end
    count == 2
end

def nor_select(array, prc1, prc2)
    array.select { |el| !prc1.call(el) && !prc2.call(el) }
end

def array_of_hash_sum(hashes)
    sum = 0
    hashes.each do |hash|
        hash.each { |k, v| sum += hash[k] }
    end
    sum
end

def slangify(sentence)
    words = sentence.split

    new_sent = words.map do |word|
        new_word(word)
    end
    new_sent.join(" ")
end

def new_word(word)
    vowels = "aeiouAEIOU"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[0...i] + word[i + 1..-1]
        end
    end
    word
end

def char_counter(string, *args)
    hash = Hash.new(0)

    if args.empty?
        string.each_char do |char|
            hash[char] += 1
        end
    end

    if !args.empty?
        string.each_char do |char|
            if args.include?(char)
                hash[char] += 1
            end
        end
    end

    args.each do |arg|
        if !string.include?(arg)
            hash[arg] = 0
        end
    end
    hash
end
      
