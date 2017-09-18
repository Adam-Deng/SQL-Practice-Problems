36.            Orders with many line items

The Northwind mobile app developers are testing an app that customers will use to show orders.
 In order to make sure that even the largest orders will show up correctly on the app, they'd'
  like some samples of orders that have lots of individual line items. Show the 10 orders with
   the most line items, in order of total line items.

Expected Result

OrderID     TotalOrderDetails
----------- -----------------
11077       25
10979       6
10657       6
10847       6
10845       5
10836       5
10714       5
10670       5
10691       5
10698       5
 
(10 row(s) affected)

SELECT O.OrderID, COUNT(O.OrderID) AS TotalOrderDetails
FROM Orders AS O
INNER JOIN OrderDetails AS OD
ON O.OrderID = OD.OrderID
GROUP BY O.OrderID
ORDER BY TotalOrderDetails DESC
