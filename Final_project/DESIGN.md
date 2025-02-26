# Design Document

By Mohammad Ibraheem

Video overview: https://youtu.be/QmBtLzM-ggo


## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
spotify database
* Which people, places, things, etc. are you including in the scope of your database?
Users who interact with the platform.
Artists who create songs.
Songs that are uploaded to the platform.
Playlists that users create, containing songs.
Follows that allow users to follow their favorite artists.
Likes that allow users to like specific songs.
Listening history to track which songs users listen to and when.

* Which people, places, things, etc. are *outside* the scope of your database?
Recommendations or AI-driven suggestions.
Subscription plans (free vs. premium accounts).

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
Users should be able to:
Create an account.
Follow their favorite artists.
Like songs to save them in a personal collection.
Create and manage playlists by adding or removing songs.
View listening history to track previously played songs.
Search for songs and artists using indexes.

* What's beyond the scope of what a user should be able to do with your database?
Upload their own songs.
Share playlists with other users

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
* What attributes will those entities have?
* Why did you choose the types you did?
* Why did you choose the constraints you did?

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.
The database models the following entities:

Users

id (INTEGER, Primary Key)
username (TEXT, Unique)
email (TEXT, Unique)
password (TEXT)
nationality (TEXT)
Why?
id is the primary identifier for each user.
email is unique to ensure distinct accounts.
password is stored as text (though in a real-world system, it should be hashed).
Artists

id (INTEGER, Primary Key)
artist_name (TEXT)
nationality (TEXT)
Why?
id ensures unique identification of each artist.
artist_name allows users to search for their favorite musicians.
Songs

id (INTEGER, Primary Key)
artist_id (INTEGER, Foreign Key to artists.id)
song_name (TEXT)
song_url (TEXT)
Why?
artist_id establishes the relationship between a song and its creator.
song_url links to an external platform where the song is hosted.
Playlists

id (INTEGER)
user_id (INTEGER, Foreign Key to users.id)
playlist_name (TEXT)
song_id (INTEGER, Foreign Key to song.id)
Why?
Users can create playlists, but a playlist can only belong to one user.
A song can belong to multiple playlists.
Follows

user_id (INTEGER, Foreign Key to users.id)
artist_id (INTEGER, Foreign Key to artists.id)
Why?
Many-to-many relationship where users can follow multiple artists.
Likes

user_id (INTEGER, Foreign Key to users.id)
song_id (INTEGER, Foreign Key to song.id)
Why?
Users can like multiple songs, and a song can be liked by many users.
Listening History

user_id (INTEGER, Foreign Key to users.id)
song_id (INTEGER, Foreign Key to song.id)
played_at (DATETIME, Default CURRENT_TIMESTAMP)
Why?
Tracks when a user listens to a song.
Relationships
Users ⇄ Songs (via Likes) → Many-to-Many
Users ⇄ Artists (via Follows) → Many-to-Many
Users ⇄ Playlists → One-to-Many
Artists ⇄ Songs → One-to-Many
Users ⇄ Songs (via Listening History) → Many-to-Many

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?
Indexes:
song_search_by_name on song_name
artist_search_by_name on artist_name
Views:
"Marwan Pablo songs", "Hyssien songs", "The weekend songs", "Drake songs"
## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
Recommendations or AI-driven suggestions.
Subscription plans (free vs. premium accounts).

* What might your database not be able to represent very well?
users can't share their playlists together
