-- Active: 1750151033462@@127.0.0.1@5432
CREATE DATABASE tontrix;

-- USERS
CREATE TABLE users (
  id VARCHAR PRIMARY KEY,
  email VARCHAR NOT NULL UNIQUE,
  password VARCHAR NOT NULL,
  full_name VARCHAR NOT NULL,
  phone_number BIGINT,
  profile_picture VARCHAR
);

-- SESSIONS
CREATE TABLE sessions (
  id VARCHAR PRIMARY KEY,
  id_user VARCHAR REFERENCES users(id),
  login_time TIMESTAMP,
  logout_time TIMESTAMP
);

-- MOVIES
CREATE TABLE movies (
  id VARCHAR PRIMARY KEY,
  title VARCHAR NOT NULL,
  director VARCHAR,
  description TEXT,
  cast VARCHAR,
  release_date DATE,
  duration_minutes INT,
  image VARCHAR,
  horizontal_image VARCHAR
);

-- GENRES
CREATE TABLE genres (
  id VARCHAR PRIMARY KEY,
  genre_name VARCHAR NOT NULL
);

-- MOVIE_GENRES (Many-to-Many)
CREATE TABLE movie_genres (
  id_movie VARCHAR REFERENCES movies(id) ON DELETE CASCADE,
  id_genre VARCHAR REFERENCES genres(id) ON DELETE CASCADE,
  PRIMARY KEY (id_movie, id_genre)
);

-- LOCATIONS
CREATE TABLE locations (
  id VARCHAR PRIMARY KEY,
  location_name VARCHAR NOT NULL
);

-- CINEMAS
CREATE TABLE cinemas (
  id VARCHAR PRIMARY KEY,
  cinema_name VARCHAR NOT NULL,
  id_location VARCHAR REFERENCES locations(id)
);

-- TICKETS
CREATE TABLE tickets (
  id VARCHAR PRIMARY KEY,
  id_user VARCHAR REFERENCES users(id) ON DELETE CASCADE,
  id_movie VARCHAR REFERENCES movies(id),
  show_date DATE,
  show_time TIME,
  id_cinema VARCHAR REFERENCES cinemas(id),
  price_per_ticket INT,
  payment_method VARCHAR
);

-- TICKET_SEATS
CREATE TABLE ticket_seats (
  id_ticket VARCHAR REFERENCES tickets(id) ON DELETE CASCADE,
  seat_code VARCHAR,
  PRIMARY KEY (id_ticket, seat_code)
);
