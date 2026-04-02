# Given a string s, find the length of the longest substring without duplicate characters.
# maximum answer is s.length or 26
def length_of_longest_substring(s)
  n = 0
  result = 0
  size = 0
  seen = {}

  s.each_char.with_index do |char, k|
    print("\n\ncurrent char is: #{char} \ncurrent k is: #{k} \ncurrent n is: #{n} \ncurrent seen is: #{seen} \n")
    if seen[char] && seen[char] >= n
      print("char #{char} was already seen \n")
      n = seen[char] + 1
      seen[char] = k

      print("new n is: #{n} \n")
    else
      print("char #{char} was not seen yet \n")
      seen[char] = k
      print("new seen is: #{seen} \n")
    end
    size = k - n + 1
    result = [result, size].max
    print("current size is: #{size} \n")
    print("new result is: #{result} \n")
  end
  print("final result: #{result}")
end

# s = "abcabcbb"
# puts length_of_longest_substring(s) # 3
# print("answer should be 3 \n")

# s = "bbbbb"
# puts length_of_longest_substring(s) # 1
# print("answer should be 1 \n")

s = "pwwkew"
puts length_of_longest_substring(s) # 3
print("answer should be 3 \n")

# s = "tmmzuxt"
# puts length_of_longest_substring(s) # 5
# print("answer should be 5 \n")

# s = "dvdf"
# puts length_of_longest_substring(s) # 3
# print("answer should be 3 \n")
