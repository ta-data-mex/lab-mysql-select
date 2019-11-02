
Select authors.au_id, authors.au_lname,authors.au_fname, ifnull(sum(sales.qty), 0) as total_sales
from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join sales on titleauthor.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by sum(sales.qty) desc