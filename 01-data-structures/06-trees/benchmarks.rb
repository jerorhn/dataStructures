require 'benchmark'
require_relative 'binary_heap/node.rb'
require_relative 'binary_tree/node.rb'
require_relative 'binary_heap/binary_heap.rb'
require_relative 'binary_tree/binary_search_tree.rb'

root = Node.new(1, 1)
heap = BinaryHeap.new(root)
tree = BinarySearchTree.new(root)



puts Benchmark.measure {
  puts "Append to heap"
  for i in 2..10000
    heap.insert(root, Node.new(i, i))
  end
}

puts Benchmark.measure {
  puts "Append to tree"
  for i in 2..10000
    tree.insert(root, Node.new(i, i))
  end
}

puts Benchmark.measure {
  puts "Access element in heap"
  heap.find(root, 5000)
}

puts Benchmark.measure {
  puts "Access element in tree"
  tree.find(root, 5000)
}

puts Benchmark.measure {
  puts "Delete element from heap"
  heap.delete(root, 7501)
}

puts Benchmark.measure {
  puts "Delete element from tree"
  tree.delete(root, 7501)
}
