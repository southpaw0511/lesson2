class CargoTrain < Train
  
  def initialize
    @type = :cargo
  end

  def add_wagons(wagon)
    if @type == CargoWagon.type
      @wagons << wagon
    end
  end
end