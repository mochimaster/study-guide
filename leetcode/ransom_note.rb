# Write a function that takes 2 strings
# 1st - string - Take magazine
# 2nd - string of ransom note - 

# willMyRansomNoteWork(‘hello today is thursday would you like to meet for coffee’, ‘send me money’) {}


# Create hash for magazine , key value pair
# Create hash for ransom note
# For each ransom character, compare with the created magazine hash and compare key value
# If value of note is higher than magazine, we can return False and terminate program
# If we reach end of program, we can return True
require 'byebug'

def willMyRansomNoteWork(magazine, note) # bcdef, cat
	mag_hash = Hash.new(0) # {b=> 1, c=>1, d=>1, e=> 1, f=> 1}
	# note_hash = Hash.new(0) # {c=> 1, a=>1, t=>1}
	
	magazine.each_char do |char|
		mag_hash[char] += 1
	end

	note.each_char do |char| 
#		note_hash[char] += 1	
		mag_hash[char] -= 1
	end 

#	note_hash.each do |k,v|
#		return false unless mag_hash[k] >= note_hash[k]  # 0 >= 1
#	end

	mag_hash.each do |k, v|
		if v < 0
			return false
		end
	end
	true
end

p willMyRansomNoteWork("hello today is thursday would you like to meet for coffee ","ccat")