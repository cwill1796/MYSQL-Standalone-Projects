create table exon(
exonid int not null,
geneassociatedwith varchar(50),
startpos int,
endpos int,
primary key (exonid)
);

create table intron(
intronid int not null,
geneassociatedwith varchar(50),
numberingene int,
startpos int,
endpos int,
primary key (intronid)
);

create table promoterelem(
name varchar(50) not null,
type varchar(50),
primary key (name)
);

create table students(
studentsidnumber int auto_increment not null,
name varchar(50) not null,
primary key (studentsidnumber)
);

create table protocol(
protocolnumber int auto_increment not null,
pname varchar(50) not null,
expconditions varchar(50),
primary key (protocolnumber)
);

create table gene(
name varchar(50) not null,
chromnumber int,
organism varchar(50),
startpos int,
endpos int,
exon int not null,
intron int,
promoterelement varchar(50),
primary key (name),
foreign key (exon) references exon (exonid),
foreign key (intron) references intron (intronid),
foreign key (promoterelement) references promoterelem (name)
);

create table experiment(
expid int auto_increment not null,
gene varchar(50),
studentsidnumber int,
labname varchar(50),
startdate date,
geneactivity varchar(50),
protocolnumber int,
primary key (expid),
foreign key (gene) references gene (name),
foreign key (studentsidnumber) references students (studentsidnumber),
foreign key (protocolnumber) references protocol (protocolnumber)
);

insert into exon (exonid, geneassociatedwith, startpos, endpos)
values (4297, "KMT2A", 118436490, 118436512),
(7517, "TP53", 7668402, 7669608),
(3043, "HBB", 5225466, 5225597),
(7038, "TG", 132866935, 132867000),
(81693, "AMN", 102922548, 102922750);


insert into protocol (pname, expconditions)
values ("westernblot", "condition1"),
("ELISA", "condition2"),
("profiling", "condition3"),
("RTPCR", "condition2"),
("microarray", "condition4");

insert into promoterelem (name, type)
values ("GH11J118433", "promoter_enhancer"),
("GH17J007684", "promoter_enhancer"),
("GH11J005272", "enhancer"),
("GH08J132866", "promoter"),
("GH14J102922", "promoter_enhancer");

insert into gene (name, chromnumber, organism, startpos, endpos, exon, promoterelement)
values ("KMT2A", 11, "homosapiens", 11836490, 118526832, 4297, "GH11J118433"),
("TP53", 17, "homosapiens", 7661779, 7687550, 7517, "GH17J007684"),
("HBB", 11, "homosapiens", 5225464, 5229395, 3043, "GH11J005272"),
("TG", 8, "homosapiens", 132866935, 133134903, 7038, "GH08J132866"),
("AMN", 14, "drosophila", 102922548, 102933596, 81693, "GH14J102922");


insert into students (name)
values ("josh adams"),
("steve adams"),
("bugs bunny"),
("bart simpson"),
("sherlock holmes");

insert into experiment (gene, studentsidnumber, labname, startdate, geneactivity, protocolnumber)
values ("KMT2A", 1, "weiner", '2017-06-29', "expressed", 1),
("AMN", 3, "weiner", '2019-12-25', "not_expressed", 5),
("TG", 2, "wesley", '2018-05-12', "expressed", 2),
("HBB", 4, "wesley", '2017-08-22', "expressed", 4),
("TP53", 5, "john", '2020-01-12', "not_expressed", 3);


#How many students are in the weiner lab, what is their id number and what lab protocol are they using?
select studentsidnumber, name, labname, protocolnumber
from students join experiment using (`studentsidnumber`)
where labname = "weiner";

#What students along with their id number achieved "expressed" gene activity and what protocol was used?
select studentsidnumber, name, gene, geneactivity, protocolnumber
from students join experiment using (`studentsidnumber`)
where geneactivity = "expressed";

#What students along with their id number are in the "wesley" lab and what gene are those students working on?
select name, gene, labname
from students join experiment using (`studentsidnumber`)
where labname = "wesley";

#Who was the first student entered into the "students" database?
select name 
from students
where studentsidnumber = '1';

#what protocol is the student working on the "AMV" gene using and what is their id number?
select gene, studentsidnumber, pname
from experiment join protocol using (protocolnumber)
where gene = "AMN";






