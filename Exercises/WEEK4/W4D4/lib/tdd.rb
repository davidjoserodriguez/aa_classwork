class Array
    def my_uniq
        arr = []
        self.each do |el|
            if !arr.include?(el)
                arr << el
            end
        end
        arr 
    end

    def two_sum
        arr = []
        self.each_with_index do |el, idx|
            (idx + 1...self.length).each do |idx2|
                arr << [idx, idx2] if self[idx] + self[idx2] == 0
            end
        end
        arr
    end
    
    
end