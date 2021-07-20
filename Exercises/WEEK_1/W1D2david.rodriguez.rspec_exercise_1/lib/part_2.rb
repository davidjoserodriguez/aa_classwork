 def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i + 1..-1]
        end
        i -= 1
    end
    word 
 end

 def vowel_counts(string)
    vowels = "aeiou"

    hash = Hash.new(0)

    string.downcase.each_char { |char| hash[char] += 1 if vowels.include?(char)}
    
    hash

 end

 def caesar_cipher(str, n)
    alpha = ("a".."z").to_a
    string = ""

    str.each_char do |char|
        if alpha.include?(char)
            old_idx = alpha.index(char)
            new_idx = (old_idx + n) % 26
            string += alpha[new_idx]
        else
            string += char
        end
    end
    string
end
