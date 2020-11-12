class PassengerTrain < Train
  def initialize
    @type = :passenger_train
  end

  def add_wagons(wagon)
    if @type == :passenger_train
      @wagons << wagon
    end
  end
end