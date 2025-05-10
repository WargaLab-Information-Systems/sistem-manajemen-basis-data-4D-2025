CREATE DATABASE akademik;
USE akademik;


CREATE TABLE Mahasiswa (
nim BIGINT PRIMARY KEY,
nama VARCHAR (50) NOT NULL,
angkatan YEAR NOT NULL,
program_studi VARCHAR (50) NOT NULL,
alamat VARCHAR(100) NOT NULL
);


CREATE TABLE Dosen (
nip BIGINT PRIMARY KEY,
nama VARCHAR (50) NOT NULL,
alamat VARCHAR(100) NOT NULL,
);


CREATE TABLE mata_kuliah (
kode_mk VARCHAR(10) PRIMARY KEY,
nama_mk VARCHAR (50) NOT NULL,
sks INT NOT NULL
);


CREATE TABLE KRS (
id_krs INT AUTO_INCREMENT PRIMARY KEY,
nim BIGINT,
kode_mk VARCHAR (10),
semester INT NOT NULL,
FOREIGN KEY (nim) REFERENCES Mahasiswa(nim) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE mengajar (
id_mengajar INT AUTO_INCREMENT PRIMARY KEY,
nip BIGINT,
kode_mk VARCHAR (10),
FOREIGN KEY (nip) REFERENCES dosen(nip) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Isi data pada tabel masing – masing 10 data untuk table Mahasiswa, Dosen dan Matakuliah
INSERT INTO Mahasiswa VALUES
(230441100001, 'Ahmad Fauzan', 2023, 'Sistem Informasi', 'Jl. Abdul Karim'),
(230441100002, 'Siti Aisyah', 2023, 'Sistem Informasi', 'Jl. Jemur sari'),
(230441100003, 'Budi Santoso', 2023, 'Sistem Informasi', 'Jl. Indra giri'),
(230441100004, 'Dewi Lestari', 2023, 'Sistem Informasi', 'Jl. Matahari'),
(230441100005, 'Rizki Ramadhan', 2023, 'Sistem Informasi', 'Jl. Trunojoyo'),
(230441100006, 'Maya Sari', 2023, 'Sistem Informasi', 'Jl. Bates Sebaneh'),
(230441100007, 'Fajar Pratama', 2023, 'Sistem Informasi', 'Jl. Nugroho '),
(230441100008, 'Aulia Putri', 2023, 'Sistem Informasi', 'Jl. Stasiun Wonokromo '),
(230441100009, 'Dian Permana', 2023, 'Sistem Informasi', 'Jl. Ahmad Yani'),
(230441100010, 'Gita Sari', 2023, 'Sistem Informasi', 'Jl. Stadion No. 20');


INSERT INTO Dosen VALUES
(197809152023000001, 'Dr. Rudi Hartono', 'Jl. Cokro Atmojo No. 63'),
(198012182023000002, 'Dr. Siti Zulaikha', 'Jl. Kamboja No. 63'),
(197706112023000003, 'Dr. Budi Prasetyo', 'Jl. Semeru Selatan No.23 Dampit'),
(198509102023000004, 'Prof. Bambang Wahyudi', 'Jl. Raya Bantur No.1460 Bantur'),
(197911142023000005, 'Dr. Andi Wijaya', 'Jl. Bahagia No. 13'),
(198212252023000006, 'Dr. Indah Permata', 'Jl. Suropati No. 6 Bululawang'),
(197510312023000007, 'Dr. Agus Santoso', 'Jl. Raya Larangan'),
(198610022023000008, 'Dr. Lestari Dewi'), 'Jl. Nugraha No. 6',
(198704232023000009, 'Dr. Bayu Saputra'), 'Jl. Raya Bantur No.134 Bantur',
(197904052023000010, 'Prof. Winda Lestari'), 'Jl. Raya Donomulyo No.62 Donomulyo';


INSERT INTO mata_kuliah VALUES
('MK001', 'Basis Data', 3),
('MK002', 'Pemrograman Web', 3),
('MK003', 'Keamanan Jaringan', 2),
('MK004', 'Data Mining', 3),
('MK005', 'Data Science', 3),
('MK006', 'Kecerdasan Buatan', 3),
('MK007', 'Rekayasa Perangkat Lunak', 2),
('MK008', 'Machine Learning', 3),
('MK009', 'Pengolahan Data Besar', 3),
('MK010', 'Cloud Computing', 3);


-- Tampilkan keseluruhan data pada setiap tabel.
SELECT * FROM mahasiswa;
SELECT * FROM dosen;
SELECT * FROM mata_kuliah;
SELECT * FROM krs;
SELECT * FROM mengajar;


-- Tambahkan data pada tabel KRS sebanyak 5 data.
INSERT INTO KRS (nim, kode_mk, semester) VALUES
(230441100001, 'MK001', 1),
(230441100002, 'MK002', 1),
(230441100003, 'MK003', 2),
(230441100004, 'MK004', 2),
(230441100005, 'MK005', 3);


INSERT INTO Mengajar (nip, kode_mk) VALUES
(197809152023000001, 'MK001'),
(198012182023000002, 'MK002'),
(197706112023000003, 'MK003'),
(198509102023000004, 'MK004'),
(197911142023000005, 'MK005');


INSERT INTO mengajar (nip, kode_mk) VALUES
(198509102023000004, 'Mk009');

-- Lakukan perubahan pada salah satu nama tabel
ALTER TABLE mata_kuliah RENAME TO matkul;
ALTER TABLE matkul RENAME TO mata_kuliah;


-- Tampilkan keseluruhan data pada setiap tabel.
SELECT * FROM mahasiswa;
SELECT * FROM dosen;
SELECT * FROM matkul;
SELECT * FROM krs;
SELECT * FROM mengajar;


-- Hapus database tersebut.
-- drop database akademik;