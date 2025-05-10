DELIMITER //
CREATE PROCEDURE AddUMKM(
    IN nama_usahaa VARCHAR(200),
    IN jumlahh_karyawan INT(11)
)
BEGIN
    INSERT INTO umkm (nama_usaha,id_pemilik,id_kategori,id_skala,id_kabupaten_kota,alamat_usaha, nib,npwp,tahun_berdiri,jumlah_karyawan,total_aset,omzet_per_tahun,deskripsi_usaha,tanggal_registrasi)
    VALUES(nama_usahaa, 1, 1, 1, 1, 'jalan hitam', '9120001234567', '09.876.543.2-123.000', 2023, jumlahh_karyawan, 30000000, 200000000, 'Deskripsi usaha', '2025-05-01');
    SELECT * FROM umkm WHERE nama_usaha = nama_usahaa AND jumlah_karyawan = jumlahh_karyawan;
END //
DELIMITER ;
CALL AddUMKM('warung ambaquarium', 5);
DROP PROCEDURE AddUMKM;


DELIMITER //
CREATE PROCEDURE UpdateKategoriUMKM(
    IN id_kategori INT(11),
    IN nama_baru VARCHAR(100)
)
BEGIN
    UPDATE kategori_umkm SET nama_kategori = nama_baru WHERE kategori_umkm.id_kategori = id_kategori;
    SELECT * FROM kategori_umkm WHERE kategori_umkm.id_kategori = id_kategori;
END //
DELIMITER ;
CALL UpdateKategoriUMKM(1, 'Kuliner dan Minuman');
DROP PROCEDURE UpdateKategoriUMKM;


DELIMITER //
CREATE PROCEDURE DeletePemilikUMKM(
    IN id_pemilik INT(11)
)
BEGIN
    DELETE FROM pemilik_umkm WHERE pemilik_umkm.id_pemilik = id_pemilik;
    SELECT * FROM pemilik_umkm;
END //
DELIMITER ;
CALL DeletePemilikUMKM(15);
DROP PROCEDURE DeletePemilikUMKM;


DELIMITER //
CREATE PROCEDURE AddProduk(
    IN id_umkmm INT(11),
    IN nama_produkk VARCHAR(200),
    IN hargaa DECIMAL(15,2)
)
BEGIN
    INSERT INTO produk_umkm (id_umkm,nama_produk,deskripsi_produk,harga)VALUES(id_umkmm,nama_produkk,'Deskripsi produk',hargaa);
    SELECT * FROM produk_umkm WHERE nama_produk = nama_produkk;
END //
DELIMITER ;
CALL AddProduk(1, 'Sambel Hejo Level 11', 25000);
DROP PROCEDURE AddProduk;



DELIMITER //
CREATE PROCEDURE GetUMKMByID(
    IN id_umkmm INT(11),
    OUT jumlah_produk INT
)
BEGIN
    SELECT * FROM umkm WHERE id_umkm = id_umkmm;
    SELECT COUNT(*) INTO jumlah_produk FROM produk_umkm WHERE id_umkm = id_umkmm;
END //
DELIMITER ;
SET @jumlah_produk = 0;
CALL GetUMKMByID(1, @jumlah_produk);
SELECT @jumlah_produk AS 'Jumlah Produk';