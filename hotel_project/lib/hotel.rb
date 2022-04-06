require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name,rooms)
        @name = name
        @rooms = {}
        rooms.each{|k,v|@rooms[k]=Room.new(v)}
    end

    def name
        return @name.split.map{|w|w.capitalize}.join(" ")
    end

    def room_exists?(name)
        @rooms[name]!=nil
    end

    def check_in(person,room_name)
        if !room_exists?(room_name)
            puts 'sorry, room does not exist'
            return
        end
        puts @rooms[room_name].add_occupant(person) ? 'check in successful' : 'sorry, room is full'
    end
    
    def has_vacancy?
        rooms.each_value.any?{|v|!v.full?}
    end

    def list_rooms
        @rooms.each do |k,v|
            puts k +' '+ v.available_space.to_s
        end
    end

end
