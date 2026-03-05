def is_subsequence(s, t)
  s_pointer = 0
  t_pointer = 0

  while s_pointer < s.length && t_pointer < t.length
    if s[s_pointer] == t[t_pointer]
      s_pointer += 1
    end
    t_pointer += 1
  end
  s_pointer == s.length
end

s6 = "abbc"
t6 = "ahbgdc"
print("6: result is: ", is_subsequence(s6, t6), " -- expected: false\n")

s = "abc"
t = "ahbgdc"
print("0: result is: ", is_subsequence(s, t), " -- expected: true\n")

s1 = "axc"
t1 = "ahbgdc"
print("1: result is: ", is_subsequence(s1, t1), " -- expected: false\n")

s3 = ""
t3 = "ahbgdc"
print("3: result is: ", is_subsequence(s3, t3), " -- expected: true\n")

s4 = "acb"
t4 = "ahbgdc"
print("4: result is: ", is_subsequence(s4, t4), " -- expected: false\n")

s5 = "abc"
t5 = ""
print("5: result is: ", is_subsequence(s5, t5), " -- expected: false\n")
