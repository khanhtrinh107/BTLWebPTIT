-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: btlweb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
                            `category_id` int NOT NULL AUTO_INCREMENT,
                            `category_name` varchar(255) DEFAULT NULL,
                            `description` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Short stories','Truyện dành cho người ít thời gian'),(2,' Horror stories','Truyện dành cho người thích mạo hiểm'),(3,'Information Technology','Dành cho sinh viên IT');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
                           `comment_id` int NOT NULL AUTO_INCREMENT,
                           `content` varchar(255) DEFAULT NULL,
                           `product_id` int DEFAULT NULL,
                           `user_id` int DEFAULT NULL,
                           PRIMARY KEY (`comment_id`),
                           KEY `FKm1rmnfcvq5mk26li4lit88pc5` (`product_id`),
                           KEY `FKqm52p1v3o13hy268he0wcngr5` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (4,'Thử bình luận',5,2),(5,'Người bắt đầu học lập trình có nên đọc quyển này không ?',6,2),(7,'It\'s very hard to understand',1,2),(10,'Người mới học lập trình thì quyển sách này đọc có ổn không?',22,5);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `init_price` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `sale_order_id` int DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKb8bg2bkty0oksa3wiq5mp5qnc` (`product_id`),
  KEY `FK707nssnvuslhihrh0s9dmltvx` (`sale_order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,200,6,2,1),(2,15.5,1,1,2),(3,7.5,1,6,2),(4,7.989999771118164,2,5,3),(5,83.94000244140625,1,2,4),(6,7.5,1,6,4),(7,15.5,2,1,5),(8,7.5,1,6,5);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `publication_date` datetime DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Craig Walls','Featured by Tableau as the first of \"7 Books About Machine Learning for Beginners.\" Ready to spin up a virtual GPU instance and smash through petabytes of data? Want to add \'Machine Learning\' to your LinkedIn profile','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684223110/z9g1taru5i0kqzdox7gq.jpg','15.50','Machine Learning for Absolute Beginners: A Plain English Introduction','2001-05-12 00:00:00',3),(2,'Craig Walls','Present book covers new paradigms in Blockchain, Big Data and Machine Learning concepts including applications and case studies. It explains dead fusion in realizing the privacy and security of blockchain based data analytic environment.','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684223918/mrjtfqqbaa2gufrsmuw1.jpg','83.94','Blockchain, Big Data and Machine Learning: Trends and Applications','2001-05-12 00:00:00',3),(5,'Olga Filipova','You\'ll start at the beginning, figuring out how the web and website pages work, and then work consistently from there on.','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684223656/u3sjcpdcfqdoetp7ok2z.jpg','7.99','Javascript & HTML CSS: WordPress Or HTML: CSS Website Design: The Basics: JavaScript Web Development Techniques','2001-05-12 00:00:00',3),(6,'Craig Walls','Java is currently among the most widely used programming languages. It is particularly popular among programming beginners, because the language is both powerful and free of error-prone concepts, such as pointer arithmetic.','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684223835/bxmxhzh8aycfl8uc4ddo.jpg','7.50','Java Programming for Beginners: Learn Programming Without Previous Knowledge','2021-12-12 00:00:00',3),(7,'Barbara Kingsolver','A NEW YORK TIMES \"TEN BEST BOOKS OF 2022\"\r\n\r\nAn Oprah\'s Book Club Selection - An Instant New York Times Bestseller - An Instant Wall Street Journal ','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222013/xwmshrejrnjlgb9vojhs.jpg','30.23','Demon Copperhead: An Oprah\'s Book Club Pick','2022-10-08 00:00:00',1),(8,'Hernan Diaz','Even through the roar and effervescence of the 1920s, everyone in New York has heard of Benjamin and Helen Rask. He is a legendary Wall Street tycoon; she is the daughter of eccentric aristocrats.','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222200/gzvtrwfw0izsngxyx8mk.jpg','26.04','Trust (Pulitzer Prize Winner)','2023-02-05 00:00:00',1),(9,'Jefferson Cowie','A prize-winning historian chronicles a sinister idea of freedom: white Americans\' freedom to oppress others and their fight against the government that got in their way.','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222276/ox3hvq0t9ot0smjrnnvc.jpg','32.55','Freedom\'s Dominion: A Saga of White Resistance to Federal Power','2023-10-11 00:00:00',1),(10,'Beverly Gage','\"Masterful...This book is an enduring, formidable accomplishment, a monument to the power of biography [that] now becomes the definitive work\"--The Washington Post\r\n\"A nuanced portrait in a league with the best of Ron Chernow and David McCullough.\"','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222339/gajyv2cuqmcd63pbuymc.jpg','41.58','G-Man: J. Edgar Hoover and the Making of the American Century','2923-10-11 00:00:00',1),(11,'Carl Phillips','Carl Phillips has aptly described his work as an \"ongoing quest\"; Then the War is the next step in that meaningful process of self-discovery for both the poet and his reader. The new poems, written in a time of rising racial conflict in the United States','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222439/iz8fgi02inxmhh6frfdx.jpg','18.60','Then the War: And Selected Poems, 2007-2020','2024-02-02 00:00:00',1),(12,'HUA HSU','NATIONAL BOOK CRITICS CIRCLE AWARD WINNER - A gripping memoir on friendship, grief, the search for self, and the solace that can be found through art, by the New Yorker staff writer Hua Hsu','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222522/hzzkxvdts95c5mtfnss0.jpg','24.18','Stay True: A Memoir Hua Hsu (Author)','2024-03-09 00:00:00',1),(13,'Ronnie Rush','In interviews, whether on the radio or on television, when the host would ask me, \"Ronnie, why did you write your first book?\" My answer always is that if I could just save the life of one person reading my book, then I have done my job','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222716/oixq787uejcqbpiy9vr6.jpg','18.55','Walk a Mile in My Shoes','2022-07-11 00:00:00',1),(14,'Christina Gerhardt','A stunning atlas of the present and future.\"--Rebecca Solnit, author of several books including Infinite Cities: A Trilogy of Atlases--San Francisco, New Orleans, New York\r\nThis immersive portal to islands around the world ','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222846/qvdjjuhkngxjem9ilno2.jpg','32.50','Sea Change: An Atlas of Islands in a Rising Ocean','2024-11-05 00:00:00',1),(15,'Yasmine Cheyenne','\"With calm and compassionate power, Yasmine is helping us to find our way back home--back to our own selves.\"','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684222997/bstetodurdwh6zuwdlne.jpg','23.24','The Sugar Jar: Create Boundaries, Embrace Self-Healing, and Enjoy the Sweet Things in Life','2024-03-12 00:00:00',1),(16,'Magnus Larsson','Understand the challenges of building large-scale microservice landscapes\r\nBuild cloud-native production-ready microservices with this comprehensive guide','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684223451/ododtoelggx2bxe0rtwa.jpg','72.44','Hands-On Microservices with Spring Boot and Spring Cloud','2020-08-09 00:00:00',3),(17,'John Au-Yeung','Kick-start your Vue.js development career by learning the fundamentals of Vue 3 and its integration with modern web technologies such as Electron, GraphQL, Ionic, and Laravel','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684223542/tcb3ainj10v4hljzdrb9.jpg','48.29','Vue.js 3 By Example: Blueprints to learn Vue web development','2023-02-04 00:00:00',3),(18,'Craig Walls','A developer-focused guide to writing applications using Spring Boot. You\'ll learn how to bypass the tedious configuration steps so that you can concentrate on your application\'s behavior.','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684223733/os0hnqwbpqw197omvxgc.jpg','51.74','Spring Boot in Action','2016-03-01 00:00:00',3),(19,'Kyle Loudon','Accelerated C++: Practical Programming, written by Andrew Koenig. This introductory book that takes a practical approach to solve problems using C++. It covers a wide der scope of C++ programming than other introductory books.','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684226150/wfacmsqryd9dkkzhue9u.jpg','20.15','C++ Pocket Reference','2016-02-12 00:00:00',3),(20,'Stanley Lippman','C++ Primer (5th Edition) 5th Edition written by Stanley B, introduces the C++ standard library from the outset. ','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684226221/xqjpu8jpxi9zfhmx0yah.jpg','15.25','C++ Primer ','2018-03-05 00:00:00',3),(21,'Paul Barry','Want to learn the Python language without slogging your way through how to manuals? With Head First Python, you’ll quickly grasp Python’s fundamentals, working with the built in data structures and functions','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684226599/hurrlukxa2ymrmpp9x3d.jpg','21.87','Head First Python: A Brain-Friendly Guide 2nd Edition','2018-03-12 00:00:00',3),(22,'David Beazley','Python educator Dave Beazley’s concise handbook focuses on the essential core of the Python programming language, with code examples to illuminate how Python works and how to structure programs that can be more easily explained','https://res.cloudinary.com/dskoc6e8s/image/upload/v1684226834/tzbov7tjwhyfnixdbl4v.jpg','29.99','Python Distilled (Developer\'s Library) 1st Edition','2022-10-09 00:00:00',3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `rf_token` varchar(255) DEFAULT NULL,
                                 `user_id` int DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `FKjtx87i0jvq2svedphegvdwcuy` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` VALUES (14,'eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbklkIjpudWxsLCJleHAiOjE2ODQ5OTU1MjB9.y_SXIwUws-xGSea4iJ7Nk8xrw3ziqlE5MhuRbV-qxkRE2Dmte9LmJqe5GdrG4ZHGu0ZnV8b1yV3EaYFRkOxgKA',5),(23,'eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbklkIjpudWxsLCJleHAiOjE2ODQ5OTcwMjh9.fTCsZcR3gdmWDWJ4whj_nqHH6E76IV1LoUaFCj2YPZG6cNaNogd5s7gpmhI6ItBcvd-iursBI6uD06PhJFDvNw',7),(28,'eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbklkIjpudWxsLCJleHAiOjE2ODUwMDQyNzl9.4CBEZ4VgHLJMXTwEg8v_AEt1BK1n1BayaJUtCqvmdSqKuM0HjsfdDV6U6lo_lfvHgg6mgX6JAzr8KjOajBruWQ',2),(29,'eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbklkIjpudWxsLCJleHAiOjE2ODUwMDQzMjh9.bLZ2vBJ1Xd6fqQ-6FVviKsw94-0lj8CcCJ6xt0paDY9XZaCa4FRPTEmuL81AjJoNaTyeQaYEWIOw_miXDNXb3Q',2),(30,'eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbklkIjpudWxsLCJleHAiOjE2ODUwMDQzNTV9.RvwmVCXj5p-ICXUsZSQeJVxFhUqHdFlm8-vfdjXI1NmwiJLJZ-CoBrXTiXipODpoMYtSD1XyMiq0vtjk5o-9qw',2),(32,'eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbklkIjpudWxsLCJleHAiOjE2ODUwMDQ1ODl9.RDdXNU8Xc9-v5DP3dZCxpQdgXjGd8XqQSW4NaUlS29t51Jh2wSeGroLJ3c6MA4VA-_ZkRCWvdSkem9nSz6Jw8g',7);
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
                        `role_id` int NOT NULL AUTO_INCREMENT,
                        `role_name` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'ROLE_USER'),(1,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
                              `sale_order_id` int NOT NULL AUTO_INCREMENT,
                              `amount` double NOT NULL,
                              `user_id` int DEFAULT NULL,
                              `voucher_id` int DEFAULT NULL,
                              PRIMARY KEY (`sale_order_id`),
                              KEY `FKp29n8o5c3chivtvttapqo177n` (`user_id`),
                              KEY `FKdn0toqxa7pa5p44fse85c65ev` (`voucher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (3,15.98,5,NULL),(4,91.44,5,NULL);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
                             `user_id` int NOT NULL,
                             `role_id` int NOT NULL,
                             PRIMARY KEY (`user_id`,`role_id`),
                             KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,2),(3,2),(4,2),(5,2),(6,1),(7,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_voucher`
--

DROP TABLE IF EXISTS `user_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_voucher` (
                                `user_voucher_id` int NOT NULL AUTO_INCREMENT,
                                `user_id` int DEFAULT NULL,
                                `voucher_id` int DEFAULT NULL,
                                PRIMARY KEY (`user_voucher_id`),
                                KEY `FKqbre9r4sb85kdd0q1d9fa8c9m` (`user_id`),
                                KEY `FK5llb4x2ixiwa75csgei7hbl5r` (`voucher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_voucher`
--

LOCK TABLES `user_voucher` WRITE;
/*!40000 ALTER TABLE `user_voucher` DISABLE KEYS */;
INSERT INTO `user_voucher` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,2),(5,3,3);
/*!40000 ALTER TABLE `user_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `user_id` int NOT NULL AUTO_INCREMENT,
                         `email` varchar(255) DEFAULT NULL,
                         `first_name` varchar(255) DEFAULT NULL,
                         `last_name` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL,
                         `username` varchar(255) DEFAULT NULL,
                         PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'khanhtrinh107@gmail.com','khanh','trinh','$2a$10$BQjz0CcsSJgykOHgqunG3e0oS2XwQJJvi9YCwbbhumTnBuJYhGZC2','khanhtrinh2401'),(2,'khanh10@gmail.com','khanh','khanh','$2a$10$pN1Ynad.YJsdyk6WrlflVux3ENqWsgjcQnWxMSPCJlLb.gljHTHmm','khanhkhanhkhanh'),(3,'quynhchi5822@gmail.com','chi','tran','$2a$2a$10$pN1Ynad.YJsdyk6WrlflVux3ENqWsgjcQnWxMSPCJlLb.gljHTHmm','quynhchi5822'),(4,'khanhtrinh@gmail.com','khanh','trinh','$2a$10$xo3TtO0A2kazo71wpLQbROgM9TAMnPGYZYJamogldQtG/SALYHgt2','khanhtrinh');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
                           `voucher_id` int NOT NULL AUTO_INCREMENT,
                           `code` varchar(255) DEFAULT NULL,
                           `persen` int NOT NULL,
                           PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (1,'khanhdeptrai',50),(2,'btlweb',25),(3,'02042001',30),(4,NULL,0);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18 17:11:02
