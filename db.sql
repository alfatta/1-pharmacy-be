-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: 1_pharmacy
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `obat`
--

DROP TABLE IF EXISTS `obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obat` (
  `namaObat` varchar(255) NOT NULL,
  `dosisObat` int NOT NULL,
  `infoObat` text NOT NULL,
  `hargaObat` int NOT NULL,
  `idObat` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idObat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obat`
--

LOCK TABLES `obat` WRITE;
/*!40000 ALTER TABLE `obat` DISABLE KEYS */;
/*!40000 ALTER TABLE `obat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `idSession` int NOT NULL AUTO_INCREMENT,
  `tokenSession` varchar(200) NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idSession`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVtcGF0bGltYUBnbWFpbC5jb20iLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjM4MzY2NjUxLCJleHAiOjE2Mzg0NTMwNTF9.DY78qoTbpxcENyI-R3rMqARw_5Djgj4HwmiOs2ujCg8',4),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODY3NTExOCwiZXhwIjoxNjM4NzYxNTE4fQ.8B1jW2FTQMoTxpWPNEkH_fbHod9OuuFssBJtdfr1nzs',6);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksi` (
  `idTransaksi` int NOT NULL AUTO_INCREMENT,
  `tanggalTransaksi` date NOT NULL,
  `hargaKeseluruhan` int NOT NULL,
  `idUser` int NOT NULL,
  `buktiPembayaran` varchar(255) NOT NULL,
  `statusTransaksi` int NOT NULL,
  PRIMARY KEY (`idTransaksi`),
  KEY `Transaksi_fk0` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksidetail`
--

DROP TABLE IF EXISTS `transaksidetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksidetail` (
  `idTransaksiDetail` int NOT NULL AUTO_INCREMENT,
  `idTransaksi` int NOT NULL,
  `idProduk` int NOT NULL,
  `hargaProduk` int NOT NULL,
  PRIMARY KEY (`idTransaksiDetail`),
  KEY `TransaksiDetail_fk0` (`idTransaksi`),
  KEY `TransaksiDetail_fk1` (`idProduk`),
  CONSTRAINT `TransaksiDetail_fk0` FOREIGN KEY (`idTransaksi`) REFERENCES `transaksi` (`idTransaksi`),
  CONSTRAINT `TransaksiDetail_fk1` FOREIGN KEY (`idProduk`) REFERENCES `obat` (`idObat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksidetail`
--

LOCK TABLES `transaksidetail` WRITE;
/*!40000 ALTER TABLE `transaksidetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksidetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `namaUser` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `tanggalLahir` date NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `idUser` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `sudahAktif` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('John','AABB','1980-04-12',0,1,'AABW2',0,'','SSBB','makhlukghoib@gmail.com'),('Ahmad','AABBC','1980-04-13',0,2,'e0a9a53903c9c09c9ed4c0cee5dbcdacc60b1463e9eaff3fb584afb841b26d77a625dedc3107985f6f3bef6783a8bad819213e28bf9bcba377c46e938d3b9e76',0,'','SSSSA','tigaempatb@gmail.com'),('Ahmad Bustomi','AABBDC','1980-04-13',0,3,'621b5b877c04794c9b2fca64db927b3ad1039b5a1654a831fddb0c331d57f367bfa63e659f54f81c5666b8b215784afeb7af278e6e2520963a87e61462bd64cc',0,'','SSSSAB','empatlima@gmail.com'),('Ahmad Bustomi','AABBDC','1980-04-14',0,4,'09972ee53113c771ac014acdce62c2fcf84471fee6cbbdf46adf331b4b3bf4e02f6338b877666703f4f486729f71025c094df86598c529f3ef12a4b2926f6fbe',1,'','SSSSAB','empatlima@gmail.com'),('Abdul','JKN KIS 18/11','1999-04-07',0,5,'d053da4efb465d7df2be8693fc7a8c2d4ee31fc8fae17a9f3be412990221a9f505feb477bc194d10fddacd193e74efa0ba4c97912d46b6f3df98cbaf437d2d90',1,'','AnakAbdi','abdul@gmail.com'),('PP','BB22/1','2000-02-01',0,6,'a7ff26cc384af50b289500b91983345021d6d9183c771f70eb86cf72ee22c064f09de4fdd077b663dca61780d9eb48086e1bee62a174ec2049aeddcdcd9e1978',1,'','FF','a@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-05 10:54:19
