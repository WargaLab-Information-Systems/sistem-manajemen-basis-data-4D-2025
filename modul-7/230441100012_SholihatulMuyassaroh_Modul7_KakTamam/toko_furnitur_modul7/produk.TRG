TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER cek_nama_produk\nBEFORE INSERT ON produk\nFOR EACH ROW\nBEGIN\n  IF EXISTS (\n    SELECT 1 FROM produk WHERE nama_produk = NEW.nama_produk\n  ) THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT = \'Nama produk sudah terdaftar.\';\n  END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER cek_harga_zero\nBEFORE UPDATE ON produk\nFOR EACH ROW\nBEGIN\n  IF NEW.harga <= 0 THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT = \'Harga tidak boleh 0.\';\n  END IF;\nEND'
sql_modes=1098907648 1098907648
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1746961209136471 1746962062694552
