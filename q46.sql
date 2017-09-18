46.           Late orders vs. total orders - percentage

Now we want to get the percentage of late orders over total orders.

Expected Result

EmployeeID  LastName             AllOrders   LateOrders  PercentLateOrders
----------- -------------------- ----------- ----------- -------------------
1           Davolio              123         3           0.0243902439024
2           Fuller               96          4           0.0416666666666
3           Leverling            127         5           0.0393700787401
4           Peacock              156         10          0.0641025641025
5           Buchanan             42          0           0.0000000000000
6           Suyama               67          3           0.0447761194029
7           King                 72          4           0.0555555555555
8           Callahan             104         5           0.0480769230769
9           Dodsworth            43          5           0.1162790697674
 
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
(IFNULL(LateOrder.LateOrders, 0) * 1.00) / AllOrders AS PercentLateOrders
FROM Employees AS E
INNER JOIN AllOrder 
ON E.EmployeeID = AllOrder.EmployeeID
LEFT JOIN LateOrder
ON E.EmployeeID = LateOrder.EmployeeID