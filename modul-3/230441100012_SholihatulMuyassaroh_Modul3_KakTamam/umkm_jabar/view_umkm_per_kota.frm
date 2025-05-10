TYPE=VIEW
query=select `kk`.`nama_kabupaten_kota` AS `Kabupaten/Kota`,count(`u`.`id_umkm`) AS `Jumlah Umkm` from (`umkm_jabar`.`umkm` `u` join `umkm_jabar`.`kabupaten_kota` `kk` on(`u`.`id_kabupaten_kota` = `kk`.`id_kabupaten_kota`)) group by `kk`.`nama_kabupaten_kota`
md5=a7ca824f1469514c13afaad225108200
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744711339200579
create-version=2
source=SELECT kk.nama_kabupaten_kota as \'Kabupaten/Kota\',\nCOUNT(u.id_umkm) AS \'Jumlah Umkm\'\nFROM umkm u\nJOIN kabupaten_kota kk ON u.id_kabupaten_kota = kk.id_kabupaten_kota\nGROUP BY kk.nama_kabupaten_kota
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `kk`.`nama_kabupaten_kota` AS `Kabupaten/Kota`,count(`u`.`id_umkm`) AS `Jumlah Umkm` from (`umkm_jabar`.`umkm` `u` join `umkm_jabar`.`kabupaten_kota` `kk` on(`u`.`id_kabupaten_kota` = `kk`.`id_kabupaten_kota`)) group by `kk`.`nama_kabupaten_kota`
mariadb-version=100432
