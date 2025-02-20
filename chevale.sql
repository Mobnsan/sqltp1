DROP TABLE IF EXISTS participe;
DROP TABLE IF EXISTS croissance;
DROP TABLE IF EXISTS propriete;
DROP TABLE IF EXISTS cheval;
DROP TABLE IF EXISTS personne;
DROP TABLE IF EXISTS race;
DROP TABLE IF EXISTS concours;
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
describe propriete;

ALTER TABLE propriete ADD mohamed DECIMAL(5,1);

describe propriete;

alter table propriete drop column mohamed;
describe race;
ALTER TABLE race MODIFY poidtype DECIMAL(8,2);
ALTER TABLE race MODIFY tailetupe DECIMAL(8,2);
insert into race(nomr,tailetupe)
values('mohameed',145.4);
update race set nomr='miaw' where nomr='mohameed';
select * from race;
select namek from jhngfh
where dgfhf and ghhfd or jgfhjnfg;


