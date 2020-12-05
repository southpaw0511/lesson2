class CargoWagon < Wagon
  def initialize(volume)
    @type = 'Cargo'
    @total_volume = volume
    @liquid = 0
  end

  def filling_volume(quantity)
    if @total_volume >= @liquid
      @liquid += quantity
    else
      raise 'Not enough volume'
    end
  end

  def free_space
    puts "Free space = #{@total_volume - @liquid}"
  end
end
