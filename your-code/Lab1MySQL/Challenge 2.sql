# Challenge 2

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name, COUNT(titles.title) AS TITLE_COUNT
FROM publications.authors
INNER JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id 
INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name
