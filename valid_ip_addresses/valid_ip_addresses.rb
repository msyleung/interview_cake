# I was competing with my friend to complete this exercise :) 
# He finished the question in Python in faster runtime (24ms) but I got to use less memory in comparison (11.9MB)
# My Ruby code also made these accomplishments in Leetcode at the time of submission! :tada:
# => Runtime: 32 ms, faster than 92.31% of Ruby online submissions for Validate IP Address.
# => Memory Usage: 9.4 MB, less than 100.00% of Ruby online submissions for Validate IP Address.
# But it took forever to write because I had to review regex again and again. 

def is_ipv4?(ip)
    return false if ip.end_with?('.')
    decimal_arr = ip.split('.')
    return false if decimal_arr.size != 4
    decimal_arr.each do |decimal|
	return false if (decimal.match?(/\D/) or (decimal.to_i < 0 or decimal.to_i > 255) or 
		(decimal.start_with?('0') and decimal.size > 1) or decimal.empty?)
    end
    return true
end

def is_ipv6?(ip)
    return false if ip.end_with?(':')
    hex_array = ip.split(':')
    return false if (hex_array.size != 8 or hex_array.first.start_with?('0'))
    hex_array.each do |hex|
        return false if (hex.size > 4 or hex.empty? or hex.match?(/[G-Z]/i) or hex.include?('-'))
    end
    return true
end

# The highlights: 
# A clean and simplistic function! 

def valid_ip_address(ip)
    if is_ipv4?(ip)
        return "IPv4"
    elsif is_ipv6?(ip)
        return "IPv6"
    end
    return "Neither" 
end

# Also testing

def test(ip, tru_ans)
    if (my_ans = valid_ip_address(ip)) == tru_ans
	puts "#{ip}: correct"
    else
	puts "#{ip}: #{my_ans} != #{tru_ans}"
    end
end

# test("172.16.254.1", "IPv4")
# test("172.16.254.01", "Neither")
test("10.256.255.1", "Neither")
test("10.01.10.10", "Neither")
test("1.0.1.255", "IPv4")
test("999.999.99.99", "Neither")
test("8.8.8.8", "IPv4")
test("8.88.8.8.8", "Neither")
# test("2001:0db8:85a3:0000:0000:8a2e:0370:7334", "IPv6")
# test("2001:db8:85a3:0:0:8A2E:0370:7334", "IPv6")
# test("2001:0db8:85a3::8A2E:0370:7334", "Neither")
# test("02001:0db8:85a3:0000:0000:8a2e:0370:7334", "Neither")
# test("256.256.256.256", "Neither")
test("2001:0db8:85a3:0:0:8A2E:0370:7334:", "Neither")
test("1e1.4.5.6", "Neither")
test("1.1.1.1.", "Neither")
test("1081:db8:85a3:01:-0:8A2E:0370:7334", "Neither")
test("t001:db8:85a3:0:0:8A2E:0370:7334", "Neither")
test("20EE:FGb8:85a3:0:0:8A2E:0370:7334", "Neither")



