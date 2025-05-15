TYPE=VIEW
query=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,avg(`t`.`total`) AS `Rata-Rata Pengeluaran` from (`toko_furnitur_modul7`.`transaksi` `t` join `toko_furnitur_modul7`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
md5=a955cba3bef82fcdc55e1d71802cd94f
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001746959982882969
create-version=2
source=SELECT p.nama_pelanggan AS \'Nama Pelanggan\',\nAVG(t.total) AS \'Rata-Rata Pengeluaran\'\nFROM transaksi t\nJOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan\nGROUP BY p.nama_pelanggan
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,avg(`t`.`total`) AS `Rata-Rata Pengeluaran` from (`toko_furnitur_modul7`.`transaksi` `t` join `toko_furnitur_modul7`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
mariadb-version=100432
