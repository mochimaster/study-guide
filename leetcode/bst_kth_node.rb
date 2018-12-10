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


def find(value, node)
    return nil if node.nil?
    return node if node.value == value

    if value < node.value
        find(value, node.left)
    else
        find(value, node.right)
    end
end

p "Finding: "
p find(2, root)

def depth(node)

    return -1 if node.nil?
    
    left_depth = depth(node.left)
    right_depth = depth(node.right)

    if left_depth > right_depth
        return left_depth + 1
    else
        return right_depth + 1
    end
end

p "depth: "
p depth(root)

def maximum(node)
    
    if node.right
        maximum = maximum(node.right)
    else
        maximum = node
    end
    maximum
end

p "maximum: "
p maximum(root)

def is_balanced?(node)
    return true if node.nil?

    balance = true
    left_depth = depth(node.left)
    right_depth = depth(node.right)
    balance = false if (left_depth - right_depth).abs >= 1

    if balance && is_balanced?(node.left) && is_balanced?(node.right)
        return true
    end
    false
end

p "is_balanced?: "
p is_balanced?(root)

# <left><root><right>
def in_order_traversal(node, arr = [])

    return arr if node.nil?

    if node.left
        in_order_traversal(node.left, arr)
    end

    arr.push(node.value)

    if node.right
        in_order_traversal(node.right, arr)
    end

    arr
end

p "in order traversal: "
p in_order_traversal(root)

def reverse_in_order(node, arr=[])
    return arr if node.nil?

    if node.right
        reverse_in_order(node.right, arr)
    end

    arr.push(node.value)

    if node.left
        reverse_in_order(node.left, arr)
    end

    arr
end

p "reverse in order traversal: "
p reverse_in_order(root)