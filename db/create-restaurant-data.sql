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

<<<<<<< Updated upstream
=======
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES
('New York City', 50, 10001),
('Los Angeles', 40, 90001),
('Chicago', 30, 60601),
('Houston', 25, 77001),
('Phoenix', 20, 85001),
('Philadelphia', 35, 19019),
('San Antonio', 15, 78201),
('San Diego', 20, 92101),
('Dallas', 30, 75201),
('San Jose', 25, 95101);

INSERT INTO menu (menuID) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- For menu ID 1
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(12, 1, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(13, 1, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(14, 1, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(15, 1, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(12, 1, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(13, 1, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(14, 1, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(15, 1, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(12, 1, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(13, 1, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(14, 1, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(15, 1, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(12, 1, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(13, 1, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(14, 1, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(15, 1, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(12, 1, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(13, 1, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(14, 1, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(15, 1, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');


-- For menu ID 2
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(22, 2, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(23, 2, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(24, 2, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(25, 2, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(22, 2, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(23, 2, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(24, 2, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(25, 2, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(22, 2, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(23, 2, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(24, 2, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(25, 2, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(22, 2, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(23, 2, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(24, 2, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(25, 2, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(22, 2, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(23, 2, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(24, 2, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(25, 2, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');


-- For menu ID 3
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(32, 3, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(33, 3, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(34, 3, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(35, 3, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(32, 3, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(33, 3, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(34, 3, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(35, 3, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(32, 3, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(33, 3, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(34, 3, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(35, 3, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(32, 3, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(33, 3, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(34, 3, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(35, 3, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(32, 3, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(33, 3, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(34, 3, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(35, 3, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
-- For menu ID 4
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(42, 4, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(43, 4, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(44, 4, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(45, 4, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(42, 4, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(43, 4, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(44, 4, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(45, 4, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(42, 4, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(43, 4, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(44, 4, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(45, 4, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(42, 4, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(43, 4, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(44, 4, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(45, 4, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(42, 4, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(43, 4, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(44, 4, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(45, 4, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');


-- For menu ID 5
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(52, 5, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(53, 5, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(54, 5, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(55, 5, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(52, 5, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(53, 5, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(54, 5, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(55, 5, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(52, 5, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(53, 5, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(54, 5, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(55, 5, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(52, 5, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(53, 5, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(54, 5, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(55, 5, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(52, 5, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(53, 5, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(54, 5, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(55, 5, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');
-- For menu ID 6
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(62, 6, 'Mini Hot Dogs', 6.49, 'Mini hot dogs served in soft buns with ketchup and mustard.'),
(63, 6, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(64, 6, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(65, 6, 'Cheese Quesadilla', 4.99, 'Flour tortilla filled with melted cheese, grilled to perfection.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(62, 6, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(63, 6, 'Water', 1.49, 'Bottled water for hydration.'),
(64, 6, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(65, 6, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(62, 6, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(63, 6, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(64, 6, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(65, 6, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(62, 6, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(63, 6, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(64, 6, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(65, 6, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Grilled Chicken Strips', 7.99, 'Grilled chicken strips served with steamed vegetables and rice.'),
(62, 6, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(63, 6, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(64, 6, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(65, 6, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.');

-- For menu ID 7
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Mini Pancakes', 5.99, 'Miniature pancakes served with maple syrup and whipped cream.'),
(72, 7, 'PB&J Roll-Ups', 4.99, 'Peanut butter and jelly rolled up in soft tortillas for easy eating.'),
(73, 7, 'Chicken and Cheese Quesadilla', 6.49, 'Flour tortilla filled with grilled chicken and melted cheese.'),
(74, 7, 'Mini Corn Dogs', 5.49, 'Bite-sized corn dogs served with ketchup and mustard.'),
(75, 7, 'Ham and Cheese Roll-Ups', 6.99, 'Sliced ham and cheese rolled up in soft tortillas for a savory snack.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Milkshake', 3.99, 'Creamy milkshake available in chocolate, vanilla, or strawberry flavors.'),
(72, 7, 'Orange Juice', 2.49, 'Freshly squeezed orange juice for a burst of vitamin C.'),
(73, 7, 'Water', 1.49, 'Bottled water for hydration.'),
(74, 7, 'Apple Juice', 2.99, 'Sweet and refreshing apple juice for kids.'),
(75, 7, 'Fruit Punch', 2.99, 'Fruity punch made with a blend of juices and soda for a fizzy treat.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Fruit Kabobs', 4.49, 'Assorted fruits skewered on sticks for easy snacking.'),
(72, 7, 'Yogurt Parfait', 3.99, 'Layers of yogurt, granola, and fresh berries for a healthy snack.'),
(73, 7, 'Veggie Sticks', 3.49, 'Assorted vegetable sticks served with ranch dressing for dipping.'),
(74, 7, 'Cheese Cubes', 4.99, 'Assorted cheese cubes served with crackers for a quick bite.'),
(75, 7, 'Tortilla Chips and Salsa', 3.99, 'Crispy tortilla chips served with fresh salsa for dipping.');
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Frozen Yogurt', 3.49, 'Creamy frozen yogurt available in various flavors.'),
(72, 7, 'Cookie Dough Bites', 2.99, 'Small bites of cookie dough served chilled for a sweet treat.'),
(73, 7, 'Fruit Cup', 3.49, 'Assorted fresh fruits served in a cup.'),
(74, 7, 'Ice Cream Cone', 2.99, 'Classic vanilla ice cream served in a crunchy cone.'),
(75, 7, 'Chocolate Pudding Cup', 1.99, 'Creamy chocolate pudding served in a convenient cup.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(72, 7, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(73, 7, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(74, 7, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(75, 7, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

-- For menu ID 8
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Mini Burgers', 6.99, 'Miniature beef burgers served with lettuce, tomato, and ketchup.'),
(82, 8, 'Cheese Quesadilla', 5.49, 'Flour tortilla filled with melted cheese, grilled to perfection.'),
(83, 8, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(84, 8, 'Spaghetti with Meatballs', 7.49, 'Spaghetti pasta topped with marinara sauce and meatballs.'),
(85, 8, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(82, 8, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(83, 8, 'Water', 1.49, 'Bottled water for hydration.'),
(84, 8, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(85, 8, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(82, 8, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(83, 8, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(84, 8, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(85, 8, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(82, 8, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(83, 8, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(84, 8, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(85, 8, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Grilled Chicken Strips', 7.99, 'Grilled chicken strips served with steamed vegetables and rice.'),
(82, 8, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(83, 8, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(84, 8, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(85, 8, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.');

-- For menu ID 9
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(92, 9, 'Mini Cheeseburgers', 7.99, 'Miniature cheeseburgers served with fries and ketchup.'),
(93, 9, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(94, 9, 'Cheese Quesadilla', 5.49, 'Flour tortilla filled with melted cheese, grilled to perfection.'),
(95, 9, 'Grilled Chicken Strips', 7.49, 'Grilled chicken strips served with honey mustard dipping sauce.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(92, 9, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(93, 9, 'Water', 1.49, 'Bottled water for hydration.'),
(94, 9, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(95, 9, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(92, 9, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(93, 9, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(94, 9, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(95, 9, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(92, 9, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(93, 9, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(94, 9, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(95, 9, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(92, 9, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(93, 9, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(94, 9, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(95, 9, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese served with fries and ketchup.');


-- For menu ID 10
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Mini Chicken Tacos', 6.99, 'Miniature chicken tacos served with salsa and guacamole.'),
(102, 10, 'Cheese Quesadilla', 5.49, 'Flour tortilla filled with melted cheese, grilled to perfection.'),
(103, 10, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(104, 10, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(105, 10, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(102, 10, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(103, 10, 'Water', 1.49, 'Bottled water for hydration.'),
(104, 10, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(105, 10, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(102, 10, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(103, 10, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(104, 10, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(105, 10, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(102, 10, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(103, 10, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(104, 10, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(105, 10, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(102, 10, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(103, 10, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(104, 10, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(105, 10, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 11
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(112, 11, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(113, 11, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(114, 11, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(115, 11, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(112, 11, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(113, 11, 'Water', 1.49, 'Bottled water for hydration.'),
(114, 11, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(115, 11, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(112, 11, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(113, 11, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(114, 11, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(115, 11, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(112, 11, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(113, 11, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(114, 11, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(115, 11, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(112, 11, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(113, 11, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(114, 11, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(115, 11, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES
(1, 1, 'Mexican Fiesta', 'Mexican', 'Vibrant', false, true, '00:30:00', true, true, 2.8, 10, false, 4.3, '5pm-10pm'),
(2, 2, 'Thai Spice', 'Thai', 'Relaxed', false, true, '00:25:00', true, true, 3.5, 11, false, 4.1, '6pm-9pm'),
(3, 3, 'Mediterranean Breeze', 'Mediterranean', 'Chic', true, true, '00:20:00', true, true, 1.9, 12, true, 4.4, '12pm-3pm, 7pm-10pm'),
(1, 4, 'French Delight', 'French', 'Elegant', false, true, '00:35:00', true, true, 3.2, 9, true, 4.5, '7pm-10pm'),
(2, 5, 'Indian Spice', 'Indian', 'Colorful', false, true, '00:40:00', true, true, 2.6, 10, false, 4.0, '6pm-9pm');

INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES
(false, true, true, true, false),
(true, false, true, false, true),
(false, true, false, false, true),
(true, true, true, true, true),
(false, false, true, true, true)
(false, true, false, false, true),
(true, true, true, true, true),
(false, false, true, true, true)
(false, true, false, false, true),
(true, true, true, true, true),
(false, false, true, true, true);

INSERT INTO photo (name, caption) VALUES
('pizza.jpg', 'Freshly baked pepperoni pizza with melted cheese'),
('sushi.jpg', 'Assorted sushi rolls with soy sauce and wasabi'),
('burger.jpg', 'Juicy cheeseburger with lettuce, tomato, and pickles'),
('pasta.jpg', 'Homemade spaghetti with marinara sauce and meatballs'),
('steak.jpg', 'Grilled ribeye steak with garlic butter and roasted potatoes'),
('salad.jpg', 'Healthy salad with mixed greens, cherry tomatoes, and balsamic dressing'),
('smoothie.jpg', 'Refreshing fruit smoothie made with strawberries, bananas, and yogurt'),
('sushi2.jpg', 'Sashimi platter with fresh slices of tuna, salmon, and yellowtail'),
('icecream.jpg', 'Decadent ice cream sundae with chocolate sauce and whipped cream'),
('cake.jpg', 'Layered chocolate cake with raspberry filling and ganache frosting'),
('tiramisu.jpg', 'Italian tiramisu dessert with layers of coffee-soaked ladyfingers and mascarpone cream'),
('cookies.jpg', 'Homemade chocolate chip cookies fresh out of the oven'),
('sandwich.jpg', 'Grilled cheese sandwich with melted cheddar and crispy bacon'),
('sushi3.jpg', 'Nigiri sushi assortment with slices of fish over sushi rice'),
('ramen.jpg', 'Steamy bowl of ramen noodles with pork belly and soft-boiled egg'),
('pancakes.jpg', 'Fluffy buttermilk pancakes with maple syrup and butter'),
('fries.jpg', 'Crispy french fries served with ketchup and mayonnaise'),
('taco2.jpg', 'Fish tacos with cabbage slaw and creamy chipotle sauce'),
('curry.jpg', 'Vegetarian curry with chickpeas, spinach, and coconut milk'),
('pie.jpg', 'Homemade apple pie with a flaky crust and cinnamon sugar topping'),
('sushi4.jpg', 'Dragon roll sushi topped with avocado and eel sauce'),
('pho.jpg', 'Vietnamese pho soup with beef, rice noodles, and fresh herbs'),
('burrito.jpg', 'Loaded burrito with seasoned rice, beans, and grilled chicken'),
('sushi5.jpg', 'Rainbow sushi roll with a variety of colorful fish and avocado'),
('wings.jpg', 'Spicy buffalo chicken wings with celery sticks and blue cheese dressing'),
('taco3.jpg', 'Barbacoa tacos with cilantro, onions, and lime wedges'),
('pasta2.jpg', 'Creamy fettuccine Alfredo with grilled chicken and broccoli'),
('sushi6.jpg', 'Volcano roll sushi topped with spicy mayo and crunchy tempura flakes'),
('souffle.jpg', 'Chocolate soufflé with a molten lava center and powdered sugar dusting'),
('cheesecake.jpg', 'New York-style cheesecake with a graham cracker crust and cherry topping'),
('sushi7.jpg', 'Tempura shrimp sushi roll with avocado and eel sauce'),
('taco4.jpg', 'Grilled chicken tacos with fresh salsa and cotija cheese'),
('boba.jpg', 'Taro milk tea boba drink with tapioca pearls and a straw'),
('sushi8.jpg', 'Caterpillar roll sushi with thinly sliced cucumber and eel'),
('sashimi.jpg', 'Assorted sashimi slices including tuna, salmon, and yellowtail'),
('sushi9.jpg', 'Spider roll sushi filled with soft-shell crab and cucumber'),
('poke.jpg', 'Hawaiian poke bowl with marinated raw fish and sushi rice'),
('sushi10.jpg', 'Philadelphia roll sushi with smoked salmon and cream cheese');

/**
INSERT INTO user (userID, username, password, student_bool, school_name, school_year, school_major, fName, lName, gender, age, budget, biography, locationID, photoID, dietaryID) VALUES
(1,'emily_wong', 'p@ssw0rd', true, 'LMN College', 2, 'Biology', 'Emily', 'Wong', 'Female', 21, 45, 'Adventurous eater and nature lover', 1, 1, 1),
(2,'michael_jones', 'mjones123', false, NULL, NULL, NULL, 'Michael', 'Jones', 'Male', 30, 70, 'Food blogger and chef', 2, 2, 2),
(3,'sara_garcia', 'ilovefood', true, 'PQR University', 4, 'Business', 'Sara', 'Garcia', 'Female', 24, 55, 'Always looking for the best restaurants in town', 3, 3, 3),
(4,'david_smith', 'password123', true, 'ABC University', 3, 'Engineering', 'David', 'Smith', 'Male', 22, 60, 'Tech enthusiast and foodie', 1, 4, 4),
(5,'jessica_brown', 'brownie', false, NULL, NULL, NULL, 'Jessica', 'Brown', 'Female', 28, 50, 'Passionate about travel and trying new cuisines', 2, 5, 5);
*/

INSERT INTO user (userID, username, password, student_bool, school_name, school_year, school_major, fName, lName, gender, age, budget, biography, locationID, photoID, dietaryID) VALUES
(6,'alex_jackson', 'alex123', true, 'XYZ College', 2, 'Psychology', 'Alex', 'Jackson', 'Male', 20, 55, 'Loves experimenting with cooking and baking', 3, 6, 6),
(7,'olivia_davis', 'odavis', false, NULL, NULL, NULL, 'Olivia', 'Davis', 'Female', 26, 65, 'Enjoys dining out with friends and family', 1, 7, 4),
(8,'william_rodriguez', 'will123', true, 'LMN University', 4, 'History', 'William', 'Rodriguez', 'Male', 23, 60, 'History buff and amateur food critic', 2, 8, 5),
(9,'sophia_martinez', 'sophie', false, NULL, NULL, NULL, 'Sophia', 'Martinez', 'Female', 29, 70, 'Passionate about sustainable and organic food', 3, 9, 8),
(10,'ethan_taylor', 'etaylor', true, 'ABC College', 3, 'English', 'Ethan', 'Taylor', 'Male', 21, 45, 'Bookworm who loves a good meal', 1, 10, 7),
(11,'ava_anderson', 'avaa', false, NULL, NULL, NULL, 'Ava', 'Anderson', 'Female', 27, 55, 'Fitness enthusiast and food lover', 2, 11, 1),
(12,'noah_gonzalez', 'noah123', true, 'PQR College', 2, 'Physics', 'Noah', 'Gonzalez', 'Male', 22, 50, 'Science nerd with a taste for fine dining', 3, 12, 2),
(13,'mia_miller', 'miamia', false, NULL, NULL, NULL, 'Mia', 'Miller', 'Female', 25, 60, 'Art lover who enjoys experimenting in the kitchen', 1, 13, 3),
(14,'logan_wilson', 'loganw', true, 'XYZ University', 4, 'Sociology', 'Logan', 'Wilson', 'Male', 24, 65, 'Social activist and foodie', 2, 14, 4),
(15,'harper_martinez', 'harper123', false, NULL, NULL, NULL, 'Harper', 'Martinez', 'Female', 28, 55, 'Travel junkie with a passion for food photography', 3, 15, 5),
(16,'liam_thompson', 'liamt', true, 'LMN College', 3, 'Economics', 'Liam', 'Thompson', 'Male', 23, 70, 'Business-minded food enthusiast', 1, 16, 6),
(17,'amelia_hernandez', 'ameliah', false, NULL, NULL, NULL, 'Amelia', 'Hernandez', 'Female', 30, 60, 'Adventure seeker always looking for new culinary experiences', 2, 17, 6),
(18,'lucas_young', 'lucasy', true, 'PQR University', 2, 'Chemistry', 'Lucas', 'Young', 'Male', 20, 50, 'Aspiring scientist with a love for cooking', 3, 18, 4),
(19,'evelyn_diaz', 'evelyn123', false, NULL, NULL, NULL, 'Evelyn', 'Diaz', 'Female', 26, 55, 'Enjoys exploring local food markets and street vendors', 1, 19, 5),
(20,'benjamin_hall', 'benhall', true, 'ABC College', 4, 'Political Science', 'Benjamin', 'Hall', 'Male', 22, 65, 'Political junkie who appreciates a good meal', 2, 2, 2),
(21,'chloe_scott', 'chloe123', false, NULL, NULL, NULL, 'Chloe', 'Scott', 'Female', 29, 60, 'Passionate about sustainable farming and food production', 3, 1, 2),
(22,'daniel_morris', 'dmorris', true, 'XYZ University', 3, 'Mathematics', 'Daniel', 'Morris', 'Male', 21, 45, 'Math geek who enjoys exploring food culture', 1, 2, 5),
(23,'zoey_rivera', 'zoeyr', false, NULL, NULL, NULL, 'Zoey', 'Rivera', 'Female', 27, 55, 'Loves experimenting with international cuisine at home', 2, 3, 1),
(24,'nathan_wright', 'nathanw', true, 'LMN College', 2, 'Art History', 'Nathan', 'Wright', 'Male', 24, 50, 'Art enthusiast who finds inspiration in culinary arts', 3, 4, 1),
(25,'ava_perez', 'avap', false, NULL, NULL, NULL, 'Ava', 'Perez', 'Female', 28, 65, 'Enjoys documenting food adventures on social media', 1, 25, 1),
(26,'willow_carter', 'willowc', true, 'PQR University', 4, 'Philosophy', 'Willow', 'Carter', 'Female', 23, 70, 'Philosophy student with a passion for gourmet cooking', 2, 6, 1),
(27,'jacob_ramirez', 'jacobr', true, 'ABC College', 3, 'Communications', 'Jacob', 'Ramirez', 'Male', 25, 55, 'Aspiring journalist with an appetite for culinary adventures', 3, 2, 1),
(28,'mia_evans', 'mia123', false, NULL, NULL, NULL, 'Mia', 'Evans', 'Female', 30, 60, 'Loves hosting dinner parties and experimenting with new recipes', 1, 28, 2),
(29,'jaxon_garcia', 'jaxong', true, 'XYZ University', 2, 'Computer Science', 'Jaxon', 'Garcia', 'Male', 22, 50, 'Tech geek with a love for all things food-related', 2, 2, 3);

INSERT INTO rating (id, review, num, restaurantID, userID) VALUES
(1, 'Amazing tacos and margaritas!', 5, 4, 1),
(2, 'The Pad Thai was too spicy for my liking.', 3, 2, 2),
(3, 'The hummus platter was delicious and fresh.', 4, 3, 3),
(4, 'Wonderful French cuisine with impeccable service.', 1, 2, 4),
(5, 'The biryani was flavorful and authentic.', 2, 2, 5);
>>>>>>> Stashed changes
