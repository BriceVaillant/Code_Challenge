def remove_duplicates(nums)
  return nums.length if nums.length <= 2
  k = 2

  (2...nums.length).each do |j|
    if nums[j] != nums[k - 2]
      nums[k] = nums[j]
      k += 1
    end
  end
  return k
end

print(remove_duplicates(n))

# remove some duplciates such that each unique element appears at MOST TWICE
# don't change the order

# Input: nums = [1,1,1,2,2,3]
# Output: 5, nums = [1,1,2,2,3,_]
# Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.

# Input: nums = [0,0,1,1,1,1,2,3,3]
# Output: 7, nums = [0,0,1,1,2,3,3,_,_]
