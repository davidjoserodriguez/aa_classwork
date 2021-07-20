class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if passengers.length == @capacity
            return true
        else
            return false
        end
    end

    def board_passenger(passenger_instance)
        if passenger_instance.has_flight?(@flight_number) && !self.full?
            @passengers << passenger_instance
        end
    end

    def list_passengers
        arr = []
        @passengers.each do |passenger|
           arr <<  passenger.name
        end
        arr
    end

    def [](numbers)
        @passengers[numbers]
    end

    def <<(passenger_instance)
        self.board_passenger(passenger_instance)
    end



end