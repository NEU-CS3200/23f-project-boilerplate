from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


animals = Blueprint('animals', __name__)

# Get all the animals from the database
# Output an array of all animals including their types and suppliers 
@animals.route('/', methods=['GET'])
def get_animals():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM animal')#JOIN animal_type ON animal_type.animalID = animal.animalID JOIN animal_supplier ON animal.supplierID = animal_supplier.supplierID')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Get all the animals from the database
# Outputs array containing details of all animals with additional information from joined tables
@animals.route('/joined', methods=['GET'])
def get_animals_joined():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM animal JOIN animal_type ON animal_type.animalID = animal.animalID JOIN animal_supplier ON animal.supplierID = animal_supplier.supplierID')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# add a new animal to the db
# Return success message if details of new animal are successfully inputted 
@animals.route('/', methods=['POST'])
def add_new_animal():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    if 'specialRequirements' not in the_data:
        return jsonify({"message": "Error: specialRequirements not provided"})
    if 'age' not in the_data:
        return jsonify({"message": "Error: age not provided"})
    if 'gender' not in the_data:
        return jsonify({"message": "Error: gender not provided"})
    if "price" not in the_data:
        return jsonify({"message": "Error: price not provided"})
    if "healthStatus" not in the_data:
        return jsonify({"message": "Error: healthStatus not provided"})
    if "behavior" not in the_data:
        return jsonify({"message": "Error: behavior not provided"})
    if "origin" not in the_data:
        return jsonify({"message": "Error: origin not provided"})
    if "availability" not in the_data:
        return jsonify({"message": "Error: availability not provided"})
    if "supplierID" not in the_data:
        return jsonify({"message": "Error: supplierID not provided"})
    if "species" not in the_data:
        return jsonify({"message": "Error: species not provided"})
    if "subSpecies" not in the_data:
        return jsonify({"message": "Error: subSpecies not provided"})
    
    specialRequirements = the_data['specialRequirements'] # can be None
    age = the_data['age']
    gender = the_data['gender']
    price = the_data['price']
    healthStatus = the_data['healthStatus']
    behavior = the_data['behavior']
    origin = the_data['origin']
    availability = the_data['availability']
    supplierID = the_data['supplierID']
    species = the_data['species']
    subSpecies = the_data['subSpecies']

    if age is None:
        return jsonify({"message": "Error: age is null"}), 400
    if gender is None:
        return jsonify({"message": "Error: gender is null"}), 400
    if price is None:
        return jsonify({"message": "Error: price is null"}), 400
    if healthStatus is None:
        return jsonify({"message": "Error: healthStatus is null"}), 400
    if behavior is None:
        return jsonify({"message": "Error: behavior is null"}), 400
    if origin is None:
        return jsonify({"message": "Error: origin is null"}), 400
    if availability is None:
        return jsonify({"message": "Error: availability is null"}), 400
    if supplierID is None:
        return jsonify({"message": "Error: supplierID is null"}), 400
    if species is None:
        return jsonify({"message": "Error: species is null"}), 400
    if subSpecies is None:
        return jsonify({"message": "Error: subSpecies is null"}), 400


    # Constructing the query
    query = 'insert into animal (healthStatus, behavior, origin, age, gender, price, availability, orderID, specialRequirements, supplierID) values ("'
    query += healthStatus + '", "'
    query += behavior + '", "'
    query += origin + '", '
    query += str(age) + ', '
    query += str(gender) + ', '
    query += str(price) + ', '
    query += str(availability) + ', '
    query += 'NULL, ' #animal does not belong to an order when created.
    if specialRequirements is None:
        specialRequirements = 'NULL'
        query += specialRequirements + ', '
    else:
        query += '"' + specialRequirements + '", '
    query += str(supplierID) + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    animalID = cursor.lastrowid

    # Make an animal type
    query = 'insert into animal_type (species, subSpecies, animalID) values ("'
    query += species + '", "'
    query += subSpecies + '", "'
    query += str(animalID) + '")'
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": "Success!"})

# Delete a specific animal from the database
# Expects animal ID as input
# Outputs success message if animal is successfully deleted
@animals.route('/<animalID>', methods=['DELETE'])
def delete_animal(animalID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # delete tag from the database for a list of products
    cursor.execute('DELETE FROM animal_type WHERE animalID={0}'.format(animalID))
    # delete animal from the database for a list of products
    cursor.execute('DELETE FROM animal WHERE animalID={0}'.format(animalID))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 

# Get a certain animal from the database based on ID
# Expects animal ID as input
# Outputs details of specified animal
@animals.route('/<animalID>', methods=['GET'])
def get_animal(animalID):
    
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    current_app.logger.info('SELECT * FROM animal JOIN animal_type ON animal_type.animalID = animal.animalID JOIN animal_supplier ON animal.supplierID = animal_supplier.supplierID WHERE animal.animalID={0}'.format(animalID))
    cursor.execute('SELECT * FROM animal JOIN animal_type ON animal_type.animalID = animal.animalID JOIN animal_supplier ON animal.supplierID = animal_supplier.supplierID WHERE animal.animalID={0}'.format(animalID))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Update the specified animal in the database
# Expects input of update payload
# Outputs success message if animal is successfully updated
@animals.route('/<animalID>', methods=['PUT'])
def update_animal(animalID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    query = 'UPDATE animal SET '

    #construct query
    if 'specialRequirements' in the_data:
        specialRequirements = the_data['specialRequirements']
        if specialRequirements is None:
            query += ('specialRequirements = NULL,')
        else:
            query += ('specialRequirements = "' + specialRequirements + '",')
    if 'healthStatus' in the_data:
        healthStatus = the_data['healthStatus']
        if healthStatus is None:
            return jsonify({"message": "Error: healthStatus is null"}), 400
        query += ('healthStatus = "' + healthStatus + '",')
    if 'behavior' in the_data:
        behavior = the_data['behavior']
        if behavior is None:
            return jsonify({"message": "Error: behavior is null"}), 400
        query += ('behavior = "' + behavior + '",')
    if 'origin' in the_data:
        origin = the_data['origin']
        if origin is None:
            return jsonify({"message": "Error: origin is null"}), 400
        query += ('origin = "' + origin + '",')
    if 'age' in the_data:
        age = the_data['age']
        if age is None:
            return jsonify({"message": "Error: age is null"}), 400
        query += ('age = ' + str(age) + ',')
    if 'gender' in the_data:
        gender = the_data['gender']
        if gender is None:
            return jsonify({"message": "Error: gender is null"}), 400
        query += ('gender = ' + str(gender) + ',')
    if 'price' in the_data:
        price = the_data['price']
        if price is None:
            return jsonify({"message": "Error: price is null"}), 400
        query += ('price = ' + str(price) + ',')
    if 'availability' in the_data:
        availability = the_data['availability']
        if availability is None:
            return jsonify({"message": "Error: availability is null"}), 400
        query += ('availability = ' + str(availability) + ',')
    if 'orderID' in the_data:
        orderID = the_data['orderID']
        if orderID is None:
            query += ('orderID = NULL,')
        else:
            query += ('orderID = ' + str(orderID) + ',')
    if 'supplierID' in the_data:
        supplierID = the_data['supplierID']
        if supplierID is None:
            return jsonify({"message": "Error: supplierID is null"}), 400
        query += ('supplierID = ' + str(supplierID) + ',')

    if query is 'UPDATE animal SET ':
        return jsonify({"message": "Error: no fields provided"}), 400
    #remove unnecessary comma    and    update the appropriate animal by animalID
    query = query[0:len(query) - 1] + " WHERE animalID = {0}".format(animalID)

    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    query = 'UPDATE animal_type SET '

    #now update types if necessary
    if 'species' in the_data:
        species = the_data['species']
        if species is None:
            return jsonify({"message": "Error: species is null"}), 400
        query += 'species="' + species + '",'
    if 'subSpecies' in the_data:
        subSpecies = the_data['subSpecies']
        if subSpecies is None:
            return jsonify({"message": "Error: subSpecies is null"}), 400
        query += 'subSpecies="' + subSpecies + '",'
    #remove unnecessary comma    and    update the appropriate type by animalTypeID
    if 'species' in the_data or 'subSpecies' in the_data:
        query = query[0:len(query) - 1] + " WHERE animalID = {0}".format(animalID)
        cursor = db.get_db().cursor()
        cursor.execute(query)
        db.get_db().commit()
    return jsonify({"message": "Success!"})


# Get all animals from the database based on a certain species
# Expects input of certain species name 
# Outputs array of animals of a certain species
@animals.route('/type/<species>', methods=['GET'])
def get_animal_by_species(species):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    strSpecies = '"' + species + '"'
    # use cursor to query the database for a list of animals
    cursor.execute('SELECT * FROM animal JOIN animal_type ON animal_type.animalID = animal.animalID JOIN animal_supplier ON animal.supplierID = animal_supplier.supplierID WHERE species={0}'.format(strSpecies))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Get all animals from the database based on a certain species and subspecies
# Expects input of certain species and subspecies name 
# Outputs array of animals of a certain species and subspecies
@animals.route('/type/<species>/<subSpecies>', methods=['GET'])
def get_animal_by_species_subspecies(species, subSpecies):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    strSpecies = '"' + species + '"'
    strSubSpecies = '"' + subSpecies + '"'
    # use cursor to query the database for a list of animals
    cursor.execute('SELECT * FROM animal JOIN animal_type ON animal_type.animalID = animal.animalID JOIN animal_supplier ON animal.supplierID = animal_supplier.supplierID WHERE species={0} AND subSpecies={1}'.format(strSpecies, strSubSpecies))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Get all animals from the database based on a certain origin
# Expects input of certain origin  
# Outputs array of animals of a certain origin
@animals.route('/origin/<origin>', methods=['GET'])
def get_animal_by_origin(origin):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    strOrigin = '"' + origin + '"'
    # use cursor to query the database for a list of animals
    cursor.execute('SELECT * FROM animal JOIN animal_type ON animal.animalID=animal_type.animalID WHERE origin={0}'.format(strOrigin))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Get all animals from the database based on a certain availability
# Expects input of certain availability
# Outputs array of animals of a certain availability 
@animals.route('/availability/<availability>', methods=['GET'])
def get_animal_by_availability(availability):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    strAvailability = str(availability)
    # use cursor to query the database for a list of animals
    cursor.execute('SELECT * FROM animal JOIN animal_type ON animal_type.animalID = animal.animalID JOIN animal_supplier ON animal.supplierID = animal_supplier.supplierID WHERE availability={0}'.format(strAvailability))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Get all the animals from the database
# Expect input of supplierID
# Output array containing details of animals supplied by the specific supplier
@animals.route('/supplier/<supplierID>', methods=['GET'])
def get_animals_by_supplier(supplierID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM animal JOIN animal_type ON animal_type.animalID = animal.animalID JOIN animal_supplier ON animal.supplierID = animal_supplier.supplierID WHERE animal.supplierID={0}'.format(supplierID))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)
