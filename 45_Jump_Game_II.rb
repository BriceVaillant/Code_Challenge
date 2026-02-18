def jump(nums)
  target = nums.length - 1

  current_end = 0
  jump_power = 0
  jumps = 0

  (0...nums.length - 1).each do |i|
    jump_power = [jump_power, i + nums[i]].max # 
    
    if i == current_end
      jumps += 1
      current_end = jump_power
      
      break if current_end >= target
    
    end
    
  end

  jumps
end

nums1 = [2, 3, 1, 1, 4] # 2
nums2 = [2, 3, 0, 1, 4] # 2

print(jump(nums1))
print(jump(nums2))