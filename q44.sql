44.           Late orders vs. total orders - missing employee

There's' an employee missing in the answer from the problem above. Fix the SQL to show all 
employees who have taken orders.

Expected Result

EmployeeID  LastName             AllOrders   LateOrders
----------- -------------------- ----------- -----------
1           Davolio              123         3
2           Fuller               96          4
3           Leverling            127         5
4           Peacock              156         10
5           Buchanan             42          NULL
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

SELECT E.EmployeeID, E.LastName, AllOrder.TotalOrder AS AllOrders, LateOrder.LateOrders AS
LateOrders
FROM Employees AS E
INNER JOIN AllOrder 
ON E.EmployeeID = AllOrder.EmployeeID
LEFT JOIN LateOrder
ON E.EmployeeID = LateOrder.EmployeeID