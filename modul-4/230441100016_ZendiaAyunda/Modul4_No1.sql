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

-- Modul 4
-- No 1 Menambah Kolom keterangan di salah satu tabel pada bagian akhir tabel tersebut!
ALTER TABLE data_produk
ADD COLUMN keterangan TEXT AFTER stok;

SELECT * FROM data_produk;

-- No 2 Gabungan 2 tabel yang memungkinkan dan memiliki fungsi pada penerapannya
SELECT 
    data_pelanggan.nama,
    data_pelanggan.email,
    data_transaksi.id_transaksi,
    data_transaksi.tanggal_transaksi,
    data_transaksi.total_harga
FROM 
    data_pelanggan
INNER JOIN 
    data_transaksi ON data_pelanggan.id_pelanggan = data_transaksi.id_pelanggan;

-- No 3 Order By, DESC, dan ASC
SELECT * FROM data_pelanggan
ORDER BY nama ASC;

SELECT * FROM data_produk
ORDER BY harga DESC;

SELECT * FROM data_transaksi
ORDER BY tanggal_transaksi;

-- No 4 Perubahan pada salah satu tipe data yang dapat berguna
ALTER TABLE data_pelanggan
MODIFY COLUMN no_hp VARCHAR(20);

-- No 5 Kode Left Join, Right Join dan Self Join
-- Left Join
SELECT 
    data_pelanggan.nama, 
    data_transaksi.id_transaksi, 
    data_transaksi.total_harga
FROM 
    data_pelanggan
LEFT JOIN 
    data_transaksi 
ON 
    data_pelanggan.id_pelanggan = data_transaksi.id_pelanggan;
-- Right Join
SELECT 
	data_pelanggan.nama, 
	data_transaksi.id_transaksi, 
	data_transaksi.total_harga
FROM 
	data_pelanggan
RIGHT JOIN 
	data_transaksi ON data_pelanggan.id_pelanggan = data_transaksi.id_pelanggan;
-- Self Join
SELECT 
    A.nama AS nama_pelanggan_1, 
    B.nama AS nama_pelanggan_2, 
    A.alamat
FROM 
    data_pelanggan A
INNER JOIN 
    data_pelanggan B 
ON 
    A.alamat = B.alamat
WHERE 
    A.id_pelanggan < B.id_pelanggan;

-- No 6 Kode yang mengandung operator perbandingan
-- Operator = sama dengan
SELECT * FROM data_pelanggan
WHERE nama = 'Sindy';

-- Operator <> tidak sama dengan
SELECT * FROM data_produk
WHERE kategori <> 'Aksesoris';

-- Operator > lebih dari
SELECT * FROM data_produk
WHERE harga > 200000;

-- Operator < kurang dari
SELECT * FROM data_produk
WHERE stok < 30;

-- Operator >= lebih besar sama dengan
SELECT * FROM data_pelanggan
WHERE id_pelanggan >= 5;

-- Operator <= kurang dari sama dengan
SELECT * FROM data_transaksi
WHERE total_harga <= 500000;

SHOW DATABASES;
SHOW TABLES;