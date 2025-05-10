-- view yang menampilkan data gabungan dari Game dan GameVersion
CREATE VIEW SimpleGameVersions AS
SELECT 
    g.gameId,
    g.title AS gameTitle,
    gv.versionId,
    gv.versionNumber
FROM Game g JOIN GameVersion gv ON g.gameId = gv.gameId ORDER BY g.title, gv.versionNumber;
SELECT * FROM SimpleGameVersions

-- view yang menampilkan data gabungan dari 3 tabel (Game, Developer, GameDevelopment)
CREATE VIEW GameDevelopmentTeam AS
SELECT 
    g.gameId,
    g.title AS gameTitle,
    g.genre,
    d.developerId,
    d.name AS developerName,
    d.specialization,
    d.experienceLevel,
    gd.role,
    gd.startDate,
    gd.endDate,
    gd.status
FROM Game g JOIN GameDevelopment gd ON g.gameId = gd.gameId JOIN Developer d ON gd.developerId = d.developerId ORDER BY g.title, d.name;
SELECT * FROM GameDevelopmentTeam

-- view yang sederhana menampilkan aset untuk game aktif
CREATE VIEW ActiveGameAssets AS
SELECT 
    g.gameId,
    g.title AS gameTitle,
    a.assetId,
    a.name AS assetName
FROM Game g JOIN AssetUsage au ON g.gameId = au.gameId JOIN Asset a ON au.assetId = a.assetId WHERE g.isActive = 'yes' ORDER BY g.title, a.name;
SELECT * FROM ActiveGameAssets

-- view yang menampilkan jumlah aset per game
CREATE VIEW GameAssetCount AS
SELECT 
    g.gameId,
    g.title AS gameTitle,
    COUNT(au.assetId) AS totalAssets
FROM Game g LEFT JOIN AssetUsage au ON g.gameId = au.gameId GROUP BY g.gameId, g.title ORDER BY g.title;
SELECT * FROM GameAssetCount

-- view yang sangat sederhana untuk melihat timeline pengembangan game
CREATE VIEW SimpleGameDevelopmentTimeline AS
SELECT 
    g.gameId,
    g.title AS gameTitle,
    MIN(gd.startDate) AS projectStartDate,
    MAX(gd.endDate) AS projectEndDate,
    COUNT(gd.developerId) AS developmentTasks
FROM Game g JOIN GameDevelopment gd ON g.gameId = gd.gameId GROUP BY g.gameId, g.title ORDER BY projectStartDate DESC;
SELECT * FROM SimpleGameDevelopmentTimeline