USE db_sistem_manajemen_sekolah;


DELIMITER//
CREATE TRIGGER before_insert_nilai
BEFORE INSERT ON nilai
FOR EACH ROW
BEGIN
    IF NEW.nilai_angka > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nilai angka tidak boleh lebih dari 100';
    END IF;
END//
DELIMITER;

-- GAGAL karena nilai_angka > 100
INSERT INTO nilai (id_siswa, id_mapel, nilai_angka, nilai_huruf)
VALUES (1, 1, 80, 'A');

SELECT * FROM nilai;


DELIMITER//
CREATE TRIGGER before_delete_guru
BEFORE DELETE ON guru
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM jadwal WHERE id_guru = OLD.id_guru) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tidak bisa menghapus guru yang masih ada di jadwal';
    END IF;
END//
DELIMITER ;

-- GAGAL jika guru ID 1 masih digunakan di jadwal
DELETE FROM guru WHERE id_guru = 15;

SELECT * FROM guru;


DELIMITER//
CREATE TRIGGER before_update_siswa
BEFORE UPDATE ON siswa
FOR EACH ROW
BEGIN
    IF NEW.nisn IS NULL OR NEW.nisn = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'NISN tidak boleh kosong saat update';
    END IF;
END//
DELIMITER ;

-- GAGAL karena nisn kosong
UPDATE siswa SET nisn = '1000' WHERE id_siswa = 1;
SELECT * FROM siswa;



DELIMITER//
CREATE TRIGGER after_insert_nilai_update_rata
AFTER INSERT ON nilai
FOR EACH ROW
BEGIN
    DECLARE avg_nilai DECIMAL(5,2);

    SELECT AVG(nilai_angka)
    INTO avg_nilai
    FROM nilai
    WHERE id_siswa = NEW.id_siswa;

    UPDATE siswa
    SET rata_rata = avg_nilai
    WHERE id_siswa = NEW.id_siswa;
END//
DELIMITER ;

-- BERHASIL dan akan menghitung ulang rata-rata
INSERT INTO nilai (id_siswa, id_mapel, nilai_angka, nilai_huruf)
VALUES (1, 1, 90, 'B');
SELECT * FROM siswa;



DELIMITER//
CREATE TRIGGER after_update_nilai_update_rata
AFTER UPDATE ON nilai
FOR EACH ROW
BEGIN
    DECLARE avg_nilai DECIMAL(5,2);

    SELECT AVG(nilai_angka)
    INTO avg_nilai
    FROM nilai
    WHERE id_siswa = NEW.id_siswa;

    UPDATE siswa
    SET rata_rata = avg_nilai
    WHERE id_siswa = NEW.id_siswa;
END//
DELIMITER ;

-- Misalnya kita ubah nilai angka menjadi 95
UPDATE nilai
SET nilai_angka = 95
WHERE id_nilai = 12;
SELECT * FROM siswa;
SELECT * FROM nilai;


DELIMITER//
CREATE TRIGGER after_delete_nilai_update_rata
AFTER DELETE ON nilai
FOR EACH ROW
BEGIN
    DECLARE avg_n DECIMAL(5,2);

    SELECT AVG(nilai_angka) INTO avg_n
    FROM nilai
    WHERE id_siswa = OLD.id_siswa;

    UPDATE siswa
    SET rata_rata = IFNULL(avg_n, 0)
    WHERE id_siswa = OLD.id_siswa;
END//
DELIMITER ;
DELETE FROM nilai WHERE id_nilai = 1;
SELECT rata_rata FROM siswa WHERE id_siswa = 1;
SELECT * FROM siswa;






