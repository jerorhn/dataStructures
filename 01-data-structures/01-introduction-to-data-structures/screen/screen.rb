require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @totalwidth = width
    @totalheight = height
    self.height = Array.new(height)
    self.width = Array.new(width, @height)
    @width = self.width
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      @width[x][y] = pixel
    else
      return nil
    end
  end

  def at(x, y)
    if inbounds(x, y)
      @width[x][y]
    else
      return nil
    end
  end

  private

  def inbounds(x, y)
    if x <= @totalwidth && y <= @totalheight
      return true
    end
  end

end
