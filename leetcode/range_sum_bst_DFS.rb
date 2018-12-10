# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {Integer}
def range_sum_bst(root, l, r)
    sum = 0
    stack = [root]
    
    while stack.length>=1
       el = stack.pop()
        
        if el.val.between?(l,r)
            sum += el.val
        end
        
        if el.val > l
            if el.left
                stack << el.left
            end
        end
        
        if el.val < r
            if el.right
                stack << el.right 
            end
        end
    end
    sum
end