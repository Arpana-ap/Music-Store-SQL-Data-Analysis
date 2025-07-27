--Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels DESC
Limit 1

--Which countries have the most Invoices?

SELECT COUNT(*) AS c, billing_country 
FROM invoice
GROUP BY billing_country
ORDER BY c DESC

--What are top 3 values of total invoice?

SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3

--Which city has the best customers? We would like to throw a promotional Music
--Festival in the city we made the most money. Write a query that returns one city that
--has the highest sum of invoice totals. Return both the city name & sum of all invoice
--totals

SELECT * FROM invoice

SELECT SUM(total) as invoice_total, billing_city FROM invoice
GROUP BY billing_city
Order BY invoice_total DESC

--Who is the best customer? The customer who has spent the most money will be
--declared the best customer. Write a query that returns the person who has spent the
--most money

SElect c.customer_id, c.first_name, c.last_name,
SUM(i.total) as total
FROM customer as c
Join invoice as i on c.customer_id = i.customer_id
GROUP By c.customer_id
ORDER BY total DESC
LIMIT 1

--Write query to return the email, first name, last name, & Genre of all Rock Music
--listeners. Return your list ordered alphabetically by email starting with A

SELECT DISTINCT email, first_name, last_name 
FROM customer
JOIN invoice on customer.customer_id = invoice.customer_id
Join invoice_line on invoice.invoice_id = invoice_line.invoice_id
WHERE Track_id IN (SELECT track_id from Track
JOIN genre on track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
)
Order by email;

--Let's invite the artists who have written the most rock music in our dataset. Write a
--query that returns the Artist name and total track count of the top 10 rock bands

SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS no_of_songs
From track
JOIN album on album.album_id = track.album_id
Join artist on artist.artist_id = album.artist_id
JOIN genre on genre.genre_id = track.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.artist_id
ORDER BY no_of_songs DESC
Limit 10;

--Return all the track names that have a song length longer than the average song length.
--Return the Name and Milliseconds for each track. Order by the song length with the
--longest songs listed first

SELECT name, milliseconds
FROM Track
WHERE milliseconds > (
SELECT Avg(milliseconds) AS Song_length
FROm track
)
ORDER BY milliseconds DESC;


--Find how much amount spent by each customer on artists? Write a query to return
--customer name, artist name and total spent




