SELECT *
FROM Hotell;

SELECT hotelli_nr, nimi
FROM Hotell
ORDER BY nimi;

SELECT hotelli_nr
FROM Hotell
WHERE linn='Tartu';

SELECT hotelli_nr, Ucase(nimi) AS hotelli_nimi
FROM Hotell
WHERE linn<>'Tallinn';

SELECT Avg(hind) AS keskmine_hind, Min(hind) AS minimaalane, Max(hind) AS maksimaalne, Sum(hind) AS hindande_summa, Count(hind) AS hinnaga_ruumide_arv, Max(hind)-Min(hind) AS vahe
FROM Ruum;

SELECT Count(*) AS arv
FROM Hotell
WHERE linn='Tallinn';

SELECT Ruum.*, Hotell.nimi AS hotelli_nimi
FROM Hotell, Ruum
WHERE Hotell.hotelli_nr=Ruum.hotelli_nr AND Ruum.hind>300;

SELECT Reserveerimine.*, Hotell.nimi AS hotelli_nimi, Külaline.perenimi
FROM Külaline INNER JOIN (Reserveerimine INNER JOIN Hotell ON Reserveerimine.hotelli_nr=Hotell.hotelli_nr) ON Külaline.külalise_nr=Reserveerimine.külalise_nr
ORDER BY Hotell.nimi DESC , Külaline.külalise_nr;

SELECT Hotell.hotelli_nr, Hotell.nimi, Count(Reserveerimine.hotelli_nr) AS arv
FROM Hotell LEFT JOIN Reserveerimine ON Hotell.hotelli_nr=Reserveerimine.hotelli_nr
GROUP BY Hotell.hotelli_nr, Hotell.nimi
ORDER BY Count(Reserveerimine.hotelli_nr) DESC;

SELECT *
FROM Hotell
WHERE hotelli_nr <>ALL (SELECT hotelli_nr FROM Reserveerimine WHERE hotelli_nr IS NOT NULL);

SELECT DISTINCT eesnimi
FROM Külaline;

SELECT külalise_nr
FROM Reserveerimine
GROUP BY külalise_nr
HAVING Count(*)>2;

SELECT Külaline.külalise_nr, Külaline.eesnimi, Külaline.perenimi, Külaline.aadress, Count(Reserveerimine.külalise_nr) AS arv
FROM Külaline INNER JOIN Reserveerimine ON Külaline.külalise_nr=Reserveerimine.külalise_nr
GROUP BY Külaline.külalise_nr, Külaline.eesnimi, Külaline.perenimi, Külaline.aadress
HAVING Count(Reserveerimine.külalise_nr)>=ALL(SELECT Count(*) AS arv FROM Reserveerimine GROUP BY külalise_nr);

SELECT K.külalise_nr, K.perenimi, H.hotelli_nr, H.nimi
FROM Külaline AS K, Hotell AS H
WHERE NOT EXISTS (SELECT * FROM Reserveerimine AS RE
WHERE RE.külalise_nr=K.külalise_nr AND RE.hotelli_nr=H.hotelli_nr)
ORDER BY K.külalise_nr;

SELECT Count(eesnimi) AS arv
FROM (SELECT DISTINCT eesnimi FROM Külaline)  AS erinevad_eesnimed;

SELECT alguse_aeg AS kuupäev
FROM Reserveerimine
UNION SELECT lopu_aeg 
FROM Reserveerimine
ORDER BY kuupäev DESC;

SELECT külalise_nr, Trim(eesnimi & ' ' & perenimi) AS külalise_nimi
FROM Reserveerimine
WHERE hotelli_nr IN (SELECT hotelli_nr
FROM Hotell
WHERE nimi='Viru');

SELECT külalise_nr, Trim(eesnimi & ' ' & perenimi) AS külalise_nimi
FROM Külaline
WHERE külalise_nr NOT IN(
SELECT külalise_nr
FROM Reserveerimine
WHERE hotelli_nr IN (SELECT hotelli_nr
FROM Hotell
WHERE nimi='Viru'))
ORDER BY perenimi, külalise_nr;

SELECT Round (Avg (lopu_aeg-alguse_aeg),2) AS pikkus,
Min (lopu_aeg-alguse_aeg) AS min_pikkus,
Max (lopu_aeg-alguse_aeg) AS max_pikkus
FROM Reserveerimine AS R, Hotell AS H
WHERE R.hotelli_nr=H.hotelli_nr
AND H.linn='Tallinn'
AND lopu_aeg-alguse_aeg>2;

SELECT Year(alguse_aeg) AS aasta, Count(*) AS arv
FROM Reserveerimine
WHERE hotelli_nr = ANY (SELECT hotelli_nr
FROM Hotell
WHERE nimi='Viru')
GROUP BY Year(alguse_aeg)
HAVING Count (*)>=ALL(SELECT Count(*) AS arv
FROM Reserveerimine
WHERE hotelli_nr = ANY (SELECT hotelli_nr
FROM Hotell
WHERE nimi='Viru')
GROUP BY Year(alguse_aeg));

SELECT Külaline.külalise_nr, Trim(eesinimi & ' ' & perenimi) AS külalise_nimi
FROM Külaline INNER JOIN Reserveerimine ON Külaline.külalise_nr=Reserveerimine.külalise_nr
GROUP BY Külaline.külalise_nr, Trim(eesinimi & ' ' & perenimi)
HAVING Count(*)> (SELECT Avg(arv) AS keskmine
FROM (SELECT Count(*) AS arv
FROM Reserveerimine
GROUP BY külalise_nr) AS res_arv)
ORDER BY Külaline.külalise_nr;

SELECT *
FROM (SELECT K.külalise_nr, perenimi, Month(alguse_aeg) AS alguse_kuu, Count(*)
AS arv
FROM Külaline AS K, Reserveerimine AS R
WHERE K.Külalise_nr=R.külalise_nr
GROUP BY K.külalise_nr, perenimi, Month(alguse_aeg)) AS Rk
WHERE arv = (SELECT Max(arv) AS maks
FROM (SELECT külalise_nr, Month(alguse_aeg) AS alguse_kuu, Count(*)
AS arv
FROM Reserveerimine AS R
GROUP BY külalise_nr, Month(alguse_aeg)) AS Res_kuu
WHERE Rk.külalise_nr=Res_kuu.külalise_nr);
