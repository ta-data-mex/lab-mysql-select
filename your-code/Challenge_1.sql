SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    titles.title AS TITLE,
    publishers.pub_name AS PUBLISHER
FROM
    publications.authors,
    publications.titles,
    publications.publishers,
    publications.titleauthor
WHERE
    authors.au_id = titleauthor.au_id
        AND titles.title_id = titleauthor.title_id
        AND titles.pub_id = publishers.pub_id
;

-- CON JOIN

SELECT 
    au.au_id AS AUTHOR_ID,
    au.au_lname AS LAST_NAME,
    au.au_fname AS FIRST_NAME,
    ti.title AS TITLE,
    pub.pub_name AS PUBLISHER
FROM
    publications.authors au
        INNER JOIN
    publications.titleauthor ta ON au.au_id = ta.au_id
		INNER JOIN
	publications.titles ti on ta.title_id = ti.title_id
		INNER JOIN
	publications.publishers pub on pub.pub_id = ti.pub_id;
