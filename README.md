# Overview of Project
## Members: 
1. Ashlynn Braisted (Point Person)
2. Jacqueline Deieso
3. John Rotondo
4. Tyler Mckenzie
5. Owen Brand

## Project Description:
The Personal Media Journal project, designed & implemented by Mark's Minions, aims to enhance users' media consumption experience through a customizable application. This app allows users to receive media recommendations based on their mood, filter media by type, review the media they've consumed, & personalize their profiles with favorite media selections. This is a personal journal designed solely for the user themselves. The app includes various features distributed across 8 main screens broken up into 4 categories:

1. **Profile**: This is where a user can view information about oneself & set goals. The first screen will showcase a user's profile, displaying details about Mood, Logs, Journal Entries, & Goals. The second screen will show another example of how the profile can be displayed.
2. **Home**: This is where a user can customize their UI & view recommendations. The first screen will show daily recommendations, & the second will show mood recommendations.
3. **Logging**: This is where a user can input reviews and journals. The first will be a review screen & the second will be the journal.
4. **Search**: This will allow a user to filter through results. The first displayed is a search screen & the second is the results screen. 

## User Personas & Stories
1. **Taylor Mack**: A 28-year-old freelance writer interested in creative writing, yoga, & mindfulness. Taylor uses the app for self-expression & emotional well-being.
2. **Jack Dell**: A 30-year-old tech startup CEO who values efficiency & seeks to optimize his leisure time with media that enhances his personal & professional development.
3. **Ashton Bray**: A 22-year-old university student majoring in cultural studies, interested in using the app for educational purposes & personal discovery.
4. **Jason Bol**: A 39-year-old data analyst who uses the app analytically to engage with media critically & organize his media consumption data.

## Review of Routes

## Link to Demo Video

# Information About Starting Docker Containers


## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 




