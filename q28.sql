28.           High freight charges - last year

We'r'e continuing to work on high freight charges. We now want to get the three ship countries
 with the highest average freight charges. But instead of filtering for a particular year, we
  want to use the last 12 months of order data, using as the end date the last OrderDate in 
  Orders.


Expected Results

ShipCountry     AverageFreight
--------------- ---------------------
Ireland         200.21
Austria         186.4596
USA             119.3032
 
(3 row(s) affected)


SELECT ShipCountry, AVE(freight) AS AverageFreight
FROM Orders
WHERE OrderDate >= DATE_SUB (SELECT MAX(OrderDate) FROM Orders, INTERVAL 1 year)
GROUP BY ShipCountry
ORDER BY AverageFreight DESC 