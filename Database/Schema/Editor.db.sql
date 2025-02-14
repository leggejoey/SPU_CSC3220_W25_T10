--
-- File generated with SQLiteStudio v3.4.15 on Fri Feb 14 14:11:06 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: audio data
CREATE TABLE [audio data] (
    [file paths]    BLOB UNIQUE
                         NOT NULL,
    [audio buffers]      NOT NULL
);


-- Table: audio player
CREATE TABLE [audio player] (
    speed        NUMERIC NOT NULL,
    length       NUMERIC NOT NULL,
    [audio data]         UNIQUE
                         NOT NULL
);


-- Table: components
CREATE TABLE components (
    attributes,
    [Audio player],
    [texture map]
);


-- Table: Editor
CREATE TABLE Editor (
    Ui     REFERENCES UI (config),
    Scene  REFERENCES scene ([scene id]) 
);


-- Table: entity
CREATE TABLE entity (
    ID              PRIMARY KEY
                    UNIQUE
                    NOT NULL,
    [time created]  NOT NULL,
    components      UNIQUE
);


-- Table: image data
CREATE TABLE [image data] (
    [file paths]    BLOB UNIQUE
                         NOT NULL,
    [image buffers]      NOT NULL
);


-- Table: scene
CREATE TABLE scene (
    [scene id]          PRIMARY KEY
                        NOT NULL,
    [date created]      NOT NULL,
    name           TEXT NOT NULL,
    config              NOT NULL,
    entity
);


-- Table: texture map
CREATE TABLE [texture map] (
    width        NUMERIC NOT NULL,
    height       NUMERIC NOT NULL,
    [image data]         UNIQUE
                         NOT NULL
);


-- Table: UI
CREATE TABLE UI (
    config         NOT NULL,
    [file system],
    console,
    windows
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
