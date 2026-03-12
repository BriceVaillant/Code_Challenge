-- 1581. Customer Who Visited but Did Not Make Any Transactions
-- here left join take every record from visits and match it with transactions.
-- WHERE throw away all the records that have a transaction_id.ABORT

-- GROUP BY "Don't give me one giant list of visits; instead, create a little bucket for each customer_id and toss their specific 'empty' visits into that bucket."

-- COUNT(*) looks inside each bucket and counts how many rows are in it.

SELECT v.customer_id, COUNT(*) as 'count_no_trans' 
    FROM visits v 
    LEFT JOIN transactions t 
        ON t.visit_id = v.visit_id
    WHERE t.transaction_id is null 
GROUP BY v.customer_id;

-- 197. Rising Temperature

WITH temp_table as 
(
    SELECT id, 
    temperature as today_temp, 
    recordDate as today_date, 
    -- LAG() is a window function that allows you to access data from the previous row in the result set without needing to self-join the table.
    LAG(temperature) OVER (ORDER BY recordDate) as previous_temp,
    LAG(recordDate) OVER (ORDER BY recordDate) as previous_date
    FROM weather
)
SELECT id from temp_table 
WHERE today_temp > previous_temp 
-- DATEDIFF() is a function that calculates the difference in days between two dates. 
-- In this case, it checks if the difference between today_date and previous_date is equal to 1, meaning that the temperature increased from one day to the next.
AND DATEDIFF(today_date, previous_date) = 1



