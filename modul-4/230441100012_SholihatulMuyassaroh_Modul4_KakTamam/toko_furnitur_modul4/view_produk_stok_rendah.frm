TYPE=VIEW
query=select `p`.`nama_produk` AS `Nama Produk`,`k`.`nama_kategori` AS `Kategori`,`p`.`stok` AS `Stok` from (`toko_furnitur_modul4`.`produk` `p` join `toko_furnitur_modul4`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) where `p`.`stok` < 10
md5=c83f4a781f838054943b9cefff98ef9a
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001745916306320053
create-version=2
source=SELECT p.nama_produk AS \'Nama Produk\', k.nama_kategori AS \'Kategori\', p.stok AS \'Stok\'\nFROM produk p\nJOIN kategori k ON p.id_kategori = k.id_kategori\nWHERE p.stok < 10
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_produk` AS `Nama Produk`,`k`.`nama_kategori` AS `Kategori`,`p`.`stok` AS `Stok` from (`toko_furnitur_modul4`.`produk` `p` join `toko_furnitur_modul4`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) where `p`.`stok` < 10
mariadb-version=100432
