require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head === nil
      @head = node
    else
      current = @head
      while current.next
        current = current.next
      end
      current.next = node
    end
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    return if @tail === nil
    current = @head
    previous = nil
    while current.next
      previous = current
      current = current.next
    end
    previous.next = nil if previous
    @tail = previous
  end

  # This method prints out a representation of the list.
  def print
    current = @head
    while current
      puts current.data
      current = current.next
    end
  end

  def choose(key)
    current = @head
    while current.key != key
      current = current.next
    end
      return current
  end

  def length
    @temp_total = 0
    current = @head
    while current
      current = current.next
      @temp_total = @temp_total + 1
    end
    @temp_total
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head.data == node.data
      @head = @head.next
      return
    end

    current = @head
    previous = nil

    while current.next
      break if current.data == node.data
      previous = current
      current = current.next
    end
    previous.next = current.next
    @tail = previous if current.next === nil
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end
end
