select authors.au_id as Author_ID,
authors.au_lname AS Last_Name,
authors.au_fname as First_Name,
publishers.pub_name as Publisher,
count(titles.title_id) as Title
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id 
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name