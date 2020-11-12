class CargoTrain < Train
  def add_wagons(wagon)
    if wagon.class == CargoWagon
      @wagons << wagon
    end
  end
end