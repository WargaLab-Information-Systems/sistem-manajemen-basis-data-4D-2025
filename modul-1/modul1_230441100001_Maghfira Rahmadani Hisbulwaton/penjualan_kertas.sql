/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - penjualan_kertas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`penjualan_kertas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `penjualan_kertas`;

/*Table structure for table `detail_penjualan` */

DROP TABLE IF EXISTS `detail_penjualan`;

CREATE TABLE `detail_penjualan` (
  `ID_Detail` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Penjualan` int(11) DEFAULT NULL,
  `ID_Produk` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Detail`),
  KEY `ID_Penjualan` (`ID_Penjualan`),
  KEY `ID_Produk` (`ID_Produk`),
  CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`ID_Penjualan`) REFERENCES `penjualan` (`ID_Penjualan`),
  CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`ID_Produk`) REFERENCES `produk_kertas` (`ID_Produk`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detail_penjualan` */

insert  into `detail_penjualan`(`ID_Detail`,`ID_Penjualan`,`ID_Produk`,`Jumlah`) values 
(1,1,1,10),
(2,1,3,5),
(3,2,2,2),
(4,3,1,3),
(5,4,4,1);

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `ID_Pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Pelanggan` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `No_Telepon` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pelanggan` */

insert  into `pelanggan`(`ID_Pelanggan`,`Nama_Pelanggan`,`Alamat`,`No_Telepon`,`Email`) values 
(1,'Pelanggan A','Jl. Pelanggan No. 1','082345678901','pelangganA@example.com'),
(2,'Pelanggan B','Jl. Pelanggan No. 2','082345678902','pelangganB@example.com'),
(3,'Pelanggan C','Jl. Pelanggan No. 3','082345678903','pelangganC@example.com'),
(4,'Pelanggan D','Jl. Pelanggan No. 4','082345678904','pelangganD@example.com'),
(5,'Pelanggan E','Jl. Pelanggan No. 5','082345678905','pelangganE@example.com'),
(6,'Pelanggan F','Jl. Pelanggan No. 6','082345678906','pelangganF@example.com'),
(7,'Pelanggan G','Jl. Pelanggan No. 7','082345678907','pelangganG@example.com'),
(8,'Pelanggan H','Jl. Pelanggan No. 8','082345678908','pelangganH@example.com'),
(9,'Pelanggan I','Jl. Pelanggan No. 9','082345678909','pelangganI@example.com'),
(10,'Pelanggan J','Jl. Pelanggan No. 10','082345678910','pelangganJ@example.com');

/*Table structure for table `penjualan` */

DROP TABLE IF EXISTS `penjualan`;

CREATE TABLE `penjualan` (
  `ID_Penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `Tanggal_Penjualan` date DEFAULT NULL,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `Total_Harga` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Penjualan`),
  KEY `ID_Pelanggan` (`ID_Pelanggan`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `penjualan` */

insert  into `penjualan`(`ID_Penjualan`,`Tanggal_Penjualan`,`ID_Pelanggan`,`Total_Harga`) values 
(1,'2023-10-01',1,50000.00),
(2,'2023-10-02',2,30000.00),
(3,'2023-10-03',3,15000.00),
(4,'2023-10-04',4,20000.00),
(5,'2023-10-05',5,25000.00);

/*Table structure for table `produk_kertas` */

DROP TABLE IF EXISTS `produk_kertas`;

CREATE TABLE `produk_kertas` (
  `ID_Produk` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Produk` varchar(100) DEFAULT NULL,
  `Tipe` varchar(50) DEFAULT NULL,
  `Ukuran` varchar(20) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  `ID_Supplier` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Produk`),
  KEY `ID_Supplier` (`ID_Supplier`),
  CONSTRAINT `produk_kertas_ibfk_1` FOREIGN KEY (`ID_Supplier`) REFERENCES `supplier` (`ID_Supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `produk_kertas` */

insert  into `produk_kertas`(`ID_Produk`,`Nama_Produk`,`Tipe`,`Ukuran`,`Harga`,`Stok`,`ID_Supplier`) values 
(1,'Kertas A4','Kertas Cetak','A4',5000.00,100,1),
(2,'Kertas Karton','Kertas Gambar','A3',15000.00,50,2),
(3,'Kertas HVS','Kertas Cetak','F4',7000.00,200,3),
(4,'Kertas A3','Kertas Cetak','A3',12000.00,75,4),
(5,'Kertas F4','Kertas Gambar','F4',8000.00,150,5),
(6,'Kertas A5','Kertas Cetak','A5',3000.00,120,6),
(7,'Kertas HVS 80gr','Kertas Cetak','A4',6000.00,90,7),
(8,'Kertas HVS 100gr','Kertas Cetak','A4',7000.00,80,8),
(9,'Kertas Kart on 250gr','Kertas Gambar','A3',20000.00,30,9),
(10,'Kertas Glossy','Kertas Gambar','A4',10000.00,60,10);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `ID_Supplier` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Supplier` varchar(100) DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `No_Telepon` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `supplier` */

insert  into `supplier`(`ID_Supplier`,`Nama_Supplier`,`Alamat`,`No_Telepon`,`Email`) values 
(1,'Supplier A','Jl. Contoh No. 1','081234567890','supplierA@example.com'),
(2,'Supplier B','Jl. Contoh No. 2','081234567891','supplierB@example.com'),
(3,'Supplier C','Jl. Contoh No. 3','081234567892','supplierC@example.com'),
(4,'Supplier D','Jl. Contoh No. 4','081234567893','supplierD@example.com'),
(5,'Supplier E','Jl. Contoh No. 5','081234567894','supplierE@example.com'),
(6,'Supplier F','Jl. Contoh No. 6','081234567895','supplierF@example.com'),
(7,'Supplier G','Jl. Contoh No. 7','081234567896','supplierG@example.com'),
(8,'Supplier H','Jl. Contoh No. 8','081234567897','supplierH@example.com'),
(9,'Supplier I','Jl. Contoh No. 9','081234567898','supplierI@example.com'),
(10,'Supplier J','Jl. Contoh No. 10','081234567899','supplierJ@example.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
