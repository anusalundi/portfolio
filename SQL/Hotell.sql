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
