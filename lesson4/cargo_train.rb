class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    @type = 'Cargo'
    super
  end

  def add_wagons(wagon)
    if @type == wagon.type
      @wagons << wagon
    end
  end
end