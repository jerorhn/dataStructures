require 'benchmark'
require_relative 'node.rb'
require_relative 'linked_list.rb'

def generate_code(number)
  charset = Array('A'..'Z') + Array('a'..'z')
  Array.new(number) { charset.sample }.join
end

benchmarklist = LinkedList.new
benchmarkarr = Array.new



puts Benchmark.measure {
  puts "Append to linked list"
  for i in 0..10000
    if i === 5000
      @middle = Node.new(generate_code(50))
      benchmarklist.add_to_tail(@middle)
    else
      benchmarklist.add_to_tail(Node.new(generate_code(50)))
    end
  end
}

puts Benchmark.measure {
  puts "Append to array"
  for i in 0..10000
    benchmarkarr[i] = generate_code(50)
  end
}

puts Benchmark.measure {
  puts "Access element in linked list"
  benchmarklist.choose(@middle)
}

puts Benchmark.measure {
  puts "Access element in array"
  benchmarkarr[5000]
}

puts Benchmark.measure {
  puts "Delete element from linked list"
  benchmarklist.delete(@middle)
}

puts Benchmark.measure {
  puts "Delete element from array"
  benchmarkarr.delete_at(5000)
}
