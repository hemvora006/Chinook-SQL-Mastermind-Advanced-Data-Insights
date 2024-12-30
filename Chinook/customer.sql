CREATE TABLE customer(
customerid INT PRIMARY KEY,
firstname VARCHAR(255) NOT NULL,
lastname VARCHAR(255) NOT NULL,
company VARCHAR(255),
address VARCHAR(255) NOT NULL,
city VARCHAR(255),
state VARCHAR(50),
country VARCHAR(25),
postalcode VARCHAR(255),
phone VARCHAR(255),
fax VARCHAR(255),
email VARCHAR(255),
supportrepid INT
);

/*
Find the total number of customers in each country.
*/

SELECT 
        country as 'Country',
        COUNT(*) as 'Total Customer from each Country'
FROM 
        customer
GROUP BY
        country;

/*
List all customers who have never made a purchase
*/

SELECT
        c.firstname,
        c.lastname,
        c.customerid
FROM
        customer c
LEFT JOIN
        invoice i ON c.customerid=i.customerid
WHERE
        i.invoiceid IS NULL;

/*
Write a query to simulate a ranking system 
for customers based on their total purchases, 
categorized into Gold, Silver, and Bronze tiers
*/

SELECT 
    c.firstname,
    c.lastname,
    SUM(i.total) AS TotalPurchases,
    CASE 
        WHEN SUM(i.total) >= 45 THEN 'Gold'
        WHEN SUM(i.total) >= 40 THEN 'Silver'
        ELSE 'Bronze'
    END AS CustomerTier
FROM 
    customer c
JOIN 
    invoice i ON c.customerId = i.customerId
GROUP BY 
    c.customerid, c.firstname, c.lastname
ORDER BY 
    TotalPurchases DESC;



































































