def duos(string)
    count = 0
    (0...string.length - 1).each do |i|
        count += 1 if string[i] == string[i + 1]
    end
    count 
end

#p duos('bootcamp')      # 1
#p duos('wxxyzz')        # 2
#p duos('hoooraay')      # 3
#p duos('dinosaurs')     # 0
#p duos('e')             # 0

def sentence_swap(sentence, hash)
    words = sentence.split
    new_sent = words.map do |word|
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end
    new_sent.join(" ")
end
#p sentence_swap('anything you can do I can do',
    #'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
 # 'nothing you shall drink I shall drink'

#p sentence_swap('what a sad ad',
    #'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
 # 'make a happy ad'

#p sentence_swap('keep coding okay',
    #'coding'=>'running', 'kay'=>'pen'
 # 'keep running okay'

def hash_mapped(hash, prc, &block)
   new_hash = {}
    hash.each do |k, v|
        new_hash[block.call[k]] = prc.call(v)
    end 
    new_hash
end

def counted_characters(string)
    hash = Hash.new(0)
    arr = []
    string.each_char { |char| hash[char] += 1 }

    hash.each do |k, v|
        arr << k if v > 2
    end
    arr
end

#p counted_characters("that's alright folks") # ["t"]
#p counted_characters("mississippi") # ["i", "s"]
#p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
#p counted_characters("runtime") # []

def triplet_true(string)
    (0...string.length - 2).each do |i|
        return true if string[i] == string[i + 1] && string[i + 1] == string[i + 2]
    end
    false
end

#p triplet_true('caaabb')        # true
#p triplet_true('terrrrrible')   # true
#p triplet_true('runninggg')     # true
#p triplet_true('bootcamp')      # false
#p triplet_true('e')             # false

def energetic_encoding(sentence, hash)
    chars = sentence.split("")
    new_sent = chars. map do |char|
        if hash.has_key?(char)
            hash[char]
        elsif char == " "
            " "
        else
            "?"
        end
    end    
    new_sent.join("")
end

#p energetic_encoding('sent sea',
    #'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
#) # 'zimp ziu'

#p energetic_encoding('cat',
    #'a'=>'o', 'c'=>'k'
#) # 'ko?'

#p energetic_encoding('hello world',
    #'o'=>'i', 'l'=>'r', 'e'=>'a'
#) # '?arri ?i?r?'

#p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    new_string = ""

    i = 0
    while i < string.length - 1
        char = string[i]
        n = string[i + 1].to_i
        n.times { new_string += char }
        i += 2
    end
    new_string
end
#p uncompress('a2b4c1') # 'aabbbbc'
#p uncompress('b1o2t1') # 'boot'
#p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(array, *prcs)
    array.select { |el| prcs.all? { |prc| prc.call(el)} }
end


is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]