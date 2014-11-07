-- 2. Requêtes SQL

-- a 
-- select * 
-- from realisateur 
-- order by NOM_REALISATEUR;

-- b
-- select re.NUMERO_REALISATEUR, re.NOM_REALISATEUR, re.PRENOM_REALISATEUR
-- from realisateur re
-- where NATION_REALISATEUR = 'FRANCAISE';

-- c
-- select distinct re.NUMERO_REALISATEUR as NUMERO, re.NOM_REALISATEUR, re.PRENOM_REALISATEUR
-- from realisateur re, film f
-- where re.NUMERO_REALISATEUR = f.NUMERO_REALISATEUR
-- order by re.NUMERO_REALISATEUR;

-- d
-- select f.NUMERO_FILM, f.TITRE_FILM, a.NUMERO_ACTEUR, a.NOM_ACTEUR
-- from acteur a, film f, role r
-- where a.NUMERO_ACTEUR = r.NUMERO_ACTEUR
-- and f.NUMERO_FILM = r.NUMERO_FILM
-- order by f.NUMERO_FILM;

-- e
-- select		f.NUMERO_FILM , f.TITRE_FILM , count(*)
-- from		film f, role ro
-- where		ro.NUMERO_FILM = f.NUMERO_FILM
-- group by	f.NUMERO_FILM, f.TITRE_FILM
-- having		count(*) >= 2
-- order by	f.NUMERO_FILM asc;

-- f
-- select re.NUMERO_REALISATEUR, re.NOM_REALISATEUR, re.PRENOM_REALISATEUR
-- from realisateur re
-- where re.PRENOM_REALISATEUR in(
-- select a.PRENOM_ACTEUR
-- from acteur a)
-- order by re.NUMERO_REALISATEUR ;

-- g
-- select re.NUMERO_REALISATEUR, re.NOM_REALISATEUR, re.PRENOM_REALISATEUR, count(*)
-- from realisateur re, film f
-- where re.NUMERO_REALISATEUR = f.NUMERO_REALISATEUR
-- having count(*) between 2 and 5
-- group by re.NUMERO_REALISATEUR, re.NOM_REALISATEUR, re.PRENOM_REALISATEUR
-- order by re.NUMERO_REALISATEUR;

-- h
-- select a.NUMERO_ACTEUR, a.NOM_ACTEUR, a.PRENOM_ACTEUR
-- from acteur a
-- where a.PRENOM_ACTEUR in (
-- select re.PRENOM_REALISATEUR
-- from realisateur re
-- having count(PRENOM_REALISATEUR) = 1
-- group by PRENOM_REALISATEUR )
-- order by a.NOM_ACTEUR;

-- i
-- select count(*)
-- from acteur a, film f, role r
-- where a.NUMERO_ACTEUR = r.NUMERO_ACTEUR
-- and r.NUMERO_FILM = f.NUMERO_FILM
-- and f.TITRE_FILM = 'GARCON';

-- j
-- select 		a.NOM_ACTEUR, a.PRENOM_ACTEUR, count(*)
-- from 		acteur a, role r
-- where 		a.NUMERO_ACTEUR = r.NUMERO_ACTEUR
-- group by 	a.NOM_ACTEUR, a.PRENOM_ACTEUR
-- order by 	a.NOM_ACTEUR;

-- k
-- select a.NOM_ACTEUR, a.PRENOM_ACTEUR, f.DATE_DE_SORTIE
-- from film f, acteur a, role r
-- where f.NUMERO_FILM = r.NUMERO_FILM
-- and r.NUMERO_ACTEUR = a.NUMERO_ACTEUR
-- and DATE_DE_SORTIE = (
-- select min(DATE_DE_SORTIE)
-- from film f, role r
-- where f.NUMERO_FILM = r.NUMERO_FILM
-- and a.NUMERO_ACTEUR = r.NUMERO_ACTEUR
-- )
-- order by NOM_ACTEUR;

-- l
-- select distinct a.PRENOM_ACTEUR
-- from acteur a
-- union
-- select distinct re.PRENOM_REALISATEUR
-- from realisateur re;

-- m
-- select a.PRENOM_ACTEUR
-- from ACTEUR a
-- intersect
-- select re.PRENOM_REALISATEUR
-- from REALISATEUR re ;
--
-- select distinct a.PRENOM_ACTEUR
-- from acteur a
-- where a.PRENOM_ACTEUR in (
-- select re.PRENOM_REALISATEUR
-- from realisateur re );

-- n
-- select distinct re.PRENOM_REALISATEUR
-- from realisateur re
-- where re.PRENOM_REALISATEUR not in (
-- select a.PRENOM_ACTEUR
-- from acteur a );
--
-- select re.PRENOM_REALISATEUR
-- from realisateur re
-- minus 
-- select a.PRENOM_ACTEUR
-- from acteur a ;

-- o
-- select re.NUMERO_REALISATEUR, re.NOM_REALISATEUR
-- from realisateur re
-- minus
-- select re.NUMERO_REALISATEUR, re.NOM_REALISATEUR
-- from realisateur re, film f
-- where f.NUMERO_REALISATEUR = re.NUMERO_REALISATEUR;
--
-- select re.NUMERO_REALISATEUR, re.NOM_REALISATEUR
-- from realisateur re 
-- where re.NUMERO_REALISATEUR not in (
-- select re.NUMERO_REALISATEUR
-- from realisateur re, film f
-- where f.NUMERO_REALISATEUR = re.NUMERO_REALISATEUR);
--
-- select re.NUMERO_REALISATEUR, re.NOM_REALISATEUR
-- from realisateur re
-- left join film on re.NUMERO_REALISATEUR = film.NUMERO_REALISATEUR
-- where film.NUMERO_REALISATEUR is null;

-- 3
-- REMARK ***************************************************************** 
-- REMARK * Script SQL*Plus dOracle : liste des films, avec mise en page * 
-- REMARK ***************************************************************** 
-- SET PAUSE 'Taper [RETURN] pour continuer' 
-- SET PAUSE ON 
-- SET PAGESIZE 35 
-- SET LINESIZE 100 
-- CLEAR BREAKS 
-- CLEAR COMPUTES 
-- CLEAR SCREEN 
-- BREAK ON GENRE ON REPORT 
-- COMPUTE NUM OF DUREE ON GENRE 
-- COMPUTE NUM OF DUREE ON REPORT 
-- TTITLE 	SKIP - 
		-- SKIP - 
		-- CENTER 'Les films par genre...' - 
		-- RIGHT 'page:' FORMAT 99 SQL.PNO - 
		-- SKIP - 
		-- CENTER '----------------------' - 
		-- SKIP - 
		-- SKIP 
-- BTITLE SKIP SKIP 
-- COLUMN TITRE_FILM 		HEADING 'Titre du|film' JUSTIFY CENTER 
-- COLUMN GENRE  			HEADING 'Genre' 		JUSTIFY CENTER 
-- COLUMN DUREE 			HEADING 'Duree' 		JUSTIFY CENTER FORMAT 999 
-- COLUMN DATE_DE_SORTIE 	HEADING 'Date de|sortie'JUSTIFY CENTER 
-- SELECT TITRE_FILM,GENRE, DUREE, DATE_DE_SORTIE 
-- FROM FILM 
-- WHERE NUMERO_FILM <= 20 
-- ORDER BY GENRE, DATE_DE_SORTIE;

-- 7 
-- REMARK =========================================================
-- REMARK * Affichez les noms des réalisateurs avec les titres de leurs films, 
-- REMARK * en présentant « joliment » le résultat de la requête
-- REMARK =========================================================
-- SET PAGESIZE 35 
-- SET LINESIZE 100
-- CLEAR BREAKS 
-- CLEAR COMPUTES 
-- CLEAR SCREEN 
-- BREAK on NOM_REALISATEUR on REPORT
-- COMPUTE NUM of TITRE_FILM on NOM_REALISATEUR
-- TTITLE 	SKIP -
		-- SKIP -
		-- CENTER 'Les noms des realisateurs avec les titres de leurs films' - 
		-- left 'page:' format 99 SQL.PNO - 
		-- SKIP - 
		-- CENTER '--------------------------' -
		-- SKIP
		-- SKIP
-- BTITLE SKIP SKIP
-- column NOM_REALISATEUR	HEADING 'NOM DES REALISATEURS' 			JUSTIFY CENTER
-- column TITRE_FILM		HEADING 'TITRE DES FILMS' 	JUSTIFY CENTER
-- select NOM_REALISATEUR, TITRE_FILM
-- from film f, realisateur r
-- where f.NUMERO_REALISATEUR = r.NUMERO_REALISATEUR
-- order by r.NUMERO_REALISATEUR;

-- 9
-- ACCEPT nom CHAR PROMPT 'Entrez le nom d''acteur choisi : '
-- SELECT * FROM ACTEUR WHERE NOM_ACTEUR = '&nom';

-- COMPREHENSION DE REQUETES

-- 1
-- select Genre , count(NUMERO_FILM) , avg(Duree)*count(Duree)-sum(Duree) 
-- from FILM 
-- group by Genre ;

-- 2
select R.NUMERO_REALISATEUR , NOM_REALISATEUR , 
count(*) , count(NUMERO_FILM) , count(distinct F.NUMERO_REALISATEUR) 
from REALISATEUR R
left outer join FILM F on R.NUMERO_REALISATEUR = F.NUMERO_REALISATEUR
where NATION_REALISATEUR = 'FRANCAISE'
group by R.NUMERO_REALISATEUR , NOM_REALISATEUR , PRENOM_REALISATEUR ;












