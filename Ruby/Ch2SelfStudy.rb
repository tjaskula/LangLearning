# 1. Find out how to access files with and without code blocks. What is the benefits of rhe code blocks?

# With code block the file is automatically closed after the block was processed. 
# In the second example, it's your responsibility to manually call newFile.close.

# 2. How would you translate a hash to an array? Can you translate arrays to hashes?

# Hash to Array with to_a method. Array to hash with to_h method.

# 3. Can you iterate through a hash?

# Yes, with each method and its overrides (each_key, each_value, each_pair)

# 4. You can use Ruby arrays as stacks. What other data structures do arrays support?

# Queues, linked list, bag/set, matrix

# Do
# Problem 1
puts 'My solution with each'

a = (1..16).to_a
an = []
a.each do |item|
  an << item
  if item % 4 == 0
    p an[(0..3)]
    an = []
  end
end

puts 'From the book'

sixteen_numbers = [*(1..16)]
sixteen_numbers.each do |number|
        p sixteen_numbers[((number-4)...number)] if number % 4 == 0
end

puts 'My solution with each_slice'

(1..16).each_slice(4) {|item| p item}

# Problem 2
puts 'My solution with Tree and hashes'

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    
    if name.respond_to?('keys') then
      root_node = name.first
      name = root_node[0]
      children = root_node[1]
    end

    if children.respond_to?('keys') then
      children = children.map {|child_name, grandchildren| Tree.new(child_name, grandchildren) }
    end

    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit(&block)
    children.each {|c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} }}})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts "Visiting entier tree"
ruby_tree.visit_all {|node| puts node.node_name}