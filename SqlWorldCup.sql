-- You are given two tables, teams and matches, with the following structures:

--   create table teams (
--       team_id integer not null,
--       team_name varchar(30) not null,
--       unique(team_id)
--   );

--   create table matches (
--       match_id integer not null,
--       host_team integer not null,
--       guest_team integer not null,
--       host_goals integer not null,
--       guest_goals integer not null,
--       unique(match_id)
--   );
-- Each record in the table teams represents a single soccer team. Each record in the table matches represents a finished match between two teams. Teams (host_team, guest_team) are represented by their IDs in the teams table (team_id). No team plays a match against itself. You know the result of each match (that is, the number of goals scored by each team).

-- You would like to compute the total number of points each team has scored after all the matches described in the table. The scoring rules are as follows:

-- If a team wins a match (scores strictly more goals than the other team), it receives three points.
-- If a team draws a match (scores exactly the same number of goals as the opponent), it receives one point.
-- If a team loses a match (scores fewer goals than the opponent), it receives no points.
-- Write an SQL query that returns a ranking of all teams (team_id) described in the table teams. For each team you should provide its name and the number of points it received after all described matches (num_points). The table should be ordered by num_points (in decreasing order). In case of a tie, order the rows by team_id (in increasing order).

-- For example, for:

--   teams:

--    team_id | team_name
--   ---------+---------------
--    10      | Give
--    20      | Never
--    30      | You
--    40      | Up
--    50      | Gonna


--   matches:

--    match_id | host_team | guest_team | host_goals | guest_goals
--   ----------+-----------+------------+------------+-------------
--    1        | 30        | 20         | 1          | 0
--    2        | 10        | 20         | 1          | 2
--    3        | 20        | 50         | 2          | 2
--    4        | 10        | 30         | 1          | 0
--    5        | 30        | 50         | 0          | 1
-- your query should return:

--    team_id | team_name | num_points
--   ---------+-----------+------------
--    20      | Never     | 4
--    50      | Gonna     | 4
--    10      | Give      | 3
--    30      | You       | 3
--    40      | Up        | 0

----------------------------------------------------------------------------------------------------------------------------

-- MariaDB dump 10.19  Distrib 10.6.9-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: codility
-- ------------------------------------------------------
-- Server version	10.6.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `event_type` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `events_un` (`event_type`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (2,5,'2015-05-09 18:42:00'),(2,7,'2015-05-09 18:54:39'),(2,2,'2015-05-09 20:48:30'),(3,16,'2015-05-09 19:19:57'),(3,20,'2015-05-09 21:01:09'),(4,-42,'2015-05-09 19:19:57');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `match_id` int(10) unsigned NOT NULL,
  `host_team` int(10) unsigned NOT NULL,
  `guest_team` int(10) unsigned DEFAULT NULL,
  `host_goals` int(10) unsigned NOT NULL,
  `guest_goals` int(10) unsigned NOT NULL,
  UNIQUE KEY `NewTable_un` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,30,20,1,0),(2,10,20,1,2),(3,20,50,2,2),(4,10,30,1,0),(5,30,50,0,1);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `team_id` int(10) unsigned NOT NULL,
  `team_name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `teams_un` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (10,'Give'),(20,'Never'),(30,'You'),(40,'Up'),(50,'Gonna');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'codility'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 11:17:44

-------------------------------------------------------------------------------------
-- SOLUTION
-------------------------------------------------------------------------------------

-- SELECT t.team_id, t.team_name, COALESCE(SUM(num_points), 0) AS num_points
--     FROM(
--          SELECT t.team_id, t.team_name,
--           (CASE WHEN m.host_goals > m.guest_goals THEN 3
--                 WHEN m.host_goals = m.guest_goals THEN 1
--                 WHEN m.host_goals < m.guest_goals THEN 0
--                 END) AS num_points
--          FROM teams t
--          JOIN matches m
--          ON t.team_id = m.host_team
--          UNION ALL
--          SELECT t.team_id, t.team_name,
--           (CASE WHEN m.guest_goals > m.host_goals THEN 3
--                 WHEN m.guest_goals = m.host_goals THEN 1
--                 WHEN m.guest_goals < m.host_goals THEN 0
--                 END) AS num_points
--          FROM teams t
--          JOIN matches m
--          ON t.team_id = m.guest_team
--     ) AS c
--     RIGHT JOIN teams t
--     ON t.team_id = c.team_id
--     GROUP BY t.team_id, t.team_name
--     ORDER BY COALESCE(SUM(num_points), 0) DESC;