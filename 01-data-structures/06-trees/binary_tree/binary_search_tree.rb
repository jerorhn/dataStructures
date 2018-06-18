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

    # run find method but stop where current.left or current.right is the node to delete
    stack = []
    stack.push(root)
    leftchild = nil
    rightchild = nil
    while !stack.empty?
      current = stack.pop
      leftchild = current if current.left.title == data
      rightchild = current if current.right.title == data
      stack.push(current.right) unless current.right.nil?
      stack.push(current.left) unless current.left.nil?
    end
    # save the node.left of the node to be deleted to be the new node
    if leftchild != nil
      leftchild.left = node.left
    elsif rightchild != nil
      rightchild.right = node.right
    else
      return nil
    end
    # set the return from the altered find method's child to be the saved node
    # put all of the nodes after the node to be deleted in an array

    # reinsert each element of the array with the root equal to the saved node

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
