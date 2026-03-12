def max_area(height)
  i = 0
  j = height.length - 1
  max_area = 0

  # print("height is: ", height, "\n")
  # print("i is: ", i, "\n")
  # print("j is: ", j, "\n")
  while i < j
    # # print("max_area is: ", max_area, "\n")
    if height[i] < height[j]

      # print('height[i] is inferior to height[j]\n')
      # print("height[i] is: ", height[i], "\n")
      # print("height[j] is: ", height[j], "\n")

      highest_wall = height[i]
      # print("highest_wall is: ", highest_wall, "\n")

      current_area = highest_wall * (j - i)
      # print("current_area is: ", current_area, "\n")

      if current_area > max_area
        max_area = current_area
      end
      i += 1
    elsif height[j] < height[i]
      # print('height[j] is inferior to height[i]\n')
      # print("height[j] is: ", height[i], "\n")
      # print("height[i] is: ", height[j], "\n")

      highest_wall = height[j]
      # print("highest_wall is: ", highest_wall, "\n")

      current_area = highest_wall * (j - i)
      # print("current_area is: ", current_area, "\n")

      if current_area > max_area
        max_area = current_area
      end
      j -= 1
    else
      # print('height[i] is equal to height[j]\n')
      # print("height[i] is: ", height[i], "\n")
      # print("height[j] is: ", height[j], "\n")
      highest_wall = height[j]
      # print("highest_wall is: ", highest_wall, "\n")
      current_area = highest_wall * (j - i)

      if current_area > max_area
        max_area = current_area
      end
      i += 1
    end
  end
  return max_area
end

height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
print("result is: ", max_area(height), " -- expected: 49\n")

height1 = [1, 1]
print("result is: ", max_area(height1), " -- expected: 1\n")

height2 = [4, 3, 2, 1, 4]
print("result is: ", max_area(height2), " -- expected: 16\n")

height3 = [1, 2, 1]
print("result is: ", max_area(height3), " -- expected: 2\n")

height4 = [1, 3, 2, 5, 25, 24, 5]
print("result is: ", max_area(height4), " -- expected: 24\n")

height5 = [1, 2, 4, 3]
print("result is: ", max_area(height5), " -- expected: 4\n")

height6 = [2, 3, 4, 5, 18, 17, 6]
print("result is: ", max_area(height6), " -- expected: 17\n")

height7 = [5, 4, 3, 2, 1]
print("result is: ", max_area(height7), " -- expected: 6\n")
