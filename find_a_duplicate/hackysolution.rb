# => HACKY SOLUTION lol
def find_duplicate(int_array)
  int_array.each do |int|
    return int if int_array.count(int) > 1 
  end
  return "No Dups Here"
end
