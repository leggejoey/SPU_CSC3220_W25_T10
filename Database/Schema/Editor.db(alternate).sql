--
-- File generated with SQLiteStudio v3.4.15 on Fri Feb 14 14:26:15 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: audio data
DROP TABLE IF EXISTS [audio data];

CREATE TABLE IF NOT EXISTS [audio data] (
    [file paths]    BLOB UNIQUE
                         NOT NULL,
    [audio buffers]      NOT NULL
);


-- Table: audio player
DROP TABLE IF EXISTS [audio player];

CREATE TABLE IF NOT EXISTS [audio player] (
    speed        NUMERIC NOT NULL,
    length       NUMERIC NOT NULL,
    [audio data]         UNIQUE
                         NOT NULL
);


-- Table: components
DROP TABLE IF EXISTS components;

CREATE TABLE IF NOT EXISTS components (
    attributes,
    [Audio player],
    [texture map]
);


-- Table: Editor
DROP TABLE IF EXISTS Editor;

CREATE TABLE IF NOT EXISTS Editor (
    Ui     REFERENCES UI (config),
    Scene  REFERENCES scene ([scene id]) 
);


-- Table: entity
DROP TABLE IF EXISTS entity;

CREATE TABLE IF NOT EXISTS entity (
    ID              PRIMARY KEY
                    UNIQUE
                    NOT NULL,
    [time created]  NOT NULL,
    components      UNIQUE
);


-- Table: image data
DROP TABLE IF EXISTS [image data];

CREATE TABLE IF NOT EXISTS [image data] (
    [file paths]    BLOB UNIQUE
                         NOT NULL,
    [image buffers]      NOT NULL
);


-- Table: scene
DROP TABLE IF EXISTS scene;

CREATE TABLE IF NOT EXISTS scene (
    [scene id]          PRIMARY KEY
                        NOT NULL,
    [date created]      NOT NULL,
    name           TEXT NOT NULL,
    config              NOT NULL,
    entity
);


-- Table: texture map
DROP TABLE IF EXISTS [texture map];

CREATE TABLE IF NOT EXISTS [texture map] (
    width        NUMERIC NOT NULL,
    height       NUMERIC NOT NULL,
    [image data]         UNIQUE
                         NOT NULL
);


-- Table: UI
DROP TABLE IF EXISTS UI;

CREATE TABLE IF NOT EXISTS UI (
    config         NOT NULL,
    [file system],
    console,
    windows
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
