TYPE=VIEW
query=select `u`.`nama_usaha` AS `Nama Usaha`,`p`.`nama_lengkap` AS `Nama Pemilik`,`u`.`total_aset` AS `Total Asset`,`u`.`omzet_per_tahun` AS `Omzet Per Tahun` from (`umkm_jabar`.`umkm` `u` join `umkm_jabar`.`pemilik_umkm` `p` on(`u`.`id_pemilik` = `p`.`id_pemilik`)) where `u`.`id_skala` = 3
md5=271897fdad681d0b48244932244e9c49
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744710318257309
create-version=2
source=SELECT u.nama_usaha as \'Nama Usaha\', p.nama_lengkap AS \'Nama Pemilik\', u.total_aset as \'Total Asset\', u.omzet_per_tahun as \'Omzet Per Tahun\'\nFROM umkm u\nJOIN pemilik_umkm p ON u.id_pemilik = p.id_pemilik\nWHERE u.id_skala = 3
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `u`.`nama_usaha` AS `Nama Usaha`,`p`.`nama_lengkap` AS `Nama Pemilik`,`u`.`total_aset` AS `Total Asset`,`u`.`omzet_per_tahun` AS `Omzet Per Tahun` from (`umkm_jabar`.`umkm` `u` join `umkm_jabar`.`pemilik_umkm` `p` on(`u`.`id_pemilik` = `p`.`id_pemilik`)) where `u`.`id_skala` = 3
mariadb-version=100432
