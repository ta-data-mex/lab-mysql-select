

/*Challenge 1*/
SELECT tia.au_id AS "AUTHOR ID", ath.au_lname AS "LAST NAME", ath.au_fname "FIRST NAME", tit.title "TITLE", pub.pub_name "PUBLISHER"
FROM publications.authors ath
LEFT JOIN publications.titleauthor tia
ON ath.au_id = tia.au_id
LEFT JOIN publications.titles tit
ON tia.title_id = tit.title_id
LEFT JOIN publications.publishers pub 
ON tit.pub_id = pub.pub_id;


/*Challenge 2*/


SELECT tia.au_id AS "AUTHOR ID", ath.au_lname AS "LAST NAME", ath.au_fname "FIRST NAME", pub.pub_name "PUBLISHER", COUNT(tit.title_id) AS "Titles"
FROM publications.authors ath 
LEFT JOIN publications.titleauthor tia
ON ath.au_id = tia.au_id
LEFT JOIN publications.titles tit
ON tia.title_id = tit.title_id
LEFT JOIN publications.publishers pub 
ON tit.pub_id = pub.pub_id
GROUP BY pub.pub_name, tia.au_id, ath.au_lname, ath.au_fname, pub.pub_name
ORDER BY COUNT(tit.title_id) DESC;


/*Challenge 3*/

SELECT tia.au_id AS "AUTHOR ID", ath.au_lname AS "LAST NAME", ath.au_fname "FIRST NAME", SUM(sls.qty) AS "TOTAL"
FROM publications.authors ath 
LEFT JOIN publications.titleauthor tia
ON ath.au_id = tia.au_id
LEFT JOIN publications.sales sls
ON tia.title_id = sls.title_id

GROUP BY tia.au_id, ath.au_lname, ath.au_fname
ORDER BY SUM(sls.qty) DESC
LIMIT 3;


/*Challenge 4*/

SELECT IFNULL(tia.au_id, 0) AS "AUTHOR ID", ath.au_lname AS "LAST NAME", ath.au_fname "FIRST NAME", SUM(IFNULL(sls.qty, 0)) AS "TOTAL"
FROM publications.authors ath 
LEFT JOIN publications.titleauthor tia
ON ath.au_id = tia.au_id
LEFT JOIN publications.sales sls
ON tia.title_id = sls.title_id

GROUP BY tia.au_id, ath.au_lname, ath.au_fname
ORDER BY SUM(sls.qty) DESC
LIMIT 23;


/*Challenge Bonus*/


SELECT tia.au_id AS "AUTHOR ID", ath.au_lname AS "LAST NAME", ath.au_fname "FIRST NAME", ((tia.royaltyper/100)*(tit.royalty/100)*sls.qty*tit.price)+(tit.advance*(tia.royaltyper)/100) AS "PROFIT"
FROM publications.authors ath 
LEFT JOIN publications.titleauthor tia
ON ath.au_id = tia.au_id
LEFT JOIN publications.sales sls
ON tia.title_id = sls.title_id
LEFT JOIN publications.titles tit
ON tia.title_id = tit.title_id
GROUP BY tia.au_id, ath.au_lname, ath.au_fname, ((tia.royaltyper/100)*(tit.royalty/100)*sls.qty*tit.price)+(tit.advance*(tia.royaltyper)/100)
ORDER BY ((tia.royaltyper/100)*(tit.royalty/100)*sls.qty*tit.price)+(tit.advance*(tia.royaltyper)/100) DESC
LIMIT 3;

