-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 8.0.31 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk laravel_ecnryption
CREATE DATABASE IF NOT EXISTS `laravel_ecnryption` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laravel_ecnryption`;

-- membuang struktur untuk table laravel_ecnryption.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel_ecnryption.migrations: 1 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(13, '2024_07_29_035742_add_status_user_to_users_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- membuang struktur untuk table laravel_ecnryption.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel laravel_ecnryption.users: 3 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`, `status_user`) VALUES
	(3, 'eyJpdiI6ImRERFZXcFZaSlVIam44ZWVGdWQ3RFE9PSIsInZhbHVlIjoiTTB6QjVnU0t2RkN4Q3ZjdERkRlVxUT09IiwibWFjIjoiZGU0ZDZjYWFjZGJhZGU5OGFjMDU4OGEyOGFlNjI1OWUzYWY2OTQyMzY2NGEzZTdiM2IwZjJmYWRhMzc5YjUyZCIsInRhZyI6IiJ9', 'eyJpdiI6InFpZUhVZ1BKOWFLbXNlNHJKVmlRUUE9PSIsInZhbHVlIjoiQUFnbTA4RGRJc0hOZGR1WE9vUE1oSGQ3U3Y2TnNsekIvU25TekdXbSt4QT0iLCJtYWMiOiIzYmQwMzg4YWY3M2Q3YzYwYTcwODZmNDM3NmNlNmIxNGY5NzY4ZGM5ZDc4OWVhMWIxNmI4YzQ5YWMzYmIzNGUxIiwidGFnIjoiIn0=', 'eyJpdiI6InI4SmFhdFJDOExMeTBRc3p4V2tSSWc9PSIsInZhbHVlIjoiNElVS290T213bEEvUzhmWC9iTkd2dz09IiwibWFjIjoiMjI0MTE3YjEwMDc3Y2I1ZTA2MTI2YzFlMGJiMzNkZTA1YzY2NDA2YWYyMDQyZTc4ZTU5ODg2MjhmNjdkYWY4ZSIsInRhZyI6IiJ9', '2024-07-25 00:27:59', '2024-07-25 00:27:59', '0'),
	(4, 'eyJpdiI6ImI0TkpVS0h3MGM1c2RQVExmWjlJOUE9PSIsInZhbHVlIjoiaEtrK1BBYjJMZnIwOTJ2bjRaMzNPQT09IiwibWFjIjoiODZjYTkzY2Y0ZWJhNzU3ZmFmNWU5NThjYWZkYWQxNjE5ZGUzNWVkMTY4YjVlMTBmNDFiNmIxZDg2OWYyNWU1YSIsInRhZyI6IiJ9', 'eyJpdiI6ImpWdkk5a2NIcllkRjVCbGFQRzVNbUE9PSIsInZhbHVlIjoiY0FQVjJtTmtJUGRSV1ozVSt6Y25KaHh0VUpuMWptQUtoS2NOSFFMQmJQbz0iLCJtYWMiOiIxYWUxNDU2MzU0ZWI2NDhjNWZlZTNjMzkzZTU2NTg2OGNmYzU1OWM1YjEzMTkyYTIwN2VlNDlhNGZjNmFlOWJhIiwidGFnIjoiIn0=', 'eyJpdiI6IlFEVndSNldGcHpXbzN1cDlPUUZKVEE9PSIsInZhbHVlIjoidDB5dURnb2RTbkV2bVl5WVduQnpsdz09IiwibWFjIjoiZDQzOTk5ZTk4YWI1YTMxYzUyOTJiYWExNWQ5YTU4OWE2YzhmZmU5ZDY2ZTQ3NmI0ZGQ0ZjY5NDNiNTI1ZTc2NSIsInRhZyI6IiJ9', '2024-07-25 00:29:47', '2024-07-25 00:29:47', '1'),
	(5, 'eyJpdiI6Ik43Q3NRZ2ZPUkk5enF6L1lLa0J5bFE9PSIsInZhbHVlIjoiWDlycnBhU0RvaFh1TUFhMjBlRG54Zz09IiwibWFjIjoiZTdjNmYwYzY0M2ZjYjZlZDRkZWFkMWJiOWUwZTA2YTcyYWFlODEyYmUxYjNmOWU2ZTM2ZTQwY2FjOWQ4YmRjMCIsInRhZyI6IiJ9', 'eyJpdiI6ImxOa08ybnJsQ3kyQWljWW10b3duOGc9PSIsInZhbHVlIjoiYmpROVFnaXJRZ0dVTHZZRlo2TUk3UkE1UCtlaHpPYS9YNnNJaU5pRTVKRT0iLCJtYWMiOiJkYmU4MjRlNTY4ZDI0MDljNzk1NWUyY2VlMTBlN2FjNmI5ZTk0MTI5YWQ0MGRlNjkxYzgyODg4YmI0OWIzMmJkIiwidGFnIjoiIn0=', 'eyJpdiI6IisvTnRFZk8vdG5hZlZxVlVsTlN0OXc9PSIsInZhbHVlIjoiT2VGRi9UcGRmbDdsaFZwaEp6WWF0Zz09IiwibWFjIjoiZTYyYTUzOGMxYjA3MmJlZDQxODUyOTMzMzU3Mzk4YmJkODU0M2E2ZDRmNGEzMDIxZDI0NmIxMjcyZGZiODc2ZCIsInRhZyI6IiJ9', '2024-07-28 22:46:54', '2024-07-28 22:46:54', '0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
