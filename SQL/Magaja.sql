--MS Access--
--1--
SELECT 231+4568 AS vastus1, 
       987/54 AS vastus2, 
       (332-25)*456 AS vastus3, 
       2^3 AS vastus4;

--2--
SELECT 231+4568 AS vastus FROM DummyTable
UNION ALL
SELECT 987/54 AS vastus FROM DummyTable
UNION ALL
SELECT (332-25)*456 AS vastus FROM DummyTable
UNION ALL
SELECT 2^3 AS vastus FROM DummyTable;

--3--
SELECT * FROM Magaja;

SELECT magaja_id, synni_aeg, aadress, telefon, eesnimi, perenimi
FROM Magaja;

--4--
SELECT ase_id, pikkus/100 AS pikkus_meetrites
FROM Ase;

--5--
SELECT magaja_id, eesnimi, perenimi
FROM Magaja
ORDER BY perenimi ASC;

--6--
SELECT *
FROM Magaja
ORDER BY perenimi DESC, synni_aeg ASC;

--7--
SELECT ase_id, nimi
FROM Ase
Order BY pikkus;

--8--
SELECT magaja_id, (eesnimi & ' ' & perenimi) AS nimi
FROM Magaja;

--9--
SELECT DISTINCT perenimi
FROM Magaja;

--10--
SELECT *
FROM Magaja
WHERE eesnimi='Jaan';

--11--
SELECT *
FROM Magaja
WHERE eesnimi<>'Jaan';

--12--
SELECT *
FROM Magaja
WHERE eesnimi='Jaan' OR perenimi='Jaan';

SELECT *
FROM Magaja
WHERE perenimi LIKE 'J__n%';

--13--
SELECT * FROM Auto
WHERE registri_nr NOT LIKE '[0-9][0-9][0-9][a-z][a-z][a-z]'; 

SELECT *
FROM Magaja
WHERE eesnimi LIKE '[A-D,K]%';

SELECT *
FROM Magaja
WHERE perenimi LIKE '%[?_]%';

--14--
SELECT *
FROM Magaja
WHERE perenimi NOT LIKE 'K%' AND len(perenimi)=4;

--15/16--
SELECT *
FROM Magaja
WHERE eesnimi IS NULL;

--17--
SELECT *
FROM Magaja
WHERE eesnimi IN ('Jaan', 'Jüri'); 

SELECT *
FROM Magaja
WHERE eesnimi ='Jaan' OR eesnimi='Jüri';

--18--
SELECT *
FROM Magaja
WHERE eesnimi NOT IN ('Jaan', 'Jüri');

SELECT *
FROM Magaja
WHERE NOT (eesnimi ='Jaan' OR eesnimi='Jüri');

--19--
SELECT *
FROM Ase
WHERE pikkus BETWEEN 210 AND 270;

SELECT *
FROM Ase
WHERE pikkus>= 210 AND pikkus<=270; 

--20--
SELECT *
FROM Ase
WHERE pikkus NOT BETWEEN 210 AND 270;

SELECT *
FROM Ase
WHERE NOT (pikkus BETWEEN 210 AND 270);

--21--
SELECT *
FROM Ase
WHERE (pikkus NOT BETWEEN 210 AND 270) OR (pikkus IS NULL);

--22--
SELECT *
FROM Magaja
WHERE (synni_aeg>#1976-01-01# AND sugu='M') OR
(synni_aeg>#1979-01-01# AND sugu='N' AND (telefon IS NOT NULL OR
aadress LIKE 'Tallinn%'))
ORDER BY synni_aeg; 

--23--
SELECT *
FROM Magaja
WHERE magaja_id NOT IN
(SELECT magaja_id
FROM Magaja
WHERE (synni_aeg>#1976-01-01# AND sugu='M') OR
(synni_aeg>#1979-01-01# AND sugu='N' AND (telefon IS NOT
NULL OR aadress LIKE 'Tallinn%'))); 

--24--
SELECT *
FROM Ase
WHERE (pikkus>270 AND laius<=180) OR (pikkus<=270 AND laius>180);

--25. esita erinevad perenimed suurtähtedega uues lahtris--
SELECT DISTINCT UCase(perenimi) AS [Perenimi suurtähtedega]
FROM Magaja;

--26. perenimi on "Vaarikas"--
SELECT *
FROM Magaja
WHERE perenimi='vaarikas';

--27. vabade asemete arv--
SELECT Count(*) AS vabade_arv
FROM Ase
WHERE vaba=TRUE;

SELECT Count(ase_id) AS vabade_arv
FROM Ase
WHERE vaba=TRUE;

--28--
SELECT Round(Avg(Date()-synni_aeg)) AS keskmine_vanus_päevades
FROM Magaja
WHERE sugu='M';

--29. keskmine vanus aastates--
SELECT Avg(Date()-synni_aeg)/365.25 AS keskmine_vanus_aastates
FROM Magaja;

--30. 2000. aastal alanud magamised--
SELECT *
FROM Magamine
WHERE algus >= #2000-01-01 00:00:00# AND algus < #2001-01-01
00:00:00#;

--31. meessoost magajate summaarne vanus--
SELECT Sum(Date()-synni_aeg) AS koguvanus_paevades
FROM Magaja
WHERE sugu='M'; 

--32. lühema ja pikema aseme pikkus ja nende pikkuste vahe--
SELECT Min(pikkus) AS lyhim, Max(pikkus) AS pikim, (Max(pikkus)-
Min(pikkus)) AS vahe
FROM Ase;

--33. magajate arv kelle eesnimi on määratud--
SELECT Count(eesnimi) AS eesnimega_isikute_arv
FROM Magaja;

SELECT Count(*) AS eesnimega_isikute_arv
FROM Magaja
WHERE eesnimi IS NOT NULL;

--34. perekonnanimede nimekiri ja sorteeri see kasvavas järjekorras--
SELECT TOP 2 perenimi  --top 2--
FROM Magaja
WHERE perenimi IS NOT NULL
ORDER BY perenimi;

SELECT TOP 25 PERCENT perenimi  --25%--
FROM Magaja
WHERE perenimi IS NOT NULL
ORDER BY perenimi; 

--35. asemed, mille pikkus on paarisarv--
SELECT ase_id, pikkus, 'Pikkus on paarisarv' AS kommentaar
FROM Ase
WHERE (pikkus mod 2)=0;

--36. magajad, kelle perekonnanimi sisaldab sümbolit v nubmrit--
SELECT *
FROM Magaja
WHERE perenimi LIKE '%[*]%' OR perenimi LIKE '%[?]%' OR perenimi LIKE
'%[[]%' OR perenimi LIKE '%[%]%' OR perenimi LIKE '%[_]%' OR perenimi
LIKE '%]%' OR perenimi LIKE '%[0-9]%';

--37. Magamine magaja numbrilise identifikaatori, magamise alguse aja, kestuse ja magamise lõpu aja--
SELECT magaja_id, algus, kestus, DateAdd('n', kestus, algus) AS lopp
FROM Magamine
WHERE algus IS NOT NULL AND kestus IS NOT NULL;

--38. 'M' = 'Mees', 'N' = 'Naine'--
SELECT magaja_id, perenimi, iif(sugu='M','Mees',iif(sugu='N','Naine','')) AS
s
FROM Magaja; 

--39. magajate id ja aadressid. Kui aadressi pole, siis "Aadress teadmata"
SELECT magaja_id, Nz(aadress, 'Aadress teadmata') AS aadr
FROM Magaja;

SELECT magaja_id, aadress
FROM Magaja
WHERE aadress IS NOT NULL
UNION SELECT magaja_id, 'Aadress teadmata'
FROM Magaja
WHERE aadress IS NULL; 

--40. random jrk--
SELECT *
FROM Magaja
ORDER BY Rnd(magaja_id);

--41. sorteeri perenimed teise ja kolmanda tähe järgi--
SELECT perenimi
FROM Magaja
ORDER BY Mid(perenimi, 2, 2);

--42. magajate arv, sündinud 1991 või hiljem ja magajate arv, 1960 või varem--
SELECT Count(iif(Year(synni_aeg)>1990,synni_aeg,NULL)) AS noorte_arv,
Count(iif(Year(synni_aeg)<=1960,synni_aeg,NULL)) AS vanade_arv
FROM Magaja;

SELECT Count(*) AS noorte_arv
FROM Magaja
WHERE Year(synni_aeg)>1990;
SELECT Count(*) AS vanade_arv
FROM Magaja
WHERE Year(synni_aeg)<=1960;

--43. käesoleval kuul alanud magamiste arv--
SELECT Count(*) AS arv
FROM Magamine
WHERE Month(algus)=Month(Date());

--44. asemed, mille pikkus ja laius ei lange kokku--
SELECT *
FROM Ase
WHERE ((pikkus <>laius) OR (pikkus IS NULL) OR (laius IS NULL)) AND
NOT (pikkus IS NULL AND laius IS NULL);

--45. asemed, mis on vähem kui 200 cm või rohkem kui 230 cm pikad--
SELECT
Count(iif(pikkus<200,1,NULL)) AS lühikeste_arv,
Count(iif(pikkus>230,1,NULL)) AS pikkade_arv
FROM Ase;

--46. magajate eesnimed, kordused eemaldatud, suurtähtedega, tähestikulisele järjekorrale vastupidi--
SELECT DISTINCT Ucase(eesnimi) AS eesnimi
FROM Magaja
ORDER BY Ucase(eesnimi) DESC; 
