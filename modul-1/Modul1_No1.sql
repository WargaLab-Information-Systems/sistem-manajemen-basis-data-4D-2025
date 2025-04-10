CREATE DATABASE db_akademik;
USE db_akademik;

CREATE TABLE data_jurusan (
    id_jurusan INT PRIMARY KEY AUTO_INCREMENT,
    nama_jurusan VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE data_mahasiswa (
    nim CHAR(10) PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    jurusan_id INT NOT NULL,
    angkatan YEAR NOT NULL,
    FOREIGN KEY (jurusan_id) REFERENCES data_jurusan(id_jurusan)
);

CREATE TABLE data_dosen (
    nip VARCHAR(20) PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    id_jurusan INT NOT NULL,
    FOREIGN KEY (id_jurusan) REFERENCES data_jurusan(id_jurusan)
);

CREATE TABLE data_matakuliah (
    id_matakuliah INT PRIMARY KEY AUTO_INCREMENT,
    nama_matakuliah VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    nip VARCHAR(20) NOT NULL,
    FOREIGN KEY (nip) REFERENCES data_dosen(nip)
);

CREATE TABLE data_krs (
    id_krs INT PRIMARY KEY AUTO_INCREMENT,
    nim CHAR(10) NOT NULL,
    id_matakuliah INT NOT NULL,
    semester INT NOT NULL,
    FOREIGN KEY (nim) REFERENCES data_mahasiswa(nim),
    FOREIGN KEY (id_matakuliah) REFERENCES data_matakuliah(id_matakuliah)
);

INSERT INTO data_jurusan (nama_jurusan) VALUES 
('Teknik Informatika'), 
('Sistem Informasi');
SELECT * FROM data_jurusan;

-- 8. Insert Data ke Tabel Mahasiswa
INSERT INTO data_mahasiswa (nim, nama, jurusan_id, angkatan) VALUES
('2004411172', 'Baqiyatus Sholah Ainur Ridla', 1, 2020),
('2204411124', 'Ningrum Kusuma', 1, 2022),
('2304411001', 'Maghfira Rahmadani', 2, 2023),
('2304411009', 'Muhammad Ilham Ferdiansyah', 2, 2023),
('2304411011', 'Moh.Anwar', 1, 2023),
('2304411012', 'Sholihatul Muyassaroh', 1, 2023),
('2304411015', 'Zendia Amelia', 2, 2023),
('2304411016', 'Zendia Ayunda', 2, 2023),
('2304411017', 'Amanda Aulia Putri', 1, 2023),
('2304411018', 'Achmad Rendi Setiawan', 1, 2023);
DELETE FROM data_mahasiswa;

SELECT * FROM data_mahasiswa;

INSERT INTO data_dosen (nip, nama, id_jurusan) VALUES
('19750101A', 'Dr. Suharto', 1),
('19750202B', 'Prof. Siti Aminah', 1),
('19750303C', 'Dr. Budi Rahman', 2),
('19750404D', 'Dr. Fadli Ahmad', 2),
('19750505E', 'Prof. Mulyadi', 2),
('19750606F', 'Dr. Sari Kusuma', 1),
('19750707G', 'Dr. Rudi Hartono', 1),
('19750808H', 'Dr. Lina Permatasari', 2),
('19750909I', 'Prof. Bambang Sutrisno', 2),
('19751010J', 'Dr. Dewi Kartika', 1);
SELECT * FROM data_dosen;

INSERT INTO data_matakuliah (nama_matakuliah, sks, nip) VALUES
('Basis Data', 3, '19750101A'),
('Pemrograman Java', 3, '19750202B'),
('Struktur Data', 3, '19750303C'),
('Kecerdasan Buatan', 3, '19750404D'),
('Sistem Operasi', 3, '19750505E'),
('Jaringan Komputer', 3, '19750606F'),
('Algoritma dan Pemrograman', 3, '19750707G'),
('Etika Profesi', 2, '19750808H'),
('Kalkulus', 3, '19750909I'),
('Manajemen Proyek', 3, '19751010J');
SELECT * FROM data_matakuliah;

INSERT INTO data_krs (nim, id_matakuliah, semester) VALUES
('2004411172', 1, 4),
('2204411124', 2, 4),
('2304411001', 3, 4),
('2304411009', 4, 4),
('2304411011', 5, 4);
SELECT * FROM data_krs;

-- Merubah nama tabel
ALTER TABLE data_mahasiswa RENAME TO data_siswaaa;
-- Menampilkan tabel dengan nama tabel yang baru
SELECT * FROM data_siswaaa; 

-- Hapus Database
DROP DATABASE db_akademik;
