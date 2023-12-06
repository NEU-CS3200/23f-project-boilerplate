# Password secrets for MySQL

You should never store passwords in a file that will be pushed to github or any other cloud-hosted system.  You'll notice that in the .gitignore, two files from this folder are indeed ignored.  

In this folder, you'll need to create two files:

- `db_password.txt`
  - in this file, put a password that will be used for a non-root db user
- `db_root_password.txt`
  - in this file, put the password you want to use for the root user (superuser) of mysql. 

  For our Animal-Backend Repository, we have grouped our routes into six different blueprints: animals, customers, guides, orders, reviews, and suppliers. This was done not only to make our code more maintainable and modular, but also to promote easier collaboration among our group members. 

  The animal blueprint contains all routes related to creating a database for animals that can add, delete, update, get by specific attributes, or get all animals

  The customer blueprint contains all routes used to create, add, get customer by ID, delete supplier by ID, update supplier by ID, or get all customers by zip code 

  The guides blueprint creates a database for guides that can add guides, get guides by ID, update guides, delete guides, or delete all guides before a specific timeline

  The orders blueprint creates a database for orders that can add orders, update orders, get orders by ID, or delete orders

  The reviews blueprint creates a database for reviews that can add reviews, get reviews by ID, update reviews, delete reviews, or delete all reviews before a specific timeline

  The suppliers blueprint creates a database suppliers that can add suppliers, get suppliers by ID, update suppliers, delete suppliers, get suppliers based on state, or get supplier contact link based on ID  