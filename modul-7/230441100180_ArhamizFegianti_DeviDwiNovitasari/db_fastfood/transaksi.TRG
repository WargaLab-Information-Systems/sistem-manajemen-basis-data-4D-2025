TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER after_insert_transaksi_check\nAFTER INSERT ON transaksi\nFOR EACH ROW\nBEGIN\n  -- Contoh: beri peringatan kalau status tidak \'lunas\' setelah insert\n  IF NEW.status != \'lunas\' THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT = \'Perhatian: Transaksi yang baru ditambahkan belum lunas\';\n  END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER after_delete_transaksi\nAFTER DELETE ON transaksi\nFOR EACH ROW\nBEGIN\nINSERT INTO arsip_transaksi (\nid_transaksi, id_pegawai, id_customer, id_produk,\ntanggal, total, status\n)\nVALUES (\nOLD.id_transaksi, OLD.id_pegawai, OLD.id_customer, OLD.id_produk,\nOLD.tanggal, OLD.total, OLD.status\n);\nEND'
sql_modes=1098907648 1098907648
definers='root@localhost' 'root@localhost'
client_cs_names='utf8' 'utf8'
connection_cl_names='utf8_general_ci' 'utf8_general_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1747136784235149 1747142069669500
