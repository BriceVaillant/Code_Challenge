# def rotate(nums, k)
#   if k >= nums.length
#     k = k % nums.length
#   end

#   j = nums.pop(k)
#   nums.unshift(j).flatten!
#   return nums
# end

# def rotate(nums, k)
#   nums.rotate!(-k)
# end

def reverse!(nums, start_index, end_index)

  #this method reverse the array in place
  while start_index < end_index
    nums[start_index], nums[end_index] = nums[end_index], nums[start_index]
    start_index += 1
    end_index -= 1
  end
end

def rotate(nums, k)
  n = nums.length
  k %= n

  reverse!(nums, 0, n - 1) # reverse the whole array
  reverse!(nums, 0, k - 1) # reverse the first k elements
  reverse!(nums, k, n - 1) # reverse the remaining n-k elements
end

nums1 = [1, 2, 3, 4, 5, 6, 7]
k1 = 3

nums2 = [-1, -100, 3, 99]
k2 = 2

print("1:", rotate(nums1, k1))
# p("2:", rotate(nums2, k2))

# Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

# Input: nums = [1,2,3,4,5,6,7], k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

# Input: nums = [-1,-100,3,99], k = 2
# Output: [3,99,-1,-100]
# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]4
