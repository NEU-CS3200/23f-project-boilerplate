SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS inkSprout ;
CREATE SCHEMA IF NOT EXISTS inkSprout DEFAULT CHARACTER SET latin1 ;
USE inkSprout ;

CREATE TABLE IF NOT EXISTS Readers
(
   userID    INT PRIMARY KEY AUTO_INCREMENT,
   age       INT,
   firstName VARCHAR(20)         NOT NULL,
   lastName  VARCHAR(20)         NOT NULL,
   email     VARCHAR(100) UNIQUE NOT NULL,
   joined    DATETIME DEFAULT CURRENT_TIMESTAMP,
   active    TINYINT  DEFAULT 1
);

CREATE TABLE IF NOT EXISTS Posts
(
   postID          INT PRIMARY KEY,
   userID          INT        NOT NULL,
   title           VARCHAR(100) DEFAULT 'No Title',
   content         MEDIUMTEXT NOT NULL,
   publicationDate DATETIME     DEFAULT CURRENT_TIMESTAMP,
   numberOfViews   INT          DEFAULT 0,
   price           REAL         DEFAULT 0,
   active          TINYINT      DEFAULT 1,


   CONSTRAINT fk_01 FOREIGN KEY (userID) REFERENCES Readers (userID)
);

CREATE TABLE IF NOT EXISTS Read_By
(
   userID INT,
   postID INT,
   PRIMARY KEY (userID, postID),
   CONSTRAINT fk_02 FOREIGN KEY (userID) REFERENCES Readers (userID),
   CONSTRAINT fk_03 FOREIGN KEY (postID) REFERENCES Posts (postID)
);

CREATE TABLE IF NOT EXISTS Post_Comments
(
   commentID   INT UNIQUE,
   postID      INT,
   commenterID INT  NOT NULL,
   date        DATETIME DEFAULT CURRENT_TIMESTAMP,
   comment     TEXT,
   replyingTo  INT      DEFAULT Null,


   PRIMARY KEY (postID, commentID),
   CONSTRAINT fk_04 FOREIGN KEY (commenterID) REFERENCES Readers(userID),
   CONSTRAINT fk_05 FOREIGN KEY (replyingTo) REFERENCES Post_Comment(commentID),
   CONSTRAINT fk_06 FOREIGN KEY (postID) REFERENCES Posts(postID)
);

CREATE TABLE IF NOT EXISTS Tags
(
   tagID    INT,
   postID   INT,
   tagName TINYTEXT,


   PRIMARY KEY (postID, tagID),
   CONSTRAINT fk_07 FOREIGN KEY (postID) REFERENCES Posts (postID)
);

CREATE TABLE IF NOT EXISTS Genres
(
   genreID   INT PRIMARY KEY,
   genreName VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Followings
(
   followerID INT,
   followeeID INT,


   PRIMARY KEY (followerID, followeeID),
   CONSTRAINT fk_08 FOREIGN KEY (followerID) REFERENCES Readers (userID),
   CONSTRAINT fk_09 FOREIGN KEY (followeeID) REFERENCES Readers (userID)
);

CREATE TABLE IF NOT EXISTS Content_Creators
(
   userID    INT,
   creatorID INT,
   bio       TEXT,
   earnings  REAL    DEFAULT 0,
   genreID   INT,


   PRIMARY KEY (userID, creatorID),
   CONSTRAINT fk_10 FOREIGN KEY (userID) REFERENCES Readers (userID),
   CONSTRAINT fk_11 FOREIGN KEY (genreID) REFERENCES Genres (genreID)
       ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Employees
(
   empID     INT PRIMARY KEY AUTO_INCREMENT,
   firstName VARCHAR(20)         NOT NULL,
   lastName  VARCHAR(20)         NOT NULL,
   phone     VARCHAR(15)         NOT NULL,
   email     VARCHAR(100) UNIQUE NOT NULL,
   address   VARCHAR(100),
   title     VARCHAR(50)         NOT NULL,
   hireDate  DATE    DEFAULT (CURRENT_DATE),
   salary    REAL,
   active    TINYINT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS Writing_Assistants
(
   empID      INT,
   asstName   VARCHAR(50) UNIQUE,
   experience TEXT,
   PRIMARY KEY (empID, asstName),
   CONSTRAINT fk_12 FOREIGN KEY (empID) REFERENCES Employees (empID)
);

CREATE TABLE IF NOT EXISTS Moderators
(
   empID      INT,
   modName    VARCHAR(50) UNIQUE,
   experience TEXT,
   PRIMARY KEY (empID, modName),
   CONSTRAINT fk_13 FOREIGN KEY (empID) REFERENCES Employees(empID)
);

CREATE TABLE IF NOT EXISTS Issue_Reports
(
   reportID      INT PRIMARY KEY,
   issuerID      INT,
   modName       VARCHAR(50) NOT NULL,
   date          DATETIME DEFAULT CURRENT_TIMESTAMP,
   reportContent TEXT,
   resolved      TINYINT(1) DEFAULT 0,
   severity      INT,
   type          VARCHAR (50),


   CONSTRAINT fk_14 FOREIGN KEY (issuerID) REFERENCES Readers(userID),
   CONSTRAINT fk_15 FOREIGN KEY (modName) REFERENCES Moderators(modName)
);

CREATE TABLE IF NOT EXISTS Edits
(
   editID INT  PRIMARY KEY,
   postID INT  NOT NULL,
   asstName    VARCHAR(50)  NOT NULL,
   edit        TEXT NOT NULL,


   CONSTRAINT fk_16 FOREIGN KEY (postID) REFERENCES Posts(postID),
   CONSTRAINT fk_17 FOREIGN KEY (asstName) REFERENCES WritingAssistants(asstName)
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



