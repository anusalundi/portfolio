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

SELECT DISTINCT perenimi
FROM Magaja;

SELECT *
FROM Magaja
WHERE eesnimi='Jaan';

SELECT *
FROM Magaja
WHERE eesnimi<>'Jaan';

SELECT *
FROM Magaja
WHERE eesnimi='Jaan' OR perenimi='Jaan';

SELECT *
FROM Magaja
WHERE perenimi LIKE 'J__n%';

SELECT * FROM Auto
WHERE registri_nr NOT LIKE '[0-9][0-9][0-9][a-z][a-z][a-z]'; 

SELECT *
FROM Magaja
WHERE eesnimi LIKE '[A-D,K]%';

SELECT *
FROM Magaja
WHERE perenimi LIKE '%[?_]%';

SELECT *
FROM Magaja
WHERE perenimi NOT LIKE 'K%' AND len(perenimi)=4;

SELECT *
FROM Magaja
WHERE eesnimi IS NULL;
