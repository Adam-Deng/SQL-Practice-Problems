43.           Late orders vs. total orders

Andrew, the VP of sales, has been doing some more thinking some more about the problem of late
 orders. He realizes that just looking at the number of orders arriving late for each 
 salesperson isn't' a good idea. It needs to be compared against the total number of orders
  per salesperson. Return results like the following:

Expected Result

EmployeeID  LastName             AllOrders   LateOrders
----------- -------------------- ----------- -----------
1           Davolio              123         3
2           Fuller               96          4
3           Leverling            127         5
4           Peacock              156         10
6           Suyama               67          3
7           King                 72          4
8           Callahan             104         5
9           Dodsworth            43          5
 
(8 row(s) affected)

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
INNER JOIN LateOrder
ON E.EmployeeID = LateOrder.EmployeeID 