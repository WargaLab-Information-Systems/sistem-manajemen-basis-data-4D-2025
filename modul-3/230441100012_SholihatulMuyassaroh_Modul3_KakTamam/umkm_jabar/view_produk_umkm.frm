TYPE=VIEW
query=select `u`.`nama_usaha` AS `Nama Usaha`,`p`.`nama_produk` AS `Nama Produk`,`p`.`deskripsi_produk` AS `Deskripsi Produk`,`p`.`harga` AS `Harga Produk` from (`umkm_jabar`.`umkm` `u` join `umkm_jabar`.`produk_umkm` `p` on(`u`.`id_umkm` = `p`.`id_umkm`))
md5=88b1a4b34d3ccea68971554cf8e31ca8
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744709792627747
create-version=2
source=select u.nama_usaha as \'Nama Usaha\', p.nama_produk as \'Nama Produk\', p.deskripsi_produk as \'Deskripsi Produk\', p.harga as \'Harga Produk\'\nfrom umkm u join produk_umkm p on u.id_umkm = p.id_umkm
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `u`.`nama_usaha` AS `Nama Usaha`,`p`.`nama_produk` AS `Nama Produk`,`p`.`deskripsi_produk` AS `Deskripsi Produk`,`p`.`harga` AS `Harga Produk` from (`umkm_jabar`.`umkm` `u` join `umkm_jabar`.`produk_umkm` `p` on(`u`.`id_umkm` = `p`.`id_umkm`))
mariadb-version=100432
