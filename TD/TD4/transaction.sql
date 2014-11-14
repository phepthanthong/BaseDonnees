/* Transaction */
-- 1. Effectuez successivement les opérations suivantes.
-- delete from reservation where NOM_SPECTATEUR = 'HIEU';
-- delete from reservation where NOM_SPECTATEUR = 'LONG';
-- delete from reservation where NOM_SPECTATEUR = 'TRUNG HIEU';
-- (a) Affichez toutes les réservations.
select * 
from reservation;

--(b) Insérez une réservations.
insert into reservation values (1, 9, 'HIEU');

--(c) Affichez toutes les réservations.
select * 
from reservation;

--(d) Tapez l’instruction commit;.
commit;

--(e) Affichez toutes les réservations.
select * 
from reservation;

--(f) Insérez une nouvelle réservations.
insert into reservation values (1, 10, 'LONG');

--(g) Affichez toutes les réservations.
select * 
from reservation;

--(h) Tapez l’instruction rollback;.
rollback;

--(i) Affichez toutes les réservations.
select * 
from reservation;

--(j) Concluez !
-- on est en train de travailler sur une seule session.
-- La première insertion est faite et enregistrée dans la base grâce à la commande commit;
-- La 2e insertion n'est pas enregistrée dans la base même si on la voit s'afficher sur l'écran grâce à la commande select (*).
-- Si on ne fait pas la commande commit; (ou comme ici, on fait un rollback;) la 2e insertion est perdue.
-- En fait, cela est une donnée temporaire et elle n'est pas vraiment enregistrée.
-- Il faut taper la commande commit; pour que Oracle s'exécute nos actions et que la base se mette à jour. 

-- 2. Lancez une seconde session sqlplus et procédez comme suit.
--(a) Insérez une réservations dans cette seconde session.
-- insert into reservation values (2, 9, 'LOC');
--(b) Affichez cette même réservations pour chacune des deux sessions. Commentez !
-- cette réservation ne s'affiche pas dans la première session.
-- (c) Insérez cette même réservations dans la première session. Que se passe-t-il dans cette première session ?
-- insert into reservation values (2, 9, 'LOC');
-- Dans la première session, la commande sql est dans un état d'attente parce que dans la 2e session, on n'a pas fait la commande commit;.
-- Le programme doit attendre jusqu'à ce que la première session fasse la commande commit; et que Oracle mette à jour la base de données.
-- (d) Effectuez un rollback dans la seconde session.
-- rollback;
-- (e) Affichez cette même réservations pour chacune des deux sessions.
-- select * 
-- from reservation;
-- (f) Effectuez un commit dans la première session.
-- commit;
-- (g) Affichez cette même réservations pour chacune des deux sessions.
-- select * 
-- from reservation;
-- (h) Concluez !
-- Lorsqu'on travaille dans de multiples session, le problème se pose sur la concurrence d'accès des utilisateurs.
-- On se sert de commandes commit; et rollback; pour assurer la cohérence des données.
-- Quand on effectue une première transaction, il faut faire la commande commit; pour que la base se met à jour. 
-- La 2e transaction doit attendre jusqu'à ce que la première session fasse la commande commit;.
-- Toutes les informations seront perdues si on ne fait pas la commande commit;.
-- 3. Effectuez successivement les opérations suivantes.
-- (a) Modifiez une réservations R1 dans la première session.
-- (b) Modifiez une réservations R2 dans la seconde session.
-- (c) Modifiez la réservations R1 dans la seconde session.
-- (d) Modifiez la réservations R2 dans la première session.
-- (e) Effectuez un rollback dans la première session.
-- (f) Effectuez un rollback dans la seconde session.
-- (g) Concluez !
-- (h) Fermez la seconde session sqlplus.
-- modification de R1 dans la 1ere session est reussite mais on ne fait pas la commande commit;
-- modification de R2 dans la 2e session est reussite mais on ne fait pas la commande commit;
-- Lorsqu'on modifie R1 dans la 2e, puisqu'on n'a pas fait la commande commit;, la 2e session est en état d'attente de la commande commit; de la 1ere session.
-- Lorsqu'on modifie R2 dans la 1ere, puisqu'on n'a pass fait la commande commit;, la 1ere session est en état d'attente de la commande commit; de la 2e session.
-- Cela est une attente circulaire.
-- le problème de deadlock se produit.
