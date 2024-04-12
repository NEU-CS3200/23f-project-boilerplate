from faker import Faker
fake = Faker()

from faker import Faker

# Create Faker instance
fake = Faker()

# Generate fake data and format it into SQL insert statements for the location table
def generate_location_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        # Generate fake data
        city_name = fake.city()
        num_restaurants = fake.random_int(min=1, max=50)  # Assuming maximum of 50 restaurants per location
        zipcode = fake.zipcode()

        # Format data into SQL insert statement
        insert = f"INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('{city_name}', {num_restaurants}, '{zipcode}');"
        inserts.append(insert)
    return inserts

# Example usage
num_inserts = 10
insert_statements = generate_location_inserts(num_inserts)

# Print generated insert statements
for statement in insert_statements:
    print(statement)
