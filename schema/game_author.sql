--Author

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

--game

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    multiplayer VARCHAR(50),
    last_played_at DATE,
    publish_date DATE,
    author_id INT REFERENCES author(id)
);