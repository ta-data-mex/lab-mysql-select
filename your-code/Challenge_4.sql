SELECT 
    au.au_id AS AUTHOR_ID,
    au_lname AS LAST_NAME,
    au.au_fname AS FIRST_NAME,
    SUM(IFNULL(sale.qty, 0)) AS TOTAL
FROM
    publications.authors au
        LEFT JOIN
    publications.titleauthor titleau ON au.au_id = titleau.au_id
        LEFT JOIN
    publications.sales sale ON titleau.title_id = sale.title_id
GROUP BY au.au_id
ORDER BY TOTAL DESC
LIMIT 23;