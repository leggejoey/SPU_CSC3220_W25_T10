--
-- File generated with SQLiteStudio v3.4.15 on Fri Feb 21 14:27:52 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: attributes
DROP TABLE IF EXISTS attributes;

CREATE TABLE IF NOT EXISTS attributes (
    attribute_id     INTEGER PRIMARY KEY
                             UNIQUE,
    location         INTEGER NOT NULL,
    rotation         INTEGER NOT NULL,
    other_attributes TEXT
);


-- Table: audioData
DROP TABLE IF EXISTS audioData;

CREATE TABLE IF NOT EXISTS audioData (
    file_paths    TEXT    UNIQUE
                          NOT NULL
                          PRIMARY KEY,
    audio_buffers BLOB,
    speed         NUMERIC NOT NULL,
    length        NUMERIC NOT NULL
);


-- Table: bridge
DROP TABLE IF EXISTS bridge;

CREATE TABLE IF NOT EXISTS bridge (
    bridge_location_id INTEGER PRIMARY KEY
                               UNIQUE,
    components         INTEGER REFERENCES components (attributes) 
);


-- Table: components
DROP TABLE IF EXISTS components;

CREATE TABLE IF NOT EXISTS components (
    component_id   INTEGER UNIQUE
                           PRIMARY KEY,
    attributes     INTEGER REFERENCES attributes (location) 
                           UNIQUE
                           NOT NULL,
    Audio_player   TEXT    REFERENCES audioData (file_paths),
    texture_map    TEXT    REFERENCES imageData (file_paths),
    bridge_connect         REFERENCES bridge (components) 
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
    ID                 INTEGER PRIMARY KEY
                               UNIQUE
                               NOT NULL,
    time_created       TEXT    NOT NULL,
    bridged_components INTEGER UNIQUE
                               REFERENCES bridge (bridge_location_id),
    scene_id           INTEGER REFERENCES scene (scene_id) 
                               NOT NULL
);


-- Table: imageData
DROP TABLE IF EXISTS imageData;

CREATE TABLE IF NOT EXISTS imageData (
    file_paths    TEXT    UNIQUE
                          NOT NULL
                          PRIMARY KEY,
    image_buffers BLOB,
    height        NUMERIC NOT NULL,
    width         NUMERIC NOT NULL
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
    entity       INTEGER REFERENCES entity (ID) 
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
