def roman_to_int(s)
  symbol = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
  }

  start = 0
  result = 0
  while start < s.length
    if start == s.length - 1
      result += symbol[s[start]]
      break
    end
    if symbol[s[start]] < symbol[s[start + 1]] 
      result += symbol[s[start + 1]]  - symbol[s[start]]
      start += 2
    else 
      result += symbol[s[start]]
      start += 1
    end
  end

  result
end

s = "III" # 3
s2 = "LVIII" # 58
s3 = "MCMXCIV" # 1994
print(roman_to_int(s), " --- expected: 3 \n")
print(roman_to_int(s2), " --- expected: 58 \n")
print(roman_to_int(s3), " --- expected: 1994 \n")
# symbol = {
#     "I" => 1,
#     "V" => 5,
#     "X" => 10,
#     "L" => 50,
#     "C" => 100,
#     "D" => 500,
#     "M" => 1000,
#   }
# p(symbol[s2[1]])