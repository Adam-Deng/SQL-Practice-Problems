54.           Countries with suppliers or customers - version 3

The output of the above is improved, but it’s still not ideal

What we’d really like to see is the country name, the total suppliers, and the total 
customers.

Expected Result

Country         TotalSuppliers TotalCustomers
--------------- -------------- --------------
Argentina       0              3
Australia       2              0
Austria         0              2
Belgium         0              2
Brazil          1              9
Canada          2              3
Denmark         1              2
Finland         1              2
France          3              11
Germany         3              11
Ireland         0              1
Italy           2              3
Japan           2              0
Mexico          0              5
Netherlands     1              0
Norway          1              1
Poland          0              1
Portugal        0              2
Singapore       1              0
Spain           1              5
Sweden          2              2
Switzerland     0              2
UK              2              7
USA             4              13
Venezuela       0              4
 
(25 row(s) affected)
 

WITH SupplierCountry AS (
SELECT Country, COUNT(*) AS Total
FROM suppliers
GROUP BY Country
),

CustomerCountry AS (
SELECT Country, COUNT(*) AS Total
FROM customers
GROUP BY Country
)

SELECT IFNULL(SupplierCountry.Country, CustomerCountry.Country) AS Country,
IFNULL(SupplierCountry.Total, 0) AS TotalSuppliers,
IFNULL(CustomerCountry.Total, 0) AS TotalCustomers
FROM SupplierCountry
FULL OUTER JOIN CustomerCountry
ON SupplierCountry.Country = SupplierCountry.Country