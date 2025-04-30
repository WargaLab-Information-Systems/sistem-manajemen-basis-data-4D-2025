CREATE DATABASE db_toko_baju;
USE db_toko_baju;

CREATE TABLE data_pelanggan (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    no_hp VARCHAR(15),
    alamat TEXT
);

CREATE TABLE data_produk (
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(100) NOT NULL,
    kategori VARCHAR(50),
    harga DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL
);

CREATE TABLE data_transaksi (
    id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT,
    tanggal_transaksi DATE NOT NULL,
    total_harga DECIMAL(10,2),
    FOREIGN KEY (id_pelanggan) REFERENCES data_pelanggan(id_pelanggan) ON DELETE CASCADE
);

CREATE TABLE detail_transkasi (
    id_detail INT PRIMARY KEY AUTO_INCREMENT,
    id_transaksi INT,
    id_produk INT,
    jumlah INT NOT NULL,
    harga_satuan DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES data_transaksi(id_transaksi) ON DELETE CASCADE,
    FOREIGN KEY (id_produk) REFERENCES data_produk(id_produk) ON DELETE CASCADE
);

CREATE TABLE pelanggan_membership (
    id_membership INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT,
    tipe_membership ENUM('Silver', 'Gold', 'Platinum') NOT NULL,
    tanggal_daftar DATE NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES data_pelanggan(id_pelanggan) ON DELETE CASCADE
);

INSERT INTO data_pelanggan (nama, email, no_hp, alamat) VALUES
('Sindy', 'sindy@example.com', '081234567890', 'Jl. Melati No. 10'),
('Amel', 'amel@example.com', '081234567891', 'Jl. Mawar No. 15'),
('Evril', 'evril@example.com', '081234567892', 'Jl. Dahlia No. 12'),
('Fibri', 'fibri@example.com', '081234567893', 'Jl. Kenanga No. 20'),
('Ike', 'ike@example.com', '081234567894', 'Jl. Tulip No. 25'),
('Rena', 'rena@example.com', '081234567895', 'Jl. Sakura No. 30'),
('Adit', 'adit@example.com', '081234567896', 'Jl. Anggrek No. 35'),
('Abil', 'abil@example.com', '081234567897', 'Jl. Teratai No. 40'),
('Lala', 'lala@example.com', '081234567898', 'Jl. Bougenville No. 45'),
('Alfian', 'alfian@example.com', '081234567899', 'Jl. Flamboyan No. 50');

INSERT INTO data_produk (nama_produk, kategori, harga, stok) VALUES
('Kaos Polos', 'Pakaian', 50000.00, 100),
('Kemeja Pria', 'Pakaian', 150000.00, 50),
('Jaket Hoodie', 'Pakaian', 200000.00, 30),
('Celana Jeans', 'Pakaian', 180000.00, 40),
('Sepatu Sneakers', 'Aksesoris', 300000.00, 20),
('Topi Baseball', 'Aksesoris', 80000.00, 75),
('Tas Selempang', 'Aksesoris', 250000.00, 25),
('Sweater Rajut', 'Pakaian', 170000.00, 35),
('Kemeja Wanita', 'Pakaian', 140000.00, 45),
('Rok Mini', 'Pakaian', 120000.00, 50);

INSERT INTO data_transaksi (id_pelanggan, tanggal_transaksi, total_harga) VALUES
(1, '2025-04-01', 550000.00),
(2, '2025-04-02', 300000.00),
(3, '2025-04-03', 450000.00),
(4, '2025-04-04', 200000.00),
(5, '2025-04-05', 700000.00),
(6, '2025-04-06', 600000.00),
(7, '2025-04-07', 800000.00),
(8, '2025-04-08', 900000.00),
(9, '2025-04-09', 1000000.00),
(10, '2025-04-10', 1100000.00);

INSERT INTO detail_transkasi (id_transaksi, id_produk, jumlah, harga_satuan, subtotal) VALUES
(1, 1, 3, 50000.00, 150000.00),
(1, 2, 2, 150000.00, 300000.00),
(1, 3, 1, 200000.00, 200000.00),
(2, 4, 2, 180000.00, 360000.00),
(2, 5, 1, 300000.00, 300000.00),
(3, 6, 4, 80000.00, 320000.00),
(3, 7, 1, 250000.00, 250000.00),
(4, 8, 1, 170000.00, 170000.00),
(4, 9, 2, 140000.00, 280000.00),
(5, 10, 3, 120000.00, 360000.00);

INSERT INTO pelanggan_membership (id_pelanggan, tipe_membership, tanggal_daftar) VALUES
(1, 'Silver', '2025-01-01'),
(2, 'Gold', '2025-01-05'),
(3, 'Silver', '2025-01-10'),
(4, 'Platinum', '2025-01-15'),
(5, 'Gold', '2025-01-20'),
(6, 'Silver', '2025-01-25'),
(7, 'Platinum', '2025-01-30'),
(8, 'Gold', '2025-02-01'),
(9, 'Silver', '2025-02-05'),
(10, 'Platinum', '2025-02-10');

-- Soal 2
-- No 1
CREATE VIEW view_pelanggan_transaksi AS
SELECT 
    dp.nama AS 'Nama Pelanggan',
    dp.email AS 'Email',
    dp.no_hp AS 'No Hp',
    dp.alamat AS 'Alamat',
    dt.tanggal_transaksi AS 'Tgl Transaksi',
    dt.total_harga AS 'Total Harga'
FROM data_pelanggan dp
JOIN data_transaksi dt ON dp.id_pelanggan = dt.id_pelanggan;
SELECT * FROM view_pelanggan_transaksi;

-- No 2
CREATE VIEW view_pelanggan_transaksi_detail AS
SELECT 
    dp.nama AS 'Nama Pelanggan',
    dp.email AS 'Email',
    dp.no_hp AS 'No Hp',
    dt.tanggal_transaksi AS 'Tgl Transaksi',
    dt.total_harga AS 'Total Harga',
    dtr.jumlah AS 'Jumlah',
    dtr.harga_satuan AS 'Harga Per-PCS',
    dtr.subtotal AS 'SubTotal'
FROM data_pelanggan dp
JOIN data_transaksi dt ON dp.id_pelanggan = dt.id_pelanggan
JOIN detail_transkasi dtr ON dt.id_transaksi = dtr.id_transaksi;
SELECT * FROM view_pelanggan_transaksi_detail;

-- No 3
CREATE VIEW view_pelanggan_transaksi_syarat AS
SELECT 
    dp.nama AS 'Nama Pelanggan',
    dp.email AS 'Email',
    dp.no_hp AS 'No Hp',
    dt.tanggal_transaksi AS 'Tgl Transaksi',
    dt.total_harga AS 'Total Harga',
    dtr.jumlah AS 'Jumlah',
    dtr.harga_satuan AS 'Harga Per-PCS',
    dtr.subtotal AS 'SubTotal'
FROM data_pelanggan dp
JOIN data_transaksi dt ON dp.id_pelanggan = dt.id_pelanggan
JOIN detail_transkasi dtr ON dt.id_transaksi = dtr.id_transaksi
WHERE dt.total_harga > 400000;
SELECT * FROM view_pelanggan_transaksi_syarat;

DROP VIEW view_pelanggan_transaksi_syarat;

-- No 4
CREATE VIEW view_avg_total_harga_pelanggan AS
SELECT 
    dp.id_pelanggan,
    dp.nama AS 'Nama Pelanggan',
    dp.email AS 'Email',
    ROUND(AVG(dt.total_harga), 2) AS 'Rata-Rata Total Harga'
FROM data_pelanggan dp
JOIN data_transaksi dt ON dp.id_pelanggan = dt.id_pelanggan
GROUP BY dp.id_pelanggan, dp.nama, dp.email;
SELECT * FROM view_avg_total_harga_pelanggan;

-- No 5
CREATE VIEW view_pelanggan_baju AS
SELECT 
    dp.nama AS 'Nama Pelanggan',
    dp.email AS 'Email',
    COUNT(dt.id_transaksi) AS 'Jumlah Transaksi',
    SUM(dt.total_harga) AS 'Total Belanja',
    ROUND(AVG(dt.total_harga), 2) AS 'Rata-Rata Nilai Transaksi'
FROM data_pelanggan dp
JOIN data_transaksi dt ON dp.id_pelanggan = dt.id_pelanggan
GROUP BY dp.id_pelanggan, dp.nama, dp.email
ORDER BY COUNT(dt.id_transaksi) DESC;
SELECT * FROM view_pelanggan_baju;

DROP DATABASE db_toko_baju;

SHOW DATABASES;
SHOW TABLES;