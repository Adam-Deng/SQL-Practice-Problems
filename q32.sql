32.            High-value customers
We want to send all of our high-value customers a special VIP gift. We're' defining high-value
 customers as those who've' made at least 1 order with a total value (not including the 
 	discount) equal to $10,000 or more. We only want to consider orders made in the year 2016.

Expected Result

CustomerID CompanyName                              OrderID     TotalOrderAmount
---------- ---------------------------------------- ----------- ---------------------
QUICK      QUICK-Stop                               10865       17250.00
SAVEA      Save-a-lot Markets                       11030       16321.90
HANAR      Hanari Carnes                            10981       15810.00
KOENE      Königlich Essen                          10817       11490.70
RATTC      Rattlesnake Canyon Grocery               10889       11380.00
HUNGO      Hungry Owl All-Night Grocers             10897       10835.24
 
(6 row(s) affected)

SELECT C.CustomerID, C.CompanyName, O.OrderID, SUM(OD.Qantity * OD.UnitPrice) AS TotalOrderAmount
FROM customers AS C
INNER JOIN orders AS O
ON O.CustomerID = C.CustomerID
INNER JOIN OrderDetails AS OD 
ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate) = 2016
GROUP BY C.CustomerID, C.CompanyName, O.OrderID
HAVING TotalOrderAmount >= 10000
ORDER BY TotalOrderAmount DESC