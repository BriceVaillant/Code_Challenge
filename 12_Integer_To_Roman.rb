def int_to_roman(num)
  number = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1,
  }

  result = ""
  number.each do |key, value|
    tmp = num.to_i / value
    num -= tmp * value
    result << key * tmp
  end

  result
end

num1 = 3749 #  "MMMDCCXLIX"
num2 = 58 # "LVIII"
num3 = 1994 # "MCMXCIV"
print(int_to_roman(num1), " --- expected: MMMDCCXLIX \n")
print(int_to_roman(num2), " --- expected: LVIII \n")
print(int_to_roman(num3), " --- expected: MCMXCIV \n")
