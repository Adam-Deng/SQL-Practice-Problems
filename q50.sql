50.            Customer grouping with percentage

Based on the above query, show all the defined CustomerGroups, and the percentage in each. 
Sort by the total in each group, in descending order.

Expected Result

CustomerGroup TotalInGroup PercentageInGroup
------------- ------------ ---------------------------------------
Medium        35           0.432098765432
Low           20           0.246913580246
High          13           0.160493827160
Very High     13           0.160493827160
 
(4 row(s) affected)
 

WITH Orderin2016 AS (
SELECT C.CustomerID, C.CompanyName, SUM(OD.Quantity * OD.UnitPrice) AS TotalOrderAmount
FROM customers AS C
INNER JOIN orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN OrderDetails AS OD 
ON O.OrderID = OD.OrderID
WHERE YEAR(OrderDate) = 2016
GROUP BY C.CustomerID, C.CompanyName
),
CustomerGrouping AS(
SELECT CustomerID, CompanyName, TotalOrderAmount, CustomerGroup AS
CASE 
WHEN TotalOrderAmount >=0 AND TotalOrderAmount < 1000 THEN 'Low'
WHEN TotalOrderAmount >= 1000 AND TotalOrderAmount < 5000 THEN 'Medium'
WHEN TotalOrderAmount >= 5000 AND TotalOrderAmount < 10000 THEN 'High'
WHEN TotalOrderAmount >= 10000 THEN 'VeryHigh'
END
FROM Orderin2016
)

SELECT CustomerGroup, COUNT(*) AS TotalInGroup,
COUNT(*) * 1.0 /(SELECT COUNT(*) FROM CustomerGrouping) AS PercentageInGroup
FROM CustomerGrouping
GROUP BY CustomerGroup
ORDER BY TotalInGroup DESC 