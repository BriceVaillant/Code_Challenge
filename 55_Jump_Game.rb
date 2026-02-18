def can_jump(nums)
  target = nums.length - 1

  (0..nums.length - 2).reverse_each do |i|
    if nums[i] + i >= target
      target = i
    end
  end
  target == 0 
end


# def can_jump(nums)
#   jump_counter = 0
#   k = nums.length - 1

#   (nums.length - 1).times do
#     if nums[k] == 0
#       jump_counter += 1
#       k -= 1
#     elsif nums[k] >= jump_counter
#       k -= 1
#     end
#     # print(k, "turn", "\n")
#     # print(jump_counter, "jump_counter", "\n")
#   end
#   if k == 0 && nums[k] >= jump_counter
#     return true 
#   else 
#     return false
#   end
# end


nums1 = [2, 3, 1, 1, 4] # true
nums2 = [3, 2, 1, 0, 4] # false
nums3 = [0,1] # false
nums4 = [0] # true 
nums5 = [2,0] # true
nums6 = [2,0,2] # true
nums7 = [1,0,1,0] # false
nums8 = [2,0,0] # true
nums9 = [3,0,8,2,0,0,1] # true

print("1 - true: ", can_jump(nums1), "\n")
print("2 - false: ",can_jump(nums2), "\n")
print("3 - false: ",can_jump(nums3), "\n")
print("4 - true: ",can_jump(nums4), "\n")
print("5 - true: ",can_jump(nums5), "\n")
print("6 - true: ",can_jump(nums6), "\n")
print("7 - false: ",can_jump(nums7), "\n")
print("8 - true: ",can_jump(nums8), "\n")
print("9 - true: ",can_jump(nums9), "\n")

# You are given an integer array nums.
# You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

# Return true if you can reach the last index, or false otherwise.

# Input: nums = [2,3,1,1,4]  Output: true
# Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

# Input: nums = [3,2,1,0,4]  Output: false
# Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.


# Instead of focusing only on the zeros, think about the Goal.

# Imagine you are standing at the last index. What is the "earliest" index from which you could possibly reach your current position? 
# If you find one, that index becomes your new goal. If you can move the "goal" all the way back to index 0, you've won.