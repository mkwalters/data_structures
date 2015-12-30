
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
			self.head_node = Node.new(nil)
		end
		current_node = self.head_node
		(index).times do 
			if current_node.next_node
				current_node = current_node.next_node
			else
				current_node.next_node = Node.new(nil)
				current_node = current_node.next_node
			end
		end
		current_node.value = value
	end

	def swap(i,j)
		#go get the ith value
		current_node = head_node

		i.times do 
			current_node = current_node.next_node
		end
		i_value = current_node.value

		#go get the jth value
		current_node = head_node

		j.times do 
			current_node = current_node.next_node
		end
		j_value = current_node.value
		#swap em
		set(i, j_value)
		set(j, i_value)

	end

	def bubble_sort!
		swapped = true
		while swapped
			swapped = false
			current_node = head_node
			(length - 1).times do |i|
				if current_node.value > current_node.next_node.value
					swap(i, i+1)
					swapped = true
				end
				current_node = current_node.next_node
			end
		end
	end


	def empty? # this might have some weird edge cases
		#if get calls get it will put in nil nodes that should iterate length
		if length == 0
			true
		else
			false
		end

	end


end


class Node
	attr_accessor :value
	attr_accessor :next_node
	def initialize(value)
		@value = value
	end
end


mylist = List.new



10.times do 
	mylist.append(rand(100))
end


mylist.bubble_sort!


10.times {|i| puts mylist.get(i)}



# mylist.swap(0,2)
# puts "-------"

# puts mylist.get(0)
# puts mylist.get(1)
# puts mylist.get(2)





