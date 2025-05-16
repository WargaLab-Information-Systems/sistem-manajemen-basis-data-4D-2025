USE Tokosepatu ;
DELIMITER //

-- soal 1
CREATE PROCEDURE TampilkanTransaksiLama(
    IN pilihan VARCHAR(10)
)
BEGIN
    DECLARE rentang INT;

    IF pilihan = 'SEMINGGU' THEN
        SET rentang = 7;
    ELSEIF pilihan = '1 BULAN' THEN
        SET rentang = 30;
    ELSEIF pilihan = '3 BULAN' THEN
        SET rentang = 90;
    END IF;

    SELECT * FROM Transaksi
    WHERE Tanggal >= CURDATE() - INTERVAL rentang DAY;
END //

DELIMITER ;

CALL TampilkanTransaksiLama('SEMINGGU');
CALL TampilkanTransaksiLama('1 BULAN');
CALL TampilkanTransaksiLama('3 BULAN');

-- soal 2

DELIMITER //

CREATE OR REPLACE PROCEDURE HapusTransaksiLama()
BEGIN
    DELETE FROM Transaksi
    WHERE Tanggal < CURDATE() - INTERVAL 1 YEAR
    AND (STATUS IS NULL OR STATUS NOT IN ('Belum Lunas', 'Belum Bayar'));
END //

DELIMITER ;

CALL HapusTransaksiLama();
SELECT * FROM Transaksi;

-- soal 3
DELIMITER //

CREATE OR REPLACE PROCEDURE UbahStatusTransaksi()
BEGIN
    UPDATE Transaksi
    SET STATUS = 'Sukses'
    WHERE ID_Transaksi IN (
        SELECT ID_Transaksi FROM (
            SELECT ID_Transaksi
            FROM Transaksi
            ORDER BY Tanggal DESC
            LIMIT 7
        ) AS recent_trans
    );
END //

DELIMITER ;

CALL UbahStatusTransaksi();
SELECT ROW_COUNT() AS BarisTerubah;

SELECT * FROM Transaksi
ORDER BY Tanggal DESC
LIMIT 10;


-- soal 4

DELIMITER //

CREATE OR REPLACE PROCEDURE EditUser(
    IN id_user INT,
    IN nama_baru VARCHAR(100),
    IN alamat_baru VARCHAR(200),
    IN nohp_baru VARCHAR(15)
)
BEGIN
    UPDATE Pelanggan
    SET Nama = nama_baru,
        Alamat = alamat_baru,
        NoHP = nohp_baru
    WHERE ID_Pelanggan = id_user;
END //

DELIMITER ;


-- Panggil prosedur
CALL EditUser(3, 'Dika', 'Jakarta', '081234567890');

-- Cek apakah pelanggan punya transaksi
SELECT * FROM Transaksi WHERE ID_Pelanggan = 3;

-- Lihat hasil perubahan
SELECT * FROM Pelanggan WHERE ID_Pelanggan = 3;

SELECT * FROM Pelanggan ;

-- soal 5
DELIMITER //

CREATE OR REPLACE PROCEDURE UpdateStatusTransaksi()
BEGIN
    DECLARE id_min INT;
    DECLARE id_max INT;
    DECLARE jumlah_min INT;
    DECLARE jumlah_max INT;

    -- Ambil transaksi 1 bulan terakhir dengan jumlah paling kecil (id_min)
    SELECT ID_Transaksi, Jumlah INTO id_min, jumlah_min
    FROM Transaksi
    WHERE Tanggal >= CURDATE() - INTERVAL 1 MONTH
    ORDER BY Jumlah ASC
    LIMIT 1;

    -- Ambil transaksi 1 bulan terakhir dengan jumlah paling besar (id_max)
    SELECT ID_Transaksi, Jumlah INTO id_max, jumlah_max
    FROM Transaksi
    WHERE Tanggal >= CURDATE() - INTERVAL 1 MONTH
    ORDER BY Jumlah DESC
    LIMIT 1;

    -- Update status transaksi jumlah paling sedikit menjadi "non-aktif"
    UPDATE Transaksi SET STATUS = 'Non-Aktif' 
    WHERE ID_Transaksi = id_min;

    -- Update status transaksi jumlah paling besar menjadi "aktif"
    UPDATE Transaksi SET STATUS = 'Aktif' 
    WHERE ID_Transaksi = id_max;

    -- Update status transaksi lain dalam rentang 1 bulan menjadi "pasif"
    UPDATE Transaksi SET STATUS = 'Pasif' 
    WHERE Tanggal >= CURDATE() - INTERVAL 1 MONTH
    AND ID_Transaksi NOT IN (id_min, id_max);
END //

DELIMITER ;

CALL UpdateStatusTransaksi();

SELECT * FROM Transaksi WHERE Tanggal >= CURDATE() - INTERVAL 1 MONTH;

 -- soal 6
 DELIMITER //

CREATE PROCEDURE HitungTransaksiBerhasil()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE total INT DEFAULT 0;
    DECLARE cur CURSOR FOR
        SELECT COUNT(*) FROM Transaksi
        WHERE STATUS = 'Sukses' AND Tanggal >= CURDATE() - INTERVAL 1 MONTH;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO total;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Jumlah transaksi berhasil: ', total) AS Info;
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;

CALL HitungTransaksiBerhasil();











