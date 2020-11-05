require_relative 'station.rb'
require_relative 'route.rb'

class Train
  attr_reader :number, :type, :current_station
  attr_writer :current_station

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    puts "Train number - #{number}; \nType - #{type}; \nNumber of wagons - #{wagons}."
    @current_speed = 0

  end

  def speed_up(number)
    @current_speed += number
  end

  def brake
    @current_speed = 0
    puts "Train slows down, its current speed is = #{@current_speed}"
  end

  def current_speed
    puts "Current speed - #{@current_speed}"
  end

  def add_wagons(number)
    if @current_speed == 0
      @wagons += number
      puts "#{number} wagons have been added"
    end
  end

  def del_wagons(number)
    if @current_speed == 0
      @wagons -= number
      puts "#{number} wagons have been deleted"
    end
  end

  def set_route(route) 
    puts '-------------' 
    puts route.inspect    
    # @route = route           
    # @current_station = @route.stations.first
    # @current_station.add_train(self)
  end

  def next_station
    @route.stations = [@current_station + 1]
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

route = Route.new(almaty, astana)
route.add_station(karaganda)
route.stations
puts '----------------------'
eurostar = Train.new(5, "passenger", 10)
eurostar.speed_up(30)
eurostar.current_speed
eurostar.brake
eurostar.add_wagons(4)
eurostar.set_route(almaty)