# @param {String} s
# @return {String}
def longest_palindrome(s)
    #1. is string?
    if s.length == 2
        if s[0] == s[1]
            return s
        else
            return s[0]
        end
    end
    #2. start in middle of string
    starting_index = (s.length - 1)/2
    left_index = starting_index - 1
    right_index = starting_index + 1
    save_right = 0
    save_left = 0
    #3. compare letters next to middle
    while (right_index < s.length && left_index > -1)
        #4. odd palindrome: if they're the same (add length size) & store word
        if s[right_index] == s[left_index]
            save_right = right_index
            save_left = left_index
        end
        #5. even palindrome: if they're same as starting_index
        if s[right_index] == s[starting_index]
            save_right = right_index
            left_index = starting_index
            save_left = left_index
        elsif s[left_index] == s[starting_index]
            right_index = starting_index
            save_right = right_index
            save_left = left_index
        end
        #6. increment
        right_index += 1
        left_index -= 1
    end
    return s[save_left..save_right]
end

def run_tests(s, ans)
	return (str = longest_palindrome(s)) == ans ? "TRUE" : "FAil test #{s}; #{str} != #{ans}"
end

# puts run_tests("babad", "bab")
# puts run_tests("cbbd", "bb")
# puts run_tests("abc", "a")
puts run_tests("bb", "bb")
puts run_tests("abcracecareeee", "racecar")
