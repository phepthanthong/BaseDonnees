/* Projet de Base de données */
/* MODIFICATION DE LA BASE INITIALE */

-- ==================================
-- Nom de la base: AGENCE DE VOYAGE
-- SGBD: Oracle Database 11g Express Edition
-- ==================================
drop table CALENDRIER cascade constraint;

drop table TARIFS cascade constraint;

drop table SEJOURS cascade constraint;

drop table PAYS cascade constraint;

drop table CIRCUITS cascade constraint;

drop table ETAP_SEJ cascade constraint;

drop table VILLE_ETAP cascade constraint;

drop table HOTEL_RESIDENCE cascade constraint;

drop table DETAIL_RESERV cascade constraint;

drop table RESERVATION cascade constraint;

drop table HEBERGEMENT cascade constraint;

drop table TRANSPORT cascade constraint;	

-- ============================================================
--   Table : SEJOURS                                              
-- ============================================================
create table SEJOURS
(
	CODESEJOUR			varchar(7)	not null,
	TYPE_SEJOUR			char(1)		not null,
	NB_RESERV			number				,
	NB_SEJOURS			number		not null,
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
	REDUC_ENF		number				,
	PRIX_SEM_SUP	number				,
	SUPPL_CH_SEULE	number				,	
	constraint pk_tarifs primary key (CODESEJOUR,NOSEM)
);

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
--   Table : CIRCUITS                                             
-- ============================================================
create table CIRCUITS
(
	CODESEJOUR			varchar(7)	not null,
	NOMSEJOUR			varchar(30)			,
	DESCRIPTION_SEJOUR	varchar(50)			,
	TYPE_TRANS			char(2)				,
	TYPE_HEBERG			char(2)				,
	NB_JOURS			number				,
	NB_NUITS			number				,
	NB_SEJOURS			number				,
	constraint pk_circuits primary key (CODESEJOUR)
);

-- ============================================================
--   Table : ETAP_SEJ                                              
-- ============================================================
create table ETAP_SEJ
(
	CODESEJOUR		varchar(7)	not null,
	RANG_PAS		number				,
	CODEVILLE		number		not null,
	NB_JOURS_ETAP	number				,
	constraint pk_etap_sej primary key (CODESEJOUR,RANG_PAS)
);

-- ============================================================
--   Table : VILLE_ETAP                                              
-- ============================================================
create table VILLE_ETAP
(
	CODEVILLE	number	not null,
	CODEPAYS	number	not null,
	NOMVILLE	varchar(15)		,
	constraint pk_ville_etap primary key (CODEVILLE)
);

-- ============================================================
--   Table : HOTEL_RESIDENCE                                              
-- ============================================================
create table HOTEL_RESIDENCE
(
	CODESEJOUR			varchar(7)	not null,
	CODEVILLE			number		not null,
	NOM_HOTEL			varchar(15)			,
	NB_ETOILE			number				,
	ADR_HOTEL			varchar(30)			,
	TEL_HOTEL			number				,
	NOMSEJOUR			varchar(30)			,
	DESCRIPTION_SEJOUR	varchar(50)			,
	TYPE_HEBERG			char(2)				,
	NB_JOURS			number				,	
	NB_NUITS			number				,
	NB_SEJOURS			number				,
	constraint pk_hotel_residence primary key (CODESEJOUR)
);

-- ============================================================
--   Table : RESERVATION                                              
-- ============================================================
create table RESERVATION
(	
	CODERES			number		not null,
	NOM_PERS		varchar(10)	not null,
	PRENOM_PERS		varchar(10)	not null,
	ADR_PERS		varchar(30)	not null,
	CODEPOST_PERS	varchar(5)	not null,
	VILLE_PERS		varchar(10)	not null,
	TEL_PERS		number		not null,
	DATE_RES		date		not null,
	NB_ADULTS		number		not null,
	NB_ENF			number		not null,
	SOMME_VERSEE	number				,
	DATE_DE_VERSEE	date				,
	MONT_RESERV		number		not null,
	constraint pk_reservation primary key (CODERES)
);
	
-- ============================================================
--   Table : DETAIL_RESERV                                              
-- ============================================================
create table DETAIL_RESERV
(
	NOSEM			number		not null,
	CODERES			number		not null,
	CODESEJOUR		varchar(7)	not null,
	PRIXTTC_ADULT	number		not null,
	PRIXTTC_ENF		number		not null,
	constraint pk_detail_reserv primary key (NOSEM,CODERES)
);

-- ============================================================
--   Table : TRANSPORT                                             
-- ============================================================
create table TRANSPORT
(
	TYPE_TRANS 	char(2) not null,
	NOM_TRANS	char(20) not null,
	constraint pk_transport primary key (TYPE_TRANS)
);

-- ============================================================
--   Table : HEBERGEMENT                                            
-- ============================================================
create table HEBERGEMENT
(
	TYPE_HEBERG	char(2) 	not null,
	NOM_HEBERG	char(20) 	not null,
	constraint pk_hebergement primary key (TYPE_HEBERG)
);

alter table TARIFS
	add constraint fk1_tarifs foreign key (CODESEJOUR)
		references SEJOURS (CODESEJOUR);
		
alter table TARIFS
	add constraint fk2_tarifs foreign key (NOSEM)
		references CALENDRIER (NOSEM);

alter table DETAIL_RESERV
	add constraint fk1_detail_reserv foreign key (NOSEM)
		references CALENDRIER (NOSEM);
		
alter table DETAIL_RESERV
	add constraint fk2_detail_reserv foreign key (CODERES)
		references RESERVATION (CODERES);

alter table DETAIL_RESERV
	add constraint fk3_detail_reserv foreign key (CODESEJOUR)
		references SEJOURS (CODESEJOUR);
		
alter table HOTEL_RESIDENCE
	add constraint fk1_hotel_residence foreign key (CODESEJOUR)
		references SEJOURS (CODESEJOUR);
		
alter table HOTEL_RESIDENCE
	add constraint fk2_hotel_residence foreign key (CODEVILLE)
		references VILLE_ETAP (CODEVILLE);
		
alter table HOTEL_RESIDENCE
	add constraint fk3_hotel_residence foreign key (TYPE_HEBERG)
		references HEBERGEMENT (TYPE_HEBERG);
		
alter table CIRCUITS
	add constraint fk1_circuits foreign key (CODESEJOUR)
		references SEJOURS (CODESEJOUR);
		
alter table CIRCUITS
	add constraint fk2_circuits foreign key (TYPE_TRANS)
		references TRANSPORT (TYPE_TRANS);
		
alter table CIRCUITS
	add constraint fk3_circuits foreign key (TYPE_HEBERG)
		references HEBERGEMENT (TYPE_HEBERG);	
		
alter table ETAP_SEJ
	add constraint fk1_etap_sej foreign key (CODESEJOUR)
		references CIRCUITS (CODESEJOUR);
		
alter table ETAP_SEJ
	add constraint fk2_etap_sej foreign key (CODEVILLE)
		references VILLE_ETAP (CODEVILLE);
		
alter table VILLE_ETAP
	add constraint fk1_ville_etap foreign key (CODEPAYS)
		references PAYS (CODEPAYS);
		

