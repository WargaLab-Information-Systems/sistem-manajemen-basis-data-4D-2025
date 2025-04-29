TYPE=VIEW
query=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,count(`t`.`id_transaksi`) AS `Jumlah Transaksi` from (`toko_furnitur`.`transaksi` `t` join `toko_furnitur`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
md5=4e3bbc67014aa3a68a068b55c83d51fc
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744717238940432
create-version=2
source=SELECT p.nama_pelanggan as \'Nama Pelanggan\',\nCOUNT(t.id_transaksi) AS \'Jumlah Transaksi\'\nFROM transaksi t\nJOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan\nGROUP BY p.nama_pelanggan
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,count(`t`.`id_transaksi`) AS `Jumlah Transaksi` from (`toko_furnitur`.`transaksi` `t` join `toko_furnitur`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
mariadb-version=100432
