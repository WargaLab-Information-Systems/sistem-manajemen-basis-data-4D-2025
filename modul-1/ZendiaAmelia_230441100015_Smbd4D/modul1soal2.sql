CREATE DATABASE db_bakery_store;
USE db_bakery_store;

CREATE TABLE tb_pelanggan_bakery (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama_pelanggan VARCHAR(100) NOT NULL,
    no_hp VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    alamat TEXT
);

CREATE TABLE tb_produk_bakery (
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(100) NOT NULL,
    kategori VARCHAR(50),
    harga DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL
);

CREATE TABLE tb_karyawan_bakery (
    id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
    nama_karyawan VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50),
    no_hp VARCHAR(20),
    gaji DECIMAL(10,2)
);

CREATE TABLE tb_transaksi_bakery (
    id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT,
    id_karyawan INT,
    tanggal_transaksi DATETIME NOT NULL,
    total_harga DECIMAL(10,2),
    status_pembayaran ENUM('Pending', 'Lunas') NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (id_pelanggan) REFERENCES tb_pelanggan_bakery(id_pelanggan) ON DELETE SET NULL,
    FOREIGN KEY (id_karyawan) REFERENCES tb_karyawan_bakery(id_karyawan) ON DELETE SET NULL
    
);

CREATE TABLE tb_detail_transaksi_bakery (
    id_detail INT PRIMARY KEY AUTO_INCREMENT,
    id_transaksi INT,
    id_produk INT,
    jumlah INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES tb_transaksi_bakery(id_transaksi) ON DELETE CASCADE,
    FOREIGN KEY (id_produk) REFERENCES tb_produk_bakery(id_produk) ON DELETE CASCADE
);

SHOW TABLES;