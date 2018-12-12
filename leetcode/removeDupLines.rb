def removeDupLines(arr)

    result = Hash.new(0)

    arr.each do |line|
        result[line] += 1
    end

    result.keys

end

p removeDupLines(["Title", "Title", "Chapter 1", "Chapter 2", "Chapter 1", "Index", "Glossary"])