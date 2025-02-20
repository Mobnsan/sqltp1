drop database voitureee;
-- Q1
create database voitureee;
use voitureee;
 
create table voiture(
	noV int primary key,
    
	marque varchar(100) not null 
    check (marque='HONDA' or marque='TOYOTA' or marque='NISSAN'),
	model varchar(100) not null,
	annee date not null,
	anciente int not null,
	couleur varchar(100),
	kilometres decimal(5.2) not null CHECK (kilometres <= 25000)
);
 
-- Q2
create table proprietaire(
	idP int primary key ,
	nom varchar(100) not null,
	tel int ,
	Permis varchar(100) not null
);
-- Q3
create table PROPRIETAIRE_VOITURE(
	idP int  ,
    nov int ,
	prix decimal(5.2),
    primary key (idP,noV)
);
alter table PROPRIETAIRE_VOITURE
add constraint proprietaire_fk foreign key (idP) references proprietaire(idP);
alter table PROPRIETAIRE_VOITURE
add constraint voiture_fk foreign key (nov) references voiture(nov);
alter table proprietaire
add adresse varchar(30);
 alter table proprietaire add  unique(Permis);
alter table voiture
drop column couleur;