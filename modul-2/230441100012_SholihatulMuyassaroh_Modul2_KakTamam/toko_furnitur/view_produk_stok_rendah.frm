TYPE=VIEW
query=select `p`.`nama_produk` AS `Nama Produk`,`k`.`nama_kategori` AS `Kategori`,`p`.`stok` AS `Stok` from (`toko_furnitur`.`produk` `p` join `toko_furnitur`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) where `p`.`stok` < 10
md5=14eba787c4456ea57ed88be2b429ebf3
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744712524135618
create-version=2
source=SELECT p.nama_produk as \'Nama Produk\', k.nama_kategori As \'Kategori\', p.stok as \'Stok\'\nFROM produk p\nJOIN kategori k ON p.id_kategori = k.id_kategori\nWHERE p.stok < 10
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_produk` AS `Nama Produk`,`k`.`nama_kategori` AS `Kategori`,`p`.`stok` AS `Stok` from (`toko_furnitur`.`produk` `p` join `toko_furnitur`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) where `p`.`stok` < 10
mariadb-version=100432
