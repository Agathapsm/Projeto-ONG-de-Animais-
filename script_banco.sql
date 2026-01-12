-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: extensao
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adocao`
--

DROP TABLE IF EXISTS `adocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adocao` (
  `id_adocao` int(11) NOT NULL AUTO_INCREMENT,
  `data_adocao` date NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_adotante` int(11) NOT NULL,
  PRIMARY KEY (`id_adocao`),
  UNIQUE KEY `id_animal` (`id_animal`),
  KEY `idx_adocao_data` (`data_adocao`),
  KEY `idx_adocao_idAnimal` (`id_animal`),
  KEY `idx_pedidos_idAdotante` (`id_adotante`),
  CONSTRAINT `adocao_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  CONSTRAINT `adocao_ibfk_2` FOREIGN KEY (`id_adotante`) REFERENCES `adotante` (`id_adotante`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adocao`
--

LOCK TABLES `adocao` WRITE;
/*!40000 ALTER TABLE `adocao` DISABLE KEYS */;
INSERT INTO `adocao` VALUES (1,'2024-05-10',1,5),(2,'2024-08-15',3,2),(3,'2025-01-20',4,3),(4,'2025-01-20',7,1),(5,'2025-10-01',12,3),(6,'2025-10-01',13,3),(7,'2025-10-05',14,1),(8,'2025-10-06',16,4);
/*!40000 ALTER TABLE `adocao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adotante`
--

DROP TABLE IF EXISTS `adotante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adotante` (
  `id_adotante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_adotante`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adotante`
--

LOCK TABLES `adotante` WRITE;
/*!40000 ALTER TABLE `adotante` DISABLE KEYS */;
INSERT INTO `adotante` VALUES (1,'Carlos Mendes','123.456.789-00','(21) 98877-1122','carlos.mendes@email.com','Av. Olegário Maciel, 36'),(2,'Juliana Silva','987.654.321-00','(21) 97766-4455','juliana.silva@email.com','R. Venceslau, 301'),(3,'Rafael Souza','111.222.333-44','(21) 95555-8899','rafael.souza@email.com','R. Dias da Cruz, 584'),(4,'Patrícia Lima','222.333.444-55','(21) 96666-7788','patricia.lima@email.com','Av. das Américas, 10501'),(5,'Ágatha Paiva','923.334.245-56','(21) 91356-7923','agatha.paiva@email.com','R. Venceslau, 192');
/*!40000 ALTER TABLE `adotante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `adotantes_ativos`
--

DROP TABLE IF EXISTS `adotantes_ativos`;
/*!50001 DROP VIEW IF EXISTS `adotantes_ativos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adotantes_ativos` AS SELECT 
 1 AS `nome`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id_animal` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `sexagem` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `id_raca` int(11) NOT NULL,
  `id_especie` int(11) NOT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `id_raca` (`id_raca`),
  KEY `id_especie` (`id_especie`),
  CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_raca`) REFERENCES `raca` (`id_raca`),
  CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id_especie`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'Thor',12,'Macho','Adotado',5,1),(2,'Luna',2,'Fêmea','Em Tratamento',9,2),(3,'Caramelo',8,'Macho','Adotado',1,1),(4,'Mia',1,'Fêmea','Adotado',12,2),(5,'Bento',2,'Macho','Disponível',7,1),(6,'Nina',5,'Fêmea','Disponível',3,1),(7,'Zeca',1,'Macho','Adotado',8,2),(8,'Mel',4,'Fêmea','Em Tratamento',2,1),(9,'Tico',6,'Macho','Disponível',6,1),(10,'Teco',2,'Macho','Disponível',6,1),(11,'Blue',7,'Macho','Disponível',10,2),(12,'Geraldo',12,'Macho','Adotado',5,1),(13,'Maya',2,'Fêmea','Adotado',9,2),(14,'Buggie',8,'Macho','Adotado',1,1),(15,'Clara',1,'Fêmea','Disponível',12,2),(16,'Reinaldo',2,'Macho','Adotado',7,1),(17,'Amora',3,'Fêmea','Disponível',2,1),(18,'Bolt',5,'Macho','Disponível',4,1),(19,'Mel',2,'Fêmea','Em Tratamento',3,1),(20,'Rex',6,'Macho','Disponível',3,1),(21,'Lola',1,'Fêmea','Disponível',1,1),(22,'Duke',4,'Macho','Disponível',5,1),(23,'Pipoca',7,'Fêmea','Adotado',10,2),(24,'Simba',8,'Macho','Disponível',9,2),(25,'Maya',3,'Fêmea','Adotado',2,1),(26,'Chico',4,'Macho','Disponível',5,1),(27,'Fiona',6,'Fêmea','Disponível',3,1),(28,'Apollo',2,'Macho','Adotado',5,1),(29,'Nala',1,'Fêmea','Disponível',12,2),(30,'Max',9,'Macho','Disponível',3,1),(31,'Sol',5,'Fêmea','Em Tratamento',4,1),(32,'Bob',2,'Macho','Adotado',9,2);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie`
--

DROP TABLE IF EXISTS `especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie` (
  `id_especie` int(11) NOT NULL AUTO_INCREMENT,
  `nome_especie` varchar(10) NOT NULL,
  PRIMARY KEY (`id_especie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie`
--

LOCK TABLES `especie` WRITE;
/*!40000 ALTER TABLE `especie` DISABLE KEYS */;
INSERT INTO `especie` VALUES (1,'Cão'),(2,'Gato');
/*!40000 ALTER TABLE `especie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raca`
--

DROP TABLE IF EXISTS `raca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raca` (
  `id_raca` int(11) NOT NULL AUTO_INCREMENT,
  `nome_raca` varchar(35) NOT NULL,
  `id_especie` int(11) NOT NULL,
  PRIMARY KEY (`id_raca`),
  KEY `id_especie` (`id_especie`),
  CONSTRAINT `raca_ibfk_1` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id_especie`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raca`
--

LOCK TABLES `raca` WRITE;
/*!40000 ALTER TABLE `raca` DISABLE KEYS */;
INSERT INTO `raca` VALUES (1,'Sem Raça Definida',1),(2,'Labrador',1),(3,'Poodle',1),(4,'Pitbull',1),(5,'Yorkshire',1),(6,'Dachshund',1),(7,'Husky',1),(8,'Sem Raça Definida',2),(9,'Siamês',2),(10,'Persa',2),(11,'Angorá',2),(12,'Maine Coon',2),(13,'Himalaia',2),(14,'Siberiano',2);
/*!40000 ALTER TABLE `raca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_adocoes_adotante`
--

DROP TABLE IF EXISTS `v_adocoes_adotante`;
/*!50001 DROP VIEW IF EXISTS `v_adocoes_adotante`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_adocoes_adotante` AS SELECT 
 1 AS `nome`,
 1 AS `email`,
 1 AS `QtdAdocoes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animais_disponiveis`
--

DROP TABLE IF EXISTS `v_animais_disponiveis`;
/*!50001 DROP VIEW IF EXISTS `v_animais_disponiveis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_animais_disponiveis` AS SELECT 
 1 AS `especie`,
 1 AS `raca`,
 1 AS `nome`,
 1 AS `idade`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animais_disponiveis_sem_vacina`
--

DROP TABLE IF EXISTS `v_animais_disponiveis_sem_vacina`;
/*!50001 DROP VIEW IF EXISTS `v_animais_disponiveis_sem_vacina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_animais_disponiveis_sem_vacina` AS SELECT 
 1 AS `NomeAnimal`,
 1 AS `idade`,
 1 AS `sexagem`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animais_especie_raca`
--

DROP TABLE IF EXISTS `v_animais_especie_raca`;
/*!50001 DROP VIEW IF EXISTS `v_animais_especie_raca`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_animais_especie_raca` AS SELECT 
 1 AS `NomeRaca`,
 1 AS `NomeEspecie`,
 1 AS `NomeAnimal`,
 1 AS `idade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animaisvacinados`
--

DROP TABLE IF EXISTS `v_animaisvacinados`;
/*!50001 DROP VIEW IF EXISTS `v_animaisvacinados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_animaisvacinados` AS SELECT 
 1 AS `nome`,
 1 AS `nome_vacina`,
 1 AS `data_aplicacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_media_vacinas_aplicadas_ano`
--

DROP TABLE IF EXISTS `v_media_vacinas_aplicadas_ano`;
/*!50001 DROP VIEW IF EXISTS `v_media_vacinas_aplicadas_ano`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_media_vacinas_aplicadas_ano` AS SELECT 
 1 AS `Ano`,
 1 AS `TotalAplicacoes`,
 1 AS `MediaVacinasPorAnimal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_total_aniamais_raca`
--

DROP TABLE IF EXISTS `v_total_aniamais_raca`;
/*!50001 DROP VIEW IF EXISTS `v_total_aniamais_raca`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_total_aniamais_raca` AS SELECT 
 1 AS `NomeRaca`,
 1 AS `QtdDeAniamis`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vacina`
--

DROP TABLE IF EXISTS `vacina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacina` (
  `id_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_vacina` varchar(100) NOT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `tipo_vacina` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_vacina`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacina`
--

LOCK TABLES `vacina` WRITE;
/*!40000 ALTER TABLE `vacina` DISABLE KEYS */;
INSERT INTO `vacina` VALUES (1,'V10','Ceva','Polivalente'),(2,'Antirrábica','Zoetis','Raiva'),(3,'Quádrupla Felina','Biovet','Felina'),(4,'Vermífugo','Agener União','Controle Interno'),(5,'Giárdia','Ceva','Preventiva');
/*!40000 ALTER TABLE `vacina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacina_animal`
--

DROP TABLE IF EXISTS `vacina_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacina_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_aplicacao` date NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_vacina` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_animal` (`id_animal`),
  KEY `id_vacina` (`id_vacina`),
  CONSTRAINT `vacina_animal_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  CONSTRAINT `vacina_animal_ibfk_2` FOREIGN KEY (`id_vacina`) REFERENCES `vacina` (`id_vacina`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacina_animal`
--

LOCK TABLES `vacina_animal` WRITE;
/*!40000 ALTER TABLE `vacina_animal` DISABLE KEYS */;
INSERT INTO `vacina_animal` VALUES (1,'2024-04-01',1,1),(2,'2024-04-15',1,2),(3,'2024-05-01',2,3),(4,'2024-05-10',3,1),(5,'2024-06-01',3,2),(6,'2024-06-20',4,3),(7,'2024-07-05',5,4),(8,'2024-07-10',6,1),(9,'2024-08-01',6,2),(10,'2024-08-10',7,5),(11,'2024-09-01',8,3),(12,'2024-09-10',9,1),(13,'2024-09-15',9,2),(14,'2024-09-20',10,4),(15,'2025-04-10',12,1),(16,'2025-04-10',13,1),(17,'2025-04-10',13,2),(18,'2025-04-16',14,3),(19,'2025-04-16',15,4),(20,'2025-04-16',16,1),(21,'2025-04-16',16,2),(22,'2025-04-17',12,5),(23,'2025-04-17',12,2),(24,'2025-05-01',17,1),(25,'2025-05-15',17,2),(26,'2025-05-05',18,3),(27,'2025-05-20',18,1),(28,'2025-06-01',19,2),(29,'2025-06-10',20,1),(30,'2025-06-25',20,4),(31,'2025-06-12',21,1),(32,'2025-06-18',22,3),(33,'2025-06-30',22,5),(34,'2025-07-01',23,2),(35,'2025-07-10',23,4),(36,'2025-07-05',24,1);
/*!40000 ALTER TABLE `vacina_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'extensao'
--

--
-- Final view structure for view `adotantes_ativos`
--

/*!50001 DROP VIEW IF EXISTS `adotantes_ativos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adotantes_ativos` AS select `adotante`.`nome` AS `nome`,`adotante`.`email` AS `email` from `adotante` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_adocoes_adotante`
--

/*!50001 DROP VIEW IF EXISTS `v_adocoes_adotante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_adocoes_adotante` AS select `ad`.`nome` AS `nome`,`ad`.`email` AS `email`,count(`a`.`id_adocao`) AS `QtdAdocoes` from (`adocao` `a` join `adotante` `ad` on(`a`.`id_adotante` = `ad`.`id_adotante`)) group by `ad`.`nome`,`ad`.`email` order by count(`a`.`id_adocao`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animais_disponiveis`
--

/*!50001 DROP VIEW IF EXISTS `v_animais_disponiveis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animais_disponiveis` AS select `e`.`nome_especie` AS `especie`,`r`.`nome_raca` AS `raca`,`a`.`nome` AS `nome`,`a`.`idade` AS `idade`,`a`.`status` AS `status` from ((`animal` `a` join `raca` `r` on(`a`.`id_raca` = `r`.`id_raca`)) join `especie` `e` on(`a`.`id_especie` = `e`.`id_especie`)) order by `e`.`nome_especie`,`a`.`status`,`a`.`idade` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animais_disponiveis_sem_vacina`
--

/*!50001 DROP VIEW IF EXISTS `v_animais_disponiveis_sem_vacina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animais_disponiveis_sem_vacina` AS select `a`.`nome` AS `NomeAnimal`,`a`.`idade` AS `idade`,`a`.`sexagem` AS `sexagem` from (`animal` `a` left join `vacina_animal` `va` on(`a`.`id_animal` = `va`.`id_animal`)) where `a`.`status` = 'Disponível' and `va`.`id` is null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animais_especie_raca`
--

/*!50001 DROP VIEW IF EXISTS `v_animais_especie_raca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animais_especie_raca` AS select `r`.`nome_raca` AS `NomeRaca`,`e`.`nome_especie` AS `NomeEspecie`,`a`.`nome` AS `NomeAnimal`,`a`.`idade` AS `idade` from ((`animal` `a` join `especie` `e` on(`a`.`id_especie` = `e`.`id_especie`)) join `raca` `r` on(`a`.`id_raca` = `r`.`id_raca`)) order by `a`.`idade` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animaisvacinados`
--

/*!50001 DROP VIEW IF EXISTS `v_animaisvacinados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animaisvacinados` AS select `a`.`nome` AS `nome`,`v`.`nome_vacina` AS `nome_vacina`,`va`.`data_aplicacao` AS `data_aplicacao` from ((`animal` `a` join `vacina_animal` `va` on(`a`.`id_animal` = `va`.`id_animal`)) join `vacina` `v` on(`va`.`id_vacina` = `v`.`id_vacina`)) order by `a`.`nome`,`va`.`data_aplicacao` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_media_vacinas_aplicadas_ano`
--

/*!50001 DROP VIEW IF EXISTS `v_media_vacinas_aplicadas_ano`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_media_vacinas_aplicadas_ano` AS select year(`va`.`data_aplicacao`) AS `Ano`,count(`va`.`id_vacina`) AS `TotalAplicacoes`,round(count(`va`.`id_vacina`) / count(distinct `va`.`id_animal`),2) AS `MediaVacinasPorAnimal` from `vacina_animal` `va` group by year(`va`.`data_aplicacao`) order by year(`va`.`data_aplicacao`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_total_aniamais_raca`
--

/*!50001 DROP VIEW IF EXISTS `v_total_aniamais_raca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_uca1400_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_total_aniamais_raca` AS select `r`.`nome_raca` AS `NomeRaca`,count(0) AS `QtdDeAniamis` from (`animal` `a` join `raca` `r` on(`a`.`id_raca` = `r`.`id_raca`)) group by `r`.`nome_raca` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12 17:40:36
