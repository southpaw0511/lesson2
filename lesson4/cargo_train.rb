class CargoTrain < Train
  def add_wagons(wagon)
    if wagon.class == CargoWagon
      @wagons << wagon
    else
      puts 'Wrong wagon'
    end
  end
end