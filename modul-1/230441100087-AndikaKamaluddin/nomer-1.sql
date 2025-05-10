CREATE DATABASE akademikProgramStudi;
USE akademikProgramStudi;
CREATE TABLE Mahasiswa (
    nim VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jenisKelamin ENUM('L', 'P') NOT NULL,
    tanggalLahir DATE,
    alamat TEXT,
    noTelp VARCHAR(15),
    email VARCHAR(100),
    programStudi VARCHAR(50),
    angkatan INT,
    STATUS ENUM('Aktif', 'Cuti', 'Lulus', 'DO') DEFAULT 'Aktif'
);

CREATE TABLE Dosen (
    nip VARCHAR(20) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jenisKelamin ENUM('L', 'P') NOT NULL,
    tanggalLahir DATE,
    alamat TEXT,
    noTelp VARCHAR(15),
    email VARCHAR(100),
    bidangKeahlian VARCHAR(100),
    jabatan VARCHAR(50),
    STATUS ENUM('Aktif', 'Cuti', 'Pensiun') DEFAULT 'Aktif'
);

CREATE TABLE MataKuliah (
    kodeMk VARCHAR(10) PRIMARY KEY,
    namaMk VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    deskripsi TEXT,
    nipDosenPengampu VARCHAR(20),
    FOREIGN KEY (nipDosenPengampu) REFERENCES Dosen(nip)
);

CREATE TABLE KRS (
    idKrs INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(10) NOT NULL,
    kodeMk VARCHAR(10) NOT NULL,
    tahunAjaran VARCHAR(10) NOT NULL,
    semester ENUM('Ganjil', 'Genap') NOT NULL,
    nilai CHAR(1),
    nilaiAngka DECIMAL(4,2),
    statusMk ENUM('Sedang Diambil', 'Selesai', 'Mengulang') DEFAULT 'Sedang Diambil',
    tanggalNilai DATE,
    keterangan TEXT,
    FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
    FOREIGN KEY (kodeMk) REFERENCES MataKuliah(kodeMk)
);