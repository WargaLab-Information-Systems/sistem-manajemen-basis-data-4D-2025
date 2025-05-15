TYPE=VIEW
query=select `t`.`tanggal_transaksi` AS `Tannggal Transaksi`,`p`.`nama_pelanggan` AS `Nama Pelanggan`,`k`.`nama_karyawan` AS `Karyawan yang Melayani`,`t`.`total` AS `Total Pembelian` from ((`toko_furnitur_modul4`.`transaksi` `t` join `toko_furnitur_modul4`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) join `toko_furnitur_modul4`.`karyawan` `k` on(`t`.`id_karyawan` = `k`.`id_karyawan`))
md5=8a96160056df826412bec6afd78f215e
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001745916306302725
create-version=2
source=SELECT t.tanggal_transaksi AS \'Tannggal Transaksi\', p.nama_pelanggan AS \'Nama Pelanggan\', k.nama_karyawan AS \'Karyawan yang Melayani\', t.total AS \'Total Pembelian\'\nFROM transaksi t\nJOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan\nJOIN karyawan k ON t.id_karyawan = k.id_karyawan
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `t`.`tanggal_transaksi` AS `Tannggal Transaksi`,`p`.`nama_pelanggan` AS `Nama Pelanggan`,`k`.`nama_karyawan` AS `Karyawan yang Melayani`,`t`.`total` AS `Total Pembelian` from ((`toko_furnitur_modul4`.`transaksi` `t` join `toko_furnitur_modul4`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) join `toko_furnitur_modul4`.`karyawan` `k` on(`t`.`id_karyawan` = `k`.`id_karyawan`))
mariadb-version=100432
