
class List
	attr_accessor :head_node
	def initialize
		@head_node = nil
	end

	def append(value)
		if head_node
			current_node = head_node
			while current_node.next_node
				current_node = current_node.next_node
			end
			current_node.next_node = Node.new(value)
		else
			self.head_node = Node.new(value)
		end
	end

	def get(index)
		# add "index out of range errors
		if head_node
			current_node = head_node
			index.times {current_node = current_node.next_node}
			current_node.value
		end
	end

	def length
		if head_node
			current_node = head_node
			count = 1
		else
			return 0
		end

		while current_node.next_node
			count += 1
			current_node = current_node.next_node
		end
		count
	end

	def exists?(value)
		current_node = head_node
		if not head_node
			return false
		end

		while current_node.next_node
			if current_node.value == value
				return true
			end
			current_node = current_node.next_node
		end
		return false
	end

	def set(index, value)
		if not head_node
			head_node = Node.new(nil)
		end
		current_node = head_node
		index.times do 
			if current_node.next_node
				current_node = current_node.next_node
			else
				current_node.next_node = Node.new(nil)
				current_node = current_node.next_node
			end

		end
		current_node = Node.new(value)
	end

end

class Node
	attr_accessor :value
	attr_accessor :next_node
	def initialize(value)
		@value = value
	end
end







