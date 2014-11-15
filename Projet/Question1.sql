/* Projet de Base de données */

-- ==================================
-- Nom de la base: OFFRES_DE_SEJOURS
-- SGBD: Oracle Database 11g Express Edition
-- ==================================
drop table CALENDRIER cascade constraint;

drop table TARIFS cascade constraint;

drop table SEJOURS cascade constraint;

drop table PAYS cascade constraint;

-- ============================================================
--   Table : PAYS                                              
-- ============================================================
create table PAYS
(
	CODEPAYS	number		not null,
	NOMPAYS		char(20)			,
	constraint pk_pays primary key (CODEPAYS)
);

-- ============================================================
--   Table : SEJOURS                                              
-- ============================================================
create table SEJOURS
(
	CODESEJOUR			varchar(7)	not null,
	CODEPAYS			number		not null,
	NOMSEJOUR			varchar(30)			,
	DESCRIPTION_SEJOUR	varchar(50)			,
	constraint pk_sejours primary key (CODESEJOUR)
);

-- ============================================================
--   Table : CALENDRIER                                              
-- ============================================================
create table CALENDRIER
(
	NOSEM	number	not null,
	DATEDEB	date			,
	DATEFIN	date			,
	constraint pk_calendrier primary key (NOSEM)
);

-- ============================================================
--   Table : TARIFS                                              
-- ============================================================
create table TARIFS
(
	CODESEJOUR		varchar(7)	not null,
	NOSEM			number				,
	PRIXTTC			number				,
	constraint pk_tarifs primary key (CODESEJOUR,NOSEM)
);

alter table SEJOURS
	add constraint fk1_sejours foreign key (CODEPAYS)
		references PAYS (CODEPAYS);

alter  table TARIFS
	add constraint fk1_tarifs foreign key (CODESEJOUR)
		references SEJOURS (CODESEJOUR);
		
alter  table TARIFS
	add constraint fk2_tarifs foreign key (NOSEM)
		references CALENDRIER (NOSEM);