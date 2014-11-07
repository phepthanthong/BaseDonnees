create table individu (
numind number,
nom varchar(20),
prenom varchar(20),
constraint pk_individu primary key(numind) );

create table film (
numfilm number,
titre varchar(20),
realisateur number,
constraint pk_film primary key(numfilm),
constraint fk_film_real foreign key(realisateur) references individu );

create table acteur (
numfilm number,
numind number,
constraint pk_acteur primary key(numfilm,numind),
constraint fk_acteur_film foreign key (numfilm) references film,
constraint fk_aacteur_ind foreign key (numind) references individu );

create table genre (
codegenre varchar(2),
libelle varchar(30),
constraint pk_genre primary key (codegenre) );

create table film_genre (
numfilm number,
codegenre varchar(2),
constraint pk_film_genre primary key ( numfilm, codegenre ),
constraint fk_fg_film foreign key (numfilm) references film,
constraint fk_fg_genre foreign key (codegenre) references genre );