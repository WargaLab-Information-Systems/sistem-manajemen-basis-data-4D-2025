DELIMITER //
CREATE TRIGGER before_insert_produk
BEFORE INSERT ON Produk_Kertas
FOR EACH ROW
BEGIN
    IF NEW.Harga < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Harga produk tidak boleh kurang dari 0';
    END IF;
END //
DELIMITER ;
INSERT INTO Produk_Kertas (Nama_Produk, Tipe, Ukuran, Harga, Stok, ID_Supplier)
VALUES ('Kertas Tes', 'Kertas Cetak', 'A4', -1000.00, 50, 1);


DELIMITER //
CREATE TRIGGER before_update_stok
BEFORE UPDATE ON Produk_Kertas
FOR EACH ROW
BEGIN
    IF NEW.Stok < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stok tidak boleh negatif';
    END IF;
END //
DELIMITER ;
UPDATE Produk_Kertas
SET Stok = -10
WHERE ID_Produk = 1;


DELIMITER //
CREATE TRIGGER before_delete_produk
BEFORE DELETE ON Produk_Kertas
FOR EACH ROW
BEGIN
    DECLARE jumlah_penggunaan INT;
    SELECT COUNT(*) INTO jumlah_penggunaan
    FROM Detail_Penjualan
    WHERE ID_Produk = OLD.ID_Produk;

    IF jumlah_penggunaan > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Produk tidak bisa dihapus karena sudah digunakan dalam transaksi';
    END IF;
END //
DELIMITER ;
DELETE FROM Produk_Kertas
WHERE ID_Produk = 1;


DELIMITER //
CREATE TRIGGER after_insert_pelanggan
AFTER INSERT ON Pelanggan
FOR EACH ROW
BEGIN
    INSERT INTO Log_Activity (Aktivitas, Waktu)
    VALUES (CONCAT('Pelanggan baru ditambahkan: ', NEW.Nama_Pelanggan), NOW());
END //
DELIMITER ;
-- Menambahkan pelanggan, trigger akan otomatis memasukkan log
INSERT INTO Pelanggan (Nama_Pelanggan, Alamat, No_Telepon, Email)
VALUES ('Pelanggan Baru', 'Jl. Baru', '0811223344', 'baru@example.com');

-- Lihat log:
SELECT * FROM Log_Activity;

CREATE TABLE Log_Activity (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    Aktivitas TEXT,
    Waktu DATETIME
);


DELIMITER //
CREATE TRIGGER after_update_harga
AFTER UPDATE ON Produk_Kertas
FOR EACH ROW
BEGIN
    IF OLD.Harga <> NEW.Harga THEN
        INSERT INTO Log_Activity (Aktivitas, Waktu)
        VALUES (
            CONCAT('Harga produk ', OLD.Nama_Produk, ' diubah dari ', OLD.Harga, ' menjadi ', NEW.Harga),
            NOW()
        );
    END IF;
END //
DELIMITER ;
-- Ubah harga produk
UPDATE Produk_Kertas
SET Harga = 9000.00
WHERE ID_Produk = 1;

-- Cek log aktivitas:
SELECT * FROM Log_Activity;

DELIMITER //
CREATE TRIGGER after_delete_supplier
AFTER DELETE ON Supplier
FOR EACH ROW
BEGIN
    INSERT INTO Log_Activity (Aktivitas, Waktu)
    VALUES (
        CONCAT('Supplier ', OLD.Nama_Supplier, ' telah dihapus'),
        NOW()
    );
END //
DELIMITER ;

-- Hapus supplier
DELETE FROM Supplier
WHERE ID_Supplier = 10;

-- Cek log aktivitas:
SELECT * FROM Log_Activity;
SELECT * FROM supplier;
