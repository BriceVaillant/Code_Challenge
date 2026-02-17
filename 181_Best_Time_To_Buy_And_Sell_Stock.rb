def max_profit(prices)
  max_profit = 0
  min_price = prices[0]

  (1...prices.length).each do |k|
    if prices[k] < min_price
      min_price = prices[k]
    elsif max_profit < prices[k] - min_price
      max_profit = prices[k] - min_price
    end
  end
  return max_profit
end

prices1 = [7, 1, 5, 3, 6, 4]
prices2 = [7, 6, 4, 3, 1]
prices3 = [1, 2]
p(max_profit(prices1))
p(max_profit(prices2))
p(max_profit(prices3))

# Input: prices = [7,1,5,3,6,4]
# Output: 5
# Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
# Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
# Example 2:

# Input: prices = [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transactions are done and the max profit = 0.
