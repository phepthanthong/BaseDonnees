/* 2 PROGRAMMATION EN PL/SQL */
-- 1: Liste des acteurs américains
-- set serveroutput on
-- declare 
	-- cursor act is
		-- select a.NOM_ACTEUR, a.PRENOM_ACTEUR, a.NATION_ACTEUR
		-- from acteur a
		-- where NATION_ACTEUR = 'AMERICAINE';
-- begin
	-- for ligne in act
	-- loop
		-- DBMS_OUTPUT.PUT_LINE('Nom: ' || ligne.NOM_ACTEUR ||
							 -- 'Prenom: ' || ligne.PRENOM_ACTEUR ||
							 -- 'Nationalite: ' || ligne.NATION_ACTEUR);
	-- end loop;
-- end;
-- /

-- 2: Nombre total des réservations faites
-- set serveroutput on
-- declare 
	-- nb number;		
-- begin
	-- select count(*) into nb
	-- from reservation;
	-- dbms_output.put_line(nb||' reservations faites');
-- end;
-- /

-- 3: Pour chaque acteur, le nombre de films où il a joué
-- set serveroutput on
-- declare
	-- cursor nbfilm is
		-- select a.NUMERO_ACTEUR, a.NOM_ACTEUR, a.PRENOM_ACTEUR,count(NUMERO_FILM) as NBFilm
		-- from acteur a, role r
		-- where a.NUMERO_ACTEUR = r.NUMERO_ACTEUR		
		-- group by a.NUMERO_ACTEUR, a.NOM_ACTEUR, a.PRENOM_ACTEUR
		-- order by a.NUMERO_ACTEUR;
-- begin
	-- for ligne in nbfilm
	-- loop
		-- DBMS_OUTPUT.PUT_LINE('Numero: ' || ligne.NUMERO_ACTEUR ||
							 -- ' Nom: ' || ligne.NOM_ACTEUR ||
							 -- 'Prenom: ' || ligne.PRENOM_ACTEUR ||
							 -- 'NombreFilm: ' || ligne.NBFilm);
	-- end loop;
-- end;
-- /

/* 3 FONCTIONS ET PRECEDURES STOCKEES */
-- 1: Ecrire une procedure prenant en parametre le nom du realisateur
--    et affichant la liste des films qu'il a realise
-- drop procedure RealFilm;
-- set serveroutput on
-- create or replace procedure RealFilm (nomreal char) is
	-- cursor listeFilm is
		-- select f.TITRE_FILM
		-- from realisateur r, film f
		-- where r.NUMERO_REALISATEUR = f.NUMERO_REALISATEUR
		-- and r.NOM_REALISATEUR = nomreal;
-- begin
	-- for ligne in listeFilm
	-- loop
		-- DBMS_OUTPUT.PUT_LINE('Titre: ' || ligne.TITRE_FILM);
	-- end loop;
-- end;
-- /

-- call RealFilm('SAUTET');


-- 2: Ecrire une fonction prenant en parametre le nom du realisateur
--    et retournant le nombre de films qu'il a realise
-- drop function RealNbFilm;
-- create or replace function RealNbFilm (nomreal in char) return number is
	-- nb number;
-- begin
	-- select count(*) into nb
	-- from realisateur r, film f
	-- where r.NUMERO_REALISATEUR = f.NUMERO_REALISATEUR
	-- and r.NOM_REALISATEUR = nomreal
	-- group by f.NUMERO_REALISATEUR;
	-- return nb;
-- end;
-- /
--
-- variable n char;
-- exec :n:=RealNbFilm('PINOTEAU');
-- select RealNbFilm('PINOTEAU') from dual;

/* 4 TRIGGERS */
-- Ecrire un déclencheur qui lorsque l’on réalise une réservation sur la place numero 1,
-- le fait puis change la categorie de la place en "categorie speciale" 
-- (cf. le fichier donnees_etendue.sql). 
-- Vérifier le fonctionnement du d´eclencheur.
drop trigger ChangeCategorie;
set serveroutput on;
create or replace trigger ChangeCategorie
after insert or update on reservation
for each row
begin
	if :new.NUMERO_PLACE = 1 then
		update place set CATEGORIE_DE_LA_PLACE = 'S' where NUMERO_PLACE = 1;
		DBMS_OUTPUT.PUT_LINE('Trigger called');
	end if;
end;
/
delete from reservation where NOM_SPECTATEUR = 'TRUNG HIEU';
select * from place where NUMERO_PLACE = 1;
insert into reservation values (1, 1, 'TRUNG HIEU');
select * from place where NUMERO_PLACE = 1;
