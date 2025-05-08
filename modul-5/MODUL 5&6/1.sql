-- NO 1. Stored Procedure Menampilkan Transaksi berdasarkan Durasi (SEMINGGU / 1 BULAN / 3 BULAN) --

DELIMITER //
CREATE PROCEDURE GetTransaksiByDurasi(IN durasi VARCHAR(20))
BEGIN
    IF durasi = 'SEMINGGU' THEN
        SELECT * FROM Penjualan
        WHERE Tanggal_Penjualan >= CURDATE() - INTERVAL 7 DAY;
    ELSEIF durasi = '1 BULAN' THEN
        SELECT * FROM Penjualan
        WHERE Tanggal_Penjualan >= CURDATE() - INTERVAL 1 MONTH;
    ELSEIF durasi = '3 BULAN' THEN
        SELECT * FROM Penjualan
        WHERE Tanggal_Penjualan >= CURDATE() - INTERVAL 3 MONTH;
    END IF;
END//
DELIMITER ;
CALL GetTransaksiByDurasi('1 BULAN');

-- NO 2.Stored Procedure Menghapus Transaksi Lebih dari 1 Tahun (Jika Valid) --
ALTER TABLE Penjualan ADD STATUS VARCHAR(20) DEFAULT 'Lunas';

DELIMITER //
CREATE PROCEDURE HapusTransaksiLama()
BEGIN
    DELETE FROM Penjualan
    WHERE Tanggal_Penjualan < CURDATE() - INTERVAL 1 YEAR
      AND STATUS = 'Lunas';
END//
DELIMITER ;


-- NO 3.Stored Procedure Mengubah Status pada Minimal 7 Transaksi --
DELIMITER //
CREATE PROCEDURE UpdateStatusTransaksi()
BEGIN
    UPDATE Penjualan
    SET STATUS = 'Sukses'
    WHERE ID_Penjualan IN (
        SELECT ID_Penjualan
        FROM (SELECT ID_Penjualan FROM Penjualan ORDER BY Tanggal_Penjualan LIMIT 7) AS Temp
    );
END//
DELIMITER ;
CALL UpdateStatusTransaksi;
SELECT * FROM penjualan;

-- no.4 Stored Procedure Mengedit Data Pelanggan Jika Tidak Punya Transaksi --
DELIMITER //
CREATE PROCEDURE EditPelanggan(
    IN p_id INT,
    IN p_nama VARCHAR(100),
    IN p_alamat VARCHAR(255),
    IN p_telepon VARCHAR(20),
    IN p_email VARCHAR(100)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Penjualan WHERE ID_Pelanggan = p_id) THEN
        UPDATE Pelanggan
        SET Nama_Pelanggan = p_nama,
            Alamat = p_alamat,
            No_Telepon = p_telepon,
            Email = p_email
        WHERE ID_Pelanggan = p_id;
    END IF;
END//
DELIMITER ;
CALL EditPelanggan(
    4,
    'Pelanggan D Edit',
    'Jl. Baru No. 4',
    '081234567890',
    'editD@example.com'
);
SELECT * FROM Pelanggan WHERE ID_Pelanggan = 4;

-- no 5. Branching: Update Status Berdasarkan Transaksi 1 Bulan Terakhir --
ALTER TABLE Detail_Penjualan ADD STATUS VARCHAR(20);

DELIMITER //
CREATE PROCEDURE UpdateStatusTransaksiBulanTerakhir()
BEGIN
    UPDATE Penjualan
    SET STATUS = 
        CASE 
            WHEN Tanggal_Penjualan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
                THEN 'Aktif'
            ELSE 'Kadaluarsa'
        END;
END //
DELIMITER ;

CALL UpdateStatusTransaksiBulanan;
SELECT ID_Penjualan, Tanggal_Penjualan, STATUS FROM Penjualan;
SELECT * FROM Penjualan WHERE STATUS = 'Aktif';
SELECT * FROM Penjualan WHERE STATUS = 'Kadaluarsa';

-- no 6. Looping: Hitung Jumlah Transaksi Berhasil (1 Bulan Terakhir) --
DELIMITER //
CREATE PROCEDURE HitungTransaksiBerhasil()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE jumlah INT DEFAULT 0;
    DECLARE cur CURSOR FOR 
        SELECT ID_Penjualan FROM Penjualan
        WHERE Tanggal_Penjualan >= CURDATE() - INTERVAL 1 MONTH AND STATUS = 'Sukses';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    baca: LOOP
        FETCH cur INTO jumlah;
        IF done THEN
            LEAVE baca;
        END IF;
        SET jumlah = jumlah + 1;
    END LOOP;
    CLOSE cur;

    SELECT jumlah AS Total_Transaksi_Berhasil;
END //
DELIMITER ;
CALL HitungTransaksiBerhasil;
