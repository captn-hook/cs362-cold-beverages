class Vessel
  attr_reader :volume

  def initialize(name = 'Mystey Container', volume = 100, item = nil)
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

  def _recieve(item)
    if @item != nil and item.name != @item.name
      raise "Item is not the same as the item in the vessel"
    elsif item.volume > @volume
      raise "Item is too big for vessel"
    else
      @item = item
      item.volume
    end
  end

  def fill(input = @volume)
    #can recieve am item or a volume
    if input.class == Item
      volume = _recieve(input)      
    else
      volume = input
    end

    if volume >= @volume
      @fullness = @volume
    else
      @fullness += volume
    end

  end

  def empty?
    @fullness == 0
  end

  def item
    @item
  end

end
