def check_palindrome(s)
    puts s
    (s.length/2).times do |i|
        if s[i] != s[s.length - 1 - i]
            # puts "i = #{i} && s[i] = #{s[i]} && s[-i] = #{s[s.length - i]}"
            return false
        end
    end
    return true
end

def is_palindrome(s)
    s = s.downcase#.tr(",\n\t:. @#--+)(!`~$%^&*?><", '')
    s = s.chars.select { |char| char.ascii_only? and ((char.ord >= 65 and char.ord <= 90) or (char.ord >= 97 and char.ord <= 122) or (char.ord >= 48 and char.ord <= 57)) }.join
    return check_palindrome(s)
end
