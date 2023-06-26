1. Retrieve the total profit for each category:
SELECT Category, SUM(Profit) AS TotalProfit
FROM order_details
GROUP BY Category;

2. Retrieve the average sales target for each category:
SELECT Category, AVG(Target) AS AverageSalesTarget
FROM sales_target
GROUP BY Category;

3. Retrieve the total amount and profit for each category:
SELECT Category, SUM(Amount) AS TotalAmount, SUM(Profit) AS TotalProfit
FROM ORDER_DETAILS
GROUP BY Category;

4. Retrieve the average quantity and profit for each sub-category:
SELECT Sub-Category, AVG(Quantity) AS AverageQuantity, AVG(Profit) AS AverageProfit
FROM ORDER_DETAILS
GROUP BY Sub-Category;

5. Name of state with maximum profit in Furniture category
SELECT ol.State, SUM(od.Profit) AS TotalProfit
FROM ORDER_LIST ol
JOIN ORDER_DETAILS od ON ol.Order_ID = od.Order_ID
WHERE od.Category = 'Furniture'
GROUP BY ol.State
ORDER BY TotalProfit DESC
limit 1;

6. Retrieve the order details including Order ID, Customer Name, State, City, Category, Sub-Category, total quantity, and total amount for each order, considering only orders with a total quantity greater than 10, and order the results by the total amount in descending order.
SELECT ol.OrderID, ol.CustomerName, ol.State, ol.City, od.Category, od.`Sub-Category`, SUM(od.Quantity) AS TotalQuantity, SUM(od.Amount) AS TotalAmount
FROM ORDER_LIST ol
JOIN ORDER_DETAILS od ON ol.OrderID = od.OrderID
GROUP BY ol.OrderID, ol.CustomerName, ol.State, ol.City, od.Category, od.`Sub-Category`
HAVING SUM(od.Quantity) > 10
ORDER BY TotalAmount DESC;

7. Calculate the average profit margin (as a percentage) for each category
SELECT Category, AVG(Profit / Amount) * 100 AS AvgProfitMargin
FROM ORDER_DETAILS
GROUP BY Category;

8. Find the customer from which the highest profit was made:
SELECT ol.CustomerName, SUM(od.Profit) AS TotalProfit
FROM ORDER_LIST ol
JOIN ORDER_DETAILS od ON ol.Order_ID = od.Order_ID
GROUP BY ol.CustomerName
ORDER BY SUM(od.Profit) DESC
FETCH FIRST 1 ROWS ONLY;

9. Find the maximum sales target among all categories:
SELECT MAX(Target) AS MaxTarget
FROM SALES_TARGET;

10. Retrieve the profit and amount for sales targets greater than 14000 for each category
SELECT od.Category, od.Profit, od.Amount
FROM ORDER_DETAILS od
JOIN SALES_TARGET st ON od.Category = st.Category
WHERE st.Target > 14000;




