CREATE TABLE Mahasiswa (
    nim VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100),
    jenis_kelamin ENUM('L', 'P'),
    tanggal_lahir DATE,
    alamat TEXT,
    no_hp VARCHAR(15),
    id_prodi INT,
    FOREIGN KEY (id_prodi) REFERENCES ProgramStudi(id_prodi)
);

CREATE TABLE Dosen (
    nidn VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100),
    email VARCHAR(100),
    no_hp VARCHAR(15),
    id_prodi INT,
    FOREIGN KEY (id_prodi) REFERENCES ProgramStudi(id_prodi)
);

CREATE TABLE MataKuliah (
    kode_mk VARCHAR(10) PRIMARY KEY,
    nama_mk VARCHAR(100),
    sks INT,
    semester INT,
    nidn VARCHAR(10),
    FOREIGN KEY (nidn) REFERENCES Dosen(nidn)
);

CREATE TABLE KRS (
    id_krs INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(10),
    kode_mk VARCHAR(10),
    semester INT,
    tahun_ajaran VARCHAR(10),
    nilai CHAR(2),
    FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
    FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk)
);

CREATE TABLE ProgramStudi (
    id_prodi INT PRIMARY KEY AUTO_INCREMENT,
    nama_prodi VARCHAR(100)
);

CREATE TABLE Fakultas (
    id_fakultas INT PRIMARY KEY AUTO_INCREMENT,
    nama_fakultas VARCHAR(100)
);

ALTER TABLE ProgramStudi
ADD id_fakultas INT,
ADD FOREIGN KEY (id_fakultas) REFERENCES Fakultas(id_fakultas);
