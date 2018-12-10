require 'byebug'

def generalizedGCD(num, arr)

    currentGCD = 1
    idx = 1
    commonFound = true
    
    
    while idx <= arr.min
        debugger
        arr.each do |el|
            if el % idx != 0
                commonFound = false
            end
        end
        debugger
        currentGCD = idx if commonFound == true
        commonFound = false
        idx+=1
    end
    currentGCD
end

p generalizedGCD(5, [2,4,6,8,10])