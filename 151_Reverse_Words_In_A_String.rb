def reverse_words(s)
  # s.split.reverse.join(" ")
  words = []
  temp_word = ""
  s.each_char do |c|
    unless c == " "
      temp_word += c
    else
      if temp_word != ""
        words << temp_word
        temp_word = ""
      end
    end
  end

  if temp_word != ""
    words << temp_word
    temp_word = ""
  end
  print(words.reverse.join(" "))
end

s = "the sky is blue" # "blue is sky the"
s2 = "  hello world  " # "world hello"
s3 = "a good   example" # "example good a"

print(reverse_words(s), " --- expected: blue is sky the \n")
print(reverse_words(s2), " --- expected: world hello \n")
print(reverse_words(s3), " --- expected: example good a \n")
