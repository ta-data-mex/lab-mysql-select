SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name', authors.au_fname as 'First name', titles.title as 'Title', publishers.pub_name as 'Publisher'
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id 
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_lname ASC;