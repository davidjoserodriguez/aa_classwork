class Item

    def self.valid_date?(date_string)

        arr = date_string.split("-")

        year = arr[0]
        month = arr[1].to_i
        day = arr[2].to_i

        if year.length != 4
            return false
        elsif month > 12
            return false
        elsif day > 31
            return false
        end
        return true
    end
    attr_reader :title, :description, :deadline

    def initialize(title, deadline, description)
        if !Item.valid_date?(deadline)
            raise "This Is An Invalid Date"
        end
        
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_date)
        if Item.valid_date?(deadline)
            @deadline = new_date
        else
            raise "This Is An Invalid Date"
        end
    end


end

