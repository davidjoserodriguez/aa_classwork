class Array

    def my_each(&prc)
        
        i = 0

        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |el|
            new_arr << el if prc.call(el)
        end
        new_arr
    end

    def my_reject(&prc)
        self.select { |el| !prc.call(el) }
    end

    def my_any?(&prc)
        self.any? { |el| prc.call(el)}
    end

    def my_all?(&prc)
        self.all? { |el|  prc.call(el)}
    end

    def my_flatten
        
        flatten = []
        self.my_each do |el|
            if !el.is_a?(Array)
                flatten << el
            else
                flatten += el.my_flatten
            end
        end
        flatten
    end

end
