USE toko_furnitur_modul7;

-- 1. BEFORE INSERT – Cek apakah nama produk sudah ada
DELIMITER //
CREATE TRIGGER cek_nama_produk
BEFORE INSERT ON produk
FOR EACH ROW
BEGIN
  IF EXISTS (
    SELECT 1 FROM produk WHERE nama_produk = NEW.nama_produk
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Nama produk sudah terdaftar.';
  END IF;
END; //
DELIMITER ;

INSERT INTO produk (id_produk, nama_produk) VALUES 
('p20', 'lemari kaca');;

-- 2. BEFORE UPDATE – Cegah harga diubah jadi 0 atau negatif
DELIMITER //
CREATE TRIGGER cek_harga_zero
BEFORE UPDATE ON produk
FOR EACH ROW
BEGIN
  IF NEW.harga <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Harga tidak boleh 0.';
  END IF;
END; //
DELIMITER ;

UPDATE produk SET harga = -5 WHERE id_produk = 'p01';

-- 3. BEFORE DELETE – Cegah penghapusan pelanggan jika masih memiliki transaksi
DELIMITER //
CREATE TRIGGER before_delete_pelanggan
BEFORE DELETE ON pelanggan
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM transaksi WHERE id_pelanggan = OLD.id_pelanggan) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Pelanggan masih memiliki transaksi, tidak bisa dihapus.';
  END IF;
END; //
DELIMITER ;

DELETE FROM pelanggan WHERE id_pelanggan = 'c01';

-- 4. AFTER INSERT - stok produk berkurang otomatis jika menambahkan pembelian
DELIMITER//
CREATE TRIGGER kurangi_stok
AFTER INSERT ON detail_transaksi
FOR EACH ROW
BEGIN
	UPDATE produk SET stok = stok - NEW.jumlah
	WHERE id_produk = NEW.id_produk;
END//
DELIMITER;

INSERT INTO transaksi VALUES
('t10','c04','ky02', '2025-05-09',350000);
INSERT INTO detail_transaksi VALUES 
(16, 't10','p11','1',350000);

-- 5. AFTER UPDATE - update stok produk sesuai perubahan di jumlah pembelian sekaligus update total di transaksinya.
DELIMITER //
CREATE TRIGGER update_stok_dan_total
AFTER UPDATE ON detail_transaksi
FOR EACH ROW
BEGIN
    DECLARE selisih INT;

    -- Kurang/tambah stok sesuai selisih
    SET selisih = NEW.jumlah - OLD.jumlah;
    UPDATE produk 
    SET stok = stok - selisih
    WHERE id_produk = NEW.id_produk;

    -- Update total transaksi (jumlah semua subtotal dari detail_transaksi)
    UPDATE transaksi 
    SET total = (
        SELECT SUM(subtotal) 
        FROM detail_transaksi 
        WHERE id_transaksi = NEW.id_transaksi
    )
    WHERE id_transaksi = NEW.id_transaksi;
END//
DELIMITER ;

UPDATE detail_transaksi 
SET jumlah = 2, subtotal = 2 * 350000 
WHERE id_detail = 16;

-- 6. AFTER DELETE - jika ada data yg dihapus di tabel transaksi, data dengan id_transaksi yang sama di tabel detail_transaksi akan ikut terhapus 
DELIMITER //
CREATE TRIGGER hapus_detail_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    DELETE FROM detail_transaksi
    WHERE id_transaksi = OLD.id_transaksi;
END//
DELIMITER ;

DELETE FROM transaksi WHERE id_transaksi = 't10';