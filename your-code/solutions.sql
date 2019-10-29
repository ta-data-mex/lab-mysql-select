--No lo habia subido
-- Challenge 1
use publications;
select 
authors.au_id as 'Author ID', 
authors.au_lname as 'Last name', 
authors.au_fname as 'First name', 
titles.title as 'Title', 
publishers.pub_name as 'Publisher' 
from authors, titles, publishers, titleauthor
where titles.pub_id = publishers.pub_id 
and authors.au_id = titleauthor.au_id
and titleauthor.title_id = titles.title_id;

-- Challenge 2
use publications;
select 
authors.au_id as 'Author ID', 
authors.au_lname as 'Last name', 
authors.au_fname as 'First name', 
count(titles.title_id) as 'Title count', 
publishers.pub_name as 'Publisher' 
from authors, titles, publishers, titleauthor
where titles.pub_id = publishers.pub_id 
and authors.au_id = titleauthor.au_id
and titleauthor.title_id = titles.title_id
group by au_id;

-- Challenge 2 (en clase)
use publications;
select 
authors.au_id as 'Author ID', 
authors.au_lname as 'Last name', 
authors.au_fname as 'First name', 
publishers.pub_name as 'Publisher',
count(titles.title_id) as count
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
order by publishers.pub_name, count desc

-- Ejercicio clase, query dentro de query
select store, items/orders as ItemPromedio, qty/items as CantidadPromedio
from(
	select stores.stor_name as Store, count(distinct(ord_num)) as Orders, count(title_id) as Items, sum(qty) as qty
    from sales
    inner join stores on stores.stor_id = sales.stor_id
    group by store
    ) summary;
    
-- Ejercicio tabla temporal
create temporary table store_sales_summary
select stores.stor_id as Store_ID, stores.stor_name as Store,
count(distinct(ord_num)) as Orders, count(title_id) as Items,
sum(qty) as Qty
from sales
inner join stores on stores.stor_id = sales.stor_id
group by Store_ID, Store;

Select * from store_sales_summary