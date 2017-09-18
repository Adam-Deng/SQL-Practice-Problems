45.           Late orders vs. total orders - fix null

Continuing on the answer for above query, let's' fix the results for row 5 - Buchanan. He
should have a 0 instead of a Null in LateOrders.

Expected Result

EmployeeID  LastName             AllOrders   LateOrders
----------- -------------------- ----------- -----------
1           Davolio              123         3
2           Fuller               96          4
3           Leverling            127         5
4           Peacock              156         10
5           Buchanan             42          0
6           Suyama               67          3
7           King                 72          4
8           Callahan             104         5
9           Dodsworth            43          5
 
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
IFNULL(LateOrder.LateOrders, 0) AS LateOrders
FROM Employees AS E
INNER JOIN AllOrder 
ON E.EmployeeID = AllOrder.EmployeeID
LEFT JOIN LateOrder
ON E.EmployeeID = LateOrder.EmployeeID