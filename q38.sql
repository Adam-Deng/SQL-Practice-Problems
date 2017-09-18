38.            Orders - accidental double-entry

Janet Leverling, one of the salespeople, has come to you with a request. She thinks that she 
accidentally double-entered a line item on an order, with a different ProductID, but the same
 quantity. She remembers that the quantity was 60 or more. Show all the OrderIDs with line 
 items that match this, in order of OrderID.

Expected Result

OrderID
-----------
10263
10263
10990
10658
11030
 
(5 row(s) affected)

SELECT OrderID
FROM OrderDetails
WHERE quantity >= 60
GROUP BY OrderID, quantity
HAVING COUNT(*) > 1