class Room
    attr_reader :capacity, :occupants
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        @occupants.count >= @capacity
    end

    def available_space
        @capacity - @occupants.count
    end

    def add_occupant(name)
        return false if full?
        @occupants<<name
        true
    end
end