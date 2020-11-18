require_relative 'instance_counter'

class Station
  attr_reader :name
  include InstanceCounter
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def self.all
    @@stations.each.with_index(1) do |station, i|
      puts "#{i} - #{station.name}"
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

  def show_all
    @trains.each do |train|
      puts train
    end
  end
end