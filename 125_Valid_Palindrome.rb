def is_palindrome(s)
  cleaned_str = s.downcase.gsub(/[^a-z0-9]/, "")
  print("cleaned string is: ", cleaned_str, "\n")
  print("s is : ", s, "\n")

  start_pointer = 0
  end_pointer = cleaned_str.length - 1

  while start_pointer < end_pointer
    if cleaned_str[start_pointer] != cleaned_str[end_pointer]
      return false
    end

    start_pointer += 1
    end_pointer -= 1
  end
  true
end

s = "A man, a plan, a canal: Panama" # => true
s1 = "race a car" # => false
s2 = " " # => true
s3 = "0P" # => false

print("result is: ", is_palindrome(s), " -- expected: true\n")
print("result is: ", is_palindrome(s1), " -- expected: false\n")
print("result is: ", is_palindrome(s2), " -- expected: true\n")
print("result is: ", is_palindrome(s3), " -- expected: false\n")
