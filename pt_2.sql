CREATE DATABASE project;
USE project

-- create table statements
CREATE TABLE IF NOT EXISTS genre (
   genreID INT PRIMARY KEY NOT NULL,
   genre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS mediaType (
   mediaTypeID int PRIMARY KEY,
   type varchar(50)
);

CREATE TABLE IF NOT EXISTS media (
   mediaID int PRIMARY KEY,
   title varchar(100) NOT NULL,
   mediaType int NOT NULL,
   media int NOT NULL,
   rating int NOT NULL,
   genre int NOT NULL,
   mood int,
   FOREIGN KEY (genre)
        REFERENCES genre(genreID),
   FOREIGN KEY (mediaType)
        REFERENCES mediaType(mediaTypeID)
);

CREATE TABLE IF NOT EXISTS book (
   bookID int,
   author varchar(100) NOT NULL ,
   description varchar(2000),
   pages int NOT NULL,
   mediaID int NOT NULL,
   PRIMARY KEY (mediaID, bookID),
   FOREIGN KEY (mediaID)
         REFERENCES media(mediaID)
);


CREATE TABLE IF NOT EXISTS song (
   songID int,
   artist varchar(100) NOT NULL,
   BPM int NOT NULL,
   length int NOT NULL,
   mediaID int,
   PRIMARY KEY (mediaID, songID),
   FOREIGN KEY (mediaID)
         REFERENCES media(mediaID)
);


CREATE TABLE IF NOT EXISTS movie (
   movieID int,
   director varchar(100) NOT NULL,
   description varchar(2000),
   length int NOT NULL,
   mediaID int,
   PRIMARY KEY (mediaID, movieID),
   FOREIGN KEY (mediaID)
         REFERENCES media(mediaID)
);


CREATE TABLE IF NOT EXISTS colorScheme (
   colorSchemeID INT PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   headerColor VARCHAR(20) NOT NULL,
   textColor VARCHAR(20) NOT NULL,
   backgroundColor VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS mood (
   moodID INT PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   colorScheme INT NOT NULL,
   FOREIGN KEY (colorScheme)
       REFERENCES colorScheme(colorSchemeID)
);

CREATE TABLE IF NOT EXISTS user (
   userID INT PRIMARY KEY NOT NULL,
   name VARCHAR(100) NOT NULL,
   biography TEXT,
   email VARCHAR(100) NOT NULL,
   phoneNumber VARCHAR(20),
   mood INT NOT NULL,
   FOREIGN KEY (mood) REFERENCES mood(moodID)
);

CREATE TABLE IF NOT EXISTS review (
   reviewID int PRIMARY KEY,
   media int,
   description varchar(2000),
   rating int,
   user int,
   FOREIGN KEY (media)
       REFERENCES media(mediaID),
   FOREIGN KEY (user)
       REFERENCES user(userID)
);

CREATE TABLE IF NOT EXISTS log (
   userID INT NOT NULL,
   mediaID INT NOT NULL,
   favorite boolean,
   rating int,
   review VARCHAR(2000),
   logID int PRIMARY KEY,
   FOREIGN KEY (userID) REFERENCES user(userID),
   FOREIGN KEY (mediaID) REFERENCES media(mediaID)
);

CREATE TABLE IF NOT EXISTS journalEntry (
   journalID INT PRIMARY KEY NOT NULL,
   title VARCHAR(500) NOT NULL,
   text TEXT,
   user INT NOT NULL,
   date DATETIME,
   FOREIGN KEY (user)
       REFERENCES user(userID)
);

CREATE TABLE IF NOT EXISTS userGoal (
   goalID INT PRIMARY KEY NOT NULL,
   text TEXT,
   user INT NOT NULL,
   deadline DATE,
   FOREIGN KEY (user) REFERENCES user(userID)
);

-- insert statements
INSERT INTO colorScheme (ColorSchemeID, Name, HeaderColor, TextColor, BackgroundColor) VALUES
(1, 'Bright Day', '#FFFFFF', '#000000', '#FFFF00'),
(2, 'Deep Space', '#000033', '#FFFFFF', '#000066');


INSERT INTO mood (moodID, name, colorScheme) VALUES 
(1, 'career', 48),
(2, 'site', 5),
(3, 'various', 27),
(4, 'international', 19),
(5, 'argue', 20),
(6, 'break', 8),
(7, 'culture', 31),
(8, 'product', 34),
(9, 'open', 33),
(10, 'alone', 48),
(11, 'test', 48),
(12, 'bed', 4),
(13, 'movie', 48),
(14, 'life', 50),
(15, 'buy', 12),
(16, 'off', 19),
(17, 'television', 22),
(18, 'beat', 42),
(19, 'oil', 39),
(20, 'soon', 33),
(21, 'office', 49),
(22, 'course', 39),
(23, 'community', 41),
(24, 'per', 46),
(25, 'bed', 18),
(26, 'growth', 3),
(27, 'writer', 40),
(28, 'tree', 32),
(29, 'until', 37),
(30, 'court', 40),
(31, 'before', 16),
(32, 'happy', 31),
(33, 'talk', 30),
(34, 'democratic', 15),
(35, 'case', 23),
(36, 'throughout', 22),
(37, 'your', 16),
(38, 'available', 39),
(39, 'box', 36),
(40, 'case', 40),
(41, 'player', 19),
(42, 'Congress', 44),
(43, 'type', 12),
(44, 'impact', 49),
(45, 'on', 1),
(46, 'theory', 18),
(47, 'thank', 37),
(48, 'north', 24),
(49, 'early', 31),
(50, 'authority', 42);




INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES 
(0, 'David Nguyen', 'Adventure seeker exploring the world one step at a time.', 'acollins@example.org', '(972)961-1557x835', 8),
(1, 'Leah Meyer', 'Passionate foodie on a culinary journey.', 'wroberts@example.org', '279.275.5862x322', 40),
(2, 'Arthur Wade', 'Bookworm with a love for fiction and fantasy worlds.', 'mindyhill@example.net', '883.338.4872', 34),
(3, 'Sarah Weaver', 'Tech enthusiast exploring the latest gadgets and innovations.', 'ohernandez@example.net', '+1-727-567-8904x674', 21),
(4, 'Adam Davis', 'Fitness fanatic chasing new personal records.', 'jessefisher@example.org', '(448)595-4133x3764', 20),
(5, 'Kelsey Johnson', 'Nature lover hiking through scenic trails.', 'vchapman@example.net', '+1-941-566-5171x005', 16),
(6, 'Kelsey Dickerson', 'Aspiring artist capturing lifes beauty through art.', 'cconrad@example.com', '(307)581-5487', 5),
(7, 'Christine Porter', 'Music lover with a diverse taste in genres.', 'yquinn@example.com', '(977)882-6833', 50),
(8, 'Patrick Brewer', 'Fashionista staying ahead of the latest trends.', 'lgray@example.org', '+1-333-290-5122x7948', 25),
(9, 'Cindy Clark', 'History buff fascinated by ancient civilizations.', 'jpierce@example.com', '384-378-3051x012', 17),
(10, 'Sarah Fields', 'Animal lover advocating for pet adoption.', 'michelle44@example.org', '898.480.1108x46073', 47),
(11, 'Alan Cherry', 'Entrepreneur building dreams from the ground up.', 'james05@example.net', '001-972-934-8592x579', 16),
(12, 'Courtney Greene', 'Yoga practitioner finding zen in daily practice.', 'valdezamber@example.net', '533.373.1189x492', 41),
(13, 'Kimberly Anderson', 'Film buff with a passion for classic cinema.', 'perezstephanie@example.com', '001-392-520-6279x01754', 16),
(14, 'Brenda Davis', 'DIY enthusiast creating unique crafts and projects.', 'keith95@example.org', '570.920.1073x902', 2),
(15, 'Stephanie Chen', 'Environmental activist promoting sustainable living.', 'kenneth63@example.com', '231-771-3822x95948', 43),
(16, 'Mike Hammond', 'Fitness instructor inspiring others to lead healthier lives.', 'thomas03@example.com', '+1-726-506-2203x53535', 12),
(17, 'Thomas Arnold', 'Travel enthusiast exploring cultures around the globe.', 'michaelramos@example.net', '880.946.2311', 22),
(18, 'Chelsea Collins', 'Sports fan cheering for the home team.', 'christopher21@example.org', '(986)920-6276x66793', 26),
(19, 'Melissa Bush', 'Aspiring writer crafting stories that resonate.', 'lfernandez@example.org', '552.258.4070x35683', 38),
(20, 'Frank Chang', 'Tech-savvy gamer mastering virtual worlds.', 'vshaw@example.net', '4573348201', 31),
(21, 'Matthew Edwards', 'Art collector with an eye for creativity.', 'waltervelez@example.com', '561-581-2022x420', 38),
(22, 'Gregory Kemp', 'Parent juggling work and family with love.', 'donaldschmidt@example.org', '001-385-960-7915x8361', 23),
(23, 'Michele Copeland', 'Coffee connoisseur seeking the perfect brew.', 'mark71@example.org', '474-395-5560', 38),
(24, 'Kerry Pearson', 'Musician creating melodies that move the soul.', 'kristen81@example.com', '717.450.9591x446', 27),
(25, 'Johnathan Mccoy', 'Fitness coach empowering clients to reach their goals.', 'hernandezisaac@example.com', '(879)877-2345', 9),
(26, 'Michael Morris', 'History teacher educating minds one lesson at a time.', 'caitlin60@example.net', '001-384-233-8684x825', 18),
(27, 'Erin Brooks', 'Animal rights advocate fighting for furry friends.', 'michael35@example.com', '+1-567-749-2051x463', 20),
(28, 'Amanda Marquez', 'Entrepreneurial spirit with big dreams and determination.', 'fischercrystal@example.net', '001-560-545-9981x8599', 15),
(29, 'Amy Schultz', 'Nature photographer capturing beauty in simplicity.', 'gnolan@example.org', '551-453-7756x5200', 12),
(30, 'Amanda Andrews', 'Movie critic analyzing films with a keen eye.', 'amandajackson@example.net', '748.749.2284', 10),
(31, 'Greg Abbott', 'Craft beer enthusiast exploring unique brews.', 'mary83@example.com', '4044741638', 21),
(32, 'Holly Rice', 'Self-help guru sharing wisdom for personal growth.', 'janebrown@example.org', '(961)598-9240', 39),
(33, 'Edward Jefferson', 'Digital nomad working remotely from exotic locations.', 'kmoore@example.com', '9866340681', 9),
(34, 'Cody Moreno', 'Community activist making positive changes in society.', 'jenniferwebster@example.net', '404-245-6727x5793', 44),
(35, 'Andrew Campbell', 'Fitness blogger inspiring healthy lifestyles online.', 'andrea67@example.com', '001-509-853-6643x927', 8),
(36, 'John Reynolds', 'Vintage collector preserving history through antiques.', 'david91@example.com', '(581)648-8122x3135', 2),
(37, 'Mr. Dylan Jones MD', 'Wellness coach promoting holistic health and mindfulness.', 'mgreen@example.com', '299-693-3792', 9),
(38, 'Katherine Mcclain', 'Social media influencer sharing lifes adventures.', 'kenttina@example.net', '(397)453-4490x3430', 42),
(39, 'Andrew Morrison', 'Startup founder disrupting industries with innovation.', 'janet45@example.com', '651-531-5112', 3),
(40, 'Joseph Perez', 'Language enthusiast learning new tongues and cultures.', 'tross@example.org', '001-685-704-4201x77077', 16),
(41, 'Pamela Gonzalez', 'Finance expert helping others achieve financial freedom.', 'brentcasey@example.com', '4335947081', 20),
(42, 'Rachel Mitchell', 'Educator shaping young minds for a brighter future.', 'josephbest@example.org', '+1-990-767-9937x568', 14),
(43, 'Anthony Grimes', 'Gardening enthusiast nurturing plants and green spaces.', 'ksalinas@example.org', '001-202-706-4891x3729', 32),
(44, 'Sabrina Reeves', 'Podcast host discussing topics that matter.', 'chunt@example.com', '979-820-7365x717', 16),
(45, 'Jose Dudley', 'Minimalist embracing simplicity and mindful living.', 'michelleduncan@example.com', '9418749592', 4),
(46, 'Amy Romero', 'Dreamer with big aspirations and endless possibilities.', 'brandon59@example.org', '001-388-520-4336x842', 24),
(47, 'Kendra Lopez', 'Volunteer making a difference in the community.', 'nguyenlisa@example.com', '(653)887-3790x20800', 12),
(48, 'Jesus Barker', 'Home chef experimenting with recipes and flavors.', 'marialeach@example.net', '212.861.6837x626', 28),
(49, 'Ashley Briggs DDS', 'Interior designer creating spaces that inspire.', 'qkey@example.org', '+1-539-292-3050x94509', 28),
(50, 'Justin Anderson', 'Tech entrepreneur bridging gaps with digital solutions.', 'fullereric@example.net', '(795)510-3704x452', 29),
(51, 'Judith May', 'Film director bringing stories to life on the screen.', 'robinsonchristy@example.com', '(442)972-7904', 11),
(52, 'Kenneth Barajas', 'Fitness model motivating others with dedication.', 'leah84@example.com', '288-221-0058', 5),
(53, 'Joseph Fischer', 'Vintage fashion lover with a retro flair.', 'lwilson@example.com', '(298)832-7880x5808', 12),
(54, 'Monica Clark', 'Motivational speaker empowering audiences worldwide.', 'nbutler@example.org', '(309)294-2658x1215', 18),
(55, 'Kristine Martinez', 'Freelance writer crafting words that resonate.', 'nolandeborah@example.org', '511-389-3962x37453', 32),
(56, 'David Hall', 'Outdoor enthusiast seeking adventure in nature.', 'lterrell@example.net', '8104733481', 1),
(57, 'Joshua Hines', 'Personal trainer pushing boundaries for fitness goals.', 'ballkara@example.org', '(791)579-2749', 1),
(58, 'Bianca Woodward', 'Art curator showcasing talent and creativity.', 'david56@example.net', '001-764-820-9534x136', 39),
(59, 'Frederick Novak', 'Social justice advocate fighting for equality.', 'samanthasnyder@example.com', '(345)385-6971', 16),
(60, 'Lauren Hoover', 'Digital artist creating digital masterpieces.', 'nguyenconnie@example.org', '001-447-447-9385x25869', 48),
(61, 'Sandra Myers', 'Health coach promoting holistic wellness.', 'scottoliver@example.com', '206.541.1772x4107', 42),
(62, 'Robert Kennedy', 'Historian preserving the past for future generations.', 'barrettmichael@example.org', '357.736.3558x106', 17),
(63, 'Mark Long', 'Creative director shaping visual narratives.', 'mboone@example.net', '725-694-7850x42395', 48),
(64, 'Walter Farmer', 'Animal rescuer providing love and care to furry friends.', 'kylelee@example.net', '2337706035', 36),
(65, 'Crystal Miller', 'Political activist advocating for change.', 'ahayden@example.com', '001-719-997-1810x20689', 19),
(66, 'Trevor Nguyen', 'Music producer creating beats that move the soul.', 'jamesgonzalez@example.org', '636.776.6595x90437', 17),
(67, 'Brent Yang', 'Startup enthusiast with a vision for innovation.', 'gabrielrosario@example.com', '207.291.2419x12955', 2),
(68, 'Patrick Cox', 'Lifestyle blogger sharing insights on living well.', 'eduardorodriguez@example.net', '(634)942-0736x546', 45),
(69, 'Heidi Jordan', 'Fashion designer blending style and sustainability.', 'bobbyparker@example.net', '001-660-957-9159x29941', 37),
(70, 'Daniel Carey', 'Life coach guiding others to find their purpose.', 'dustinphillips@example.com', '001-752-805-9453', 33),
(71, 'Christopher Jackson', 'Tech blogger exploring the latest tech trends.', 'andrew40@example.com', '001-271-594-1219x04945', 40),
(72, 'Charles Powell', 'Fitness competitor pushing limits for success.', 'christinemclaughlin@example.com', '+1-417-818-4305', 45),
(73, 'Heather Simmons', 'Vintage car enthusiast restoring classic automobiles.', 'walkerdavid@example.com', '587-342-2386x2320', 46),
(74, 'Jacqueline Kaufman', 'Motivational author inspiring readers with stories.', 'collinschristine@example.net', '001-655-558-6917x615', 4),
(75, 'Andrew Ross', 'Hiking enthusiast conquering trails and peaks.', 'victoriapaul@example.net', '+1-641-473-7360x994', 23),
(76, 'Daniel Elliott', 'Gymnastics coach training athletes for success.', 'bharris@example.net', '001-287-356-2507x86541', 22),
(77, 'Troy Mills', 'Art therapist using creativity for healing.', 'rossmichael@example.org', '457-248-3416', 10),
(78, 'Frank Martinez', 'Community organizer bringing people together for causes.', 'ggordon@example.org', '+1-871-725-0617', 5),
(79, 'Michael Aguilar', 'Digital marketer driving growth and engagement.', 'logan69@example.net', '345.286.4243', 26);



INSERT INTO mediaType (mediaTypeID, type) VALUES
(1, 'Song'),
(2, 'Book'),
(3, 'Movie');


INSERT INTO genre (genreID, genre) VALUES 
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Horror'),
(5, 'Thriller'),
(6, 'Adventure'),
(7, 'Science Fiction'),
(8, 'Fantasy'),
(9, 'Romance'),
(10, 'Crime'),
(11, 'Mystery'),
(12, 'Animation'),
(13, 'Family'),
(14, 'Documentary'),
(15, 'Biography'),
(16, 'History'),
(17, 'War'),
(18, 'Musical'),
(19, 'Western'),
(20, 'Sports'),
(21, 'Pop'),
(22, 'Rock'),
(23, 'Hip Hop/Rap'),
(24, 'Country'),
(25, 'Electronic/Dance'),
(26, 'R&B/Soul'),
(27, 'Reggae'),
(28, 'Jazz'),
(29, 'Classical'),
(30, 'Indie'),
(31, 'Alternative'),
(32, 'Folk'),
(33, 'Metal'),
(34, 'Punk'),
(35, 'Blues'),
(36, 'Gospel'),
(37, 'Funk'),
(38, 'World'),
(39, 'Instrumental'),
(40, 'Experimental'),
(41, 'Fantasy'),
(42, 'Science Fiction'),
(43, 'Mystery'),
(44, 'Romance'),
(45, 'Thriller'),
(46, 'Historical Fiction'),
(47, 'Horror'),
(48, 'Adventure'),
(49, 'Literary Fiction'),
(50, 'Young Adult'),
(51, 'Non-fiction'),
(52, 'Biography/Autobiography'),
(53, 'Self-help'),
(54, 'Business/Finance'),
(55, 'Travel'),
(56, 'Poetry'),
(57, 'Humor'),
(58, 'Drama'),
(59, 'Crime'),
(60, 'Suspense');


INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES 
(41, 'Shadows in the Mist', 2, 41, 2, 41, 26),
(42, 'Whispering Wind', 2, 42, 4, 42, 54),
(43, 'Echoes of Tomorrow', 2, 43, 4, 43, 11),
(44, 'Dancing with Fire', 2, 44, 5, 44, 18),
(45, 'Midnight Serenade', 2, 45, 2, 45, 24),
(46, 'Secrets of the Heart', 2, 46, 4, 46, 47),
(47, 'Lost in Time', 2, 47, 5, 47, 33),
(48, 'Reflections in Water', 2, 48, 1, 48, 45),
(49, 'Beyond the Horizon', 2, 49, 2, 49, 36),
(50, 'Starlight Symphony', 2, 50, 1, 50, 18),
(51, 'Journey to Infinity', 2, 51, 3, 51, 34),
(52, 'Dreams of Destiny', 2, 52, 1, 52, 40),
(53, 'Enchanted Garden', 2, 53, 5, 53, 31),
(54, 'Tales of Twilight', 2, 54, 2, 54, 44),
(55, 'Whispers in the Wind', 2, 55, 4, 55, 25),
(56, 'Echoes of Eternity', 2, 56, 5, 56, 50),
(57, 'Midnight Magic', 2, 57, 3, 57, 9),
(58, 'Shattered Dreams', 2, 58, 1, 58, 12),
(59, 'Dancing with Shadows', 2, 59, 1, 59, 56),
(60, 'Secrets of the Past', 2, 60, 4, 60, 23),
(1, 'The Monkey King', 3, 1, 3, 1, 37),
(2, 'The Yellow Mile', 3, 2, 2, 2, 20),
(3, 'Silence of the Children', 3, 3, 2, 3, 51),
(4, 'The Grand Wizard', 3, 4, 5, 4, 5),
(5, 'Starlight Serenade', 3, 5, 5, 5, 21),
(6, 'Midnights Symphony', 3, 6, 4, 6, 29),
(7, 'Echoes of the Past', 3, 7, 5, 7, 25),
(8, 'Dreamscape', 3, 8, 3, 8, 15),
(9, 'Velvet Shadows', 3, 9, 5, 9, 5),
(10, 'The Phoenix Rises', 3, 10, 5, 10, 52),
(11, 'Ocean of Stars', 3, 11, 4, 11, 9),
(12, 'Chasing Shadows', 3, 12, 1, 12, 39),
(13, 'Whispers in the Dark', 3, 13, 3, 13, 54),
(14, 'The Enigma Chronicles', 3, 14, 5, 14, 52),
(15, 'Journey to Eternity', 3, 15, 5, 15, 1),
(16, 'Echoes of Destiny', 3, 16, 5, 16, 13),
(17, 'Dance of the Fallen', 3, 17, 2, 17, 56),
(18, 'Symphony of Secrets', 3, 18, 3, 18, 26),
(19, 'The Legend of Ashen Falls', 3, 19, 3, 19, 51),
(20, 'Twilight Reverie', 3, 20, 4, 20, 9),
(21, 'Starlight Symphony', 1, 21, 2, 21, 24),
(22, 'Neon Dreams', 1, 22, 2, 22, 15),
(23, 'City of Echoes', 1, 23, 3, 23, 19),
(24, 'Midnight Melodies', 1, 24, 4, 24, 19),
(25, 'Soul Serenade', 1, 25, 4, 25, 16),
(26, 'Whispers of the Heart', 1, 26, 3, 26, 18),
(27, 'Celestial Harmonies', 1, 27, 3, 27, 19),
(28, 'Electric Euphoria', 1, 28, 4, 28, 46),
(29, 'Moonlit Melancholy', 1, 29, 3, 29, 22),
(30, 'Radiant Rhythms', 1, 30, 5, 30, 48),
(31, 'Vibrant Visions', 1, 31, 4, 31, 2),
(32, 'Dreams Unfold', 1, 32, 4, 32, 57),
(33, 'Sirens Song', 1, 33, 3, 33, 48),
(34, 'Twilight Tango', 1, 34, 4, 34, 5),
(35, 'Melodic Mirage', 1, 35, 3, 35, 2),
(36, 'Echoes in the Void', 1, 36, 3, 36, 22),
(37, 'Harmony Haven', 1, 37, 3, 37, 16),
(38, 'Stardust Sonata', 1, 38, 1, 38, 12),
(39, 'Cosmic Cadence', 1, 39, 2, 39, 34),
(40, 'Aurora Anthem', 1, 40, 1, 40, 1);ß




INSERT INTO book (bookID, author, description, pages, mediaID)
VALUES 
(41, 'Anna Walters', 'The Enchanted Forest: A captivating fantasy novel filled with magic and mythical creatures.', 342, 41),
(42, 'Tiffany Hampton', 'Galactic Chronicles: An epic science fiction saga spanning across galaxies and civilizations.', 160, 42),
(43, 'Stefanie Woods', 'The Curious Case of Mr. Jenkins: A mysterious mystery novel with twists and turns at every corner.', 697, 43),
(44, 'Shelly Nelson', 'Love in Bloom: A heartwarming romance about second chances and the power of love.', 174, 44),
(45, 'Ann Parker', 'The Shadows Whisper: A thrilling thriller that keeps you on the edge of your seat until the final page.', 207, 45),
(46, 'Willie Hudson', 'Echoes of the Past: A gripping historical fiction tale set against the backdrop of a tumultuous era.', 735, 46),
(47, 'John Newman', 'Nightmare Avenue: A spine-chilling horror story that will haunt your dreams.', 653, 47),
(48, 'Nancy Jefferson', 'Quest for the Lost Artifact: An adventurous journey filled with treasure hunts and ancient mysteries.', 841, 48),
(49, 'Alicia Francis', 'The Art of Reflection: A thought-provoking literary fiction exploring lifes complexities and human nature.', 124, 49),
(50, 'Katie Kane DVM', 'Chronicles of the Chosen: A captivating young adult fantasy adventure with heroes and villains.', 714, 50),
(51, 'Manuel Brown', 'Beyond the Horizon: A non-fiction exploration of the wonders of the natural world and human discovery.', 510, 51),
(52, 'Tiffany Rodriguez', 'In the Footsteps of Greatness: A biography/autobiography celebrating inspiring individuals and their journeys.', 235, 52),
(53, 'Faith Salinas', 'The Path to Success: A self-help guide to achieving your dreams and unlocking your potential.', 426, 53),
(54, 'Lorraine Simmons', 'Wealth Beyond Measure: A business/finance book offering insights into financial prosperity and success.', 858, 54),
(55, 'Holly Cuevas', 'Wanderlust: A travel memoir recounting adventures and cultural experiences from around the globe.', 681, 55),
(56, 'Megan Gibson', 'Whispers of the Heart: A collection of poignant poetry that touches the soul.', 742, 56),
(57, 'Joseph Bonilla', 'Laugh Out Loud: A humorous novel that will have you laughing from start to finish.', 536, 57),
(58, 'Karen Aguilar', 'Tears of the Soul: A gripping drama exploring themes of love, loss, and redemption.', 911, 58),
(59, 'Madeline Jones', 'The Case of the Missing Heir: A crime novel full of suspense, mystery, and unexpected revelations.', 613, 59),
(60, 'Amber Pope', 'The Silent Witness: A suspenseful thriller with a gripping storyline and unforgettable characters.', 831, 60);



INSERT INTO song (songID, artist, BPM, length, mediaID)
VALUES 
(21, 'Lauren Hooper', 75, 275, 21),
(22, 'Raymond Michael', 135, 276, 22),
(23, 'Erin Bryant', 131, 288, 23),
(24, 'Jessica Tucker', 88, 192, 24),
(25, 'Kelly Cook', 74, 230, 25),
(26, 'Ryan Rhodes', 67, 248, 26),
(27, 'Lauren Griffith', 64, 264, 27),
(28, 'Katherine Cordova', 80, 231, 28),
(29, 'Matthew Richardson', 152, 285, 29),
(30, 'Megan Bullock', 153, 266, 30),
(31, 'Michael Dixon', 132, 275, 31),
(32, 'Courtney Pitts', 86, 219, 32),
(33, 'Kevin Gomez', 94, 253, 33),
(34, 'Ronald Castillo', 78, 284, 34),
(35, 'Stephen Watkins', 106, 239, 35),
(36, 'Patrick Stanley', 111, 292, 36),
(37, 'Morgan Tapia', 60, 211, 37),
(38, 'Bryan Ellis', 123, 285, 38),
(39, 'Steven Lucas', 105, 270, 39),
(40, 'Kimberly Lucero', 119, 265, 40);



INSERT INTO movie (movieID, director, description, length, mediaID)
VALUES 
(1, 'Jacqueline Lee', 'A thrilling action-packed film that keeps you on the edge of your seat from start to finish.', 176, 1),
(2, 'Christopher Cook', 'A hilarious comedy that will have you laughing out loud with its witty jokes and charming characters.', 175, 2),
(3, 'Pamela Martinez', 'A gripping drama that delves deep into the human experience, showcasing raw emotions and powerful storytelling.', 80, 3),
(4, 'April Bradley', 'A chilling horror movie that will send shivers down your spine and leave you checking over your shoulder.', 113, 4),
(5, 'Margaret Ramos', 'A heart-pounding thriller filled with suspense, twists, and unexpected turns that will keep you guessing.', 86, 5),
(6, 'William Young', 'An adventurous tale that takes you on a journey to uncharted lands, brimming with excitement and discovery.', 155, 6),
(7, 'Elizabeth Brewer', 'An imaginative science fiction epic that explores futuristic worlds, advanced technology, and the unknown.', 115, 7),
(8, 'Alexandra Johnson', 'A fantastical adventure set in a magical realm full of mythical creatures and enchanting wonders.', 81, 8),
(9, 'Lindsay Manning', 'A romantic story of love, passion, and heartache that captures the complexities of relationships.', 81, 9),
(10, 'Melissa Strong', 'A crime thriller that unravels mysteries, solves puzzles, and exposes the dark underbelly of society.', 103, 10),
(11, 'Amy Holmes MD', 'A mysterious film that keeps you guessing until the very end, with twists and revelations that surprise.', 176, 11),
(12, 'Pamela Glenn', 'An animated delight that brings characters to life in colorful, whimsical worlds with captivating stories.', 95, 12),
(13, 'Craig Barber', 'A heartwarming family film that entertains audiences of all ages with its charm and positive messages.', 87, 13),
(14, 'Robin Robles', 'A thought-provoking documentary that sheds light on real-world issues, events, and people.', 86, 14),
(15, 'James Roach', 'An inspiring biographical film that tells the remarkable story of a persons life and achievements.', 122, 15),
(16, 'Miss Kimberly Krause', 'A historical epic that transports viewers to pivotal moments in history, showcasing drama and heroism.', 166, 16),
(17, 'Hector Roman', 'A gripping war movie that portrays the intensity, bravery, and sacrifices of soldiers in battle.', 120, 17),
(18, 'Scott Griffin', 'A musical extravaganza filled with catchy tunes, lively choreography, and unforgettable performances.', 158, 18),
(19, 'Cynthia Allen', 'A classic Western tale of frontier justice, showdowns, and rugged landscapes.', 129, 19);


INSERT INTO log (logID, Media, description, Rating, userID,favorite) VALUES
(0, 0, 'As a fan of action-packed films, I was thrilled by the intense sequences and adrenaline-pumping stunts in this movie. A must-watch for action lovers!', 1, 16, true),
(1, 1, 'This comedy had me laughing uncontrollably from start to finish. The humor was spot-on, and the comedic timing of the actors was impeccable.', 2, 11, false),
(2, 2, 'I am a huge fan of drama, and this movie delivered powerful performances that tugged at my heartstrings. A moving story beautifully portrayed.', 3, 17, true),
(3, 3, 'Horror movies are my guilty pleasure, and this one delivered the scares! I found myself jumping at every shadow long after the movie ended.', 3, 8, false),
(4, 4, 'A gripping thriller that kept me on the edge of my seat throughout. The plot twists were unexpected, and the suspense was palpable.', 2, 4, false),
(5, 5, 'An adventurous journey that took me on a thrilling ride. I felt like I was part of the action, exploring new worlds and facing danger at every turn.', 1, 11, true),
(6, 6, 'As a sci-fi enthusiast, I was blown away by the imaginative concepts and futuristic visuals in this epic. A mind-bending experience!', 5, 3, false),
(7, 7, 'Fantasy is my favorite genre, and this movie transported me to a magical realm filled with wonder and enchantment. A fantastic escape!', 1, 29, false),
(8, 8, 'A romantic story that captured the essence of love and longing. I was swept away by the chemistry between the leads and their emotional journey.', 3, 17, true),
(9, 9, 'This crime thriller had me guessing until the very end. The plot twists kept me hooked, and the suspense was relentless.', 1, 11, true),
(10, 10, 'A mysterious film that kept me intrigued from start to finish. The plot unraveled at the perfect pace, keeping me guessing until the last scene.', 3, 14, true),
(11, 11, 'An animated delight that brought out the child in me. The colorful animation and lovable characters made it a joy to watch.', 4, 4, false),
(12, 12, 'A heartwarming family film that resonated with me on a personal level. It is rare to find a movie that entertains and inspires across generations.', 5, 22, true),
(13, 13, 'This documentary shed light on important issues close to my heart. It was informative, eye-opening, and left a lasting impact.', 5, 18, false),
(14, 14, 'An inspiring biographical film that celebrated the life of a remarkable individual. Their journey was portrayed with authenticity and respect.', 5, 14, true),
(15, 15, 'A historical epic that brought a pivotal moment in history to life. The attention to detail and immersive storytelling were captivating.', 3, 15, true),
(16, 16, 'A gripping war movie that showcased the bravery and sacrifices of soldiers. It left me with a deep appreciation for their courage.', 1, 18, true),
(17, 17, 'A musical extravaganza that had me tapping my feet and humming the tunes long after the credits rolled. A delightful experience!', 4, 12, false),
(18, 18, 'A classic Western adventure that captured the essence of frontier justice and rugged landscapes. It felt like a journey back in time.', 1, 24, true),
(19, 19, 'A disappointing film that fell short of my expectations. The plot lacked depth, and the characters felt one-dimensional.', 5, 11, true),
(20, 20, 'A comedy that missed the mark with its jokes and failed to elicit more than a few chuckles. It felt like a comedy of errors.', 5, 5, false),
(21, 21, 'A catchy pop tune that gets stuck in your head and makes you want to dance. Perfect for a fun night out!', 1, 30, false),
(22, 22, 'A rock anthem with powerful guitar riffs and an infectious energy. It is hard not to headbang along to this one.', 1, 21, true),
(23, 23, 'This hip hop/rap track brings the beats and clever lyrics that keep you nodding your head. A must-listen for fans of the genre.', 1, 17, false),
(24, 24, 'A country ballad that tells a heartfelt story with soulful vocals and twangy guitars. It captures the essence of country music.', 1, 15, true),
(25, 25, 'An electronic/dance track that gets the party started with pulsating beats and electrifying synths. It is impossible not to move to this rhythm.', 3, 13, false),
(26, 26, 'Smooth R&B/soul vibes that soothe the soul and groove with soulful melodies. Perfect for a chill evening.', 4, 14, false),
(27, 27, 'Reggae rhythms that transport you to a laid-back paradise with sunny vibes and infectious positivity.', 2, 16, false),
(28, 28, 'Jazz improvisations and smooth melodies that create a sophisticated atmosphere. A treat for jazz enthusiasts.', 5, 27, true),
(29, 29, 'Classical compositions that showcase timeless beauty and orchestral grandeur. A symphony of musical excellence.', 4, 24, false),
(30, 30, 'Indie sounds that break the mold with quirky melodies and introspective lyrics. A breath of fresh air in the music scene.', 1, 10, true),
(31, 31, 'Alternative rock that explores new sonic territories with edgy guitars and raw emotions. It is rebellious and authentic.', 4, 9, true),
(32, 32, 'Folk storytelling that captures the essence of tradition and roots with acoustic melodies and heartfelt lyrics.', 4, 25, false),
(33, 33, 'Metal mayhem with thunderous drums and roaring guitars. It is intense and adrenaline-fueled.', 1, 29, false),
(34, 34, 'Punk energy that hits hard with fast-paced rhythms and rebellious attitude. It is a burst of raw power.', 1, 19, false),
(35, 35, 'Blues soulfulness that delves into the depths of emotion with soulful vocals and melancholic melodies.', 4, 14, true),
(36, 36, 'Gospel inspiration that uplifts the spirit with powerful vocals and uplifting messages. It is soul-stirring.', 3, 3, true),
(37, 37, 'Funky grooves that make you move and groove with infectious rhythms and lively instrumentation.', 3, 15, false),
(38, 38, 'World music that takes you on a global journey with diverse sounds and cultural influences. It is a celebration of musical diversity.', 5, 19, true),
(39, 39, 'Instrumental compositions that showcase musical prowess and emotive melodies. A canvas for imagination and emotion.', 1, 11, true),
(40, 40, 'Experimental sounds that push the boundaries of music with innovative techniques and unconventional styles. It is music for the adventurous.', 1, 11, false),
(41, 41, 'A captivating page-turner with twists and surprises at every chapter.', 2, 3, true),
(42, 42, 'Heartwarming characters and a compelling storyline that tugs at your emotions.', 5, 3, false),
(43, 43, 'An epic fantasy adventure with intricate world-building and rich mythology.', 2, 15, false),
(44, 44, 'A thought-provoking literary masterpiece that delves into existential themes.', 5, 1, true),
(45, 45, 'A gripping mystery that keeps you guessing until the very end.', 5, 8, false),
(46, 46, 'Historical fiction that brings the past to life with vivid detail and authenticity.', 3, 17, false),
(47, 47, 'A romantic novel that explores the complexities of love and relationships.', 2, 30, false),
(48, 48, 'A thrilling suspense novel with plot twists that keep you on the edge of your seat.', 5, 16, true),
(49, 49, 'Inspirational self-help book with practical advice for personal growth.', 4, 27, false),
(50, 50, 'A powerful memoir that shares personal experiences and life lessons.', 1, 1, true),
(51, 51, 'A humorous satire that takes a witty look at society and human behavior.', 1, 15, true),
(52, 52, 'An enlightening biography that tells the life story of a remarkable individual.', 2, 6, false),
(53, 53, 'A science fiction masterpiece that pushes the boundaries of imagination.', 1, 27, false),
(54, 54, 'A heartwarming childrens book with valuable lessons and delightful illustrations.', 1, 20, false),
(55, 55, 'A guidebook to adventure, filled with tips and tricks for exploring the great outdoors.', 5, 15, true),
(56, 56, 'A collection of poetry that evokes deep emotions and introspection.', 3, 4, true),
(57, 57, 'An educational non-fiction book that informs and enlightens readers.', 1, 27, true),
(58, 58, 'A thrilling crime novel with twists and turns in every chapter.', 5, 26, false),
(59, 59, 'A captivating young adult novel with relatable characters and coming-of-age themes.', 5, 29, false);





INSERT INTO journalEntry (journalID, title, text, user, date) VALUES
(0, 'My Reflections', 'Today was a whirlwind of emotions, from moments of joy to deep reflection.', 7, '2024-01-22 20:15:19.897855'),
(1, 'Journey of Self-Discovery', 'Waking up to a sunny day filled me with gratitude for the simple joys of life.', 25, '2024-02-09 16:44:23.427300'),
(2, 'Embracing Change', 'This week has been a rollercoaster of highs and lows, reminding me of lifes unpredictability.', 29, '2024-02-16 19:55:43.775263'),
(3, 'Moments of Joy', 'Exciting news! I received acceptance into my dream medical school, a culmination of hard work and perseverance.', 14, '2024-03-04 14:50:15.515472'),
(4, 'Navigating Lifes Path', 'Feeling a bit somber today, reflecting on past memories and the passage of time.', 18, '2024-04-18 02:11:13.823265'),
(5, 'Inspirations and Aspirations', 'Sharing the news of my acceptance into med school with friends and family brought tears of joy and pride.', 25, '2024-03-16 03:09:35.430221'),
(6, 'Whispers of the Heart', 'Looking back at old photographs, reminiscing about cherished moments and friendships.', 24, '2024-02-19 07:14:34.656737'),
(7, 'The Power of Positivity', 'Todays journal entry is a journey of self-discovery and personal growth.', 6, '2024-04-08 13:22:18.530259'),
(8, 'Embracing New Beginnings', 'Lost in thoughts about the future, dreams, and aspirations waiting to be fulfilled.', 1, '2024-02-16 09:58:54.003871'),
(9, 'Musings on Life', 'Embarking on new adventures, exploring unfamiliar paths with curiosity and excitement.', 19, '2024-02-15 04:16:42.634099'),
(10, 'Gratitude Journal', 'Writing down my dreams and aspirations, setting goals to turn them into reality.', 26, '2024-01-29 14:42:27.193959'),
(11, 'Chasing Dreams', 'The creative juices are flowing today, channeling inspiration into artistic expression.', 2, '2024-03-19 14:31:10.369135'),
(12, 'Finding Inner Peace', 'Finding inner peace amidst the chaos, a moment of stillness and tranquility.', 28, '2024-03-10 19:33:54.715179'),
(13, 'Capturing Memories', 'Exploring new horizons, stepping out of comfort zones to embrace new experiences.', 28, '2024-02-04 00:56:04.775847'),
(14, 'Lessons Learned', 'Lessons learned from past challenges, turning obstacles into opportunities for growth.', 6, '2024-03-08 08:01:28.633806'),
(15, 'Natures Beauty', 'Immersed in natures beauty, feeling connected to the earth and its wonders.', 17, '2024-03-19 23:12:45.718154'),
(16, 'Lifes Adventures', 'Capturing moments of joy and laughter, preserving memories to cherish forever.', 3, '2024-03-21 21:55:27.214093'),
(17, 'Paths Less Traveled', 'Reflecting on the path ahead, setting intentions for a purposeful journey.', 6, '2024-03-22 12:17:11.497084'),
(18, 'Dreams and Goals', 'Embracing change with an open heart and mind, welcoming new beginnings.', 25, '2024-04-09 17:52:22.888923'),
(19, 'Creative Expressions', 'Seeking inspiration from books, art, and music to fuel creativity and passion.', 29, '2024-04-02 02:07:03.891158'),
(20, 'Mysteries of Existence', 'Musings on lifes mysteries, pondering the meaning of existence and purpose.', 17, '2024-02-08 17:34:01.736428'),
(21, 'Heartfelt Moments', 'Gratitude journal entry, counting blessings and expressing appreciation for lifes blessings.', 9, '2024-03-21 05:04:16.869811'),
(22, 'Mindful Living', 'Heartfelt reflections on love, relationships, and the bonds that enrich our lives.', 14, '2024-01-05 10:03:49.573932'),
(23, 'Echoes of the Past', 'Mindful moments of meditation and introspection, finding calm in the present moment.', 5, '2024-01-31 14:57:55.110374'),
(24, 'Counting Blessings', 'A walk down memory lane, revisiting nostalgic places and cherished memories.', 25, '2024-01-07 18:05:12.472608'),
(25, 'Love and Relationships', 'The power of positivity, cultivating optimism and resilience in challenging times.', 5, '2024-01-04 19:36:52.477442'),
(26, 'Moments of Serenity', 'Stepping out of comfort zones, embracing new challenges and growth opportunities.', 16, '2024-01-18 04:46:13.836477'),
(27, 'Strength and Resilience', 'Overcoming challenges with determination and perseverance, celebrating small victories.', 20, '2024-03-28 07:23:24.150422'),
(28, 'Daily Affirmations', 'Celebrating achievements, acknowledging milestones and accomplishments with pride.', 28, '2024-01-03 07:49:41.094997'),
(29, 'Courage and Faith', 'Notes from the journey, documenting experiences and lessons learned along the way.', 2, '2024-01-03 10:58:52.823687'),
(30, 'The Creative Journey', 'Finding balance in work, life, and personal well-being, prioritizing self-care.', 7, '2024-01-23 08:36:58.523069'),
(31, 'Celebrating Life', 'The beauty of simplicity, finding joy in lifes little pleasures and moments of serenity.', 13, '2024-03-15 19:54:30.175914'),
(32, 'Overcoming Obstacles', 'Inner strength journal entry, tapping into resilience and inner resources during tough times.', 28, '2024-01-09 11:32:22.676687'),
(33, 'Notes from the Heart', 'Daily affirmations of positivity, self-love, and confidence to start the day on a high note.', 13, '2024-01-24 22:49:28.602572'),
(34, 'Finding Balance', 'Navigating uncertainty with courage and faith, trusting in the journey ahead.', 1, '2024-04-18 08:40:53.452270'),
(35, 'Simple Joys', 'Embracing creativity as a form of self-expression and exploration.', 20, '2024-03-27 00:58:43.100461'),
(36, 'Inner Strength', 'Moments of joy and laughter shared with loved ones, creating cherished memories.', 17, '2024-03-14 09:41:43.072921'),
(37, 'Positive Affirmations', 'Facing fears head-on, stepping outside comfort zones to embrace growth and courage.', 16, '2024-02-21 22:04:10.947092'),
(38, 'Courageous Steps', 'Personal growth journal entry, reflecting on progress, setbacks, and lessons learned.', 14, '2024-02-18 04:33:10.665945'),
(39, 'Growth and Evolution', 'Looking back at past experiences and milestones, acknowledging personal growth and evolution.', 7, '2024-03-28 17:08:35.420344'),
(40, 'Moments of Mindfulness', 'The art of mindfulness, practicing presence and awareness in daily life.', 7, '2024-04-03 11:11:50.996722'),
(41, 'Little Pleasures', 'Appreciating lifes little pleasures, finding happiness in everyday moments.', 1, '2024-02-19 11:45:55.813367'),
(42, 'Dream Big', 'Dreaming big and setting ambitious goals, fueled by passion and determination.', 22, '2024-03-22 20:15:13.533355'),
(43, 'Reflections on Life', 'Reflections on relationships, expressing gratitude for the people who enrich my life.', 7, '2024-04-18 06:46:15.065502'),
(44, 'Wellness Check-In', 'Wellness check-in, assessing mental, emotional, and physical well-being.', 1, '2024-03-12 20:54:24.029054'),
(45, 'Adventures in Learning', 'Adventures in learning, exploring new knowledge and expanding horizons.', 26, '2024-04-16 08:10:41.191915'),
(46, 'Building Resilience', 'Building resilience in the face of challenges, finding strength in adversity.', 19, '2024-02-19 13:46:34.211265'),
(47, 'Inspiring Others', 'Inspiring others through acts of kindness, compassion, and positive influence.', 5, '2024-02-29 22:54:40.584911'),
(48, 'A Grateful Heart', 'A grateful heart journal entry, acknowledging blessings and abundance in life.', 11, '2024-03-04 12:05:17.316471'),
(49, 'Time Capsule Notes', 'Time capsule notes, capturing thoughts, feelings, and experiences for future reflection.', 3, '2024-01-02 07:44:06.300190');



INSERT INTO userGoal (goalID, text, user, deadline) VALUES
(0, 'Read 50 books in a year.', 6, '2024-12-17'),
(1, 'Learn to play the guitar.', 29, '2025-01-17'),
(2, 'Travel to at least three new countries.', 17, '2024-06-11'),
(3, 'Start a daily meditation practice.', 7, '2025-06-19'),
(4, 'Complete a marathon.', 11, '2024-04-29'),
(5, 'Learn a new language fluently.', 29, '2025-08-05'),
(6, 'Volunteer regularly at a local charity.', 13, '2026-04-15'),
(7, 'Start a blog or YouTube channel.', 11, '2024-09-07'),
(8, 'Cook one new recipe every week.', 20, '2024-09-28'),
(9, 'Save enough money for a down payment on a house.', 30, '2024-10-21'),
(10, 'Get certified in a professional skill.', 12, '2024-08-25'),
(11, 'Write a novel.', 1, '2025-05-21'),
(12, 'Take up painting or drawing.', 10, '2025-09-04'),
(13, 'Learn to code.', 20, '2025-08-14'),
(14, 'Practice yoga regularly.', 24, '2024-04-19'),
(15, 'Start a small business.', 24, '2026-03-27'),
(16, 'Learn to cook a signature dish.', 6, '2025-07-21'),
(17, 'Get in shape and maintain a healthy lifestyle.', 14, '2025-04-22'),
(18, 'Start a garden and grow your own vegetables.', 14, '2025-12-17'),
(19, 'Volunteer for a cause youre passionate about.', 17, '2024-04-28'),
(20, 'Complete a home renovation project.', 4, '2026-01-18'),
(21, 'Learn to play a new sport.', 21, '2024-07-16'),
(22, 'Improve your public speaking skills.', 11, '2024-10-23'),
(23, 'Take up photography as a hobby.', 10, '2025-10-24'),
(24, 'Learn to knit or crochet.', 3, '2024-07-24'),
(25, 'Write and publish a childrens book.', 12, '2025-06-21'),
(26, 'Start a podcast.', 17, '2025-10-02'),
(27, 'Learn to sew and make your own clothes.', 8, '2026-02-12'),
(28, 'Learn about investing and start saving for retirement.', 23, '2025-09-17'),
(29, 'Take a solo trip.', 20, '2025-09-11'),
(30, 'Master a new technology or software.', 26, '2025-01-07'),
(31, 'Learn to dance salsa or another style.', 24, '2024-08-16'),
(32, 'Get involved in local community events.', 5, '2025-04-12'),
(33, 'Complete a DIY project.', 23, '2025-01-19'),
(34, 'Take up rock climbing or another adventurous activity.', 7, '2024-05-25'),
(35, 'Learn to play chess or another strategy game.', 25, '2024-06-14'),
(36, 'Complete a fitness challenge, like a 30-day workout program.', 16, '2025-11-25'),
(37, 'Take a course in a subject you have always been curious about.', 4, '2025-04-18'),
(38, 'Improve your time management skills.', 8, '2025-07-29'),
(39, 'Start a journaling habit.', 19, '2025-02-15'),
(40, 'Learn to play a musical instrument you have  always wanted to learn.', 26, '2026-03-13'),
(41, 'Volunteer for environmental conservation efforts.', 2, '2024-09-15'),
(42, 'Get involved in mentorship or tutoring.', 16, '2024-10-19'),
(43, 'Start a book club.', 13, '2025-06-16'),
(44, 'Learn about sustainable living practices.', 29, '2025-03-23'),
(45, 'Get involved in local politics or advocacy.', 11, '2025-06-19'),
(46, 'Improve your networking skills.', 4, '2024-11-18'),
(47, 'Learn to bake and master a signature dessert.', 23, '2025-10-29'),
(48, 'Start a daily gratitude practice.', 24, '2024-07-26'),
(49, 'Complete a personal development program.', 14, '2024-05-12');




-- /*Data for the table `mood` */
-- -- Generating color schemes
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (1, 'Olive', '#523a37', '#9588f3', '#e68750');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (2, 'MediumVioletRed', '#21e985', '#e99e10', '#9fb180');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (3, 'SkyBlue', '#60cd2a', '#998270', '#7c63d9');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (4, 'OldLace', '#bffe4e', '#a6a612', '#8f5355');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (5, 'FireBrick', '#9bfafa', '#37b2cf', '#ea12cc');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (6, 'Yellow', '#b0015b', '#b9a2f9', '#a9a647');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (7, 'Teal', '#91624c', '#241f5b', '#ac89c9');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (8, 'Orange', '#7cd811', '#caf7a9', '#8c7317');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (9, 'LightSeaGreen', '#eb0d7a', '#fad635', '#ed94ff');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (10, 'MediumSeaGreen', '#265404', '#9ec082', '#89588d');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (11, 'Teal', '#be1a85', '#397ef2', '#2486ef');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (12, 'BlanchedAlmond', '#bd9665', '#656906', '#5afd0b');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (13, 'YellowGreen', '#585968', '#21b081', '#6e6fd6');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (14, 'Brown', '#29c490', '#050eb2', '#9e75e9');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (15, 'Indigo', '#cc4812', '#776b11', '#32bc14');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (16, 'Pink', '#fa2e33', '#8cd6c9', '#bae692');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (17, 'Red', '#6dbc29', '#1ce14e', '#e2ed55');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (18, 'CornflowerBlue', '#ae2d6c', '#43354c', '#824327');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (19, 'SteelBlue', '#cde2cd', '#448857', '#f27e5b');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (20, 'SkyBlue', '#a99423', '#687e54', '#98bd8b');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (21, 'HotPink', '#28bec1', '#c137f6', '#e48602');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (22, 'GreenYellow', '#0f8072', '#e82d6e', '#a93512');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (23, 'DarkSalmon', '#780246', '#55594e', '#d146a9');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (24, 'White', '#1c33e3', '#e3068a', '#88e040');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (25, 'MediumPurple', '#d2245c', '#f6210f', '#aaf4ad');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (26, 'WhiteSmoke', '#668728', '#8fa789', '#f945bd');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (27, 'MediumSpringGreen', '#45b71e', '#42ede6', '#2759de');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (28, 'AntiqueWhite', '#aaad70', '#d47508', '#d449fd');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (29, 'LightBlue', '#72db03', '#85d4af', '#283771');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (30, 'Cornsilk', '#778315', '#4ddb19', '#199eaa');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (31, 'LightCoral', '#fa1cc4', '#09fbef', '#245392');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (32, 'White', '#e3db4a', '#42709b', '#b8ac8f');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (33, 'LightSalmon', '#6212ca', '#905d96', '#4dcbfb');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (34, 'MediumOrchid', '#2b0da2', '#d2b2f9', '#e248b3');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (35, 'Maroon', '#32ef1c', '#90b66a', '#d7e458');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (36, 'MediumSpringGreen', '#8ad696', '#17f9e3', '#40585a');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (37, 'LightCyan', '#bfc347', '#13fc6a', '#ce71f1');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (38, 'MidnightBlue', '#b46db5', '#72a3ce', '#6f4a90');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (39, 'DarkSlateGray', '#395e1d', '#8e3d2c', '#d9f103');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (40, 'CadetBlue', '#28544c', '#44a9f8', '#4f66bd');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (41, 'SteelBlue', '#c5a237', '#1547f7', '#ea190b');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (42, 'RosyBrown', '#9de518', '#b7718b', '#ad6197');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (43, 'Plum', '#e696d4', '#5464aa', '#fa4861');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (44, 'DarkSeaGreen', '#78dbd7', '#dee8a0', '#e5fd5e');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (45, 'DeepPink', '#8ac490', '#7ef293', '#3f3941');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (46, 'Orchid', '#8d092e', '#8bf154', '#f7c5c9');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (47, 'OliveDrab', '#dbaed9', '#1765d6', '#08c5a2');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (48, 'OliveDrab', '#69455c', '#39c402', '#dce7f2');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (49, 'DarkSalmon', '#b8df13', '#928dfa', '#151b95');
-- INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES (50, 'DarkMagenta', '#1c98fd', '#c41296', '#080f66');

-- -- Generating moods
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (1, 'career', 48);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (2, 'site', 5);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (3, 'various', 27);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (4, 'international', 19);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (5, 'argue', 20);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (6, 'break', 8);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (7, 'culture', 31);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (8, 'product', 34);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (9, 'open', 33);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (10, 'alone', 48);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (11, 'test', 48);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (12, 'bed', 4);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (13, 'movie', 48);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (14, 'life', 50);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (15, 'buy', 12);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (16, 'off', 19);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (17, 'television', 22);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (18, 'beat', 42);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (19, 'oil', 39);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (20, 'soon', 33);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (21, 'office', 49);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (22, 'course', 39);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (23, 'community', 41);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (24, 'per', 46);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (25, 'bed', 18);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (26, 'growth', 3);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (27, 'writer', 40);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (28, 'tree', 32);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (29, 'until', 37);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (30, 'court', 40);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (31, 'before', 16);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (32, 'happy', 31);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (33, 'talk', 30);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (34, 'democratic', 15);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (35, 'case', 23);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (36, 'throughout', 22);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (37, 'your', 16);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (38, 'available', 39);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (39, 'box', 36);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (40, 'case', 40);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (41, 'player', 19);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (42, 'Congress', 44);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (43, 'type', 12);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (44, 'impact', 49);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (45, 'on', 1);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (46, 'theory', 18);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (47, 'thank', 37);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (48, 'north', 24);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (49, 'early', 31);
-- INSERT INTO mood (moodID, name, colorScheme) VALUES (50, 'authority', 42);

-- -- Generating users
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (0, 'David Nguyen', 'Adventure seeker exploring the world one step at a time.', 'acollins@example.org', '(972)961-1557x835', 8);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (1, 'Leah Meyer', 'Passionate foodie on a culinary journey.', 'wroberts@example.org', '279.275.5862x322', 40);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (2, 'Arthur Wade', 'Bookworm with a love for fiction and fantasy worlds.', 'mindyhill@example.net', '883.338.4872', 34);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (3, 'Sarah Weaver', 'Tech enthusiast exploring the latest gadgets and innovations.', 'ohernandez@example.net', '+1-727-567-8904x674', 21);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (4, 'Adam Davis', 'Fitness fanatic chasing new personal records.', 'jessefisher@example.org', '(448)595-4133x3764', 20);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (5, 'Kelsey Johnson', 'Nature lover hiking through scenic trails.', 'vchapman@example.net', '+1-941-566-5171x005', 16);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (6, 'Kelsey Dickerson', 'Aspiring artist capturing lifes beauty through art.', 'cconrad@example.com', '(307)581-5487', 5);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (7, 'Christine Porter', 'Music lover with a diverse taste in genres.', 'yquinn@example.com', '(977)882-6833', 50);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (8, 'Patrick Brewer', 'Fashionista staying ahead of the latest trends.', 'lgray@example.org', '+1-333-290-5122x7948', 25);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (9, 'Cindy Clark', 'History buff fascinated by ancient civilizations.', 'jpierce@example.com', '384-378-3051x012', 17);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (10, 'Sarah Fields', 'Animal lover advocating for pet adoption.', 'michelle44@example.org', '898.480.1108x46073', 47);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (11, 'Alan Cherry', 'Entrepreneur building dreams from the ground up.', 'james05@example.net', '001-972-934-8592x579', 16);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (12, 'Courtney Greene', 'Yoga practitioner finding zen in daily practice.', 'valdezamber@example.net', '533.373.1189x492', 41);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (13, 'Kimberly Anderson', 'Film buff with a passion for classic cinema.', 'perezstephanie@example.com', '001-392-520-6279x01754', 16);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (14, 'Brenda Davis', 'DIY enthusiast creating unique crafts and projects.', 'keith95@example.org', '570.920.1073x902', 2);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (15, 'Stephanie Chen', 'Environmental activist promoting sustainable living.', 'kenneth63@example.com', '231-771-3822x95948', 43);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (16, 'Mike Hammond', 'Fitness instructor inspiring others to lead healthier lives.', 'thomas03@example.com', '+1-726-506-2203x53535', 12);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (17, 'Thomas Arnold', 'Travel enthusiast exploring cultures around the globe.', 'michaelramos@example.net', '880.946.2311', 22);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (18, 'Chelsea Collins', 'Sports fan cheering for the home team.', 'christopher21@example.org', '(986)920-6276x66793', 26);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (19, 'Melissa Bush', 'Aspiring writer crafting stories that resonate.', 'lfernandez@example.org', '552.258.4070x35683', 38);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (20, 'Frank Chang', 'Tech-savvy gamer mastering virtual worlds.', 'vshaw@example.net', '4573348201', 31);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (21, 'Matthew Edwards', 'Art collector with an eye for creativity.', 'waltervelez@example.com', '561-581-2022x420', 38);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (22, 'Gregory Kemp', 'Parent juggling work and family with love.', 'donaldschmidt@example.org', '001-385-960-7915x8361', 23);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (23, 'Michele Copeland', 'Coffee connoisseur seeking the perfect brew.', 'mark71@example.org', '474-395-5560', 38);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (24, 'Kerry Pearson', 'Musician creating melodies that move the soul.', 'kristen81@example.com', '717.450.9591x446', 27);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (25, 'Johnathan Mccoy', 'Fitness coach empowering clients to reach their goals.', 'hernandezisaac@example.com', '(879)877-2345', 9);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (26, 'Michael Morris', 'History teacher educating minds one lesson at a time.', 'caitlin60@example.net', '001-384-233-8684x825', 18);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (27, 'Erin Brooks', 'Animal rights advocate fighting for furry friends.', 'michael35@example.com', '+1-567-749-2051x463', 20);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (28, 'Amanda Marquez', 'Entrepreneurial spirit with big dreams and determination.', 'fischercrystal@example.net', '001-560-545-9981x8599', 15);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (29, 'Amy Schultz', 'Nature photographer capturing beauty in simplicity.', 'gnolan@example.org', '551-453-7756x5200', 12);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (30, 'Amanda Andrews', 'Movie critic analyzing films with a keen eye.', 'amandajackson@example.net', '748.749.2284', 10);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (31, 'Greg Abbott', 'Craft beer enthusiast exploring unique brews.', 'mary83@example.com', '4044741638', 21);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (32, 'Holly Rice', 'Self-help guru sharing wisdom for personal growth.', 'janebrown@example.org', '(961)598-9240', 39);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (33, 'Edward Jefferson', 'Digital nomad working remotely from exotic locations.', 'kmoore@example.com', '9866340681', 9);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (34, 'Cody Moreno', 'Community activist making positive changes in society.', 'jenniferwebster@example.net', '404-245-6727x5793', 44);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (35, 'Andrew Campbell', 'Fitness blogger inspiring healthy lifestyles online.', 'andrea67@example.com', '001-509-853-6643x927', 8);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (36, 'John Reynolds', 'Vintage collector preserving history through antiques.', 'david91@example.com', '(581)648-8122x3135', 2);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (37, 'Mr. Dylan Jones MD', 'Wellness coach promoting holistic health and mindfulness.', 'mgreen@example.com', '299-693-3792', 9);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (38, 'Katherine Mcclain', 'Social media influencer sharing lifes adventures.', 'kenttina@example.net', '(397)453-4490x3430', 42);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (39, 'Andrew Morrison', 'Startup founder disrupting industries with innovation.', 'janet45@example.com', '651-531-5112', 3);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (40, 'Joseph Perez', 'Language enthusiast learning new tongues and cultures.', 'tross@example.org', '001-685-704-4201x77077', 16);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (41, 'Pamela Gonzalez', 'Finance expert helping others achieve financial freedom.', 'brentcasey@example.com', '4335947081', 20);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (42, 'Rachel Mitchell', 'Educator shaping young minds for a brighter future.', 'josephbest@example.org', '+1-990-767-9937x568', 14);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (43, 'Anthony Grimes', 'Gardening enthusiast nurturing plants and green spaces.', 'ksalinas@example.org', '001-202-706-4891x3729', 32);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (44, 'Sabrina Reeves', 'Podcast host discussing topics that matter.', 'chunt@example.com', '979-820-7365x717', 16);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (45, 'Jose Dudley', 'Minimalist embracing simplicity and mindful living.', 'michelleduncan@example.com', '9418749592', 4);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (46, 'Amy Romero', 'Dreamer with big aspirations and endless possibilities.', 'brandon59@example.org', '001-388-520-4336x842', 24);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (47, 'Kendra Lopez', 'Volunteer making a difference in the community.', 'nguyenlisa@example.com', '(653)887-3790x20800', 12);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (48, 'Jesus Barker', 'Home chef experimenting with recipes and flavors.', 'marialeach@example.net', '212.861.6837x626', 28);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (49, 'Ashley Briggs DDS', 'Interior designer creating spaces that inspire.', 'qkey@example.org', '+1-539-292-3050x94509', 28);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (50, 'Justin Anderson', 'Tech entrepreneur bridging gaps with digital solutions.', 'fullereric@example.net', '(795)510-3704x452', 29);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (51, 'Judith May', 'Film director bringing stories to life on the screen.', 'robinsonchristy@example.com', '(442)972-7904', 11);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (52, 'Kenneth Barajas', 'Fitness model motivating others with dedication.', 'leah84@example.com', '288-221-0058', 5);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (53, 'Joseph Fischer', 'Vintage fashion lover with a retro flair.', 'lwilson@example.com', '(298)832-7880x5808', 12);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (54, 'Monica Clark', 'Motivational speaker empowering audiences worldwide.', 'nbutler@example.org', '(309)294-2658x1215', 18);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (55, 'Kristine Martinez', 'Freelance writer crafting words that resonate.', 'nolandeborah@example.org', '511-389-3962x37453', 32);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (56, 'David Hall', 'Outdoor enthusiast seeking adventure in nature.', 'lterrell@example.net', '8104733481', 1);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (57, 'Joshua Hines', 'Personal trainer pushing boundaries for fitness goals.', 'ballkara@example.org', '(791)579-2749', 1);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (58, 'Bianca Woodward', 'Art curator showcasing talent and creativity.', 'david56@example.net', '001-764-820-9534x136', 39);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (59, 'Frederick Novak', 'Social justice advocate fighting for equality.', 'samanthasnyder@example.com', '(345)385-6971', 16);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (60, 'Lauren Hoover', 'Digital artist creating digital masterpieces.', 'nguyenconnie@example.org', '001-447-447-9385x25869', 48);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (61, 'Sandra Myers', 'Health coach promoting holistic wellness.', 'scottoliver@example.com', '206.541.1772x4107', 42);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (62, 'Robert Kennedy', 'Historian preserving the past for future generations.', 'barrettmichael@example.org', '357.736.3558x106', 17);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (63, 'Mark Long', 'Creative director shaping visual narratives.', 'mboone@example.net', '725-694-7850x42395', 48);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (64, 'Walter Farmer', 'Animal rescuer providing love and care to furry friends.', 'kylelee@example.net', '2337706035', 36);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (65, 'Crystal Miller', 'Political activist advocating for change.', 'ahayden@example.com', '001-719-997-1810x20689', 19);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (66, 'Trevor Nguyen', 'Music producer creating beats that move the soul.', 'jamesgonzalez@example.org', '636.776.6595x90437', 17);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (67, 'Brent Yang', 'Startup enthusiast with a vision for innovation.', 'gabrielrosario@example.com', '207.291.2419x12955', 2);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (68, 'Patrick Cox', 'Lifestyle blogger sharing insights on living well.', 'eduardorodriguez@example.net', '(634)942-0736x546', 45);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (69, 'Heidi Jordan', 'Fashion designer blending style and sustainability.', 'bobbyparker@example.net', '001-660-957-9159x29941', 37);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (70, 'Daniel Carey', 'Life coach guiding others to find their purpose.', 'dustinphillips@example.com', '001-752-805-9453', 33);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (71, 'Christopher Jackson', 'Tech blogger exploring the latest tech trends.', 'andrew40@example.com', '001-271-594-1219x04945', 40);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (72, 'Charles Powell', 'Fitness competitor pushing limits for success.', 'christinemclaughlin@example.com', '+1-417-818-4305', 45);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (73, 'Heather Simmons', 'Vintage car enthusiast restoring classic automobiles.', 'walkerdavid@example.com', '587-342-2386x2320', 46);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (74, 'Jacqueline Kaufman', 'Motivational author inspiring readers with stories.', 'collinschristine@example.net', '001-655-558-6917x615', 4);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (75, 'Andrew Ross', 'Hiking enthusiast conquering trails and peaks.', 'victoriapaul@example.net', '+1-641-473-7360x994', 23);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (76, 'Daniel Elliott', 'Gymnastics coach training athletes for success.', 'bharris@example.net', '001-287-356-2507x86541', 22);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (77, 'Troy Mills', 'Art therapist using creativity for healing.', 'rossmichael@example.org', '457-248-3416', 10);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (78, 'Frank Martinez', 'Community organizer bringing people together for causes.', 'ggordon@example.org', '+1-871-725-0617', 5);
-- INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES (79, 'Michael Aguilar', 'Digital marketer driving growth and engagement.', 'logan69@example.net', '345.286.4243', 26);



-- -- Generating media types
-- INSERT INTO mediaType (mediaTypeID, type) VALUES (1, 'Song');
-- INSERT INTO mediaType (mediaTypeID, type) VALUES (2, 'Book');
-- INSERT INTO mediaType (mediaTypeID, type) VALUES (3, 'Movie');

-- -- Generating genres
-- -- 1-20 movie, 21-40 song, 41-60 is book
-- INSERT INTO genre (genreID, genre) VALUES (1, 'Action');
-- INSERT INTO genre (genreID, genre) VALUES (2, 'Comedy');
-- INSERT INTO genre (genreID, genre) VALUES (3, 'Drama');
-- INSERT INTO genre (genreID, genre) VALUES (4, 'Horror');
-- INSERT INTO genre (genreID, genre) VALUES (5, 'Thriller');
-- INSERT INTO genre (genreID, genre) VALUES (6, 'Adventure');
-- INSERT INTO genre (genreID, genre) VALUES (7, 'Science Fiction');
-- INSERT INTO genre (genreID, genre) VALUES (8, 'Fantasy');
-- INSERT INTO genre (genreID, genre) VALUES (9, 'Romance');
-- INSERT INTO genre (genreID, genre) VALUES (10, 'Crime');
-- INSERT INTO genre (genreID, genre) VALUES (11, 'Mystery');
-- INSERT INTO genre (genreID, genre) VALUES (12, 'Animation');
-- INSERT INTO genre (genreID, genre) VALUES (13, 'Family');
-- INSERT INTO genre (genreID, genre) VALUES (14, 'Documentary');
-- INSERT INTO genre (genreID, genre) VALUES (15, 'Biography');
-- INSERT INTO genre (genreID, genre) VALUES (16, 'History');
-- INSERT INTO genre (genreID, genre) VALUES (17, 'War');
-- INSERT INTO genre (genreID, genre) VALUES (18, 'Musical');
-- INSERT INTO genre (genreID, genre) VALUES (19, 'Western');
-- INSERT INTO genre (genreID, genre) VALUES (20, 'Sports');
-- INSERT INTO genre (genreID, genre) VALUES (21, 'Pop');
-- INSERT INTO genre (genreID, genre) VALUES (22, 'Rock');
-- INSERT INTO genre (genreID, genre) VALUES (23, 'Hip Hop/Rap');
-- INSERT INTO genre (genreID, genre) VALUES (24, 'Country');
-- INSERT INTO genre (genreID, genre) VALUES (25, 'Electronic/Dance');
-- INSERT INTO genre (genreID, genre) VALUES (26, 'R&B/Soul');
-- INSERT INTO genre (genreID, genre) VALUES (27, 'Reggae');
-- INSERT INTO genre (genreID, genre) VALUES (28, 'Jazz');
-- INSERT INTO genre (genreID, genre) VALUES (29, 'Classical');
-- INSERT INTO genre (genreID, genre) VALUES (30, 'Indie');
-- INSERT INTO genre (genreID, genre) VALUES (31, 'Alternative');
-- INSERT INTO genre (genreID, genre) VALUES (32, 'Folk');
-- INSERT INTO genre (genreID, genre) VALUES (33, 'Metal');
-- INSERT INTO genre (genreID, genre) VALUES (34, 'Punk');
-- INSERT INTO genre (genreID, genre) VALUES (35, 'Blues');
-- INSERT INTO genre (genreID, genre) VALUES (36, 'Gospel');
-- INSERT INTO genre (genreID, genre) VALUES (37, 'Funk');
-- INSERT INTO genre (genreID, genre) VALUES (38, 'World');
-- INSERT INTO genre (genreID, genre) VALUES (39, 'Instrumental');
-- INSERT INTO genre (genreID, genre) VALUES (40, 'Experimental');
-- INSERT INTO genre (genreID, genre) VALUES (41, 'Fantasy');
-- INSERT INTO genre (genreID, genre) VALUES (42, 'Science Fiction');
-- INSERT INTO genre (genreID, genre) VALUES (43, 'Mystery');
-- INSERT INTO genre (genreID, genre) VALUES (44, 'Romance');
-- INSERT INTO genre (genreID, genre) VALUES (45, 'Thriller');
-- INSERT INTO genre (genreID, genre) VALUES (46, 'Historical Fiction');
-- INSERT INTO genre (genreID, genre) VALUES (47, 'Horror');
-- INSERT INTO genre (genreID, genre) VALUES (48, 'Adventure');
-- INSERT INTO genre (genreID, genre) VALUES (49, 'Literary Fiction');
-- INSERT INTO genre (genreID, genre) VALUES (50, 'Young Adult');
-- INSERT INTO genre (genreID, genre) VALUES (51, 'Non-fiction');
-- INSERT INTO genre (genreID, genre) VALUES (52, 'Biography/Autobiography');
-- INSERT INTO genre (genreID, genre) VALUES (53, 'Self-help');
-- INSERT INTO genre (genreID, genre) VALUES (54, 'Business/Finance');
-- INSERT INTO genre (genreID, genre) VALUES (55, 'Travel');
-- INSERT INTO genre (genreID, genre) VALUES (56, 'Poetry');
-- INSERT INTO genre (genreID, genre) VALUES (57, 'Humor');
-- INSERT INTO genre (genreID, genre) VALUES (58, 'Drama');
-- INSERT INTO genre (genreID, genre) VALUES (59, 'Crime');
-- INSERT INTO genre (genreID, genre) VALUES (60, 'Suspense');

-- ------books
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (41, 'Shadows in the Mist', 2, 41, 2, 41, 26);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (42, 'Whispering Wind', 2, 42, 4, 42, 54);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (43, 'Echoes of Tomorrow', 2, 43, 4, 43, 11);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (44, 'Dancing with Fire', 2, 44, 5, 44, 18);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (45, 'Midnight Serenade', 2, 45, 2, 45, 24);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (46, 'Secrets of the Heart', 2, 46, 4, 46, 47);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (47, 'Lost in Time', 2, 47, 5, 47, 33);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (48, 'Reflections in Water', 2, 48, 1, 48, 45);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (49, 'Beyond the Horizon', 2, 49, 2, 49, 36);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (50, 'Starlight Symphony', 2, 50, 1, 50, 18);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (51, 'Journey to Infinity', 2, 51, 3, 51, 34);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (52, 'Dreams of Destiny', 2, 52, 1, 52, 40);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (53, 'Enchanted Garden', 2, 53, 5, 53, 31);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (54, 'Tales of Twilight', 2, 54, 2, 54, 44);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (55, 'Whispers in the Wind', 2, 55, 4, 55, 25);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (56, 'Echoes of Eternity', 2, 56, 5, 56, 50);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (57, 'Midnight Magic', 2, 57, 3, 57, 9);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (58, 'Shattered Dreams', 2, 58, 1, 58, 12);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (59, 'Dancing with Shadows', 2, 59, 1, 59, 56);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (60, 'Secrets of the Past', 2, 60, 4, 60, 23);
-- ------movies
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (1, 'The Monkey King', 3, 1, 3, 1, 37);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (2, 'The Yellow Mile', 3, 2, 2, 2, 20);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (3, 'Silence of the Children', 3, 3, 2, 3, 51);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (4, 'The Grand Wizard', 3, 4, 5, 4, 5);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (5, 'Starlight Serenade', 3, 5, 5, 5, 21);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (6, 'Midnights Symphony', 3, 6, 4, 6, 29);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (7, 'Echoes of the Past', 3, 7, 5, 7, 25);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (8, 'Dreamscape', 3, 8, 3, 8, 15);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (9, 'Velvet Shadows', 3, 9, 5, 9, 5);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (10, 'The Phoenix Rises', 3, 10, 5, 10, 52);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (11, 'Ocean of Stars', 3, 11, 4, 11, 9);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (12, 'Chasing Shadows', 3, 12, 1, 12, 39);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (13, 'Whispers in the Dark', 3, 13, 3, 13, 54);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (14, 'The Enigma Chronicles', 3, 14, 5, 14, 52);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (15, 'Journey to Eternity', 3, 15, 5, 15, 1);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (16, 'Echoes of Destiny', 3, 16, 5, 16, 13);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (17, 'Dance of the Fallen', 3, 17, 2, 17, 56);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (18, 'Symphony of Secrets', 3, 18, 3, 18, 26);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (19, 'The Legend of Ashen Falls', 3, 19, 3, 19, 51);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (20, 'Twilight Reverie', 3, 20, 4, 20, 9);
-- ------songs
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (21, 'Starlight Symphony', 1, 21, 2, 21, 24);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (22, 'Neon Dreams', 1, 22, 2, 22, 15);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (23, 'City of Echoes', 1, 23, 3, 23, 19);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (24, 'Midnight Melodies', 1, 24, 4, 24, 19);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (25, 'Soul Serenade', 1, 25, 4, 25, 16);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (26, 'Whispers of the Heart', 1, 26, 3, 26, 18);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (27, 'Celestial Harmonies', 1, 27, 3, 27, 19);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (28, 'Electric Euphoria', 1, 28, 4, 28, 46);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (29, 'Moonlit Melancholy', 1, 29, 3, 29, 22);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (30, 'Radiant Rhythms', 1, 30, 5, 30, 48);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (31, 'Vibrant Visions', 1, 31, 4, 31, 2);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (32, 'Dreams Unfold', 1, 32, 4, 32, 57);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (33, 'Sirens Song', 1, 33, 3, 33, 48);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (34, 'Twilight Tango', 1, 34, 4, 34, 5);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (35, 'Melodic Mirage', 1, 35, 3, 35, 2);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (36, 'Echoes in the Void', 1, 36, 3, 36, 22);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (37, 'Harmony Haven', 1, 37, 3, 37, 16);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (38, 'Stardust Sonata', 1, 38, 1, 38, 12);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (39, 'Cosmic Cadence', 1, 39, 2, 39, 34);
-- INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES (40, 'Aurora Anthem', 1, 40, 1, 40, 1);







-- -- Generating books
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (41, 'Anna Walters', 'The Enchanted Forest: A captivating fantasy novel filled with magic and mythical creatures.', 342, 41);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (42, 'Tiffany Hampton', 'Galactic Chronicles: An epic science fiction saga spanning across galaxies and civilizations.', 160, 42);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (43, 'Stefanie Woods', 'The Curious Case of Mr. Jenkins: A mysterious mystery novel with twists and turns at every corner.', 697, 43);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (44, 'Shelly Nelson', 'Love in Bloom: A heartwarming romance about second chances and the power of love.', 174, 44);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (45, 'Ann Parker', 'The Shadows Whisper: A thrilling thriller that keeps you on the edge of your seat until the final page.', 207, 45);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (46, 'Willie Hudson', 'Echoes of the Past: A gripping historical fiction tale set against the backdrop of a tumultuous era.', 735, 46);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (47, 'John Newman', 'Nightmare Avenue: A spine-chilling horror story that will haunt your dreams.', 653, 47);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (48, 'Nancy Jefferson', 'Quest for the Lost Artifact: An adventurous journey filled with treasure hunts and ancient mysteries.', 841, 48);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (49, 'Alicia Francis', 'The Art of Reflection: A thought-provoking literary fiction exploring lifes complexities and human nature.', 124, 49);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (50, 'Katie Kane DVM', 'Chronicles of the Chosen: A captivating young adult fantasy adventure with heroes and villains.', 714, 50);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (51, 'Manuel Brown', 'Beyond the Horizon: A non-fiction exploration of the wonders of the natural world and human discovery.', 510, 51);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (52, 'Tiffany Rodriguez', 'In the Footsteps of Greatness: A biography/autobiography celebrating inspiring individuals and their journeys.', 235, 52);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (53, 'Faith Salinas', 'The Path to Success: A self-help guide to achieving your dreams and unlocking your potential.', 426, 53);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (54, 'Lorraine Simmons', 'Wealth Beyond Measure: A business/finance book offering insights into financial prosperity and success.', 858, 54);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (55, 'Holly Cuevas', 'Wanderlust: A travel memoir recounting adventures and cultural experiences from around the globe.', 681, 55);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (56, 'Megan Gibson', 'Whispers of the Heart: A collection of poignant poetry that touches the soul.', 742, 56);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (57, 'Joseph Bonilla', 'Laugh Out Loud: A humorous novel that will have you laughing from start to finish.', 536, 57);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (58, 'Karen Aguilar', 'Tears of the Soul: A gripping drama exploring themes of love, loss, and redemption.', 911, 58);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (59, 'Madeline Jones', 'The Case of the Missing Heir: A crime novel full of suspense, mystery, and unexpected revelations.', 613, 59);
-- INSERT INTO book (bookID, author, description, pages, mediaID) VALUES (60, 'Amber Pope', 'The Silent Witness: A suspenseful thriller with a gripping storyline and unforgettable characters.', 831, 60);



-- ---songs
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (21, 'Lauren Hooper', 75, 275, 21);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (22, 'Raymond Michael', 135, 276, 22);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (23, 'Erin Bryant', 131, 288, 23);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (24, 'Jessica Tucker', 88, 192, 24);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (25, 'Kelly Cook', 74, 230, 25);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (26, 'Ryan Rhodes', 67, 248, 26);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (27, 'Lauren Griffith', 64, 264, 27);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (28, 'Katherine Cordova', 80, 231, 28);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (29, 'Matthew Richardson', 152, 285, 29);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (30, 'Megan Bullock', 153, 266, 30);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (31, 'Michael Dixon', 132, 275, 31);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (32, 'Courtney Pitts', 86, 219, 32);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (33, 'Kevin Gomez', 94, 253, 33);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (34, 'Ronald Castillo', 78, 284, 34);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (35, 'Stephen Watkins', 106, 239, 35);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (36, 'Patrick Stanley', 111, 292, 36);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (37, 'Morgan Tapia', 60, 211, 37);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (38, 'Bryan Ellis', 123, 285, 38);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (39, 'Steven Lucas', 105, 270, 39);
-- INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES (40, 'Kimberly Lucero', 119, 265, 40);


-- -- Generating movies
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (1, 'Jacqueline Lee', 'A thrilling action-packed film that keeps you on the edge of your seat from start to finish.', 176, 1);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (2, 'Christopher Cook', 'A hilarious comedy that will have you laughing out loud with its witty jokes and charming characters.', 175, 2);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (3, 'Pamela Martinez', 'A gripping drama that delves deep into the human experience, showcasing raw emotions and powerful storytelling.', 80, 3);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (4, 'April Bradley', 'A chilling horror movie that will send shivers down your spine and leave you checking over your shoulder.', 113, 4);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (5, 'Margaret Ramos', 'A heart-pounding thriller filled with suspense, twists, and unexpected turns that will keep you guessing.', 86, 5);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (6, 'William Young', 'An adventurous tale that takes you on a journey to uncharted lands, brimming with excitement and discovery.', 155, 6);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (7, 'Elizabeth Brewer', 'An imaginative science fiction epic that explores futuristic worlds, advanced technology, and the unknown.', 115, 7);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (8, 'Alexandra Johnson', 'A fantastical adventure set in a magical realm full of mythical creatures and enchanting wonders.', 81, 8);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (9, 'Lindsay Manning', 'A romantic story of love, passion, and heartache that captures the complexities of relationships.', 81, 9);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (10, 'Melissa Strong', 'A crime thriller that unravels mysteries, solves puzzles, and exposes the dark underbelly of society.', 103, 10);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (11, 'Amy Holmes MD', 'A mysterious film that keeps you guessing until the very end, with twists and revelations that surprise.', 176, 11);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (12, 'Pamela Glenn', 'An animated delight that brings characters to life in colorful, whimsical worlds with captivating stories.', 95, 12);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (13, 'Craig Barber', 'A heartwarming family film that entertains audiences of all ages with its charm and positive messages.', 87, 13);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (14, 'Robin Robles', 'A thought-provoking documentary that sheds light on real-world issues, events, and people.', 86, 14);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (15, 'James Roach', 'An inspiring biographical film that tells the remarkable story of a persons life and achievements.', 122, 15);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (16, 'Miss Kimberly Krause', 'A historical epic that transports viewers to pivotal moments in history, showcasing drama and heroism.', 166, 16);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (17, 'Hector Roman', 'A gripping war movie that portrays the intensity, bravery, and sacrifices of soldiers in battle.', 120, 17);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (18, 'Scott Griffin', 'A musical extravaganza filled with catchy tunes, lively choreography, and unforgettable performances.', 158, 18);
-- INSERT INTO movie (movieID, director, description, length, mediaID) VALUES (19, 'Cynthia Allen', 'A classic Western tale of frontier justice, showdowns, and rugged landscapes.', 129, 19);





-- --reviews
-- -- Generating reviews
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (0, 0, 'As a fan of action-packed films, I was thrilled by the intense sequences and adrenaline-pumping stunts in this movie. A must-watch for action lovers!', 1, 16);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (1, 1, 'This comedy had me laughing uncontrollably from start to finish. The humor was spot-on, and the comedic timing of the actors was impeccable.', 2, 11);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (2, 2, 'I am a huge fan of drama, and this movie delivered powerful performances that tugged at my heartstrings. A moving story beautifully portrayed.', 3, 17);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (3, 3, 'Horror movies are my guilty pleasure, and this one delivered the scares! I found myself jumping at every shadow long after the movie ended.', 3, 8);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (4, 4, 'A gripping thriller that kept me on the edge of my seat throughout. The plot twists were unexpected, and the suspense was palpable.', 2, 4);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (5, 5, 'An adventurous journey that took me on a thrilling ride. I felt like I was part of the action, exploring new worlds and facing danger at every turn.', 1, 11);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (6, 6, 'As a sci-fi enthusiast, I was blown away by the imaginative concepts and futuristic visuals in this epic. A mind-bending experience!', 5, 3);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (7, 7, 'Fantasy is my favorite genre, and this movie transported me to a magical realm filled with wonder and enchantment. A fantastic escape!', 1, 29);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (8, 8, 'A romantic story that captured the essence of love and longing. I was swept away by the chemistry between the leads and their emotional journey.', 3, 17);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (9, 9, 'This crime thriller had me guessing until the very end. The plot twists kept me hooked, and the suspense was relentless.', 1, 11);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (10, 10, 'A mysterious film that kept me intrigued from start to finish. The plot unraveled at the perfect pace, keeping me guessing until the last scene.', 3, 14);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (11, 11, 'An animated delight that brought out the child in me. The colorful animation and lovable characters made it a joy to watch.', 4, 4);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (12, 12, 'A heartwarming family film that resonated with me on a personal level. It is rare to find a movie that entertains and inspires across generations.', 5, 22);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (13, 13, 'This documentary shed light on important issues close to my heart. It was informative, eye-opening, and left a lasting impact.', 5, 18);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (14, 14, 'An inspiring biographical film that celebrated the life of a remarkable individual. Their journey was portrayed with authenticity and respect.', 5, 14);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (15, 15, 'A historical epic that brought a pivotal moment in history to life. The attention to detail and immersive storytelling were captivating.', 3, 15);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (16, 16, 'A gripping war movie that showcased the bravery and sacrifices of soldiers. It left me with a deep appreciation for their courage.', 1, 18);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (17, 17, 'A musical extravaganza that had me tapping my feet and humming the tunes long after the credits rolled. A delightful experience!', 4, 12);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (18, 18, 'A classic Western adventure that captured the essence of frontier justice and rugged landscapes. It felt like a journey back in time.', 1, 24);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (19, 19, 'A disappointing film that fell short of my expectations. The plot lacked depth, and the characters felt one-dimensional.', 5, 11);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (20, 20, 'A comedy that missed the mark with its jokes and failed to elicit more than a few chuckles. It felt like a comedy of errors.', 5, 5);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (21, 21, 'A catchy pop tune that gets stuck in your head and makes you want to dance. Perfect for a fun night out!', 1, 30);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (22, 22, 'A rock anthem with powerful guitar riffs and an infectious energy. It is hard not to headbang along to this one.', 1, 21);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (23, 23, 'This hip hop/rap track brings the beats and clever lyrics that keep you nodding your head. A must-listen for fans of the genre.', 1, 17);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (24, 24, 'A country ballad that tells a heartfelt story with soulful vocals and twangy guitars. It captures the essence of country music.', 1, 15);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (25, 25, 'An electronic/dance track that gets the party started with pulsating beats and electrifying synths. It is impossible not to move to this rhythm.', 3, 13);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (26, 26, 'Smooth R&B/soul vibes that soothe the soul and groove with soulful melodies. Perfect for a chill evening.', 4, 14);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (27, 27, 'Reggae rhythms that transport you to a laid-back paradise with sunny vibes and infectious positivity.', 2, 16);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (28, 28, 'Jazz improvisations and smooth melodies that create a sophisticated atmosphere. A treat for jazz enthusiasts.', 5, 27);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (29, 29, 'Classical compositions that showcase timeless beauty and orchestral grandeur. A symphony of musical excellence.', 4, 24);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (30, 30, 'Indie sounds that break the mold with quirky melodies and introspective lyrics. A breath of fresh air in the music scene.', 1, 10);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (31, 31, 'Alternative rock that explores new sonic territories with edgy guitars and raw emotions. It is rebellious and authentic.', 4, 9);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (32, 32, 'Folk storytelling that captures the essence of tradition and roots with acoustic melodies and heartfelt lyrics.', 4, 25);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (33, 33, 'Metal mayhem with thunderous drums and roaring guitars. It is intense and adrenaline-fueled.', 1, 29);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (34, 34, 'Punk energy that hits hard with fast-paced rhythms and rebellious attitude. It is a burst of raw power.', 1, 19);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (35, 35, 'Blues soulfulness that delves into the depths of emotion with soulful vocals and melancholic melodies.', 4, 14);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (36, 36, 'Gospel inspiration that uplifts the spirit with powerful vocals and uplifting messages. It is soul-stirring.', 3, 3);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (37, 37, 'Funky grooves that make you move and groove with infectious rhythms and lively instrumentation.', 3, 15);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (38, 38, 'World music that takes you on a global journey with diverse sounds and cultural influences. It is a celebration of musical diversity.', 5, 19);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (39, 39, 'Instrumental compositions that showcase musical prowess and emotive melodies. A canvas for imagination and emotion.', 1, 11);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (40, 40, 'Experimental sounds that push the boundaries of music with innovative techniques and unconventional styles. It is music for the adventurous.', 1, 11);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (41, 41, 'A captivating page-turner with twists and surprises at every chapter.', 2, 3);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (42, 42, 'Heartwarming characters and a compelling storyline that tugs at your emotions.', 5, 3);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (43, 43, 'An epic fantasy adventure with intricate world-building and rich mythology.', 2, 15);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (44, 44, 'A thought-provoking literary masterpiece that delves into existential themes.', 5, 1);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (45, 45, 'A gripping mystery that keeps you guessing until the very end.', 5, 8);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (46, 46, 'Historical fiction that brings the past to life with vivid detail and authenticity.', 3, 17);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (47, 47, 'A romantic novel that explores the complexities of love and relationships.', 2, 30);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (48, 48, 'A thrilling suspense novel with plot twists that keep you on the edge of your seat.', 5, 16);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (49, 49, 'Inspirational self-help book with practical advice for personal growth.', 4, 27);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (50, 50, 'A powerful memoir that shares personal experiences and life lessons.', 1, 1);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (51, 51, 'A humorous satire that takes a witty look at society and human behavior.', 1, 15);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (52, 52, 'An enlightening biography that tells the life story of a remarkable individual.', 2, 6);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (53, 53, 'A science fiction masterpiece that pushes the boundaries of imagination.', 1, 27);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (54, 54, 'A heartwarming childrens book with valuable lessons and delightful illustrations.', 1, 20);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (55, 55, 'A guidebook to adventure, filled with tips and tricks for exploring the great outdoors.', 5, 15);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (56, 56, 'A collection of poetry that evokes deep emotions and introspection.', 3, 4);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (57, 57, 'An educational non-fiction book that informs and enlightens readers.', 1, 27);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (58, 58, 'A thrilling crime novel with twists and turns in every chapter.', 5, 26);
-- INSERT INTO log (reviewID, media, description, rating, user) VALUES (59, 59, 'A captivating young adult novel with relatable characters and coming-of-age themes.', 5, 29);

-- --generating journal entries 
-- -- Generating journal entries
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (0, 'My Reflections', 'Today was a whirlwind of emotions, from moments of joy to deep reflection.', 7, '2024-01-22 20:15:19.897855');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (1, 'Journey of Self-Discovery', 'Waking up to a sunny day filled me with gratitude for the simple joys of life.', 25, '2024-02-09 16:44:23.427300');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (2, 'Embracing Change', 'This week has been a rollercoaster of highs and lows, reminding me of lifes unpredictability.', 29, '2024-02-16 19:55:43.775263');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (3, 'Moments of Joy', 'Exciting news! I received acceptance into my dream medical school, a culmination of hard work and perseverance.', 14, '2024-03-04 14:50:15.515472');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (4, 'Navigating Lifes Path', 'Feeling a bit somber today, reflecting on past memories and the passage of time.', 18, '2024-04-18 02:11:13.823265');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (5, 'Inspirations and Aspirations', 'Sharing the news of my acceptance into med school with friends and family brought tears of joy and pride.', 25, '2024-03-16 03:09:35.430221');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (6, 'Whispers of the Heart', 'Looking back at old photographs, reminiscing about cherished moments and friendships.', 24, '2024-02-19 07:14:34.656737');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (7, 'The Power of Positivity', 'Todays journal entry is a journey of self-discovery and personal growth.', 6, '2024-04-08 13:22:18.530259');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (8, 'Embracing New Beginnings', 'Lost in thoughts about the future, dreams, and aspirations waiting to be fulfilled.', 1, '2024-02-16 09:58:54.003871');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (9, 'Musings on Life', 'Embarking on new adventures, exploring unfamiliar paths with curiosity and excitement.', 19, '2024-02-15 04:16:42.634099');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (10, 'Gratitude Journal', 'Writing down my dreams and aspirations, setting goals to turn them into reality.', 26, '2024-01-29 14:42:27.193959');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (11, 'Chasing Dreams', 'The creative juices are flowing today, channeling inspiration into artistic expression.', 2, '2024-03-19 14:31:10.369135');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (12, 'Finding Inner Peace', 'Finding inner peace amidst the chaos, a moment of stillness and tranquility.', 28, '2024-03-10 19:33:54.715179');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (13, 'Capturing Memories', 'Exploring new horizons, stepping out of comfort zones to embrace new experiences.', 28, '2024-02-04 00:56:04.775847');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (14, 'Lessons Learned', 'Lessons learned from past challenges, turning obstacles into opportunities for growth.', 6, '2024-03-08 08:01:28.633806');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (15, 'Natures Beauty', 'Immersed in natures beauty, feeling connected to the earth and its wonders.', 17, '2024-03-19 23:12:45.718154');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (16, 'Lifes Adventures', 'Capturing moments of joy and laughter, preserving memories to cherish forever.', 3, '2024-03-21 21:55:27.214093');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (17, 'Paths Less Traveled', 'Reflecting on the path ahead, setting intentions for a purposeful journey.', 6, '2024-03-22 12:17:11.497084');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (18, 'Dreams and Goals', 'Embracing change with an open heart and mind, welcoming new beginnings.', 25, '2024-04-09 17:52:22.888923');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (19, 'Creative Expressions', 'Seeking inspiration from books, art, and music to fuel creativity and passion.', 29, '2024-04-02 02:07:03.891158');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (20, 'Mysteries of Existence', 'Musings on lifes mysteries, pondering the meaning of existence and purpose.', 17, '2024-02-08 17:34:01.736428');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (21, 'Heartfelt Moments', 'Gratitude journal entry, counting blessings and expressing appreciation for lifes blessings.', 9, '2024-03-21 05:04:16.869811');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (22, 'Mindful Living', 'Heartfelt reflections on love, relationships, and the bonds that enrich our lives.', 14, '2024-01-05 10:03:49.573932');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (23, 'Echoes of the Past', 'Mindful moments of meditation and introspection, finding calm in the present moment.', 5, '2024-01-31 14:57:55.110374');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (24, 'Counting Blessings', 'A walk down memory lane, revisiting nostalgic places and cherished memories.', 25, '2024-01-07 18:05:12.472608');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (25, 'Love and Relationships', 'The power of positivity, cultivating optimism and resilience in challenging times.', 5, '2024-01-04 19:36:52.477442');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (26, 'Moments of Serenity', 'Stepping out of comfort zones, embracing new challenges and growth opportunities.', 16, '2024-01-18 04:46:13.836477');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (27, 'Strength and Resilience', 'Overcoming challenges with determination and perseverance, celebrating small victories.', 20, '2024-03-28 07:23:24.150422');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (28, 'Daily Affirmations', 'Celebrating achievements, acknowledging milestones and accomplishments with pride.', 28, '2024-01-03 07:49:41.094997');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (29, 'Courage and Faith', 'Notes from the journey, documenting experiences and lessons learned along the way.', 2, '2024-01-03 10:58:52.823687');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (30, 'The Creative Journey', 'Finding balance in work, life, and personal well-being, prioritizing self-care.', 7, '2024-01-23 08:36:58.523069');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (31, 'Celebrating Life', 'The beauty of simplicity, finding joy in lifes little pleasures and moments of serenity.', 13, '2024-03-15 19:54:30.175914');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (32, 'Overcoming Obstacles', 'Inner strength journal entry, tapping into resilience and inner resources during tough times.', 28, '2024-01-09 11:32:22.676687');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (33, 'Notes from the Heart', 'Daily affirmations of positivity, self-love, and confidence to start the day on a high note.', 13, '2024-01-24 22:49:28.602572');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (34, 'Finding Balance', 'Navigating uncertainty with courage and faith, trusting in the journey ahead.', 1, '2024-04-18 08:40:53.452270');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (35, 'Simple Joys', 'Embracing creativity as a form of self-expression and exploration.', 20, '2024-03-27 00:58:43.100461');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (36, 'Inner Strength', 'Moments of joy and laughter shared with loved ones, creating cherished memories.', 17, '2024-03-14 09:41:43.072921');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (37, 'Positive Affirmations', 'Facing fears head-on, stepping outside comfort zones to embrace growth and courage.', 16, '2024-02-21 22:04:10.947092');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (38, 'Courageous Steps', 'Personal growth journal entry, reflecting on progress, setbacks, and lessons learned.', 14, '2024-02-18 04:33:10.665945');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (39, 'Growth and Evolution', 'Looking back at past experiences and milestones, acknowledging personal growth and evolution.', 7, '2024-03-28 17:08:35.420344');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (40, 'Moments of Mindfulness', 'The art of mindfulness, practicing presence and awareness in daily life.', 7, '2024-04-03 11:11:50.996722');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (41, 'Little Pleasures', 'Appreciating lifes little pleasures, finding happiness in everyday moments.', 1, '2024-02-19 11:45:55.813367');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (42, 'Dream Big', 'Dreaming big and setting ambitious goals, fueled by passion and determination.', 22, '2024-03-22 20:15:13.533355');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (43, 'Reflections on Life', 'Reflections on relationships, expressing gratitude for the people who enrich my life.', 7, '2024-04-18 06:46:15.065502');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (44, 'Wellness Check-In', 'Wellness check-in, assessing mental, emotional, and physical well-being.', 1, '2024-03-12 20:54:24.029054');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (45, 'Adventures in Learning', 'Adventures in learning, exploring new knowledge and expanding horizons.', 26, '2024-04-16 08:10:41.191915');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (46, 'Building Resilience', 'Building resilience in the face of challenges, finding strength in adversity.', 19, '2024-02-19 13:46:34.211265');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (47, 'Inspiring Others', 'Inspiring others through acts of kindness, compassion, and positive influence.', 5, '2024-02-29 22:54:40.584911');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (48, 'A Grateful Heart', 'A grateful heart journal entry, acknowledging blessings and abundance in life.', 11, '2024-03-04 12:05:17.316471');
-- INSERT INTO journalEntry (journalID, title, text, user, date) VALUES (49, 'Time Capsule Notes', 'Time capsule notes, capturing thoughts, feelings, and experiences for future reflection.', 3, '2024-01-02 07:44:06.300190');

-- ---user goals
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (0, 'Read 50 books in a year.', 6, '2024-12-17');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (1, 'Learn to play the guitar.', 29, '2025-01-17');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (2, 'Travel to at least three new countries.', 17, '2024-06-11');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (3, 'Start a daily meditation practice.', 7, '2025-06-19');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (4, 'Complete a marathon.', 11, '2024-04-29');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (5, 'Learn a new language fluently.', 29, '2025-08-05');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (6, 'Volunteer regularly at a local charity.', 13, '2026-04-15');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (7, 'Start a blog or YouTube channel.', 11, '2024-09-07');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (8, 'Cook one new recipe every week.', 20, '2024-09-28');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (9, 'Save enough money for a down payment on a house.', 30, '2024-10-21');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (10, 'Get certified in a professional skill.', 12, '2024-08-25');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (11, 'Write a novel.', 1, '2025-05-21');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (12, 'Take up painting or drawing.', 10, '2025-09-04');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (13, 'Learn to code.', 20, '2025-08-14');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (14, 'Practice yoga regularly.', 24, '2024-04-19');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (15, 'Start a small business.', 24, '2026-03-27');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (16, 'Learn to cook a signature dish.', 6, '2025-07-21');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (17, 'Get in shape and maintain a healthy lifestyle.', 14, '2025-04-22');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (18, 'Start a garden and grow your own vegetables.', 14, '2025-12-17');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (19, 'Volunteer for a cause youre passionate about.', 17, '2024-04-28');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (20, 'Complete a home renovation project.', 4, '2026-01-18');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (21, 'Learn to play a new sport.', 21, '2024-07-16');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (22, 'Improve your public speaking skills.', 11, '2024-10-23');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (23, 'Take up photography as a hobby.', 10, '2025-10-24');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (24, 'Learn to knit or crochet.', 3, '2024-07-24');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (25, 'Write and publish a childrens book.', 12, '2025-06-21');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (26, 'Start a podcast.', 17, '2025-10-02');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (27, 'Learn to sew and make your own clothes.', 8, '2026-02-12');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (28, 'Learn about investing and start saving for retirement.', 23, '2025-09-17');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (29, 'Take a solo trip.', 20, '2025-09-11');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (30, 'Master a new technology or software.', 26, '2025-01-07');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (31, 'Learn to dance salsa or another style.', 24, '2024-08-16');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (32, 'Get involved in local community events.', 5, '2025-04-12');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (33, 'Complete a DIY project.', 23, '2025-01-19');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (34, 'Take up rock climbing or another adventurous activity.', 7, '2024-05-25');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (35, 'Learn to play chess or another strategy game.', 25, '2024-06-14');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (36, 'Complete a fitness challenge, like a 30-day workout program.', 16, '2025-11-25');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (37, 'Take a course in a subject you have always been curious about.', 4, '2025-04-18');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (38, 'Improve your time management skills.', 8, '2025-07-29');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (39, 'Start a journaling habit.', 19, '2025-02-15');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (40, 'Learn to play a musical instrument you have  always wanted to learn.', 26, '2026-03-13');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (41, 'Volunteer for environmental conservation efforts.', 2, '2024-09-15');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (42, 'Get involved in mentorship or tutoring.', 16, '2024-10-19');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (43, 'Start a book club.', 13, '2025-06-16');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (44, 'Learn about sustainable living practices.', 29, '2025-03-23');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (45, 'Get involved in local politics or advocacy.', 11, '2025-06-19');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (46, 'Improve your networking skills.', 4, '2024-11-18');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (47, 'Learn to bake and master a signature dessert.', 23, '2025-10-29');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (48, 'Start a daily gratitude practice.', 24, '2024-07-26');
-- INSERT INTO userGoal (goalID, text, user, deadline) VALUES (49, 'Complete a personal development program.', 14, '2024-05-12');
