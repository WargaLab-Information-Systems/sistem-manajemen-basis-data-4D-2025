TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER hapus_detail_transaksi\nAFTER DELETE ON transaksi\nFOR EACH ROW\nBEGIN\n    DELETE FROM detail_transaksi\n    WHERE id_transaksi = OLD.id_transaksi;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8mb4_general_ci'
created=1746965583693856
