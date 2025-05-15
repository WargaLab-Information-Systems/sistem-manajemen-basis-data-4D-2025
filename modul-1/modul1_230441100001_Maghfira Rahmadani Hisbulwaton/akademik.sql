/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - akademik
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`akademik` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `akademik`;

/*Table structure for table `dosen` */

DROP TABLE IF EXISTS `dosen`;

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `bidang_studi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dosen` */

insert  into `dosen`(`id_dosen`,`nama`,`nip`,`bidang_studi`) values 
(1,'Dr. Ahmad','NIP001','Teknik Informatika'),
(2,'Dr. Budi','NIP002','Sistem Informasi'),
(3,'Dr. Cindy','NIP003','Teknik Komputer'),
(4,'Dr. Dewi','NIP004','Teknik Informatika'),
(5,'Dr. Eko','NIP005','Sistem Informasi'),
(6,'Dr. Fani','NIP006','Teknik Komputer'),
(7,'Dr. Gina','NIP007','Teknik Informatika'),
(8,'Dr. Hadi','NIP008','Sistem Informasi'),
(9,'Dr. Ika','NIP009','Teknik Komputer'),
(10,'Dr. Joko','NIP010','Teknik Informatika');

/*Table structure for table `dosen_mata_kuliah` */

DROP TABLE IF EXISTS `dosen_mata_kuliah`;

CREATE TABLE `dosen_mata_kuliah` (
  `id_dosen_matakuliah` int(11) NOT NULL AUTO_INCREMENT,
  `id_dosen` int(11) DEFAULT NULL,
  `id_matakuliah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dosen_matakuliah`),
  KEY `id_dosen` (`id_dosen`),
  KEY `id_matakuliah` (`id_matakuliah`),
  CONSTRAINT `dosen_mata_kuliah_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  CONSTRAINT `dosen_mata_kuliah_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `mata_kuliah` (`id_matakuliah`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dosen_mata_kuliah` */

insert  into `dosen_mata_kuliah`(`id_dosen_matakuliah`,`id_dosen`,`id_matakuliah`) values 
(1,1,1),
(2,1,2),
(3,2,3),
(4,3,4),
(5,4,5),
(6,5,6),
(7,6,7),
(8,7,8),
(9,8,9),
(10,9,10);

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `tahun_masuk` year(4) DEFAULT NULL,
  PRIMARY KEY (`id_mahasiswa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`id_mahasiswa`,`nama`,`nim`,`jurusan`,`tahun_masuk`) values 
(1,'Andi','123456','Teknik Informatika',2020),
(2,'Budi','123457','Sistem Informasi',2020),
(3,'Cindy','123458','Teknik Komputer',2021),
(4,'Dewi','123459','Teknik Informatika',2021),
(5,'Eko','123460','Sistem Informasi',2020),
(6,'Fani','123461','Teknik Komputer',2021),
(7,'Gina','123462','Teknik Informatika',2020),
(8,'Hadi','123463','Sistem Informasi',2021),
(9,'Ika','123464','Teknik Komputer',2020),
(10,'Joko','123465','Teknik Informatika',2021);

/*Table structure for table `mata_kuliah` */

DROP TABLE IF EXISTS `mata_kuliah`;

CREATE TABLE `mata_kuliah` (
  `id_matakuliah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_matakuliah` varchar(100) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_matakuliah`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mata_kuliah` */

insert  into `mata_kuliah`(`id_matakuliah`,`nama_matakuliah`,`sks`,`semester`) values 
(1,'Pemrograman Dasar',3,1),
(2,'Basis Data',3,2),
(3,'Jaringan Komputer',3,3),
(4,'Analisis dan Perancangan Sistem',3,4),
(5,'Kecerdasan Buatan',3,5),
(6,'Sistem Operasi',3,6),
(7,'Rekayasa Perangkat Lunak',3,7),
(8,'Keamanan Jaringan',3,8),
(9,'Machine Learning',3,9),
(10,'Cloud Computing',3,10);

/*Table structure for table `rencana_studi` */

DROP TABLE IF EXISTS `rencana_studi`;

CREATE TABLE `rencana_studi` (
  `id_krs` int(11) NOT NULL AUTO_INCREMENT,
  `id_mahasiswa` int(11) DEFAULT NULL,
  `id_matakuliah` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_krs`),
  KEY `id_mahasiswa` (`id_mahasiswa`),
  KEY `id_matakuliah` (`id_matakuliah`),
  CONSTRAINT `rencana_studi_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  CONSTRAINT `rencana_studi_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `mata_kuliah` (`id_matakuliah`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `rencana_studi` */

insert  into `rencana_studi`(`id_krs`,`id_mahasiswa`,`id_matakuliah`,`semester`) values 
(1,1,1,1),
(2,1,2,1),
(3,2,1,1),
(4,2,3,1),
(5,3,2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
