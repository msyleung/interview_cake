def get_closing_paren(sentence, opening_paren_index)

  # Find the position of the matching closing parenthesis
  op = 0
  index = 0
  magic = false
  # TODO: Could have instead started at opening_paren_index and counted upwards
  sentence.chars.each do |sc|
    if index == opening_paren_index
      magic = true
    end
    if magic
      if sc == '('
        op += 1
      elsif sc == ')'
        op -= 1
        return 'Error' if op < 0
      end
    end
    return index if magic and op == 0
    index += 1
  end
  raise Exception("No closing parenthesis :(")
end

puts get_closing_paren('Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing.', 10)












# Tests

def run_tests
  desc = 'all openers then closers'
  actual = get_closing_paren('((((()))))', 2)
  expected = 7
  assert_equal(actual, expected, desc)

  desc = 'mixed openers and closers'
  actual = get_closing_paren('()()((()()))', 5)
  expected = 10
  assert_equal(actual, expected, desc)

  desc = 'no matching closer'
  assert_raises(desc) { get_closing_paren('()(()', 2) }
end

def assert_equal(a, b, desc)
  if a == b
    puts "#{desc} ... PASS"
  else
    puts "#{desc} ... FAIL: #{a} != #{b}"
  end
end

def assert_raises(desc)
  begin
    yield
    puts "#{desc} ... FAIL"
  rescue
    puts "#{desc} ... PASS"
  end
end

run_tests
