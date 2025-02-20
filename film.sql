create database film;
use film;
create table FILM(
NUMF int primary key,
TITRE varchar(100),
GENRE varchar(100),
ANNEE date,
DUREE int,
BUDGET decimal(5,2),
NUMP int,
foreign key (NUMP) references PERSONNE(NUMP)
);
create table DISTRIBUTION(
NUMF int,
NUMA int,
ROLE varchar(100),
SALAIRE decimal(15,2),
primary key (NUMF,NUMA),
foreign key (NUMF) references FILM(NUMF),
foreign key (NUMA) references ACTEUR(NUMA)
);
create table PERSONNE(
NUMP int primary key,
NOM  varchar(100),
PRENOM varchar(100),
DATENAIS date
);
create table ACTEUR(
NUMA int primary key,
NUMP int,
SPECIALITE varchar(100),
TAILLE float,
POIDS float
);
select distinct TITRE from FILM;
select distinct TITRE from FILM where DUREE>180;
select distinct GENRE from FILM;
select distinct count(NUMF) from FILM group by GENRE;
select distinct TITRE,ANNEE from FILM where DUREE =(select max(DUREE) from FILM) ;
SELECT DISTINCT p.NOM, p.PRENOM
FROM PERSONNE p
JOIN FILM f ON f.NUMP = p.NUMP  
JOIN ACTEUR a ON p.NUMP = a.NUMP  
JOIN DISTRIBUTION d ON a.NUMP = d.NUMA AND f.NUMF = d.NUMF; 
select sum(SALAIRE)
from DISTRIBUTION
where NUMF = (
select NUMF
from FILM
where TITRE='Nuits blanches `a Seattle'
);
select F.ANNEE,F.TITRE,sum(S.SALAIRE)
from FILM F
join PERSONNE P on f.NUMP = p.NUMP
join DISTRIBUTION S ON f.NUMF = S.NUMF
where P.NOM='Spielberg'
group by F.ANNEE,F.TITRE
;

