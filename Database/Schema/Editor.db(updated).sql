--
-- File generated with SQLiteStudio v3.4.15 on Mon Feb 17 15:08:28 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: audioData
DROP TABLE IF EXISTS audioData;

CREATE TABLE IF NOT EXISTS audioData (
    file_paths    TEXT UNIQUE
                       NOT NULL
                       PRIMARY KEY,
    audio_buffers BLOB
);


-- Table: audioPlayer
DROP TABLE IF EXISTS audioPlayer;

CREATE TABLE IF NOT EXISTS audioPlayer (
    speed      NUMERIC NOT NULL,
    length     NUMERIC NOT NULL,
    audio_data BLOB    UNIQUE
                       NOT NULL
                       REFERENCES audioData (file_paths) 
);


-- Table: components
DROP TABLE IF EXISTS components;

CREATE TABLE IF NOT EXISTS components (
    attributes    PRIMARY KEY,
    Audio_player  REFERENCES audioPlayer (speed),
    texture_map   REFERENCES textureMap (width) 
);


-- Table: Editor
DROP TABLE IF EXISTS Editor;

CREATE TABLE IF NOT EXISTS Editor (
    Ui                REFERENCES UI (config),
    Scene             REFERENCES scene (scene_id),
    editor_id INTEGER UNIQUE
                      PRIMARY KEY
                      NOT NULL
);


-- Table: entity
DROP TABLE IF EXISTS entity;

CREATE TABLE IF NOT EXISTS entity (
    ID           INTEGER PRIMARY KEY
                         UNIQUE
                         NOT NULL,
    time_created TEXT    NOT NULL,
    components           UNIQUE
);


-- Table: imageData
DROP TABLE IF EXISTS imageData;

CREATE TABLE IF NOT EXISTS imageData (
    file_paths    TEXT UNIQUE
                       NOT NULL
                       PRIMARY KEY,
    image_buffers BLOB
);


-- Table: scene
DROP TABLE IF EXISTS scene;

CREATE TABLE IF NOT EXISTS scene (
    scene_id     INTEGER PRIMARY KEY
                         NOT NULL
                         UNIQUE,
    date_created TEXT    NOT NULL,
    name         TEXT    NOT NULL,
    config               NOT NULL,
    entity               REFERENCES entity (ID) 
);


-- Table: textureMap
DROP TABLE IF EXISTS textureMap;

CREATE TABLE IF NOT EXISTS textureMap (
    width      NUMERIC NOT NULL,
    height     NUMERIC NOT NULL,
    image_data BLOB    UNIQUE
                       NOT NULL
                       REFERENCES imageData (file_paths) 
);


-- Table: UI
DROP TABLE IF EXISTS UI;

CREATE TABLE IF NOT EXISTS UI (
    config              NOT NULL
                        PRIMARY KEY,
    file_system,
    console,
    windows,
    editor_id   INTEGER REFERENCES Editor (Ui) 
                        NOT NULL
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
