-- Membuat database 
CREATE DATABASE db_TokoSwalayan; 
USE db_TokoSwalayan; 
-- ======================= -- TABEL MASTER -- ======================= 
-- Tabel Pelanggan 
CREATE TABLE Pelanggan (  
ID_pelanggan INT PRIMARY KEY,  
Nama_pelanggan VARCHAR(50),  
Alamat VARCHAR(100),  
No_telepon VARCHAR(15)  
); 
 
 -- Tabel Barang 
CREATE TABLE Barang (  
    ID_barang INT PRIMARY KEY,  
    Nama_barang VARCHAR(50),  
    Harga DECIMAL(18, 2),  
    Stok INT  
); 
 -- ======================= -- TABEL TRANSAKSI -- ======================= 
 -- Tabel Transaksi 
CREATE TABLE Transaksi (  
    ID_transaksi INT PRIMARY KEY,  
    Jenis_transaksi ENUM('Penjualan', 'Pengembalian', 'Pembelian', 
'Koreksi_stok'),  
    ID_pelanggan INT,  
    ID_barang INT,  
    Jumlah INT,  
    Tanggal_transaksi DATE,  
    FOREIGN KEY (ID_pelanggan) REFERENCES Pelanggan(ID_pelanggan),  
    FOREIGN KEY (ID_barang) REFERENCES Barang(ID_barang)  
); 
 -- Tabel Keuangan 
CREATE TABLE Keuangan (  
    ID_keuangan INT PRIMARY KEY,  
    Jenis_keuangan ENUM('Penjualan', 'Pembelian'),  
    Jumlah DECIMAL(10, 2),  
    Tanggal_transaksi DATE  
); 
 -- Tabel Laporan Penjualan 
CREATE TABLE Laporan_Penjualan (  
    ID_laporan_penjualan INT PRIMARY KEY,  
    Tanggal_laporan DATE,  
    Total_penjualan DECIMAL(10, 2)  
); 
 -- Tabel Laporan Stok 
CREATE TABLE Laporan_Stok (  
    ID_laporan_stok INT PRIMARY KEY,  
    Tanggal_laporan DATE,  
    ID_barang INT,  
    Stok_terjual INT,  
    Stok_tersisa INT,  
    FOREIGN KEY (ID_barang) REFERENCES Barang(ID_barang)  
); 
 
 
 -- ======================= -- DATA AWAL (INSERT) -- ======================= 
 
INSERT INTO Pelanggan (ID_pelanggan, Nama_pelanggan, Alamat, 
No_telepon)  
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
 
INSERT INTO Barang (ID_barang, Nama_barang, Harga, Stok) VALUES 
(1, 'Indomie Goreng', 3000.00, 100), 
(2, 'Beras 5kg', 65000.00, 50), 
(3, 'Minyak Goreng 1L', 18000.00, 70), 
(4, 'Telur Ayam 1kg', 25000.00, 40), 
(5, 'Sabun Mandi', 7000.00, 80); 
INSERT INTO Transaksi (ID_transaksi, Jenis_transaksi, ID_pelanggan, 
ID_barang, Jumlah, Tanggal_transaksi) VALUES 
(1, 'Penjualan', 1, 1, 10, '2025-04-15'), 
(2, 'Penjualan', 2, 2, 1, '2025-04-15'), 
(3, 'Pembelian', 3, 3, 20, '2025-04-16'), 
(4, 'Pengembalian', 4, 1, 5, '2025-04-17'), 
(5, 'Koreksi_stok', 5, 4, 2, '2025-04-18'); 
INSERT INTO Keuangan (ID_keuangan, Jenis_keuangan, Jumlah, 
Tanggal_transaksi) VALUES 
(1, 'Penjualan', 30000.00, '2025-04-15'), 
(2, 'Penjualan', 65000.00, '2025-04-15'), 
(3, 'Pembelian', 360000.00, '2025-04-16'), 
(4, 'Penjualan', 75000.00, '2025-04-17'), 
(5, 'Penjualan', 14000.00, '2025-04-18'); 
INSERT INTO Laporan_Penjualan (ID_laporan_penjualan, Tanggal_laporan, 
Total_penjualan) VALUES 
(1, '2025-04-15', 95000.00), 
(2, '2025-04-16', 0.00), 
(3, '2025-04-17', 75000.00), 
(4, '2025-04-18', 14000.00), 
(5, '2025-04-19', 0.00); 
INSERT INTO Laporan_Stok (ID_laporan_stok, Tanggal_laporan, ID_barang, 
Stok_terjual, Stok_tersisa) VALUES 
(1, '2025-04-15', 1, 10, 90), 
(2, '2025-04-15', 2, 1, 49), 
(3, '2025-04-16', 3, 0, 90), 
(4, '2025-04-17', 1, -5, 95), 
(5, '2025-04-18', 4, 0, 38);  

SELECT * FROM Pelanggan; -- Menampilkan semua data dari tabel Pelanggan  
SELECT * FROM Barang; -- Menampilkan semua data dari tabel Barang 
SELECT * FROM Transaksi; -- Menampilkan semua data dari tabel Transaksi  
SELECT * FROM Keuangan; -- Menampilkan semua data dari tabel Keuangan 
SELECT * FROM Laporan_Penjualan;-- Menampilkan semua data dari tabel Laporan_Penjualan 

