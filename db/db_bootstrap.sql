-- create the database

CREATE DATABASE IF NOT EXISTS JetsetterDB;
USE JetsetterDB;

-- create all the tables
CREATE TABLE IF NOT EXISTS Airport (
    IATAcode char(3),
    name text,
    city text,
    state text,
    country text,
    PRIMARY KEY (IATAcode)
);

CREATE TABLE IF NOT EXISTS AirportGate (
    gateNumber varchar(5),
    IATAcode char(3),
    PRIMARY KEY (gateNumber, IATAcode),
    FOREIGN KEY (IATAcode) references Airport(IATAcode) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Aircraft (
    aircraftID int,
    model text,
    capacity int,
    PRIMARY KEY (aircraftID)
);

CREATE TABLE IF NOT EXISTS Manager (
    managerID int,
    firstName text,
    lastName text,
    PRIMARY KEY (managerID)
);

CREATE TABLE IF NOT EXISTS Flight (
    flightId int,
    status text,
    duration time,
    destinationGate varchar(5),
    destinationAirport char(3),
    originGate varchar(5),
    originAirport char(3),
    takeOffTime dateTime,
    landingTime dateTime,
    aircraft int,
    managerID int,
    PRIMARY KEY (flightId),
    FOREIGN KEY (destinationGate) references AirportGate(gateNumber) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (destinationAirport) references AirportGate(IATAcode) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (originGate) references AirportGate(gateNumber) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (originAirport) references AirportGate(IATAcode) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (aircraft) references Aircraft(aircraftID) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (managerID) references Manager(managerID) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Passenger (
    passengerId int,
    firstName text,
    lastName text,
    dateOfBirth date,
    gender char(1),
    nationality text,
    PRIMARY KEY (passengerId)
);

CREATE TABLE IF NOT EXISTS PassengerPhoneNumber(
  passengerId int,
  phoneNumber bigint(11),
  PRIMARY KEY (passengerId, phoneNumber),
  FOREIGN KEY (passengerId) references Passenger(passengerID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PassengerEmail(
  passengerId int,
  email varchar(100),
  PRIMARY KEY (passengerId, email),
  FOREIGN KEY (passengerId) references Passenger(passengerID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Booking (
    bookingId int,
    numberBags int,
    preferences text,
    boardingGroup char(1),
    seat varchar(3),
    flightId int,
    passengerId int,
    PRIMARY KEY (bookingId),
    FOREIGN KEY (flightId) references Flight(flightId) ON UPDATE cascade ON DELETE restrict,
    FOREIGN KEY (passengerId) references Passenger(passengerId) ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS Billing (
    billingId int,
    totalAmount decimal(10, 2),
    paymentStatus text,
    paymentMethod text,
    bookingId int,
    PRIMARY KEY (billingId),
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CrewMember (
  crewID int,
  firstName text,
  lastName text,
  weeklyHoursWorked int,
  timeTakenOff int,
  PRIMARY KEY (crewID)
);

CREATE TABLE IF NOT EXISTS CrewMemberAssignment (
    assignmentID int,
    flightId int,
    role text,
    crewID int,
    PRIMARY KEY (assignmentID),
    FOREIGN KEY (flightId) references Flight(flightId) ON UPDATE cascade ON DELETE restrict,
    FOREIGN KEY (crewID) references CrewMember(crewID) ON UPDATE cascade ON DELETE cascade
);

-- create all the sample data

insert into Airport (IATAcode, name, city, state, country) values ('GSS', 'Sabi Sabi Airport', 'Hanjia', null, 'ZA');
insert into Airport (IATAcode, name, city, state, country) values ('HET', 'Baita International Airport', 'Luleå', 'BD', 'CN');
insert into Airport (IATAcode, name, city, state, country) values ('LIH', 'Lihue Airport', 'Nueva Guadalupe', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('GLW', 'Glasgow Municipal Airport', 'Changxing', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('PEI', 'Matecaña International Airport', 'Samothráki', null, 'CO');
insert into Airport (IATAcode, name, city, state, country) values ('DEX', 'Nop Goliat Airport', 'Nuevo Emperador', null, 'ID');
insert into Airport (IATAcode, name, city, state, country) values ('XNG', 'Quảng Ngãi Airfield', 'Cipaku', null, 'VN');
insert into Airport (IATAcode, name, city, state, country) values ('TMB', 'Kendall-Tamiami Executive Airport', 'Jieshi', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('GNF', 'Gansner Field', 'Hancheng', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('HCC', 'Columbia County Airport', 'Pukhavichy', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('ITR', 'Francisco Vilela do Amaral Airport', 'Stapleford', 'ENG', 'BR');
insert into Airport (IATAcode, name, city, state, country) values ('STC', 'St Cloud Regional Airport', 'Okocim', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('RVS', 'Richard Lloyd Jones Jr Airport', 'Mwene-Ditu', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('DRD', 'Dorunda Airport', 'Veracruz', null, 'AU');
insert into Airport (IATAcode, name, city, state, country) values ('VJI', 'Virginia Highlands Airport', 'Caxito', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('UPL', 'Upala Airport', 'Jenggawah', null, 'CR');
insert into Airport (IATAcode, name, city, state, country) values ('ION', 'Impfondo Airport', 'Essen', 'NW', 'CG');
insert into Airport (IATAcode, name, city, state, country) values ('TEK', 'Tatitlek Airport', 'Manabo', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('ROS', 'Islas Malvinas Airport', 'Fortaleza', null, 'AR');
insert into Airport (IATAcode, name, city, state, country) values ('JON', 'Johnston Atoll Airport', 'Teroual', null, 'UM');
insert into Airport (IATAcode, name, city, state, country) values ('RCR', 'Fulton County Airport', 'Boac', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('PUK', 'Pukarua Airport', 'Baitu', null, 'PF');
insert into Airport (IATAcode, name, city, state, country) values ('KWN', 'Quinhagak Airport', 'Dasha', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('SUD', 'Stroud Municipal Airport', 'Oinófyta', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('BBQ', 'Codrington Airport', 'Xiaoweizhai', null, 'AG');
insert into Airport (IATAcode, name, city, state, country) values ('STM', 'Maestro Wilson Fonseca Airport', 'Lok', null, 'BR');
insert into Airport (IATAcode, name, city, state, country) values ('ZUD', 'Pupelde Airport', 'Taocun', null, 'CL');
insert into Airport (IATAcode, name, city, state, country) values ('SKT', 'Sialkot Airport', 'Qalyūb', null, 'PK');
insert into Airport (IATAcode, name, city, state, country) values ('YLB', 'Lac La Biche Airport', 'Yanping', null, 'CA');
insert into Airport (IATAcode, name, city, state, country) values ('PEZ', 'Penza Airport', 'Marechal Cândido Rondon', null, 'RU');
insert into Airport (IATAcode, name, city, state, country) values ('GLT', 'Gladstone Airport', 'Lavras', null, 'AU');
insert into Airport (IATAcode, name, city, state, country) values ('SYF', 'Silva Bay Seaplane Base', 'Lanta Timur', null, 'CA');
insert into Airport (IATAcode, name, city, state, country) values ('BLL', 'Billund Airport', 'Chenqiao', null, 'DK');
insert into Airport (IATAcode, name, city, state, country) values ('OHI', 'Oshakati Airport', 'Temorlorong', null, 'NA');
insert into Airport (IATAcode, name, city, state, country) values ('BTV', 'Burlington International Airport', 'Guaíba', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('OGA', 'Searle Field', 'Caoping', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('RES', 'Resistencia International Airport', 'Blagnac', 'B3', 'AR');
insert into Airport (IATAcode, name, city, state, country) values ('CYM', 'Chatham Seaplane Base', 'Rouyuan', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('CHY', 'Choiseul Bay Airport', 'Kohila', null, 'SB');
insert into Airport (IATAcode, name, city, state, country) values ('DJU', 'Djúpivogur Airport', 'Knysna', null, 'IS');
insert into Airport (IATAcode, name, city, state, country) values ('CEW', 'Bob Sikes Airport', 'Montaigu', 'B5', 'US');
insert into Airport (IATAcode, name, city, state, country) values ('ARS', 'Aragarças Airport', 'Camacupa', null, 'BR');
insert into Airport (IATAcode, name, city, state, country) values ('NDI', 'Namudi Airport', 'Pawłowiczki', null, 'PG');
insert into Airport (IATAcode, name, city, state, country) values ('CZF', 'Cape Romanzof LRRS Airport', 'Valdosta', 'GA', 'US');
insert into Airport (IATAcode, name, city, state, country) values ('QGP', 'Garanhuns Airport', 'Ruteng', null, 'BR');
insert into Airport (IATAcode, name, city, state, country) values ('WUV', 'Wuvulu Island Airport', 'Marseille', 'B8', 'PG');
insert into Airport (IATAcode, name, city, state, country) values ('ATL', 'Hartsfield Jackson Atlanta International Airport', 'Inđija', null, 'US');
insert into Airport (IATAcode, name, city, state, country) values ('HTR', 'Hateruma Airport', 'Candelaria', null, 'JP');
insert into Airport (IATAcode, name, city, state, country) values ('RYN', 'Royan-Médis Airport', 'HanHuang', null, 'FR');
insert into Airport (IATAcode, name, city, state, country) values ('HNN', 'Honinabi Airport', 'Tugu', null, 'PG');

insert into AirportGate (gateNumber, IATAcode) values ('E5', 'GSS');
insert into AirportGate (gateNumber, IATAcode) values ('A1', 'HET');
insert into AirportGate (gateNumber, IATAcode) values ('H8', 'LIH');
insert into AirportGate (gateNumber, IATAcode) values ('E5', 'GLW');
insert into AirportGate (gateNumber, IATAcode) values ('B2', 'PEI');
insert into AirportGate (gateNumber, IATAcode) values ('A1', 'DEX');
insert into AirportGate (gateNumber, IATAcode) values ('I9', 'XNG');
insert into AirportGate (gateNumber, IATAcode) values ('B2', 'TMB');
insert into AirportGate (gateNumber, IATAcode) values ('G7', 'GNF');
insert into AirportGate (gateNumber, IATAcode) values ('H8', 'HCC');
insert into AirportGate (gateNumber, IATAcode) values ('J10', 'ITR');
insert into AirportGate (gateNumber, IATAcode) values ('B2', 'STC');
insert into AirportGate (gateNumber, IATAcode) values ('H8', 'RVS');
insert into AirportGate (gateNumber, IATAcode) values ('C3', 'DRD');
insert into AirportGate (gateNumber, IATAcode) values ('E5', 'VJI');
insert into AirportGate (gateNumber, IATAcode) values ('E5', 'UPL');
insert into AirportGate (gateNumber, IATAcode) values ('C3', 'ION');
insert into AirportGate (gateNumber, IATAcode) values ('H8', 'TEK');
insert into AirportGate (gateNumber, IATAcode) values ('D4', 'ROS');
insert into AirportGate (gateNumber, IATAcode) values ('C3', 'JON');
insert into AirportGate (gateNumber, IATAcode) values ('F6', 'RCR');
insert into AirportGate (gateNumber, IATAcode) values ('J10', 'PUK');
insert into AirportGate (gateNumber, IATAcode) values ('C3', 'KWN');
insert into AirportGate (gateNumber, IATAcode) values ('E5', 'SUD');
insert into AirportGate (gateNumber, IATAcode) values ('E5', 'BBQ');
insert into AirportGate (gateNumber, IATAcode) values ('A1', 'STM');
insert into AirportGate (gateNumber, IATAcode) values ('B2', 'ZUD');
insert into AirportGate (gateNumber, IATAcode) values ('H8', 'SKT');
insert into AirportGate (gateNumber, IATAcode) values ('J10', 'YLB');
insert into AirportGate (gateNumber, IATAcode) values ('C3', 'PEZ');
insert into AirportGate (gateNumber, IATAcode) values ('I9', 'GLT');
insert into AirportGate (gateNumber, IATAcode) values ('F6', 'SYF');
insert into AirportGate (gateNumber, IATAcode) values ('D4', 'BLL');
insert into AirportGate (gateNumber, IATAcode) values ('C3', 'OHI');
insert into AirportGate (gateNumber, IATAcode) values ('E5', 'BTV');
insert into AirportGate (gateNumber, IATAcode) values ('H8', 'OGA');
insert into AirportGate (gateNumber, IATAcode) values ('E5', 'RES');
insert into AirportGate (gateNumber, IATAcode) values ('B2', 'CYM');
insert into AirportGate (gateNumber, IATAcode) values ('F6', 'CHY');
insert into AirportGate (gateNumber, IATAcode) values ('D4', 'DJU');
insert into AirportGate (gateNumber, IATAcode) values ('C3', 'CEW');
insert into AirportGate (gateNumber, IATAcode) values ('I9', 'ARS');
insert into AirportGate (gateNumber, IATAcode) values ('F6', 'NDI');
insert into AirportGate (gateNumber, IATAcode) values ('D4', 'CZF');
insert into AirportGate (gateNumber, IATAcode) values ('A1', 'QGP');
insert into AirportGate (gateNumber, IATAcode) values ('B2', 'WUV');
insert into AirportGate (gateNumber, IATAcode) values ('H8', 'ATL');
insert into AirportGate (gateNumber, IATAcode) values ('J10', 'HTR');
insert into AirportGate (gateNumber, IATAcode) values ('J10', 'RYN');
insert into AirportGate (gateNumber, IATAcode) values ('C3', 'HNN');

insert into Aircraft (aircraftID, model, capacity) values (1, 'Airbus A320', 58);
insert into Aircraft (aircraftID, model, capacity) values (2, 'Airbus A320', 83);
insert into Aircraft (aircraftID, model, capacity) values (3, 'Embraer E190', 412);
insert into Aircraft (aircraftID, model, capacity) values (4, 'Cessna 172', 115);
insert into Aircraft (aircraftID, model, capacity) values (5, 'Cessna 172', 64);
insert into Aircraft (aircraftID, model, capacity) values (6, 'Cessna 172', 442);
insert into Aircraft (aircraftID, model, capacity) values (7, 'Cessna 172', 366);
insert into Aircraft (aircraftID, model, capacity) values (8, 'Cessna 172', 458);
insert into Aircraft (aircraftID, model, capacity) values (9, 'Embraer E190', 347);
insert into Aircraft (aircraftID, model, capacity) values (10, 'Cessna 172', 465);
insert into Aircraft (aircraftID, model, capacity) values (11, 'Airbus A320', 66);
insert into Aircraft (aircraftID, model, capacity) values (12, 'Embraer E190', 415);
insert into Aircraft (aircraftID, model, capacity) values (13, 'Embraer E190', 117);
insert into Aircraft (aircraftID, model, capacity) values (14, 'Bombardier Challenger 300', 419);
insert into Aircraft (aircraftID, model, capacity) values (15, 'Embraer E190', 151);
insert into Aircraft (aircraftID, model, capacity) values (16, 'Airbus A320', 49);
insert into Aircraft (aircraftID, model, capacity) values (17, 'Boeing 747', 423);
insert into Aircraft (aircraftID, model, capacity) values (18, 'Bombardier Challenger 300', 11);
insert into Aircraft (aircraftID, model, capacity) values (19, 'Airbus A320', 254);
insert into Aircraft (aircraftID, model, capacity) values (20, 'Embraer E190', 493);
insert into Aircraft (aircraftID, model, capacity) values (21, 'Boeing 747', 120);
insert into Aircraft (aircraftID, model, capacity) values (22, 'Cessna 172', 475);
insert into Aircraft (aircraftID, model, capacity) values (23, 'Airbus A320', 377);
insert into Aircraft (aircraftID, model, capacity) values (24, 'Airbus A320', 498);
insert into Aircraft (aircraftID, model, capacity) values (25, 'Embraer E190', 329);
insert into Aircraft (aircraftID, model, capacity) values (26, 'Boeing 747', 27);
insert into Aircraft (aircraftID, model, capacity) values (27, 'Bombardier Challenger 300', 415);
insert into Aircraft (aircraftID, model, capacity) values (28, 'Bombardier Challenger 300', 19);
insert into Aircraft (aircraftID, model, capacity) values (29, 'Cessna 172', 60);
insert into Aircraft (aircraftID, model, capacity) values (30, 'Boeing 747', 214);
insert into Aircraft (aircraftID, model, capacity) values (31, 'Airbus A320', 471);
insert into Aircraft (aircraftID, model, capacity) values (32, 'Cessna 172', 308);
insert into Aircraft (aircraftID, model, capacity) values (33, 'Boeing 747', 119);
insert into Aircraft (aircraftID, model, capacity) values (34, 'Boeing 747', 259);
insert into Aircraft (aircraftID, model, capacity) values (35, 'Cessna 172', 201);
insert into Aircraft (aircraftID, model, capacity) values (36, 'Bombardier Challenger 300', 239);
insert into Aircraft (aircraftID, model, capacity) values (37, 'Cessna 172', 15);
insert into Aircraft (aircraftID, model, capacity) values (38, 'Airbus A320', 286);
insert into Aircraft (aircraftID, model, capacity) values (39, 'Bombardier Challenger 300', 242);
insert into Aircraft (aircraftID, model, capacity) values (40, 'Bombardier Challenger 300', 253);
insert into Aircraft (aircraftID, model, capacity) values (41, 'Airbus A320', 234);
insert into Aircraft (aircraftID, model, capacity) values (42, 'Cessna 172', 80);
insert into Aircraft (aircraftID, model, capacity) values (43, 'Embraer E190', 46);
insert into Aircraft (aircraftID, model, capacity) values (44, 'Embraer E190', 5);
insert into Aircraft (aircraftID, model, capacity) values (45, 'Bombardier Challenger 300', 460);
insert into Aircraft (aircraftID, model, capacity) values (46, 'Airbus A320', 326);
insert into Aircraft (aircraftID, model, capacity) values (47, 'Bombardier Challenger 300', 56);
insert into Aircraft (aircraftID, model, capacity) values (48, 'Bombardier Challenger 300', 244);
insert into Aircraft (aircraftID, model, capacity) values (49, 'Boeing 747', 371);
insert into Aircraft (aircraftID, model, capacity) values (50, 'Embraer E190', 155);

insert into Manager (managerID, firstName, lastName) values (1, 'Iorgos', 'Doyley');
insert into Manager (managerID, firstName, lastName) values (2, 'Pia', 'Pencot');
insert into Manager (managerID, firstName, lastName) values (3, 'Albrecht', 'Kevis');
insert into Manager (managerID, firstName, lastName) values (4, 'Adolpho', 'Lannin');
insert into Manager (managerID, firstName, lastName) values (5, 'Northrop', 'Errowe');
insert into Manager (managerID, firstName, lastName) values (6, 'Adore', 'Tompsett');
insert into Manager (managerID, firstName, lastName) values (7, 'Freedman', 'Hollingsbee');
insert into Manager (managerID, firstName, lastName) values (8, 'Basile', 'McMonies');
insert into Manager (managerID, firstName, lastName) values (9, 'Alameda', 'Cuvley');
insert into Manager (managerID, firstName, lastName) values (10, 'Gilberto', 'Maylin');
insert into Manager (managerID, firstName, lastName) values (11, 'Hendrika', 'Wickstead');
insert into Manager (managerID, firstName, lastName) values (12, 'Shena', 'Schindler');
insert into Manager (managerID, firstName, lastName) values (13, 'Sibeal', 'Gutridge');
insert into Manager (managerID, firstName, lastName) values (14, 'Abagael', 'Spiers');
insert into Manager (managerID, firstName, lastName) values (15, 'Howard', 'Corner');
insert into Manager (managerID, firstName, lastName) values (16, 'Lek', 'Giddons');
insert into Manager (managerID, firstName, lastName) values (17, 'Quint', 'Ternott');
insert into Manager (managerID, firstName, lastName) values (18, 'Ginnie', 'Keat');
insert into Manager (managerID, firstName, lastName) values (19, 'Batsheva', 'Charley');
insert into Manager (managerID, firstName, lastName) values (20, 'Lenna', 'Kleinplatz');
insert into Manager (managerID, firstName, lastName) values (21, 'Yetta', 'Klesel');
insert into Manager (managerID, firstName, lastName) values (22, 'Moore', 'Chalker');
insert into Manager (managerID, firstName, lastName) values (23, 'Christel', 'Lawes');
insert into Manager (managerID, firstName, lastName) values (24, 'Jilleen', 'Ostrich');
insert into Manager (managerID, firstName, lastName) values (25, 'Des', 'Grigson');
insert into Manager (managerID, firstName, lastName) values (26, 'Baryram', 'McNirlin');
insert into Manager (managerID, firstName, lastName) values (27, 'Devora', 'Gigg');
insert into Manager (managerID, firstName, lastName) values (28, 'Dick', 'Halms');
insert into Manager (managerID, firstName, lastName) values (29, 'Radcliffe', 'Peyro');
insert into Manager (managerID, firstName, lastName) values (30, 'Shandie', 'Catchpole');
insert into Manager (managerID, firstName, lastName) values (31, 'Helen-elizabeth', 'Gravenell');
insert into Manager (managerID, firstName, lastName) values (32, 'Donny', 'Zambon');
insert into Manager (managerID, firstName, lastName) values (33, 'Barbabas', 'Thompsett');
insert into Manager (managerID, firstName, lastName) values (34, 'Osborn', 'Briddle');
insert into Manager (managerID, firstName, lastName) values (35, 'Barri', 'Lawrence');
insert into Manager (managerID, firstName, lastName) values (36, 'Araldo', 'Feaveer');
insert into Manager (managerID, firstName, lastName) values (37, 'Keelby', 'Leyzell');
insert into Manager (managerID, firstName, lastName) values (38, 'Arnoldo', 'Isakson');
insert into Manager (managerID, firstName, lastName) values (39, 'Bartlett', 'Herculeson');
insert into Manager (managerID, firstName, lastName) values (40, 'Isabeau', 'Jean');
insert into Manager (managerID, firstName, lastName) values (41, 'Deloris', 'Ribbens');
insert into Manager (managerID, firstName, lastName) values (42, 'Courtnay', 'Nuccii');
insert into Manager (managerID, firstName, lastName) values (43, 'Bryanty', 'Mecco');
insert into Manager (managerID, firstName, lastName) values (44, 'Joni', 'Davidov');
insert into Manager (managerID, firstName, lastName) values (45, 'Elladine', 'Beddin');
insert into Manager (managerID, firstName, lastName) values (46, 'Judy', 'Chaldecott');
insert into Manager (managerID, firstName, lastName) values (47, 'Starla', 'Ciementini');
insert into Manager (managerID, firstName, lastName) values (48, 'Lilia', 'Clapson');
insert into Manager (managerID, firstName, lastName) values (49, 'Pris', 'Belly');
insert into Manager (managerID, firstName, lastName) values (50, 'Linnet', 'Lipscomb');

insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (1, 'cancelled', '20:00', 'E5', 'GSS', 'G7', 'KWN', '2023-07-31 02:28:49', '2022-12-10 11:40:48', 44, 50);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (2, 'cancelled', '18:45', 'G7', 'GNF', 'D4', 'BBQ', '2023-02-21 13:03:12', '2023-04-19 15:01:12', 47, 29);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (3, 'cancelled', '06:04', 'B2', 'BBQ', 'J10', 'ATL', '2023-08-01 19:41:44', '2023-02-26 09:14:20', 42, 5);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (4, 'on time', '21:29', 'B2', 'PUK', 'J10', 'HTR', '2023-01-13 18:04:50', '2023-08-22 18:48:43', 13, 42);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (5, 'delayed', '3:55', 'E5', 'OGA', 'B2', 'PEZ', '2023-03-22 03:18:15', '2023-10-18 13:25:59', 17, 4);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (6, 'cancelled', '1:46', 'D4', 'DEX', 'C3', 'YLB', '2023-05-11 19:09:36', '2023-07-17 21:19:47', 41, 6);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (7, 'on time', '23:26', 'F6', 'SKT', 'G7', 'ION', '2023-08-12 01:15:36', '2023-04-13 06:06:11', 14, 29);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (8, 'delayed', '07:35', 'F6', 'SUD', 'E5', 'TMB', '2023-10-12 20:51:45', '2023-07-27 18:36:16', 40, 41);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (9, 'on time', '18:10', 'C3', 'JON', 'D4', 'CEW', '2023-08-15 17:56:17', '2023-03-08 15:08:38', 30, 38);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (10, 'delayed', '21:54', 'G7', 'HNN', 'G7', 'STC', '2023-11-05 00:03:05', '2023-10-10 08:47:02', 30, 46);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (11, 'delayed', '4:10', 'E5', 'ITR', 'B2', 'TMB', '2023-09-28 03:51:55', '2023-04-26 07:10:31', 22, 50);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (12, 'delayed', '23:06', 'E5', 'HCC', 'D4', 'OHI', '2023-04-06 05:51:43', '2023-09-28 12:22:28', 24, 18);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (13, 'delayed', '20:06', 'C3', 'GNF', 'H8', 'STC', '2023-07-19 23:41:53', '2023-05-16 05:02:15', 50, 39);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (14, 'cancelled', '20:50', 'A1', 'QGP', 'D4', 'SKT', '2023-07-19 04:12:14', '2023-06-18 16:50:40', 7, 31);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (15, 'on time', '21:47', 'C3', 'GSS', 'B2', 'DJU', '2023-03-30 13:13:48', '2023-10-11 17:38:16', 24, 39);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (16, 'on time', '01:15', 'B2', 'CEW', 'H8', 'YLB', '2023-06-10 12:26:57', '2023-07-22 19:44:51', 7, 16);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (17, 'cancelled', '02:22', 'D4', 'YLB', 'H8', 'OHI', '2023-02-02 16:02:40', '2023-06-07 18:21:17', 13, 10);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (18, 'on time', '02:23', 'F6', 'STC', 'G7', 'PUK', '2023-04-05 20:26:08', '2023-03-03 13:11:56', 16, 43);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (19, 'on time', '17:22', 'G7', 'DEX', 'J10', 'SKT', '2023-04-21 01:38:39', '2023-01-21 19:18:25', 46, 14);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (20, 'on time', '17:48', 'G7', 'HNN', 'D4', 'GNF', '2023-02-08 19:24:47', '2023-08-19 15:06:30', 33, 37);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (21, 'delayed', '14:20', 'B2', 'HNN', 'C3', 'SKT', '2023-05-30 10:55:09', '2023-01-14 04:14:30', 8, 13);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (22, 'on time', '09:35', 'D4', 'PUK', 'E5', 'ITR', '2023-09-15 08:47:26', '2023-05-25 23:20:52', 18, 27);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (23, 'delayed', '19:44', 'E5', 'ATL', 'D4', 'TMB', '2023-08-24 01:07:34', '2023-04-30 22:51:31', 14, 49);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (24, 'on time', '03:58', 'F6', 'GSS', 'C3', 'HNN', '2023-06-02 09:15:16', '2023-11-26 20:28:38', 29, 45);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (25, 'cancelled', '10:38', 'G7', 'CEW', 'E5', 'HCC', '2023-02-20 20:42:10', '2023-09-06 07:05:55', 23, 33);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (26, 'on time', '21:09', 'C3', 'ITR', 'H8', 'YLB', '2023-03-04 22:37:42', '2023-07-09 10:23:28', 19, 20);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (27, 'delayed', '06:45', 'F6', 'OHI', 'C3', 'DJU', '2023-05-14 03:36:20', '2023-10-28 04:58:18', 40, 3);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (28, 'on time', '22:11', 'G7', 'SKT', 'G7', 'PUK', '2023-08-18 20:33:59', '2023-01-26 09:50:40', 16, 47);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (29, 'delayed', '08:26', 'E5', 'STC', 'B2', 'TMB', '2023-07-29 11:22:04', '2023-05-03 14:48:22', 35, 32);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (30, 'on time', '02:18', 'G7', 'ION', 'D4', 'OGA', '2023-05-05 16:31:15', '2023-11-02 04:59:48', 12, 18);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (31, 'delayed', '13:12', 'F6', 'BBQ', 'E5', 'HCC', '2023-10-03 13:57:45', '2023-07-01 17:44:59', 39, 8);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (32, 'on time', '09:36', 'F6', 'HCC', 'D4', 'SKT', '2023-06-15 00:11:30', '2023-02-11 14:39:50', 28, 41);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (33, 'cancelled', '02:30', 'C3', 'SKT', 'H8', 'CEW', '2023-04-13 22:26:24', '2023-09-23 16:13:22', 46, 21);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (34, 'delayed', '20:48', 'E5', 'GNF', 'D4', 'PUK', '2023-09-11 19:08:31', '2023-03-06 15:30:12', 27, 5);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (35, 'on time', '21:03', 'G7', 'STC', 'G7', 'DEX', '2023-01-08 11:44:22', '2023-08-14 02:57:49', 10, 29);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (36, 'delayed', '10:17', 'D4', 'TMB', 'F6', 'GNF', '2023-07-03 14:05:57', '2023-11-08 23:30:30', 21, 25);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (37, 'on time', '18:05', 'F6', 'HNN', 'D4', 'BBQ', '2023-04-28 09:23:45', '2023-02-16 06:32:31', 17, 36);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (38, 'delayed', '02:41', 'E5', 'DEX', 'C3', 'YLB', '2023-08-08 17:29:26', '2023-05-31 18:51:14', 9, 17);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (39, 'on time', '06:28', 'C3', 'PUK', 'E5', 'ITR', '2023-02-14 00:43:12', '2023-09-16 11:02:59', 14, 48);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (40, 'delayed', '07:54', 'F6', 'ATL', 'D4', 'TMB', '2023-11-30 03:21:41', '2023-07-26 21:47:29', 19, 11);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (41, 'on time', '04:03', 'G7', 'GSS', 'C3', 'HNN', '2023-09-04 12:51:30', '2023-01-18 19:14:58', 32, 38);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (42, 'delayed', '12:30', 'C3', 'CEW', 'E5', 'HCC', '2023-07-20 05:48:56', '2023-03-26 00:05:49', 25, 24);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (43, 'on time', '14:15', 'G7', 'ITR', 'H8', 'YLB', '2023-05-18 21:17:33', '2023-01-01 10:40:42', 13, 28);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (44, 'delayed', '08:09', 'F6', 'OHI', 'C3', 'DJU', '2023-04-03 23:54:17', '2023-10-09 08:07:23', 36, 22);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (45, 'on time', '15:42', 'G7', 'SKT', 'G7', 'PUK', '2023-02-26 18:38:09', '2023-09-27 14:55:21', 22, 46);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (46, 'delayed', '22:27', 'E5', 'STC', 'B2', 'TMB', '2023-10-19 07:11:37', '2023-06-22 11:36:45', 15, 15);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (47, 'on time', '11:58', 'D4', 'ION', 'D4', 'OGA', '2023-08-23 10:06:04', '2023-04-19 22:29:14', 31, 31);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (48, 'delayed', '16:40', 'F6', 'BBQ', 'E5', 'HCC', '2023-06-30 19:44:33', '2023-02-09 03:58:20', 42, 7);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (49, 'on time', '19:33', 'C3', 'SKT', 'G7', 'DEX', '2023-01-12 02:15:45', '2023-07-12 15:37:08', 26, 40);
insert into Flight (flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft, managerID) values (50, 'delayed', '06:22', 'E5', 'GNF', 'D4', 'PUK', '2023-03-14 13:29:29', '2023-09-20 18:49:50', 11, 16);

insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (1, 'Avis', 'Chape', '2023-10-31', 'F', 'Mexican');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (2, 'Gannon', 'Inkin', '2023-01-09', 'M', 'French');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (3, 'Nils', 'Tootell', '2023-04-22', 'M', 'German');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (4, 'Riki', 'Lakin', '2023-01-07', 'F', 'British');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (5, 'Vassily', 'Burgill', '2023-07-01', 'M', 'Italian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (6, 'Luciana', 'Found', '2023-10-21', 'F', 'Japanese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (7, 'Morganne', 'Glencross', '2022-12-16', 'F', 'Chinese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (8, 'Auberta', 'Youngs', '2023-10-13', 'F', 'British');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (9, 'Gretel', 'Fehners', '2022-12-07', 'F', 'Chinese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (10, 'Cristie', 'Heisham', '2023-05-28', 'F', 'Japanese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (11, 'Sinclare', 'Stourton', '2023-01-11', 'M', 'Indian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (12, 'Xavier', 'Gatcliff', '2023-06-09', 'M', 'British');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (13, 'Ulrika', 'Duckfield', '2022-12-25', 'F', 'Indian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (14, 'Franky', 'Frantzeni', '2023-08-04', 'M', 'Russian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (15, 'Percy', 'Oxbe', '2023-08-23', 'M', 'Russian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (16, 'Latisha', 'Greville', '2023-03-31', 'F', 'Japanese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (17, 'Evy', 'Stare', '2023-07-26', 'F', 'Russian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (18, 'Lorie', 'Kalinsky', '2023-06-09', 'F', 'German');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (19, 'Olimpia', 'Deave', '2023-10-18', 'F', 'French');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (20, 'Helene', 'Eayres', '2023-04-20', 'F', 'Japanese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (21, 'Alison', 'Meekins', '2023-09-05', 'F', 'Russian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (22, 'Griffith', 'Creed', '2022-12-15', 'M', 'Mexican');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (23, 'Janifer', 'Lum', '2023-06-27', 'F', 'British');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (24, 'Manuel', 'Solano', '2023-05-20', 'M', 'Japanese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (25, 'Wanids', 'Gravenell', '2022-12-01', 'F', 'British');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (26, 'Burk', 'Ingerith', '2023-02-14', 'M', 'French');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (27, 'Mendie', 'Ainsbury', '2023-02-27', 'M', 'Indian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (28, 'Izak', 'Itzkovici', '2023-09-27', 'M', 'Russian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (29, 'Karol', 'Vlasenko', '2023-06-04', 'F', 'German');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (30, 'North', 'Plaide', '2023-09-30', 'M', 'Chinese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (31, 'Lennie', 'Rauprich', '2023-03-16', 'M', 'Japanese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (32, 'Tiebold', 'Spennock', '2023-08-29', 'M', 'Chinese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (33, 'Toiboid', 'Kelleher', '2023-01-28', 'M', 'Japanese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (34, 'Garry', 'Alred', '2023-11-15', 'M', 'Russian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (35, 'Cloris', 'Atack', '2023-03-23', 'F', 'Italian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (36, 'Aime', 'Gohier', '2023-02-15', 'F', 'Russian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (37, 'Karen', 'Gymlett', '2023-07-21', 'F', 'Chinese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (38, 'Cyrille', 'Iacovolo', '2023-10-09', 'M', 'German');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (39, 'Georgette', 'D''Cruze', '2023-11-15', 'F', 'Russian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (40, 'Lynn', 'Corter', '2023-01-02', 'M', 'American');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (41, 'Olivier', 'Stokey', '2023-03-17', 'M', 'Italian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (42, 'Tonie', 'Pracy', '2023-05-18', 'F', 'Japanese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (43, 'Davin', 'Scrauniage', '2023-08-18', 'M', 'British');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (44, 'Somerset', 'Pedlow', '2023-02-28', 'M', 'French');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (45, 'Kelby', 'De Filippis', '2022-12-27', 'M', 'Chinese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (46, 'Indira', 'Tendahl', '2023-02-20', 'F', 'Chinese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (47, 'Alidia', 'Ties', '2023-05-05', 'F', 'Chinese');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (48, 'Yvette', 'Bertson', '2023-04-13', 'F', 'Mexican');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (49, 'Chloe', 'Diggar', '2023-05-14', 'F', 'Indian');
insert into Passenger (passengerId, firstName, lastName, dateOfBirth, gender, nationality) values (50, 'Wilek', 'Simonett', '2022-12-11', 'M', 'Mexican');

insert into PassengerEmail (passengerId, email) values (1, 'fbenson0@yellowpages.com');
insert into PassengerEmail (passengerId, email) values (2, 'ojewis1@hibu.com');
insert into PassengerEmail (passengerId, email) values (3, 'amordey2@dagondesign.com');
insert into PassengerEmail (passengerId, email) values (4, 'aconrath3@nymag.com');
insert into PassengerEmail (passengerId, email) values (5, 'trobelet4@hc360.com');
insert into PassengerEmail (passengerId, email) values (6, 'agyse5@springer.com');
insert into PassengerEmail (passengerId, email) values (7, 'vzywicki6@goo.gl');
insert into PassengerEmail (passengerId, email) values (8, 'bcrinage7@tamu.edu');
insert into PassengerEmail (passengerId, email) values (9, 'lcollete8@ning.com');
insert into PassengerEmail (passengerId, email) values (10, 'dwelden9@discuz.net');
insert into PassengerEmail (passengerId, email) values (11, 'fdukelowa@smugmug.com');
insert into PassengerEmail (passengerId, email) values (12, 'mmccurtb@miitbeian.gov.cn');
insert into PassengerEmail (passengerId, email) values (13, 'cbosselc@sourceforge.net');
insert into PassengerEmail (passengerId, email) values (14, 'deberzd@washingtonpost.com');
insert into PassengerEmail (passengerId, email) values (15, 'ndockete@guardian.co.uk');
insert into PassengerEmail (passengerId, email) values (16, 'cnewburnf@earthlink.net');
insert into PassengerEmail (passengerId, email) values (17, 'gcreminsg@house.gov');
insert into PassengerEmail (passengerId, email) values (18, 'vshavelh@livejournal.com');
insert into PassengerEmail (passengerId, email) values (19, 'mplumbridgei@nifty.com');
insert into PassengerEmail (passengerId, email) values (20, 'aflitcroftj@goodreads.com');
insert into PassengerEmail (passengerId, email) values (21, 'vmcphersonk@barnesandnoble.com');
insert into PassengerEmail (passengerId, email) values (22, 'fdavydzenkol@boston.com');
insert into PassengerEmail (passengerId, email) values (23, 'sfontesm@jalbum.net');
insert into PassengerEmail (passengerId, email) values (24, 'ssesonsn@geocities.jp');
insert into PassengerEmail (passengerId, email) values (25, 'sverzeyo@godaddy.com');
insert into PassengerEmail (passengerId, email) values (26, 'rpanichellip@surveymonkey.com');
insert into PassengerEmail (passengerId, email) values (27, 'lalessandoneq@nps.gov');
insert into PassengerEmail (passengerId, email) values (28, 'cnuschker@techcrunch.com');
insert into PassengerEmail (passengerId, email) values (29, 'smeadowcrafts@printfriendly.com');
insert into PassengerEmail (passengerId, email) values (30, 'gmajort@nbcnews.com');
insert into PassengerEmail (passengerId, email) values (31, 'sgarawayu@admin.ch');
insert into PassengerEmail (passengerId, email) values (32, 'kmackillv@unicef.org');
insert into PassengerEmail (passengerId, email) values (33, 'ffarhertyw@surveymonkey.com');
insert into PassengerEmail (passengerId, email) values (34, 'loxleyx@amazonaws.com');
insert into PassengerEmail (passengerId, email) values (35, 'dbampfieldy@cdbaby.com');
insert into PassengerEmail (passengerId, email) values (36, 'srogerotz@baidu.com');
insert into PassengerEmail (passengerId, email) values (37, 'snaton10@shinystat.com');
insert into PassengerEmail (passengerId, email) values (38, 'dspeir11@marketwatch.com');
insert into PassengerEmail (passengerId, email) values (39, 'jrosenbush12@stanford.edu');
insert into PassengerEmail (passengerId, email) values (40, 'krolston13@cbsnews.com');
insert into PassengerEmail (passengerId, email) values (41, 'vdevon14@xing.com');
insert into PassengerEmail (passengerId, email) values (42, 'ehinks15@mediafire.com');
insert into PassengerEmail (passengerId, email) values (43, 'ebaldacchino16@google.ca');
insert into PassengerEmail (passengerId, email) values (44, 'fboult17@statcounter.com');
insert into PassengerEmail (passengerId, email) values (45, 'cfrostdicke18@microsoft.com');
insert into PassengerEmail (passengerId, email) values (46, 'ocastille19@creativecommons.org');
insert into PassengerEmail (passengerId, email) values (47, 'dharbord1a@altervista.org');
insert into PassengerEmail (passengerId, email) values (48, 'kbarrowcliff1b@stanford.edu');
insert into PassengerEmail (passengerId, email) values (49, 'lfeighney1c@pbs.org');
insert into PassengerEmail (passengerId, email) values (50, 'lbradane1d@forbes.com');

insert into PassengerPhoneNumber (passengerId, phoneNumber) values (1, 63007549052);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (2, 75794378575);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (3, 56582852247);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (4, 94065770798);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (5, 54378826741);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (6, 54384161373);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (7, 86979388877);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (8, 14817735622);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (9, 80405879055);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (10, 27160911813);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (11, 60602008258);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (12, 35892936070);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (13, 88419783217);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (14, 72772704338);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (15, 14014040688);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (16, 11930836548);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (17, 51127988165);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (18, 74478056337);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (19, 33610477303);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (20, 57623852888);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (21, 98836055085);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (22, 72609961348);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (23, 22195040749);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (24, 75026769583);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (25, 52780637143);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (26, 75622862323);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (27, 25047660733);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (28, 76086930239);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (29, 28573910631);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (30, 55453171670);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (31, 76582457765);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (32, 19000759033);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (33, 64046085489);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (34, 51889463968);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (35, 85893402378);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (36, 31063056220);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (37, 45297808306);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (38, 56763356536);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (39, 11737901937);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (40, 48356228145);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (41, 82912591913);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (42, 73729402694);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (43, 97959396587);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (44, 45530530048);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (45, 85434089526);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (46, 65725323894);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (47, 48263703193);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (48, 51556701310);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (49, 46702478731);
insert into PassengerPhoneNumber (passengerId, phoneNumber) values (50, 93202755611);

insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (1, 3.31, 'vegetarian', '2', 'J10', 1, 1);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (2, 3.17, 'vegetarian', 'A', 'C3', 2, 2);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (3, 5.59, 'vegetarian', 'D', 'F6', 3, 3);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (4, 0.38, 'vegan', 'E', 'J10', 4, 4);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (5, 3.51, 'vegan', 'E', 'D4', 5, 5);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (6, 2.55, 'vegetarian', '4', 'A1', 6, 6);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (7, 4.21, 'aisle seat', '5', 'B2', 7, 7);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (8, 6.98, 'window seat', 'C', 'E5', 8, 8);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (9, 1.34, 'vegetarian', 'B', 'C3', 9, 9);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (10, 8.94, 'window seat', '5', 'I9', 10, 10);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (11, 3.8, 'window seat', '4', 'C3', 11, 11);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (12, 5.02, 'gluten-free', 'D', 'B2', 12, 12);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (13, 7.63, 'window seat', 'E', 'G7', 13, 13);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (14, 6.11, 'window seat', 'D', 'E5', 14, 14);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (15, 6.73, 'aisle seat', '4', 'D4', 15, 15);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (16, 1.18, 'vegetarian', '2', 'A1', 16, 16);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (17, 2.04, 'aisle seat', '4', 'J10', 17, 17);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (18, 7.16, 'vegetarian', 'D', 'G7', 18, 18);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (19, 9.07, 'vegan', 'A', 'C3', 19, 19);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (20, 9.98, 'window seat', '4', 'A1', 20, 20);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (21, 0.74, 'vegetarian', '5', 'D4', 21, 21);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (22, 9.18, 'vegan', '1', 'J10', 22, 22);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (23, 3.32, 'aisle seat', '5', 'H8', 23, 23);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (24, 3.08, 'window seat', '3', 'I9', 24, 24);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (25, 1.8, 'gluten-free', 'D', 'I9', 25, 25);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (26, 4.16, 'vegetarian', 'D', 'I9', 26, 26);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (27, 5.76, 'gluten-free', '1', 'F6', 27, 27);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (28, 7.1, 'vegetarian', 'D', 'G7', 28, 28);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (29, 5.19, 'aisle seat', '4', 'D4', 29, 29);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (30, 5.01, 'vegan', 'C', 'J10', 30, 30);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (31, 5.68, 'gluten-free', '5', 'E5', 31, 31);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (32, 7.73, 'gluten-free', 'B', 'G7', 32, 32);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (33, 6.29, 'vegan', 'E', 'B2', 33, 33);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (34, 5.88, 'gluten-free', '3', 'G7', 34, 34);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (35, 4.8, 'vegetarian', 'D', 'J10', 35, 35);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (36, 7.99, 'aisle seat', '3', 'D4', 36, 36);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (37, 5.04, 'vegan', 'C', 'B2', 37, 37);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (38, 2.7, 'vegan', '2', 'G7', 38, 38);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (39, 5.2, 'vegetarian', '3', 'C3', 39, 39);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (40, 5.61, 'gluten-free', 'D', 'B2', 40, 40);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (41, 7.29, 'vegan', 'A', 'J10', 41, 41);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (42, 3.05, 'gluten-free', 'A', 'F6', 42, 42);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (43, 9.4, 'vegan', '5', 'D4', 43, 43);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (44, 6.14, 'gluten-free', 'D', 'F6', 44, 44);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (45, 0.95, 'window seat', 'B', 'F6', 45, 45);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (46, 1.11, 'window seat', '3', 'D4', 46, 46);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (47, 2.27, 'window seat', '3', 'E5', 47, 47);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (48, 8.98, 'vegetarian', 'C', 'E5', 48, 48);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (49, 5.42, 'vegetarian', 'B', 'E5', 49, 49);
insert into Booking (bookingId, numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (50, 9.9, 'vegetarian', '3', 'H8', 50, 50);

insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (1, 743.24, 'unpaid', 'credit card', 1);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (2, 616.89, 'cancelled', 'credit card', 2);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (3, 632.85, 'cancelled', 'PayPal', 3);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (4, 30.99, 'paid', 'Apple Pay', 4);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (5, 263.97, 'paid', 'Apple Pay', 5);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (6, 922.97, 'cancelled', 'debit card', 6);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (7, 122.61, 'paid', 'credit card', 7);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (8, 705.04, 'paid', 'Apple Pay', 8);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (9, 955.47, 'cancelled', 'Google Pay', 9);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (10, 466.17, 'cancelled', 'Google Pay', 10);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (11, 920.04, 'unpaid', 'debit card', 11);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (12, 578.76, 'cancelled', 'debit card', 12);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (13, 426.8, 'unpaid', 'PayPal', 13);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (14, 308.32, 'unpaid', 'Apple Pay', 14);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (15, 239.73, 'pending', 'debit card', 15);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (16, 738.53, 'unpaid', 'credit card', 16);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (17, 934.19, 'pending', 'Apple Pay', 17);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (18, 770.54, 'unpaid', 'Apple Pay', 18);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (19, 159.91, 'pending', 'debit card', 19);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (20, 826.61, 'paid', 'Apple Pay', 20);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (21, 187.01, 'pending', 'debit card', 21);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (22, 861.34, 'paid', 'credit card', 22);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (23, 511.21, 'pending', 'debit card', 23);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (24, 20.24, 'cancelled', 'Apple Pay', 24);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (25, 882.08, 'unpaid', 'debit card', 25);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (26, 612.25, 'paid', 'Apple Pay', 26);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (27, 838.06, 'pending', 'debit card', 27);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (28, 773.24, 'paid', 'credit card', 28);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (29, 28.96, 'unpaid', 'debit card', 29);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (30, 316.94, 'pending', 'Apple Pay', 30);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (31, 605.72, 'unpaid', 'PayPal', 31);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (32, 410.14, 'unpaid', 'PayPal', 32);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (33, 493.08, 'cancelled', 'Apple Pay', 33);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (34, 661.34, 'unpaid', 'debit card', 34);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (35, 872.88, 'pending', 'PayPal', 35);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (36, 733.1, 'pending', 'credit card', 36);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (37, 309.85, 'pending', 'Apple Pay', 37);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (38, 106.73, 'cancelled', 'credit card', 38);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (39, 797.96, 'cancelled', 'PayPal', 39);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (40, 545.95, 'pending', 'credit card', 40);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (41, 865.73, 'cancelled', 'credit card', 41);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (42, 843.39, 'unpaid', 'credit card', 42);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (43, 518.84, 'paid', 'Apple Pay', 43);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (44, 412.3, 'pending', 'Apple Pay', 44);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (45, 989.54, 'unpaid', 'PayPal', 45);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (46, 245.18, 'cancelled', 'debit card', 46);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (47, 658.5, 'cancelled', 'Google Pay', 47);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (48, 54.66, 'pending', 'PayPal', 48);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (49, 675.75, 'unpaid', 'debit card', 49);
insert into Billing (billingId, totalAmount, paymentStatus, paymentMethod, bookingId) values (50, 463.55, 'cancelled', 'credit card', 50);

insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (1, 'Idaline', 'Antonacci', 25, 30);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (2, 'Vernon', 'Iglesia', 26, 10);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (3, 'Hermy', 'Pavlenko', 18, 20);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (4, 'Bria', 'Willans', 32, 39);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (5, 'Loy', 'Band', 37, 1);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (6, 'Sheela', 'Guillet', 33, 7);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (7, 'Ethelind', 'Hobbing', 13, 0);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (8, 'Yank', 'Kirley', 3, 30);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (9, 'Gill', 'Faircloth', 30, 39);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (10, 'Marylee', 'Rigeby', 33, 0);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (11, 'Kathie', 'Snel', 15, 33);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (12, 'Athena', 'Frodsham', 12, 26);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (13, 'Elihu', 'Hammonds', 2, 8);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (14, 'Velvet', 'Bodicum', 35, 14);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (15, 'Baily', 'Von Der Empten', 16, 23);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (16, 'Junina', 'Leftridge', 15, 23);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (17, 'Nora', 'Mellsop', 8, 9);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (18, 'Ailis', 'Pohl', 34, 10);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (19, 'Joelie', 'Ewles', 24, 3);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (20, 'Vinson', 'Siehard', 2, 30);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (21, 'Celie', 'Snowding', 17, 14);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (22, 'Maxi', 'Sherry', 17, 14);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (23, 'Shay', 'Spelman', 37, 14);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (24, 'Maje', 'Oultram', 7, 38);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (25, 'Romonda', 'Lukianovich', 30, 12);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (26, 'Lance', 'Iacabucci', 9, 3);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (27, 'Bar', 'Matyatin', 17, 3);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (28, 'Ebonee', 'Martt', 22, 19);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (29, 'Gusty', 'Pinniger', 23, 22);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (30, 'Dugald', 'Guidoni', 11, 17);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (31, 'Pamella', 'Fetherby', 31, 6);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (32, 'Rayner', 'Dalliwatr', 2, 12);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (33, 'Beau', 'Fleischmann', 11, 3);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (34, 'Jinny', 'Venditti', 9, 1);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (35, 'Codie', 'Lucian', 22, 33);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (36, 'Dorothy', 'Shillitoe', 31, 0);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (37, 'Fiann', 'Almey', 7, 27);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (38, 'Giulietta', 'Bradick', 32, 15);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (39, 'Patrice', 'Dederick', 39, 23);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (40, 'Brennan', 'Portugal', 38, 10);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (41, 'Vasily', 'Severy', 34, 5);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (42, 'Caty', 'Brandom', 34, 11);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (43, 'Theodoric', 'Rey', 25, 34);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (44, 'Tildie', 'Winn', 39, 27);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (45, 'Kippar', 'Slott', 35, 23);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (46, 'Daren', 'Plews', 3, 25);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (47, 'Lorant', 'Bennedick', 31, 40);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (48, 'Lesya', 'Simounet', 36, 15);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (49, 'Dan', 'Gulk', 18, 17);
insert into CrewMember (crewID, firstName, lastName, weeklyHoursWorked, timeTakenOff) values (50, 'Orelle', 'Legrice', 12, 34);

insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (1, 1, 'cabin crew', 1);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (2, 2, 'flight attendant', 2);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (3, 3, 'cabin crew', 3);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (4, 4, 'pilot', 4);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (5, 5, 'flight attendant', 5);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (6, 6, 'first officer', 6);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (7, 7, 'first officer', 7);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (8, 8, 'flight attendant', 8);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (9, 9, 'pilot', 9);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (10, 10, 'flight attendant', 10);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (11, 11, 'first officer', 11);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (12, 12, 'pilot', 12);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (13, 13, 'flight attendant', 13);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (14, 14, 'co-pilot', 14);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (15, 15, 'cabin crew', 15);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (16, 16, 'flight attendant', 16);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (17, 17, 'cabin crew', 17);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (18, 18, 'captain', 18);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (19, 19, 'flight attendant', 19);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (20, 20, 'first officer', 20);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (21, 21, 'flight attendant', 21);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (22, 22, 'co-pilot', 22);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (23, 23, 'first officer', 23);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (24, 24, 'pilot', 24);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (25, 25, 'captain', 25);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (26, 26, 'first officer', 26);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (27, 27, 'flight attendant', 27);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (28, 28, 'flight attendant', 28);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (29, 29, 'first officer', 29);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (30, 30, 'co-pilot', 30);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (31, 31, 'first officer', 31);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (32, 32, 'cabin crew', 32);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (33, 33, 'cabin crew', 33);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (34, 34, 'cabin crew', 34);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (35, 35, 'co-pilot', 35);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (36, 36, 'flight attendant', 36);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (37, 37, 'co-pilot', 37);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (38, 38, 'first officer', 38);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (39, 39, 'co-pilot', 39);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (40, 40, 'captain', 40);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (41, 41, 'captain', 41);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (42, 42, 'co-pilot', 42);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (43, 43, 'pilot', 43);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (44, 44, 'first officer', 44);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (45, 45, 'flight attendant', 45);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (46, 46, 'pilot', 46);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (47, 47, 'first officer', 47);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (48, 48, 'co-pilot', 48);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (49, 49, 'captain', 49);
insert into CrewMemberAssignment (assignmentID, flightId, role, crewID) values (50, 50, 'flight attendant', 50);
