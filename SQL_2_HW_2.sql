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
INSERT INTO album (title, release_year) VALUES ('Album1', 2020);
INSERT INTO album (title, release_year) VALUES ('Album2', 2021);
INSERT INTO album (title, release_year) VALUES ('Album3', 2022);

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


-- Название и продолжительность самого длительного трека
SELECT title, duration
FROM track
ORDER BY duration DESC
LIMIT 1;


-- Название треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT title
FROM track
WHERE duration >= 210;


-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title
FROM compilation
WHERE release_year BETWEEN 2018 AND 2020;


-- Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artist
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»

SELECT title
FROM track
WHERE title ILIKE '%мой%' OR title ILIKE '%my%';