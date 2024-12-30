CREATE TABLE invoiceline(
invoicelineid INT PRIMARY KEY,
invoiceid INT,
track_id INT,
unit_price INT,
quantity INT,
FOREIGN KEY (invoiceid) REFERENCES invoice(invoiceid)
);


/*
List the top 5 customers who have spent the most money.
*/

SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS TotalSpent
FROM 
    Customer c
JOIN 
    Invoice i ON c.CustomerId = i.CustomerId
GROUP BY 
    c.CustomerId
ORDER BY 
    TotalSpent DESC
LIMIT 5;