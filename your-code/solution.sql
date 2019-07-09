/*Challenge 1*/

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER'
FROM authors INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id;

/*Challenge 2*/
CREATE TABLE TEST
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name AS 'PUBLISHER', COUNT(titles.title_id) AS 'TITLE COUNT'
FROM authors INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id;

/*Challenge 3*/

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(titles.ytd_sales) AS 'TOTAL'
FROM authors INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC LIMIT 3;

/*Challenge 4*/

SET SQL_SAFE_UPDATES = 0;
UPDATE titles SET ytd_sales=0 WHERE ytd_sales IS NULL;
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(titles.ytd_sales) AS 'TOTAL'
FROM authors INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(titles.ytd_sales) DESC;

/*Bonus Challenge*/

SELECT authors.au_id AS 'AUTHOR ID', authors.au_fname AS 'FIRST NAME', authors.au_lname AS 'LAST NAME', 
titleauthor.royaltyper*(titles.advance + sales.qty*titles.price*titles.royalty) AS 'PROFIT'
FROM authors INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY titleauthor.royaltyper*(titles.advance + sales.qty*titles.price*titles.royalty) DESC;
