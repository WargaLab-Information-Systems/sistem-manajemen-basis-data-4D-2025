TYPE=VIEW
query=select `k`.`nama_kategori` AS `Nama Kategori`,sum(`d`.`subtotal`) AS `Total Penjualan` from ((`toko_furnitur_modul4`.`detail_transaksi` `d` join `toko_furnitur_modul4`.`produk` `p` on(`d`.`id_produk` = `p`.`id_produk`)) join `toko_furnitur_modul4`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) group by `k`.`nama_kategori`
md5=99d5ad4309fd23678c6acf095d800775
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001745916306336547
create-version=2
source=SELECT k.nama_kategori AS \'Nama Kategori\',\nSUM(d.subtotal) AS \'Total Penjualan\'\nFROM detail_transaksi d\nJOIN produk p ON d.id_produk = p.id_produk\nJOIN kategori k ON p.id_kategori = k.id_kategori\nGROUP BY k.nama_kategori
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `k`.`nama_kategori` AS `Nama Kategori`,sum(`d`.`subtotal`) AS `Total Penjualan` from ((`toko_furnitur_modul4`.`detail_transaksi` `d` join `toko_furnitur_modul4`.`produk` `p` on(`d`.`id_produk` = `p`.`id_produk`)) join `toko_furnitur_modul4`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) group by `k`.`nama_kategori`
mariadb-version=100432
