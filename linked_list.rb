# The list
class LinkedList
  attr_accessor :head
  def initialize(head = nil)
    @head = head
  end

  def append(val)
    node = Node.new(val)
    if head
      last_node.next = node
    else
      @head = node
    end
  end

  def last_node
    node = head
    loop do
      break if node.next.nil?
      node = node.next
    end
    node
  end

  def print
    node = head
    loop do
      puts node.value
      node = node.next
      break if node.nil?
    end
  end
end

# The node
class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

list = LinkedList.new
list.append(10)
list.append(20)
list.append(30)
list.append(40)
list.print
