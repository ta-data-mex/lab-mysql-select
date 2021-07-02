SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name', authors.au_fname as 'First name', IFNULL(SUM(sales.qty),0) AS Total
FROM publications.titleauthor
LEFT JOIN publications.authors ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.sales ON titleauthor.title_id = sales.title_id 
GROUP BY sales.qty 
ORDER BY TOTAL desc





