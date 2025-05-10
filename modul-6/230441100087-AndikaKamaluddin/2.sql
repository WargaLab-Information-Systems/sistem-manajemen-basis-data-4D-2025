DELIMITER //
CREATE PROCEDURE tampilkan_transaksi()
BEGIN
    SELECT * FROM transaksi
    WHERE tanggal_transaksi >= CURDATE() - INTERVAL 1 MONTH;
END //
DELIMITER ;
CALL tampilkan_transaksi();


DELIMITER //
CREATE PROCEDURE hapus_transaksi_lama()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi < CURDATE() - INTERVAL 1 YEAR
    AND STATUS = 'valid';
END //
DELIMITER ;
CALL hapus_transaksi_lama();
SELECT * FROM transaksi;


DELIMITER //
CREATE PROCEDURE ubah_status_valid()
BEGIN
    UPDATE transaksi
    SET STATUS = 'sukses'
    WHERE id_transaksi IN (
        SELECT id_transaksi FROM (
            SELECT id_transaksi
            FROM transaksi
            WHERE STATUS = 'valid'
        ) AS temp
    );
END //
DELIMITER ;
CALL ubah_status_valid();
SELECT * FROM transaksi;


DELIMITER //
CREATE PROCEDURE edit_user(
    IN uid INT,
    IN nama_baru VARCHAR(50),
    IN email_baru VARCHAR(100)
)
BEGIN
    UPDATE users
    SET nama_user = nama_baru,
        email = email_baru
    WHERE id_user = uid
    AND uid NOT IN (SELECT id_user FROM transaksi);
END //
DELIMITER ;
CALL edit_user(15, 'anyar', 'anyar@example.com');
SELECT * FROM users


DROP PROCEDURE update_status
DELIMITER //
CREATE PROCEDURE update_status()
BEGIN
    DECLARE min_jumlah INT;
    DECLARE max_jumlah INT;
    DECLARE tengah_jumlah INT;

    SELECT MIN(jumlah) INTO min_jumlah 
    FROM transaksi 
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

    SELECT MAX(jumlah) INTO max_jumlah 
    FROM transaksi 
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

    SELECT jumlah INTO tengah_jumlah
    FROM transaksi 
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
      AND jumlah <> min_jumlah
      AND jumlah <> max_jumlah
    LIMIT 1;

    IF min_jumlah IS NOT NULL THEN
        UPDATE transaksi 
        SET STATUS = 'non-aktif' 
        WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
          AND jumlah = min_jumlah;
    END IF;

    IF tengah_jumlah IS NOT NULL THEN
        UPDATE transaksi 
        SET STATUS = 'pasif' 
        WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
          AND jumlah = tengah_jumlah;
    END IF;

    IF max_jumlah IS NOT NULL THEN
        UPDATE transaksi 
        SET STATUS = 'aktif' 
        WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
          AND jumlah = max_jumlah;
    END IF;
END //
DELIMITER ;
CALL update_status();
SELECT * FROM transaksi


DROP PROCEDURE hitung_transaksi_sukses;
DELIMITER //
CREATE PROCEDURE hitung_transaksi_sukses()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE total INT DEFAULT 0;
    DECLARE max_id INT;

    SELECT MAX(id_transaksi) INTO max_id FROM transaksi;

    WHILE i <= max_id DO
        IF EXISTS (
            SELECT 1 FROM transaksi
            WHERE id_transaksi = i
            AND STATUS = 'sukses'
            AND tanggal_transaksi >= CURDATE() - INTERVAL 1 MONTH
        ) THEN
            SET total = total + 1;
        END IF;
        SET i = i + 1;
    END WHILE;
    
    SELECT id_transaksi,id_user,nama_transaksi FROM transaksi WHERE STATUS = 'sukses' AND tanggal_transaksi >= CURDATE() - INTERVAL 1 MONTH
END //
DELIMITER ;
CALL hitung_transaksi_sukses();
SELECT * FROM transaksi

