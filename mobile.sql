-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mobile
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('н','о') NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,1,1,'2024-01-15','о',NULL),(2,2,1,1,'2024-01-15','н','По болезни'),(3,3,1,1,'2024-01-15','о',NULL),(4,1,2,2,'2024-01-16','о',NULL),(5,2,2,2,'2024-01-16','о',NULL),(6,3,2,2,'2024-01-16','н','Семейные обстоятельства');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `class_teacher_id` int DEFAULT NULL,
  `academic_year` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_teacher_id` (`class_teacher_id`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`class_teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'10А',1,'2024-2025'),(2,'10Б',2,'2024-2025'),(3,'9А',3,'2024-2025');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `grade` int NOT NULL,
  `grade_type` enum('ответ','дз','тест','независимый','контрольная') NOT NULL,
  `lesson_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,1,1,1,5,'ответ','2024-01-15','2025-10-13 07:43:01','Отличный ответ у доски'),(2,1,1,1,4,'тест','2024-01-16','2025-10-13 07:43:01','Хорошо, но есть ошибки в расчетах'),(3,2,1,1,5,'дз','2024-01-15','2025-10-13 07:43:01','Все задания выполнены верно'),(4,3,1,1,3,'независимый','2024-01-16','2025-10-13 07:43:01','Нужно повторить тему'),(5,1,2,2,4,'ответ','2024-01-16','2025-10-13 07:43:01','Небольшие недочеты в сочинении'),(6,2,2,2,5,'независимый','2024-01-16','2025-10-13 07:43:01','Отлично выполнено задание');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homework` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `assignment_date` date NOT NULL,
  `due_date` date NOT NULL,
  `description` text NOT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `homework_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `homework_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,1,1,1,'2024-01-15','2024-01-17','Решить задачи № 125-130 из учебника. Тема: \"Производные\"',NULL,'2025-10-13 07:43:01'),(2,1,2,2,'2024-01-16','2024-01-19','Написать сочинение на тему \"Мое хобби\". Объем: 2 страницы','/attachments/essay_task.pdf','2025-10-13 07:43:01'),(3,1,3,3,'2024-01-17','2024-01-20','Подготовить доклад о законах Ньютона',NULL,'2025-10-13 07:43:01'),(4,2,1,1,'2024-01-15','2024-01-18','Подготовиться к контрольной работе по теме \"Интегралы\"','/attachments/test_prep.pdf','2025-10-13 07:43:01');
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `notification_type` enum('класс','дз','посещаемость','общий') NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,'Новая оценка','По математике получена оценка: 5','класс',0,'2025-10-13 07:43:01'),(2,2,'Отсутствие на уроке','Отмечено отсутствие на уроке математики 15.01.2024','посещаемость',0,'2025-10-13 07:43:01'),(3,5,'Успеваемость ребенка','Александр получил новую оценку по математике: 5','класс',0,'2025-10-13 07:43:01'),(4,6,'Пропуск урока','Екатерина отсутствовала на уроке математики 15.01.2024','посещаемость',0,'2025-10-13 07:43:01'),(5,3,'Домашнее задание','Задано новое домашнее задание по русскому языку','дз',0,'2025-10-13 07:43:01'),(6,7,'Объявление','Родительское собрание состоится 25.01.2024 в 18:00','общий',0,'2025-10-13 07:43:01');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_student_relations`
--

DROP TABLE IF EXISTS `parent_student_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_student_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `student_id` int NOT NULL,
  `relationship` enum('мама','папа') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `parent_student_relations_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`),
  CONSTRAINT `parent_student_relations_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_student_relations`
--

LOCK TABLES `parent_student_relations` WRITE;
/*!40000 ALTER TABLE `parent_student_relations` DISABLE KEYS */;
INSERT INTO `parent_student_relations` VALUES (1,5,1,'мама'),(2,6,2,'папа'),(3,7,3,'мама'),(4,8,4,'папа');
/*!40000 ALTER TABLE `parent_student_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `day_of_week` enum('1','2','3','4','5','6') NOT NULL,
  `lesson_number` int NOT NULL,
  `room` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,1,1,'1',1,'201'),(2,1,2,2,'1',2,'305'),(3,1,3,3,'1',3,'101'),(4,1,6,4,'2',1,'204'),(5,1,1,1,'2',2,'201'),(6,1,4,1,'3',1,'201'),(7,1,5,2,'3',2,'305'),(8,1,7,1,'4',1,'201');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Математика','мат'),(2,'Русский язык','рус'),(3,'Физика','физ'),(4,'Химия','хим'),(5,'История','ист'),(6,'Английский язык','англ'),(7,'Информатика','инф');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `user_type` enum('студент','родитель','учитель') NOT NULL,
  `class_id` int DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ivanov_math','$2y$10$abc123','ivanov@school.ru','Иван','Иванов','Петрович','учитель',NULL,NULL,'2025-10-13 07:43:01'),(2,'petrova_russian','$2y$10$def456','petrova@school.ru','Мария','Петрова','Сергеевна','учитель',NULL,NULL,'2025-10-13 07:43:01'),(3,'sidorov_physics','$2y$10$ghi789','sidorov@school.ru','Алексей','Сидоров','Владимирович','учитель',NULL,NULL,'2025-10-13 07:43:01'),(4,'kozlov_english','$2y$10$jkl012','kozlov@school.ru','Дмитрий','Козлов','Анатольевич','учитель',NULL,NULL,'2025-10-13 07:43:01'),(5,'student1','$2y$10$mno345',NULL,'Александр','Смирнов','Олегович','студент',1,NULL,'2025-10-13 07:43:01'),(6,'student2','$2y$10$pqr678',NULL,'Екатерина','Волкова','Дмитриевна','студент',1,NULL,'2025-10-13 07:43:01'),(7,'student3','$2y$10$stu901',NULL,'Михаил','Попов','Сергеевич','студент',1,NULL,'2025-10-13 07:43:01'),(8,'student4','$2y$10$vwx234',NULL,'Анна','Васильева','Андреевна','студент',2,NULL,'2025-10-13 07:43:01'),(9,'student5','$2y$10$yza567',NULL,'Артем','Федоров','Иванович','студент',2,NULL,'2025-10-13 07:43:01'),(10,'student6','$2y$10$bcd890',NULL,'София','Николаева','Петровна','студент',3,NULL,'2025-10-13 07:43:01'),(11,'parent1','$2y$10$efg123',NULL,'Ольга','Смирнова','Ивановна','родитель',NULL,NULL,'2025-10-13 07:43:01'),(12,'parent2','$2y$10$hij456',NULL,'Сергей','Волков','Петрович','родитель',NULL,NULL,'2025-10-13 07:43:01'),(13,'parent3','$2y$10$klm789',NULL,'Ирина','Попова','Викторовна','родитель',NULL,NULL,'2025-10-13 07:43:01'),(14,'parent4','$2y$10$nop012',NULL,'Андрей','Васильев','Сергеевич','родитель',NULL,NULL,'2025-10-13 07:43:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-13 10:50:10
