/* INSERTION DES DONNEES DANS LA NOUVELLE BASE */

delete from TARIFS;
delete from CALENDRIER;
delete from SEJOURS;
delete from PAYS;
delete from VILLE_ETAP;
delete from ETAP_SEJ;
delete from CIRCUITS;
delete from RESERVATION;
delete from DETAIL_RESERV;
delete from HOTEL_RESIDENCE;
delete from TRANSPORT;
delete from HEBERGEMENT;

commit;

insert into PAYS values (0, 'SENEGAL');
insert into PAYS values (1, 'ESPAGNE');
insert into PAYS values (2, 'FRANCE' );

commit;

insert into TRANSPORT values ('A' , 'AUTOCAR'			);
insert into TRANSPORT values ('B' , 'BATEAU'			);
insert into TRANSPORT values ('T' , 'TRAIN'				);
insert into TRANSPORT values ('V' , 'VELO'				);
insert into TRANSPORT values ('TP', 'TRANSPORT PUBLIC'	);

commit;

insert into HEBERGEMENT values ('PC', 'PENSION COMPLETE'	);
insert into HEBERGEMENT values ('DP', 'DEMI-PENSION'		);
insert into HEBERGEMENT values ('HS', 'HEBERGEMENT SEULE'	);

commit;

insert into VILLE_ETAP values ( 0, 0, 'DAKAR');
insert into VILLE_ETAP values ( 1, 0, 'KOLDA');
insert into VILLE_ETAP values ( 2, 0, 'PODOR');
insert into VILLE_ETAP values ( 3, 0, 'MATAM');

insert into VILLE_ETAP values ( 4, 1, 'MADRID'	);
insert into VILLE_ETAP values ( 5, 1, 'VALENCE'	);
insert into VILLE_ETAP values ( 6, 1, 'LUGO'	);
insert into VILLE_ETAP values ( 7, 1, 'NAVARRE'	);

insert into VILLE_ETAP values ( 8, 2, 'PARIS' 		);
insert into VILLE_ETAP values ( 9, 2, 'BORDEAUX'	);
insert into VILLE_ETAP values (10, 2, 'MARSEILLE'	);
insert into VILLE_ETAP values (11, 2, 'TOULOUSE'	);

commit;

insert into SEJOURS values ('SSND07', 'C',  default, 100);
insert into SEJOURS values ('SSMD04', 'F',  default,  30);
insert into SEJOURS values ('SSPM08', 'F',  default, 125);
insert into SEJOURS values ('SSFR02', 'F',  default, 200);
insert into SEJOURS values ('SSFR05', 'C',  default, 115);
insert into SEJOURS values ('SSFR09', 'C',  default,  80);

commit;

insert into CIRCUITS values ('SSND07', 'SEJOUR CLUB DAKAR SOMONE', 'DECOUVREZ LA SOMONE, SA BAIE, SES PLAGES,...', 'A', 'DP', 8, 7);
insert into CIRCUITS values ('SSFR05', 'LA CAPITALE DE BORDELAIS', 'DEGOUTER LE VIN RENOMME DU BORDEAUX ... ', 'V', 'PC', 8, 7);
insert into CIRCUITS values ('SSFR09', 'AU SOMMET DES MONTAGNES', 'FRANCHIR LES FLANTS ET LES SOMMETS ...', 'V', 'HS', 8, 7);

commit;

insert into CALENDRIER values ( 1, '05/12/2010', '12/12/2010');
insert into CALENDRIER values ( 2, '12/12/2010', '19/12/2010');
insert into CALENDRIER values ( 3, '19/12/2010', '26/12/2010');
insert into CALENDRIER values ( 4, '26/12/2010', '02/01/2011');
insert into CALENDRIER values ( 5, '02/01/2011', '09/01/2011');
insert into CALENDRIER values ( 6, '09/01/2011', '16/01/2011');
insert into CALENDRIER values ( 7, '16/01/2011', '23/01/2011');
insert into CALENDRIER values ( 8, '23/01/2011', '30/01/2011');
insert into CALENDRIER values ( 9, '30/01/2011', '06/02/2011');
insert into CALENDRIER values (10, '04/07/2011', '11/07/2011');
insert into CALENDRIER values (11, '11/07/2011', '18/07/2011');
insert into CALENDRIER values (12, '08/08/2011', '15/08/2011');
insert into CALENDRIER values (13, '18/04/2011', '25/04/2011');
insert into CALENDRIER values (14, '25/04/2011', '02/05/2011');
insert into CALENDRIER values (15, '02/05/2011', '09/05/2011'); 

commit;

insert into TARIFS values ('SSND07', 1, 250000, 100000, 30000, 40000);
insert into TARIFS values ('SSPM08', 2, 1000000, 50000, 40000, 80000);
insert into TARIFS values ('SSFR02', 3, 800000, 100000, 20000, 30000); 

commit;

insert into RESERVATION values ( 1, 'hieu', 'trung', '546/256', '084', 'tphcm', 123456789, '20/11/2009', 10, 3, 50000, '20/11/2009',null );
insert into RESERVATION values ( 2, 'son', 'lam', '38/45', '084', 'tphcm', 987654321, '05/12/2010', 5, 4, 100000, '06/12/2010',null );
insert into RESERVATION values ( 3, 'minh', 'huong', '162/796', '084', 'tphcm', 009-545-2184, '12/12/2010', 2, 2, 200000, '12/12/2010',null );

commit;

insert into HOTEL_RESIDENCE values ('SSMD04', 0, 'BLACK STAR', 3, '45 RUE MAREMA', 16545-131-3541, 'NOM 1', 
									'DESCRIPTION 1', 'PC', null, null);
insert into HOTEL_RESIDENCE values ('SSPM08', 1, 'NOM HOTEL ESPAGNE', 3, '125 RUE SALPALO', 5431-59832-22, 'NOM 1', 
									'DESCRIPTION 1', 'PC', null, null);
insert into HOTEL_RESIDENCE values ('SSFR02', 2, 'NOM HOTEL FRANCE', 3, '20 RUE AJAX', 2458-32354-33, 'NOM 2', 
									'DESCRIPTION 2', 'PC', null, null);		

commit;
									