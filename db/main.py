#New
from faker import Faker
import random

fake = Faker()

def generate_color_schemes(n):
    print("-- Generating color schemes")
    for i in range(1, n+1):
        print(f"INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES ({i}, '{fake.color_name()}', '{fake.hex_color()}', '{fake.hex_color()}', '{fake.hex_color()}');")

def generate_moods(n):
    print("\n-- Generating moods")
    for i in range(1, n+1):
        color_scheme_id = random.randint(1, n)
        print(f"INSERT INTO mood (moodID, name, colorScheme) VALUES ({i}, '{fake.word()}', {color_scheme_id});")

def generate_users(n):
    print("\n-- Generating users")
    for i in range(1, n+1):
        mood_id = random.randint(1, 60)
        print(f"INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES ({i}, '{fake.name()}', '{fake.text()}', '{fake.email()}', '{fake.phone_number()}', {mood_id});")

def generate_media_types(min_rows=30, max_rows=60):
    print("\n-- Generating media types")
    num_rows = random.randint(min_rows, max_rows)
    media_types = ['Song', 'Book', 'Movie']
    for i, media_type in enumerate(media_types, 1):
        print(f"INSERT INTO mediaType (mediaTypeID, type) VALUES ({i}, '{media_type}');")
    # Generate additional rows
    for i in range(len(media_types) + 1, num_rows + 1):
        random_type = random.choice(media_types)  # Choose randomly from predefined media types
        print(f"INSERT INTO mediaType (mediaTypeID, type) VALUES ({i}, '{random_type}');")

def generate_genres(min_rows=30, max_rows=60):
    print("\n-- Generating genres")
    num_rows = random.randint(min_rows, max_rows)
    genres = ['Business', 'Self-Help', 'Science Fiction', 'Comedy', 'Drama', 'Romance']
    for i, genre in enumerate(genres, 1):
        print(f"INSERT INTO genre (genreID, genre) VALUES ({i}, '{genre}');")
    # Generate additional rows
    for i in range(len(genres) + 1, num_rows + 1):
        random_genre = random.choice(genres)  # Choose randomly from predefined genres
        print(f"INSERT INTO genre (genreID, genre) VALUES ({i}, '{random_genre}');")

def generate_media(n):
    print("\n-- Generating media")
    for i in range(1, n+1):
        title = fake.sentence(nb_words=6)
        media_type_id = random.randint(1, 3)  # Assuming mediaTypeIDs are 1, 2, 3 for Song, Book, Movie
        rating = random.uniform(1, 5)
        genre_id = random.randint(1, 6)
        mood_id = random.randint(1, 60)
        print(f"INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES ({i}, '{title}', {media_type_id}, {i}, {rating}, {genre_id}, {mood_id});")

def generate_books(n):
    print("\n-- Generating books")
    for i in range(1, random.randint(40, 81)):  # Adjust range between 40 and 80
        author = fake.name()
        description = fake.text(max_nb_chars=200)
        pages = random.randint(100, 1000)
        media_id = i  # This assumes mediaID matches bookID 1-to-1
        print(f"INSERT INTO book (bookID, author, description, pages, mediaID) VALUES ({i}, '{author}', '{description}', {pages}, {media_id});")

def generate_songs(n):
    print("\n-- Generating songs")
    for i in range(1, random.randint(40, 81)):  # Adjust range between 40 and 80
        artist = fake.name()
        bpm = random.randint(60, 160)
        length = random.randint(180, 300)  # in seconds
        media_id = i + n  # Ensuring unique IDs by offsetting by n
        print(f"INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES ({i}, '{artist}', {bpm}, {length}, {media_id});")

def generate_movies(n):
    print("\n-- Generating movies")
    for i in range(1, random.randint(40, 81)):  # Adjust range between 40 and 80
        director = fake.name()
        description = fake.text(max_nb_chars=500)
        length = random.randint(80, 180)  # in minutes
        media_id = i + 2*n  # Further offset by 2n
        print(f"INSERT INTO movie (movieID, director, description, length, mediaID) VALUES ({i}, '{director}', '{description}', {length}, {media_id});")

def generate_reviews(n):
    print("\n-- Generating reviews")
    for i in range(1, n+1):
        media_id = random.randint(1, n_weak)
        user_id = random.randint(1, n_users)
        description = fake.text(max_nb_chars=500)
        rating = random.randint(1, 5)
        print(f"INSERT INTO review (reviewID, media, description, rating, user) VALUES ({i}, {media_id}, '{description}', {rating}, {user_id});")

def generate_logs(n):
    print("\n-- Generating logs")
    for i in range(1, n+1):
        user_id = random.randint(1, n_users)
        media_id = random.randint(1, n_weak)
        favorite = random.choice([True, False])
        rating = random.randint(1, 5)
        review = fake.text(max_nb_chars=200)
        print(f"INSERT INTO log (logID, userID, mediaID, favorite, rating, review) VALUES ({i}, {user_id}, {media_id}, {favorite}, {rating}, '{review}');")

def generate_journal_entries(n):
    print("\n-- Generating journal entries")
    for i in range(1, n+1):
        user_id = random.randint(1, n_users)
        title = fake.sentence(nb_words=6)
        text = fake.text(max_nb_chars=1000)
        date = fake.date_time_this_year(before_now=True, after_now=False)
        print(f"INSERT INTO journalEntry (journalID, title, text, user, date) VALUES ({i}, '{title}', '{text}', {user_id}, '{date}');")

def generate_user_goals(n):
    print("\n-- Generating user goals")
    for i in range(1, n+1):
        user_id = random.randint(1, n_users)
        text = fake.sentence(nb_words=12)
        deadline = fake.date_between(start_date="now", end_date="+2y")
        print(f"INSERT INTO userGoal (goalID, text, user, deadline) VALUES ({i}, '{text}', {user_id}, '{deadline}');")

# Define the quantity of each data type
n_strong = 50  # for colorScheme, mood
n_weak = 80  # for media, books, songs, movies
n_users = 30  # for users

generate_color_schemes(n_strong)
generate_moods(n_strong)
generate_users(n_users)
generate_media_types()
generate_genres()

generate_media(n_weak)
generate_books(n_weak // 3)  # Distributing the quantities for books, songs, and movies
generate_songs(n_weak // 3)
generate_movies(n_weak // 3)
generate_reviews(200)  # Generating 200 reviews as suggested for bridge tables
generate_logs(200)  # Similarly, generating 200 logs
generate_journal_entries(40)  # Example for slightly larger data sets in related tables
generate_user_goals(40)  # Example for goal tracking
