TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_insert_customer\nBEFORE INSERT ON customer\nFOR EACH ROW\nBEGIN\n  IF NEW.no_hp IS NULL OR TRIM(NEW.no_hp) = \'\' THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT = \'Nomor HP tidak boleh kosong\';\n  END IF;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='utf8mb4_general_ci'
created=1747135150423038
