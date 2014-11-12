DROP TABLE NOTES;
DROP TABLE ETUDIANTS;
DROP TABLE MATIERES;
DROP TABLE ETUD_OLD;

CREATE TABLE ETUDIANTS (
	NUM_ETU NUMBER PRIMARY KEY,
	NOM_ETU VARCHAR2(20),
	PRENOM_ETU VARCHAR2(20),
	ANNEE_ETU NUMBER
);

CREATE TABLE MATIERES (
	CODE_MAT CHAR(5) PRIMARY KEY,
	NOM_MAT VARCHAR2(20),
	COEFF_MAT NUMBER
);

CREATE TABLE NOTES (
	CODE_MAT CHAR(5),
	NUM_ETU NUMBER,
	NOTE NUMBER,
	CONSTRAINT PK_NOTES PRIMARY KEY (CODE_MAT, NUM_ETU),
	CONSTRAINT FK_MAT FOREIGN KEY (CODE_MAT) REFERENCES MATIERES(CODE_MAT),
	CONSTRAINT FK_ETU FOREIGN KEY (NUM_ETU) REFERENCES ETUDIANTS(NUM_ETU) on delete cascade
);

INSERT INTO ETUDIANTS VALUES (1,'DURAND','LIONEL',1);
INSERT INTO ETUDIANTS VALUES (2,'BROUARD','DAVID',1);
INSERT INTO ETUDIANTS VALUES (3,'CHANAY','DENIS',2);
INSERT INTO ETUDIANTS VALUES (4,'VERA','MIKE',1);

INSERT INTO MATIERES VALUES ('I_307','SGBDRO',2);
INSERT INTO MATIERES VALUES ('R_202','Reseaux',1);
INSERT INTO MATIERES VALUES ('I_103','Java',3);


INSERT INTO NOTES VALUES ('I_103',1,5);
INSERT INTO NOTES VALUES ('I_103',2,15);
INSERT INTO NOTES VALUES ('I_103',4, 7);

INSERT INTO NOTES VALUES ('R_202',1,8);
INSERT INTO NOTES VALUES ('R_202',2,13);
INSERT INTO NOTES VALUES ('R_202',4,11);

INSERT INTO NOTES VALUES ('I_307',1,5);
INSERT INTO NOTES VALUES ('I_307',2,14);
INSERT INTO NOTES VALUES ('I_307',4,11);


CREATE TABLE ETUD_OLD (
	NUM_OLD NUMBER PRIMARY KEY,
	NOM_OLD VARCHAR2(20),
	PRENOM_OLD VARCHAR2(20),
	DATE_SORTIE DATE
);

