# Challenge 4
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(ifnull(sales.qty,0)) AS TOTAL
FROM publications.authors
left JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id 
left JOIN publications.sales
ON titleauthor.title_id = sales.title_id 
GROUP BY au_id 
ORDER BY TOTAL desc;
