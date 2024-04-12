-- creating database for restaurant

CREATE DATABASE IF NOT EXISTS HungryHunt;
USE HungryHunt;

CREATE TABLE IF NOT EXISTS location
(
 locationId      int         NOT NULL AUTO_INCREMENT,
 city_name       varchar(75) NOT NULL,
 num_restaurants int         NOT NULL,
 zipcode      int NOT NULL,
 PRIMARY KEY (locationId)
);

CREATE TABLE IF NOT EXISTS menu (
 menuID int NOT NULL AUTO_INCREMENT,
 PRIMARY KEY (menuID)
);

CREATE TABLE IF NOT EXISTS appetizers (
 id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS drinks (
 id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS maincourse (
 id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict

);

CREATE TABLE IF NOT EXISTS desserts (
id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS kidsmeal (
 id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS restaurant
(
 locationId int NOT NULL,
 menuId int NOT NULL,
 restaurantID int NOT NULL AUTO_INCREMENT,
 restaurant_name varchar(100) NOT NULL,
 cuisine_type varchar(75) NOT NULL,
 atmosphere_type varchar(75) NOT NULL,
 on_campus_bool bool NOT NULL,
 allergy_friendly_bool bool NOT NULL,
 present_wait_time time NOT NULL,
 delivery_bool bool NOT NULL,
 take_out_bool bool NOT NULL,
 distance_from_user float NOT NULL,
 hours_of_operation int NOT NULL,
 reservation_required_bool bool NOT NULL,
 avg_rating float NOT NULL,
 peak_hours VARCHAR(20) NOT NULL,
 PRIMARY KEY(restaurantID),
 CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS dietary_restrictions
(
 dietaryID int NOT NULL AUTO_INCREMENT,
 nuts_bool bool NOT NULL,
 vegetarian_bool bool NOT NULL,
 gluten_bool bool NOT NULL,
 eggs_bool bool NOT NULL,
 dairy_bool bool NOT NULL,
 PRIMARY KEY (dietaryID)
);

CREATE TABLE IF NOT EXISTS photo (
 photoID INT AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL,
 caption TEXT,
 PRIMARY KEY(photoID)
);

CREATE TABLE IF NOT EXISTS user
(
 userID int NOT NULL,
 username varchar(75) UNIQUE NOT NULL,
 password varchar(75) NOT NULL,
 student_bool boolean NOT NULL,
 school_name varchar(75),
 school_year int,
 school_major varchar(75),
 fName varchar(75) NOT NULL,
 lName varchar(75) NOT NULL,
 gender varchar(75) NOT NULL,
 age int NOT NULL,
 budget int NOT NULL,
 biography TEXT,
 locationID int NOT NULL,
 photoID int NOT NULL,
 dietaryID int NOT NULL,
 PRIMARY KEY(userID),
 CONSTRAINT FOREIGN KEY (locationID) REFERENCES location(locationId) ON UPDATE cascade ON DELETE cascade,
  CONSTRAINT FOREIGN KEY (photoID) REFERENCES photo(photoID) ON UPDATE cascade ON DELETE cascade,
  CONSTRAINT FOREIGN KEY (dietaryID) REFERENCES dietary_restrictions(dietaryID) ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS rating (
 id INT NOT NULL AUTO_INCREMENT,
 review TEXT,
 num INT NOT NULL,
 restaurantID INT NOT NULL,
 userID INT NOT NULL,
 PRIMARY KEY(id),
 CONSTRAINT fk_restaurant FOREIGN KEY (restaurantID) REFERENCES restaurant(restaurantID) ON UPDATE cascade ON DELETE cascade,
 CONSTRAINT fk_user FOREIGN KEY (userId) REFERENCES user(userID) ON UPDATE cascade ON DELETE cascade
);

