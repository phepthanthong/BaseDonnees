/* INSERTION DES DONNEES */

delete from TARIFS;
delete from CALENDRIER;
delete from SEJOURS;
delete from PAYS;

commit;

insert into PAYS values (0, 'SENEGAL');
insert into PAYS values (1, 'ESPAGNE');
insert into PAYS values (2, 'FRANCE' );

commit;

insert into SEJOURS values ('SSND07', 0, 'SEJOUR CLUB DAKAR SOMONE', 'DECOUVREZ LA SOMONE, SA BAIE, SES PLAGES,...');
insert into SEJOURS values ('SSMD04', 0, 'MER ET DESERT', 'DESCRIPTION A COMPLETER ...');
insert into SEJOURS values ('SSPM08', 1, 'SOLEIL DE L''ANDALOUSIE', 'CET HOTEL SITUE SUR LA COSTA DEL SOL ...');
insert into SEJOURS values ('SSFR02', 2, 'LA TOUR EIFFEL', 'VENEZ COMTEMPLER LE MONUMENT INTERNATIONAL ... ');
insert into SEJOURS values ('SSFR05', 2, 'LA CAPITALE DE BORDELAIS', 'DEGOUTER LE VIN RENOMME DU BORDEAUX ... ');


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

insert into TARIFS values ('SSND07',  1,  699);
insert into TARIFS values ('SSND07',  2,  749);
insert into TARIFS values ('SSND07',  3, 1149);
insert into TARIFS values ('SSND07',  4, 1469);
insert into TARIFS values ('SSND07',  5,  899);
insert into TARIFS values ('SSND07',  6,  749);
insert into TARIFS values ('SSND07',  7,  729);
insert into TARIFS values ('SSND07',  8,  799);
insert into TARIFS values ('SSND07',  9,  799);

insert into TARIFS values ('SSPM08',  1,  299);
insert into TARIFS values ('SSPM08',  2,  299);
insert into TARIFS values ('SSPM08',  3,  578);
insert into TARIFS values ('SSPM08',  4,  626);
insert into TARIFS values ('SSPM08',  5,  299);
insert into TARIFS values ('SSPM08',  6,  299);
insert into TARIFS values ('SSPM08',  7,  299);
insert into TARIFS values ('SSPM08',  8,  299);
insert into TARIFS values ('SSPM08',  9,  299);
insert into TARIFS values ('SSPM08', 10, 1525);
insert into TARIFS values ('SSPM08', 11,  674);
insert into TARIFS values ('SSPM08', 12,  949);
insert into TARIFS values ('SSPM08', 13,  990);
insert into TARIFS values ('SSPM08', 14,  729);
insert into TARIFS values ('SSPM08', 15, 1030);

insert into TARIFS values ('SSFR02',  3,  512);
insert into TARIFS values ('SSFR05',  4,  480);

insert into TARIFS values ('SSMD04',  1,  520);
insert into TARIFS values ('SSMD04',  2, 1024);
insert into TARIFS values ('SSMD04',  3,  299);
insert into TARIFS values ('SSMD04',  4,  299);
commit;

