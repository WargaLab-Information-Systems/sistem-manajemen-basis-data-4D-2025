TYPE=VIEW
query=select `p`.`nik` AS `NIK`,`p`.`nama_lengkap` AS `Nama Lengkap`,`p`.`jenis_kelamin` AS `Jenis Kelamin`,`p`.`nomor_telepon` AS `Nomor Telepon`,`p`.`email` AS `Email`,`u`.`nama_usaha` AS `Nama Usaha Yang Dimiliki` from (`umkm_jabar`.`pemilik_umkm` `p` join `umkm_jabar`.`umkm` `u` on(`p`.`id_pemilik` = `u`.`id_pemilik`))
md5=2cc6a7efc1629a9009ae6f222c29d012
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001744709291062737
create-version=2
source=select p.nik as \'NIK\', p.nama_lengkap as \'Nama Lengkap\', p.jenis_kelamin as \'Jenis Kelamin\', p.nomor_telepon as \'Nomor Telepon\', p.email as \'Email\', u.nama_usaha As \'Nama Usaha Yang Dimiliki\'\nfrom pemilik_umkm p \njoin umkm u on p.id_pemilik = u.id_pemilik
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nik` AS `NIK`,`p`.`nama_lengkap` AS `Nama Lengkap`,`p`.`jenis_kelamin` AS `Jenis Kelamin`,`p`.`nomor_telepon` AS `Nomor Telepon`,`p`.`email` AS `Email`,`u`.`nama_usaha` AS `Nama Usaha Yang Dimiliki` from (`umkm_jabar`.`pemilik_umkm` `p` join `umkm_jabar`.`umkm` `u` on(`p`.`id_pemilik` = `u`.`id_pemilik`))
mariadb-version=100432
