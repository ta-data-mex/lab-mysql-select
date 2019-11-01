-- Challenge #1 Who have published what at where?
SELECT authors.au_id as AuthorID,authors.au_lname as LastName,authors.au_fname as FirstName,titles.title as BookTitle,publishers.pub_name as Publisher
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY LastName, Title;

-- Challenge #2 Who have published how many at where?
SELECT authors.au_id as AuthorID, authors.au_lname as LastName, authors.au_fname as FirstName, 
publishers.pub_name as Publisher, count(titles.title_id) as Count
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY Count DESC;

-- Challenge #3 Best-Selling Authors: Who are the top 3 authors who have sold the most titles?
SELECT authors.au_id as AuthorID, authors.au_lname as LastName,
authors.au_fname as FirstName, sum(sales.qty) as Total
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN sales on titleauthor.title_id = sales.title_id
GROUP BY authors.au_id ORDER BY Total DESC LIMIT 3;

-- Challenge #4 Best-Selling Authors Ranking
SELECT authors.au_id as AuthorID, authors.au_lname as LastName,
authors.au_fname as FirstName, sum(sales.qty) as Total
FROM authors
LEFT JOIN titleauthor on authors.au_id = titleauthor.au_id
LEFT JOIN sales on titleauthor.title_id = sales.title_id
GROUP BY authors.au_id ORDER BY Total DESC LIMIT 23;