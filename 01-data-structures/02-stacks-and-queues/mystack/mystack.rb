class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    update_top
  end

  def pop
    @stack.delete_at(-1)
    update_top
  end

  def empty?
    @stack.length === 0
  end

  private
  def update_top
    temp = @top
    @top = @stack[-1]
    temp
  end
end
