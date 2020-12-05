class PassengerWagon < Wagon
  attr_reader :passenger_seat

  def initialize(places)
    @type = 'Passenger'
    @passenger_seat = Array.new(places, 0)
  end

  def take_seat
    if @passenger_seat.include?(0)
      @passenger_seat[0] = 1
      @passenger_seat.sort
    else
      raise 'There are no available seats'
    end
  end

  def seats
    puts "Occupied seats - #{@passenger_seat.count(1)}"
    puts "Available seats - #{@passenger_seat.count(0)}"
  end
end
