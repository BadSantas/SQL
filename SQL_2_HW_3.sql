-- Вставка данных в таблицу исполнителей
INSERT INTO artist (name) VALUES ('Artist1');
INSERT INTO artist (name) VALUES ('Artist2');
INSERT INTO artist (name) VALUES ('Artist3');
INSERT INTO artist (name) VALUES ('Artist4');

-- Вставка данных в таблицу жанров
INSERT INTO genre (name) VALUES ('Rock');
INSERT INTO genre (name) VALUES ('Pop');
INSERT INTO genre (name) VALUES ('Jazz');

-- Вставка данных в таблицу альбомов
INSERT INTO album (title, release_year) VALUES ('Album1', 2019);
INSERT INTO album (title, release_year) VALUES ('Album2', 2020);
INSERT INTO album (title, release_year) VALUES ('Album3', 2021);

-- Вставка данных в таблицу треков
INSERT INTO track (title, duration, album_id) VALUES ('Track1', 210, 1);
INSERT INTO track (title, duration, album_id) VALUES ('Track2', 180, 1);
INSERT INTO track (title, duration, album_id) VALUES ('Track3', 240, 2);
INSERT INTO track (title, duration, album_id) VALUES ('Track4', 200, 2);
INSERT INTO track (title, duration, album_id) VALUES ('Track5', 220, 3);
INSERT INTO track (title, duration, album_id) VALUES ('Track6', 230, 3);

-- Вставка данных в таблицу сборников
INSERT INTO compilation (title, release_year) VALUES ('Compilation1', 2018);
INSERT INTO compilation (title, release_year) VALUES ('Compilation2', 2019);
INSERT INTO compilation (title, release_year) VALUES ('Compilation3', 2020);
INSERT INTO compilation (title, release_year) VALUES ('Compilation4', 2021);

-- Вставка данных в промежуточную таблицу artist_genre
INSERT INTO artist_genre (artist_id, genre_id) VALUES (1, 1);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (1, 2);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (2, 2);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (3, 3);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (4, 1);

-- Вставка данных в промежуточную таблицу artist_album
INSERT INTO artist_album (artist_id, album_id) VALUES (1, 1);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 3);
INSERT INTO artist_album (artist_id, album_id) VALUES (4, 1);
INSERT INTO artist_album (artist_id, album_id) VALUES (1, 2);

-- Вставка данных в промежуточную таблицу compilation_track
INSERT INTO compilation_track (compilation_id, track_id) VALUES (1, 1);
INSERT INTO compilation_track (compilation_id, track_id) VALUES (1, 2);
INSERT INTO compilation_track (compilation_id, track_id) VALUES (2, 3);
INSERT INTO compilation_track (compilation_id, track_id) VALUES (2, 4);
INSERT INTO compilation_track (compilation_id, track_id) VALUES (3, 5);
INSERT INTO compilation_track (compilation_id, track_id) VALUES (3, 6);
INSERT INTO compilation_track (compilation_id, track_id) VALUES (4, 1);
INSERT INTO compilation_track (compilation_id, track_id) VALUES (4, 3);

SELECT-запросы

-- Количество исполнителей в каждом жанре

SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM genre g
JOIN artist_genre ag ON g.genre_id = ag.genre_id
GROUP BY g.name;

Количество треков, вошедших в альбомы 2019–2020 годов

SELECT COUNT(t.track_id) AS track_count
FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому

SELECT a.title AS album, AVG(t.duration) AS avg_duration
FROM track t
JOIN album a ON t.album_id = a.album_id
GROUP BY a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году

SELECT DISTINCT ar.name
FROM artist ar
JOIN artist_album aa ON ar.artist_id = aa.artist_id
JOIN album a ON aa.album_id = a.album_id
WHERE ar.artist_id NOT IN (
    SELECT ar.artist_id
    FROM artist ar
    JOIN artist_album aa ON ar.artist_id = aa.artist_id
    JOIN album a ON aa.album_id = a.album_id
    WHERE a.release_year = 2020
);


-- Названия сборников, в которых присутствует конкретный исполнитель

SELECT DISTINCT c.title
FROM compilation c
JOIN compilation_track ct ON c.compilation_id = ct.compilation_id
JOIN track t ON ct.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id
JOIN artist_album aa ON a.album_id = aa.album_id
JOIN artist ar ON aa.artist_id = ar.artist_id
WHERE ar.name = 'Artist1';