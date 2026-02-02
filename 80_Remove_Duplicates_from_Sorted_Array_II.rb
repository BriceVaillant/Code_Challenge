# def remove_duplicates(nums)
#   k = 0

#   (1...nums.length).each do |moving_p|
#     if nums[k] != nums[moving_p]
#       k += 1
#       nums[k] = nums[moving_p]
#     end
#   end
#   p(nums)
#   return k + 1
# end

# m = [1,1,1,2,2,3]
# n = [0,0,1,1,1,1,2,3,3]

# print(remove_duplicates(m))

# remove some duplciates such that each unique element appears at MOST TWICE
# don't change the order


# Input: nums = [1,1,1,2,2,3]
# Output: 5, nums = [1,1,2,2,3,_]
# Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.

# Input: nums = [0,0,1,1,1,1,2,3,3]
# Output: 7, nums = [0,0,1,1,2,3,3,_,_]

print((0...4).count)