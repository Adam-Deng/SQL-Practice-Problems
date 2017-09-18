47.           Late orders vs. total orders - fix decimal

So now for the PercentageLateOrders, we get a decimal value like we should. But to make the 
output easier to read, let's' cut the PercentLateOrders off at 2 digits to the right of the 
decimal point.

Expected Result

EmployeeID  LastName             AllOrders   LateOrders  PercentLateOrders
----------- -------------------- ----------- ----------- -------------------
1           Davolio              123         3           0.02
2           Fuller               96          4           0.04
3           Leverling            127         5           0.04
4           Peacock              156         10          0.06
5           Buchanan             42          0           0.00
6           Suyama               67          3           0.04
7           King                 72          4           0.06
8           Callahan             104         5           0.05
9           Dodsworth            43          5           0.12
 
(9 row(s) affected)

WITH LateOrder AS (
SELECT EmployeeID, COUNT(*) AS LateOrders
FROM orders
WHERE RequireDate <= ShippedDate
GROUP BY EmployeeID
),

WITH AllOrder AS(
SELECT EmployeeID, COUNT(*) AS TotalOrder
FROM orders
GROUP BY EmployeeID
)

SELECT E.EmployeeID, E.LastName, AllOrder.TotalOrder AS AllOrders, 
IFNULL(LateOrder.LateOrders, 0) AS LateOrders,
ROUND(IFNULL(LateOrder.LateOrders, 0) * 1.00 / AllOrders, 2) AS PercentLateOrders
FROM Employees AS E
INNER JOIN AllOrder 
ON E.EmployeeID = AllOrder.EmployeeID
LEFT JOIN LateOrder
ON E.EmployeeID = LateOrder.EmployeeID