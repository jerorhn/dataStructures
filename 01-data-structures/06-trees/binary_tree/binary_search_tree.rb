require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      if root.left.nil?
        root.left = node
      else
        root = root.left
        insert(root, node)
      end
    else
      if root.right.nil?
        root.right = node
      else
        root = root.right
        insert(root, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    stack = []
    stack.push(root)
    while !stack.empty?
      current = stack.pop
      return current if current.title == data
      stack.push(current.right) unless current.right.nil?
      stack.push(current.left) unless current.left.nil?
    end
    nil
  end

  def delete(root, data)
    node = find(root, data)

  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = []
    queue.push(@root)
    while !queue.empty?
      puts "#{queue[0].title}: #{queue[0].rating}\n"
      queue.push(queue[0].left) if !queue[0].left.nil?
      queue.push(queue[0].right) if !queue[0].right.nil?
      queue.shift
    end
  end
end
