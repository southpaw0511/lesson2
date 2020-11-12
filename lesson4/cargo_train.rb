class CargoTrain < Train
  
  def initialize
    @type = :cargo_train
  end

  def add_wagons(wagon)
    if @type == :cargo_train
      @wagons << wagon
    end
  end
end