/* PL/SQL (Suite) */

-- 2. PROCEDURES STOCKEES

-- 3) Ecrivez  une  fonction  qui  calcule  la  moyenne  d’un  étudiant.  
-- 	Cette  fonction  doit  générer  une exception si jamais l’élève n’a pas de note.
-- drop function MoyenneEtu;
-- set serveroutput on;
-- create or replace function MoyenneEtu(nomEtu char) return number is
	-- moyenne number;
	-- e exception;
-- begin	
	-- select avg(NOTE) into moyenne
	-- from ETUDIANTS e, NOTES n
	-- where e.NUM_ETU = n.NUM_ETU
	-- and e.NOM_ETU = nomEtu;
	-- return moyenne;
	-- if moyenne is not null then
		-- return moyenne;
	-- else
		-- raise e;
	-- end if;
-- exception
	-- when e then
		-- DBMS_OUTPUT.PUT_LINE('Pas de notes trouvees !!');
	-- when others then
		-- DBMS_OUTPUT.PUT_LINE('Erreur inconnue !!');
-- end;
-- /
-- variable nom char;
-- exec :nom:=MoyenneEtu('CHANAY');
-- select MoyenneEtu('CHANAY') from dual;

-- 4) Ecrivez une procédure qui fait passer en année supérieure les  étudiants ayant plus de 11 de moyenne 
--	et supprimant tous les étudiants ayant moins de 8 de moyenne ou n’ayant aucune note.
-- drop procedure PasserAuSupp;
-- set serveroutput on;
-- create or replace procedure PasserAuSupp (nomEtu char) is
	-- moyenne number;
	-- cursor cs_moyenne is
		-- select avg(NOTE) into moyenne
		-- from ETUDIANTS e, NOTES n
		-- where e.NUM_ETU = n.NUM_ETU
		-- and e.NOM_ETU = nomEtu;
-- begin 
	-- open cs_moyenne;
	-- fetch cs_moyenne into moyenne;
	-- if moyenne > 11 then
		-- update ETUDIANTS set ANNEE_ETU = ANNEE_ETU + 1 where NOM_ETU = nomEtu;
	-- else if moyenne < 8 or moyenne is null then
		-- delete from ETUDIANTS cascade where NOM_ETU = nomEtu;
		-- end if;
	-- end if;
-- end;
-- /
-- select * from ETUDIANTS;
-- call PasserAuSupp('CHANAY');
-- select * from ETUDIANTS;

-- select e.NUM_ETU, e.NOM_ETU, e.PRENOM_ETU
-- from ETUDIANTS e, NOTES n
-- where e.NUM_ETU = n.NUM_ETU
-- having avg(NOTE) >= 11 
-- group by e.NUM_ETU, e.NOM_ETU, e.PRENOM_ETU;

-- select e.NUM_ETU, e.NOM_ETU, e.PRENOM_ETU, avg(NOTE) as MOYENNE
-- from ETUDIANTS e, NOTES n
-- where e.NUM_ETU = n.NUM_ETU
-- group by e.NUM_ETU, e.NOM_ETU, e.PRENOM_ETU;

-- select avg(NOTE) as MOYENNE
-- from ETUDIANTS e, NOTES n
-- where e.NUM_ETU = n.NUM_ETU
-- group by e.NUM_ETU, e.NOM_ETU, e.PRENOM_ETU;
-- 3. DECLENCHEUR

-- 1) Créez un déclencheur qui s’assure qu’un  étudiant ne peut pas sauter de classe 
-- 	ni passer  à une classe inférieure.

-- 2) Créez un déclencheur qui permet de conserver la liste des anciens  élèves. Pour cela 
-- 	on sera amener àcréer une nouvelle table contenant également l’année de sortie de chaque élève.