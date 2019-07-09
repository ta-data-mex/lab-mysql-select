# Challenge 3

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS TOTAL
FROM publications.titleauthor
INNER JOIN publications.authors
ON authors.au_id = titleauthor.au_id 
inner JOIN publications.sales
ON titleauthor.title_id = sales.title_id 
GROUP BY sales.qty 
ORDER BY TOTAL desc
LIMIT 3;

