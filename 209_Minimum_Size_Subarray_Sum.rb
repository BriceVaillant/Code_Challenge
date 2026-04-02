# Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. 
# If there is no such subarray, return 0 instead.



def min_sub_array_len(target, nums)
    return 1 if nums[0] >= target
    return 0 if nums.length <= 1
    n = 0
    k = 1
    result = nums.length
    sum = nums[n] + nums[k]
    possible_solution = false

  while k < nums.length
    # print("sum: #{sum} \n")
    # print("target: #{target}\n")
    # print("n: #{n} k: #{k} \n")
    if sum >= target
      #   print("sum is superior or equal to target: #{sum} \n")
      size = k - n + 1
      #   print("new size is: #{size} \n")
      result = size if size < result
      sum -= nums[n]
      n += 1
      possible_solution = true
    #   print("n: #{n} \n")
    else
      #   print("sum is inferior to target: #{sum} \n")
      k += 1
      break if k == nums.length
      #   print("new k is: #{k} \n")
      sum += nums[k]
      #   print("new sum is: #{sum}")
    end
    # print("best result so far is: #{result}\n")
    # print("\n   \n")
  end
  
   if possible_solution
    
    print(" final result: #{result}")
   else
    print("0")
   end
end

target = 7
nums = [2, 3, 1, 2, 4, 3]
puts min_sub_array_len(target, nums) # 2

target = 7
nums = [2, 4, 3, 1, 2, 1]
puts min_sub_array_len(target, nums) # 2

target = 4
nums = [1, 4, 4]
puts min_sub_array_len(target, nums) # 1

target = 11
nums = [1, 1, 1, 1, 1, 1, 1, 1]
puts min_sub_array_len(target, nums) # 0


# def min_sub_array_len(target, nums)
#     n = 0
#     current_sum = 0
#     result = Float::INFINITY # Start with Infinity so any found window is smaller
  
#     # 'k' is our 'right' pointer, expanding the window
#     (0...nums.length).each do |k|
#       current_sum += nums[k]
  
#       # While the window is valid, try to shrink it from the left
#       while current_sum >= target
#         size = k - n + 1
#         result = [result, size].min # Update result if this window is smaller
        
#         current_sum -= nums[n]
#         n += 1
#       end
#     end
  
#     # If result was never updated, return 0
#     result == Float::INFINITY ? 0 : result
#   end