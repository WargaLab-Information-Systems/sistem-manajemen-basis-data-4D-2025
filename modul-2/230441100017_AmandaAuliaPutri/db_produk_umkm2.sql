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
-- Database: `db_produk_umkm2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kabupaten_kota`
--

CREATE TABLE `kabupaten_kota` (
  `id_kabupaten_kota` int(11) NOT NULL,
  `nama_kabupaten_kota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kabupaten_kota`
--

INSERT INTO `kabupaten_kota` (`id_kabupaten_kota`, `nama_kabupaten_kota`) VALUES
(1, 'Kota Bandung'),
(2, 'Kota Bekasi'),
(3, 'Kota Bogor'),
(4, 'Kota Cimahi'),
(5, 'Kota Cirebon'),
(6, 'Kota Depok'),
(7, 'Kota Sukabumi'),
(8, 'Kota Tasikmalaya'),
(9, 'Kota Banjar'),
(10, 'Kabupaten Bandung'),
(11, 'Kabupaten Bandung Barat'),
(12, 'Kabupaten Bekasi'),
(13, 'Kabupaten Bogor'),
(14, 'Kabupaten Ciamis'),
(15, 'Kabupaten Cianjur'),
(16, 'Kabupaten Cirebon'),
(17, 'Kabupaten Garut'),
(18, 'Kabupaten Indramayu'),
(19, 'Kabupaten Karawang'),
(20, 'Kabupaten Kuningan'),
(21, 'Kabupaten Majalengka'),
(22, 'Kabupaten Pangandaran'),
(23, 'Kabupaten Purwakarta'),
(24, 'Kabupaten Subang'),
(25, 'Kabupaten Sukabumi'),
(26, 'Kabupaten Sumedang'),
(27, 'Kabupaten Tasikmalaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_umkm`
--

CREATE TABLE `kategori_umkm` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_umkm`
--

INSERT INTO `kategori_umkm` (`id_kategori`, `nama_kategori`, `deskripsi`) VALUES
(1, 'Kuliner', 'Usaha yang bergerak di bidang makanan dan minuman'),
(2, 'Fesyen', 'Usaha yang bergerak di bidang pakaian, aksesoris, dan produk fashion lainnya'),
(3, 'Kerajinan', 'Usaha yang bergerak di bidang pembuatan produk kerajinan tangan'),
(4, 'Pertanian', 'Usaha yang bergerak di bidang pertanian, perkebunan, dan pengolahan hasil pertanian'),
(5, 'Peternakan', 'Usaha yang bergerak di bidang peternakan dan pengolahan hasil peternakan'),
(6, 'Perikanan', 'Usaha yang bergerak di bidang perikanan dan pengolahan hasil perikanan'),
(7, 'Jasa', 'Usaha yang bergerak di bidang pelayanan jasa'),
(8, 'Perdagangan', 'Usaha yang bergerak di bidang perdagangan barang'),
(9, 'Manufaktur', 'Usaha yang bergerak di bidang pembuatan produk'),
(10, 'Teknologi', 'Usaha yang bergerak di bidang teknologi informasi'),
(11, 'Pariwisata', 'Usaha yang bergerak di bidang pariwisata dan hospitality'),
(12, 'Ekonomi Kreatif', 'Usaha yang bergerak di bidang ekonomi kreatif seperti desain, seni, dll');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik_umkm`
--

CREATE TABLE `pemilik_umkm` (
  `id_pemilik` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `alamat` text DEFAULT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pemilik_umkm`
--

INSERT INTO `pemilik_umkm` (`id_pemilik`, `nik`, `nama_lengkap`, `jenis_kelamin`, `alamat`, `nomor_telepon`, `email`) VALUES
(1, '3273012505780001', 'Ahmad Sudrajat', 'Laki-Laki', 'Jl. Pahlawan No. 123, Bandung', '081234567890', 'ahmad.sudrajat@gmail.com'),
(2, '3217016004850002', 'Siti Rahayu', 'Perempuan', 'Jl. Merdeka No. 45, Bekasi', '085678901234', 'siti.rahayu@gmail.com'),
(3, '3273025601900003', 'Budi Santoso', 'Laki-Laki', 'Jl. Sukajadi No. 78, Bandung', '081345678901', 'budi.santoso@gmail.com'),
(4, '3271046502870004', 'Dewi Lestari', 'Perempuan', 'Jl. Veteran No. 56, Bogor', '087890123456', 'dewi.lestari@gmail.com'),
(5, '3275021203830005', 'Joko Widodo', 'Laki-Laki', 'Jl. Cendana No. 34, Bekasi', '089012345678', 'joko.widodo@gmail.com'),
(6, '3277054408920006', 'Rina Anggraini', 'Perempuan', 'Jl. Kemuning No. 67, Cimahi', '082345678901', 'rina.anggraini@gmail.com'),
(7, '3210015509870007', 'Agus Hermawan', 'Laki-Laki', 'Jl. Teratai No. 89, Bandung', '081456789012', 'agus.hermawan@gmail.com'),
(8, '3215026302860008', 'Ani Yudhoyono', 'Perempuan', 'Jl. Cikutra No. 23, Garut', '083567890123', 'ani.yudhoyono@gmail.com'),
(9, '3601014507830009', 'Hendra Wijaya', 'Laki-Laki', 'Jl. Sudirman No. 56, Cianjur', '085678901234', 'hendra.wijaya@gmail.com'),
(10, '3216028308910010', 'Maya Sari', 'Perempuan', 'Jl. Gatot Subroto No. 78, Cirebon', '087890123456', 'maya.sari@gmail.com'),
(11, '3214013011820011', 'Rudi Hartono', 'Laki-Laki', 'Jl. Setiabudi No. 90, Kuningan', '089012345678', 'rudi.hartono@gmail.com'),
(12, '3279027105860012', 'Lina Marlina', 'Perempuan', 'Jl. Pasteur No. 45, Majalengka', '081234567890', 'lina.marlina@gmail.com'),
(13, '3278011708840013', 'Dedi Kurniawan', 'Laki-Laki', 'Jl. Ciganitri No. 67, Purwakarta', '085678901234', 'dedi.kurniawan@gmail.com'),
(14, '3215023004900014', 'Tuti Winarti', 'Perempuan', 'Jl. Cibaduyut No. 23, Sumedang', '081345678901', 'tuti.winarti@gmail.com'),
(15, '3211014406870015', 'Eko Susanto', 'Laki-Laki', 'Jl. Anggrek No. 76, Tasikmalaya', '087890123456', 'eko.susanto@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_umkm`
--

CREATE TABLE `produk_umkm` (
  `id_produk` int(11) NOT NULL,
  `id_umkm` int(11) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `deskripsi_produk` text DEFAULT NULL,
  `harga` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk_umkm`
--

INSERT INTO `produk_umkm` (`id_produk`, `id_umkm`, `nama_produk`, `deskripsi_produk`, `harga`) VALUES
(1, 1, 'Sambel Hejo Level 1', 'Sambel hejo dengan tingkat kepedasan rendah', 15000.00),
(2, 1, 'Sambel Hejo Level 3', 'Sambel hejo dengan tingkat kepedasan sedang', 17000.00),
(3, 1, 'Sambel Hejo Level 5', 'Sambel hejo dengan tingkat kepedasan tinggi', 20000.00),
(4, 1, 'Ayam Goreng Sambel Hejo', 'Paket nasi dengan ayam goreng dan sambel hejo', 25000.00),
(5, 2, 'Batik Tulis Mega Mendung', 'Batik tulis motif mega mendung khas Cirebon', 750000.00),
(6, 2, 'Batik Cap Kujang', 'Batik cap dengan motif kujang', 350000.00),
(7, 2, 'Kemeja Batik Pria', 'Kemeja batik pria lengan panjang', 275000.00),
(8, 2, 'Dress Batik Modern', 'Dress batik modern untuk wanita', 325000.00),
(9, 3, 'Keranjang Anyaman Bambu', 'Keranjang anyaman bambu multi fungsi', 85000.00),
(10, 3, 'Topi Anyaman Bambu', 'Topi anyaman bambu untuk bertani', 45000.00),
(11, 3, 'Vas Bunga Rotan', 'Vas bunga dari rotan dengan desain klasik', 120000.00),
(12, 4, 'Jeruk Keprok 1 kg', 'Jeruk keprok segar langsung dari kebun', 30000.00),
(13, 4, 'Mangga Gedong Gincu 1 kg', 'Mangga gedong gincu khas Indramayu', 45000.00),
(14, 5, 'Telur Ayam Kampung 1 kg', 'Telur ayam kampung organik', 60000.00),
(15, 5, 'Ayam Potong Segar 1 ekor', 'Ayam potong segar', 75000.00),
(16, 6, 'Ikan Nila Segar 1 kg', 'Ikan nila segar hasil budidaya', 40000.00),
(17, 6, 'Ikan Mas Segar 1 kg', 'Ikan mas segar hasil budidaya', 45000.00),
(18, 6, 'Pempek Ikan', 'Pempek ikan nila homemade', 60000.00),
(19, 7, 'Jasa Las Teralis', 'Jasa pembuatan teralis per meter', 350000.00),
(20, 7, 'Jasa Las Pagar', 'Jasa pembuatan pagar besi per meter', 450000.00),
(21, 8, 'Paket Sembako Hemat', 'Paket sembako hemat (beras, minyak, gula)', 150000.00),
(22, 8, 'Beras Premium 5 kg', 'Beras premium kualitas terbaik', 75000.00),
(23, 9, 'Meja Makan Set', 'Set meja makan kayu jati dengan 6 kursi', 12500000.00),
(24, 9, 'Lemari Pakaian 3 Pintu', 'Lemari pakaian 3 pintu dari kayu jati', 8500000.00),
(25, 10, 'Jasa Pembuatan Website', 'Jasa pembuatan website profesional', 5000000.00),
(26, 10, 'Jasa Pembuatan Aplikasi Mobile', 'Jasa pembuatan aplikasi mobile Android dan iOS', 15000000.00),
(27, 11, 'Kamar Standar per Malam', 'Sewa kamar standar per malam termasuk sarapan', 350000.00),
(28, 11, 'Kamar Superior per Malam', 'Sewa kamar superior per malam termasuk sarapan', 500000.00),
(29, 12, 'Jasa Desain Logo', 'Jasa pembuatan desain logo perusahaan', 2500000.00),
(30, 12, 'Jasa Branding Komprehensif', 'Jasa branding komprehensif (logo, kop surat, dll)', 7500000.00),
(31, 13, 'Dodol Garut', 'Dodol khas Garut berbagai rasa', 25000.00),
(32, 13, 'Opak Singkong', 'Opak singkong khas Purwakarta', 20000.00),
(33, 14, 'Syal Rajutan', 'Syal rajutan tangan dengan benang wol premium', 150000.00),
(34, 14, 'Topi Rajutan Bayi', 'Topi rajutan untuk bayi', 75000.00),
(35, 15, 'Kopi Arabika Gunung Puntang 250gr', 'Kopi arabika premium dari Gunung Puntang', 125000.00),
(36, 15, 'Kopi Robusta Gunung Papandayan 250gr', 'Kopi robusta premium dari Gunung Papandayan', 95000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `skala_umkm`
--

CREATE TABLE `skala_umkm` (
  `id_skala` int(11) NOT NULL,
  `nama_skala` varchar(50) NOT NULL,
  `batas_aset_bawah` decimal(15,2) NOT NULL,
  `batas_aset_atas` decimal(15,2) NOT NULL,
  `batas_omzet_bawah` decimal(15,2) NOT NULL,
  `batas_omzet_atas` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `skala_umkm`
--

INSERT INTO `skala_umkm` (`id_skala`, `nama_skala`, `batas_aset_bawah`, `batas_aset_atas`, `batas_omzet_bawah`, `batas_omzet_atas`) VALUES
(1, 'Mikro', 0.00, 50000000.00, 0.00, 300000000.00),
(2, 'Kecil', 50000000.00, 500000000.00, 300000000.00, 2500000000.00),
(3, 'Menengah', 500000000.00, 10000000000.00, 2500000000.00, 50000000000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `umkm`
--

CREATE TABLE `umkm` (
  `id_umkm` int(11) NOT NULL,
  `nama_usaha` varchar(200) NOT NULL,
  `id_pemilik` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_skala` int(11) NOT NULL,
  `id_kabupaten_kota` int(11) NOT NULL,
  `alamat_usaha` text DEFAULT NULL,
  `nib` varchar(50) NOT NULL,
  `npwp` varchar(20) NOT NULL,
  `tahun_berdiri` year(4) NOT NULL,
  `jumlah_karyawan` int(11) NOT NULL,
  `total_aset` decimal(15,2) NOT NULL,
  `omzet_per_tahun` decimal(15,2) NOT NULL,
  `deskripsi_usaha` text DEFAULT NULL,
  `tanggal_registrasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `umkm`
--

INSERT INTO `umkm` (`id_umkm`, `nama_usaha`, `id_pemilik`, `id_kategori`, `id_skala`, `id_kabupaten_kota`, `alamat_usaha`, `nib`, `npwp`, `tahun_berdiri`, `jumlah_karyawan`, `total_aset`, `omzet_per_tahun`, `deskripsi_usaha`, `tanggal_registrasi`) VALUES
(1, 'Warung Sambel Hejo', 1, 1, 1, 1, 'Jl. Pahlawan No. 123, Bandung', '9120001234567', '09.876.543.2-123.000', '2018', 3, 35000000.00, 250000000.00, 'Warung makan spesialis sambel khas Sunda dengan aneka lauk', '2022-03-15'),
(2, 'Butik Batik Pesona', 2, 2, 2, 2, 'Jl. Merdeka No. 45, Bekasi', '9120001234568', '09.876.543.2-123.001', '2015', 7, 320000000.00, 1200000000.00, 'Butik batik dengan motif khas Jawa Barat', '2021-07-20'),
(3, 'Kerajinan Anyaman Rahayu', 3, 3, 1, 1, 'Jl. Sukajadi No. 78, Bandung', '9120001234569', '09.876.543.2-123.002', '2019', 5, 45000000.00, 280000000.00, 'Produk kerajinan anyaman bambu dan rotan', '2022-01-10'),
(4, 'Taman Buah Sejahtera', 4, 4, 2, 3, 'Jl. Veteran No. 56, Bogor', '9120001234570', '09.876.543.2-123.003', '2014', 10, 450000000.00, 2000000000.00, 'Pertanian buah-buahan lokal dan jeruk impor', '2020-11-05'),
(5, 'Ternak Ayam Makmur', 5, 5, 1, 12, 'Jl. Cendana No. 34, Bekasi', '9120001234571', '09.876.543.2-123.004', '2020', 4, 48000000.00, 275000000.00, 'Peternakan ayam dan pengolahan telur', '2022-02-28'),
(6, 'Budidaya Ikan Barokah', 6, 6, 2, 4, 'Jl. Kemuning No. 67, Cimahi', '9120001234572', '09.876.543.2-123.005', '2017', 8, 380000000.00, 1800000000.00, 'Budidaya ikan air tawar dan olahan ikan', '2021-04-12'),
(7, 'Bengkel Las Abadi', 7, 7, 1, 10, 'Jl. Teratai No. 89, Bandung', '9120001234573', '09.876.543.2-123.006', '2016', 6, 49000000.00, 290000000.00, 'Jasa pengelasan dan pembuatan pagar', '2022-05-17'),
(8, 'Toko Sembako Barokah', 8, 8, 2, 17, 'Jl. Cikutra No. 23, Garut', '9120001234574', '09.876.543.2-123.007', '2013', 5, 420000000.00, 2300000000.00, 'Perdagangan sembako dan kebutuhan rumah tangga', '2020-08-23'),
(9, 'Furniture Kayu Jati', 9, 9, 3, 15, 'Jl. Sudirman No. 56, Cianjur', '9120001234575', '09.876.543.2-123.008', '2012', 20, 2500000000.00, 15000000000.00, 'Produksi furniture kayu jati untuk ekspor', '2020-03-10'),
(10, 'Digital Solution', 10, 10, 2, 16, 'Jl. Gatot Subroto No. 78, Cirebon', '9120001234576', '09.876.543.2-123.009', '2018', 12, 480000000.00, 2200000000.00, 'Pengembangan aplikasi dan website', '2021-09-15'),
(11, 'Homestay Panorama', 11, 11, 1, 20, 'Jl. Setiabudi No. 90, Kuningan', '9120001234577', '09.876.543.2-123.010', '2019', 4, 47000000.00, 270000000.00, 'Penyedia akomodasi homestay di daerah wisata', '2022-04-21'),
(12, 'Studio Desain Kreatif', 12, 12, 2, 21, 'Jl. Pasteur No. 45, Majalengka', '9120001234578', '09.876.543.2-123.011', '2016', 8, 350000000.00, 1900000000.00, 'Jasa desain grafis dan branding', '2021-05-17'),
(13, 'Oleh-oleh Khas Sunda', 13, 1, 2, 23, 'Jl. Ciganitri No. 67, Purwakarta', '9120001234579', '09.876.543.2-123.012', '2015', 9, 370000000.00, 2100000000.00, 'Makanan oleh-oleh khas Sunda Buhun', '2020-10-30'),
(14, 'Rajutan Cantik', 14, 2, 1, 26, 'Jl. Cibaduyut No. 23, Sumedang', '9120001234580', '09.876.543.2-123.013', '2020', 3, 40000000.00, 260000000.00, 'Produk rajutan handmade berkualitas', '2022-02-14'),
(15, 'Perkebunan Kopi Gunung', 15, 4, 3, 27, 'Jl. Anggrek No. 76, Tasikmalaya', '9120001234581', '09.876.543.2-123.014', '2010', 25, 3500000000.00, 20000000000.00, 'Perkebunan dan pengolahan kopi premium', '2020-01-05');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_pemilik_dan_usaha`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_pemilik_dan_usaha` (
`NIK` varchar(16)
,`Nama Pemilik` varchar(200)
,`Jenis Kelamin` enum('Laki-Laki','Perempuan')
,`Nomor Telepon` varchar(15)
,`Email` varchar(100)
,`Nama Usaha` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_produk_umkm`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_produk_umkm` (
`Nama Usaha` varchar(200)
,`Nama Produk` varchar(200)
,`Deskripsi Produk` text
,`Harga` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_umkm_detail`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_umkm_detail` (
`Nama Usaha` varchar(200)
,`Nama Pemilik` varchar(200)
,`Kategori UMKM` varchar(100)
,`Skala Usaha` varchar(50)
,`Nama Kabupaten/Kota` varchar(100)
,`Tahun Berdiri` year(4)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_umkm_menengah`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_umkm_menengah` (
`Skala Usaha Menengah` decimal(15,2)
,`Nama Usaha` varchar(200)
,`Nama Pemilik` varchar(200)
,`Total Aset` decimal(15,2)
,`Omzet Pertahun` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_umkm_per_kota`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_umkm_per_kota` (
`Nama Kabupaten/Kota` varchar(100)
,`Jumlah UMKM` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_pemilik_dan_usaha`
--
DROP TABLE IF EXISTS `view_pemilik_dan_usaha`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pemilik_dan_usaha`  AS SELECT `p`.`nik` AS `NIK`, `p`.`nama_lengkap` AS `Nama Pemilik`, `p`.`jenis_kelamin` AS `Jenis Kelamin`, `p`.`nomor_telepon` AS `Nomor Telepon`, `p`.`email` AS `Email`, `u`.`nama_usaha` AS `Nama Usaha` FROM (`umkm` `u` join `pemilik_umkm` `p` on(`u`.`id_pemilik` = `p`.`id_pemilik`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_produk_umkm`
--
DROP TABLE IF EXISTS `view_produk_umkm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_produk_umkm`  AS SELECT `u`.`nama_usaha` AS `Nama Usaha`, `p`.`nama_produk` AS `Nama Produk`, `p`.`deskripsi_produk` AS `Deskripsi Produk`, `p`.`harga` AS `Harga` FROM (`umkm` `u` join `produk_umkm` `p` on(`u`.`id_umkm` = `p`.`id_umkm`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_umkm_detail`
--
DROP TABLE IF EXISTS `view_umkm_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_umkm_detail`  AS SELECT `u`.`nama_usaha` AS `Nama Usaha`, `p`.`nama_lengkap` AS `Nama Pemilik`, `k`.`nama_kategori` AS `Kategori UMKM`, `s`.`nama_skala` AS `Skala Usaha`, `kk`.`nama_kabupaten_kota` AS `Nama Kabupaten/Kota`, `u`.`tahun_berdiri` AS `Tahun Berdiri` FROM ((((`umkm` `u` join `pemilik_umkm` `p` on(`u`.`id_pemilik` = `p`.`id_pemilik`)) join `kategori_umkm` `k` on(`u`.`id_kategori` = `k`.`id_kategori`)) join `skala_umkm` `s` on(`u`.`id_skala` = `s`.`id_skala`)) join `kabupaten_kota` `kk` on(`u`.`id_kabupaten_kota` = `kk`.`id_kabupaten_kota`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_umkm_menengah`
--
DROP TABLE IF EXISTS `view_umkm_menengah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_umkm_menengah`  AS SELECT `s`.`batas_aset_bawah` AS `Skala Usaha Menengah`, `u`.`nama_usaha` AS `Nama Usaha`, `p`.`nama_lengkap` AS `Nama Pemilik`, `u`.`total_aset` AS `Total Aset`, `u`.`omzet_per_tahun` AS `Omzet Pertahun` FROM ((`umkm` `u` join `skala_umkm` `s` on(`u`.`id_skala` = `s`.`id_skala`)) join `pemilik_umkm` `p` on(`u`.`id_pemilik` = `p`.`id_pemilik`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_umkm_per_kota`
--
DROP TABLE IF EXISTS `view_umkm_per_kota`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_umkm_per_kota`  AS SELECT `k`.`nama_kabupaten_kota` AS `Nama Kabupaten/Kota`, count(`u`.`id_umkm`) AS `Jumlah UMKM` FROM (`kabupaten_kota` `k` left join `umkm` `u` on(`k`.`id_kabupaten_kota` = `u`.`id_kabupaten_kota`)) GROUP BY `k`.`id_kabupaten_kota`, `k`.`nama_kabupaten_kota` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kabupaten_kota`
--
ALTER TABLE `kabupaten_kota`
  ADD PRIMARY KEY (`id_kabupaten_kota`);

--
-- Indeks untuk tabel `kategori_umkm`
--
ALTER TABLE `kategori_umkm`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pemilik_umkm`
--
ALTER TABLE `pemilik_umkm`
  ADD PRIMARY KEY (`id_pemilik`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `produk_umkm`
--
ALTER TABLE `produk_umkm`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_umkm` (`id_umkm`);

--
-- Indeks untuk tabel `skala_umkm`
--
ALTER TABLE `skala_umkm`
  ADD PRIMARY KEY (`id_skala`);

--
-- Indeks untuk tabel `umkm`
--
ALTER TABLE `umkm`
  ADD PRIMARY KEY (`id_umkm`),
  ADD UNIQUE KEY `nib` (`nib`),
  ADD UNIQUE KEY `npwp` (`npwp`),
  ADD KEY `id_pemilik` (`id_pemilik`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_skala` (`id_skala`),
  ADD KEY `id_kabupaten_kota` (`id_kabupaten_kota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kabupaten_kota`
--
ALTER TABLE `kabupaten_kota`
  MODIFY `id_kabupaten_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `kategori_umkm`
--
ALTER TABLE `kategori_umkm`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pemilik_umkm`
--
ALTER TABLE `pemilik_umkm`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `produk_umkm`
--
ALTER TABLE `produk_umkm`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `skala_umkm`
--
ALTER TABLE `skala_umkm`
  MODIFY `id_skala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `umkm`
--
ALTER TABLE `umkm`
  MODIFY `id_umkm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `produk_umkm`
--
ALTER TABLE `produk_umkm`
  ADD CONSTRAINT `produk_umkm_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkm` (`id_umkm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `umkm`
--
ALTER TABLE `umkm`
  ADD CONSTRAINT `umkm_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik_umkm` (`id_pemilik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `umkm_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_umkm` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `umkm_ibfk_3` FOREIGN KEY (`id_skala`) REFERENCES `skala_umkm` (`id_skala`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `umkm_ibfk_4` FOREIGN KEY (`id_kabupaten_kota`) REFERENCES `kabupaten_kota` (`id_kabupaten_kota`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
