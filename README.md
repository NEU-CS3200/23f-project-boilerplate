# MySQL + Flask Boilerplate Project

This repo contains a boilerplate setup for spinning up 3 Docker containers:

1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API
1. A Local AppSmith Server

## How to setup and start the containers

**Important** - you need Docker Desktop installed

1. Clone this repository.
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL.
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp.
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`. To run in detached mode, run `docker compose up -d`.

## Flask API Organization

For our Animal-Backend Repository, we have grouped our routes into six different blueprints: animals, customers, guides, orders, reviews, and suppliers. This was done not only to make our code more maintainable and modular, but also to promote easier collaboration among our group members.

The animal blueprint contains all routes related to creating a database for animals that can add, delete, update, get by specific attributes, or get all animals

The customer blueprint contains all routes used to create, add, get customer by ID, delete supplier by ID, update supplier by ID, or get all customers by zip code

The guides blueprint creates a database for guides that can add guides, get guides by ID, update guides, delete guides, or delete all guides before a specific timeline

The orders blueprint creates a database for orders that can add orders, update orders, get orders by ID, or delete orders

The reviews blueprint creates a database for reviews that can add reviews, get reviews by ID, update reviews, delete reviews, or delete all reviews before a specific timeline

The suppliers blueprint creates a database suppliers that can add suppliers, get suppliers by ID, update suppliers, delete suppliers, get suppliers based on state, or get supplier contact link based on ID
