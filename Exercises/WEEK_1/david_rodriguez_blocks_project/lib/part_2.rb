def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    endings = '.com', '.net', '.io', '.org'
    urls.none? do |url|
        endings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(students)
    students.any? do |student|
        grades = student[:grades].sum
        avg = grades / student[:grades].length
        avg >= 75
    end
end