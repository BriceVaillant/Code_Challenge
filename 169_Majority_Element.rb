def majority_element(nums)
  k = nums[0]
  count = 0

  nums.each do |num|
    if count == 0
      k = num
    elsif num == k
      count +=1
    else 
      count -= 1
    end
  end
  return k
end

# def majority_element(nums)
#   k = nums.count / 2
#   return nums.sort![k]
# end


nums1 = [3,2,3,3]
nums2 = [2,2,1,1,1,2,2]
p(majority_element(nums2))
# Given an array nums of size n, return the majority element.

# The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

# Input: nums = [3,2,3]
# Output: 3

# Input: nums = [2,2,1,1,1,2,2]
# Output: 2