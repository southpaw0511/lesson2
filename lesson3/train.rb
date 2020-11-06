require_relative 'station.rb'
require_relative 'route.rb'

class Train
  attr_reader :number, :type, :current_station
  attr_writer :current_station

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @current_speed = 0

  end

  def speed_up(number)
    @current_speed += number
  end

  def brake
    @current_speed = 0
  end

  def current_speed
    @current_speed
  end

  def add_wagons(number)
    if @current_speed == 0
      @wagons += number
    end
  end

  def del_wagons(number)
    if @current_speed == 0
      @wagons -= number
    end
  end

  def set_route(route)   
    @route = route
    @current_station_index = 0     
    @current_station = @route.stations[@current_station_index]
    @current_station.add_train(self)
  end

  def move_forward
    @current_station.delete_train(self)
    @current_station = @route.stations[@current_station_index += 1]
    @current_station.add_train(self)
  end

  def move_back
    @current_station = @route.stations[@current_station_index -= 1]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1]
  end
end

almaty = Station.new("Almaty")
astana = Station.new("Astana")
karaganda = Station.new("Karaganda")
almaty.add_train("classic")
almaty.add_train("test")
almaty.push_train("test")
almaty.all_trains

route_one = Route.new(almaty, astana)
route_one.add_station(karaganda)
route_one.stations
eurostar = Train.new(5, "passenger", 10)
eurostar.speed_up(30)
eurostar.current_speed
eurostar.brake
eurostar.add_wagons(4)
eurostar.set_route(route_one)
eurostar.move_forward