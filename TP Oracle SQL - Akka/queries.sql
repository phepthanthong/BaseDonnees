-- R1 liste de tous les acteurs
select i.numind,nom,prenom
from acteur a, individu i
where a.numind = i.numind;

--R2 Pour chaque titre de film, le nom de son realisateur
select titre, nom, prenom from film f, individu i
where f.realisateur = i.numind;

--R3 pour chaque acteur, la liste des realisateurs avec lesquels il a joue
select ia.nom as TENDIENVIEN, ir.nom as TENDAODIEN
from individu ia, acteur a, film f, individu ir
where ia.numind = a.numind
and a.numfilm = f.numfilm
and f.realisateur = ir.numind;

--R4 le nombre film par genre
select libelle, count(*)
from genre g, film_genre fg
where g.codegenre = fg.codegenre
group by libelle;

--R5 la liste des individus pour lesquels nous n'avons pas enregistre de films ni en tant qu'acteur ni en tant que realisateur
select *
from individu
where numind not in
(select numind
from acteur
union
select numind
from film f, individu i
where f.realisateur = i.numind);

--R6 La liste des acteurs qui ont joué dans leurs propres films 
select ia.nom as NomActeur, ir.nom as NomRealisateur
from individu ia, acteur a, film f, individu ir
where ia.numind = a.numind
and a.numfilm = f.numfilm
and f.realisateur = ir.numind
and ia.nom = ir.nom;

select i.numind,nom,prenom
from acteur a, film f, individu i
where a.numfilm = f.numfilm
and f.realisateur = a.numind
and a.numind = i.numind;