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
	-- select sum(TOTAL)/sum(COEFF_MAT) into moyenne
	-- from (
		-- select COEFF_MAT, NOTE*COEFF_MAT as TOTAL
		-- from ETUDIANTS e, NOTES n, MATIERES m
		-- where e.NUM_ETU = n.NUM_ETU
		-- and m.CODE_MAT = n.CODE_MAT
		-- and e.NOM_ETU = nomEtu
		-- order by e.NUM_ETU );
	-- if moyenne is not null then
		-- return moyenne;
	-- else
		-- raise e;
	-- end if;
-- exception
	-- when e then
		-- DBMS_OUTPUT.PUT_LINE('Pas de notes trouvees !!');
		-- return moyenne;
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
-- create or replace procedure PasserAuSupp is
	-- moyenne number;
	-- cursor cs_moyenne is
		-- select NOM_ETU, sum(TOTAL)/sum(COEFF_MAT) as S_MOYENNE
		-- from (select e.NOM_ETU, COEFF_MAT, NOTE*COEFF_MAT as TOTAL
				-- from ETUDIANTS e, NOTES n, MATIERES m
				-- where e.NUM_ETU = n.NUM_ETU
				-- and m.CODE_MAT = n.CODE_MAT
				-- and e.NUM_ETU = n.NUM_ETU
				-- order by e.NUM_ETU )
		-- group by NOM_ETU;
	-- cursor cs_sansnote is
		-- select e.NOM_ETU
		-- from ETUDIANTS e
		-- where e.NOM_ETU not in (select e.NOM_ETU
									-- from ETUDIANTS e, NOTES n
									-- where e.NUM_ETU = n.NUM_ETU
									-- group by e.NOM_ETU);
-- begin 
	-- for ligne in cs_moyenne
	-- loop
		-- if ligne.S_MOYENNE > 11 then
			-- update ETUDIANTS set ANNEE_ETU = ANNEE_ETU + 1 where NOM_ETU = ligne.NOM_ETU; 
		-- end if;
		-- if ligne.S_MOYENNE < 8 then
			-- delete from ETUDIANTS cascade where NOM_ETU = ligne.NOM_ETU;			
		-- end if;
	-- end loop;	
	-- for l in cs_sansnote
	-- loop
		-- if l.NOM_ETU is not null then
			-- delete from ETUDIANTS cascade where NOM_ETU = l.NOM_ETU;
		-- end if;
	-- end loop;
-- end;
-- /
-- select * from ETUDIANTS;
-- call PasserAuSupp();
-- select * from ETUDIANTS;

-- 3. DECLENCHEUR

-- 1) Créez un déclencheur qui s’assure qu’un  étudiant ne peut pas sauter de classe 
-- 	ni passer  à une classe inférieure.
drop trigger EtatEtu;
set serveroutput on;
create or replace trigger EtatEtu 
before update of ANNEE_ETU on ETUDIANTS
for each row
begin
	if updating then
		if :new.ANNEE_ETU - :old.ANNEE_ETU != 1 then
			raise_application_error(-20001,'Action refusee !!');		
		end if;
	end if;
end EtatEtu;
/
--	
select * from ETUDIANTS;
update ETUDIANTS set ANNEE_ETU = ANNEE_ETU + 2 where NUM_ETU = 1;
update ETUDIANTS set ANNEE_ETU = ANNEE_ETU + 1 where NUM_ETU = 3;
select * from ETUDIANTS;

-- 2) Créez un déclencheur qui permet de conserver la liste des anciens  élèves. Pour cela 
-- 	on sera amener à créer une nouvelle table contenant également l’année de sortie de chaque élève.
-- drop trigger ConserverEtu;
-- set serveroutput on;
-- create or replace trigger ConserverEtu
-- before delete on ETUDIANTS
-- for each row
-- begin
	-- if deleting then
		-- insert into ETUD_OLD 
			-- values (:old.NUM_ETU, :old.NOM_ETU, :old.PRENOM_ETU, sysdate);
		-- DBMS_OUTPUT.PUT_LINE('Trigger called');
	-- end if;
-- end;
-- /

-- select * from ETUDIANTS;
-- delete from ETUDIANTS where NUM_ETU = 2;
-- select * from ETUDIANTS;
-- select * from ETUD_OLD;