class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
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

