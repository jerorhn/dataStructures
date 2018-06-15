require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = @items.length
  end

  def []=(key, value)
    idx = index(key, @size)
    if next_open_index(idx) === -1
      resize
    end
    @items[next_open_index(idx)] = Node.new(key, value)
  end

  def [](key)
    idx = index(key, @size)
    while key != @items[idx].key
      idx = idx + 1
    end
    @items[idx].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    hash_code = 0
    key.each_byte do |c|
      hash_code += c
    end
    hash_code % @size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    next_open = -1
    @items.each_with_index do |item, idx|
      if item.nil?
        return next_open = idx if idx >= index
      end
    end
    next_open
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    @size = @size * 2
    @temp = @items
    @items = Array.new(@size)
    @temp.each do |item|
      next unless item
      idx = index(item.key, @size)
      @items[idx] = item
    end
  end
end
