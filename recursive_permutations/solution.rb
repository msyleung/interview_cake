require 'set'

  # Generate all permutations of the input string

def get_permutations(string)

  # 1. Needs a base case to return once a condition has been reached
  if string.length <= 1
    return Set.new [string]
  end

  string_without_last = string[0..-2]
  last_character = string[-1]
  
  # 2. Recursively rotate without last to generate permutations
  sets_without_last = get_permutations(string_without_last)
  
  all_sets = Set.new
  # 3. For each rotation
  sets_without_last.each do |set_without_last|
    (0..string_without_last.length).each do |position|
      new_set = set_without_last[0...position] + last_character + set_without_last[position..-1]
      all_sets.add(new_set)
    end
  end
  
  all_sets
end


puts get_permutations('ab')















# Tests

def run_tests
  desc = 'empty string'
  actual = get_permutations('')
  expected = Set.new([''])
  assert_equal(actual, expected, desc)

  desc = 'one character string'
  actual = get_permutations('a')
  expected = Set.new(['a'])
  assert_equal(actual, expected, desc)

  desc = 'two character string'
  actual = get_permutations('ab')
  expected = Set.new(['ab', 'ba'])
  assert_equal(actual, expected, desc)

  desc = 'three character string'
  actual = get_permutations('abc')
  expected = Set.new(['abc', 'acb', 'bac', 'bca', 'cab', 'cba'])
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a.inspect} != #{b.inspect}"
  end
end

# run_tests
