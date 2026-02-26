def str_str(haystack, needle)
  # haystack.index(needle) || -1

  (0..haystack.length - needle.length).each do |i|
    if haystack[i] == needle[0]
      if haystack[i, needle.length] == needle
        return i
      end
    end
  end
  -1
end

# def str_str(haystack, needle)
#   start_index = 0
#   while start_index < haystack.length
#     (start_index..haystack.length - needle.length).each do |i|
#       if haystack[i] == needle[0]
#         if haystack[i, needle.length] == needle
#           return i
#         else
#           break
#         end
#       end
#     end
#     start_index += 1
#   end
#   return -1
# end

haystack = "sadbutsad"
needle = "sad"

haystack2 = "leetcode"
needle2 = "leeto"

haystack3 = "hello"
needle3 = "ll"

haystack4 = "mississippi"
needle4 = "issip"

haystack5 = "mississippi"
needle5 = "pi"

print(str_str(haystack, needle), " --- expected: 0 \n")
print(str_str(haystack2, needle2), " --- expected: -1 \n")
print(str_str(haystack3, needle3), " --- expected: 2 \n")
print(str_str(haystack4, needle4), " --- expected: 4 \n")
print(str_str(haystack5, needle5), " --- expected: 9 \n")
