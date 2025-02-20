create database Developper;
use Developper;
create table Developpeur(
NumDev int primary key,
NomDev varchar(100),
AdrDev varchar(100),
EmailDev varchar(100),
TelDev int
);
create table Projet(
NumProj int primary key,
TitreProj varchar(100),
DateDeb date,
DateFin date
);
create table Logiciel(
CodLog int primary key,
NomLog varchar(100),
PrixLog int,
NumProj int,
foreign key (NumProj) references Projet(NumProj)
);
create table Realisation(
NumProj int,
NumDev int,
primary key (NumProj,NumDev),
foreign key (NumProj) references Projet(NumProj),
foreign key (NumDev) references Developpeur(NumDev)
);
select NomLog,PrixLog
from Logiciel
where NumProj=(
select NumProj
from Projet
where TitreProj='gestion de stock'
)
order by PrixLog DESC;
select sum(PrixLog) as courstotalduprojet
from Logiciel
where NumProj=10;
select sum(D.NumDev)
from Developpeur D 
join Realisation R on R.NumDev=D.NumDev 
where R.TitreProj='gestion de stock';
select P.TitreProj
from Projet P
join  Logiciel L on L.NumProj=P.NumProj
group by P.NumProj
having count(L.CodLog)>5;
select D.NumDev,D.NomDev
from Developpeur D
join Realisation R on R.NumDev=D.NumDev 
join Projet P on R.NumProj=P.NumProj
group by D.NumDev,D.NomDev
having count(distinct(R.NumProj))=(select count(*) from Projet)
;
select P.NumProj
from Projet P
join Realisation R on R.NumProj=P.NumProj
join Developpeur D on R.NumDev=D.NumDev
group by P.NumProj
having count(distinct R.NumDev)=(select count(*) from Developpeur);
