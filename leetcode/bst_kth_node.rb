require 'byebug'
#        8
#       /  \
#      7    10
#     /
#    2

class BSTNode
    attr_reader :value
    attr_accessor :left, :right

    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end
end

root = BSTNode.new(8)
root.left = BSTNode.new(7)
root.right = BSTNode.new(10)
root.left.left = BSTNode.new(2)


def kth_largest_node(root, k)
    kth = {count:0, node: nil}

    reverse_inorder(root, k, kth)
end

def reverse_inorder(node, k, kth) 
    # Base case
    if node.nil? || k <= kth[:count]
        return kth
    end

    # Follow reverse inorder traversal so the largest element is visited first
    kth = reverse_inorder(node.right, k, kth)
    
    #increment count of visited nodes
    kth[:count] += 1

    # If count equals k, this is the kth largest node
    if k == kth[:count]
        p "#{k}th largest element is: "
        p kth[:node] = node.value
        return kth
    end

    # Recurse for left tree
     reverse_inorder(node.left, k, kth)
end

p kth_largest_node(root, 5)