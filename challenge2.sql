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
    
