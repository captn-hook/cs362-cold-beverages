class Item
  attr_reader :name, :volume

  def initialize(name = "Mystery Treat", volume = 100, age = 0, spoil = false)
    @name = name
    @volume = volume
    @age = age
    @spoil = spoil
  end

  def eat(volume = @volume)
    if self.edible? == false
      raise "You have food poisoning!"
    end

    if volume >= @volume
      #delete?
      @volume = 0
    else
      @volume -= volume
    end
  end

  def older
    @age += 1
  end

  def edible?
    if @spoil == false or @spoil >= @age
      return true
    else
      return false
    end
  end

  def age
    @age
  end

  def name
    @name
  end

  def volume
    @volume
  end

  def spoil
    @spoil
  end

end
