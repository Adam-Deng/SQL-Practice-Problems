31.             Customers with no orders for EmployeeID 4

One employee (Margaret Peacock, EmployeeID 4) has placed the most orders. However, there are 
some customers who've' never placed an order with her. Show only those customers who have never
 placed an order with her.

Expected Result

CustomerID CustomerID
---------- ----------
SEVES      NULL
THEBI      NULL
LAZYK      NULL
GROSR      NULL
PARIS      NULL
FISSA      NULL
SPECD      NULL
LAUGB      NULL
PRINI      NULL
VINET      NULL
FRANR      NULL
CONSH      NULL
NORTS      NULL
PERIC      NULL
DUMON      NULL
SANTG      NULL
 
(16 row(s) affected)


SELECT C.CustomerID, O.CustomerID
FROM Customers AS C 
LEFT JOIN orders AS O
ON C.CustomerID = O.CustomerID
AND O.EmployeeID = 4
WHERE O.CustomerID IS NULL