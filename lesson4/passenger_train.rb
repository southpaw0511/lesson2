class PassengerTrain < Train
  def initialize
    @type = :passenger
  end

  def add_wagons(wagon)
    if @type == PassengerWagon.type
      @wagons << wagon
    end
  end
end