-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Apr 2025 pada 17.01
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bakery_store`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_transaksi_bakery`
--

CREATE TABLE `tb_detail_transaksi_bakery` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_karyawan_bakery`
--

CREATE TABLE `tb_karyawan_bakery` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(100) NOT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan_bakery`
--

CREATE TABLE `tb_pelanggan_bakery` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk_bakery`
--

CREATE TABLE `tb_produk_bakery` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi_bakery`
--

CREATE TABLE `tb_transaksi_bakery` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `status_pembayaran` enum('Pending','Lunas') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_detail_transaksi_bakery`
--
ALTER TABLE `tb_detail_transaksi_bakery`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `tb_karyawan_bakery`
--
ALTER TABLE `tb_karyawan_bakery`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `tb_pelanggan_bakery`
--
ALTER TABLE `tb_pelanggan_bakery`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `tb_produk_bakery`
--
ALTER TABLE `tb_produk_bakery`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `tb_transaksi_bakery`
--
ALTER TABLE `tb_transaksi_bakery`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_detail_transaksi_bakery`
--
ALTER TABLE `tb_detail_transaksi_bakery`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_karyawan_bakery`
--
ALTER TABLE `tb_karyawan_bakery`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan_bakery`
--
ALTER TABLE `tb_pelanggan_bakery`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_produk_bakery`
--
ALTER TABLE `tb_produk_bakery`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi_bakery`
--
ALTER TABLE `tb_transaksi_bakery`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_detail_transaksi_bakery`
--
ALTER TABLE `tb_detail_transaksi_bakery`
  ADD CONSTRAINT `tb_detail_transaksi_bakery_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi_bakery` (`id_transaksi`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_detail_transaksi_bakery_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk_bakery` (`id_produk`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_transaksi_bakery`
--
ALTER TABLE `tb_transaksi_bakery`
  ADD CONSTRAINT `tb_transaksi_bakery_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan_bakery` (`id_pelanggan`) ON DELETE SET NULL,
  ADD CONSTRAINT `tb_transaksi_bakery_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan_bakery` (`id_karyawan`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
