SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    SUM(sales.qty) AS TOTAL
FROM
    publications.authors,
    publications.titles,
    publications.sales,
    publications.titleauthor
WHERE
    authors.au_id = titleauthor.au_id
        AND titles.title_id = titleauthor.title_id
        AND titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

SELECT 
    au.au_id AS AUTHOR_ID,
    au_lname AS LAST_NAME,
    au.au_fname AS FIRST_NAME,
    sum(sale.qty) AS TOTAL
FROM
    publications.authors au
        INNER JOIN
    publications.titleauthor titleau ON au.au_id = titleau.au_id,
    publications.sales sale
        INNER JOIN
    publications.titles ON sale.title_id = titles.title_id
WHERE
    titleau.title_id = titles.title_id
GROUP BY au.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- CON JOIN

SELECT 
    au.au_id AS AUTHOR_ID,
    au_lname AS LAST_NAME,
    au.au_fname AS FIRST_NAME,
    SUM(sale.qty) AS TOTAL
FROM
    publications.authors au
        LEFT JOIN
    publications.titleauthor titleau ON au.au_id = titleau.au_id
        LEFT JOIN
    publications.sales sale ON titleau.title_id = sale.title_id
GROUP BY au.au_id
ORDER BY TOTAL DESC
LIMIT 3;