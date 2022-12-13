


CREATE DATABASE country;

use country;

CREATE TABLE IF NOT EXISTS `cities` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `population` mediumint(11) unsigned DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `city_state` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_code` varchar(3) DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


INSERT INTO `cities` (`id`, `name`, `population`, `surface`, `city_state`) 
VALUES (1, 'New York', 463333,  15.31667, '01'),
(2, 'Albany', 391234,  16.99663, '01'),
(3, 'Buffalo', 402356,  10.12345, '01'),
(4, 'San Bruno', 153233,  9.22147, '02'),
(5, 'SAN-Francisco', 205689,  11.99632, '02'),
(6, 'SAN-Diego', 269988,  19.89451, '02'),
(7, 'Houston', 197009,  18.00001, '03'),
(8, 'Chicago', 239878,  22.01250, '04');


INSERT INTO `states` (`id`, `state_code`, `state_name`) 
VALUES (1, '01', 'New York'),
(2, '02', 'California'),
(3, '03', 'Texas'),
(4, '04', 'Illinois'),
(5, '978', 'Florida'),
(6, '971', 'Indiana');

-- ===================================================================================================================================================================

-- Q1.Get the list of the 3 most populated cities.
-- ANS:
use country;
select * from sys.cities
order by population desc limit 0,3;

-- ===================================================================================================================================================================

-- Q2.Get the list of the 3 cities with the smallest surface.
-- ANS:
select * from sys.cities
order by surface asc limit 3;
-- ===================================================================================================================================================================

-- Q3.Get the list of states shose department number starts with '97'.
-- ANS:
select * from sys.states
where state_code like '97%';

-- ===================================================================================================================================================================

-- Q4.Get the names of the 3 most populated cities, as well as the name of the associted states.
-- ANS:
select cities.name ,population,states.state_name,cities.id from cities
inner join 
states on cities.id=states.id
order by population desc limit 0,3;

-- ===================================================================================================================================================================

-- Q5.Get the list of the name of each state, associated with its code and the number of cities within these states, by sorting in order to get in priority the states which have the largest number of cities.
-- ANS:
select state_name,state_code,count(cities.id)
from states inner join cities on states.id=cities.city_state
group by states.state_name,states.state_code
order by count(cities.id);

-- ===================================================================================================================================================================

-- Q6.Get the list of the 3 largest states, in terms of surface area.
-- ANS:
select s.state_name,sum(c.surface)
from cities as c join states as s
where c.city_state=s.state_code
group by s.state_name 
order by sum(c.surface) desc limit 3;

-- ===================================================================================================================================================================

-- Q7.Count the number of cities whose names begin with 'san'.
-- ANS:
select count(name) from cities
where cities.name like 'San%';

-- ===================================================================================================================================================================

-- Q8.Get the list of cities whose surface is greater than the average surface.
-- ANS:
select * from cities 
where cities.surface >
(select avg(cities.surface) from cities);

-- ===================================================================================================================================================================

-- Q9.Get the list states with more than 1 million residents.
-- ANS:
Select s.state_name, c.population, sum(c.population)
from states as s join cities as c on c.city_state=s.state_code
group by s.state_code
having sum(c.population) > 1000000;

-- ===================================================================================================================================================================

-- Q10.Replace the dashes with a blank space, for all cities beginning with 'SAN-'(inside the column containing the upper case names).
-- ANS:
update cities set name =replace(name,' ','-') where name like 'SAN%'
SET SQL_SAFE_UPDATES=0;

select * from cities

-- ===================================================================================================================================================================