33.            High-value customers - total orders

The manager has changed his mind. Instead of requiring that customers have at least one individual orders totaling $10,000 or more, he wants to define high-value customers as those who have orders totaling $15,000 or more in 2016. How would you change the answer to the problem above?


Expected Result

CustomerID CompanyName                              TotalOrderAmount
---------- ---------------------------------------- ---------------------
SAVEA      Save-a-lot Markets                       42806.25
ERNSH      Ernst Handel                             42598.90
QUICK      QUICK-Stop                               40526.99
HANAR      Hanari Carnes                            24238.05
HUNGO      Hungry Owl All-Night Grocers             22796.34
RATTC      Rattlesnake Canyon Grocery               21725.60
KOENE      Königlich Essen                          20204.95
FOLKO      Folk och fä HB                           15973.85
WHITC      White Clover Markets                     15278.90
 
(9 row(s) affected)


SELECT C.CustomerID, C.CompanyName, SUM(OD.Qantity * OD.UnitPrice) AS TotalOrderAmount
FROM customers AS C
INNER JOIN orders AS O
ON O.CustomerID = C.CustomerID
INNER JOIN OrderDetails AS OD 
ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate) = 2016
GROUP BY C.CustomerID, C.CompanyName
HAVING TotalOrderAmount >= 10000
ORDER BY TotalOrderAmount DESC