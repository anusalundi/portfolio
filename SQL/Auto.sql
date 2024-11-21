CREATE TABLE Mark (
    Mark_ID SMALLINT NOT NULL,
    mark VARCHAR (50) NOT NULL,
    CONSTRAINT pk_mark PRIMARY KEY (Mark_ID),
    CONSTRAINT ak_mark_mark UNIQUE (mark)
);

CREATE TABLE Auto (
    Auto_ID AUTOINCREMENT NOT NULL,
    Mark_ID SMALLINT DEFAULT 1 NOT NULL,
    registri_nr VARCHAR(10) NOT NULL,
    CONSTRAINT pk_auto PRIMARY KEY (Auto_ID),
    CONSTRAINT fk_auto_mark_id FOREIGN KEY (Mark_ID) REFERENCES Mark (Mark_ID) ON UPDATE CASCADE,
    CONSTRAINT ak_auto_registri_nr UNIQUE(registri_nr)
);
