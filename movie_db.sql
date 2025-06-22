-- Active: 1750573676721@@127.0.0.1@5433@tontrix_db
CREATE DATABASE tontrix_db;

-- USERS
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  full_name VARCHAR(255) NOT NULL,
  phone_number BIGINT,
  profile_picture VARCHAR(255)
);

-- SESSIONS
CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  id_user INT REFERENCES users(id),
  login_time TIMESTAMP
);

-- MOVIES
CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  release_date DATE,
  duration_minutes INT,
  image VARCHAR(255),
  horizontal_image VARCHAR(255)
);

-- GENRES
CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL
);

-- MOVIE_GENRES (Many-to-Many)
CREATE TABLE movie_genres (
  id SERIAL PRIMARY KEY,
  id_movie INT REFERENCES movies(id) ON DELETE CASCADE,
  id_genre INT REFERENCES genres(id) ON DELETE CASCADE
);

-- DIRECTORS
CREATE TABLE directors (
  id SERIAL PRIMARY KEY,
  director_name VARCHAR(255) NOT NULL
);

-- MOVIE_DIRECTORS
CREATE TABLE movie_directors (
  id SERIAL PRIMARY KEY,
  id_movie INT REFERENCES movies(id) ON DELETE CASCADE,
  id_director INT REFERENCES directors(id) ON DELETE CASCADE
);

-- ACTORS
CREATE TABLE actors (
  id SERIAL PRIMARY KEY,
  actor_name VARCHAR(255)
);

-- MOVIE_CASTS
CREATE TABLE movie_casts (
  id SERIAL PRIMARY KEY,
  id_movie INT REFERENCES movies(id) ON DELETE CASCADE,
  id_actor INT REFERENCES actors(id) ON DELETE CASCADE
);

-- TICKETS
CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  id_user INT REFERENCES users(id),
  id_movie INT REFERENCES movies(id),
  show_date DATE,
  show_time TIME,
  cinema VARCHAR(255),
  location VARCHAR(255),
  seat VARCHAR(255),
  price_per_ticket INT
);

-- PAYMENT_METHOD
CREATE TABLE payment_method (
  id SERIAL PRIMARY KEY,
  payment_name VARCHAR(255)
);

ALTER TABLE tickets
ADD payment_method INT REFERENCES payment_method(id);



