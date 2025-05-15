TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER kurangi_stok\nAFTER INSERT ON detail_transaksi\nFOR EACH ROW\nBEGIN\n	UPDATE produk SET stok = stok - NEW.jumlah\n	WHERE id_produk = NEW.id_produk;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER update_stok_dan_total\nAFTER UPDATE ON detail_transaksi\nFOR EACH ROW\nBEGIN\n    DECLARE selisih INT;\n\n    -- 1. Kurangi / tambahkan stok produk sesuai selisih jumlah\n    SET selisih = NEW.jumlah - OLD.jumlah;\n    UPDATE produk \n    SET stok = stok - selisih\n    WHERE id_produk = NEW.id_produk;\n\n    -- 2. Update total transaksi (jumlah semua subtotal dari detail_transaksi)\n    UPDATE transaksi \n    SET total = (\n        SELECT SUM(subtotal) \n        FROM detail_transaksi \n        WHERE id_transaksi = NEW.id_transaksi\n    )\n    WHERE id_transaksi = NEW.id_transaksi;\nEND'
sql_modes=1098907648 1098907648
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1746962675537512 1746964249365667
