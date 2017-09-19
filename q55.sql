55.            First order in each country

Looking at the Orders table—we’d like to show details for each order that was the first in 
that particular country, ordered by OrderID.

So, we need one row per ShipCountry, and CustomerID, OrderID, and OrderDate should be of the 
first order from that country.

Expected Results

ShipCountry     CustomerID OrderID     OrderDate
--------------- ---------- ----------- ----------
Argentina       OCEAN      10409       2015-01-09
Austria         ERNSH      10258       2014-07-17
Belgium         SUPRD      10252       2014-07-09
Brazil          HANAR      10250       2014-07-08
Canada          MEREP      10332       2014-10-17
Denmark         SIMOB      10341       2014-10-29
Finland         WARTH      10266       2014-07-26
France          VINET      10248       2014-07-04
Germany         TOMSP      10249       2014-07-05
Ireland         HUNGO      10298       2014-09-05
Italy           MAGAA      10275       2014-08-07
Mexico          CENTC      10259       2014-07-18
Norway          SANTG      10387       2014-12-18
Poland          WOLZA      10374       2014-12-05
Portugal        FURIB      10328       2014-10-14
Spain           ROMEY      10281       2014-08-14
Sweden          FOLKO      10264       2014-07-24
Switzerland     CHOPS      10254       2014-07-11
UK              BSBEV      10289       2014-08-26
USA             RATTC      10262       2014-07-22
Venezuela       HILAA      10257       2014-07-16
 
(21 row(s) affected)

WITH OrdersByCountry AS (
SELECT ShipCountry, CustomerID, OrderID, OrderDate,
ROW_NUMBER() OVER (PARTITION BY ShipCountry ORDER BY ShipCountry, OrderID) AS RowNumberPerCountry
FROM Orders
)

SELECT ShipCountry, CustomerID, OrderID, OrderDate
FROM OrdersByCountry
WHERE RowNumberPerCountry = 1
ORDER BY ShipCountry