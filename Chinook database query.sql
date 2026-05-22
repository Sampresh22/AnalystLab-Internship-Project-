SELECT * FROM INFORMATION_SCHEMA.TABLES;

SELECT
c.FirstName,
c.LastName,
i.InvoiceDate,
i.Total

FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId;

SELECT TOP 10
c.FirstName,
c.LastName,
SUM(i.Total) AS TotalSpent

FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId

GROUP BY c.FirstName, c.LastName

ORDER BY TotalSpent DESC;

SELECT
g.Name AS Genre,
SUM(il.Quantity) AS TotalSold
FROM Genre g
INNER JOIN Track t
ON g.GenreId = t.GenreId
INNER JOIN InvoiceLine il
ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY TotalSold DESC;

SELECT
a.Title,
ar.Name AS ArtistName
FROM Album a
LEFT JOIN Artist ar
ON a.ArtistId = ar.ArtistId;

SELECT
FirstName,
LastName,
Country,
ROW_NUMBER() OVER
(
PARTITION BY Country
ORDER BY CustomerId
) AS RowNum
FROM Customer;

