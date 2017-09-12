17.             Contact titles for customers

Show a list of all the different values in the Customers table for ContactTitles. Also include
 a count for each ContactTitle.

This is similar in concept to the previous question “Countries where there are customers”, 
except we now want a count for each ContactTitle.


Expected Results

ContactTitle                   TotalContactTitle
------------------------------ -----------------
Owner                          17
Sales Representative           17
Marketing Manager              12
Sales Manager                  11
Accounting Manager             10
Sales Associate                7
Marketing Assistant            6
Sales Agent                    5
Assistant Sales Agent          2
Order Administrator            2
Assistant Sales Representative 1
Owner/Marketing Assistant      1
 
(12 row(s) affected)


select ContactTitle, count(*) as TotalContactTitle
from customers
group by ContactTitle
Order by TotalContactTitle DESC