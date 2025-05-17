CREATE DATABASE laboratorium;
USE laboratorium;

CREATE TABLE barang (
    id_barang INT AUTO_INCREMENT PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    stok INT NOT NULL DEFAULT 0,
    harga DECIMAL(10,2) NOT NULL
);

CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT NOT NULL,
    jumlah INT NOT NULL,
    total_harga DECIMAL(10,2) NOT NULL,
    tanggal_transaksi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
);

INSERT INTO barang (nama_barang, stok, harga) VALUES
('Monitor LED 24 inch', 20, 1500000.00),
('Keyboard Mechanical', 30, 350000.00),
('Mouse Wireless', 40, 150000.00),
('PC Rakitan Core i5', 10, 7500000.00),
('Headset Gaming', 25, 500000.00),
('Switch Hub 8 Port', 15, 400000.00),
('Kabel LAN 10m', 50, 100000.00),
('UPS 600VA', 12, 600000.00),
('Proyektor Full HD', 5, 3500000.00),
('Printer Laserjet', 8, 2500000.00);


DELIMITER //
CREATE TRIGGER stok_kurang
AFTER INSERT ON transaksi
FOR EACH ROW
BEGIN
	UPDATE barang SET stok = stok - NEW.jumlah
	WHERE id_barang = NEW.id_barang;
END//
DELIMITER;

INSERT INTO transaksi (id_barang, jumlah, total_harga)
VALUES (1, 5, 5*1500000);
SELECT * FROM barang;


DELIMITER //
CREATE TRIGGER cekstok
BEFORE INSERT ON transaksi 
FOR EACH ROW
BEGIN
	DECLARE stok_sekarang INT;
	SELECT stok INTO stok_sekarang
	FROM barang
	WHERE id_barang = new.id_barang;

	IF stok_sekarang < NEW.jumlah THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Stok tidak mencukupi';
	END IF;
END//
DELIMITER;
INSERT INTO transaksi (id_barang, jumlah, total_harga) VALUES (3, 20, 5*150000);
SELECT * FROM barang;
SELECT * FROM transaksi;


DELIMITER //
CREATE TRIGGER update_stok
AFTER UPDATE ON transaksi 
FOR EACH ROW 
BEGIN
	DECLARE selisih INT;
	SET selisih = new.jumlah - old.jumlah;
	
	UPDATE barang SET stok = stok - selisih
	WHERE id_barang = new.id_barang;
END//
DELIMITER;
UPDATE transaksi SET jumlah = 15, total_harga = 15*150000 WHERE id_transaksi = 2;