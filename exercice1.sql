create database gestion;
use gestion;
create table client(
Numcli int primary key,
Nomcli varchar(100),
Prenomcli varchar(100),
adressecli varchar(100),
mailcli varchar(100) 
);
create table Produit(
Numprod int primary key,
désignation varchar(100),
prix decimal(5.2),
qte_stock int default 0
);
create table Vendeur(
Idvendeur int primary key,
Nomvendeur varchar(100),
adresse_vend varchar(100)
);
create table Commande(
Numcom int primary key,
Numcli int,
Idvendeur int,
Numprod int,
date_com date,
qte_com int,
foreign key (Numcli) references client(Numcli),
foreign key (Idvendeur) references Vendeur(Idvendeur),
foreign key (Numprod) references Produit(Numprod)
);
select adresse_vend from Vendeur where adresse_vend  like 'marakech%';
select Numprod,désignation,prix from Produit order by prix desc;
select Nomvendeur,adresse_vend from Vendeur where Nomvendeur  like 'm%';
select Nomvendeur,adresse_vend from Vendeur where adresse_vend  like 'm%';
select C.Numcom, C.Numcli,C.Idvendeur,C.Numprod,C.date_com,C.qte_com  from Commande C join Vendeur V on C.Idvendeur=V.Idvendeur where V.Nomvendeur='mohamed'  and 
C.date_com between '2012-01-01' AND '2012-01-30';
select count(*) as nbrC from Commande where Numprod=365
