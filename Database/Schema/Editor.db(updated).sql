--
-- File generated with SQLiteStudio v3.4.15 on Sun Feb 16 16:02:38 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: audioData
DROP TABLE IF EXISTS audioData;

CREATE TABLE IF NOT EXISTS audioData (
    file_paths    BLOB UNIQUE
                       NOT NULL,
    audio_buffers      NOT NULL
);


-- Table: audioPlayer
DROP TABLE IF EXISTS audioPlayer;

CREATE TABLE IF NOT EXISTS audioPlayer (
    speed      NUMERIC NOT NULL,
    length     NUMERIC NOT NULL,
    audio_data         UNIQUE
                       NOT NULL
);


-- Table: components
DROP TABLE IF EXISTS components;

CREATE TABLE IF NOT EXISTS components (
    attributes,
    Audio_player,
    texture_map
);


-- Table: Editor
DROP TABLE IF EXISTS Editor;

CREATE TABLE IF NOT EXISTS Editor (
    Ui     REFERENCES UI (config),
    Scene  REFERENCES scene (scene_id) 
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
    file_paths    BLOB UNIQUE
                       NOT NULL,
    image_buffers      NOT NULL
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
    entity
);


-- Table: textureMap
DROP TABLE IF EXISTS textureMap;

CREATE TABLE IF NOT EXISTS textureMap (
    width      NUMERIC NOT NULL,
    height     NUMERIC NOT NULL,
    image_data         UNIQUE
                       NOT NULL
);


-- Table: UI
DROP TABLE IF EXISTS UI;

CREATE TABLE IF NOT EXISTS UI (
    config       NOT NULL,
    file_system,
    console,
    windows
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
