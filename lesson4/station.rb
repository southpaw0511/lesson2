require_relative 'instance_counter'
require_relative 'validation'

class Station
  attr_reader :name
  include InstanceCounter
  include Validation
  STATION_NAME = /[[:upper:]]+[[:lower:]]/
  @@stations = []

  validate :name, :presence
  validate :name, :type, String

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def all
    @@stations.each do |station|
      return station
    end
  end

  # Передача поездов в блок
  def train_transfer
    @trains.each do |train|
      yield(train)
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
end
