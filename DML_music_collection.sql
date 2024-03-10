--Insert into authors
INSERT INTO authors (isni, stage_name)
VALUES ('0000000123456789', 'Alex Smith');
INSERT INTO authors (isni, stage_name)
VALUES ('0000000345678901', 'Ella Fitzgerald');
INSERT INTO authors (isni, stage_name)
VALUES ('0000000567890123', 'Billie Holiday');
INSERT INTO authors (isni, stage_name)
VALUES ('0000000678901234', 'Miles Davis');
INSERT INTO authors (isni, stage_name) VALUES ('0000000890123456', 'Nas');



--Insert into albums
INSERT INTO albums (ean, title, release_year, studio_or_live, record_label)
VALUES ('1234567890123', 'Sunset Dreams', 2020, 'studio', 'Dreamscape Records');
INSERT INTO albums (ean, title, release_year, studio_or_live, record_label)
VALUES ('1234567890124', 'Morning Light', 2021, 'live', 'Sunny Records');
INSERT INTO albums (ean, title, release_year, studio_or_live, record_label)
VALUES ('1234567890125', 'Blue Nights', 2022, 'studio', 'JazzWorld Records');
INSERT INTO albums (ean, title, release_year, studio_or_live, record_label)
VALUES ('1234567890126', 'Electro Groove', 2023, 'live', 'GrooveHouse Records');

--Insert into genres
INSERT INTO genres (name)
VALUES ('Electronic');
INSERT INTO genres (name)
VALUES ('Jazz');
INSERT INTO genres (name)
VALUES ('Blues');
INSERT INTO genres (name)
VALUES ('Hip Hop');

--Insert into musicians
INSERT INTO musicians (isni, authors_isni, stage_name, name, surname, place_of_birth, date_of_birth)
VALUES ('0000000234567890', '0000000123456789', 'John Doe', 'John', 'Doe', 'New York, USA', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
INSERT INTO musicians (isni, authors_isni, stage_name, name, surname, place_of_birth, date_of_birth)
VALUES ('0000000456789012', '0000000345678901', 'Louis Armstrong', 'Louis', 'Armstrong', 'New Orleans, USA', TO_DATE('1901-08-04', 'YYYY-MM-DD'));
INSERT INTO musicians (isni, authors_isni, stage_name, name, surname, place_of_birth, date_of_birth)
VALUES ('0000000789012345', '0000000567890123', 'B.B. King', 'Riley B.', 'King', 'Itta Bena, USA', TO_DATE('1925-09-16', 'YYYY-MM-DD'));
INSERT INTO musicians (isni, authors_isni, stage_name, name, surname, place_of_birth, date_of_birth)
VALUES ('0000000890123456', '0000000678901234', 'Nas', 'Nasir', 'Jones', 'Brooklyn, USA', TO_DATE('1973-09-14', 'YYYY-MM-DD'));

--Insert into musictracks
INSERT INTO musictracks (iscr, title, release_year, duration_seconds, arrangement)
VALUES ('US1234567890', 'Ocean Waves', 2020, 180, 'John Doe');
INSERT INTO musictracks (iscr, title, release_year, duration_seconds, arrangement)
VALUES ('US0987654321', 'Jazz in the Park', 2021, 300, 'Ella Fitzgerald');
INSERT INTO musictracks (iscr, title, release_year, duration_seconds, arrangement)
VALUES ('US2345678901', 'Late Evening Blues', 2022, 240, 'Billie Holiday');
INSERT INTO musictracks (iscr, title, release_year, duration_seconds, arrangement)
VALUES ('US3456789012', 'Street Beats', 2023, 210, 'Nas');

-- Linking album to author
INSERT INTO "album-author" (authors_isni, albums_ean)
VALUES ('0000000123456789', '1234567890123');
INSERT INTO "album-author" (authors_isni, albums_ean)
VALUES ('0000000345678901', '1234567890124');
INSERT INTO "album-author" (authors_isni, albums_ean)
VALUES ('0000000567890123', '1234567890125');
INSERT INTO "album-author" (authors_isni, albums_ean)
VALUES ('0000000678901234', '1234567890126');

-- Linking album to genre
INSERT INTO "album-genre" (genres_name, albums_ean)
VALUES ('Electronic', '1234567890123');
INSERT INTO "album-genre" (genres_name, albums_ean)
VALUES ('Jazz', '1234567890124');
INSERT INTO "album-genre" (genres_name, albums_ean)
VALUES ('Blues', '1234567890125');
INSERT INTO "album-genre" (genres_name, albums_ean)
VALUES ('Hip Hop', '1234567890126');

-- Linking "Jazz in the Park" track to "Ella Fitzgerald"
INSERT INTO track_author (authors_isni, musictracks_iscr)
VALUES ('0000000345678901', 'US0987654321');
INSERT INTO track_author (authors_isni, musictracks_iscr)
VALUES ('0000000567890123', 'US2345678901');
INSERT INTO track_author (authors_isni, musictracks_iscr)
VALUES ('0000000890123456', 'US3456789012');

-- Linking "Jazz in the Park" track to "Jazz"
INSERT INTO "track-genre" (genres_name, musictracks_iscr)
VALUES ('Jazz', 'US0987654321');
INSERT INTO "track-genre" (genres_name, musictracks_iscr)
VALUES ('Blues', 'US2345678901');
INSERT INTO "track-genre" (genres_name, musictracks_iscr)
VALUES ('Hip Hop', 'US3456789012');

