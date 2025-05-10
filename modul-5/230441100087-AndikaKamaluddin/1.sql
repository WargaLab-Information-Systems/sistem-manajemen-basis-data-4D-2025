DROP DATABASE modullima
CREATE DATABASE modullima
USE modullima

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
CREATE TABLE users (
    id_user INT PRIMARY KEY,
    nama_user VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE transaksi (
    id_transaksi INT PRIMARY KEY,
    id_user INT,
    nama_transaksi VARCHAR(50),
    STATUS VARCHAR(20),
    jumlah INT,
    tanggal_transaksi DATE,
    FOREIGN KEY (id_user) REFERENCES users(id_user)
);

INSERT INTO users (id_user, nama_user, email) VALUES
(1, 'Andi', 'andi@example.com'),
(2, 'Budi', 'budi@example.com'),
(3, 'Cici', 'cici@example.com'),
(4, 'Yato', 'yato@example.com'),
(5, 'Lukas', 'lukas5@example.com'),
(6, 'Joy', 'joy@example.com'),
(7, 'Indra', 'indra@example.com'),
(8, 'Bekti', 'bekti@example.com'),
(9, 'Meduro', 'meduro@example.com'),
(10, 'Jowo', 'jowo@example.com'),
(11, 'Andika', 'andika@example.com');

INSERT INTO users (id_user, nama_user, email) VALUES
(15, 'Anto', 'anto@example.com');

INSERT INTO transaksi (id_transaksi, id_user, nama_transaksi, STATUS, jumlah, tanggal_transaksi) VALUES
(101, 1, 'Upgrade Skin', 'valid', 10000, '2024-04-01'),
(102, 2, 'Buy Weapon', 'valid', 5000, '2025-04-07'),
(103, 2, 'Top Up', 'tidak valid', 3000, '2023-03-01'),
(104, 3, 'Top Up', 'valid', 15000, '2025-04-02'),
(105, 3, 'Upgrade Level', 'valid', 10000, '2024-03-01'),
(106, 3, 'Top Up', 'valid', 2000, '2025-04-28'),
(107, 1, 'Buy Armor', 'valid', 8000, '2025-04-05'),
(108, 9, 'Upgrade Level', 'valid', 15423, '2023-07-08'),
(109, 2, 'Buy Weapon', 'tidak valid', 8324, '2025-03-30'),
(110, 9, 'Top Up', 'tidak valid', 12817, '2025-01-06');

INSERT INTO transaksi (id_transaksi, id_user, nama_transaksi, STATUS, jumlah, tanggal_transaksi) VALUES
(112, 1, 'Upgrade Skin', 'sukses', 10000, '2025-05-01');

INSERT INTO transaksi (id_transaksi, id_user, nama_transaksi, STATUS, jumlah, tanggal_transaksi) VALUES
(113, 1, 'Upgrade Skin', 'sukses', 10000, '2025-05-01');

SELECT * FROM users;
SELECT * FROM transaksi;