def length_of_last_word(s)
  s.rstrip.split.last.size
end

s1 = "Hello World" # 5
s2 = "   fly me   to   the moon  " # 4
s3 = "luffy is still joyboy" # 6
s4 = "a" # 1
s6 = " let's go today " # 5

print(length_of_last_word(s1), " --- expected: 5 \n")
print(length_of_last_word(s2), " --- expected: 4 \n")
print(length_of_last_word(s3), " --- expected: 6 \n")
print(length_of_last_word(s4), " --- expected: 1 \n")
print(length_of_last_word(s6), " --- expected: 5 \n")
