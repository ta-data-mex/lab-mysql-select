SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name', authors.au_fname as 'First name', titles.title as 'Title', publishers.pub_name as 'Publisher'
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id 
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_lname ASC;

---------------------------------

SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name', authors.au_fname as 'First name', titles.title as 'Title', publishers.pub_name as 'Publisher', COUNT(titles.title) AS TITLE_COUNT
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id 
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

---------------------------------

SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name', authors.au_fname as 'First name', SUM(sales.qty) AS Total
FROM publications.titleauthor
INNER JOIN publications.authors ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.sales ON titleauthor.title_id = sales.title_id 
GROUP BY sales.qty 
ORDER BY TOTAL desc
LIMIT 3;

-------------------------------

SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name', authors.au_fname as 'First name', IFNULL(SUM(sales.qty),0) AS Total
FROM publications.titleauthor
INNER JOIN publications.authors ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.sales ON titleauthor.title_id = sales.title_id 
GROUP BY sales.qty 
ORDER BY TOTAL desc;
------------------------------------

SELECT authors.au_id, authors.au_lname, authors.au_fname, (((SUM(sales.qty))*royaltyper/100*price) + SUM(advance*royaltyper/100))  AS PROFIT
FROM publications.authors
inner JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id 
inner JOIN publications.titles
ON titleauthor.title_id = titles.title_id 
inner JOIN publications.sales
ON titles.title_id = sales.title_id 
GROUP BY au_id 
ORDER BY PROFIT desc LIMIT 3;