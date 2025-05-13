CREATE VIEW view_transaksi_pelanggan AS
SELECT 
    t.id_transaksi,
    p.nama AS nama_pelanggan,
    t.tanggal_transaksi,
    t.total_harga,
    t.status
FROM Transaksi t
INNER JOIN Pelanggan p ON t.id_pelanggan = p.id_pelanggan;


CREATE VIEW view_detail_lengkap AS
SELECT 
    t.id_transaksi,
    t.tanggal_transaksi,
    l.nama_layanan,
    d.jumlah,
    d.subtotal
FROM Transaksi t
JOIN Detail_Transaksi d ON t.id_transaksi = d.id_transaksi
JOIN Layanan l ON d.id_layanan = l.id_layanan;


CREATE VIEW view_transaksi_selesai AS
SELECT 
    t.id_transaksi,
    p.nama AS nama_pelanggan,
    t.total_harga,
    t.status
FROM Transaksi t
JOIN Pelanggan p ON t.id_pelanggan = p.id_pelanggan
WHERE t.status = 'Selesai';


CREATE VIEW view_total_pendapatan AS
SELECT 
    SUM(t.total_harga) AS total_pendapatan
FROM Transaksi t;

CREATE VIEW view_rata_rata_transaksi_per_pelanggan AS
SELECT 
    p.nama AS nama_pelanggan,
    AVG(t.total_harga) AS rata_rata_transaksi
FROM Transaksi t
JOIN Pelanggan p ON t.id_pelanggan = p.id_pelanggan
GROUP BY p.nama;


CREATE VIEW view_jumlah_transaksi_per_karyawan AS
SELECT 
    k.nama AS nama_karyawan,
    COUNT(t.id_transaksi) AS jumlah_transaksi
FROM Transaksi t
JOIN Karyawan k ON t.id_karyawan = k.id_karyawan
GROUP BY k.nama;


CREATE VIEW view_harga_layanan_termurah AS
SELECT 
    MIN(l.harga) AS harga_termurah
FROM Layanan l;


CREATE VIEW view_harga_layanan_termahal AS
SELECT 
    MAX(l.harga) AS harga_termahal
FROM Layanan l;


CREATE VIEW view_transaksi_lengkap AS
SELECT 
    t.id_transaksi,
    p.nama AS nama_pelanggan,
    k.nama AS nama_karyawan,
    t.tanggal_transaksi,
    t.total_harga,
    t.status
FROM Transaksi t
JOIN Pelanggan p ON t.id_pelanggan = p.id_pelanggan
LEFT JOIN Karyawan k ON t.id_karyawan = k.id_karyawan;
