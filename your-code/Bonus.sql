
SELECT 
    au.au_id AS ID_AUTHOR,
    au.au_lname AS LAST_NAME,
    au.au_fname AS FIRST_NAME,
    ROUND(ganancias.GANANCIA_TOTAL * ta.royaltyper/100,2) AS PROFIT
FROM
    publications.authors au
        INNER JOIN
    publications.titleauthor ta ON au.au_id = ta.au_id
        INNER JOIN
    (SELECT 
        ti.title_id AS TITLE_ID,
            ti.title AS TITLE,
            ti.price AS PRECIO,
            ti.royalty AS ROYALTY,
            ti.advance AS ADV,
            SUM(sales.qty) AS TOTAL,
            ti.advance + SUM(sales.qty) * ti.price * ti.royalty / 100 AS GANANCIA_TOTAL
    FROM
        publications.titles ti
    INNER JOIN publications.sales ON ti.title_id = sales.title_id
    GROUP BY ti.title_id) ganancias ON ganancias.TITLE_ID = ta.title_id
;

