/*Challenge 1*/
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST ñame', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER' FROM authors

inner join titleauthor on authors.au_id = titleauthor.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on titles.pub_id = publishers.pub_id
order by authors.au_id;

/*Challenge 2*/
SELECT 
authors.au_id as 'AUTHOR ID', 
authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST Name',  
publishers.pub_name as 'PUBLISHER', 
count(titles.title_id) as 'TITLE COUNT' 
FROM authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
order by publishers.pub_name, 'TITLE COUNT' DESC;

/*Challenge 3*/
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', sum(sales.qty) as 'TOTAL' FROM authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join sales on titleauthor.title_id = sales.title_id
group by authors.au_id
order by TOTAL desc limit 3;

/*Challenge 4*/
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', ifnull(sum(sales.qty),0) as 'TOTAL' FROM authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join sales on titleauthor.title_id = sales.title_id
group by authors.au_id
order by TOTAL desc;