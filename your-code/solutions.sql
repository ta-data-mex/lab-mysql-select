USE publications;

SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
titles.title AS TITLE,
publishers.pub_name AS PUBLISHER
FROM authors, titles, publishers
INNER JOIN titleauthor ON titles.title_id = titleauthor.title.id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id;


SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
titles.title AS TITLE,
publishers.pub_name AS PUBLISHER
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title.id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
GROUP BY authors. au_id;


SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
publishers.pub_name AS PUBLISHER,
COUNT(DISTINCT(titles.title)) AS TITLE_COUNT
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title.id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id
ORDER BY titles.title DESC;


SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
COUNT(sales.title_id) AS TOTAL
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title.id
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY saless.title_id DESC
LIMIT 3;


SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
COUNT(sales.title_id) AS TOTAL
FROM titles
INNER JOIN titleauthor ON titles.title_id = titleauthor.title.id
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors. au_id
ORDER BY saless.title_id DESC
LIMIT 23;