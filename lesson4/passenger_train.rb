class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    @number = :number
    @type = :passenger
  end

  def add_wagons(wagon)
    if @type == PassengerWagon.type
      @wagons << wagon
    end
  end
end