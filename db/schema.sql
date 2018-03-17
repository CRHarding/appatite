DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS friends cascade;
DROP TABLE IF EXISTS restaurants cascade;
DROP TABLE IF EXISTS favorites cascade;
DROP TABLE IF EXISTS reviews cascade;
DROP TABLE IF EXISTS reactions;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  fname VARCHAR(255),
  lname VARCHAR(255),
  username VARCHAR(255),
  password VARCHAR(255),
  aboutme VARCHAR(255),
  auth INTEGER DEFAULT 1,
  loc VARCHAR(255),
  date_created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE friends (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  friend_id INTEGER REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  date_created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  rating INTEGER DEFAULT 0,
  cuisine VARCHAR(255),
  img_src VARCHAR(255),
  loc VARCHAR(255),
  date_created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE favorites (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  restaurant_id INTEGER REFERENCES restaurants(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  restaurant_id INTEGER REFERENCES restaurants(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  content VARCHAR(255),
  date_created TIMESTAMP NOT NULL DEFAULT NOW(),
);

CREATE TABLE reaction (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  restaurant_id INTEGER REFERENCES restaurants(id) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
  reaction_src VARCHAR(255)
);

CREATE INDEX ON users (username);
CREATE INDEX ON restaurants (name);
