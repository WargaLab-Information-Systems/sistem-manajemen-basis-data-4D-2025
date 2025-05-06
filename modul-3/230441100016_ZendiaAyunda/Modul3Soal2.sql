USE db_toko_baju;
-- Modul 3 - Soal 2
-- No 1 memperbarui nilai tertentu dalam tabel 
DELIMITER //
CREATE PROCEDURE UpdateDataMaster(
    IN p_tabel VARCHAR(50),
    IN p_id INT,
    IN p_nilai_baru VARCHAR(255),
    OUT p_status VARCHAR(100)
)
BEGIN
    IF p_tabel = 'data_pelanggan' THEN
        UPDATE data_pelanggan SET nama = p_nilai_baru WHERE id_pelanggan = p_id;
        SET p_status = 'Nama pelanggan berhasil diUpdate';

    ELSEIF p_tabel = 'data_produk' THEN
        UPDATE data_produk SET harga = CAST(p_nilai_baru AS DECIMAL(10,2)) WHERE id_produk = p_id;
        SET p_status = 'Harga produk berhasil diUpdate';

    ELSE
        SET p_status = 'Tabel tidak valid';
    END IF;
END//
DELIMITER ;

CALL UpdateDataMaster('data_pelanggan', 1, 'Sindy Aulia', @status);
SELECT @status;
CALL UpdateDataMaster('data_produk', 2, '175000', @status);
SELECT @status;

SELECT * FROM data_pelanggan;
SELECT * FROM data_produk;

DROP PROCEDURE IF EXISTS UpdateDataMaster;

-- No 2 tidak menerima parameter dan mengembalikan jumlah total entri yang terdaftar
DELIMITER //
CREATE PROCEDURE CountTransaksi(OUT total_transaksi INT)
BEGIN
    SELECT COUNT(*) INTO total_transaksi FROM data_transaksi;
END//
DELIMITER ;

CALL CountTransaksi(@hasil);
SELECT @hasil;

-- No 3 Menerima parameter id dan mengembalikan data berdasarkan id
DELIMITER //
CREATE PROCEDURE GetDataMasterByID(
    IN p_id INT,
    OUT p_nama VARCHAR(100),
    OUT p_email VARCHAR(100),
    OUT p_no_hp VARCHAR(15),
    OUT p_alamat TEXT
)
BEGIN
    SELECT nama, email, no_hp, alamat
    INTO p_nama, p_email, p_no_hp, p_alamat
    FROM data_pelanggan
    WHERE id_pelanggan = p_id;
END//
DELIMITER ;

CALL GetDataMasterByID(1, @nama, @email, @no_hp, @alamat);

SELECT 
    @nama AS Nama,
    @email AS Email,
    @no_hp AS 'No HP',
    @alamat AS Alamat;

-- No 4 memperbarui nilai dari dua kolom dalam tabel transaksi berdasarkan ID
DELIMITER //
CREATE PROCEDURE UpdateFieldTransaksi(
    IN p_id INT,
    INOUT p_tanggal DATE,
    INOUT p_total DECIMAL(10,2))
BEGIN
    DECLARE curr_tanggal DATE;
    DECLARE curr_total DECIMAL(10,2);

    -- Ambil data saat ini dari database
    SELECT tanggal_transaksi, total_harga
    INTO curr_tanggal, curr_total
    FROM data_transaksi
    WHERE id_transaksi = p_id;

    -- Jika parameter kosong/null, tetap gunakan nilai yang lama
    IF p_tanggal IS NULL OR p_tanggal = '' THEN
        SET p_tanggal = curr_tanggal;
    END IF;

    IF p_total IS NULL THEN
        SET p_total = curr_total;
    END IF;

    -- Lakukan update
    UPDATE data_transaksi
    SET tanggal_transaksi = p_tanggal,
        total_harga = p_total
    WHERE id_transaksi = p_id;
END//
DELIMITER ;

-- Siapkan variabel
SET @tanggal = NULL;           -- NULL artinya tidak diubah
SET @total = 999999.99;        -- Nilai baru yang mau di-update

-- Panggil prosedur
CALL UpdateFieldTransaksi(1, @tanggal, @total);

-- Lihat hasilnya
SELECT @tanggal, @total;

-- No 5 menghapus entri yang terkait berdasarkan ID
DELIMITER //
CREATE PROCEDURE DeleteEntriesByIDMaster(
    IN p_id INT
)
BEGIN
    DELETE FROM data_produk
    WHERE id_produk = p_id;
END//
DELIMITER ;

CALL DeleteEntriesByIDMaster(2);
SELECT * FROM data_produk;

DROP DATABASE db_toko_baju;