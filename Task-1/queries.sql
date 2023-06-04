CREATE TABLE Movie (
  movie_id INT PRIMARY KEY,
  title VARCHAR(100),
  release_date DATE,
  duration INT
);

INSERT INTO Movie (movie_id, title, release_date, duration)
VALUES
  (1, 'Inception', '2010-07-16', 148),
  (2, 'The Shawshank Redemption', '1994-09-23', 142),
  (3, 'Pulp Fiction', '1994-10-14', 154);

CREATE TABLE Media (
  media_id INT PRIMARY KEY,
  movie_id INT,
  media_type VARCHAR(10),
  media_url VARCHAR(255),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

INSERT INTO Media (media_id, movie_id, media_type, media_url)
VALUES
  (1, 1, 'video', 'https://example.com/inception-trailer.mp4'),
  (2, 1, 'image', 'https://example.com/inception-poster.jpg'),
  (3, 2, 'image', 'https://example.com/shawshank-redemption-poster.jpg');

CREATE TABLE Genre (
  genre_id INT PRIMARY KEY,
  genre_name VARCHAR(50)
);

INSERT INTO Genre (genre_id, genre_name)
VALUES
  (1, 'Action'),
  (2, 'Drama'),
  (3, 'Crime');

CREATE TABLE UserAccount (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(100)
);

INSERT INTO UserAccount (user_id, username, email)
VALUES
  (1, 'user1', 'user1@example.com'),
  (2, 'user2', 'user2@example.com'),
  (3, 'user3', 'user3@example.com');

CREATE TABLE MovieGenre (
  movie_id INT,
  genre_id INT,
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

INSERT INTO MovieGenre (movie_id, genre_id)
VALUES
  (1, 1),
  (1, 2),
  (3, 2),
  (3, 3);

CREATE TABLE Review (
  review_id INT PRIMARY KEY,
  movie_id INT,
  user_id INT,
  rating FLOAT,
  comment TEXT,
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

INSERT INTO Review (review_id, movie_id, user_id, rating, comment)
VALUES
  (1, 1, 1, 4.5, 'Great movie!'),
  (2, 1, 2, 5.0, 'One of the best films I have ever seen.'),
  (3, 2, 3, 4.0, 'A powerful and inspiring story.');

CREATE TABLE Artist (
  artist_id INT PRIMARY KEY,
  artist_name VARCHAR(100)
);

INSERT INTO Artist (artist_id, artist_name)
VALUES
  (1, 'Leonardo DiCaprio'),
  (2, 'Tom Hanks'),
  (3, 'Quentin Tarantino');

CREATE TABLE Skill (
  skill_id INT PRIMARY KEY,
  skill_name VARCHAR(100)
);

INSERT INTO Skill (skill_id, skill_name)
VALUES
  (1, 'Acting'),
  (2, 'Directing'),
  (3, 'Writing');
  
  CREATE TABLE ArtistMovie (
  artist_id INT,
  movie_id INT,
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

INSERT INTO ArtistMovie (artist_id, movie_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (2, 2),
  (3, 3);
  CREATE TABLE ArtistSkill (
  artist_id INT,
  skill_id INT,
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
  FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);

INSERT INTO ArtistSkill (artist_id, skill_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (1, 2),
  (2, 1),
  (3, 2);
  
  SELECT Movie.*, Genre.genre_name
FROM Movie
JOIN MovieGenre ON Movie.movie_id = MovieGenre.movie_id
JOIN Genre ON Genre.genre_id = MovieGenre.genre_id;


SELECT Movie.*, Media.media_type, Media.media_url
FROM Movie
JOIN Media ON Movie.movie_id = Media.movie_id;

SELECT Movie.*, Review.rating, Review.comment, UserAccount.username
FROM Movie
JOIN Review ON Movie.movie_id = Review.movie_id
JOIN UserAccount ON UserAccount.user_id = Review.user_id;

SELECT Movie.*, Artist.artist_name
FROM Movie
JOIN ArtistMovie ON Movie.movie_id = ArtistMovie.movie_id
JOIN Artist ON Artist.artist_id = ArtistMovie.artist_id;

SELECT Artist.*, Skill.skill_name
FROM Artist
JOIN ArtistSkill ON Artist.artist_id = ArtistSkill.artist_id
JOIN Skill ON Skill.skill_id = ArtistSkill.skill_id;