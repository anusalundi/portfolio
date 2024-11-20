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

SELECT Count(*) AS arv, Round(Avg(punkte), 1) AS keskmine
FROM Päring1 ;

SELECT Oppimine.*, Tudeng.eesnimi & ' ' & Tudeng.perenimi AS tudengi_nimi, Aine.nimetus AS aine_nimetus, Oppejoud.perenimi AS oppejou_perenimi
FROM Oppimine, Tudeng, Aine, Oppejoud
WHERE Oppimine.tudeng=Tudeng.tudkood
AND Oppimine.aine=Aine.aine_kood
AND Oppimine.oppejoud=Oppejoud.oppejou_kood
AND Year(oppim_algus)=1998
AND Oppimine.oppimine IN (SELECT oppimine
FROM Eksam
WHERE tulemus IN (4,5))
ORDER BY Tudeng.perenimi, Aine.nimetus;

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
