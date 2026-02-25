def longest_common_prefix(strs)
  return strs[0] if strs.length == 1
  smallest = strs[0]

  smallest = strs.min_by(&:length)

 

  (0...smallest.length).each do |i|
    char_to_check = smallest[i]

    strs.each do |word|
      if word[i] != char_to_check
        return smallest[0...i]
      end
    end
  end
  return smallest
end

# strs.each do |word|
#   if word.size < smallest.length
#     smallest = word
#   end
# end

  # if smallest != ""
  #     while step != (smallest.size)
  #         step += 1
  #       else
  #         break
  #       end
  #     end
  #     if step > 0
  #       smallest[0, (step - 1)]
  #     else
  #       return ""
  #     end
  #   end
  # else
  #   return ""
  # end


strs = ["flower", "flow", "flight"] # "fl"
strs2 = ["dog", "racecar", "car"] # ""
strs3 = ["ab", "a"] # "a"
strs4 = ["", ""] # ""
strs5 = ["a"] # "a"
strs6 = ["reflower", "flow", "flight"]
strs7 = ["flower", "flower", "flower", "flower"]

print(longest_common_prefix(strs), " --- expected: fl \n")
print(longest_common_prefix(strs2), " --- expected:  \n")
print(longest_common_prefix(strs3), " --- expected: a \n")
print(longest_common_prefix(strs4), " --- expected:  \n")
print(longest_common_prefix(strs5), " --- expected: a \n")
print(longest_common_prefix(strs6), " --- expected:  \n")
print(longest_common_prefix(strs7), " --- expected: flower \n")
