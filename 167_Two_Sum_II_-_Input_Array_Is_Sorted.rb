def two_sum(numbers, target)
  n_ptr = 0
  t_ptr = numbers.length - 1

  while n_ptr < t_ptr
    sum = numbers[n_ptr] + numbers[t_ptr]
    
    if sum == target
      return [n_ptr + 1, t_ptr + 1]
    elsif sum < target
      n_ptr += 1
    else
      t_ptr -= 1
    end
  end
end

numbers = [2,7,11,15]
target = 9
print("result is: ", print(two_sum(numbers, target)), " -- expected: [1,2]\n")

numbers1 = [2, 3, 4]
target1 = 6
print("result is: ", print(two_sum(numbers1, target1)), " -- expected: [1,3]\n")

numbers2 = [-1,0]
target2 = -1
print("result is: ", print(two_sum(numbers2, target2)), " -- expected: [1,2]\n")

numbers3 = [2,4,11,17]
target = 15
print("result is: ", print(two_sum(numbers3, target)), " -- expected: [2,3]\n")

numbers3 = [5,25,75]
target = 100
print("result is: ", print(two_sum(numbers3, target)), " -- expected: [2,3]\n")

numbers4 = [1,2,3,4,4,9,56,90]
target4 = 8
print("result is: ", print(two_sum(numbers4, target4)), " -- expected: [4,5]\n")