TYPE=VIEW
query=select `t`.`tanggal_transaksi` AS `Tannggal Transaksi`,`p`.`nama_pelanggan` AS `Nama Pelanggan`,`k`.`nama_karyawan` AS `Karyawan yang Melayani`,`t`.`total` AS `Total Pembelian` from ((`toko_furnitur`.`transaksi` `t` join `toko_furnitur`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) join `toko_furnitur`.`karyawan` `k` on(`t`.`id_karyawan` = `k`.`id_karyawan`))
md5=f976046d79640bd6dae39edef3062ad2
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744712315788014
create-version=2
source=SELECT t.tanggal_transaksi as \'Tannggal Transaksi\', p.nama_pelanggan as \'Nama Pelanggan\', k.nama_karyawan as \'Karyawan yang Melayani\', t.total as \'Total Pembelian\'\nFROM transaksi t\nJOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan\nJOIN karyawan k ON t.id_karyawan = k.id_karyawan
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `t`.`tanggal_transaksi` AS `Tannggal Transaksi`,`p`.`nama_pelanggan` AS `Nama Pelanggan`,`k`.`nama_karyawan` AS `Karyawan yang Melayani`,`t`.`total` AS `Total Pembelian` from ((`toko_furnitur`.`transaksi` `t` join `toko_furnitur`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) join `toko_furnitur`.`karyawan` `k` on(`t`.`id_karyawan` = `k`.`id_karyawan`))
mariadb-version=100432
