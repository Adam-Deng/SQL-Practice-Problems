4.                 Sales Representatives in the United States

Now we’d like to see the same columns as above, but only for those employees that both have 
the title of Sales Representative, and also are in the United States.

Expected Results

FirstName  LastName             HireDate
---------- -------------------- -----------------------
Nancy      Davolio              2010-05-01 00:00:00.000
Janet      Leverling            2010-04-01 00:00:00.000
Margaret   Peacock              2011-05-03 00:00:00.000
 
(3 row(s) affected)


Select FirstName, LastName, HireDate
From employees
Where title = 'Sales Representative'
and Country = 'USA'