-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database cool_db;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on cool_db.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use cool_db;

-- Put your DDL 
/* airport table */
CREATE TABLE IF NOT EXISTS airport(
airportID varchar(3) NOT NULL,
name varchar(50),
city varchar(50),
  state varchar(50),
  country varchar(50),
  PRIMARY KEY (airportID)
);


/* airline table */
CREATE TABLE IF NOT EXISTS airline (
  airlineID INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(50),
  rating INT CHECK (rating >= 1 AND rating <= 5),
  PRIMARY KEY (airlineID)
);


/* airplane table */
CREATE TABLE IF NOT EXISTS airplane (
  airplaneID INT AUTO_INCREMENT NOT NULL,
  model VARCHAR(50),
  capacity INT,
  airlineID INT,
  PRIMARY KEY (airplaneID),
  FOREIGN KEY (airlineID) REFERENCES airline (airlineID) ON UPDATE CASCADE ON DELETE CASCADE
);



/* travel agency table */
CREATE TABLE IF NOT EXISTS travelAgency(
  agencyID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  website VARCHAR(100) NOT NULL,
  name VARCHAR(100),
  phone VARCHAR(20),
  ceoName VARCHAR(50)
);




/* trip advisor table */
CREATE TABLE IF NOT EXISTS tripAdvisor
(
  employeeID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  agencyID INT,
  firstName VARCHAR(50),
  lastName VARCHAR(50),
  salary INT,
  birthdate DATE,
  email VARCHAR(100),
  phone VARCHAR(20),
  language VARCHAR(50),
  supervisor_id INT,
  FOREIGN KEY (agencyID) REFERENCES travelAgency(agencyID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (supervisor_id) REFERENCES tripAdvisor(employeeID) ON UPDATE CASCADE ON DELETE CASCADE
);




/* passenger table */
CREATE TABLE IF NOT EXISTS passenger
(
  passengerID INT AUTO_INCREMENT NOT NULL,
  fName varchar(50) NOT NULL,
  lName varchar(50) NOT NULL,
  phone INT,
  sex varchar(50),
  birthDate DATE,
  email varchar(50),
  street varchar(50),
  zipcode INT,
  state varchar(50),
  country varchar(50),
  tripadvisorID INT,
  PRIMARY KEY (passengerID),
  FOREIGN KEY (tripadvisorID) REFERENCES tripAdvisor(employeeID)
);


/* department table */
CREATE TABLE IF NOT EXISTS department
(
  departmentID INT AUTO_INCREMENT NOT NULL,
  departmentName varchar(50),
  airportID VARCHAR(3),
  PRIMARY KEY (departmentID),
  FOREIGN KEY (airportID) REFERENCES airport(airportID) ON UPDATE CASCADE ON DELETE CASCADE
);




/* lounge table */
CREATE TABLE IF NOT EXISTS lounge
(
  loungeID INT AUTO_INCREMENT NOT NULL,
  name varchar(50),
  airportID VARCHAR(3),
  PRIMARY KEY (loungeID),
  FOREIGN KEY (airportID) REFERENCES airport(airportID) ON UPDATE CASCADE ON DELETE CASCADE
);


/* terminal table */
CREATE TABLE IF NOT EXISTS terminal
(
  terminalID INT AUTO_INCREMENT NOT NULL,
  airportID VARCHAR(3),
  PRIMARY KEY (terminalID, airportID),
  FOREIGN KEY (airportID) REFERENCES airport(airportID)
);




/* gate table */
CREATE TABLE IF NOT EXISTS gate
(
  gateNumber INT NOT NULL,
  terminalID INT,
  PRIMARY KEY (gateNumber, terminalID),
  FOREIGN KEY (terminalID) REFERENCES terminal(terminalID) ON UPDATE CASCADE ON DELETE CASCADE
);


/* store table */
CREATE TABLE IF NOT EXISTS store
(
  storeID INT AUTO_INCREMENT NOT NULL,
  terminalID INT,
  name varchar(50),
  PRIMARY KEY (storeID),
  FOREIGN KEY (terminalID) REFERENCES terminal(terminalID)
);




/* airportEmployee table */
CREATE TABLE IF NOT EXISTS flight
(
    flightID INT AUTO_INCREMENT PRIMARY KEY ,
    seatsAvailable INT,
    airplaneID INT,
    airlineID INT,
    departureTime DATETIME,
    arrivalTime DATETIME,
    arrivalAirport VARCHAR(3),
    departureAirport VARCHAR(3),
    arrivalTerminal INT,
    departureTerminal INT,
    arrivalGate INT,
    departureGate INT,
    FOREIGN KEY (arrivalAirport) REFERENCES airport(airportID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (departureAirport) REFERENCES airport(airportID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (arrivalTerminal) REFERENCES terminal(terminalID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (departureTerminal) REFERENCES terminal(terminalID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (arrivalGate) REFERENCES gate(gateNumber) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (departureGate) REFERENCES gate(gateNumber) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (airplaneID) REFERENCES airplane(airplaneID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (airlineID) REFERENCES airline(airlineID) ON UPDATE CASCADE ON DELETE CASCADE
);

/* flight table */
CREATE TABLE IF NOT EXISTS airportEmployee
(
  employeeID INT AUTO_INCREMENT NOT NULL,
  fName VARCHAR(50),
  lName VARCHAR(50),
  salary INT,
  title VARCHAR(50),
  sex VARCHAR(50),
  emailAddress VARCHAR(50),
  birthDate DATE,
  sup_id INT,
  departmentID INT,
  PRIMARY KEY (employeeID),
  FOREIGN KEY (departmentID) REFERENCES department(departmentID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (sup_id) REFERENCES airportEmployee(employeeID) ON UPDATE CASCADE ON DELETE CASCADE
);


/* ticket table */
CREATE TABLE IF NOT EXISTS ticket
(
  ticketID INT AUTO_INCREMENT NOT NULL,
  flightID INT,
  seatNum VARCHAR(10),
  class VARCHAR(20),
  price DECIMAL(10, 2),
  boardingGroup CHAR(1),
  passengerID INT,
  PRIMARY KEY (ticketID),
  FOREIGN KEY (flightID) REFERENCES flight(flightID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (passengerID) REFERENCES passenger(passengerID) ON UPDATE CASCADE ON DELETE CASCADE
);


/* baggage table */
CREATE TABLE IF NOT EXISTS baggage
(
  baggageID INT AUTO_INCREMENT,
  passengerID INT,
  ticketID INT,
  flightID INT,
  weight DECIMAL(6, 2),
  PRIMARY KEY (baggageID, ticketID, flightID),
  FOREIGN KEY (ticketID) REFERENCES ticket(ticketID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (flightID) REFERENCES flight(flightID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (passengerID) REFERENCES ticket(passengerID) ON UPDATE CASCADE ON DELETE CASCADE
);


/* airlineFlightEmployee */
CREATE TABLE IF NOT EXISTS airlineFlightEmployee (
  employeeID INT AUTO_INCREMENT NOT NULL,
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  salary INT,
  title VARCHAR(50),
  sex VARCHAR(50),
  emailAddress VARCHAR(50),
  birthDate DATE,
  sup_id INT,
  airlineID INT,
  PRIMARY KEY (employeeID),
  FOREIGN KEY (airlineID) REFERENCES airline(airlineID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (sup_id) REFERENCES airlineFlightEmployee(employeeID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS crew (
  employeeID INT,
  flightID INT,
  PRIMARY KEY (employeeID, flightID),
  FOREIGN KEY (employeeID) REFERENCES airlineFlightEmployee(employeeID) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (flightID) REFERENCES flight(flightID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Sample data for airport table
INSERT INTO airport (airportID, name, city, state, country) VALUES
('LAX', 'Sample Airport 1', 'Sample City 1', 'Sample State 1', 'Sample Country 1'),
('JFK', 'Sample Airport 2', 'Sample City 2', 'Sample State 2', 'Sample Country 2'),
('LOG', 'Sample Airport 3', 'Sample City 3', 'Sample State 3', 'Sample Country 3');


-- Sample data for department table
INSERT INTO department (departmentName, airportID) VALUES
('Department 1', 'LAX'),
('Department 2', 'JFK'),
('Department 3', 'LOG');


-- Sample data for lounge table
INSERT INTO lounge (name, airportID) VALUES
('Lounge 1', 'LAX'),
('Lounge 2', 'JFK'),
('Lounge 3', 'LOG');


-- Sample data for terminal table
INSERT INTO terminal (terminalID, airportID) VALUES
(1, 'LAX'),
(2, 'JFK'),
(3, 'LOG');


-- Sample data for gate table
INSERT INTO gate (gateNumber, terminalID) VALUES
(1, 1),
(2, 2),
(3, 3);


-- Sample data for store table
INSERT INTO store (terminalID, name) VALUES
(1, 'Store 1'),
(2, 'Store 2'),
(3, 'Store 3');


-- Sample data for airportEmployee table
INSERT INTO airportEmployee (fName, lName, salary, title, sex, emailAddress, birthDate, sup_id, departmentID) VALUES
('John', 'Doe', 50000, 'Manager', 'Male', 'john.doe@example.com', '1990-01-01', NULL, 1),
('Jane', 'Smith', 45000, 'Staff', 'Female', 'jane.smith@example.com', '1995-02-15', 1, 2),
('Bob', 'Johnson', 60000, 'Supervisor', 'Male', 'bob.johnson@example.com', '1985-05-10', NULL, 3);


-- Sample data for airline table
INSERT INTO airline (name, phone, email, rating) VALUES
('Sample Airline 1', '1234567890', 'airline1@example.com', 4),
('Sample Airline 2', '9876543210', 'airline2@example.com', 5),
('Sample Airline 3', '5555555555', 'airline3@example.com', 3);


-- Sample data for airplane table
INSERT INTO airplane (model, capacity, airlineID) VALUES
('Model 1', 150, 1),
('Model 2', 200, 2),
('Model 3', 100, 3);


-- Sample data for flight table
INSERT INTO flight (flightID, seatsAvailable, airplaneID, airlineID,
                    departureTime, arrivalTime, arrivalAirport, departureAirport,
                    arrivalTerminal, departureTerminal, arrivalGate, departureGate) VALUES
(3, 18, 3, 2, '2023-02-15 12:30:00', '2023-02-15 12:30:00', 'LAX', 'JFK', 2, 3, 2, 3),
(2, 0, 1, 3, '2023-02-15 12:30:00', '2023-02-15 12:30:00', 'LOG', 'JFK', 2, 1, 1, 1),
(1, 0, 1, 1, '2023-02-15 12:30:00', '2023-02-15 12:30:00', 'JFK', 'LOG', 3, 2, 2, 1);

-- Sample data for airlineflightEmployee table
INSERT INTO airlineFlightEmployee (fName, lName, salary, title, sex, emailAddress, birthDate, sup_id, airlineID) VALUES
('Alice', 'Anderson', 55000, 'Crew', 'Female', 'alice.anderson@example.com', '1988-04-20', NULL, 1),
('Charlie', 'Chaplin', 70000, 'Pilot', 'Male', 'charlie.chaplin@example.com', '1980-10-05', NULL, 2),
('Eva', 'Evans', 60000, 'Crew', 'Female', 'eva.evans@example.com', '1992-07-15', 1, 3);


-- Sample data for travelAgency table
INSERT INTO travelAgency (website, name, phone, ceoName) VALUES
('www.travelAgency1.com', 'Travel Agency 1', '111-111-1111', 'CEO 1'),
('www.travelAgency2.com', 'Travel Agency 2', '222-222-2222', 'CEO 2'),
('www.travelAgency3.com', 'Travel Agency 3', '333-333-3333', 'CEO 3');


-- Sample data for tripAdvisor table
INSERT INTO tripAdvisor (agencyID, firstName, lastName, salary, birthdate, email, phone, language, supervisor_id) VALUES
(1, 'Tom', 'Thompson', 60000, '1990-03-25', 'tom.thompson@example.com', '444-444-4444', 'English', NULL),
(2, 'Sara', 'Smith', 55000, '1985-12-12', 'sara.smith@example.com', '555-555-5555', 'Spanish', 1),
(3, 'Mike', 'Miller', 65000, '1995-08-30', 'mike.miller@example.com', '666-666-6666', 'French', 1);


-- Sample data for passenger table
INSERT INTO passenger (fName, lName, phone, sex, birthDate, email, street, zipcode, state, country, tripAdvisorID) VALUES
('Peter', 'Parker', 123456789, 'Male', '1989-06-15', 'peter.parker@example.com', '123 Main St', 10001, 'NY', 'USA', 1),
('Mary', 'Jane', 987654321, 'Female', '1992-02-28', 'mary.jane@example.com', '456 Oak St', 20002, 'CA', 'USA', 1),
('Tony', 'Stark', 555555555, 'Male', '1970-05-29', 'tony.stark@example.com', '789 Pine St', 30003, 'TX', 'USA', 1);


-- Sample data for ticket table
INSERT INTO ticket (flightID, seatNum, class, price, boardingGroup, passengerID) VALUES
(1, 'A1', 'Business', 500.00, 'A', 3),
(2, 'B3', 'Economy', 300.00, 'B', 2),
(3, 'C2', 'First Class', 700.00, 'C', 1);


-- Sample data for baggage table
INSERT INTO baggage (baggageID, passengerID, ticketID, flightID, weight) VALUES
(1, 3, 1, 3, 25.5),
(2, 2, 2, 2, 15.0),
(3, 1, 3, 1, 30.0);

-- Sample data for crew table
INSERT INTO crew (employeeID, flightID) VALUES
(2, 3),
(3, 1),
(1, 2);