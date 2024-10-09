--MS Access--

CREATE TABLE Amet(
amet_kood SMALLINT,
nimetus VARCHAR(50) NOT NULL,
max_tootunde_nadalas SMALLINT NOT NULL DEFAULT 40,
min_palk CURRENCY NOT NULL,
CONSTRAINT pk_amet PRIMARY KEY(amet_kood),
CONSTRAINT ak_amet_nimetus UNIQUE(nimetus));

CREATE TABLE Amet(
amet_kood SMALLINT CONSTRAINT pk_amet PRIMARY KEY,
nimetus VARCHAR(50) NOT NULL CONSTRAINT ak_amet_nimetus UNIQUE,
max_tootunde_nadalas SMALLINT NOT NULL DEFAULT 40,
min_palk CURRENCY NOT NULL);

CREATE TABLE Tootaja(
tootaja_id AUTOINCREMENT,
amet_kood SMALLINT NOT NULL,
synni_kp DATETIME NOT NULL,
kontaktaadress VARCHAR(255) NOT NULL,
registr_aeg DATETIME NOT NULL DEFAULT Now(),
on_aktuaalne YESNO NOT NULL DEFAULT TRUE,
eesnimi VARCHAR(50),
perenimi VARCHAR(50),
CONSTRAINT pk_tootaja PRIMARY KEY(tootaja_id));

CREATE TABLE Tootaja(
tootaja_id AUTOINCREMENT CONSTRAINT pk_tootaja PRIMARY KEY,
amet_kood SMALLINT NOT NULL CONSTRAINT fk_Tootaja_amet_kood REFERENCES Amet(amet_kood) ON UPDATE CASCADE ON DELETE NO ACTION,
synni_kp DATETIME NOT NULL,
kontaktaadress VARCHAR(255) NOT NULL,
registr_aeg DATETIME NOT NULL DEFAULT Now(),
on_aktuaalne YESNO NOT NULL DEFAULT TRUE,
eesnimi VARCHAR(50),
perenimi VARCHAR(50));

--lisa välisvõtme kitsendus--
ALTER TABLE Tootaja 
ADD CONSTRAINT fk_Tootaja_amet_kood 
FOREIGN KEY (amet_kood) 
REFERENCES Amet(amet_kood) 
ON UPDATE CASCADE 
ON DELETE NO ACTION;

--tabel + välisvõtme kitsendus ühe lausega--
CREATE TABLE Tootaja(
tootaja_id AUTOINCREMENT,
amet_kood SMALLINT NOT NULL,
synni_kp DATETIME NOT NULL,
kontaktaadress VARCHAR(255) NOT NULL,
registr_aeg DATETIME NOT NULL DEFAULT Now(),
on_aktuaalne YESNO NOT NULL DEFAULT TRUE,
eesnimi VARCHAR(50),
perenimi VARCHAR(50),
CONSTRAINT pk_tootaja PRIMARY KEY(tootaja_id),
CONSTRAINT fk_Tootaja_amet_kood FOREIGN KEY (amet_kood) REFERENCES Amet(amet_kood) ON UPDATE CASCADE ON DELETE NO ACTION);

