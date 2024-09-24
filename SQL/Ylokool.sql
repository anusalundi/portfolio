SET client_encoding=LATIN9;

START TRANSACTION;

CREATE TABLE Aine (
aine_kood VARCHAR(7) NOT NULL,
nimetus VARCHAR(50) NOT NULL,
punkte DECIMAL(4,1) NOT NULL,
kommentaar TEXT,
märkused TEXT,
CONSTRAINT pk_aine PRIMARY KEY (aine_kood),
CONSTRAINT chk_aine_punkte CHECK(punkte>0));


CREATE TABLE Aktiivne_oppeaine (
aine_kood VARCHAR(7) NOT NULL,
nimetus VARCHAR(50) NOT NULL,
CONSTRAINT pk_aktiivne_oppeaine PRIMARY KEY (aine_kood),
CONSTRAINT ak_aktiivne_oppeaine_nimetus UNIQUE (nimetus));

CREATE TABLE Oppejoud (
oppejou_kood SERIAL,
eesnimi VARCHAR(50) NOT NULL,
perenimi VARCHAR(50) NOT NULL,
aadress VARCHAR(255),
kommentaar TEXT,
ylemus INTEGER,
CONSTRAINT pk_oppejoud PRIMARY KEY (oppejou_kood));

CREATE TABLE Tudeng  (
tudkood INTEGER NOT NULL,
eesnimi VARCHAR(50) NOT NULL,
perenimi VARCHAR(50) NOT NULL,
aadress VARCHAR(255),
vastuvotu_aeg DATE NOT NULL,
oppesuund VARCHAR(4) NOT NULL,
lopetanud BOOLEAN NOT NULL DEFAULT FALSE,
abi BOOLEAN NOT NULL DEFAULT FALSE,
CONSTRAINT pk_tudeng PRIMARY KEY (tudkood));

CREATE TABLE Oppimine (
oppimine SERIAL,
tudeng INTEGER NOT NULL,
aine VARCHAR(7) NOT NULL,
oppejoud INTEGER NOT NULL,
oppim_algus DATE NOT NULL DEFAULT CURRENT_DATE,
oppim_lopp DATE,
CONSTRAINT pk_oppimine PRIMARY KEY (oppimine),
CONSTRAINT ak_oppimine UNIQUE (tudeng, aine, oppim_algus),
CONSTRAINT chk_oppimine_oppim_lopp_oppim_algus CHECK(oppim_lopp>=oppim_algus));

CREATE TABLE Eksam (
eksam SERIAL,
oppimine INTEGER NOT NULL,
tulemus SMALLINT NOT NULL,
kuupaev DATE NOT NULL DEFAULT CURRENT_DATE,
CONSTRAINT  pk_eksam PRIMARY KEY (eksam),
CONSTRAINT chk_eksam_tulemus CHECK (tulemus BETWEEN 0 AND 5));


ALTER TABLE Oppimine ADD CONSTRAINT fk_Oppimine_tudeng FOREIGN KEY (tudeng) REFERENCES Tudeng(tudkood) ON UPDATE CASCADE ON DELETE CASCADE;
CREATE INDEX idx_Oppimine_tudeng ON Oppimine(tudeng);

ALTER TABLE Eksam ADD CONSTRAINT fk_Eksam_oppimine FOREIGN KEY (oppimine) REFERENCES Oppimine(oppimine) ON DELETE CASCADE;
CREATE INDEX idx_Eksam_oppimine ON Eksam(oppimine);

ALTER TABLE Oppimine ADD CONSTRAINT fk_Oppimine_oppejoud FOREIGN KEY (oppejoud) REFERENCES Oppejoud(oppejou_kood) ON UPDATE CASCADE ON DELETE CASCADE;
CREATE INDEX idx_Oppimine_oppejoud ON Oppimine(oppejoud);

ALTER TABLE Oppimine ADD CONSTRAINT fk_Oppimine_aine FOREIGN KEY (aine) REFERENCES Aine(aine_kood) ON UPDATE CASCADE ON DELETE CASCADE;
CREATE INDEX idx_Oppimine_aine ON Oppimine(aine);

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'FYS0001', 
 'Füüsika 1', 
 3.5, 
 'Ainekava vajab muutmist', 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'FYS0002', 
 'Füüsika 2', 
 3.5, 
 NULL, 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'FYY1092', 
 'Füüsika 3', 
 2, 
 NULL, 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'FYY2092', 
 'Füüsika 4', 
 2, 
 NULL, 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'HHA5200', 
 'Avalikkussuhted', 
 3.5, 
 'Ainekava vajab muutmist', 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'HHA5400', 
 'Sotsioloogia', 
 3.5, 
 'Ainekava ei vaja muutmist', 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'HHU5100', 
 'Psühholoogia', 
 1.5, 
 NULL, 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'HUU5500', 
 'Psühholoogia - projekt', 
 1.5, 
 NULL, 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'IDU5661', 
 'Infosüsteemide projekteerimine', 
 3.5, 
 NULL, 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'IDU5662', 
 'Infosüsteemide projekteerimine - projekt', 
 1.5, 
 'Ainekava majab muutmist', 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'YYA0001', 
 'Matemaatiline analüüs 1', 
 3.5, 
 'Ainekava vajab muutmist', 
 NULL );

INSERT INTO Aine (aine_kood, nimetus, punkte, kommentaar, märkused)
VALUES (
 'YYA0002', 
 'Matemaatiline analüüs 2', 
 3.5, 
 NULL, 
 NULL );

INSERT INTO Aktiivne_oppeaine (aine_kood, nimetus) VALUES ('IDU3430', 'Andmebaasisüsteemid');

INSERT INTO Oppejoud (oppejou_kood, eesnimi, perenimi, aadress, kommentaar, ylemus)
VALUES (
 1, 
 'Andres', 
 'Kallas', 
 'Tallinn, Paekaare 23-15', 
 NULL, 
 2 );

INSERT INTO Oppejoud (oppejou_kood, eesnimi, perenimi, aadress, kommentaar, ylemus)
VALUES (
 2, 
 'Juhan', 
 'Juurikas', 
 'Tallinn, Sütiste 11-2', 
 NULL, 
 NULL );

INSERT INTO Oppejoud (oppejou_kood, eesnimi, perenimi, aadress, kommentaar, ylemus)
VALUES (
 3, 
 'Mart', 
 'Aavik', 
 'Viimsi, Saha tee', 
 'Praktikant', 
 2 );

INSERT INTO Oppejoud (oppejou_kood, eesnimi, perenimi, aadress, kommentaar, ylemus)
VALUES (
 4, 
 'Agu', 
 'Aas', 
 'Saue, Garaazi põik 2', 
 NULL, 
 2 );

INSERT INTO Oppejoud (oppejou_kood, eesnimi, perenimi, aadress, kommentaar, ylemus)
VALUES (
 5, 
 'Karl', 
 'Kusti', 
 'Tallinn, Sõle 11-11', 
 NULL, 
 2 );

INSERT INTO Oppejoud (oppejou_kood, eesnimi, perenimi, aadress, kommentaar, ylemus)
VALUES (
 6, 
 'Mari', 
 'Mesi', 
 'Tallinn, Linnu tee 23', 
 NULL, 
 NULL );

INSERT INTO Oppejoud (oppejou_kood, eesnimi, perenimi, aadress, kommentaar, ylemus)
VALUES (
 7, 
 'Ene', 
 'Lepp', 
 'Tallinn, Janseni 22-11', 
 NULL, 
 6 );

ALTER TABLE Oppejoud ADD CONSTRAINT fk_Oppejoud_ylemus FOREIGN KEY (ylemus) REFERENCES Oppejoud(oppejou_kood) ON UPDATE CASCADE ON DELETE CASCADE;
CREATE INDEX idx_Oppejoud_ylemus ON Oppejoud(ylemus);

SELECT setval('oppejoud_oppejou_kood_seq', 7);

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 21, 
 'Ants', 
 'Koll', 
 'Tallinn, Ehitajate tee 11-1', 
 '1994-09-01', 
 'LZS', 
 't', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 23, 
 'Kaarel', 
 'Kala', 
 'Tallinn, Ristiku 2', 
 '1998-09-01', 
 'LAP', 
 't', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 34, 
 'Mart', 
 'Mesi', 
 'Tallinn, Paekaare 223-11', 
 '1998-09-01', 
 'LZP', 
 't', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 56, 
 'Teet', 
 'Tee', 
 'Kallavere', 
 '1998-09-01', 
 'LDP', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 65, 
 'Tanel', 
 'Tarm', 
 'Tabasalu, Kaare tee 3', 
 '1998-09-01', 
 'LAP', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 66, 
 'Toomas', 
 'Tuul', 
 'Tallinn, Paekaare 223-11', 
 '1998-09-01', 
 'LAS', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 67, 
 'Andres', 
 'Laas', 
 'Tartu, Tähe tn. 11', 
 '1998-09-01', 
 'LAP', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 68, 
 'Juuli', 
 'Lumi', 
 'Tapa, Kivistiku 23', 
 '1999-09-01', 
 'LAS', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 70, 
 'Valli', 
 'Haamer', 
 'Tallinn, Ehitajate tee 15-5', 
 '1999-09-01', 
 'LAP', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 71, 
 'Anneli', 
 'Linnela', 
 'Tallinn, Ehitajate tee 15-5', 
 '1999-09-01', 
 'LAP', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 72, 
 'Uuno', 
 'Uugo', 
 'Tallinn , Ehitajate tee 15-3', 
 '2000-09-01', 
 'LAP', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 73, 
 'Eneken', 
 'Lill', 
 'Mustvee', 
 '2001-09-01', 
 'LAS', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 74, 
 'Andres', 
 'Sammal', 
 'Tõrva, Ristiku 11', 
 '2001-09-01', 
 'LAP', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 75, 
 'Armin', 
 'Ammas', 
 'Tartu, Riia tn. 15', 
 '2002-09-01', 
 'LAP', 
 'f', 
 'f');

INSERT INTO Tudeng (tudkood, eesnimi, perenimi, aadress, vastuvotu_aeg, oppesuund, lopetanud, abi)
VALUES (
 76, 
 'Kalle', 
 'Kuusta', 
 'Tallinn, Lasti 1', 
 '1994-09-01', 
 'LZP', 
 't', 
 'f');
 
 
 
 
INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 12, 
 23, 
 'FYS0001', 
 1, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 13, 
 34, 
 'FYS0001', 
 1, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 14, 
 56, 
 'FYS0001', 
 1, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 15, 
 65, 
 'FYS0001', 
 1, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 16, 
 66, 
 'FYS0001', 
 1, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 17, 
 67, 
 'FYS0001', 
 1, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 18, 
 68, 
 'FYS0001', 
 1, 
 '1999-09-01', 
 '2000-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 19, 
 70, 
 'FYS0001', 
 1, 
 '1999-09-01', 
 '2000-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 20, 
 71, 
 'FYS0001', 
 1, 
 '1999-09-01', 
 '2000-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 21, 
 23, 
 'YYA0001', 
 3, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 22, 
 34, 
 'YYA0001', 
 3, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 23, 
 56, 
 'YYA0001', 
 3, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 24, 
 70, 
 'YYA0001', 
 3, 
 '1999-09-01', 
 '2000-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 25, 
 56, 
 'HHA5200', 
 5, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 26, 
 68, 
 'HHA5200', 
 5, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 27, 
 70, 
 'HHA5200', 
 5, 
 '1999-09-01', 
 '2000-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 28, 
 68, 
 'HHA5400', 
 5, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 29, 
 70, 
 'HHA5400', 
 5, 
 '1999-09-01', 
 '2000-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 30, 
 71, 
 'IDU5661', 
 2, 
 '1999-09-01', 
 '2000-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 31, 
 66, 
 'IDU5661', 
 2, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 32, 
 34, 
 'IDU5661', 
 2, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 33, 
 23, 
 'IDU5661', 
 2, 
 '1998-09-01', 
 '2001-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 34, 
 71, 
 'IDU5661', 
 2, 
 '2001-09-01', 
 '2002-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 35, 
 66, 
 'IDU5662', 
 2, 
 '1998-09-01', 
 '1999-01-21');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 36, 
 66, 
 'IDU5661', 
 2, 
 '2000-09-01', 
 NULL );

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 37, 
 70, 
 'IDU5661', 
 2, 
 '2000-09-01', 
 '2001-09-01');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 38, 
 74, 
 'IDU5661', 
 2, 
 '2002-09-01', 
 '2003-06-15');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 39, 
 74, 
 'IDU5662', 
 2, 
 '2002-09-01', 
 '2003-06-15');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 40, 
 21, 
 'FYY1092', 
 2, 
 '1994-09-01', 
 '1995-05-22');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 41, 
 21, 
 'FYY2092', 
 2, 
 '1995-09-01', 
 '1997-01-24');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 42, 
 21, 
 'FYY2092', 
 2, 
 '1997-09-01', 
 '1998-01-28');

INSERT INTO Oppimine (oppimine, tudeng, aine, oppejoud, oppim_algus, oppim_lopp)
VALUES (
 43, 
 21, 
 'HUU5500', 
 5, 
 '1994-09-01', 
 '1995-01-22');
 
 /*Järgmine generaatori väljastatav väärtus on 44*/
SELECT setval('oppimine_oppimine_seq', 43);
 
 
INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 1, 
 12, 
 5, 
 '1999-01-20');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 2, 
 13, 
 0, 
 '1999-01-05');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 3, 
 13, 
 2, 
 '1999-01-20');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 4, 
 14, 
 0, 
 '1999-01-11');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 5, 
 16, 
 2, 
 '1999-01-11');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 6, 
 17, 
 1, 
 '1999-01-11');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 7, 
 18, 
 3, 
 '2000-01-22');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 8, 
 19, 
 3, 
 '2000-01-14');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 9, 
 20, 
 0, 
 '2000-01-11');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 10, 
 22, 
 5, 
 '1999-01-15');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 11, 
 23, 
 0, 
 '1999-01-15');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 12, 
 24, 
 4, 
 '2000-01-03');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 13, 
 25, 
 0, 
 '1999-01-05');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 14, 
 26, 
 5, 
 '1999-01-05');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 15, 
 27, 
 4, 
 '1999-09-01');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 16, 
 28, 
 5, 
 '1999-01-10');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 17, 
 29, 
 3, 
 '2000-01-03');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 18, 
 30, 
 4, 
 '2000-01-05');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 19, 
 31, 
 5, 
 '1999-01-20');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 20, 
 33, 
 0, 
 '1999-01-20');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 21, 
 33, 
 0, 
 '2000-05-21');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 22, 
 33, 
 5, 
 '2001-01-20');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 23, 
 34, 
 4, 
 '2002-01-12');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 24, 
 35, 
 3, 
 '1999-01-06');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 25, 
 36, 
 2, 
 '2000-01-05');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 26, 
 37, 
 1, 
 '2001-01-15');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 27, 
 37, 
 5, 
 '2001-08-31');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 28, 
 38, 
 4, 
 '2003-06-10');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 29, 
 39, 
 4, 
 '2003-06-10');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 30, 
 41, 
 0, 
 '1996-01-05');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 31, 
 41, 
 0, 
 '1996-06-22');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 32, 
 41, 
 0, 
 '1997-01-07');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 33, 
 42, 
 3, 
 '1998-01-11');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 34, 
 25, 
 4, 
 '1999-01-12');

INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 35, 
35, 
 5, 
 '1999-03-07');
 
 INSERT INTO Eksam (eksam, oppimine, tulemus, kuupaev)
VALUES (
 36, 
36, 
 4, 
 '2000-04-01');

 /*Järgmine generaatori väljastatav väärtus on 37*/
SELECT setval('eksam_eksam_seq', 36);

ALTER TABLE Eksam ADD CONSTRAINT ak_eksam UNIQUE (kuupaev, oppimine);

COMMIT;
