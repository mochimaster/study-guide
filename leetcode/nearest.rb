def nearestLocation(totalSteakhouses, allLocations, numSteakhouses)
	# WRITE YOUR CODE HERE
	
	# Introduce a distance hash
	# Iterate through allLocations
	# For each location, calculate distance to [0,0]
	# Write helper method that accepts two argument and return distance in int
	# For each distance calculated, add into distance hash
	# Return the lowest number of distance hash (value)
	
	distance = {}
	
	# Iterate through each location in the array
	allLocations.each do |location|
	    # Set the location as a key and the calculated distance as a value
	    distance[location] = calculateDistance(location)
	end
	
	# In case user wants to filter more numSteakhouses than available in the area
	numSteakhouses = totalSteakhouses if numSteakhouses > totalSteakhouses
	
    result = distance.sort_by {|k,v| v}.first(numSteakhouses)
    result.map {|coordinate, distance| coordinate}
	
end

# calculate distance only needs 1 argument since the origin is always [0,0]
def calculateDistance(location)
    return Math.sqrt(location[0]**2 + location[1]**2)
end

p nearestLocation(3, [[1,-3], [1,2], [3,4]], 1)