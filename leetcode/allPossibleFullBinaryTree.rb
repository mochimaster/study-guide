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
    return [] if ( n%2 == 0)
    return TreeNode.new(0) if n == 1
    
    # node = TreeNode.new(0)
    # result = [node]
    # p "result: #{result}"
    # n = n-1
    
    
    i=0
    while i < n
        leftTrees = all_possible_fbt(i)
        rightTrees = all_possible_fbt(n-i)
        
        leftTrees.each do |left|
            rightTrees.each do |right|
                node = TreeNode.new(0)
                node.left = left
                node.right = right
                result.push(node)
            end
        end
        i += 2
    end
    result
    
end

