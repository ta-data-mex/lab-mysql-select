
#QUESTION 1
SELECT 
au.au_ID as 'AUTHOR ID',
au.au_lname as 'LAST NAME', 
au.au_fname as 'FIRST NAME', 
ti.title as 'TITLE', 
pub.pub_name as 'PUBLISHER'
FROM authors as au
LEFT JOIN titleauthor AS ta ON ta.au_id = au.au_id
LEFT JOIN titles as ti ON ti.title_id = ta.title_id
LEFT JOIN publishers as pub ON pub.pub_id = ti.pub_id;

SET SESSION sql_mode='';
#QUESTION 2
SELECT 
au.au_ID as 'AUTHOR_ID',
au.au_lname as 'LAST_NAME', 
au.au_fname as 'FIRST_NAME', 
pub.pub_name as 'PUBLISHER',
COUNT(ti.title_id) as 'TITLE_COUNT'
FROM authors as au
LEFT JOIN titleauthor AS ta ON ta.au_id = au.au_id
INNER JOIN titles as ti ON ti.title_id = ta.title_id
INNER JOIN publishers as pub ON pub.pub_id = ti.pub_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER;

#QUESTION 3
SELECT 
au.au_ID as 'AUTHOR_ID',
au.au_lname as 'LAST_NAME', 
au.au_fname as 'FIRST_NAME', 
SUM(sale.qty) as 'TOTAL'
FROM authors as au
LEFT JOIN titleauthor AS ta ON ta.au_id = au.au_id
INNER JOIN titles as ti ON ti.title_id = ta.title_id
INNER JOIN sales as sale ON sale.title_id = ti.title_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;

#QUESTION 4
SELECT 
au.au_ID as 'AUTHOR_ID',
au.au_lname as 'LAST_NAME', 
au.au_fname as 'FIRST_NAME', 
SUM(sale.qty) as 'TOTAL'
FROM authors as au
LEFT JOIN titleauthor AS ta ON ta.au_id = au.au_id
INNER JOIN titles as ti ON ti.title_id = ta.title_id
INNER JOIN sales as sale ON sale.title_id = ti.title_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 23;


#BONUS 
SELECT 
au.au_ID as 'AUTHOR_ID',
au.au_lname as 'LAST_NAME', 
au.au_fname as 'FIRST_NAME', 
SUM(sale.qty) as 'PROFIT'
FROM authors as au
LEFT JOIN titleauthor AS ta ON ta.au_id = au.au_id
INNER JOIN titles as ti ON ti.title_id = ta.title_id
INNER JOIN sales as sale ON sale.title_id = ti.title_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;

