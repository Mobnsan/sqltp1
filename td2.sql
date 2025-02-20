create table concours(
libelle int primary key,
anne year,
nbrparticip int 
);
create table race (
nomr varchar(50) primary key,
poidtype DECIMAL(4,2) default 14,
tailetupe decimal(4,2)
);
create table personne(
numpr int primary key,
nomper varchar(50),
prenom varchar(50),
tel int,
adresse varchar(200),
fonctionp varchar(100),
numper1 int ,
FOREIGN KEY (numper1) REFERENCES personne(numpr)
);

create table cheval(
numcheval int primary key,
nomcheval varchar(50),
numtato int ,
coulourcheval varchar(30),
numper int,
FOREIGN KEY (numper) REFERENCES personne(numpr),
nomr varchar(50),
FOREIGN KEY (nomr) REFERENCES race(nomr),
numcheval1 int,
FOREIGN KEY (numcheval1) REFERENCES cheval(numcheval),
numcheval2 int,
FOREIGN KEY (numcheval2) REFERENCES cheval(numcheval)
);
create table croissance(
mois varchar(40) primary key,
poidcr DECIMAL(4,2),
taillercr decimal(2,2),
numcheval int,
FOREIGN KEY (numcheval) REFERENCES cheval(numcheval)
);

create table participe(
numcheval int,
libelle int,
position int,
primary key(libelle , numcheval),
FOREIGN KEY (numcheval) REFERENCES cheval(numcheval),
FOREIGN KEY (libelle) REFERENCES concours(libelle)

);
create table propriete (
numcheval int primary key,
FOREIGN KEY (numcheval) REFERENCES cheval(numcheval),
datecheval date,
prix decimal(50,3),
numpr int,
foreign key (numpr) references personne(numpr)
);
-- exercice 4
select count(*)
from cheval
where coulourcheval='noire';
select count(*)
from race
where nomr='AngloArabe';
select numcheval,nomcheval
from cheval
where numtato='T0415';
select count(*) from concours
where libelle='Concours Dubai'
;
select sum(nbrparticip)
from concours
where libelle='Concours Dubai';
select C.anne 
from concours C
join participe P on P.libelle=C.libelle
join cheval CH on CH.numcheval=P.numcheval
where P.position=1
order by C.anne
;
select CH.numcheval 
from concours C
join participe P on P.libelle=C.libelle
join cheval CH on CH.numcheval=P.numcheval
where P.libelle='2018 du concours de Londres'
;
select count(numpr)
from propriete;
select count(numcheval)
from propriete
where datecheval='20-07-2018';
select sum(prix)
from propriete
where datecheval='2018-07-20';

-- exercice 3

SELECT * FROM concours;
SELECT * FROM race;
SELECT * FROM personne;
SELECT * FROM cheval;
SELECT * FROM croissance;
SELECT * FROM participe;
SELECT * FROM propriete;

select nomr
from race
where nomr='Arabian'
order by nomr DESC
;
select poidtype,tailetupe
from race;
select numpr 
from propriete;
select numper1
from personne;
select libelle
from concours
where anne='2019';




