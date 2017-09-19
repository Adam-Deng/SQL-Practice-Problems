57.            Customers with multiple orders in 5 day period, version 2

There’s another way of solving the problem above, using Window functions. We would like to see the following results.

Expected Results

CustomerID OrderDate  NextOrderDate DaysBetweenOrders
---------- ---------- ------------- -----------------
ANTON      2015-09-22 2015-09-25    3
AROUT      2015-11-14 2015-11-17    3
BERGS      2014-08-12 2014-08-14    2
BERGS      2015-02-12 2015-02-13    1
BERGS      2016-02-03 2016-02-06    3
BONAP      2015-11-05 2015-11-06    1
BONAP      2016-02-05 2016-02-09    4
BONAP      2016-03-06 2016-03-11    5
BOTTM      2015-01-10 2015-01-10    0
BOTTM      2016-03-12 2016-03-13    1
BOTTM      2016-03-25 2016-03-27    2
BOTTM      2016-04-23 2016-04-24    1
 
... (skipping some rows)
 
SAVEA      2016-03-27 2016-03-30    3
SAVEA      2016-04-17 2016-04-17    0
SEVES      2015-12-26 2015-12-30    4
SUPRD      2016-01-20 2016-01-22    2
SUPRD      2016-04-20 2016-04-21    1
TRADH      2016-01-13 2016-01-15    2
TRADH      2016-01-15 2016-01-19    4
TRAIH      2015-06-19 2015-06-23    4
VICTE      2015-12-31 2016-01-05    5
VICTE      2016-01-21 2016-01-23    2
VINET      2015-11-11 2015-11-12    1
WARTH      2015-01-13 2015-01-16    3
WELLI      2015-12-30 2016-01-01    2
WELLI      2016-02-20 2016-02-24    4
WHITC      2015-10-06 2015-10-08    2
WILMK      2016-02-06 2016-02-10    4
 
(69 row(s) affected)

