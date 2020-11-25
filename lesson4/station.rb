require_relative 'instance_counter'

class Station
  attr_reader :name
  include InstanceCounter
  STATION_NAME = /[[:upper:]]+[[:lower:]]/
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def all
    @@stations.each.with_index(1) do |station|
      return station
    end
  end

  def add_train(train_name)
    @trains << train_name
  end

  def delete_train(train_name)
    @trains.delete(train_name)
  end

  def list_train_type(type)
    @trains.select do |train|
      train.type == type
    end
  end

  protected

  def validate!
    raise 'Invalid station name' if @name !~ STATION_NAME
  end
end