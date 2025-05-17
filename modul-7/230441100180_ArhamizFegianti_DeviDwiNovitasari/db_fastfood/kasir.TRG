TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_delete_kasir\nBEFORE DELETE ON kasir\nFOR EACH ROW\nBEGIN\n  IF EXISTS (SELECT 1 FROM transaksi WHERE id_pegawai = OLD.id_pegawai) THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT = \'Kasir masih memiliki transaksi\';\n  END IF;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8mb4_general_ci'
created=1747134996328374
