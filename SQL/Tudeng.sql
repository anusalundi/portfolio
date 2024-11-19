--MS Access--
SELECT aine_kood, Ucase(nimetus) AS NIMETUS, kommentaar, punkte
FROM Aine
WHERE (aine_kood LIKE 'F%' OR aine_kood LIKE 'H%')
AND aine_kood NOT LIKE '%2'
AND kommentaar IS NOT NULL
AND ((punkte>=1 AND punkte<=2) OR punkte>3)
ORDER BY punkte ASC, nimetus DESC;

SELECT aine_kood, Ucase(nimetus) AS NIMETUS, kommentaar, punkte
FROM Aine
WHERE aine_kood LIKE '[FH]%[!2]'
AND kommentaar IS NOT NULL
AND (punkte BETWEEN 1 AND 2 OR punkte>3)
ORDER BY punkte, nimetus DESC;

--PostgreSQL--
SELECT aine_kood, Upper(nimetus) AS NIMETUS, kommentaar, punkte
FROM Aine
WHERE (aine_kood ILIKE 'F%' OR aine_kood ILIKE 'H%')
AND aine_kood NOT LIKE '%2'
AND kommentaar IS NOT NULL
AND ((punkte>=1 AND punkte<=2) OR punkte>3)
ORDER BY punkte ASC, nimetus DESC;

SELECT aine_kood, Upper(nimetus) AS NIMETUS, kommentaar, punkte
FROM Aine
WHERE aine_kood ~* '^[FH].*[^2]$'
AND kommentaar IS NOT NULL
AND (punkte BETWEEN 1 AND 2 OR punkte>3)
ORDER BY punkte, nimetus DESC;
