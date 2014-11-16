-- a) Afficher les codes et noms des séjours proposés en Espagne
select s.CODESEJOUR, s.NOMSEJOUR
from sejours s, pays p
where p.NOMPAYS = 'ESPAGNE'
and s.CODEPAYS = p.CODEPAYS;

-- b) Donnez le montant, le code, le nom des séjours en France 
-- pour la semaine du 20/12/2010 au 27/12/2010
select t.PRIXTTC, s.CODESEJOUR, s.NOMSEJOUR
from sejours s, tarifs t, pays p, calendrier c
where p.CODEPAYS = s.CODEPAYS
and s.CODESEJOUR = t.CODESEJOUR
and t.NOSEM = c.NOSEM
and p.NOMPAYS = 'FRANCE'
and ( datedeb, datefin ) overlaps ( TO_DATE('20/12/2010'), TO_DATE('27/12/2010') );

-- c) Quels sont les séjours dont le nom contient le mot "soleil"
select s.NOMSEJOUR
from sejours s
where s.NOMSEJOUR like '%SOLEIL%';
 
-- d) Lister les prix des semaines entre le 10/04/2011 et 10/05/2011 pour le séjour de nom "Soleil d'Andalousie"
select s.NOMSEJOUR, c.NOSEM, t.PRIXTTC 
from sejours s, calendrier c, tarifs t
where s.CODESEJOUR = t.CODESEJOUR
and t.NOSEM = c.NOSEM
and ( DATEDEB, DATEFIN ) overlaps ( TO_DATE('10/04/2011'), TO_DATE('10/05/2011') );

-- e) Quel est le nombre de séjours ayant un prix inférieur à 500
select count(*)
from sejours s, tarifs t, calendrier c
where s.CODESEJOUR = t.CODESEJOUR
and t.NOSEM = c.NOSEM
and t.PRIXTTC > 500;

-- f) Quel est le prix moyenne des séjours en Espagne entre le 01/07/2011 et 31/08/2011
select avg(PRIXTTC) as Prix_Moyen_Esp
from tarifs t, calendrier c, sejours s, pays p
where t.NOSEM = c.NOSEM
and t.CODESEJOUR = s.CODESEJOUR
and s.CODEPAYS = p.CODEPAYS
and p.NOMPAYS = 'ESPAGNE'
and ( DATEDEB, DATEFIN ) overlaps ( TO_DATE('01/07/2011'), TO_DATE('31/08/2011') );

-- g) Quelles sont les semaines où l'on n'a pas de prix inférieur à 400
select s.CODESEJOUR, c.NOSEM, t.PRIXTTC
from tarifs t, sejours s, calendrier c
where t.NOSEM = c.NOSEM
and s.CODESEJOUR = t.CODESEJOUR
and t.PRIXTTC > 400;

-- h) Pour chaque pays, quel est le nombre de séjours proposés
select p.NOMPAYS, count(*) as Nombre
from sejours s, pays p
where s.CODEPAYS = p.CODEPAYS
group by p.NOMPAYS;

-- i) Donnez les semaines les moins chères pour le séjour de nom "Mer et désert"
select t.NOSEM, s.NOMSEJOUR, c.DATEDEB, c.DATEFIN, t.PRIXTTC
from sejours s, tarifs t, calendrier c
where s.CODESEJOUR = t.CODESEJOUR
and t.NOSEM = c.NOSEM
and s.NOMSEJOUR = 'MER ET DESERT'
and t.PRIXTTC = (
	select min(PRIXTTC)
	from tarifs t, sejours s
	where s.CODESEJOUR = t.CODESEJOUR
	and s.NOMSEJOUR = 'MER ET DESERT' ) ;
	
-- j) Quel est le séjour (code et nom, date) le moins cher
select s.CODESEJOUR, s.NOMSEJOUR, c.DATEDEB, c.DATEFIN, t.PRIXTTC
from sejours s, tarifs t, calendrier c
where s.CODESEJOUR = t.CODESEJOUR
and t.NOSEM = c.NOSEM
and t.PRIXTTC = (
	select min(PRIXTTC)
	from tarifs) ;