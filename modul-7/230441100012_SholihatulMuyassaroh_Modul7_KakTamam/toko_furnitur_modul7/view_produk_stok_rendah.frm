TYPE=VIEW
query=select `p`.`nama_produk` AS `Nama Produk`,`k`.`nama_kategori` AS `Kategori`,`p`.`stok` AS `Stok` from (`toko_furnitur_modul7`.`produk` `p` join `toko_furnitur_modul7`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) where `p`.`stok` < 10
md5=35b2c7808ff90dbbeab4dd6bfc4f0290
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001746959982778509
create-version=2
source=SELECT p.nama_produk AS \'Nama Produk\', k.nama_kategori AS \'Kategori\', p.stok AS \'Stok\'\nFROM produk p\nJOIN kategori k ON p.id_kategori = k.id_kategori\nWHERE p.stok < 10
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_produk` AS `Nama Produk`,`k`.`nama_kategori` AS `Kategori`,`p`.`stok` AS `Stok` from (`toko_furnitur_modul7`.`produk` `p` join `toko_furnitur_modul7`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) where `p`.`stok` < 10
mariadb-version=100432
