

create database moviedb;
use moviedb;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Empty`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `act_id` varchar(50) NOT NULL,
  `act_fname` varchar(50) NOT NULL,
  `act_lname` varchar(50) NOT NULL,
  `act_gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES
('101', 'James', 'Stewart', 'M'),
('102', 'Deborah', 'Kerr', 'F'),
('103', 'Peter', 'OToole', 'M'),
('104', 'Robert', 'De Niro', 'M'),
('105', 'F. Murray', 'Abraham', 'M'),
('106', 'Harrison', 'Ford', 'M'),
('107', 'Nicole', 'Kidman', 'F'),
('108', 'Stephen', 'Baldwin', 'M'),
('109', 'Jack', 'Nicholson', 'M'),
('110', 'Mark', 'Wahlberg', 'M'),
('111', 'Woody', 'Allen', 'M'),
('112', 'Claire', 'Danes', 'F'),
('113', 'Tim', 'Robbins', 'M'),
('114', 'Kevin', 'Spacey', 'M'),
('115', 'Kate', 'Winslet', 'F'),
('116', 'Robin', 'Williams', 'M'),
('117', 'Jon', 'Voight', 'M'),
('118', 'Ewan', 'McGregor', 'M'),
('119', 'Christian', 'Bale', 'M'),
('120', 'Maggie', 'Gyllenhaal', 'F'),
('121', 'Dev', 'Patel', 'M'),
('122', 'Sigourney', 'Weaver', 'F'),
('123', 'David', 'Aston', 'M'),
('124', 'Ali', 'Astin', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `dir_id` int(20) NOT NULL,
  `dir_fname` varchar(20) NOT NULL,
  `dir_lname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES
(201, 'Alfred', 'Hitchcock'),
(202, 'Jack', 'Clayton'),
(203, 'David', 'Lean'),
(204, 'Michael', 'Cimino'),
(205, 'Milos', 'Forman'),
(206, 'Ridley', 'Scott'),
(207, 'Stanley', 'Kubrick'),
(208, 'Bryan', 'Singer'),
(209, 'Roman', 'Polanski'),
(210, 'Paul', 'Thomas Anderson'),
(211, 'Woody', 'Allen'),
(212, 'Hayao', 'Miyazaki'),
(213, 'Frank', 'Darabont'),
(214, 'Sam', 'Mendes'),
(215, 'James', 'Cameron'),
(216, 'Gus', 'Van Sant'),
(217, 'John', 'Boorman'),
(218, 'Danny', 'Boyle'),
(219, 'Christopher', 'Nolan'),
(220, 'Richard', 'Kelly'),
(221, 'Kevin', 'Spacey'),
(222, 'Andrei', 'Tarkovsky'),
(223, 'Peter', 'Jackson');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `gen_id` int(30) NOT NULL,
  `gen_title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`gen_id`, `gen_title`) VALUES
(1001, 'Action'),
(1002, 'Adventure'),
(1003, 'Animation'),
(1004, 'Biography'),
(1005, 'Comedy'),
(1006, 'Crime'),
(1007, 'Drama'),
(1008, 'Horror'),
(1009, 'Music'),
(1010, 'Mystery'),
(1011, 'Romance'),
(1012, 'Thriller'),
(1013, 'War');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `mov_id` int(11) NOT NULL,
  `mov_title` varchar(50) NOT NULL,
  `mov_year` int(11) NOT NULL,
  `mov_time` int(11) NOT NULL,
  `mov_lang` varchar(20) NOT NULL,
  `mov_dt_rel` date NOT NULL,
  `mov_rel_country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES
(901, 'Vertigo', 1958, 128, 'English', '1958-08-24', 'UK'),
(902, 'The Innocents', 1961, 100, 'English', '1962-02-19', 'SW'),
(903, 'Lawrence of Arabia', 1962, 216, 'English', '1962-12-11', 'UK'),
(904, 'The Deer Hunter', 1978, 183, 'English', '1979-03-08', 'UK'),
(905, 'Amadeus', 1984, 160, 'English', '1985-01-07', 'UK'),
(906, 'Blade Runner', 1982, 117, 'English', '1982-09-09', 'UK'),
(907, 'Eyes Wide Shut', 1999, 159, 'English', '0000-00-00', 'UK'),
(908, 'The Usual Suspects', 1995, 106, 'English', '1995-08-25', 'UK'),
(909, 'Chinatown', 1974, 130, 'English', '1974-08-09', 'UK'),
(910, 'Boogie Nights', 1997, 155, 'English', '1998-02-16', 'UK'),
(911, 'Annie Hall', 1977, 93, 'English', '1977-04-20', 'USA'),
(912, 'Princess Mononoke', 1997, 134, 'Japanese', '2001-10-19', 'UK'),
(913, 'The Shawshank Redemption', 1994, 142, 'English', '1995-02-17', 'UK'),
(914, 'American Beauty', 1999, 122, 'English', '0000-00-00', 'UK'),
(915, 'Titanic', 1997, 194, 'English', '1998-01-23', 'UK'),
(916, 'Good Will Hunting', 1997, 126, 'English', '1998-06-03', 'UK'),
(917, 'Deliverance', 1972, 109, 'English', '1982-10-05', 'UK'),
(918, 'Trainspotting', 1996, 94, 'English', '1996-02-23', 'UK'),
(919, 'The Prestige', 2006, 130, 'English', '2006-11-10', 'UK'),
(920, 'Donnie Darko', 2001, 113, 'English', '0000-00-00', 'UK'),
(921, 'Slumdog Millionaire', 2008, 120, 'English', '2009-01-09', 'UK'),
(922, 'Aliens', 1986, 137, 'English', '1986-08-29', 'UK'),
(923, 'Beyond the Sea', 2004, 118, 'English', '2004-11-26', 'UK'),
(924, 'Avatar', 2009, 162, 'English', '2009-12-17', 'UK'),
(925, 'Braveheart', 1995, 178, 'English', '1995-09-08', 'UK'),
(926, 'Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP'),
(927, 'Spirited Away', 2001, 125, 'Japanese', '2003-09-12', 'UK'),
(928, 'Back to the Future', 1985, 116, 'English', '1985-12-04', 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `act_id` int(20) NOT NULL,
  `mov_id` int(20) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`act_id`, `mov_id`, `role`) VALUES
(101, 901, 'John Scottie Ferguson'),
(102, 902, 'Miss Giddens'),
(103, 903, 'T.E. Lawrence'),
(104, 904, 'Michael'),
(105, 905, 'Antonio Salieri'),
(106, 906, 'Rick Deckard'),
(107, 907, 'Alice Harford'),
(108, 908, 'McManus'),
(110, 910, 'Eddie Adams'),
(111, 911, 'Alvy Singer'),
(112, 912, 'San'),
(113, 913, 'Andy Dufresne'),
(114, 914, 'Lester Burnham'),
(115, 915, 'Rose DeWitt Bukater'),
(116, 916, 'Sean Maguire'),
(117, 917, 'Ed'),
(118, 918, 'Renton'),
(120, 920, 'Elizabeth Darko'),
(121, 921, 'Older Jamal'),
(122, 922, 'Ripley'),
(114, 923, 'Bobby Darin'),
(109, 909, 'J.J. Gittes'),
(119, 919, 'Alfred Borden');

-- --------------------------------------------------------

--
-- Table structure for table `movie_direction`
--

CREATE TABLE `movie_direction` (
  `dir_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_direction`
--

INSERT INTO `movie_direction` (`dir_id`, `mov_id`) VALUES
(201, 901),
(202, 902),
(203, 903),
(204, 904),
(205, 905),
(206, 906),
(207, 907),
(208, 908),
(209, 909),
(210, 910),
(211, 911),
(212, 912),
(213, 913),
(214, 914),
(215, 915),
(215, 922),
(216, 916),
(217, 917),
(218, 918),
(218, 921),
(219, 919),
(220, 920),
(221, 923);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genres`
--

CREATE TABLE `movie_genres` (
  `mov_id` int(11) NOT NULL,
  `gen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_genres`
--

INSERT INTO `movie_genres` (`mov_id`, `gen_id`) VALUES
(901, 1010),
(902, 1008),
(903, 1002),
(904, 1013),
(906, 1012),
(907, 1010),
(908, 1006),
(911, 1005),
(912, 1003),
(913, 1006),
(914, 1011),
(917, 1002),
(918, 1007),
(921, 1007),
(922, 1001),
(923, 1009),
(926, 1007),
(927, 1010),
(928, 1007);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `mov_id` int(20) NOT NULL,
  `rev_id` int(20) NOT NULL,
  `rev_stars` decimal(20,0) NOT NULL,
  `num_o_ratings` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES
(901, 9001, '8', 263575),
(902, 9002, '8', 20207),
(903, 9003, '8', 202778),
(906, 9005, '8', 484746),
(924, 9006, '7', 0),
(908, 9007, '9', 779489),
(909, 9008, '0', 227235),
(910, 9009, '3', 195961),
(911, 9010, '8', 203875),
(912, 9011, '8', 0),
(914, 9013, '7', 862618),
(915, 9001, '8', 830095),
(916, 9014, '4', 642132),
(925, 9015, '8', 81328),
(918, 9016, '0', 580301),
(920, 9017, '8', 609451),
(921, 9018, '8', 667758),
(922, 9019, '8', 511613),
(923, 9020, '7', 13091);

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `rev_id` int(20) NOT NULL,
  `rev_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviewer`
--

INSERT INTO `reviewer` (`rev_id`, `rev_name`) VALUES
(9001, 'Righty Sock'),
(9002, 'Jack Malvern'),
(9003, 'Flagrant Baronessa'),
(9004, 'Alec Shaw'),
(9005, ''),
(9006, 'Victor Woeltjen'),
(9007, 'Simon Wright'),
(9008, 'Neal Wruck'),
(9009, 'Paul Monks'),
(9010, 'Mike Salvati'),
(9011, ''),
(9012, 'Wesley S. Walker'),
(9013, 'Sasha Goldshtein'),
(9014, 'Josh Cates'),
(9015, 'Krug Stillo'),
(9016, 'Scott LeBrun'),
(9017, 'Hannah Steele'),
(9018, 'Vincent Cadena'),
(9019, 'Brandt Sponseller'),
(9020, 'Richard Adams');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`act_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`dir_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`gen_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`mov_id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD KEY `act_id` (`act_id`,`mov_id`);

--
-- Indexes for table `movie_direction`
--
ALTER TABLE `movie_direction`
  ADD KEY `dir_id` (`dir_id`,`mov_id`);

--
-- Indexes for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD KEY `mov_id` (`mov_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `mov_id` (`mov_id`,`rev_id`);

--
-- Indexes for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`rev_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_direction`
--
ALTER TABLE `movie_direction`
  ADD CONSTRAINT `movie_direction_ibfk_1` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`),
  ADD CONSTRAINT `movie_direction_ibfk_2` FOREIGN KEY (`dir_id`) REFERENCES `director` (`dir_id`);

--
-- Constraints for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`mov_id`) REFERENCES `movie` (`mov_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- ============================================================================================================================================================================================================================================================================================================

-- Q1.Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name,last name and role.
-- ANS:
-- ---------------------------------------------------------------------
SELECT act_fname,act_lname,role
  FROM actors 
	  JOIN movie_cast ON actors.act_id=movie_cast.act_id
		JOIN movie ON movie_cast.mov_id=movie.mov_id 
		  AND movie.mov_title='Annie Hall';
-- -----------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================

-- Q2.From the following tables, Write a SQL query to find the director who directed a movie that casted a role for 'Eyes wide shut'. Return director first name,last name and movie title.
-- ANS:
-- ------------------------------------------------------------------
SELECT dir_fname, dir_lname, mov_title
FROM  director 
NATURAL JOIN movie_direction
NATURAL JOIN movie
NATURAL JOIN movie_cast
WHERE role IS  NOT NULL
AND mov_title='Eyes Wide Shut';
-- ------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================

-- Q3.Write a SQL query to find who directed a movie that casted a role as 'Sean maguire'. Return director first name,last name and movie title.
-- ANS:
-- ------------------------------------------------------------------
SELECT dir_fname, dir_lname, mov_title
FROM  director 
JOIN movie_direction 
  ON director.dir_id=movie_direction.dir_id
JOIN movie 
  ON movie_direction.mov_id=movie.mov_id
JOIN movie_cast 
  ON movie_cast.mov_id=movie.mov_id
  WHERE role='Sean Maguire';
-- ------------------------------------------------------------------
-- =================OR===============================================
-- ------------------------------------------------------------------
SELECT dir_fname, dir_lname, mov_title
FROM  director, movie_direction, movie, movie_cast
WHERE director.dir_id=movie_direction.dir_id
AND movie_direction.mov_id=movie.mov_id
AND movie.mov_id=movie_cast.mov_id
AND movie_cast.role='Sean Maguire';
-- ------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================

-- Q4.Write a SQL query to find the actors who have not acted in any movie betweeen 1990and 2000 (Begin and end values are included.).Return actor first name, last name, movie title and release year.
-- ANS:
-- ------------------------------------------------------------------
SELECT act_fname, act_lname, mov_title, mov_year
FROM actors
JOIN movie_cast 
ON actors.act_id=movie_cast.act_id
JOIN movie 
ON movie_cast.mov_id=movie.mov_id
WHERE mov_year NOT BETWEEN 1990 and 2000;
-- ------------------------------------------------------------------
-- ==============OR====================================================
-- --------------------------------------------------------------------
SELECT a.act_fname, a.act_lname, c.mov_title, c.mov_year
FROM actors a, movie_cast b, movie c
WHERE a.act_id=b.act_id
AND b.mov_id=c.mov_id
AND c.mov_year NOT BETWEEN 1990 and 2000;
-- ------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================

-- Q5.Write a SQL query to find the directors with the number of genres of movies. Group the result set on director first name, last name and generic title. sort the result-set in ascending order by director first name and last name.Return director first name, last name and number of genres of movie.
-- ANS:
-- ------------------------------------------------------------------
SELECT dir_fname,dir_lname, gen_title,count(gen_title)
FROM director
NATURAL JOIN movie_direction
NATURAL JOIN movie_genres
NATURAL JOIN genres
GROUP BY dir_fname, dir_lname,gen_title
ORDER BY dir_fname,dir_lname;
-- ------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================

-- Q6.Write a SQL query to find the movie with year and genres. Return movie title, movie year and generic title.
-- ANS:
-- ------------------------------------------------------------------
SELECT mov_title, mov_year, gen_title, dir_fname, dir_lname
FROM movie
NATURAL JOIN movie_genres
NATURAL JOIN genres
NATURAL JOIN movie_direction
NATURAL JOIN director;
-- ------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================

-- Q7.Write a SQL query to find the movies released berfore 1st January 1989. sort the result-set in descending order by date of release. Return movie title, release yeaar, date of release, duration, and first and last name of the direction.
-- ANS:
-- ------------------------------------------------------------------
SELECT movie.mov_title, mov_year, mov_dt_rel,
       mov_time,dir_fname, dir_lname 
FROM movie
JOIN  movie_direction 
   ON movie.mov_id = movie_direction.mov_id
JOIN director 
   ON movie_direction.dir_id=director.dir_id
WHERE mov_dt_rel <'1989-01-01'
ORDER BY mov_dt_rel desc;
-- ------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================

-- Q8.Write a SQL query to compute the average time and count the number of movies for each genre. Return genre title, average time and the number of movies for each genre.
-- ANS:
-- ------------------------------------------------------------------
SELECT gen_title, AVG(mov_time), COUNT(gen_title) 
FROM movie
NATURAL JOIN  movie_genres
NATURAL JOIN  genres
GROUP BY gen_title;
-- ------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================

-- Q9.Write a SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role.
-- ANS:
-- ------------------------------------------------------------------
SELECT mov_title, mov_year, dir_fname, dir_lname, 
       act_fname, act_lname, role 
FROM  movie
NATURAL JOIN movie_direction
NATURAL JOIN movie_cast
NATURAL JOIN director
NATURAL JOIN actors
WHERE mov_time=(SELECT MIN(mov_time) FROM movie);
-- ------------------------------------------------------------------
-- ============================================================================================================================================================================================================================================================================================================