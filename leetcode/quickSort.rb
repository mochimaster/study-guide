def quickSort(arr)

    return arr if arr.length < 2

    pivot = arr[0]

    left = arr[1..-1].select{|el| el < pivot}
    right = arr[1..-1].select{|el| el > pivot}

    quickSort(left) + [pivot] + quickSort(right)
end


p quickSort([5,4,6,2,1,7,3])