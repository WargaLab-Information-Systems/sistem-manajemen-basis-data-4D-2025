TYPE=VIEW
query=select `p`.`nama_lengkap` AS `nama pemilik`,`u`.`nama_usaha` AS `usaha yang dimiliki` from (`umkm_jabar`.`pemilik_umkm` `p` join `umkm_jabar`.`umkm` `u` on(`p`.`id_pemilik` = `u`.`id_pemilik`))
md5=86c06bc776aedf670a3e0263acb27789
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001745826657686831
create-version=2
source=select p.nama_lengkap as \'nama pemilik\', u.nama_usaha as \'usaha yang dimiliki\'\nfrom pemilik_umkm p join umkm u on p.id_pemilik=u.id_pemilik
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `p`.`nama_lengkap` AS `nama pemilik`,`u`.`nama_usaha` AS `usaha yang dimiliki` from (`umkm_jabar`.`pemilik_umkm` `p` join `umkm_jabar`.`umkm` `u` on(`p`.`id_pemilik` = `u`.`id_pemilik`))
mariadb-version=100432
