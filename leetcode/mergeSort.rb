require 'byebug'
def mergeSort(arr)

    return arr if arr.length < 2

    mid = arr.length/2
    left = arr.take(mid)
    right = arr.drop(mid)

    sorted_left = mergeSort(left)
    sorted_right = mergeSort(right)

    merge(sorted_left, sorted_right)
end

def merge(left, right)
    merged = [] 
    until left.empty? || right.empty?
        if left.first < right.first
            merged << left.shift
        else
            merged << right.shift
        end
        # if left.last > right.last
        #     merged << right.pop
        # else
        #     merged << left.pop
        # end
    end

    merged.concat(left).concat(right)
end

p mergeSort([1,5,4,3,7,4,8])