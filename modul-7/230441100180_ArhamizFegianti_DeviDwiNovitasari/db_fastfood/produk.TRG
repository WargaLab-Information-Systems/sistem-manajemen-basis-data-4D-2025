TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_update_produk\nBEFORE UPDATE ON produk\nFOR EACH ROW\nBEGIN\n  IF NEW.harga < 0 THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT = \'Harga produk tidak boleh negatif\';\n  END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER after_update_produk_check\nAFTER UPDATE ON produk\nFOR EACH ROW\nBEGIN\n  IF ABS(NEW.harga - OLD.harga) > 20000 THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT = \'Perubahan harga terlalu besar! Coba dicek kembali\';\n  END IF;\nEND'
sql_modes=1098907648 1098907648
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1747135025414109 1747137485567022
