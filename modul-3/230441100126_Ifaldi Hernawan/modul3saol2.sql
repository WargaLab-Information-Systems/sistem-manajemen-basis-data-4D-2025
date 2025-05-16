USE db_sistem_manajemen_sekolah;

-- soal1
DELIMITER //
CREATE PROCEDURE UpdateDataMaster(
    IN id INT,
    IN nilai_baru VARCHAR(50),
    OUT p_status VARCHAR(50)
)
BEGIN
    UPDATE siswa 
    SET kelas = nilai_baru
    WHERE id_siswa = id;
    SET p_status = 'Selesai';
END //
DELIMITER ;

SET @status = '';
CALL UpdateDataMaster(1, 'XII IPs', @status);
SELECT @status;
SELECT * FROM siswa;

-- soal2
DELIMITER//
CREATE PROCEDURE CountTransaksi(
    OUT total_transaksi INT
)
BEGIN
    SELECT COUNT(*) INTO total_transaksi
    FROM nilai;
END//
DELIMITER;

SET @jumlah = 0;
CALL CountTransaksi(@jumlah);
SELECT @jumlah;

-- soal3
DELIMITER //
CREATE PROCEDURE GetDataMasterByID(
    IN siswaID INT,
    OUT outNama VARCHAR(100),
    OUT outNISN VARCHAR(20),
    OUT outKelas VARCHAR(10),
    OUT outAlamat TEXT
)
BEGIN
    SELECT nama, nisn, kelas, alamat
    INTO outNama, outNISN, outKelas, outAlamat
    FROM siswa
    WHERE id_siswa = siswaID;
END //
DELIMITER ;

-- Deklarasi variabel output
SET @nama = '';
SET @nisn = '';
SET @kelas = '';
SET @alamat = '';

-- Panggil prosedurnya
CALL GetDataMasterByID(5, @nama, @nisn, @kelas, @alamat);

-- Lihat hasilnya
SELECT @nama, @nisn, @kelas, @alamat;
SELECT * FROM siswa;


-- soal4
DELIMITER //
CREATE PROCEDURE UpdateFieldNilai(
    IN id INT,
    INOUT nilaiAngka DECIMAL(5,2),
    INOUT nilaiHuruf VARCHAR(2)
)
BEGIN
    DECLARE old_nilaiAngka DECIMAL(5,2);
    DECLARE old_nilaiHuruf VARCHAR(2);

    -- Ambil nilai lama dari tabel
    SELECT nilai_angka, nilai_huruf
    INTO old_nilaiAngka, old_nilaiHuruf
    FROM nilai
    WHERE id_nilai = id;

    -- Jika parameter kosong (NULL), pakai nilai lama
    IF nilaiAngka IS NULL THEN
        SET nilaiAngka = old_nilaiAngka;
    END IF;

    IF nilaiHuruf IS NULL OR nilaiHuruf = '' THEN
        SET nilaiHuruf = old_nilaiHuruf;
    END IF;

    -- Lakukan update
    UPDATE nilai
    SET nilai_angka = nilaiAngka,
        nilai_huruf = nilaiHuruf
    WHERE id_nilai = id;

    -- Tampilkan nilai akhir
    SELECT nilaiAngka AS updated_nilai_angka, nilaiHuruf AS updated_nilai_huruf;
END //
DELIMITER ;

SET @angka = 88.5;
SET @huruf = NULL;  -- atau bisa juga: SET @huruf = '';
CALL UpdateFieldNilai(5, @angka, @huruf);
SELECT @angka AS nilai_angka_terakhir, @huruf AS nilai_huruf_terakhir;


-- soal5
DELIMITER//
CREATE PROCEDURE DeleteEntriesByIDMaster(
    IN p_id INT
)
BEGIN
    DELETE FROM siswa
    WHERE Id_siswa = p_id;
END//
DELIMITER;

CALL DeleteEntriesByIDMaster(60);
SELECT * FROM siswa;

