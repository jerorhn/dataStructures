require_relative 'linked_list'
require 'prime'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @size = size
    @max_load_factor = 0.7
  end

  def []=(key, value)
    idx = index(key, @size)

    if @items[idx].nil?
      @items[idx] = LinkedList.new
    end
    @items[idx].add_to_tail(Node.new(key, value))

    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    idx = index(key, @size)
    if @items[idx].is_a? Node
      return @items[idx].value
    else
      @items[idx].choose(key).value
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

  # Calculate the current load factor
  def load_factor
    total = 0.0
    @items.each do |item|
      if item.is_a? Node
        total = total + 1
      elsif item.is_a? LinkedList
        total = total + item.length
      end
    end
    total.to_f / @size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size = @size * 2
    temp = @items
    @items = Array.new(@size)
    temp.each do |item|
      next unless item
      current = item.head
      idx = index(current.key, @size)
      @items[idx] = item
    end
  end
end
