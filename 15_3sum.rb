def three_sum(nums)
  nums.sort!
  result = []

  (0..nums.length - 3).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]

    if nums[i] > 0
      break
    end

    left = i + 1
    right = nums.length - 1

    while left < right
      current_sum = nums[i] + nums[left] + nums[right]

      if current_sum == 0
        result << [nums[i], nums[left], nums[right]]
        while left < right && nums[left] == nums[left + 1]
          left += 1
        end
        while left < right && nums[right] == nums[right - 1]
          right -= 1
        end
        left += 1
        right -= 1
      elsif current_sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end
  result
end

p three_sum([-1, 0, 1, 2, -1, -4]) # => [[-1,-1,2],[-1,0,1]]
p three_sum([0, 1, 1]) # => []
p three_sum([0, 0, 0]) # => []
