-- insert queries

insert into tst.singer(name) values
('Joe'),
('Mike'),
('Peter Paul'),
('Maraike Hill'),
('Till'),
('Anna'),
('Thomas Hahn'),
('Rumi');

insert into tst.genre(title) values
('folk'),
('rock'),
('pop'),
('k-pop'),
('classic');

insert into tst.album(name, pub_year) values
('start1', 2018),
('alb1', 1999),
('alb2', 2000),
('frost', 2020),
('impfge', 2021),
('oom', 2014),
('load', 2006),
('kiel', 2011);

insert into tst.collection(name, pub_year) values
('coll1', 2018),
('coll1', 1999),
('coll2', 2000),
('colli', 2020),
('newcoll', 2021),
('collnew', 2014),
('ucoll', 2006),
('colls', 2011);

insert into tst.track(name, duration_sek, album_id) values
('lang weil', 180, 1),
('lang', 90, 2),
('stop stop', 198, 2),
('start stop', 125, 3),
('plus', 191, 3),
('minus', 243, 4),
('mal mal', 170, 4),
('teil', 118, 5),
('alb1', 139, 5),
('brot', 213, 6),
('zeit', 80, 6),
('sahra', 145, 7),
('beer', 227, 7),
('code knot', 301, 8),
('my kiel', 260, 8);


insert into tst.collectiontrack(collection_id, track_id) values
(2, 1),
(2, 2),
(3, 15),
(1, 8),
(1, 8),
(5, 5),
(5, 6),
(5, 7),
(6, 4),
(7, 9),
(8, 13),
(4, 11),
(4, 12),
(7, 10),
(2, 4);

insert into tst.singeralbum(singer_id, album_id) values
(1, 8),
(2, 2),
(3, 2),
(4, 3),
(5, 7),
(6, 5),
(7, 6),
(8, 1);

insert into tst.singergenre(genre_id, singer_id) values
(3, 1),
(4, 2),
(5, 3),
(2, 4),
(1, 5),
(1, 6),
(3, 7),
(3, 8),
(4, 1),
(2, 2),
(1, 3);


-- select queries 

select name, pub_year
from tst.album 
where pub_year = 2018

select name, duration_sek
from tst.track 
order by duration_sek desc 
limit 1

select name, duration_sek
from tst.track 
where duration_sek >= 210

select name 
from tst.collection 
where pub_year between 2018 and 2020

select *
from tst.singer
where name not like '% %'

select name
from tst.track 
where name like '%my%'