def convert(s, num_rows)
  count = []
  answer = ""
  a = Hash.new { |h, k| h[k] = [] }

  # pattern = (0...num_rows).to_a + (1...num_rows - 1).to_a.reverse

  while count.length < s.length
    (0..num_rows - 1).each do |i|
      count << i if count.length < s.length
    end
    (num_rows - 2).downto(1) do |i|
      count << i if count.length < s.length
    end
  end

  count.each_with_index do |value, index|
    a[value] << s[index]
  end

  (0..num_rows - 1).each do |i|
    a[i].each do |string|
      answer << string
    end
  end
  answer
end

s = "PAYPALISHIRING" # "PIAHRYSIPINAG"
num_rows = 5

s2 = "PAYPALISHIRING" # "PINALSIGYAHRPI"
num_rows2 = 4

s3 = "PAYPALISHIRING" # "PAHNAPLSIIGYIR"
num_rows3 = 3

s4 = "A" # "A"
num_rows4 = 1
print(convert(s, num_rows), " --- expected: PIAHRYSIPINAG \n")
print(convert(s2, num_rows2), " --- expected: PINALSIGYAHRPI \n")
print(convert(s3, num_rows3), " --- expected: PAHNAPLSIIGYIR \n")
print(convert(s4, num_rows4), " --- expected: A \n")

# print(convert(s, num_rows3), " --- expected: A \n")
# print(0..num_rows - 1, "\n")
