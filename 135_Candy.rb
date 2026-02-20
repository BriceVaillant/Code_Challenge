def candy(ratings)
  result = [1] * ratings.length
  (1..ratings.length - 1).each do |i|
    if ratings[i] > ratings[i - 1]
      result[i] = result[i - 1] + 1
    end
  end
  (0..ratings.length - 2).reverse_each do |i|
    if ratings[i] > ratings[i + 1]
      result[i] = [result[i], result[i + 1] + 1].max
    end
  end
  result.sum
end


ratings1 = [1, 0, 2] # 5 ## 2, 1, 2
ratings2 = [1, 2, 2] # 4 ## 1, 2, 1
ratings3 = [60, 80, 100, 100, 100, 100, 100] # 10 ## 1, 2, 3, 1, 1, 1, 1
ratings4 = [1, 3, 2, 2, 1] # 7 ## 1,3,1,1,1
ratings5 = [1, 2, 87, 87, 87, 2, 1] # 13 # 1,2,3,1,2,3,1

print(candy(ratings1), " --- expected: [2, 1, 2] \n")
print(candy(ratings2), " --- expected: [1, 2, 1] \n")
print(candy(ratings3), " --- expected: [1, 2, 3, 1, 1, 1, 1] \n")
print(candy(ratings4), " --- expected: [1,3,1,1,1] \n")
print(candy(ratings5), " --- expected: [1,2,3,1,2,3,1] \n")
