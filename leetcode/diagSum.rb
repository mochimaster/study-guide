# Input:
# 1 2 3 4
# 4 5 6 5
# 7 8 9 6

# input
# [ [1, 2, 3, 4],
#   [4, 5, 6, 7],
#   [7, 8, 9, 6]]


# 3rd D = 3 + 5 + 7 = 15 / 3 = 5


# Output:
# 1 3 5 6
# 3 5 6 7    
# 5 6 7 6


# Your last C/C++ code is saved below:
# #include <iostream>
# using namespace std;

# int main() {
# 	cout<<"Hello";
# 	return 0;
# }

# I'll try Ruby

# Step 1, we will iterate through the 2D array
# For each element in the array, call helper method to calculate Average
# In helper method, have conditional checks for valid diagonal inputs
# get all valid diagonal numbers and calculate average. 
# Helper method should return Integer
# With returned result from helper method, we will push into result array 
# into the same i, j location of the matrix.

def getDiagonalAve(arr)

  result = []
  arr.each_with_index do |subArr1, i|  
    result << [] # [[]]
    subArr1.each_with_index do |_, j| 

      # check if diagonal right element exist. If it does,
      # that means the element has previously been calculated.
      # we simply retrieve this number and input into result array.
      if (i-1 >= 0 && j+1 < arr[0].length && arr[i-1][j+1])
          el = result[i-1][j+1]
          result[i].push(el)
      
      # if top diagonal right number does not exist, we call
      # helper method to calculate new ave
      else
          ave = diagAve(arr, i, j)  
          result[i].push(ave)
      end
    end
  end
  result
end

# 1 2 3 4
# 4 5 6 5
# 7 8 9 6

# i cannot be less than 0
# j cannot be less than 0
# el= 1 if i = 0, j=0 , valid diags: [[-1,1], [1, -1]]

# el= 2 if i =0, j= 1, valid diags: [[-1, 2], [1, 0]]

# el = 3 if i=0, j=2, valid diags: [[-1,3], [1, 1], [2, 0]]


def diagAve(arr, i, j) # (arr= input, i=0 , j = 0)
  
  nums = [arr[i][j]]

  # we iterate through matrix as long as we are inbound
  while (i+1 > 0 && j-1 >= 0)

    if (i+1 < arr.length && j-1 < arr[0].length)
      i+=1
      j-=1
      nums.push(arr[i][j])
    else
      break
    end
  end

  length = nums.length
  (nums.reduce(:+))/length
end

input = [ [1, 2, 3, 4],
  [4, 5, 6, 7],
  [7, 8, 9, 6]]

p getDiagonalAve(input)

# Input
# [ [1, 2, 3, 4],
#   [4, 5, 6, 7],
#   [7, 8, 9, 6]]

# Output:
# 1 3 5 6
# 3 5 6 7    
# 5 6 7 6

# Please note that the Expected Output is not corret.
# Looking at i = 1, and j= 3, the input number and it's diagonal
# are 7 & 9. The result is (7+9)/2 = 8

# Corret output:
# Output:
# 1 3 5 6
# 3 5 6 8    
# 5 6 8 6

# Time complexity
# We iterate through every array(m) and every element(n). O(mn)
# For each element, we will access the matrix to find the diagonal
# number. Access the matrix with index is O(1) time
# The mathematical additional and division is also constant time.
# So the final time complexity is O(mn)

# Space complexity
# We are introducing a new result array in the same size as
# the original input array. So the space complexity is 2 O(mn)
# which is further simplified to O(mn)
