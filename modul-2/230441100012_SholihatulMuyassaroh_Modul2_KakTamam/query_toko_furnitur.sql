CREATE DATABASE toko_furnitur;
USE toko_furnitur;

CREATE TABLE kategori (
id_kategori VARCHAR (10) PRIMARY KEY,
nama_kategori VARCHAR (50) NOT NULL
);

INSERT INTO kategori VALUES
('k01','meja'),
('k02','lemari'),
('k03','kursi'),
('k04','rak dinding'),
('k05','tempat tidur'),
('k06','aksesoris dekorasi');

CREATE TABLE produk (
id_produk VARCHAR (10) PRIMARY KEY,
nama_produk VARCHAR (100) NOT NULL,
id_kategori VARCHAR (10),
harga INT (30) NOT NULL,
stok INT (10) NOT NULL,
FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori) ON DELETE CASCADE
);

INSERT INTO produk VALUES
('p01','meja belajar kayu','k01',750000,15),
('p02','meja makan minimalis','k01',1200000,10),
('p03','lemari 2 pintu','k02',1500000,5),
('p04','lemari sliding modern','k02',2500000,3),
('p05','kursi kantor ergonomis','k03',950000,12),
('p06','kursi tamu klasik','k03',1350000,6),
('p07','rak buku serbaguna','k04',600000,8),
('p08','rak sepatu minimalis','k04',500000,9),
('p09','tempat tidur queen size','k05',2700000,4),
('p10','tempat tidur anak','k05',1900000,5),
('p11','jam dinding kayu','k06',350000,20),
('p12','lukisan abstrak','k06',450000,15),
('p13','meja rias modern','k01',980000,7),
('p14','lemari kaca','k02',1700000,6),
('p15','kursi kafe kayu','k03',650000,18),
('p16','rak dinding gantung','k04',550000,10),
('p17','tempat tidur king size','k05',3100000,2),
('p18','cermin dinding bulat','k06',275000,11);

CREATE TABLE pelanggan (
id_pelanggan VARCHAR (10) PRIMARY KEY,
nama_pelanggan VARCHAR (100) NOT NULL,
no_hp VARCHAR (20) NOT NULL,
alamat VARCHAR (150) NOT NULL
);

INSERT INTO pelanggan VALUES 
('c01','dian amanda','082222334455','bangkalan'),
('c02','rina amelia','081298765432','surabaya'),
('c03','eko prasetyo','082123456789','sidoarjo'),
('c04','wulan anggraini','085712398765','gresik'),
('c05','rudi hartono','081987654321','lamongan'),
('c06','linda putri','088212345678','mojokerto'),
('c07','agus santono','087821238765','jombang'),
('c08','dewi sartika','082135791357','kediri'),
('c09','bambang irawan','085678123456','tuban'),
('c10','eka putri maharani','081234567890','bojonegoro');

CREATE TABLE karyawan (
id_karyawan VARCHAR (10) PRIMARY KEY,
nama_karyawan VARCHAR (100) NOT NULL,
jabatan VARCHAR (50) NOT NULL,
no_hp VARCHAR (20) NOT NULL
);

INSERT INTO karyawan VALUES 
('ky01','andi kurniawan','kasir','081345678901'),
('ky02','sinta nurhaliza','kasir','082199887766'),
('ky03','safi','sales','083344556677'),
('ky04','reza mahendra','manajer','084455667788'),
('ky05','intan prameswari','admin','086677889900');

CREATE TABLE transaksi (
id_transaksi VARCHAR (10) PRIMARY KEY,
id_pelanggan VARCHAR (10),
id_karyawan VARCHAR (10),
tanggal_transaksi DATE NOT NULL,
total INT (50) NOT NULL,
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan) ON DELETE CASCADE,
FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan) ON DELETE CASCADE
);

INSERT INTO transaksi VALUES
('t01','c01','ky01','2025-01-01',1730000),
('t02','c02','ky01','2025-01-20',2600000),
('t03','c04','ky02','2025-02-10',2500000),
('t04','c05','ky01','2025-02-25',2800000),
('t05','c06','ky02','2025-03-03',3800000),
('t06','c08','ky01','2025-03-19',1700000),
('t07','c09','ky02','2025-03-24',4800000),
('t08','c10','ky02','2025-04-01',1900000);

CREATE TABLE detail_transaksi (
id_detail INT (10) AUTO_INCREMENT PRIMARY KEY,
id_transaksi VARCHAR (10),
id_produk VARCHAR (10),
jumlah INT (10) NOT NULL,
subtotal INT (50) NOT NULL,
FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi) ON DELETE CASCADE,
FOREIGN KEY (id_produk) REFERENCES produk(id_produk) ON DELETE CASCADE
);

INSERT INTO detail_transaksi (id_transaksi,id_produk,jumlah,subtotal) VALUES
('t01','p01',1,750000),
('t01','p13',1,980000),
('t02','p05',2,1900000),
('t02','p11',2,700000),
('t03','p04',1,2500000),
('t04','p10',1,1900000),
('t04','p12',2,900000),
('t05','p02',1,1200000),
('t05','p15',4,2600000),
('t06','p07',1,600000),
('t06','p16',2,1100000),
('t07','p17',1,3100000),
('t07','p14',1,1700000),
('t08','p18',2,550000),
('t08','p06',1,1350000);

-- Menampilkan nama produk, kategori, dan harga produk.
CREATE VIEW view_produk_dan_kategori AS
SELECT p.nama_produk AS 'Nama Produk', k.nama_kategori AS 'Kategori', p.harga AS 'Harga'
FROM produk p
JOIN kategori k ON p.id_kategori = k.id_kategori;
SELECT * FROM view_produk_dan_kategori;

-- Menampilkan tanggal transaksi, nama pelanggan, nama karyawan yang melayani, dan total pembelian.
CREATE VIEW view_transaksi_lengkap AS
SELECT t.tanggal_transaksi AS 'Tannggal Transaksi', p.nama_pelanggan AS 'Nama Pelanggan', k.nama_karyawan AS 'Karyawan yang Melayani', t.total AS 'Total Pembelian'
FROM transaksi t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN karyawan k ON t.id_karyawan = k.id_karyawan;
SELECT * FROM view_transaksi_lengkap;

-- Menampilkan produk dengan stok di bawah 10, lengkap dengan kategori dan jumlah stoknya.
CREATE VIEW view_produk_stok_rendah AS
SELECT p.nama_produk AS 'Nama Produk', k.nama_kategori AS 'Kategori', p.stok AS 'Stok'
FROM produk p
JOIN kategori k ON p.id_kategori = k.id_kategori
WHERE p.stok < 10;
SELECT * FROM view_produk_stok_rendah;

-- Menampilkan total penjualan per kategori produk.
CREATE VIEW view_sum_penjualan_kategori AS
SELECT k.nama_kategori AS 'Nama Kategori',
SUM(d.subtotal) AS 'Total Penjualan'
FROM detail_transaksi d
JOIN produk p ON d.id_produk = p.id_produk
JOIN kategori k ON p.id_kategori = k.id_kategori
GROUP BY k.nama_kategori;
SELECT * FROM view_sum_penjualan_kategori;

-- Menampilkan jumlah transaksi yang dilakukan oleh tiap pelanggan.
CREATE VIEW view_count_transaksi_pelanggan AS
SELECT p.nama_pelanggan AS 'Nama Pelanggan',
COUNT(t.id_transaksi) AS 'Jumlah Transaksi'
FROM transaksi t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
GROUP BY p.nama_pelanggan;
SELECT * FROM view_count_transaksi_pelanggan;

-- Menampilkan rata-rata pengeluaran tiap pelanggan.
CREATE VIEW view_avg_pengeluaran_pelanggan AS
SELECT p.nama_pelanggan AS 'Nama Pelanggan',
AVG(t.total) AS 'Rata-Rata Pengeluaran'
FROM transaksi t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
GROUP BY p.nama_pelanggan;
SELECT * FROM view_avg_pengeluaran_pelanggan;

-- Menampilkan harga produk terendah untuk setiap kategori.
CREATE VIEW view_min_harga_produk_per_kategori AS
SELECT k.nama_kategori AS 'Kategori', 
MIN(p.harga) AS 'Harga Produk Terendah'
FROM produk p
JOIN kategori k ON p.id_kategori = k.id_kategori
GROUP BY k.nama_kategori;
SELECT * FROM view_min_harga_produk_per_kategori;

-- Menampilkan produk yang stoknya kurang dari 5.
CREATE VIEW view_produk_stok_hampir_habis AS
SELECT p.nama_produk AS 'Nama Produk', p.stok AS 'Stok Tersisa'
FROM produk p
WHERE p.stok < 5;
SELECT * FROM view_produk_stok_hampir_habis;