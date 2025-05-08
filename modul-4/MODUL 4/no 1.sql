-- no 1 --
ALTER TABLE Produk_Kertas ADD Keterangan VARCHAR(255);

-- no 2 --
SELECT 
    Penjualan.ID_Penjualan,
    Penjualan.Tanggal_Penjualan,
    Pelanggan.Nama_Pelanggan,
    Penjualan.Total_Harga
FROM Penjualan
JOIN Pelanggan ON Penjualan.ID_Pelanggan = Pelanggan.ID_Pelanggan;

-- no 3 --
SELECT * FROM Produk_Kertas ORDER BY Harga ASC;
SELECT * FROM Pelanggan ORDER BY Nama_Pelanggan DESC;
SELECT * FROM Penjualan ORDER BY Tanggal_Penjualan;

-- no 4 --
ALTER TABLE Pelanggan MODIFY No_Telepon VARCHAR(30);

-- no 5 --
-- LEFT JOIN: Menampilkan semua data penjualan beserta detail produk (jika ada) --
SELECT 
    p.ID_Penjualan,
    p.Tanggal_Penjualan,
    pl.Nama_Pelanggan,
    dp.ID_Produk,
    pk.Nama_Produk,
    dp.Jumlah
FROM Penjualan p
LEFT JOIN Detail_Penjualan dp ON p.ID_Penjualan = dp.ID_Penjualan
LEFT JOIN Produk_Kertas pk ON dp.ID_Produk = pk.ID_Produk
LEFT JOIN Pelanggan pl ON p.ID_Pelanggan = pl.ID_Pelanggan;

-- RIGHT JOIN: Menampilkan semua produk kertas dan informasi penjualannya (jika ada) --
SELECT 
    pk.ID_Produk,
    pk.Nama_Produk,
    dp.ID_Penjualan,
    dp.Jumlah
FROM Detail_Penjualan dp
RIGHT JOIN Produk_Kertas pk ON dp.ID_Produk = pk.ID_Produk;

-- SELF JOIN: Menampilkan daftar pelanggan yang tinggal di jalan yang sama --
SELECT 
    p1.ID_Pelanggan AS ID_Pelanggan_1,
    p1.Nama_Pelanggan AS Nama_Pelanggan_1,
    p2.ID_Pelanggan AS ID_Pelanggan_2,
    p2.Nama_Pelanggan AS Nama_Pelanggan_2,
    p1.Alamat
FROM Pelanggan p1
JOIN Pelanggan p2 
    ON p1.Alamat = p2.Alamat AND p1.ID_Pelanggan < p2.ID_Pelanggan;

-- no 6 --
-- Produk dengan harga lebih dari 10.000
SELECT * FROM Produk_Kertas WHERE Harga > 10000;

-- Produk dengan stok kurang dari 100
SELECT * FROM Produk_Kertas WHERE Stok < 100;

-- Penjualan dengan total harga sama dengan 25000
SELECT * FROM Penjualan WHERE Total_Harga = 25000;

-- Produk dengan harga kurang dari atau sama dengan 7000
SELECT * FROM Produk_Kertas WHERE Harga <= 7000;

-- Produk dengan harga lebih dari atau sama dengan 15000
SELECT * FROM Produk_Kertas WHERE Harga >= 15000;