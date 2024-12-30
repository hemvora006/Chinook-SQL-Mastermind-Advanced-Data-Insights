CREATE TABLE invoice(
invoiceid INT PRIMARY KEY,
customerid INT,
FOREIGN KEY (customerid) REFERENCES customer(customerid),
invoice_date DATE,
billing_address VARCHAR(255),
billing_city VARCHAR(255),
billing_state VARCHAR(255),
billing_country VARCHAR(255),
billing_postalcode VARCHAR(255),
total INT
);

/*
Find the total sales for each year.
*/

SELECT 
	SUM(total) as 'Total Sales'
FROM
	invoice;
        
/*
Show all invoices where the billing country 
is different from the customer's country.
*/

SELECT
        c.firstname,
        c.lastname,
        c.country,
        i.billing_country
FROM
        invoice i 
JOIN
        customer c ON i.customerid=c.customerid
WHERE
        c.country<>i.billing_country;

/*
Find the average invoice total per customer 
and list customers whose average invoice total exceeds $5.  
*/

SELECT
    c.customerid AS CustomerID,
    c.firstname AS FirstName,
    c.lastname AS LastName,
    AVG(i.total) AS AverageTotal,
    MIN(i.invoiceid) AS InvoiceID
FROM 
    invoice i
JOIN
    customer c ON i.customerid = c.customerid
GROUP BY
    c.customerid, c.firstname, c.lastname
HAVING
    AverageTotal BETWEEN 5 AND 100;
    
/*
Find the invoice with the maximum number of 
line items
*/

SELECT
        i.invoiceid,
        COUNT(il.invoiceid) AS TotalLineItems
FROM
        invoice i
JOIN
        invoiceline il ON i.invoiceid=il.invoiceid
GROUP BY
        il.invoiceid
ORDER BY 
        TotalLineItems DESC
LIMIT 1;

/*
Generate a report of monthly revenue trends 
for the past year
*/

SELECT
        YEAR(i.invoice_date) AS Year,
        MONTHNAME(i.invoice_date) AS Month,
        SUM(i.total) AS TotalSales
FROM
        invoice i
GROUP BY
        Month, Year;

/*
Display the top 5 countries by total sales 
and the percentage of total sales contributed 
by each country
*/

WITH CountrySales AS(
        SELECT
                SUM(i.total) AS CountryTotalSales,
                i.billing_country
        FROM
                invoice i
        GROUP BY
                i.billing_country
),
GlobalSales AS(
        SELECT
                SUM(i.total) AS GlobalSales
        FROM
                invoice i
)
SELECT
        cs.billing_country,
        cs.CountryTotalSales,
        ROUND((cs.CountryTotalSales/gs.GlobalSales)*100, 2) AS TotalPercentageContribution
FROM
        CountrySales cs
CROSS JOIN
        GlobalSales gs
ORDER BY
        cs.CountryTotalSales DESC
LIMIT 5;






























































































































