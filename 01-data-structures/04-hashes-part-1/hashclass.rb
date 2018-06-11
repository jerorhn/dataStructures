class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = @items.length
  end

  def []=(key, value)
    idx = index(key, @size)
    if !@items[idx].nil?
      if @items[idx].key != key
        resize
        return self[key] = value
      elsif @items[idx].value != value
        resize
      end
    end
    @items[idx] = HashItem.new(key, value)
  end

  def [](key)
    idx = index(key, @size)
    @items[idx].value
  end

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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # def print_all
  #   @items.each_with_index do |item, idx|
  #     next unless item
  #     puts "Key: " + item.key + " Value: " + item.value + " At: " + idx.to_s
  #   end
  #   puts "______________________________"
  # end

end
