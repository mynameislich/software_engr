CREATE TABLE user (email VARCHAR(50), password VARCHAR(100), address VARCHAR(500), zipcode VARCHAR(10), firstname VARCHAR(20), lastname VARCHAR(20), loggedin int, valid_id int, age int, work_id int, phone VARCHAR(15), gender VARCHAR(10), confirm int);

CREATE TABLE reservation (reservation_id VARCHAR(20), user_id VARCHAR(20), flight_id VARCHAR(20), bookedTime VARCHAR(100), reservation_status VARCHAR(10), ticket_price float);

CREATE TABLE flight (flight_id VARCHAR(20), Time VARCHAR(100), origin VARCHAR(20), destinationa VARCHAR(20), airplane_id VARCHAR(20), price float);

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
