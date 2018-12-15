// https://leetcode.com/problems/partition-array-into-disjoint-intervals/

/**
 * @param {number[]} A
 * @return {number}
 */
var partitionDisjoint = function(A) {
//     create 1 pointer. Have left and right partition
//     Increase pointer idx by 1 as long as max of left pointer is < min of right pointer
    
    
    let i =1
    let left = A.slice(0,i);
    let right = A.slice(i);
    
    while (i < A.length-1){
        left = A.slice(0,i)
        right = A.slice(i)  
        if (Math.max(...left) > Math.min(...right) ){
            i += 1;
        }else {
            break;
        }

        
    }
    return i;
};

let include = function(arr1, arr2){
    for(let i=0; i<arr1.length; i++){
        if (arr2.includes(arr1[i])){
            return true
        }
    }
    return false
}