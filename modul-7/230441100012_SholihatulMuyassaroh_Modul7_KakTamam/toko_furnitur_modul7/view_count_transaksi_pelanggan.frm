TYPE=VIEW
query=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,count(`t`.`id_transaksi`) AS `Jumlah Transaksi` from (`toko_furnitur_modul7`.`transaksi` `t` join `toko_furnitur_modul7`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
md5=647b48391f2aa45a480f52b8c616b7f1
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001746959982853463
create-version=2
source=SELECT p.nama_pelanggan AS \'Nama Pelanggan\',\nCOUNT(t.id_transaksi) AS \'Jumlah Transaksi\'\nFROM transaksi t\nJOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan\nGROUP BY p.nama_pelanggan
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,count(`t`.`id_transaksi`) AS `Jumlah Transaksi` from (`toko_furnitur_modul7`.`transaksi` `t` join `toko_furnitur_modul7`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
mariadb-version=100432
