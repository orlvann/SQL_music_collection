-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-02-05 22:23:27 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE "album-author" (
    authors_isni VARCHAR2(16 CHAR) NOT NULL,
    albums_ean   VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE "album-author" ADD CONSTRAINT relation_6_pk PRIMARY KEY ( authors_isni,
                                                                      albums_ean );

CREATE TABLE "album-genre" (
    genres_name VARCHAR2(50 CHAR) NOT NULL,
    albums_ean  VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE "album-genre" ADD CONSTRAINT relation_9_pk PRIMARY KEY ( genres_name,
                                                                     albums_ean );

CREATE TABLE albums (
    ean            VARCHAR2(50 CHAR) NOT NULL,
    title          VARCHAR2(50 CHAR) NOT NULL,
    release_year   INTEGER NOT NULL,
    studio_or_live VARCHAR2(6 CHAR) NOT NULL,
    record_label   VARCHAR2(50) NOT NULL
);

ALTER TABLE albums ADD CONSTRAINT albums_pk PRIMARY KEY ( ean );

CREATE TABLE authors (
    isni       VARCHAR2(16 CHAR) NOT NULL,
    stage_name VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE authors ADD CONSTRAINT authors_pk PRIMARY KEY ( isni );

CREATE TABLE "band-musician" (
    musicians_isni VARCHAR2(16 CHAR) NOT NULL,
    bands_isni     VARCHAR2(16 CHAR) NOT NULL
);

ALTER TABLE "band-musician" ADD CONSTRAINT relation_1_pk PRIMARY KEY ( musicians_isni,
                                                                       bands_isni );

CREATE TABLE bands (
    isni             VARCHAR2(16 CHAR) NOT NULL,
    authors_isni     VARCHAR2(16 CHAR),
    name             VARCHAR2(50) NOT NULL,
    formation_year   INTEGER NOT NULL,
    disbandment_year INTEGER
);

ALTER TABLE bands ADD CONSTRAINT bands_pk PRIMARY KEY ( isni );

CREATE TABLE genres (
    name VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE genres ADD CONSTRAINT genres_pk PRIMARY KEY ( name );

CREATE TABLE instrroles (
    name             VARCHAR2(50 CHAR) NOT NULL,
    musicians_isni   VARCHAR2(16 CHAR) NOT NULL,
    musictracks_iscr VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE instrroles
    ADD CONSTRAINT instrroles_pk PRIMARY KEY ( name,
                                               musicians_isni,
                                               musictracks_iscr );

CREATE TABLE musicians (
    isni           VARCHAR2(16 CHAR) NOT NULL,
    authors_isni   VARCHAR2(16 CHAR),
    stage_name     VARCHAR2(50 CHAR) NOT NULL,
    name           VARCHAR2(50 CHAR) NOT NULL,
    surname        VARCHAR2(50 CHAR) NOT NULL,
    place_of_birth VARCHAR2(50 CHAR) NOT NULL,
    date_of_birth  DATE NOT NULL,
    date_of_death  DATE
);

ALTER TABLE musicians ADD CONSTRAINT musicians_pk PRIMARY KEY ( isni );

CREATE TABLE musictracks (
    iscr             VARCHAR2(50 CHAR) NOT NULL,
    title            VARCHAR2(50 CHAR) NOT NULL,
    release_year     INTEGER NOT NULL,
    duration_seconds INTEGER NOT NULL,
    arrangement      VARCHAR2(50 CHAR)
);

ALTER TABLE musictracks ADD CONSTRAINT musictracks_pk PRIMARY KEY ( iscr );

CREATE TABLE playlists (
    title          VARCHAR2(50 CHAR) NOT NULL,
    users_nickname VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE playlists ADD CONSTRAINT playlists_pk PRIMARY KEY ( title,
                                                                users_nickname );

CREATE TABLE track_author (
    authors_isni     VARCHAR2(16 CHAR) NOT NULL,
    musictracks_iscr VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE track_author ADD CONSTRAINT relation_7_pk PRIMARY KEY ( authors_isni,
                                                                    musictracks_iscr );

CREATE TABLE "track-genre" (
    genres_name      VARCHAR2(50 CHAR) NOT NULL,
    musictracks_iscr VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE "track-genre" ADD CONSTRAINT relation_8_pk PRIMARY KEY ( genres_name,
                                                                     musictracks_iscr );

CREATE TABLE "track-playlist" (
    playlists_title          VARCHAR2(50 CHAR) NOT NULL,
    musictracks_iscr         VARCHAR2(50 CHAR) NOT NULL,
    playlists_users_nickname VARCHAR2(50 CHAR)
);

ALTER TABLE "track-playlist"
    ADD CONSTRAINT relation_13_pk PRIMARY KEY ( playlists_title,
                                                musictracks_iscr,
                                                playlists_users_nickname );

CREATE TABLE users (
    nickname VARCHAR2(50 CHAR) NOT NULL,
    name     VARCHAR2(50 CHAR) NOT NULL,
    surname  VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE users ADD CONSTRAINT users_pk PRIMARY KEY ( nickname );

ALTER TABLE bands
    ADD CONSTRAINT bands_authors_fk FOREIGN KEY ( authors_isni )
        REFERENCES authors ( isni );

ALTER TABLE instrroles
    ADD CONSTRAINT instrroles_musicians_fk FOREIGN KEY ( musicians_isni )
        REFERENCES musicians ( isni );

ALTER TABLE instrroles
    ADD CONSTRAINT instrroles_musictracks_fk FOREIGN KEY ( musictracks_iscr )
        REFERENCES musictracks ( iscr );

ALTER TABLE musicians
    ADD CONSTRAINT musicians_authors_fk FOREIGN KEY ( authors_isni )
        REFERENCES authors ( isni );

ALTER TABLE playlists
    ADD CONSTRAINT playlists_users_fk FOREIGN KEY ( users_nickname )
        REFERENCES users ( nickname );

ALTER TABLE "band-musician"
    ADD CONSTRAINT relation_1_bands_fk FOREIGN KEY ( bands_isni )
        REFERENCES bands ( isni );

ALTER TABLE "band-musician"
    ADD CONSTRAINT relation_1_musicians_fk FOREIGN KEY ( musicians_isni )
        REFERENCES musicians ( isni );

ALTER TABLE "track-playlist"
    ADD CONSTRAINT relation_13_musictracks_fk FOREIGN KEY ( musictracks_iscr )
        REFERENCES musictracks ( iscr );

ALTER TABLE "track-playlist"
    ADD CONSTRAINT relation_13_playlists_fk FOREIGN KEY ( playlists_title,
                                                          playlists_users_nickname )
        REFERENCES playlists ( title,
                               users_nickname );

ALTER TABLE "album-author"
    ADD CONSTRAINT relation_6_albums_fk FOREIGN KEY ( albums_ean )
        REFERENCES albums ( ean );

ALTER TABLE "album-author"
    ADD CONSTRAINT relation_6_authors_fk FOREIGN KEY ( authors_isni )
        REFERENCES authors ( isni );

ALTER TABLE track_author
    ADD CONSTRAINT relation_7_authors_fk FOREIGN KEY ( authors_isni )
        REFERENCES authors ( isni );

ALTER TABLE track_author
    ADD CONSTRAINT relation_7_musictracks_fk FOREIGN KEY ( musictracks_iscr )
        REFERENCES musictracks ( iscr );

ALTER TABLE "track-genre"
    ADD CONSTRAINT relation_8_genres_fk FOREIGN KEY ( genres_name )
        REFERENCES genres ( name );

ALTER TABLE "track-genre"
    ADD CONSTRAINT relation_8_musictracks_fk FOREIGN KEY ( musictracks_iscr )
        REFERENCES musictracks ( iscr );

ALTER TABLE "album-genre"
    ADD CONSTRAINT relation_9_albums_fk FOREIGN KEY ( albums_ean )
        REFERENCES albums ( ean );

ALTER TABLE "album-genre"
    ADD CONSTRAINT relation_9_genres_fk FOREIGN KEY ( genres_name )
        REFERENCES genres ( name );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0