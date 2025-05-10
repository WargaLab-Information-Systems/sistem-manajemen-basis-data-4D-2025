-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Apr 2025 pada 05.08
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
-- Database: `db_akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nidn` varchar(10) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `fakultas` varchar(100) DEFAULT NULL,
  `program_studi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`nidn`, `nama`, `fakultas`, `program_studi`) VALUES
('012345', 'Imamah', 'Fakultas Syariah', 'Hukum Bisnis Syariah'),
('123456', 'Firmansyah Adiputra', 'Fakultas Teknik', 'Teknik Industri'),
('234567', 'Ahmad Yasid', 'Fakultas Ekonomi', 'Akuntansi'),
('345678', 'Novi Prastiti', 'Fakultas Pertanian', 'Agribisnis'),
('567809', 'Rosidah Vivin', 'Fakultas Kelautan', 'Ilmu Kelautan'),
('567890', 'Fitri Damayanti', 'Fakultas Teknik', 'Teknik Informatika'),
('678901', 'Budi Soesilo', 'Fakultas Ekonomi', 'Manajemen'),
('789012', 'Eza Rachmanita', 'Fakultas Ilmu Sosial', 'Ilmu Komunikasi'),
('890123', 'Ersa Alami', 'Fakultas Pendidikan', 'PGSD'),
('901234', 'Sri Herawati', 'Fakultas Teknik', 'Sistem Informasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `id_krs` int(11) NOT NULL,
  `nim` varchar(10) DEFAULT NULL,
  `kode_mk` varchar(10) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `krs`
--

INSERT INTO `krs` (`id_krs`, `nim`, `kode_mk`, `semester`) VALUES
(1, '220007', 'IF101', 'Ganjil'),
(2, '230006', 'IF102', 'Genap'),
(3, '230002', 'IND301', 'Ganjil'),
(4, '220003', 'MN201', 'Genap'),
(5, '220007', 'AK001', 'Ganjil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `program_studi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `tanggal_lahir`, `alamat`, `program_studi`) VALUES
('200005', 'Angga Yunanda', '2001-09-12', 'Surabaya', 'PGSD'),
('210001', 'Jefri Nichol', '2001-01-15', 'Jakarta', 'Teknik Informatika'),
('210004', 'Iqbal Ramadhan', '1999-06-28', 'Jakarta', 'Ilmu Komunikasi'),
('210008', 'Adhisty Zara', '2001-06-21', 'Yogyakarta', 'Agribisnis'),
('210009', 'Prilly Latuconsina', '1999-10-15', 'Medan', 'Ilmu Kelautan'),
('220003', 'Maudy Ayunda', '2000-12-19', 'Depok', 'Manajemen'),
('220007', 'Yuki Kato', '2000-11-01', 'Bekasi', 'Akuntansi'),
('220010', 'Bryan Domani', '2001-07-08', 'Bogor', 'Teknik Informatika'),
('230002', 'Arya Mohan', '2002-04-10', 'Bandung', 'Teknik Industri'),
('230006', 'Amanda Aulia', '2005-05-07', 'Lamongan', 'Sistem Informasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `kode_mk` varchar(10) NOT NULL,
  `nama_mk` varchar(100) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `nidn_pengampu` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`kode_mk`, `nama_mk`, `sks`, `nidn_pengampu`) VALUES
('AGB101', 'Ekonomi Pertanian', 3, '345678'),
('AK001', 'Akuntansi Dasar', 3, '234567'),
('IF101', 'Algoritma dan Pemrograman', 3, '567890'),
('IF102', 'Basis Data', 3, '567890'),
('IK301', 'Komunikasi Massa', 2, '789012'),
('IND301', 'Perencanaan Produksi', 3, '123456'),
('KD001', 'Anatomi Manusia', 4, '901234'),
('KL001', 'Ekologi Laut', 3, '567809'),
('MN201', 'Manajemen Keuangan', 2, '678901'),
('PGSD101', 'Psikologi Anak', 3, '890123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_krs` int(11) DEFAULT NULL,
  `nilai` char(2) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_krs`, `nilai`, `grade`) VALUES
(1, 1, 'A', 'Sangat Bai'),
(2, 2, 'B', 'Baik'),
(3, 3, 'A', 'Sangat Bai'),
(4, 4, 'C', 'Cukup'),
(5, 5, 'B', 'Baik'),
(6, 1, 'A', 'Sangat Bai'),
(7, 2, 'B', 'Baik'),
(8, 3, 'A', 'Sangat Bai'),
(9, 4, 'C', 'Cukup'),
(10, 5, 'B', 'Baik'),
(11, 1, 'A', 'Sangat Bai'),
(12, 2, 'B', 'Baik'),
(13, 3, 'A', 'Sangat Bai'),
(14, 4, 'C', 'Cukup'),
(15, 5, 'B', 'Baik');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nidn`);

--
-- Indeks untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id_krs`),
  ADD KEY `nim` (`nim`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`kode_mk`),
  ADD KEY `nidn_pengampu` (`nidn_pengampu`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_krs` (`id_krs`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `krs`
--
ALTER TABLE `krs`
  MODIFY `id_krs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `matkul` (`kode_mk`);

--
-- Ketidakleluasaan untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`nidn_pengampu`) REFERENCES `dosen` (`nidn`);

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_krs`) REFERENCES `krs` (`id_krs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
