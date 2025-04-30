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
    FOREIGN KEY (id_pelanggan) REFERENCES data_pelanggan(id_pelanggan)
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

SHOW TABLES;