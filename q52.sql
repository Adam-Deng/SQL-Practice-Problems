52.            Countries with suppliers or customers

Some Northwind employees are planning a business trip, and would like to visit as many 
suppliers and customers as possible. For their planning, they’d like to see a list of all 
countries where suppliers and/or customers are based.

Expected Results

Country
---------------
Argentina
Australia
Austria
Belgium
Brazil
Canada
Denmark
Finland
France
Germany
Ireland
Italy
Japan
Mexico
Netherlands
Norway
Poland
Portugal
Singapore
Spain
Sweden
Switzerland
UK
USA
Venezuela
 
(25 row(s) affected)

SELECT Country FROM customers
UNION
SELECT Country FROM suppliers
ORDER BY Country