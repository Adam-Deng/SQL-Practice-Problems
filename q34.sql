34.           High-value customers - with discount

Change the above query to use the discount when calculating high-value customers. Order by the total amount which includes the discount.

Expected Result

CustomerID CompanyName                    TotalsWithoutDiscount TotalsWithDiscount
---------- ------------------------------ --------------------- ----------------------
ERNSH      Ernst Handel                   42598.90              41210.6500244141
QUICK      QUICK-Stop                     40526.99              37217.3150024414
SAVEA      Save-a-lot Markets             42806.25              36310.1097793579
HANAR      Hanari Carnes                  24238.05              23821.1999893188
RATTC      Rattlesnake Canyon Grocery     21725.60              21238.2704410553
HUNGO      Hungry Owl All-Night Grocers   22796.34              20402.119934082
KOENE      Königlich Essen                20204.95              19582.7739868164
WHITC      White Clover Markets           15278.90              15278.8999862671
FOLKO      Folk och fä HB                 15973.85              13644.0674972534
SUPRD      Suprêmes délices               11862.50              11644.5999984741
BOTTM      Bottom-Dollar Markets          12227.40              11338.5500488281
 
(11 row(s) affected)

SELECT C.CustomerID, C.CompanyName, SUM(OD.Qantity * OD.UnitPrice) AS TotalsWithoutDiscount,
SUM(OD.Qantity * OD.UnitPrice * (1-OD.discount)) AS TotalsWithDiscount
FROM customers AS C
INNER JOIN orders AS O
ON O.CustomerID = C.CustomerID
INNER JOIN OrderDetails AS OD 
ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate) = 2016
GROUP BY C.CustomerID, C.CompanyName
HAVING TotalsWithDiscount >= 10000
ORDER BY TotalsWithDiscount DESC