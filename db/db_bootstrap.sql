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
DROP TABLE IF EXISTS guides;
CREATE TABLE IF NOT EXISTS guides
(
    title       varchar(75) NOT NULL,
    guideText   text        NOT NULL,
    dateCreated datetime    NOT NULL,
    guideID     int AUTO_INCREMENT PRIMARY KEY
);

DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer
(
    firstName   varchar(50) NOT NULL,
    lastName    varchar(50) NOT NULL,
    cellPhone   varchar(15) NOT NULL,
    homePhone   varchar(15) NOT NULL,
    email       varchar(75) NOT NULL,
    street      varchar(50) NOT NULL,
    city        varchar(50) NOT NULL,
    state       varchar(25) NOT NULL,
    zip         int         NOT NULL,
    profileText text        NOT NULL,
    customerID  int AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT unique_email UNIQUE (email),
    CONSTRAINT unique_cell UNIQUE (cellPhone),
    CONSTRAINT unique_home UNIQUE (homePhone)
);

DROP TABLE IF EXISTS review;
CREATE TABLE IF NOT EXISTS review
(
    title         varchar(75) NOT NULL,
    reviewText    text        NOT NULL,
    dateCreated   datetime    NOT NULL,
    dateEdited    datetime,
    datePublished datetime,
    author        varchar(25) NOT NULL,
    customerID    int         NOT NULL,
    reviewID      int AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (customerID) REFERENCES customer (customerID) ON UPDATE cascade ON DELETE restrict
);

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order`
(
    orderDate     datetime          NOT NULL,
    paymentAmount decimal(15, 2)    NOT NULL,
    paymentMethod varchar(15)       NOT NULL,
    customerID    int               NOT NULL,
    orderID       int AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (customerID) REFERENCES customer (customerID) ON UPDATE cascade ON DELETE restrict
);

DROP TABLE IF EXISTS animal_supplier;
CREATE TABLE IF NOT EXISTS animal_supplier
(
    firstName     varchar(50) NOT NULL,
    lastName      varchar(50) NOT NULL,
    phone         varchar(15) NOT NULL,
    email         varchar(75) NOT NULL,
    company       varchar(75) NOT NULL,
    city          varchar(50) NOT NULL,
    state         varchar(25) NOT NULL,
    country       varchar(25) NOT NULL,
    contactLink   varchar(50) NOT NULL,
    countSupplied int NOT NULL,
    profileText   text NOT NULL,
    supplierID    int AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT unique_email UNIQUE (email),
    CONSTRAINT unique_phone UNIQUE (phone)
);

DROP TABLE IF EXISTS animal;
CREATE TABLE IF NOT EXISTS animal
(
    specialRequirements varchar(75),
    age                 tinyint        NOT NULL,
    gender              tinyint(1)     NOT NULL,           # 1 = female, 0 = male
    price               decimal(15, 2) NOT NULL,
    healthStatus        varchar(75)    NOT NULL,
    behavior            varchar(75)    NOT NULL,
    origin              varchar(75)    NOT NULL,
    availability        tinyint(1)     NOT NULL DEFAULT 1, # 1 = available, 0 = unavailable
    orderID             int,
    supplierID          int            NOT NULL,
    animalID            int AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (orderID) REFERENCES `order` (orderID) ON UPDATE cascade ON DELETE restrict,
    FOREIGN KEY (supplierID) REFERENCES animal_supplier (supplierID) ON UPDATE cascade ON DELETE restrict
);

DROP TABLE IF EXISTS animal_type;
CREATE TABLE IF NOT EXISTS animal_type
(
    species      varchar(75) NOT NULL,
    subSpecies   varchar(75) NOT NULL,
    animalID     int         NOT NULL,
    animalTypeID int AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (animalID) REFERENCES animal (animalID) ON UPDATE cascade ON DELETE restrict
);

-- Add sample data. 
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Horses are majestic creatures.', '2023-04-10 16:26:32');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Birds can mimic human speech.', '2023-09-14 20:59:26');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Cats are independent creatures.', '2023-05-15 07:20:11');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Hamsters are small and playful rodents.', '2023-10-22 20:51:07');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Cats are independent creatures.', '2023-02-16 08:54:43');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Turtles are slow-moving reptiles.', '2023-10-10 07:32:31');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Hamsters are small and playful rodents.', '2023-09-16 19:21:09');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Turtles are slow-moving reptiles.', '2023-01-31 22:25:21');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Turtles are slow-moving reptiles.', '2023-03-20 23:36:39');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Cats are independent creatures.', '2023-01-04 09:19:12');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Guinea pigs are social animals.', '2022-12-11 04:18:56');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Fish are low-maintenance pets.', '2023-06-15 06:30:31');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Birds can mimic human speech.', '2023-03-17 23:34:32');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Dogs are loyal companions.', '2023-03-04 02:42:26');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Horses are majestic creatures.', '2023-10-23 06:16:36');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Horses are majestic creatures.', '2023-04-01 06:42:29');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Hamsters are small and playful rodents.', '2023-02-17 14:42:47');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Horses are majestic creatures.', '2023-11-27 21:12:17');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Snakes are fascinating reptiles.', '2023-05-24 19:23:28');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Guinea pigs are social animals.', '2023-02-23 14:43:21');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Dogs are loyal companions.', '2023-04-20 08:41:33');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Dogs are loyal companions.', '2023-01-10 15:07:20');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Cats are independent creatures.', '2023-07-15 17:33:40');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Turtles are slow-moving reptiles.', '2023-10-18 16:56:15');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Dogs are loyal companions.', '2023-02-07 17:47:31');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Cats are independent creatures.', '2023-02-09 20:35:57');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Fish are low-maintenance pets.', '2023-04-07 02:03:54');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Dogs are loyal companions.', '2023-08-19 20:53:47');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Guinea pigs are social animals.', '2023-03-10 04:52:13');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Turtles are slow-moving reptiles.', '2023-01-14 00:12:39');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Birds can mimic human speech.', '2023-07-17 14:47:15');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Birds can mimic human speech.', '2023-09-25 14:10:21');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Fish are low-maintenance pets.', '2023-09-21 20:01:16');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Hamsters are small and playful rodents.', '2023-02-28 05:28:19');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Fish are low-maintenance pets.', '2023-10-14 02:01:35');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Cats are independent creatures.', '2023-11-18 00:15:39');
insert into guides (title, guideText, dateCreated) values ('Cat Care 101', 'Rabbits are cute and cuddly pets.', '2023-07-03 23:14:08');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Dogs are loyal companions.', '2023-08-26 03:35:57');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Hamsters are small and playful rodents.', '2022-12-22 14:44:30');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Guinea pigs are social animals.', '2022-12-21 06:36:34');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Guinea pigs are social animals.', '2023-03-15 00:51:45');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Fish are low-maintenance pets.', '2023-05-14 19:14:36');
insert into guides (title, guideText, dateCreated) values ('The Ultimate Guide to Dogs', 'Fish are low-maintenance pets.', '2023-01-18 21:18:17');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Fish are low-maintenance pets.', '2023-07-13 07:09:32');
insert into guides (title, guideText, dateCreated) values ('Reptile Care Made Easy', 'Fish are low-maintenance pets.', '2023-11-10 11:41:19');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Rabbits are cute and cuddly pets.', '2023-07-20 03:13:46');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Cats are independent creatures.', '2023-03-17 10:26:46');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Dogs are loyal companions.', '2023-06-27 20:41:54');
insert into guides (title, guideText, dateCreated) values ('Small Mammals: A Beginner''s Handbook', 'Horses are majestic creatures.', '2023-04-10 10:10:41');
insert into guides (title, guideText, dateCreated) values ('Birds: A Comprehensive Guide', 'Cats are independent creatures.', '2023-11-04 08:51:11');

insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Rahal', 'Bownes', '875-420-9744', '070-651-7815', 'rbownes1@wix.com', '4954 Emmet Crossing', 'Qingguang', 'CA', '51659', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Ariel', 'Pache', '302-650-0012', '366-128-5175', 'apache2@theatlantic.com', '87 Mockingbird Parkway', 'Havířov', 'MI', '60964', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Gregg', 'Giffaut', '504-268-4941', '189-129-7795', 'ggiffaut3@utexas.edu', '59 Buena Vista Court', 'Guaratinguetá', 'CA', '13137', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Modesty', 'Grammer', '066-918-8707', '652-809-9465', 'mgrammer4@google.cn', '0260 Melby Place', 'Tarragona', 'Cataluna', '14513', 'Bird owner');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Wye', 'Dinneen', '117-708-2392', '300-330-9735', 'wdinneen5@seattletimes.com', '2330 Continental Plaza', 'Kvitok', 'MI', '23354', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Fidelio', 'Thormann', '053-505-2968', '552-057-4431', 'fthormann6@etsy.com', '08 Bellgrove Center', 'Lengshuijing', 'PA', '70876', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Mallory', 'D''Costa', '597-544-6720', '556-913-1632', 'mdcosta7@behance.net', '46 Grasskamp Alley', 'Usagara', 'KT', '85322', 'Dog lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Rube', 'Houseley', '351-531-7797', '831-862-5323', 'rhouseley8@omniture.com', '41 Chive Junction', 'Bradag', 'MI', '74845', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Gusella', 'Hocking', '682-816-6476', '863-821-3855', 'ghocking9@sphinn.com', '3 Knutson Lane', 'Gambaru', 'CA', '92613', 'Dog lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Dulciana', 'Aphale', '254-106-3429', '616-599-1939', 'daphalea@lycos.com', '0 Roxbury Way', 'Tisma', 'PA', '81713', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Ky', 'Mattioli', '067-767-9400', '518-850-9100', 'kmattiolib@booking.com', '79 Montana Circle', 'Luxi', 'CA', '63150', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Reube', 'Ballinghall', '152-360-5547', '106-043-1367', 'rballinghallc@addtoany.com', '53086 Old Shore Court', 'Shuanggang', 'CA', '51399', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Tracee', 'Massingberd', '635-777-3240', '104-644-7693', 'tmassingberdd@deliciousdays.com', '9312 Carberry Plaza', 'Norrköping', 'Östergötland', '71874', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Gualterio', 'Brosini', '771-348-2493', '544-344-7147', 'gbrosinie@rambler.ru', '55 Red Cloud Parkway', 'Chernogorsk', 'MI', '41959', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Terri', 'Pennuzzi', '250-804-5261', '993-883-3156', 'tpennuzzif@ustream.tv', '9600 Sauthoff Terrace', 'Albi', 'Midi-Pyrénées', '66539', 'Bird owner');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Willie', 'Lett', '748-793-2605', '408-133-7507', 'wlettg@tmall.com', '442 Burrows Drive', 'Miłosław', 'MI', '35365', 'Bird owner');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Anatollo', 'O''Regan', '322-887-3257', '544-524-1703', 'aoreganh@g.co', '915 Moulton Center', 'Dīvāndarreh', 'CA', '20519', 'Dog lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Danell', 'Ernke', '224-210-7168', '406-585-4825', 'dernkei@mozilla.com', '9 Utah Drive', 'Esso', 'PA', '83842', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Korey', 'O''Ferris', '967-035-1136', '627-365-4974', 'koferrisj@pcworld.com', '3675 Buell Street', 'Shpola', 'KT', '14122', 'Dog lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Ole', 'Leeburne', '801-854-4976', '767-197-7450', 'oleeburnek@blogs.com', '03 Graceland Alley', 'Eskilstuna', 'Södermanland', '89888', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Ladonna', 'Toderbrugge', '264-252-0607', '066-073-7157', 'ltoderbruggel@aboutads.info', '723 Dayton Road', 'Pensacola', 'Florida', '23320', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Anya', 'Mattityahou', '869-373-8353', '324-084-9578', 'amattityahoum@facebook.com', '55282 Thompson Way', 'Huangcun', 'MI', '22070', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Siusan', 'Hause', '026-276-9553', '296-173-2503', 'shausen@prnewswire.com', '9 Hanson Circle', 'Matam', 'KT', '15275', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Maryjane', 'Choupin', '604-538-1870', '840-866-4918', 'mchoupino@mashable.com', '4886 Carpenter Point', 'Tuzhu', 'PA', '51656', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Stanton', 'Dehmel', '343-267-3809', '030-110-0811', 'sdehmelp@freewebs.com', '84957 Fulton Avenue', 'Mananara', 'KT', '13187', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Emmalynn', 'Clerc', '637-988-8242', '303-573-2246', 'eclercq@bizjournals.com', '2 Gale Way', 'Tsovazard', 'KT', '81898', 'Dog lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Cleon', 'Challoner', '775-296-2683', '744-068-7740', 'cchallonerr@altervista.org', '3 Lukken Street', 'Besuk Selatan', 'MI', '89163', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Maximilien', 'McAdam', '672-272-6860', '375-360-3621', 'mmcadams@sina.com.cn', '3295 Elmside Junction', 'Ashchysay', 'CA', '42207', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Frants', 'Gulberg', '050-285-6551', '267-256-8148', 'fgulbergt@fc2.com', '1044 Tennyson Circle', 'Mustvee', 'PA', '82011', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Clemmie', 'Brussell', '401-388-0511', '622-958-3606', 'cbrussellu@ning.com', '882 Lien Park', 'Furongqiao', 'MI', '73948', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Eimile', 'Spedroni', '205-809-1620', '559-131-8926', 'espedroniv@sphinn.com', '40 Gina Center', 'Enrile', 'OH', '67276', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Francene', 'Closs', '024-500-2051', '294-387-4291', 'fclossw@gravatar.com', '0671 Glendale Court', 'Kampungbaru', 'OH', '22397', 'Bird owner');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Farah', 'Seppey', '123-456-8808', '754-545-6815', 'fseppeyx@nydailynews.com', '99 Red Cloud Street', 'Salt Lake City', 'Utah', '72196', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Munroe', 'Siggens', '891-549-1921', '553-074-6498', 'msiggensy@icq.com', '618 Chinook Circle', 'Opoczno', 'OH', '67364', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Fidel', 'Culbard', '172-159-5666', '740-394-3824', 'fculbardz@tripod.com', '82157 Merchant Way', 'Qal‘ah-ye Kūf', 'OH', '19656', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Jordan', 'Ciccarelli', '713-810-7753', '344-419-6262', 'jciccarelli10@g.co', '03 Erie Crossing', 'Teixoso', 'Castelo Branco', '65218', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Gert', 'Fearnehough', '189-060-3336', '748-038-3815', 'gfearnehough11@infoseek.co.jp', '59 Talmadge Road', 'Springfield', 'Virginia', '71219', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Lindy', 'Verbeek', '367-950-3404', '288-761-7544', 'lverbeek12@fda.gov', '81 Clemons Lane', 'Barranca', 'PA', '99698', 'Small mammal enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Zenia', 'Shearston', '858-412-7446', '800-110-0147', 'zshearston13@google.pl', '9 Carberry Center', 'Tinta', 'CA', '24120', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Kinny', 'Headan', '591-062-1958', '991-820-5244', 'kheadan14@bizjournals.com', '806 Grover Center', 'Awat', 'KT', '90690', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Bell', 'Izkovitch', '676-690-8698', '995-550-6972', 'bizkovitch15@dropbox.com', '71067 Roxbury Place', 'Sobreira', 'Vila Real', '49814', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Kathie', 'Cutbirth', '513-414-1989', '896-715-3527', 'kcutbirth16@upenn.edu', '811 Carioca Parkway', 'Zhifang', 'CA', '21842', 'Cat enthusiast');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Worthy', 'Palliser', '152-006-6120', '714-316-4304', 'wpalliser17@dedecms.com', '2015 Green Park', 'Goiás', 'MI', '59802', 'Bird owner');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Kalie', 'Campey', '888-936-6770', '434-533-4560', 'kcampey18@themeforest.net', '522 Londonderry Way', 'Nancy', 'Lorraine', '76946', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Ephraim', 'Haythornthwaite', '543-949-3850', '811-403-2718', 'ehaythornthwaite19@webs.com', '53 Tomscot Trail', 'Nikopol', 'OH', '73921', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Gerladina', 'Bowmer', '447-093-2580', '752-356-4600', 'gbowmer1a@mayoclinic.com', '52 Daystar Lane', 'Doloplazy', 'PA', '59809', 'Bird owner');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Manny', 'Sandom', '043-334-3429', '262-064-8770', 'msandom1b@sphinn.com', '6048 Jay Junction', 'Ostrožská Lhota', 'PA', '11843', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Mae', 'Braine', '337-118-4805', '794-028-6912', 'mbraine1c@netscape.com', '77897 Thierer Trail', 'Shuangkou', 'PA', '54829', 'Bird owner');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Costanza', 'Forrest', '972-941-8444', '660-828-2039', 'cforrest1d@bloglovin.com', '606 Graceland Point', 'Nizhniy Novgorod', 'OH', '29380', 'Reptile lover');
insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ('Skipp', 'Swaysland', '555-438-7913', '961-025-4242', 'sswaysland0@usa.gov', '61109 Paget Circle', 'San José', 'KT', '99735', 'Reptile lover');

insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Negative experience', '2023-07-13 22:30:10', '2023-01-12 06:59:56', '2023-09-29 06:48:33', 'Hew Baulch', 46);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Disappointed', 'Positive experience', '2023-02-03 14:35:07', '2023-11-13 07:00:43', '2023-05-06 21:44:10', 'Barbara-anne Haward', 38);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Negative experience', '2023-11-13 03:51:09', '2023-01-09 14:43:05', '2023-07-05 01:18:32', 'Florence Crowley', 35);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Negative experience', '2023-11-30 08:03:40', '2023-01-21 02:40:29', '2023-11-12 12:18:21', 'Adelaide Maciocia', 34);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Neutral experience', '2022-12-01 21:45:26', '2023-10-19 07:32:23', '2023-10-24 21:12:30', 'Mechelle Blair', 7);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Neutral experience', '2023-06-23 15:59:37', '2023-04-01 09:20:43', '2023-10-29 00:23:05', 'Fern Seth', 13);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-06-26 09:03:14', '2023-11-06 14:25:38', '2023-07-09 00:11:25', 'Tobit Tivenan', 40);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Negative experience', '2023-05-30 02:20:29', '2023-03-03 06:25:40', '2023-06-04 16:54:23', 'Adolphus Prendergrast', 16);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Positive experience', '2023-04-27 09:18:53', '2023-09-04 08:31:00', '2023-08-13 13:51:37', 'Kenny Hallihan', 30);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Disappointed', 'Positive experience', '2023-09-22 12:19:24', '2023-11-16 14:24:43', '2023-07-22 23:00:18', 'Cordula Kinworthy', 18);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Neutral experience', '2023-07-22 22:11:19', '2023-05-19 03:03:32', '2023-03-27 16:44:40', 'Donella Balharrie', 30);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Positive experience', '2023-03-26 01:16:00', '2023-03-30 00:00:40', '2023-04-10 03:35:14', 'Darell Ainger', 20);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-08-26 06:01:03', '2023-07-08 16:01:44', '2023-04-28 21:48:48', 'Livy Warbrick', 13);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Neutral experience', '2023-01-12 11:10:12', '2023-07-18 12:04:26', '2023-07-29 09:32:06', 'Brenna Spikeings', 34);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Neutral experience', '2023-10-23 14:19:37', '2023-01-17 02:00:25', '2023-08-11 12:00:20', 'Krista Reveley', 6);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Negative experience', '2022-12-08 21:30:08', '2023-07-19 16:37:14', '2023-03-23 15:47:55', 'Clare Goodin', 4);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Neutral experience', '2023-07-13 01:50:02', '2022-12-11 00:24:05', '2023-02-06 03:42:16', 'Jayme Courtois', 21);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-07-07 11:28:37', '2023-06-01 07:10:24', '2023-08-12 11:15:53', 'Miles Purchase', 6);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Negative experience', '2023-01-25 03:23:38', '2023-11-04 21:37:28', '2023-10-09 08:29:26', 'Erinna Boni', 34);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Neutral experience', '2023-11-30 05:22:23', '2023-07-24 02:50:55', '2023-11-22 12:09:15', 'Farlee Ahrendsen', 42);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Neutral experience', '2023-10-01 09:04:12', '2023-09-15 21:20:14', '2023-01-26 06:43:48', 'Nisse Bradforth', 7);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Positive experience', '2023-06-02 09:37:20', '2023-06-15 02:08:39', '2023-09-28 23:58:18', 'Jabez O'' Liddy', 10);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Negative experience', '2023-09-28 21:01:15', '2023-02-26 00:43:15', '2023-10-22 15:46:23', 'Farra Mc Meekan', 6);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Disappointed', 'Negative experience', '2023-11-23 21:25:17', '2023-03-12 16:14:50', '2023-08-16 01:46:58', 'Neely Surmeyers', 48);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Neutral experience', '2023-01-02 01:05:42', '2023-01-27 14:46:37', '2023-06-07 06:15:59', 'Jessee Congreave', 6);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-10-15 00:41:26', '2023-02-24 11:53:35', '2023-07-16 13:35:27', 'Catlin Frift', 20);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Disappointed', 'Negative experience', '2023-04-14 15:49:44', '2023-07-10 19:05:28', '2023-10-18 15:14:21', 'Dewain Turmall', 31);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-06-20 09:02:33', '2023-11-28 01:31:22', '2023-03-28 06:57:25', 'Tori Giorgietto', 21);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Neutral experience', '2023-03-13 12:38:29', '2023-08-04 11:44:29', '2023-10-30 01:12:32', 'Inesita Vasilyevski', 8);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Positive experience', '2023-01-10 13:08:14', '2023-08-08 08:14:21', '2022-12-07 21:00:15', 'Stan Batrick', 3);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Negative experience', '2023-02-22 23:58:53', '2023-01-29 21:32:36', '2023-06-11 18:32:43', 'Washington Kurton', 39);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Disappointed', 'Negative experience', '2023-01-25 13:50:21', '2023-08-18 22:21:33', '2023-02-02 04:25:07', 'Frederich Gudd', 19);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-10-10 17:57:47', '2023-10-05 06:19:03', '2023-10-22 10:02:20', 'Trevor Bilofsky', 12);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Negative experience', '2023-01-26 18:31:16', '2023-01-14 19:51:47', '2023-03-02 14:34:31', 'Marley Huitson', 29);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Negative experience', '2023-02-27 17:06:12', '2023-06-03 00:58:45', '2023-09-29 20:48:34', 'Laryssa Gabbidon', 34);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Great product!', 'Positive experience', '2023-04-16 16:12:15', '2023-02-24 19:09:23', '2023-10-28 05:56:17', 'Emilee Le Gallo', 21);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Neutral experience', '2023-01-13 16:00:10', '2023-05-24 22:22:30', '2023-07-30 19:45:56', 'Randi Radbone', 40);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Negative experience', '2023-03-08 18:06:37', '2023-11-26 17:18:32', '2023-09-25 03:45:24', 'Nikita Zink', 42);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Disappointed', 'Neutral experience', '2023-02-07 01:51:42', '2023-07-19 12:10:40', '2023-10-12 14:16:29', 'Julio Chisnell', 16);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Negative experience', '2023-02-24 20:52:45', '2023-06-06 21:07:40', '2023-09-09 01:08:24', 'Aida Lyle', 34);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Negative experience', '2023-06-22 10:59:02', '2023-08-10 22:56:51', '2023-07-01 06:22:01', 'Cesaro Jewster', 14);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-04-27 09:40:57', '2023-07-18 06:09:32', '2023-03-16 13:47:53', 'Morgan Ansell', 14);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-04-21 22:42:27', '2023-06-02 21:49:25', '2023-10-14 17:28:25', 'Jennica Goodsall', 23);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Negative experience', '2023-03-22 15:21:50', '2023-05-03 21:29:49', '2023-06-20 13:30:22', 'Howard Maybey', 5);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Negative experience', '2023-02-11 23:34:05', '2022-12-09 11:44:36', '2023-09-02 14:40:22', 'Georgianne Grindle', 22);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Highly recommended!', 'Positive experience', '2023-03-18 06:06:28', '2023-03-02 13:54:24', '2023-07-16 18:20:49', 'Mahala Darree', 46);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Negative experience', '2023-03-13 01:24:52', '2023-01-28 10:47:45', '2023-08-21 08:39:00', 'Aguste Roxbee', 44);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Neutral experience', '2023-05-21 17:03:33', '2023-05-15 06:08:15', '2023-09-15 13:17:00', 'Yule Bakes', 39);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Not worth it', 'Positive experience', '2022-12-16 00:57:40', '2023-06-09 18:23:03', '2023-06-26 23:15:58', 'Martin Sewley', 50);
insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('Amazing experience', 'Negative experience', '2023-01-11 09:40:20', '2022-12-24 17:30:54', '2023-08-24 07:51:34', 'Rey Latan', 22);

insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-11-10 07:49:16', 7639.21, 'Google Pay', 27);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-03-09 22:21:03', 3858.94, 'Apple Pay', 4);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-11-15 16:03:05', 6966.32, 'credit card', 21);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-03-01 17:29:45', 567.19, 'Apple Pay', 28);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-03-06 11:15:09', 9479.4, 'PayPal', 25);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-01-29 14:01:02', 5382.85, 'Google Pay', 30);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-07-20 03:11:13', 8846.45, 'Apple Pay', 17);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2022-12-07 14:29:25', 9525.92, 'PayPal', 10);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-02-07 10:42:07', 2124.86, 'Apple Pay', 49);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2022-12-11 00:08:28', 883.29, 'PayPal', 12);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-02-15 17:36:47', 9748.57, 'Google Pay', 34);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-02-16 23:22:34', 2063.75, 'Venmo', 5);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-09-18 11:49:34', 4185.3, 'Google Pay', 29);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2022-12-23 16:14:49', 4790.49, 'Apple Pay', 16);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-08-15 03:11:28', 3353.47, 'credit card', 48);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-11-29 01:34:31', 1499.91, 'Google Pay', 3);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-02-13 02:15:47', 210.14, 'Apple Pay', 22);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-10-17 21:26:26', 6189.79, 'Apple Pay', 46);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-03-23 14:40:48', 6421.09, 'credit card', 24);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-02-13 10:46:00', 7410.18, 'PayPal', 50);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-04-21 10:41:03', 1137.27, 'Google Pay', 35);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-05-03 23:48:28', 2700.21, 'Google Pay', 35);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-01-19 19:49:38', 3257.55, 'PayPal', 35);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-03-12 11:54:50', 5817.06, 'PayPal', 16);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-11-20 01:41:32', 7740.89, 'credit card', 50);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2022-12-18 01:31:45', 4255.8, 'Venmo', 43);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-04-01 07:45:00', 4723.92, 'Apple Pay', 23);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-02-24 03:31:23', 2853.45, 'Apple Pay', 49);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-03-05 20:28:03', 6353.93, 'Apple Pay', 36);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-10-14 03:11:27', 2379.25, 'Venmo', 43);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-02-22 05:47:19', 8907.25, 'PayPal', 9);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-08-16 03:37:38', 5493.26, 'Google Pay', 5);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-06-29 11:00:19', 4898.6, 'Google Pay', 31);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-09-28 09:51:09', 384.02, 'credit card', 24);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-05-05 12:40:14', 7422.68, 'PayPal', 26);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2022-12-15 19:33:51', 3579.07, 'debit card', 23);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-08-11 23:37:19', 8331.36, 'PayPal', 40);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-08-28 17:24:43', 1746.44, 'Venmo', 26);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-10-04 12:58:32', 6761.54, 'debit card', 12);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-05-24 19:51:21', 9546.84, 'Apple Pay', 47);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-05-10 05:57:07', 8822.49, 'Apple Pay', 12);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-11-20 11:01:54', 7877.11, 'PayPal', 34);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-09-20 12:43:53', 6538.75, 'Apple Pay', 11);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-02-24 06:28:54', 5491.22, 'Google Pay', 39);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-10-29 21:16:37', 845.07, 'Venmo', 29);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-09-08 04:37:10', 1019.67, 'debit card', 27);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-03-12 13:42:10', 4120.51, 'debit card', 4);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-06-29 10:34:57', 4107.03, 'Google Pay', 49);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-04-19 15:13:09', 1529.08, 'Google Pay', 12);
insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ('2023-06-23 12:20:06', 2920.68, 'credit card', 43);

insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Julio', 'Seargeant', '760-016-6417', 'jseargeant0@fema.gov', 'Fluffy Tails', 'Hongxing', 'MI', 'China', 'https://zoom.us', 197, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Gloria', 'McGavigan', '338-277-1352', 'gmcgavigan1@people.com.cn', 'Tail Waggers', 'New Orleans', 'Louisiana', 'United States', 'https://zoom.us', 88, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Quintina', 'Greeson', '457-296-5559', 'qgreeson2@rambler.ru', 'Tail Waggers', 'Fukura', 'PA', 'Japan', 'https://zoom.us', 277, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Saul', 'Stubbington', '591-642-2304', 'sstubbington3@reuters.com', 'Furry Friends', 'Aliuroba', 'PA', 'Indonesia', 'https://meet.google.com', 99, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Penny', 'Peret', '863-742-9129', 'pperet4@google.com.hk', 'Purrfect Companions', 'Cipolletti', 'MI', 'Argentina', 'https://zoom.us', 93, 'Choose us for top-quality animals and exceptional service.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Madeline', 'Brogini', '627-684-7470', 'mbrogini5@imdb.com', 'Paw Prints', 'Kalloní', 'RI', 'Greece', 'https://zoom.us', 264, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Sephira', 'Bullier', '800-273-8965', 'sbullier6@jimdo.com', 'Whisker World', 'Khudāydād Khēl', 'MI', 'Afghanistan', 'https://zoom.us', 170, 'Choose us for top-quality animals and exceptional service.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Kalvin', 'Andrini', '270-357-4650', 'kandrini7@newyorker.com', 'Feathered Friends', 'Rutul', 'MI', 'Russia', 'https://zoom.us', 214, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Sonnnie', 'Blacklidge', '859-679-3628', 'sblacklidge8@washington.edu', 'Whisker World', 'Ḏânan', 'PA', 'Djibouti', 'https://zoom.us', 204, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Dynah', 'Gannicleff', '243-124-5019', 'dgannicleff9@tinyurl.com', 'Purrfect Companions', 'Santa Cruz de Guacas', 'PA', 'Venezuela', 'https://meet.google.com', 92, 'Choose us for top-quality animals and exceptional service.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Bordie', 'Laight', '328-410-6673', 'blaighta@nps.gov', 'Furry Friends', 'Líbano', 'MI', 'Colombia', 'https://meet.google.com', 271, 'Choose us for top-quality animals and exceptional service.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Isaak', 'Matteo', '377-214-1956', 'imatteob@illinois.edu', 'Purrfect Companions', 'Santa Luzia', 'RI', 'Brazil', 'https://zoom.us', 160, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Esta', 'Howieson', '445-521-0648', 'ehowiesonc@privacy.gov.au', 'Tail Waggers', 'Longtang', 'PA', 'China', 'https://zoom.us', 40, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Allyce', 'Botterill', '361-897-2350', 'abotterilld@go.com', 'Critter Co.', 'Cañasgordas', 'MI', 'Colombia', 'https://meet.google.com', 3, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Sheff', 'Coraini', '020-052-5534', 'scorainie@webs.com', 'Paw Prints', 'Karangbungur', 'MI', 'Indonesia', 'https://zoom.us', 136, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Raul', 'Wason', '991-024-6886', 'rwasonf@cafepress.com', 'Paw Prints', 'Gorzyce', 'PA', 'Poland', 'https://meet.google.com', 142, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Jenelle', 'Armin', '047-644-0188', 'jarming@surveymonkey.com', 'Purrfect Companions', 'Tambac', 'RI', 'Philippines', 'https://zoom.us', 115, 'Choose us for top-quality animals and exceptional service.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Rosco', 'Tunno', '892-382-6186', 'rtunnoh@technorati.com', 'Purrfect Companions', 'Vizal San Pablo', 'MA', 'Philippines', 'https://zoom.us', 131, 'We provide a wide range of animals and pets for all your needs.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Christoffer', 'Rothman', '991-533-8641', 'crothmani@forbes.com', 'Purrfect Companions', 'Pshekhskaya', 'RI', 'Russia', 'https://zoom.us', 264, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Vince', 'Doughtery', '093-054-0926', 'vdoughteryj@is.gd', 'Furry Friends', 'El Paraíso', 'MA', 'Honduras', 'https://meet.google.com', 270, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Babita', 'Gutsell', '591-308-1209', 'bgutsellk@g.co', 'Critter Co.', 'Luena', 'MA', 'Angola', 'https://meet.google.com', 199, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Francoise', 'Summerfield', '755-025-9416', 'fsummerfieldl@yellowbook.com', 'Whisker World', 'Cihua', 'OH', 'China', 'https://meet.google.com', 105, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Diarmid', 'O''Hare', '659-314-8369', 'doharem@dmoz.org', 'Tail Waggers', 'København', 'Region Hovedstaden', 'Denmark', 'https://zoom.us', 273, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Frayda', 'Beauly', '681-503-8763', 'fbeaulyn@oracle.com', 'Critter Co.', 'Munggang', 'OH', 'Indonesia', 'https://zoom.us', 274, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Herman', 'Rapport', '548-509-4452', 'hrapporto@loc.gov', 'Purrfect Companions', 'Santa Rita Aplaya', 'OH', 'Philippines', 'https://zoom.us', 2, 'Choose us for top-quality animals and exceptional service.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Upton', 'Youens', '272-850-9072', 'uyouensp@virginia.edu', 'Fluffy Tails', 'Várzea', 'Viseu', 'Portugal', 'https://zoom.us', 228, 'Choose us for top-quality animals and exceptional service.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Olva', 'Lebond', '009-272-4954', 'olebondq@psu.edu', 'Pet Pals', 'Taouloukoult', 'MA', 'Morocco', 'https://zoom.us', 98, 'We provide a wide range of animals and pets for all your needs.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Rad', 'Eveleigh', '123-617-2773', 'reveleighr@cbsnews.com', 'Fluffy Tails', 'Sioux Falls', 'South Dakota', 'United States', 'https://zoom.us', 144, 'We provide a wide range of animals and pets for all your needs.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Wolfy', 'Trevna', '557-213-0693', 'wtrevnas@imgur.com', 'Purrfect Companions', 'Tacheng', 'RI', 'China', 'https://zoom.us', 22, 'We provide a wide range of animals and pets for all your needs.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Guenevere', 'Bonnor', '677-166-1257', 'gbonnort@cisco.com', 'Pawsome Pets', 'Przyborów', 'OH', 'Poland', 'https://zoom.us', 30, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Siffre', 'Dumbrell', '430-334-3103', 'sdumbrellu@cnet.com', 'Purrfect Companions', 'Puszczykowo', 'MA', 'Poland', 'https://meet.google.com', 47, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Keelia', 'Scrase', '108-020-7601', 'kscrasev@networkadvertising.org', 'Furry Friends', 'Xuetian', 'RI', 'China', 'https://zoom.us', 220, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Alastair', 'Ville', '351-192-4768', 'avillew@freewebs.com', 'Whisker World', 'Qiucun', 'OH', 'China', 'https://zoom.us', 228, 'We provide a wide range of animals and pets for all your needs.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Christel', 'Monk', '588-429-5092', 'cmonkx@reverbnation.com', 'Purrfect Companions', 'Sundsvall', 'Västernorrland', 'Sweden', 'https://zoom.us', 173, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Andy', 'Barth', '628-895-6835', 'abarthy@dion.ne.jp', 'Furry Friends', 'Raci Kulon', 'PA', 'Indonesia', 'https://zoom.us', 188, 'We provide a wide range of animals and pets for all your needs.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Raul', 'Lazell', '183-890-7314', 'rlazellz@dropbox.com', 'Furry Friends', 'Karawatu', 'MI', 'Indonesia', 'https://zoom.us', 4, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Nowell', 'Warlton', '000-566-3079', 'nwarlton10@mayoclinic.com', 'Paw Prints', 'Tervel', 'MI', 'Bulgaria', 'https://zoom.us', 177, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Datha', 'McGebenay', '612-431-5778', 'dmcgebenay11@gnu.org', 'Tail Waggers', 'Lota', 'PA', 'Chile', 'https://meet.google.com', 282, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Ingaborg', 'Binnell', '703-440-4066', 'ibinnell12@google.de', 'Paw Prints', 'Burgastai', 'OH', 'China', 'https://zoom.us', 221, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Moll', 'Ackeroyd', '315-644-5169', 'mackeroyd13@t.co', 'Pawsome Pets', 'Viso', 'Viana do Castelo', 'Portugal', 'https://zoom.us', 87, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Daron', 'Lavens', '868-522-1156', 'dlavens14@businesswire.com', 'Pet Pals', 'Namboongan', 'MI', 'Philippines', 'https://zoom.us', 205, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Angil', 'MacVean', '264-085-5024', 'amacvean15@un.org', 'Purrfect Companions', 'Krajan Alastengah', 'OH', 'Indonesia', 'https://zoom.us', 148, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Rodge', 'Carratt', '020-761-0456', 'rcarratt16@ibm.com', 'Pet Pals', 'Katyr-Yurt', 'MA', 'Russia', 'https://zoom.us', 137, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Cristen', 'Trodden', '715-647-0014', 'ctrodden17@google.cn', 'Whisker World', 'Kuybyshev', 'PA', 'Russia', 'https://zoom.us', 107, 'We provide a wide range of animals and pets for all your needs.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Patric', 'Holcroft', '056-656-3094', 'pholcroft18@fotki.com', 'Pawsome Pets', 'Trbovlje', 'MI', 'Slovenia', 'https://meet.google.com', 36, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Hobard', 'Cammomile', '191-135-2466', 'hcammomile19@webs.com', 'Paw Prints', 'Alto Río Senguer', 'RI', 'Argentina', 'https://zoom.us', 296, 'Our animal/pet supplier specializes in exotic species.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Barclay', 'Heaslip', '900-427-8693', 'bheaslip1a@imageshack.us', 'Pawsome Pets', 'Jiaocun', 'PA', 'China', 'https://zoom.us', 114, 'We provide a wide range of animals and pets for all your needs.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Sadye', 'Deeson', '438-802-7326', 'sdeeson1b@friendfeed.com', 'Fluffy Tails', 'Pārūn', 'PA', 'Afghanistan', 'https://meet.google.com', 275, 'We have been supplying animals and pets for over 20 years.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Rebecka', 'Stelfax', '873-934-2945', 'rstelfax1c@infoseek.co.jp', 'Tail Waggers', 'Inayauan', 'RI', 'Philippines', 'https://zoom.us', 86, 'Our animal/pet supplier is licensed and regulated for your peace of mind.');
insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ('Dareen', 'Seel', '579-481-3481', 'dseel1d@domainmarket.com', 'Feathered Friends', 'Tanahwulan', 'MI', 'Indonesia', 'https://meet.google.com', 135, 'We have been supplying animals and pets for over 20 years.');

insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 56, 1, 1529.64, 'declining', 'friendly', 'China', 1, 41, 47);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Separate housing', 85, 1, 418.81, 'stable', 'playful', 'China', 1, 11, 3);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 0, 83, 67.82, 'declining', 'playful', 'Japan', 1, 19, 26);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Special diet', 26, 0, 960.62, 'stable', 'aggressive', 'Gambia', 1, 9, 7);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 20, 0, 609.04, 'healthy', 'friendly', 'Ukraine', 1, 22, 39);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 91, 0, 1012.1, 'healthy', 'playful', 'Bangladesh', 1, 24, 30);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 26, 1, 1108.09, 'declining', 'friendly', 'China', 0, 13, 6);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Separate housing', 41, 1, 1420.8, 'critical', 'shy', 'Indonesia', 1, 19, 19);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Special diet', 56, 1, 1289.26, 'improving', 'energetic', 'Nepal', 1, 19, 25);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 3, 0, 301.9, 'stable', 'aggressive', 'China', 1, 6, 1);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Special diet', 90, 1, 1835.72, 'improving', 'playful', 'Tanzania', 1, 14, 40);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 68, 0, 705.95, 'stable', 'friendly', 'Greece', 0, 37, 11);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 7, 1, 458.22, 'improving', 'energetic', 'Brazil', 1, 22, 27);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Separate housing', 3, 1, 1669.06, 'declining', 'friendly', 'Central African Republic', 1, 27, 20);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Separate housing', 21, 1, 479.29, 'stable', 'friendly', 'Nigeria', 1, 35, 45);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 26, 1, 1873.37, 'declining', 'shy', 'Somalia', 1, 9, 45);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Separate housing', 12, 0, 970.95, 'stable', 'shy', 'Thailand', 1, 1, 18);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 18, 1, 1794.3, 'declining', 'aggressive', 'China', 1, 37, 49);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 22, 1, 360.6, 'healthy', 'energetic', 'Peru', 1, 14, 10);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 87, 1, 156.43, 'healthy', 'shy', 'Indonesia', 1, 3, 29);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 79, 0, 1000.43, 'declining', 'aggressive', 'Philippines', 1, 49, 14);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 3, 1, 1685.72, 'stable', 'energetic', 'Poland', 1, 38, 2);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Special diet', 87, 1, 1177.93, 'improving', 'aggressive', 'South Africa', 1, 37, 48);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Special diet', 35, 1, 201.71, 'improving', 'friendly', 'Czech Republic', 1, 35, 42);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 71, 1, 1036.82, 'critical', 'shy', 'Japan', 1, 42, 2);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 16, 0, 1076.88, 'stable', 'friendly', 'Honduras', 1, 9, 46);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 92, 0, 709.57, 'critical', 'shy', 'Philippines', 1, 32, 28);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 7, 0, 174.84, 'healthy', 'shy', 'Poland', 1, 36, 2);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 9, 0, 1213.28, 'healthy', 'friendly', 'China', 1, 35, 24);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 24, 1, 549.76, 'declining', 'shy', 'Philippines', 0, 41, 17);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 71, 0, 892.07, 'healthy', 'friendly', 'Philippines', 0, 1, 2);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 93, 1, 1836.87, 'critical', 'aggressive', 'Greece', 1, 45, 18);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Special diet', 55, 0, 597.11, 'critical', 'aggressive', 'France', 1, 33, 11);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Special diet', 63, 1, 1397.27, 'declining', 'playful', 'Nigeria', 1, 14, 26);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 90, 0, 693.79, 'healthy', 'playful', 'Portugal', 1, 2, 1);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 57, 1, 1535.1, 'critical', 'energetic', 'Russia', 0, 39, 19);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Separate housing', 21, 0, 347.86, 'critical', 'friendly', 'Nicaragua', 1, 37, 46);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 30, 0, 1322.38, 'critical', 'shy', 'Portugal', 1, 11, 32);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 99, 1, 141.31, 'stable', 'playful', 'Philippines', 1, 26, 25);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 64, 1, 1322.16, 'critical', 'energetic', 'China', 1, 13, 47);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 70, 0, 1320.55, 'critical', 'aggressive', 'Ukraine', 1, 1, 28);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 9, 1, 1795.6, 'declining', 'energetic', 'Indonesia', 1, 39, 48);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 74, 0, 917.55, 'healthy', 'shy', 'Argentina', 1, 28, 20);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 26, 0, 1442.43, 'healthy', 'aggressive', 'Bosnia and Herzegovina', 1, 2, 39);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Regular exercise', 93, 0, 1783.65, 'stable', 'shy', 'Philippines', 1, 14, 39);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 66, 1, 927.2, 'improving', 'friendly', 'Estonia', 1, 32, 9);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Temperature control', 61, 1, 1345.15, 'declining', 'friendly', 'United States', 1, 42, 28);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Special diet', 30, 1, 1313.9, 'declining', 'shy', 'Greece', 1, 50, 34);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 45, 0, 414.0, 'healthy', 'aggressive', 'Portugal', 1, 24, 5);
insert into animal (specialRequirements, age, gender, price, healthStatus, behavior, origin, availability, orderID, supplierID) values ('Vaccination required', 83, 1, 1449.46, 'improving', 'aggressive', 'Philippines', 1, 26, 5);

INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Lion', 'Africa Lion', 1);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Dog', 'Beagle', 2);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Elephant', 'Asian Elephant', 3);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Cat', 'Ragdoll', 4);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Giraffe', 'Northern Giraffe', 5);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Parrot', 'Cockatoo', 6);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Tiger', 'Bengal', 7);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Fish', 'Bony Fish', 8);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Penguin', 'King Penguin', 9);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Rabbit', 'European Rabit', 10);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Kangaroo', 'Red Kangaroo', 11);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Hamster', 'Grey Dwarf', 12);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Panda', 'Giant Panda', 13);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Snake', 'Python', 14);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Cheetah', 'South African Cheetah', 15);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Guinea Pig', 'Skinny Pig', 16);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Dolphin', 'Bottlenose', 17);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Ferret', 'Siamese Ferret', 18);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Hippopotamus', 'Pygmy', 19);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Turtle', 'Tortoise', 20);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Crocodile', 'American Crocodile', 21);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Chinchilla', 'Long-tailed Chinchilla', 22);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Koala', 'Queensland Koala', 23);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Hedgehog', 'Atelerix', 24);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Zebra', 'Mountain Zebra', 25);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Bird', 'Chicken', 26);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Gorilla', 'Western Gorilla', 27);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Mouse', 'House Mouse', 28);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Rhino', 'White Rhino', 29);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Lizard', 'Komodo Dragon', 30);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Ostrich', 'Common Ostrich', 31);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Ferret', 'Blaze Ferret', 32);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Lion', 'Congo Lion', 33);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Rabbit', 'Rex Rabbit', 34);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Elephant', 'Sri Lankan Elephant', 35);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Cat', 'Birman', 36);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Cat', 'Maine Coon', 37);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Cat', 'American Shorthair', 38);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Cat', 'Siamese Cat', 39);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Dog', 'Golden Retriever', 40);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Dog', 'Husky', 41);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Dog', 'German Shepard', 42);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Dog', 'Poodle', 43);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Dog', 'Dachshund', 44);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Fish', 'Siamese Fighting Fish', 45);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Fish', 'Garfish', 46);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Tiger', 'Caspian Tiger', 47);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Fish', 'Burbot', 48);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Penguin', 'Emperor Penguin', 49);
INSERT INTO animal_type (species, subSpecies, animalID) VALUES ('Rabbit', 'Polish Rabbit', 50);