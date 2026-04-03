def find_substring(s, words)
  word_count = Hash.new(0)
  words.each do |word|
    word_count[word] += 1
  end

  result = []
  word_length = words[0].length
  (0...word_length).each do |offset|
    left = offset
    right = offset
    current_count = Hash.new(0)
    while right + word_length <= s.length
      word = s[right, word_length]
      right += word_length

      if word_count.key?(word)
        current_count[word] += 1

        while current_count[word] > word_count[word]
          left_word = s[left, word_length]
          current_count[left_word] -= 1
          left += word_length
        end

        if right - left == word_length * words.size
          result << left
        end
      else
        current_count.clear
        left = right
      end
    end
  end
  print("final result: #{result}")
end

s = "barfoothefoobarman"
words = ["foo", "bar"]
puts find_substring(s, words) # [0,9]
print("    expected: [0,9] \n")

s = "wordgoodgoodgoodbestword"
words = ["word", "good", "best", "word"]
puts find_substring(s, words) # []
print("    expected: [] \n")

s = "barfoofoobarthefoobarman"
words = ["bar", "foo", "the"]
puts find_substring(s, words) # [6,9,12]
print("    expected: [6,9,12] \n")

s = "lingmindraboofooowingdingbarrwingmonkeypoundcake"
words = ["fooo", "barr", "wing", "ding", "wing"]
puts find_substring(s, words) # [13]
print("    expected: [13] \n")

s = "ababababab"
words = ["ababa", "babab"]
puts find_substring(s, words) # []
print("    expected: [] \n")

# def find_substring(s, words)
#   #create a hash to store the count of each word in the words array
#   word_count = Hash.new(0)
#   words.each do |word|
#     word_count[word] += 1
#   end

#   result = []
#   word_length = words[0].length
#   (0..s.length - (word_length * words.size)).each do |i|
#     matched_words = 0
#     current_count = Hash.new(0)
#     starting_index = i
#     current_word = s[starting_index, word_length]
#     if current_word.size != word_length
#       next
#     end
#     if word_count[current_word] > 0
#       current_count[current_word] += 1
#       matched_words += 1
#       words.size.times do |j|
#         starting_index += word_length
#         current_word = s[starting_index, word_length]
#         if current_word.size != word_length
#           break
#         end
#         if word_count[current_word] > 0 && current_count[current_word] < word_count[current_word]
#           current_count[current_word] += 1
#           matched_words += 1
#         else
#           break
#         end
#       end
#       if matched_words == words.size
#         result << i
#       end
#     end
#   end
#   print("final result: #{result}")
# end
