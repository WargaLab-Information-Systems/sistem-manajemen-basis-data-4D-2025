
-- Master Tables
-- Table: Game
CREATE TABLE Game (
    gameId VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    releaseDate DATE,
    genre VARCHAR(50),
    ageRating VARCHAR(10),
    isActive ENUM('yes', 'no') DEFAULT 'yes'
);

-- Table: Developer
CREATE TABLE Developer (
    developerId VARCHAR(10) PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    specialization VARCHAR(50),
    experienceLevel VARCHAR(20),
    hourlyRate DECIMAL(10, 2),
    joinDate DATE,
    isActive ENUM('yes', 'no') DEFAULT 'yes'
);

-- Table: Asset
CREATE TABLE Asset (
    assetId VARCHAR(10) PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    TYPE VARCHAR(50) NOT NULL,
    filePath VARCHAR(255),
    fileSize INT, -- in KB
    createdBy VARCHAR(10),
    isReusable ENUM('yes', 'no') DEFAULT 'yes',
    FOREIGN KEY (createdBy) REFERENCES Developer(developerId)
);

-- Transaction Tables
-- Table: GameDevelopment
CREATE TABLE GameDevelopment (
    developmentId VARCHAR(10) PRIMARY KEY, 
    gameId VARCHAR(10),
    developerId VARCHAR(10),
    ROLE VARCHAR(50),
    startDate DATE,
    endDate DATE,
    STATUS VARCHAR(20), 
    FOREIGN KEY (gameId) REFERENCES Game(gameId),
    FOREIGN KEY (developerId) REFERENCES Developer(developerId)
);

-- Table: AssetUsage
CREATE TABLE AssetUsage (
    usageId VARCHAR(10) PRIMARY KEY, 
    gameId VARCHAR(10),
    assetId VARCHAR(10),
    implementationDate DATE,
    usageContext VARCHAR(100),
    modified BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (gameId) REFERENCES Game(gameId),
    FOREIGN KEY (assetId) REFERENCES Asset(assetId)
);

-- Table: GameVersion
CREATE TABLE GameVersion (
    versionId VARCHAR(10) PRIMARY KEY, 
    gameId VARCHAR(10),
    versionNumber VARCHAR(20),
    releaseDate DATE,
    changelog TEXT,
    buildSize INT, -- in MB
    FOREIGN KEY (gameId) REFERENCES Game(gameId)
);



-- Mengisi tabel Game
INSERT INTO Game (gameId, title, description, releaseDate, genre, ageRating, isActive) VALUES
('G01', 'DragonQuest', 'Game petualangan fantasi dengan naga', '2023-12-15', 'RPG', '12+', 'yes'),
('G02', 'SpeedRacer', 'Game balapan dengan kecepatan tinggi', '2023-08-20', 'Racing', '7+', 'yes'),
('G03', 'ZombieSurvival', 'Game bertahan hidup dari serangan zombie', '2022-10-31', 'Horror', '18+', 'no'),
('G04', 'PuzzleMaster', 'Game teka-teki dengan level yang menantang', '2024-01-05', 'Puzzle', '3+', 'yes'),
('G05', 'StrategicEmpire', 'Game strategi membangun kerajaan', '2023-05-12', 'Strategy', '12+', 'no');

-- Mengisi tabel Developer
INSERT INTO Developer (developerId, NAME, specialization, experienceLevel, hourlyRate, joinDate, isActive) VALUES
('D01', 'Budi Santoso', 'Game Designer', 'Senior', 50.00, '2020-03-15', 'yes'),
('D02', 'Rina Wijaya', '3D Artist', 'Mid-level', 35.00, '2021-06-20', 'yes'),
('D03', 'Denny Pratama', 'Programmer', 'Junior', 25.00, '2022-01-10', 'yes'),
('D04', 'Siti Rahayu', 'Sound Engineer', 'Senior', 45.00, '2019-11-05', 'no'),
('D05', 'Agus Hermawan', 'UI/UX Designer', 'Mid-level', 30.00, '2021-08-15', 'yes'),
('D06', 'Maya Putri', 'Animator', 'Senior', 40.00, '2020-05-22', 'no');

-- Mengisi tabel Asset
INSERT INTO Asset (assetId, NAME, TYPE, filePath, fileSize, createdBy, isReusable) VALUES
('A01', 'DragonModel', '3D Model', '/assets/models/dragon.fbx', 15000, 'D02', 'no'),
('A02', 'RacingCar', '3D Model', '/assets/models/car.fbx', 8500, 'D02', 'yes'),
('A03', 'ZombieSound', 'Audio', '/assets/sounds/zombie_growl.mp3', 2500, 'D04', 'yes'),
('A04', 'ForestBackground', 'Texture', '/assets/textures/forest.png', 4200, 'D05', 'yes'),
('A05', 'MainMenuUI', 'UI', '/assets/ui/main_menu.psd', 3800, 'D05', 'no'),
('A06', 'ExplosionEffect', 'Particle', '/assets/effects/explosion.fx', 1200, 'D03', 'yes'),
('A07', 'CharacterAnimation', 'Animation', '/assets/animations/walk_cycle.anim', 5600, 'D06', 'no');

-- Mengisi tabel GameDevelopment
INSERT INTO GameDevelopment (developmentId, gameId, developerId, ROLE, startDate, endDate, STATUS) VALUES
('DV01', 'G01', 'D01', 'Lead Designer', '2023-01-10', '2023-12-10', 'completed'),
('DV02', 'G01', 'D02', '3D Modeler', '2023-02-15', '2023-08-20', 'completed'),
('DV03', 'G01', 'D03', 'Gameplay Programmer', '2023-03-01', '2023-11-15', 'completed'),
('DV04', 'G02', 'D05', 'UI Designer', '2023-04-10', '2023-07-15', 'completed'),
('DV05', 'G02', 'D03', 'Physics Programmer', '2023-04-15', '2023-08-10', 'completed'),
('DV06', 'G03', 'D01', 'Game Designer', '2022-05-10', '2022-09-30', 'completed'),
('DV07', 'G03', 'D04', 'Sound Designer', '2022-06-15', '2022-10-20', 'completed'),
('DV08', 'G04', 'D05', 'UI/UX Designer', '2023-09-01', NULL, 'in progress'),
('DV09', 'G04', 'D03', 'Programmer', '2023-09-15', NULL, 'in progress'),
('DV10', 'G05', 'D01', 'Game Designer', '2023-01-05', '2023-04-30', 'completed');

-- Mengisi tabel AssetUsage
INSERT INTO AssetUsage (usageId, gameId, assetId, implementationDate, usageContext, modified) VALUES
('U01', 'G01', 'A01', '2023-05-15', 'Main character model', FALSE),
('U02', 'G01', 'A04', '2023-06-10', 'Game environment', TRUE),
('U03', 'G01', 'A06', '2023-07-20', 'Special effects', FALSE),
('U04', 'G02', 'A02', '2023-05-05', 'Player vehicle', FALSE),
('U05', 'G02', 'A05', '2023-06-15', 'Game interface', TRUE),
('U06', 'G03', 'A03', '2022-07-10', 'Enemy sounds', FALSE),
('U07', 'G03', 'A04', '2022-08-05', 'Game environment', TRUE),
('U08', 'G04', 'A05', '2023-10-10', 'Game interface', FALSE),
('U09', 'G05', 'A06', '2023-02-20', 'Battle effects', TRUE),
('U10', 'G05', 'A07', '2023-03-15', 'Character movements', FALSE);

-- Mengisi tabel GameVersion
INSERT INTO GameVersion (versionId, gameId, versionNumber, releaseDate, changelog, buildSize) VALUES
('V01', 'G01', '1.0.0', '2023-12-15', 'Initial release', 2500),
('V02', 'G01', '1.0.1', '2023-12-28', 'Bug fixes and performance improvements', 2520),
('V03', 'G02', '1.0.0', '2023-08-20', 'Initial release', 1800),
('V04', 'G02', '1.1.0', '2023-09-15', 'Added new vehicles and tracks', 2100),
('V05', 'G03', '1.0.0', '2022-10-31', 'Initial release', 3200),
('V06', 'G03', '1.0.1', '2022-11-15', 'Bug fixes', 3210),
('V07', 'G03', '1.1.0', '2022-12-20', 'New zombie types and weapons', 3500),
('V08', 'G04', '0.9.0', '2024-01-05', 'Beta release', 1200),
('V09', 'G05', '1.0.0', '2023-05-12', 'Initial release', 2800),
('V10', 'G05', '1.0.1', '2023-06-01', 'Balance adjustments', 2810);

-- Check contents of the Game table
SELECT * FROM Game;

-- Check contents of the Developer table
SELECT * FROM Developer;

-- Check contents of the Asset table
SELECT * FROM Asset;

-- Check contents of the GameDevelopment table
SELECT * FROM GameDevelopment;

-- Check contents of the AssetUsage table
SELECT * FROM AssetUsage;

-- Check contents of the GameVersion table
SELECT * FROM GameVersion;










DELIMITER //
CREATE TRIGGER before_insert_developer
BEFORE INSERT ON Developer
FOR EACH ROW
BEGIN
    IF NEW.hourlyRate < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Gaji per jam tidak boleh negatif';
    END IF;
END //
DELIMITER ;
INSERT INTO Developer (developerId, NAME, hourlyRate)
VALUES (1, 'Budi', -100);






DELIMITER //
CREATE TRIGGER before_update_asset
BEFORE UPDATE ON Asset
FOR EACH ROW
BEGIN
    IF NEW.fileSize > 20000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ukuran file terlalu besar (maks 20000 KB)';
    END IF;
END //
DELIMITER ;
UPDATE Asset
SET fileSize = 25000
WHERE assetId = "A01";









DELIMITER //
CREATE TRIGGER before_delete_game
BEFORE DELETE ON Game
FOR EACH ROW
BEGIN
    IF OLD.isActive = 'yes' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tidak bisa menghapus game yang masih aktif';
    END IF;
END //
DELIMITER ;
DELETE FROM Game
WHERE gameId = "G04";












DELIMITER //
CREATE TRIGGER after_assetusage_insert
AFTER INSERT ON AssetUsage
FOR EACH ROW
BEGIN
    UPDATE Asset
    SET isReusable = 'yes'
    WHERE assetId = NEW.assetId;
END //
DELIMITER ;
INSERT INTO AssetUsage (usageId, gameId, assetId, implementationDate, usageContext, modified)
VALUES ('U11', 'G04', 'A01', '2024-05-12', 'Background scenery', FALSE);
SELECT assetId, NAME, isReusable FROM Asset WHERE assetId = 'A01';














DROP TRIGGER after_gameversion_update
DELIMITER //
CREATE TRIGGER after_gameversion_update
AFTER UPDATE ON GameVersion
FOR EACH ROW
BEGIN
    UPDATE GameDevelopment
    SET endDate = CURDATE()
    WHERE gameId = NEW.gameId 
    AND STATUS = 'in progress'
    AND endDate IS NULL;
END //
DELIMITER ;
UPDATE GameVersion
SET changelog = 'Bug fixes and stability improvements'
WHERE gameId = 'G04';
SELECT developmentId, gameId, STATUS, endDate 
FROM GameDevelopment 
WHERE gameId = 'G04' AND STATUS = 'in progress';














DELIMITER //
CREATE TRIGGER after_gamedevelopment_delete
AFTER DELETE ON GameDevelopment
FOR EACH ROW
BEGIN
    IF OLD.STATUS = 'completed' THEN
        UPDATE GameVersion
        SET versionNumber = CONCAT(LEFT(versionNumber, 1), '.', 
                                  SUBSTRING_INDEX(versionNumber, '.', -1) + 1)
        WHERE gameId = OLD.gameId
        ORDER BY releaseDate DESC
        LIMIT 1;
    END IF;
END //
DELIMITER ;
DELETE FROM GameDevelopment
WHERE developmentId = 'DV10' AND STATUS = 'completed';
SELECT gameId, versionNumber FROM GameVersion WHERE gameId = 'G05' ORDER BY releaseDate DESC LIMIT 1;






