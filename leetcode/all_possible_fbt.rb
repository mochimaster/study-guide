# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {Integer} n
# @return {TreeNode[]}
def all_possible_fbt(n)
    return nil if ( n == 0 || n%2 == 0)
    
    node = TreeNode.new(0)
    result = [node]
    p "result: #{result}"
    n = n-1
    
    while n > 0
        node = result.last
        node.left = TreeNode.new(0)
        result << node.left
        node.right = TreeNode.new(0)
        result << node.right
        n -= 2
    end
    result
end

p all_possible_fbt(7)