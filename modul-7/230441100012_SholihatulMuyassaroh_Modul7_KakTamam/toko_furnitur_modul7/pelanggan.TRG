TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_delete_pelanggan\nBEFORE DELETE ON pelanggan\nFOR EACH ROW\nBEGIN\n  IF EXISTS (SELECT 1 FROM transaksi WHERE id_pelanggan = OLD.id_pelanggan) THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT = \'Pelanggan masih memiliki transaksi, tidak bisa dihapus.\';\n  END IF;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8mb4_general_ci'
created=1746962165112005
