# reverse words in a string

def reverseWordInString(string)
    string_array = string.split

    result = []

    string_array.each do |word|
        result.unshift(word)
    end

    return result.join(" ")
end

p reverseWordInString("The sky is blue")