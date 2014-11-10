-- ======================================
-- 	On crée un profile limitant le nombre de connexion et le nombre de tentative
-- ======================================
alter system set resource_limit = true;
drop profile user_acc cascade;
drop profile pers_guichets cascade;

-- les autres utilisateurs
create profile user_acc limit 
SESSIONS_PER_USER 1
FAILED_LOGIN_ATTEMPTS 3;

-- les personnes travaillant aux guichets
create profile pers_guichets limit 
SESSIONS_PER_USER 1
FAILED_LOGIN_ATTEMPTS 3;

-- ==============================
--  On crée les rôles
-- ==============================
drop role emp_guichets;
drop role directrice;
drop role resp_prog;

create role emp_guichets;
create role directrice;
create role resp_prog;

-- On leur attribue les privilèges correspondants
grant all on RESERVATION 			to emp_guichets, directrice, resp_prog;
grant select on SEANCE 				to emp_guichets, directrice, resp_prog;
grant select on PLACE 				to emp_guichets, directrice, resp_prog;
grant select on TARIF 				to emp_guichets, directrice, resp_prog;
grant select on CATEGORIE_SEANCE 	to emp_guichets, directrice, resp_prog;
grant select on CATEGORIE_PLACE		to emp_guichets, directrice, resp_prog;
grant select on ROLE 				to directrice;
grant select on ACTEUR 				to directrice;
grant select on FILM 				to emp_guichets, directrice, resp_prog;
grant select on REALISATEUR 		to directrice;


grant all on FILM 			to directrice;
grant all on TARIF 			to directrice;
grant all on SEANCE 		to directrice;
grant all on ACTEUR 		to directrice;
grant all on REALISATEUR 	to directrice;

grant all on SEANCE 			to resp_prog;
grant all on CATEGORIE_SEANCE 	to resp_prog;
grant all on CATEGORIE_PLACE 	to resp_prog;
grant all on PLACE 				to resp_prog;

-- =========================
--  On crée les utilisateurs
-- =========================
drop user Paul;
drop user Pierre;
drop user Alain;
drop user Dounia;
drop user Meriem;
drop user Guillaume;

create user Paul 		identified by PAUL password expire;
create user Pierre 		identified by PIERRE password expire;
create user Alain 		identified by ALAIN password expire;
create user Dounia 		identified by DOUNIA password expire;
create user Meriem 		identified by MERIEM password expire;
create user Guillaume 	identified by GUILLAUME password expire;

-- On affecte le profile correspondant aux utilisateurs
alter user Paul 		profile pers_guichets;
alter user Pierre 		profile pers_guichets;
alter user Alain 		profile pers_guichets;
alter user Dounia 		profile pers_guichets;
alter user Meriem 		profile user_acc;
alter user Guillaume 	profile user_acc;

-- ===================================
--  On commence par autoriser la connexion et on définit le rôle de chacun
-- ===================================
grant connect 	to Paul, Pierre, Alain, Dounia, Meriem, Guillaume;
grant resource 	to Paul, Pierre, Alain, Dounia, Meriem, Guillaume;

grant emp_guichets 	to Paul, Pierre, Alain, Dounia;
grant directrice 	to Meriem;
grant resp_prog 	to Guillaume;
grant resp_prog		to Dounia;

