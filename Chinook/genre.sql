CREATE TABLE genre(
genreid INT PRIMARY KEY,
name VARCHAR(255)
);

/* 
Retrieve all unique genres in the database.
*/

SELECT name
FROM genre