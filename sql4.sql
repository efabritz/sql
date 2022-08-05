--1
select g.title, count(s.id)
from tst.singer s, tst.genre g, tst.singergenre sg
where s.id = sg.singer_id and g.id = sg.genre_id 
group by g.title 

--2
select a.name, count(t.id) 
from tst.album a, tst.track t 
where a.id = t.album_id and a.pub_year between 2019 and 2020
group by a.name

--3
select a.name, avg(t.duration_sek) 
from tst.album a, tst.track t 
where a.id = t.album_id
group by a.name

--4
select s.name 
from tst.singer s, tst.singeralbum sa, tst.album a 
where s.id = sa.singer_id and sa.album_id = a.id and a.pub_year != 2020

--5
select distinct c.name
from tst.collection c, tst.collectiontrack ct, tst.track t, tst.album a, tst.singeralbum sa, tst.singer s 
where s.name = 'Maraike Hill' and s.id = sa.singer_id and sa.album_id = t.album_id and t.id = ct.track_id and ct.collection_id = c.id 

--6
select a.name, count(g.id) as genre_count
from tst.album a, tst.singeralbum sa, tst.singer s, tst.singergenre sg, tst.genre g 
where a.id = sa.album_id and sa.singer_id = s.id and s.id = sg.singer_id and sg.genre_id = g.id 
group by a.name 
having count(g.id) > 1

--7
select inner_t.tname
from tst.track t
left join (select distinct t.id as id, t.name as tname
from tst.track t, tst.collectiontrack ct
where t.id = ct.track_id
order by  t.id) as inner_t on t.id = inner_t.id
where inner_t.id is not NULL

--8
select t1.name
from
(select s.name, min(t.duration_sek) as mindur
from tst.singer s, tst.singeralbum sa, tst.album a, tst.track t
where s.id = sa.singer_id and sa.album_id = a.id and t.album_id = a.id
group by s.name) t1,
(select min(t.duration_sek) as mindur
from tst.track t) t2
where t1.mindur = t2.mindur

--9
select t1.name
from
(select a.name, count(t.id) as tcount
from tst.album a, tst.track t
where a.id = t.album_id
group by a.name) t1,
(select min(t2.tcount) as mincount
from
(select a.name, count(t.id) as tcount
from tst.album a, tst.track t
where a.id = t.album_id
group by a.name) t2) tmin
where tmin.mincount = t1.tcount
