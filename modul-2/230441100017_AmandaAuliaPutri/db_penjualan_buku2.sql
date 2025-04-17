-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Apr 2025 pada 11.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan_buku2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_pemasok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul_buku`, `penulis`, `harga`, `stok`, `id_pemasok`) VALUES
(1, 'Laskar Pelangi', 'Andrea Hirata', 85000.00, 20, 1),
(2, 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 79000.00, 15, 2),
(3, 'Dilan: Dia adalah Dilanku 1990', 'Pidi Baiq', 78000.00, 25, 1),
(4, 'Perahu Kertas', 'Dewi Lestari', 88000.00, 18, 3),
(5, 'Negeri 5 Menara', 'Ahmad Fuadi', 86000.00, 12, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_transaksi`
--

CREATE TABLE `tb_detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_detail_transaksi`
--

INSERT INTO `tb_detail_transaksi` (`id_detail`, `id_transaksi`, `id_buku`, `jumlah`, `subtotal`) VALUES
(1, 1, 1, 1, 75000.00),
(2, 1, 2, 1, 95000.00),
(3, 2, 3, 1, 85000.00),
(4, 2, 5, 2, 65000.00),
(5, 3, 4, 2, 55000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kasir`
--

CREATE TABLE `tb_kasir` (
  `id_kasir` int(11) NOT NULL,
  `nama_kasir` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kasir`
--

INSERT INTO `tb_kasir` (`id_kasir`, `nama_kasir`, `username`, `password`) VALUES
(1, 'Kasir A', 'kasir_a', 'password123'),
(2, 'Kasir B', 'kasir_b', 'password456'),
(3, 'Kasir C', 'kasir_c', 'pass789'),
(4, 'Kasir D', 'kasir_d', 'admin123'),
(5, 'Kasir E', 'kasir_e', 'secure456');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `no_telp`) VALUES
(1, 'Sinta Rahma', 'Malang', '081234567890'),
(2, 'Jefri Nichol', 'Bandung', '082345678901'),
(3, 'Amanda Aulia', 'Lamongan', '083456789012'),
(4, 'Joko Santoso', 'Jakarta', '084567890123'),
(5, 'Tiara Lestari', 'Semarang', '085678901234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemasok`
--

CREATE TABLE `tb_pemasok` (
  `id_pemasok` int(11) NOT NULL,
  `nama_pemasok` varchar(100) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pemasok`
--

INSERT INTO `tb_pemasok` (`id_pemasok`, `nama_pemasok`, `alamat`, `no_telp`) VALUES
(1, 'PT Gramedia', 'Jl. Merdeka No.1, Jakarta', '0211234567'),
(2, 'Penerbit Andi', 'Jl. Malioboro No.5, Yogyakarta', '0274567890'),
(3, 'Erlangga Distributor', 'Jl. Diponegoro No.8, Bandung', '0229876543'),
(4, 'Mizan Group', 'Jl. Pustaka No.10, Jakarta', '0217654321'),
(5, 'Pustaka Abadi', 'Jl. Kalimas No.3, Surabaya', '03199998888');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `total_harga` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `tanggal`, `id_pelanggan`, `id_kasir`, `total_harga`) VALUES
(1, '2025-04-01', 1, 1, 170000.00),
(2, '2025-04-02', 2, 2, 153000.00),
(3, '2025-04-03', 3, 3, 67000.00),
(4, '2025-04-04', 4, 4, 105000.00),
(5, '2025-04-05', 5, 5, 131000.00);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_buku_pemasok`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_buku_pemasok` (
`judul_buku` varchar(100)
,`penulis` varchar(100)
,`harga` decimal(10,2)
,`stok` int(11)
,`nama_pemasok` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_buku_stok_rendah`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_buku_stok_rendah` (
`judul_buku` varchar(100)
,`penulis` varchar(100)
,`stok` int(11)
,`nama_pemasok` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_detail_penjualan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_detail_penjualan` (
`id_transaksi` int(11)
,`tanggal` date
,`nama_pelanggan` varchar(100)
,`nama_kasir` varchar(100)
,`judul_buku` varchar(100)
,`penulis` varchar(100)
,`jumlah` int(11)
,`subtotal` decimal(12,2)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_sum_penjualan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_sum_penjualan` (
`judul_buku` varchar(100)
,`total_buku_terjual` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_transaksi_lengkap`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_transaksi_lengkap` (
`id_transaksi` int(11)
,`tanggal` date
,`nama_pelanggan` varchar(100)
,`nama_kasir` varchar(100)
,`total_harga` decimal(12,2)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_buku_pemasok`
--
DROP TABLE IF EXISTS `view_buku_pemasok`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_buku_pemasok`  AS SELECT `b`.`judul_buku` AS `judul_buku`, `b`.`penulis` AS `penulis`, `b`.`harga` AS `harga`, `b`.`stok` AS `stok`, `p`.`nama_pemasok` AS `nama_pemasok` FROM (`tb_buku` `b` join `tb_pemasok` `p` on(`b`.`id_pemasok` = `p`.`id_pemasok`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_buku_stok_rendah`
--
DROP TABLE IF EXISTS `view_buku_stok_rendah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_buku_stok_rendah`  AS SELECT `b`.`judul_buku` AS `judul_buku`, `b`.`penulis` AS `penulis`, `b`.`stok` AS `stok`, `p`.`nama_pemasok` AS `nama_pemasok` FROM (`tb_buku` `b` join `tb_pemasok` `p` on(`b`.`id_pemasok` = `p`.`id_pemasok`)) WHERE `b`.`stok` < 20 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_detail_penjualan`
--
DROP TABLE IF EXISTS `view_detail_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_penjualan`  AS SELECT `t`.`id_transaksi` AS `id_transaksi`, `t`.`tanggal` AS `tanggal`, `p`.`nama_pelanggan` AS `nama_pelanggan`, `k`.`nama_kasir` AS `nama_kasir`, `b`.`judul_buku` AS `judul_buku`, `b`.`penulis` AS `penulis`, `d`.`jumlah` AS `jumlah`, `d`.`subtotal` AS `subtotal` FROM ((((`tb_transaksi` `t` join `tb_pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) join `tb_kasir` `k` on(`t`.`id_kasir` = `k`.`id_kasir`)) join `tb_detail_transaksi` `d` on(`t`.`id_transaksi` = `d`.`id_transaksi`)) join `tb_buku` `b` on(`d`.`id_buku` = `b`.`id_buku`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_sum_penjualan`
--
DROP TABLE IF EXISTS `view_sum_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sum_penjualan`  AS SELECT `b`.`judul_buku` AS `judul_buku`, sum(`d`.`jumlah`) AS `total_buku_terjual` FROM (`tb_buku` `b` join `tb_detail_transaksi` `d` on(`b`.`id_buku` = `d`.`id_buku`)) GROUP BY `b`.`judul_buku` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_transaksi_lengkap`
--
DROP TABLE IF EXISTS `view_transaksi_lengkap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_transaksi_lengkap`  AS SELECT `t`.`id_transaksi` AS `id_transaksi`, `t`.`tanggal` AS `tanggal`, `p`.`nama_pelanggan` AS `nama_pelanggan`, `k`.`nama_kasir` AS `nama_kasir`, `t`.`total_harga` AS `total_harga` FROM ((`tb_transaksi` `t` join `tb_pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) join `tb_kasir` `k` on(`t`.`id_kasir` = `k`.`id_kasir`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_pemasok` (`id_pemasok`);

--
-- Indeks untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `tb_kasir`
--
ALTER TABLE `tb_kasir`
  ADD PRIMARY KEY (`id_kasir`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  ADD PRIMARY KEY (`id_pemasok`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_kasir`
--
ALTER TABLE `tb_kasir`
  MODIFY `id_kasir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  MODIFY `id_pemasok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD CONSTRAINT `tb_buku_ibfk_1` FOREIGN KEY (`id_pemasok`) REFERENCES `tb_pemasok` (`id_pemasok`);

--
-- Ketidakleluasaan untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi` (`id_transaksi`),
  ADD CONSTRAINT `tb_detail_transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`);

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `tb_kasir` (`id_kasir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
