class PassengerTrain < Train
  def add_wagons(wagon)
    if wagon.class == PassengerWagon
      @wagons << wagon
    else
      puts 'Wrong wagon'
    end
  end
end