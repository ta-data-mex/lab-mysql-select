SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    COUNT(titles.title) AS TITLE,
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
GROUP BY authors.au_id , publishers.pub_name
;

-- CON JOIN

SELECT 
    au.au_id AS AUTHOR_ID,
    au_lname AS LAST_NAME,
    au.au_fname AS FIRST_NAME,
    pub.pub_name AS PUBLISHER,
    COUNT(titles.title_id) AS TITLE_COUNT
FROM
    publications.authors au
        INNER JOIN
    publications.titleauthor titleau ON au.au_id = titleau.au_id
        INNER JOIN
	publications.titles on titleau.title_id = titles.title_id
		INNER JOIN
	 publications.publishers pub ON pub.pub_id = titles.pub_id

GROUP BY au.au_id , pub_name;