SELECT 231+4568 AS vastus1, 
       987/54 AS vastus2, 
       (332-25)*456 AS vastus3, 
       2^3 AS vastus4;

SELECT 231+4568 AS vastus FROM DummyTable
UNION ALL
SELECT 987/54 AS vastus FROM DummyTable
UNION ALL
SELECT (332-25)*456 AS vastus FROM DummyTable
UNION ALL
SELECT 2^3 AS vastus FROM DummyTable;

SELECT * FROM Magaja;

SELECT magaja_id, synni_aeg, aadress, telefon, eesnimi, perenimi
FROM Magaja;

SELECT ase_id, pikkus/100 AS pikkus_meetrites
FROM Ase;

SELECT magaja_id, eesnimi, perenimi
FROM Magaja
ORDER BY perenimi ASC;

SELECT *
FROM Magaja
ORDER BY perenimi DESC, synni_aeg ASC;

SELECT ase_id, nimi
FROM Ase
Order BY pikkus;

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

--29. keskmine vanus aastates--
SELECT Avg(Date()-synni_aeg)/365.25 AS keskmine_vanus_aastates
FROM Magaja;
