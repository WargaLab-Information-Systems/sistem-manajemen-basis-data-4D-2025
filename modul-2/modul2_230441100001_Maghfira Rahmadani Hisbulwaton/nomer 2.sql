CREATE VIEW view_produk_supplier AS
SELECT 
    pk.Nama_Produk, 
    s.Nama_Supplier
FROM 
    Produk_Kertas pk
JOIN 
    Supplier s ON pk.ID_Supplier = s.ID_Supplier;
    
SELECT * FROM view_produk_supplier;

CREATE VIEW view_penjualan_detail AS
SELECT 
    p.ID_Penjualan,
    pel.Nama_Pelanggan,
    pk.Nama_Produk,
    dp.Jumlah
FROM 
    Penjualan p
JOIN 
    Pelanggan pel ON p.ID_Pelanggan = pel.ID_Pelanggan
JOIN 
    Detail_Penjualan dp ON p.ID_Penjualan = dp.ID_Penjualan
JOIN 
    Produk_Kertas pk ON dp.ID_Produk = pk.ID_Produk;
    
 SELECT * FROM view_penjualan_detail;
 
 CREATE VIEW view_produk_stok_rendah AS
SELECT 
    Nama_Produk, 
    Stok 
FROM 
    Produk_Kertas
WHERE 
    Stok < 100;
    
SELECT * FROM view_produk_stok_rendah;

CREATE VIEW view_total_penjualan_produk AS
SELECT 
    pk.Nama_Produk,
    SUM(dp.Jumlah) AS Total_Terjual
FROM 
    Detail_Penjualan dp
JOIN 
    Produk_Kertas pk ON dp.ID_Produk = pk.ID_Produk
GROUP BY 
    pk.Nama_Produk;
    
SELECT * FROM view_total_penjualan_produk;


CREATE VIEW view_total_pembelian_pelanggan AS
SELECT 
    pel.Nama_Pelanggan,
    COUNT(p.ID_Penjualan) AS Jumlah_Transaksi,
    SUM(p.Total_Harga) AS Total_Pembelian
FROM 
    Penjualan p
JOIN 
    Pelanggan pel ON p.ID_Pelanggan = pel.ID_Pelanggan
GROUP BY 
    pel.Nama_Pelanggan
ORDER BY 
    Total_Pembelian DESC;
SELECT * FROM view_total_pembelian_pelanggan;


-- total semua penjualan --
CREATE VIEW view_total_semua_penjualan AS
SELECT 
    SUM(Total_Harga) AS Total_Semua_Penjualan
FROM 
    Penjualan;
    
    SELECT * FROM view_total_semua_penjualan;
    
  -- Menghitung rata-rata jumlah produk per transaksi dari tabel Detail_Penjualan ---
  
 CREATE VIEW view_rata_rata_produk_per_transaksi AS
SELECT 
    AVG(Jumlah) AS Rata_Rata_Produk_Terjual
FROM 
    Detail_Penjualan;
    
SELECT * FROM view_rata_rata_produk_per_transaksi;


-- Menghitung jumlah produk unik dan total stok dari Produk_Kertas --

CREATE VIEW view_jumlah_produk_stok AS
SELECT 
    COUNT(*) AS Jumlah_Produk,
    SUM(Stok) AS Total_Stok
FROM 
    Produk_Kertas;
    
SELECT * FROM view_jumlah_produk_stok;


-- Menampilkan harga penjualan minimum dan maksimum dari tabel Penjualan --
CREATE VIEW view_harga_penjualan_min_max AS
SELECT 
    MIN(Total_Harga) AS Harga_Terendah,
    MAX(Total_Harga) AS Harga_Tertinggi
FROM 
    Penjualan;
    
 SELECT * FROM view_harga_penjualan_min_max;
 
-- Menampilkan jumlah pelanggan yang pernah melakukan transaksi--
CREATE VIEW view_jumlah_pelanggan_aktif AS
SELECT 
    COUNT(DISTINCT ID_Pelanggan) AS Jumlah_Pelanggan_Aktif
FROM 
    Penjualan;
    
  SELECT * FROM  view_jumlah_pelanggan_aktif;