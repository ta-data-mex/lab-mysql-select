
-- challenge 1
SELECT authors.au_id,authors.au_fname,authors.au_lname,titles.title,publishers.pub_name
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;
	
-- challenge 2

SELECT
authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name,count(titles.title_id) as count
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY publishers.pub_name, count DESC;

SELECT Tienda, Items/Ordenes as ItemPromedio, Cantidad/Items as CantidadPromedio
FROM(
	SELECT stores.stor_name as Tienda, COUNT(DISTINCT(ord_num)) as Ordenes, COUNT(title_id) as Items, SUM(qty) as Cantidad
    FROM sales
    INNER JOIN stores on stores.stor_id= sales.stor_id
    GROUP BY Tienda
    ) summary;
 
 CREATE TEMPORARY TABLE store_sales_summary
 SELECT stores.stor_id AS Store_ID, stores.stor_name as Store,
 COUNT(DISTINCT(ord_num)) as Orders, COUNT(title_id) as Items,
 sum(qty) as Qty
 FROM sales
 INNER JOIN stores on stores.stor_id = sales.stor_id
 GROUP BY Store_ID, Store;
 
 SELECT * FROM store_sales_summary
 
 -- challenge 3
 
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME,authors.au_fname AS FIRST_NAME, SUM(sales.qty) AS TOTAL
FROM authors
LEFT JOIN
titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN
sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3; 

-- challenge 4
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME,authors.au_fname AS FIRST_NAME, SUM(sales.qty) AS TOTAL
FROM authors
LEFT JOIN
titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN
sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 23;