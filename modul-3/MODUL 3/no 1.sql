
-- soal no 1 --
DELIMITER //
CREATE PROCEDURE AddUMKM (
    IN p_nama_usaha VARCHAR(100),
    IN p_jumlah_karyawan INT
)
BEGIN
    INSERT INTO umkm (nama_usaha, jumlah_karyawan)
    VALUES (p_nama_usaha, p_jumlah_karyawan);
END //
DELIMITER ;

CALL AddUMKM('Toko Fira', 10);
SELECT * FROM umkm;


-- soal no 2 --
DELIMITER //
CREATE PROCEDURE UpdateKategoriUMKM (
    IN p_id_kategori INT,
    IN p_nama_baru VARCHAR(255)
)
BEGIN
    UPDATE kategori_umkm
    SET nama_kategori = p_nama_baru
    WHERE id_kategori = p_id_kategori;
END //
DELIMITER ;
CALL UpdateKategoriUMKM(1, 'Produk Kerajinan');
SELECT * FROM kategori_umkm;

-- soal no 3 --
DELIMITER //
CREATE PROCEDURE DeletePemilikUMKM (
    IN p_id_pemilik INT
)
BEGIN
    DELETE FROM pemilik_umkm
    WHERE id_pemilik = p_id_pemilik;
END //
DELIMITER ;
CALL DeletePemilikUMKM(4);
SELECT * FROM pemilik_umkm;

-- soal no 4 --
DELIMITER //
CREATE PROCEDURE AddProduk (
    IN p_id_umkm INT,
    IN p_nama_produk VARCHAR(255),
    IN p_harga DECIMAL(10,2)
)
BEGIN
    INSERT INTO produk_umkm (id_umkm, nama_produk, harga)
    VALUES (p_id_umkm, p_nama_produk, p_harga);
END //
DELIMITER ;
CALL AddProduk(3, 'Kopi Arabika', 25000.00);
SELECT * FROM produk_umkm;

-- soal no 5 --
DELIMITER //
CREATE PROCEDURE GetUMKMByID (
    IN p_id_umkm INT,
    OUT p_nama_usaha VARCHAR(200),
    OUT p_alamat_usaha TEXT,
    OUT p_nib VARCHAR(50)
)
BEGIN
    SELECT nama_usaha, alamat_usaha, nib
    INTO p_nama_usaha, p_alamat_usaha, p_nib
    FROM umkm
    WHERE id_umkm = p_id_umkm;
END //
DELIMITER ;
SET @nama_usaha := 'yuhu';
SET @alamat := 'yuhuuu';
SET @nib := 'gtuk';

-- Panggil prosedur
CALL GetUMKMByID(2, @nama_usaha, @alamat, @nib);

-- Tampilkan hasil
SELECT @nama_usaha AS NamaUsaha, @alamat AS AlamatUsaha, @nib AS NIB;