# @param {String} s
# @return {String}
def longest_palindrome(s)
    i = 1
    starting_index = 0
    maxSize = 0
    # check for invalid string input !#@&*
    if s.length <= 0
	return ""
    end
    # check if there's an odd palindrome (bab)
    while i < s.length
        j = 1
        # odd palindrome definition: i is the middle and i +- j equal one another
        while (s[i + j] == s[i - j]) and ((i - j) >= 0)
            if ((j * 2) + 1) > maxSize
                maxSize = (j * 2) + 1
                starting_index = i - j
            end
            j += 1
        end
        i += 1
    end
    i = 1
    # check if there's an even palindrome (baab)
    while i < s.length
	j = 0
        # even palindrome definition: i and i - 1 equal one another 
	# i + j [right side] should be the same as (i - 1) - j [left side]
	# i + j [right side] should never exceed string length
	# i - 1 - j [left side] should never be below 0
        while (s[i + j] == s[i - 1 - j]) and ((i - 1 - j) >= 0) and ((i + j) < s.length)
	   if ((j * 2) + 2) > maxSize
            	maxSize = (j * 2) + 2
            	starting_index = i - 1 - j
           end
           j += 1
	end
	i += 1
    end
    return starting_index < (starting_index + maxSize) ? s[starting_index...starting_index+maxSize] : s[starting_index]
end

def run_tests(s, ans)
	return (str = longest_palindrome(s)) == ans ? "TRUE" : "FAil test #{s}; #{str} != #{ans}"
end

puts run_tests("", "")
puts run_tests("a", "a")
puts run_tests("babad", "bab")
puts run_tests("cbbd", "bb")
puts run_tests("abc", "a")
puts run_tests("bb", "bb")
puts run_tests("cacbbca", "acbbca")
puts run_tests("abcracecareeee", "racecar")
