create database BANQUE;
use BANQUE;
create table AGENCE(
Num_Agence int primary key,
Nom varchar(100),
Ville varchar(100),
Actif varchar(100)
);
create table CLIENT(
Num_Client int primary key,
Nom varchar(100),
Prenom varchar(100),
Ville varchar(100)
);
create table COMPTE(
Num_Compte int primary key,
Num_Agence int,
Num_Client int,
Solde decimal(5,2),
foreign key (Num_Agence) references AGENCE(Num_Agence),
foreign key (Num_Client) references CLIENT(Num_Client)
);
create table EMPRUNT(
Num_Emprunt int primary key,
Num_Agence int,
Num_Client int,
Montant decimal(5,2),
foreign key (Num_Agence) references AGENCE(Num_Agence),
foreign key (Num_Client) references CLIENT(Num_Client)
);

select Num_Client 
from COMPTE
order by sold>1000 and sold<1000;

select distinct c.Nom from COMPTE m 
join AGENCE e on m.Num_Agence=e.Num_Agence
join CLIENT c on m.Num_Client=c.Num_Client
where not (c.Nom='Liliane ' and c.Prenom='Bettencourt ')
;
SELECT DISTINCT Nom
FROM AGENCE
WHERE Actif> all(
select sum(Actif)
from AGENCE
where nom='saint'
group by nom
);
select sold 
from COMPTE
where sold>1000;
select distinct c.Nom from COMPTE m 
join AGENCE e on m.Num_Agence=e.Num_Agence
join CLIENT c on m.Num_Client=c.Num_Client
group by c.Nom
having sum(m.Solde)>all(
select sum(Actif)
from AGENCE a
where a.Nom='saint'
order by a.Num_Agence
);
select distinct c.Nom from COMPTE m 
join AGENCE e on m.Num_Agence=e.Num_Agence
join CLIENT c on m.Num_Client=c.Num_Client
group by c.Nom
having sum(m.Solde)>all(
select sum(a.Actif)
from AGENCE a
);
select distinct c.Nom from COMPTE m 
join AGENCE e on m.Num_Agence=e.Num_Agence
join CLIENT c on m.Num_Client=c.Num_Client
where e.Num_Agence='saint';

