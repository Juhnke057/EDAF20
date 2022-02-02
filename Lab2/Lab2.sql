use sys;
-- Enable the use of foreign_keys in SQLite, by default OFF!
set foreign_key_checks = 0;
drop table if exists usershow;
drop table if exists theater;
drop table if exists movie;
drop table if exists movieShow;
drop table if exists ticket;
set foreign_key_checks = 1;
create table usershow(
userName varchar(50) not NULL,
realName varchar(50) not NULL,
phoneNbr char(10) not NULL,
primary key(userName)
);

create table theater(
theaterName varchar(50) not null,
nbrSeats Integer not null,
primary key(theaterName)
);

create table movie(
movieName varchar(50) not NULL,
movieID varchar(50) not NULL,
primary key(movieID)
);

create table movieShow(
movieShowID varchar(50) not NULL,
theaterName varchar(50) not Null,
movieID varchar(50) not NULL,
showDate Date,
primary key(movieShowID),
foreign key(theaterName) references theater(theaterName),
foreign key(movieID) references movie(movieID)
);

create table ticket(
resNbr integer AUTO_INCREMENT,
userName varchar(50) not NULL,
movieShowID varchar(50) not NULL,
primary key(resNbr),
foreign key(userName) references usershow(userName),
foreign key(movieShowID) references movieShow(movieShowID)
);

insert into usershow(userName, realNAme, phoneNbr) values
('Viktor', 'Alexander Juhnke', '0009201336'),
('ReglerKungen123', 'Mats Lilja', '0701234567'),
('Stockholm_Suger', 'Henry Callin', '1234123412');
insert into theater(theaterName, nbrSeats) value
('Filmstaden Helsingborg', 500),
('Filmstaden Malmö', 700),
('Filmstaden Lund', 350);
insert into movie(movieName, movieID) values
('Spider-Man: No Way Home','spoder123'),
('Nightmare Alley','alley123'),
('Scary Movie 5','scary5');
insert into movieShow(movieShowID, theaterName, MovieID, showDate) values
('1111','Filmstaden Helsingborg','alley123','2022-02-05'),
('1112','Filmstaden Malmö','spoder123','2022-03-21'),
('1234','Filmstaden Lund','scary5','2023-12-24');
insert into ticket(resNbr, userName, movieShowID) values
('111','Viktor','1111'),
('112','ReglerKungen123','1112'),
('123','Stockholm_Suger','1234');
-- b
select movieName from movieShow
join movie on movieShow.movieID = movie.movieID;

select showDate 
from movieShow;

select * 
from MovieShow;
-- c 
-- ??????

-- D8
