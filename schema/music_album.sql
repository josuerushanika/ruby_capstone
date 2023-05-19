
CREATE TABLE genre (
   id SERIAL PRIMARY KEY,
   genre_name  VARCHAR(50)
);

CREATE TABLE music_album (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    published_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id)
       REFERENCES genre (id)  
);