#New
from faker import Faker
import random

fake = Faker()




def generate_color_schemes(n):
    print("-- Generating color schemes")
    for i in range(1, n+1):
        print("")
    # print(f"INSERT INTO colorScheme (colorSchemeID, name, headerColor, textColor, backgroundColor) VALUES ({i}, '{fake.color_name()}', '{fake.hex_color()}', '{fake.hex_color()}', '{fake.hex_color()}');")

def generate_moods(n):
    print("\n-- Generating moods")
    for i in range(1, n+1):
        color_scheme_id = random.randint(1, n)
        #print(f"INSERT INTO mood (moodID, name, colorScheme) VALUES ({i}, '{fake.word()}', {color_scheme_id});")

def generate_users(n):
    print("\n-- Generating users")
    biographies = [
    "Adventure seeker exploring the world one step at a time.",
    "Passionate foodie on a culinary journey.",
    "Bookworm with a love for fiction and fantasy worlds.",
    "Tech enthusiast exploring the latest gadgets and innovations.",
    "Fitness fanatic chasing new personal records.",
    "Nature lover hiking through scenic trails.",
    "Aspiring artist capturing life's beauty through art.",
    "Music lover with a diverse taste in genres.",
    "Fashionista staying ahead of the latest trends.",
    "History buff fascinated by ancient civilizations.",
    "Animal lover advocating for pet adoption.",
    "Entrepreneur building dreams from the ground up.",
    "Yoga practitioner finding zen in daily practice.",
    "Film buff with a passion for classic cinema.",
    "DIY enthusiast creating unique crafts and projects.",
    "Environmental activist promoting sustainable living.",
    "Fitness instructor inspiring others to lead healthier lives.",
    "Travel enthusiast exploring cultures around the globe.",
    "Sports fan cheering for the home team.",
    "Aspiring writer crafting stories that resonate.",
    "Tech-savvy gamer mastering virtual worlds.",
    "Art collector with an eye for creativity.",
    "Parent juggling work and family with love.",
    "Coffee connoisseur seeking the perfect brew.",
    "Musician creating melodies that move the soul.",
    "Fitness coach empowering clients to reach their goals.",
    "History teacher educating minds one lesson at a time.",
    "Animal rights advocate fighting for furry friends.",
    "Entrepreneurial spirit with big dreams and determination.",
    "Nature photographer capturing beauty in simplicity.",
    "Movie critic analyzing films with a keen eye.",
    "Craft beer enthusiast exploring unique brews.",
    "Self-help guru sharing wisdom for personal growth.",
    "Digital nomad working remotely from exotic locations.",
    "Community activist making positive changes in society.",
    "Fitness blogger inspiring healthy lifestyles online.",
    "Vintage collector preserving history through antiques.",
    "Wellness coach promoting holistic health and mindfulness.",
    "Social media influencer sharing life's adventures.",
    "Startup founder disrupting industries with innovation.",
    "Language enthusiast learning new tongues and cultures.",
    "Finance expert helping others achieve financial freedom.",
    "Educator shaping young minds for a brighter future.",
    "Gardening enthusiast nurturing plants and green spaces.",
    "Podcast host discussing topics that matter.",
    "Minimalist embracing simplicity and mindful living.",
    "Dreamer with big aspirations and endless possibilities.",
    "Volunteer making a difference in the community.",
    "Home chef experimenting with recipes and flavors.",
    "Interior designer creating spaces that inspire.",
    "Tech entrepreneur bridging gaps with digital solutions.",
    "Film director bringing stories to life on the screen.",
    "Fitness model motivating others with dedication.",
    "Vintage fashion lover with a retro flair.",
    "Motivational speaker empowering audiences worldwide.",
    "Freelance writer crafting words that resonate.",
    "Outdoor enthusiast seeking adventure in nature.",
    "Personal trainer pushing boundaries for fitness goals.",
    "Art curator showcasing talent and creativity.",
    "Social justice advocate fighting for equality.",
    "Digital artist creating digital masterpieces.",
    "Health coach promoting holistic wellness.",
    "Historian preserving the past for future generations.",
    "Creative director shaping visual narratives.",
    "Animal rescuer providing love and care to furry friends.",
    "Political activist advocating for change.",
    "Music producer creating beats that move the soul.",
    "Startup enthusiast with a vision for innovation.",
    "Lifestyle blogger sharing insights on living well.",
    "Fashion designer blending style and sustainability.",
    "Life coach guiding others to find their purpose.",
    "Tech blogger exploring the latest tech trends.",
    "Fitness competitor pushing limits for success.",
    "Vintage car enthusiast restoring classic automobiles.",
    "Motivational author inspiring readers with stories.",
    "Hiking enthusiast conquering trails and peaks.",
    "Gymnastics coach training athletes for success.",
    "Art therapist using creativity for healing.",
    "Community organizer bringing people together for causes.",
    "Digital marketer driving growth and engagement.",
    "Cooking instructor sharing culinary expertise.",
    "Sustainability advocate promoting eco-friendly practices."
]
    for i in range(0, 80):
        mood_id = random.randint(1, 50)
        biography = biographies[i]
        print(f"INSERT INTO user (userID, name, biography, email, phoneNumber, mood) VALUES ({i}, '{fake.name()}', '{biography}', '{fake.email()}', '{fake.phone_number()}', {mood_id});")

def generate_media_types(min_rows=30, max_rows=60):
    print("\n-- Generating media types")
    num_rows = random.randint(min_rows, max_rows)
    media_types = ['Song', 'Book', 'Movie']
    # for i, media_type in enumerate(media_types, 1):
    #     print(f"INSERT INTO mediaType (mediaTypeID, type) VALUES ({i}, '{media_type}');")
    # # Generate additional rows
    # for i in range(len(media_types) + 1, num_rows + 1):
    #     random_type = random.choice(media_types)  # Choose randomly from predefined media types
    #     print(f"INSERT INTO mediaType (mediaTypeID, type) VALUES ({i}, '{random_type}');")

def generate_genres(min_rows=30, max_rows=60):
    print("\n-- Generating genres")
    num_rows = random.randint(min_rows, max_rows)
    book_genres = [
    'Fantasy',
    'Science Fiction',
    'Mystery',
    'Romance',
    'Thriller',
    'Historical Fiction',
    'Horror',
    'Adventure',
    'Literary Fiction',
    'Young Adult',
    'Non-fiction',
    'Biography/Autobiography',
    'Self-help',
    'Business/Finance',
    'Travel',
    'Poetry',
    'Humor',
    'Drama',
    'Crime',
    'Suspense'
]
    song_genres = [
    'Pop',
    'Rock',
    'Hip Hop/Rap',
    'Country',
    'Electronic/Dance',
    'R&B/Soul',
    'Reggae',
    'Jazz',
    'Classical',
    'Indie',
    'Alternative',
    'Folk',
    'Metal',
    'Punk',
    'Blues',
    'Gospel',
    'Funk',
    'World',
    'Instrumental',
    'Experimental'
]
    movie_genres = [
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Thriller',
    'Adventure',
    'Science Fiction',
    'Fantasy',
    'Romance',
    'Crime',
    'Mystery',
    'Animation',
    'Family',
    'Documentary',
    'Biography',
    'History',
    'War',
    'Musical',
    'Western',
    'Sports'
]

    # for i, genre in enumerate(movie_genres, 1):
    #     print(f"INSERT INTO genre (genreID, genre) VALUES ({i}, '{genre}');")
    # for i, genre in enumerate(song_genres, 21):
    #     print(f"INSERT INTO genre (genreID, genre) VALUES ({i}, '{genre}');")
    # for i, genre in enumerate(book_genres, 41):
    #     print(f"INSERT INTO genre (genreID, genre) VALUES ({i}, '{genre}');")
    
## 1-20 movie, 21-40 song, 41-60 is book
def generate_media(n):
    print("\n-- Generating media")
    
    book_titles = [
    "Shadows in the Mist",
    "Whispering Wind",
    "Echoes of Tomorrow",
    "Dancing with Fire",
    "Midnight Serenade",
    "Secrets of the Heart",
    "Lost in Time",
    "Reflections in Water",
    "Beyond the Horizon",
    "Starlight Symphony",
    "Journey to Infinity",
    "Dreams of Destiny",
    "Enchanted Garden",
    "Tales of Twilight",
    "Whispers in the Wind",
    "Echoes of Eternity",
    "Midnight Magic",
    "Shattered Dreams",
    "Dancing with Shadows",
    "Secrets of the Past",
    "Lost and Found",
    "Reflections of Love",
    "Across the Universe",
    "Starry Night",
    "Journey to Freedom",
    "Dreams of Dawn",
    "Enchanted Forest",
    "Tales of Wonder",
    "Whispers of Wisdom",
    "Echoes of Silence"
]
    song_titles = [
    "Starlight Symphony",
    "Neon Dreams",
    "City of Echoes",
    "Midnight Melodies",
    "Soul Serenade",
    "Whispers of the Heart",
    "Celestial Harmonies",
    "Electric Euphoria",
    "Moonlit Melancholy",
    "Radiant Rhythms",
    "Vibrant Visions",
    "Dreams Unfold",
    "Siren's Song",
    "Twilight Tango",
    "Melodic Mirage",
    "Echoes in the Void",
    "Harmony Haven",
    "Stardust Sonata",
    "Cosmic Cadence",
    "Aurora Anthem",
    "Mystic Melodies",
    "Whispering Waters",
    "Lunar Lullaby",
    "Enchanted Embrace",
    "Rhythmic Reverie",
    "Serene Soundscape",
    "Ethereal Elegance",
    "Radiant Reflections",
    "Starlit Serenity",
    "Nebula Nocturne"
]
    movie_titles = [
    "The Monkey King",
    "The Yellow Mile",
    "Silence of the Children",
    "The Grand Wizard",
    "Starlight Serenade",
    "Midnight's Symphony",
    "Echoes of the Past",
    "Dreamscape",
    "Velvet Shadows",
    "The Phoenix Rises",
    "Ocean of Stars",
    "Chasing Shadows",
    "Whispers in the Dark",
    "The Enigma Chronicles",
    "Journey to Eternity",
    "Echoes of Destiny",
    "Dance of the Fallen",
    "Symphony of Secrets",
    "The Legend of Ashen Falls",
    "Twilight Reverie",
    "The Secret Garden",
    "The Wandering Muse",
    "Beyond the Horizon",
    "Symphony of Dreams",
    "The Alchemist's Journey",
    "The Lost Chord",
    "Shadows of Yesterday",
    "The Forgotten Symphony",
    "Elysian Echoes",
    "Serenade of Souls"
]   
    
    print("------books")
    x = 0 
    y = 0 
    z = 0 
    # for i in range(41, 61):

    #     title = book_titles[x]
    #     x = x + 1 
    #     media_type_id = 2  # Assuming mediaTypeID 2 for Book
    #     rating = random.randint(1, 5)
    #     genre_id = i  # Genre ID between 40 and 60
    #     mood_id = random.randint(1, 60)
    #     print(f"INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES ({i}, '{title}', {media_type_id}, {i}, {rating}, {genre_id}, {mood_id});")
    # print("------songs")
    # for i in range(1, 21):
        
    #     title = movie_titles[y]
    #     y = y+ 1
    #     media_type_id = 3  # Assuming mediaTypeID 3 for Movie
    #     rating = random.randint(1, 5)
    #     genre_id = i  # Genre ID between 40 and 60
    #     mood_id = random.randint(1, 60)
    #     print(f"INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES ({i}, '{title}', {media_type_id}, {i}, {rating}, {genre_id}, {mood_id});")
    # print("------songs")
    # for i in range(21, 41):
    #     title = song_titles[z]
    #     z = z + 1
    #     media_type_id = 1  # Assuming mediaTypeID 1 for Song
    #     rating = random.randint(1, 5)
    #     genre_id = i  
    #     mood_id = random.randint(1, 60)
    #     print(f"INSERT INTO media (mediaID, title, mediaType, media, rating, genre, mood) VALUES ({i}, '{title}', {media_type_id}, {i}, {rating}, {genre_id}, {mood_id});")
def generate_books(n):
    print("\n-- Generating books")
    descriptions = [
    "The Enchanted Forest: A captivating fantasy novel filled with magic and mythical creatures.",
    "Galactic Chronicles: An epic science fiction saga spanning across galaxies and civilizations.",
    "The Curious Case of Mr. Jenkins: A mysterious mystery novel with twists and turns at every corner.",
    "Love in Bloom: A heartwarming romance about second chances and the power of love.",
    "The Shadow's Whisper: A thrilling thriller that keeps you on the edge of your seat until the final page.",
    "Echoes of the Past: A gripping historical fiction tale set against the backdrop of a tumultuous era.",
    "Nightmare Avenue: A spine-chilling horror story that will haunt your dreams.",
    "Quest for the Lost Artifact: An adventurous journey filled with treasure hunts and ancient mysteries.",
    "The Art of Reflection: A thought-provoking literary fiction exploring life's complexities and human nature.",
    "Chronicles of the Chosen: A captivating young adult fantasy adventure with heroes and villains.",
    "Beyond the Horizon: A non-fiction exploration of the wonders of the natural world and human discovery.",
    "In the Footsteps of Greatness: A biography/autobiography celebrating inspiring individuals and their journeys.",
    "The Path to Success: A self-help guide to achieving your dreams and unlocking your potential.",
    "Wealth Beyond Measure: A business/finance book offering insights into financial prosperity and success.",
    "Wanderlust: A travel memoir recounting adventures and cultural experiences from around the globe.",
    "Whispers of the Heart: A collection of poignant poetry that touches the soul.",
    "Laugh Out Loud: A humorous novel that will have you laughing from start to finish.",
    "Tears of the Soul: A gripping drama exploring themes of love, loss, and redemption.",
    "The Case of the Missing Heir: A crime novel full of suspense, mystery, and unexpected revelations.",
    "The Silent Witness: A suspenseful thriller with a gripping storyline and unforgettable characters."
]
    z = 0
    for i in range(41, 61):  
        author = fake.name()
        description = descriptions[z]
        z = z +1
        pages = random.randint(100, 1000)
        media_id = i 
        print(f"INSERT INTO book (bookID, author, description, pages, mediaID) VALUES ({i}, '{author}', '{description}', {pages}, {media_id});")

def generate_songs(n):
    print("\n-- Generating songs")
    for i in range(21, 41):  # Adjust range between 40 and 80
        artist = fake.name()
        bpm = random.randint(60, 160)
        length = random.randint(180, 300)  # in seconds
        media_id = i   # Ensuring unique IDs by offsetting by n
        # print(f"INSERT INTO song (songID, artist, BPM, length, mediaID) VALUES ({i}, '{artist}', {bpm}, {length}, {media_id});")

def generate_movies(n):
    print("\n-- Generating movies")
    descriptions = [
    "A thrilling action-packed film that keeps you on the edge of your seat from start to finish.",
    "A hilarious comedy that will have you laughing out loud with its witty jokes and charming characters.",
    "A gripping drama that delves deep into the human experience, showcasing raw emotions and powerful storytelling.",
    "A chilling horror movie that will send shivers down your spine and leave you checking over your shoulder.",
    "A heart-pounding thriller filled with suspense, twists, and unexpected turns that will keep you guessing.",
    "An adventurous tale that takes you on a journey to uncharted lands, brimming with excitement and discovery.",
    "An imaginative science fiction epic that explores futuristic worlds, advanced technology, and the unknown.",
    "A fantastical adventure set in a magical realm full of mythical creatures and enchanting wonders.",
    "A romantic story of love, passion, and heartache that captures the complexities of relationships.",
    "A crime thriller that unravels mysteries, solves puzzles, and exposes the dark underbelly of society.",
    "A mysterious film that keeps you guessing until the very end, with twists and revelations that surprise.",
    "An animated delight that brings characters to life in colorful, whimsical worlds with captivating stories.",
    "A heartwarming family film that entertains audiences of all ages with its charm and positive messages.",
    "A thought-provoking documentary that sheds light on real-world issues, events, and people.",
    "An inspiring biographical film that tells the remarkable story of a person's life and achievements.",
    "A historical epic that transports viewers to pivotal moments in history, showcasing drama and heroism.",
    "A gripping war movie that portrays the intensity, bravery, and sacrifices of soldiers in battle.",
    "A musical extravaganza filled with catchy tunes, lively choreography, and unforgettable performances.",
    "A classic Western tale of frontier justice, showdowns, and rugged landscapes."
]
    z = 0
    for i in range(1, random.randint(1, 21)):  
       
        director = fake.name()
        description = descriptions[z]
        z  = z +1
        
        length = random.randint(80, 180)  # in minutes
        media_id = i   # Further offset by 2n
       # print(f"INSERT INTO movie (movieID, director, description, length, mediaID) VALUES ({i}, '{director}', '{description}', {length}, {media_id});")

def generate_reviews(n):
    print("\n-- Generating reviews")
    media_reviews = [
    # Movie Reviews
    "As a fan of action-packed films, I was thrilled by the intense sequences and adrenaline-pumping stunts in this movie. A must-watch for action lovers!",
    "This comedy had me laughing uncontrollably from start to finish. The humor was spot-on, and the comedic timing of the actors was impeccable.",
    "I'm a huge fan of drama, and this movie delivered powerful performances that tugged at my heartstrings. A moving story beautifully portrayed.",
    "Horror movies are my guilty pleasure, and this one delivered the scares! I found myself jumping at every shadow long after the movie ended.",
    "A gripping thriller that kept me on the edge of my seat throughout. The plot twists were unexpected, and the suspense was palpable.",
    "An adventurous journey that took me on a thrilling ride. I felt like I was part of the action, exploring new worlds and facing danger at every turn.",
    "As a sci-fi enthusiast, I was blown away by the imaginative concepts and futuristic visuals in this epic. A mind-bending experience!",
    "Fantasy is my favorite genre, and this movie transported me to a magical realm filled with wonder and enchantment. A fantastic escape!",
    "A romantic story that captured the essence of love and longing. I was swept away by the chemistry between the leads and their emotional journey.",
    "This crime thriller had me guessing until the very end. The plot twists kept me hooked, and the suspense was relentless.",
    "A mysterious film that kept me intrigued from start to finish. The plot unraveled at the perfect pace, keeping me guessing until the last scene.",
    "An animated delight that brought out the child in me. The colorful animation and lovable characters made it a joy to watch.",
    "A heartwarming family film that resonated with me on a personal level. It's rare to find a movie that entertains and inspires across generations.",
    "This documentary shed light on important issues close to my heart. It was informative, eye-opening, and left a lasting impact.",
    "An inspiring biographical film that celebrated the life of a remarkable individual. Their journey was portrayed with authenticity and respect.",
    "A historical epic that brought a pivotal moment in history to life. The attention to detail and immersive storytelling were captivating.",
    "A gripping war movie that showcased the bravery and sacrifices of soldiers. It left me with a deep appreciation for their courage.",
    "A musical extravaganza that had me tapping my feet and humming the tunes long after the credits rolled. A delightful experience!",
    "A classic Western adventure that captured the essence of frontier justice and rugged landscapes. It felt like a journey back in time.",
    "A disappointing film that fell short of my expectations. The plot lacked depth, and the characters felt one-dimensional.",
    "A comedy that missed the mark with its jokes and failed to elicit more than a few chuckles. It felt like a comedy of errors.",

    # Song Reviews
    "A catchy pop tune that gets stuck in your head and makes you want to dance. Perfect for a fun night out!",
    "A rock anthem with powerful guitar riffs and an infectious energy. It's hard not to headbang along to this one.",
    "This hip hop/rap track brings the beats and clever lyrics that keep you nodding your head. A must-listen for fans of the genre.",
    "A country ballad that tells a heartfelt story with soulful vocals and twangy guitars. It captures the essence of country music.",
    "An electronic/dance track that gets the party started with pulsating beats and electrifying synths. It's impossible not to move to this rhythm.",
    "Smooth R&B/soul vibes that soothe the soul and groove with soulful melodies. Perfect for a chill evening.",
    "Reggae rhythms that transport you to a laid-back paradise with sunny vibes and infectious positivity.",
    "Jazz improvisations and smooth melodies that create a sophisticated atmosphere. A treat for jazz enthusiasts.",
    "Classical compositions that showcase timeless beauty and orchestral grandeur. A symphony of musical excellence.",
    "Indie sounds that break the mold with quirky melodies and introspective lyrics. A breath of fresh air in the music scene.",
    "Alternative rock that explores new sonic territories with edgy guitars and raw emotions. It's rebellious and authentic.",
    "Folk storytelling that captures the essence of tradition and roots with acoustic melodies and heartfelt lyrics.",
    "Metal mayhem with thunderous drums and roaring guitars. It's intense and adrenaline-fueled.",
    "Punk energy that hits hard with fast-paced rhythms and rebellious attitude. It's a burst of raw power.",
    "Blues soulfulness that delves into the depths of emotion with soulful vocals and melancholic melodies.",
    "Gospel inspiration that uplifts the spirit with powerful vocals and uplifting messages. It's soul-stirring.",
    "Funky grooves that make you move and groove with infectious rhythms and lively instrumentation.",
    "World music that takes you on a global journey with diverse sounds and cultural influences. It's a celebration of musical diversity.",
    "Instrumental compositions that showcase musical prowess and emotive melodies. A canvas for imagination and emotion.",
    "Experimental sounds that push the boundaries of music with innovative techniques and unconventional styles. It's music for the adventurous.",

    # Book Reviews
    "A captivating page-turner with twists and surprises at every chapter.",
    "Heartwarming characters and a compelling storyline that tugs at your emotions.",
    "An epic fantasy adventure with intricate world-building and rich mythology.",
    "A thought-provoking literary masterpiece that delves into existential themes.",
    "A gripping mystery that keeps you guessing until the very end.",
    "Historical fiction that brings the past to life with vivid detail and authenticity.",
    "A romantic novel that explores the complexities of love and relationships.",
    "A thrilling suspense novel with plot twists that keep you on the edge of your seat.",
    "Inspirational self-help book with practical advice for personal growth.",
    "A powerful memoir that shares personal experiences and life lessons.",
    "A humorous satire that takes a witty look at society and human behavior.",
    "An enlightening biography that tells the life story of a remarkable individual.",
    "A science fiction masterpiece that pushes the boundaries of imagination.",
    "A heartwarming children's book with valuable lessons and delightful illustrations.",
    "A guidebook to adventure, filled with tips and tricks for exploring the great outdoors.",
    "A collection of poetry that evokes deep emotions and introspection.",
    "An educational non-fiction book that informs and enlightens readers.",
    "A thrilling crime novel with twists and turns in every chapter.",
    "A captivating young adult novel with relatable characters and coming-of-age themes.",
    "A travelogue that takes you on a journey to exotic destinations and cultural experiences."
]
    for i in range(0, 60):
        media_id = i
        user_id = random.randint(1, n_users)
        description = media_reviews[i]
        rating = random.randint(1, 5)
        if rating > 3:
            favorite = random.choice([True, False])
        else:
            favorite = False
        #print(f"INSERT INTO log (reviewID, media, description, rating, user) VALUES ({i}, {media_id}, '{description}', {rating}, {user_id});")

def generate_journal_entries(n):
    print("\n-- Generating journal entries")
    journal_entries = [
    "Today was a whirlwind of emotions, from moments of joy to deep reflection.",
    "Waking up to a sunny day filled me with gratitude for the simple joys of life.",
    "This week has been a rollercoaster of highs and lows, reminding me of life's unpredictability.",
    "Exciting news! I received acceptance into my dream medical school, a culmination of hard work and perseverance.",
    "Feeling a bit somber today, reflecting on past memories and the passage of time.",
    "Sharing the news of my acceptance into med school with friends and family brought tears of joy and pride.",
    "Looking back at old photographs, reminiscing about cherished moments and friendships.",
    "Today's journal entry is a journey of self-discovery and personal growth.",
    "Lost in thoughts about the future, dreams, and aspirations waiting to be fulfilled.",
    "Embarking on new adventures, exploring unfamiliar paths with curiosity and excitement.",
    "Writing down my dreams and aspirations, setting goals to turn them into reality.",
    "The creative juices are flowing today, channeling inspiration into artistic expression.",
    "Finding inner peace amidst the chaos, a moment of stillness and tranquility.",
    "Exploring new horizons, stepping out of comfort zones to embrace new experiences.",
    "Lessons learned from past challenges, turning obstacles into opportunities for growth.",
    "Immersed in nature's beauty, feeling connected to the earth and its wonders.",
    "Capturing moments of joy and laughter, preserving memories to cherish forever.",
    "Reflecting on the path ahead, setting intentions for a purposeful journey.",
    "Embracing change with an open heart and mind, welcoming new beginnings.",
    "Seeking inspiration from books, art, and music to fuel creativity and passion.",
    "Musings on life's mysteries, pondering the meaning of existence and purpose.",
    "Gratitude journal entry, counting blessings and expressing appreciation for life's blessings.",
    "Heartfelt reflections on love, relationships, and the bonds that enrich our lives.",
    "Mindful moments of meditation and introspection, finding calm in the present moment.",
    "A walk down memory lane, revisiting nostalgic places and cherished memories.",
    "The power of positivity, cultivating optimism and resilience in challenging times.",
    "Stepping out of comfort zones, embracing new challenges and growth opportunities.",
    "Overcoming challenges with determination and perseverance, celebrating small victories.",
    "Celebrating achievements, acknowledging milestones and accomplishments with pride.",
    "Notes from the journey, documenting experiences and lessons learned along the way.",
    "Finding balance in work, life, and personal well-being, prioritizing self-care.",
    "The beauty of simplicity, finding joy in life's little pleasures and moments of serenity.",
    "Inner strength journal entry, tapping into resilience and inner resources during tough times.",
    "Daily affirmations of positivity, self-love, and confidence to start the day on a high note.",
    "Navigating uncertainty with courage and faith, trusting in the journey ahead.",
    "Embracing creativity as a form of self-expression and exploration.",
    "Moments of joy and laughter shared with loved ones, creating cherished memories.",
    "Facing fears head-on, stepping outside comfort zones to embrace growth and courage.",
    "Personal growth journal entry, reflecting on progress, setbacks, and lessons learned.",
    "Looking back at past experiences and milestones, acknowledging personal growth and evolution.",
    "The art of mindfulness, practicing presence and awareness in daily life.",
    "Appreciating life's little pleasures, finding happiness in everyday moments.",
    "Dreaming big and setting ambitious goals, fueled by passion and determination.",
    "Reflections on relationships, expressing gratitude for the people who enrich my life.",
    "Wellness check-in, assessing mental, emotional, and physical well-being.",
    "Adventures in learning, exploring new knowledge and expanding horizons.",
    "Building resilience in the face of challenges, finding strength in adversity.",
    "Inspiring others through acts of kindness, compassion, and positive influence.",
    "A grateful heart journal entry, acknowledging blessings and abundance in life.",
    "Time capsule notes, capturing thoughts, feelings, and experiences for future reflection."
]
    journal_titles = [
    "My Reflections",
    "Journey of Self-Discovery",
    "Embracing Change",
    "Moments of Joy",
    "Navigating Life's Path",
    "Inspirations and Aspirations",
    "Whispers of the Heart",
    "The Power of Positivity",
    "Embracing New Beginnings",
    "Musings on Life",
    "Gratitude Journal",
    "Chasing Dreams",
    "Finding Inner Peace",
    "Capturing Memories",
    "Lessons Learned",
    "Nature's Beauty",
    "Life's Adventures",
    "Paths Less Traveled",
    "Dreams and Goals",
    "Creative Expressions",
    "Mysteries of Existence",
    "Heartfelt Moments",
    "Mindful Living",
    "Echoes of the Past",
    "Counting Blessings",
    "Love and Relationships",
    "Moments of Serenity",
    "Strength and Resilience",
    "Daily Affirmations",
    "Courage and Faith",
    "The Creative Journey",
    "Celebrating Life",
    "Overcoming Obstacles",
    "Notes from the Heart",
    "Finding Balance",
    "Simple Joys",
    "Inner Strength",
    "Positive Affirmations",
    "Courageous Steps",
    "Growth and Evolution",
    "Moments of Mindfulness",
    "Little Pleasures",
    "Dream Big",
    "Reflections on Life",
    "Wellness Check-In",
    "Adventures in Learning",
    "Building Resilience",
    "Inspiring Others",
    "A Grateful Heart",
    "Time Capsule Notes"
]
    for i in range(0, 50):
        user_id = random.randint(1, n_users)
        title = journal_titles[i]
        text = journal_entries[i]
        date = fake.date_time_this_year(before_now=True, after_now=False)
        #print(f"INSERT INTO journalEntry (journalID, title, text, user, date) VALUES ({i}, '{title}', '{text}', {user_id}, '{date}');")

def generate_user_goals(n):
    print("\n-- Generating user goals")
    goals = [
    "Read 50 books in a year.",
    "Learn to play the guitar.",
    "Travel to at least three new countries.",
    "Start a daily meditation practice.",
    "Complete a marathon.",
    "Learn a new language fluently.",
    "Volunteer regularly at a local charity.",
    "Start a blog or YouTube channel.",
    "Cook one new recipe every week.",
    "Save enough money for a down payment on a house.",
    "Get certified in a professional skill.",
    "Write a novel.",
    "Take up painting or drawing.",
    "Learn to code.",
    "Practice yoga regularly.",
    "Start a small business.",
    "Learn to cook a signature dish.",
    "Get in shape and maintain a healthy lifestyle.",
    "Start a garden and grow your own vegetables.",
    "Volunteer for a cause you're passionate about.",
    "Complete a home renovation project.",
    "Learn to play a new sport.",
    "Improve your public speaking skills.",
    "Take up photography as a hobby.",
    "Learn to knit or crochet.",
    "Write and publish a children's book.",
    "Start a podcast.",
    "Learn to sew and make your own clothes.",
    "Learn about investing and start saving for retirement.",
    "Take a solo trip.",
    "Master a new technology or software.",
    "Learn to dance salsa or another style.",
    "Get involved in local community events.",
    "Complete a DIY project.",
    "Take up rock climbing or another adventurous activity.",
    "Learn to play chess or another strategy game.",
    "Complete a fitness challenge, like a 30-day workout program.",
    "Take a course in a subject you've always been curious about.",
    "Improve your time management skills.",
    "Start a journaling habit.",
    "Learn to play a musical instrument you've always wanted to learn.",
    "Volunteer for environmental conservation efforts.",
    "Get involved in mentorship or tutoring.",
    "Start a book club.",
    "Learn about sustainable living practices.",
    "Get involved in local politics or advocacy.",
    "Improve your networking skills.",
    "Learn to bake and master a signature dessert.",
    "Start a daily gratitude practice.",
    "Complete a personal development program."
]

    for i in range(0, 50):
        user_id = random.randint(1, n_users)
        text = goals[i]
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
#generate_logs(200)  # Similarly, generating 200 logs
generate_journal_entries(40)  # Example for slightly larger data sets in related tables
generate_user_goals(40)  # Example for goal tracking
