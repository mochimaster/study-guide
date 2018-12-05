#!/bin/ruby

#
# Complete the 'getMinimumUniqueSum' function below.
#
# The function is expected to return an INTEGER.
# The function accepts INTEGER_ARRAY arr as parameter.
#
require 'pry'

def getMinimumUniqueSum(arr)
    p "arr: #{arr}"

    # Write your code here
    return 0 if(arr.length == 0)
    
    # visited = []
    # Use hash map intead of Array for faster lookup time
    visited = Hash.new {|h,k| h[k] = 0}

    arr.each do |num|
        if visited.include?(num)
            newNum = getNewNum(visited, num)
            # visited.push(newNum)
            visited[newNum] += 1
        else
            # visited.push(num)
            visited[num] += 1
        end
    end

    # visited.reduce(:+)

    # Iterate through visited hash and only add the keys that have count of more than 0.
    result = 0
    visited.each do |num, count|
        p "num: #{num}"
        p "count: #{count}"
        # if count > 0 
            result += num
        # end
    end
    result
end

def getNewNum(visited, num)
    # while visited.include?(num)
    p "visited[num] : #{visited[num] }"
    while visited[num] != 0
        p "inside visited[num] : #{visited[num]}"
        num += 1
    end
    p "num: #{num}"
    num
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

p getMinimumUniqueSum([2,2,4,5])