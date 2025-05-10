CREATE VIEW ViewTransaksiTerbaru AS SELECT 
p.id_pelanggan,
p.nama_pelanggan,
t.tanggal_transaksi AS tanggal_transaksi_terakhir,
t.total_transaksi
FROM pelanggan p JOIN transaksi t ON p.id_pelanggan = t.id_pelanggan WHERE (p.id_pelanggan, t.tanggal_transaksi) IN (SELECT id_pelanggan, MAX(tanggal_transaksi) FROM transaksi GROUP BY id_pelanggan);
SELECT * FROM ViewTransaksiTerbaru

CREATE VIEW ViewProdukTidakLakuu AS SELECT 
id_produk,
nama_produk,
stok
FROM produk WHERE id_produk NOT IN (SELECT id_produk FROM transaksi_detail);
SELECT * FROM ViewProdukTidakLakuu
