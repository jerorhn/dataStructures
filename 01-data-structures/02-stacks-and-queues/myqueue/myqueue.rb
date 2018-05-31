class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
  end

  def enqueue(element)
    @queue.unshift(element)
    update_ends
  end

  def dequeue
    @queue.pop
    update_ends
  end

  def empty?
    @queue.length === 0
  end

  private
  def update_ends
    @tail = @queue[0]
    @head = @queue[-1]
  end

end
