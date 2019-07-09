/*Challege1*/
use publications;
SELECT aut.au_id AS "AUTHOR ID", aut.au_lname AS "LAST NAME", aut.au_fname AS "FIRST NAME", titl.title AS "TITLE", pubs.pub_name AS "PUBLISHER"
FROM publications.authors aut
LEFT JOIN publications.titleauthor taut
ON taut.au_id = aut.au_id
LEFT JOIN publications.titles titl
ON titl.title_id = taut.title_id
LEFT JOIN publications.publishers pubs
ON titl.pub_id = pubs.pub_id;

/*Challege2*/
SELECT taut.au_id AS "AUTHOR ID", aut.au_lname AS "LAST NAME", aut.au_fname AS "FIRST NAME", pubs.pub_name AS "PUBLISHER", COUNT(titl.title_id) AS "TITLES"
FROM publications.authors aut
LEFT JOIN publications.titleauthor taut
ON aut.au_id = taut.au_id
LEFT JOIN publications.titles titl
ON titl.title_id = taut.title_id
LEFT JOIN publications.publishers pubs
ON titl.pub_id = pubs.pub_id
GROUP BY pubs.pub_name, taut.au_id, aut.au_fname, aut.au_lname, pubs.pub_name
ORDER BY COUNT(titl.title_id) DESC;

/*Challege3*/
SELECT aut.au_id AS "AUTHOR ID", aut.au_lname AS "LAST NAME", aut.au_fname AS "FIRST NAME", SUM(sales.qty) AS "TOTAL"
FROM publications.authors aut
LEFT JOIN publications.titleauthor taut
ON aut.au_id = taut.au_id
LEFT JOIN publications.titles titl
ON titl.title_id = taut.title_id
LEFT JOIN publications.sales
ON sales.title_id = titl.title_id
GROUP BY taut.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

/*Challege4*/
SELECT aut.au_id AS "AUTHOR ID", aut.au_lname AS "LAST NAME", aut.au_fname AS "FIRST NAME", SUM(IFNULL(sales.qty,0)) AS "TOTAL"
FROM publications.authors aut
LEFT JOIN publications.titleauthor taut
ON aut.au_id = taut.au_id
LEFT JOIN publications.titles titl
ON titl.title_id = taut.title_id
LEFT JOIN publications.sales
ON sales.title_id = titl.title_id
GROUP BY taut.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 23;

/*BONUS*/
SELECT aut.au_id AS "AUTHOR ID", aut.au_lname AS "LAST NAME", aut.au_fname AS "FIRST NAME", SUM(((titl.royalty*titl.price*sales.qty*taut.royaltyper)/100) + (titl.advance*taut.royaltyper/ 100)) AS "PROFIT"
FROM publications.authors aut
LEFT JOIN publications.titleauthor taut
ON aut.au_id = taut.au_id
LEFT JOIN publications.titles titl
ON titl.title_id = taut.title_id
LEFT JOIN publications.sales
ON sales.title_id = titl.title_id
GROUP BY taut.au_id
ORDER BY PROFIT DESC
LIMIT 3;
