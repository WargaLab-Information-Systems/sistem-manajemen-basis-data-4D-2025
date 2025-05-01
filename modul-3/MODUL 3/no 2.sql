-- no 1 --
DELIMITER //
CREATE PROCEDURE UpdateDataMaster(
    IN p_id INT,
    IN p_nilai_baru DECIMAL(10,2),
    OUT p_status INT
)
BEGIN
    DECLARE v_exists INT;
    SELECT COUNT(*) INTO v_exists FROM Produk_Kertas WHERE ID_Produk = p_id;
    IF v_exists = 1 THEN
        UPDATE Produk_Kertas SET Harga = p_nilai_baru WHERE ID_Produk = p_id;
        SET p_status = 1;
    ELSE
        SET p_status = 0;
    END IF;
END //
DELIMITER ;
CALL UpdateDataMaster(1, 7500.00, @status);
SELECT @status;

-- no 2 --
DELIMITER //
CREATE PROCEDURE CountTransaksi(OUT total_transaksi INT)
BEGIN
    SELECT COUNT(*) INTO total_transaksi FROM Penjualan;
END //
DELIMITER ;
CALL CountTransaksi(@total);
SELECT @total;

-- no 3 --
DELIMITER //
CREATE PROCEDURE GetDataMasterByID(
    IN p_id INT,
    OUT p_nama_produk VARCHAR(100),
    OUT p_tipe VARCHAR(50),
    OUT p_harga DECIMAL(10,2),
    OUT p_stok INT
)
BEGIN
    SELECT Nama_Produk, Tipe, Harga, Stok
    INTO p_nama_produk, p_tipe, p_harga, p_stok
    FROM Produk_Kertas WHERE ID_Produk = p_id;
END //
DELIMITER ;
CALL GetDataMasterByID(2, @nama, @tipe, @harga, @stok);
SELECT @nama, @tipe, @harga, @stok;

-- no 4 --
DELIMITER //
CREATE PROCEDURE UpdateFieldTransaksi(
    IN p_id INT,
    INOUT p_total DECIMAL(10,2),
    INOUT p_tanggal DATE
)
BEGIN
    DECLARE v_total DECIMAL(10,2);
    DECLARE v_tanggal DATE;
    SELECT Total_Harga, Tanggal_Penjualan 
    INTO v_total, v_tanggal 
    FROM Penjualan 
    WHERE ID_Penjualan = p_id;
    IF p_total IS NULL OR p_total = 0 THEN
        SET p_total = v_total;
    END IF;
    IF p_tanggal IS NULL THEN
        SET p_tanggal = v_tanggal;
    END IF;
    UPDATE Penjualan
    SET Total_Harga = p_total,
        Tanggal_Penjualan = p_tanggal
    WHERE ID_Penjualan = p_id;
END //
DELIMITER ;
SET @total = NULL;
SET @tgl = '2025-04-10';
CALL UpdateFieldTransaksi(1, @total, @tgl);
SELECT @total, @tgl;

-- no 5 --
DELIMITER //
CREATE PROCEDURE DeleteEntriesByIDMaster(
    IN p_id INT
)
BEGIN
    DELETE FROM Produk_Kertas WHERE ID_Produk = p_id;
END //
DELIMITER ;
CALL DeleteEntriesByIDMaster(10);
SELECT * FROM Produk_Kertas;