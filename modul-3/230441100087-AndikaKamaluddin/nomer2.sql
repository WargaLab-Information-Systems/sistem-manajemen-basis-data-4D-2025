DELIMITER //
CREATE PROCEDURE UpdateDataMaster(
    IN id_param VARCHAR(10),
    IN nilai_baru VARCHAR(100),
    OUT status_operasi VARCHAR(50)
)
BEGIN
    UPDATE Game SET title = nilai_baru WHERE gameId = id_param;
    SET status_operasi = 'Data berhasil diupdate';
END //
DELIMITER ;
SET @status = '';
CALL UpdateDataMaster('G01', 'Game Baru', @status);
SELECT @status;


DELIMITER //
CREATE PROCEDURE CountTransaksi(
    OUT total_transaksi INT
)
BEGIN
    SELECT COUNT(*) INTO total_transaksi FROM GameDevelopment;
END //
DELIMITER ;
SET @jumlah = 0;
CALL CountTransaksi(@jumlah);
SELECT @jumlah;



DELIMITER //
CREATE PROCEDURE GetDataMasterByID(
    IN id_param VARCHAR(10),
    OUT data_game VARCHAR(100)
)
BEGIN
    SELECT title INTO data_game FROM Game WHERE gameId = id_param;
END //
DELIMITER ;
SET @data = '';
CALL GetDataMasterByID('G01', @data);
SELECT @data;

DELIMITER //
CREATE PROCEDURE UpdateFieldTransaksi(
    IN id_param VARCHAR(10),
    INOUT judul VARCHAR(100),
    INOUT genre VARCHAR(50)
)
BEGIN
    DECLARE judul_lama VARCHAR(100);
    DECLARE genre_lama VARCHAR(50);
    
    SELECT title, genre INTO judul_lama, genre_lama FROM Game WHERE gameId = id_param;
    
    IF judul = '' THEN
        SET judul = judul_lama;
    END IF;
    
    IF genre = '' THEN
        SET genre = genre_lama;
    END IF;
    
    UPDATE Game SET title = judul, genre = genre WHERE gameId = id_param;
END //
DELIMITER ;
SET @judul = 'Racing Adventure';
SET @genre = 'Racing';
CALL UpdateFieldTransaksi('G02', @judul, @genre);
SELECT @judul, @genre;


DELIMITER //
CREATE PROCEDURE DeleteEntriesByIDMaster(
    IN id_param VARCHAR(10)
)
BEGIN
    DELETE FROM Game WHERE gameId = id_param;
END //
DELIMITER ;
CALL DeleteEntriesByIDMaster('G05');