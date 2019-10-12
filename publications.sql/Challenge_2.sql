SELECT
authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title_id) as count
From authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
order by publishers.pub_name, count DESC;

SELECT Tienda, Items/Ordenes as ItemPromedio, Cantidad/Items as CantidadPromedio
FROM(
SELECT stores.stor_name as Tienda, COUNT(Distinct(ord_num)) as Ordenes, COUNT(title_id) as Items, SUM(qty) as Cantidad
FROM sales
INNER JOIN stores on stores.stor_id = sales.stor_id
Group by Tienda
	) summary;

CREATE TEMPORARY TABLE store_sales_summary
SELECT stores.stor_id AS Store_ID, stores.stor_name as Store,
COUNT(distinct(ord_num)) as Orders, COUNT(title_id) as Items,
sum(qty) as Qty
FROM sales
INNER JOIN stores on stores.stor_id=sales.stor_id
GROUP BY Store_ID, Store;

SELECT * FROM store_sales_summary