class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = @items.length
  end

  def []=(key, value)
    @items[index(key, @size)] = HashItem.new(key, value)
  end


  def [](key)
    @items[index(key, @size)]
  end

  def resize
    @size = @items.length * 2
    for i in 0..@items.length - 1
      if @items[i] != nil
        @items[index(@items[i].key, @size)] = @items[i].value
      end
    end
    @items[@size - 1] = nil if @items[@size - 1] === nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    index = 0
    key.each_byte do |c|
      index += c
    end
    index % @size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
