class Route
  attr_reader :stations

  def initialize(first_s, last_s)
    @stations = [first_s, last_s]
  end

  # def stations
  #   @stations.each do |station|
  #     puts "Station - #{station}"
      
  #   end
  #   puts @stations
  # end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end
