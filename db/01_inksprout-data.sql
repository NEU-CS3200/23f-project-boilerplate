SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE inkSprout;

-- Inserting Genres

# Dumping data for table 'Genres' 

insert into Genres (genreID, genreName) values (1, 'Action');
insert into Genres (genreID, genreName) values (2, 'Comedy');
insert into Genres (genreID, genreName) values (3, 'Drama');
insert into Genres (genreID, genreName) values (4, 'Horror');
insert into Genres (genreID, genreName) values (5, 'Romance');
insert into Genres (genreID, genreName) values (6, 'Sci-Fi');
insert into Genres (genreID, genreName) values (7, 'Thriller');
insert into Genres (genreID, genreName) values (8, 'Fantasy');
insert into Genres (genreID, genreName) values (9, 'Mystery');
insert into Genres (genreID, genreName) values (10, 'Adventure');

-- Inserting into Employees

# Dumping data for table 'Employees' 

insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (1, 'Arv', 'Keeffe', '396-941-6031', 'akeeffe0@youtube.com', '288 Columbus Alley', 'Account Representative IV', 9241, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (2, 'Jamie', 'Sang', '941-475-5233', 'jsang1@narod.ru', '627 Novick Trail', 'Research Associate', 11466, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (3, 'Jacinta', 'Wadley', '759-199-9748', 'jwadley2@wsj.com', '88024 Oak Valley Plaza', 'Administrative Assistant I', 5803, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (4, 'Herta', 'Kibblewhite', '738-102-8694', 'hkibblewhite3@nhs.uk', '2231 Crescent Oaks Pass', 'Help Desk Technician', 9835, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (5, 'Emelia', 'Scottrell', '688-451-1083', 'escottrell4@google.com', '92 Summit Center', 'Software Engineer III', 5072, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (6, 'Pryce', 'Brigginshaw', '123-551-5554', 'pbrigginshaw5@tamu.edu', '991 Kropf Circle', 'Pharmacist', 11367, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (7, 'Marlene', 'Botton', '393-967-1739', 'mbotton6@dagondesign.com', '7 Schmedeman Point', 'Executive Secretary', 14991, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (8, 'Taylor', 'Sutch', '419-345-4503', 'tsutch7@cargocollective.com', '5 Old Gate Plaza', 'Executive Secretary', 6613, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (9, 'Roselin', 'Amerighi', '593-631-9897', 'ramerighi8@dot.gov', '48 Algoma Trail', 'Senior Developer', 7553, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (10, 'Minetta', 'Laurenceau', '430-798-5781', 'mlaurenceau9@wp.com', '59721 Montana Crossing', 'Office Assistant I', 12551, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (11, 'Shell', 'Lossman', '702-590-2063', 'slossmana@businessinsider.com', '64514 Macpherson Plaza', 'Associate Professor', 14929, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (12, 'Melisent', 'Dixcee', '793-427-0698', 'mdixceeb@unc.edu', '3 Pierstorff Plaza', 'Computer Systems Analyst IV', 9854, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (13, 'Terencio', 'Bonnyson', '918-269-3571', 'tbonnysonc@omniture.com', '3 Merry Hill', 'Geological Engineer', 10591, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (14, 'Peter', 'Coomber', '358-276-3150', 'pcoomberd@cocolog-nifty.com', '7501 School Place', 'Geological Engineer', 10917, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (15, 'Jaquelin', 'Hanwell', '967-938-8944', 'jhanwelle@e-recht24.de', '378 Bluejay Lane', 'Accountant I', 8408, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (16, 'Alvin', 'Lazarus', '899-873-8297', 'alazarusf@msu.edu', '180 Larry Plaza', 'VP Accounting', 13998, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (17, 'Star', 'Dionsetti', '822-166-7537', 'sdionsettig@ucla.edu', '88 Veith Place', 'Web Designer II', 8809, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (18, 'Audrey', 'Riddles', '637-943-7129', 'ariddlesh@techcrunch.com', '6 Schmedeman Parkway', 'GIS Technical Architect', 11128, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (19, 'Harlen', 'Croll', '961-236-0480', 'hcrolli@wp.com', '37 Longview Center', 'Community Outreach Specialist', 11414, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (20, 'Kearney', 'Drees', '704-141-6416', 'kdreesj@sbwire.com', '12933 Anthes Avenue', 'Paralegal', 13332, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (21, 'Mellicent', 'Quodling', '452-882-5578', 'mquodlingk@youtube.com', '5 Kim Point', 'Speech Pathologist', 10488, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (22, 'Cornell', 'Tugwell', '884-993-1534', 'ctugwelll@etsy.com', '4712 Lotheville Hill', 'Executive Secretary', 14804, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (23, 'Marika', 'Hanne', '152-259-4938', 'mhannem@woothemes.com', '65 Coolidge Parkway', 'Senior Developer', 9146, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (24, 'Valaree', 'Hubbold', '616-422-9239', 'vhubboldn@goodreads.com', '654 Fallview Parkway', 'Assistant Professor', 9110, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (25, 'Lauritz', 'Gashion', '453-601-9886', 'lgashiono@businessinsider.com', '160 Tennyson Pass', 'Senior Sales Associate', 8522, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (26, 'Elsi', 'Quare', '548-996-0332', 'equarep@mysql.com', '409 Canary Center', 'Safety Technician III', 12897, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (27, 'Pru', 'Yuille', '298-442-1759', 'pyuilleq@godaddy.com', '0725 Forest Street', 'Health Coach II', 5915, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (28, 'Dulciana', 'MacVicar', '894-251-2426', 'dmacvicarr@ask.com', '80 Katie Avenue', 'VP Marketing', 6048, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (29, 'Ari', 'Caistor', '769-192-2740', 'acaistors@e-recht24.de', '22437 Granby Center', 'Assistant Professor', 12036, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (30, 'Patrizio', 'Coke', '645-338-4841', 'pcoket@amazon.co.jp', '15 Waywood Way', 'Research Associate', 10198, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (31, 'Wally', 'Leate', '327-211-6819', 'wleateu@home.pl', '091 Steensland Road', 'VP Sales', 6566, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (32, 'Karlotta', 'Orae', '344-752-2505', 'koraev@privacy.gov.au', '04 Vermont Junction', 'Community Outreach Specialist', 5329, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (33, 'Wilfrid', 'Lawie', '371-910-9831', 'wlawiew@youku.com', '3 Jackson Court', 'Help Desk Technician', 11113, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (34, 'Geri', 'Giovannazzi', '325-407-3429', 'ggiovannazzix@pen.io', '063 Ryan Road', 'Software Engineer IV', 6415, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (35, 'Kandy', 'Berney', '769-151-5742', 'kberneyy@omniture.com', '6495 Spenser Lane', 'Senior Quality Engineer', 14668, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (36, 'Igor', 'Allright', '191-540-3616', 'iallrightz@dailymotion.com', '81 Grover Crossing', 'Nuclear Power Engineer', 11888, 0);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (37, 'Brinn', 'Stothert', '129-745-2563', 'bstothert10@netvibes.com', '43401 Schiller Point', 'Accounting Assistant IV', 10589, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (38, 'Carmencita', 'Wickman', '705-786-7263', 'cwickman11@state.gov', '999 Continental Way', 'General Manager', 5271, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (39, 'Klarrisa', 'Tudor', '472-473-3167', 'ktudor12@cargocollective.com', '2 Marcy Parkway', 'Physical Therapy Assistant', 9800, 1);
insert into Employees (empID, first_name, last_name, phone, email, address, title, salary, active) values (40, 'Maggy', 'Melato', '801-110-9452', 'mmelato13@soup.io', '248 Kingsford Drive', 'Quality Control Specialist', 9039, 1);

-- Inserting to Moderators

# Dumping data for table 'Moderators' 

insert into Moderators (empID, modName, experience) values (1, 'wpeyto0', 'Experienced in collaborating with other moderators and teams');
insert into Moderators (empID, modName, experience) values (2, 'mbalmann1', 'Proficient in monitoring and enforcing chat rules');
insert into Moderators (empID, modName, experience) values (3, 'hbatchelour2', 'Strong communication skills');
insert into Moderators (empID, modName, experience) values (4, 'tfranceschielli3', 'Experienced in handling trolls and disruptive users');
insert into Moderators (empID, modName, experience) values (5, 'abang4', 'Knowledgeable in legal and ethical considerations for moderation');
insert into Moderators (empID, modName, experience) values (6, 'kbrigham5', 'Experienced in creating and implementing moderation policies');
insert into Moderators (empID, modName, experience) values (7, 'lyurov6', 'Knowledgeable in internet safety and security protocols');
insert into Moderators (empID, modName, experience) values (8, 'rbolens7', 'Strong communication skills');
insert into Moderators (empID, modName, experience) values (9, 'acorse8', 'Experienced in crisis management and emergency response');
insert into Moderators (empID, modName, experience) values (10, 'hprestie9', 'Familiar with various moderation tools and software');
insert into Moderators (empID, modName, experience) values (11, 'ckeightleya', 'Proficient in monitoring and enforcing chat rules');
insert into Moderators (empID, modName, experience) values (12, 'fpitcaithleyb', 'Certified in moderation best practices');
insert into Moderators (empID, modName, experience) values (13, 'fchatburnc', 'Skilled in providing constructive feedback to users');
insert into Moderators (empID, modName, experience) values (14, 'jironmongerd', 'Experienced in handling sensitive information with discretion');
insert into Moderators (empID, modName, experience) values (15, 'claverocke', 'Ability to work well under pressure');
insert into Moderators (empID, modName, experience) values (16, 'renzleyf', '5 years of experience moderating online forums');
insert into Moderators (empID, modName, experience) values (17, 'wsoigneg', 'Experienced in handling large online communities');
insert into Moderators (empID, modName, experience) values (18, 'rvanyardh', 'Experienced in handling trolls and disruptive users');
insert into Moderators (empID, modName, experience) values (19, 'rcostii', 'Knowledgeable in internet safety and security protocols');
insert into Moderators (empID, modName, experience) values (20, 'awoehlerj', 'Proficient in conflict resolution and de-escalation techniques');

-- Insert into Writing_Assistants

# Dumping data for table 'Writing_Assistants' 

insert into Writing_Assistants (empID, asstName, experience) values (21, 'lstrettle0', 'Experienced editor');
insert into Writing_Assistants (empID, asstName, experience) values (22, 'ggrimmolby1', 'Novice writer');
insert into Writing_Assistants (empID, asstName, experience) values (23, 'mgerritsma2', 'Experienced editor');
insert into Writing_Assistants (empID, asstName, experience) values (24, 'mlambillion3', 'Grammar enthusiast');
insert into Writing_Assistants (empID, asstName, experience) values (25, 'strotter4', 'Editing expert');
insert into Writing_Assistants (empID, asstName, experience) values (26, 'hfaustian5', 'Experienced editor');
insert into Writing_Assistants (empID, asstName, experience) values (27, 'gbrecknell6', 'Experienced editor');
insert into Writing_Assistants (empID, asstName, experience) values (28, 'sbettlestone7', 'Novice writer');
insert into Writing_Assistants (empID, asstName, experience) values (29, 'fcuff8', 'Professional writer');
insert into Writing_Assistants (empID, asstName, experience) values (30, 'hshrimplin9', 'Novice writer');
insert into Writing_Assistants (empID, asstName, experience) values (31, 'oskocrofta', 'Professional writer');
insert into Writing_Assistants (empID, asstName, experience) values (32, 'lstorkb', 'Experienced editor');
insert into Writing_Assistants (empID, asstName, experience) values (33, 'csnellmanc', 'Novice writer');
insert into Writing_Assistants (empID, asstName, experience) values (34, 'igobeaud', 'Grammar enthusiast');
insert into Writing_Assistants (empID, asstName, experience) values (35, 'fhorseye', 'Grammar enthusiast');
insert into Writing_Assistants (empID, asstName, experience) values (36, 'lrobusf', 'Professional writer');
insert into Writing_Assistants (empID, asstName, experience) values (37, 'jridsdaleg', 'Novice writer');
insert into Writing_Assistants (empID, asstName, experience) values (38, 'bgideonh', 'Grammar enthusiast');
insert into Writing_Assistants (empID, asstName, experience) values (39, 'wtomeoi', 'Novice writer');
insert into Writing_Assistants (empID, asstName, experience) values (40, 'lmeldingj', 'Professional writer');

-- Insert into Readers
# Dumping data for table 'Readers' 

insert into Readers (userID, age, firstName, lastName, email, active) values (1, 30, 'Abbot', 'Kieran', 'akieran0@fda.gov', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (2, 78, 'Easter', 'Inkle', 'einkle1@prnewswire.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (3, 55, 'Jessa', 'Finicj', 'jfinicj2@indiegogo.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (4, 60, 'Pieter', 'Lemonby', 'plemonby3@cam.ac.uk', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (5, 45, 'Cathi', 'Howlett', 'chowlett4@washingtonpost.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (6, 59, 'Lilith', 'Gladbeck', 'lgladbeck5@mapy.cz', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (7, 56, 'Thornie', 'Hatton', 'thatton6@dell.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (8, 27, 'Sadella', 'Hall-Gough', 'shallgough7@tinypic.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (9, 78, 'Shirlee', 'Ruprich', 'sruprich8@pcworld.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (10, 60, 'Salmon', 'Skitral', 'sskitral9@domainmarket.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (11, 38, 'Maurizia', 'Arrandale', 'marrandalea@blogger.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (12, 57, 'Symon', 'Wilmott', 'swilmottb@feedburner.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (13, 63, 'Julietta', 'Bloy', 'jbloyc@wisc.edu', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (14, 43, 'Mindy', 'Dever', 'mdeverd@nyu.edu', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (15, 72, 'Betti', 'Landrick', 'blandricke@exblog.jp', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (16, 51, 'Carlota', 'Creevy', 'ccreevyf@cam.ac.uk', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (17, 34, 'Jolee', 'Garrish', 'jgarrishg@ehow.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (18, 74, 'Tildie', 'Form', 'tformh@blog.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (19, 70, 'Charil', 'Nenci', 'cnencii@slashdot.org', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (20, 23, 'Rosemary', 'Blackham', 'rblackhamj@guardian.co.uk', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (21, 45, 'Tess', 'Faucett', 'tfaucettk@google.fr', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (22, 38, 'Randy', 'Clapton', 'rclaptonl@tuttocitta.it', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (23, 50, 'Ilsa', 'Charle', 'icharlem@un.org', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (24, 26, 'Robenia', 'Huyge', 'rhuygen@ftc.gov', 0);
insert into Readers (userID, age, firstName, lastName, email, active) values (25, 73, 'Talbert', 'Tift', 'ttifto@ovh.net', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (26, 22, 'Moria', 'Pitts', 'mpittsp@msn.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (27, 63, 'Shoshana', 'Wyvill', 'swyvillq@mapquest.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (28, 30, 'Raynell', 'Machon', 'rmachonr@forbes.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (29, 69, 'Annabela', 'Rohlf', 'arohlfs@comcast.net', 0);
insert into Readers (userID, age, firstName, lastName, email, active) values (30, 51, 'Lorraine', 'Le Ball', 'lleballt@behance.net', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (31, 78, 'Ula', 'Tidmarsh', 'utidmarshu@newsvine.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (32, 60, 'Vito', 'Voce', 'vvocev@fda.gov', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (33, 61, 'Norrie', 'Barensky', 'nbarenskyw@surveymonkey.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (34, 39, 'Dom', 'Francois', 'dfrancoisx@ucla.edu', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (35, 38, 'Joni', 'Hrishanok', 'jhrishanoky@youku.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (36, 66, 'Kirby', 'Goldie', 'kgoldiez@feedburner.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (37, 22, 'Barnaby', 'Brandassi', 'bbrandassi10@bigcartel.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (38, 54, 'Feodora', 'Maffioletti', 'fmaffioletti11@bloomberg.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (39, 73, 'Maryanne', 'Toffts', 'mtoffts12@tripod.com', 1);
insert into Readers (userID, age, firstName, lastName, email, active) values (40, 43, 'Boycie', 'Ewert', 'bewert13@123-reg.co.uk', 1);

-- Insert into Post_Comments

# Dumping data for table 'Post_Comments'

insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (1, '1', '1', 'Well written piece.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (2, '2', '2', 'Interesting read.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (3, '3', '3', null, 4);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (4, '4', '4', null, 5);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (5, '5', '5', 'Well written piece.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (6, '6', '6', 'Informative content.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (7, '7', '7', 'Great article!', 8);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (8, '8', '8', 'I disagree with the author.', 9);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (9, '9', '9', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (10, '10', '10', 'Well written piece.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (11, '11', '11', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (12, '12', '12', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (13, '13', '13', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (14, '14', '14', 'Well written piece.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (15, '15', '15', null, 16);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (16, '16', '16', 'Interesting read.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (17, '17', '17', 'Great article!', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (18, '18', '18', 'Interesting read.', 19);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (19, '19', '19', null, 20);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (20, '20', '20', null, 21);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (21, '21', '21', 'Well written piece.', 22);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (22, '22', '22', null, 23);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (23, '23', '23', null, 24);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (24, '24', '24', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (25, '25', '25', null, 26);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (26, '26', '26', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (27, '27', '27', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (28, '28', '28', null, 29);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (29, '29', '29', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (30, '30', '30', 'Well written piece.', 31);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (31, '31', '31', 'Great article!', 32);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (32, '32', '32', null, 33);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (33, '33', '33', null, 34);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (34, '34', '34', 'Informative content.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (35, '35', '35', 'Well written piece.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (36, '36', '36', null, 37);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (37, '37', '37', null, 38);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (38, '38', '38', 'Interesting read.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (39, '39', '39', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (40, '40', '40', 'Well written piece.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (41, '41', '1', 'Informative content.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (42, '42', '2', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (43, '43', '3', 'Great article!', 44);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (44, '44', '4', null, 45);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (45, '45', '5', 'Interesting read.', 46);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (46, '46', '6', 'Great article!', 47);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (47, '47', '7', null, 48);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (48, '48', '8', null, 49);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (49, '49', '9', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (50, '50', '10', 'I disagree with the author.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (51, '51', '11', null, 52);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (52, '52', '12', null, 53);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (53, '53', '13', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (54, '54', '14', 'Great article!', 55);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (55, '55', '15', 'I disagree with the author.', 56);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (56, '56', '16', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (57, '57', '17', null, 58);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (58, '58', '18', 'Well written piece.', 59);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (59, '59', '19', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (60, '60', '20', 'Informative content.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (61, '61', '21', 'Informative content.', 62);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (62, '62', '22', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (63, '63', '23', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (64, '64', '24', 'Great article!', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (65, '65', '25', 'I disagree with the author.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (66, '66', '26', null, 67);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (67, '67', '27', null, 68);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (68, '68', '28', 'Well written piece.', 69);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (69, '69', '29', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (70, '70', '30', 'Informative content.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (71, '71', '31', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (72, '72', '32', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (73, '73', '33', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (74, '74', '34', 'Well written piece.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (75, '75', '35', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (76, '76', '36', null, 77);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (77, '77', '37', 'Informative content.', 78);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (78, '78', '38', 'I disagree with the author.', 79);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (79, '79', '39', null, 80);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (80, '80', '40', 'Informative content.', 81);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (81, '1', '1', 'Informative content.', 82);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (82, '2', '2', null, 83);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (83, '3', '3', null, 84);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (84, '4', '4', null, 85);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (85, '5', '5', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (86, '6', '6', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (87, '7', '7', null, 88);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (88, '8', '8', 'Informative content.', null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (89, '9', '9', 'I disagree with the author.', 90);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (90, '10', '10', 'Informative content.', 91);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (91, '11', '11', null, 92);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (92, '12', '12', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (93, '13', '13', 'Informative content.', 94);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (94, '14', '14', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (95, '15', '15', null, 96);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (96, '16', '16', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (97, '17', '17', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (98, '18', '18', null, null);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (99, '19', '19', null, 100);
insert into Post_Comments (commentID, postID, commenterID, comment, replyingTo) values (100, '20', '20', null, null);

-- Insert Content_Creators

# Dumping data for table 'Content_Creators'

insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (6, 1, 'Live', 1372.09, '1');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (7, 2, 'To be or not to be', 509.77, '2');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (8, 3, 'Live', 1739.76, '3');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (9, 4, 'Keep calm and carry on', 4389.85, '4');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (10, 5, 'Keep calm and carry on', 351.78, '5');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (11, 6, 'Keep calm and carry on', 237.38, '6');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (12, 7, 'love', 283.28, '7');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (13, 8, 'Keep calm and carry on', 2977.3, '8');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (14, 9, 'To be or not to be', 1536.75, '9');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (15, 10, 'laugh', 1183.69, '10');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (16, 11, 'To be or not to be', 600.57, '1');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (17, 12, 'Lorem ipsum dolor sit amet', 1472.2, '2');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (18, 13, 'To be or not to be', 1599.35, '3');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (19, 14, 'Lorem ipsum dolor sit amet', 890.16, '4');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (20, 15, 'The quick brown fox jumps over the lazy dog', 4293.69, '5');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (21, 16, 'that is the question', 1793.26, '6');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (22, 17, 'Lorem ipsum dolor sit amet', 4539.75, '7');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (23, 18, 'that is the question', 4400.64, '8');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (24, 19, 'The quick brown fox jumps over the lazy dog', 3060.07, '9');
insert into Content_Creators (userID, creatorID, bio, earnings, genreID) values (25, 20, 'The quick brown fox jumps over the lazy dog', 1318.93, '10');

-- Insert into Followings 

# Dumping data for table 'Followings'

INSERT INTO Followings(userID,postID) VALUES (1,39);
INSERT INTO Followings(userID,postID) VALUES (2,40);
INSERT INTO Followings(userID,postID) VALUES (3,1);
INSERT INTO Followings(userID,postID) VALUES (4,2);
INSERT INTO Followings(userID,postID) VALUES (5,3);
INSERT INTO Followings(userID,postID) VALUES (6,4);
INSERT INTO Followings(userID,postID) VALUES (7,5);
INSERT INTO Followings(userID,postID) VALUES (8,6);
INSERT INTO Followings(userID,postID) VALUES (9,7);
INSERT INTO Followings(userID,postID) VALUES (10,8);
INSERT INTO Followings(userID,postID) VALUES (11,9);
INSERT INTO Followings(userID,postID) VALUES (12,10);
INSERT INTO Followings(userID,postID) VALUES (13,11);
INSERT INTO Followings(userID,postID) VALUES (14,12);
INSERT INTO Followings(userID,postID) VALUES (15,13);
INSERT INTO Followings(userID,postID) VALUES (16,14);
INSERT INTO Followings(userID,postID) VALUES (17,15);
INSERT INTO Followings(userID,postID) VALUES (18,16);
INSERT INTO Followings(userID,postID) VALUES (19,17);
INSERT INTO Followings(userID,postID) VALUES (20,18);
INSERT INTO Followings(userID,postID) VALUES (21,19);
INSERT INTO Followings(userID,postID) VALUES (22,20);
INSERT INTO Followings(userID,postID) VALUES (23,21);
INSERT INTO Followings(userID,postID) VALUES (24,22);
INSERT INTO Followings(userID,postID) VALUES (25,23);
INSERT INTO Followings(userID,postID) VALUES (26,24);
INSERT INTO Followings(userID,postID) VALUES (27,25);
INSERT INTO Followings(userID,postID) VALUES (28,26);
INSERT INTO Followings(userID,postID) VALUES (29,27);
INSERT INTO Followings(userID,postID) VALUES (30,28);
INSERT INTO Followings(userID,postID) VALUES (31,29);
INSERT INTO Followings(userID,postID) VALUES (32,30);
INSERT INTO Followings(userID,postID) VALUES (33,31);
INSERT INTO Followings(userID,postID) VALUES (34,32);
INSERT INTO Followings(userID,postID) VALUES (35,33);
INSERT INTO Followings(userID,postID) VALUES (36,34);
INSERT INTO Followings(userID,postID) VALUES (37,35);
INSERT INTO Followings(userID,postID) VALUES (38,36);
INSERT INTO Followings(userID,postID) VALUES (39,37);
INSERT INTO Followings(userID,postID) VALUES (40,38);
INSERT INTO Followings(userID,postID) VALUES (1,3);
INSERT INTO Followings(userID,postID) VALUES (2,4);
INSERT INTO Followings(userID,postID) VALUES (3,5);
INSERT INTO Followings(userID,postID) VALUES (4,6);
INSERT INTO Followings(userID,postID) VALUES (5,7);
INSERT INTO Followings(userID,postID) VALUES (6,8);
INSERT INTO Followings(userID,postID) VALUES (7,9);
INSERT INTO Followings(userID,postID) VALUES (8,10);
INSERT INTO Followings(userID,postID) VALUES (9,11);
INSERT INTO Followings(userID,postID) VALUES (10,12);
INSERT INTO Followings(userID,postID) VALUES (11,13);
INSERT INTO Followings(userID,postID) VALUES (12,14);
INSERT INTO Followings(userID,postID) VALUES (13,15);
INSERT INTO Followings(userID,postID) VALUES (14,16);
INSERT INTO Followings(userID,postID) VALUES (15,17);
INSERT INTO Followings(userID,postID) VALUES (16,18);
INSERT INTO Followings(userID,postID) VALUES (17,19);
INSERT INTO Followings(userID,postID) VALUES (18,20);
INSERT INTO Followings(userID,postID) VALUES (19,21);
INSERT INTO Followings(userID,postID) VALUES (20,22);
INSERT INTO Followings(userID,postID) VALUES (21,23);
INSERT INTO Followings(userID,postID) VALUES (22,24);
INSERT INTO Followings(userID,postID) VALUES (23,25);
INSERT INTO Followings(userID,postID) VALUES (24,26);
INSERT INTO Followings(userID,postID) VALUES (25,27);
INSERT INTO Followings(userID,postID) VALUES (26,28);
INSERT INTO Followings(userID,postID) VALUES (27,29);
INSERT INTO Followings(userID,postID) VALUES (28,30);
INSERT INTO Followings(userID,postID) VALUES (29,31);
INSERT INTO Followings(userID,postID) VALUES (30,32);
INSERT INTO Followings(userID,postID) VALUES (31,33);
INSERT INTO Followings(userID,postID) VALUES (32,34);
INSERT INTO Followings(userID,postID) VALUES (33,35);
INSERT INTO Followings(userID,postID) VALUES (34,36);
INSERT INTO Followings(userID,postID) VALUES (35,37);
INSERT INTO Followings(userID,postID) VALUES (36,38);
INSERT INTO Followings(userID,postID) VALUES (37,39);
INSERT INTO Followings(userID,postID) VALUES (38,40);
INSERT INTO Followings(userID,postID) VALUES (39,1);
INSERT INTO Followings(userID,postID) VALUES (40,2);
INSERT INTO Followings(userID,postID) VALUES (1,7);
INSERT INTO Followings(userID,postID) VALUES (2,8);
INSERT INTO Followings(userID,postID) VALUES (3,9);
INSERT INTO Followings(userID,postID) VALUES (4,10);
INSERT INTO Followings(userID,postID) VALUES (5,11);
INSERT INTO Followings(userID,postID) VALUES (6,12);
INSERT INTO Followings(userID,postID) VALUES (7,13);
INSERT INTO Followings(userID,postID) VALUES (8,14);
INSERT INTO Followings(userID,postID) VALUES (9,15);
INSERT INTO Followings(userID,postID) VALUES (10,16);
INSERT INTO Followings(userID,postID) VALUES (11,17);
INSERT INTO Followings(userID,postID) VALUES (12,18);
INSERT INTO Followings(userID,postID) VALUES (13,19);
INSERT INTO Followings(userID,postID) VALUES (14,20);
INSERT INTO Followings(userID,postID) VALUES (15,21);
INSERT INTO Followings(userID,postID) VALUES (16,22);
INSERT INTO Followings(userID,postID) VALUES (17,23);
INSERT INTO Followings(userID,postID) VALUES (18,24);
INSERT INTO Followings(userID,postID) VALUES (19,25);
INSERT INTO Followings(userID,postID) VALUES (20,26);
INSERT INTO Followings(userID,postID) VALUES (21,27);
INSERT INTO Followings(userID,postID) VALUES (22,28);
INSERT INTO Followings(userID,postID) VALUES (23,29);
INSERT INTO Followings(userID,postID) VALUES (24,30);
INSERT INTO Followings(userID,postID) VALUES (25,31);
INSERT INTO Followings(userID,postID) VALUES (26,32);
INSERT INTO Followings(userID,postID) VALUES (27,33);
INSERT INTO Followings(userID,postID) VALUES (28,34);
INSERT INTO Followings(userID,postID) VALUES (29,35);
INSERT INTO Followings(userID,postID) VALUES (30,36);
INSERT INTO Followings(userID,postID) VALUES (31,37);
INSERT INTO Followings(userID,postID) VALUES (32,38);
INSERT INTO Followings(userID,postID) VALUES (33,39);
INSERT INTO Followings(userID,postID) VALUES (34,40);
INSERT INTO Followings(userID,postID) VALUES (35,1);
INSERT INTO Followings(userID,postID) VALUES (36,2);
INSERT INTO Followings(userID,postID) VALUES (37,3);
INSERT INTO Followings(userID,postID) VALUES (38,4);
INSERT INTO Followings(userID,postID) VALUES (39,5);
INSERT INTO Followings(userID,postID) VALUES (40,6);
INSERT INTO Followings(userID,postID) VALUES (1,10);
INSERT INTO Followings(userID,postID) VALUES (2,11);
INSERT INTO Followings(userID,postID) VALUES (3,12);
INSERT INTO Followings(userID,postID) VALUES (4,13);
INSERT INTO Followings(userID,postID) VALUES (5,14);
INSERT INTO Followings(userID,postID) VALUES (6,15);
INSERT INTO Followings(userID,postID) VALUES (7,16);
INSERT INTO Followings(userID,postID) VALUES (8,17);
INSERT INTO Followings(userID,postID) VALUES (9,18);
INSERT INTO Followings(userID,postID) VALUES (10,19);
INSERT INTO Followings(userID,postID) VALUES (11,20);
INSERT INTO Followings(userID,postID) VALUES (12,21);
INSERT INTO Followings(userID,postID) VALUES (13,22);
INSERT INTO Followings(userID,postID) VALUES (14,23);
INSERT INTO Followings(userID,postID) VALUES (15,24);
INSERT INTO Followings(userID,postID) VALUES (16,25);
INSERT INTO Followings(userID,postID) VALUES (17,26);
INSERT INTO Followings(userID,postID) VALUES (18,27);
INSERT INTO Followings(userID,postID) VALUES (19,28);
INSERT INTO Followings(userID,postID) VALUES (20,29);
INSERT INTO Followings(userID,postID) VALUES (21,30);
INSERT INTO Followings(userID,postID) VALUES (22,31);
INSERT INTO Followings(userID,postID) VALUES (23,32);
INSERT INTO Followings(userID,postID) VALUES (24,33);
INSERT INTO Followings(userID,postID) VALUES (25,34);
INSERT INTO Followings(userID,postID) VALUES (26,35);
INSERT INTO Followings(userID,postID) VALUES (27,36);
INSERT INTO Followings(userID,postID) VALUES (28,37);
INSERT INTO Followings(userID,postID) VALUES (29,38);
INSERT INTO Followings(userID,postID) VALUES (30,39);
INSERT INTO Followings(userID,postID) VALUES (31,40);
INSERT INTO Followings(userID,postID) VALUES (32,1);
INSERT INTO Followings(userID,postID) VALUES (33,2);
INSERT INTO Followings(userID,postID) VALUES (34,3);
INSERT INTO Followings(userID,postID) VALUES (35,4);
INSERT INTO Followings(userID,postID) VALUES (36,5);
INSERT INTO Followings(userID,postID) VALUES (37,6);
INSERT INTO Followings(userID,postID) VALUES (38,7);
INSERT INTO Followings(userID,postID) VALUES (39,8);
INSERT INTO Followings(userID,postID) VALUES (40,9);
INSERT INTO Followings(userID,postID) VALUES (1,2);
INSERT INTO Followings(userID,postID) VALUES (2,3);
INSERT INTO Followings(userID,postID) VALUES (3,4);
INSERT INTO Followings(userID,postID) VALUES (4,5);
INSERT INTO Followings(userID,postID) VALUES (5,6);
INSERT INTO Followings(userID,postID) VALUES (6,7);
INSERT INTO Followings(userID,postID) VALUES (7,8);
INSERT INTO Followings(userID,postID) VALUES (8,9);
INSERT INTO Followings(userID,postID) VALUES (9,10);
INSERT INTO Followings(userID,postID) VALUES (10,11);
INSERT INTO Followings(userID,postID) VALUES (11,12);
INSERT INTO Followings(userID,postID) VALUES (12,13);
INSERT INTO Followings(userID,postID) VALUES (13,14);
INSERT INTO Followings(userID,postID) VALUES (14,15);
INSERT INTO Followings(userID,postID) VALUES (15,16);
INSERT INTO Followings(userID,postID) VALUES (16,17);
INSERT INTO Followings(userID,postID) VALUES (17,18);
INSERT INTO Followings(userID,postID) VALUES (18,19);
INSERT INTO Followings(userID,postID) VALUES (19,20);
INSERT INTO Followings(userID,postID) VALUES (20,21);
INSERT INTO Followings(userID,postID) VALUES (21,22);
INSERT INTO Followings(userID,postID) VALUES (22,23);
INSERT INTO Followings(userID,postID) VALUES (23,24);
INSERT INTO Followings(userID,postID) VALUES (24,25);
INSERT INTO Followings(userID,postID) VALUES (25,26);
INSERT INTO Followings(userID,postID) VALUES (26,27);
INSERT INTO Followings(userID,postID) VALUES (27,28);
INSERT INTO Followings(userID,postID) VALUES (28,29);
INSERT INTO Followings(userID,postID) VALUES (29,30);
INSERT INTO Followings(userID,postID) VALUES (30,31);
INSERT INTO Followings(userID,postID) VALUES (31,32);
INSERT INTO Followings(userID,postID) VALUES (32,33);
INSERT INTO Followings(userID,postID) VALUES (33,34);
INSERT INTO Followings(userID,postID) VALUES (34,35);
INSERT INTO Followings(userID,postID) VALUES (35,36);
INSERT INTO Followings(userID,postID) VALUES (36,37);
INSERT INTO Followings(userID,postID) VALUES (37,38);
INSERT INTO Followings(userID,postID) VALUES (38,39);
INSERT INTO Followings(userID,postID) VALUES (39,40);
INSERT INTO Followings(userID,postID) VALUES (40,1);
INSERT INTO Followings(userID,postID) VALUES (1,6);
INSERT INTO Followings(userID,postID) VALUES (2,7);
INSERT INTO Followings(userID,postID) VALUES (3,8);
INSERT INTO Followings(userID,postID) VALUES (4,9);
INSERT INTO Followings(userID,postID) VALUES (5,10);
INSERT INTO Followings(userID,postID) VALUES (6,11);
INSERT INTO Followings(userID,postID) VALUES (7,12);
INSERT INTO Followings(userID,postID) VALUES (8,13);
INSERT INTO Followings(userID,postID) VALUES (9,14);
INSERT INTO Followings(userID,postID) VALUES (10,15);
INSERT INTO Followings(userID,postID) VALUES (11,16);
INSERT INTO Followings(userID,postID) VALUES (12,17);
INSERT INTO Followings(userID,postID) VALUES (13,18);
INSERT INTO Followings(userID,postID) VALUES (14,19);
INSERT INTO Followings(userID,postID) VALUES (15,20);
INSERT INTO Followings(userID,postID) VALUES (16,21);
INSERT INTO Followings(userID,postID) VALUES (17,22);
INSERT INTO Followings(userID,postID) VALUES (18,23);
INSERT INTO Followings(userID,postID) VALUES (19,24);
INSERT INTO Followings(userID,postID) VALUES (20,25);
INSERT INTO Followings(userID,postID) VALUES (21,26);
INSERT INTO Followings(userID,postID) VALUES (22,27);
INSERT INTO Followings(userID,postID) VALUES (23,28);
INSERT INTO Followings(userID,postID) VALUES (24,29);
INSERT INTO Followings(userID,postID) VALUES (25,30);
INSERT INTO Followings(userID,postID) VALUES (26,31);
INSERT INTO Followings(userID,postID) VALUES (27,32);
INSERT INTO Followings(userID,postID) VALUES (28,33);
INSERT INTO Followings(userID,postID) VALUES (29,34);
INSERT INTO Followings(userID,postID) VALUES (30,35);
INSERT INTO Followings(userID,postID) VALUES (31,36);
INSERT INTO Followings(userID,postID) VALUES (32,37);
INSERT INTO Followings(userID,postID) VALUES (33,38);
INSERT INTO Followings(userID,postID) VALUES (34,39);
INSERT INTO Followings(userID,postID) VALUES (35,40);
INSERT INTO Followings(userID,postID) VALUES (36,1);
INSERT INTO Followings(userID,postID) VALUES (37,2);
INSERT INTO Followings(userID,postID) VALUES (38,3);
INSERT INTO Followings(userID,postID) VALUES (39,4);
INSERT INTO Followings(userID,postID) VALUES (40,5);
INSERT INTO Followings(userID,postID) VALUES (1,4);
INSERT INTO Followings(userID,postID) VALUES (2,5);
INSERT INTO Followings(userID,postID) VALUES (3,6);
INSERT INTO Followings(userID,postID) VALUES (4,7);
INSERT INTO Followings(userID,postID) VALUES (5,8);
INSERT INTO Followings(userID,postID) VALUES (6,9);
INSERT INTO Followings(userID,postID) VALUES (7,10);
INSERT INTO Followings(userID,postID) VALUES (8,11);
INSERT INTO Followings(userID,postID) VALUES (9,12);
INSERT INTO Followings(userID,postID) VALUES (10,13);
INSERT INTO Followings(userID,postID) VALUES (11,14);
INSERT INTO Followings(userID,postID) VALUES (12,15);
INSERT INTO Followings(userID,postID) VALUES (13,16);
INSERT INTO Followings(userID,postID) VALUES (14,17);
INSERT INTO Followings(userID,postID) VALUES (15,18);
INSERT INTO Followings(userID,postID) VALUES (16,19);
INSERT INTO Followings(userID,postID) VALUES (17,20);
INSERT INTO Followings(userID,postID) VALUES (18,21);
INSERT INTO Followings(userID,postID) VALUES (19,22);
INSERT INTO Followings(userID,postID) VALUES (20,23);
INSERT INTO Followings(userID,postID) VALUES (21,24);
INSERT INTO Followings(userID,postID) VALUES (22,25);
INSERT INTO Followings(userID,postID) VALUES (23,26);
INSERT INTO Followings(userID,postID) VALUES (24,27);
INSERT INTO Followings(userID,postID) VALUES (25,28);
INSERT INTO Followings(userID,postID) VALUES (26,29);
INSERT INTO Followings(userID,postID) VALUES (27,30);
INSERT INTO Followings(userID,postID) VALUES (28,31);
INSERT INTO Followings(userID,postID) VALUES (29,32);
INSERT INTO Followings(userID,postID) VALUES (30,33);
INSERT INTO Followings(userID,postID) VALUES (31,34);
INSERT INTO Followings(userID,postID) VALUES (32,35);
INSERT INTO Followings(userID,postID) VALUES (33,36);
INSERT INTO Followings(userID,postID) VALUES (34,37);
INSERT INTO Followings(userID,postID) VALUES (35,38);
INSERT INTO Followings(userID,postID) VALUES (36,39);
INSERT INTO Followings(userID,postID) VALUES (37,40);
INSERT INTO Followings(userID,postID) VALUES (38,1);
INSERT INTO Followings(userID,postID) VALUES (39,2);
INSERT INTO Followings(userID,postID) VALUES (40,3);
INSERT INTO Followings(userID,postID) VALUES (1,13);
INSERT INTO Followings(userID,postID) VALUES (2,14);
INSERT INTO Followings(userID,postID) VALUES (3,15);
INSERT INTO Followings(userID,postID) VALUES (4,16);
INSERT INTO Followings(userID,postID) VALUES (5,17);
INSERT INTO Followings(userID,postID) VALUES (6,18);
INSERT INTO Followings(userID,postID) VALUES (7,19);
INSERT INTO Followings(userID,postID) VALUES (8,20);
INSERT INTO Followings(userID,postID) VALUES (9,21);
INSERT INTO Followings(userID,postID) VALUES (10,22);
INSERT INTO Followings(userID,postID) VALUES (11,23);
INSERT INTO Followings(userID,postID) VALUES (12,24);
INSERT INTO Followings(userID,postID) VALUES (13,25);
INSERT INTO Followings(userID,postID) VALUES (14,26);
INSERT INTO Followings(userID,postID) VALUES (15,27);
INSERT INTO Followings(userID,postID) VALUES (16,28);
INSERT INTO Followings(userID,postID) VALUES (17,29);
INSERT INTO Followings(userID,postID) VALUES (18,30);
INSERT INTO Followings(userID,postID) VALUES (19,31);
INSERT INTO Followings(userID,postID) VALUES (20,32);


--Insert into Posts

# Dumping data for table 'Posts'

INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (1,32,'Jumped over the lazy dog','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',932,2.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (2,19,'Consectetur adipiscing elit','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',728,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (3,38,'Sed do eiusmod tempor','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',770,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (4,6,'Consectetur adipiscing elit','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',411,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (5,31,'The quick brown fox','Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',326,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (6,12,'Sed do eiusmod tempor','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.',480,1.00,0);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (7,13,'The quick brown fox','In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',421,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (8,37,'Lorem ipsum dolor sit amet','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',315,10.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (9,15,'Jumped over the lazy dog','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',858,5.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (10,24,'Lorem ipsum dolor sit amet','Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.',215,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (11,21,'The quick brown fox','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',936,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (12,22,'The quick brown fox','Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.',904,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (13,26,'Lorem ipsum dolor sit amet','Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',551,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (14,40,'Sed do eiusmod tempor','Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',933,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (15,2,'Jumped over the lazy dog','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',295,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (16,27,'Lorem ipsum dolor sit amet','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',149,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (17,28,'Lorem ipsum dolor sit amet','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.',493,2.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (18,4,'The quick brown fox','Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',682,2.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (19,8,'Consectetur adipiscing elit','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',749,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (20,1,'The quick brown fox','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',464,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (21,35,'Sed do eiusmod tempor','Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.',911,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (22,9,'Sed do eiusmod tempor','Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.',122,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (23,16,'Consectetur adipiscing elit','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.',643,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (24,5,'Jumped over the lazy dog','In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',392,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (25,34,'Jumped over the lazy dog','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',336,5.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (26,39,'The quick brown fox','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',832,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (27,29,'Jumped over the lazy dog','Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.',555,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (28,17,'Lorem ipsum dolor sit amet','In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',659,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (29,7,'Consectetur adipiscing elit','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',427,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (30,20,'Sed do eiusmod tempor','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',82,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (31,18,'The quick brown fox','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',585,15.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (32,23,'The quick brown fox','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',499,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (33,36,'The quick brown fox','Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',409,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (34,3,'Consectetur adipiscing elit','Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',141,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (35,11,'The quick brown fox','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',809,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (36,14,'The quick brown fox','Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',648,2.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (37,25,'Lorem ipsum dolor sit amet','Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.',4,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (38,10,'Consectetur adipiscing elit','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.',252,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (39,33,'Jumped over the lazy dog','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',671,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (40,30,'Sed do eiusmod tempor','Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',236,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (41,27,'Lorem ipsum dolor sit amet','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',349,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (42,5,'Sed do eiusmod tempor','Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.',654,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (43,36,'The quick brown fox','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.',682,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (44,34,'The quick brown fox','Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',502,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (45,21,'Sed do eiusmod tempor','Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.',493,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (46,16,'Jumped over the lazy dog','Fusce consequat. Nulla nisl. Nunc nisl.',927,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (47,1,'Sed do eiusmod tempor','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',530,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (48,3,'Consectetur adipiscing elit','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',459,25.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (49,20,'Sed do eiusmod tempor','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',0,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (50,4,'Jumped over the lazy dog','Phasellus in felis. Donec semper sapien a libero. Nam dui.',353,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (51,9,'Jumped over the lazy dog','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',562,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (52,2,'The quick brown fox','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',859,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (53,25,'Consectetur adipiscing elit','Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.',378,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (54,33,'Consectetur adipiscing elit','Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.',216,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (55,22,'Lorem ipsum dolor sit amet','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',641,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (56,7,'The quick brown fox','Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.',883,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (57,31,'Sed do eiusmod tempor','Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.',345,10.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (58,37,'Lorem ipsum dolor sit amet','In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',638,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (59,32,'Consectetur adipiscing elit','Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',859,10.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (60,24,'The quick brown fox','Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',723,1.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (61,28,'Jumped over the lazy dog','Phasellus in felis. Donec semper sapien a libero. Nam dui.',235,0.00,0);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (62,6,'Lorem ipsum dolor sit amet','Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.',945,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (63,29,'Lorem ipsum dolor sit amet','Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.',874,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (64,40,'The quick brown fox','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.',645,5.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (65,15,'Sed do eiusmod tempor','Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',822,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (66,10,'Jumped over the lazy dog','Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',207,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (67,39,'The quick brown fox','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',202,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (68,17,'The quick brown fox','Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',389,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (69,35,'The quick brown fox','Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',194,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (70,13,'Jumped over the lazy dog','Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',127,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (71,26,'The quick brown fox','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',299,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (72,11,'Jumped over the lazy dog','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',162,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (73,12,'Jumped over the lazy dog','In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.',521,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (74,8,'The quick brown fox','Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',595,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (75,19,'Jumped over the lazy dog','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',147,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (76,14,'The quick brown fox','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',210,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (77,30,'Consectetur adipiscing elit','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.',566,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (78,38,'Sed do eiusmod tempor','In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.',377,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (79,23,'Lorem ipsum dolor sit amet','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',771,0.00,1);
INSERT INTO Posts(postID,userID,title,content,numberOfViews,price,active) VALUES (80,18,'Jumped over the lazy dog','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',575,0.00,1);

-- Insert into Read_By

# Dumping data for table 'Read_By'

INSERT INTO Read_By(userID,postID) VALUES (1,75);
INSERT INTO Read_By(userID,postID) VALUES (2,46);
INSERT INTO Read_By(userID,postID) VALUES (3,80);
INSERT INTO Read_By(userID,postID) VALUES (4,35);
INSERT INTO Read_By(userID,postID) VALUES (5,36);
INSERT INTO Read_By(userID,postID) VALUES (6,30);
INSERT INTO Read_By(userID,postID) VALUES (7,69);
INSERT INTO Read_By(userID,postID) VALUES (8,26);
INSERT INTO Read_By(userID,postID) VALUES (9,49);
INSERT INTO Read_By(userID,postID) VALUES (10,52);
INSERT INTO Read_By(userID,postID) VALUES (11,42);
INSERT INTO Read_By(userID,postID) VALUES (12,14);
INSERT INTO Read_By(userID,postID) VALUES (13,71);
INSERT INTO Read_By(userID,postID) VALUES (14,19);
INSERT INTO Read_By(userID,postID) VALUES (15,20);
INSERT INTO Read_By(userID,postID) VALUES (16,2);
INSERT INTO Read_By(userID,postID) VALUES (17,9);
INSERT INTO Read_By(userID,postID) VALUES (18,7);
INSERT INTO Read_By(userID,postID) VALUES (19,51);
INSERT INTO Read_By(userID,postID) VALUES (20,16);
INSERT INTO Read_By(userID,postID) VALUES (21,77);
INSERT INTO Read_By(userID,postID) VALUES (22,76);
INSERT INTO Read_By(userID,postID) VALUES (23,47);
INSERT INTO Read_By(userID,postID) VALUES (24,50);
INSERT INTO Read_By(userID,postID) VALUES (25,24);
INSERT INTO Read_By(userID,postID) VALUES (26,73);
INSERT INTO Read_By(userID,postID) VALUES (27,6);
INSERT INTO Read_By(userID,postID) VALUES (28,58);
INSERT INTO Read_By(userID,postID) VALUES (29,38);
INSERT INTO Read_By(userID,postID) VALUES (30,60);
INSERT INTO Read_By(userID,postID) VALUES (31,22);
INSERT INTO Read_By(userID,postID) VALUES (32,34);
INSERT INTO Read_By(userID,postID) VALUES (33,48);
INSERT INTO Read_By(userID,postID) VALUES (34,32);
INSERT INTO Read_By(userID,postID) VALUES (35,25);
INSERT INTO Read_By(userID,postID) VALUES (36,15);
INSERT INTO Read_By(userID,postID) VALUES (37,53);
INSERT INTO Read_By(userID,postID) VALUES (38,8);
INSERT INTO Read_By(userID,postID) VALUES (39,57);
INSERT INTO Read_By(userID,postID) VALUES (40,65);
INSERT INTO Read_By(userID,postID) VALUES (1,12);
INSERT INTO Read_By(userID,postID) VALUES (2,70);
INSERT INTO Read_By(userID,postID) VALUES (3,66);
INSERT INTO Read_By(userID,postID) VALUES (4,54);
INSERT INTO Read_By(userID,postID) VALUES (5,17);
INSERT INTO Read_By(userID,postID) VALUES (6,37);
INSERT INTO Read_By(userID,postID) VALUES (7,23);
INSERT INTO Read_By(userID,postID) VALUES (8,43);
INSERT INTO Read_By(userID,postID) VALUES (9,45);
INSERT INTO Read_By(userID,postID) VALUES (10,63);
INSERT INTO Read_By(userID,postID) VALUES (11,74);
INSERT INTO Read_By(userID,postID) VALUES (12,5);
INSERT INTO Read_By(userID,postID) VALUES (13,33);
INSERT INTO Read_By(userID,postID) VALUES (14,11);
INSERT INTO Read_By(userID,postID) VALUES (15,44);
INSERT INTO Read_By(userID,postID) VALUES (16,28);
INSERT INTO Read_By(userID,postID) VALUES (17,55);
INSERT INTO Read_By(userID,postID) VALUES (18,68);
INSERT INTO Read_By(userID,postID) VALUES (19,29);
INSERT INTO Read_By(userID,postID) VALUES (20,18);
INSERT INTO Read_By(userID,postID) VALUES (21,78);
INSERT INTO Read_By(userID,postID) VALUES (22,64);
INSERT INTO Read_By(userID,postID) VALUES (23,41);
INSERT INTO Read_By(userID,postID) VALUES (24,67);
INSERT INTO Read_By(userID,postID) VALUES (25,3);
INSERT INTO Read_By(userID,postID) VALUES (26,31);
INSERT INTO Read_By(userID,postID) VALUES (27,27);
INSERT INTO Read_By(userID,postID) VALUES (28,10);
INSERT INTO Read_By(userID,postID) VALUES (29,72);
INSERT INTO Read_By(userID,postID) VALUES (30,21);
INSERT INTO Read_By(userID,postID) VALUES (31,40);
INSERT INTO Read_By(userID,postID) VALUES (32,61);
INSERT INTO Read_By(userID,postID) VALUES (33,62);
INSERT INTO Read_By(userID,postID) VALUES (34,79);
INSERT INTO Read_By(userID,postID) VALUES (35,56);
INSERT INTO Read_By(userID,postID) VALUES (36,1);
INSERT INTO Read_By(userID,postID) VALUES (37,4);
INSERT INTO Read_By(userID,postID) VALUES (38,59);
INSERT INTO Read_By(userID,postID) VALUES (39,13);
INSERT INTO Read_By(userID,postID) VALUES (40,39);
INSERT INTO Read_By(userID,postID) VALUES (1,31);
INSERT INTO Read_By(userID,postID) VALUES (2,25);
INSERT INTO Read_By(userID,postID) VALUES (3,38);
INSERT INTO Read_By(userID,postID) VALUES (4,65);
INSERT INTO Read_By(userID,postID) VALUES (5,6);
INSERT INTO Read_By(userID,postID) VALUES (6,50);
INSERT INTO Read_By(userID,postID) VALUES (7,32);
INSERT INTO Read_By(userID,postID) VALUES (8,74);
INSERT INTO Read_By(userID,postID) VALUES (9,52);
INSERT INTO Read_By(userID,postID) VALUES (10,22);
INSERT INTO Read_By(userID,postID) VALUES (11,70);
INSERT INTO Read_By(userID,postID) VALUES (12,54);
INSERT INTO Read_By(userID,postID) VALUES (13,80);
INSERT INTO Read_By(userID,postID) VALUES (14,28);
INSERT INTO Read_By(userID,postID) VALUES (15,63);
INSERT INTO Read_By(userID,postID) VALUES (16,17);
INSERT INTO Read_By(userID,postID) VALUES (17,79);
INSERT INTO Read_By(userID,postID) VALUES (18,9);
INSERT INTO Read_By(userID,postID) VALUES (19,41);
INSERT INTO Read_By(userID,postID) VALUES (20,2);
INSERT INTO Read_By(userID,postID) VALUES (21,56);
INSERT INTO Read_By(userID,postID) VALUES (22,71);
INSERT INTO Read_By(userID,postID) VALUES (23,33);
INSERT INTO Read_By(userID,postID) VALUES (24,49);
INSERT INTO Read_By(userID,postID) VALUES (25,14);
INSERT INTO Read_By(userID,postID) VALUES (26,27);
INSERT INTO Read_By(userID,postID) VALUES (27,51);
INSERT INTO Read_By(userID,postID) VALUES (28,39);
INSERT INTO Read_By(userID,postID) VALUES (29,23);
INSERT INTO Read_By(userID,postID) VALUES (30,66);
INSERT INTO Read_By(userID,postID) VALUES (31,1);
INSERT INTO Read_By(userID,postID) VALUES (32,45);
INSERT INTO Read_By(userID,postID) VALUES (33,67);
INSERT INTO Read_By(userID,postID) VALUES (34,76);
INSERT INTO Read_By(userID,postID) VALUES (35,60);
INSERT INTO Read_By(userID,postID) VALUES (36,10);
INSERT INTO Read_By(userID,postID) VALUES (37,5);
INSERT INTO Read_By(userID,postID) VALUES (38,26);
INSERT INTO Read_By(userID,postID) VALUES (39,36);
INSERT INTO Read_By(userID,postID) VALUES (40,61);
INSERT INTO Read_By(userID,postID) VALUES (1,43);
INSERT INTO Read_By(userID,postID) VALUES (2,57);
INSERT INTO Read_By(userID,postID) VALUES (3,3);
INSERT INTO Read_By(userID,postID) VALUES (4,30);
INSERT INTO Read_By(userID,postID) VALUES (5,11);
INSERT INTO Read_By(userID,postID) VALUES (6,40);
INSERT INTO Read_By(userID,postID) VALUES (7,62);
INSERT INTO Read_By(userID,postID) VALUES (8,24);
INSERT INTO Read_By(userID,postID) VALUES (9,15);
INSERT INTO Read_By(userID,postID) VALUES (10,77);
INSERT INTO Read_By(userID,postID) VALUES (11,68);
INSERT INTO Read_By(userID,postID) VALUES (12,47);
INSERT INTO Read_By(userID,postID) VALUES (13,12);
INSERT INTO Read_By(userID,postID) VALUES (14,78);
INSERT INTO Read_By(userID,postID) VALUES (15,48);
INSERT INTO Read_By(userID,postID) VALUES (16,21);
INSERT INTO Read_By(userID,postID) VALUES (17,35);
INSERT INTO Read_By(userID,postID) VALUES (18,20);
INSERT INTO Read_By(userID,postID) VALUES (19,8);
INSERT INTO Read_By(userID,postID) VALUES (20,53);
INSERT INTO Read_By(userID,postID) VALUES (21,59);
INSERT INTO Read_By(userID,postID) VALUES (22,73);
INSERT INTO Read_By(userID,postID) VALUES (23,69);
INSERT INTO Read_By(userID,postID) VALUES (24,13);
INSERT INTO Read_By(userID,postID) VALUES (25,34);
INSERT INTO Read_By(userID,postID) VALUES (26,18);
INSERT INTO Read_By(userID,postID) VALUES (27,55);
INSERT INTO Read_By(userID,postID) VALUES (28,75);
INSERT INTO Read_By(userID,postID) VALUES (29,19);
INSERT INTO Read_By(userID,postID) VALUES (30,46);
INSERT INTO Read_By(userID,postID) VALUES (31,29);
INSERT INTO Read_By(userID,postID) VALUES (32,42);
INSERT INTO Read_By(userID,postID) VALUES (33,37);
INSERT INTO Read_By(userID,postID) VALUES (34,16);
INSERT INTO Read_By(userID,postID) VALUES (35,4);
INSERT INTO Read_By(userID,postID) VALUES (36,72);
INSERT INTO Read_By(userID,postID) VALUES (37,7);
INSERT INTO Read_By(userID,postID) VALUES (38,44);
INSERT INTO Read_By(userID,postID) VALUES (39,58);
INSERT INTO Read_By(userID,postID) VALUES (40,64);
INSERT INTO Read_By(userID,postID) VALUES (1,14);
INSERT INTO Read_By(userID,postID) VALUES (2,77);
INSERT INTO Read_By(userID,postID) VALUES (3,52);
INSERT INTO Read_By(userID,postID) VALUES (4,20);
INSERT INTO Read_By(userID,postID) VALUES (5,31);
INSERT INTO Read_By(userID,postID) VALUES (6,53);
INSERT INTO Read_By(userID,postID) VALUES (7,40);
INSERT INTO Read_By(userID,postID) VALUES (8,35);
INSERT INTO Read_By(userID,postID) VALUES (9,39);
INSERT INTO Read_By(userID,postID) VALUES (10,36);
INSERT INTO Read_By(userID,postID) VALUES (11,76);
INSERT INTO Read_By(userID,postID) VALUES (12,24);
INSERT INTO Read_By(userID,postID) VALUES (13,18);
INSERT INTO Read_By(userID,postID) VALUES (14,23);
INSERT INTO Read_By(userID,postID) VALUES (15,72);
INSERT INTO Read_By(userID,postID) VALUES (16,56);
INSERT INTO Read_By(userID,postID) VALUES (17,58);
INSERT INTO Read_By(userID,postID) VALUES (18,64);
INSERT INTO Read_By(userID,postID) VALUES (19,65);
INSERT INTO Read_By(userID,postID) VALUES (20,50);
INSERT INTO Read_By(userID,postID) VALUES (21,34);
INSERT INTO Read_By(userID,postID) VALUES (22,67);
INSERT INTO Read_By(userID,postID) VALUES (23,30);
INSERT INTO Read_By(userID,postID) VALUES (24,33);
INSERT INTO Read_By(userID,postID) VALUES (25,7);
INSERT INTO Read_By(userID,postID) VALUES (26,45);
INSERT INTO Read_By(userID,postID) VALUES (27,22);
INSERT INTO Read_By(userID,postID) VALUES (28,71);
INSERT INTO Read_By(userID,postID) VALUES (29,68);
INSERT INTO Read_By(userID,postID) VALUES (30,21);
INSERT INTO Read_By(userID,postID) VALUES (31,5);
INSERT INTO Read_By(userID,postID) VALUES (32,55);
INSERT INTO Read_By(userID,postID) VALUES (33,15);
INSERT INTO Read_By(userID,postID) VALUES (34,59);
INSERT INTO Read_By(userID,postID) VALUES (35,69);
INSERT INTO Read_By(userID,postID) VALUES (36,63);
INSERT INTO Read_By(userID,postID) VALUES (37,4);
INSERT INTO Read_By(userID,postID) VALUES (38,11);
INSERT INTO Read_By(userID,postID) VALUES (39,1);
INSERT INTO Read_By(userID,postID) VALUES (40,80);
INSERT INTO Read_By(userID,postID) VALUES (1,42);
INSERT INTO Read_By(userID,postID) VALUES (2,44);
INSERT INTO Read_By(userID,postID) VALUES (3,79);
INSERT INTO Read_By(userID,postID) VALUES (4,48);
INSERT INTO Read_By(userID,postID) VALUES (5,70);
INSERT INTO Read_By(userID,postID) VALUES (6,57);
INSERT INTO Read_By(userID,postID) VALUES (7,47);
INSERT INTO Read_By(userID,postID) VALUES (8,6);
INSERT INTO Read_By(userID,postID) VALUES (9,54);
INSERT INTO Read_By(userID,postID) VALUES (10,60);
INSERT INTO Read_By(userID,postID) VALUES (11,78);
INSERT INTO Read_By(userID,postID) VALUES (12,8);
INSERT INTO Read_By(userID,postID) VALUES (13,2);
INSERT INTO Read_By(userID,postID) VALUES (14,75);
INSERT INTO Read_By(userID,postID) VALUES (15,37);
INSERT INTO Read_By(userID,postID) VALUES (16,28);
INSERT INTO Read_By(userID,postID) VALUES (17,13);
INSERT INTO Read_By(userID,postID) VALUES (18,62);
INSERT INTO Read_By(userID,postID) VALUES (19,73);
INSERT INTO Read_By(userID,postID) VALUES (20,32);
INSERT INTO Read_By(userID,postID) VALUES (21,41);
INSERT INTO Read_By(userID,postID) VALUES (22,51);
INSERT INTO Read_By(userID,postID) VALUES (23,27);
INSERT INTO Read_By(userID,postID) VALUES (24,25);
INSERT INTO Read_By(userID,postID) VALUES (25,10);
INSERT INTO Read_By(userID,postID) VALUES (26,61);
INSERT INTO Read_By(userID,postID) VALUES (27,17);
INSERT INTO Read_By(userID,postID) VALUES (28,9);
INSERT INTO Read_By(userID,postID) VALUES (29,16);
INSERT INTO Read_By(userID,postID) VALUES (30,66);
INSERT INTO Read_By(userID,postID) VALUES (31,26);
INSERT INTO Read_By(userID,postID) VALUES (32,3);
INSERT INTO Read_By(userID,postID) VALUES (33,46);
INSERT INTO Read_By(userID,postID) VALUES (34,19);
INSERT INTO Read_By(userID,postID) VALUES (35,12);
INSERT INTO Read_By(userID,postID) VALUES (36,38);
INSERT INTO Read_By(userID,postID) VALUES (37,43);
INSERT INTO Read_By(userID,postID) VALUES (38,49);
INSERT INTO Read_By(userID,postID) VALUES (39,47);
INSERT INTO Read_By(userID,postID) VALUES (40,35);
INSERT INTO Read_By(userID,postID) VALUES (1,18);
INSERT INTO Read_By(userID,postID) VALUES (2,50);
INSERT INTO Read_By(userID,postID) VALUES (3,7);
INSERT INTO Read_By(userID,postID) VALUES (4,23);
INSERT INTO Read_By(userID,postID) VALUES (5,67);
INSERT INTO Read_By(userID,postID) VALUES (6,43);
INSERT INTO Read_By(userID,postID) VALUES (7,61);
INSERT INTO Read_By(userID,postID) VALUES (8,78);
INSERT INTO Read_By(userID,postID) VALUES (9,79);
INSERT INTO Read_By(userID,postID) VALUES (10,36);
INSERT INTO Read_By(userID,postID) VALUES (11,49);
INSERT INTO Read_By(userID,postID) VALUES (12,54);
INSERT INTO Read_By(userID,postID) VALUES (13,69);
INSERT INTO Read_By(userID,postID) VALUES (14,62);
INSERT INTO Read_By(userID,postID) VALUES (15,33);
INSERT INTO Read_By(userID,postID) VALUES (16,48);
INSERT INTO Read_By(userID,postID) VALUES (17,52);
INSERT INTO Read_By(userID,postID) VALUES (18,21);
INSERT INTO Read_By(userID,postID) VALUES (19,64);
INSERT INTO Read_By(userID,postID) VALUES (20,5);
INSERT INTO Read_By(userID,postID) VALUES (21,12);
INSERT INTO Read_By(userID,postID) VALUES (22,65);
INSERT INTO Read_By(userID,postID) VALUES (23,60);
INSERT INTO Read_By(userID,postID) VALUES (24,66);
INSERT INTO Read_By(userID,postID) VALUES (25,63);
INSERT INTO Read_By(userID,postID) VALUES (26,56);
INSERT INTO Read_By(userID,postID) VALUES (27,10);
INSERT INTO Read_By(userID,postID) VALUES (28,46);
INSERT INTO Read_By(userID,postID) VALUES (29,51);
INSERT INTO Read_By(userID,postID) VALUES (30,1);
INSERT INTO Read_By(userID,postID) VALUES (31,58);
INSERT INTO Read_By(userID,postID) VALUES (32,32);
INSERT INTO Read_By(userID,postID) VALUES (33,29);
INSERT INTO Read_By(userID,postID) VALUES (34,25);
INSERT INTO Read_By(userID,postID) VALUES (35,37);
INSERT INTO Read_By(userID,postID) VALUES (36,4);
INSERT INTO Read_By(userID,postID) VALUES (37,73);
INSERT INTO Read_By(userID,postID) VALUES (38,72);
INSERT INTO Read_By(userID,postID) VALUES (39,3);
INSERT INTO Read_By(userID,postID) VALUES (40,9);
INSERT INTO Read_By(userID,postID) VALUES (1,6);
INSERT INTO Read_By(userID,postID) VALUES (2,27);
INSERT INTO Read_By(userID,postID) VALUES (3,68);
INSERT INTO Read_By(userID,postID) VALUES (4,14);
INSERT INTO Read_By(userID,postID) VALUES (5,20);
INSERT INTO Read_By(userID,postID) VALUES (6,71);
INSERT INTO Read_By(userID,postID) VALUES (7,24);
INSERT INTO Read_By(userID,postID) VALUES (8,26);
INSERT INTO Read_By(userID,postID) VALUES (9,53);
INSERT INTO Read_By(userID,postID) VALUES (10,2);
INSERT INTO Read_By(userID,postID) VALUES (11,55);
INSERT INTO Read_By(userID,postID) VALUES (12,30);
INSERT INTO Read_By(userID,postID) VALUES (13,59);
INSERT INTO Read_By(userID,postID) VALUES (14,8);
INSERT INTO Read_By(userID,postID) VALUES (15,74);
INSERT INTO Read_By(userID,postID) VALUES (16,57);
INSERT INTO Read_By(userID,postID) VALUES (17,34);
INSERT INTO Read_By(userID,postID) VALUES (18,13);
INSERT INTO Read_By(userID,postID) VALUES (19,76);
INSERT INTO Read_By(userID,postID) VALUES (20,16);
INSERT INTO Read_By(userID,postID) VALUES (21,15);
INSERT INTO Read_By(userID,postID) VALUES (22,17);
INSERT INTO Read_By(userID,postID) VALUES (23,31);
INSERT INTO Read_By(userID,postID) VALUES (24,28);
INSERT INTO Read_By(userID,postID) VALUES (25,11);
INSERT INTO Read_By(userID,postID) VALUES (26,80);
INSERT INTO Read_By(userID,postID) VALUES (27,45);
INSERT INTO Read_By(userID,postID) VALUES (28,70);
INSERT INTO Read_By(userID,postID) VALUES (29,38);
INSERT INTO Read_By(userID,postID) VALUES (30,41);
INSERT INTO Read_By(userID,postID) VALUES (31,40);
INSERT INTO Read_By(userID,postID) VALUES (32,44);
INSERT INTO Read_By(userID,postID) VALUES (33,42);
INSERT INTO Read_By(userID,postID) VALUES (34,77);
INSERT INTO Read_By(userID,postID) VALUES (35,19);
INSERT INTO Read_By(userID,postID) VALUES (36,75);
INSERT INTO Read_By(userID,postID) VALUES (37,22);
INSERT INTO Read_By(userID,postID) VALUES (38,38);
INSERT INTO Read_By(userID,postID) VALUES (39,53);
INSERT INTO Read_By(userID,postID) VALUES (40,39);
INSERT INTO Read_By(userID,postID) VALUES (1,24);
INSERT INTO Read_By(userID,postID) VALUES (2,71);
INSERT INTO Read_By(userID,postID) VALUES (3,4);
INSERT INTO Read_By(userID,postID) VALUES (4,72);
INSERT INTO Read_By(userID,postID) VALUES (5,18);
INSERT INTO Read_By(userID,postID) VALUES (6,57);
INSERT INTO Read_By(userID,postID) VALUES (7,37);
INSERT INTO Read_By(userID,postID) VALUES (8,48);
INSERT INTO Read_By(userID,postID) VALUES (9,3);
INSERT INTO Read_By(userID,postID) VALUES (10,22);
INSERT INTO Read_By(userID,postID) VALUES (11,73);
INSERT INTO Read_By(userID,postID) VALUES (12,75);
INSERT INTO Read_By(userID,postID) VALUES (13,25);
INSERT INTO Read_By(userID,postID) VALUES (14,28);
INSERT INTO Read_By(userID,postID) VALUES (15,65);
INSERT INTO Read_By(userID,postID) VALUES (16,31);
INSERT INTO Read_By(userID,postID) VALUES (17,62);
INSERT INTO Read_By(userID,postID) VALUES (18,41);
INSERT INTO Read_By(userID,postID) VALUES (19,63);
INSERT INTO Read_By(userID,postID) VALUES (20,30);
INSERT INTO Read_By(userID,postID) VALUES (21,49);
INSERT INTO Read_By(userID,postID) VALUES (22,14);
INSERT INTO Read_By(userID,postID) VALUES (23,8);
INSERT INTO Read_By(userID,postID) VALUES (24,67);
INSERT INTO Read_By(userID,postID) VALUES (25,36);
INSERT INTO Read_By(userID,postID) VALUES (26,20);
INSERT INTO Read_By(userID,postID) VALUES (27,46);
INSERT INTO Read_By(userID,postID) VALUES (28,60);
INSERT INTO Read_By(userID,postID) VALUES (29,54);
INSERT INTO Read_By(userID,postID) VALUES (30,76);
INSERT INTO Read_By(userID,postID) VALUES (31,45);
INSERT INTO Read_By(userID,postID) VALUES (32,44);
INSERT INTO Read_By(userID,postID) VALUES (33,2);
INSERT INTO Read_By(userID,postID) VALUES (34,19);
INSERT INTO Read_By(userID,postID) VALUES (35,66);
INSERT INTO Read_By(userID,postID) VALUES (36,13);
INSERT INTO Read_By(userID,postID) VALUES (37,11);
INSERT INTO Read_By(userID,postID) VALUES (38,47);
INSERT INTO Read_By(userID,postID) VALUES (39,5);
INSERT INTO Read_By(userID,postID) VALUES (40,17);
INSERT INTO Read_By(userID,postID) VALUES (1,59);
INSERT INTO Read_By(userID,postID) VALUES (2,42);
INSERT INTO Read_By(userID,postID) VALUES (3,55);
INSERT INTO Read_By(userID,postID) VALUES (4,64);
INSERT INTO Read_By(userID,postID) VALUES (5,29);
INSERT INTO Read_By(userID,postID) VALUES (6,10);
INSERT INTO Read_By(userID,postID) VALUES (7,61);
INSERT INTO Read_By(userID,postID) VALUES (8,15);
INSERT INTO Read_By(userID,postID) VALUES (9,78);
INSERT INTO Read_By(userID,postID) VALUES (10,68);
INSERT INTO Read_By(userID,postID) VALUES (11,26);
INSERT INTO Read_By(userID,postID) VALUES (12,80);
INSERT INTO Read_By(userID,postID) VALUES (13,21);
INSERT INTO Read_By(userID,postID) VALUES (14,70);
INSERT INTO Read_By(userID,postID) VALUES (15,1);
INSERT INTO Read_By(userID,postID) VALUES (16,51);
INSERT INTO Read_By(userID,postID) VALUES (17,69);
INSERT INTO Read_By(userID,postID) VALUES (18,52);
INSERT INTO Read_By(userID,postID) VALUES (19,23);
INSERT INTO Read_By(userID,postID) VALUES (20,43);
INSERT INTO Read_By(userID,postID) VALUES (21,56);
INSERT INTO Read_By(userID,postID) VALUES (22,34);
INSERT INTO Read_By(userID,postID) VALUES (23,6);
INSERT INTO Read_By(userID,postID) VALUES (24,32);
INSERT INTO Read_By(userID,postID) VALUES (25,16);
INSERT INTO Read_By(userID,postID) VALUES (26,79);
INSERT INTO Read_By(userID,postID) VALUES (27,74);
INSERT INTO Read_By(userID,postID) VALUES (28,33);
INSERT INTO Read_By(userID,postID) VALUES (29,40);
INSERT INTO Read_By(userID,postID) VALUES (30,12);
INSERT INTO Read_By(userID,postID) VALUES (31,9);
INSERT INTO Read_By(userID,postID) VALUES (32,7);
INSERT INTO Read_By(userID,postID) VALUES (33,27);
INSERT INTO Read_By(userID,postID) VALUES (34,35);
INSERT INTO Read_By(userID,postID) VALUES (35,77);
INSERT INTO Read_By(userID,postID) VALUES (36,58);
INSERT INTO Read_By(userID,postID) VALUES (37,50);
INSERT INTO Read_By(userID,postID) VALUES (38,10);
INSERT INTO Read_By(userID,postID) VALUES (39,36);
INSERT INTO Read_By(userID,postID) VALUES (40,53);

--Insert into Tags
# Dumping data for table 'Tags'

INSERT INTO Tags(tagID,postID,tagName) VALUES (1,53,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (2,17,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (3,24,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (4,72,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (5,65,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (6,54,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (7,32,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (8,60,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (9,51,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (10,77,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (11,31,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (12,22,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (13,58,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (14,41,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (15,4,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (16,3,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (17,70,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (18,26,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (19,34,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (20,21,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (21,46,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (22,20,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (23,7,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (24,40,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (25,75,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (26,68,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (27,35,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (28,62,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (29,57,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (30,15,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (31,73,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (32,61,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (33,42,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (34,66,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (35,67,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (36,30,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (37,27,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (38,36,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (39,19,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (40,74,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (41,56,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (42,6,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (43,48,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (44,33,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (45,49,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (46,63,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (47,71,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (48,11,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (49,44,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (50,18,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (51,28,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (52,9,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (53,2,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (54,29,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (55,79,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (56,16,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (57,50,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (58,64,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (59,39,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (60,52,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (61,69,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (62,43,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (63,38,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (64,14,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (65,5,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (66,47,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (67,55,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (68,76,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (69,23,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (70,8,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (71,13,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (72,37,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (73,78,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (74,1,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (75,80,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (76,25,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (77,59,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (78,12,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (79,45,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (80,10,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (81,69,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (82,12,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (83,29,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (84,31,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (85,79,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (86,45,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (87,48,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (88,20,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (89,53,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (90,34,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (91,59,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (92,62,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (93,9,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (94,11,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (95,8,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (96,1,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (97,36,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (98,39,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (99,19,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (100,67,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (101,18,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (102,2,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (103,33,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (104,64,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (105,24,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (106,80,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (107,55,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (108,46,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (109,72,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (110,13,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (111,57,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (112,17,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (113,37,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (114,27,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (115,22,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (116,3,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (117,54,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (118,74,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (119,44,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (120,6,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (121,4,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (122,5,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (123,10,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (124,14,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (125,21,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (126,76,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (127,56,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (128,35,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (129,23,'hiking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (130,7,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (131,61,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (132,78,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (133,49,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (134,63,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (135,28,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (136,65,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (137,47,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (138,77,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (139,40,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (140,52,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (141,26,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (142,41,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (143,70,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (144,16,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (145,15,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (146,71,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (147,51,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (148,38,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (149,66,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (150,58,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (151,30,'drawing');
INSERT INTO Tags(tagID,postID,tagName) VALUES (152,32,'history');
INSERT INTO Tags(tagID,postID,tagName) VALUES (153,60,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (154,50,'science');
INSERT INTO Tags(tagID,postID,tagName) VALUES (155,75,'cooking');
INSERT INTO Tags(tagID,postID,tagName) VALUES (156,43,'literature');
INSERT INTO Tags(tagID,postID,tagName) VALUES (157,42,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (158,73,'reading');
INSERT INTO Tags(tagID,postID,tagName) VALUES (159,25,'pop_culture');
INSERT INTO Tags(tagID,postID,tagName) VALUES (160,68,'pop_culture');

-- Insert into IssueReports

# Dumping data for table 'Issue_Reports'

insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (1, '1', 'yattwool0', 'Excepteur sint occaecat cupidatat non proident', 5, 'shipping delay');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (2, '2', 'sbachelar1', 'sunt in culpa qui officia deserunt mollit anim id est laborum.', 9, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (3, '3', 'esalliere2', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 2, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (4, '4', 'apasby3', 'consectetur adipiscing elit.', 6, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (5, '5', 'mlancett4', 'Excepteur sint occaecat cupidatat non proident', 10, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (6, '6', 'cstanbury5', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 10, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (7, '7', 'srappaport6', 'Ut enim ad minim veniam', 8, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (8, '8', 'atourville7', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (9, '9', 'alambertazzi8', 'consectetur adipiscing elit.', 8, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (10, '10', 'lglastonbury9', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 9, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (11, '11', 'abaldaccoa', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 9, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (12, '12', 'mgerreyb', 'Lorem ipsum dolor sit amet', 5, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (13, '13', 'olangsburyc', 'Ut enim ad minim veniam', 8, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (14, '14', 'siversond', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 5, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (15, '15', 'aarche', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 9, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (16, '16', 'ntumayanf', 'Ut enim ad minim veniam', 7, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (17, '17', 'cmaxwaleg', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 7, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (18, '18', 'msallowayeh', 'Lorem ipsum dolor sit amet', 7, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (19, '19', 'jboddami', 'Lorem ipsum dolor sit amet', 6, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (20, '20', 'cscoltsj', 'sunt in culpa qui officia deserunt mollit anim id est laborum.', 7, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (21, '21', 'yattwool0', 'Ut enim ad minim veniam', 3, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (22, '22', 'sbachelar1', 'Lorem ipsum dolor sit amet', 4, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (23, '23', 'esalliere2', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 9, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (24, '24', 'apasby3', 'Excepteur sint occaecat cupidatat non proident', 10, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (25, '25', 'mlancett4', 'consectetur adipiscing elit.', 3, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (26, '26', 'cstanbury5', 'consectetur adipiscing elit.', 3, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (27, '27', 'srappaport6', 'Excepteur sint occaecat cupidatat non proident', 7, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (28, '28', 'atourville7', 'sunt in culpa qui officia deserunt mollit anim id est laborum.', 3, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (29, '29', 'alambertazzi8', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 5, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (30, '30', 'lglastonbury9', 'Excepteur sint occaecat cupidatat non proident', 2, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (31, '31', 'abaldaccoa', 'Ut enim ad minim veniam', 5, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (32, '32', 'mgerreyb', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 10, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (33, '33', 'olangsburyc', 'Excepteur sint occaecat cupidatat non proident', 7, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (34, '34', 'siversond', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 9, 'shipping delay');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (35, '35', 'aarche', 'Excepteur sint occaecat cupidatat non proident', 2, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (36, '36', 'ntumayanf', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 5, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (37, '37', 'cmaxwaleg', 'Lorem ipsum dolor sit amet', 6, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (38, '38', 'msallowayeh', 'Lorem ipsum dolor sit amet', 3, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (39, '39', 'jboddami', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 2, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (40, '40', 'cscoltsj', 'Ut enim ad minim veniam', 8, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (41, '1', 'yattwool0', 'Ut enim ad minim veniam', 4, 'website error');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (42, '2', 'sbachelar1', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 1, 'shipping delay');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (43, '3', 'esalliere2', 'sunt in culpa qui officia deserunt mollit anim id est laborum.', 5, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (44, '4', 'apasby3', 'consectetur adipiscing elit.', 7, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (45, '5', 'mlancett4', 'sunt in culpa qui officia deserunt mollit anim id est laborum.', 8, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (46, '6', 'cstanbury5', 'sunt in culpa qui officia deserunt mollit anim id est laborum.', 8, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (47, '7', 'srappaport6', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 5, 'customer service');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (48, '8', 'atourville7', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1, 'product quality');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (49, '9', 'alambertazzi8', 'Excepteur sint occaecat cupidatat non proident', 9, 'billing issue');
insert into Issue_Reports (reportID, issuerID, modName, reportContent, severity, type) values (50, '10', 'lglastonbury9', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 3, 'shipping delay');

-- Insert into Edits
# Dumping data for table 'Edits'

insert into Edits (editID, postID, asstName, edit) values (1, '1', 'etitterton0', 'replace text');
insert into Edits (editID, postID, asstName, edit) values (2, '2', 'cgrunson1', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (3, '3', 'bcampelli2', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (4, '4', 'bcastletine3', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (5, '5', 'kbaudasso4', 'replace text');
insert into Edits (editID, postID, asstName, edit) values (6, '6', 'bconklin5', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (7, '7', 'cwingar6', 'format text');
insert into Edits (editID, postID, asstName, edit) values (8, '8', 'vodonegan7', 'replace text');
insert into Edits (editID, postID, asstName, edit) values (9, '9', 'tilling8', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (10, '10', 'edomnick9', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (11, '11', 'llunama', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (12, '12', 'dheardb', 'format text');
insert into Edits (editID, postID, asstName, edit) values (13, '13', 'jlabusquierec', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (14, '14', 'ahorrigand', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (15, '15', 'jhaythornee', 'replace text');
insert into Edits (editID, postID, asstName, edit) values (16, '16', 'ssedgef', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (17, '17', 'cgreenoughg', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (18, '18', 'mfaulkenerh', 'format text');
insert into Edits (editID, postID, asstName, edit) values (19, '19', 'tjoslingi', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (20, '20', 'olauderj', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (21, '21', 'etitterton0', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (22, '22', 'cgrunson1', 'format text');
insert into Edits (editID, postID, asstName, edit) values (23, '23', 'bcampelli2', 'format text');
insert into Edits (editID, postID, asstName, edit) values (24, '24', 'bcastletine3', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (25, '25', 'kbaudasso4', 'replace text');
insert into Edits (editID, postID, asstName, edit) values (26, '26', 'bconklin5', 'replace text');
insert into Edits (editID, postID, asstName, edit) values (27, '27', 'cwingar6', 'format text');
insert into Edits (editID, postID, asstName, edit) values (28, '28', 'vodonegan7', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (29, '29', 'tilling8', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (30, '30', 'edomnick9', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (31, '31', 'llunama', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (32, '32', 'dheardb', 'replace text');
insert into Edits (editID, postID, asstName, edit) values (33, '33', 'jlabusquierec', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (34, '34', 'ahorrigand', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (35, '35', 'jhaythornee', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (36, '36', 'ssedgef', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (37, '37', 'cgreenoughg', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (38, '38', 'mfaulkenerh', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (39, '39', 'tjoslingi', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (40, '40', 'olauderj', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (41, '41', 'etitterton0', 'format text');
insert into Edits (editID, postID, asstName, edit) values (42, '42', 'cgrunson1', 'format text');
insert into Edits (editID, postID, asstName, edit) values (43, '43', 'bcampelli2', 'format text');
insert into Edits (editID, postID, asstName, edit) values (44, '44', 'bcastletine3', 'insert text');
insert into Edits (editID, postID, asstName, edit) values (45, '45', 'kbaudasso4', 'replace text');
insert into Edits (editID, postID, asstName, edit) values (46, '46', 'bconklin5', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (47, '47', 'cwingar6', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (48, '48', 'vodonegan7', 'format text');
insert into Edits (editID, postID, asstName, edit) values (49, '49', 'tilling8', 'delete text');
insert into Edits (editID, postID, asstName, edit) values (50, '50', 'edomnick9', 'delete text');