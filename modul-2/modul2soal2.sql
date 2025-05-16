-- Membuat database
CREATE DATABASE IF NOT EXISTS db_TokoSwalayan;
USE db_TokoSwalayan;

-- ======================= TABEL MASTER =======================

-- Tabel Pelanggan
CREATE TABLE IF NOT EXISTS Pelanggan (
    ID_pelanggan INT PRIMARY KEY,
    Nama_pelanggan VARCHAR(50),
    Alamat VARCHAR(100),
    No_telepon VARCHAR(15)
);

-- Tabel Barang
CREATE TABLE IF NOT EXISTS Barang (
    ID_barang INT PRIMARY KEY,
    Nama_barang VARCHAR(50),
    Harga DECIMAL(18, 2),
    Stok INT
);

-- ======================= TABEL TRANSAKSI =======================

-- Tabel Transaksi
CREATE TABLE IF NOT EXISTS Transaksi (
    ID_transaksi INT PRIMARY KEY,
    Jenis_transaksi ENUM('Penjualan', 'Pengembalian', 'Pembelian', 'Koreksi_stok'),
    ID_pelanggan INT,
    ID_barang INT,
    Jumlah INT,
    Tanggal_transaksi DATE,
    FOREIGN KEY (ID_pelanggan) REFERENCES Pelanggan(ID_pelanggan),
    FOREIGN KEY (ID_barang) REFERENCES Barang(ID_barang)
);

-- Tabel Keuangan
CREATE TABLE IF NOT EXISTS Keuangan (
    ID_keuangan INT PRIMARY KEY,
    Jenis_keuangan ENUM('Penjualan', 'Pembelian'),
    Jumlah DECIMAL(10, 2),
    Tanggal_transaksi DATE
);

-- Tabel Laporan Penjualan
CREATE TABLE IF NOT EXISTS Laporan_Penjualan (
    ID_laporan_penjualan INT PRIMARY KEY,
    Tanggal_laporan DATE,
    Total_penjualan DECIMAL(10, 2)
);

-- Tabel Laporan Stok
CREATE TABLE IF NOT EXISTS Laporan_Stok (
    ID_laporan_stok INT PRIMARY KEY,
    Tanggal_laporan DATE,
    ID_barang INT,
    Stok_terjual INT,
    Stok_tersisa INT,
    FOREIGN KEY (ID_barang) REFERENCES Barang(ID_barang)
);

-- ======================= DATA AWAL =======================

-- Data Pelanggan
INSERT INTO Pelanggan (ID_pelanggan, Nama_pelanggan, Alamat, No_telepon)
VALUES
(1, 'Kim Taehyung', 'Jl. Gangnam No. 123', '081234567890'),
(2, 'Kim Namjoon', 'Jl. Myeong-dong No. 456', '081234567891'),
(3, 'Kim Seokjin', 'Jl. Hongdae No. 789', '081234567892'),
(4, 'Min Yoongi', 'Jl. Bukchon Hanok No. 321', '081234567893'),
(5, 'JHOPE', 'Jl. Sinchon No. 555', '081234567894'),
(6, 'Park Jimin', 'Jl. Insadong No. 999', '081234567895'),
(7, 'Jungkook', 'Jl. Dongdaemun No. 777', '081234567896'),
(8, 'Kim Jennie', 'Jl. Itaewon No. 654', '081234567897'),
(9, 'Rose', 'Jl. Seongsu-dong No. 111', '081234567898'),
(10, 'Haruto', 'Jl. Chengdam-dong No. 222', '081234567899');

-- Data Barang
INSERT INTO Barang (ID_barang, Nama_barang, Harga, Stok) VALUES
(1, 'Indomie Goreng', 3000.00, 100),
(2, 'Beras 5kg', 65000.00, 50),
(3, 'Minyak Goreng 1L', 18000.00, 70),
(4, 'Telur Ayam 1kg', 25000.00, 40),
(5, 'Sabun Mandi', 7000.00, 80);

-- Data Transaksi
INSERT INTO Transaksi (ID_transaksi, Jenis_transaksi, ID_pelanggan, ID_barang, Jumlah, Tanggal_transaksi) VALUES
(1, 'Penjualan', 1, 1, 10, '2025-04-15'),
(2, 'Penjualan', 2, 2, 1, '2025-04-15'),
(3, 'Pembelian', 3, 3, 20, '2025-04-16'),
(4, 'Pengembalian', 4, 1, 5, '2025-04-17'),
(5, 'Koreksi_stok', 5, 4, 2, '2025-04-18');

-- Data Keuangan
INSERT INTO Keuangan (ID_keuangan, Jenis_keuangan, Jumlah, Tanggal_transaksi) VALUES
(1, 'Penjualan', 30000.00, '2025-04-15'),
(2, 'Penjualan', 65000.00, '2025-04-15'),
(3, 'Pembelian', 360000.00, '2025-04-16'),
(4, 'Penjualan', 75000.00, '2025-04-17'),
(5, 'Penjualan', 14000.00, '2025-04-18');

-- Data Laporan Penjualan
INSERT INTO Laporan_Penjualan (ID_laporan_penjualan, Tanggal_laporan, Total_penjualan) VALUES
(1, '2025-04-15', 95000.00),
(2, '2025-04-16', 0.00),
(3, '2025-04-17', 75000.00),
(4, '2025-04-18', 14000.00),
(5, '2025-04-19', 0.00);

-- Data Laporan Stok
INSERT INTO Laporan_Stok (ID_laporan_stok, Tanggal_laporan, ID_barang, Stok_terjual, Stok_tersisa) VALUES
(1, '2025-04-15', 1, 10, 90),
(2, '2025-04-15', 2, 1, 49),
(3, '2025-04-16', 3, 0, 90),
(4, '2025-04-17', 1, -5, 95),
(5, '2025-04-18', 4, 0, 38);

-- ======================= VIEW =======================

-- View 1: Gabungan dari 2 tabel
CREATE VIEW view_transaksi_pelanggan AS
SELECT 
    t.ID_transaksi,
    p.Nama_pelanggan,
    t.Jenis_transaksi,
    t.Jumlah,
    t.Tanggal_transaksi
FROM Transaksi t
JOIN Pelanggan p ON t.ID_pelanggan = p.ID_pelanggan;
SELECT * FROM view_transaksi_pelanggan;

-- View 2: Gabungan dari 3 tabel
CREATE VIEW view_detail_transaksi AS
SELECT 
    t.ID_transaksi,
    p.Nama_pelanggan,
    b.Nama_barang,
    t.Jumlah,
    t.Tanggal_transaksi
FROM Transaksi t
JOIN Pelanggan p ON t.ID_pelanggan = p.ID_pelanggan
JOIN Barang b ON t.ID_barang = b.ID_barang;
SELECT * FROM view_detail_transaksi;


-- View 3: Gabungan dari 2 tabel dengan kondisi
CREATE VIEW view_penjualan_saja AS
SELECT 
    t.ID_transaksi,
    p.Nama_pelanggan,
    b.Nama_barang,
    t.Jumlah
FROM Transaksi t
JOIN Pelanggan p ON t.ID_pelanggan = p.ID_pelanggan
JOIN Barang b ON t.ID_barang = b.ID_barang
WHERE t.Jenis_transaksi = 'Penjualan';
SELECT * FROM view_penjualan_saja

-- View 4: Fungsi agregat dari 2 tabel
CREATE VIEW view_total_penjualan_per_pelanggan AS
SELECT 
    p.Nama_pelanggan,
    SUM(t.Jumlah) AS total_barang_terjual
FROM Transaksi t
JOIN Pelanggan p ON t.ID_pelanggan = p.ID_pelanggan
WHERE t.Jenis_transaksi = 'Penjualan'
GROUP BY p.Nama_pelanggan;
SELECT * FROM view_total_penjualan_per_pelanggan

-- View 5: View analisis bebas yang berguna (stok * harga)
CREATE VIEW view_analisis_stok AS
SELECT 
    b.Nama_barang,
    b.Stok,
    b.Harga,
    (b.Stok * b.Harga) AS Nilai_total_stok
FROM Barang b;
SELECT * FROM view_analisis_stok 