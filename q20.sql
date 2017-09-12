20.            Categories, and the total products in each category
For this problem, we’d like to see the total number of products in each category. Sort the 
results by the total number of products, in descending order.

Expected Results

CategoryName    TotalProducts
--------------- -------------
Confections     13
Beverages       12
Condiments      12
Seafood         12
Dairy Products  10
Grains/Cereals  7
Meat/Poultry    6
Produce         5
 
(8 row(s) affected)

SELECT c.CategoryName, count(*) as TotalProducts
FROM Products as p
LEFT JOIN Categories as c
ON p.CategoryID = c.CategoryID
GROUP BY CategoryName
ORDER BY TotalProducts DESC