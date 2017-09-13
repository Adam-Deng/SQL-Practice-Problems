30.            Customers with no orders

There are some customers who have never actually placed an order. Show these customers.

Expected Results

Customers_CustomerID Orders_CustomerID
-------------------- -----------------
FISSA                NULL
PARIS                NULL
 
(2 row(s) affected)

SELECT C.CustomerID AS Customers_CustomerID, O.CustomerID AS Orders_CustomerID
FROM Customers AS C 
LEFT JOIN orders AS O
ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL