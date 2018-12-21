// https://leetcode.com/problems/backspace-string-compare/
// 844. Backspace String Compare


/**
 * @param {string} S
 * @param {string} T
 * @return {boolean}
 */
var backspaceCompare = function(S, T) {
  
    let result1 = cleanUp(S);
    let result2 = cleanUp(T);
        
    if (result1 === result2){
        return true
    } else {
        return false
    }
    
};

var cleanUp = function(str){
    let result = "";
   for(let i=0; i<str.length; i++){
        if(str[i] != "#"){
            result += str[i]
        } else {
            result = result.slice(0,-1)
        }
    } 
    return result;
}