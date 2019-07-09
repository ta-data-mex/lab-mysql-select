SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM publications.authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN publishers
on titles.pub_id = publishers.pub_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name,  COUNT(titleauthor.title_id) as conteo
FROM publications.authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN publishers
on titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, PUBLISHERS.pub_id
order by conteo desc;

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS TOTAL
FROM publications.authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
order by TOTAL desc
LIMIT 3;

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS TOTAL
FROM publications.authors
LEFT JOIN titleauthor
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
GROUP BY titleauthor.au_id
order by TOTAL desc
LIMIT 23;
