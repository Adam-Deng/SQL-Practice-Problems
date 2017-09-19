53.            Countries with suppliers or customers, version 2

The employees going on the business trip don’t want just a raw list of countries, they want 
more details. We’d like to see output like the below, in the Expected Results.

Expected Result

SupplierCountry CustomerCountry
--------------- ---------------
NULL            Argentina
Australia       NULL
NULL            Austria
NULL            Belgium
Brazil          Brazil
Canada          Canada
Denmark         Denmark
Finland         Finland
France          France
Germany         Germany
NULL            Ireland
Italy           Italy
Japan           NULL
NULL            Mexico
Netherlands     NULL
Norway          Norway
NULL            Poland
NULL            Portugal
Singapore       NULL
Spain           Spain
Sweden          Sweden
NULL            Switzerland
UK              UK
USA             USA
NULL            Venezuela
 
(25 row(s) affected)


Solution 1:

WITH SupplierCountry AS (
SELECT DISTINCT Country FROM suppliers
),

CustomerCountry AS (
SELECT DISTINCT Country FROM customers
)

SELECT SupplierCountry.Country AS SupplierCountry,
CustomerCountry.Country AS CustomerCountry
FROM SupplierCountry
FULL OUTER JOIN CustomerCountry
ON SupplierCountry.Country = CustomerCountry.Country



Solution 2:

SELECT SupplierCountry.Country AS SupplierCountry,
CustomerCountry.Country AS CustomerCountry
FROM (SELECT DISTINCT Country FROM suppliers) AS SupplierCountry
FULL OUTER JOIN (SELECT DISTINCT Country FROM customers) AS CustomerCountry
ON CustomerCountry.Country = SupplierCountry.Country 