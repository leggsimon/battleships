class Boat

  attr_accessor :floating, :sunk, :damage, :direction
  alias_method :floating?, :floating
  alias_method :sunk?, :sunk
  attr_reader :size, :coordinates

  def initialize size = 1, coordinates = [0,0]
    @floating = true
    @size = size
    @sunk = false
    @damage = 0
    @coordinates = coordinates
    @direction = 'horizontal'
  end

  def hit
    self.damage = damage + 1
    check_boat
  end

  def rotate
    self.direction == 'horizontal' ? self.direction = 'vertical' : self.direction = 'horizontal'
  end

  private

  def check_boat
    if check_damage
      floating_boat
      sunk_boat
    end
  end

  def check_damage
    self.damage >= self.size
  end

  def sunk_boat
    self.sunk = true
  end

  def floating_boat
    self.floating = false
  end
end
