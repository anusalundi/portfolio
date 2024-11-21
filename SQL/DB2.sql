--MS Access--

--1. hetke kuupäev ja kellaaeg--
SELECT Now() AS hetke_kuupaev_ja_kellaaeg, Date() AS hetke_kuupäev, Time() AS hetke_kellaaeg;

--2. 2 tbelit kokku üheks--
SELECT Magaja.*, Magamine.*
FROM Magaja, Magamine;

SELECT *
FROM Magaja, Magamine;

--3. magamiste andmed mitmest tabelist ühte kokku--
SELECT Magaja.magaja_id, Magaja.eesnimi & ' ' & Magaja.perenimi AS
magaja_nimi, Ase.ase_id, Ase.nimi AS aseme_nimi, Magamine.algus,
Magamine.kestus, Magamine.kommentaar
FROM Magamine, Magaja, Ase
WHERE (Magamine.magaja_id=Magaja.magaja_id) AND
(Magamine.ase_id=Ase.ase_id);

SELECT Magaja.magaja_id, Magaja.eesnimi & ' ' & Magaja.perenimi AS
magaja_nimi, Ase.ase_id, Ase.nimi AS aseme_nimi, Magamine.algus,
Magamine.kestus, Magamine.kommentaar
FROM Magaja INNER JOIN (Ase INNER JOIN Magamine ON Ase.ase_id = Magamine.ase_id) ON Magaja.magaja_id = Magamine.magaja_id;

--4. alias--
SELECT M.magaja_id, eesnimi & ' ' & perenimi AS magaja_nimi, A.ase_id,
nimi AS aseme_nimi, algus, kestus, Ma.kommentaar
FROM Magamine AS Ma, Magaja AS M, Ase AS A
WHERE (Ma.magaja_id=M.magaja_id) AND (Ma.ase_id=A.ase_id);

SELECT M.magaja_id, M.eesnimi & ' ' & M.perenimi AS magaja_nimi,
A.ase_id, A.nimi AS aseme_nimi, Ma.algus, Ma.kestus, Ma.kommentaar
FROM Magaja AS M INNER JOIN (Ase AS A INNER JOIN Magamine AS
MA ON A.ase_id = Ma.ase_id) ON M.magaja_id = Ma.magaja_id;

SELECT M.magaja_id, eesnimi & ' ' & perenimi AS magaja_nimi, A.ase_id,
nimi AS aseme_nimi, algus, kestus, Ma.kommentaar
FROM Magamine Ma, Magaja M, Ase A
WHERE (Ma.magaja_id=M.magaja_id) AND (Ma.ase_id=A.ase_id); 
