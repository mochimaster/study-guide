// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/submissions/

// 235. Lowest Common Ancestor of a Binary Search Tree


/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {TreeNode}
 */

//   ITERATIVE
var lowestCommonAncestor = function(root, p, q) {
    
    while (root){
        if(p.val > root.val && q.val > root.val){
            root = root.right
        } else if (p.val < root.val && q.val < root.val){
            root = root.left
        } else {
            return root
        }
    }
    
    return root
    
    
};

// RECURSION

// var lowestCommonAncestor = function (root, p, q) {

//     if (p.val > root.val && q.val > root.val) {
//         return lowestCommonAncestor(root.right, p, q)
//     } else if (p.val < root.val && q.val < root.val) {
//         return lowestCommonAncestor(root.left, p, q)
//     } else {
//         return root
//     }

// };