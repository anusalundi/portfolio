CREATE TABLE Mark (
  Mark_ID SMALLINT NOT NULL,
  mark VARCHAR(50) NOT NULL,
  CONSTRAINT pk_mark PRIMARY KEY (Mark_ID),
  CONSTRAINT ak_mark_mark UNIQUE (mark));

CREATE TABLE Auto (
  Auto_ID INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  Mark_ID SMALLINT DEFAULT 1 NOT NULL,
  registri_nr VARCHAR (10) NOT NULL,
  CONSTRAINT pk_auto PRIMARY KEY (Auto_ID),
  CONSTRAINT fk_auto_mark_id FOREIGN KEY (Mark_ID) REFERENCES Mark (Mark_ID) ON UPDATE CASCADE ON DELETE NO ACTION,
  CONSTRAINT ak_auto_registri_nr UNIQUE (registri_nr));

ALTER TABLE Mark
ADD CONSTRAINT chk_mark_mark_id CHECK (Mark_ID>0);

ALTER TABLE Mark
ADD CONSTRAINT chk_mark_mark_id CHECK (mark<>'');

ALTER TABLE Auto
ADD CONSTRAINT chk_mark_mark_id_registri_nr CHECK (NOT (Mark_ID=1) OR registri_nr LIKE '00%');

INSERT INTO Mark (Mark_ID, mark) VALUES (1, 'Volvo');
INSERT INTO Mark (Mark_ID, mark) VALUES (11, 'Audi');

INSERT INTO Auto (registri_nr) VALUES '000ABC');
INSERT INTO Auto (registri_nr) VALUES '123ABC');

SELECT * FROM Auto;