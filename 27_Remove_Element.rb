def remove_element(nums, val)
  (nums.delete_if {|i| i == val } ).count
end

nums = [0,1,2,2,3,0,4,2]
val = 2

print(remove_element(nums, val))
print("\nexpected output: [2,2,_,_]")