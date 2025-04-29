TYPE=VIEW
query=select `p`.`nama_produk` AS `Nama Produk`,`k`.`nama_kategori` AS `Kategori`,`p`.`harga` AS `Harga` from (`toko_furnitur`.`produk` `p` join `toko_furnitur`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`))
md5=7734517834e8b2db20619f7ea0655e6b
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744711816402350
create-version=2
source=SELECT p.nama_produk as \'Nama Produk\', k.nama_kategori as \'Kategori\', p.harga as \'Harga\'\nFROM produk p\nJOIN kategori k ON p.id_kategori = k.id_kategori
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_produk` AS `Nama Produk`,`k`.`nama_kategori` AS `Kategori`,`p`.`harga` AS `Harga` from (`toko_furnitur`.`produk` `p` join `toko_furnitur`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`))
mariadb-version=100432
