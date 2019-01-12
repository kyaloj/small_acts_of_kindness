require 'benchmark'
module BinaryTree
  class Node
    attr_reader :value
    attr_accessor :left, :right

    def self.from_array(arr)
      mid_val = arr.delete_at(arr.length / 2)
      tree = Node.new(mid_val)
      tree.insert(arr.pop) while arr.length > 1
      tree
    end

    def initialize(value)
      @value = value
    end

    def insert(val)
      insert_left(val) && return if val < value
      insert_right(val) if val > value
    end

    def include?(val)
      return true if val == value
      if val < value
        left&.include?(val) || false
      else
        right&.include?(val) || false
      end
    end

    def print
      right&.print
      p value
      left&.print
    end

    private

    def insert_left(val)
      left ? left.insert(val) : self.left = Node.new(val)
    end

    def insert_right(val)
      right ? right.insert(val) : self.right = Node.new(val)
    end
  end
end

arr = (1..5_000).to_a.shuffle
tree = BinaryTree::Node.from_array arr

# p tree.print

Benchmark.bm do |benchmark|
  benchmark.report("test_array include"){ (1..5_000).each {|n| arr.include? n } }
  benchmark.report("binary tree search"){ (1..5_000).each {|n| tree.include? n } }
end
# array_time = Benchmark.realtime do
#   p arr.include?(30)
# end
# puts "Array Search Time: #{array_time}"




