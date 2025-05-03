CREATE DATABASE umkm_jawa_barat;
USE umkm_jawa_barat;

CREATE TABLE pemilik_umkm (
    id_pemilik INT(11) PRIMARY KEY AUTO_INCREMENT,
    nik VARCHAR(16) NOT NULL,
    nama_lengkap VARCHAR(200) NOT NULL,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
    alamat TEXT,
    nomor_telepon VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE kategori_umkm (
    id_kategori INT(11) PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(100) NOT NULL,
    deskripsi TEXT
);

CREATE TABLE skala_umkm (
    id_skala INT(11) PRIMARY KEY AUTO_INCREMENT,
    nama_skala VARCHAR(50) NOT NULL,
    batas_aset_bawah DECIMAL(15,2),
    batas_aset_atas DECIMAL(15,2),
    batas_omzet_bawah DECIMAL(15,2),
    batas_omzet_atas DECIMAL(15,2)
);

CREATE TABLE kabupaten_kota (
    id_kabupaten_kota INT(11) PRIMARY KEY AUTO_INCREMENT,
    nama_kabupaten_kota VARCHAR(100) NOT NULL
);

CREATE TABLE umkm (
    id_umkm INT(11) PRIMARY KEY AUTO_INCREMENT,
    nama_usaha VARCHAR(200) NOT NULL,
    id_pemilik INT(11),
    id_kategori INT(11),
    id_skala INT(11),
    id_kabupaten_kota INT(11),
    alamat_usaha TEXT,
    nib VARCHAR(50),
    npwp VARCHAR(20),
    tahun_berdiri YEAR,
    jumlah_karyawan INT(11),
    total_aset DECIMAL(15,2),
    omzet_per_tahun DECIMAL(15,2),
    deskripsi_usaha TEXT,
    tanggal_registrasi DATE,
    FOREIGN KEY (id_pemilik) REFERENCES pemilik_umkm(id_pemilik),
    FOREIGN KEY (id_kategori) REFERENCES kategori_umkm(id_kategori),
    FOREIGN KEY (id_skala) REFERENCES skala_umkm(id_skala),
    FOREIGN KEY (id_kabupaten_kota) REFERENCES kabupaten_kota(id_kabupaten_kota)
);

CREATE TABLE produk_umkm (
    id_produk INT(11) PRIMARY KEY AUTO_INCREMENT,
    id_umkm INT(11),
    nama_produk VARCHAR(200) NOT NULL,
    deskripsi_produk TEXT,
    harga DECIMAL(15,2),
    FOREIGN KEY (id_umkm) REFERENCES umkm(id_umkm)
);

SELECT * FROM pemilik_umkm;
SELECT * FROM kategori_umkm;
SELECT * FROM skala_umkm;
SELECT * FROM kabupaten_kota;
SELECT * FROM umkm;
SELECT * FROM produk_umkm;


CREATE VIEW view_umkm_detail AS
SELECT 
    u.nama_usaha,
    p.nama_lengkap AS nama_pemilik,
    k.nama_kategori,
    s.nama_skala,
    kk.nama_kabupaten_kota,
    u.tahun_berdiri
FROM umkm u
JOIN pemilik_umkm p ON u.id_pemilik = p.id_pemilik
JOIN kategori_umkm k ON u.id_kategori = k.id_kategori
JOIN skala_umkm s ON u.id_skala = s.id_skala
JOIN kabupaten_kota kk ON u.id_kabupaten_kota = kk.id_kabupaten_kota;

CREATE VIEW view_pemilik_dan_usaha AS
SELECT 
    p.nik,
    p.nama_lengkap,
    p.jenis_kelamin,
    p.nomor_telepon,
    p.email,
    u.nama_usaha
FROM pemilik_umkm p
LEFT JOIN umkm u ON p.id_pemilik = u.id_pemilik;

CREATE VIEW view_produk_umkm AS
SELECT 
    u.nama_usaha,
    p.nama_produk,
    p.deskripsi_produk,
    p.harga
FROM produk_umkm p
JOIN umkm u ON p.id_umkm = u.id_umkm;

CREATE VIEW view_umkm_menengah AS
SELECT 
    u.nama_usaha,
    p.nama_lengkap AS nama_pemilik,
    u.total_aset,
    u.omzet_per_tahun
FROM umkm u
JOIN pemilik_umkm p ON u.id_pemilik = p.id_pemilik
JOIN skala_umkm s ON u.id_skala = s.id_skala
WHERE s.nama_skala = 'Menengah';

CREATE VIEW view_umkm_per_kota AS
SELECT 
    kk.nama_kabupaten_kota,
    COUNT(u.id_umkm) AS jumlah_umkm
FROM kabupaten_kota kk
LEFT JOIN umkm u ON kk.id_kabupaten_kota = u.id_kabupaten_kota
GROUP BY kk.nama_kabupaten_kota;

SELECT * FROM view_umkm_detail;
SELECT * FROM view_pemilik_dan_usaha;
SELECT * FROM view_produk_umkm;
SELECT * FROM view_umkm_menengah;
SELECT * FROM view_umkm_per_kota;
