# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        sum = (self.sum) * 1.00
        avg = sum / self.length 
    end

    def median
        return nil if self.empty?

        mid = self.length / 2
        sorted = self.sort 

        if self.length.odd?
            return sorted[mid]
        else
            return (sorted[mid - 1] + sorted[mid]) / 2.0
        end
    end

    def counts
        hash = Hash.new(0)

        self.each do |el|
            hash[el] += 1
        end
        hash
    end

    def my_count(n)
        count = 0
        self.each { |el| count += 1 if el == n }
        count 
    end

    def my_index(n)
        self.each_with_index { |el, i| return i if el == n}
        nil 
    end

    def my_uniq
        arr = []
        self.each { |el| arr << el if !arr.include?(el) }
        arr
    end

    def my_transpose
        transposed = []

        (0...self.length).each do |row|
            new_row = []
            (0...self.length).each do |col|
                new_row << self[col][row]
            end
            transposed << new_row 
        end
        transposed
    end
end

