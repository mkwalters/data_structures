

class Node
  attr_accessor :value, :right, :left
  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end
end


class Tree
  attr_accessor :root
  def initialize(root)
    @root = Node.new(root)
  end

  def append(value)
    current_node = root
    appended = false
    while ! appended
      if value > current_node.value
        if current_node.right
          current_node = current_node.right
        else
          current_node.right = Node.new(value)
          appended = true
        end
      else
        if current_node.left
          current_node = current_node.left
        else
          current_node.left = Node.new(value)
          appended = true
        end
      end
    end

  end

  def search(value) #return true if tree contains value and false if it does not
    current_node = root
    while true
      if current_node.value == value
        return true
      end

      if value > current_node.value #goin right
        if current_node.right
          current_node = current_node.right
        else
          return false
        end
      end

      if value < current_node.value #goin left
        if current_node.left
          current_node = current_node.left
        else
          return false
        end
      end

    end
  end

end


tree = Tree.new(50)

tree.append(69)
tree.append(75)
tree.append(40)
tree.append(30)

# puts tree.root.right.right.value

# puts tree.root.left.value
# puts tree.root.left.left.value

puts tree.search(75)
puts tree.search(100)




