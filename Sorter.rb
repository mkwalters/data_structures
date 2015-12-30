

class Sorter

  def bubble_sort!(list)
    swapped = true
    while swapped
      swapped = false
      (list.size - 1).times do |i|
        if list[i] > list[i+ 1]
          list[i], list[i+1] = list[i+1], list[i]
          swapped = true
        end
      end
    end
    list
  end

  def selection_sort!(list)
    list.size.times do |start|
      min = start
      start.upto(list.size - 1) do |i|
        if list[min] > list[i]
          list[min], list[i] = list[i], list[min]
        end
      end
    end
    list
  end
end

mylist = []
5.times do
  mylist.push(rand(100))
end

sorter = Sorter.new

puts mylist
puts"------"
puts sorter.bubble_sort!(mylist)
