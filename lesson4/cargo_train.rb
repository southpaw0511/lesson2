class CargoTrain < Train
  attr_reader :type
  
  def initialize(number)
    @number = :number
    @type = :cargo
  end

  def add_wagons(wagon)
    if @type == CargoWagon.type
      @wagons << wagon
    end
  end
end