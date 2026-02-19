def product_except_self(nums)
  n = nums.length
  left, right, result = [1] * n, [1] * n, [1] * n

  (1..n - 1).each do |i|
    left[i] = left[i - 1] * nums[i - 1]
  end

  (0..n - 2).reverse_each do |i|
    right[i] = right[i + 1] * nums[i + 1]
  end

  (0..n - 1).each do |i|
    result[i] = right[i] * left[i]
  end
  result
end

nums1 = [1, 2, 3, 4] # [24,12,8,6]
nums2 = [-1, 1, 0, -3, 3] # [0,0,9,0,0]

p(product_except_self(nums1))
p(product_except_self(nums2))
