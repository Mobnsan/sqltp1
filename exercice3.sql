drop database formation;
create database formation;
use formation;
create table ETUDIANT(
CodeEt int primary key,
NomEt varchar(100),
DatnEt date
);
create table MATIERE(
CodeMat int primary key,
NomMat varchar(100),
CoefMat int
);
create table ENSEIGNANT(
CodeEns int primary key,
NomEns varchar(100),
GradeEnst varchar(100),
CodeMat int,
foreign key (CodeMat) references MATIERE(CodeMat)
);
create table NOTE(
CodeMat int,
CodeEt int,
note int,
primary key (CodeMat,CodeEt),
foreign key (CodeMat) references MATIERE(CodeMat),
foreign key (CodeEt) references ETUDIANT(CodeEt)
);
select * from ETUDIANT order by NomEt asc;
select NomEns,GradeEnst from ENSEIGNANT where NomEns='BD';
select m.NomMat,m.CoefMat,m.CodeMat,e.GradeEnst from MATIERE m join ENSEIGNANT e on m.CodeMat=e.CodeMat  where e.GradeEnst='BD';
select m.NomMat,m.CoefMat from MATIERE m join NOTE n on m.CodeMat=n.CodeMat join ETUDIANT e on e.CodeEt=n.CodeEt;
select count(*) from ENSEIGNANT e join MATIERE m on m.CodeMat=e.CodeMat  where m.NomMat='Informatique';
