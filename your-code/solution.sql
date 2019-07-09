#challenge 1
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER', count(*)
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
order by authors.au_id;

#challenge 2
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER', count(titles.title_id) as 'TITLE COUNT'
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id
order by authors.au_id desc;

#challenge 3
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', sum(sales.qty) as 'TOTAL'
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join sales
on titleauthor.title_id = sales.title_id
group by authors.au_id
order by TOTAL desc limit 3;

#challenge 4
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', ifnull(sum(sales.qty), 0)  as 'TOTAL'
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join sales
on titleauthor.title_id = sales.title_id
group by authors.au_id
order by TOTAL desc;

#bonus
select authors.au_id, authors.au_fname, authors.au_lname, (((titles.price * sum(sales.qty))*(titles.royalty/100))*(titleauthor.royaltyper/100))+ titles.advance as 'PROFIT'
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by PROFIT desc limit 3;