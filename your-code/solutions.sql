/*Desafío 1 - ¿Quién ha publicado qué en dónde?*/
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM publications.authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN publishers
on titles.pub_id = publishers.pub_id;

/*Desafío 2 - ¿Quién ha publicado cuántos en dónde?*/
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name,  COUNT(titleauthor.title_id) as conteo
FROM publications.authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN publishers
on titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, PUBLISHERS.pub_id
order by conteo desc;

/*Reto 3 - Autores más vendidos*/
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS TOTAL
FROM publications.authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
order by TOTAL desc
LIMIT 3;

/*Reto 4 - Clasificación de autores más vendidos */
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS TOTAL
FROM publications.authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
order by TOTAL desc
LIMIT 23;

/*Bonus Challenge - Autores más rentables*/
SELECT 
titleauthor.title_id as TITLE_ID, 
authors.au_id AS AUTHOR_ID, 
(titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)) as SALES_ROYALTY
FROM publications.authors
INNER JOIN titleauthor
on authors.au_id = titleauthor.au_id
INNER JOIN titles
on titleauthor.title_id = titles.title_id
INNER JOIN sales
on titles.title_id = sales.title_id
order by SALES_ROYALTY desc;
