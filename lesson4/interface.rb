class Interface
  def initialize
    @trains = []
    @routes = []
    @stations = []
  end

  def start
    loop do
      puts "\n0. Create the station"
      puts '1. Create the train'
      puts '2. Create Route'
      puts '3. Control Route'
      puts '4. Add a route for Train'
      puts '5. Add a wagon to Train'
      puts '6. Delete wagon from the Train'
      puts '7. Control Train'
      puts '8. List stations'
      puts '9. List Trains on Stations'
      puts '10. Information on every train'
      puts '11. Filling wagon'
      puts '12. Exit'
      puts 'Select: '

      input = gets.chomp.to_i

      case input
      when 0
        create_station
      when 1
        create_train
      when 2
        create_route
      when 3
        control_route
      when 4
        add_route_to_train
      when 5
        add_wagon_to_train
      when 6
        delete_wagon_from_train
      when 7
        control_train
      when 8
        list_stations
      when 9
        show_station_trains
      when 10
        all_trains
      when 11
        filling_train
      when 12
        break
      else
        puts 'Wrong!'
      end
    end
  end

  private

  def create_station
    puts 'Write the station name: '
    name = gets.chomp
    @stations << Station.new(name)
  end

  def create_train
    puts 'Is this a Cargo? yes/no '
    train_type = gets.chomp
    puts 'Write the number of train: '
    number = gets.chomp
    @trains << if train_type == 'yes'
                 CargoTrain.new(number)
               else
                 PassengerTrain.new(number)
               end
    puts @trains
  end

  def create_route
    @stations.each.with_index(1) do |station, i|
      puts "#{i} - #{station.name}"
    end
    puts 'Enter the first station: '
    first = gets.to_i
    puts 'Enter the last station: '
    last = gets.to_i
    route = Route.new(@stations[first], @stations[last])
    @routes << route
    puts "Route created #{route.stations}"
  end

  def control_route
    puts 'Which route do you want to control: '
    show_routes
    route = @routes[gets.to_i - 1]
    puts "Select route #{route.stations}"
    puts "1. Add station\n2. Delete station"
    str = gets.chomp
    if str == '1'
      puts 'Which station do you want added to Route?'
      route.station_list
      route.add_station(@stations[gets.to_i - 1])
      puts 'Station added'
    elsif str == '2'
      puts 'Which station do you want to delete from Route?'
      route.station_list
      route.delete_station(route.stations[gets.to_i - 1])
      puts 'Station deleted'
    end
  end

  def add_route_to_train
    train = @trains[0]

    puts 'Select route'
    show_routes
    train.set_route(@routes[gets.to_i - 1])
    puts "Route to train #{train.number} successfully specified"
  end

  def add_wagon_to_train
    train = @trains[0]

    puts 'How many wagons do you want to add: '
    num = gets.to_i
    if train.class == PassengerTrain
      puts 'How many seats you want to add: '
      quantity = gets.to_i
      num.times do
        train.add_wagons(PassengerWagon.new(quantity))
      end
    else
      puts 'Which volume you want to add: '
      volume = gets.to_i
      num.times do
        train.add_wagons(CargoWagon.new(volume))
      end
    end
    puts "To train #{train.number} has been added #{num} wagons"
    end

  def all_trains
    @stations.each do |station|
      puts "#{station.name} ......................"
      station.enum_trains do |train|
        puts "Number: #{train.number}\nType: #{train.class}\nWagons: #{train.wagons.length} "
        train.enum_wagons do |wagon, i|
          if wagon.class == CargoWagon
            puts "#{i} - Wagon type: #{wagon.class}\nVolume: #{wagon.total_volume}\nAvailable volume: #{wagon.free_space} "
          elsif wagon.class == PassengerWagon
            puts "#{i} - Wagon type: #{wagon.class}\nSeats: #{wagon.passenger_seat.length}\nAvailable and Occupied seats: #{wagon.seats} "
          end
        end
      end
    end
  end

  def filling_train
    train = select_train
    puts 'Choose wagon: '
    train.wagons.each.with_index(1) { |wagon, i| puts "#{i} - #{wagon.class}" }
    wagon = train.wagons[gets.to_i - 1]
    if wagon.class == CargoWagon
      puts 'Enter quantity: '
      quantity = gets.to_i
      wagon.filling_volume(quantity)
    elsif wagon.class == PassengerWagon
      wagon.take_seat
    end
    puts 'Ready!'
  end

  def delete_wagon_from_train
    train = @trains[0]

    puts 'How many wagons do you want to delete: '
    num = gets.to_i
    num.times do
      train.del_wagons
    end
    puts "From train #{train.number} has been deleted #{num} wagons"
  end

  def control_train
    train = @trains[0]

    puts "Move train #{train.number} To station:\n1. Next\n2. Previous"
    case gets.chomp
    when '1'
      train.move_forward
    when '2'
      train.move_back
    end
    puts "Train on station:  #{train.current_station.name}"
  end

  def list_stations
    @stations.each.with_index(1) do |station, i|
      puts "#{i}. #{station.name}"
    end
  end

  def show_station_trains
    puts 'Select station'
    list_stations
    station = @stations[gets.to_i - 1]
    station.show_all
  end

  def show_routes
    @routes.each.with_index(1) do |route, i|
      puts "#{i}. #{route.stations}"
    end
  end

  def select_train
    puts 'Выберите поезд: '
    trains
    train = @trains[gets.to_i - 1]
  end

  def trains
    @trains.each.with_index(1) { |train, x| puts "#{x}. #{train.number} | количество вагонов в составе:  #{train.wagons.size} | класс #{train.class}" }
  end
  end
