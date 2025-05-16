CREATE DATABASE db_sistem_manajemen_sekolah;

USE db_sistem_manajemen_sekolah;

CREATE TABLE siswa (
    id_siswa INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    nisn VARCHAR(20) UNIQUE NOT NULL,
    kelas VARCHAR(10),
    alamat TEXT,
    keterangan TEXT
);

CREATE TABLE guru (
    id_guru INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    nip VARCHAR(20) UNIQUE NOT NULL,
    mata_pelajaran VARCHAR(50)
);

CREATE TABLE mapel (
    id_mapel INT AUTO_INCREMENT PRIMARY KEY,
    nama_mapel VARCHAR(100) NOT NULL,
    tingkat VARCHAR(10)
);


CREATE TABLE jadwal (
    id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
    id_guru INT NOT NULL,
    id_mapel INT NOT NULL,
    kelas VARCHAR(10) NOT NULL,
    hari VARCHAR(15),
    jam_mulai TIME,
    jam_selesai TIME,
    FOREIGN KEY (id_guru) REFERENCES guru(id_guru),
    FOREIGN KEY (id_mapel) REFERENCES mapel(id_mapel)
);

CREATE TABLE nilai (
    id_nilai INT AUTO_INCREMENT PRIMARY KEY,
    id_siswa INT NOT NULL,
    id_mapel INT NOT NULL,
    semester VARCHAR(10),
    nilai_angka DECIMAL(5,2),
    nilai_huruf VARCHAR(2),
    FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa),
    FOREIGN KEY (id_mapel) REFERENCES mapel(id_mapel)
);

ALTER TABLE nilai ADD CONSTRAINT fk_nilai_matpel FOREIGN KEY (id_mapel) REFERENCES mapel(id_mapel);
ALTER TABLE jadwal ADD CONSTRAINT fk_jadwal_matpel FOREIGN KEY (id_mapel) REFERENCES mapel(id_mapel);

SELECT * FROM siswa;
SELECT * FROM guru;
SELECT * FROM mapel;
SELECT * FROM jadwal;
SELECT * FROM nilai;


-- Hapus constraint lama
ALTER TABLE nilai DROP FOREIGN KEY nilai_ibfk_1;

-- Tambahkan constraint baru dengan ON DELETE CASCADE
ALTER TABLE nilai
ADD CONSTRAINT fk_nilai_siswa
FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa)
ON DELETE CASCADE;


SELECT 
    j.id_jadwal,
    g.nama AS nama_guru,
    m.nama_mapel,
    j.kelas,
    j.hari,
    j.jam_mulai,
    j.jam_selesai
FROM jadwal j
JOIN guru g ON j.id_guru = g.id_guru
JOIN mapel m ON j.id_mapel = m.id_mapel
ORDER BY j.hari, j.jam_mulai;

DROP DATABASE db_sistem_manajemen_sekolah;

TRUNCATE TABLE mapel;

ALTER TABLE nilai DROP COLUMN semester;

ALTER TABLE nilai
ADD COLUMN semester VARCHAR(10);

SELECT s.id_siswa, s.nama,
CASE
WHEN EXISTS (SELECT 1 FROM transaksi t WHERE t.id_siswa = s.id_siswa)
THEN 'Punya Transaksi'
ELSE 'Tidak Punya Transaksi'
END AS status_transaksi
FROM siswa s;

ALTER TABLE siswa
ADD COLUMN rata_rata DECIMAL(5,2) DEFAULT 0;

CREATE TABLE transaksi (
	id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
	id_siswa INT,
	tanggal_transaksi DATE,
	jumlah DECIMAL(10,2),
	STATUS ENUM('belum dibayar', 'lunas', 'non-aktif', 'pasif', 'aktif') DEFAULT 'belum dibayar',
	keterangan TEXT,
	FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa)
);

