class Vessel
  attr_reader :volume

  def initialize(name, volume, item = nil)
    @name = name
    @volume = volume
    
    if item == nil
      @fullness = 0
    elsif item.volume > volume
      raise "Item is too big for vessel"
    else
      @fullness = item.volume
      @item = item
    end
  end

  def name
    @name
  end

  def volume
    @volume
  end

  def fill(volume = @volume)
    #can recieve am item or a volume
    if volume.class == Item
      if @item != nil and volume.name != @item.name
        raise "Item is not the same as the item in the vessel"
      elsif volume.volume > @volume
        raise "Item is too big for vessel"
      else
        @item = volume
        volume = volume.volume

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
