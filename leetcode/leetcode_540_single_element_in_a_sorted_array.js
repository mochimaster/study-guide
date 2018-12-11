// https://leetcode.com/problems/single-element-in-a-sorted-array/
// 540. Single Element in a Sorted Array


// /**
//  * @param {number[]} nums
//  * @return {number}
//  */
var singleNonDuplicate = function(nums) {
    let possibleChar=nums[0];
    
    for(let i=0; i<nums.length-1; i++){
        if (nums[i] != nums[i+1]){
            if (nums[i+1] != nums[i+2]){
                return nums[i+1]
            }
        }
    }    
    return possibleChar
};
