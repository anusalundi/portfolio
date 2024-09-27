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
