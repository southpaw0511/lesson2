class PassengerTrain < Train
  def add_wagons(wagon)
    if wagon.class == PassengerWagon
      @wagons << wagon
    end
  end
end