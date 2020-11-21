require_relative 'instance_counter'

class Route
  attr_reader :stations
  include InstanceCounter

  def initialize(first_s, last_s)
    @stations = [first_s, last_s]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end
