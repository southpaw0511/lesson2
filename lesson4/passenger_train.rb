class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    @type = 'Passenger'
  end

  def add_wagons(wagon)
    if @type == wagon.type
      @wagons << wagon
    end
  end
end