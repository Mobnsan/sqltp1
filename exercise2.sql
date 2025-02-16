drop database festival;
create database festival;
use festival;
create table Representation(
Num_Rep int primary key,
titre_Rep varchar(100),
lieu varchar(100)
);
create table Musicien(
Num_mus int primary key,
nom varchar(100),
Num_Rep int,
foreign key (Num_Rep) references Representation(Num_Rep)
);
create table Programmer(
DateP date ,
tarif varchar(100),
Num_Rep int,
foreign key (Num_Rep) references Musicien(Num_Rep)
); 
select Num_Rep from Representation;
select Num_Rep from Representation where lieu='theatre allissa' ;
select m.Num_mus,r.titre_Rep from Musicien m join Representation r on r.Num_Rep = m.Num_Rep ;
select r.Num_Rep,r.titre_Rep,r.lieu,p.tarif from Representation r join Programmer p on r.Num_Rep = p.Num_Rep 
where dateP='2008-07-25' ;
select count(*) from Musicien where Num_mus=20;
select r.Num_Rep,P.DateP from Representation r join Programmer P where P.tarif<=20;