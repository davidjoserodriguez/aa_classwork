def all_words_capitalized?(words)
    words.all? { |word| word.capitalize == word }
end

def no_valid_url?(urls)
    invalid_endings = ['.com', '.net', '.io','.org']
    urls.none? do |url|
        invalid_endings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(array)

    array.any? do |hash|
        sum = hash[:grades].sum 
        avg = sum / hash[:grades].length
        avg >= 75
    end
end