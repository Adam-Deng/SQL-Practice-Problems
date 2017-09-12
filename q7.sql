7.                 Products with “queso” in ProductName

In the products table, we’d like to see the ProductID and ProductName for those products 
where the ProductName includes the string “queso”.

Expected Results

ProductID   ProductName
----------- ----------------------------------------
11          Queso Cabrales
12          Queso Manchego La Pastora
 
(2 row(s) affected)

Select ProductID, ProductName
From products
where ProductName like '%queso%'