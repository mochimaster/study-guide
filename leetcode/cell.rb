require 'byebug'
def cellCompete(states, days)
    # WRITE YOUR CODE HERE
    # make a copy of current state
    result = states.dup
    n = 1
    while n <= days
        # iterate through each state and compute the next state
        p "state: #{states}"
        states.each_with_index do |_, idx|

            # use helper method to compute next state
            state = getNextState(states, idx)
            p "state: #{state}"
            result[idx] = state
            p "------------------------"
        end
        n+=1
        states = result.dup
    end
    result
    
end

#helper method need idx to compute next state because it needs to know it's neighbor
def getNextState(states, idx)
    p "states INSIDE: #{states}"
    # debugger
    # I choose idx == 7 because it is given as Eight house. Or (states.length-1)
    p "current idx: #{idx}"
    p "states[idx-1]: #{states[idx-1]}"
    p "states[idx+1]: #{states[idx+1]}"

    if idx == 0
        if states[1] == 1
            return 1
        else
            return 0
        end
    elsif idx == 7
        if states[6] == 1
            return 1
        else
            return 0
        end
    end
       
    # If previous and next state is the same, return inactive
    if states[idx-1] == states[idx+1]
        return 0
    # If previous and next state is not equal, return active
    else
        return 1
    end

end

# p cellCompete([1,0,0,0,0,1,0,0],1)
p cellCompete([1,1,1,0,1,1,1,1],2)