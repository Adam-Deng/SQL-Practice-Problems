25.            High freight charges

Some of the countries we ship to have very high freight charges. We'd' like to investigate some more shipping options for our customers, to be able to offer them lower freight charges. Return the three ship countries with the highest average freight overall, in descending order by average freight.

Expected Results

ShipCountry     AverageFreight
--------------- ---------------------
Austria         184.7875
Ireland         145.0126
USA             112.8794
 
(3 row(s) affected)

SELECT ShipCountry, AVG(freight) as AverageFreight
FROM order
GROUP BY ShipCountry
ORDER BY AverageFreight DESC
LIMIT 3