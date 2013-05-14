-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: studyworx3_dev
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

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
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `scoresheet_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `resources` text COLLATE utf8_unicode_ci,
  `instructions` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assignments_on_school_id_and_module_and_position` (`school_id`,`module`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (3,2,52,1,2,'Titus',3,1,'None','None','2013-01-31 20:48:56','2013-04-10 16:25:48'),(4,2,NULL,1,3,'Ephesians',3,1,'None','None','2013-01-31 20:55:09','2013-02-10 01:56:51'),(5,2,NULL,NULL,2,'Galatians',3,1,'None','# General Instructions\r\n\r\n>>>\r\nBe excellent dude!\r\n\r\n***And have fun***','2013-01-31 20:56:36','2013-03-13 03:07:56'),(6,2,46,1,1,'Philippians',2,1,'None','None','2013-01-31 21:13:13','2013-03-25 02:45:49'),(8,2,NULL,0,2,'Exodus',5,2,'None','None','2013-02-04 18:52:38','2013-02-04 18:53:08'),(9,2,1,1,4,'Genesis',10,1,'None','Work like a dog.','2013-04-01 19:30:02','2013-04-01 19:30:02');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `topic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `article` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `leadstory` tinyint(1) DEFAULT NULL,
  `navbar` tinyint(1) DEFAULT NULL,
  `content_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (2,1,'Development','First Thoughts so','','#### Here we go building out StudyWorx 3!\r\n\r\nI love it I think. Pretty sweet.\r\nDoes this kick a new line?\r\n\r\n- Here\'s a point.\r\n- And another\r\n    - Now we are cooking.\r\n    - Love it.\r\n\r\n---','2012-10-27 17:50:35','2013-05-07 00:00:24',0,0,0,0),(3,1,'Getting Started','Creating a New School','','## Creating a School\r\n\r\nBefore you begin you will need to be at least a level 1 Administrator. If you do not know what that means you will need to contact the site administrator here. \r\n\r\nOnce you have been promoted to a site administrator you should then have a new entry in your profile menu.\r\n\r\nClick on the link called \"School Administration\".\r\n\r\nEnjoy!\r\n\r\n{:> Tom Possin','2012-11-06 23:08:20','2013-05-06 23:59:19',1,0,1,0),(4,1,'Getting Started','Welcome to Studyworx 3!','','### [StudyWorx 3 - The next Level...](http://studyworx.net)\r\n\r\nStudyworx 3 is the next iteration of Studyworx. \r\n\r\nIt is a full featured online educational platform.^1b \r\nI guess that works ok.\r\n\r\n\r\n>Everything you ever wanted... if all you ever wanted was to chart.\r\n\r\n[Quickworx][1]\r\n[Studyworx][2]\r\n\r\n\r\n{:> Tom\r\n\r\n[1]: http://quickworx.info\r\n[2]: http://studyworx.net','2012-11-10 15:00:19','2013-05-02 21:08:55',1,1,NULL,0);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verse_count` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_books_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Gen','Genesis',1533,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(2,'Ex','Exodus',1213,'0000-00-00 00:00:00','0000-00-00 00:00:00',2),(3,'Lev','Leviticus',859,'0000-00-00 00:00:00','0000-00-00 00:00:00',3),(4,'Num','Numbers',1288,'0000-00-00 00:00:00','0000-00-00 00:00:00',4),(5,'Deut','Deuteronomy',959,'0000-00-00 00:00:00','0000-00-00 00:00:00',5),(6,'Josh','Joshua',658,'0000-00-00 00:00:00','0000-00-00 00:00:00',6),(7,'Jud','Judges',618,'0000-00-00 00:00:00','0000-00-00 00:00:00',7),(8,'Ru','Ruth',85,'0000-00-00 00:00:00','0000-00-00 00:00:00',8),(9,'Sam','1st-2nd Samuel',1505,'0000-00-00 00:00:00','0000-00-00 00:00:00',9),(10,'Kings','1st-2nd Kings',1535,'0000-00-00 00:00:00','0000-00-00 00:00:00',10),(11,'Chron','1st-2nd Chronicles',1764,'0000-00-00 00:00:00','0000-00-00 00:00:00',11),(12,'Ezra','Ezra',280,'0000-00-00 00:00:00','0000-00-00 00:00:00',12),(13,'Neh','Nehemiah',406,'0000-00-00 00:00:00','0000-00-00 00:00:00',13),(14,'Esth','Esther',167,'0000-00-00 00:00:00','0000-00-00 00:00:00',14),(15,'Job','Job',1070,'0000-00-00 00:00:00','0000-00-00 00:00:00',15),(16,'Pro','Proverbs',915,'0000-00-00 00:00:00','0000-00-00 00:00:00',17),(17,'Eccl','Ecclesiastes',222,'0000-00-00 00:00:00','0000-00-00 00:00:00',18),(18,'SoS','Song of Solomon',117,'0000-00-00 00:00:00','0000-00-00 00:00:00',19),(19,'Is','Isaiah',1292,'0000-00-00 00:00:00','0000-00-00 00:00:00',20),(20,'Jer','Jeremiah',1364,'0000-00-00 00:00:00','0000-00-00 00:00:00',21),(21,'Lam','Lamentations',154,'0000-00-00 00:00:00','0000-00-00 00:00:00',22),(22,'Ezek','Ezekiel',1273,'0000-00-00 00:00:00','0000-00-00 00:00:00',23),(23,'Dan','Daniel',357,'0000-00-00 00:00:00','0000-00-00 00:00:00',24),(24,'Hos','Hosea',197,'0000-00-00 00:00:00','0000-00-00 00:00:00',25),(25,'Joel','Joel',73,'0000-00-00 00:00:00','0000-00-00 00:00:00',26),(26,'Amos','Amos',146,'0000-00-00 00:00:00','0000-00-00 00:00:00',27),(27,'Obad','Obadiah',21,'0000-00-00 00:00:00','0000-00-00 00:00:00',28),(28,'Jonah','Jonah',48,'0000-00-00 00:00:00','0000-00-00 00:00:00',29),(29,'Mic','Micah',105,'0000-00-00 00:00:00','0000-00-00 00:00:00',30),(30,'Nahum','Nahum',47,'0000-00-00 00:00:00','0000-00-00 00:00:00',31),(31,'Hab','Habakkuk',56,'0000-00-00 00:00:00','0000-00-00 00:00:00',32),(32,'Zeph','Zephaniah',53,'0000-00-00 00:00:00','0000-00-00 00:00:00',33),(33,'Hag','Haggai',38,'0000-00-00 00:00:00','0000-00-00 00:00:00',34),(34,'Zech','Zechariah',211,'0000-00-00 00:00:00','0000-00-00 00:00:00',35),(35,'Mal','Malachi',55,'0000-00-00 00:00:00','0000-00-00 00:00:00',36),(36,'Matt','Matthew',1071,'0000-00-00 00:00:00','0000-00-00 00:00:00',37),(37,'Mark','Mark',678,'0000-00-00 00:00:00','0000-00-00 00:00:00',38),(38,'Lu','Luke',1151,'0000-00-00 00:00:00','0000-00-00 00:00:00',39),(39,'John','John',879,'0000-00-00 00:00:00','0000-00-00 00:00:00',40),(40,'Acts','Acts',1007,'0000-00-00 00:00:00','0000-00-00 00:00:00',41),(41,'Rom','Romans',433,'0000-00-00 00:00:00','0000-00-00 00:00:00',42),(42,'1Cor','1st Corinthians',437,'0000-00-00 00:00:00','0000-00-00 00:00:00',43),(43,'2Cor','2nd Corinthians',257,'0000-00-00 00:00:00','0000-00-00 00:00:00',44),(44,'Gal','Galatians',149,'0000-00-00 00:00:00','0000-00-00 00:00:00',45),(45,'Eph','Ephesians',155,'0000-00-00 00:00:00','0000-00-00 00:00:00',46),(46,'Phil','Philippians',104,'0000-00-00 00:00:00','0000-00-00 00:00:00',47),(47,'Col','Colossians',95,'0000-00-00 00:00:00','0000-00-00 00:00:00',48),(48,'1Thess','1st Thessalonians',89,'0000-00-00 00:00:00','0000-00-00 00:00:00',49),(49,'2Thess','2nd Thessalonians',47,'0000-00-00 00:00:00','0000-00-00 00:00:00',50),(50,'1Tim','1st Timothy',113,'0000-00-00 00:00:00','0000-00-00 00:00:00',51),(51,'2Tim','2nd Timothy',83,'0000-00-00 00:00:00','0000-00-00 00:00:00',52),(52,'Titus','Titus',46,'0000-00-00 00:00:00','0000-00-00 00:00:00',53),(53,'Philemon','Philemon',25,'0000-00-00 00:00:00','0000-00-00 00:00:00',54),(54,'Heb','Hebrews',303,'0000-00-00 00:00:00','0000-00-00 00:00:00',55),(55,'James','James',108,'0000-00-00 00:00:00','0000-00-00 00:00:00',56),(56,'1Pe','1st Peter',105,'0000-00-00 00:00:00','0000-00-00 00:00:00',57),(57,'2Pe','2nd Peter',61,'0000-00-00 00:00:00','0000-00-00 00:00:00',58),(58,'1John','1st John',105,'0000-00-00 00:00:00','0000-00-00 00:00:00',59),(59,'2John','2nd John',13,'0000-00-00 00:00:00','0000-00-00 00:00:00',60),(60,'3John','3rd John',14,'0000-00-00 00:00:00','0000-00-00 00:00:00',61),(61,'Jude','Jude',25,'0000-00-00 00:00:00','0000-00-00 00:00:00',62),(62,'Rev','Revelation',404,'0000-00-00 00:00:00','0000-00-00 00:00:00',63),(64,'Ps','Psalms',2400,'0000-00-00 00:00:00','0000-00-00 00:00:00',16);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charttexts`
--

DROP TABLE IF EXISTS `charttexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charttexts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `content` text,
  `staff_note` text,
  `content_type` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_charttexts_on_user_id_and_title_id` (`user_id`,`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charttexts`
--

LOCK TABLES `charttexts` WRITE;
/*!40000 ALTER TABLE `charttexts` DISABLE KEYS */;
INSERT INTO `charttexts` VALUES (1,1,872,'# What the heck?\r\n\r\n***Page one.***\r\n\r\n>So far so good. Saving way too often though.\r\nOnce more ok how about now? I hope it works now.\r\n\r\nCan you count. Well how about now? Does this thing. Still can\'t count very well.\r\n\r\nHow about now? Well I guess if it is a bit erratic I can live with it.\r\n\r\nCan you count? I wonder?\r\n>So far so good - well this should go off soon. I guess it works now.\r\n\r\n>Not sure why it has so much trouble counting though.\r\n\r\nHow about leaving?\r\n\r\nThis is really going to work now.\r\n\r\nAll I have to do is type and it will catch up as I go\r\n\r\nThis is getting exciting!!!\r\n\r\nAll I have to do is to keep typing.\r\n\r\nNow we are really moving along.\r\n\r\nOk hoser. I think this is getting really old now.\r\nIt must be some kind of thing now.\r\n\r\nA few mor lines\r\n\r\nAnd a few more\r\n\r\nAnd then a few more.\r\n\r\nAnd here we go!!\r\n\r\nMaybe a bit more. Is in order\r\n\r\n* Some bullets\r\n* Another one here.\r\n    * And again here we go.\r\n    * So let\'s keep typing.\r\n    * It should be fun\r\n      Maybe a bit more in this paragraph.\r\n      \r\n      This should be a new paragraph.  I guess it should look ok to the casual observer. \r\n\r\nNow a fresh line. It should look good.\r\n\r\nOne more line here and it should work still.\r\n\r\nAnd as night falls in the sleepy little town of Frostbite Falls. We find our heros shivering in the cold on an old abandoned railyard. \r\n\r\n#### This is next\r\n\r\nI think you know what I am talkig about. This is really starting to work now. I am excited. What did I do now?? seems a bit weird. But now it seems to work again. \r\nSeriously\r\n\r\nHow nice. I hope it keeps working.\r\n\r\nNow let\'s get to the bottom of this thing and see of it really works no matter how far down the page you go.\r\n\r\nI just don\'t get this but it is really working here. It must work in the other one as well.\r\n\r\nThis is crazy. No idea why these are different.\r\n\r\nWell how about this?\r\n\r\nI am not sure this is ever going to work right.\r\n\r\nNow what is happening here??\r\nThis seems nutty.\r\n\r\nStill now idea what is going on here. But hey who knows?\r\n\r\nNow is this thing working or what??\r\n\r\nNo idea really. But I will keep on typing.\r\n\r\nOk whatever this is I will take it.\r\n\r\nSo now what happens??\r\n\r\nOk one more time.\r\n\r\n\r\n\r\n\r\n',NULL,0,'2013-04-06 22:33:33','2013-04-08 21:19:04'),(2,1,873,'# What the heck?\r\n\r\nPage Two.\r\nOk it is going on every third key stroke.\r\n\r\nI think the leaving thing is working now.\r\n\r\n',NULL,0,'2013-04-06 22:52:35','2013-04-08 03:15:45'),(3,1,874,'# What the heck?\r\n\r\nPage Three.\r\nIt is totally bizarre. \r\n\r\nLine again. Not sure why this thing can not count anymore.\r\n\r\nWell I think this is interesting but way too frequent.\r\n\r\nWhy can\'t this thing count at times. I have no idea. At other times it seems to count ok. But then again.\r\n\r\n#### Observation\r\n\r\n**PO [W]** v1 yep yep\r\n\r\n* SO Who else is with him?\r\n    * Titus v2\r\n    * Timothy v2\r\n\r\n##### Interpretation\r\n\r\n**SOR** This would be important so that they could tell who the cool people were. \r\n\r\n\r\n',NULL,0,'2013-04-07 12:59:29','2013-04-09 01:10:35'),(4,2,901,NULL,NULL,0,'2013-04-09 01:51:08','2013-04-09 01:51:08'),(5,3,930,'#### Observation\r\n\r\nHere we go friends.\r\n\r\n',NULL,0,'2013-04-09 01:53:00','2013-04-09 01:55:03'),(6,3,931,NULL,NULL,0,'2013-04-09 01:53:25','2013-04-09 01:53:25'),(7,3,932,NULL,NULL,0,'2013-04-09 01:53:27','2013-04-09 01:53:27'),(8,3,946,'#### Observation\r\n\r\n**PO v1 [W]** Paul to Titus\r\n\r\n* SO\'s\r\n	* SO v2 [W] churches or Crete\r\n	* Here is another\r\n	* Here is another\r\n	* Here is another\r\n* And all is well.\r\n	* I think you get the idea now.\r\n	* Yep this speeds things up a lot.^1\r\n	* Makes this editor really nice. ^2\r\n\r\n##### Interpretation\r\n\r\n**SOR**\r\nPaul wants Titus to understand the importance of solid leadership in the church and also to fully understand his role in establishing it. \r\n\r\n###### Application\r\n\r\n**TT** - Leadership requires good character v8\r\n\r\n**SCR**\r\nThis is more true today than ever as we witness one Christian leader after another falling apart and sinking entire congregations into spiritual chaos.\r\n\r\n###### This is just to make it bigger\r\n\r\n* I mean big\r\n* oh so big\r\n	* Really big\r\n	* Tabby still works\r\n\r\nThis is all good.\r\n\r\n###### Titles are fun\r\n\r\nI just need to write more.\r\n\r\nA lot more\r\n\r\nAnd some more just for fun with some long lines and well as short lines just to see how things look when someone goes on and on and on without taking a break or putting in a period or anything.\r\n\r\nThen some more stuff would be fun as well. \r\n\r\n###### Another title\r\n\r\nAnd finally I think we should be on the next page.\r\n\r\nIF not maybe now.\r\n\r\nOk then just to be sure\r\n\r\nThe end I hope\r\n\r\n\r\n\r\n\r\n',NULL,0,'2013-04-10 16:33:33','2013-05-08 16:11:16'),(9,3,947,'#### Observation\r\n\r\n**PO [cnc] 3:1** connected to stuff\r\n\r\n* SO - What is connected here?\r\n	1. Well there is this\r\n	2. And then there is that\r\n		* Yep Yep\r\n	3. Does the numbering work?\r\n	4. Sure does\r\n\r\n_So this is over then, always remember to add the extra line._\r\n\r\n\r\n##### Interpretation\r\n\r\n**SOR** This is why this is important to the OR I guess. Should be working well. Not sure what else we would need to do.\r\n\r\n###### Application\r\n\r\n**TT** 2:11 - False teachers should be silenced not ignored.\r\n\r\n**SCR** And this is why it matter today. pretty simple really.',NULL,0,'2013-04-10 23:45:55','2013-04-11 01:14:46'),(10,2,960,'',NULL,0,'2013-04-14 21:40:37','2013-04-14 21:40:44'),(11,3,1284,NULL,NULL,0,'2013-04-20 19:23:23','2013-04-20 19:23:23'),(12,3,1285,NULL,NULL,0,'2013-04-20 19:23:36','2013-04-20 19:23:36'),(13,3,1286,NULL,NULL,0,'2013-04-20 19:23:38','2013-04-20 19:23:38'),(14,3,1287,NULL,NULL,0,'2013-04-20 19:23:39','2013-04-20 19:23:39'),(15,3,1288,NULL,NULL,0,'2013-04-20 19:23:40','2013-04-20 19:23:40'),(16,3,1289,NULL,NULL,0,'2013-04-20 19:23:41','2013-04-20 19:23:41'),(17,3,1290,NULL,NULL,0,'2013-04-20 19:23:42','2013-04-20 19:23:42'),(18,3,1291,NULL,NULL,0,'2013-04-20 19:23:43','2013-04-20 19:23:43'),(19,3,1292,NULL,NULL,0,'2013-04-20 19:30:34','2013-04-20 19:30:34'),(20,3,1293,NULL,NULL,0,'2013-04-20 19:30:36','2013-04-20 19:30:36'),(21,3,1294,NULL,NULL,0,'2013-04-20 19:30:58','2013-04-20 19:30:58'),(22,3,1295,NULL,NULL,0,'2013-04-20 19:31:00','2013-04-20 19:31:00'),(23,3,1296,NULL,NULL,0,'2013-04-20 19:36:12','2013-04-20 19:36:12'),(24,3,1297,NULL,NULL,0,'2013-04-20 19:36:13','2013-04-20 19:36:13'),(25,3,1298,NULL,NULL,0,'2013-04-20 19:36:14','2013-04-20 19:36:14'),(26,3,1299,NULL,NULL,0,'2013-04-20 19:36:15','2013-04-20 19:36:15'),(27,3,1300,NULL,NULL,0,'2013-04-20 19:36:57','2013-04-20 19:36:57'),(28,3,1301,NULL,NULL,0,'2013-04-20 19:36:59','2013-04-20 19:36:59'),(29,3,1302,NULL,NULL,0,'2013-04-20 19:37:00','2013-04-20 19:37:00'),(30,3,1303,NULL,NULL,0,'2013-04-20 19:37:01','2013-04-20 19:37:01'),(31,3,1304,NULL,NULL,0,'2013-04-20 19:37:02','2013-04-20 19:37:02'),(32,4,1319,'',NULL,0,'2013-05-06 18:43:50','2013-05-06 18:45:09'),(33,4,1320,NULL,NULL,0,'2013-05-06 18:44:03','2013-05-06 18:44:03'),(34,4,1321,NULL,NULL,0,'2013-05-06 18:45:01','2013-05-06 18:45:01'),(35,3,1322,'#### Observation\r\n**PO** Who Me that\'s who\r\n\r\n##### Interpretation\r\n\r\nThis is an interpretation I guess.\r\n\r\n###### Application\r\n\r\nThis is my sweet sweet app. Full of timeless goodness.\r\n\r\n	###^#^###\r\n	() * * ()\r\n	    |\r\n	   / \\\r\n\r\n',NULL,0,'2013-05-08 16:30:11','2013-05-09 18:16:26');
/*!40000 ALTER TABLE `charttexts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'white','White','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'#FCFB8E','Yellow','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'#efefef','Gray 1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'#93FC8E','Green','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'#BEF5BC','Green(light)','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'#FFFECA','Yellow(light)','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'#CCCAFF','Blue(light)','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'#6C67F9','Blue','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'#FFB5B6','Pink','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'#FFB5F5','Violet','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_hierarchies`
--

DROP TABLE IF EXISTS `comment_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_hierarchies` (
  `ancestor_id` int(11) NOT NULL,
  `descendant_id` int(11) NOT NULL,
  `generations` int(11) NOT NULL,
  UNIQUE KEY `index_comment_hierarchies_on_ancestor_id_and_descendant_id` (`ancestor_id`,`descendant_id`),
  KEY `index_comment_hierarchies_on_descendant_id` (`descendant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_hierarchies`
--

LOCK TABLES `comment_hierarchies` WRITE;
/*!40000 ALTER TABLE `comment_hierarchies` DISABLE KEYS */;
INSERT INTO `comment_hierarchies` VALUES (4,4,0),(4,15,1),(4,22,1),(5,5,0),(5,6,1),(5,7,1),(5,8,1),(5,9,1),(5,10,2),(5,11,2),(5,12,2),(5,13,2),(5,14,1),(5,16,2),(5,17,2),(5,18,2),(5,19,1),(5,20,2),(5,21,2),(5,23,1),(6,6,0),(6,10,1),(6,11,1),(6,12,1),(6,13,1),(6,16,1),(6,18,1),(10,10,0),(11,11,0),(12,12,0),(13,13,0),(14,14,0),(14,17,1),(14,21,1),(15,15,0),(16,16,0),(17,17,0),(18,18,0),(19,19,0),(19,20,1),(20,20,0),(21,21,0),(22,22,0),(23,23,0),(24,24,0),(24,25,1),(25,25,0),(26,26,0);
/*!40000 ALTER TABLE `comment_hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_task_id` (`task_id`),
  KEY `index_comments_on_parent_id` (`parent_id`),
  KEY `index_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (4,16,NULL,1,'Well this is a comment I wonder what it will do.','2013-05-04 18:35:42','2013-05-04 18:35:42'),(5,16,NULL,1,'I need to try this again.\r\n\r\n_I have no idea why it did not refresh_\r\n\r\n{:>','2013-05-04 18:38:42','2013-05-04 18:38:42'),(6,16,5,1,'Is it possible that this will work?','2013-05-04 18:59:11','2013-05-04 18:59:11'),(10,16,6,1,'Will this look ok?\r\nI hope so.\r\n**Yep I do**','2013-05-04 19:20:05','2013-05-04 19:20:05'),(11,16,6,1,'This is yet another comment on this stupid thread.\r\n\r\n{:>','2013-05-04 19:22:00','2013-05-04 19:22:00'),(12,16,6,1,'I need to do this again I guess.\r\nIt is getting boring now.\r\nBut hopefully it will work now.\r\n','2013-05-04 19:27:44','2013-05-04 19:27:44'),(13,16,6,1,'I need to do this again I guess.\r\nIt is getting boring now.\r\nBut hopefully it will work now.\r\n','2013-05-04 19:28:06','2013-05-04 19:28:06'),(14,16,5,1,'What about this lame thing?','2013-05-04 19:30:57','2013-05-04 19:30:57'),(15,16,4,1,'This is not totally nuts.\r\nIt is surprising at first, but on really big discussions this may actually be better.\r\n{:>','2013-05-04 19:31:47','2013-05-04 19:31:47'),(16,16,6,1,'This does make a bit of sense.\r\n','2013-05-04 19:32:22','2013-05-04 19:32:22'),(17,16,14,1,'Kind of weird I may go back to the old way of doing this.\r\nBut who knows,\r\n{:>','2013-05-04 19:32:54','2013-05-04 19:32:54'),(18,16,6,1,'This is much better.','2013-05-04 19:41:37','2013-05-04 19:41:37'),(19,16,5,1,'I am not sure about this one.\r\nWill this save?\r\nOne more time?\r\nAgain?','2013-05-04 20:30:23','2013-05-04 20:35:00'),(20,16,19,1,'How about now?','2013-05-04 20:35:13','2013-05-04 20:35:13'),(21,16,14,1,'Let\'s try another one right here.\r\n_maybe_ if I hold my mouth just right.\r\nThis thing will work\r\n\r\nSure hope so,\r\n{:>','2013-05-04 20:39:46','2013-05-04 20:39:46'),(22,16,4,1,'Does this work from the grading view? I hope so.','2013-05-04 21:35:17','2013-05-04 21:35:17'),(23,16,5,3,'This is one from One!\r\n\r\nThat\'s right it\'s another note.\r\n\r\n[Studyworx.net][1]\r\n\r\noNe\r\n\r\n[1]: http://studyworx.net \"Click Here!\"','2013-05-04 23:02:42','2013-05-04 23:07:25'),(24,16,NULL,3,'## This is nasty.\r\n\r\nSometimes without warning my stupid computer just decides to do something bazaar like just now it jumped to a different page while I was typing.\r\nSweet....\r\nI hate touchpads.\r\n\r\nOne\r\n','2013-05-04 23:10:29','2013-05-04 23:10:29'),(25,16,24,2,'Hey bucko,\r\nNice comment, I think this is really going to work.\r\nAwesome.\r\nBuster.','2013-05-04 23:11:18','2013-05-04 23:11:18'),(26,16,NULL,4,'Hey I can get in on this too!\r\n\r\nOr I mean Two!\r\n\r\nThat\'s right I am Two...\r\n\r\n_Sweet....._','2013-05-06 18:29:33','2013-05-06 18:29:33');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `content` mediumtext,
  `content_type` int(11) DEFAULT '0',
  `staff_note` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_documents_on_school_id_and_assignment_id_and_task_id` (`school_id`,`assignment_id`,`task_id`),
  KEY `index_documents_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (13,1,2,6,4,'Summary of Everything\r\n---------------------\r\n\r\nWell it all started a long long time ago. In a galaxy far far away.\r\n\r\nNot really but it is a good start for a story I think - don\'t you.\r\n\r\nOk how about a bit of autosaving?\r\n\r\n> > > -   I like **red bullets** because they are **faster**.\r\n> > > -   Also chicks *love* them.\r\n> > > -   This is a huge screen for playing around on.\r\n> > >\r\n> > >     -   I could go on and on.\r\n> > >     -   This is really working pretty good.\r\n> > >     -   I am not sure what people would not like about this.\r\n> > >     -   Here is another bullet but I am not seeing the save thing.\r\n\r\n> > > Ok, this is a new line. And the autosave thing works as well.\r\n\r\nThis should be working pretty well now.\r\n\r\n    Column1   Column2   Column3\r\n    -------   -------   -------\r\n       3         10        12\r\n',0,'This should work now','2013-03-07 04:12:58','2013-04-09 00:24:07'),(27,1,2,5,6,'Epistle BRI\r\n===========\r\n\r\n#### Critical Method\r\n\r\n### Authorship\r\n\r\n***Internal Evidence***\r\n\r\nWrite stuff here and it will show up over on the right.\r\n\r\nHere is another paragraph.\r\n\r\n- Here is a bullet\r\n- Here is another one.\r\n\r\n    - Another level\r\n    - Another one.\r\n\r\n> This is indented\r\n\r\n***External Evidence***\r\n\r\n***Conclusion***\r\n\r\n### Dating\r\n\r\n***Internal Evidence***\r\n\r\n***External Evidence***\r\n\r\n***Conclusion***\r\n\r\n### Recipient\r\n\r\n***Internal Evidence***\r\n\r\n***External Evidence***\r\n\r\n***Conclusion***\r\n\r\n#### Historical Method\r\n\r\n#### Survey Method\r\n\r\n### Signature\r\n\r\nPlease sign if you have done all the required readings:\r\n\r\n*Your name here*\r\n\r\n* * * * *\r\n',0,NULL,'2013-03-14 01:16:53','2013-04-09 00:50:18'),(28,1,2,6,1,'Epistle BRI\r\n===========\r\n\r\n#### Critical Method\r\n\r\n>_If you just want to type this is the way to do it. It will save as you go and you never have to think about it the rest of the year._\r\n\r\nHere the thing, yep yep it works with ctrl+s\r\n\r\n\r\n### Authorship\r\n\r\nInternal Evidence\r\n\r\n>\r\nOk one more time to see if things are really working the way they should. I guess at this point they seem to be working pretty good. I don\'t know about the virtual keyboard thing and the autosave. But time will tell. This should give people a pretty good understanding of what they are doing as they type.\r\n\r\nExternal Evidence\r\n\r\n>>\r\nIf you like green there is always this little feature. There is no doubt that some would like it. After a while it would become obvious that they really do not think about formatting all that much. If they want to highlight something or whatever it is pretty easy.\r\n\r\nConclusion\r\n\r\n### Dating\r\n\r\nInternal Evidence\r\n\r\nExternal Evidence\r\n\r\nConclusion\r\n\r\n### Recipient\r\n\r\nInternal Evidence\r\n\r\nExternal Evidence\r\n\r\nConclusion\r\n\r\n#### Historical Method\r\n\r\n#### Survey Method\r\n\r\n#### Signature\r\n\r\nPlease sign if you have done all the required readings:\r\n\r\nYour name here\r\n\r\nThis is below the bottom a bit but it seems to work now. Not sure what the dealio is.\r\n\r\nI don\'t know if this is a limit on how far you can scroll or what.\r\nThis is a pretty big thing no sure what the difference is.\r\n\r\n* Bullet\r\n* Bullet\r\n* Bullet\r\n* Bullet\r\n    * Bullet\r\n    * Bullet\r\n\r\nNow we got some weirdness going on.\r\nNot sure how else to explain this.\r\nHas to do with the measurements.\r\n\r\nWell let\'s see if this matters at all.\r\n\r\nNot really\r\n\r\nNot sure what this is all about but it is fried\r\n\r\nOk one more time bucko You suck.\r\n\r\nLet\'s try this again.\r\n\r\n\r\n\r\n',0,'Ok','2013-03-14 03:09:29','2013-04-08 20:46:54'),(29,1,2,6,3,'\r\n## What is Markdown?\r\n\r\n\r\n_Markdown is an easy way to format your documents without having to constantly highlight text and click buttons._\r\n_To use markdown you just add a few markers to your text and it will appear as nicely formatted text as soon as you save it._ **It even looks good as is**\r\n\r\n#### Adding Headings\r\n\r\nTo add a heading just put a pound sign(s) in front of your text. You can add up to 6 pound signs which will represent Headings 1 - 6.\r\n\r\n```\r\n# Heading 1\r\n## Heading 2\r\n### Heading 3\r\n#### Heading 4\r\n##### Heading 5\r\n###### Heading 6\r\n```\r\n\r\nAnd these headings will look like the following when you view them.\r\n# Heading 1\r\n\r\n## Heading 2\r\n\r\n### Heading 3\r\n\r\n#### Heading 4\r\n\r\n##### Heading 5\r\n\r\n###### Heading 6\r\n\r\n\r\n#### Adding other formatting\r\n\r\n\r\nBeside headings there are many other formats available. Here is an important rule.\r\n\r\n>**To change formats _always_ add a blank line above the text you wish to format.**\r\n\r\nIf you ever have a line that does not seem to format itself as expected, add blank lines above and below.\r\n\r\n#### Italic, Bold, and Bold Italic\r\nYou can use either * or _ to create the above formats it\'s really easy.\r\n\r\n~~~\r\n*Italic*\r\n**Bold**\r\n***Bold Italic***\r\n_Italic_\r\n__Bold__\r\n___Bold Italic___\r\n\r\n~~~\r\n\r\nEither of the above produce the following it\'s just a matter of preference:\r\n*Italic*\r\n**Bold**\r\n***Bold Italic***\r\n\r\n\r\n#### Indents and colors\r\n\r\nTo add indented text you simply need to add a > to the beginning of the first line. \r\nIt\'s as easy as this.\r\n\r\n```\r\n> Indented text begins like this...\r\nMore indented text.\r\n   < This blank line ends indentation >\r\nA fresh un-indented line\r\n\r\n```\r\nThis is what results from the above:\r\n\r\n> Indented text begins like this...\r\nMore indented text.\r\n\r\nA fresh un-indented line\r\n\r\n\r\n>>>**Adding Colored Indented test**\r\n\r\nTo use colored text do the following:\r\n\r\n```\r\n> This is indented black text.\r\n>> This is indented Green text.\r\n>>> This is indented Red text.\r\n\r\n```\r\n\r\n> This is indented black text.\r\n>> This is indented Green text.\r\n>>> This is indented Red text.\r\n\r\nThis is the same as the above:\r\n\r\n```\r\n>\r\nBlack indented text.\r\n>>\r\nGreen indented text\r\n>>>\r\nRed indented text.\r\n```\r\n\r\n#### Adding a Horizontal line\r\nTo draw a horizontal line across the page simply add 3 minus signs.\r\n\r\n    ---\r\n\r\nThis will make a nice looking line across the page.\r\n\r\n---\r\n\r\n#### Making Literal text.\r\n\r\nTo make text formatted exactly as you type it use a \"code block\". \r\n\r\n~~~\r\n\r\n~~~use three tilde\'s above\r\n\r\n    *\r\n     ^\r\n    ===\r\n  ========\r\n | <>  <> |\r\n \\    |   /\r\n    ~~~~\r\n    \\  /\r\n     \"\" \r\n~~~use three tilde\'s below \r\nto \"fence in\" your literal text.\r\n\r\n~~~\r\nAny text between these two lines of tilde\'s will be formatted just as it is typed and it will be contained in a box, just like the text above.\r\n\r\n#### Adding Bullets\r\n\r\nTo make bulleted text you just add a * with a space following and you will get a bullet.\r\n(make sure you have a blank line over the first bulleted line)\r\n\r\n    * Bulleted Text \r\nThis produces the following:\r\n\r\n* Bulleted Text \r\n\r\n**Nested Lists**\r\nBullets and Numbered lists can have many layers.\r\n\r\n    * First level Bullet text\r\n        * (Add 4 spaces in front)\r\n            * (Add 8 spaces and so on)\r\n\r\nThis will produce the following:\r\n\r\n* First level Bullet text\r\n    * (Add 4 space in front)\r\n        * (Add 8 spaces and so on)\r\n\r\n_You see that even without formatting it is perfectly readable as a nested list._\r\nNumbered lists work just like bulleted lists only you start each line with a number a period and a space.\r\n(Leave a blank line over your numbered lists too)\r\n\r\n    1. First level numbered list.\r\n        1. Second level\r\n        2. (use four spaces)\r\n            1. Third level\r\n            2. (use 8 spaces)\r\n    2. Another first level\r\n\r\nThis produces the following:\r\n\r\n1. First level numbered list.\r\n    1. Second level\r\n    2. (use four spaces)\r\n        1. Third level\r\n        2. (use 8 spaces)\r\n2. Another first level\r\n\r\n#### Creating Links to web pages\r\n\r\nThere are several ways to create links to web pages, I will give you three which should be enough to handle almost any circumstance.\r\n\r\n**auto-links**\r\n\r\nLinks will automatically be created whenever you enclose a web address in <>\r\nExample:\r\n\r\n~~~\r\n\r\n<http://studyworx.net>\r\n\r\n~~~\r\n\r\nThe above will produce:\r\n\r\n<http://studyworx.net>\r\n\r\nFor references and footnotes this is often the quickest and clearest way to create links that give the address, as well as a direct link to the site.\r\n\r\n**Named Links**\r\n\r\nWhat if you want a nice name for a long ugly link? There is another way.\r\n\r\n~~~\r\n\r\n[Sweet happy named link](http://studyworx.net)\r\n\r\n~~~\r\n\r\nThe above will produce:\r\n\r\n[Sweet happy named link](http://studyworx.net)\r\n\r\nBut what if you want to put a long ugly link in the middle of a sentence and you don\'t want it to look terrible?\r\n\r\n***Referenced Links***\r\n\r\nA referenced link allow you to use a link in a sentence without making your sentence a total mess.\r\n\r\n~~~\r\n\r\n    Check [here][1] for the answer.\r\n\r\n    Then anywhere later, usually at the end \r\n    of your document add the link like this:\r\n\r\n    [1]: http://studyworx.net \"pop up text\"\r\n\r\n~~~\r\n\r\nThe above will produce this:\r\n\r\nCheck [here][1] for the answer.\r\n\r\n[1]: http://studyworx.net \"Pop up text\"\r\n\r\n\r\nThis is bazzaar - do not get this at all.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n',0,'Final app stickie note.','2013-03-14 03:10:47','2013-04-08 20:14:51'),(30,3,2,6,1,'# Epistle BRI\r\n\r\n#### Critical Method\r\n\r\n## Authorship\r\n\r\n___Internal Evidence___\r\n\r\nWe got us a little internal evidence here.\r\nLooks pretty good overall.\r\n\r\nAnd who knows I may get done with this yet.\r\n\r\n___External Evidence___\r\n\r\nThis actually looks pretty good and I don\'t see why anyone would not like this.\r\n\r\nIt is totally easy, I need to really try to herd people in this direction I think.\r\n\r\n___Conclusion___\r\n\r\n\r\n##Dating\r\n\r\n___Internal Evidence___\r\n\r\nThis is the date I think and I think this is about the right amount of autosaving.\r\n\r\n\r\nHey Ho and away we go! I am not sure how to get more spaces in there I may need to look at the p tags in here.\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n## Recipient\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n#### Historical Method\r\n\r\n\r\n\r\n#### Survey Method\r\n\r\n\r\n\r\n## Signature\r\n\r\nPlease sign if you have done all the required readings:\r\n\r\n_Your name here_\r\n\r\n---\r\n\r\n\r\n\r\n\r\n',0,NULL,'2013-03-21 03:10:09','2013-03-29 22:13:02'),(31,3,2,6,3,'Sweet final truth here.',0,NULL,'2013-03-21 03:13:26','2013-03-21 03:13:26'),(32,1,2,4,7,'# Epistle BRI\r\n\r\n#### Critical Method\r\n\r\n## Authorship\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n## Dating\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n## Recipient\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n#### Historical Method\r\n\r\n\r\n\r\n#### Survey Method\r\n\r\n\r\n\r\n## Signature\r\n\r\nPlease sign if you have done all the required readings:\r\n\r\n_Your name here_\r\n\r\n---\r\n\r\n\r\n\r\n\r\n',0,NULL,'2013-03-24 13:55:29','2013-03-25 16:44:39'),(33,4,2,6,1,'# Epistle BRI\r\n\r\n#### Critical Method\r\n\r\n## Authorship\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n## Dating\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n## Recipient\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n#### Historical Method\r\n\r\n\r\n\r\n#### Survey Method\r\n\r\n\r\n\r\n## Signature\r\n\r\nPlease sign if you have done all the required readings:\r\n\r\n_Your name here_\r\n\r\n---\r\n\r\n\r\n\r\n\r\n',0,NULL,'2013-03-29 22:34:49','2013-03-29 22:34:49'),(34,4,2,6,3,'Sweet final truth here.',0,NULL,'2013-03-29 22:39:19','2013-03-29 22:39:19'),(35,1,2,4,9,'Sweet final truth here.',0,NULL,'2013-04-10 15:02:28','2013-04-10 15:02:29'),(36,1,2,4,10,'<h2>Notes on HTML editors<br></h2>This is now writing html.<br>I am not sure if I should keep this.<br><br><blockquote>This is highly weird.<br></blockquote><br>Wow.<br>Kinda hate this.<br><ul><li>Most annoying.</li><li>But it works I guess.</li></ul>This is strange.<br><ol><li>Step one<br><ul><li>Here is a bullet.</li><li>And another</li></ul></li><li>This actually grows on you after a while.<br><ol><li>It does things that work but not obviously.</li><li>Nope<br><ul><li>And your little sub-point too.</li></ul></li><li>Yep</li></ol></li><li>See it works.<br></li></ol><br><br><br>',1,NULL,'2013-04-10 15:02:35','2013-04-10 15:08:53'),(37,1,2,3,5,'# Epistle BRI\r\n\r\n#### Critical Method\r\n\r\n## Authorship\r\n\r\n___Internal Evidence___\r\n\r\nThis is some stuff that could work.\r\nI guess this did not get broken by my last change.\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n## Dating\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n## Recipient\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n#### Historical Method\r\n\r\n\r\n\r\n#### Survey Method\r\n\r\n\r\n\r\n## Signature\r\n\r\nPlease sign if you have done all the required readings:\r\n\r\n_Your name here_\r\n\r\n---\r\n\r\n\r\n\r\n\r\n',0,NULL,'2013-04-10 16:11:30','2013-04-30 02:15:44'),(38,3,2,3,13,'## This is good.\r\n\r\nI think we got this going now.\r\n\r\nShould be no problem from here on out.\r\n\r\n___This will look ok I guess___\r\n\r\n\r\n',0,NULL,'2013-04-10 16:23:38','2013-05-09 13:06:06'),(39,3,2,3,5,'# Epistle BRI\r\n\r\n#### Critical Method\r\n\r\n## Authorship\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n## Dating\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n## Recipient\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n#### Historical Method\r\n\r\n\r\n\r\n#### Survey Method\r\n\r\n\r\n\r\n## Signature\r\n\r\nPlease sign if you have done all the required readings:\r\n\r\n_Your name here_\r\n\r\n---\r\n\r\n\r\n\r\n\r\n',0,NULL,'2013-04-10 16:24:01','2013-04-10 16:24:01'),(40,3,2,3,15,'***Sweet final truth here.***\r\n\r\nI think we got the sweetness now.\r\n\r\n* Yep very sweet.\r\n* Again and again\r\n	* And this works too.\r\n\r\n~~~\r\n	Just to show there is no hard feelings\r\n	   I like this stuff\r\n	      It is really quite easy to use.\r\n~~~\r\n\r\n{:> One\r\n\r\n',0,NULL,'2013-04-10 16:24:15','2013-04-26 00:09:46'),(41,2,2,3,13,'### Add Text Here.\r\n\r\n* This is first.\r\n	* Now she works\r\n	* Really sweet. ;)\r\n		1. I think you know what I am talking about.\r\n		2. This is another one.\r\n	* This is nice.\r\n\r\n1. Now what?\r\n	* Nice.\r\n		1. Ok now we are working it.\r\n		2. Looks fine.\r\n	* Nice again. and again.\r\n2. Now you get it.\r\n',0,NULL,'2013-04-14 21:33:46','2013-04-14 21:45:12'),(42,3,2,9,11,'# Old Testament stuff.\r\n\r\nThis would be a BRI someday if it lives that long.\r\n\r\n* This is a point.\r\n* And another.\r\n	* I think this is working ok now.\r\n	* Ok\r\n* Hey there.\r\n\r\n>Now we can do a few other things down here and it should look ok.\r\n\r\n',0,NULL,'2013-04-20 19:18:16','2013-04-20 19:40:12'),(43,1,2,3,13,'## Key verse for Titus\r\n\r\nYessirie this is a sweet key verse.\r\n\r\nI think I like not worrying about touching the stupid touch pad it was making me type weird.\r\n\r\n	 I guess this is good\r\n	 So I will keep on going\r\n\r\n* And I got some bullets and whatnot.\r\n	* Lots of bullets\r\n	* and more....\r\n\r\nSo now I think I am done.\r\n\r\n',0,NULL,'2013-05-03 00:38:48','2013-05-06 22:30:34'),(44,1,2,3,15,'Sweet final truth here.',0,NULL,'2013-05-04 00:28:13','2013-05-04 00:28:13'),(45,4,2,3,13,'## Key Verse - Titus\r\n\r\nThis is the key verse for Titus.\r\n\r\n### Main Idea\r\n\r\nThis is the main idea\r\n\r\n### Reason Written\r\n\r\nThis is the reason it was written.\r\n\r\n',0,NULL,'2013-05-06 18:29:55','2013-05-06 18:41:10');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duedates`
--

DROP TABLE IF EXISTS `duedates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duedates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `duedate` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_duedates_on_school_id_and_team_id` (`school_id`,`team_id`),
  KEY `index_duedates_on_assignment_id` (`assignment_id`),
  KEY `index_duedates_on_duedate` (`duedate`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duedates`
--

LOCK TABLES `duedates` WRITE;
/*!40000 ALTER TABLE `duedates` DISABLE KEYS */;
INSERT INTO `duedates` VALUES (1,2,1,3,'2014-02-18 18:00:00','2013-02-19 02:47:12','2013-05-07 13:57:22'),(2,2,1,4,'2014-02-27 00:00:00','2013-02-19 02:53:56','2013-02-20 22:30:46'),(3,2,1,5,'2014-02-19 04:52:00','2013-02-19 02:53:56','2013-05-05 23:11:12'),(4,2,1,6,'2014-02-20 16:14:00','2013-02-19 02:53:57','2013-03-04 22:35:36'),(7,2,1,8,'2013-08-04 22:57:00','2013-02-19 03:58:45','2013-03-04 23:58:10'),(8,2,4,3,'2014-06-07 13:36:00','2013-02-19 04:23:47','2013-05-07 13:36:19'),(9,2,4,4,'2014-06-08 13:40:00','2013-02-19 04:23:47','2013-05-07 13:40:18'),(10,2,4,5,'2014-06-09 13:40:00','2013-02-19 04:23:47','2013-05-07 13:40:31'),(11,2,4,6,'2014-06-10 13:40:00','2013-02-19 04:23:47','2013-05-07 13:40:44'),(14,2,4,8,'2013-03-04 23:59:00','2013-02-19 04:53:25','2013-03-04 23:59:38'),(15,2,1,9,'2014-02-27 20:32:00','2013-04-01 19:32:42','2013-05-05 23:11:33'),(16,2,4,9,'2014-06-15 13:40:00','2013-05-07 13:30:57','2013-05-07 13:40:56');
/*!40000 ALTER TABLE `duedates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endnotes`
--

DROP TABLE IF EXISTS `endnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `content` mediumtext,
  `content_type` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_endnotes_on_document_id` (`document_id`),
  KEY `index_endnotes_on_paper_id` (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endnotes`
--

LOCK TABLES `endnotes` WRITE;
/*!40000 ALTER TABLE `endnotes` DISABLE KEYS */;
INSERT INTO `endnotes` VALUES (1,1,NULL,NULL,0,'2013-03-05 18:23:46','2013-03-05 18:23:46'),(2,1,NULL,NULL,0,'2013-03-05 18:26:12','2013-03-05 18:26:12'),(3,1,NULL,NULL,0,'2013-03-05 18:27:10','2013-03-05 18:27:10'),(4,1,NULL,NULL,0,'2013-03-05 18:27:30','2013-03-05 18:27:30'),(5,1,NULL,NULL,0,'2013-03-05 18:29:36','2013-03-05 18:29:36'),(6,1,NULL,NULL,0,'2013-03-05 18:34:34','2013-03-05 18:34:34'),(7,1,NULL,NULL,0,'2013-03-05 18:38:29','2013-03-05 18:38:29'),(8,1,NULL,NULL,0,'2013-03-05 18:40:18','2013-03-05 18:40:18'),(9,1,NULL,NULL,0,'2013-03-05 18:40:54','2013-03-05 18:40:54'),(10,2,NULL,NULL,0,'2013-03-05 18:41:34','2013-03-05 18:41:34'),(11,2,NULL,NULL,0,'2013-03-05 18:41:49','2013-03-05 18:41:49'),(12,3,NULL,NULL,0,'2013-03-05 18:47:59','2013-03-05 18:47:59'),(13,6,NULL,NULL,0,'2013-03-05 20:09:48','2013-03-05 20:09:48'),(14,7,NULL,'1. How about this?\r\n2. Here is another one.\r\n3. Here is the ref for number three.\r\n4. Here is number four.\r\n5. another random thing.\r\n',0,'2013-03-05 20:10:03','2013-03-06 03:56:15'),(15,8,NULL,'',0,'2013-03-06 00:38:22','2013-03-06 00:38:31'),(16,9,NULL,'',0,'2013-03-06 01:56:51','2013-03-06 02:24:54'),(17,10,NULL,NULL,0,'2013-03-06 05:41:27','2013-03-06 05:41:27'),(18,11,NULL,NULL,0,'2013-03-06 23:41:52','2013-03-06 23:41:52'),(20,13,NULL,'1. Footnote here.\r\n2. Footnote number two.',0,'2013-03-07 04:12:58','2013-03-13 00:34:14'),(30,27,NULL,'1. This is the first footnote.\r\n2. This is the second one I am sure.\r\n',0,'2013-03-14 01:16:53','2013-03-15 21:24:02'),(31,28,NULL,'1. This information was taken from many sources and adapted for use in Studyworx.',0,'2013-03-14 03:09:29','2013-03-17 19:45:43'),(32,29,NULL,NULL,0,'2013-03-14 03:10:47','2013-03-14 03:10:47'),(33,30,NULL,NULL,0,'2013-03-21 03:10:09','2013-03-21 03:10:09'),(34,31,NULL,NULL,0,'2013-03-21 03:13:26','2013-03-21 03:13:26'),(35,32,NULL,NULL,0,'2013-03-24 13:55:29','2013-03-24 13:55:29'),(36,33,NULL,NULL,0,'2013-03-29 22:34:49','2013-03-29 22:34:49'),(37,34,NULL,NULL,0,'2013-03-29 22:39:19','2013-03-29 22:39:19'),(38,35,NULL,NULL,0,'2013-04-10 15:02:29','2013-04-10 15:02:29'),(39,36,NULL,NULL,0,'2013-04-10 15:02:35','2013-04-10 15:02:35'),(40,37,NULL,NULL,0,'2013-04-10 16:11:30','2013-04-10 16:11:30'),(41,38,NULL,NULL,0,'2013-04-10 16:23:38','2013-04-10 16:23:38'),(42,39,NULL,NULL,0,'2013-04-10 16:24:01','2013-04-10 16:24:01'),(43,40,NULL,NULL,0,'2013-04-10 16:24:15','2013-04-10 16:24:15'),(44,41,NULL,NULL,0,'2013-04-14 21:33:46','2013-04-14 21:33:46'),(45,42,NULL,NULL,0,'2013-04-20 19:18:16','2013-04-20 19:18:16'),(46,NULL,4,'How about this one?\r\nNo autosave.',0,'2013-04-30 03:07:42','2013-04-30 03:18:14'),(47,NULL,5,'Here is an endnote.',0,'2013-04-30 03:26:31','2013-04-30 03:26:41'),(49,NULL,8,'This is an endnote for number three.',0,'2013-04-30 21:16:34','2013-04-30 21:16:53'),(50,43,NULL,'',0,'2013-05-03 00:38:48','2013-05-09 17:43:24'),(51,44,NULL,NULL,0,'2013-05-04 00:28:13','2013-05-04 00:28:13'),(52,45,NULL,NULL,0,'2013-05-06 18:29:56','2013-05-06 18:29:56');
/*!40000 ALTER TABLE `endnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `viewable` tinyint(1) DEFAULT '0',
  `done` tinyint(1) DEFAULT '0',
  `grade` int(11) DEFAULT NULL,
  `returned` tinyint(1) DEFAULT '0',
  `staff_comments` text,
  `student_comments` text,
  `scratchpad` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_grades_on_school_id_and_assignment_id_and_user_id` (`school_id`,`assignment_id`,`user_id`),
  KEY `index_grades_on_user_id` (`user_id`),
  KEY `index_grades_on_staff_id` (`staff_id`),
  KEY `index_grades_on_done` (`done`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,2,3,3,2,1,1,87,1,'This assignment was pretty good.\r\n\r\nNot great but ok.\r\n\r\nBuster','This needs work.\r\n\r\nHere is the stuff I am writing to you.\r\n\r\n','Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-03-23 19:31:08','2013-05-06 21:31:32'),(2,2,6,1,1,1,0,100,1,'Staff comments blah blah.\r\nYep.','Student comments and whatnot.\r\nHere is some more.','Key Verse - 5 %\r\nLet\'s see if this really saves.\r\nOk this works I guess.\r\nBRI - 10 %\r\n\r\nLet\'s say I am grading the BRI here. It seems to work pretty good. No real problem here. I just need to type a bit more to check out the scrolling and what not.\r\n\r\nBlah Blah Blah.\r\nMore stuff.\r\n\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-03-24 00:35:04','2013-03-29 19:32:27'),(3,2,4,1,1,1,0,87,1,'','','Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-03-24 13:55:15','2013-05-06 21:11:20'),(4,2,3,1,1,1,1,NULL,0,NULL,NULL,'Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-03-24 21:00:01','2013-05-04 21:14:08'),(5,2,5,1,1,1,1,NULL,0,'This is a sweet staff comment.','This is a sweet student comment.','### Grading notes...\r\n\r\nOk this is going to work I guess.','2013-03-24 21:07:38','2013-03-28 01:39:07'),(6,2,6,3,2,1,0,NULL,0,NULL,NULL,'Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-03-29 20:23:34','2013-05-06 21:19:03'),(7,2,3,5,2,0,0,NULL,0,NULL,NULL,'Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-03-29 21:41:35','2013-03-29 21:41:35'),(8,2,4,5,2,0,0,NULL,0,NULL,NULL,'Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-03-29 21:41:35','2013-03-29 21:41:35'),(9,2,5,5,2,1,0,NULL,0,NULL,NULL,'### Grading notes...','2013-03-29 21:41:35','2013-03-29 21:41:35'),(10,2,6,5,2,1,0,NULL,0,NULL,NULL,'Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-03-29 21:41:36','2013-03-29 21:41:36'),(11,2,4,3,2,0,0,NULL,0,NULL,NULL,'Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-04-14 19:06:06','2013-04-14 19:06:06'),(12,2,5,3,2,1,0,NULL,0,NULL,NULL,'### Grading notes...','2013-04-14 19:06:06','2013-05-06 21:20:49'),(13,2,9,3,2,1,0,NULL,0,NULL,NULL,'Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-04-20 19:40:37','2013-04-20 19:40:53');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helps`
--

DROP TABLE IF EXISTS `helps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `content_type` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helps`
--

LOCK TABLES `helps` WRITE;
/*!40000 ALTER TABLE `helps` DISABLE KEYS */;
INSERT INTO `helps` VALUES (1,'Markdown Cheatsheet','-\r\n\r\n## What is Markdown?\r\n\r\n\r\n_Markdown is an easy way to format your documents without having to constantly highlight text and click buttons._\r\n_To use markdown you just add a few markers to your text and it will appear as nicely formatted text as soon as you save it._ **It even looks good as is**\r\n\r\n#### Adding Headings\r\n\r\nTo add a heading just put a pound sign(s) in front of your text. You can add up to 6 pound signs which will represent Headings 1 - 6.\r\n\r\n```\r\n# Heading 1\r\n## Heading 2\r\n### Heading 3\r\n#### Heading 4\r\n##### Heading 5\r\n###### Heading 6\r\n```\r\n\r\nAnd these headings will look like the following when you view them.\r\n# Heading 1\r\n## Heading 2\r\n### Heading 3\r\n#### Heading 4\r\n##### Heading 5\r\n###### Heading 6\r\n\r\n#### Adding other formatting\r\n\r\nBeside headings there are many other formats available. Here is an important rule.\r\n\r\n>**To change formats _always_ add a blank line above the text you wish to format.**\r\n\r\nIf you ever have a line that does not seem to format itself as expected, add blank lines above and below.\r\n\r\n#### Italic, Bold, and Bold Italic\r\nYou can use either * or _ to create the above formats it\'s really easy.\r\n\r\n~~~\r\n*Italic*\r\n**Bold**\r\n***Bold Italic***\r\n_Italic_\r\n__Bold__\r\n___Bold Italic___\r\n\r\n~~~\r\n\r\nEither of the above produce the following it\'s just a matter of preference:\r\n*Italic*\r\n**Bold**\r\n***Bold Italic***\r\n\r\n\r\n#### Indents and colors\r\n\r\nTo add indented text you simply need to add a > to the beginning of the first line. \r\nIt\'s as easy as this.\r\n\r\n```\r\n> Indented text begins like this...\r\nMore indented text.\r\n   < This blank line ends indentation >\r\nA fresh un-indented line\r\n\r\n```\r\nThis is what results from the above:\r\n\r\n> Indented text begins like this...\r\nMore indented text.\r\n\r\nA fresh un-indented line\r\n\r\n\r\n>>>**Adding Colored Indented test**\r\n\r\nTo use colored text do the following:\r\n\r\n```\r\n> This is indented black text.\r\n>> This is indented Green text.\r\n>>> This is indented Red text.\r\n\r\n```\r\n\r\n> This is indented black text.\r\n>> This is indented Green text.\r\n>>> This is indented Red text.\r\n\r\nThis is the same as the above:\r\n\r\n```\r\n>\r\nBlack indented text.\r\n>>\r\nGreen indented text\r\n>>>\r\nRed indented text.\r\n```\r\n\r\n#### Adding a Horizontal line\r\nTo draw a horizontal line across the page simply add 3 minus signs.\r\n\r\n    ---\r\n\r\nThis will make a nice looking line across the page.\r\n\r\n---\r\n\r\n#### Making Literal text.\r\n\r\nTo make text formatted exactly as you type it use a \"code block\". \r\n\r\n~~~\r\n\r\n~~~use three tilde\'s above\r\n\r\n    *\r\n     ^\r\n    ===\r\n  ========\r\n | <>  <> |\r\n \\    |   /\r\n    ~~~~\r\n    \\  /\r\n     \"\" \r\n~~~use three tilde\'s below \r\nto \"fence in\" your literal text.\r\n\r\n~~~\r\nAny text between these two lines of tilde\'s will be formatted just as it is typed and it will be contained in a box, just like the text above.\r\n\r\n#### Adding Bullets\r\n\r\nTo make bulleted text you just add a * with a space following and you will get a bullet.\r\n(make sure you have a blank line over the first bulleted line)\r\n\r\n    * Bulleted Text \r\nThis produces the following:\r\n\r\n* Bulleted Text \r\n\r\n**Nested Lists**\r\nBullets and Numbered lists can have many layers.\r\n\r\n    * First level Bullet text\r\n        * (Add 4 spaces in front)\r\n            * (Add 8 spaces and so on)\r\n\r\nThis will produce the following:\r\n\r\n* First level Bullet text\r\n    * (Add 4 space in front)\r\n        * (Add 8 spaces and so on)\r\n\r\n_You see that even without formatting it is perfectly readable as a nested list._\r\nNumbered lists work just like bulleted lists only you start each line with a number a period and a space.\r\n(Leave a blank line over your numbered lists too)\r\n\r\n    1. First level numbered list.\r\n        1. Second level\r\n        2. (use four spaces)\r\n            1. Third level\r\n            2. (use 8 spaces)\r\n    2. Another first level\r\n\r\nThis produces the following:\r\n\r\n1. First level numbered list.\r\n    1. Second level\r\n    2. (use four spaces)\r\n        1. Third level\r\n        2. (use 8 spaces)\r\n2. Another first level\r\n\r\n#### Creating Links to web pages\r\n\r\nThere are several ways to create links to web pages, I will give you three which should be enough to handle almost any circumstance.\r\n\r\n**auto-links**\r\n\r\nLinks will automatically be created whenever you enclose a web address in <>\r\nExample:\r\n\r\n~~~\r\n\r\n<http://studyworx.net>\r\n\r\n~~~\r\n\r\nThe above will produce:\r\n\r\n<http://studyworx.net>\r\n\r\nFor references and footnotes this is often the quickest and clearest way to create links that give the address, as well as a direct link to the site.\r\n\r\n**Named Links**\r\n\r\nWhat if you want a nice name for a long ugly link? There is another way.\r\n\r\n~~~\r\n\r\n[Sweet happy named link](http://studyworx.net)\r\n\r\n~~~\r\n\r\nThe above will produce:\r\n\r\n[Sweet happy named link](http://studyworx.net)\r\n\r\nBut what if you want to put a long ugly link in the middle of a sentence and you don\'t want it to look terrible?\r\n\r\n***Referenced Links***\r\n\r\nA referenced link allow you to use a link in a sentence without making your sentence a total mess.\r\n\r\n~~~\r\n\r\n    Check [here][1] for the answer.\r\n\r\n    Then anywhere later, usually at the end \r\n    of your document add the link like this:\r\n\r\n    [1]: http://studyworx.net \"pop up text\"\r\n\r\n~~~\r\n\r\nThe above will produce this:\r\n\r\nCheck [here][1] for the answer.\r\n\r\n[1]: http://studyworx.net \"Pop up text\"\r\n\r\n\r\n#### Adding Images\r\n\r\nLinking to images is almost identical to creating normal links. You can not upload images to this server, however by using publicly shared images you can link to them. \r\n\r\n1. Get the address of the image you want to link to by right clicking on the image and clicking \"copy image location\"\r\n2. Paste that location in your document.\r\n3. Add a ! and some brackets like below.\r\n\r\n~~~\r\n\r\n![Any Happy name](https://sitename.com/image.jpg)\r\n\r\nYou can also do this \"reference style\" just like regular links.\r\n\r\n![Any Happy name][1]\r\n\r\n    [1]: https://sitename.com/image.jpg\r\n\r\np.s. Be careful to choose small pictures.\r\n\r\n~~~\r\n\r\nProduces:\r\n\r\n![Any Happy name](https://files.one.ubuntu.com/5HMlJhi2TA6HEZUJC-KIqA)\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n',0,'2013-03-09 03:38:02','2013-03-13 03:21:53'),(2,'Wicked_pdf Readme','# Wicked PDF [![Build Status](https://secure.travis-ci.org/mileszs/wicked_pdf.png)](http://travis-ci.org/mileszs/wicked_pdf)\r\n\r\n## A PDF generation plugin for Ruby on Rails\r\n\r\nWicked PDF uses the shell utility [wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) to serve a PDF file to a user from HTML.  In other words, rather than dealing with a PDF generation DSL of some sort, you simply write an HTML view as you would normally, then let Wicked take care of the hard stuff.\r\n\r\n_Wicked PDF has been verified to work on Ruby 1.8.7 and 1.9.2; Rails 2 and Rails 3_\r\n\r\n### Installation\r\n\r\nFirst, be sure to install [wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/).\r\nIf your wkhtmltopdf executable is not on your webserver\'s path, configure it in an initializer:\r\n    WickedPdf.config = {\r\n      :exe_path => \'/usr/local/bin/wkhtmltopdf\'\r\n    }\r\nNote that versions before 0.9.0 [have problems](http://code.google.com/p/wkhtmltopdf/issues/detail?id=82&q=vodnik) on some machines with reading/writing to streams.\r\nThis plugin relies on streams to communicate with wkhtmltopdf.\r\n\r\nMore information about [wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) could be found [here](http://madalgo.au.dk/~jakobt/wkhtmltoxdoc/wkhtmltopdf-0.9.9-doc.html).\r\n\r\nNext:\r\n\r\n    script/plugin install git://github.com/mileszs/wicked_pdf.git\r\n    script/generate wicked_pdf\r\n\r\nor add this to your Gemfile:\r\n\r\n    gem \'wicked_pdf\'\r\n    \r\nYou may also need to add \r\n    Mime::Type.register \"application/pdf\", :pdf\r\nto config/initializers/mime_types.rb\r\n\r\n### Basic Usage\r\n\r\n    class ThingsController < ApplicationController\r\n      def show\r\n        respond_to do |format|\r\n          format.html\r\n          format.pdf do\r\n            render :pdf => \"file_name\"\r\n          end\r\n        end\r\n      end\r\n    end\r\n\r\n### Advanced Usage with all available options\r\n\r\n    class ThingsController < ApplicationController\r\n      def show\r\n        respond_to do |format|\r\n          format.html\r\n          format.pdf do\r\n            render :pdf                            => \'file_name\',\r\n                   :disposition	                   => \'attachment\',                 # default \'inline\'                   \r\n                   :template                       => \'things/show.pdf.erb\',\r\n                   :file                           => \"#{Rails.root}/files/foo.erb\"\r\n                   :layout                         => \'pdf.html\',                   # use \'pdf.html\' for a pdf.html.erb file\r\n                   :wkhtmltopdf                    => \'/usr/local/bin/wkhtmltopdf\', # path to binary\r\n                   :show_as_html                   => params[:debug].present?,      # allow debuging based on url param\r\n                   :orientation                    => \'Landscape\',                  # default Portrait\r\n                   :page_size                      => \'A4, Letter, ...\',            # default A4\r\n                   :save_to_file                   => Rails.root.join(\'pdfs\', \"#{filename}.pdf\"),\r\n                   :save_only                      => false,                        # depends on :save_to_file being set first\r\n                   :proxy                          => \'TEXT\',\r\n                   :basic_auth                     => false                         # when true username & password are automatically sent from session\r\n                   :username                       => \'TEXT\',\r\n                   :password                       => \'TEXT\',\r\n                   :cover                          => \'URL\',\r\n                   :dpi                            => \'dpi\',\r\n                   :encoding                       => \'TEXT\',\r\n                   :user_style_sheet               => \'URL\',\r\n                   :cookie                         => [\'_session_id SESSION_ID\'], # could be an array or a single string in a \'name value\' format\r\n                   :post                           => [\'query QUERY_PARAM\'],      # could be an array or a single string in a \'name value\' format\r\n                   :redirect_delay                 => NUMBER,\r\n                   :zoom                           => FLOAT,\r\n                   :page_offset                    => NUMBER,\r\n                   :book                           => true,\r\n                   :default_header                 => true,\r\n                   :disable_javascript             => false,\r\n                   :grayscale                      => true,\r\n                   :lowquality                     => true,\r\n                   :enable_plugins                 => true,\r\n                   :disable_internal_links         => true,\r\n                   :disable_external_links         => true,\r\n                   :print_media_type               => true,\r\n                   :disable_smart_shrinking        => true,\r\n                   :use_xserver                    => true,\r\n                   :no_background                  => true,\r\n                   :extra                          => \'\'                        # directly inserted into the command to wkhtmltopdf\r\n                   :margin => {:top                => SIZE,                     # default 10 (mm)\r\n                               :bottom             => SIZE,\r\n                               :left               => SIZE,\r\n                               :right              => SIZE},\r\n                   :header => {:html => { :template => \'users/header.pdf.erb\',  # use :template OR :url\r\n                                          :layout   => \'pdf_plain.html\',        # optional, use \'pdf_plain.html\' for a pdf_plain.html.erb file, defaults to main layout\r\n                                          :url      => \'www.example.com\',\r\n                                          :locals   => { :foo => @bar }},\r\n                               :center             => \'TEXT\',\r\n                               :font_name          => \'NAME\',\r\n                               :font_size          => SIZE,\r\n                               :left               => \'TEXT\',\r\n                               :right              => \'TEXT\',\r\n                               :spacing            => REAL,\r\n                               :line               => true,\r\n                               :content            => \'HTML CONTENT ALREADY RENDERED\'}, # optionally you can pass plain html already rendered (useful if using pdf_from_string)\r\n                   :footer => {:html => { :template => \'shared/footer.pdf.erb\', # use :template OR :url\r\n                                          :layout   => \'pdf_plain.html\',        # optional, use \'pdf_plain.html\' for a pdf_plain.html.erb file, defaults to main layout\r\n                                          :url      => \'www.example.com\',\r\n                                          :locals   => { :foo => @bar }},\r\n                               :center             => \'TEXT\',\r\n                               :font_name          => \'NAME\',\r\n                               :font_size          => SIZE,\r\n                               :left               => \'TEXT\',\r\n                               :right              => \'TEXT\',\r\n                               :spacing            => REAL,\r\n                               :line               => true,\r\n                               :content            => \'HTML CONTENT ALREADY RENDERED\'}, # optionally you can pass plain html already rendered (useful if using pdf_from_string)\r\n                   :toc    => {:font_name          => \"NAME\",\r\n                               :depth              => LEVEL,\r\n                               :header_text        => \"TEXT\",\r\n                               :header_fs          => SIZE,\r\n                               :l1_font_size       => SIZE,\r\n                               :l2_font_size       => SIZE,\r\n                               :l3_font_size       => SIZE,\r\n                               :l4_font_size       => SIZE,\r\n                               :l5_font_size       => SIZE,\r\n                               :l6_font_size       => SIZE,\r\n                               :l7_font_size       => SIZE,\r\n                               :l1_indentation     => NUM,\r\n                               :l2_indentation     => NUM,\r\n                               :l3_indentation     => NUM,\r\n                               :l4_indentation     => NUM,\r\n                               :l5_indentation     => NUM,\r\n                               :l6_indentation     => NUM,\r\n                               :l7_indentation     => NUM,\r\n                               :no_dots            => true,\r\n                               :disable_links      => true,\r\n                               :disable_back_links => true},\r\n                   :outline => {:outline           => true,\r\n                                :outline_depth     => LEVEL}\r\n          end\r\n        end\r\n      end\r\n    end\r\n\r\nBy default, it will render without a layout (:layout => false) and the template for the current controller and action.\r\n\r\n### Super Advanced Usage ###\r\n\r\nIf you need to just create a pdf and not display it:\r\n\r\n    # create a pdf from a string\r\n    pdf = WickedPdf.new.pdf_from_string(\'<h1>Hello There!</h1>\')\r\n\r\n    # create a pdf from string using templates, layouts and content option for header or footer\r\n    WickedPdf.new.pdf_from_string(\r\n        render_to_string(:pdf => \"pdf_file.pdf\", :template => \'templates/pdf.html.erb\', :layout => \'pdfs/layout_pdf\'), \r\n        :footer => {:content => render_to_string({:template => \'templates/pdf_footer.html.erb\', :layout => \'pdfs/layout_pdf\'})}\r\n        )	\r\n    # or from your controller, using views & templates and all wicked_pdf options as normal\r\n    pdf = render_to_string :pdf => \"some_file_name\"\r\n		\r\n    # then save to a file\r\n    save_path = Rails.root.join(\'pdfs\',\'filename.pdf\')\r\n    File.open(save_path, \'wb\') do |file|\r\n      file << pdf\r\n    end\r\n\r\nIf you need to display utf encoded characters, add this to your pdf views or layouts:\r\n\r\n    <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\r\n\r\n### Styles\r\n\r\nYou must define absolute paths to CSS files, images, and javascripts; the best option is to use the *wicked_pdf_stylesheet_link_tag*, *wicked_pdf_image_tag*, and *wicked_pdf_javascript_include_tag* helpers.\r\n\r\n    <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\r\n       \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n    <html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">\r\n      <head>\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n        <%= wicked_pdf_stylesheet_link_tag \"pdf\" -%>\r\n        <%= wicked_pdf_javascript_include_tag \"number_pages\" %>\r\n      </head>\r\n      <body onload=\'number_pages\'>\r\n        <div id=\"header\">\r\n          <%= wicked_pdf_image_tag \'mysite.jpg\' %>\r\n        </div>\r\n        <div id=\"content\">\r\n          <%= yield %>\r\n        </div>\r\n      </body>\r\n    </html>\r\n\r\n### Page Numbering\r\n\r\nA bit of javascript can help you number your pages. Create a template or header/footer file with this:\r\n\r\n    <html>\r\n      <head>\r\n        <script>\r\n          function number_pages() {\r\n            var vars={};\r\n            var x=document.location.search.substring(1).split(\'&\');\r\n            for(var i in x) {var z=x[i].split(\'=\',2);vars[z[0]] = unescape(z[1]);}\r\n            var x=[\'frompage\',\'topage\',\'page\',\'webpage\',\'section\',\'subsection\',\'subsubsection\'];\r\n            for(var i in x) {\r\n              var y = document.getElementsByClassName(x[i]);\r\n              for(var j=0; j<y.length; ++j) y[j].textContent = vars[x[i]];\r\n            }\r\n          }\r\n        </script>\r\n      </head>\r\n      <body onload=\"number_pages()\">\r\n        Page <span class=\"page\"></span> of <span class=\"topage\"></span>\r\n      </body>\r\n    </html>\r\n\r\nAnything with a class listed in \"var x\" above will be auto-filled at render time.\r\n\r\nIf you do not have explicit page breaks (and therefore do not have any \"page\" class), you can also use wkhtmltopdf\'s built in page number generation by setting one of the headers to \"[page]\":\r\n\r\n    render :pdf => \'filename\', :header => { :right => \'[page] of [topage]\' }\r\n\r\n### Configuration\r\n\r\nYou can put your default configuration, applied to all pdf\'s at \"wicked_pdf.rb\" initializer.\r\n\r\n### Rack Middleware\r\n\r\nIf you would like to have WickedPdf automatically generate PDF views for all (or nearly all) pages by appending .pdf to the URL, add the following to your Rails app:\r\n\r\n    # in application.rb (Rails3) or environment.rb (Rails2)\r\n    require \'wicked_pdf\'\r\n    config.middleware.use WickedPdf::Middleware\r\n\r\nIf you want to turn on or off the middleware for certain urls, use the `:only` or `:except` conditions like so:\r\n\r\n    # conditions can be plain strings or regular expressions, and you can supply only one or an array\r\n    config.middleware.use WickedPdf::Middleware, {}, :only => \'/invoice\'\r\n    config.middleware.use WickedPdf::Middleware, {}, :except => [ %r[^/admin], \'/secret\', %r[^/people/\\d] ]\r\n\r\nIf you use the standard `render :pdf => \'some_pdf\'` in your app, you will want to exclude those actions from the middleware.\r\n\r\n### Further Reading\r\n\r\nAndreas Happe\'s post [Generating PDFs from Ruby on Rails](http://www.snikt.net/blog/2012/04/26/wicked-pdf/)\r\n\r\nStackOverflow [questions with the tag \"wicked-pdf\"](http://stackoverflow.com/questions/tagged/wicked-pdf)\r\n\r\n### Debugging\r\n\r\nNow you can use a debug param on the URL that shows you the content of the pdf in plain html to design it faster.\r\n\r\nFirst of all you must configure the render parameter \":show_as_html => params[:debug]\" and then just use it like normally but adding \"debug=1\" as a param:\r\n\r\nhttp://localhost:3001/CONTROLLER/X.pdf?debug=1\r\n\r\nHowever, the wicked_pdf_* helpers will use file:/// paths for assets when using :show_as_html, and your browser\'s cross-domain safety feature will kick in, and not render them. To get around this, you can load your assets like so in your templates:\r\n\r\n    <%= params[:debug].present? ? image_tag(\'foo\') : wicked_pdf_image_tag(\'foo\') %>\r\n\r\n### Inspiration\r\n\r\nYou may have noticed: this plugin is heavily inspired by the PrinceXML plugin [princely](http://github.com/mbleigh/princely/tree/master).  PrinceXML\'s cost was prohibitive for me. So, with a little help from some friends (thanks [jqr](http://github.com/jqr)), I tracked down wkhtmltopdf, and here we are.\r\n\r\n### Awesome Peoples\r\n\r\nAlso, thanks to [unixmonkey](https://github.com/Unixmonkey), [galdomedia](http://github.com/galdomedia), [jcrisp](http://github.com/jcrisp), [lleirborras](http://github.com/lleirborras), [tiennou](http://github.com/tiennou), and everyone else for all their hard work and patience with my delays in merging in their enhancements.\r\n',0,'2013-03-14 14:11:56','2013-03-14 14:12:23'),(3,'Creating and editing a school','### School Admin Help\r\n\r\n_From this page you can edit your school information as well as control how your schools display page looks._\r\n\r\n**Name**\r\nChoose a descriptive but not too long name for your school\r\n\r\n**Tag Line**\r\nThis short line is a sort of welcome to the school statement. Use it to say something short and pithy about your school. A school slogan or theme often works well here.\r\n\r\n**Location**\r\nThis is short friendly description of your schools location.\r\n _Not a mailing address - there is a separate field for that._\r\n\r\n',0,'2013-03-30 22:13:00','2013-05-12 14:20:53'),(4,'Setting Due Dates and Times','### Assignment Due Times and Dates\r\n\r\n___Due Times and Dates can be set on a per Core Team basis.___\r\n\r\nThus you can have full control over when a group of students work is due.\r\n\r\nAssignments are broken into modules for easier organization and to prevent uncomfortably long lists of assignments to work with.\r\n\r\nOnce the due time is past students can no longer edit their assignments until after the assignment has been returned by their assigned staff.',0,'2013-05-12 14:37:27','2013-05-12 19:11:48'),(5,'Templates - Creation and Editing','### Working with Templates\r\n\r\n>\r\n_Templates can be used in any document type assignment task. These templates are loaded the first time an task is opened and form the basis of any document task._\r\n\r\n___Tips for creating a good template___\r\n\r\n* Use headings as much as possible to divide sections of your documents.\r\n	* Remember there are 6 levels of heading so you actually have a lot of options.\r\n	* Bold and Bold_Italic are also good choices for section breaks.\r\n* Keep your template simple and try to make it obvious where the student should add their content.',0,'2013-05-12 18:44:38','2013-05-12 19:11:19'),(6,'Scoresheets - grading report templates','### Creating and Editing Scoresheets\r\n\r\n___Scoresheets are the templates used to form the basis of the grading reports.___ \r\n_(sometimes called coversheets)_\r\n\r\nScoresheets function the same way grading reports that templates do for document tasks. They are loaded the first time you open the _\"finish grading\"_ page. The purpose of these templates is to help your staff create consistent and helpful reports to the student after they are finished grading an assignment. \r\n\r\n___Tips for creating good coversheets___\r\n\r\n* You can make as many coversheets as you like so feel free to make special ones to match specific assignments. This can help your staff to grade and report back to your students much consistently.\r\n* Think through important aspects of your staff\'s feedback and design the coversheet template to assist your staff with giving useful feedback.\r\n	* Leave a place for encouragement for example, to remind your staff to give positive feedback as well as correction.\r\n\r\n\r\n\r\n',0,'2013-05-12 19:15:03','2013-05-12 19:27:03'),(8,'Creating Observations for selection','### Creating Inductive observation choices\r\n\r\n>\r\n_Observations from this list are the ones available to your students as they work on their inductive charts. You can create as many or as few as you would like to help your students remember what kinds of things they are looking for. The abbreviations(Code) as there to save space and to provide consistency, making grading much easier over time._\r\n\r\n___Tips for creating good observations___\r\n\r\n\r\n* Try to make your abbreviations(Code) consistent and intuitive.\r\n	* BUT SHORT!\r\n	* Example: Contrast [><] or Who [W] or event [E]\r\n* Try to create them in an order that makes sense, putting the most common observations near the top of the list.\r\n\r\n\r\n\r\n',0,'2013-05-12 19:31:52','2013-05-12 19:56:33');
/*!40000 ALTER TABLE `helps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_hierarchies`
--

DROP TABLE IF EXISTS `message_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_hierarchies` (
  `ancestor_id` int(11) NOT NULL,
  `descendant_id` int(11) NOT NULL,
  `generations` int(11) NOT NULL,
  UNIQUE KEY `index_message_hierarchies_on_ancestor_id_and_descendant_id` (`ancestor_id`,`descendant_id`),
  KEY `index_message_hierarchies_on_descendant_id` (`descendant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_hierarchies`
--

LOCK TABLES `message_hierarchies` WRITE;
/*!40000 ALTER TABLE `message_hierarchies` DISABLE KEYS */;
INSERT INTO `message_hierarchies` VALUES (6,6,0),(6,7,1),(7,7,0),(8,8,0),(8,9,1),(9,9,0),(10,10,0),(14,14,0),(15,15,0),(15,18,1),(16,16,0),(17,17,0),(18,18,0),(19,19,0),(19,40,1),(19,49,1),(20,20,0),(21,21,0),(21,27,1),(21,31,1),(25,25,0),(25,26,1),(25,45,1),(26,26,0),(27,27,0),(28,28,0),(28,30,1),(30,30,0),(31,31,0),(32,32,0),(33,33,0),(34,34,0),(34,50,1),(35,35,0),(36,36,0),(36,48,1),(40,40,0),(41,41,0),(41,42,1),(41,54,1),(42,42,0),(43,43,0),(44,44,0),(44,46,1),(45,45,0),(46,46,0),(47,47,0),(48,48,0),(49,49,0),(50,50,0),(51,51,0),(51,52,1),(52,52,0),(53,53,0),(54,54,0),(55,55,0),(55,57,1),(56,56,0),(56,58,1),(57,57,0),(58,58,0),(59,59,0);
/*!40000 ALTER TABLE `message_hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `sender_read` tinyint(1) DEFAULT '0',
  `recipient_read` tinyint(1) DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_messages_on_recipient_id_and_recipient_read` (`recipient_id`,`recipient_read`),
  KEY `index_messages_on_recipient_id_and_team_id` (`recipient_id`,`team_id`),
  KEY `index_messages_on_sender_id_and_sender_read` (`sender_id`,`sender_read`),
  KEY `index_messages_on_parent_id` (`parent_id`),
  KEY `index_messages_on_school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (6,NULL,1,NULL,NULL,NULL,NULL,'First Message to Second Team','Hey you bench warmers!\r\nToo bad you ar not on the first team !\r\nTom\r\n','2013-02-07 14:08:40','2013-02-07 17:00:50',2),(7,6,2,NULL,NULL,NULL,NULL,NULL,'this is my sweet reply.\r\nbuster','2013-02-07 14:27:48','2013-02-07 14:27:48',2),(8,NULL,2,NULL,NULL,NULL,NULL,'I am the first loser','I may be on the second team but I am the firt one.\r\nThat makes me the first loser.\r\nBuster','2013-02-07 14:29:30','2013-02-07 14:29:30',2),(9,8,1,NULL,NULL,NULL,NULL,NULL,'Yes you are.\r\nTom','2013-02-07 14:33:57','2013-02-07 14:33:57',2),(10,NULL,1,NULL,NULL,NULL,NULL,'You are my favorite team!','Hey guys,\r\nJust a note to remind you that you are still the best team. \r\n{:> Tom','2013-02-07 17:04:12','2013-02-07 17:04:12',1),(14,NULL,1,NULL,NULL,NULL,NULL,'I need another message','Here we go baby!','2013-02-08 02:35:24','2013-02-08 02:35:24',1),(15,NULL,1,NULL,NULL,NULL,NULL,'Another one for the losers','You guys are still number Two!\r\n','2013-02-08 02:35:58','2013-02-08 02:35:58',2),(16,NULL,3,1,NULL,0,1,'Hey Leader dude.','This is my first message.','2013-02-08 02:55:01','2013-02-17 04:41:34',NULL),(17,NULL,3,NULL,NULL,NULL,NULL,'Look I am writing to the whole team!','This is a sweet sweet message. Let me tell you!\r\nOne.','2013-02-08 02:55:51','2013-02-08 02:55:51',1),(18,15,3,NULL,NULL,NULL,NULL,NULL,'I can get in on this I think.\r\nOne','2013-02-08 02:56:19','2013-02-08 02:56:19',2),(19,NULL,2,1,NULL,0,0,'Hey Boss','I am writing a note.\r\nDid I break it yet?\r\nBuster','2013-02-08 03:12:23','2013-02-25 19:25:08',NULL),(20,NULL,1,3,NULL,0,1,'Junk Message','Just another stupid and pointless message to test the system.\r\nTom','2013-02-08 16:32:01','2013-02-11 05:10:11',NULL),(21,NULL,1,2,NULL,0,0,'Just to check on the format','Hey ho,\r\nI wonder where and how this will show up?\r\nHere is another sweet sweet line of stuff.\r\nSee ya later.\r\nTom','2013-02-08 17:24:46','2013-02-11 05:10:04',NULL),(25,NULL,3,1,NULL,0,0,'hey there again','I am just making another test.\r\nOne','2013-02-09 22:30:02','2013-02-11 05:10:02',NULL),(26,25,1,1,NULL,0,0,NULL,'Back at you.\r\nTom','2013-02-09 22:30:46','2013-02-09 22:30:46',NULL),(27,21,2,2,NULL,0,0,NULL,'Here my reply sport.\r\nBuster','2013-02-10 00:19:47','2013-02-10 00:19:47',NULL),(28,NULL,2,1,NULL,0,0,'hey Tom','This is my first note to you I believe.\r\n','2013-02-10 01:13:26','2013-02-11 05:10:05',NULL),(30,28,1,1,NULL,0,0,NULL,'No Not really.\r\nTom','2013-02-10 01:27:04','2013-02-10 01:27:04',NULL),(31,21,2,2,NULL,0,0,NULL,'Here is another reply for you. At least this is working good now.\r\nBuster','2013-02-11 05:26:08','2013-02-11 05:26:08',NULL),(32,NULL,1,2,NULL,0,0,'Hey there.','This message should be mailed.','2013-02-25 17:47:01','2013-02-25 17:47:01',NULL),(33,NULL,1,2,NULL,0,0,'Hey there.','This message should be mailed.','2013-02-25 17:52:18','2013-02-25 17:52:18',NULL),(34,NULL,1,2,NULL,0,0,'Hey there.','This message should be mailed.','2013-02-25 17:53:04','2013-02-25 17:53:04',NULL),(35,NULL,1,2,NULL,1,0,'Hey there.','This message should be mailed.\r\nAnd this is a sweet sweeet edit of that message.\r\nAnd now it should have a sweet updated subject line.\r\nOops now it will work.\r\nNow it will be even better.\r\nTom','2013-02-25 17:54:53','2013-03-05 01:27:51',NULL),(36,NULL,1,3,NULL,0,0,'This is message two','This should send in both text and html. \r\n\r\n>>>I added another line!\r\n\r\nTom','2013-02-25 18:02:55','2013-03-16 18:17:31',NULL),(40,19,1,1,NULL,0,0,NULL,'This is another fresh one.','2013-02-25 19:51:47','2013-02-25 19:51:47',NULL),(41,NULL,1,NULL,2,0,0,'First message with email','Hey ho!\r\nSweet message no doubt.\r\nNow the update.\r\nTom','2013-02-25 21:39:30','2013-03-17 20:53:00',2),(42,41,1,NULL,NULL,0,0,NULL,'Yep this is the reply baby.\r\nThis is the updated reply.\r\nTom','2013-02-25 21:41:11','2013-02-25 21:41:49',2),(43,NULL,1,NULL,2,1,0,'Here we with real mail?','I guess I need some info here.','2013-02-25 21:57:19','2013-03-05 01:27:44',2),(44,NULL,1,NULL,2,1,0,'One more time','This should mail.','2013-02-25 21:58:51','2013-03-05 01:27:42',2),(45,25,1,1,NULL,0,0,NULL,'Here is another reply.\r\nTom','2013-02-28 21:26:24','2013-02-28 21:26:24',NULL),(46,44,1,NULL,NULL,0,0,NULL,'How about a reply?\r\nTom','2013-02-28 21:27:33','2013-02-28 21:27:33',2),(47,NULL,1,NULL,2,1,0,'Recovered from disaster','Well I hope I did not lose too much in this one.\r\nWe will see.\r\nTom','2013-03-02 16:04:05','2013-03-05 01:27:39',1),(48,36,1,3,NULL,0,0,NULL,'Here does this still work??','2013-03-13 02:45:36','2013-03-13 02:45:36',NULL),(49,19,1,1,NULL,0,0,NULL,'#### heading?\r\n\r\n>>I am formatting this?\r\n\r\nhmmmmm......','2013-03-16 18:16:35','2013-03-16 18:16:57',NULL),(50,34,1,2,NULL,0,0,NULL,'# Hey You!','2013-03-21 03:42:48','2013-03-21 03:42:48',NULL),(51,NULL,4,1,NULL,0,0,'Hey I\'m in!','Yep I am a real student now!\r\n\r\n_Two_','2013-03-29 22:30:52','2013-03-29 22:30:52',NULL),(52,51,1,1,NULL,0,0,NULL,'Sweet noggin.\r\n','2013-03-30 22:09:16','2013-03-30 22:09:16',NULL),(53,NULL,3,1,NULL,0,0,'Whatever','This is another message from me.\r\nI am one.\r\nOne','2013-04-10 23:45:21','2013-04-10 23:45:21',NULL),(54,41,2,NULL,NULL,0,0,NULL,'Hey Boss,\r\nStill here, still breaking things.','2013-05-05 13:37:49','2013-05-05 13:37:49',2),(55,NULL,1,3,NULL,0,0,'Hey Bucko!','This is a little message for you.\r\n_That\'s right..._','2013-05-06 18:06:45','2013-05-06 18:06:45',NULL),(56,NULL,3,NULL,2,0,0,'Hey Everyone!','I am One!\r\nOh yes I am.\r\n_One_','2013-05-06 18:08:35','2013-05-06 18:08:35',1),(57,55,3,3,NULL,0,0,NULL,'Oh I have a little message you too!\r\nHmm... _messages_','2013-05-06 18:10:25','2013-05-06 18:10:25',NULL),(58,56,4,NULL,NULL,0,0,NULL,'Sweet, sweet message.\r\nI am moved...\r\n\r\n_Two_','2013-05-06 18:12:48','2013-05-06 18:12:48',1),(59,NULL,4,NULL,2,0,0,'Welcome to the team','Hi Friends.\r\nThis is the new team.\r\nTwo','2013-05-06 18:55:54','2013-05-06 18:55:54',8);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `reminder` text COLLATE utf8_unicode_ci,
  `public` text COLLATE utf8_unicode_ci,
  `bio` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1,'This is a note\r\n','#### Deep Thoughts\r\n>>I have many profound and amazing thoughts.\r\n\r\n_I think you know what I mean. Yep yep_\r\n\r\n__{:> Tom__\r\n','Yikes this is a mess!\r\n---\r\n\r\n>I really need to backup even more better than before.\r\n\r\n1. This looks good on it\'s own\r\n    * Just for fun.\r\n        1. Take that\r\n        2. And That.\r\n2. So does this.\r\n3. And this.\r\n\r\n{:> Tom [write me!](http://quickworx.info/contact \"Click to send me a message\")','2012-11-17 02:08:02','2013-05-09 17:14:47'),(2,2,'Well I guess this is something but I am not sure what.\r\n>And this is a bit more.',NULL,'####I break Things.\r\n>On purpose...\r\n','2012-11-17 04:03:59','2013-02-21 03:35:36'),(3,3,NULL,NULL,'### I\'m One\r\n\r\n>> My head is seriously lopsided.\r\n\r\n* Just sayin\'\r\n	* I think you know what I mean\r\n	* Yep this is better.\r\n	* Definitely\r\n\r\n','2013-02-08 02:56:35','2013-04-11 00:44:05'),(4,4,'***My Notes***\r\n\r\n* Well this is my first one!\r\n',NULL,'### It\'s me -- _Two_ !\r\n\r\nNo really Two is my name.\r\n\r\n>> Two','2013-03-21 22:38:44','2013-05-11 20:23:37'),(5,5,NULL,NULL,NULL,'2013-03-22 03:20:29','2013-03-22 03:20:29'),(6,6,NULL,NULL,NULL,'2013-05-06 16:45:31','2013-05-06 16:45:31'),(7,7,NULL,NULL,NULL,'2013-05-06 19:12:01','2013-05-06 19:12:01');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observations`
--

DROP TABLE IF EXISTS `observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_observations_on_school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observations`
--

LOCK TABLES `observations` WRITE;
/*!40000 ALTER TABLE `observations` DISABLE KEYS */;
INSERT INTO `observations` VALUES (1,2,0,'[W]','Who',0,'2013-03-30 21:38:19','2013-03-30 21:48:41'),(3,2,0,'[E]','Event',0,'2013-03-30 21:46:37','2013-03-30 21:46:37'),(4,2,0,'[T]','Time',0,'2013-03-30 21:49:12','2013-03-30 21:49:12'),(5,2,0,'[><]','Contrast',0,'2013-04-07 20:37:00','2013-05-12 19:57:40'),(6,2,0,'[<>]','Connection',0,'2013-04-07 20:37:18','2013-05-12 19:57:24');
/*!40000 ALTER TABLE `observations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `synopsis` text COLLATE utf8_unicode_ci,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `draft` tinyint(1) DEFAULT '0',
  `published` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES (4,1,'First big paper','Tom Possin','Big ','This is a really big paper.','**This is ok I wish there was a bit of padding though.**\r\n\r\n* This works now.\r\n	* So does this.\r\n	* Yep\r\n\r\nbye bye\r\n\r\n\r\n',1,0,'2013-04-30 00:38:18','2013-04-30 20:43:05'),(5,1,'Second Big Paper','Tom Possin','Second','This is my second big paper on this site.','## Well Well\r\n\r\nI guess this is a writing device of some kind now. The autosave is working and so is the previewer.\r\n\r\nNow I just have to get all the communication and reviewer stuff working.\r\n\r\nAnd of course a decent forward facing page.\r\n\r\n',0,0,'2013-04-30 01:04:55','2013-04-30 03:26:08'),(8,1,'Third Big Paper','Tom Possin','Third paper','This is another big paper.','## Sweet Sweet Paper\r\n\r\nOh I love me some papers.\r\n\r\n',0,0,'2013-04-30 21:16:10','2013-04-30 21:17:12');
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paragraphs`
--

DROP TABLE IF EXISTS `paragraphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paragraphs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `startref` varchar(20) DEFAULT NULL,
  `endref` varchar(20) DEFAULT NULL,
  `verse_count` int(11) NOT NULL DEFAULT '1',
  `version_id` int(12) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookId` (`book_id`),
  KEY `version_id` (`version_id`),
  KEY `index_paragraphs_on_version_id_and_book_id_and_position` (`version_id`,`book_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=12129 DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragraphs`
--

LOCK TABLES `paragraphs` WRITE;
/*!40000 ALTER TABLE `paragraphs` DISABLE KEYS */;
/*!40000 ALTER TABLE `paragraphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT '10',
  `school_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `prereq` tinyint(1) DEFAULT '0',
  `accepted` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_participants_on_school_id` (`school_id`),
  KEY `index_participants_on_user_id` (`user_id`),
  KEY `index_participants_on_school_id_and_role_id` (`school_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,1,1,1,1,1,2,'2012-11-03 01:11:58','2012-11-03 01:11:58'),(2,1,1,2,1,1,2,'2012-11-03 01:11:58','2012-11-03 01:11:58'),(3,3,4,2,NULL,1,2,'2013-01-31 16:18:11','2013-02-17 04:40:23'),(4,2,3,2,NULL,1,2,'2013-02-11 00:07:19','2013-03-29 21:31:48'),(5,3,4,1,NULL,1,2,'2013-02-17 23:50:36','2013-02-17 23:53:17'),(6,2,3,1,NULL,1,2,'2013-02-17 23:52:16','2013-02-17 23:53:28'),(7,4,4,2,NULL,1,2,'2013-03-21 22:51:27','2013-03-21 22:52:52'),(8,5,4,2,NULL,1,2,'2013-03-22 03:20:51','2013-03-22 03:21:32'),(9,6,4,1,NULL,1,2,'2013-05-06 16:46:25','2013-05-06 19:14:04'),(10,7,4,1,NULL,1,2,'2013-05-06 19:12:44','2013-05-06 19:14:14'),(11,2,1,6,NULL,1,2,'2013-05-12 01:05:37','2013-05-12 01:05:37');
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppoints`
--

DROP TABLE IF EXISTS `ppoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `observation_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `content` text,
  `color` varchar(255) NOT NULL DEFAULT 'black',
  `staff_note` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ppoints_on_user_id_and_title_id` (`user_id`,`title_id`),
  KEY `index_ppoints_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppoints`
--

LOCK TABLES `ppoints` WRITE;
/*!40000 ALTER TABLE `ppoints` DISABLE KEYS */;
INSERT INTO `ppoints` VALUES (11,849,1,5,0,'Contrasted stuff.\r\n**Vs.**\r\nOther stuff.','navy',NULL,'2013-04-07 03:53:59','2013-04-07 20:49:45'),(12,849,1,6,0,'Just for fun. Ok baby.','red',NULL,'2013-04-07 13:08:19','2013-04-07 20:49:59'),(14,848,1,3,0,'One small step for man.','brown',NULL,'2013-04-07 20:33:30','2013-04-07 20:33:49'),(15,856,1,6,0,'See if this is messed up.','green',NULL,'2013-04-08 01:23:11','2013-04-08 01:23:28'),(16,850,1,5,0,'Here is a thing\r\nvs\r\nAnother thing','brown',NULL,'2013-04-08 12:47:58','2013-04-08 12:48:45'),(17,847,1,6,0,'Can we stretch?','red',NULL,'2013-04-08 12:48:58','2013-04-08 12:49:14'),(18,853,1,3,0,'Here we go again.','navy',NULL,'2013-04-08 16:51:23','2013-04-08 16:51:40'),(19,864,1,6,0,'This is a sweet sweet connection','navy',NULL,'2013-04-09 01:12:14','2013-04-09 01:12:37'),(20,865,1,1,0,'Who is this seriously.\r\nI just don\'t understand.\r\nBut it works.','red',NULL,'2013-04-09 01:12:42','2013-04-09 01:13:09'),(22,937,3,3,0,'Put in order.','darkred',NULL,'2013-04-10 16:34:52','2013-04-10 16:35:12'),(23,938,3,6,0,'v11 A bit more complicated\r\nvs\r\nThe other shoe.','navy',NULL,'2013-04-10 16:35:21','2013-04-10 16:35:57'),(24,938,3,5,0,'Could have better\r\nvs\r\nCould have been worse.','brown',NULL,'2013-04-10 16:36:01','2013-04-10 16:36:33'),(25,939,3,3,0,'2:1 Teaching young women','black',NULL,'2013-04-10 16:37:00','2013-04-10 16:37:33'),(26,939,3,3,0,'Teaching young Men.\r\nI need to get rid of the default text in here. It is annoying.','navy',NULL,'2013-04-10 16:37:36','2013-04-10 16:38:15'),(27,936,3,4,0,'I have to check if tiny paragraphs render \r\na big bunch of text correctly.','red',NULL,'2013-04-10 16:39:38','2013-04-10 23:50:03'),(28,935,3,1,0,'1:1 Paul to Titus','black',NULL,'2013-04-10 16:45:02','2013-04-10 16:46:40'),(29,937,3,4,0,'Time to go I would say.','black',NULL,'2013-04-10 16:53:08','2013-04-10 16:53:25'),(37,935,3,3,0,'Here we go','darkred',NULL,'2013-04-10 21:41:57','2013-04-10 21:42:24'),(38,940,3,3,0,'v12 Silence them','black',NULL,'2013-04-11 01:07:15','2013-04-11 01:07:57'),(39,942,3,6,0,'This is definitely connected\r\nTO\r\nThis stuff','navy',NULL,'2013-04-11 01:08:04','2013-04-11 01:08:38'),(40,943,3,4,0,'3:12 Time to go!!\r\nSee you soon.','black',NULL,'2013-04-11 01:08:42','2013-04-11 01:09:04'),(47,937,3,6,0,'Ok now.','darkred',NULL,'2013-04-20 19:15:15','2013-04-20 19:15:30'),(48,1308,4,6,0,'Paul and Titus','black',NULL,'2013-05-06 18:44:09','2013-05-06 18:44:26'),(49,1310,4,5,0,'Here is another one','darkred',NULL,'2013-05-06 18:44:35','2013-05-06 18:44:51');
/*!40000 ALTER TABLE `ppoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `theme` varchar(100) DEFAULT 'base',
  `bgcolor` varchar(255) DEFAULT 'white',
  `hlcolor` varchar(20) NOT NULL DEFAULT '#BEF5BC',
  `rows` int(11) DEFAULT '20',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `wallpaper` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (40,1,'default-right','#efefef','#BEF5BC',30,'2013-03-18 20:25:56','2013-05-12 18:40:11',0),(41,3,'clean-right','#efefef','#BEF5BC',30,'2013-03-21 03:08:14','2013-05-10 22:33:33',0),(42,4,'default','white','#BEF5BC',30,'2013-03-21 22:30:56','2013-05-06 18:30:06',1),(43,5,'default','white','#BEF5BC',30,'2013-03-22 03:20:28','2013-05-06 19:11:00',1),(44,2,'default','white','#93FC8E',20,'2013-03-29 21:17:20','2013-05-05 20:36:00',1),(45,6,'default','white','#BEF5BC',20,'2013-05-06 16:45:31','2013-05-06 16:46:04',0),(46,7,'default','white','#BEF5BC',20,'2013-05-06 19:12:01','2013-05-06 19:12:20',0);
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `approved` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reviews_on_paper_id` (`paper_id`),
  KEY `index_reviews_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (6,4,1,'This is the third one of these I am writing.\r\n\r\n* Time to try out the formatting.\r\n\r\n>>> Looks good so far.\r\n\r\n_Ah the sweetness_',1,'2013-05-01 22:10:29','2013-05-03 00:25:54');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'School Leader','2012-02-11 00:00:00','2012-02-11 00:00:00'),(2,'Administrative Assistant','2012-02-11 00:00:00','2012-02-11 00:00:00'),(3,'Staff','2012-02-11 00:00:00','2012-02-11 00:00:00'),(4,'Student','2012-02-11 00:00:00','2012-02-11 00:00:00'),(10,'Unknown','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121023010939'),('20121023190810'),('20121024031430'),('20121025191113'),('20121026205316'),('20121026205538'),('20121026221344'),('20121029161250'),('20121029161812'),('20121029162309'),('20121029163733'),('20121029170415'),('20121103195405'),('20121104003100'),('20121106225120'),('20121106231722'),('20121108172856'),('20121108213145'),('20121108214120'),('20121111020808'),('20121111035123'),('20121117005007'),('20121117160840'),('20121117161336'),('20121125191250'),('20121125191447'),('20121128024530'),('20121205020046'),('20121205023559'),('20121220192551'),('20121221235545'),('20121222182102'),('20121222184902'),('20121225160249'),('20121230002106'),('20130102081413'),('20130102084011'),('20130102084848'),('20130106075830'),('20130106075919'),('20130106084718'),('20130106090908'),('20130106094445'),('20130106094600'),('20130106094709'),('20130119175625'),('20130119175847'),('20130131214902'),('20130131225904'),('20130202174732'),('20130202182902'),('20130202183427'),('20130205014507'),('20130205180824'),('20130210010423'),('20130210021447'),('20130216164705'),('20130220154450'),('20130225222453'),('20130302144841'),('20130303184909'),('20130304041147'),('20130304042604'),('20130304235550'),('20130309015156'),('20130311215400'),('20130312153912'),('20130316190255'),('20130318024407'),('20130318162408'),('20130318162808'),('20130318204140'),('20130318220452'),('20130320222842'),('20130320223428'),('20130321002459'),('20130321205645'),('20130322235153'),('20130324190037'),('20130330000212'),('20130330004642'),('20130330005851'),('20130330010236'),('20130330010601'),('20130331002614'),('20130413193451'),('20130415163104'),('20130416171340'),('20130503233808'),('20130503233809'),('20130503234300'),('20130504131206');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `version_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prereqs` text COLLATE utf8_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `mailing_address` text COLLATE utf8_unicode_ci,
  `tagline` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `header_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_file_size` int(11) DEFAULT NULL,
  `header_updated_at` datetime DEFAULT NULL,
  `featured_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_file_size` int(11) DEFAULT NULL,
  `featured_updated_at` datetime DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,2,1,1,'Test School','YWAM - Montana -&nbsp;Lakeside<div>501 Blacktail Rd</div>Lakeside, MT 59922','Successful DTS','2012-11-02 04:00:00','2014-11-02 04:00:00','3 Mission Ln\r\nLakeside, MT\r\n59922','This is an awesome school','This is the test school.',1,'Eastern Time (US & Canada)','2012-11-03 01:30:13','2013-05-06 19:18:24','desktopwallpapers17.jpg','image/jpeg',351123,'2013-05-06 19:16:11','desktopwallpapers17.jpg','image/jpeg',351123,'2013-05-06 19:17:27','desktopwallpapers17.jpg','image/jpeg',351123,'2013-05-06 19:18:24','',NULL),(2,1,2,1,'Lakeside School of Smartness','In beautiful Lakeside MT!','Successful DTS','2012-11-02 06:00:00','2013-11-02 06:00:00','Youth with a Mission of MT\r\nAttn: Registrar\r\n3 Mission Ln\r\nLakeside, MT 59922','The place to get much smartlier','Very nice',1,'Mountain Time (US & Canada)','2012-11-03 01:30:13','2013-03-29 16:17:17','Morning_Dew_by_Lars_Clausen.jpg','image/jpeg',222337,'2013-01-31 16:03:57','class.jpg','image/jpeg',171546,'2013-02-07 17:26:14','The_Forbidden_City_by_Daniel_Mathis.jpg','image/jpeg',202165,'2013-02-07 17:26:15','Next Stop the world!',NULL),(6,2,2,NULL,'Buster\'s Big School','Right here','None','2013-05-11 06:00:00','2014-05-11 06:00:00','Right Here\r\nLakeside, MT 59922','If you can\'t build it - bust it.','This school develops busting things with the sweetness. ',1,'Mountain Time (US & Canada)','2013-05-12 01:05:37','2013-05-12 01:18:22','3D_Ubuntu_4.jpg','image/jpeg',19151,'2013-05-12 01:18:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoresheets`
--

DROP TABLE IF EXISTS `scoresheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scoresheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `content_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_scoresheets_on_school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoresheets`
--

LOCK TABLES `scoresheets` WRITE;
/*!40000 ALTER TABLE `scoresheets` DISABLE KEYS */;
INSERT INTO `scoresheets` VALUES (1,2,'Charting','Key Verse - 5 %\r\nBRI - 10 %\r\nCharting - 50 %\r\nFinal App - 10 %\r\nOk let\'s see if this thing.\r\n','2013-01-31 16:45:14','2013-03-12 23:21:58',0),(2,2,'Special','See Handout.','2013-01-31 16:47:54','2013-01-31 16:47:54',0),(8,2,'Proverbs Scoresheet','## Proverbs Assignment\r\n\r\n#### Special assignment.\r\n\r\nMore words.\r\n\r\nWell I just need to check this out now to see if it is really working so far I would say it does.\r\n\r\n','2013-03-12 15:05:24','2013-03-12 23:15:04',0);
/*!40000 ALTER TABLE `scoresheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffnotes`
--

DROP TABLE IF EXISTS `staffnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `noteable_id` int(11) DEFAULT NULL,
  `noteable_type` varchar(20) DEFAULT NULL,
  `content` text,
  `content_type` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_staffnotes_on_noteable_id_and_noteable_type` (`noteable_id`,`noteable_type`),
  KEY `index_staffnotes_on_user_id_and_assignment_id` (`user_id`,`assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffnotes`
--

LOCK TABLES `staffnotes` WRITE;
/*!40000 ALTER TABLE `staffnotes` DISABLE KEYS */;
INSERT INTO `staffnotes` VALUES (5,3,3,38,'Document','Does this save?\r\n\r\nI think so, it actually looks pretty good. Now all I have to do is see if this will show up for the student.\r\n\r\nSweet, Sweet notes.\r\nGotta love \'em.\r\n\r\nBye Bye',0,'2013-04-16 18:01:15','2013-04-27 21:25:12'),(6,3,3,39,'Document','This one is blank and kinda useless. I need to remember to check for blank notes because I think that will happen quite often.\r\n\r\n**Done**\r\n',0,'2013-04-16 18:44:42','2013-04-27 21:25:54'),(29,3,3,8,'Charttext','This is a sweet note about your work on the outsides.\r\n\r\n>> Don\'t stink.\r\n\r\nMe.\r\n\r\n_I think this is going well_',0,'2013-04-18 02:19:29','2013-04-27 21:26:44'),(31,3,3,27,'Ppoint','This is a red one I see.\r\n',0,'2013-04-20 15:47:50','2013-04-20 15:48:04'),(37,3,3,940,'Title','Title stickie note',0,'2013-04-20 16:36:58','2013-04-26 13:55:08'),(39,3,3,40,'Document',NULL,0,'2013-04-20 16:52:38','2013-04-20 16:52:38'),(40,3,3,935,'Title','Is this still working?\r\n\r\nThis is for a title.\r\n\r\nJust checking.\r\n',0,'2013-04-20 17:19:07','2013-04-27 21:26:23'),(41,3,9,11,'Charttext','Here we go with the verticals again.\r\nI have a few points.\r\n\r\n* Here is one point\r\n* Here is another.\r\n\r\nYou get the idea.',0,'2013-04-20 19:47:57','2013-04-20 19:48:52'),(42,3,3,9,'Charttext','Outsides stickie note',0,'2013-04-26 13:54:55','2013-04-26 13:55:29'),(43,3,6,31,'Document','This is working again.\r\nYepper.\r\n',0,'2013-05-02 22:22:46','2013-05-02 22:23:00'),(45,3,6,30,'Document',NULL,0,'2013-05-02 22:38:57','2013-05-02 22:38:57'),(46,1,5,27,'Document',NULL,0,'2013-05-04 00:29:13','2013-05-04 00:29:13'),(47,1,3,5,'Comment','Does this work???!!!\r\n',0,'2013-05-04 22:50:12','2013-05-04 22:55:28'),(48,1,3,19,'Comment',NULL,0,'2013-05-04 22:55:45','2013-05-04 22:55:45'),(50,3,3,24,'Comment','Here we go now.\r\nI have added another stickie note to replace the one I just threw away. Now I am really making progress.\r\n\r\n{:> Buster',0,'2013-05-05 20:36:25','2013-05-05 20:37:04');
/*!40000 ALTER TABLE `staffnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `uptodate` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_states_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,3,1,'2013-04-13 19:54:44','2013-05-09 12:32:57'),(2,2,1,'2013-04-14 21:39:30','2013-04-14 21:40:27'),(3,4,1,'2013-05-06 18:42:24','2013-05-06 18:43:46'),(4,1,1,'2013-05-11 20:05:18','2013-05-11 20:05:18');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `templat_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `help` text COLLATE utf8_unicode_ci,
  `task_type` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tasks_on_assignment_id_and_position` (`assignment_id`,`position`),
  KEY `index_tasks_on_assignment_id_and_task_type` (`assignment_id`,`task_type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,6,1,'BRI',10,'#### Basic BRI Instructions\r\n\r\nI think you know what I am talking about here. I just wonder if the formatting works on this.\r\n\r\n- We shall see I guess.\r\n    - In layers and whatnot.',1,1,'2013-02-04 18:56:07','2013-03-07 00:01:33'),(2,6,NULL,'Charting',55,'Normal',3,2,'2013-02-04 18:56:41','2013-02-26 17:36:07'),(3,6,2,'Final App',10,'Normal',1,3,'2013-02-04 18:57:08','2013-03-13 03:00:10'),(4,6,4,'Summary',25,'',1,4,'2013-02-04 21:54:16','2013-03-13 03:00:10'),(5,3,1,'BRI',20,'Do a normal BRI.\r\n',1,2,'2013-03-06 05:41:00','2013-04-10 16:22:18'),(6,5,1,'BRI',10,'# Instructions for Galatians\r\n\r\n>>>\r\nThis should not be hard just do awesome stuff whenever possible.\r\n\r\n***Enjoy!***',1,NULL,'2013-03-13 03:07:12','2013-03-13 03:07:12'),(7,4,1,'BRI',10,'#### BRI for Ephesians\r\n\r\n>Do a normal BRI for this book. Nothing fancy, just answer the questions.\r\n\r\n>Don\'t forget to sign off on your readings.\r\n\r\n',1,NULL,'2013-03-24 01:07:27','2013-03-24 01:07:27'),(9,4,2,'Final App',10,'#### Final App\r\n\r\n>Just do the usual stuff.\r\n\r\n',1,NULL,'2013-03-24 01:26:10','2013-03-24 01:26:10'),(10,4,4,'Notes',0,'### Notes....',1,NULL,'2013-03-24 01:29:05','2013-03-24 01:29:05'),(11,9,3,'BRI',10,'Normal BRI',1,NULL,'2013-04-01 19:30:36','2013-04-01 19:30:36'),(12,9,NULL,'Charting',50,'Normal Charting.',3,NULL,'2013-04-01 19:31:07','2013-04-01 19:31:07'),(13,3,4,'Key Verse',10,'Basic Key verse stuff.\r\n\r\nNothing fancy here.\r\n',1,1,'2013-04-10 16:20:13','2013-04-10 16:22:18'),(14,3,NULL,'Charting',50,'Normal charting.\r\n\r\n***Range 2 - 3 charts***\r\n\r\nHave fun!',3,3,'2013-04-10 16:21:07','2013-04-10 16:22:18'),(15,3,2,'Final App',10,'Normal Final App\r\n\r\nNo Themes necessary.\r\n\r\n_Make sure your application is personal and doable._',1,5,'2013-04-10 16:22:05','2013-05-04 16:05:40'),(16,3,NULL,'Discussion',10,'### Discuss Discussions\r\n\r\nPlease add your comments to the following topic:\r\n\r\n>\r\nWhat is the major malfunction with discussion tasks? Why is this such a pain to use? \r\nDiscuss....',2,4,'2013-05-04 16:05:28','2013-05-04 16:05:40');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `coreteam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_teams_on_coreteam` (`coreteam`),
  KEY `index_teams_on_owner_id` (`owner_id`),
  KEY `index_teams_on_school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,1,2,'Main Team','### First Sweet Team.\r\n_With small edit here._','2013-02-06 00:56:04','2013-03-24 01:45:42',1),(2,1,1,'Second team','Another cool Team','2013-02-07 14:07:37','2013-02-17 22:50:05',1),(3,2,2,'Busters Team','This is a sweet team.','2013-02-11 03:20:54','2013-02-16 21:08:09',0),(4,1,2,'Other Main Team','This is the other core Team.','2013-02-19 04:22:27','2013-02-19 04:22:27',1),(5,1,2,'My Friends','These are my bestest friends. ever.','2013-05-05 23:35:58','2013-05-05 23:35:58',0),(7,1,2,'More Friends','I have a lot of friends.\r\nYep I do.\r\nYep I do.','2013-05-06 16:42:27','2013-05-06 16:42:27',0),(8,4,2,'My Friends','These are my own personal friends that I talk to.','2013-05-06 18:47:26','2013-05-06 18:47:26',0),(9,2,6,'Busters Main group','This is the big one.','2013-05-12 02:34:13','2013-05-12 02:34:13',1);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_users`
--

DROP TABLE IF EXISTS `teams_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_users` (
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  KEY `index_teams_users_on_user_id_and_team_id` (`user_id`,`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_users`
--

LOCK TABLES `teams_users` WRITE;
/*!40000 ALTER TABLE `teams_users` DISABLE KEYS */;
INSERT INTO `teams_users` VALUES (1,1),(1,2),(1,3),(1,5),(1,6),(1,7),(2,2),(2,3),(2,4),(2,5),(2,9),(3,1),(3,2),(3,3),(3,7),(4,1),(4,8),(5,1),(5,8),(6,2),(7,2),(7,4);
/*!40000 ALTER TABLE `teams_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templats`
--

DROP TABLE IF EXISTS `templats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `public` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `content_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_templats_on_school_id_and_name` (`school_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templats`
--

LOCK TABLES `templats` WRITE;
/*!40000 ALTER TABLE `templats` DISABLE KEYS */;
INSERT INTO `templats` VALUES (1,2,'BRI - Epistle','# Epistle BRI\r\n\r\n#### Critical Method\r\n\r\n## Authorship\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n## Dating\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n## Recipient\r\n\r\n___Internal Evidence___\r\n\r\n___External Evidence___\r\n\r\n___Conclusion___\r\n\r\n\r\n#### Historical Method\r\n\r\n\r\n\r\n#### Survey Method\r\n\r\n\r\n\r\n## Signature\r\n\r\nPlease sign if you have done all the required readings:\r\n\r\n_Your name here_\r\n\r\n---\r\n\r\n\r\n\r\n\r\n',0,'2013-01-31 16:40:57','2013-03-14 16:44:03',0),(2,2,'Final App','Sweet final truth here.',0,'2013-01-31 16:41:22','2013-01-31 16:41:22',0),(3,2,'BRI Old Testament - Narrative','Old Testament stuff.',0,'2013-01-31 16:42:14','2013-02-04 21:06:29',0),(4,2,'Blank','Add Text Here.',1,'2013-02-04 20:57:48','2013-02-04 20:57:48',0);
/*!40000 ALTER TABLE `templats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `wallpaper` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_themes_on_filename` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Clean','clean',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Default','default',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Default-right','default-right',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Clean-right','clean-right',0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title_hierarchies`
--

DROP TABLE IF EXISTS `title_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `title_hierarchies` (
  `ancestor_id` int(11) NOT NULL,
  `descendant_id` int(11) NOT NULL,
  `generations` int(11) NOT NULL,
  UNIQUE KEY `index_title_hierarchies_on_ancestor_id_and_descendant_id` (`ancestor_id`,`descendant_id`),
  KEY `index_title_hierarchies_on_descendant_id` (`descendant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_hierarchies`
--

LOCK TABLES `title_hierarchies` WRITE;
/*!40000 ALTER TABLE `title_hierarchies` DISABLE KEYS */;
INSERT INTO `title_hierarchies` VALUES (846,846,0),(847,847,0),(848,848,0),(849,849,0),(850,850,0),(851,851,0),(852,852,0),(853,853,0),(854,854,0),(855,855,0),(856,856,0),(857,857,0),(858,858,0),(859,859,0),(860,860,0),(861,861,0),(862,862,0),(863,863,0),(864,864,0),(865,865,0),(866,866,0),(867,867,0),(868,868,0),(869,869,0),(870,870,0),(872,846,1),(872,847,1),(872,848,1),(872,849,1),(872,850,1),(872,851,1),(872,852,1),(872,853,1),(872,854,1),(872,872,0),(873,855,1),(873,856,1),(873,857,1),(873,858,1),(873,859,1),(873,860,1),(873,861,1),(873,862,1),(873,873,0),(874,863,1),(874,864,1),(874,865,1),(874,866,1),(874,867,1),(874,868,1),(874,869,1),(874,870,1),(874,874,0),(875,875,0),(876,876,0),(877,877,0),(878,878,0),(879,879,0),(880,880,0),(881,881,0),(882,882,0),(883,883,0),(884,884,0),(885,885,0),(886,886,0),(887,887,0),(888,888,0),(889,889,0),(890,890,0),(891,891,0),(892,892,0),(893,893,0),(894,894,0),(895,895,0),(896,896,0),(897,897,0),(898,898,0),(899,899,0),(900,875,2),(900,876,2),(900,877,2),(900,878,2),(900,879,2),(900,880,2),(900,881,2),(900,882,2),(900,883,2),(900,884,2),(900,885,2),(900,886,2),(900,887,2),(900,888,2),(900,889,2),(900,890,2),(900,891,2),(900,892,2),(900,893,2),(900,894,2),(900,895,2),(900,896,2),(900,897,2),(900,898,2),(900,899,2),(900,900,0),(900,901,1),(900,902,1),(900,903,1),(901,875,1),(901,876,1),(901,877,1),(901,878,1),(901,879,1),(901,880,1),(901,881,1),(901,882,1),(901,901,0),(902,883,1),(902,884,1),(902,885,1),(902,886,1),(902,887,1),(902,888,1),(902,889,1),(902,902,0),(903,890,1),(903,891,1),(903,892,1),(903,893,1),(903,894,1),(903,895,1),(903,896,1),(903,897,1),(903,898,1),(903,899,1),(903,903,0),(904,904,0),(905,905,0),(906,906,0),(907,907,0),(908,908,0),(909,909,0),(910,910,0),(911,911,0),(912,912,0),(913,913,0),(914,914,0),(915,915,0),(916,916,0),(917,917,0),(918,918,0),(919,919,0),(920,920,0),(921,921,0),(922,922,0),(923,923,0),(924,924,0),(925,925,0),(926,926,0),(927,927,0),(928,928,0),(929,904,2),(929,905,2),(929,906,2),(929,907,2),(929,908,2),(929,909,2),(929,910,2),(929,911,2),(929,912,2),(929,913,2),(929,914,2),(929,915,2),(929,916,2),(929,917,2),(929,918,2),(929,919,2),(929,920,2),(929,921,2),(929,922,2),(929,923,2),(929,924,2),(929,925,2),(929,926,2),(929,927,2),(929,928,2),(929,929,0),(929,930,1),(929,931,1),(929,932,1),(930,904,1),(930,905,1),(930,906,1),(930,907,1),(930,908,1),(930,909,1),(930,910,1),(930,911,1),(930,930,0),(931,912,1),(931,913,1),(931,914,1),(931,915,1),(931,916,1),(931,917,1),(931,918,1),(931,919,1),(931,920,1),(931,931,0),(932,921,1),(932,922,1),(932,923,1),(932,924,1),(932,925,1),(932,926,1),(932,927,1),(932,928,1),(932,932,0),(934,846,2),(934,847,2),(934,848,2),(934,849,2),(934,850,2),(934,851,2),(934,852,2),(934,853,2),(934,854,2),(934,855,2),(934,856,2),(934,857,2),(934,858,2),(934,859,2),(934,860,2),(934,861,2),(934,862,2),(934,863,2),(934,864,2),(934,865,2),(934,866,2),(934,867,2),(934,868,2),(934,869,2),(934,870,2),(934,872,1),(934,873,1),(934,874,1),(934,934,0),(935,935,0),(936,936,0),(937,937,0),(938,938,0),(939,939,0),(940,940,0),(941,941,0),(942,942,0),(943,943,0),(944,944,0),(945,935,2),(945,936,2),(945,937,2),(945,938,2),(945,939,2),(945,940,2),(945,941,2),(945,942,2),(945,943,2),(945,944,2),(945,945,0),(945,946,1),(945,947,1),(945,1322,1),(946,935,1),(946,936,1),(946,937,1),(946,938,1),(946,939,1),(946,946,0),(947,940,1),(947,941,1),(947,947,0),(948,948,0),(949,949,0),(950,950,0),(951,951,0),(952,952,0),(953,953,0),(954,954,0),(955,955,0),(956,956,0),(957,957,0),(959,948,2),(959,949,2),(959,950,2),(959,951,2),(959,952,2),(959,953,2),(959,954,2),(959,955,2),(959,956,2),(959,957,2),(959,959,0),(959,960,1),(959,961,1),(960,948,1),(960,949,1),(960,950,1),(960,951,1),(960,952,1),(960,960,0),(961,953,1),(961,954,1),(961,955,1),(961,956,1),(961,957,1),(961,961,0),(962,962,0),(963,963,0),(964,964,0),(965,965,0),(966,966,0),(967,967,0),(968,968,0),(969,969,0),(970,970,0),(971,971,0),(972,972,0),(973,973,0),(974,974,0),(975,975,0),(976,976,0),(977,977,0),(978,978,0),(979,979,0),(980,980,0),(981,981,0),(982,982,0),(983,983,0),(984,984,0),(985,985,0),(986,986,0),(987,987,0),(988,988,0),(989,989,0),(990,990,0),(991,991,0),(992,992,0),(993,993,0),(994,994,0),(995,995,0),(996,996,0),(997,997,0),(998,998,0),(999,999,0),(1000,1000,0),(1001,1001,0),(1002,1002,0),(1003,1003,0),(1004,1004,0),(1005,1005,0),(1006,1006,0),(1007,1007,0),(1008,1008,0),(1009,1009,0),(1010,1010,0),(1011,1011,0),(1012,1012,0),(1013,1013,0),(1014,1014,0),(1015,1015,0),(1016,1016,0),(1017,1017,0),(1018,1018,0),(1019,1019,0),(1020,1020,0),(1021,1021,0),(1022,1022,0),(1023,1023,0),(1024,1024,0),(1025,1025,0),(1026,1026,0),(1027,1027,0),(1028,1028,0),(1029,1029,0),(1030,1030,0),(1031,1031,0),(1032,1032,0),(1033,1033,0),(1034,1034,0),(1035,1035,0),(1036,1036,0),(1037,1037,0),(1038,1038,0),(1039,1039,0),(1040,1040,0),(1041,1041,0),(1042,1042,0),(1043,1043,0),(1044,1044,0),(1045,1045,0),(1046,1046,0),(1047,1047,0),(1048,1048,0),(1049,1049,0),(1050,1050,0),(1051,1051,0),(1052,1052,0),(1053,1053,0),(1054,1054,0),(1055,1055,0),(1056,1056,0),(1057,1057,0),(1058,1058,0),(1059,1059,0),(1060,1060,0),(1061,1061,0),(1062,1062,0),(1063,1063,0),(1064,1064,0),(1065,1065,0),(1066,1066,0),(1067,1067,0),(1068,1068,0),(1069,1069,0),(1070,1070,0),(1071,1071,0),(1072,1072,0),(1073,1073,0),(1074,1074,0),(1075,1075,0),(1076,1076,0),(1077,1077,0),(1078,1078,0),(1079,1079,0),(1080,1080,0),(1081,1081,0),(1082,1082,0),(1083,1083,0),(1084,1084,0),(1085,1085,0),(1086,1086,0),(1087,1087,0),(1088,1088,0),(1089,1089,0),(1090,1090,0),(1091,1091,0),(1092,1092,0),(1093,1093,0),(1094,1094,0),(1095,1095,0),(1096,1096,0),(1097,1097,0),(1098,1098,0),(1099,1099,0),(1100,1100,0),(1101,1101,0),(1102,1102,0),(1103,1103,0),(1104,1104,0),(1105,1105,0),(1106,1106,0),(1107,1107,0),(1108,1108,0),(1109,1109,0),(1110,1110,0),(1111,1111,0),(1112,1112,0),(1113,1113,0),(1114,1114,0),(1115,1115,0),(1116,1116,0),(1117,1117,0),(1118,1118,0),(1119,1119,0),(1120,1120,0),(1121,1121,0),(1122,1122,0),(1123,1123,0),(1124,1124,0),(1125,1125,0),(1126,1126,0),(1127,1127,0),(1128,1128,0),(1129,1129,0),(1130,1130,0),(1131,1131,0),(1132,1132,0),(1133,1133,0),(1134,1134,0),(1135,1135,0),(1136,1136,0),(1137,1137,0),(1138,1138,0),(1139,1139,0),(1140,1140,0),(1141,1141,0),(1142,1142,0),(1143,1143,0),(1144,1144,0),(1145,1145,0),(1146,1146,0),(1147,1147,0),(1148,1148,0),(1149,1149,0),(1150,1150,0),(1151,1151,0),(1152,1152,0),(1153,1153,0),(1154,1154,0),(1155,1155,0),(1156,1156,0),(1157,1157,0),(1158,1158,0),(1159,1159,0),(1160,1160,0),(1161,1161,0),(1162,1162,0),(1163,1163,0),(1164,1164,0),(1165,1165,0),(1166,1166,0),(1167,1167,0),(1168,1168,0),(1169,1169,0),(1170,1170,0),(1171,1171,0),(1172,1172,0),(1173,1173,0),(1174,1174,0),(1175,1175,0),(1176,1176,0),(1177,1177,0),(1178,1178,0),(1179,1179,0),(1180,1180,0),(1181,1181,0),(1182,1182,0),(1183,1183,0),(1184,1184,0),(1185,1185,0),(1186,1186,0),(1187,1187,0),(1188,1188,0),(1189,1189,0),(1190,1190,0),(1191,1191,0),(1192,1192,0),(1193,1193,0),(1194,1194,0),(1195,1195,0),(1196,1196,0),(1197,1197,0),(1198,1198,0),(1199,1199,0),(1200,1200,0),(1201,1201,0),(1202,1202,0),(1203,1203,0),(1204,1204,0),(1205,1205,0),(1206,1206,0),(1207,1207,0),(1208,1208,0),(1209,1209,0),(1210,1210,0),(1211,1211,0),(1212,1212,0),(1213,1213,0),(1214,1214,0),(1215,1215,0),(1216,1216,0),(1217,1217,0),(1218,1218,0),(1219,1219,0),(1220,1220,0),(1221,1221,0),(1222,1222,0),(1223,1223,0),(1224,1224,0),(1225,1225,0),(1226,1226,0),(1227,1227,0),(1228,1228,0),(1229,1229,0),(1230,1230,0),(1231,1231,0),(1232,1232,0),(1233,1233,0),(1234,1234,0),(1235,1235,0),(1236,1236,0),(1237,1237,0),(1238,1238,0),(1239,1239,0),(1240,1240,0),(1241,1241,0),(1242,1242,0),(1243,1243,0),(1244,1244,0),(1245,1245,0),(1246,1246,0),(1247,1247,0),(1248,1248,0),(1249,1249,0),(1250,1250,0),(1251,1251,0),(1252,1252,0),(1253,1253,0),(1254,1254,0),(1255,1255,0),(1256,1256,0),(1257,1257,0),(1258,1258,0),(1259,1259,0),(1260,1260,0),(1261,1261,0),(1262,1262,0),(1263,1263,0),(1264,1264,0),(1265,1265,0),(1266,1266,0),(1267,1267,0),(1268,1268,0),(1269,1269,0),(1270,1270,0),(1271,1271,0),(1272,1272,0),(1273,1273,0),(1274,1274,0),(1275,1275,0),(1276,1276,0),(1277,1277,0),(1278,1278,0),(1279,1279,0),(1280,962,3),(1280,963,3),(1280,964,3),(1280,965,3),(1280,966,3),(1280,967,3),(1280,968,3),(1280,969,3),(1280,970,3),(1280,971,3),(1280,972,3),(1280,973,3),(1280,974,3),(1280,975,3),(1280,976,3),(1280,977,3),(1280,978,3),(1280,979,3),(1280,980,3),(1280,981,3),(1280,982,3),(1280,983,3),(1280,984,3),(1280,985,3),(1280,986,3),(1280,987,3),(1280,988,3),(1280,989,3),(1280,990,3),(1280,991,3),(1280,992,3),(1280,993,3),(1280,994,3),(1280,995,3),(1280,996,3),(1280,997,3),(1280,998,3),(1280,999,3),(1280,1000,3),(1280,1001,3),(1280,1002,3),(1280,1003,3),(1280,1004,3),(1280,1005,3),(1280,1006,3),(1280,1007,3),(1280,1008,3),(1280,1009,3),(1280,1010,3),(1280,1011,3),(1280,1012,3),(1280,1013,3),(1280,1014,3),(1280,1015,3),(1280,1016,3),(1280,1017,3),(1280,1018,3),(1280,1019,3),(1280,1020,3),(1280,1021,3),(1280,1022,3),(1280,1023,3),(1280,1024,3),(1280,1025,3),(1280,1026,3),(1280,1027,3),(1280,1028,3),(1280,1029,3),(1280,1030,3),(1280,1031,3),(1280,1032,3),(1280,1033,3),(1280,1034,3),(1280,1035,3),(1280,1036,3),(1280,1037,3),(1280,1038,3),(1280,1039,3),(1280,1040,3),(1280,1041,3),(1280,1042,3),(1280,1043,3),(1280,1044,3),(1280,1045,3),(1280,1046,3),(1280,1047,3),(1280,1048,3),(1280,1049,3),(1280,1050,3),(1280,1051,3),(1280,1052,3),(1280,1053,3),(1280,1054,3),(1280,1055,3),(1280,1056,3),(1280,1057,3),(1280,1058,3),(1280,1059,3),(1280,1060,3),(1280,1061,3),(1280,1062,3),(1280,1063,3),(1280,1064,3),(1280,1065,3),(1280,1066,3),(1280,1067,3),(1280,1068,3),(1280,1069,3),(1280,1070,3),(1280,1071,3),(1280,1072,3),(1280,1073,3),(1280,1074,3),(1280,1075,3),(1280,1076,3),(1280,1077,3),(1280,1078,3),(1280,1079,3),(1280,1080,3),(1280,1081,3),(1280,1082,3),(1280,1083,3),(1280,1084,3),(1280,1085,3),(1280,1086,3),(1280,1087,3),(1280,1088,3),(1280,1089,3),(1280,1090,3),(1280,1091,3),(1280,1092,3),(1280,1093,3),(1280,1094,3),(1280,1095,3),(1280,1096,3),(1280,1097,3),(1280,1098,3),(1280,1099,3),(1280,1100,3),(1280,1101,3),(1280,1102,3),(1280,1103,3),(1280,1104,3),(1280,1105,3),(1280,1106,3),(1280,1107,3),(1280,1108,3),(1280,1109,3),(1280,1110,3),(1280,1111,3),(1280,1112,3),(1280,1113,3),(1280,1114,3),(1280,1115,3),(1280,1116,3),(1280,1117,3),(1280,1118,3),(1280,1119,3),(1280,1120,3),(1280,1121,3),(1280,1122,3),(1280,1123,3),(1280,1124,3),(1280,1125,3),(1280,1126,3),(1280,1127,3),(1280,1128,3),(1280,1129,3),(1280,1130,3),(1280,1131,3),(1280,1132,3),(1280,1133,3),(1280,1134,3),(1280,1135,3),(1280,1136,3),(1280,1137,3),(1280,1138,3),(1280,1139,3),(1280,1140,3),(1280,1141,3),(1280,1142,3),(1280,1143,3),(1280,1144,3),(1280,1145,3),(1280,1146,3),(1280,1147,3),(1280,1148,3),(1280,1149,3),(1280,1150,3),(1280,1151,3),(1280,1152,3),(1280,1153,3),(1280,1154,3),(1280,1155,3),(1280,1156,3),(1280,1157,3),(1280,1158,3),(1280,1159,3),(1280,1160,3),(1280,1161,3),(1280,1162,3),(1280,1163,3),(1280,1164,3),(1280,1165,3),(1280,1166,3),(1280,1167,3),(1280,1168,3),(1280,1169,3),(1280,1170,3),(1280,1171,3),(1280,1172,3),(1280,1173,3),(1280,1174,3),(1280,1175,3),(1280,1176,3),(1280,1177,3),(1280,1178,3),(1280,1179,3),(1280,1180,3),(1280,1181,3),(1280,1182,3),(1280,1183,3),(1280,1184,3),(1280,1185,3),(1280,1186,3),(1280,1187,3),(1280,1188,3),(1280,1189,3),(1280,1190,3),(1280,1191,3),(1280,1192,3),(1280,1193,3),(1280,1194,3),(1280,1195,3),(1280,1196,3),(1280,1197,3),(1280,1198,3),(1280,1199,3),(1280,1200,3),(1280,1201,3),(1280,1202,3),(1280,1203,3),(1280,1204,3),(1280,1205,3),(1280,1206,3),(1280,1207,3),(1280,1208,3),(1280,1209,3),(1280,1210,3),(1280,1211,3),(1280,1212,3),(1280,1213,3),(1280,1214,3),(1280,1215,3),(1280,1216,3),(1280,1217,3),(1280,1218,3),(1280,1219,3),(1280,1220,3),(1280,1221,3),(1280,1222,3),(1280,1223,3),(1280,1224,3),(1280,1225,3),(1280,1226,3),(1280,1227,3),(1280,1228,3),(1280,1229,3),(1280,1230,3),(1280,1231,3),(1280,1232,3),(1280,1233,3),(1280,1234,3),(1280,1235,3),(1280,1236,3),(1280,1237,3),(1280,1238,3),(1280,1239,3),(1280,1240,3),(1280,1241,3),(1280,1242,3),(1280,1243,3),(1280,1244,3),(1280,1245,3),(1280,1246,3),(1280,1247,3),(1280,1248,3),(1280,1249,3),(1280,1250,3),(1280,1251,3),(1280,1252,3),(1280,1253,3),(1280,1254,3),(1280,1255,3),(1280,1256,3),(1280,1257,3),(1280,1258,3),(1280,1259,3),(1280,1260,3),(1280,1261,3),(1280,1262,3),(1280,1263,3),(1280,1264,3),(1280,1265,3),(1280,1266,3),(1280,1267,3),(1280,1268,3),(1280,1269,3),(1280,1270,3),(1280,1271,3),(1280,1272,3),(1280,1273,3),(1280,1274,3),(1280,1275,3),(1280,1276,3),(1280,1277,3),(1280,1278,3),(1280,1279,3),(1280,1280,0),(1280,1281,1),(1280,1282,1),(1280,1283,1),(1280,1284,2),(1280,1285,2),(1280,1286,2),(1280,1287,2),(1280,1288,2),(1280,1289,2),(1280,1290,2),(1280,1291,2),(1280,1292,2),(1280,1293,2),(1280,1294,2),(1280,1295,2),(1280,1296,2),(1280,1297,2),(1280,1298,2),(1280,1299,2),(1280,1300,2),(1280,1301,2),(1280,1302,2),(1280,1303,2),(1280,1304,2),(1280,1305,2),(1280,1306,2),(1280,1307,2),(1281,962,2),(1281,963,2),(1281,964,2),(1281,965,2),(1281,966,2),(1281,967,2),(1281,968,2),(1281,969,2),(1281,970,2),(1281,971,2),(1281,972,2),(1281,973,2),(1281,974,2),(1281,975,2),(1281,976,2),(1281,977,2),(1281,978,2),(1281,979,2),(1281,980,2),(1281,981,2),(1281,982,2),(1281,983,2),(1281,984,2),(1281,985,2),(1281,986,2),(1281,987,2),(1281,988,2),(1281,989,2),(1281,990,2),(1281,991,2),(1281,992,2),(1281,993,2),(1281,994,2),(1281,995,2),(1281,996,2),(1281,997,2),(1281,998,2),(1281,999,2),(1281,1000,2),(1281,1001,2),(1281,1002,2),(1281,1003,2),(1281,1004,2),(1281,1005,2),(1281,1006,2),(1281,1007,2),(1281,1008,2),(1281,1009,2),(1281,1010,2),(1281,1011,2),(1281,1012,2),(1281,1013,2),(1281,1014,2),(1281,1015,2),(1281,1016,2),(1281,1017,2),(1281,1018,2),(1281,1019,2),(1281,1020,2),(1281,1021,2),(1281,1022,2),(1281,1023,2),(1281,1024,2),(1281,1025,2),(1281,1026,2),(1281,1027,2),(1281,1028,2),(1281,1029,2),(1281,1030,2),(1281,1031,2),(1281,1032,2),(1281,1033,2),(1281,1034,2),(1281,1035,2),(1281,1036,2),(1281,1037,2),(1281,1038,2),(1281,1281,0),(1281,1284,1),(1281,1285,1),(1281,1286,1),(1281,1287,1),(1281,1288,1),(1281,1289,1),(1281,1290,1),(1282,1039,2),(1282,1040,2),(1282,1041,2),(1282,1042,2),(1282,1043,2),(1282,1044,2),(1282,1045,2),(1282,1046,2),(1282,1047,2),(1282,1048,2),(1282,1049,2),(1282,1050,2),(1282,1051,2),(1282,1052,2),(1282,1053,2),(1282,1054,2),(1282,1055,2),(1282,1056,2),(1282,1057,2),(1282,1058,2),(1282,1059,2),(1282,1060,2),(1282,1061,2),(1282,1062,2),(1282,1063,2),(1282,1064,2),(1282,1065,2),(1282,1066,2),(1282,1067,2),(1282,1068,2),(1282,1069,2),(1282,1070,2),(1282,1071,2),(1282,1072,2),(1282,1073,2),(1282,1074,2),(1282,1075,2),(1282,1076,2),(1282,1077,2),(1282,1078,2),(1282,1079,2),(1282,1080,2),(1282,1081,2),(1282,1082,2),(1282,1083,2),(1282,1084,2),(1282,1085,2),(1282,1086,2),(1282,1087,2),(1282,1088,2),(1282,1089,2),(1282,1090,2),(1282,1091,2),(1282,1092,2),(1282,1093,2),(1282,1094,2),(1282,1095,2),(1282,1096,2),(1282,1097,2),(1282,1098,2),(1282,1099,2),(1282,1100,2),(1282,1101,2),(1282,1102,2),(1282,1103,2),(1282,1104,2),(1282,1105,2),(1282,1106,2),(1282,1107,2),(1282,1108,2),(1282,1109,2),(1282,1110,2),(1282,1111,2),(1282,1112,2),(1282,1113,2),(1282,1114,2),(1282,1115,2),(1282,1116,2),(1282,1117,2),(1282,1118,2),(1282,1119,2),(1282,1120,2),(1282,1121,2),(1282,1122,2),(1282,1123,2),(1282,1124,2),(1282,1125,2),(1282,1126,2),(1282,1127,2),(1282,1128,2),(1282,1129,2),(1282,1130,2),(1282,1131,2),(1282,1132,2),(1282,1133,2),(1282,1134,2),(1282,1135,2),(1282,1136,2),(1282,1137,2),(1282,1138,2),(1282,1139,2),(1282,1140,2),(1282,1282,0),(1282,1291,1),(1282,1292,1),(1282,1293,1),(1282,1294,1),(1282,1295,1),(1282,1296,1),(1282,1297,1),(1283,1141,2),(1283,1142,2),(1283,1143,2),(1283,1144,2),(1283,1145,2),(1283,1146,2),(1283,1147,2),(1283,1148,2),(1283,1149,2),(1283,1150,2),(1283,1151,2),(1283,1152,2),(1283,1153,2),(1283,1154,2),(1283,1155,2),(1283,1156,2),(1283,1157,2),(1283,1158,2),(1283,1159,2),(1283,1160,2),(1283,1161,2),(1283,1162,2),(1283,1163,2),(1283,1164,2),(1283,1165,2),(1283,1166,2),(1283,1167,2),(1283,1168,2),(1283,1169,2),(1283,1170,2),(1283,1171,2),(1283,1172,2),(1283,1173,2),(1283,1174,2),(1283,1175,2),(1283,1176,2),(1283,1177,2),(1283,1178,2),(1283,1179,2),(1283,1180,2),(1283,1181,2),(1283,1182,2),(1283,1183,2),(1283,1184,2),(1283,1185,2),(1283,1186,2),(1283,1187,2),(1283,1188,2),(1283,1189,2),(1283,1190,2),(1283,1191,2),(1283,1192,2),(1283,1193,2),(1283,1194,2),(1283,1195,2),(1283,1196,2),(1283,1197,2),(1283,1198,2),(1283,1199,2),(1283,1200,2),(1283,1201,2),(1283,1202,2),(1283,1203,2),(1283,1204,2),(1283,1205,2),(1283,1206,2),(1283,1207,2),(1283,1208,2),(1283,1209,2),(1283,1210,2),(1283,1211,2),(1283,1212,2),(1283,1213,2),(1283,1214,2),(1283,1215,2),(1283,1216,2),(1283,1217,2),(1283,1218,2),(1283,1219,2),(1283,1220,2),(1283,1221,2),(1283,1222,2),(1283,1223,2),(1283,1224,2),(1283,1225,2),(1283,1226,2),(1283,1227,2),(1283,1228,2),(1283,1229,2),(1283,1230,2),(1283,1231,2),(1283,1232,2),(1283,1233,2),(1283,1234,2),(1283,1235,2),(1283,1236,2),(1283,1237,2),(1283,1238,2),(1283,1239,2),(1283,1240,2),(1283,1241,2),(1283,1242,2),(1283,1243,2),(1283,1244,2),(1283,1245,2),(1283,1246,2),(1283,1247,2),(1283,1248,2),(1283,1249,2),(1283,1250,2),(1283,1251,2),(1283,1252,2),(1283,1253,2),(1283,1254,2),(1283,1255,2),(1283,1256,2),(1283,1257,2),(1283,1258,2),(1283,1259,2),(1283,1260,2),(1283,1261,2),(1283,1262,2),(1283,1263,2),(1283,1264,2),(1283,1265,2),(1283,1266,2),(1283,1267,2),(1283,1268,2),(1283,1269,2),(1283,1270,2),(1283,1271,2),(1283,1272,2),(1283,1273,2),(1283,1274,2),(1283,1275,2),(1283,1276,2),(1283,1277,2),(1283,1278,2),(1283,1279,2),(1283,1283,0),(1283,1298,1),(1283,1299,1),(1283,1300,1),(1283,1301,1),(1283,1302,1),(1283,1303,1),(1283,1304,1),(1283,1305,1),(1283,1306,1),(1283,1307,1),(1284,962,1),(1284,963,1),(1284,964,1),(1284,965,1),(1284,966,1),(1284,967,1),(1284,968,1),(1284,969,1),(1284,970,1),(1284,971,1),(1284,972,1),(1284,973,1),(1284,1284,0),(1285,974,1),(1285,975,1),(1285,976,1),(1285,977,1),(1285,978,1),(1285,979,1),(1285,980,1),(1285,981,1),(1285,1285,0),(1286,982,1),(1286,983,1),(1286,984,1),(1286,985,1),(1286,986,1),(1286,987,1),(1286,988,1),(1286,989,1),(1286,990,1),(1286,991,1),(1286,1286,0),(1287,992,1),(1287,993,1),(1287,994,1),(1287,995,1),(1287,996,1),(1287,997,1),(1287,998,1),(1287,999,1),(1287,1000,1),(1287,1287,0),(1288,1001,1),(1288,1002,1),(1288,1003,1),(1288,1004,1),(1288,1005,1),(1288,1006,1),(1288,1007,1),(1288,1008,1),(1288,1009,1),(1288,1010,1),(1288,1288,0),(1289,1011,1),(1289,1012,1),(1289,1013,1),(1289,1014,1),(1289,1015,1),(1289,1016,1),(1289,1017,1),(1289,1018,1),(1289,1019,1),(1289,1020,1),(1289,1021,1),(1289,1022,1),(1289,1289,0),(1290,1023,1),(1290,1024,1),(1290,1025,1),(1290,1026,1),(1290,1027,1),(1290,1028,1),(1290,1029,1),(1290,1030,1),(1290,1031,1),(1290,1032,1),(1290,1033,1),(1290,1034,1),(1290,1035,1),(1290,1036,1),(1290,1037,1),(1290,1038,1),(1290,1290,0),(1291,1039,1),(1291,1040,1),(1291,1041,1),(1291,1042,1),(1291,1043,1),(1291,1044,1),(1291,1045,1),(1291,1046,1),(1291,1047,1),(1291,1048,1),(1291,1049,1),(1291,1050,1),(1291,1291,0),(1292,1051,1),(1292,1052,1),(1292,1053,1),(1292,1054,1),(1292,1055,1),(1292,1056,1),(1292,1057,1),(1292,1058,1),(1292,1059,1),(1292,1060,1),(1292,1061,1),(1292,1062,1),(1292,1292,0),(1293,1063,1),(1293,1064,1),(1293,1065,1),(1293,1066,1),(1293,1067,1),(1293,1068,1),(1293,1069,1),(1293,1070,1),(1293,1071,1),(1293,1072,1),(1293,1073,1),(1293,1074,1),(1293,1075,1),(1293,1293,0),(1294,1076,1),(1294,1077,1),(1294,1078,1),(1294,1079,1),(1294,1080,1),(1294,1081,1),(1294,1082,1),(1294,1083,1),(1294,1084,1),(1294,1085,1),(1294,1086,1),(1294,1087,1),(1294,1088,1),(1294,1294,0),(1295,1089,1),(1295,1090,1),(1295,1091,1),(1295,1092,1),(1295,1093,1),(1295,1094,1),(1295,1095,1),(1295,1096,1),(1295,1097,1),(1295,1098,1),(1295,1099,1),(1295,1100,1),(1295,1101,1),(1295,1102,1),(1295,1103,1),(1295,1104,1),(1295,1105,1),(1295,1106,1),(1295,1107,1),(1295,1295,0),(1296,1108,1),(1296,1109,1),(1296,1110,1),(1296,1111,1),(1296,1112,1),(1296,1113,1),(1296,1114,1),(1296,1115,1),(1296,1116,1),(1296,1296,0),(1297,1117,1),(1297,1118,1),(1297,1119,1),(1297,1120,1),(1297,1121,1),(1297,1122,1),(1297,1123,1),(1297,1124,1),(1297,1125,1),(1297,1126,1),(1297,1127,1),(1297,1128,1),(1297,1129,1),(1297,1130,1),(1297,1131,1),(1297,1132,1),(1297,1133,1),(1297,1134,1),(1297,1135,1),(1297,1136,1),(1297,1137,1),(1297,1138,1),(1297,1139,1),(1297,1140,1),(1297,1297,0),(1298,1141,1),(1298,1142,1),(1298,1143,1),(1298,1144,1),(1298,1145,1),(1298,1146,1),(1298,1147,1),(1298,1148,1),(1298,1149,1),(1298,1150,1),(1298,1151,1),(1298,1152,1),(1298,1153,1),(1298,1154,1),(1298,1155,1),(1298,1156,1),(1298,1157,1),(1298,1298,0),(1299,1158,1),(1299,1159,1),(1299,1160,1),(1299,1161,1),(1299,1162,1),(1299,1163,1),(1299,1164,1),(1299,1165,1),(1299,1166,1),(1299,1167,1),(1299,1168,1),(1299,1169,1),(1299,1170,1),(1299,1299,0),(1300,1171,1),(1300,1172,1),(1300,1173,1),(1300,1174,1),(1300,1175,1),(1300,1176,1),(1300,1177,1),(1300,1178,1),(1300,1179,1),(1300,1180,1),(1300,1181,1),(1300,1182,1),(1300,1183,1),(1300,1300,0),(1301,1184,1),(1301,1185,1),(1301,1186,1),(1301,1187,1),(1301,1188,1),(1301,1189,1),(1301,1190,1),(1301,1191,1),(1301,1192,1),(1301,1193,1),(1301,1194,1),(1301,1195,1),(1301,1196,1),(1301,1197,1),(1301,1198,1),(1301,1301,0),(1302,1199,1),(1302,1200,1),(1302,1201,1),(1302,1202,1),(1302,1203,1),(1302,1204,1),(1302,1205,1),(1302,1206,1),(1302,1207,1),(1302,1208,1),(1302,1209,1),(1302,1210,1),(1302,1302,0),(1303,1211,1),(1303,1212,1),(1303,1213,1),(1303,1214,1),(1303,1215,1),(1303,1216,1),(1303,1217,1),(1303,1218,1),(1303,1219,1),(1303,1220,1),(1303,1221,1),(1303,1222,1),(1303,1303,0),(1304,1223,1),(1304,1224,1),(1304,1225,1),(1304,1226,1),(1304,1227,1),(1304,1228,1),(1304,1229,1),(1304,1230,1),(1304,1231,1),(1304,1232,1),(1304,1233,1),(1304,1234,1),(1304,1235,1),(1304,1236,1),(1304,1237,1),(1304,1238,1),(1304,1304,0),(1305,1239,1),(1305,1240,1),(1305,1241,1),(1305,1242,1),(1305,1243,1),(1305,1244,1),(1305,1245,1),(1305,1246,1),(1305,1247,1),(1305,1248,1),(1305,1249,1),(1305,1250,1),(1305,1251,1),(1305,1252,1),(1305,1253,1),(1305,1254,1),(1305,1255,1),(1305,1305,0),(1306,1256,1),(1306,1257,1),(1306,1258,1),(1306,1259,1),(1306,1260,1),(1306,1261,1),(1306,1262,1),(1306,1263,1),(1306,1264,1),(1306,1265,1),(1306,1266,1),(1306,1267,1),(1306,1306,0),(1307,1268,1),(1307,1269,1),(1307,1270,1),(1307,1271,1),(1307,1272,1),(1307,1273,1),(1307,1274,1),(1307,1275,1),(1307,1276,1),(1307,1277,1),(1307,1278,1),(1307,1279,1),(1307,1307,0),(1308,1308,0),(1309,1309,0),(1310,1310,0),(1311,1311,0),(1312,1312,0),(1313,1313,0),(1314,1314,0),(1315,1315,0),(1316,1316,0),(1317,1317,0),(1318,1308,2),(1318,1309,2),(1318,1310,2),(1318,1311,2),(1318,1312,2),(1318,1313,2),(1318,1314,2),(1318,1315,2),(1318,1316,2),(1318,1317,2),(1318,1318,0),(1318,1319,1),(1318,1320,1),(1318,1321,1),(1319,1308,1),(1319,1309,1),(1319,1310,1),(1319,1311,1),(1319,1319,0),(1320,1312,1),(1320,1313,1),(1320,1314,1),(1320,1320,0),(1321,1315,1),(1321,1316,1),(1321,1317,1),(1321,1321,0),(1322,942,1),(1322,943,1),(1322,944,1),(1322,1322,0);
/*!40000 ALTER TABLE `title_hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `paragraph_id` int(11) DEFAULT NULL,
  `title_type` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `segnum` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `verse_count` int(11) DEFAULT NULL,
  `staff_note` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_titles_on_school_id` (`school_id`),
  KEY `index_titles_on_parent_id` (`parent_id`),
  KEY `index_titles_on_task_id` (`task_id`),
  KEY `index_titles_on_user_id_and_task_id_and_position` (`user_id`,`task_id`,`position`),
  KEY `index_titles_on_assignment_id` (`assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1323 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (846,872,1,2,6,2,7140,1,2,NULL,'1:1a This is Four WOOORRRDS',1,NULL,'2013-04-06 18:41:35','2013-04-06 19:36:20'),(847,872,1,2,6,2,7141,1,3,NULL,'1:1b This is another paragraph',1,NULL,'2013-04-06 18:41:35','2013-04-07 03:52:12'),(848,872,1,2,6,2,7142,1,4,NULL,'1:2 This is another one',1,NULL,'2013-04-06 18:41:35','2013-04-07 03:52:20'),(849,872,1,2,6,2,7143,1,5,NULL,'1:3 I guess this works now.',9,NULL,'2013-04-06 18:41:35','2013-04-07 03:52:30'),(850,872,1,2,6,2,7144,1,6,NULL,'1:12 Biiiiiggggg looonnnng worrrrds biblically',3,NULL,'2013-04-06 18:41:35','2013-04-08 16:31:28'),(851,872,1,2,6,2,7145,1,7,NULL,'1:15 Hows the titling going?',4,NULL,'2013-04-06 18:41:35','2013-04-08 16:31:28'),(852,872,1,2,6,2,7146,1,8,NULL,'1:18b Pretty good',9,NULL,'2013-04-06 18:41:35','2013-04-08 16:31:28'),(853,872,1,2,6,2,7147,1,9,NULL,'1:27',4,NULL,'2013-04-06 18:41:35','2013-04-08 16:31:28'),(854,872,1,2,6,2,7148,1,10,NULL,'2:1',11,NULL,'2013-04-06 18:41:35','2013-04-08 16:31:28'),(855,873,1,2,6,2,7149,1,12,NULL,'2:12',2,NULL,'2013-04-06 18:41:35','2013-04-06 19:02:42'),(856,873,1,2,6,2,7150,1,13,NULL,'2:14',5,NULL,'2013-04-06 18:41:35','2013-04-06 19:02:42'),(857,873,1,2,6,2,7151,1,14,NULL,'2:19',6,NULL,'2013-04-06 18:41:35','2013-04-06 19:02:42'),(858,873,1,2,6,2,7152,1,15,NULL,'2:25',6,NULL,'2013-04-06 18:41:35','2013-04-08 16:32:36'),(859,873,1,2,6,2,7153,1,16,NULL,'3:1',1,NULL,'2013-04-06 18:41:35','2013-04-08 16:32:36'),(860,873,1,2,6,2,7154,1,17,NULL,'3:2',10,NULL,'2013-04-06 18:41:36','2013-04-08 16:32:36'),(861,873,1,2,6,2,7155,1,18,NULL,'3:12',5,NULL,'2013-04-06 18:41:36','2013-04-08 16:32:36'),(862,873,1,2,6,2,7156,1,19,NULL,'3:17',5,NULL,'2013-04-06 18:41:36','2013-04-08 16:32:36'),(863,874,1,2,6,2,7157,1,21,NULL,'4:1',1,NULL,'2013-04-06 18:41:36','2013-04-06 19:02:42'),(864,874,1,2,6,2,7158,1,22,NULL,'4:2',2,NULL,'2013-04-06 18:41:36','2013-04-06 19:02:42'),(865,874,1,2,6,2,7159,1,23,NULL,'4:4',4,NULL,'2013-04-06 18:41:36','2013-04-06 19:02:42'),(866,874,1,2,6,2,7160,1,24,NULL,'4:8',2,NULL,'2013-04-06 18:41:36','2013-04-06 19:02:42'),(867,874,1,2,6,2,7161,1,25,NULL,'4:10',4,NULL,'2013-04-06 18:41:36','2013-04-08 16:32:37'),(868,874,1,2,6,2,7162,1,26,NULL,'4:14',7,NULL,'2013-04-06 18:41:36','2013-04-08 16:32:37'),(869,874,1,2,6,2,7163,1,27,NULL,'4:21',2,NULL,'2013-04-06 18:41:36','2013-04-08 16:32:37'),(870,874,1,2,6,2,7164,1,28,NULL,'4:23',1,NULL,'2013-04-06 18:41:36','2013-04-08 16:32:37'),(872,934,1,2,6,2,NULL,2,1,1,'Segment One',43,NULL,'2013-04-06 19:01:11','2013-05-11 20:05:18'),(873,934,1,2,6,2,NULL,2,11,2,'Segment Two',40,NULL,'2013-04-06 19:01:59','2013-05-11 20:05:18'),(874,934,1,2,6,2,NULL,2,20,3,'Segment Three',23,NULL,'2013-04-06 19:02:12','2013-05-11 20:05:18'),(875,901,2,2,6,2,7140,1,2,NULL,'1:1a First Paragraph Title Here.',1,NULL,'2013-04-09 01:49:32','2013-04-09 01:51:02'),(876,901,2,2,6,2,7141,1,3,NULL,'1:1b',1,NULL,'2013-04-09 01:49:32','2013-04-09 01:51:02'),(877,901,2,2,6,2,7142,1,4,NULL,'1:2',1,NULL,'2013-04-09 01:49:32','2013-04-09 01:51:02'),(878,901,2,2,6,2,7143,1,5,NULL,'1:3',9,NULL,'2013-04-09 01:49:32','2013-04-09 01:51:02'),(879,901,2,2,6,2,7144,1,6,NULL,'1:12',3,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(880,901,2,2,6,2,7145,1,7,NULL,'1:15',4,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(881,901,2,2,6,2,7146,1,8,NULL,'1:18b',9,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(882,901,2,2,6,2,7147,1,9,NULL,'1:27',4,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(883,902,2,2,6,2,7148,1,11,NULL,'2:1',11,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(884,902,2,2,6,2,7149,1,12,NULL,'2:12',2,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(885,902,2,2,6,2,7150,1,13,NULL,'2:14',5,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(886,902,2,2,6,2,7151,1,14,NULL,'2:19',6,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(887,902,2,2,6,2,7152,1,15,NULL,'2:25',6,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:02'),(888,902,2,2,6,2,7153,1,16,NULL,'3:1',1,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:03'),(889,902,2,2,6,2,7154,1,17,NULL,'3:2',10,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:03'),(890,903,2,2,6,2,7155,1,19,NULL,'3:12',5,NULL,'2013-04-09 01:49:33','2013-04-09 01:51:03'),(891,903,2,2,6,2,7156,1,20,NULL,'3:17',5,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(892,903,2,2,6,2,7157,1,21,NULL,'4:1',1,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(893,903,2,2,6,2,7158,1,22,NULL,'4:2',2,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(894,903,2,2,6,2,7159,1,23,NULL,'4:4',4,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(895,903,2,2,6,2,7160,1,24,NULL,'4:8',2,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(896,903,2,2,6,2,7161,1,25,NULL,'4:10',4,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(897,903,2,2,6,2,7162,1,26,NULL,'4:14',7,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(898,903,2,2,6,2,7163,1,27,NULL,'4:21',2,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(899,903,2,2,6,2,7164,1,28,NULL,'4:23',1,NULL,'2013-04-09 01:49:34','2013-04-09 01:51:03'),(900,NULL,2,2,6,2,NULL,5,0,NULL,'Philippians',106,NULL,'2013-04-09 01:49:42','2013-04-09 01:51:03'),(901,900,2,2,6,2,NULL,2,1,NULL,'Segment One',32,NULL,'2013-04-09 01:49:55','2013-04-09 01:51:03'),(902,900,2,2,6,2,NULL,2,10,NULL,'Segment Two',41,NULL,'2013-04-09 01:50:25','2013-04-09 01:51:03'),(903,900,2,2,6,2,NULL,2,18,NULL,'Segment Three',33,NULL,'2013-04-09 01:50:41','2013-04-09 01:51:03'),(904,930,3,2,6,2,7140,1,2,NULL,'1:1a',1,NULL,'2013-04-09 01:51:53','2013-04-09 01:52:53'),(905,930,3,2,6,2,7141,1,3,NULL,'1:1b',1,NULL,'2013-04-09 01:51:53','2013-04-09 01:52:53'),(906,930,3,2,6,2,7142,1,4,NULL,'1:2',1,NULL,'2013-04-09 01:51:53','2013-04-09 01:52:53'),(907,930,3,2,6,2,7143,1,5,NULL,'1:3',9,NULL,'2013-04-09 01:51:53','2013-04-09 01:52:53'),(908,930,3,2,6,2,7144,1,6,NULL,'1:12',3,NULL,'2013-04-09 01:51:53','2013-04-09 01:52:53'),(909,930,3,2,6,2,7145,1,7,NULL,'1:15',4,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:53'),(910,930,3,2,6,2,7146,1,8,NULL,'1:18b',9,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:53'),(911,930,3,2,6,2,7147,1,9,NULL,'1:27',4,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:53'),(912,931,3,2,6,2,7148,1,11,NULL,'2:1',11,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(913,931,3,2,6,2,7149,1,12,NULL,'2:12',2,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(914,931,3,2,6,2,7150,1,13,NULL,'2:14',5,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(915,931,3,2,6,2,7151,1,14,NULL,'2:19',6,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(916,931,3,2,6,2,7152,1,15,NULL,'2:25',6,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(917,931,3,2,6,2,7153,1,16,NULL,'3:1',1,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(918,931,3,2,6,2,7154,1,17,NULL,'3:2',10,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(919,931,3,2,6,2,7155,1,18,NULL,'3:12',5,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(920,931,3,2,6,2,7156,1,19,NULL,'3:17',5,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(921,932,3,2,6,2,7157,1,21,NULL,'4:1',1,NULL,'2013-04-09 01:51:54','2013-04-09 01:52:54'),(922,932,3,2,6,2,7158,1,22,NULL,'4:2',2,NULL,'2013-04-09 01:51:55','2013-04-09 01:52:54'),(923,932,3,2,6,2,7159,1,23,NULL,'4:4',4,NULL,'2013-04-09 01:51:55','2013-04-09 01:52:54'),(924,932,3,2,6,2,7160,1,24,NULL,'4:8',2,NULL,'2013-04-09 01:51:55','2013-04-09 01:52:54'),(925,932,3,2,6,2,7161,1,25,NULL,'4:10',4,NULL,'2013-04-09 01:51:55','2013-04-09 01:52:54'),(926,932,3,2,6,2,7162,1,26,NULL,'4:14',7,NULL,'2013-04-09 01:51:55','2013-04-09 01:52:54'),(927,932,3,2,6,2,7163,1,27,NULL,'4:21',2,NULL,'2013-04-09 01:51:55','2013-04-09 01:52:54'),(928,932,3,2,6,2,7164,1,28,NULL,'4:23',1,NULL,'2013-04-09 01:51:55','2013-04-09 01:52:54'),(929,NULL,3,2,6,2,NULL,5,0,NULL,'Philippians',106,NULL,'2013-04-09 01:52:01','2013-04-09 01:52:55'),(930,929,3,2,6,2,NULL,2,1,1,'Segment One',32,NULL,'2013-04-09 01:52:15','2013-05-02 21:55:24'),(931,929,3,2,6,2,NULL,2,10,2,'Segment Two',51,NULL,'2013-04-09 01:52:29','2013-05-02 21:55:24'),(932,929,3,2,6,2,NULL,2,20,3,'Segment Three',23,NULL,'2013-04-09 01:52:41','2013-05-02 21:55:24'),(934,NULL,1,2,6,2,NULL,5,0,NULL,'Philippians',106,NULL,'2013-04-09 23:57:10','2013-04-09 23:57:24'),(935,946,3,2,3,14,6996,1,2,NULL,'1:1 Paragraph ones',3,NULL,'2013-04-10 16:28:15','2013-04-13 20:08:45'),(936,946,3,2,3,14,6997,1,3,NULL,'1:4 Second title',1,NULL,'2013-04-10 16:28:15','2013-04-10 16:33:28'),(937,946,3,2,3,14,6998,1,4,NULL,'1:5 Another title',5,NULL,'2013-04-10 16:28:15','2013-04-10 16:33:28'),(938,946,3,2,3,14,6999,1,5,NULL,'1:10So far - So good',7,NULL,'2013-04-10 16:28:15','2013-04-10 16:33:28'),(939,946,3,2,3,14,7000,1,6,NULL,'2:1 Second chapter lead in',10,NULL,'2013-04-10 16:28:15','2013-04-10 16:33:28'),(940,947,3,2,3,14,7001,1,8,NULL,'2:11 Another title',4,NULL,'2013-04-10 16:28:15','2013-04-10 16:33:28'),(941,947,3,2,3,14,7002,1,9,NULL,'2:15 I think you get it',1,NULL,'2013-04-10 16:28:15','2013-04-10 16:33:28'),(942,1322,3,2,3,14,7003,1,11,NULL,'3:1 No reason to doubt',11,NULL,'2013-04-10 16:28:16','2013-05-08 16:29:47'),(943,1322,3,2,3,14,7004,1,12,NULL,'3:12 Still titling',2,NULL,'2013-04-10 16:28:16','2013-05-08 16:29:47'),(944,1322,3,2,3,14,7005,1,13,NULL,'3:15 Finally done',1,NULL,'2013-04-10 16:28:16','2013-05-08 16:29:47'),(945,NULL,3,2,3,14,NULL,5,0,NULL,'Titus - Put things right!',45,NULL,'2013-04-10 16:30:07','2013-04-10 16:33:28'),(946,945,3,2,3,14,NULL,2,1,1,'First Segment',26,NULL,'2013-04-10 16:30:33','2013-04-11 18:14:34'),(947,945,3,2,3,14,NULL,2,7,2,'Does being a short title matter?',5,NULL,'2013-04-10 16:33:10','2013-05-09 12:32:52'),(948,960,2,2,3,14,6996,1,2,NULL,'1:1',3,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:26'),(949,960,2,2,3,14,6997,1,3,NULL,'1:4',1,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(950,960,2,2,3,14,6998,1,4,NULL,'1:5',5,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(951,960,2,2,3,14,6999,1,5,NULL,'1:10',7,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(952,960,2,2,3,14,7000,1,6,NULL,'2:1',10,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(953,961,2,2,3,14,7001,1,8,NULL,'2:11',4,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(954,961,2,2,3,14,7002,1,9,NULL,'2:15',1,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(955,961,2,2,3,14,7003,1,10,NULL,'3:1',11,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(956,961,2,2,3,14,7004,1,11,NULL,'3:12',2,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(957,961,2,2,3,14,7005,1,12,NULL,'3:15',1,NULL,'2013-04-14 21:39:26','2013-04-14 21:40:27'),(959,NULL,2,2,3,14,NULL,5,0,NULL,'Titus',45,NULL,'2013-04-14 21:39:37','2013-04-14 21:40:27'),(960,959,2,2,3,14,NULL,2,1,1,'First Segment',26,NULL,'2013-04-14 21:39:54','2013-04-14 21:40:27'),(961,959,2,2,3,14,NULL,2,7,2,'Second Segment',19,NULL,'2013-04-14 21:40:08','2013-04-14 21:40:27'),(962,1284,3,2,9,12,6042,1,3,NULL,'1:1',2,NULL,'2013-04-20 19:18:30','2013-04-20 19:22:47'),(963,1284,3,2,9,12,6043,1,4,NULL,'1:3',3,NULL,'2013-04-20 19:18:31','2013-04-20 19:22:47'),(964,1284,3,2,9,12,6044,1,5,NULL,'1:6',3,NULL,'2013-04-20 19:18:31','2013-04-20 19:22:47'),(965,1284,3,2,9,12,6045,1,6,NULL,'1:9',2,NULL,'2013-04-20 19:18:31','2013-04-20 19:22:47'),(966,1284,3,2,9,12,6046,1,7,NULL,'1:11',3,NULL,'2013-04-20 19:18:31','2013-04-20 19:22:47'),(967,1284,3,2,9,12,6047,1,8,NULL,'1:14',6,NULL,'2013-04-20 19:18:31','2013-04-20 19:22:47'),(968,1284,3,2,9,12,6048,1,9,NULL,'1:20',4,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(969,1284,3,2,9,12,6049,1,10,NULL,'1:24',2,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(970,1284,3,2,9,12,6050,1,11,NULL,'1:26',2,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(971,1284,3,2,9,12,6051,1,12,NULL,'1:28',4,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(972,1284,3,2,9,12,6052,1,13,NULL,'2:1',3,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(973,1284,3,2,9,12,6053,1,14,NULL,'2:4',1,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(974,1285,3,2,9,12,6054,1,16,NULL,'2:5',5,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(975,1285,3,2,9,12,6055,1,17,NULL,'2:10',5,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(976,1285,3,2,9,12,6056,1,18,NULL,'2:15',3,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(977,1285,3,2,9,12,6057,1,19,NULL,'2:18',6,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(978,1285,3,2,9,12,6058,1,20,NULL,'2:24',2,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(979,1285,3,2,9,12,6059,1,21,NULL,'3:1a',1,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(980,1285,3,2,9,12,6060,1,22,NULL,'3:1b',7,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(981,1285,3,2,9,12,6061,1,23,NULL,'3:8',6,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(982,1286,3,2,9,12,6062,1,25,NULL,'3:14',2,NULL,'2013-04-20 19:18:32','2013-04-20 19:22:47'),(983,1286,3,2,9,12,6063,1,26,NULL,'3:16',1,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:47'),(984,1286,3,2,9,12,6064,1,27,NULL,'3:17',3,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:47'),(985,1286,3,2,9,12,6065,1,28,NULL,'3:20',2,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:47'),(986,1286,3,2,9,12,6066,1,29,NULL,'3:22',3,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(987,1286,3,2,9,12,6067,1,30,NULL,'4:1',7,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(988,1286,3,2,9,12,6068,1,31,NULL,'4:8',9,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(989,1286,3,2,9,12,6069,1,32,NULL,'4:17',6,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(990,1286,3,2,9,12,6070,1,33,NULL,'4:23',2,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(991,1286,3,2,9,12,6071,1,34,NULL,'4:25',2,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(992,1287,3,2,9,12,6072,1,36,NULL,'5:1',5,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(993,1287,3,2,9,12,6073,1,37,NULL,'5:6',3,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(994,1287,3,2,9,12,6074,1,38,NULL,'5:9',3,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(995,1287,3,2,9,12,6075,1,39,NULL,'5:12',3,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(996,1287,3,2,9,12,6076,1,40,NULL,'5:15',3,NULL,'2013-04-20 19:18:33','2013-04-20 19:22:48'),(997,1287,3,2,9,12,6077,1,41,NULL,'5:18',3,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(998,1287,3,2,9,12,6078,1,42,NULL,'5:21',4,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(999,1287,3,2,9,12,6079,1,43,NULL,'5:25',3,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1000,1287,3,2,9,12,6080,1,44,NULL,'5:28',4,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1001,1288,3,2,9,12,6081,1,46,NULL,'6:1',4,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1002,1288,3,2,9,12,6082,1,47,NULL,'6:5',4,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1003,1288,3,2,9,12,6083,1,48,NULL,'6:9',2,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1004,1288,3,2,9,12,6084,1,49,NULL,'6:11',12,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1005,1288,3,2,9,12,6085,1,50,NULL,'7:1',5,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1006,1288,3,2,9,12,6086,1,51,NULL,'7:6',5,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1007,1288,3,2,9,12,6087,1,52,NULL,'7:11',7,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1008,1288,3,2,9,12,6088,1,53,NULL,'7:17',7,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1009,1288,3,2,9,12,6089,1,54,NULL,'8:1',5,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1010,1288,3,2,9,12,6090,1,55,NULL,'8:6',7,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:48'),(1011,1289,3,2,9,12,6091,1,57,NULL,'8:13',7,NULL,'2013-04-20 19:18:34','2013-04-20 19:22:49'),(1012,1289,3,2,9,12,6092,1,58,NULL,'8:20',3,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1013,1289,3,2,9,12,6093,1,59,NULL,'9:1',5,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1014,1289,3,2,9,12,6094,1,60,NULL,'9:6',1,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1015,1289,3,2,9,12,6095,1,61,NULL,'9:7',1,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1016,1289,3,2,9,12,6096,1,62,NULL,'9:8',10,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1017,1289,3,2,9,12,6097,1,63,NULL,'9:18',2,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1018,1289,3,2,9,12,6098,1,64,NULL,'9:20',6,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1019,1289,3,2,9,12,6099,1,65,NULL,'9:26',2,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1020,1289,3,2,9,12,6100,1,66,NULL,'9:28',2,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1021,1289,3,2,9,12,6101,1,67,NULL,'10:1',1,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1022,1289,3,2,9,12,6102,1,68,NULL,'10:2',4,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1023,1290,3,2,9,12,6103,1,70,NULL,'10:6',9,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1024,1290,3,2,9,12,6104,1,71,NULL,'10:15',6,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1025,1290,3,2,9,12,6105,1,72,NULL,'10:21',11,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1026,1290,3,2,9,12,6106,1,73,NULL,'10:32',1,NULL,'2013-04-20 19:18:35','2013-04-20 19:22:49'),(1027,1290,3,2,9,12,6107,1,74,NULL,'11:1',9,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1028,1290,3,2,9,12,6108,1,75,NULL,'11:10',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1029,1290,3,2,9,12,6109,1,76,NULL,'11:12',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1030,1290,3,2,9,12,6110,1,77,NULL,'11:14',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1031,1290,3,2,9,12,6111,1,78,NULL,'11:16',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1032,1290,3,2,9,12,6112,1,79,NULL,'11:18',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1033,1290,3,2,9,12,6113,1,80,NULL,'11:20',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1034,1290,3,2,9,12,6114,1,81,NULL,'11:22',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1035,1290,3,2,9,12,6115,1,82,NULL,'11:24',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1036,1290,3,2,9,12,6116,1,83,NULL,'11:26',1,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1037,1290,3,2,9,12,6117,1,84,NULL,'11:27',4,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1038,1290,3,2,9,12,6118,1,85,NULL,'11:31',2,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1039,1291,3,2,9,12,6119,1,88,NULL,'12:1',3,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1040,1291,3,2,9,12,6120,1,89,NULL,'12:4',6,NULL,'2013-04-20 19:18:36','2013-04-20 19:22:49'),(1041,1291,3,2,9,12,6121,1,90,NULL,'12:10',7,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1042,1291,3,2,9,12,6122,1,91,NULL,'12:17',4,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1043,1291,3,2,9,12,6123,1,92,NULL,'13:1',1,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1044,1291,3,2,9,12,6124,1,93,NULL,'13:2',6,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1045,1291,3,2,9,12,6125,1,94,NULL,'13/8',6,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1046,1291,3,2,9,12,6126,1,95,NULL,'13:14',5,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1047,1291,3,2,9,12,6127,1,96,NULL,'14:1',7,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1048,1291,3,2,9,12,6128,1,97,NULL,'14:8',5,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1049,1291,3,2,9,12,6129,1,98,NULL,'14:13',4,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1050,1291,3,2,9,12,6130,1,99,NULL,'14:17',3,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1051,1292,3,2,9,12,6131,1,101,NULL,'14:19b',2,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1052,1292,3,2,9,12,6132,1,102,NULL,'14:20b',5,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1053,1292,3,2,9,12,6133,1,103,NULL,'15:1',6,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1054,1292,3,2,9,12,6134,1,104,NULL,'15:7',5,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1055,1292,3,2,9,12,6135,1,105,NULL,'15:12',5,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1056,1292,3,2,9,12,6136,1,106,NULL,'15:17',5,NULL,'2013-04-20 19:18:37','2013-04-20 19:22:50'),(1057,1292,3,2,9,12,6137,1,107,NULL,'16:1',6,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1058,1292,3,2,9,12,6138,1,108,NULL,'16:7',8,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1059,1292,3,2,9,12,6139,1,109,NULL,'16:13',2,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1060,1292,3,2,9,12,6140,1,110,NULL,'16:15',2,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1061,1292,3,2,9,12,6141,1,111,NULL,'17:1',8,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1062,1292,3,2,9,12,6142,1,112,NULL,'17:9',6,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1063,1293,3,2,9,12,6143,1,114,NULL,'17:15',7,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1064,1293,3,2,9,12,6144,1,115,NULL,'17:22',6,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1065,1293,3,2,9,12,6145,1,116,NULL,'18:1',8,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1066,1293,3,2,9,12,6146,1,117,NULL,'18:9',8,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1067,1293,3,2,9,12,6147,1,118,NULL,'18:16',6,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1068,1293,3,2,9,12,6148,1,119,NULL,'18:22',5,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1069,1293,3,2,9,12,6149,1,120,NULL,'18:27',7,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1070,1293,3,2,9,12,6150,1,121,NULL,'19:1',3,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1071,1293,3,2,9,12,6151,1,122,NULL,'19:4',8,NULL,'2013-04-20 19:18:38','2013-04-20 19:22:50'),(1072,1293,3,2,9,12,6152,1,123,NULL,'19:12',3,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:50'),(1073,1293,3,2,9,12,6153,1,124,NULL,'19:15',7,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:50'),(1074,1293,3,2,9,12,6154,1,125,NULL,'19:23',4,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:50'),(1075,1293,3,2,9,12,6155,1,126,NULL,'19:27',2,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1076,1294,3,2,9,12,6156,1,128,NULL,'19:29',1,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1077,1294,3,2,9,12,6157,1,129,NULL,'19:20',4,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1078,1294,3,2,9,12,6158,1,130,NULL,'19:34',5,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1079,1294,3,2,9,12,6159,1,131,NULL,'20:1',7,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1080,1294,3,2,9,12,6160,1,132,NULL,'20:8',6,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1081,1294,3,2,9,12,6161,1,133,NULL,'20:14',5,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1082,1294,3,2,9,12,6162,1,134,NULL,'21:1',7,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1083,1294,3,2,9,12,6163,1,135,NULL,'21:8',7,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1084,1294,3,2,9,12,6164,1,136,NULL,'21:15',6,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1085,1294,3,2,9,12,6165,1,137,NULL,'21:22',3,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1086,1294,3,2,9,12,6166,1,138,NULL,'21:25',10,NULL,'2013-04-20 19:18:39','2013-04-20 19:22:51'),(1087,1294,3,2,9,12,6167,1,139,NULL,'22:1',8,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1088,1294,3,2,9,12,6168,1,140,NULL,'22:9',6,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1089,1295,3,2,9,12,6169,1,142,NULL,'22:15',5,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1090,1295,3,2,9,12,6170,1,143,NULL,'22:20',5,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1091,1295,3,2,9,12,6171,1,144,NULL,'23:1',9,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1092,1295,3,2,9,12,6172,1,145,NULL,'23:10',7,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1093,1295,3,2,9,12,6173,1,146,NULL,'23:17',4,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1094,1295,3,2,9,12,6174,1,147,NULL,'24:1',9,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1095,1295,3,2,9,12,6175,1,148,NULL,'24:10',5,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1096,1295,3,2,9,12,6176,1,149,NULL,'24:15',7,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1097,1295,3,2,9,12,6177,1,150,NULL,'24:22',7,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1098,1295,3,2,9,12,6178,1,151,NULL,'24:29',5,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1099,1295,3,2,9,12,6179,1,152,NULL,'24:34',8,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1100,1295,3,2,9,12,6180,1,153,NULL,'24:42',3,NULL,'2013-04-20 19:18:40','2013-04-20 19:22:51'),(1101,1295,3,2,9,12,6181,1,154,NULL,'24:45',5,NULL,'2013-04-20 19:18:41','2013-04-20 19:22:51'),(1102,1295,3,2,9,12,6182,1,155,NULL,'24:50',2,NULL,'2013-04-20 19:18:41','2013-04-20 19:22:51'),(1103,1295,3,2,9,12,6183,1,156,NULL,'24:52',9,NULL,'2013-04-20 19:18:41','2013-04-20 19:22:51'),(1104,1295,3,2,9,12,6184,1,157,NULL,'24:61',1,NULL,'2013-04-20 19:18:41','2013-04-20 19:22:51'),(1105,1295,3,2,9,12,6185,1,158,NULL,'24:62',6,NULL,'2013-04-20 19:18:41','2013-04-20 19:22:51'),(1106,1295,3,2,9,12,6480,1,159,NULL,'25:1',6,NULL,'2013-04-20 19:18:41','2013-04-20 19:22:51'),(1107,1295,3,2,9,12,6481,1,160,NULL,'25:7',4,NULL,'2013-04-20 19:18:41','2013-04-20 19:22:51'),(1108,1296,3,2,9,12,6482,1,162,NULL,'25:12',7,NULL,'2013-04-20 19:18:41','2013-04-20 19:22:51'),(1109,1296,3,2,9,12,6485,1,163,NULL,'25:19',8,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:51'),(1110,1296,3,2,9,12,6487,1,164,NULL,'25:24',3,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:51'),(1111,1296,3,2,9,12,6489,1,165,NULL,'25:27',2,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:51'),(1112,1296,3,2,9,12,6491,1,166,NULL,'25:29',6,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1113,1296,3,2,9,12,6494,1,167,NULL,'26:1',5,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1114,1296,3,2,9,12,6496,1,168,NULL,'26:6',6,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1115,1296,3,2,9,12,6498,1,169,NULL,'26:12',5,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1116,1296,3,2,9,12,6500,1,170,NULL,'26:17',6,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1117,1297,3,2,9,12,6502,1,172,NULL,'26:23',3,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1118,1297,3,2,9,12,6504,1,173,NULL,'26:26',8,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1119,1297,3,2,9,12,6507,1,174,NULL,'26:34',2,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1120,1297,3,2,9,12,6508,1,175,NULL,'27:1',4,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1121,1297,3,2,9,12,6511,1,176,NULL,'27:5',9,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1122,1297,3,2,9,12,6512,1,177,NULL,'27:14',4,NULL,'2013-04-20 19:18:42','2013-04-20 19:22:52'),(1123,1297,3,2,9,12,6515,1,178,NULL,'27:18',8,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1124,1297,3,2,9,12,6517,1,179,NULL,'27:26',2,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1125,1297,3,2,9,12,6520,1,180,NULL,'27:27b',3,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1126,1297,3,2,9,12,6522,1,181,NULL,'27:30',9,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1127,1297,3,2,9,12,6523,1,182,NULL,'27:39',2,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1128,1297,3,2,9,12,6525,1,183,NULL,'27:41',6,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1129,1297,3,2,9,12,6527,1,184,NULL,'27:46',1,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1130,1297,3,2,9,12,6529,1,185,NULL,'28:1',5,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1131,1297,3,2,9,12,6530,1,186,NULL,'28:6',4,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1132,1297,3,2,9,12,6532,1,187,NULL,'28:10',8,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1133,1297,3,2,9,12,6534,1,188,NULL,'28:18',5,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1134,1297,3,2,9,12,6536,1,189,NULL,'29:1',3,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1135,1297,3,2,9,12,6537,1,190,NULL,'29:4',5,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1136,1297,3,2,9,12,6539,1,191,NULL,'29:9',4,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1137,1297,3,2,9,12,6540,1,192,NULL,'29:13',2,NULL,'2013-04-20 19:18:43','2013-04-20 19:22:52'),(1138,1297,3,2,9,12,6542,1,193,NULL,'29:15',6,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1139,1297,3,2,9,12,6544,1,194,NULL,'29:21',10,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1140,1297,3,2,9,12,6546,1,195,NULL,'29:31',6,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1141,1298,3,2,9,12,6548,1,198,NULL,'30:1',8,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1142,1298,3,2,9,12,6551,1,199,NULL,'30:9',5,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1143,1298,3,2,9,12,6553,1,200,NULL,'30:14',5,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1144,1298,3,2,9,12,6554,1,201,NULL,'30:19',3,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1145,1298,3,2,9,12,6556,1,202,NULL,'30:22',3,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1146,1298,3,2,9,12,6558,1,203,NULL,'30:25',12,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1147,1298,3,2,9,12,6560,1,204,NULL,'30:37',7,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1148,1298,3,2,9,12,6562,1,205,NULL,'31:1',3,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1149,1298,3,2,9,12,6563,1,206,NULL,'31:4',13,NULL,'2013-04-20 19:18:44','2013-04-20 19:22:52'),(1150,1298,3,2,9,12,6565,1,207,NULL,'31:17',5,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1151,1298,3,2,9,12,6566,1,208,NULL,'31:22',3,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1152,1298,3,2,9,12,6567,1,209,NULL,'31:25',8,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1153,1298,3,2,9,12,6569,1,210,NULL,'31:33',3,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1154,1298,3,2,9,12,6570,1,211,NULL,'31:36',7,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1155,1298,3,2,9,12,6572,1,212,NULL,'31:43',8,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1156,1298,3,2,9,12,6573,1,213,NULL,'31:51',5,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1157,1298,3,2,9,12,6574,1,214,NULL,'31:55',1,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1158,1299,3,2,9,12,6598,1,216,NULL,'32:1',1,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1159,1299,3,2,9,12,6599,1,217,NULL,'32:3',3,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1160,1299,3,2,9,12,6600,1,218,NULL,'32:6',3,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1161,1299,3,2,9,12,6601,1,219,NULL,'32:9',4,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1162,1299,3,2,9,12,6602,1,220,NULL,'32:13',9,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1163,1299,3,2,9,12,6603,1,221,NULL,'32:22',10,NULL,'2013-04-20 19:18:45','2013-04-20 19:22:53'),(1164,1299,3,2,9,12,6604,1,222,NULL,'33:1',3,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1165,1299,3,2,9,12,6605,1,223,NULL,'33:4',8,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1166,1299,3,2,9,12,6606,1,224,NULL,'33:12',3,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1167,1299,3,2,9,12,6607,1,225,NULL,'33:15',3,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1168,1299,3,2,9,12,6608,1,226,NULL,'33:18',3,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1169,1299,3,2,9,12,6609,1,227,NULL,'34:1',4,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1170,1299,3,2,9,12,6610,1,228,NULL,'34:5',3,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1171,1300,3,2,9,12,6611,1,230,NULL,'34:8',5,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1172,1300,3,2,9,12,6612,1,231,NULL,'34:13',5,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1173,1300,3,2,9,12,6613,1,232,NULL,'34:18',7,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1174,1300,3,2,9,12,6614,1,233,NULL,'34:25',5,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1175,1300,3,2,9,12,6615,1,234,NULL,'34:30',2,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1176,1300,3,2,9,12,6616,1,235,NULL,'35:1',4,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1177,1300,3,2,9,12,6617,1,236,NULL,'35:5',4,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1178,1300,3,2,9,12,6618,1,237,NULL,'35:9',7,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1179,1300,3,2,9,12,6619,1,238,NULL,'35:16',6,NULL,'2013-04-20 19:18:46','2013-04-20 19:22:53'),(1180,1300,3,2,9,12,6620,1,239,NULL,'35:22',1,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:53'),(1181,1300,3,2,9,12,6621,1,240,NULL,'35:22b',5,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:53'),(1182,1300,3,2,9,12,6622,1,241,NULL,'35:27',3,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:53'),(1183,1300,3,2,9,12,6623,1,242,NULL,'36:1',5,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:53'),(1184,1301,3,2,9,12,6624,1,244,NULL,'36:6',3,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1185,1301,3,2,9,12,6625,1,245,NULL,'36:9',6,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1186,1301,3,2,9,12,6626,1,246,NULL,'36:15',5,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1187,1301,3,2,9,12,6627,1,247,NULL,'36:29',11,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1188,1301,3,2,9,12,6628,1,248,NULL,'36:31',9,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1189,1301,3,2,9,12,6629,1,249,NULL,'36:40',4,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1190,1301,3,2,9,12,6630,1,250,NULL,'37:1',1,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1191,1301,3,2,9,12,6631,1,251,NULL,'37:2',1,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1192,1301,3,2,9,12,6632,1,252,NULL,'37:2b',3,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1193,1301,3,2,9,12,6633,1,253,NULL,'37:5',4,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1194,1301,3,2,9,12,6634,1,254,NULL,'37:9',4,NULL,'2013-04-20 19:18:47','2013-04-20 19:22:54'),(1195,1301,3,2,9,12,6635,1,255,NULL,'37:12',6,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1196,1301,3,2,9,12,6636,1,256,NULL,'37:18',6,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1197,1301,3,2,9,12,6637,1,257,NULL,'37:25',4,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1198,1301,3,2,9,12,6638,1,258,NULL,'37:29',8,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1199,1302,3,2,9,12,6639,1,260,NULL,'38:1',5,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1200,1302,3,2,9,12,6732,1,261,NULL,'38:6',6,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1201,1302,3,2,9,12,6733,1,262,NULL,'38:12',8,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1202,1302,3,2,9,12,6734,1,263,NULL,'38:20',4,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1203,1302,3,2,9,12,6735,1,264,NULL,'38:24',3,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1204,1302,3,2,9,12,6736,1,265,NULL,'38:27',3,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1205,1302,3,2,9,12,6737,1,266,NULL,'39:1',6,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1206,1302,3,2,9,12,6738,1,267,NULL,'39:6b',5,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1207,1302,3,2,9,12,6739,1,268,NULL,'39:11',8,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1208,1302,3,2,9,12,6740,1,269,NULL,'39:19',5,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1209,1302,3,2,9,12,6741,1,270,NULL,'40:1',4,NULL,'2013-04-20 19:18:48','2013-04-20 19:22:54'),(1210,1302,3,2,9,12,6742,1,271,NULL,'40:5',4,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:54'),(1211,1303,3,2,9,12,6743,1,273,NULL,'40:9',7,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1212,1303,3,2,9,12,6744,1,274,NULL,'40:16',4,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1213,1303,3,2,9,12,6745,1,275,NULL,'40:20',4,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1214,1303,3,2,9,12,6746,1,276,NULL,'41:1',8,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1215,1303,3,2,9,12,6747,1,277,NULL,'41:9',5,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1216,1303,3,2,9,12,6748,1,278,NULL,'41:14',11,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1217,1303,3,2,9,12,6749,1,279,NULL,'41:25',12,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1218,1303,3,2,9,12,6750,1,280,NULL,'41:37',9,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1219,1303,3,2,9,12,6751,1,281,NULL,'41:46',4,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1220,1303,3,2,9,12,6752,1,282,NULL,'41:50',3,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1221,1303,3,2,9,12,6753,1,283,NULL,'41:53',3,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1222,1303,3,2,9,12,6754,1,284,NULL,'41:56',2,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1223,1304,3,2,9,12,6755,1,286,NULL,'42:1',5,NULL,'2013-04-20 19:18:49','2013-04-20 19:22:55'),(1224,1304,3,2,9,12,6756,1,287,NULL,'42:6',6,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1225,1304,3,2,9,12,6757,1,288,NULL,'42:12',6,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1226,1304,3,2,9,12,6758,1,289,NULL,'42:18',8,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1227,1304,3,2,9,12,6759,1,290,NULL,'42:26',3,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1228,1304,3,2,9,12,6760,1,291,NULL,'42:29',6,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1229,1304,3,2,9,12,6761,1,292,NULL,'42:35',4,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1230,1304,3,2,9,12,6762,1,293,NULL,'43:1',10,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1231,1304,3,2,9,12,6763,1,294,NULL,'43:11',4,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1232,1304,3,2,9,12,6764,1,295,NULL,'43:15',1,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1233,1304,3,2,9,12,6765,1,296,NULL,'43:16',10,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1234,1304,3,2,9,12,6766,1,297,NULL,'43:26',9,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1235,1304,3,2,9,12,6767,1,298,NULL,'44:1',2,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1236,1304,3,2,9,12,6768,1,299,NULL,'44:3',3,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1237,1304,3,2,9,12,6769,1,300,NULL,'44:6',8,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1238,1304,3,2,9,12,6770,1,301,NULL,'44:14',10,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1239,1305,3,2,9,12,6771,1,303,NULL,'44:24',6,NULL,'2013-04-20 19:18:50','2013-04-20 19:22:55'),(1240,1305,3,2,9,12,6772,1,304,NULL,'44:30',5,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:55'),(1241,1305,3,2,9,12,6773,1,305,NULL,'45:1',3,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:55'),(1242,1305,3,2,9,12,6774,1,306,NULL,'45:4',12,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:55'),(1243,1305,3,2,9,12,6775,1,307,NULL,'45:16',5,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:55'),(1244,1305,3,2,9,12,6776,1,308,NULL,'45:21',4,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:55'),(1245,1305,3,2,9,12,6777,1,309,NULL,'45:25',4,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:55'),(1246,1305,3,2,9,12,6778,1,310,NULL,'46:1',4,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:55'),(1247,1305,3,2,9,12,6779,1,311,NULL,'46:5',3,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:56'),(1248,1305,3,2,9,12,6780,1,312,NULL,'46:8',8,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:56'),(1249,1305,3,2,9,12,6781,1,313,NULL,'46:16',3,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:56'),(1250,1305,3,2,9,12,6782,1,314,NULL,'46:19',4,NULL,'2013-04-20 19:18:51','2013-04-20 19:22:56'),(1251,1305,3,2,9,12,6783,1,315,NULL,'46:23',3,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1252,1305,3,2,9,12,6784,1,316,NULL,'46:26',2,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1253,1305,3,2,9,12,6785,1,317,NULL,'46:28',7,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1254,1305,3,2,9,12,6786,1,318,NULL,'47:1',6,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1255,1305,3,2,9,12,6787,1,319,NULL,'47:7',6,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1256,1306,3,2,9,12,6788,1,321,NULL,'47:13',7,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1257,1306,3,2,9,12,6789,1,322,NULL,'47:20',3,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1258,1306,3,2,9,12,6790,1,323,NULL,'47:23',4,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1259,1306,3,2,9,12,6791,1,324,NULL,'47:27',2,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1260,1306,3,2,9,12,6792,1,325,NULL,'47:29',3,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1261,1306,3,2,9,12,6793,1,326,NULL,'48:1',7,NULL,'2013-04-20 19:18:52','2013-04-20 19:22:56'),(1262,1306,3,2,9,12,6794,1,327,NULL,'48:8',9,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1263,1306,3,2,9,12,6795,1,328,NULL,'48:17',6,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1264,1306,3,2,9,12,6796,1,329,NULL,'49:1',4,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1265,1306,3,2,9,12,6797,1,330,NULL,'49:5',3,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1266,1306,3,2,9,12,6798,1,331,NULL,'49:8',5,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1267,1306,3,2,9,12,6799,1,332,NULL,'49:13',1,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1268,1307,3,2,9,12,6800,1,334,NULL,'49:14',2,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1269,1307,3,2,9,12,6801,1,335,NULL,'49:16',3,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1270,1307,3,2,9,12,6802,1,336,NULL,'49:19',1,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1271,1307,3,2,9,12,6803,1,337,NULL,'49:20',1,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1272,1307,3,2,9,12,6804,1,338,NULL,'49:21',1,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1273,1307,3,2,9,12,6805,1,339,NULL,'49:22',5,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1274,1307,3,2,9,12,6806,1,340,NULL,'49:27',1,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1275,1307,3,2,9,12,6807,1,341,NULL,'49:28',6,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1276,1307,3,2,9,12,6808,1,342,NULL,'50:1',3,NULL,'2013-04-20 19:18:53','2013-04-20 19:22:56'),(1277,1307,3,2,9,12,6809,1,343,NULL,'50:4',11,NULL,'2013-04-20 19:18:54','2013-04-20 19:22:56'),(1278,1307,3,2,9,12,6810,1,344,NULL,'50:15',7,NULL,'2013-04-20 19:18:54','2013-04-20 19:22:56'),(1279,1307,3,2,9,12,6811,1,345,NULL,'50:22',5,NULL,'2013-04-20 19:18:54','2013-04-20 19:22:56'),(1280,NULL,3,2,9,12,NULL,5,0,NULL,'Genesis - The Beginning',1542,NULL,'2013-04-20 19:19:21','2013-04-20 19:23:06'),(1281,1280,3,2,9,12,NULL,4,1,NULL,'Add Title Here',299,NULL,'2013-04-20 19:19:41','2013-04-20 19:23:02'),(1282,1280,3,2,9,12,NULL,4,86,NULL,'Add Title Here',540,NULL,'2013-04-20 19:19:55','2013-04-20 19:23:03'),(1283,1280,3,2,9,12,NULL,4,196,NULL,'Add Title Here',703,NULL,'2013-04-20 19:20:16','2013-04-20 19:23:04'),(1284,1281,3,2,9,12,NULL,2,2,1,'Add Title Here',35,NULL,'2013-04-20 19:20:35','2013-04-20 19:22:57'),(1285,1281,3,2,9,12,NULL,2,15,2,'Add Title Here',35,NULL,'2013-04-20 19:20:41','2013-04-20 19:22:57'),(1286,1281,3,2,9,12,NULL,2,24,3,'Add Title Here',37,NULL,'2013-04-20 19:20:45','2013-04-20 19:22:57'),(1287,1281,3,2,9,12,NULL,2,35,4,'Add Title Here',31,NULL,'2013-04-20 19:20:51','2013-04-20 19:22:57'),(1288,1281,3,2,9,12,NULL,2,45,5,'Add Title Here',58,NULL,'2013-04-20 19:20:55','2013-04-20 19:22:57'),(1289,1281,3,2,9,12,NULL,2,56,6,'Add Title Here',44,NULL,'2013-04-20 19:21:00','2013-04-20 19:22:57'),(1290,1281,3,2,9,12,NULL,2,69,7,'Add Title Here',59,NULL,'2013-04-20 19:21:04','2013-04-20 19:22:57'),(1291,1282,3,2,9,12,NULL,2,87,8,'Add Title Here',57,NULL,'2013-04-20 19:21:12','2013-04-20 19:22:58'),(1292,1282,3,2,9,12,NULL,2,100,9,'Add Title Here',60,NULL,'2013-04-20 19:21:19','2013-04-20 19:22:58'),(1293,1282,3,2,9,12,NULL,2,113,10,'Add Title Here',74,NULL,'2013-04-20 19:21:33','2013-04-20 19:22:58'),(1294,1282,3,2,9,12,NULL,2,127,11,'Add Title Here',75,NULL,'2013-04-20 19:21:39','2013-04-20 19:22:58'),(1295,1282,3,2,9,12,NULL,2,141,12,'Add Title Here',107,NULL,'2013-04-20 19:21:43','2013-04-20 19:22:59'),(1296,1282,3,2,9,12,NULL,2,161,13,'Add Title Here',48,NULL,'2013-04-20 19:21:47','2013-04-20 19:22:59'),(1297,1282,3,2,9,12,NULL,2,171,14,'Add Title Here',119,NULL,'2013-04-20 19:21:51','2013-04-20 19:22:59'),(1298,1283,3,2,9,12,NULL,2,197,15,'Add Title Here',99,NULL,'2013-04-20 19:22:00','2013-04-20 19:23:00'),(1299,1283,3,2,9,12,NULL,2,215,16,'Add Title Here',57,NULL,'2013-04-20 19:22:03','2013-04-20 19:23:00'),(1300,1283,3,2,9,12,NULL,2,229,17,'Add Title Here',59,NULL,'2013-04-20 19:22:08','2013-04-20 19:23:00'),(1301,1283,3,2,9,12,NULL,2,243,18,'Add Title Here',75,NULL,'2013-04-20 19:22:11','2013-04-20 19:23:00'),(1302,1283,3,2,9,12,NULL,2,259,19,'Add Title Here',61,NULL,'2013-04-20 19:22:15','2013-04-20 19:23:01'),(1303,1283,3,2,9,12,NULL,2,272,20,'Add Title Here',72,NULL,'2013-04-20 19:22:18','2013-04-20 19:23:01'),(1304,1283,3,2,9,12,NULL,2,285,21,'Add Title Here',95,NULL,'2013-04-20 19:22:24','2013-04-20 19:23:01'),(1305,1283,3,2,9,12,NULL,2,302,22,'Add Title Here',85,NULL,'2013-04-20 19:22:27','2013-04-20 19:23:01'),(1306,1283,3,2,9,12,NULL,2,320,23,'Add Title Here',54,NULL,'2013-04-20 19:22:32','2013-04-20 19:23:01'),(1307,1283,3,2,9,12,NULL,2,333,24,'Add Title Here',46,NULL,'2013-04-20 19:22:39','2013-04-20 19:23:02'),(1308,1319,4,2,3,14,6996,1,2,NULL,'1:1',3,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:45'),(1309,1319,4,2,3,14,6997,1,3,NULL,'1:4',1,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:45'),(1310,1319,4,2,3,14,6998,1,4,NULL,'1:5',5,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:45'),(1311,1319,4,2,3,14,6999,1,5,NULL,'1:10',7,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:45'),(1312,1320,4,2,3,14,7000,1,7,NULL,'2:1',10,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:45'),(1313,1320,4,2,3,14,7001,1,8,NULL,'2:11',4,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:45'),(1314,1320,4,2,3,14,7002,1,9,NULL,'2:15',1,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:45'),(1315,1321,4,2,3,14,7003,1,11,NULL,'3:1',11,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:46'),(1316,1321,4,2,3,14,7004,1,12,NULL,'3:12',2,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:46'),(1317,1321,4,2,3,14,7005,1,13,NULL,'3:15',1,NULL,'2013-05-06 18:42:13','2013-05-06 18:43:46'),(1318,NULL,4,2,3,14,NULL,5,0,NULL,'Titus - Set things in order',45,NULL,'2013-05-06 18:42:25','2013-05-06 18:43:46'),(1319,1318,4,2,3,14,NULL,2,1,1,'First Sweet segment',16,NULL,'2013-05-06 18:42:46','2013-05-06 18:43:46'),(1320,1318,4,2,3,14,NULL,2,6,2,'Second Segment',15,NULL,'2013-05-06 18:43:11','2013-05-06 18:43:46'),(1321,1318,4,2,3,14,NULL,2,10,3,'Third and final Segment',14,NULL,'2013-05-06 18:43:26','2013-05-06 18:43:46'),(1322,945,3,2,3,14,NULL,2,10,3,'This is the third one',14,NULL,'2013-05-08 16:29:09','2013-05-08 16:29:48');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_topics_on_assignment_id` (`assignment_id`),
  KEY `index_topics_on_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnins`
--

DROP TABLE IF EXISTS `turnins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `comment` text,
  `viewable` tinyint(1) DEFAULT '0',
  `done` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_turnins_on_user_id_and_assignment_id` (`user_id`,`assignment_id`),
  KEY `index_turnins_on_staff_id` (`staff_id`),
  KEY `index_turnins_on_done` (`done`),
  KEY `index_turnins_on_viewable` (`viewable`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnins`
--

LOCK TABLES `turnins` WRITE;
/*!40000 ALTER TABLE `turnins` DISABLE KEYS */;
INSERT INTO `turnins` VALUES (7,1,6,2,'Hey Ho',0,0,'2013-03-19 01:15:49','2013-03-21 01:54:57');
/*!40000 ALTER TABLE `turnins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_admins`
--

DROP TABLE IF EXISTS `user_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_admins`
--

LOCK TABLES `user_admins` WRITE;
/*!40000 ALTER TABLE `user_admins` DISABLE KEYS */;
INSERT INTO `user_admins` VALUES (1,1,3,'2012-10-25 19:23:02','2012-10-25 19:23:02'),(2,NULL,NULL,'2012-10-25 23:07:56','2012-10-25 23:07:56'),(3,2,2,'2013-04-27 18:01:52','2013-05-11 20:34:41');
/*!40000 ALTER TABLE `user_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  `unlock_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `authentication_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `reviewboard` tinyint(1) DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `wallpaper_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wallpaper_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wallpaper_file_size` int(11) DEFAULT NULL,
  `wallpaper_updated_at` datetime DEFAULT NULL,
  `iotd_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iotd_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iotd_file_size` int(11) DEFAULT NULL,
  `iotd_updated_at` datetime DEFAULT NULL,
  `school` int(11) DEFAULT '0',
  `role` int(11) DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`),
  KEY `index_users_on_lastname` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='utf8_unicode_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tompossin@gmail.com','$2a$10$Zh9E.yrLh0HseaCRXCIqTOINjV2n8T9XESTCBFzR4bQdWsqCV9dpO',NULL,NULL,NULL,232,'2013-05-12 14:12:34','2013-05-11 20:33:56','127.0.0.1','127.0.0.1','hUXFvjZ5w1eKsRvqcEkz','2013-01-30 18:06:45','2013-01-30 18:06:34',NULL,0,NULL,NULL,NULL,'2013-01-30 18:06:34','2013-05-12 20:21:16','Tom','Possin','','3 Mission Lane\r\nLakeside, MT 59922',1,'me.jpg','image/jpeg',40021,'2013-02-07 17:19:52','desktop-wallpaper-cool2.jpg','image/jpeg',684293,'2013-03-13 02:33:54','dark_ubuntu_2.jpg','image/jpeg',41724,'2013-05-12 20:21:16',2,1,'Mountain Time (US & Canada)'),(2,'tompossin@quickworx.info','$2a$10$uNT5C1NaHn75txCNnvz6UuGlKl1rObq8tSagn1bDCQM.LAVmv6DXi',NULL,NULL,NULL,54,'2013-05-11 20:34:57','2013-05-11 20:33:43','127.0.0.1','127.0.0.1','2xq5j4Ds9qVmZu3pbpkD','2013-01-31 16:09:45','2013-01-31 16:09:34',NULL,0,NULL,NULL,NULL,'2013-01-31 16:09:34','2013-05-12 02:33:30','Buster','Bigtime','','Here',NULL,'2013-03-29-160156.jpg','image/jpeg',151772,'2013-03-29 22:03:15','Free-Wallpaper-Downloads-for-Computer-3D-Island.jpg','image/jpeg',123077,'2013-03-29 22:03:43',NULL,NULL,NULL,NULL,6,1,'Mountain Time (US & Canada)'),(3,'student1@localhost.com','$2a$10$.8mqgMyn4uf.P1HG4gPcJuygWR.2./K4LjFhwRzRcsucZsEWZxp5K',NULL,NULL,NULL,57,'2013-05-11 20:21:49','2013-05-10 21:44:10','127.0.0.1','127.0.0.1','BoXMYessKTd5WbjmPhnz','2013-01-31 16:16:16','2013-01-31 16:16:16',NULL,0,NULL,NULL,NULL,'2013-01-31 16:16:16','2013-05-11 20:21:49','One','Student','','',NULL,'2013-02-07-200005.jpg','image/jpeg',39195,'2013-02-08 03:01:47','Flocking_by_noombox.jpg','image/jpeg',190510,'2013-02-08 03:01:49',NULL,NULL,NULL,NULL,2,4,'Mountain Time (US & Canada)'),(4,'2student@localhost.com','$2a$10$.Haxr9wQPzyQyB6eyBk/Y.XFdfwqYtK58lKDJCgQ5wtqFP9OOyCtm',NULL,NULL,NULL,8,'2013-05-11 20:22:43','2013-05-06 18:11:23','127.0.0.1','127.0.0.1','mmb7f9HTLsFxqjnbpuUs','2013-01-31 16:16:16','2013-03-21 22:26:31',NULL,0,NULL,NULL,NULL,'2013-03-21 22:26:31','2013-05-11 20:22:43','Two','Student','','',NULL,'2013-03-29-160033.jpg','image/jpeg',155091,'2013-03-29 22:28:48','japan-japan-29836626-1920-1200.jpg','image/jpeg',958755,'2013-03-29 22:28:49',NULL,NULL,NULL,NULL,2,4,'Mountain Time (US & Canada)'),(5,'3student@localhost.com','$2a$10$g/IM3K4AtMk2Ce4E62jqu.vmla02gULzHQDE.ag5.Lq1EHa0F2meK',NULL,NULL,NULL,2,'2013-05-06 19:10:22','2013-03-22 03:20:28','127.0.0.1','127.0.0.1','5bpxqtpHPgG13Dfz7Cyx','2013-01-31 16:16:16','2013-03-21 22:28:52',NULL,0,NULL,NULL,NULL,'2013-03-21 22:28:52','2013-05-06 19:10:22','Three','Student','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(6,'4student@localhost.com','$2a$10$SCIhsa7NZHmgvgtx.bnkU.o3Tn.3SHypHeBCzk31M6b2iQblRjzUC',NULL,NULL,NULL,2,'2013-05-06 19:11:34','2013-05-06 16:45:31','127.0.0.1','127.0.0.1','p1sfzK3Wwc73VB4yRPCb','2013-01-31 16:16:16','2013-03-21 22:29:42',NULL,0,NULL,NULL,NULL,'2013-03-21 22:29:42','2013-05-06 19:11:34','Four','Student','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),(7,'5student@localhost.com','$2a$10$3DzuV8t4egdRLDAxIL4fD.wCXyxEV/zcUlBSWV/EnSeHFhfywaxuu',NULL,NULL,NULL,1,'2013-05-06 19:12:01','2013-05-06 19:12:01','127.0.0.1','127.0.0.1','GtBzCDcZVsx7y9D3po5n','2013-01-31 16:16:16','2013-03-21 22:30:08',NULL,0,NULL,NULL,NULL,'2013-03-21 22:30:08','2013-05-06 19:12:01','Five','Student','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,'NRSV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'ESV','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-12 14:39:13