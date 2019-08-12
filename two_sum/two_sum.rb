def two_sum(nums, target)
    nums.each_with_index do |n, index|
        # 2. Target - n, if num has the subtraction, there is the answer
        # next if n > target
        difference = target - n
        if nums.include? difference
            diff_index = nums.index(difference)
            next if diff_index == index
            return [diff_index, index].sort
        end
    end
    return [0,0]
end

# Tests

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a.inspect} != #{b.inspect}"
  end
end

def run_tests
  desc = '[2,7,11,15] with target 9'
  actual = two_sum([2,7,11,15], 9)
  expected = [0,1]
  assert_equal(actual, expected, desc)

  desc = '[3,2,4] with target 6'
  actual = two_sum([3,2,4], 6)
  expected = [1,2]
  assert_equal(actual, expected, desc)

  desc = '[-1,-2,-3,-4,-5] with target -8'
  actual = two_sum([-1,-2,-3,-4,-5], -8)
  expected = [2,4]
  assert_equal(actual, expected, desc)
end

run_tests
