/*
 
 EASY: Best Time to Buy and Sell Stock II
 Leetcode: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/564/
 
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day.

 On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time.
 However, you can buy it then immediately sell it on the same day.

 Find and return the maximum profit you can achieve.

  

 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Total profit is 4 + 3 = 7.
 Example 2:

 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Total profit is 4.
 Example 3:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.

 
 */

func maxProfit(prices: [Int]) -> Int{
    var totalProfit = 0
    for index in 1..<prices.count {
        if prices[index] > prices[index - 1] {
            let profit = prices[index] - prices[index - 1]
            totalProfit += profit
        }
    }
    return totalProfit
}


/*
    Time Complexity: O(N) Linear time
    Space Complexity: O(1) Constant space
 */
    


// Tests
assert(7 == maxProfit(prices: [7,1,5,3,6,4]))
assert(4 == maxProfit(prices: [1,2,3,4,5]))
assert(0 == maxProfit(prices: [7,6,4,3,1]))


/*
 Explanation:
 Ides is simple: buy on low, sell on high.
 So, we check ever price and compare it with previous price.
 If it's higher that previous price, then we sell.
 Simple solution with constant space and linear time.
 */
