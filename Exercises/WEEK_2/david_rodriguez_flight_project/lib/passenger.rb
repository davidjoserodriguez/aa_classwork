class Passenger

    attr_reader :name

    def initialize(name)
        @flight_numbers = []
        @name = name
    end

    def has_flight?(flight_number)
        if @flight_numbers.include?(flight_number.upcase)
            return true
        else
            return false
        end
    end

    def add_flight(flight_number)
        if !has_flight?(flight_number.upcase)
            @flight_numbers << flight_number.upcase
        end
    end
end