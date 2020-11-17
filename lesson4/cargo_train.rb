class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    @type = 'Cargo'
    super
  end
end