TYPE=VIEW
query=select `p`.`nama_produk` AS `Nama Produk`,`p`.`stok` AS `Stok Tersisa` from `toko_furnitur`.`produk` `p` where `p`.`stok` < 5
md5=0a0852ebcc01747dd11f53ae4425a396
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744720421331844
create-version=2
source=SELECT p.nama_produk AS \'Nama Produk\', p.stok AS \'Stok Tersisa\'\nFROM produk p\nWHERE p.stok < 5
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_produk` AS `Nama Produk`,`p`.`stok` AS `Stok Tersisa` from `toko_furnitur`.`produk` `p` where `p`.`stok` < 5
mariadb-version=100432
