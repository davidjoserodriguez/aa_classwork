def hipsterfy(word)
    vowels = "AEIOUaeiou"

    i = word.length - 1
    while i >= 0
        char = word[i]
        if vowels.include?(char)
            return word[0...i] + word[i + 1..-1]
        end
        i -= 1
    end
    word
end

def vowel_counts(string)
    hash = Hash.new(0)
    vowels = "aeiouAEIOU"

    string.each_char do |char|
        hash[char.downcase] += 1 if vowels.include?(char)
    end
    hash
end

def caesar_cipher(message, n)
    alpha = ("a".."z").to_a
    new_message = ""

    message.each_char do |char|
        if alpha.include?(char)
            old_idx = alpha.index(char)
            new_idx = (old_idx + n) % 26
            new_message += alpha[new_idx]
        else
            new_message += char
        end
    end
    new_message
end
