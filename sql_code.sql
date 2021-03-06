CREATE TABLE user (email VARCHAR(50), password VARCHAR(100), address VARCHAR(500), zipcode VARCHAR(10), firstname VARCHAR(20), lastname VARCHAR(20), loggedin int, valid_id int, age int, work_id int, phone VARCHAR(15), gender VARCHAR(10), confirm int);


CREATE TABLE reservation (reservation_id VARCHAR(20), user_id VARCHAR(20), flight_id VARCHAR(20), bookedTimeArrival date, bookedTimeDeparture date, reservation_status boolean, ticket_price float, numPassengers int, currentAirport VARCHAR(40), destinationAirport VARCHAR(40), classType VARCHAR(20));


CREATE TABLE flight(flight_id VARCHAR(20), arrivingTime date, departingTime date, origin VARCHAR(20), destination VARCHAR(20), airplane_id VARCHAR(20), price float, frequency VARCHAR(20));
CREATE TABLE bank_acc (acc_id VARCHAR(20), acc_holder_name VARCHAR(100), price float);

CREATE TABLE airplane (airplane_id VARCHAR(20), plane_type VARCHAR(100), description VARCHAR(200));


CREATE DEFINER=`root`@`localhost` PROCEDURE `matchUserById`(IN id varchar(50))
BEGIN
    SELECT * from user where email = id;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `matchUser`(IN pass varchar(100), IN id varchar(50))
BEGIN
    SELECT * from user where email = id and pass = password;
END

 create table manager(email varchar(50), username varchar(50), password varchar(100));
 create table admin(email varchar(50), username varchar(50), password varchar(100));

 
DELIMITER //
 CREATE PROCEDURE matchManger(name varchar(50), pass varchar(100))
   BEGIN
   SELECT *  FROM manager where username = name and password = pass;
   END //
 DELIMITER ;
 
  
DELIMITER //
 CREATE PROCEDURE matchAdmin(name varchar(50), pass varchar(100))
   BEGIN
   SELECT *  FROM admin where username = name and password = pass;
   END //
 DELIMITER ;
 
create table airplane_type(id int, seat_num int, speed float);
 create table airports(id int, name varchar(200), abbr varchar(10), location varchar(200));
 ///////////////////////////////////////////////new line
 
 CREATE TABLE user (email VARCHAR(50) NOT NULL, password VARCHAR(100), address VARCHAR(500), zipcode VARCHAR(10), firstname VARCHAR(20), lastname VARCHAR(20), loggedin int, valid_id int, age int, work_id int, phone VARCHAR(15), gender VARCHAR(10), confirm int, PRIMARY KEY (email));
create table airplane_type(id int NOT NULL AUTO_INCREMENT, seat_num int, speed float, PRIMARY KEY (id));
CREATE TABLE airplane (airplane_id int NOT NULL AUTO_INCREMENT, plane_type int, FOREIGN KEY(plane_type) REFERENCES airplane_type(id), description VARCHAR(200),  PRIMARY KEY (airplane_id));
create table airports(abbr varchar(10) NOT NULL, name varchar(200), location varchar(200),PRIMARY KEY (abbr));

CREATE TABLE flight(flight_id int NOT NULL AUTO_INCREMENT, arrivingTime date, departingTime date,airplane_id int,origin varchar(10),destination varchar(10),FOREIGN KEY(origin) REFERENCES airports(abbr), FOREIGN KEY(destination) REFERENCES airports(abbr), FOREIGN KEY(airplane_id) REFERENCES airplane(airplane_id), price float, frequency VARCHAR(20), PRIMARY KEY(flight_id));
CREATE TABLE bank_acc (acc_id int NOT NULL AUTO_INCREMENT, acc_holder_name VARCHAR(100), price float, PRIMARY KEY(acc_id));

CREATE TABLE reservation (reservation_id int NOT NULL AUTO_INCREMENT,user_id varchar(50),bank_acc int, flight_id int,FOREIGN KEY(user_id) REFERENCES user(email), FOREIGN KEY(bank_acc) REFERENCES bank_acc(acc_id),  FOREIGN KEY(flight_id) REFERENCES flight(flight_id), reservation_status int, ticket_price float, seatNum int, classType VARCHAR(20), PRIMARY KEY(reservation_id))


 	ALTER TABLE airplane_type
ADD COLUMN first_num int AFTER description;
ALTER TABLE airplane_type
ADD COLUMN bus_num int AFTER description;
ALTER TABLE airplane_type
ADD COLUMN eco_num int AFTER description;


//for check in customer
DELIMITER //
 CREATE PROCEDURE matchCustomerFlights(ResID varchar(100), validID varchar(100))
   BEGIN
   SELECT *  FROM user where valid_id = id and reservation_id = ResID;
   END //
 DELIMITER ;
