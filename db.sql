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
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `idKategori` int NOT NULL AUTO_INCREMENT,
  `namaKategori` varchar(200) NOT NULL,
  PRIMARY KEY (`idKategori`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Obat bebas'),(2,'Obat keras'),(3,'Obat bebas terbatas');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

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
  `idKategori` int NOT NULL,
  `gambarObat` text,
  `deletedAt` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idObat`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obat`
--

LOCK TABLES `obat` WRITE;
/*!40000 ALTER TABLE `obat` DISABLE KEYS */;
INSERT INTO `obat` VALUES ('Panadol',5,'Obat penurun panas',5000,1,3,'https://placeimg.com/480/480/nature',NULL,NULL,NULL),('Aspirin',2,'Obat aspirin, pereda demam',2500,2,1,'https://placeimg.com/480/480/nature',NULL,NULL,NULL),('Esperson',3,'Obat kulit',60000,3,2,'https://placeimg.com/480/480/nature',NULL,NULL,NULL),('Antangin',1,'Obat masuk angin',5000,4,1,'https://placeimg.com/480/480/nature',NULL,NULL,NULL),('Tolak Angin',1,'Obat masuk angin',5000,5,1,'https://placeimg.com/480/480/nature','2022-01-09 04:07:26',NULL,'2022-01-09 04:07:26'),('Redoxon',2,'Obat demam',25000,6,3,'https://placeimg.com/480/480/nature',NULL,NULL,NULL),('Teriteri',1,'Obat demam',50000,7,2,'https://placeimg.com/480/480/nature',NULL,NULL,NULL),('Asdfk',1,'Obat batuk',250000,8,2,'https://placeimg.com/480/480/nature','2022-01-09 04:04:58',NULL,'2022-01-09 04:04:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVtcGF0bGltYUBnbWFpbC5jb20iLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjM4MzY2NjUxLCJleHAiOjE2Mzg0NTMwNTF9.DY78qoTbpxcENyI-R3rMqARw_5Djgj4HwmiOs2ujCg8',4),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODY3NTExOCwiZXhwIjoxNjM4NzYxNTE4fQ.8B1jW2FTQMoTxpWPNEkH_fbHod9OuuFssBJtdfr1nzs',6),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVtcGF0bGltYUBnbWFpbC5jb20iLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjM4Njg3NTE5LCJleHAiOjE2Mzg3NzM5MTl9.U_EXMvrECdf21tPUH4BzCLR5JkegIWlKVK0KkFo08so',4),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODY4ODM3MSwiZXhwIjoxNjM4Nzc0NzcxfQ.Oc8DJhEHVdY3-7v4ejNjWkvRw4c48Wf4dZ82m3shswU',6),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODY4ODU2NCwiZXhwIjoxNjM4Nzc0OTY0fQ.ImfXXAf7rMLcfzpeSuFt0flW9uWVuultYtXYvZ8DBxA',6),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODY4ODc2NywiZXhwIjoxNjM4Nzc1MTY3fQ.oC0w_byNBAK6E5LZcOrbzpyFaCt4_g5es5wbgvvAG6U',6),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODY4ODkwMSwiZXhwIjoxNjM4Nzc1MzAxfQ.DQEsxqdK5WFAgPGRBciwCwFBC2YcmVcoF4i_alEbxEA',6),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODY4OTA5NSwiZXhwIjoxNjM4Nzc1NDk1fQ.Q0wRLvz-aXyxmPfxPUql__4zPMdi3JGnyOKtM-by1jY',6),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBwYXBAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODc5NzExOSwiZXhwIjoxNjM4ODgzNTE5fQ.Kocsif4OZaB3pLcPErsirh1q2fQxFyeopezEpLZkDEk',18),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBwYXBAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzODc5OTYwNiwiZXhwIjoxNjM4ODg2MDA2fQ.pXTLKbN9JUwUMwNYl4N12bGWysg0YjdTcaMZr94ZUV4',18),(18,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBwYXBAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTYzOTI4MDM5NCwiZXhwIjoxNjM5MzY2Nzk0fQ.ssPT7SvuXB--OhyXFFPIln0cj4BJ6aL0a-uh7BxoIz8',18),(19,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBwYXBAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTY0MDAwNTQ4MiwiZXhwIjoxNjQwMDkxODgyfQ.mYcgYB7o4snZkSkgnZtN2MoIYU7yjhN7oXDgSAsbhos',18),(20,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBwYXBAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTY0MDAwODA3NSwiZXhwIjoxNjQwMDk0NDc1fQ.535HeAfogwYokRRLj6HSCDiqhTS6SSRQ6yXBElVplTA',18),(21,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBwYXBAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTY0MDE3NjI1NCwiZXhwIjoxNjQwMjYyNjU0fQ.JrWR64e-y-P158XgjMUUsgqE8A08eXCi9I2I60SxidY',18),(22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFwYXBAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTY0MDE3NzQzMywiZXhwIjoxNjQwMjYzODMzfQ.dQNrsiESUTlgoOnnkDlqhZCDjLMZR_I27a4skEgtu38',19),(23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFwYXBAZ21haWwuY29tIiwiaXNBZG1pbiI6ZmFsc2UsImlhdCI6MTY0MDE3NzU0MiwiZXhwIjoxNjQwMjYzOTQyfQ.LoKIpFx8qUobeodfWi0RZ5HG3tjPh5xWKkYgJeRgVoE',19),(27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJ1ZGlAZ21haWwuY29tIiwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjQxNjk4Nzc1LCJleHAiOjE2NDE3ODUxNzV9.NgCe-M6bNLRYwKSM_hgVxXZPaQ8_lY8UL9dnTh7OgyU',20);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES (1,'2021-12-20',27500,18,'',1),(2,'2021-12-20',27500,18,'',1),(3,'2021-12-20',27500,18,'',1),(4,'2021-12-20',27500,18,'',1),(5,'2021-12-20',27500,18,'',1),(6,'2021-12-20',75000,18,'',1),(7,'2021-12-22',125000,19,'',1),(8,'2021-12-22',100000,19,'',1),(9,'2021-12-22',262500,19,'',1),(10,'2022-01-09',75000,18,'',1);
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
  `idObat` int NOT NULL,
  `hargaObat` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`idTransaksiDetail`),
  KEY `TransaksiDetail_fk0` (`idTransaksi`),
  KEY `TransaksiDetail_fk1` (`idObat`),
  CONSTRAINT `TransaksiDetail_fk0` FOREIGN KEY (`idTransaksi`) REFERENCES `transaksi` (`idTransaksi`),
  CONSTRAINT `TransaksiDetail_fk1` FOREIGN KEY (`idObat`) REFERENCES `obat` (`idObat`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksidetail`
--

LOCK TABLES `transaksidetail` WRITE;
/*!40000 ALTER TABLE `transaksidetail` DISABLE KEYS */;
INSERT INTO `transaksidetail` VALUES (1,4,1,5000,3),(2,4,2,2500,5),(3,5,1,5000,3),(4,5,2,2500,5),(5,6,1,5000,3),(6,6,3,60000,1),(7,7,7,50000,2),(8,7,6,25000,1),(9,8,1,5000,5),(10,8,6,25000,3),(11,9,2,2500,5),(12,9,8,250000,1),(13,10,1,5000,3),(14,10,3,60000,1);
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
  `token` text,
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('John','AABB','1980-04-12',0,1,'AABW2',0,'','SSBB','makhlukghoib@gmail.com'),('Ahmad','AABBC','1980-04-13',0,2,'e0a9a53903c9c09c9ed4c0cee5dbcdacc60b1463e9eaff3fb584afb841b26d77a625dedc3107985f6f3bef6783a8bad819213e28bf9bcba377c46e938d3b9e76',0,'','SSSSA','tigaempatb@gmail.com'),('Ahmad Bustomi','AABBDC','1980-04-13',0,3,'621b5b877c04794c9b2fca64db927b3ad1039b5a1654a831fddb0c331d57f367bfa63e659f54f81c5666b8b215784afeb7af278e6e2520963a87e61462bd64cc',0,'','SSSSAB','empatlima@gmail.com'),('Ahmad Bustomi','AABBDC','1980-04-14',0,4,'09972ee53113c771ac014acdce62c2fcf84471fee6cbbdf46adf331b4b3bf4e02f6338b877666703f4f486729f71025c094df86598c529f3ef12a4b2926f6fbe',1,'','SSSSAB','empatlima@gmail.com'),('Abdul','JKN KIS 18/11','1999-04-07',0,5,'d053da4efb465d7df2be8693fc7a8c2d4ee31fc8fae17a9f3be412990221a9f505feb477bc194d10fddacd193e74efa0ba4c97912d46b6f3df98cbaf437d2d90',1,'','AnakAbdi','abdul@gmail.com'),('PP','BB22/1','2000-02-01',0,6,'a7ff26cc384af50b289500b91983345021d6d9183c771f70eb86cf72ee22c064f09de4fdd077b663dca61780d9eb48086e1bee62a174ec2049aeddcdcd9e1978',1,'','FF','a@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,7,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'','KK','naufaldzulfikar@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,8,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'','KK','naufaldzulfikar@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,9,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'','KK','naufaldzulfikar@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,10,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'','KK','naufaldzulfikar@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,11,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1hVXNlciI6IkFobWFkIiwiYWxhbWF0IjoiSEgyMjExQkIiLCJ0YW5nZ2FsTGFoaXIiOiIyMDAwLTA2LTAxIiwidXNlck5hbWUiOiJLSyIsImVtYWlsIjoibmF1ZmFsZHp1bGZpa2FyQGdtYWlsLmNvbSIsImlhdCI6MTYzODY5MDYzMSwiZXhwIjoxNjM4Nzc3MDMxfQ.PnjTAWLgxT-1R1DmhAH9wCQN_ET42PsmsT0x_4FBQ58','KK','naufaldzulfikar@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,12,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1hVXNlciI6IkFobWFkIiwiYWxhbWF0IjoiSEgyMjExQkIiLCJ0YW5nZ2FsTGFoaXIiOiIyMDAwLTA2LTAxIiwidXNlck5hbWUiOiJLSyIsImVtYWlsIjoibmF1ZmFsZHp1bGZpa2FyQGdtYWlsLmNvbSIsImlhdCI6MTYzODY5MDc1MSwiZXhwIjoxNjM4Nzc3MTUxfQ.izEamDAEyxrAsrHOzqx_PNLJWKFlMh0r8crUVffiwV4','KK','naufaldzulfikar@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,13,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1hVXNlciI6IkFobWFkIiwiYWxhbWF0IjoiSEgyMjExQkIiLCJ0YW5nZ2FsTGFoaXIiOiIyMDAwLTA2LTAxIiwidXNlck5hbWUiOiJLSyIsImVtYWlsIjoibmF1ZmFsZHp1bGZpa2FyQGdtYWlsLmNvbSIsImlhdCI6MTYzODY5MDk1NiwiZXhwIjoxNjM4Nzc3MzU2fQ.46QDkekMslOfZTGRcYC0ZWd_qYbPGjCv1aCPOmEnKbg','KK','naufaldzulfikar@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,14,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1hVXNlciI6IkFobWFkIiwiYWxhbWF0IjoiSEgyMjExQkIiLCJ0YW5nZ2FsTGFoaXIiOiIyMDAwLTA2LTAxIiwidXNlck5hbWUiOiJLSyIsImVtYWlsIjoibmF1ZmFsZHp1bGZpa2FyQGdtYWlsLmNvbSIsImlhdCI6MTYzODY5MTAxNywiZXhwIjoxNjM4Nzc3NDE3fQ.aR9PM1Chl2_e4QqabtiYKZ18lFfHjJdcioxMo_U4YxE','KK','naufaldzulfikar@gmail.com'),('Ahmad','HH2211BB','2000-06-01',0,15,'77b9e04d564c65091a38c8f4dc7afe1c4f79e221cf05570a7f6867ddce11ab670f39a8cccdc64a7dfce11e5d085fc6e0fc910cd8d2425a7e7324e2790d998db2',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1hVXNlciI6IkFobWFkIiwiYWxhbWF0IjoiSEgyMjExQkIiLCJ0YW5nZ2FsTGFoaXIiOiIyMDAwLTA2LTAxIiwidXNlck5hbWUiOiJLSyIsImVtYWlsIjoibmF1ZmFsZHp1bGZpa2FyQGdtYWlsLmNvbSIsImlhdCI6MTYzODY5MTA4NiwiZXhwIjoxNjM4Nzc3NDg2fQ.OkDWQR6z38FI5MDNdGdR6l837F9w-SxaXCi-UZMV6qo','KK','naufaldzulfikar@gmail.com'),('Ali','BBCCDD','1980-04-24',0,16,'1887702d4cc01bb970b4a5b027f5f0be8e642d02f6c620ef769c132d62817d04b8038cf429ca3d9cbc6bb8fce76ae482d3e287078ce057611b61bee185e2e74d',0,NULL,'ampas','ampas@gmail.com'),('Ali Ahmad','BBCCDDE','1980-04-24',0,17,'a002eede039c163edd7f884750705840df43b9db0ada319aed7d0ce085f87807065e989ebd0bac006677c9a419bcc5405735c4af1e1f06caf0101a02e201c706',1,NULL,'ampas12','ampas12@gmail.com'),('PPAP','oooooooo','1999-02-02',0,18,'fc9a8d73f0d00d36f98ceeaeedd71e864e1c61bef33e6cc4a185c63f31866cd00a3de6845afc2dbb597e05bb7c7145d9862762747ccaff17f7db05ad5f088bbd',1,NULL,'VVAV','ppap@gmail.com'),('APAP','apap','2000-02-01',0,19,'310e741ddf2f68b3230192c4c6bea9f28def9e6bf14203951f69e4ef9caa35fd951da5e98a0d3b8290cef97a837ee041ccbe88a756e26e0d59bc2927625ca020',1,NULL,'FFXIV','apap@gmail.com'),('Budi','budi','1999-06-30',1,20,'85a02a26a390a18133a7f319ce14feb2762e89aa2fe9b4917550e04d6467819e35f302f30bd9f56f5b38d0d9535dad81e18a44aa60f8ea65eaf8f9e7289941c5',1,NULL,'budi001','budi@gmail.com'),('Budi','budi','1999-06-30',0,21,'85a02a26a390a18133a7f319ce14feb2762e89aa2fe9b4917550e04d6467819e35f302f30bd9f56f5b38d0d9535dad81e18a44aa60f8ea65eaf8f9e7289941c5',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1hVXNlciI6IkJ1ZGkiLCJhbGFtYXQiOiJidWRpIiwidGFuZ2dhbExhaGlyIjoiMTk5OS0wNi0zMCIsInVzZXJOYW1lIjoiYnVkaTAwMSIsImVtYWlsIjoiYnVkaUBnbWFpbC5jb20iLCJpYXQiOjE2NDE2OTU2ODIsImV4cCI6MTY0MTc4MjA4Mn0.zp8K0WDsUCchhBGbKvsp3aOteTygBjkAcx6vKpayT-Y','budi001','budi@gmail.com');
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

-- Dump completed on 2022-01-09 11:09:55
