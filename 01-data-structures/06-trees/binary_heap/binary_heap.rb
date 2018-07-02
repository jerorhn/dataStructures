require_relative 'node'

class BinaryHeap
  attr_accessor :heap

  def initialize(root)
    @heap = [root]
    @heap_map = Hash.new
    @heap_map[root.title] = 0
  end

  def insert(root, node)
    @heap.push(node)
    @heap_map[node.title] = @heap.size - 1
    shift_up(@heap.size - 1)
  end

  def find(root, data)
    return nil if data.nil?
    index = @heap_map[data]
    return nil if index.nil?
    return @heap[index]
  end

  def delete(root, data)
    return nil if data.nil?
    index = find_index(root, data)
    return if index.nil?
    exchange(index, @heap.size - 1)
    data_to_delete = @heap.pop
    @heap_map.delete(data_to_delete.title)
    shift_down(index)
    return data_to_delete
  end

  def print
    @heap.each_with_index do |item, idx|
      puts "#{item.title}: #{item.rating}"
    end
  end

  private

  def shift_up(index)
    parent_index = index - 1
    return if index <= 0
    return if @heap[index].rating > @heap[parent_index].rating
    exchange(index, parent_index)
    shift_up(parent_index)
  end

  def shift_down(index)
    child_index = [index * 2, 1].max
    return if child_index > @heap.size - 1
    is_last_item = child_index == @heap.size - 1
    left_item = @heap[child_index].rating
    right_item = is_last_item ? nil : @heap[child_index + 1].rating
    child_index += 1 if !is_last_item && right_item < left_item
    return if @heap[index].rating <= @heap[child_index].rating
    exchange(index, child_index)
    shift_down(child_index)
  end

  def exchange(source, target)
    temp_source = @heap[source]
    temp_target = @heap[target]
    source_map = @heap_map[temp_source.title]
    target_map = @heap_map[temp_target.title]

    @heap[source] = temp_target
    @heap[target] = temp_source
    @heap_map[temp_source.title] = target_map
    @heap_map[temp_target.title] = source_map
  end

  def find_index(root, data)
    index = @heap_map[data]
    return index
  end
end
