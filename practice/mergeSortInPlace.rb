# Given two sorted arrays of size m & n, merge the elements of the first array with the second array by maintaining the sorted order. i.e. fill the first array with with the first m smallest elements and fill the second array with the remaining n elements.

# 1 pointer in Array 1
# 1 pointer in Array 2
# compare largest value from arr 1 and arr 2. 
# If pointer at arr1 is larger than pointer at arr2, put pointer at arr1 (larger element) at last element of arr1
# else put Element from Array 2 into last element in arr1

# Array 1 = [1, 3, 5, 7, _, _, _]
#                     ^p1      ^k
# Array 2 = [2, 6, 8]
#                  ^p2
# Time complexity = O(mn)
# Space complexity = O(1)


def mergeInPlace(arr1, arr2)
    pointer1 = arr1.take_while {|num| num != nil}.length - 1
    pointer2 = arr2.length - 1
    k = arr1.length - 1

    while pointer2 >= 0
        if arr1[pointer1] > arr2[pointer2]
            arr1[k] = arr1[pointer1]
            pointer1 -= 1
        else
            arr1[k] = arr2[pointer2]
            pointer2 -= 1
        end
        k -= 1
    end
    arr1

end
    
p mergeInPlace([1,3,5,7,nil, nil, nil], [2, 6, 8])
    
    
    
    
    
    
    
