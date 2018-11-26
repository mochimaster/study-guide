# @param {String} s
# @return {Integer}
def min_add_to_make_valid(s)

    # need while loop because replaced () to empty space might form another ()     
    while s.include?("()")
        s.gsub! "()",""
    end
    return s.length
    
end