-- MySQL dump 10.19  Distrib 10.2.38-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cafe_db
-- ------------------------------------------------------
-- Server version       10.2.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cafe_db`
--

/*!40000 DROP DATABASE IF EXISTS `cafe_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cafe_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cafe_db`;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_number` int(5) NOT NULL AUTO_INCREMENT,
  `order_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2025-09-17 11:26:47',67.00);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `order_number` int(5) NOT NULL,
  `order_item_number` int(5) NOT NULL,
  `product_id` int(3) DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_number`,`order_item_number`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,3,4.50),(1,2,2,2,2.00),(1,3,3,5,12.50),(1,4,4,2,6.00),(1,5,5,2,7.00),(1,6,6,2,7.00),(1,7,7,6,18.00),(1,8,8,1,3.00),(1,9,9,2,7.00);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `product_group` int(2) NOT NULL DEFAULT 1,
  `image_url` varchar(256) DEFAULT 'images/default-image.jpg',
  PRIMARY KEY (`id`),
  KEY `product_group` (`product_group`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_group`) REFERENCES `product_group` (`product_group_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Croissant','Fresh, buttery and fluffy... Simply delicious!',1.50,1,'images/Croissants.jpg'),(2,'Donut','We have more than half-a-dozen flavors!',1.00,1,'images/Donuts.jpg'),(3,'Chocolate Chip Cookie','Made with Swiss chocolate with a touch of Madagascar vanilla',2.50,1,'images/Chocolate-Chip-Cookies.jpg'),(4,'Muffin','Banana bread, blueberry, cranberry or apple',3.00,1,'images/Muffins.jpg'),(5,'Strawberry Blueberry Tart','Bursting with the taste and aroma of fresh fruit',3.50,1,'images/Strawberry-Blueberry-Tarts.jpg'),(6,'Strawberry Tart','Made with fresh ripe strawberries and a delicious whipped cream',3.50,1,'images/Strawberry-Tarts.jpg'),(7,'Coffee','Freshly-ground black or blended Columbian coffee',3.00,2,'images/Coffee.jpg'),(8,'Hot Chocolate','Rich and creamy, and made with real chocolate',3.00,2,'images/Cup-of-Hot-Chocolate.jpg'),(9,'Latte','Offered hot or cold and in various delicious flavors',3.50,2,'images/Latte.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_group`
--

DROP TABLE IF EXISTS `product_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_group` (
  `product_group_number` int(3) NOT NULL,
  `product_group_name` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_group_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_group`
--

LOCK TABLES `product_group` WRITE;
/*!40000 ALTER TABLE `product_group` DISABLE KEYS */;
INSERT INTO `product_group` VALUES (1,'Pastries'),(2,'Drinks');
/*!40000 ALTER TABLE `product_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-17 16:45:58

####################################################################################################################
###############################  AFTER UPDATING ORDERS ON WEBSITE#####################################################################################
####################################################################################################################


-- MySQL dump 10.19  Distrib 10.2.38-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cafe_db
-- ------------------------------------------------------
-- Server version       10.2.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cafe_db`
--

/*!40000 DROP DATABASE IF EXISTS `cafe_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cafe_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cafe_db`;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_number` int(5) NOT NULL AUTO_INCREMENT,
  `order_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2025-09-18 05:50:38',78.00);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `order_number` int(5) NOT NULL,
  `order_item_number` int(5) NOT NULL,
  `product_id` int(3) DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_number`,`order_item_number`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,3,4.50),(1,2,2,6,6.00),(1,3,3,5,12.50),(1,4,4,2,6.00),(1,5,5,3,10.50),(1,6,6,3,10.50),(1,7,7,4,12.00),(1,8,8,3,9.00),(1,9,9,2,7.00);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `product_group` int(2) NOT NULL DEFAULT 1,
  `image_url` varchar(256) DEFAULT 'images/default-image.jpg',
  PRIMARY KEY (`id`),
  KEY `product_group` (`product_group`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_group`) REFERENCES `product_group` (`product_group_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Croissant','Fresh, buttery and fluffy... Simply delicious!',1.50,1,'images/Croissants.jpg'),(2,'Donut','We have more than half-a-dozen flavors!',1.00,1,'images/Donuts.jpg'),(3,'Chocolate Chip Cookie','Made with Swiss chocolate with a touch of Madagascar vanilla',2.50,1,'images/Chocolate-Chip-Cookies.jpg'),(4,'Muffin','Banana bread, blueberry, cranberry or apple',3.00,1,'images/Muffins.jpg'),(5,'Strawberry Blueberry Tart','Bursting with the taste and aroma of fresh fruit',3.50,1,'images/Strawberry-Blueberry-Tarts.jpg'),(6,'Strawberry Tart','Made with fresh ripe strawberries and a delicious whipped cream',3.50,1,'images/Strawberry-Tarts.jpg'),(7,'Coffee','Freshly-ground black or blended Columbian coffee',3.00,2,'images/Coffee.jpg'),(8,'Hot Chocolate','Rich and creamy, and made with real chocolate',3.00,2,'images/Cup-of-Hot-Chocolate.jpg'),(9,'Latte','Offered hot or cold and in various delicious flavors',3.50,2,'images/Latte.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_group`
--

DROP TABLE IF EXISTS `product_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_group` (
  `product_group_number` int(3) NOT NULL,
  `product_group_name` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_group_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_group`
--

LOCK TABLES `product_group` WRITE;
/*!40000 ALTER TABLE `product_group` DISABLE KEYS */;
INSERT INTO `product_group` VALUES (1,'Pastries'),(2,'Drinks');
/*!40000 ALTER TABLE `product_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-18  9:52:53