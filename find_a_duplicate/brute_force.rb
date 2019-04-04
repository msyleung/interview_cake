# => BRUTE FORCE SOLUTION
def find_duplicate(int_array)

  # Find a number that appears more than once... in O(n) time
  int_array.each_with_index do |current_value, index|
    next_index = index + 1 < int_array.length ? index + 1 : int_array.length
    prev_index = index > 0 ? index - 1 : index
    return current_value if current_value == int_array[next_index]
    return int_array[prev_index] if int_array[next_index] == int_array[prev_index]
  end
  "No Dups Here!"
end
