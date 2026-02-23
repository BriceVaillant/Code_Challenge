def trap(height)
  l = height.length - 1
  current_higher_index = height[0]
  water_amount = 0
  max_left, max_right, result = [0] * height.length, [0] * height.length, [0] * height.length


  (0..height.length - 1).each do |i|
    if height[i] > current_higher_index
      current_higher_index = height[i]
    end
    max_left[i] = current_higher_index
  end

  current_higher_index = height[l]

  (0..height.length - 1).reverse_each do |i|
    if height[i] > current_higher_index
      current_higher_index = height[i]
    end
    max_right[i] = current_higher_index
  end

  # print(max_left, " --- max_left \n")
  # print(max_right, " --- max_right \n")
  # print(result, " --- result \n")

  max_left.each_with_index do |max_left_value, i|
      if max_left_value > max_right[i] 
        result[i] = max_right[i] - height[i]
      else
        result[i] = max_left_value  - height[i]
      end
  end

  result.sum

end

height1 = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1] # 6
height2 = [4, 2, 0, 3, 2, 5] # 9
height3 = [4, 2, 3] # 1

print(trap(height1), " --- expected: 6 \n")
print(trap(height2), " --- expected: 9 \n")
print(trap(height3), " --- expected: 1 \n")
