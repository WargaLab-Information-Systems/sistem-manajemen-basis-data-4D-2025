USE Tokosepatu ;

-- soal 1

DELIMITER //

-- Trigger BEFORE INSERT pada tabel Transaksi
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON Transaksi
FOR EACH ROW
BEGIN
    IF NEW.Jumlah <= 0 OR NEW.Total <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Jumlah dan Total harus lebih besar dari 0';
    END IF;
END //
INSERT INTO Transaksi (Tanggal, ID_Pelanggan, ID_Pegawai, ID_Sepatu, Jumlah, Total) 
VALUES (CURDATE(), 1, 1, 5, 2, -3600000.00);


-- soal 2

-- Trigger BEFORE UPDATE pada tabel Sepatu

DELIMITER //
CREATE OR REPLACE TRIGGER before_update_sepatu
BEFORE UPDATE ON Sepatu
FOR EACH ROW
BEGIN
    IF NEW.Stok < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stok tidak boleh negatif';
    END IF;
END;
//
DELIMITER ;


UPDATE Sepatu SET Stok = -3 WHERE ID_Sepatu = 1;
SELECT * FROM Sepatu WHERE ID_Sepatu = 1;

INSERT INTO Sepatu (ID_Sepatu, Stok) VALUES (1, 10);


-- soal 3

-- Trigger BEFORE DELETE pada tabel Pegawai
DELIMITER //
CREATE OR REPLACE TRIGGER before_delete_pegawai
BEFORE DELETE ON Pegawai
FOR EACH ROW
BEGIN
   IF LOWER(OLD.Jabatan) = 'admin' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Data pegawai dengan jabatan Admin tidak boleh dihapus';
    END IF;
END //
DELIMITER ;
INSERT INTO Pegawai (NamaPegawai, Jabatan) VALUES ('Rina', 'Admin');
DELETE FROM Pegawai WHERE NamaPegawai = 'Rina';


-- soal 4

DELIMITER //

-- Trigger AFTER INSERT pada tabel Transaksi
CREATE TRIGGER after_insert_transaksi
AFTER INSERT ON Transaksi
FOR EACH ROW
BEGIN
    INSERT INTO Log_Aktivitas (Deskripsi) 
    VALUES (CONCAT('Transaksi baru ditambahkan dengan ID: ', NEW.ID_Transaksi));
END //

CREATE TABLE Log_Aktivitas (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    Deskripsi TEXT,
    Waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Transaksi (ID_Pelanggan, Total) VALUES (1, 50000);

SELECT * FROM Log_Aktivitas ORDER BY ID_Log DESC;

-- soal 5
-- Trigger AFTER UPDATE pada tabel Sepatu
DELIMITER //

CREATE TRIGGER after_update_sepatu
AFTER UPDATE ON Sepatu
FOR EACH ROW
BEGIN
    INSERT INTO Log_Aktivitas (Deskripsi)
    VALUES (CONCAT('Stok sepatu dengan ID: ', NEW.ID_Sepatu, ' telah diperbarui.'));
END//

DELIMITER ;

UPDATE Sepatu
SET Stok = Stok + 10
WHERE ID_Sepatu = 1;

SELECT * FROM Log_Aktivitas;

-- soal 6
-- Trigger AFTER DELETE pada tabel Transaksi
DELIMITER //
CREATE OR REPLACE TRIGGER after_delete_transaksi
AFTER DELETE ON Transaksi
FOR EACH ROW
BEGIN
    INSERT INTO Log_Aktivitas (Deskripsi) 
    VALUES (CONCAT('Transaksi dengan ID: ', OLD.ID_Transaksi, ' telah dihapus.'));
END //

DELIMITER ;

SELECT * FROM pelanggan;
SHOW CREATE TABLE Transaksi;


SHOW TRIGGERS FROM tokosepatu; 

SELECT * FROM Transaksi WHERE ID_Transaksi = 1;

DELETE FROM Transaksi
WHERE ID_Transaksi = 5;

SELECT * FROM Log_Aktivitas ORDER BY ID_Log DESC;

INSERT INTO Transaksi (ID_Transaksi, Tanggal, ID_Pelanggan, ID_Pegawai, ID_Sepatu, Jumlah, Total, STATUS)
VALUES (1, '2025-05-16', 1, 1, 1, 2, 300000, 'Selesai');

INSERT INTO Transaksi (ID_Transaksi, Tanggal, ID_Pelanggan, ID_Pegawai, ID_Sepatu, Jumlah, Total, STATUS)
VALUES (2, '2025-05-17', 2, 2, 2, 1, 150000, 'Pending');



