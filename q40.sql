40.           Orders - accidental double-entry details, derived table

Here's' another way of getting the same results as in the previous problem, using a derived
 table instead of a CTE. However, there's' a bug in this SQL. It returns 20 rows instead of
  16. Correct the SQL.

Problem SQL:

Select
    OrderDetails.OrderID
    ,ProductID
    ,UnitPrice
    ,Quantity
    ,Discount
From OrderDetails
    Join (
        Select
            OrderID
        From OrderDetails
        Where Quantity >= 60
        Group By OrderID, Quantity
        Having Count(*) > 1
    )  PotentialProblemOrders
        on PotentialProblemOrders.OrderID = OrderDetails.OrderID
Order by OrderID, ProductID



Correct Solution:

Select
    OrderDetails.OrderID
    ,ProductID
    ,UnitPrice
    ,Quantity
    ,Discount
From OrderDetails
    Join (
        Select DISTINCT
            OrderID
        From OrderDetails
        Where Quantity >= 60
        Group By OrderID, Quantity
        Having Count(*) > 1
    )  PotentialProblemOrders
        on PotentialProblemOrders.OrderID = OrderDetails.OrderID
Order by OrderID, ProductID