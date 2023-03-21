class WaterReservoir

  attr_reader :capacity
  attr_accessor :current_water_volume

  def initialize(capacity = 10, initial_water_volume = 0)
    @capacity = capacity
    @current_water_volume = initial_water_volume
  end

  def empty?
    @current_water_volume == 0
  end

  def fill(volume = capacity)
    @current_water_volume = volume
  end

  def drain(volume = capacity)
    if volume > @current_water_volume
      @current_water_volume = 0
    else
      @current_water_volume -= volume
    end
  end
end
