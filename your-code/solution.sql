SHOW tables;
DESC titleauthor;

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name 
FROM publications.authors
INNER JOIN publications.titleauthor 
ON authors.au_id = titleauthor.au_id
inner join publications.titles
on titleauthor.title_id = titles.title_id 
inner join publications.publishers
on titles.pub_id = publishers.pub_id
order by authors.au_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname, pub.pub_name, COUNT(titles.title_id)
FROM publications.authors 
INNER JOIN publications.titleauthor t_authors
ON authors.au_id = t_authors.au_id
INNER JOIN publications.titles
ON t_authors.title_id = titles.title_id
INNER JOIN publications.publishers pub
ON titles.pub_id = pub.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, pub.pub_name
ORDER BY authors.au_id DESC;

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty)
FROM publications.authors
LEFT JOIN publications.titleauthor t_author
ON authors.au_id = t_author.au_id
LEFT JOIN publications.sales
ON t_author.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC LIMIT 3;

SELECT authors.au_id, authors.au_lname, authors.au_fname, ifnull(SUM(sales.qty), 0) as TOTAL
FROM publications.authors
LEFT JOIN publications.titleauthor t_author
ON authors.au_id = t_author.au_id
LEFT JOIN publications.sales
ON t_author.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC;

SELECT authors.au_id, authors.au_lname, authors.au_fname, (SUM((titles.advance * titleauthor.royaltyper)+(((titles.price*sales.qty)*titles.royalty/100)*titleauthor.royaltyper))/100) as PROFIT
FROM publications.authors
INNER JOIN publications.titleauthor
On authors.au_id = titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.sales
ON titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by PROFIT DESC LIMIT 3;
