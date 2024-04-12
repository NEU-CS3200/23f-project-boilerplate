import mysql.connector
from faker import Faker
fake = Faker()

from faker import Faker

# Create Faker instance
fake = Faker()
def generate_location_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        city_name = fake.city()
        num_restaurants = fake.random_int(min=1, max=50)  # Assuming maximum of 50 restaurants per location
        zipcode = fake.zipcode()
        insert = (city_name, num_restaurants, zipcode)
        inserts.append(insert)
    return inserts

# Connect to the database
def connect_to_database():
    try:
        conn = mysql.connector.connect(
            host="3200",
            user="root",
            password="your_password",
            database="HungryHunt"
        )
        return conn
    except mysql.connector.Error as err:
        print("Error:", err)

# Insert data into the location table
def insert_location_data(inserts):
    conn = connect_to_database()
    if conn:
        cursor = conn.cursor()
        try:
            for insert_data in inserts:
                cursor.execute("INSERT INTO location (city_name, num_restaurants, zipcode) VALUES (%s, %s, %s)", insert_data)
            conn.commit()
            print("Data inserted successfully")
        except mysql.connector.Error as err:
            print("Error:", err)
        finally:
            cursor.close()
            conn.close()

# Example usage
num_inserts = 10
insert_data = generate_location_inserts(num_inserts)
insert_location_data(insert_data)
