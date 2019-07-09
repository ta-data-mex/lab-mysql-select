/*authors, stores, discounts, jobs, publishers, employee, 
pub_info, titles, roysched, sales, titleauthor (au_id) (title_id) */

/*Challenge 1*/
select authors.au_id as 'Author ID', 
authors.au_lname as 'Last Name', 
authors.au_fname as  'First Name', 
titles.title as  'Title', 
pub.pub_name as  'Publisher'
from publications.authors authors
inner join publications.titleauthor titleauthor 
on authors.au_id = titleauthor.au_id
inner join publications.titles titles
on titleauthor.title_id = titles.title_id
inner join publications.publishers pub
on titles.pub_id = pub.pub_id
order by authors.au_id asc;

/*Challenge 2*/
select authors.au_id as 'Author ID', 
authors.au_lname as 'Last Name', 
authors.au_fname as  'First Name', 
pub.pub_name as  'Publisher',
count(titles.title) as  'Title Count' 
from publications.authors authors
inner join publications.titleauthor titleauthor 
on authors.au_id = titleauthor.au_id
inner join publications.titles titles
on titleauthor.title_id = titles.title_id
inner join publications.publishers pub
on titles.pub_id = pub.pub_id
group by authors.au_id, pub.pub_name
order by authors.au_id DESC;

/*Challenge 3*/
select authors.au_id as 'Author ID', 
authors.au_lname as 'Last Name', 
authors.au_fname as  'First Name', 
count(sales.title_id) as  'TOTAL' 
from publications.authors authors
inner join publications.titleauthor titleauthor 
on authors.au_id = titleauthor.au_id
inner join publications.sales sales
on titleauthor.title_id = sales.title_id
group by authors.au_id ORDER BY TOTAL DESC limit 3;

/*Challenge 4*/
select authors.au_id as 'Author ID', 
authors.au_lname as 'Last Name', 
authors.au_fname as  'First Name', 
count(sales.title_id) as  'TOTAL' 
from publications.authors authors
left join publications.titleauthor titleauthor 
on authors.au_id = titleauthor.au_id
left join publications.sales sales
on titleauthor.title_id = sales.title_id
group by authors.au_id ORDER BY TOTAL DESC limit 23;

/*BONUS*/
select  authors.au_id as 'Author ID', 
authors.au_lname as 'Last Name', 
authors.au_fname as  'First Name', 
(sum(titles.advance + sales.qty*titles.price*titles.royalty/100)*titleauthor.royaltyper/100) as 'Profit'
from publications.authors authors
inner join publications.titleauthor titleauthor 
on authors.au_id = titleauthor.au_id
inner join publications.titles titles
on titleauthor.title_id = titles.title_id
inner join publications.sales sales
on titles.title_id = sales.title_id
group by authors.au_id
order by Profit DESC;