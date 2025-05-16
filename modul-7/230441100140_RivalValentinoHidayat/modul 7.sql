CREATE DATABASE reservasii_hotel;
USE reservasi_hotel;

CREATE TABLE Tamu (
    id_tamu INT PRIMARY KEY AUTO_INCREMENT,
    nama_tamu VARCHAR(100),
    alamat VARCHAR(255),
    no_telepon VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Kamar (
    id_kamar INT PRIMARY KEY AUTO_INCREMENT,
    nomor_kamar VARCHAR(10),
    jenis_kamar VARCHAR(50),
    harga_per_malam DECIMAL(10,2),
    STATUS VARCHAR(20)
);

CREATE TABLE Pegawai (
    id_pegawai INT PRIMARY KEY AUTO_INCREMENT,
    nama_pegawai VARCHAR(100),
    jabatan VARCHAR(50),
    shift VARCHAR(20)
);

CREATE TABLE Fasilitas (
    id_fasilitas INT PRIMARY KEY AUTO_INCREMENT,
    nama_fasilitas VARCHAR(100),
    deskripsi TEXT
);

CREATE TABLE Reservasi (
    id_reservasi INT PRIMARY KEY AUTO_INCREMENT,
    id_tamu INT,
    id_kamar INT,
    id_pegawai INT,
    tanggal_checkin DATE,
    tanggal_checkout DATE,
    total_harga DECIMAL(10,2),
    STATUS VARCHAR(20)
);

ALTER TABLE Reservasi
    ADD CONSTRAINT fk_reservasi_tamu
    FOREIGN KEY (id_tamu) REFERENCES Tamu(id_tamu);

ALTER TABLE Reservasi
    ADD CONSTRAINT fk_reservasi_kamar
    FOREIGN KEY (id_kamar) REFERENCES Kamar(id_kamar);

ALTER TABLE Reservasi
    ADD CONSTRAINT fk_reservasi_pegawai
    FOREIGN KEY (id_pegawai) REFERENCES Pegawai(id_pegawai);

ALTER TABLE Fasilitas
ADD COLUMN id_kamar INT,
ADD CONSTRAINT fk_fasilitas_kamar
FOREIGN KEY (id_kamar) REFERENCES Kamar(id_kamar);


INSERT INTO Tamu (nama_tamu, alamat, no_telepon, email) VALUES
('Indra', 'Jl. Telang No.1', '081234567890', 'indra@mail.com'),
('Abrori', 'Jl. Telang No.2', '081298765432', 'abrori@mail.com'),
('Salsa', 'Jl. Telang No.3', '081322334455', 'salsa@mail.com'),
('Bagas', 'Jl. Telang No.4', '081344556677', 'bagas@mail.com'),
('Aga', 'Jl. Telang No.6', '081344556813', 'aga@mail.com');


INSERT INTO Kamar (nomor_kamar, jenis_kamar, harga_per_malam, STATUS) VALUES
('101', 'Deluxe', 500000, 'tersedia'),
('102', 'Superior', 400000, 'tersedia'),
('201', 'Suite', 800000, 'tersedia'),
('103', 'Standard', 300000, 'tersedia'),
('202', 'Suite', 850000, 'selesai');


INSERT INTO Pegawai (nama_pegawai, jabatan, shift) VALUES
('Rival', 'Resepsionis', 'Pagi'),
('Tanji', 'Manager', 'Malam'),
('Dina', 'Housekeeping', 'Siang'),
('Abrori', 'Security', 'Malam');

INSERT INTO Fasilitas (nama_fasilitas, deskripsi, id_kamar) VALUES
('Kolam Renang', 'Kolam renang outdoor untuk dewasa dan anak-anak', 1),
('Gym', 'Tempat fitness lengkap dengan alat-alat olahraga', 1),
('WiFi', 'Akses internet gratis', 2),
('AC', 'Pendingin udara ruangan', 2),
('TV', 'TV LED 32 inch', 3),
('Bathtub', 'Bathtub dengan air panas', 5);

INSERT INTO Reservasi (id_tamu, id_kamar, id_pegawai, tanggal_checkin, tanggal_checkout, total_harga, STATUS) VALUES
(1, 1, 1, '2025-04-04', '2025-05-12', 1000000, 'aktif'),
(2, 2, 2, '2024-01-11', '2025-04-13', 800000, 'batal'),
(3, 3, 3, '2025-03-09', '2025-04-10', 800000, 'selesai'),
(4, 4, 4, '2022-04-05', '2022-04-08', 900000, 'batal'),
(1, 5, 1, '2022-04-01', '2023-04-04', 2550000, 'selesai'),
(2, 3, 1, '2025-05-01', '2025-05-03', 1600000, 'selesai'),
(3, 4, 2, '2025-05-05', '2025-05-07', 600000, 'aktif'),
(4, 1, 3, '2025-05-02', '2025-05-12', 1000000, 'aktif'),
(1, 2, 4, '2025-05-02', '2025-05-17', 800000, 'aktif'),
(2, 3, 1, '2025-05-02', '2025-05-22', 1600000, 'aktif'),
(3, 4, 2, '2025-05-03', '2025-05-27', 600000, 'aktif'),
(4, 5, 3, '2025-05-01', '2025-06-02', 2550000, 'aktif');


-- 1.1
DELIMITER //
CREATE TRIGGER before_insert_reservasi
BEFORE INSERT ON Reservasi
FOR EACH ROW
BEGIN
    -- Memastikan tanggal_checkin lebih kecil dari tanggal_checkout
    IF NEW.tanggal_checkin >= NEW.tanggal_checkout THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tanggal check-in harus sebelum tanggal check-out';
    END IF;
END;
//
DELIMITER ;


-- TEST
INSERT INTO Reservasi 
(id_tamu, id_kamar, id_pegawai, tanggal_checkin, tanggal_checkout, total_harga, STATUS)
VALUES 
(5, 3, 2, '2025-06-10', '2025-06-15', 1500000, 'Aktif');
SELECT * FROM reservasi;

-- 1.2
DELIMITER //
CREATE TRIGGER before_update_kamar
BEFORE UPDATE ON Kamar
FOR EACH ROW
BEGIN
    IF NEW.harga_per_malam < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Harga per malam tidak boleh negatif';
    END IF;
END;
//
DELIMITER ;

-- TEST: Update harga kamar menjadi negatif
UPDATE Kamar SET harga_per_malam = 50000 WHERE id_kamar = 1;
SELECT * FROM kamar;


-- 1.3
DELIMITER //
CREATE TRIGGER before_delete_pegawai
BEFORE DELETE ON Pegawai
FOR EACH ROW
BEGIN
    DECLARE jumlah_reservasi INT;
    SELECT COUNT(*) INTO jumlah_reservasi 
    FROM Reservasi 
    WHERE id_pegawai = OLD.id_pegawai;
    
    IF jumlah_reservasi > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tidak dapat menghapus pegawai yang masih memiliki reservasi';
    END IF;
END;
//
DELIMITER ;

-- TEST: Hapus pegawai yang masih ada di reservasi
DELETE FROM Pegawai WHERE id_pegawai = 4;
SELECT * FROM pegawai;

-- 2.1
DELIMITER //
CREATE TRIGGER after_insert_tamu
AFTER INSERT ON Tamu
FOR EACH ROW
BEGIN
    -- Cek apakah nama tamu sudah ada di Pegawai
    IF EXISTS (SELECT 1 FROM Pegawai WHERE nama_pegawai = NEW.nama_tamu) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nama pegawai sudah terdaftar';
    ELSE
        INSERT INTO Pegawai (nama_pegawai, jabatan, shift)
        VALUES (NEW.nama_tamu, 'Customer Service', 'Pagi');
    END IF;
END;
//
DELIMITER ;

-- TEST: Insert tamu baru dan lihat hasilnya di Pegawai
INSERT INTO Tamu (nama_tamu, alamat, no_telepon, email)
VALUES ('Monica', 'Jl. Baru', '081234000111', 'autocs@mail.com');
SELECT * FROM Tamu ;

-- 2.2
DELIMITER //
CREATE TRIGGER after_update_status_kamar
AFTER UPDATE ON Kamar
FOR EACH ROW
BEGIN
    IF NEW.status = 'terisi' THEN
        -- Cek apakah ada reservasi untuk kamar tersebut
        IF NOT EXISTS (
            SELECT 1 FROM Reservasi WHERE id_kamar = NEW.id_kamar AND STATUS != 'selesai'
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tidak ada reservasi aktif untuk kamar ini.';
        ELSE
            UPDATE Reservasi
            SET STATUS = 'aktif'
            WHERE id_kamar = NEW.id_kamar AND STATUS != 'selesai';
        END IF;
    END IF;
END;
//
DELIMITER ;

-- TEST: Update status kamar menjadi 'terisi'
UPDATE Kamar SET STATUS = 'terisi' WHERE id_kamar = 15;
SELECT * FROM Kamar ;
SELECT * FROM Reservasi ;

-- 2.3
DELIMITER //
CREATE TRIGGER after_delete_fasilitas
AFTER DELETE ON Fasilitas
FOR EACH ROW
BEGIN
    -- Jika fasilitas yang dihapus bernama 'VIP', munculkan error
    IF OLD.nama_fasilitas = 'WiFi' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fasilitas VIP tidak boleh dihapus.';
    ELSE
        INSERT INTO Fasilitas_Log (info)
        VALUES (CONCAT('Fasilitas dihapus: ', OLD.nama_fasilitas));
    END IF;
END;
//
DELIMITER ;

DELETE FROM Fasilitas WHERE nama_fasilitas = 'WiFi';

SELECT * FROM Fasilitas ;

DROP DATABASE reservasii_hotel