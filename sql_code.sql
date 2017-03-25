CREATE TABLE user (email VARCHAR(50), password VARCHAR(100), address VARCHAR(500), zipcode VARCHAR(10), firstname VARCHAR(20), lastname VARCHAR(20), loggedin int, valid_id int, age int, work_id int, phone VARCHAR(15), gender VARCHAR(10), comfirm int);

CREATE TABLE reservation (reservation_id VARCHAR(20), user_id VARCHAR(20), flight_id VARCHAR(20), bookedTime VARCHAR(100), reservation_status VARCHAR(10), ticket_price float);

CREATE TABLE flight (flight_id VARCHAR(20), Time VARCHAR(100), origin VARCHAR(20), destinationa VARCHAR(20), airplane_id VARCHAR(20), price float);

CREATE TABLE bank_acc (acc_id VARCHAR(20), acc_holder_name VARCHAR(100), price float);

CREATE TABLE airplane (airplane_id VARCHAR(20), plane_type VARCHAR(100), seats_number float);


CREATE DEFINER=`root`@`localhost` PROCEDURE `matchUserById`(IN id varchar(50))
BEGIN
    SELECT * from user where email = id;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `matchUser`(IN pass varchar(100), IN id varchar(50))
BEGIN
    SELECT * from user where email = id and pass = password;
END
