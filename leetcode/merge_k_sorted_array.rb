require 'byebug'

class DoublyLinkedList
    attr_reader :value
    attr_accessor :next, :prev
    def initialize(value)
        @value = value
        @next = nil
        @prev = nil
    end
end

# [1, 3, 7, 10]
# [2 , 5, 9, 20]
# [4, 30]

# Introduce a dummyNode
# Introduce a priority queue
# Create a pointer for each 
class PriorityQueue
    attr_accessor :queue, :length
    def initialize
        @queue = []
        # @length = @queue.length
    end

    def insert(new_node)

        if @queue.length == 0
            @queue << new_node
        else
            @queue.each_with_index do |node,idx|
                if new_node.value < node.value
                    @queue.insert(idx, new_node)
                elsif idx == @queue.length-1 && new_node.value > @queue[-1].value
                    @queue << new_node
                end
            end
        end
    end

end

def mergeLinkedList(arrays)


    pq = PriorityQueue.new

    head = DoublyLinkedList.new(0)

    arrays.each do |linked_list|
        pq.insert(linked_list)
    end

    current_node = head
    while pq.queue.length > 0
        debugger
        current_min = pq.queue.shift
        current_node.next = current_min
        
        if current_min.next
            pq.insert(current_min.next)
            p "current pq: "
            pq.queue.map {|node| p node.value}
        end

        current_node = current_min
    end

    head
end
# [1, 3, 7, 10]
one = DoublyLinkedList.new(1)
three = DoublyLinkedList.new(3)
seven = DoublyLinkedList.new(7)
ten = DoublyLinkedList.new(10)

one.next = three
three.next = seven
seven.next = ten

# [2 , 5, 9, 20]
two = DoublyLinkedList.new(2)
five = DoublyLinkedList.new(5)
nine = DoublyLinkedList.new(9)
twenty = DoublyLinkedList.new(20)

two.next = five
five.next = nine
nine.next = twenty

# [4, 30]
four = DoublyLinkedList.new(4)
thirty = DoublyLinkedList.new(30)

four.next = thirty

result = mergeLinkedList([one, two, four])
p "result: "

while result.next
    p result.value
    result = result.next
end


