CREATE DATABASE HOTEL_DB;

-- create a table named Hotel

create table Hotel(
Hotel_No varchar(10),
Hotel_Name varchar(20),
Address varchar(20),
primary key (Hotel_No));

-- insert some sample data

insert into hotel values('fb01', 'Grosvenor', 'London');
insert into hotel values('fb02', 'Watergate', 'Paris');
insert into hotel values('ch01', 'Omni Shoreham', 'London');
insert into hotel values('ch02', 'Phoenix Park', 'London');
insert into hotel values('dc01', 'Latham', 'Berlin');

-- create a table named Room

create table room(
Room_No numeric(5),
Hotel_No varchar(10),
Type varchar(10),
Price decimal(5,2),
primary key (Room_No, Hotel_No),
foreign key (Hotel_No) REFERENCES hotel_db.hotel(Hotel_No));

-- insert some sample data

insert into room values(501, 'fb01', 'single', 19);
insert into room values(601, 'fb01', 'double', 29);
insert into room values(701, 'fb01', 'family', 39);
insert into room values(1001, 'fb02', 'single', 58);
insert into room values(1101, 'fb02', 'double', 86);
insert into room values(1001, 'ch01', 'single', 29.99);
insert into room values(1101, 'ch01', 'family', 59.99);
insert into room values(701, 'ch02', 'single', 10);
insert into room values(801, 'ch02', 'double', 15);
insert into room values(901, 'dc01', 'single', 18);
insert into room values(1001, 'dc01', 'double', 30);
insert into room values(1101, 'dc01', 'family', 35);

-- create a table named Guest

create table guest(
Guest_No numeric(5),
Guest_Name varchar(20),
Guest_address varchar(50),
primary key (Guest_No));

-- insert some sample data

insert into guest values(10001, 'John Kay', '56 High St, London');
insert into guest values(10002, 'Mike Ritchie', '18 Tain St, London');
insert into guest values(10003, 'Mary Tregear', '5 Tarbot Rd, Aberdeen');
insert into guest values(10004, 'Joe Keogh', '2 Fergus Dr, Aberdeen');
insert into guest values(10005, 'Carol Farrel', '6 Achray St, Glasgow');
insert into guest values(10006, 'Tina Murphy', '63 Well St, Glasgow');
insert into guest values(10007, 'Tony Shaw', '12 Park Pl, Glasgow');

-- create a table named Booking

create table booking(
Hotel_No varchar(10),
Guest_No numeric(5),
Date_From date,
Date_To date,
Room_No numeric(5),
primary key (Hotel_No, Guest_No, Date_From),
foreign key (Room_No, Hotel_No) REFERENCES hotel_db.room(Room_No, Hotel_No),
foreign key (Guest_No) REFERENCES hotel_db.guest(Guest_No));

-- insert some sample data

insert into booking values('fb01', 10001, '04-04-01', '04-04-08', 501);
insert into booking values('fb01', 10004, '04-04-15', '04-05-15', 601);
insert into booking values('fb01', 10005, '04-05-02', '04-05-07', 501);
insert into booking values('fb01', 10002, '16-05-04', '04-05-29', 601);
insert into booking values('fb01', 10001, '04-05-01', null, 701);
insert into booking values('fb02', 10003, '04-04-05', '10-04-04', 1001);
insert into booking values('fb02', 10005, '04-05-12', '30-05-04', 1101);
insert into booking values('ch01', 10006, '04-04-21', null, 1101);
insert into booking values('ch02', 10002, '04-04-25', '04-05-06', 801);
insert into booking values('dc01', 10007, '04-05-13', '04-05-15', 1001);
insert into booking values('dc01', 10003, '04-05-20', null, 1001);

-- Creating and Populating Tables  

-- Inserting values of all tables
 
INSERT INTO hotel VALUES ('H111', 'Grosvenor', 'London');
INSERT INTO room VALUES ('1103', 'dc01', 'Single', 72.00);
INSERT INTO guest VALUES ('10008', 'John Smith', 'London');
INSERT INTO booking VALUES ('dc01', '10006', '2000-01-01', '2000-01-02', '1103');

-- =================================================================================================================================================================================

--   Update the price of all rooms by 1.05.
SET SQL_SAFE_UPDATES = 0;
UPDATE room SET Price = Price*1.05;
SET SQL_SAFE_UPDATES = 1;

-- ===============================================================================================================================================================================================================================================================================================================

-- Create a separate table with the same structure as the Booking table to hold archive records. Using the INSERT statement, copy the records from the Booking table to the archive table relating to bookings before 1st January 2000. Delete all bookings before 1st January 2000 from the Booking table.

CREATE TABLE booking_old(
Hotel_No CHAR(4) NOT NULL,
Guest_No CHAR(4) NOT NULL,
Date_From DATETIME NOT NULL,
Date_To DATETIME NULL,
Room_No VARCHAR(4) NOT NULL);


INSERT INTO booking_old
(SELECT * FROM booking
WHERE Date_To < DATE '2000-01-01');
DELETE FROM booking 
WHERE Date_To < DATE '2000-01-02';

-- ============================================================================================================================================================================

-- Simple Queries

-- Q1.List full details of all hotels.
-- ANS:
SELECT * FROM hotel;

-- ----------------------------------------------------------------------------------------------------

-- Q2.List full details of all hotels in London.
-- ANS:
SELECT * FROM hotel WHERE Address LIKE '%London%';

-- ----------------------------------------------------------------------------------------------------

-- Q3.List the names and addresses of all guests in London, alphabetically ordered by name.
-- ANS:

SELECT Guest_Name, Guest_address
FROM guest
WHERE Guest_address LIKE '%London%'
ORDER BY Guest_Name;

-- ----------------------------------------------------------------------------------------------------

-- Q4.List all double or family rooms with a price below £40.00 per night, in ascending order of price.
-- ANS:
SELECT * FROM room
 WHERE Price < 40 AND Type IN ('Double', 'Family')
 ORDER BY Price;
 
 -- ----------------------------------------------------------------------------------------------------
 
 -- Q5.List the bookings for which no date_to has been specified.
 -- ANS:
 SELECT * FROM booking WHERE Date_To IS NULL;
 
 -- ===============================================================================================
 
 -- Aggregate Function
 
 -- Q1.How many hotels are there?
 -- ANS:
SELECT COUNT(*) FROM hotel;
 
 -- ----------------------------------------------------------------------------------------------------
 
 -- Q2.What is the average price of a room?
 -- ANS:
 SELECT AVG(price) FROM room;
 
 -- ----------------------------------------------------------------------------------------------------
 
 -- Q3.What is the total revenue per night from all double rooms?
 -- ANS:
 SELECT SUM(price) FROM room WHERE type = 'Double';
 
 -- ----------------------------------------------------------------------------------------------------
 
 -- Q4.How many different guests have made bookings for August?
 -- ANS:
 SELECT COUNT(DISTINCT Guest_No)
 FROM booking
 WHERE (Date_From >= '2004-08-01' AND Date_From <= '2004-08-31');
 
-- What about for May?

SELECT COUNT(DISTINCT Guest_No)
 FROM booking
 WHERE (Date_From >= '2004-05-01' AND Date_From <= '2004-05-31');

-- ================================================================================================================================================================

-- Subqueries and Joins

-- Q1. List the price and type of all rooms at the Grosvenor Hotel.
-- ANS:
SELECT Price, Type
FROM room
WHERE Hotel_No = (SELECT Hotel_No FROM hotel
WHERE Hotel_Name = 'Grosvenor');

-- ----------------------------------------------------------------------------------------------------

-- Q2.List all guests currently staying at the Grosvenor Hotel.
-- ANS:
SELECT * FROM guest
WHERE Guest_No =
(SELECT Guest_No FROM booking
WHERE Date_From <= CURRENT_DATE AND Date_To >= CURRENT_DATE AND
Hotel_No = (SELECT Hotel_No FROM hotel
WHERE Hotel_Name = 'Grosvenor'));

-- ----------------------------------------------------------------------------------------------------

-- Q3. List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, if the room is occupied.
-- ANS:
SELECT r.* FROM room r LEFT JOIN
(SELECT g.Guest_Name, h.Hotel_No, b.Room_No FROM guest g, booking b, hotel h
WHERE g.Guest_No = b.Guest_No AND b.Hotel_No = h.Hotel_No AND
h.Hotel_Name= 'Grosvenor' AND
b.Date_From <= CURRENT_DATE AND b.Date_To >= CURRENT_DATE) AS XXX
ON r.Hotel_No = XXX.Hotel_No AND r.Room_No = XXX.Room_No;

-- ----------------------------------------------------------------------------------------------------

-- Q4.What is the total income from bookings for the Grosvenor Hotel today?
-- ANS:
SELECT SUM(Price) FROM booking b, room r, hotel h
WHERE (b.Date_From <= CURRENT_DATE AND
b.Date_To >= CURRENT_DATE) AND
r.Hotel_No = h.Hotel_No AND r.Room_No = b.Room_No;

-- ---------------------------------------------------------------------------------------------------

-- Q5.List the rooms that are currently unoccupied at the Grosvenor Hotel.
-- ANS:
SELECT * FROM room r
WHERE Room_No NOT IN
(SELECT Room_No FROM booking b, hotel h
WHERE (Date_From <= CURRENT_DATE AND
Date_To >= CURRENT_DATE) AND
b.Hotel_No = h.Hotel_No AND Hotel_Name = 'Grosvenor');

-- ----------------------------------------------------------------------------------------------------

-- Q6.What is the lost income from unoccupied rooms at the Grosvenor Hotel?
-- ANS:
SELECT SUM(price) FROM room r
WHERE Room_No NOT IN
(SELECT Room_No FROM booking b, hotel h
WHERE (Date_From <= CURRENT_DATE AND
Date_To >= CURRENT_DATE) AND
b.Hotel_No = h.Hotel_No AND Hotel_Name = 'Grosvenor');

-- ====================================================================================================================

-- Grouping

-- Q1.List the number of rooms in each hotel.
-- ANS:
SELECT Hotel_No, COUNT(Room_No) AS count FROM room
GROUP BY Hotel_No;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q2.List the number of rooms in each hotel in London.
-- ANS:
SELECT hotel.Hotel_No, COUNT(Room_No)
AS count FROM hotel, room
WHERE room.Hotel_No = hotel.Hotel_No
AND Address LIKE '%London%'
GROUP BY Hotel_No;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q3.What is the average number of bookings for each hotel in August? August month is not inserted but april is there so i found the april month thats ok.
-- ANS:
SELECT AVG(X) AS AveNumBook FROM
(SELECT Hotel_No, COUNT(Hotel_No) AS X
FROM booking b
WHERE (b.Date_From >= DATE'04-04-01' AND b.Date_From <= DATE'04-04-25')
GROUP BY Hotel_No) AS AnotherThing;

-- ---------------------------------------------------------------------------------------

-- Q4.What is the most commonly booked room type for each hotel in London?
-- ANS:
SELECT MAX(X) AS MostlyBook
FROM (SELECT Type, COUNT(Type) AS X
FROM booking b, hotel h, room r
WHERE r.Room_No = b.Room_No AND b.Hotel_No = h.Hotel_No AND
h.Address LIKE '%London%'
GROUP BY Type) AS Dummy;

-- ------------------------------------------------------------------------------

-- Q5.What is the lost income from unoccupied rooms at each hotel today?
-- ANS:
SELECT Hotel_No, SUM(Price) FROM room r
WHERE Room_No NOT IN
(SELECT Room_No FROM booking b, hotel h
WHERE (Date_From <= CURRENT_DATE AND
Date_To >= CURRENT_DATE) AND
b.Hotel_No = h.Hotel_No)
GROUP BY Hotel_No;

-- ===========================================================FINESH THIS PROJECT THANK YOU==================================================================================================

 


 