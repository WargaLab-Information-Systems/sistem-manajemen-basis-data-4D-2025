TYPE=VIEW
query=select `k`.`nama_kategori` AS `Kategori`,min(`p`.`harga`) AS `Harga Produk Terendah` from (`toko_furnitur`.`produk` `p` join `toko_furnitur`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) group by `k`.`nama_kategori`
md5=232d2988f629d02d2643e0ffb0b0b6eb
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744719188991594
create-version=2
source=SELECT k.nama_kategori AS \'Kategori\', \nMIN(p.harga) AS \'Harga Produk Terendah\'\nFROM produk p\nJOIN kategori k ON p.id_kategori = k.id_kategori\nGROUP BY k.nama_kategori
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `k`.`nama_kategori` AS `Kategori`,min(`p`.`harga`) AS `Harga Produk Terendah` from (`toko_furnitur`.`produk` `p` join `toko_furnitur`.`kategori` `k` on(`p`.`id_kategori` = `k`.`id_kategori`)) group by `k`.`nama_kategori`
mariadb-version=100432
