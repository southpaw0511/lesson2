class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    @type = 'Passenger'
    super
  end
end
