create table city(
cityname varchar(50) not null,
team1 varchar(50) not null,
team2 varchar(50),
team3 varchar(50),
team4 varchar(50),
primary key (cityname)
);

create table players(
name varchar(40) not null,
jerseynumber int not null,
position varchar (50) not null,
primary key (name)
);

create table coaches(
name varchar(50) not null,
contractdate date not null,
primary key (name)
);

create table footballteam(
name varchar(50) not null,
stadium varchar(50) not null,
city varchar(50) not null,
player1 varchar(40) not null,
player2 varchar(40),
player3 varchar(40),
coach varchar(50) not null,
primary key (name),
foreign key (city) references city (cityname),
foreign key (player1) references players (name),
foreign key (player2) references players (name),
foreign key (player3) references players (name),
foreign key (coach) references coaches (name)
);

create table games(
week int auto_increment not null,
gamedate date not null,
team1 varchar(50),
team2 varchar(50),
team1sqb varchar(50),
team2sqb varchar(50),
stadium varchar(50),
team1score int,
team2score int,
primary key (week),
foreign key (team1) references footballteam (name),
foreign key (team2) references footballteam (name),
foreign key (team1sqb) references players (name),
foreign key (team2sqb) references players (name)
);

insert into city (cityname, team1)
values ("queens", "koala"),
("gorham", "sparrows"),
("yonkers", "rats"),
("jersey city", "bats");

insert into players (name, jerseynumber, position)
values ("steve jobs", '22', "WR"),
("billy bob", '17', "QB"),
("john adams", '32', "QB"),
("bart simpson", '23', "OT"),
("david rose", '44', "WR"),
("john murphy", '56', "LB"),
("jon snow", '72', "QB"),
("james bond", '99', "DT"),
("tony hawk", '45', "TE"),
("bugs bunny", '00', "QB"),
("elmer fudd", '11', "LB"),
("wesley nipes", '37', "DE");

insert into coaches (name, contractdate)
values ("emma green", '2019-08-31'),
("devon justin", '2017-03-24'),
("rick adams", '2014-09-21'),
("leslie aprils", '2020-01-12');

insert into footballteam (name, stadium, city, player1, player2, player3, coach)
values ("koala", "empire", "queens", "steve jobs", "billy bob", "bart simpson", "emma green"),
("sparrows", "designer", "gorham", "john adams", "wesley nipes", "david rose", "devon justin"),
("rats", "slat", "yonkers", "john murphy", "jon snow", "james bond", "rick adams"),
("bats", "saks", "jersey city", "tony hawk", "bugs bunny", "elmer fudd", "leslie aprils" );

insert into games (gamedate, team1, team2, team1sqb, team2sqb, stadium, team1score, team2score)
values ("2020-01-02", "sparrows", "koala", "john adams", "billy bob", "designer", '26', '18'),
("2020-01-11", "rats", "bats", "jon snow", "bugs bunny", "saks", '14', '7'),
("2020-01-16", "bats", "koala", "bugs bunny", "billy bob", "empire", '3', '0');

UPDATE city 
SET team2 = "test" 
WHERE cityname = "queens";


