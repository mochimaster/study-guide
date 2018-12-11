require 'byebug'

def binary_search(arr, target)
    return nil if arr.length == 0

    mid = arr.length/2
    left = arr.take(mid)
    right = arr.drop(mid+1)

    return mid if arr[mid] == target

    if target < arr[mid]
        binary_search(left, target)
    else
        search = binary_search(right, target)
        search.nil? ? nil : mid + 1 + search
    end
end

p binary_search([2,3,4,5,6,7], 7)