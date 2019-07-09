SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM publications.authors 
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id;

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, publishers.pub_name AS PUBLISHER, COUNT(titles.title_id) AS TITLE_COUNT
FROM publications.authors 
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id;

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, SUM(sales.qty) AS TOTAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC 
LIMIT 3;

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, IFNULL(SUM(sales.qty), 0) AS TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, ((titles.price*titles.ytd_sales*titles.royalty)*(titleauthor.royaltyper/100))+(titles.advance*(titleauthor.royaltyper/100)) AS PROFIT
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY PROFIT DESC
LIMIT 3;