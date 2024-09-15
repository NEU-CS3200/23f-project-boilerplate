DROP SCHEMA IF EXISTS `edusharehub` ;
CREATE SCHEMA IF NOT EXISTS `edusharehub` DEFAULT CHARACTER SET latin1 ;
USE `edusharehub` ;

-- User Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`User` (
  UserID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE
);

-- Textbook Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`textbooks` (
  TextbookID INT AUTO_INCREMENT PRIMARY KEY,
  ISBN CHAR(13) NOT NULL UNIQUE,
  Author VARCHAR(255) NOT NULL,
  Title VARCHAR(255) NOT NULL,
  UserID INT NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Wishlist Table
CREATE TABLE IF NOT EXISTS  `edusharehub`.`Wishlist` (
  WishlistID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  UserID INT NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Wishlist Item Table
CREATE TABLE IF NOT EXISTS WishlistItem (
  WishlistItemID INT AUTO_INCREMENT PRIMARY KEY,
  WishlistID INT NOT NULL,
  TextbookID INT NOT NULL,
  FOREIGN KEY (WishlistID) REFERENCES Wishlist(WishlistID),
  FOREIGN KEY (TextbookID) REFERENCES textbooks(TextbookID)
);

-- Exchange Offer Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`ExchangeOffer` (
  OfferID INT AUTO_INCREMENT PRIMARY KEY,
  TextbookID INT NOT NULL,
  UserID INT NOT NULL,
  ConditionState VARCHAR(255) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (TextbookID) REFERENCES textbooks(TextbookID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);


-- Exchange Transaction Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`ExchangeTransaction` (
  TransactionID INT AUTO_INCREMENT PRIMARY KEY,
  OfferID INT NOT NULL,
  RequesterID INT NOT NULL,
  Status VARCHAR(255) NOT NULL,
  FOREIGN KEY (OfferID) REFERENCES ExchangeOffer(OfferID),
  FOREIGN KEY (RequesterID) REFERENCES User(UserID)
);

-- Community Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`Community` (
  CommunityID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Description TEXT NOT NULL
);

-- Membership Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`Membership` (
  CommunityID INT,
  UserID INT,
  Role VARCHAR(255) NOT NULL,
  PRIMARY KEY (CommunityID, UserID),
  FOREIGN KEY (CommunityID) REFERENCES Community(CommunityID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Sharing Session Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`SharingSession` (
  SessionID INT AUTO_INCREMENT PRIMARY KEY,
  CommunityID INT NOT NULL,
  ResourceID INT,
  Schedule DATETIME NOT NULL,
  FOREIGN KEY (CommunityID) REFERENCES Community(CommunityID),
  FOREIGN KEY (ResourceID) REFERENCES textbooks(TextbookID)
);

-- Digital Resource Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`DigitalResource` (
  ResourceID INT AUTO_INCREMENT PRIMARY KEY,
  UserID INT NOT NULL,
  Title VARCHAR(255) NOT NULL,
  Format VARCHAR(50) NOT NULL,
  AccessURL VARCHAR(255) NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Recycling Event Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`RecyclingEvent` (
  EventID INT AUTO_INCREMENT PRIMARY KEY,
  Location VARCHAR(255) NOT NULL,
  Date DATE NOT NULL,
  Description TEXT NOT NULL
);

-- Event Participation Table
CREATE TABLE IF NOT EXISTS `edusharehub`.`EventParticipation` (
  UserID INT,
  EventID INT,
  Role VARCHAR(255) NOT NULL,
  PRIMARY KEY (UserID, EventID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (EventID) REFERENCES RecyclingEvent(EventID)
);


INSERT INTO User (Name, Email) VALUES
('Alex Johnson', 'alex.johnson@university.edu'),
('Jordan Lee', 'jordan.lee@university.edu'),
('Taylor Kim', 'taylor.kim@university.edu'),
('Morgan Rivera', 'morgan.rivera@university.edu');


INSERT INTO textbooks (ISBN, Author, Title, UserID) VALUES
('978-0-13-6083', 'Robert Sedgewick', 'Algorithms', 1),
('978-0-07-0324', 'Abraham Silberschatz', 'Database System', 1);


INSERT INTO Wishlist (UserID, Name) VALUES
(1, 'My Favorite Textbooks'),
(2, 'The best wishlist'),
(3, 'Study Materials');

INSERT INTO WishlistItem (WishlistID, TextbookID) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2);

INSERT INTO ExchangeOffer (TextbookID, UserID, ConditionState, Price) VALUES
(1, 1, 'New', 21.00),
(2, 2, 'Used - Good', 12.00);


INSERT INTO ExchangeTransaction (OfferID, RequesterID, Status) VALUES
(1, 2, 'Pending'),
(2, 1, 'Completed');


INSERT INTO Community (Name, Description) VALUES
('Sustainability Club', 'Focused on promoting sustainability in campus life.'),
('Programming Hub', 'Community for sharing coding resources and knowledge.');


INSERT INTO Membership (CommunityID, UserID, Role) VALUES
(1, 3, 'Member'),
(2, 1, 'Moderator');


INSERT INTO SharingSession (CommunityID, ResourceID, Schedule) VALUES
(2, 1, '2024-05-15 15:00:00');


INSERT INTO DigitalResource (UserID, Title, Format, AccessURL) VALUES
(2, 'Introduction to Java Programming', 'PDF', 'http://example.com/java.pdf');


INSERT INTO RecyclingEvent (Location, Date, Description) VALUES
('Campus Center', '2024-04-22', 'Campus Recycling Drive'),
('Clean Ocean Action', '2025-01-31', 'Beach Clean Up');


INSERT INTO EventParticipation (UserID, EventID, Role) VALUES
(3, 1, 'Volunteer');


SELECT *
FROM ExchangeOffer;