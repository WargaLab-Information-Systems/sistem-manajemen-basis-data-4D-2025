USE umkm_jabar;

DELIMITER //
CREATE PROCEDURE AddUMKM (
    IN nama_usaha VARCHAR(255),
    IN jumlah_karyawan INT,
    IN id_pemilik INT,
    IN id_kategori INT,
    IN id_skala INT,
    IN id_kabupaten INT
)
BEGIN
    INSERT INTO umkm (nama_usaha, jumlah_karyawan, id_pemilik, id_kategori, id_skala, id_kabupaten_kota)
    VALUES (nama_usaha, jumlah_karyawan, id_pemilik, id_kategori, id_skala, id_kabupaten);
END//
DELIMITER ;

CALL AddUMKM('sambal bakar', 10, 1, 1, 1,1);

DELIMITER //
CREATE PROCEDURE UpdateKategoriUMKM (
    IN id_kategori_input INT,
    IN nama_baru VARCHAR(255)
)
BEGIN
    UPDATE kategori_umkm
    SET nama_kategori = nama_baru
    WHERE id_kategori = id_kategori_input;
END//
DELIMITER ;
CALL UpdateKategoriUMKM (2, 'fasion');

DELIMITER//
CREATE PROCEDURE DeletePemilikUMKM (
IN kodepemilik INT
)
BEGIN
DELETE FROM pemilik_umkm WHERE id_pemilik = kodepemilik;
END//
DELIMITER;

CALL DeletePemilikUMKM (32);


DELIMITER //
CREATE PROCEDURE AddProduk (
IN IdUmkm INT,
IN NamaProduk VARCHAR(100)
)
BEGIN
INSERT INTO produk_umkm (id_umkm, nama_produk) VALUES (IdUmkm, NamaProduk);
END//
DELIMITER;
CALL AddProduk (15,'kopi luwak');

DELIMITER //
CREATE PROCEDURE GetUMKMByID (
IN IdUmkm INT,
OUT NamaUsaha VARCHAR(100),
OUT Alamat VARCHAR(100),
OUT JmlKaryawan INT
)
BEGIN
SELECT nama_usaha, alamat_usaha, jumlah_karyawan
INTO NamaUsaha, Alamat, JmlKaryawan
FROM umkm WHERE id_umkm = IdUmkm;
END//
DELIMITER;
SET @NamaUsaha = '';
SET @Alamat = '';
SET @JmlKaryawan = 0;
CALL GetUMKMByID(2,@NamaUsaha,@Alamat,@JmlKaryawan);
SELECT @NamaUsaha AS 'nama usaha', @Alamat AS 'alamat usaha', @JmlKaryawan AS 'jumlah karyawan';