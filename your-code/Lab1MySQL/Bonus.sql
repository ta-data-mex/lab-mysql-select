# Bonus 
SELECT authors.au_id, authors.au_lname, authors.au_fname, (((SUM(sales.qty))*royaltyper/100*price) + SUM(advance*royaltyper/100))  AS PROFIT
FROM publications.authors
inner JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id 
inner JOIN publications.titles
ON titleauthor.title_id = titles.title_id 
inner JOIN publications.sales
ON titles.title_id = sales.title_id 
GROUP BY au_id 
ORDER BY PROFIT desc LIMIT 3; 

