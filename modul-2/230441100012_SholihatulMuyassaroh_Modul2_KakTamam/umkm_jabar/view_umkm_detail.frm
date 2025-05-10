TYPE=VIEW
query=select `u`.`nama_usaha` AS `Nama Usaha`,`p`.`nama_lengkap` AS `Nama Pemilik`,`k`.`nama_kategori` AS `kategori Umkm`,`s`.`nama_skala` AS `Skala Usaha`,`kk`.`nama_kabupaten_kota` AS `Kabupaten/Kota`,`u`.`tahun_berdiri` AS `Tahun Brdiri` from ((((`umkm_jabar`.`umkm` `u` join `umkm_jabar`.`pemilik_umkm` `p` on(`u`.`id_pemilik` = `p`.`id_pemilik`)) join `umkm_jabar`.`skala_umkm` `s` on(`u`.`id_skala` = `s`.`id_skala`)) join `umkm_jabar`.`kategori_umkm` `k` on(`u`.`id_kategori` = `k`.`id_kategori`)) join `umkm_jabar`.`kabupaten_kota` `kk` on(`u`.`id_kabupaten_kota` = `kk`.`id_kabupaten_kota`))
md5=8906fa2a5db76867c262dd8632092226
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744708726467577
create-version=2
source=select u.nama_usaha as \'Nama Usaha\', p.nama_lengkap as \'Nama Pemilik\', k.nama_kategori as \'kategori Umkm\',s.nama_skala as \'Skala Usaha\', kk.nama_kabupaten_kota as \'Kabupaten/Kota\', u.tahun_berdiri as \'Tahun Brdiri\'\nfrom umkm u \njoin pemilik_umkm p on u.id_pemilik = p.id_pemilik\njoin skala_umkm s on u.id_skala = s.id_skala\njoin kategori_umkm k on u.id_kategori = k.id_kategori\njoin kabupaten_kota kk on u.id_kabupaten_kota = kk.id_kabupaten_kota
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `u`.`nama_usaha` AS `Nama Usaha`,`p`.`nama_lengkap` AS `Nama Pemilik`,`k`.`nama_kategori` AS `kategori Umkm`,`s`.`nama_skala` AS `Skala Usaha`,`kk`.`nama_kabupaten_kota` AS `Kabupaten/Kota`,`u`.`tahun_berdiri` AS `Tahun Brdiri` from ((((`umkm_jabar`.`umkm` `u` join `umkm_jabar`.`pemilik_umkm` `p` on(`u`.`id_pemilik` = `p`.`id_pemilik`)) join `umkm_jabar`.`skala_umkm` `s` on(`u`.`id_skala` = `s`.`id_skala`)) join `umkm_jabar`.`kategori_umkm` `k` on(`u`.`id_kategori` = `k`.`id_kategori`)) join `umkm_jabar`.`kabupaten_kota` `kk` on(`u`.`id_kabupaten_kota` = `kk`.`id_kabupaten_kota`))
mariadb-version=100432
