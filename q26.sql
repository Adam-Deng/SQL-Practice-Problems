26.            High freight charges - 2015

We'r'e continuing on the question above on high freight charges. Now, instead of using all the orders we have, we only want to see orders from the year 2015.

Expected result

ShipCountry     AverageFreight
--------------- ---------------------
Austria         178.3642
Switzerland     117.1775
France          113.991
 
(3 row(s) affected)

SELECT ShipCountry, AVG(freight) AS AverageFreight
FROM orders
WHERE YEAR(OrderDate) = 2015
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
LIMIT 3