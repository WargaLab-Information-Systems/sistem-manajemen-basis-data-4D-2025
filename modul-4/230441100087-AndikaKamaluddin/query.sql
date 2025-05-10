ALTER TABLE GameVersion ADD COLUMN keterangan VARCHAR(100);


DELIMITER //
CREATE PROCEDURE tes(IN isActivee ENUM('yes', 'no'))
BEGIN
SELECT g.gameId, g.title, g.genre, d.NAME AS developer_name, d.specialization, 
       gd.ROLE, gd.startDate, gd.endDate, gd.STATUS
FROM Game g JOIN GameDevelopment gd ON g.gameId = gd.gameId JOIN Developer d ON gd.developerId = d.developerId WHERE g.isActive = isActivee;
END //
DELIMITER;
CALL tes('yes');
DROP PROCEDURE tes;


SELECT g.gameId, g.title, g.genre, d.NAME AS developer_name, d.specialization, 
       gd.ROLE, gd.startDate, gd.endDate, gd.STATUS
FROM Game g JOIN GameDevelopment gd ON g.gameId = gd.gameId JOIN Developer d ON gd.developerId = d.developerId WHERE g.isActive = 'yes';


SELECT gameId, title, releaseDate, genre FROM Game ORDER BY releaseDate DESC;

SELECT developerId, NAME, specialization, hourlyRate FROM Developer ORDER BY hourlyRate ASC;


ALTER TABLE GameVersion MODIFY COLUMN buildSize DECIMAL(10,2);
ALTER TABLE GameVersion MODIFY COLUMN buildSize INT;


SELECT 
    d1.name AS Developer1,
    d2.name AS Developer2,
    d1.experienceLevel
FROM Developer d1
JOIN Developer d2 
  ON d1.experienceLevel = d2.experienceLevel 
 AND d1.developerId < d2.developerId;

 SELECT 
    gd.developmentId,
    gd.gameId,
    gd.developerId,
    d.name AS developerName
FROM Developer d
RIGHT JOIN GameDevelopment gd 
  ON d.developerId = gd.developerId;
  
SELECT 
    g.gameId,
    g.title,
    gd.developerId
FROM Game g
right JOIN GameDevelopment gd ON g.gameId = gd.gameId;





-- 1. Operator sama dengan (=)
-- Mencari game dengan genre RPG
SELECT * FROM Game WHERE genre = 'RPG';

-- 2. Operator tidak sama dengan (<>)
-- Mencari developer yang bukan Junior
SELECT * FROM Developer WHERE experienceLevel <> 'Junior';

-- 3. Operator lebih besar dari (>)
-- Mencari asset dengan ukuran file lebih dari 5000 KB
SELECT * FROM Asset WHERE fileSize > 5000;

-- 4. Operator lebih kecil dari (<)
-- Mencari developer dengan hourlyRate kurang dari 40.00
SELECT * FROM Developer WHERE hourlyRate < 40.00;

-- 5. Operator lebih besar atau sama dengan (>=)
-- Mencari game version dengan buildSize lebih dari atau sama dengan 2500 MB
SELECT * FROM GameVersion WHERE buildSize >= 2500;

-- 6. Operator BETWEEN
-- Mencari game yang dirilis antara 1 Januari 2023 dan 31 Desember 2023
SELECT * FROM Game WHERE releaseDate BETWEEN '2023-01-01' AND '2023-12-31';

-- 7. Operator IN
-- Mencari game dengan genre RPG, Strategy, atau Puzzle
SELECT * FROM Game WHERE genre IN ('RPG', 'Strategy', 'Puzzle');

-- 8. Operator LIKE
-- Mencari asset dengan nama yang mengandung kata "Model"
SELECT * FROM Asset WHERE NAME LIKE '%Model%';