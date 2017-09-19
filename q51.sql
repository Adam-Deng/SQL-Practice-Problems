51.             Customer grouping - flexible

Andrew, the VP of Sales is still thinking about how best to group customers, and define low, 
medium, high, and very high value customers. He now wants complete flexibility in grouping 
the customers, based on the dollar amount they've ordered. He doesn’t' want to have to edit SQL
 in order to change the boundaries of the customer groups.

How would you write the SQL?

There's' a table called CustomerGroupThreshold that you will need to use. Use only orders 
from 2016.

Expected Result

(The expected results are the same as for the original problem, it’s just that we’re 
	getting the answer differently.)

 
CustomerID CompanyName                              TotalOrderAmount      CustomerGroupName
---------- ---------------------------------------- --------------------- --------------------
ALFKI      Alfreds Futterkiste                      2302.20               Medium
ANATR      Ana Trujillo Emparedados y helados       514.40                Low
ANTON      Antonio Moreno Taquería                  660.00                Low
AROUT      Around the Horn                          5838.50               High
BERGS      Berglunds snabbköp                       8110.55               High
BLAUS      Blauer See Delikatessen                  2160.00               Medium
BLONP      Blondesddsl père et fils                 730.00                Low
BOLID      Bólido Comidas preparadas                280.00                Low
BONAP      Bon app''                                 7185.90               High
BOTTM      Bottom-Dollar Markets                    12227.40              Very High
BSBEV      B's' Beverages                            2431.00               Medium
CACTU      Cactus Comidas para llevar               1576.80               Medium
CHOPS      Chop-suey Chinese                        4429.40               Medium
COMMI      Comércio Mineiro                         513.75                Low
 
... (skipping some rows)
 
SPLIR      Split Rail Beer & Ale                    1117.00               Medium
SUPRD      Suprêmes délices                         11862.50              Very High
THEBI      The Big Cheese                           69.60                 Low
THECR      The Cracker Box                          326.00                Low
TOMSP      Toms Spezialitäten                       910.40                Low
TORTU      Tortuga Restaurante                      1874.50               Medium
TRADH      Tradição Hipermercados                   4401.62               Medium
TRAIH      Trail's' Head Gourmet Provisioners        237.90                Low
VAFFE      Vaffeljernet                             4333.50               Medium
VICTE      Victuailles en stock                     3022.00               Medium
WANDK      Die Wandernde Kuh                        1564.00               Medium
WARTH      Wartian Herkku                           300.00                Low
WELLI      Wellington Importadora                   1245.00               Medium
WHITC      White Clover Markets                     15278.90              Very High
WILMK      Wilman Kala                              1987.00               Medium
WOLZA      Wolski  Zajazd                           1865.10               Medium
 
(81 row(s) affected)

WITH Orderin2016 AS (
SELECT C.CustomerID, C.CompanyName, SUM(OD.Quantity * OD.UnitPrice) AS TotalOrderAmount
FROM customers AS C
INNER JOIN orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN OrderDetails AS OD 
ON O.OrderID = OD.OrderID
WHERE YEAR(OrderDate) = 2016
GROUP BY C.CustomerID, C.CompanyName
)

SELECT CustomerID, CompanyName, TotalOrderAmount, CustomerGroupName
FROM Orderin2016
INNER JOIN CustomerGroupThreshold
ON Orderin2016.TotalOrderAmount BETWEEN CustomerGroupThreshold.RangeBottom
AND CustomerGroupThreshold.RangeTop
ORDER BY CustomerID