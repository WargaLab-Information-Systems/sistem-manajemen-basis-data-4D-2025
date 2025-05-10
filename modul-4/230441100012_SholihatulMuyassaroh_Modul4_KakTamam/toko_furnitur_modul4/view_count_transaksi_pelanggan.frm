TYPE=VIEW
query=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,count(`t`.`id_transaksi`) AS `Jumlah Transaksi` from (`toko_furnitur_modul4`.`transaksi` `t` join `toko_furnitur_modul4`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
md5=302eb2a1687a7238addf380d48ae560f
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001745916306354900
create-version=2
source=SELECT p.nama_pelanggan AS \'Nama Pelanggan\',\nCOUNT(t.id_transaksi) AS \'Jumlah Transaksi\'\nFROM transaksi t\nJOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan\nGROUP BY p.nama_pelanggan
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_pelanggan` AS `Nama Pelanggan`,count(`t`.`id_transaksi`) AS `Jumlah Transaksi` from (`toko_furnitur_modul4`.`transaksi` `t` join `toko_furnitur_modul4`.`pelanggan` `p` on(`t`.`id_pelanggan` = `p`.`id_pelanggan`)) group by `p`.`nama_pelanggan`
mariadb-version=100432
