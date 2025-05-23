DROP DATABASE IF EXISTS bioskop1;
CREATE DATABASE bioskop1;
USE bioskop1;

-- ============================
-- TABEL UTAMA
-- ============================

CREATE TABLE Film (
    kode_film CHAR(5) PRIMARY KEY,
    judul VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    durasi INT,
    rating VARCHAR(10)
);

CREATE TABLE Studio (
    id_studio INT PRIMARY KEY AUTO_INCREMENT,
    nama_studio VARCHAR(50) NOT NULL,
    kapasitas INT NOT NULL
);

CREATE TABLE Pelanggan (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    no_hp VARCHAR(15) NOT NULL
);

CREATE TABLE Jadwal_Film (
    id_jadwal INT PRIMARY KEY AUTO_INCREMENT,
    kode_film CHAR(5),
    id_studio INT,
    tanggal DATE,
    jam_tayang TIME
);

-- Tabel transaksi utama (sudah dimodifikasi sesuai kebutuhan soal)
CREATE TABLE Tiket (
    id_tiket INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT,
    id_jadwal INT,
    jumlah INT,
    total_harga DECIMAL(10,2),

    -- Kolom tambahan untuk mendukung prosedur
    status_transaksi VARCHAR(20) DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_valid BOOLEAN DEFAULT TRUE
);

-- Tabel pembayaran
CREATE TABLE Pembayaran (
    id_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    id_tiket INT,
    metode_pembayaran VARCHAR(50) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_bayar DECIMAL(10,2) NOT NULL,

    -- Tracking waktu pembayaran
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================
-- RELASI FOREIGN KEY
-- ============================

ALTER TABLE Jadwal_Film
ADD CONSTRAINT fk_jadwal_film_film
FOREIGN KEY (kode_film) REFERENCES Film(kode_film) ON DELETE CASCADE;

ALTER TABLE Jadwal_Film
ADD CONSTRAINT fk_jadwal_film_studio
FOREIGN KEY (id_studio) REFERENCES Studio(id_studio) ON DELETE CASCADE;

ALTER TABLE Tiket
ADD CONSTRAINT fk_tiket_pelanggan
FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan) ON DELETE CASCADE;

ALTER TABLE Tiket
ADD CONSTRAINT fk_tiket_jadwal
FOREIGN KEY (id_jadwal) REFERENCES Jadwal_Film(id_jadwal) ON DELETE CASCADE;

ALTER TABLE Pembayaran
ADD CONSTRAINT fk_pembayaran_tiket
FOREIGN KEY (id_tiket) REFERENCES Tiket(id_tiket) ON DELETE CASCADE;

-- ============================
-- DATA AWAL
-- ============================

-- Pelanggan
INSERT INTO Pelanggan (nama, email, no_hp) VALUES 
('Budi Santoso', 'budi@email.com', '081234567890'),
('Siti Aminah', 'siti@email.com', '081298765432'),
('Bilkis', 'bilkis@email.com', '08208307483'),
('Budi juga', 'budia@emil.com', '08208307483');

-- Film
INSERT INTO Film (kode_film, judul, genre, durasi, rating) VALUES
('F001', 'Avengers: Endgame', 'Action', 181, 'PG-13'),
('F002', 'Joker', 'Drama', 122, 'R');

-- Studio
INSERT INTO Studio (nama_studio, kapasitas) VALUES
('Studio 1', 150),
('Studio 2', 100);

-- Jadwal Film
INSERT INTO Jadwal_Film (kode_film, id_studio, tanggal, jam_tayang) VALUES
('F001', 1, '2024-03-25', '18:30:00'),
('F002', 2, '2024-03-25', '20:00:00');

-- Tiket (Transaksi)
INSERT INTO Tiket (id_pelanggan, id_jadwal, jumlah, total_harga, status_transaksi, created_at, is_valid) VALUES 
(1, 1, 2, 100000, 'sukses', '2024-03-25 12:00:00', TRUE), 
(2, 2, 3, 150000, 'sukses', '2024-03-26 15:00:00', TRUE);

-- Pembayaran
INSERT INTO Pembayaran (id_tiket, metode_pembayaran, tanggal_pembayaran, jumlah_bayar, created_at) VALUES
(1, 'E-Wallet', '2024-03-25', 100000, '2024-03-25 12:10:00'),
(2, 'Kartu Kredit', '2024-03-26', 150000, '2024-03-26 15:10:00');

-- 1 Mencegah penyisipan pelanggan baru dengan email yang tidak mengandung @.
DELIMITER //

CREATE TRIGGER before_insert_pelanggan
BEFORE INSERT ON Pelanggan
FOR EACH ROW
BEGIN
    IF NEW.email NOT LIKE '%@%' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Format email tidak valid!';
    END IF;
END;
//

DELIMITER ;

INSERT INTO Pelanggan (nama, email, no_hp)
VALUES ('Test User', 'invalid@email.com', '0812345678');

-- 1.2 Menjamin bahwa kolom status_transaksi pada tabel Tiket tidak diubah menjadi NULL.
DELIMITER //

CREATE TRIGGER before_update_tiket
BEFORE UPDATE ON Tiket
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Status transaksi tidak boleh NULL!';
    END IF;
END;
//

DELIMITER ;

UPDATE Tiket SET status_transaksi = NULL WHERE id_tiket = 1;

-- 1.3 Cegah penghapusan data jadwal film jika ada transaksi tiket yang masih valid.
DELIMITER //

CREATE TRIGGER before_delete_jadwal
BEFORE DELETE ON Jadwal_Film
FOR EACH ROW
BEGIN
    DECLARE jumlah_tiket INT;

    SELECT COUNT(*) INTO jumlah_tiket
    FROM Tiket
    WHERE id_jadwal = OLD.id_jadwal;

    IF jumlah_tiket > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tidak bisa hapus jadwal karena masih ada transaksi tiket terkait.';
    END IF;
END;
//

DELIMITER ;

-- Akan GAGAL jika jadwal id 1 sudah ada di Tiket
DELETE FROM Jadwal_Film WHERE id_jadwal = 1;


-- 2.1
--  Menambahkan riwayat transaksi ke tabel Riwayat_Transaksi 
 -- setiap kali ada transaksi tiket baru yang berhasil dimasukkan.
CREATE TABLE Riwayat_Transaksi (
    id_riwayat INT PRIMARY KEY AUTO_INCREMENT,
    id_tiket INT,
    tanggal_transaksi DATETIME,
    ACTION VARCHAR(20) NOT NULL,  -- Bisa berisi 'INSERT'
    total_harga DECIMAL(10, 2)
);

DELIMITER //

CREATE TRIGGER after_insert_tiket
AFTER INSERT ON Tiket
FOR EACH ROW
BEGIN
    -- Menambahkan data ke Riwayat_Transaksi setelah ada transaksi baru
    INSERT INTO Riwayat_Transaksi (id_tiket, tanggal_transaksi, ACTION, total_harga)
    VALUES (NEW.id_tiket, NOW(), 'INSERT', NEW.total_harga);
END;
//

DELIMITER ;

-- Tambah transaksi tiket baru
INSERT INTO Tiket (id_pelanggan, id_jadwal, jumlah, total_harga, status_transaksi, created_at, is_valid)
VALUES (1, 1, 2, 100000, 'sukses', '2024-05-15 12:00:00', TRUE);

-- Cek Riwayat_Transaksi untuk melihat apakah entry sudah ditambahkan
SELECT * FROM Riwayat_Transaksi;



-- 2.2 Mencatat perubahan status transaksi tiket ke log.
CREATE TABLE Log_Update_JumlahTiket (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_tiket INT,
    jumlah_lama INT,
    jumlah_baru INT,
    user_action VARCHAR(100) DEFAULT 'admin',
    waktu_update DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE PROCEDURE log_update_jumlah_tiket (
    IN p_id_tiket INT,
    IN p_jumlah_lama INT,
    IN p_jumlah_baru INT
)
BEGIN
    INSERT INTO Log_Update_JumlahTiket (id_tiket, jumlah_lama, jumlah_baru)
    VALUES (p_id_tiket, p_jumlah_lama, p_jumlah_baru);
END;

//
DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_after_update_jumlah
AFTER UPDATE ON Tiket
FOR EACH ROW
BEGIN
    IF OLD.jumlah <> NEW.jumlah THEN
        CALL log_update_jumlah_tiket(NEW.id_tiket, OLD.jumlah, NEW.jumlah);
    END IF;
END;

//
DELIMITER ;

UPDATE Tiket SET jumlah = 5 WHERE id_tiket = 3;

SELECT * FROM Log_Update_JumlahTiket;
-- Misalnya pakai data jadwal dan pelanggan yang sudah ada
INSERT INTO Tiket (id_pelanggan, id_jadwal, jumlah, total_harga, status_transaksi) 
VALUES (1, 1, 2, 100000, 'sukses');

-- 2.3 
CREATE TABLE Riwayat_Hapus_Tiket (
    id_riwayat INT PRIMARY KEY AUTO_INCREMENT,
    id_tiket INT,
    total_harga DECIMAL(10,2),
    tanggal_hapus DATETIME
);

DELIMITER //

CREATE TRIGGER after_delete_tiket
AFTER DELETE ON Tiket
FOR EACH ROW
BEGIN
    -- Mencatat tiket yang dihapus
    INSERT INTO Riwayat_Hapus_Tiket (id_tiket, total_harga, tanggal_hapus)
    VALUES (OLD.id_tiket, OLD.total_harga, NOW());
END;
//

DELIMITER ;

-- Hapus tiket
DELETE FROM Tiket WHERE id_tiket = 1;

-- Cek Riwayat_Hapus_Tiket untuk melihat apakah tiket yang dihapus tercatat
SELECT * FROM Riwayat_Hapus_Tiket;
