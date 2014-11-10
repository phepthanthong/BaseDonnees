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

-- l XEM LAI CAU NAY
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
-- select R.NUMERO_REALISATEUR as NUM_REAL , NOM_REALISATEUR , 
-- count(*) , count(NUMERO_FILM) , count(distinct F.NUMERO_REALISATEUR) 
-- from REALISATEUR R
-- left outer join FILM F on R.NUMERO_REALISATEUR = F.NUMERO_REALISATEUR
-- where NATION_REALISATEUR = 'FRANCAISE'
-- group by R.NUMERO_REALISATEUR , NOM_REALISATEUR , PRENOM_REALISATEUR ;

-- 3
-- select * 
-- from ACTEUR
-- where NUMERO_ACTEUR <> all ( select NUMERO_ACTEUR
-- from ROLE ) ;

-- 4
-- select distinct PRENOM_REALISATEUR 
-- from REALISATEUR
-- where exists ( select 123456789 --74552575275
-- from ACTEUR 
-- where PRENOM_ACTEUR = PRENOM_REALISATEUR ) ;

-- 5
-- select count(*) compte , R.* 
-- from REALISATEUR R , REALISATEUR R_DEUX 
-- where R.NATION_REALISATEUR = R_DEUX.NATION_REALISATEUR 
-- group by R.NUMERO_REALISATEUR , R.NOM_REALISATEUR , R.PRENOM_REALISATEUR , 
-- R.NATION_REALISATEUR
-- order by compte , R.NUMERO_REALISATEUR ;

-- 6a
-- select NUMERO_ACTEUR , NUMERO_FILM , 1
-- from ROLE
-- union
-- select NUMERO_ACTEUR , null , count(*)
-- from ROLE
-- group by NUMERO_ACTEUR
-- union
-- select null , NUMERO_FILM , count(*)
-- from ROLE
-- group by NUMERO_FILM
-- union 
-- select null , null , count(*)
-- from ROLE
-- order by 1 asc nulls last , 2 asc nulls last ;
--
-- select NUMERO_ACTEUR , NUMERO_FILM , count(*)
-- from ROLE
-- group by cube(NUMERO_ACTEUR , NUMERO_FILM )
-- order by 1 asc nulls last , 2 asc nulls last ;

-- 6b
-- select NUMERO_ACTEUR , NUMERO_FILM , 1
-- from ROLE
-- order by 1 asc nulls last , 2 asc nulls last ;
--
-- select NUMERO_ACTEUR , NUMERO_FILM , count(*)
-- from ROLE
-- group by grouping sets ( NUMERO_ACTEUR , NUMERO_FILM , () )
-- order by 1 asc nulls last , 2 asc nulls last ;

-- 7
-- select REALISATEUR.NUMERO_REALISATEUR , ACTEUR.NUMERO_ACTEUR , 
-- count(FILM.NUMERO_FILM)
-- from REALISATEUR
-- join FILM on REALISATEUR.NUMERO_REALISATEUR = FILM.NUMERO_REALISATEUR
-- join ROLE on FILM.NUMERO_FILM = ROLE.NUMERO_FILM
-- join ACTEUR on ROLE.NUMERO_ACTEUR = ACTEUR.NUMERO_ACTEUR
-- where REALISATEUR.NUMERO_REALISATEUR <= 3 and ACTEUR.NUMERO_ACTEUR <= 3
-- group by REALISATEUR.NUMERO_REALISATEUR , ACTEUR.NUMERO_ACTEUR 
-- order by REALISATEUR.NUMERO_REALISATEUR , ACTEUR.NUMERO_ACTEUR ; 
--
-- select REALISATEUR.NUMERO_REALISATEUR , ACTEUR.NUMERO_ACTEUR , 
-- count(FILM.NUMERO_FILM)
-- from REALISATEUR
-- join FILM on REALISATEUR.NUMERO_REALISATEUR = FILM.NUMERO_REALISATEUR
-- join ROLE on FILM.NUMERO_FILM = ROLE.NUMERO_FILM
-- join ACTEUR on ROLE.NUMERO_ACTEUR = ACTEUR.NUMERO_ACTEUR
-- where REALISATEUR.NUMERO_REALISATEUR <= 3 and ACTEUR.NUMERO_ACTEUR <= 3
-- group by cube( REALISATEUR.NUMERO_REALISATEUR , ACTEUR.NUMERO_ACTEUR ) 
-- order by REALISATEUR.NUMERO_REALISATEUR nulls last , 
-- ACTEUR.NUMERO_ACTEUR nulls last ; 

-- 8a 
-- select GENRE , count(*) from FILM group by GENRE order by count(*) desc ;
--
-- select * 
-- from ( select GENRE , count(*) from FILM group by GENRE order by count(*) desc ) 
-- where rownum <= 9 ; 

-- 8b
-- select GENRE , NbFilmsDuGenre 
-- from ( select GENRE , NbFilmsDuGenre , 
-- rank() over(order by NbFilmsDuGenre desc) RangNbFilmsDuGenre 
-- from ( select GENRE , count(*) NbFilmsDuGenre 
-- from FILM 
-- group by GENRE 
-- order by NbFilmsDuGenre desc ) ) 
-- where RangNbFilmsDuGenre <= 2 ; 
-- ou 4

-- 9
-- select row_number() over(order by NATION_ACTEUR) row_number_NATION_ACTEUR , 
-- rank() over(order by NATION_ACTEUR) , 
-- NUMERO_ACTEUR , NOM_ACTEUR , PRENOM_ACTEUR , NATION_ACTEUR 
-- from ACTEUR
-- where substr(PRENOM_ACTEUR,0,1) in ( 'B' , 'K' , 'M' , 'P' )
-- order by row_number_NATION_ACTEUR ;

-- 10
-- select GENRE , rank() over(partition by GENRE order by DUREE) , 
-- NUMERO_FILM , TITRE_FILM , DUREE , 
-- count(*) over(partition by GENRE) , count(*) over() , 
-- min(Duree) over(partition by GENRE) , min(Duree) over() , 
-- max(Duree) over(partition by GENRE) , max(Duree) over() 
-- from FILM
-- where trim(GENRE) not like '% %'
-- order by GENRE , DUREE , NUMERO_FILM ;

-- 11
-- select NUMERO_ACTEUR , trim(NOM_ACTEUR) || ' ' || ltrim(PRENOM_ACTEUR) , 
-- DATE_DE_NAISSANCE , 
-- NATION_ACTEUR , case when NATION_ACTEUR = 'FRANCAISE' then 'française' 
-- else 'étrangère' 
-- end FR_OU_ETR
-- from ACTEUR
-- where extract(year from DATE_DE_NAISSANCE) between 1955 and 1960 
-- or regexp_like(PRENOM_ACTEUR,'^[D-F]') 
-- order by NOM_ACTEUR ;

-- 12
-- select NUMERO_ACTEUR , NOM_ACTEUR , nullif(NATION_ACTEUR,'FRANCAISE') , 
-- coalesce(cast(DATE_DE_NAISSANCE as char(20)),'inconnue')
-- from ACTEUR
-- where substr(NOM_ACTEUR,3,1) in ('A','E','I','O','U','Y') ;

-- 13
-- select NUMERO_ACTEUR , NOM_ACTEUR , DATE_DE_NAISSANCE , 
-- extract(year from DATE_DE_NAISSANCE) ANNEE_DE_NAISSANCE, 
-- width_bucket(1900+mod(extract(year from DATE_DE_NAISSANCE),100),1950,1970,4) WB
-- from ACTEUR 
-- where DATE_DE_NAISSANCE is not null ;

-- 14
-- select NUMERO_ACTEUR , NOM_ACTEUR , DATE_DE_NAISSANCE , 
-- ( DATE_DE_NAISSANCE - interval '99' YEAR ) DATE_DE_NAISSANCE_XXeme
-- from ACTEUR
-- where DATE_DE_NAISSANCE is not null 
-- and ( DATE_DE_NAISSANCE - interval '99' YEAR , 
-- DATE_DE_NAISSANCE - interval '99' YEAR ) overlaps 
-- ( CURRENT_DATE - interval '50' YEAR , CURRENT_DATE - interval '30' YEAR ) ;

-- 15
-- select stddev(NUMERO_FILM) , variance(NUMERO_FILM) , 
-- stddev(NUMERO_REALISATEUR) , variance(NUMERO_REALISATEUR) , 
-- corr(NUMERO_FILM,NUMERO_REALISATEUR)
-- from FILM ;




