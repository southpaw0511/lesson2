require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'interface'
require_relative 'company_name'
require_relative 'instance_counter'
require_relative 'validation'

interface = Interface.new
interface.start
