TYPE=VIEW
query=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,avg(`t`.`total`) AS `Rata-Rata Pengeluaran` from (`toko_furnitur_modul4`.`transaksi` `t` join `toko_furnitur_modul4`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
md5=ad4095d38e59806612aab7cef8274697
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001745916306371663
create-version=2
source=SELECT p.nama_pelanggan AS \'Nama Pelanggan\',\nAVG(t.total) AS \'Rata-Rata Pengeluaran\'\nFROM transaksi t\nJOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan\nGROUP BY p.nama_pelanggan
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,avg(`t`.`total`) AS `Rata-Rata Pengeluaran` from (`toko_furnitur_modul4`.`transaksi` `t` join `toko_furnitur_modul4`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
mariadb-version=100432
