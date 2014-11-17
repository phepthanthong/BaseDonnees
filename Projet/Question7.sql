drop trigger MontantReserv;
set serveroutput on;
create or replace trigger MontantReserv 
after insert or update on TEMP_RESERV
for each row
declare 
	montant_adult number;
	montant_enf	number;
	date_debut date;
	date_reserv date;
begin
	select c.DATEDEB into date_debut
	from calendrier c
	where c.NOSEM = :new.NOSEM;
		
	select r.DATE_RES into date_reserv
	from reservation r
	where r.CODERES = :new.CODERES;
	
	if date_debut < date_reserv then 
		raise_application_error(-20001, 'CHON NGAY SAI');
	end if;
		
	select t.PRIXTTC*NB_ADULTS into montant_adult
		from tarifs t, reservation r
		where (t.CODESEJOUR = :new.CODESEJOUR)
		and (t.NOSEM = :new.NOSEM)
		and r.CODERES = :new.CODERES;
	
	select t.REDUC_ENF*NB_ENF into montant_enf
		from tarifs t, reservation r
		where (t.CODESEJOUR = :new.CODESEJOUR)
		and (t.NOSEM = :new.NOSEM)
		and r.CODERES = :new.CODERES;	
	
	insert into DETAIL_RESERV values (:new.NOSEM, :new.CODERES, :new.CODESEJOUR, montant_adult, montant_enf, montant_enf + montant_adult);
	update RESERVATION set MONT_RESERV = (montant_adult + montant_enf - SOMME_VERSEE) where CODERES = :new.CODERES;
	update SEJOURS set NB_RESERV = NB_RESERV + 1 where CODESEJOUR = :new.CODESEJOUR;
end MontantReserv;
/

drop trigger Supprimer_Reserv;

create or replace trigger Supprimer_Reserv
before delete on RESERVATION
for each row
declare	
	cursor cs_sejours is
		(select dr.CODESEJOUR
		from DETAIL_RESERV dr
		where dr.CODERES = :old.CODERES);
begin
	for l in cs_sejours
	loop
		update SEJOURS set NB_RESERV = NB_RESERV - 1 where CODESEJOUR = l.CODESEJOUR;
	end loop;
	delete from DETAIL_RESERV where CODERES = :old.CODERES;
end;
/

drop trigger AutoDate;
set serveroutput on;
create or replace trigger AutoDate
after insert or update on TARIFS
for each row
declare
	s char;
	duree number;
begin
	select s.TYPE_SEJOUR into s
	from sejours s
	where CODESEJOUR = :new.CODESEJOUR;
	
	select (DATEFIN - DATEDEB) into duree
	from calendrier c 
	where c.NOSEM = :new.NOSEM;

	if s like 'F' then
		update HOTEL_RESIDENCE set NB_NUITS = duree, NB_JOURS = duree + 1 where CODESEJOUR = :new.CODESEJOUR;
	else
		update CIRCUITS set NB_NUITS = duree, NB_JOURS = duree + 1 where CODESEJOUR = :new.CODESEJOUR;
	end if;
end AutoDate;
/

drop procedure InsererDonnees;
set serveroutput on;
create or replace procedure InsererDonnees (no_sem number, code_res number, code_sejour varchar) is
	e exception;
	a number;
begin
	insert into TEMP_RESERV values (no_sem, code_res, code_sejour);
	
	select count(*) into a 
	from TEMP_RESERV;
	
	if a <> 1 then 
		raise e;
	end if;	
	delete from TEMP_RESERV;
	
exception
	when e then
		raise_application_error(-20002, 'Erreur !!! ');
	when others then
		dbms_output.put_line('Erreur inconnue !!');
               
end;
/
