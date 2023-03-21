class Vessel
  attr_reader :volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @fullness = 0
  end

  def name
    @name
  end

  def volume
    @volume
  end

  def fill(volume = @volume)
    if volume >= @volume
      @fullness = @volume
    else
      @fullness += volume
    end

  end

  def empty?
    @fullness == 0
  end

end
