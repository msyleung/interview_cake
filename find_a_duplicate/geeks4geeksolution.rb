# => CHANGE NUMBER AT N INDEX OF ARRAY 
# https://www.geeksforgeeks.org/find-duplicates-in-on-time-and-constant-extra-space/
def find_duplicate(int_array)
  index = 0
  while index < int_array.length
    if int_array[(int_array[index].abs)] >= 0
      int_array[(int_array[index].abs)] = -int_array[(int_array[index].abs)]
    else
      return int_array[index].abs
    end
    index += 1
  end
  return "No Dups Here"
end
