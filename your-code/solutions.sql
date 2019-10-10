USE publications;

-- PRIMER CHALLENGE
SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
titles.title AS TITLE,
publishers.pub_name AS PUBLISHER
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
;

-- SEGUNDO CHALLENGE
SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
publishers.pub_name AS PUBLISHER,
COUNT(titles.title_id) AS TITLE_COUNT
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
;

-- TERCER CHALLENGE
SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
COUNT(sales.title_id) AS TOTAL
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sales.title_id DESC
LIMIT 3
;

-- CUARTO CHALLENGE
SELECT
authors.au_id AS AUTHOR_ID,
authors.au_lname AS LAST_NAME,
authors.au_fname AS FIRST_NAME,
COUNT(sales.title_id) AS TOTAL
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sales.title_id DESC
LIMIT 23
;