require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'company_name'
require_relative 'instance_counter'
require_relative 'valid'

class Train
  attr_reader :number, :type, :current_station, :wagons
  attr_writer :current_station
  include CompanyName
  include InstanceCounter
  include Valid
  TRAIN_NUMBER_FORMAT = /^[0-9]{3}\-?[0-9]{2}$/
  @@trains = {}

  def initialize(number)
    @number = number
    @wagons = []
    @current_speed = 0
    validate!
    @@trains[number] = self
  end

  def find(number)
    @@trains[number]
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

  def add_wagons(wagon)
    if @type == wagon.type
      @wagons << wagon
    end
  end

  # Передача вагонов в блок
  def wagons_transfer(&block)
    @wagons.each.with_index(1) do |wagon, i|
      yield(wagon, i)
    end
  end

  def del_wagons
    @wagons.delete_at(0) if @current_speed == 0
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

  protected

  def validate!
    raise "#{@number}" if @number !~ TRAIN_NUMBER_FORMAT
  end
end