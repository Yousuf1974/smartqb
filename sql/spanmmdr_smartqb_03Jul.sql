-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 03, 2023 at 01:00 PM
-- Server version: 10.5.20-MariaDB-cll-lve
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spanmmdr_smartqb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(120) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `raw_psw` varchar(120) DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=true,0=false',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `raw_psw`, `active_status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'I\'m Super Admin', 'admin@gmail.com', '01718075903', NULL, '$2y$10$nH30Uu2Sl5UL6jZFIb9GWOMYP3TY7bkZZWwBRF.Aa.sdXgA26rHJO', 'sujanaruhee', 1, NULL, '2022-12-16 14:59:14', '2023-05-11 22:28:38');

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_name` varchar(255) NOT NULL,
  `batch_type` tinyint(4) NOT NULL COMMENT '1=monthly,2=contract',
  `batch_year` year(4) NOT NULL,
  `batch_class` varchar(255) DEFAULT NULL,
  `batch_start` varchar(20) DEFAULT NULL,
  `batch_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `batch_note` tinytext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `batch_name`, `batch_type`, `batch_year`, `batch_class`, `batch_start`, `batch_fee`, `batch_note`, `is_active`, `institution_id`, `created_at`, `updated_at`) VALUES
(1, 'Padma Batch', 1, '2022', 'Six', '2022-09', 500.00, NULL, 1, 1, '2022-09-21 07:21:43', '2022-09-21 07:21:43'),
(2, 'Meghna Batch', 2, '2022', 'Eight', '2022-09', 2000.00, NULL, 1, 1, '2022-09-21 07:23:50', '2022-09-21 07:25:54'),
(3, 'সকালের ব্যাচ', 1, '2022', 'অষ্টম শ্রেণী', '2022-08', 800.00, NULL, 1, 2, '2022-09-21 07:47:25', '2022-09-21 07:47:25'),
(4, 'বিকালের ব্যাচ', 2, '2022', 'এস, এস, সি', '2022-07', 3500.00, NULL, 1, 2, '2022-09-21 07:48:53', '2022-09-21 07:48:53'),
(5, 'মেঘনা', 1, '2022', 'Six', '2022-07', 700.00, NULL, 1, 3, '2022-10-01 22:12:50', '2022-10-01 22:12:50'),
(6, 'সকাল', 1, '2022', 'Eight', '2022-02', 700.00, NULL, 1, 4, '2022-10-09 09:54:46', '2022-10-09 09:54:46'),
(7, 'বিকাল', 1, '2022', 'Six', '2022-03', 700.00, NULL, 1, 4, '2022-10-09 09:55:18', '2022-10-09 09:55:18'),
(8, 'সকাল', 1, '2022', 'Six, Seven', '2022-03', 700.00, NULL, 1, 5, '2022-10-14 10:16:29', '2022-10-14 10:16:29'),
(9, 'Class Six B', 1, '2022', 'Six', '2022-01', 800.00, 'N/A', 1, 7, '2022-10-14 17:56:28', '2022-10-18 17:31:48'),
(10, 'Class Six G', 1, '2022', 'Six', '2022-01', 800.00, 'N/A', 1, 7, '2022-10-14 17:58:40', '2022-10-18 17:31:36'),
(11, 'Class Seven Mixed', 1, '2022', 'Seven', '2022-01', 800.00, 'N/A', 1, 7, '2022-10-14 17:59:47', '2022-10-18 17:30:58'),
(12, 'Class Eight B', 1, '2022', 'Eight', '2022-01', 1000.00, 'N/A', 1, 7, '2022-10-14 18:00:36', '2022-10-18 17:30:32'),
(13, 'Class Eight G', 1, '2022', 'Eight', '2022-01', 1000.00, 'N/A', 1, 7, '2022-10-14 18:01:19', '2022-10-18 17:30:18'),
(14, 'Class Nine Mixed', 1, '2022', 'Nine', '2022-01', 1000.00, 'N/A', 1, 7, '2022-10-14 18:02:10', '2022-10-18 17:30:03'),
(15, 'Class Ten Mixed', 1, '2022', 'Ten', '2022-01', 1000.00, 'N/A', 1, 7, '2022-10-14 18:02:49', '2022-10-18 17:23:54'),
(16, 'Class Five Mixed', 1, '2022', 'Five', '2022-01', 600.00, 'N/A', 1, 7, '2022-10-14 18:03:39', '2022-10-18 17:23:35'),
(17, 'Padma', 1, '2022', '10', '2022-10', 1000.00, NULL, 1, 8, '2022-10-17 19:27:48', '2022-10-17 19:27:48'),
(18, 'মেঘনা', 2, '2022', 'SSC', '2022-04', 1500.00, NULL, 1, 3, '2022-10-18 09:16:36', '2022-10-18 09:16:36'),
(19, 'Class 6 (Boys)', 1, '2022', NULL, '2022-01', 1500.00, NULL, 1, 9, '2022-10-18 16:58:38', '2022-10-18 16:58:38'),
(20, 'Class 6 (Girls)', 1, '2022', NULL, '2022-01', 1500.00, NULL, 1, 9, '2022-10-18 17:04:51', '2022-10-18 17:04:51'),
(21, 'Nine', 1, '2022', 'Nine', '2022-10', 300.00, '12 Students', 1, 11, '2022-10-22 16:49:42', '2022-10-22 16:49:42'),
(22, 'Six', 1, '2022', 'Six', '2022-03', 2000.00, '1 student', 1, 11, '2022-10-22 16:52:59', '2022-10-22 16:52:59'),
(23, 'Eight -Morning (Mysha ,Nisho)', 1, '2022', 'Eight', '2022-10', 500.00, NULL, 1, 12, '2022-10-24 18:05:55', '2022-10-24 18:05:55'),
(24, 'Nine', 1, '2022', 'Nine', '2022-01', 500.00, NULL, 1, 14, '2022-10-26 08:17:49', '2022-10-26 08:17:49'),
(25, '1st-07:30', 1, '2022', '9', 'March', 800.00, NULL, 1, 15, '2022-11-04 09:11:15', '2022-11-04 09:11:15'),
(26, '2nd-08:30-09:30', 1, '2022', '6,8,10', 'January', 800.00, NULL, 1, 15, '2022-11-04 09:14:21', '2022-11-04 09:14:21'),
(27, '4th-04:00-05:00', 1, '2022', '7,8,9,10', 'January', 800.00, NULL, 1, 15, '2022-11-04 09:16:58', '2022-11-04 09:16:58'),
(28, 'B6:12:30SUN', 1, '2022', 'Six', '2023-01', 1000.00, 'Sun-Fri', 1, 17, '2022-11-29 12:40:08', '2022-11-29 12:40:08'),
(29, 'Computer', 1, '2023', '10.00AM', '2023-01', 4000.00, 'Janu-june-2023', 1, 20, '2022-11-29 20:48:33', '2022-11-29 20:48:33'),
(30, 'Nine 7:00 to 8:00', 1, '2022', 'Nine', '2022-12', 500.00, 'ফি আমানিল্লাহ', 1, 30, '2022-12-01 19:56:09', '2022-12-01 19:56:09'),
(31, 'Eight 8:00 to 9:00', 1, '2022', 'Eight', '2022-12', 500.00, 'ফি আমানিল্লাহ', 1, 30, '2022-12-01 19:58:39', '2022-12-01 19:58:39'),
(32, 'Six 8:00 to 9:00', 1, '2022', 'Six', '2022-12', 500.00, 'ফি আমানিল্লাহ', 1, 30, '2022-12-01 20:01:21', '2022-12-01 20:01:21'),
(33, 'Saturday-7a.m', 1, '2022', NULL, '2022-12', 700.00, NULL, 1, 35, '2022-12-02 11:34:11', '2022-12-02 11:34:11'),
(35, 'SSC Program', 1, '2022', 'SSC', '2022-12', 600.00, '৩ মাস কোর্চ', 1, 39, '2022-12-02 21:38:00', '2022-12-02 21:38:00'),
(36, 'প্লে শ্রেনি', 1, '2023', 'প্লে', '2024-01', 300.00, NULL, 1, 39, '2022-12-02 21:45:01', '2022-12-02 21:45:01'),
(37, 'নার্সারী', 1, '2023', 'নার্সারী', '2024-01', 300.00, NULL, 1, 39, '2022-12-02 21:45:30', '2022-12-02 21:45:30'),
(38, 'কেজি ১', 1, '2023', 'কেজি ১', '2024-01', 300.00, NULL, 1, 39, '2022-12-02 21:45:52', '2022-12-02 21:45:52'),
(39, 'কেজি ২', 1, '2023', 'কেজি ২', '2024-01', 300.00, NULL, 1, 39, '2022-12-02 21:46:09', '2022-12-02 21:46:09'),
(40, 'কেজি ৩', 1, '2023', 'কেজি ৩', '2024-01', 350.00, NULL, 1, 39, '2022-12-02 21:46:35', '2022-12-02 21:46:35'),
(41, 'কেজি ৪', 1, '2023', 'কেজি ৪', '2024-01', 400.00, NULL, 1, 39, '2022-12-02 21:46:55', '2022-12-02 21:46:55'),
(42, 'কেজি ৫', 1, '2023', 'কেজি ৫', '2024-01', 500.00, NULL, 1, 39, '2022-12-02 21:47:22', '2022-12-02 21:47:22'),
(43, '৬ষ্ঠ', 1, '2023', '৬ষ্ঠ', '2023-01', 300.00, NULL, 1, 39, '2022-12-02 21:47:59', '2022-12-02 21:47:59'),
(44, '৭ম', 1, '2023', '৭ম', '2023-01', 300.00, NULL, 1, 39, '2022-12-02 21:48:23', '2022-12-02 21:48:23'),
(45, '৮ম', 1, '2023', '৮ম', '2023-01', 400.00, NULL, 1, 39, '2022-12-02 21:48:48', '2022-12-02 21:48:48'),
(46, '৯ম', 1, '2023', '৯ম', '2023-01', 500.00, NULL, 1, 39, '2022-12-02 21:49:07', '2022-12-02 21:49:07'),
(47, '১০ম', 1, '2023', '১০ম', '2024-01', 500.00, NULL, 1, 39, '2022-12-02 21:49:41', '2022-12-02 21:49:41'),
(48, 'Morning', 1, '2023', '8', '2023-01', 500.00, NULL, 1, 44, '2022-12-03 22:51:06', '2022-12-03 22:51:06'),
(49, 'S.s.c (2023)science', 1, '2022', 'Ten', '2022-12', 1000.00, NULL, 1, 52, '2022-12-05 20:06:03', '2022-12-05 20:06:03'),
(50, 'S.s.c (2023)B.s', 1, '2022', 'Ten', '2022-12', 500.00, NULL, 1, 52, '2022-12-05 20:08:29', '2022-12-05 20:08:29'),
(51, 'SSC Preparation batch 2023', 2, '2022', '120', '2022-12', 4000.00, 'সুরভীদের ব্যাচ', 1, 43, '2022-12-06 15:53:04', '2022-12-06 15:53:04'),
(52, 'SSC-2023(B/S)', 2, '2022', 'TEN', '2022-12', 6000.00, NULL, 1, 36, '2022-12-10 19:24:13', '2022-12-10 19:24:13'),
(53, 'SSC-2023(H/U)', 2, '2022', 'TEN', '2022-12', 5000.00, NULL, 1, 36, '2022-12-10 19:33:20', '2022-12-10 19:33:20'),
(54, 'SSC-2024(B/S)', 1, '2023', 'TEN', '2023-01', 1200.00, NULL, 1, 36, '2022-12-10 19:34:32', '2022-12-10 19:34:54'),
(55, 'SSC-2024(H/U)', 1, '2023', 'TEN', '2023-01', 1000.00, NULL, 1, 36, '2022-12-10 19:36:54', '2022-12-10 19:36:54'),
(56, 'Hsc 1st year', 2, '2023', 'All', '2023-01', 6000.00, NULL, 1, 58, '2022-12-19 17:47:19', '2022-12-19 17:47:19'),
(57, 'Hsc 1st year', 2, '2023', 'All', '2023-01', 6000.00, NULL, 1, 58, '2022-12-19 17:47:20', '2022-12-19 17:47:20'),
(58, 'SSC', 2, '2023', '10', '2023-01', 5.00, NULL, 1, 61, '2023-01-06 18:04:50', '2023-01-06 18:04:50'),
(59, 'General', 1, '2023', 'All Members', '2023-01', 0.00, NULL, 1, 62, '2023-01-23 12:24:21', '2023-01-23 12:26:17'),
(60, 'Hsc 1st year', 2, '2023', 'Physics 1st year', '2023-02', 6000.00, NULL, 1, 58, '2023-02-06 02:46:23', '2023-02-06 02:46:23'),
(61, 'Class-10', 1, '2023', '15', '2023-01', 1000.00, NULL, 1, 52, '2023-02-06 04:28:26', '2023-02-06 04:28:26'),
(62, 'Class-8', 1, '2023', '8', '2023-01', 500.00, NULL, 1, 52, '2023-02-06 04:29:44', '2023-02-07 17:17:45'),
(63, 'Class-6&7', 1, '2023', '6&7', '2023-02', 500.00, NULL, 1, 52, '2023-02-06 04:30:33', '2023-02-07 17:17:29'),
(64, 'Nine', 2, '2023', '9', '2023-01', 1000.00, NULL, 1, 52, '2023-02-07 17:13:07', '2023-02-07 17:13:07'),
(65, 'Three & Five', 2, '2023', '3 & 5', '2023-01', 500.00, NULL, 1, 52, '2023-02-08 14:50:57', '2023-02-08 14:50:57'),
(68, 'Al-Banna six', 1, '2023', '10', '2023-03', 500.00, NULL, 1, 52, '2023-02-24 03:10:18', '2023-02-24 03:10:18'),
(69, 'day', 1, '2023', '6', '2023-03', 3500.00, NULL, 1, 71, '2023-04-18 20:48:57', '2023-04-18 20:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `institutions`
--

CREATE TABLE `institutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `head_of_institution` varchar(40) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_sms_template` text DEFAULT 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}',
  `id_sms` text DEFAULT 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.',
  `custom_sms_template` text DEFAULT 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.',
  `online_payment_note` text DEFAULT 'Please transaction id past into trasaction id box!',
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `institutions`
--

INSERT INTO `institutions` (`id`, `name`, `phone`, `head_of_institution`, `email`, `address`, `is_active`, `created_at`, `updated_at`, `payment_sms_template`, `id_sms`, `custom_sms_template`, `online_payment_note`, `comment`) VALUES
(1, 'Rahim K. Ins', '01317145646', 'Rahim Khan', NULL, 'Birganj, Dinajpur', 1, '2022-09-21 07:20:53', '2022-09-21 07:27:27', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(2, 'গল্প কোচিং-টেস্ট', '01794928580', 'Alamgir Hasan', NULL, 'বীরগঞ্জ', 1, '2022-09-21 07:45:32', '2022-11-27 17:47:16', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', '০১৭১৮০৭৫৯০৩ নম্বরে আপনার মাসিক বেতন পরিশোধ করুন। মোবাইল ব্যাংকিং এর মাধ্যমে পেমেন্ট করার পর যে মেসেজটি পাবেন তা উপরের \"Transaction ID\" বক্সে পেস্ট করে দিন। যাচাই করে এপ্রুভ করলে আপনি Payment Confirmation মেসেজ পাবেন। ধন্যবাদ।', NULL),
(3, 'টুমরো কোচিং সেন্টার', '01718075903', 'Yousuf', 'shikkhafirst@gmail.com', 'Birganj, Dinajpur', 1, '2022-10-01 22:11:09', '2023-06-26 01:46:02', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(4, 'Merit Creative Coaching Centre', '01717486538', 'MD ABDUL KIYOM', NULL, 'Post Office Road, Birganj', 1, '2022-10-09 09:53:53', '2022-10-18 21:12:28', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(5, 'My Institution', '01556306432', 'Majibar Rahman', NULL, NULL, 1, '2022-10-13 07:05:42', '2022-10-13 07:05:42', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(6, 'My Institution', '01718691841', 'Afrukta Akter', NULL, NULL, 1, '2022-10-14 17:36:57', '2022-10-14 17:36:57', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(7, 'SS Academy', '01976788615', 'MUHAMMAD SAMIUL HAQUE', 'samiul41@yahoo.com', 'Doleshwar, Keraniganj, Dhaka.', 1, '2022-10-14 17:52:13', '2022-10-14 17:53:33', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(8, 'My Institution', '01966224012', 'Abidur Rahman', 'rahmanabidur050@gmail.com', NULL, 1, '2022-10-17 19:25:13', '2022-10-17 19:25:13', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(9, 'My Institution', '01828562365', 'মোঃ আমীরুল ইসলাম', 'rahansth@gmail.com', NULL, 1, '2022-10-18 09:56:38', '2022-10-18 09:56:38', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(10, 'My Institution', '01724199661', 'আরিশা কোচিং সেন্টার', 'azshraban78@gmail.com', NULL, 1, '2022-10-21 10:00:52', '2022-10-21 10:00:52', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(11, 'My Institution', '01741289412', 'MD. EMADUL HAQUE', 'emadulhaque81@gmail.com', NULL, 1, '2022-10-22 16:47:06', '2022-10-22 16:47:06', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(12, 'My Institution', '01912582600', 'Md.Ilias Ahmed', 'ilias.ahcb@gmail.com', NULL, 1, '2022-10-24 18:03:20', '2022-10-24 18:03:20', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(13, 'My Institution', '01403608189', 'MD. ANARUL ISLAM', 'anarul090219@gmail.com', NULL, 1, '2022-10-24 20:31:36', '2022-10-24 20:31:36', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(14, 'My Institution', '01762811527', 'Mustak Tahmid Ovi', NULL, NULL, 1, '2022-10-26 08:16:31', '2022-10-26 08:16:31', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(15, 'My Institution', '01715736735', 'Mohammad Jahangir Alam', 'jahangirshs@gmail.com', NULL, 1, '2022-11-04 09:01:29', '2022-11-04 09:01:29', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(16, 'My Institution', '01726559942', 'shadhin rahman', NULL, NULL, 1, '2022-11-29 11:23:18', '2022-11-29 11:23:18', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(17, 'My Institution', '01703507336', 'Milon Bhuiyan', 'bmsa.edu@gmail.com', NULL, 1, '2022-11-29 12:36:30', '2022-11-29 12:36:30', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(18, 'My Institution', '01722388713', 'মোঃ শাহিনুর রহমান পাটোয়ারী', 'patowary131990@gmail.com', NULL, 1, '2022-11-29 12:40:57', '2022-11-29 12:40:57', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(19, 'My Institution', '01832102330', 'MD. MIRAJ UDDIN', 'miraj1618@gmail.com', NULL, 1, '2022-11-29 16:48:26', '2022-11-29 16:48:26', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(20, 'My Institution', '01701315034', 'BAMUNDI KARIGORI TRAINING CENTER', 'odhora.ornob@gmail.com', NULL, 1, '2022-11-29 20:38:18', '2022-11-29 20:38:18', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(21, 'My Institution', '01798817882', 'নাজমুল হক প্রদীপ', 'Nazmulhaquepradip@gmail.com', NULL, 1, '2022-11-29 21:55:40', '2022-11-29 21:55:40', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(22, 'My Institution', '01715284131', 'MD. TUFAIL AHAMMED', 'tufayelahammed31@gmail.com', NULL, 1, '2022-11-29 23:12:36', '2022-11-29 23:12:36', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(23, 'My Institution', '01743222959', 'Mustak Ahmed Bappi', 'mbappi1992@gmail.com', NULL, 1, '2022-11-30 11:43:52', '2022-11-30 11:43:52', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(24, 'My Institution', '01744368146', 'Md. Zahidul Islam', 'mdzahidulislam57@gmail.com', NULL, 1, '2022-11-30 15:23:52', '2022-11-30 15:23:52', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(25, 'My Institution', '01531722856', 'Ms.yeasir', 'activeeducare235@gmail.com', NULL, 1, '2022-11-30 17:02:54', '2022-11-30 17:02:54', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(26, 'My Institution', '01511627373', 'Md Zakir Hossain', 'hmzakir7373@gmail.com', NULL, 1, '2022-12-01 19:02:47', '2022-12-01 19:02:47', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(27, 'My Institution', '01913137694', 'Md. Azizul Hoque', 'azizul.math@gmail.com', NULL, 1, '2022-12-01 19:10:44', '2022-12-01 19:10:44', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(28, 'My Institution', '01834123998', 'Md. Jamal Hossen', 'jamalhossen345@gmail.com', NULL, 1, '2022-12-01 19:19:34', '2022-12-01 19:19:34', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(29, 'My Institution', '01774378476', 'Rajib Roy', NULL, NULL, 1, '2022-12-01 19:21:26', '2022-12-01 19:21:26', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(30, 'My Institution', '01724647362', 'AHAMMAD ALI', 'ahmad12081986@gmail.com', NULL, 1, '2022-12-01 19:40:28', '2022-12-01 19:40:28', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(31, 'My Institution', '01785052492', 'নিউ অনুশীলন কোচিং সেন্টার', 'helal017kp@gmail.com', NULL, 1, '2022-12-01 19:43:39', '2022-12-01 19:43:39', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(32, 'My Institution', '1725443003', 'Md. Masud rana', 'mayerdoyaa017@gmail.com', NULL, 1, '2022-12-01 20:03:19', '2022-12-01 20:03:19', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(33, 'My Institution', '01750365533', 'Md. Mizanur Rahman', 'choyon.ru4003@gmail.com', NULL, 1, '2022-12-01 23:12:10', '2022-12-01 23:12:10', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(34, 'My Institution', '01619116699', 'salahuddin russell', 'salahuddin.russell@gmail.com', NULL, 1, '2022-12-02 10:18:42', '2022-12-02 10:18:42', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(35, 'My Institution', '01767162653', 'Md Monirul Islam', NULL, NULL, 1, '2022-12-02 11:28:28', '2022-12-02 11:28:28', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(36, 'জাহিদ স্যার কোচিং হোম', '01919184184', 'JAHID SIR', 'jahidsir.net@gmail.com', 'ভাই ভাই স্টোর(২য় তলা), ছোট কুমিরা, সীতাকুণ্ড,চট্টগ্রাম।', 1, '2022-12-02 13:27:39', '2022-12-10 19:46:21', 'জনাব, আপনার সন্তান {{student_name}}, সর্বমোট {{total_amount}} মধ্যে {{paid_amount}} পরিশোধ করেছে।', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(37, 'My Institution', '01767687804', 'মোঃ মনির হোসেন', 'mdmonir126491@gmail.com', NULL, 1, '2022-12-02 15:41:32', '2022-12-02 15:41:32', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(38, 'My Institution', '01735710521', 'Md. Abdullah al Mamun', 'mamunmy21@gmail.com', NULL, 1, '2022-12-02 18:46:22', '2022-12-02 18:46:22', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(39, 'My Institution', '01722060244', 'নিউ স্টার (NS) এডুকেশন', NULL, 'পুর্ব কালুডাঙ্গা, উলিপুর কুড়িগ্রাম', 1, '2022-12-02 21:24:38', '2022-12-02 21:42:32', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(40, 'My Institution', '01711120876', 'Md Mosharraf Hossain', 'mosharraf8801711120876@gmail.com', NULL, 1, '2022-12-03 08:34:47', '2022-12-03 08:34:47', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(41, 'ইউনিটি বিদ্যা নিকেতন', '01321869396', 'Jehad Asraf', 'jehadasrafuddin46@gmail.com', 'সাউথ সন্দ্বীপ স্কুল সংলগ্ন, শিবেরহাট, সন্দ্বীপ, চট্টগ্রাম।', 1, '2022-12-03 13:25:55', '2022-12-03 13:29:58', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', '।।।।', NULL),
(42, 'Ranga Teaching Centre', '01518903267', 'Rupan Chakma', 'chakmarupan52@gmail.com', 'Rangamati Sadar', 1, '2022-12-03 15:59:42', '2022-12-03 16:06:30', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(43, 'My Institution', '01788228500', 'Md Faisal islam', 'faisal.bcse@gmail.com', NULL, 1, '2022-12-03 22:36:58', '2022-12-03 22:36:58', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(44, 'Friendly Education Care Center', '01746508889', 'Niyamul Rasid Sani', 'niamulroshid@gmail.com', 'Angaria', 1, '2022-12-03 22:42:37', '2022-12-03 22:45:56', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(45, 'My Institution', '01312659150', 'মো. মোজাম্মেল হোসেন', 'mamozammelzi1990@gmail.com', NULL, 1, '2022-12-04 07:06:15', '2022-12-04 07:06:15', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(46, 'My Institution', '01746950911', 'Dulal dattta', 'dulaldatta11@gmail.com', NULL, 1, '2022-12-04 09:46:56', '2022-12-04 09:46:56', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(47, 'My Institution', '01758523129', 'MD. MONIRUL ISLAM', 'paradoxicalmonir@gmail.com', NULL, 1, '2022-12-04 10:04:18', '2023-02-05 18:12:06', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', '5/2/23 কথা হয়েছে। আশানুরূপ। শাহজাদপুর, সিরাজগঞ্জ।'),
(48, 'My Institution', '01552636185', 'Md Saifullah', 'mdsaifullah77469@gmail.com', 'sims', 0, '2022-12-04 18:47:52', '2023-02-05 18:04:18', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(49, 'My Institution', '01681032503', 'Md. Al- Mamun', 'itzacademicworld@gmail.com', NULL, 1, '2022-12-04 22:43:14', '2022-12-04 22:43:14', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(51, 'My Institution', '+8801716352325', 'Nabo Kumar Bhatacharjee', 'nabomirtunjoy@gmail.vom', NULL, 1, '2022-12-05 18:11:59', '2023-02-05 17:54:16', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', '৫/২/২৩ কথা ব্যস্ত।'),
(52, 'BETA MATH ACADEMY', '01979421021', 'BETA MATH ACADEMY', 'betamathacademy@gmail.com', 'Rampur, Hazigonj,Chandpur', 1, '2022-12-05 19:43:14', '2023-02-07 03:29:08', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', '৫/২/২৩ কথা হয়েছে। ব্যবহার করবে।'),
(53, 'My Institution', '01710926320', 'Syful Islam', 'jms.syful@gmail.com', NULL, 1, '2022-12-05 21:13:55', '2023-02-05 00:31:54', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', '৪/২/২৩ কল। ব্যস্ত।'),
(54, 'My Institution', '01837191065', 'Md.mojibul.haqe.', 'Mojibulhaqe958@gmail.com', NULL, 1, '2022-12-06 16:39:19', '2022-12-06 16:39:19', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(55, 'অহিদুজ্জামান একাডেমি', '01776309104', 'অহিদুজ্জামান একাডেমি', 'mdohid26@gmail.com', 'আকুঞ্জি বাড়ি, পাবলা, দৌলতপুর, খুলনা।', 1, '2022-12-07 14:34:32', '2023-02-05 00:21:31', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', 'আকুঞ্জি বাড়ি, পাবলা, দৌলতপুর, খুলনা।'),
(56, 'My Institution', '01768939882', 'PANJARI PRIVATE CENTER', 'arifulislam01021998@gmail.com', 'sims', 1, '2022-12-07 15:51:16', '2023-02-05 00:20:10', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', 'কথা হয়েছে ০১/০২/২০২৩ইং। ফুলপুর, ময়মনসিংহ। 4/2/23 কথা। পরে দেখবে।'),
(57, 'My Institution', '01870551208', 'Md Murshed Kamal', 'mdmurshedkamalchm@gmail.com', 'sims', 1, '2022-12-08 11:25:07', '2023-02-04 23:50:23', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', 'কথা হয়েছে ১/২/২৩ইং সন্ধ্যায়। হবিগঞ্জ, সিলেট। উনি অন্য নম্বর থেকে কথা বলেতে চেয়েছেন একটু পরেই।'),
(58, 'My Institution', '01735007681', 'Mosharrof Hossain', 'ronenice2017@gmail.com', 'SIMS', 1, '2022-12-19 17:43:56', '2023-02-04 23:49:34', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', '01735007681 নম্বরে ০১/০২/২০২৩ইং কথা হয়েছে। রাজশাহী তানোর। 4/2/2023 কথা। দেখেনি, দেখবে।'),
(59, 'My Institution', '01990960456', 'salman', 'salmanhossain.xyt@gmail.com', 'SIMS', 1, '2022-12-29 21:24:22', '2023-02-04 23:42:39', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', '01308471894 নম্বরে হোয়াটসএপে যোগাযোগ হয়েছে। দক্ষিণ বাড্ডার কোচিং।'),
(60, 'My Institution', '01772928684', 'Iqbal hasan Lekhon', 'iqbalhasanlekhon@gmail.com', 'No Need', 0, '2022-12-30 17:06:36', '2023-01-31 00:40:23', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(61, 'My Institution (Called)', '01743662561', 'Md Rahim  Ali', 'rahimali110022@gmail.com', 'SIMS', 1, '2023-01-06 18:03:43', '2023-02-04 23:41:27', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(62, 'My Institution', '01718217423', 'ANIMESH SUTRADHAR', 'animesh070707@gmail.com', NULL, 1, '2023-01-23 11:25:36', '2023-02-02 17:56:06', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(63, 'My Institution', '01840051419', 'আব্দুল্লাহ লালু', NULL, NULL, 1, '2023-02-05 08:38:57', '2023-02-05 08:38:57', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(64, 'My Institution', '01777313300', 'আব্দুল্লাহ লালু', NULL, NULL, 1, '2023-02-05 13:56:57', '2023-02-05 13:56:57', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(65, 'My Institution', '01755339940', 'বৈরচুনা নিউ মডেল কেজি স্কুল', 'diliprajbongshi2018@gmail.com', NULL, 1, '2023-02-05 17:39:15', '2023-02-05 17:39:15', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(66, 'My Institution', '01620192646', 'Shohag', 'momota843301@gmail.com', NULL, 1, '2023-02-05 17:45:24', '2023-02-05 17:45:24', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(67, 'My Institution', '01730590974', 'ENGLISH BUS', 'subrata22shuvo@gmail.com', NULL, 1, '2023-02-23 01:22:54', '2023-02-23 01:22:54', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(68, 'My Institution', '01319126576', 'MD. KHALID HASAN', 'h.Khalid9458@gmail.com', NULL, 1, '2023-02-26 00:09:03', '2023-02-26 00:09:03', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(69, 'My Institution', '+8801773729897', 'SAIFUL ISLAM', 'smprivet726@gmail.com', NULL, 1, '2023-02-26 01:25:57', '2023-02-26 01:25:57', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(70, 'My Institution', '01327693318', 'Ayman ausaf mokter', 'mokterbapari12@gmail.com', NULL, 1, '2023-03-31 14:41:08', '2023-03-31 14:41:08', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(71, 'My Institution', '01979278216', 'Ayan Khan Shuvro', 'ayankhanlog@gmail.com', NULL, 1, '2023-04-18 20:46:24', '2023-04-18 20:46:24', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(72, 'My Institution', '+8801521313053', 'Md.Rajibur Rahman', 'rajiburmath@gmail.com', NULL, 1, '2023-04-26 17:27:50', '2023-04-26 17:27:50', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(73, 'My Institution', '01737815960', 'Md Rahim  Ali', 'rahimali01743662561@gmail.com', NULL, 1, '2023-05-14 21:42:52', '2023-05-14 21:42:52', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL);
INSERT INTO `institutions` (`id`, `name`, `phone`, `head_of_institution`, `email`, `address`, `is_active`, `created_at`, `updated_at`, `payment_sms_template`, `id_sms`, `custom_sms_template`, `online_payment_note`, `comment`) VALUES
(74, 'My Institution', '01912154899', 'Omar Faroque', 'faroquedocuments@gmail.com', NULL, 1, '2023-06-12 19:15:27', '2023-06-12 19:15:27', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL),
(75, 'My Institution', '01851612635', 'Rebeka Sultana', 'rebeka.ndmhs@gmail.com', NULL, 1, '2023-06-12 19:18:37', '2023-06-12 19:18:37', 'Hello {{student_name}},\n            Your payment {{paid_amount}} received by {{received_by}}. \n            thanks!\n            From- {{ins_name}}', 'Hello {{student_name}},\n            Your unique id is {{unique_id}} and pin is {{pin_number}}. Please don\'t forgot this credential. Click here for login {{login_link}}.\n            From- {{ins_name}}.', 'Hello {{student_name}},\n            Our institution will be off on 16th December!\n            From - {{ins_name}}.', 'Please transaction id past into trasaction id box!', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ins_sms`
--

CREATE TABLE `ins_sms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `valid_till` date NOT NULL,
  `total_sms` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ins_sms`
--

INSERT INTO `ins_sms` (`id`, `institution_id`, `valid_till`, `total_sms`, `created_at`, `updated_at`) VALUES
(1, 7, '2022-12-20', 500, '2022-11-20 16:27:43', '2022-11-20 16:27:43'),
(2, 2, '2022-12-20', 497, '2022-11-20 16:33:15', '2022-11-20 16:39:22'),
(3, 3, '2022-12-20', 993, '2022-11-20 16:55:00', '2022-11-23 19:47:50'),
(4, 41, '2023-01-02', 1000, '2022-12-03 13:33:56', '2022-12-03 13:33:58'),
(5, 50, '2023-01-04', 500, '2022-12-05 15:45:11', '2022-12-05 15:45:11'),
(6, 62, '2023-02-22', 500, '2023-01-23 12:05:27', '2023-01-23 12:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_03_113848_create_permission_tables', 1),
(6, '2022_09_05_154044_create_institutions_table', 1),
(7, '2022_09_06_093831_create_sessions_table', 1),
(8, '2022_09_06_123931_create_batches_table', 1),
(9, '2022_09_08_135927_create_students_table', 1),
(10, '2022_09_10_100400_add_columns_to_batches', 1),
(11, '2022_09_10_164351_create_settings_table', 1),
(12, '2022_09_12_165046_create_payments_table', 1),
(13, '2022_09_12_171134_create_payment_details_table', 1),
(14, '2022_09_15_085820_create_student_payment_table', 1),
(15, '2022_09_15_093016_add_column_to_payments', 1),
(16, '2022_09_15_094254_add_due_column_to_payment_details', 1),
(17, '2022_09_15_105140_add_need_to_pay_column_to_student_payments', 1),
(18, '2022_09_16_121807_add_column_to_students', 1),
(19, '2022_09_16_151755_add_pay_year_column_to_payments', 1),
(20, '2022_09_17_175514_create_cache_table', 1),
(21, '2022_09_21_111906_add_colu_to_users', 1),
(22, '2022_10_13_053827_add_guardian_name_column_to_students_table', 2),
(23, '2022_10_16_180734_add_column_to_users', 3),
(24, '2022_10_27_103943_create_sms_packages_table', 4),
(25, '2022_10_28_111336_create_sms_package_purchases_table', 4),
(26, '2022_10_28_131445_create_ins_sms_table', 4),
(27, '2022_11_16_151938_add_sms_template_column_to_institutions', 4),
(28, '2022_11_17_100548_add_id_sms_column_to_institutions', 4),
(29, '2022_11_17_103818_add_columns__to_students', 4),
(30, '2022_11_17_163518_add_column_coustom_sms_template_to_institution', 4),
(31, '2022_11_19_045400_create_sms_history_table', 4),
(32, '2022_11_24_151800_add_online_payment_notice_column_to_insitution', 5),
(33, '2022_11_24_162618_create_online_payments_table', 5),
(34, '2022_11_24_163051_create_online_payment_details_table', 5),
(35, '2022_12_05_112159_create_admins_table', 6),
(36, '2022_12_07_062312_add_column_to_settings', 6),
(37, '2023_02_02_124911_add_comment_column_to_institution', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 3),
(1, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 7),
(13, 'App\\Models\\User', 3),
(14, 'App\\Models\\User', 3),
(15, 'App\\Models\\User', 3),
(16, 'App\\Models\\User', 3),
(17, 'App\\Models\\User', 3),
(17, 'App\\Models\\User', 62),
(18, 'App\\Models\\User', 3),
(18, 'App\\Models\\User', 62),
(19, 'App\\Models\\User', 3),
(20, 'App\\Models\\User', 3),
(21, 'App\\Models\\User', 3),
(21, 'App\\Models\\User', 62),
(22, 'App\\Models\\User', 3),
(23, 'App\\Models\\User', 3),
(24, 'App\\Models\\User', 3),
(25, 'App\\Models\\User', 3),
(25, 'App\\Models\\User', 62),
(26, 'App\\Models\\User', 3),
(26, 'App\\Models\\User', 62),
(31, 'App\\Models\\User', 3),
(32, 'App\\Models\\User', 3),
(32, 'App\\Models\\User', 7),
(35, 'App\\Models\\User', 3),
(40, 'App\\Models\\User', 3),
(41, 'App\\Models\\User', 3),
(42, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 29),
(2, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 31),
(2, 'App\\Models\\User', 32),
(2, 'App\\Models\\User', 33),
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 36),
(2, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 39),
(2, 'App\\Models\\User', 40),
(2, 'App\\Models\\User', 41),
(2, 'App\\Models\\User', 42),
(2, 'App\\Models\\User', 43),
(2, 'App\\Models\\User', 44),
(2, 'App\\Models\\User', 45),
(2, 'App\\Models\\User', 46),
(2, 'App\\Models\\User', 47),
(2, 'App\\Models\\User', 48),
(2, 'App\\Models\\User', 49),
(2, 'App\\Models\\User', 50),
(2, 'App\\Models\\User', 51),
(2, 'App\\Models\\User', 52),
(2, 'App\\Models\\User', 53),
(2, 'App\\Models\\User', 54),
(2, 'App\\Models\\User', 55),
(2, 'App\\Models\\User', 58),
(2, 'App\\Models\\User', 59),
(2, 'App\\Models\\User', 60),
(2, 'App\\Models\\User', 61),
(2, 'App\\Models\\User', 63),
(2, 'App\\Models\\User', 64),
(2, 'App\\Models\\User', 65),
(2, 'App\\Models\\User', 66),
(2, 'App\\Models\\User', 67),
(2, 'App\\Models\\User', 68),
(2, 'App\\Models\\User', 69),
(2, 'App\\Models\\User', 70),
(2, 'App\\Models\\User', 71),
(2, 'App\\Models\\User', 72),
(2, 'App\\Models\\User', 73),
(2, 'App\\Models\\User', 74),
(2, 'App\\Models\\User', 75),
(2, 'App\\Models\\User', 76),
(2, 'App\\Models\\User', 77),
(2, 'App\\Models\\User', 78),
(2, 'App\\Models\\User', 79),
(2, 'App\\Models\\User', 80);

-- --------------------------------------------------------

--
-- Table structure for table `online_payments`
--

CREATE TABLE `online_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `reference` char(6) NOT NULL,
  `payment_year` char(4) NOT NULL,
  `total_amount` double(8,2) NOT NULL,
  `paid_amount` double(8,2) NOT NULL,
  `phone_number` char(15) DEFAULT NULL,
  `transaction_id` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_payments`
--

INSERT INTO `online_payments` (`id`, `student_id`, `reference`, `payment_year`, `total_amount`, `paid_amount`, `phone_number`, `transaction_id`, `is_approved`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, '375079', '2022', 800.00, 800.00, '০১৭১৮০৭৫৯০৩', '\"Transaction ID\" বক্সে পেস্ট করে দিন। যাচাই করে এপ্রুভ করলে আপনি Payment Confirmation মেসেজ পাবেন। ধন্যবাদ।', 0, NULL, '2022-11-27 17:49:44', '2022-11-27 17:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `online_payment_details`
--

CREATE TABLE `online_payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `online_payment_id` bigint(20) UNSIGNED NOT NULL,
  `payment_year` char(4) DEFAULT NULL,
  `month` char(2) DEFAULT NULL,
  `amount` double(6,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `online_payment_details`
--

INSERT INTO `online_payment_details` (`id`, `online_payment_id`, `payment_year`, `month`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, '2022', '9', 800.00, '2022-11-27 17:49:44', '2022-11-27 17:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('samiul41@yahoo.com', '$2y$10$6sHbmVsphl5FMguToN9Pq.Oh/0lMsbebe0LAHz3dE2P2T6nxi0Ebq', '2022-10-18 17:22:13'),
('jahidsir.net@gmail.com', '$2y$10$nIARP.3SjfuxaD4MP7nx1ua2l8Hn0Q9w9lBKFL9f8/BdAmUQ1nFJq', '2023-04-26 15:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_no` varchar(255) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_year` char(4) DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `method` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=cash',
  `amount` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `due` double(8,2) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 1,
  `total_amount` double NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `ref_no`, `payment_date`, `payment_year`, `student_id`, `method`, `amount`, `discount`, `due`, `is_paid`, `total_amount`, `created_by`, `updated_by`, `note`, `created_at`, `updated_at`) VALUES
(22, '001', '2022-09-29', '2022', 1, 1, 500.00, NULL, NULL, 1, 500, 2, NULL, 'this is first payment note', '2022-09-29 00:32:13', '2022-09-29 00:32:13'),
(28, '001', '2022-09-14', '2022', 12, 1, 700.00, 300.00, 0.00, 1, 400, 7, NULL, NULL, '2022-10-14 18:32:53', '2022-10-14 18:32:53'),
(29, '002', '2022-10-14', '2022', 12, 1, 700.00, 300.00, 400.00, 0, 0, 7, NULL, NULL, '2022-10-14 18:35:30', '2022-10-14 18:35:30'),
(30, '003', '2022-10-14', '2022', 12, 1, 700.00, 300.00, 0.00, 1, 400, 7, NULL, NULL, '2022-10-14 18:45:24', '2022-10-14 18:45:24'),
(31, '001', '2022-10-18', '2022', 119, 1, 500.00, NULL, NULL, 1, 500, 4, NULL, NULL, '2022-10-18 09:18:18', '2022-10-18 09:18:18'),
(32, '002', '2022-10-18', '2022', 119, 1, 300.00, NULL, NULL, 1, 300, 4, NULL, NULL, '2022-10-18 09:23:10', '2022-10-18 09:23:10'),
(33, '003', '2022-10-18', '2022', 119, 1, 200.00, NULL, NULL, 1, 200, 4, NULL, NULL, '2022-10-18 09:23:25', '2022-10-18 09:23:25'),
(34, '001', '2022-10-18', '2022', 47, 1, 1600.00, 0.00, 0.00, 1, 1600, 9, NULL, NULL, '2022-10-18 17:33:17', '2022-10-18 17:33:17'),
(35, '002', '2022-10-18', '2022', 14, 1, 9000.00, NULL, NULL, 1, 9000, 9, NULL, NULL, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(37, '001', '2022-10-22', '2022', 121, 1, 2000.00, NULL, NULL, 1, 2000, 13, NULL, NULL, '2022-10-22 17:05:20', '2022-10-22 17:05:20'),
(38, '002', '2022-10-22', '2022', 121, 1, 12000.00, NULL, NULL, 1, 12000, 13, NULL, 'Thank you.', '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(39, '001', '2022-10-26', '2022', 122, 1, 1000.00, NULL, NULL, 1, 1000, 16, NULL, NULL, '2022-10-26 08:29:23', '2022-10-26 08:29:23'),
(40, '003', '2022-11-15', '2022', 121, 1, 2000.00, NULL, NULL, 1, 2000, 13, NULL, NULL, '2022-11-15 18:11:34', '2022-11-15 18:11:34'),
(41, '001', '2022-11-20', '2022', 4, 1, 1600.00, NULL, NULL, 1, 1600, 3, NULL, 'পেমেন্ট গ্রহণ করা হইল।', '2022-11-20 16:34:09', '2022-11-20 16:34:09'),
(42, '001', '2022-11-27', '2022', 120, 1, 1400.00, NULL, NULL, 1, 1400, 5, NULL, NULL, '2022-11-27 17:16:57', '2022-11-27 17:16:57'),
(44, '002', '2022-12-02', '2022', 5, 1, 2400.00, NULL, NULL, 1, 2400, 3, NULL, NULL, '2022-12-02 16:59:53', '2022-12-02 16:59:53'),
(45, '001', '2022-12-02', '2022', 128, 1, 600.00, NULL, NULL, 1, 600, 41, NULL, 'আপনার ডিসেম্বর মানের অগ্রীম বেতন কর্তন করা হইলো,', '2022-12-02 21:51:12', '2022-12-02 21:51:12'),
(46, '001', '2022-12-03', '2023', 130, 1, 500.00, 0.00, 0.00, 1, 500, 46, NULL, NULL, '2022-12-03 22:54:52', '2022-12-03 22:54:52'),
(47, '004', '2023-01-02', '2023', 6, 1, 700.00, NULL, NULL, 1, 700, 4, NULL, NULL, '2023-01-02 19:13:45', '2023-01-02 19:13:45'),
(48, '005', '2023-01-30', '2023', 124, 1, 1400.00, NULL, NULL, 1, 1400, 4, NULL, NULL, '2023-01-30 10:16:47', '2023-01-30 10:16:47'),
(49, '006', '2023-01-30', '2023', 119, 1, 500.00, NULL, NULL, 1, 500, 4, NULL, NULL, '2023-01-30 10:17:54', '2023-01-30 10:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `due` double(8,2) DEFAULT NULL,
  `month` tinyint(4) DEFAULT NULL COMMENT '0 index',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `payment_id`, `amount`, `discount`, `due`, `month`, `created_at`, `updated_at`) VALUES
(83, 22, 500.00, NULL, NULL, 8, '2022-09-29 00:32:13', '2022-09-29 00:32:13'),
(92, 28, 400.00, 300.00, 0.00, 10, '2022-10-14 18:32:53', '2022-10-14 18:32:53'),
(93, 29, 0.00, 300.00, 400.00, 9, '2022-10-14 18:35:30', '2022-10-14 18:35:30'),
(94, 30, 400.00, 300.00, 0.00, 11, '2022-10-14 18:45:24', '2022-10-14 18:45:24'),
(95, 31, 500.00, NULL, NULL, NULL, '2022-10-18 09:18:18', '2022-10-18 09:18:18'),
(96, 32, 300.00, NULL, NULL, NULL, '2022-10-18 09:23:10', '2022-10-18 09:23:10'),
(97, 33, 200.00, NULL, NULL, NULL, '2022-10-18 09:23:25', '2022-10-18 09:23:25'),
(98, 34, 800.00, 0.00, 0.00, 4, '2022-10-18 17:33:17', '2022-10-18 17:33:17'),
(99, 34, 800.00, 0.00, 0.00, 5, '2022-10-18 17:33:17', '2022-10-18 17:33:17'),
(100, 35, 1000.00, NULL, NULL, 0, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(101, 35, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(102, 35, 1000.00, NULL, NULL, 2, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(103, 35, 1000.00, NULL, NULL, 3, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(104, 35, 1000.00, NULL, NULL, 4, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(105, 35, 1000.00, NULL, NULL, 5, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(106, 35, 1000.00, NULL, NULL, 6, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(107, 35, 1000.00, NULL, NULL, 7, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(108, 35, 1000.00, NULL, NULL, 8, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(111, 37, 2000.00, NULL, NULL, 8, '2022-10-22 17:05:20', '2022-10-22 17:05:20'),
(112, 38, 2000.00, NULL, NULL, 2, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(113, 38, 2000.00, NULL, NULL, 3, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(114, 38, 2000.00, NULL, NULL, 4, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(115, 38, 2000.00, NULL, NULL, 5, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(116, 38, 2000.00, NULL, NULL, 6, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(117, 38, 2000.00, NULL, NULL, 7, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(118, 39, 500.00, NULL, NULL, 9, '2022-10-26 08:29:23', '2022-10-26 08:29:23'),
(119, 39, 500.00, NULL, NULL, 10, '2022-10-26 08:29:23', '2022-10-26 08:29:23'),
(120, 40, 2000.00, NULL, NULL, 9, '2022-11-15 18:11:34', '2022-11-15 18:11:34'),
(121, 41, 800.00, NULL, NULL, 7, '2022-11-20 16:34:09', '2022-11-20 16:34:09'),
(122, 41, 800.00, NULL, NULL, 8, '2022-11-20 16:34:09', '2022-11-20 16:34:09'),
(123, 42, 700.00, NULL, NULL, 4, '2022-11-27 17:16:57', '2022-11-27 17:16:57'),
(124, 42, 700.00, NULL, NULL, 5, '2022-11-27 17:16:57', '2022-11-27 17:16:57'),
(126, 44, 800.00, NULL, NULL, 7, '2022-12-02 16:59:53', '2022-12-02 16:59:53'),
(127, 44, 800.00, NULL, NULL, 8, '2022-12-02 16:59:53', '2022-12-02 16:59:53'),
(128, 44, 800.00, NULL, NULL, 9, '2022-12-02 16:59:53', '2022-12-02 16:59:53'),
(129, 45, 600.00, NULL, NULL, 11, '2022-12-02 21:51:12', '2022-12-02 21:51:12'),
(130, 46, 500.00, 0.00, 0.00, 0, '2022-12-03 22:54:52', '2022-12-03 22:54:52'),
(131, 47, 700.00, NULL, NULL, 0, '2023-01-02 19:13:45', '2023-01-02 19:13:45'),
(132, 48, 700.00, NULL, NULL, 0, '2023-01-30 10:16:47', '2023-01-30 10:16:47'),
(133, 48, 700.00, NULL, NULL, 1, '2023-01-30 10:16:47', '2023-01-30 10:16:47'),
(134, 49, 500.00, 0.00, NULL, NULL, '2023-01-30 10:17:54', '2023-01-30 10:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user-index', 'web', '2022-09-21 05:23:02', '2022-09-21 05:23:02'),
(2, 'user-create', 'web', '2022-09-21 05:23:02', '2022-09-21 05:23:02'),
(3, 'user-update', 'web', '2022-09-21 05:23:02', '2022-09-21 05:23:02'),
(4, 'user-destroy', 'web', '2022-09-21 05:23:02', '2022-09-21 05:23:02'),
(5, 'role-index', 'web', '2022-09-21 05:23:02', '2022-09-21 05:23:02'),
(6, 'role-create', 'web', '2022-09-21 05:23:02', '2022-09-21 05:23:02'),
(7, 'role-update', 'web', '2022-09-21 05:23:03', '2022-09-21 05:23:03'),
(8, 'role-destroy', 'web', '2022-09-21 05:23:03', '2022-09-21 05:23:03'),
(9, 'institution-index', 'web', '2022-09-21 05:23:03', '2022-09-21 05:23:03'),
(10, 'institution-create', 'web', '2022-09-21 05:23:03', '2022-09-21 05:23:03'),
(11, 'institution-update', 'web', '2022-09-21 05:23:03', '2022-09-21 05:23:03'),
(12, 'institution-destroy', 'web', '2022-09-21 05:23:03', '2022-09-21 05:23:03'),
(13, 'batch-index', 'web', '2022-09-21 05:23:04', '2022-09-21 05:23:04'),
(14, 'batch-create', 'web', '2022-09-21 05:23:04', '2022-09-21 05:23:04'),
(15, 'batch-update', 'web', '2022-09-21 05:23:04', '2022-09-21 05:23:04'),
(16, 'batch-destroy', 'web', '2022-09-21 05:23:04', '2022-09-21 05:23:04'),
(17, 'student-index', 'web', '2022-09-21 05:23:04', '2022-09-21 05:23:04'),
(18, 'student-create', 'web', '2022-09-21 05:23:04', '2022-09-21 05:23:04'),
(19, 'student-update', 'web', '2022-09-21 05:23:04', '2022-09-21 05:23:04'),
(20, 'student-destroy', 'web', '2022-09-21 05:23:04', '2022-09-21 05:23:04'),
(21, 'payment-index', 'web', '2022-09-21 05:23:05', '2022-09-21 05:23:05'),
(22, 'payment-create', 'web', '2022-09-21 05:23:05', '2022-09-21 05:23:05'),
(23, 'payment-update', 'web', '2022-09-21 05:23:05', '2022-09-21 05:23:05'),
(24, 'payment-destroy', 'web', '2022-09-21 05:23:05', '2022-09-21 05:23:05'),
(25, 'report-student', 'web', '2022-09-21 05:23:05', '2022-09-21 05:23:05'),
(26, 'report-payment', 'web', '2022-09-21 05:23:05', '2022-09-21 05:23:05'),
(27, 'report-batch', 'web', '2022-09-21 05:23:05', '2022-09-21 05:23:05'),
(28, 'report-user', 'web', '2022-09-21 05:23:05', '2022-09-21 05:23:05'),
(29, 'miscellaneous-general_setting', 'web', '2022-09-21 05:23:06', '2022-09-21 05:23:06'),
(30, 'miscellaneous-database_backup', 'web', '2022-09-21 05:23:06', '2022-09-21 05:23:06'),
(31, 'miscellaneous-institution_setting', 'web', '2022-09-21 05:25:13', '2022-09-21 05:25:13'),
(32, 'miscellaneous-user_permission', 'web', '2022-09-21 05:25:14', '2022-09-21 05:25:14'),
(33, 'miscellaneous-login_as_ins', 'web', '2022-10-17 20:18:48', '2022-10-17 20:18:48'),
(34, 'miscellaneous-show_psw', 'web', '2022-10-17 20:18:48', '2022-10-17 20:18:48'),
(35, 'report-student_payment', 'web', '2022-10-18 19:46:14', '2022-10-18 19:46:14'),
(36, 'sms-index', 'web', '2022-11-20 16:07:58', '2022-11-20 16:07:58'),
(37, 'sms-create', 'web', '2022-11-20 16:07:58', '2022-11-20 16:07:58'),
(38, 'sms-update', 'web', '2022-11-20 16:07:58', '2022-11-20 16:07:58'),
(39, 'sms-destroy', 'web', '2022-11-20 16:07:58', '2022-11-20 16:07:58'),
(40, 'miscellaneous-custom_sms_send', 'web', '2022-11-20 16:10:24', '2022-11-20 16:10:24'),
(41, 'miscellaneous-sms_history', 'web', '2022-11-20 16:10:24', '2022-11-20 16:10:24'),
(42, 'miscellaneous-sms_template', 'web', '2022-11-20 16:10:24', '2022-11-20 16:10:24'),
(43, 'miscellaneous-sms_buy', 'web', '2022-11-20 16:10:24', '2022-11-20 16:10:24'),
(44, 'miscellaneous-sms_purchase_history', 'web', '2022-11-20 16:10:24', '2022-11-20 16:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2022-09-21 05:23:01', '2022-09-21 05:23:01'),
(2, 'Admin', 'web', '2022-09-21 05:23:01', '2022-09-21 05:23:01'),
(3, 'Student', 'web', '2022-09-21 05:23:01', '2022-09-21 05:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 2),
(26, 2),
(29, 1),
(30, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(34, 1),
(35, 2),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 2),
(41, 2),
(42, 2),
(43, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED DEFAULT 0,
  `title` varchar(125) DEFAULT NULL,
  `facebook` varchar(125) DEFAULT NULL,
  `phone` varchar(125) DEFAULT NULL,
  `email` varchar(125) DEFAULT NULL,
  `timezone` char(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `is_maitanence_mood` tinyint(1) NOT NULL DEFAULT 0,
  `currency` char(10) NOT NULL DEFAULT 'BDT',
  `active_sms` tinyint(1) NOT NULL DEFAULT 0,
  `user_manual_file_link` varchar(120) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `institution_id`, `title`, `facebook`, `phone`, `email`, `timezone`, `address`, `is_maitanence_mood`, `currency`, `active_sms`, `user_manual_file_link`, `created_at`, `updated_at`) VALUES
(1, 0, 'পেমেন্ট সিস্টেম', NULL, NULL, NULL, 'Asia/Dhaka', NULL, 0, 'BDT', 0, 'https://docs.google.com/document/d/1q-ZsIB_Ailo9QeER04Qmwg-JCTL6-nyFtv_karTWQrI/edit?usp=sharing', '2022-09-21 05:23:06', '2023-01-29 16:15:01');

-- --------------------------------------------------------

--
-- Table structure for table `sms_histories`
--

CREATE TABLE `sms_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `mobile_nmber` char(15) DEFAULT NULL,
  `sms_count` char(1) NOT NULL DEFAULT '1',
  `sms_send_id` char(35) DEFAULT NULL,
  `is_send` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=yes,0=no',
  `message` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_histories`
--

INSERT INTO `sms_histories` (`id`, `institution_id`, `student_id`, `mobile_nmber`, `sms_count`, `sms_send_id`, `is_send`, `message`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '01307035688', '1', '90enp26684qa04k04cgo0s', 1, 'Hello হাসান আলী,\n            Your payment 1600 received by Alamgir Hasan. \n            thanks!\n            From- My Institution', 3, '2022-11-20 16:34:10', '2022-11-20 16:34:10'),
(2, 2, 4, '01307035688', '2', '9093o8kh4hm8sggw84so4o', 1, 'Hello হাসান আলী,\n            Your unique id is 296649 and pin is 2120. Please don\'t forgot this credential. Click here for login https://smartqb.info/student-panel/login.\n            From- গল্প কোচিং-টেস্ট.', 3, '2022-11-20 16:39:22', '2022-11-20 16:39:22'),
(3, 3, 119, '01556306432', '2', '90nui5gy8ae40sc8g8sw80', 1, 'Hello Rahim,\n            Your unique id is 182693 and pin is 8659. Please don\'t forgot this credential. Click here for login https://smartqb.info/student-panel/login.\n            From- My Institution.', 4, '2022-11-20 17:39:40', '2022-11-20 17:39:40'),
(4, 3, 6, '01718075903', '2', '90lzqb5t2otxs808sg4s8o', 1, 'Hello সুজানা রুহী,\n            Your unique id is 141292 and pin is 4323. Please don\'t forgot this credential. Click here for login https://smartqb.info/student-panel/login.\n            From- My Institution.', 4, '2022-11-20 17:40:49', '2022-11-20 17:40:49'),
(5, 3, 6, '01718075903', '1', '90aq8psbkf6zso48go8o4c', 1, 'Hello সুজানা রুহী,\n            Our institution will be off on 16th December!\n            From - My Institution.', 4, '2022-11-23 19:47:48', '2022-11-23 19:47:48'),
(6, 3, 119, '01556306432', '1', '90jzp15pz932occskgw0gw', 1, 'Hello Rahim,\n            Our institution will be off on 16th December!\n            From - My Institution.', 4, '2022-11-23 19:47:49', '2022-11-23 19:47:49'),
(7, 3, 124, '01851447760', '1', '9042x4e9wcc2ckossoss80', 1, 'Hello Rahim,\n            Our institution will be off on 16th December!\n            From - My Institution.', 4, '2022-11-23 19:47:50', '2022-11-23 19:47:50'),
(8, 3, 119, '01307035688', '1', 'N/A', 1, 'Hello Arman Ali,\n            Our institution will be off on 16th December!\n            From - Y Institution.', 4, '2023-01-30 10:02:35', '2023-01-30 10:02:35'),
(9, 3, 6, '01718075903', '1', 'N/A', 1, 'Hello সুজানা রুহী,\n            Our institution will be off on 16th December!\n            From - Y Institution.', 4, '2023-01-30 10:10:50', '2023-01-30 10:10:50'),
(10, 3, 6, '01718075903', '1', 'N/A', 1, 'Hello সুজানা রুহী,\n            Our institution will be off on 16th December!\n            From - Y Institution.', 4, '2023-01-30 10:12:16', '2023-01-30 10:12:16'),
(11, 3, 124, '01851447760', '1', 'N/A', 1, 'this is test message', 4, '2023-01-30 10:15:04', '2023-01-30 10:15:04'),
(12, 3, 124, '01851447760', '1', 'N/A', 1, 'Hello Rahim,\n            Your payment 1400 received by Yousuf. \n            thanks!\n            From- Y Institution', 4, '2023-01-30 10:16:48', '2023-01-30 10:16:48'),
(13, 3, 119, '01307035688', '1', 'N/A', 1, 'Hello Arman Ali,\n            Your payment 500.00 received by Yousuf. \n            thanks!\n            From- Y Institution', 4, '2023-01-30 10:17:56', '2023-01-30 10:17:56'),
(14, 3, 6, '01718075903', '1', 'N/A', 1, 'Hello সুজানা রুহী,\n            Our institution will be off on 16th December!\n            From - Y Institution.', 4, '2023-01-30 10:27:38', '2023-01-30 10:27:38'),
(15, 3, 119, '01307035688', '1', 'N/A', 1, 'Hello Arman Ali,\n            Our institution will be off on 16th December!\n            From - Y Institution.', 4, '2023-01-30 16:43:51', '2023-01-30 16:43:51'),
(16, 62, 136, '01718217423', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:16', '2023-01-31 15:40:16'),
(17, 62, 137, '01718217423', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:17', '2023-01-31 15:40:17'),
(18, 62, 138, '01711592059', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:18', '2023-01-31 15:40:18'),
(19, 62, 139, '01721311210', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:19', '2023-01-31 15:40:19'),
(20, 62, 140, '01734393745', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:20', '2023-01-31 15:40:20'),
(21, 62, 141, '01735857772', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:22', '2023-01-31 15:40:22'),
(22, 62, 142, '01918792907', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:23', '2023-01-31 15:40:23'),
(23, 62, 143, '01310394749', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:24', '2023-01-31 15:40:24'),
(24, 62, 144, '01718384749', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:25', '2023-01-31 15:40:25'),
(25, 62, 145, '01725706609', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:27', '2023-01-31 15:40:27'),
(26, 62, 146, '01301645366', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:28', '2023-01-31 15:40:28'),
(27, 62, 147, '01734940591', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:29', '2023-01-31 15:40:29'),
(28, 62, 148, '01726136346', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:30', '2023-01-31 15:40:30'),
(29, 62, 149, '01751847818', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:31', '2023-01-31 15:40:31'),
(30, 62, 150, '01784132627', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:33', '2023-01-31 15:40:33'),
(31, 62, 151, '01779823481', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:34', '2023-01-31 15:40:34'),
(32, 62, 152, '01787578193', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:35', '2023-01-31 15:40:35'),
(33, 62, 153, '01793238771', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:36', '2023-01-31 15:40:36'),
(34, 62, 154, '01718586564', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:38', '2023-01-31 15:40:38'),
(35, 62, 155, '01756230602', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:39', '2023-01-31 15:40:39'),
(36, 62, 156, '01731851553', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:40', '2023-01-31 15:40:40'),
(37, 62, 157, '01718384749', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:41', '2023-01-31 15:40:41'),
(38, 62, 158, '01715767871', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:42', '2023-01-31 15:40:42'),
(39, 62, 159, '01714365693', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:44', '2023-01-31 15:40:44'),
(40, 62, 160, '01736711964', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:45', '2023-01-31 15:40:45'),
(41, 62, 161, '01701407792', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:46', '2023-01-31 15:40:46'),
(42, 62, 162, '01703100564', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:47', '2023-01-31 15:40:47'),
(43, 62, 163, '01762078151', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:48', '2023-01-31 15:40:48'),
(44, 62, 164, '01726089341', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:49', '2023-01-31 15:40:49'),
(45, 62, 165, '01712224677', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:51', '2023-01-31 15:40:51'),
(46, 62, 166, '01725010894', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:52', '2023-01-31 15:40:52'),
(47, 62, 167, '01914431245', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:53', '2023-01-31 15:40:53'),
(48, 62, 168, '01723797967', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:54', '2023-01-31 15:40:54'),
(49, 62, 169, '01717044982', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:56', '2023-01-31 15:40:56'),
(50, 62, 170, '01739827200', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:57', '2023-01-31 15:40:57'),
(51, 62, 171, '01745362437', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:40:58', '2023-01-31 15:40:58'),
(52, 62, 172, '01317818827', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:00', '2023-01-31 15:41:00'),
(53, 62, 173, '01749564778', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:01', '2023-01-31 15:41:01'),
(54, 62, 174, '01921407641', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:03', '2023-01-31 15:41:03'),
(55, 62, 175, '01732885858', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:04', '2023-01-31 15:41:04'),
(56, 62, 176, '01741876277', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:05', '2023-01-31 15:41:05'),
(57, 62, 177, '01715427870', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:06', '2023-01-31 15:41:06'),
(58, 62, 178, '01731251444', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:08', '2023-01-31 15:41:08'),
(59, 62, 179, '01712488510', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:09', '2023-01-31 15:41:09'),
(60, 62, 180, '01719804641', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:10', '2023-01-31 15:41:10'),
(61, 62, 181, '01757849429', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:11', '2023-01-31 15:41:11'),
(62, 62, 182, '01746767016', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:12', '2023-01-31 15:41:12'),
(63, 62, 183, '01799682515', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:14', '2023-01-31 15:41:14'),
(64, 62, 184, '01785972606', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:15', '2023-01-31 15:41:15'),
(65, 62, 185, '01874096421', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:16', '2023-01-31 15:41:16'),
(66, 62, 186, '01742658815', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:17', '2023-01-31 15:41:17'),
(67, 62, 187, '01742658815', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:18', '2023-01-31 15:41:18'),
(68, 62, 188, '01926176524', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:20', '2023-01-31 15:41:20'),
(69, 62, 189, '01763643987', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:21', '2023-01-31 15:41:21'),
(70, 62, 190, '01776147862', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:22', '2023-01-31 15:41:22'),
(71, 62, 191, '01728157962', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:23', '2023-01-31 15:41:23'),
(72, 62, 192, '01729182970', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:24', '2023-01-31 15:41:24'),
(73, 62, 193, '01732692706', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:26', '2023-01-31 15:41:26'),
(74, 62, 194, '01741147926', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:28', '2023-01-31 15:41:28'),
(75, 62, 195, '01710654448', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:29', '2023-01-31 15:41:29'),
(76, 62, 196, '01750690547', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:30', '2023-01-31 15:41:30'),
(77, 62, 197, '01734965982', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:31', '2023-01-31 15:41:31'),
(78, 62, 198, '01727657763', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:33', '2023-01-31 15:41:33'),
(79, 62, 199, '01745420851', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:34', '2023-01-31 15:41:34'),
(80, 62, 200, '01911961197', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:35', '2023-01-31 15:41:35'),
(81, 62, 201, '01823408270', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:36', '2023-01-31 15:41:36'),
(82, 62, 202, '01724004346', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:38', '2023-01-31 15:41:38'),
(83, 62, 203, '01713910441', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:39', '2023-01-31 15:41:39'),
(84, 62, 204, '01712283285', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:40', '2023-01-31 15:41:40'),
(85, 62, 205, '01884503612', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:41', '2023-01-31 15:41:41'),
(86, 62, 206, '01830406050', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:42', '2023-01-31 15:41:42'),
(87, 62, 207, '01850511837', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:44', '2023-01-31 15:41:44'),
(88, 62, 208, '01830625186', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:45', '2023-01-31 15:41:45'),
(89, 62, 209, '01819150139', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:46', '2023-01-31 15:41:46'),
(90, 62, 210, '01988098579', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:47', '2023-01-31 15:41:47'),
(91, 62, 211, '01855773432', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:48', '2023-01-31 15:41:48'),
(92, 62, 212, '01875794059', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:50', '2023-01-31 15:41:50'),
(93, 62, 213, '01815460658', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:51', '2023-01-31 15:41:51'),
(94, 62, 214, '01967523053', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:52', '2023-01-31 15:41:52'),
(95, 62, 215, '01885564245', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:53', '2023-01-31 15:41:53'),
(96, 62, 216, '01823297069', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:55', '2023-01-31 15:41:55'),
(97, 62, 217, '01911241200', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:56', '2023-01-31 15:41:56'),
(98, 62, 218, '01882919589', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:57', '2023-01-31 15:41:57'),
(99, 62, 219, '01885577410', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:58', '2023-01-31 15:41:58'),
(100, 62, 220, '01812461065', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:41:59', '2023-01-31 15:41:59'),
(101, 62, 221, '01884631700', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:01', '2023-01-31 15:42:01'),
(102, 62, 222, '01859154695', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:02', '2023-01-31 15:42:02'),
(103, 62, 223, '01893868200', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:03', '2023-01-31 15:42:03'),
(104, 62, 224, '01925215029', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:04', '2023-01-31 15:42:04'),
(105, 62, 225, '01714915812', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:06', '2023-01-31 15:42:06'),
(106, 62, 226, '01950773804', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:07', '2023-01-31 15:42:07'),
(107, 62, 227, '01723241532', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:08', '2023-01-31 15:42:08'),
(108, 62, 228, '01925686122', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:09', '2023-01-31 15:42:09'),
(109, 62, 229, '01708707664', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:10', '2023-01-31 15:42:10'),
(110, 62, 230, '01757777263', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:11', '2023-01-31 15:42:11'),
(111, 62, 231, '01761548901', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:12', '2023-01-31 15:42:12'),
(112, 62, 232, '01948133227', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:14', '2023-01-31 15:42:14'),
(113, 62, 233, '01712591888', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:15', '2023-01-31 15:42:15'),
(114, 62, 234, '01748641200', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:16', '2023-01-31 15:42:16'),
(115, 62, 235, '01789607141', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:17', '2023-01-31 15:42:17'),
(116, 62, 236, '01790695933', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:19', '2023-01-31 15:42:19'),
(117, 62, 237, '01749564778', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:20', '2023-01-31 15:42:20'),
(118, 62, 238, '01741904134', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:21', '2023-01-31 15:42:21'),
(119, 62, 239, '01816136974', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:22', '2023-01-31 15:42:22'),
(120, 62, 240, '01829205692', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:24', '2023-01-31 15:42:24'),
(121, 62, 241, '01712015393', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:25', '2023-01-31 15:42:25'),
(122, 62, 242, '01777503479', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:27', '2023-01-31 15:42:27'),
(123, 62, 243, '01735817949', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:29', '2023-01-31 15:42:29'),
(124, 62, 244, '01746767016', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:30', '2023-01-31 15:42:30'),
(125, 62, 245, '01747102159', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:31', '2023-01-31 15:42:31'),
(126, 62, 246, '01720315107', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:32', '2023-01-31 15:42:32'),
(127, 62, 247, '01940275227', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:34', '2023-01-31 15:42:34'),
(128, 62, 248, '01926305455', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:35', '2023-01-31 15:42:35'),
(129, 62, 249, '01917047969', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:36', '2023-01-31 15:42:36'),
(130, 62, 250, '01715434120', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:37', '2023-01-31 15:42:37'),
(131, 62, 251, '01928456377', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:39', '2023-01-31 15:42:39'),
(132, 62, 252, '01763737675', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:40', '2023-01-31 15:42:40'),
(133, 62, 253, '01913809103', '5', 'N/A', 1, 'ওঁম্ মা বাবা, শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ ছাগলদী, নগরকান্দা, ফরিদপুর, আশ্রমের সম্মানিত ভক্তবৃন্দদের এস এম এস অ্যালার্ট এ সুস্বাগতম। এখন থেকে আশ্রমের বিবিধ বিষয়ের খবরা-খবর আপনারা এস এম এস এর মাধ্যমে জানতে পারবেন । জয় মা বাবা। \r\nসেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 15:42:41', '2023-01-31 15:42:41'),
(134, 62, 136, '01718217423', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা  হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:33:37', '2023-01-31 18:33:37'),
(135, 62, 137, '01718217423', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:39', '2023-01-31 18:43:39'),
(136, 62, 138, '01711592059', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:40', '2023-01-31 18:43:40'),
(137, 62, 139, '01721311210', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:41', '2023-01-31 18:43:41'),
(138, 62, 140, '01734393745', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:42', '2023-01-31 18:43:42'),
(139, 62, 141, '01735857772', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:43', '2023-01-31 18:43:43'),
(140, 62, 142, '01918792907', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:45', '2023-01-31 18:43:45'),
(141, 62, 143, '01310394749', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:46', '2023-01-31 18:43:46'),
(142, 62, 144, '01718384749', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:47', '2023-01-31 18:43:47'),
(143, 62, 145, '01725706609', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:48', '2023-01-31 18:43:48'),
(144, 62, 146, '01301645366', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:49', '2023-01-31 18:43:49');
INSERT INTO `sms_histories` (`id`, `institution_id`, `student_id`, `mobile_nmber`, `sms_count`, `sms_send_id`, `is_send`, `message`, `created_by`, `created_at`, `updated_at`) VALUES
(145, 62, 147, '01734940591', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:51', '2023-01-31 18:43:51'),
(146, 62, 148, '01726136346', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:52', '2023-01-31 18:43:52'),
(147, 62, 149, '01751847818', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:54', '2023-01-31 18:43:54'),
(148, 62, 150, '01784132627', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:55', '2023-01-31 18:43:55'),
(149, 62, 151, '01779823481', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:56', '2023-01-31 18:43:56'),
(150, 62, 152, '01787578193', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:57', '2023-01-31 18:43:57'),
(151, 62, 153, '01793238771', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:58', '2023-01-31 18:43:58'),
(152, 62, 154, '01718586564', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:43:59', '2023-01-31 18:43:59'),
(153, 62, 155, '01756230602', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:01', '2023-01-31 18:44:01'),
(154, 62, 156, '01731851553', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:02', '2023-01-31 18:44:02'),
(155, 62, 157, '01718384749', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:03', '2023-01-31 18:44:03'),
(156, 62, 158, '01715767871', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:04', '2023-01-31 18:44:04'),
(157, 62, 159, '01714365693', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:06', '2023-01-31 18:44:06'),
(158, 62, 160, '01736711964', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:07', '2023-01-31 18:44:07'),
(159, 62, 161, '01701407792', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:09', '2023-01-31 18:44:09'),
(160, 62, 162, '01703100564', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:11', '2023-01-31 18:44:11'),
(161, 62, 163, '01762078151', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:12', '2023-01-31 18:44:12'),
(162, 62, 164, '01726089341', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:14', '2023-01-31 18:44:14'),
(163, 62, 165, '01712224677', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:15', '2023-01-31 18:44:15'),
(164, 62, 166, '01725010894', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:17', '2023-01-31 18:44:17'),
(165, 62, 167, '01914431245', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:18', '2023-01-31 18:44:18'),
(166, 62, 168, '01723797967', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:20', '2023-01-31 18:44:20'),
(167, 62, 169, '01717044982', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:21', '2023-01-31 18:44:21'),
(168, 62, 170, '01739827200', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:23', '2023-01-31 18:44:23'),
(169, 62, 171, '01745362437', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:24', '2023-01-31 18:44:24'),
(170, 62, 172, '01317818827', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:26', '2023-01-31 18:44:26'),
(171, 62, 173, '01749564778', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:27', '2023-01-31 18:44:27'),
(172, 62, 174, '01921407641', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:29', '2023-01-31 18:44:29'),
(173, 62, 175, '01732885858', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:31', '2023-01-31 18:44:31'),
(174, 62, 176, '01741876277', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:32', '2023-01-31 18:44:32'),
(175, 62, 177, '01715427870', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:34', '2023-01-31 18:44:34'),
(176, 62, 178, '01731251444', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:35', '2023-01-31 18:44:35'),
(177, 62, 179, '01712488510', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:37', '2023-01-31 18:44:37'),
(178, 62, 180, '01719804641', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:38', '2023-01-31 18:44:38'),
(179, 62, 181, '01757849429', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:40', '2023-01-31 18:44:40'),
(180, 62, 182, '01746767016', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:41', '2023-01-31 18:44:41'),
(181, 62, 183, '01799682515', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:42', '2023-01-31 18:44:42'),
(182, 62, 184, '01785972606', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:44', '2023-01-31 18:44:44'),
(183, 62, 185, '01874096421', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:45', '2023-01-31 18:44:45'),
(184, 62, 186, '01742658815', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:47', '2023-01-31 18:44:47'),
(185, 62, 187, '01742658815', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:49', '2023-01-31 18:44:49'),
(186, 62, 188, '01926176524', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:50', '2023-01-31 18:44:50'),
(187, 62, 189, '01763643987', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:51', '2023-01-31 18:44:51'),
(188, 62, 190, '01776147862', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:52', '2023-01-31 18:44:52'),
(189, 62, 191, '01728157962', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:54', '2023-01-31 18:44:54'),
(190, 62, 192, '01729182970', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:55', '2023-01-31 18:44:55'),
(191, 62, 193, '01732692706', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:56', '2023-01-31 18:44:56'),
(192, 62, 194, '01741147926', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:57', '2023-01-31 18:44:57'),
(193, 62, 195, '01710654448', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:44:59', '2023-01-31 18:44:59'),
(194, 62, 196, '01750690547', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:00', '2023-01-31 18:45:00'),
(195, 62, 197, '01734965982', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:01', '2023-01-31 18:45:01'),
(196, 62, 198, '01727657763', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:02', '2023-01-31 18:45:02'),
(197, 62, 199, '01745420851', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:03', '2023-01-31 18:45:03'),
(198, 62, 200, '01911961197', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:05', '2023-01-31 18:45:05'),
(199, 62, 201, '01823408270', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:06', '2023-01-31 18:45:06'),
(200, 62, 202, '01724004346', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:07', '2023-01-31 18:45:07'),
(201, 62, 203, '01713910441', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:09', '2023-01-31 18:45:09'),
(202, 62, 204, '01712283285', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:10', '2023-01-31 18:45:10'),
(203, 62, 205, '01884503612', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:12', '2023-01-31 18:45:12'),
(204, 62, 206, '01830406050', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:13', '2023-01-31 18:45:13'),
(205, 62, 207, '01850511837', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:15', '2023-01-31 18:45:15'),
(206, 62, 208, '01830625186', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:16', '2023-01-31 18:45:16'),
(207, 62, 209, '01819150139', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:18', '2023-01-31 18:45:18'),
(208, 62, 210, '01988098579', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:19', '2023-01-31 18:45:19'),
(209, 62, 211, '01855773432', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:21', '2023-01-31 18:45:21'),
(210, 62, 212, '01875794059', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:22', '2023-01-31 18:45:22'),
(211, 62, 213, '01815460658', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:24', '2023-01-31 18:45:24'),
(212, 62, 214, '01967523053', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:25', '2023-01-31 18:45:25'),
(213, 62, 215, '01885564245', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:27', '2023-01-31 18:45:27'),
(214, 62, 216, '01823297069', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:28', '2023-01-31 18:45:28'),
(215, 62, 217, '01911241200', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:30', '2023-01-31 18:45:30'),
(216, 62, 218, '01882919589', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:31', '2023-01-31 18:45:31'),
(217, 62, 219, '01885577410', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:32', '2023-01-31 18:45:32'),
(218, 62, 220, '01812461065', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:34', '2023-01-31 18:45:34'),
(219, 62, 221, '01884631700', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:35', '2023-01-31 18:45:35'),
(220, 62, 222, '01859154695', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:36', '2023-01-31 18:45:36'),
(221, 62, 223, '01893868200', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:37', '2023-01-31 18:45:37'),
(222, 62, 224, '01925215029', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:38', '2023-01-31 18:45:38'),
(223, 62, 225, '01714915812', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:40', '2023-01-31 18:45:40'),
(224, 62, 226, '01950773804', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:41', '2023-01-31 18:45:41'),
(225, 62, 227, '01723241532', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:42', '2023-01-31 18:45:42'),
(226, 62, 228, '01925686122', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:44', '2023-01-31 18:45:44'),
(227, 62, 229, '01708707664', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:45', '2023-01-31 18:45:45'),
(228, 62, 230, '01757777263', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:46', '2023-01-31 18:45:46'),
(229, 62, 231, '01761548901', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:47', '2023-01-31 18:45:47'),
(230, 62, 232, '01948133227', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:48', '2023-01-31 18:45:48'),
(231, 62, 233, '01712591888', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:49', '2023-01-31 18:45:49'),
(232, 62, 234, '01748641200', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:51', '2023-01-31 18:45:51'),
(233, 62, 235, '01789607141', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:52', '2023-01-31 18:45:52'),
(234, 62, 236, '01790695933', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:53', '2023-01-31 18:45:53'),
(235, 62, 237, '01749564778', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:54', '2023-01-31 18:45:54'),
(236, 62, 238, '01741904134', '4', 'N/A', 1, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(237, 62, 239, '01816136974', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(238, 62, 240, '01829205692', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(239, 62, 241, '01712015393', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(240, 62, 242, '01777503479', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(241, 62, 243, '01735817949', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(242, 62, 244, '01746767016', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(243, 62, 245, '01747102159', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(244, 62, 246, '01720315107', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(245, 62, 247, '01940275227', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(246, 62, 248, '01926305455', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(247, 62, 249, '01917047969', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(248, 62, 250, '01715434120', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(249, 62, 251, '01928456377', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(250, 62, 252, '01763737675', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(251, 62, 253, '01913809103', '4', 'N/A', 0, 'আগামী শনিবার (০৪/০২/২০২৩ খ্রিষ্টাব্দ) তারিখ আশ্রমে উন্নয়নমূলক কাজের শুভ উদ্বোধন এবং মাঘী পূর্ণিমা উপলক্ষে ভক্তবৃন্দদের শ্রদ্ধার সহিত উপস্থিত থাকার জন্য বলা হলো ।সেন্ডারঃ ব্রজেশ্বরী যোগানন্দ আশ্রম।', 67, '2023-01-31 18:45:56', '2023-01-31 18:45:56'),
(252, 62, 136, '01718217423', '4', 'N/A', 0, 'ওঁম্ মা-বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত।\r\nসেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:46:55', '2023-03-05 18:50:52'),
(253, 62, 136, '01718217423', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:20', '2023-03-05 18:55:20'),
(254, 62, 137, '01718217423', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:21', '2023-03-05 18:55:21'),
(255, 62, 138, '01711592059', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:23', '2023-03-05 18:55:23'),
(256, 62, 139, '01721311210', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:24', '2023-03-05 18:55:24'),
(257, 62, 140, '01734393745', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:26', '2023-03-05 18:55:26'),
(258, 62, 141, '01735857772', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:27', '2023-03-05 18:55:27'),
(259, 62, 142, '01918792907', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:29', '2023-03-05 18:55:29'),
(260, 62, 143, '01310394749', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:30', '2023-03-05 18:55:30'),
(261, 62, 144, '01718384749', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:32', '2023-03-05 18:55:32'),
(262, 62, 145, '01725706609', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:34', '2023-03-05 18:55:34'),
(263, 62, 146, '01301645366', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:35', '2023-03-05 18:55:35'),
(264, 62, 147, '01734940591', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:37', '2023-03-05 18:55:37'),
(265, 62, 148, '01726136346', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:38', '2023-03-05 18:55:38'),
(266, 62, 149, '01751847818', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:40', '2023-03-05 18:55:40'),
(267, 62, 150, '01784132627', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:41', '2023-03-05 18:55:41'),
(268, 62, 151, '01779823481', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:43', '2023-03-05 18:55:43'),
(269, 62, 152, '01787578193', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:45', '2023-03-05 18:55:45'),
(270, 62, 153, '01793238771', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:46', '2023-03-05 18:55:46'),
(271, 62, 154, '01718586564', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:48', '2023-03-05 18:55:48'),
(272, 62, 155, '01756230602', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:49', '2023-03-05 18:55:49'),
(273, 62, 156, '01731851553', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:50', '2023-03-05 18:55:50'),
(274, 62, 157, '01718384749', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:52', '2023-03-05 18:55:52'),
(275, 62, 158, '01715767871', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:54', '2023-03-05 18:55:54'),
(276, 62, 159, '01714365693', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:56', '2023-03-05 18:55:56'),
(277, 62, 160, '01736711964', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:57', '2023-03-05 18:55:57'),
(278, 62, 161, '01701407792', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:55:59', '2023-03-05 18:55:59'),
(279, 62, 162, '01703100564', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:00', '2023-03-05 18:56:00'),
(280, 62, 163, '01762078151', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:02', '2023-03-05 18:56:02'),
(281, 62, 164, '01726089341', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:03', '2023-03-05 18:56:03'),
(282, 62, 165, '01712224677', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:05', '2023-03-05 18:56:05'),
(283, 62, 166, '01725010894', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:07', '2023-03-05 18:56:07'),
(284, 62, 167, '01914431245', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:09', '2023-03-05 18:56:09'),
(285, 62, 168, '01723797967', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:10', '2023-03-05 18:56:10'),
(286, 62, 169, '01717044982', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:12', '2023-03-05 18:56:12'),
(287, 62, 170, '01739827200', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:13', '2023-03-05 18:56:13'),
(288, 62, 171, '01745362437', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:15', '2023-03-05 18:56:15'),
(289, 62, 172, '01317818827', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:16', '2023-03-05 18:56:16'),
(290, 62, 173, '01749564778', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:18', '2023-03-05 18:56:18'),
(291, 62, 174, '01921407641', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:19', '2023-03-05 18:56:19'),
(292, 62, 175, '01732885858', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:21', '2023-03-05 18:56:21'),
(293, 62, 176, '01741876277', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:22', '2023-03-05 18:56:22'),
(294, 62, 177, '01715427870', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:24', '2023-03-05 18:56:24'),
(295, 62, 178, '01731251444', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:25', '2023-03-05 18:56:25'),
(296, 62, 179, '01712488510', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:27', '2023-03-05 18:56:27'),
(297, 62, 180, '01719804641', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:28', '2023-03-05 18:56:28'),
(298, 62, 181, '01757849429', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:30', '2023-03-05 18:56:30'),
(299, 62, 182, '01746767016', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:31', '2023-03-05 18:56:31'),
(300, 62, 183, '01799682515', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:33', '2023-03-05 18:56:33'),
(301, 62, 184, '01785972606', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:34', '2023-03-05 18:56:34'),
(302, 62, 185, '01874096421', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:36', '2023-03-05 18:56:36'),
(303, 62, 186, '01742658815', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:37', '2023-03-05 18:56:37'),
(304, 62, 187, '01742658815', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:40', '2023-03-05 18:56:40'),
(305, 62, 188, '01926176524', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:41', '2023-03-05 18:56:41');
INSERT INTO `sms_histories` (`id`, `institution_id`, `student_id`, `mobile_nmber`, `sms_count`, `sms_send_id`, `is_send`, `message`, `created_by`, `created_at`, `updated_at`) VALUES
(306, 62, 189, '01763643987', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:43', '2023-03-05 18:56:43'),
(307, 62, 190, '01776147862', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:44', '2023-03-05 18:56:44'),
(308, 62, 191, '01728157962', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:46', '2023-03-05 18:56:46'),
(309, 62, 192, '01729182970', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:47', '2023-03-05 18:56:47'),
(310, 62, 193, '01732692706', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:49', '2023-03-05 18:56:49'),
(311, 62, 194, '01741147926', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:50', '2023-03-05 18:56:50'),
(312, 62, 195, '01710654448', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:52', '2023-03-05 18:56:52'),
(313, 62, 196, '01750690547', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:54', '2023-03-05 18:56:54'),
(314, 62, 197, '01734965982', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:56', '2023-03-05 18:56:56'),
(315, 62, 198, '01727657763', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:58', '2023-03-05 18:56:58'),
(316, 62, 199, '01745420851', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:56:59', '2023-03-05 18:56:59'),
(317, 62, 200, '01911961197', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:01', '2023-03-05 18:57:01'),
(318, 62, 201, '01823408270', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:03', '2023-03-05 18:57:03'),
(319, 62, 202, '01724004346', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:04', '2023-03-05 18:57:04'),
(320, 62, 203, '01713910441', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:05', '2023-03-05 18:57:05'),
(321, 62, 204, '01712283285', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:07', '2023-03-05 18:57:07'),
(322, 62, 205, '01884503612', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:09', '2023-03-05 18:57:09'),
(323, 62, 206, '01830406050', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:10', '2023-03-05 18:57:10'),
(324, 62, 207, '01850511837', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:12', '2023-03-05 18:57:12'),
(325, 62, 208, '01830625186', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:13', '2023-03-05 18:57:13'),
(326, 62, 209, '01819150139', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:14', '2023-03-05 18:57:14'),
(327, 62, 210, '01988098579', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:16', '2023-03-05 18:57:16'),
(328, 62, 211, '01855773432', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:18', '2023-03-05 18:57:18'),
(329, 62, 212, '01875794059', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:19', '2023-03-05 18:57:19'),
(330, 62, 213, '01815460658', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:21', '2023-03-05 18:57:21'),
(331, 62, 214, '01967523053', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:22', '2023-03-05 18:57:22'),
(332, 62, 215, '01885564245', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:24', '2023-03-05 18:57:24'),
(333, 62, 216, '01823297069', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:25', '2023-03-05 18:57:25'),
(334, 62, 217, '01911241200', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:27', '2023-03-05 18:57:27'),
(335, 62, 218, '01882919589', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:28', '2023-03-05 18:57:28'),
(336, 62, 219, '01885577410', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:29', '2023-03-05 18:57:29'),
(337, 62, 220, '01812461065', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:31', '2023-03-05 18:57:31'),
(338, 62, 221, '01884631700', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:32', '2023-03-05 18:57:32'),
(339, 62, 222, '01859154695', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:34', '2023-03-05 18:57:34'),
(340, 62, 223, '01893868200', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:36', '2023-03-05 18:57:36'),
(341, 62, 224, '01925215029', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:37', '2023-03-05 18:57:37'),
(342, 62, 225, '01714915812', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:39', '2023-03-05 18:57:39'),
(343, 62, 226, '01950773804', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:40', '2023-03-05 18:57:40'),
(344, 62, 227, '01723241532', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:42', '2023-03-05 18:57:42'),
(345, 62, 228, '01925686122', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:43', '2023-03-05 18:57:43'),
(346, 62, 229, '01708707664', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:45', '2023-03-05 18:57:45'),
(347, 62, 230, '01757777263', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:46', '2023-03-05 18:57:46'),
(348, 62, 231, '01761548901', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:48', '2023-03-05 18:57:48'),
(349, 62, 232, '01948133227', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:49', '2023-03-05 18:57:49'),
(350, 62, 233, '01712591888', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:51', '2023-03-05 18:57:51'),
(351, 62, 234, '01748641200', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:53', '2023-03-05 18:57:53'),
(352, 62, 235, '01789607141', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:54', '2023-03-05 18:57:54'),
(353, 62, 236, '01790695933', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:56', '2023-03-05 18:57:56'),
(354, 62, 237, '01749564778', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:57', '2023-03-05 18:57:57'),
(355, 62, 238, '01741904134', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:57:59', '2023-03-05 18:57:59'),
(356, 62, 239, '01816136974', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:00', '2023-03-05 18:58:00'),
(357, 62, 240, '01829205692', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:02', '2023-03-05 18:58:02'),
(358, 62, 241, '01712015393', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:03', '2023-03-05 18:58:03'),
(359, 62, 242, '01777503479', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:05', '2023-03-05 18:58:05'),
(360, 62, 243, '01735817949', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:06', '2023-03-05 18:58:06'),
(361, 62, 244, '01746767016', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:08', '2023-03-05 18:58:08'),
(362, 62, 245, '01747102159', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:09', '2023-03-05 18:58:09'),
(363, 62, 246, '01720315107', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:11', '2023-03-05 18:58:11'),
(364, 62, 247, '01940275227', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:13', '2023-03-05 18:58:13'),
(365, 62, 248, '01926305455', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:14', '2023-03-05 18:58:14'),
(366, 62, 249, '01917047969', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:15', '2023-03-05 18:58:15'),
(367, 62, 250, '01715434120', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:17', '2023-03-05 18:58:17'),
(368, 62, 251, '01928456377', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:18', '2023-03-05 18:58:18'),
(369, 62, 252, '01763737675', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:20', '2023-03-05 18:58:20'),
(370, 62, 253, '01913809103', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:21', '2023-03-05 18:58:21'),
(371, 62, 297, '01706633528', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:23', '2023-03-05 18:58:23'),
(372, 62, 298, '01714926683', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:24', '2023-03-05 18:58:24'),
(373, 62, 299, '01309636477', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:26', '2023-03-05 18:58:26'),
(374, 62, 300, '01648397122', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:28', '2023-03-05 18:58:28'),
(375, 62, 301, '017188041279', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:28', '2023-03-05 18:58:28'),
(376, 62, 302, '01854572580', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:30', '2023-03-05 18:58:30'),
(377, 62, 303, '01787578193', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:31', '2023-03-05 18:58:31'),
(378, 62, 304, '01711134820', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:33', '2023-03-05 18:58:33'),
(379, 62, 305, '01728157962', '2', 'N/A', 1, 'ওঁম্ মা-বাবা \r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতামাতা &quot;শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ&quot;সহ সকল ভক্তবৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। সেন্ডারঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্ত বৃন্দ।', 67, '2023-03-05 18:58:35', '2023-03-05 18:58:35'),
(380, 62, 136, '01718217423', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:34', '2023-03-06 14:27:34'),
(381, 62, 137, '01718217423', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:36', '2023-03-06 14:27:36'),
(382, 62, 138, '01711592059', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:37', '2023-03-06 14:27:37'),
(383, 62, 139, '01721311210', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:39', '2023-03-06 14:27:39'),
(384, 62, 140, '01734393745', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:40', '2023-03-06 14:27:40'),
(385, 62, 141, '01735857772', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:42', '2023-03-06 14:27:42'),
(386, 62, 142, '01918792907', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:43', '2023-03-06 14:27:43'),
(387, 62, 143, '01310394749', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:44', '2023-03-06 14:27:44'),
(388, 62, 144, '01718384749', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:46', '2023-03-06 14:27:46'),
(389, 62, 145, '01725706609', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:47', '2023-03-06 14:27:47'),
(390, 62, 146, '01301645366', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:49', '2023-03-06 14:27:49'),
(391, 62, 147, '01734940591', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:50', '2023-03-06 14:27:50'),
(392, 62, 148, '01726136346', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:51', '2023-03-06 14:27:51'),
(393, 62, 149, '01751847818', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:53', '2023-03-06 14:27:53'),
(394, 62, 150, '01784132627', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:54', '2023-03-06 14:27:54'),
(395, 62, 151, '01779823481', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:56', '2023-03-06 14:27:56'),
(396, 62, 152, '01787578193', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:57', '2023-03-06 14:27:57'),
(397, 62, 153, '01793238771', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:27:59', '2023-03-06 14:27:59'),
(398, 62, 154, '01718586564', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:00', '2023-03-06 14:28:00'),
(399, 62, 155, '01756230602', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:02', '2023-03-06 14:28:02'),
(400, 62, 156, '01731851553', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:03', '2023-03-06 14:28:03'),
(401, 62, 157, '01718384749', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:05', '2023-03-06 14:28:05'),
(402, 62, 158, '01715767871', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:06', '2023-03-06 14:28:06'),
(403, 62, 159, '01714365693', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:08', '2023-03-06 14:28:08'),
(404, 62, 160, '01736711964', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:09', '2023-03-06 14:28:09'),
(405, 62, 161, '01701407792', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:11', '2023-03-06 14:28:11'),
(406, 62, 162, '01703100564', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:12', '2023-03-06 14:28:12'),
(407, 62, 163, '01762078151', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:14', '2023-03-06 14:28:14'),
(408, 62, 164, '01726089341', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:15', '2023-03-06 14:28:15'),
(409, 62, 165, '01712224677', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:17', '2023-03-06 14:28:17'),
(410, 62, 166, '01725010894', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:18', '2023-03-06 14:28:18'),
(411, 62, 167, '01914431245', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:20', '2023-03-06 14:28:20'),
(412, 62, 168, '01723797967', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:21', '2023-03-06 14:28:21'),
(413, 62, 169, '01717044982', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:23', '2023-03-06 14:28:23'),
(414, 62, 170, '01739827200', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:24', '2023-03-06 14:28:24'),
(415, 62, 171, '01745362437', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:26', '2023-03-06 14:28:26'),
(416, 62, 172, '01317818827', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:27', '2023-03-06 14:28:27'),
(417, 62, 173, '01749564778', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:29', '2023-03-06 14:28:29'),
(418, 62, 174, '01921407641', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:30', '2023-03-06 14:28:30'),
(419, 62, 175, '01732885858', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:31', '2023-03-06 14:28:31'),
(420, 62, 176, '01741876277', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:33', '2023-03-06 14:28:33'),
(421, 62, 177, '01715427870', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:34', '2023-03-06 14:28:34'),
(422, 62, 178, '01731251444', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:36', '2023-03-06 14:28:36'),
(423, 62, 179, '01712488510', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:38', '2023-03-06 14:28:38'),
(424, 62, 180, '01719804641', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:39', '2023-03-06 14:28:39'),
(425, 62, 181, '01757849429', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:41', '2023-03-06 14:28:41'),
(426, 62, 182, '01746767016', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:42', '2023-03-06 14:28:42'),
(427, 62, 183, '01799682515', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:44', '2023-03-06 14:28:44'),
(428, 62, 184, '01785972606', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:45', '2023-03-06 14:28:45'),
(429, 62, 185, '01874096421', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:47', '2023-03-06 14:28:47'),
(430, 62, 186, '01742658815', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:48', '2023-03-06 14:28:48'),
(431, 62, 187, '01742658815', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:50', '2023-03-06 14:28:50'),
(432, 62, 188, '01926176524', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:51', '2023-03-06 14:28:51'),
(433, 62, 189, '01763643987', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:52', '2023-03-06 14:28:52'),
(434, 62, 190, '01776147862', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:54', '2023-03-06 14:28:54'),
(435, 62, 191, '01728157962', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:55', '2023-03-06 14:28:55'),
(436, 62, 192, '01729182970', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:57', '2023-03-06 14:28:57'),
(437, 62, 193, '01732692706', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:28:58', '2023-03-06 14:28:58'),
(438, 62, 194, '01741147926', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:00', '2023-03-06 14:29:00'),
(439, 62, 195, '01710654448', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:01', '2023-03-06 14:29:01'),
(440, 62, 196, '01750690547', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:03', '2023-03-06 14:29:03'),
(441, 62, 197, '01734965982', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:04', '2023-03-06 14:29:04'),
(442, 62, 198, '01727657763', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:06', '2023-03-06 14:29:06'),
(443, 62, 199, '01745420851', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:09', '2023-03-06 14:29:09'),
(444, 62, 200, '01911961197', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:12', '2023-03-06 14:29:12'),
(445, 62, 201, '01823408270', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:15', '2023-03-06 14:29:15'),
(446, 62, 202, '01724004346', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:17', '2023-03-06 14:29:17'),
(447, 62, 203, '01713910441', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:19', '2023-03-06 14:29:19'),
(448, 62, 204, '01712283285', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:21', '2023-03-06 14:29:21'),
(449, 62, 205, '01884503612', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:24', '2023-03-06 14:29:24'),
(450, 62, 206, '01830406050', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:26', '2023-03-06 14:29:26'),
(451, 62, 207, '01850511837', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:28', '2023-03-06 14:29:28'),
(452, 62, 208, '01830625186', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:30', '2023-03-06 14:29:30'),
(453, 62, 209, '01819150139', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:33', '2023-03-06 14:29:33'),
(454, 62, 210, '01988098579', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:35', '2023-03-06 14:29:35'),
(455, 62, 211, '01855773432', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:37', '2023-03-06 14:29:37');
INSERT INTO `sms_histories` (`id`, `institution_id`, `student_id`, `mobile_nmber`, `sms_count`, `sms_send_id`, `is_send`, `message`, `created_by`, `created_at`, `updated_at`) VALUES
(456, 62, 212, '01875794059', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:39', '2023-03-06 14:29:39'),
(457, 62, 213, '01815460658', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:42', '2023-03-06 14:29:42'),
(458, 62, 214, '01967523053', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:44', '2023-03-06 14:29:44'),
(459, 62, 215, '01885564245', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:46', '2023-03-06 14:29:46'),
(460, 62, 216, '01823297069', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:49', '2023-03-06 14:29:49'),
(461, 62, 217, '01911241200', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:51', '2023-03-06 14:29:51'),
(462, 62, 218, '01882919589', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:52', '2023-03-06 14:29:52'),
(463, 62, 219, '01885577410', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:54', '2023-03-06 14:29:54'),
(464, 62, 220, '01812461065', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:57', '2023-03-06 14:29:57'),
(465, 62, 221, '01884631700', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:29:58', '2023-03-06 14:29:58'),
(466, 62, 222, '01859154695', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:00', '2023-03-06 14:30:00'),
(467, 62, 223, '01893868200', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:01', '2023-03-06 14:30:01'),
(468, 62, 224, '01925215029', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:03', '2023-03-06 14:30:03'),
(469, 62, 225, '01714915812', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:04', '2023-03-06 14:30:04'),
(470, 62, 226, '01950773804', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:06', '2023-03-06 14:30:06'),
(471, 62, 227, '01723241532', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:08', '2023-03-06 14:30:08'),
(472, 62, 228, '01925686122', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:09', '2023-03-06 14:30:09'),
(473, 62, 229, '01708707664', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:11', '2023-03-06 14:30:11'),
(474, 62, 230, '01757777263', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:12', '2023-03-06 14:30:12'),
(475, 62, 231, '01761548901', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:14', '2023-03-06 14:30:14'),
(476, 62, 232, '01948133227', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:15', '2023-03-06 14:30:15'),
(477, 62, 233, '01712591888', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:17', '2023-03-06 14:30:17'),
(478, 62, 234, '01748641200', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:18', '2023-03-06 14:30:18'),
(479, 62, 235, '01789607141', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:20', '2023-03-06 14:30:20'),
(480, 62, 236, '01790695933', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:21', '2023-03-06 14:30:21'),
(481, 62, 237, '01749564778', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:23', '2023-03-06 14:30:23'),
(482, 62, 238, '01741904134', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:24', '2023-03-06 14:30:24'),
(483, 62, 239, '01816136974', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:26', '2023-03-06 14:30:26'),
(484, 62, 240, '01829205692', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:28', '2023-03-06 14:30:28'),
(485, 62, 241, '01712015393', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:29', '2023-03-06 14:30:29'),
(486, 62, 242, '01777503479', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:31', '2023-03-06 14:30:31'),
(487, 62, 243, '01735817949', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:33', '2023-03-06 14:30:33'),
(488, 62, 244, '01746767016', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:34', '2023-03-06 14:30:34'),
(489, 62, 245, '01747102159', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:36', '2023-03-06 14:30:36'),
(490, 62, 246, '01720315107', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:37', '2023-03-06 14:30:37'),
(491, 62, 247, '01940275227', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:39', '2023-03-06 14:30:39'),
(492, 62, 248, '01926305455', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:40', '2023-03-06 14:30:40'),
(493, 62, 249, '01917047969', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:43', '2023-03-06 14:30:43'),
(494, 62, 250, '01715434120', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:44', '2023-03-06 14:30:44'),
(495, 62, 251, '01928456377', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:46', '2023-03-06 14:30:46'),
(496, 62, 252, '01763737675', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:47', '2023-03-06 14:30:47'),
(497, 62, 253, '01913809103', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:49', '2023-03-06 14:30:49'),
(498, 62, 297, '01706633528', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:50', '2023-03-06 14:30:50'),
(499, 62, 298, '01714926683', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:53', '2023-03-06 14:30:53'),
(500, 62, 299, '01309636477', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:54', '2023-03-06 14:30:54'),
(501, 62, 300, '01648397122', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:56', '2023-03-06 14:30:56'),
(502, 62, 301, '017188041279', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:56', '2023-03-06 14:30:56'),
(503, 62, 302, '01854572580', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:30:59', '2023-03-06 14:30:59'),
(504, 62, 303, '01787578193', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:31:00', '2023-03-06 14:31:00'),
(505, 62, 304, '01711134820', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:31:01', '2023-03-06 14:31:01'),
(506, 62, 305, '01728157962', '4', 'N/A', 1, 'ওঁম্ মা বাবা\r\nআগামী ০৭/০৩/২০২৩ খ্রিঃ তারিখ রোজ মঙ্গলবার শুভ দোল পূর্ণিমা উপলক্ষে পরম পিতা-মাতা শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ সহ সকল ভক্ত বৃন্দ ছাগলদী আশ্রমে আমন্ত্রিত। প্রচারেঃ শ্রী শ্রী ব্রজেশ্বরী যোগানন্দ আশ্রমের ভক্তবৃন্দ।।', 67, '2023-03-06 14:31:03', '2023-03-06 14:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `sms_packages`
--

CREATE TABLE `sms_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `validity` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_packages`
--

INSERT INTO `sms_packages` (`id`, `quantity`, `validity`, `price`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 500, 30, 225, 1, '2022-11-20 16:08:52', '2022-11-29 21:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `sms_package_purchases`
--

CREATE TABLE `sms_package_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sms_package_id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `validity` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_package_purchases`
--

INSERT INTO `sms_package_purchases` (`id`, `sms_package_id`, `institution_id`, `validity`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 30, 20, 500, '2022-11-20 16:27:43', '2022-11-20 16:27:43'),
(2, 1, 2, 30, 20, 500, '2022-11-20 16:33:15', '2022-11-20 16:33:15'),
(3, 1, 3, 30, 20, 500, '2022-11-20 16:55:00', '2022-11-20 16:55:00'),
(4, 1, 3, 30, 20, 500, '2022-11-20 16:55:11', '2022-11-20 16:55:11'),
(5, 1, 41, 30, 225, 500, '2022-12-03 13:33:56', '2022-12-03 13:33:56'),
(6, 1, 41, 30, 225, 500, '2022-12-03 13:33:58', '2022-12-03 13:33:58'),
(7, 1, 50, 30, 225, 500, '2022-12-05 15:45:11', '2022-12-05 15:45:11'),
(8, 1, 62, 30, 225, 500, '2023-01-23 12:05:27', '2023-01-23 12:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `admission_date` date NOT NULL DEFAULT current_timestamp(),
  `student_class` varchar(255) DEFAULT NULL,
  `student_contact` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(125) DEFAULT NULL,
  `guardian_contact` varchar(255) DEFAULT NULL,
  `clg_name` varchar(255) DEFAULT NULL,
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `user_profile` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `note_address` tinytext DEFAULT NULL,
  `pin` char(4) DEFAULT NULL,
  `unique_id` char(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_name`, `admission_date`, `student_class`, `student_contact`, `guardian_name`, `guardian_contact`, `clg_name`, `batch_id`, `institution_id`, `user_profile`, `is_active`, `note_address`, `pin`, `unique_id`, `created_at`, `updated_at`) VALUES
(1, 'Arman Ali', '2022-09-21', 'Six', '01307035688', NULL, NULL, NULL, 1, 1, '1269083544_11_10_22.jpg', 1, NULL, NULL, NULL, '2022-09-21 07:28:51', '2022-10-11 15:23:47'),
(2, 'Abu Hasan', '2022-08-01', 'Eight', '012345678963', NULL, NULL, 'Nowpara School & College', 2, 1, '1998904229_11_10_22.jpg', 1, NULL, NULL, NULL, '2022-09-21 07:42:36', '2022-10-11 15:30:36'),
(3, 'আব্দুর রহিম', '2022-09-21', 'ষষ্ঠ শ্রেণী', '01472583690', NULL, NULL, 'রহিম বখস স্কুল', 3, 2, '2058340120_15_04_23.jpg', 1, NULL, NULL, NULL, '2022-09-21 07:50:42', '2023-04-15 14:00:47'),
(4, 'হাসান আলী', '2022-09-21', 'ষষ্ঠ শ্রেণী', '01307035688', NULL, NULL, 'বটতলী স্কুল', 3, 2, '419574040_20_11_22.jpg', 1, NULL, '2120', '296649', '2022-09-21 07:54:43', '2022-11-20 16:39:21'),
(5, 'Arman Ali', '2022-09-21', 'Six', '01307035688', NULL, NULL, 'Nowpara School & College', 3, 2, '1966689630_27_11_22.jpg', 1, NULL, NULL, NULL, '2022-09-21 10:29:58', '2022-11-27 17:15:54'),
(6, 'সুজানা রুহী', '2022-10-01', 'Six', '01718075903', NULL, NULL, NULL, 5, 3, NULL, 1, NULL, '4323', '141292', '2022-10-01 22:13:46', '2022-11-20 17:40:47'),
(9, 'রাসেল আহমেদ', '2022-10-11', 'Six', '01794928580', NULL, NULL, 'বীরগঞ্জ সরকারী কলেজ', 1, 1, '438917441_11_10_22.jpg', 1, NULL, NULL, NULL, '2022-10-11 15:20:09', '2022-10-11 15:20:09'),
(12, 'সুজানা রুহী', '2022-07-14', 'Six, Seven', '01556306432', 'fghfg', NULL, NULL, 8, 5, NULL, 1, NULL, NULL, NULL, '2022-10-14 10:53:34', '2022-10-14 20:49:37'),
(13, 'Jaman Hamid', '2022-10-14', 'Eight', '01307035688', 'Sirajul', NULL, NULL, 2, 1, '483169077_14_10_22.jpg', 1, NULL, NULL, NULL, '2022-10-14 17:26:41', '2022-10-14 17:27:54'),
(14, 'Tasfia Ahmed Tinni', '2022-01-01', 'Eight', '01733873719', 'Rakib Ahmed Rubel', '01733873719', 'DAHS', 13, 7, NULL, 1, 'Doleshwar, Keraniganj, Dhaka.', NULL, NULL, '2022-10-14 18:06:04', '2022-10-15 13:19:02'),
(15, 'Rahim', '2022-10-14', 'Six, Seven', '01718075905', 'xvsd', NULL, NULL, 8, 5, NULL, 1, NULL, NULL, NULL, '2022-10-14 18:33:26', '2022-10-14 18:33:26'),
(16, 'Safayet Arefin', '2022-01-01', 'Six', '01724440284', 'MD ARIFUL ISLAM', '01724440284', 'DAHS', 9, 7, NULL, 1, 'DOLESHWAR, KERANIGANJ, DHAKA.', NULL, NULL, '2022-10-15 13:13:45', '2022-10-15 13:18:44'),
(17, 'TOWHIDUL ISLAM SWAD', '2022-02-01', 'Six', '01595046266', 'PANNA', '01595046266', 'DGPS', 9, 7, NULL, 1, 'DOLESHWAR, KERANIGANJ, DHAKA', NULL, NULL, '2022-10-15 13:18:12', '2022-10-15 13:18:12'),
(18, 'ASIYA AKTHER', '2022-01-01', 'Six', '014051252963', 'LIJA', '014051252963', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:20:35', '2022-10-15 13:20:35'),
(19, 'JUNAIN ARAFAT JUN', '2022-03-03', 'Six', '01718210306', 'JHUMA AKTER', '01718210306', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:21:34', '2022-10-15 13:21:34'),
(20, 'ASIA BEGUM MIM', '2022-05-01', 'Six', '01595046782', 'MOMOTAZ BEGUM', '01595046782', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:25:39', '2022-10-15 13:26:07'),
(21, 'KAMRUNNAHAR KOBITA', '2022-08-01', 'Six', '01595046251', 'SAHANAZ', '01595046251', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:27:08', '2022-10-15 13:27:08'),
(22, 'SOMIR HOSSAIN', '2022-01-01', 'Six', '01789635433', 'SUMA AKTAR', '01789635433', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:29:38', '2022-10-15 13:29:38'),
(23, 'SHAIBA AKTER MOU', '2022-01-01', 'Six', '01915869099', 'MOLI', '01915869099', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:30:38', '2022-10-15 13:30:38'),
(24, 'ARAFAT HOSSAIN ARANYA', '2022-07-01', 'Six', '01970105274', 'RAHIMA AKTER JHINUK', '01970105274', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:43:27', '2022-10-15 13:43:27'),
(25, 'BIKASH CHANDRA MALI', '2022-08-01', 'Six', '01729570853', 'RITA RANI', '01729570853', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:46:11', '2022-10-15 13:46:11'),
(26, 'ISHANUR RAHMAN', '2022-01-01', 'Six', '01969505662', 'SHILA MONI', '01969505662', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:48:01', '2022-10-15 13:48:01'),
(27, 'MD MEHEDI HASAN', '2022-02-01', 'Six', '01790640933', 'KAKON', '01790640933', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:49:09', '2022-10-15 13:49:09'),
(28, 'ATIKUR RAHMAN HRIDOY', '2022-08-01', 'Six', '01595046241', 'HOWANUR BEGUM', '01595046241', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:55:22', '2022-10-15 13:55:22'),
(29, 'FARZANA AKTER MIM', '2022-07-01', 'Six', '01957516546', 'MST MUKUL BEGUM', '01957516546', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:56:38', '2022-10-15 13:56:38'),
(30, 'ANANTO MONDAL', '2022-01-01', 'Six', '01770047312', 'SUBAL MONDAL', '01770047312', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 13:57:34', '2022-10-15 13:57:34'),
(31, 'ESHA MONI', '2022-04-01', 'Six', '0169458024', 'SAHANAZ BEGUM', '0169458024', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:05:02', '2022-10-15 14:05:02'),
(32, 'AYAN ULLAH CHOWDHURY', '2022-01-01', 'Six', '01595046294', 'SABINA BEGUM', '01595046294', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:05:59', '2022-10-15 14:05:59'),
(33, 'UTSHAB CHANDRA DAS MITHU', '2022-05-01', 'Six', '01595046808', 'RITA RANI DAS', '01595046808', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:10:00', '2022-10-15 14:10:00'),
(34, 'WALID HOSSAIN ANAN', '2022-04-01', 'Six', '01765154240', 'MST SHELA', '01765154240', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:11:32', '2022-10-15 14:11:32'),
(35, 'MEHEDI HASAN RISAT', '2022-10-01', 'Six', '01716281977', 'HAPIY AKTHER', '01716281977', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:12:54', '2022-10-15 14:12:54'),
(36, 'GALIBUR RAHMAN SAMI', '2022-10-01', 'Six', '01595046665', 'LIPI BEGUM', '01595046665', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:13:55', '2022-10-15 14:13:55'),
(37, 'MD FAHIM HOSEN KHAN', '2022-09-01', 'Six', '01595046424', 'RATNA', '01595046424', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:15:17', '2022-10-15 14:15:17'),
(38, 'MORIOM AKTER MUNNI', '2022-01-01', 'Six', '01742083314', 'PARVIN BEGUM', '01742083314', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:29:15', '2022-10-15 14:29:15'),
(39, 'TANHA AKTER SINTHIA', '2022-01-01', 'Six', '01595046279', 'LAYLA AKTER', '01595046279', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:30:59', '2022-10-15 14:30:59'),
(40, 'ISHAMONI', '2022-02-02', 'Six', '01595046347', 'MARZINA BEGUM', '01595046347', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:32:00', '2022-10-15 14:32:00'),
(41, 'SARIA', '2022-08-01', 'Six', '01405125294', 'MD ANIM MIAH', '01405125294', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:33:07', '2022-10-15 14:33:07'),
(42, 'MD MUFID HOSSAIN LIHAN', '2022-03-01', 'Six', '01782228470', 'MD MUBARAK HOSSAIN', '01782228470', 'DGPS', 9, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:34:09', '2022-10-15 14:34:09'),
(43, 'KEYA AKTER', '2022-01-01', 'Six', '01736772656', 'ZULEKHA KHANAM', '01736772656', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:35:08', '2022-10-15 14:35:08'),
(44, 'RUPALY', '2022-01-01', 'Six', '01790168151', 'MEHEDI', '01790168151', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:36:07', '2022-10-15 14:36:07'),
(45, 'TASNIM', '2022-08-01', 'Six', '01715882895', 'MD TAREK', '01715882895', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:37:32', '2022-10-15 14:37:32'),
(46, 'TAHSIN', '2022-04-01', 'Six', '01976788616', 'RAJIB', '01976788616', 'DGPS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:39:38', '2022-10-15 14:39:38'),
(47, 'SANIA', '2022-05-01', 'Six', '01735291331', 'hABIBA', '01735291331', 'DAHS', 10, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:40:30', '2022-10-15 14:40:30'),
(48, 'ISRAT JAHAN KARIMA', '2022-01-01', 'Seven', '01945532658', 'JAHORA AKTER', '01945532658', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 14:42:18', '2022-10-15 14:42:18'),
(49, 'ASHAMONI', '2022-01-01', 'Seven', '01742745858', 'MST CHAMPA BEGUM', '01742745858', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 17:57:14', '2022-10-15 17:57:14'),
(50, 'YEANA AKTER MORIOM', '2022-01-01', 'Seven', '01961731363', 'MD EUNUS BAPARY', '01961731363', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 17:58:09', '2022-10-15 17:58:09'),
(51, 'LATIFUN NESA HAQUE AKSHA', '2022-10-01', 'Seven', '01595046956', 'MD NAZIMUL HAQUE', '01595046956', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 17:59:54', '2022-10-15 17:59:54'),
(52, 'ALIFA RAHMAN SONIA', '2022-01-01', 'Seven', '01930190694', 'MD ARIFUR RAHAMAN', '01930190694', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:09:22', '2022-10-15 18:09:22'),
(53, 'MD SINHA MIA', '2022-01-01', 'Seven', '01705729896', 'MD AKASH MIA', '01705729896', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:11:27', '2022-10-15 18:11:27'),
(54, 'MST RAHIMA', '2022-01-01', 'Seven', '01996531572', 'MORIUM', '01996531572', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:12:21', '2022-10-15 18:12:21'),
(55, 'REZANUR RAHMAN', '2022-02-01', 'Seven', '01842879696', 'MD FAISAL RAHMAN', '01842879696', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:15:11', '2022-10-15 18:15:11'),
(56, 'BAISHAKHI', '2022-10-01', 'Seven', '01757156081', 'MINARA BEGUM', '01757156081', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:16:27', '2022-10-15 18:16:27'),
(57, 'RUHI AKTER MIM', '2022-07-01', 'Seven', '01939443743', 'HAMIDA AKTER', '01939443743', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:17:48', '2022-10-15 18:17:48'),
(58, 'AL AMIN', '2022-01-01', 'Seven', '01986089493', 'MD SUMON MIA', '01986089493', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:18:39', '2022-10-15 18:18:39'),
(59, 'LAMIA AKHTER BOISHAKI', '2022-10-01', 'Seven', '01978405663', 'RAKIB', '01978405663', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:19:33', '2022-10-15 18:19:33'),
(60, 'AZMIR ISLAM', '2022-01-01', 'Seven', '01403932869', 'RUMKI AKTER', '01403932869', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:20:23', '2022-10-15 18:20:23'),
(61, 'ANAS ABDULLAH CHOWDHURY', '2022-01-01', 'Seven', '01711343406', 'MD ASIF ULLAH CHOWDHURY MOHAN', '01711343406', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:21:28', '2022-10-15 18:21:28'),
(62, 'SAIFUL ISLAM NAHID', '2022-01-01', 'Seven', '01722164812', 'MD SAFUR UDDIN', '01722164812', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:22:25', '2022-10-15 18:22:25'),
(63, 'SABBIR HOSSAIN', '2022-02-01', 'Seven', '01936398338', 'SADIA AKTER', '01936398338', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:23:16', '2022-10-15 18:23:16'),
(64, 'TAHASIN', '2022-01-01', 'Seven', '01923443029', 'MST TASLIMA AKTER', '01923443029', 'DGPS', 11, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:24:22', '2022-10-15 18:24:22'),
(65, 'MOHONA AKTER', '2022-01-01', 'Eight', '01941501720', 'MD MINTU', '01941501720', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:25:55', '2022-10-15 18:25:55'),
(66, 'PAYEL SARKER', '2022-01-01', 'Eight', '01722886832', 'DIPA MONDOL', '01722886832', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:27:24', '2022-10-15 18:27:24'),
(67, 'LISA', '2022-01-01', 'Eight', '01948765581', 'HAZERA BEGUM', '01948765581', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:29:04', '2022-10-15 18:29:04'),
(68, 'MST MARUFA', '2022-01-01', 'Eight', '01933817181', 'RAHMIDA AKTER SILA', '01933817181', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:31:00', '2022-10-15 18:31:00'),
(69, 'ARIF HOSSAIN', '2022-10-01', 'Eight', '01595047014', 'SHAKINA', '01595047014', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:31:48', '2022-10-15 18:31:48'),
(70, 'MEHR JABIN', '2022-01-01', 'Eight', '01595046502', 'ASMA BEGUM', '01595046502', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:32:55', '2022-10-15 18:32:55'),
(71, 'ARIFA AKHTER', '2022-01-01', 'Eight', '01595046495', 'MISSU AKTER LAKI', '01595046495', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:33:43', '2022-10-15 18:33:43'),
(72, 'RAFIQUL ISLAM', '2022-01-01', 'Eight', '01737301145', 'MD EBRAHIM SIKDAR', '01737301145', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:34:31', '2022-10-15 18:34:31'),
(73, 'SAIF RIHAM', '2022-01-01', 'Eight', '01311192083', 'MD HIRON', NULL, 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:35:18', '2022-10-15 18:35:18'),
(74, 'SIYAM AHMED', '2022-01-01', 'Ten', '01311192083', 'MD HIRON', '01311192083', 'DAHS', 15, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:36:06', '2022-10-15 18:36:06'),
(75, 'SANIA', '2022-01-01', 'Ten', '01930190694', 'ARIFUR RAHMAN', '01930190694', 'DGPS', 15, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:37:04', '2022-10-15 18:37:04'),
(76, 'NADIA AKTER', '2022-01-01', 'Eight', '01849465135', 'SAZMA', '01849465135', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 18:38:10', '2022-10-15 18:38:10'),
(77, 'RAFI', '2022-01-01', 'Eight', '01948765581', 'HAZERA BEGUM', '01948765581', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:00:12', '2022-10-15 19:00:12'),
(78, 'TAYABA', '2022-02-01', 'Eight', '01949329425', 'HALIMA AKTER', '01949329425', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:01:20', '2022-10-15 19:01:20'),
(79, 'MD MOSALIN MOLLAH', '2022-01-01', 'Eight', '01595046496', 'MD BABAR ALI', '01595046496', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:02:15', '2022-10-15 19:02:15'),
(80, 'EVA', '2022-01-01', 'Eight', '01749738111', 'MD MINUL GANI', '01749738111', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:03:10', '2022-10-15 19:03:10'),
(81, 'MD MAMUN SHEIKH', '2022-01-01', 'Eight', '01757156081', 'MINARA BEGUM', '01757156081', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:04:17', '2022-10-15 19:04:17'),
(82, 'MD MUNNA', '2022-01-01', 'Eight', '01595046279', 'LAYLA AKTER', '01595046279', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:05:15', '2022-10-15 19:05:15'),
(83, 'MD ASAM', '2022-01-01', 'Eight', '01827695420', 'MD ARIF BABU', '01827695420', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:06:06', '2022-10-15 19:06:06'),
(84, 'NAFIZ MIA', '2022-01-01', 'Eight', '01980863430', 'NADIA BEGUM', '01980863430', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:06:57', '2022-10-15 19:06:57'),
(85, 'RAKIBA AKTER MUSKAN', '2022-01-01', 'Eight', '01944537672', 'SABBIR AHMED', '01944537672', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:07:53', '2022-10-15 19:07:53'),
(86, 'MD YAHAD', '2022-01-01', 'Eight', '01925304348', 'MD ISLAM MIA', '01925304348', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:08:36', '2022-10-15 19:08:36'),
(87, 'SHUVO HASAN RIYAD', '2022-01-01', 'Eight', '01766383826', 'MOSAMMAT SUMA BEGUM', '01766383826', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:10:11', '2022-10-15 19:10:11'),
(88, 'MD MAHIN KHALIFA', '2022-01-01', 'Eight', '01916958462', 'MOJIBOR KHALIFA', '01916958462', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:20:17', '2022-10-15 19:20:17'),
(89, 'JANNATUL FERDOUS RATNA', '2022-01-01', 'Eight', '01595046291', 'MD ROTAN MIA', '01595046291', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:21:19', '2022-10-15 19:21:19'),
(90, 'CHOITY', '2022-01-01', 'Eight', '01595046347', 'MARZINA BEGUM', '01595046347', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:22:06', '2022-10-15 19:22:06'),
(91, 'MD KAWSAR', '2022-01-01', 'Eight', '01934124221', 'SAKIUR RAHMAN SAJAL', '01934124221', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:23:13', '2022-10-15 19:23:13'),
(92, 'NUSRAT JAHAN IMPA', '2022-01-01', 'Eight', '01595046487', 'BITHI AKHTER', '01595046487', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:23:57', '2022-10-15 19:23:57'),
(93, 'MD OMAR SUNNY', '2022-01-01', 'Eight', '01595046462', 'SHAHIDA BEGUM', '01595046462', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:26:43', '2022-10-15 19:26:43'),
(94, 'MD MARUF HOSSAIN', '2022-01-01', 'Eight', '01790640933', 'KAKON', '01790640933', 'DGPS', 12, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:27:33', '2022-10-15 19:27:33'),
(95, 'SHARMIN AKTER', '2022-01-01', 'Eight', '01790640933', 'INSAN ALI', NULL, 'DAHS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:28:36', '2022-10-15 19:28:36'),
(96, 'FAIZA TASNIM', '2022-01-01', 'Eight', '01595046463', 'FAHMIDA KHATUN', '01595046463', 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:30:11', '2022-10-15 19:30:11'),
(97, 'SRABONTI', '2022-01-01', 'Eight', '01595046347', 'ASGHVSAKGD', NULL, 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:32:28', '2022-10-15 19:32:28'),
(98, 'JOYNOB', '2022-03-01', 'Eight', '01757156081', 'aSDGGHJNMJHJH', NULL, 'DGPS', 13, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:32:58', '2022-10-15 19:32:58'),
(99, 'MD ABU NAIEEM HOSSAIN', '2022-01-01', 'Five', '01595046879', 'NASIMA BEGUM', '01595046879', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:39:35', '2022-10-15 19:39:35'),
(100, 'NUSRAT JAHAN', '2022-01-01', 'Five', '01987907183', 'MST ASIYA', '01987907183', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:40:24', '2022-10-15 19:40:24'),
(101, 'AMIR HOSSAIN', '2022-01-01', 'Five', '01986089493', 'MST EYRIN AKTER', '01986089493', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:41:12', '2022-10-15 19:41:12'),
(102, 'MALIHA AKTER SOHANA', '2022-01-01', 'Five', '01739968115', 'TULI', '01739968115', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:42:23', '2022-10-15 19:42:23'),
(103, 'JANNATUL SINHA', '2022-01-01', 'Five', '01827695420', 'MD ARIF BABU', '01827695420', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:43:43', '2022-10-15 19:43:43'),
(104, 'SOYAB CHOWDHURY', '2022-01-01', 'Five', '01911905428', 'MOHAMMAD NAYAN CHOWDHURY', '01911905428', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:44:40', '2022-10-15 19:44:40'),
(105, 'TAZBIA HAQUE', '2022-01-01', 'Five', '01830345526', 'FERDOUSHI AKTER MONTY', '01830345526', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:46:10', '2022-10-15 19:46:10'),
(106, 'HABIB HOSSAIN', '2022-01-01', 'Five', '01595046248', 'MAHFUZA BEGUM', '01595046248', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:47:37', '2022-10-15 19:47:37'),
(107, 'HALIZA AKTER NUR', '2022-01-01', 'Five', '01944537672', 'SABBIR AHMED', '01944537672', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:56:10', '2022-10-15 19:56:10'),
(108, 'MAHIMA AKTER', '2022-01-01', 'Five', '01924639685', 'MD CHAN MIA', '01924639685', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:57:06', '2022-10-15 19:57:06'),
(109, 'ANJUM', '2022-01-01', 'Five', '01764492331', 'RAHIMA', '01764492331', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:58:10', '2022-10-15 19:58:10'),
(110, 'IFTY', '2022-01-01', 'Ten', '01764492331', 'RAHIMA', '01764492331', 'DAHS', 15, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 19:58:58', '2022-10-15 19:58:58'),
(111, 'MD FARDIN AL ARAF', '2022-04-01', 'Five', '01595046774', 'TANIYA', '01595046774', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 20:00:47', '2022-10-15 20:00:47'),
(112, 'SIYAM', '2022-04-01', 'Five', '01934440482', 'SIMA BEGUM', '01934440482', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 20:01:50', '2022-10-15 20:01:50'),
(113, 'AL JIHADI', '2022-01-01', 'Five', '01926912729', 'SHARMIN AKTER', '01926912729', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 20:07:39', '2022-10-15 20:07:39'),
(114, 'MIMU AKTER ANI', '2022-01-01', 'Five', '01920477049', 'HASINA BEGUM', '01920477049', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 20:09:29', '2022-10-15 20:09:29'),
(115, 'MST ALMINA', '2022-01-01', 'Five', '01825819303', 'MST ROZINA BEGUM', '01825819303', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 20:11:07', '2022-10-15 20:11:07'),
(116, 'ABDUR RAHMAN SAYAD', '2022-01-01', 'Five', '01920220001', 'SELINA', '01920220001', 'DGPS', 16, 7, NULL, 1, NULL, NULL, NULL, '2022-10-15 20:13:21', '2022-10-15 20:15:45'),
(117, 'Adiba', '2022-10-17', '10', '01717676994', 'Abeda', '01715614621', 'AGGS', 17, 8, NULL, 1, NULL, NULL, NULL, '2022-10-17 19:28:21', '2022-10-17 19:28:21'),
(118, 'Adiba', '2022-10-17', '10', '01717676994', 'Abeda', '01715614621', 'AGGS', 17, 8, NULL, 1, NULL, NULL, NULL, '2022-10-17 19:28:21', '2022-10-17 19:28:21'),
(119, 'Arman Ali', '2022-08-01', 'SSC', '01307035688', 'fghfg', NULL, NULL, 18, 3, NULL, 1, NULL, '8659', '182693', '2022-10-18 09:17:19', '2023-01-30 09:54:23'),
(120, 'Mahbubul Yasin Spandon', '2022-03-01', 'Eight', '01718075903', 'MD Yousuf Ali', '01718075903', NULL, 6, 4, NULL, 1, NULL, NULL, NULL, '2022-10-18 21:07:34', '2022-10-18 21:07:34'),
(121, 'Sajida Rahman joty', '2022-10-22', 'Six', '01771999365', 'Nasrin Baby', '01771999365', 'Alamdanga pilot girls school', 22, 11, NULL, 1, 'Alamdanga, Chuadanga', NULL, NULL, '2022-10-22 16:57:54', '2022-10-22 16:57:54'),
(122, 'Fahim', '2022-10-26', 'Nine', '01555555555', 'Rahim', '01738450775', NULL, 24, 14, NULL, 1, NULL, NULL, NULL, '2022-10-26 08:20:10', '2022-10-26 08:20:10'),
(123, 'Jobayda Alam', '2022-01-01', '6,8,10', '01715736735', 'Mohammad Jahangir Alam', '01715736735', 'Shaikchail High School', 26, 15, '867289010_04_11_22.jpg', 1, NULL, NULL, NULL, '2022-11-04 09:28:53', '2022-11-04 09:28:53'),
(124, 'Rahim', '2022-08-01', 'Six', '01851447760', 'Sabur', NULL, NULL, 5, 3, NULL, 1, NULL, NULL, NULL, '2022-11-23 18:13:04', '2022-11-23 18:13:04'),
(125, 'ABDULLAH', '2022-11-29', '10.00AM', '01719799089', 'BOZLU', '01719799089', 'BAMUNDI KARIGORI TREANING CENTER', 29, 20, NULL, 1, 'Badiapara', NULL, NULL, '2022-11-29 20:52:44', '2022-11-29 20:52:44'),
(126, 'Anonnna', '2022-12-01', 'Nine', '01720159493', NULL, NULL, NULL, 30, 30, NULL, 1, 'Jhitka', NULL, NULL, '2022-12-01 20:04:08', '2022-12-01 20:04:08'),
(128, 'কামরুন্নাহার আক্তার কেয়া', '2022-12-02', 'SSC', '01722060244', 'মোঃ কাচুয়া মিয়া', '0172206044', 'কালুডাঙ্গা উচ্চ বিদ্যালয়', 35, 39, '975353478_13_12_22.jpg', 1, NULL, NULL, NULL, '2022-12-02 21:40:54', '2022-12-13 22:42:29'),
(129, 'আতিকুর রহমান', '2022-12-03', 'SSC', '01721306327', 'মোঃ আজগার আলি', '01721306327', 'কালুডাঙ্গা উচ্চ বিদ্যালয়', 35, 39, '244783659_13_12_22.jpg', 1, 'পশ্চিম কালুডাঙ্গা ১, উলিপুর,কুড়িগ্রাম।', NULL, NULL, '2022-12-03 16:15:47', '2022-12-13 22:43:10'),
(130, 'Royed Hossain', '2022-12-03', '8', '01746508889', 'Parvin Begum', '01746508889', 'Madaripur Gov College', 48, 44, NULL, 1, NULL, NULL, NULL, '2022-12-03 22:52:27', '2022-12-03 22:52:27'),
(132, 'Nusrat jahan', '2022-12-05', 'Ten', '01817751693', 'Md.shajan', '01817751693', 'Al-Banna Secondary Girls School', 49, 52, NULL, 1, 'Rampur', NULL, NULL, '2022-12-05 20:17:31', '2023-02-07 16:48:01'),
(133, 'সুরভী', '2022-12-06', '120', '01788228500', 'সুরভীর মায়ের নাম', '01788228501', NULL, 51, 43, NULL, 1, NULL, NULL, NULL, '2022-12-06 15:55:04', '2022-12-06 15:55:04'),
(134, 'মোছাঃ কাকলী আক্তার', '2022-12-10', 'SSC', '01722060244', 'মোঃ আবুল কালাম', '01722060244', 'কালুডাঙ্গা উচ্চ বিদ্যালয়', 35, 39, '1889784139_13_12_22.jpg', 1, NULL, NULL, NULL, '2022-12-13 22:46:22', '2022-12-13 22:46:22'),
(135, 'Nice', '2022-12-19', 'All', '01740470601', 'Rone', '01740479334', 'Krusnopur ideal women college', 56, 58, NULL, 1, NULL, NULL, NULL, '2022-12-19 17:49:16', '2022-12-19 17:49:16'),
(136, 'ANIMESH SUTRADHAR', '2023-01-23', 'All Members', '01718217423', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-23 12:26:42', '2023-01-23 12:26:42'),
(137, 'অনিমেশ সূত্রধর', '2023-01-29', 'All Members', '01718217423', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 09:11:29', '2023-01-29 09:11:29'),
(138, 'শ্রী স্বপন কুমার নাগ', '2023-01-29', 'All Members', '01711592059', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 09:14:08', '2023-01-29 09:14:08'),
(139, 'শ্রী জীবন কৃষ্ণ দাস', '2023-01-29', 'All Members', '01721311210', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 09:17:04', '2023-01-29 09:17:04'),
(140, 'মৃদুল কুমার দাস', '2023-01-29', 'All Members', '01734393745', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 09:19:07', '2023-01-29 09:19:07'),
(141, 'উপানন্দ দাশ', '2023-01-29', 'All Members', '01735857772', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 09:21:16', '2023-01-29 09:21:16'),
(142, 'নীলকন্ঠ সরকার', '2023-01-29', 'All Members', '01918792907', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 09:23:55', '2023-01-29 09:23:55'),
(143, 'গোপাল বিশ্বাস', '2023-01-29', 'All Members', '01310394749', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 09:26:37', '2023-01-29 09:26:37'),
(144, 'সুশান্ত পাল', '2023-01-29', 'All Members', '01718384749', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 09:28:45', '2023-01-29 09:28:45'),
(145, 'পার্বতী রানী মন্ডল', '2023-01-29', 'All Members', '01725706609', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:13:14', '2023-01-29 10:13:14'),
(146, 'দিপু কুমার মন্ডল', '2023-01-29', 'All Members', '01301645366', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:28:37', '2023-01-29 10:28:37'),
(147, 'দয়াল দাস', '2023-01-29', 'All Members', '01734940591', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:33:13', '2023-01-29 10:33:13'),
(148, 'চৈতন্য কুমার দাস', '2023-01-29', 'All Members', '01726136346', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:35:26', '2023-01-29 10:35:26'),
(149, 'দশরথ চন্দ্র রায়', '2023-01-29', 'All Members', '01751847818', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:37:05', '2023-01-29 10:37:05'),
(150, 'গোপাল চন্দ্র রায়', '2023-01-29', 'All Members', '01784132627', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:38:23', '2023-01-29 10:38:23'),
(151, 'মুক্তি রানী রায়', '2023-01-29', 'All Members', '01779823481', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:40:46', '2023-01-29 10:40:46'),
(152, 'শিবু চন্দ্র রায়', '2023-01-29', 'All Members', '01787578193', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:42:34', '2023-01-29 10:42:34'),
(153, 'বাবু চন্দ্র রায়', '2023-01-29', 'All Members', '01793238771', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:46:20', '2023-01-29 10:46:20'),
(154, 'ডাঃ অনুকূল', '2023-01-29', 'All Members', '01718586564', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:49:04', '2023-01-29 10:49:04'),
(155, 'অখিল চন্দ্র', '2023-01-29', 'All Members', '01756230602', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:51:39', '2023-01-29 10:51:39'),
(156, 'দিলীপ', '2023-01-29', 'All Members', '01731851553', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:57:01', '2023-01-29 10:57:01'),
(157, 'তাপস পাল', '2023-01-29', 'All Members', '01718384749', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 10:59:38', '2023-01-29 10:59:38'),
(158, 'দিলীপ বিশ্বাস', '2023-01-29', 'All Members', '01715767871', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 11:02:22', '2023-01-29 11:02:22'),
(159, 'নিত্যানন্দ সরকার', '2023-01-29', 'All Members', '01714365693', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:01:06', '2023-01-29 14:01:06'),
(160, 'মলয় কৃষ্ণ বৈরাগী', '2023-01-29', 'All Members', '01736711964', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:03:32', '2023-01-29 14:03:32'),
(161, 'আশীষ কর্মকার', '2023-01-29', 'All Members', '01701407792', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:05:00', '2023-01-29 14:05:00'),
(162, 'অনিল চন্দ্র সরকার', '2023-01-29', 'All Members', '01703100564', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:06:21', '2023-01-29 14:06:21'),
(163, 'রুহিদাস মন্ডল', '2023-01-29', 'All Members', '01762078151', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:08:22', '2023-01-29 14:08:22'),
(164, 'আক্কাস সাধু', '2023-01-29', 'All Members', '01726089341', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:09:51', '2023-01-29 14:09:51'),
(165, 'বিকাশ সরকার খুশি', '2023-01-29', 'All Members', '01712224677', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:11:01', '2023-01-29 14:11:01'),
(166, 'মঞ্জু রানী সরকার', '2023-01-29', 'All Members', '01725010894', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:14:23', '2023-01-29 14:14:23'),
(167, 'ওবায়দুল কোবির সালাম', '2023-01-29', 'All Members', '01914431245', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:16:48', '2023-01-29 14:16:48'),
(168, 'রিপন কুমার মিস্ত্রি', '2023-01-29', 'All Members', '01723797967', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:18:05', '2023-01-29 14:18:05'),
(169, 'নির্মল কুমার হালদার', '2023-01-29', 'All Members', '01717044982', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:19:29', '2023-01-29 14:19:29'),
(170, 'পঙ্কজ কুমার বিশ্বাস', '2023-01-29', 'All Members', '01739827200', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:20:37', '2023-01-29 14:20:37'),
(171, 'রিপন সরকার', '2023-01-29', 'All Members', '01745362437', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:25:19', '2023-01-29 14:25:19'),
(172, 'স্বপন অধিকারী', '2023-01-29', 'All Members', '01317818827', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:26:52', '2023-01-29 14:26:52'),
(173, 'বিকাশ সরকার', '2023-01-29', 'All Members', '01749564778', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:28:31', '2023-01-29 14:28:31'),
(174, 'দিলীপ রায়', '2023-01-29', 'All Members', '01921407641', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:30:20', '2023-01-29 14:30:20'),
(175, 'গোপাল চন্দ্র দাস', '2023-01-29', 'All Members', '01732885858', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:31:58', '2023-01-29 14:31:58'),
(176, 'প্রভাস দেবনাথ', '2023-01-29', 'All Members', '01741876277', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:34:37', '2023-01-29 14:34:37'),
(177, 'সমীর দেবনাথ', '2023-01-29', 'All Members', '01715427870', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:36:39', '2023-01-29 14:36:39'),
(178, 'ধীরেন্দ্রনাথ বড়াল', '2023-01-29', 'All Members', '01731251444', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:38:14', '2023-01-29 14:38:14'),
(179, 'রবীন্দ্রনাথ হালদার', '2023-01-29', 'All Members', '01712488510', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:39:39', '2023-01-29 14:39:39'),
(180, 'চিন্ময় হালদার', '2023-01-29', 'All Members', '01719804641', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:41:34', '2023-01-29 14:41:34'),
(181, 'সত্যেন্দ্রনাথ হালদার', '2023-01-29', 'All Members', '01757849429', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:43:37', '2023-01-29 14:43:37'),
(182, 'কমল ঢালী', '2023-01-29', 'All Members', '01746767016', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:45:02', '2023-01-29 14:45:02'),
(183, 'ক্ষীরদ চন্দ্র মন্ডল', '2023-01-29', 'All Members', '01799682515', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:48:08', '2023-01-29 14:48:08'),
(184, 'কালিপদ ঢালী', '2023-01-29', 'All Members', '01785972606', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 14:49:54', '2023-01-29 14:49:54'),
(185, 'মঞ্জু রানী', '2023-01-29', 'All Members', '01874096421', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 16:08:58', '2023-01-29 16:08:58'),
(186, 'সুমা রানী সরকার', '2023-01-29', 'All Members', '01742658815', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 16:10:25', '2023-01-29 16:10:25'),
(187, 'শ্যাম সরকার', '2023-01-29', 'All Members', '01742658815', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 16:13:13', '2023-01-29 16:13:13'),
(188, 'বিকাশ', '2023-01-29', 'All Members', '01926176524', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 16:18:01', '2023-01-29 16:18:01'),
(189, 'বলরাম বিশ্বাস', '2023-01-29', 'All Members', '01763643987', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:31:22', '2023-01-29 18:31:22'),
(190, 'জীবন চন্দ্র বিশ্বাস', '2023-01-29', 'All Members', '01776147862', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:33:23', '2023-01-29 18:33:23'),
(191, 'গৌরাঙ্গ চন্দ্র মন্ডল', '2023-01-29', 'All Members', '01728157962', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:34:42', '2023-01-29 18:34:42'),
(192, 'পলাশ চন্দ্র মন্ডল', '2023-01-29', 'All Members', '01729182970', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:35:59', '2023-01-29 18:35:59'),
(193, 'বরুণ কুমার বিশ্বাস', '2023-01-29', 'All Members', '01732692706', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:37:06', '2023-01-29 18:37:06'),
(194, 'শ্রী প্রমথ চন্দ্র সরকার', '2023-01-29', 'All Members', '01741147926', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:38:16', '2023-01-29 18:38:16'),
(195, 'কানাই চন্দ্র সরকার', '2023-01-29', 'All Members', '01710654448', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:39:30', '2023-01-29 18:39:30'),
(196, 'নির্মল কুমার সরকার', '2023-01-29', 'All Members', '01750690547', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:40:28', '2023-01-29 18:40:28'),
(197, 'সুব্রত বিশ্বাস', '2023-01-29', 'All Members', '01734965982', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:41:22', '2023-01-29 18:41:22'),
(198, 'সুকুমার মজুমদার', '2023-01-29', 'All Members', '01727657763', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:42:13', '2023-01-29 18:42:13'),
(199, 'অনিল চন্দ্র পাল', '2023-01-29', 'All Members', '01745420851', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:43:15', '2023-01-29 18:43:15'),
(200, 'ডাক্তার কমল দাস', '2023-01-29', 'All Members', '01911961197', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:44:04', '2023-01-29 18:44:04'),
(201, 'আশীষ রায়', '2023-01-29', 'All Members', '01823408270', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:44:56', '2023-01-29 18:44:56'),
(202, 'বিমল কৃষ্ণ রায়', '2023-01-29', 'All Members', '01724004346', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:45:48', '2023-01-29 18:45:48'),
(203, 'বাবুল কুমার দাস', '2023-01-29', 'All Members', '01713910441', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:47:06', '2023-01-29 18:47:06'),
(204, 'প্রভাত চন্দ্র চৌধুরী', '2023-01-29', 'All Members', '01712283285', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:48:00', '2023-01-29 18:48:00'),
(205, 'রাধেশ্যাম বারুই', '2023-01-29', 'All Members', '01884503612', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:49:03', '2023-01-29 18:49:03'),
(206, 'বিপ্লব ঘোষ', '2023-01-29', 'All Members', '01830406050', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:49:55', '2023-01-29 18:49:55'),
(207, 'কৃষ্ণ মল্লিক', '2023-01-29', 'All Members', '01850511837', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:50:47', '2023-01-29 18:50:47'),
(208, 'সুনীল বরণ চৌধুরী', '2023-01-29', 'All Members', '01830625186', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:51:38', '2023-01-29 18:51:38'),
(209, 'মাধব চন্দ্র বিশ্বাস', '2023-01-29', 'All Members', '01819150139', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:52:30', '2023-01-29 18:52:30'),
(210, 'নিরঞ্জন শীল', '2023-01-29', 'All Members', '01988098579', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:53:38', '2023-01-29 18:53:38'),
(211, 'দুলাল মাদবার', '2023-01-29', 'All Members', '01855773432', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:54:35', '2023-01-29 18:54:35'),
(212, 'রনি বাড়ৈই', '2023-01-29', 'All Members', '01875794059', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:56:08', '2023-01-29 18:56:08'),
(213, 'নিমাই চাঁদ বিশ্বাস', '2023-01-29', 'All Members', '01815460658', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:57:06', '2023-01-29 18:57:06'),
(214, 'বকুল মজুমদার', '2023-01-29', 'All Members', '01967523053', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:57:58', '2023-01-29 18:57:58'),
(215, 'নদী রাম সরকার', '2023-01-29', 'All Members', '01885564245', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 18:59:06', '2023-01-29 18:59:06'),
(216, 'রাধিকা মন্ডল', '2023-01-29', 'All Members', '01823297069', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:00:03', '2023-01-29 19:00:03'),
(217, 'সাধন রায়', '2023-01-29', 'All Members', '01911241200', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:00:51', '2023-01-29 19:00:51'),
(218, 'ভূষণ রায়', '2023-01-29', 'All Members', '01882919589', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:01:54', '2023-01-29 19:01:54'),
(219, 'হীরালাল সরকার', '2023-01-29', 'All Members', '01885577410', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:03:02', '2023-01-29 19:03:02'),
(220, 'সুকান্ত কবিরাজ', '2023-01-29', 'All Members', '01812461065', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:04:00', '2023-01-29 19:04:00'),
(221, 'নন্দলাল কবিরাজ', '2023-01-29', 'All Members', '01884631700', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:04:57', '2023-01-29 19:04:57'),
(222, 'অনিল কবিরাজ', '2023-01-29', 'All Members', '01859154695', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:05:45', '2023-01-29 19:05:45'),
(223, 'দিনবন্ধু বাউল', '2023-01-29', 'All Members', '01893868200', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:06:52', '2023-01-29 19:06:52'),
(224, 'কৃষ্ণপদ রায়', '2023-01-29', 'All Members', '01925215029', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:07:43', '2023-01-29 19:07:43'),
(225, 'দেবাশীষ বড়াল', '2023-01-29', 'All Members', '01714915812', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:08:38', '2023-01-29 19:08:38'),
(226, 'ধীরাজ চন্দ্র বালা', '2023-01-29', 'All Members', '01950773804', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:10:05', '2023-01-29 19:10:05'),
(227, 'ডাক্তার তাপস কুমার মন্ডল', '2023-01-29', 'All Members', '01723241532', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:12:10', '2023-01-29 19:12:10'),
(228, 'তপন রায়', '2023-01-29', 'All Members', '01925686122', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:15:31', '2023-01-29 19:15:31'),
(229, 'হালান চন্দ্র মন্ডল', '2023-01-29', 'All Members', '01708707664', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:17:04', '2023-01-29 19:17:04'),
(230, 'ডাক্তার সমন্দ্র নারায়ণ', '2023-01-29', 'All Members', '01757777263', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:18:15', '2023-01-29 19:18:15'),
(231, 'নিখিল চন্দ্র সরকার', '2023-01-29', 'All Members', '01761548901', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:19:16', '2023-01-29 19:19:16'),
(232, 'জয়দেব মালো', '2023-01-29', 'All Members', '01948133227', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:20:25', '2023-01-29 19:20:25'),
(233, 'তপন দাস', '2023-01-29', 'All Members', '01712591888', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:21:23', '2023-01-29 19:21:23'),
(234, 'নারায়ণ চন্দ্র দেবনাথ', '2023-01-29', 'All Members', '01748641200', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:22:19', '2023-01-29 19:22:19'),
(235, 'বঙ্কিম মিত্র', '2023-01-29', 'All Members', '01789607141', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:23:18', '2023-01-29 19:23:18'),
(236, 'রিপন মিস্ত্রি', '2023-01-29', 'All Members', '01790695933', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:24:09', '2023-01-29 19:24:09'),
(237, 'বিকাশ চন্দ্র সরকার', '2023-01-29', 'All Members', '01749564778', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:25:06', '2023-01-29 19:25:06'),
(238, 'বাবুল দাস', '2023-01-29', 'All Members', '01741904134', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:26:08', '2023-01-29 19:26:08'),
(239, 'সমীর বারই', '2023-01-29', 'All Members', '01816136974', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:27:01', '2023-01-29 19:27:01'),
(240, 'আনন্দ সরকার', '2023-01-29', 'All Members', '01829205692', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:27:45', '2023-01-29 19:27:45'),
(241, 'দীপ্তি বারোরী', '2023-01-29', 'All Members', '01712015393', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:29:09', '2023-01-29 19:29:09'),
(242, 'বৃহস্পতি রায়', '2023-01-29', 'All Members', '01777503479', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:30:04', '2023-01-29 19:30:04'),
(243, 'জাহানারা বেগম', '2023-01-29', 'All Members', '01735817949', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:45:36', '2023-01-29 19:45:36'),
(244, 'গোকুল চন্দ্র ঢালী', '2023-01-29', 'All Members', '01746767016', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:46:49', '2023-01-29 19:46:49'),
(245, 'প্রিয় লাল দেউরি', '2023-01-29', 'All Members', '01747102159', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:47:45', '2023-01-29 19:47:45'),
(246, 'অতুল চন্দ্র বিশ্বাস', '2023-01-29', 'All Members', '01720315107', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-29 19:48:52', '2023-01-29 19:48:52'),
(247, 'উত্তম রায়', '2023-01-30', 'All Members', '01940275227', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-30 09:02:22', '2023-01-30 09:02:22'),
(248, 'গোপাল মিস্ত্রি', '2023-01-30', 'All Members', '01926305455', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-30 09:03:29', '2023-01-30 09:03:29'),
(249, 'তপন অধিকার', '2023-01-30', 'All Members', '01917047969', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-30 09:04:40', '2023-01-30 09:04:40'),
(250, 'উর্মিলা রায়', '2023-01-30', 'All Members', '01715434120', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-30 09:05:44', '2023-01-30 09:05:44'),
(251, 'শংকর মন্ডল', '2023-01-30', 'All Members', '01928456377', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-30 09:06:55', '2023-01-30 09:06:55'),
(252, 'অধীর মন্ডল', '2023-01-30', 'All Members', '01763737675', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-30 09:08:38', '2023-01-30 09:08:38'),
(253, 'পুষ্প জিৎ মন্ডল', '2023-01-30', 'All Members', '01913809103', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-01-30 09:11:33', '2023-01-30 09:11:33'),
(254, 'khadija tul emi', '2022-12-10', 'Ten', '01641598370', NULL, NULL, 'Al banna secondary girls school', 49, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 03:44:40', '2023-02-07 03:44:40'),
(255, 'MD. Raihan', '2023-01-16', 'Ten', '01843110531', NULL, NULL, NULL, 50, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:25:05', '2023-02-07 16:25:05'),
(256, 'MD. Antor', '2023-01-16', 'Ten', '01846426715', NULL, NULL, NULL, 50, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:27:55', '2023-02-07 16:27:55'),
(257, 'MD. Emon', '2023-02-10', 'Ten', '01871954062', NULL, NULL, NULL, 49, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:29:29', '2023-02-07 16:29:29'),
(258, 'MD. Kamrul', '2023-01-01', 'Ten', '01835446598', NULL, NULL, NULL, 49, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:31:12', '2023-02-07 16:31:24'),
(259, 'MD. Naim', '2023-01-01', 'Ten', '01845622839', NULL, NULL, NULL, 50, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:33:22', '2023-02-07 16:33:22'),
(260, 'MD. Nahid', '2023-01-15', 'Ten', '01990677621', NULL, NULL, NULL, 49, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:35:00', '2023-02-07 16:35:00'),
(261, 'MD. Forhad', '2023-02-01', 'Ten', '01884734723', NULL, NULL, NULL, 50, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:37:11', '2023-02-07 16:37:31'),
(262, 'Liza', '2023-01-01', 'Ten', '01726882221', NULL, NULL, NULL, 49, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:39:22', '2023-02-07 16:39:22'),
(263, 'Kadiza', '2023-01-01', 'Ten', '01821968809', NULL, NULL, NULL, 49, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:43:17', '2023-02-07 16:43:17'),
(264, 'Mim', '2023-01-16', 'Ten', '01826510700', NULL, NULL, NULL, 49, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:46:03', '2023-02-07 16:46:03'),
(265, 'Tania', '2023-01-01', 'Ten', '01849583812', NULL, NULL, NULL, 50, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:47:06', '2023-02-07 16:47:06'),
(266, 'Bristy', '2023-01-15', 'Ten', '01877789342', NULL, NULL, NULL, 49, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:50:08', '2023-02-07 16:50:08'),
(267, 'Dola Rani Das', '2023-01-01', 'Ten', '01731917103', 'Binod Das', '01731917103', NULL, 50, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:51:42', '2023-02-07 16:51:42'),
(268, 'Bisoka Das', '2023-01-07', 'Ten', '01316196223', NULL, NULL, NULL, 50, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:53:07', '2023-02-07 16:53:07'),
(269, 'Liza (H.M)', '2023-02-05', 'Ten', '01812564591', NULL, NULL, NULL, 50, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:54:29', '2023-02-07 16:54:29'),
(270, 'MD. Hridoy', '2023-02-16', '15', '01780420674', NULL, NULL, NULL, 61, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 16:56:28', '2023-02-07 16:56:28'),
(271, 'Nuha', '2023-01-01', '9', '01825757002', NULL, NULL, NULL, 64, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 17:14:30', '2023-02-07 17:14:30'),
(272, 'Tnaha', '2023-01-01', '6&7', '01825757002', NULL, NULL, NULL, 63, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 17:18:35', '2023-02-07 17:18:35'),
(273, 'Muntaha', '2023-01-01', '3 & 5', '01825757002', NULL, NULL, NULL, 65, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 17:19:35', '2023-02-08 14:51:54'),
(274, 'Maha', '2023-01-01', '8', '01715010478', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-07 17:20:43', '2023-02-08 14:51:32'),
(275, 'Mihir', '2023-01-05', '3 & 5', '0171501078', NULL, NULL, NULL, 65, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 14:53:22', '2023-02-08 14:53:22'),
(276, 'Sopna', '2023-01-01', '8', '01822658339', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 14:55:36', '2023-02-08 14:55:36'),
(277, 'Tahani', '2023-01-01', '8', '01833045448', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 14:56:24', '2023-02-08 14:56:24'),
(278, 'Habiba', '2023-02-01', '8', '01860595445', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 14:57:24', '2023-02-08 14:57:24'),
(279, 'Zikra', '2023-02-01', '8', '01881990142', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:00:02', '2023-02-08 15:00:02'),
(280, 'Othai', '2023-02-01', '8', '01741216259', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:01:02', '2023-02-08 15:01:02'),
(281, 'Mahahabuba', '2023-02-02', '8', '01856908134', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:02:28', '2023-02-08 15:02:28'),
(282, 'Tahomina', '2023-02-02', '6&7', '01740718370', NULL, NULL, NULL, 63, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:04:24', '2023-02-08 15:04:24'),
(283, 'Al-Amin', '2023-02-02', '8', '01845445743', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:05:53', '2023-02-08 15:05:53'),
(284, 'Symon', '2023-02-02', '8', '01852619636', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:06:33', '2023-02-08 15:06:33'),
(285, 'Arman', '2023-02-02', '8', '01820914999', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:07:27', '2023-02-08 15:07:27'),
(286, 'Rifat', '2023-02-02', '8', '01812529362', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:08:22', '2023-02-08 15:08:22'),
(287, 'Seju', '2023-02-02', '9', '01616928309', NULL, NULL, NULL, 64, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:09:21', '2023-02-08 15:09:21'),
(288, 'Srabon', '2023-02-02', '9', '01817954062', NULL, NULL, NULL, 64, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:10:29', '2023-02-08 15:10:29'),
(289, 'Fatema', '2023-02-04', '9', '01860596539', NULL, NULL, NULL, 64, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:12:37', '2023-02-08 15:14:34'),
(290, 'Riya', '2023-02-04', '9', '01819067390', NULL, NULL, NULL, 64, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:14:21', '2023-02-08 15:14:21'),
(291, 'Mimtha', '2023-02-04', '15', '01880370676', NULL, NULL, NULL, 61, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:16:00', '2023-02-08 15:16:00'),
(292, 'Hapsa', '2023-02-04', '15', '01824639234', NULL, NULL, NULL, 61, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:16:54', '2023-02-08 15:16:54'),
(293, 'Maspriya', '2023-02-04', '8', '01782796234', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:17:45', '2023-02-08 15:17:45'),
(294, 'Eva', '2023-02-04', '8', '01619134447', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-08 15:18:25', '2023-02-08 15:18:25'),
(295, 'Sayem', '2023-02-09', '15', '01849364995', NULL, NULL, NULL, 61, 52, NULL, 1, NULL, NULL, NULL, '2023-02-10 17:15:43', '2023-02-10 17:15:43'),
(296, 'Khadiza', '2023-02-09', '8', '01882869404', NULL, NULL, NULL, 62, 52, NULL, 1, NULL, NULL, NULL, '2023-02-10 17:16:49', '2023-02-10 17:16:49'),
(297, 'হরিশ চন্দ্র দাস', '2023-03-03', 'All Members', '01706633528', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 00:51:17', '2023-03-04 00:51:17'),
(298, 'অরুন কুমার দাস', '2023-03-03', 'All Members', '01714926683', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 00:53:13', '2023-03-04 00:53:13');
INSERT INTO `students` (`id`, `student_name`, `admission_date`, `student_class`, `student_contact`, `guardian_name`, `guardian_contact`, `clg_name`, `batch_id`, `institution_id`, `user_profile`, `is_active`, `note_address`, `pin`, `unique_id`, `created_at`, `updated_at`) VALUES
(299, 'নীলকন্ঠ সরকার', '2023-03-03', 'All Members', '01309636477', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 00:55:00', '2023-03-04 00:55:00'),
(300, 'মলয় কুমার বৈরাগী', '2023-03-03', 'All Members', '01648397122', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 00:56:41', '2023-03-04 00:56:41'),
(301, 'বিপ্লব দাস', '2023-03-03', 'All Members', '017188041279', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 00:58:08', '2023-03-04 00:58:08'),
(302, 'কমল নার্সারি', '2023-03-03', 'All Members', '01854572580', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 00:59:26', '2023-03-04 00:59:26'),
(303, 'শিবু দাস', '2023-03-03', 'All Members', '01787578193', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 01:01:20', '2023-03-04 01:01:20'),
(304, 'দিলীপ দাস', '2023-03-03', 'All Members', '01711134820', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 01:02:33', '2023-03-04 01:02:33'),
(305, 'গৌরাঙ্গ দাস', '2023-03-03', 'All Members', '01728157962', NULL, NULL, NULL, 59, 62, NULL, 1, NULL, NULL, NULL, '2023-03-04 01:03:59', '2023-03-04 01:03:59'),
(306, 'rokki', '2023-04-18', '6', '01760060524', NULL, NULL, 'ask institttute', 69, 71, NULL, 1, NULL, NULL, NULL, '2023-04-18 20:49:30', '2023-04-18 20:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `student_payments`
--

CREATE TABLE `student_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `pay_year` char(4) NOT NULL,
  `pay_month` char(2) DEFAULT NULL,
  `need_to_pay` double(8,2) NOT NULL DEFAULT 0.00,
  `pay_amount` double(8,2) NOT NULL,
  `pay_discount` double(8,2) DEFAULT NULL,
  `pay_due` double(8,2) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_payments`
--

INSERT INTO `student_payments` (`id`, `student_id`, `pay_year`, `pay_month`, `need_to_pay`, `pay_amount`, `pay_discount`, `pay_due`, `is_paid`, `created_at`, `updated_at`) VALUES
(40, 1, '2022', '8', 500.00, 500.00, NULL, NULL, 1, '2022-09-29 00:32:13', '2022-09-29 00:32:13'),
(47, 12, '2022', '10', 700.00, 400.00, 300.00, 0.00, 1, '2022-10-14 18:32:53', '2022-10-14 18:32:53'),
(48, 12, '2022', '9', 700.00, 0.00, 300.00, 400.00, 0, '2022-10-14 18:35:30', '2022-10-14 18:35:30'),
(49, 12, '2022', '11', 700.00, 400.00, 300.00, 0.00, 1, '2022-10-14 18:45:24', '2022-10-14 18:45:24'),
(50, 119, '2022', NULL, 1500.00, 1000.00, NULL, 500.00, 0, '2022-10-18 09:18:18', '2022-10-18 09:23:25'),
(51, 47, '2022', '4', 800.00, 800.00, 0.00, 0.00, 1, '2022-10-18 17:33:17', '2022-10-18 17:33:17'),
(52, 47, '2022', '5', 800.00, 800.00, 0.00, 0.00, 1, '2022-10-18 17:33:17', '2022-10-18 17:33:17'),
(53, 14, '2022', '0', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(54, 14, '2022', '1', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(55, 14, '2022', '2', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(56, 14, '2022', '3', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(57, 14, '2022', '4', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(58, 14, '2022', '5', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(59, 14, '2022', '6', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(60, 14, '2022', '7', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(61, 14, '2022', '8', 1000.00, 1000.00, NULL, NULL, 1, '2022-10-18 17:34:05', '2022-10-18 17:34:05'),
(64, 121, '2022', '8', 2000.00, 2000.00, NULL, NULL, 1, '2022-10-22 17:05:20', '2022-10-22 17:05:20'),
(65, 121, '2022', '2', 2000.00, 2000.00, NULL, NULL, 1, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(66, 121, '2022', '3', 2000.00, 2000.00, NULL, NULL, 1, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(67, 121, '2022', '4', 2000.00, 2000.00, NULL, NULL, 1, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(68, 121, '2022', '5', 2000.00, 2000.00, NULL, NULL, 1, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(69, 121, '2022', '6', 2000.00, 2000.00, NULL, NULL, 1, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(70, 121, '2022', '7', 2000.00, 2000.00, NULL, NULL, 1, '2022-10-22 17:07:12', '2022-10-22 17:07:12'),
(71, 122, '2022', '9', 500.00, 500.00, NULL, NULL, 1, '2022-10-26 08:29:23', '2022-10-26 08:29:23'),
(72, 122, '2022', '10', 500.00, 500.00, NULL, NULL, 1, '2022-10-26 08:29:23', '2022-10-26 08:29:23'),
(73, 121, '2022', '9', 2000.00, 2000.00, NULL, NULL, 1, '2022-11-15 18:11:34', '2022-11-15 18:11:34'),
(74, 4, '2022', '7', 800.00, 800.00, NULL, NULL, 1, '2022-11-20 16:34:09', '2022-11-20 16:34:09'),
(75, 4, '2022', '8', 800.00, 800.00, NULL, NULL, 1, '2022-11-20 16:34:09', '2022-11-20 16:34:09'),
(76, 120, '2022', '4', 700.00, 700.00, NULL, NULL, 1, '2022-11-27 17:16:57', '2022-11-27 17:16:57'),
(77, 120, '2022', '5', 700.00, 700.00, NULL, NULL, 1, '2022-11-27 17:16:57', '2022-11-27 17:16:57'),
(79, 5, '2022', '7', 800.00, 800.00, NULL, NULL, 1, '2022-12-02 16:59:53', '2022-12-02 16:59:53'),
(80, 5, '2022', '8', 800.00, 800.00, NULL, NULL, 1, '2022-12-02 16:59:53', '2022-12-02 16:59:53'),
(81, 5, '2022', '9', 800.00, 800.00, NULL, NULL, 1, '2022-12-02 16:59:53', '2022-12-02 16:59:53'),
(82, 128, '2022', '11', 600.00, 600.00, NULL, NULL, 1, '2022-12-02 21:51:12', '2022-12-02 21:51:12'),
(83, 130, '2023', '0', 500.00, 500.00, 0.00, 0.00, 1, '2022-12-03 22:54:52', '2022-12-03 22:54:52'),
(84, 6, '2023', '0', 700.00, 700.00, NULL, NULL, 1, '2023-01-02 19:13:45', '2023-01-02 19:13:45'),
(85, 124, '2023', '0', 700.00, 700.00, NULL, NULL, 1, '2023-01-30 10:16:47', '2023-01-30 10:16:47'),
(86, 124, '2023', '1', 700.00, 700.00, NULL, NULL, 1, '2023-01-30 10:16:47', '2023-01-30 10:16:47'),
(87, 119, '2023', NULL, 1500.00, 500.00, 0.00, NULL, 0, '2023-01-30 10:17:54', '2023-01-30 10:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=super,2=institution,3=student',
  `active_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=true,0=false',
  `institution_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `raw_psw` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `role_id`, `level`, `active_status`, `institution_id`, `remember_token`, `created_at`, `updated_at`, `raw_psw`) VALUES
(1, 'I\'m Super Admin', 'admin@gmail.com', '01307035688', NULL, '$2y$10$6LVZu052GRpNRkUJixaHbO6SNNzDk/dSk3Lg7zd7dfSW99Gx0YSHG', 1, 1, 0, NULL, 'bpZrSIUsqCuOB8WHam1z5O8wFtoiRR55GdsKeJIUYQth7Cp3kh031Feh6haV', '2022-09-21 05:23:06', '2022-12-04 13:13:29', 'password'),
(2, 'Rahim Khan', NULL, '01317145646', NULL, '$2y$10$AZW8xyASQqFCFi6BlvgYSuCvoMDB3EPpvJ/d1.mKMDbHsKfcil0ru', NULL, 2, 1, 1, NULL, '2022-09-21 07:20:53', '2022-10-17 20:26:57', 'abcd1234'),
(3, 'Alamgir Hasan', NULL, '01794928580', NULL, '$2y$10$BcNoSs.QuwQL.dzR/4X83.eegM/l2QgYB1oEsbrddfu6jAKZkoU76', NULL, 2, 1, 2, NULL, '2022-09-21 07:45:32', '2022-09-21 07:45:32', NULL),
(4, 'Yousuf', 'shikkhafirst@gmail.com', '01718075903', NULL, '$2y$10$Am8nu2Qw27A2uwgtFSMnAuYQEKqbLDmWCZao9XO3x59ej3ztPOyU2', NULL, 2, 1, 3, NULL, '2022-10-01 22:11:09', '2022-10-18 09:15:12', 'abcd1234'),
(5, 'MD ABDUL KIYOM', NULL, '01717486538', NULL, '$2y$10$Q.BX0zJgOueLH33vrtEjCuSpWbGjucP/xAWdWkAohWhLNs3PUIwjq', NULL, 2, 1, 4, NULL, '2022-10-09 09:53:53', '2022-10-18 21:01:44', 'abcd1234'),
(7, 'Majibar Rahman', NULL, '01556306432', NULL, '$2y$10$jnK3QJsEJ6zjTSChmLZrx.jwGLrl5MvLlJlxUwwcIIviEUxTQmIaS', NULL, 2, 1, 5, NULL, '2022-10-13 07:05:42', '2022-10-13 07:05:42', NULL),
(8, 'Afrukta Akter', NULL, '01718691841', NULL, '$2y$10$EGykkL2434HP7g.34bd5Su3K/087Wu/mCFuzf.VA/Cc9wuAUC4jaS', NULL, 2, 1, 6, NULL, '2022-10-14 17:36:57', '2022-10-14 17:36:57', NULL),
(9, 'MUHAMMAD SAMIUL HAQUE', 'samiul41@yahoo.com', '01976788615', NULL, '$2y$10$jC7nw821xZOLjfduHtktS.zXPLmF0jrkeYFp.54k1Pm2pJQ6Un8M6', NULL, 2, 1, 7, 'F5k08qo4P5BFdxlZEV7JWNURrAUzntyzrUog6h6VAFmUqplKD5obifRxlj6e', '2022-10-14 17:52:13', '2022-10-18 08:42:59', '01976788615'),
(10, 'Abidur Rahman', 'rahmanabidur050@gmail.com', '01966224012', NULL, '$2y$10$eUd/7fDI7g8S4aELMt9Q8.Lanu4gRBmoqTBC7p5k5XGxnweEH02re', NULL, 2, 1, 8, NULL, '2022-10-17 19:25:13', '2022-10-17 19:25:13', NULL),
(11, 'মোঃ আমীরুল ইসলাম', 'rahansth@gmail.com', '01828562365', NULL, '$2y$10$XaLCgWLCbqRaxmsvRSXxl.ApeFChEJoABGLA1eCSkX7F2NCUGSYna', NULL, 2, 1, 9, '4NY7ZlJR2FPJ1fgF9qe1dbeMAWElvlsSpvhXmHSir78b9Do6nug7iEDa0Jfe', '2022-10-18 09:56:38', '2022-10-18 09:56:38', 'Amir1995'),
(12, 'আরিশা কোচিং সেন্টার', 'azshraban78@gmail.com', '01724199661', NULL, '$2y$10$nhb.yFLH6I6QDA1KWt7lMeao4UrOcMOW1CPr077ECDHi9hyE8yMQa', NULL, 2, 1, 10, NULL, '2022-10-21 10:00:52', '2022-10-21 10:00:52', 'arisha12'),
(13, 'MD. EMADUL HAQUE', 'emadulhaque81@gmail.com', '01741289412', NULL, '$2y$10$DNb3f8GioRAT8w7m7KC47.EVHvhIJJSXlNeKZ9ht59r54zhBv/B4i', NULL, 2, 1, 11, 'ByxZIkrHyUiBos2tYwEqVuoiziJNThvs16FOE0FgMr9Osev4GHVbNHVISAnE', '2022-10-22 16:47:06', '2022-10-22 16:47:06', '20071982'),
(14, 'Md.Ilias Ahmed', 'ilias.ahcb@gmail.com', '01912582600', NULL, '$2y$10$Fcrv7pwZg85dpxkeEedGiuZjRsNA5fvIlZ0A77rbgoC8RGEZo/5Ta', NULL, 2, 1, 12, NULL, '2022-10-24 18:03:20', '2022-10-24 18:03:20', '12345678'),
(15, 'MD. ANARUL ISLAM', 'anarul090219@gmail.com', '01403608189', NULL, '$2y$10$4EUm7PRGdYF4ScIUgGCHGOhY/l/AptJFjRYzVydW3K1vgmtJc3IDi', NULL, 2, 1, 13, NULL, '2022-10-24 20:31:36', '2022-10-24 20:31:36', 'cseku090219'),
(16, 'Mustak Tahmid Ovi', NULL, '01762811527', NULL, '$2y$10$LUCuQq8K8uodr1ry1bS7PeJ1.eZpOB74tP1.TQej7kN.QxBs1zEpS', NULL, 2, 1, 14, NULL, '2022-10-26 08:16:31', '2022-10-26 08:16:31', '00000000'),
(17, 'Mohammad Jahangir Alam', 'jahangirshs@gmail.com', '01715736735', NULL, '$2y$10$gr10DokxBJz0BIax9dHcDetAmlr51hnYHCXFPc9qIs9Ei77JthCUa', NULL, 2, 1, 15, '1pbDpDQmVJmlcURCWbKT9oAmZ6yTQWC7zu5OEa0w6lhmUeCy0hC9N4RRz642', '2022-11-04 09:01:29', '2022-11-04 09:01:29', 'jahangir'),
(18, 'shadhin rahman', NULL, '01726559942', NULL, '$2y$10$BhKU2XLdFLG38jgRU51bw.k/2K4JqEIvP8FRT9MtuGOkh5A1xTmC2', NULL, 2, 1, 16, NULL, '2022-11-29 11:23:18', '2022-11-29 11:23:18', '64726472'),
(19, 'Milon Bhuiyan', 'bmsa.edu@gmail.com', '01703507336', NULL, '$2y$10$kpswX51HXIaHvOYZx9f9aezjp1vPEGmlaE.Tw3lF09haRCxXdW46u', NULL, 2, 1, 17, NULL, '2022-11-29 12:36:30', '2022-11-29 12:36:30', '123123123'),
(20, 'মোঃ শাহিনুর রহমান পাটোয়ারী', 'patowary131990@gmail.com', '01722388713', NULL, '$2y$10$SZ6h.VzbpDfh5X5OiBuPU.CALMalW6W8XOX.G6G2eT8Ppx4/7tbpu', NULL, 2, 1, 18, 'qvalW5piXTK0FjL8hzHEPhD4t50NdeCgx60auXToZCGyrzUof91re1eebeBR', '2022-11-29 12:40:57', '2022-11-29 12:40:57', 'Patowary13'),
(21, 'MD. MIRAJ UDDIN', 'miraj1618@gmail.com', '01832102330', NULL, '$2y$10$CtPBFN4MrcXpdGxv6zgRseRpklqPeqI7gF7mNDgL7s.D3sWoECdZq', NULL, 2, 1, 19, NULL, '2022-11-29 16:48:26', '2022-11-29 16:48:26', 'miraj1618'),
(22, 'BAMUNDI KARIGORI TRAINING CENTER', 'odhora.ornob@gmail.com', '01701315034', NULL, '$2y$10$fgkBTPagLZhVL46h9DqJeOJSnnYQe.YY0RG3SwUy08UnDyJL8vAN.', NULL, 2, 1, 20, NULL, '2022-11-29 20:38:18', '2022-11-29 20:38:18', 'BKTC2842'),
(23, 'নাজমুল হক প্রদীপ', 'Nazmulhaquepradip@gmail.com', '01798817882', NULL, '$2y$10$ld9uYohiC2mAzivdFE7LJ.sJBFxGmnqzxEC08ItOw0G69xzNaMEpq', NULL, 2, 1, 21, NULL, '2022-11-29 21:55:40', '2022-11-29 21:55:40', 'ALLAHISALMIGHTY1'),
(24, 'MD. TUFAIL AHAMMED', 'tufayelahammed31@gmail.com', '01715284131', NULL, '$2y$10$s8kmmLsm8oU8pCD6p1GWNOpwGfk1bRTORlKvXOa2HeHgFH76AsruW', NULL, 2, 1, 22, NULL, '2022-11-29 23:12:36', '2022-11-29 23:12:36', 'tu567890.@'),
(25, 'Mustak Ahmed Bappi', 'mbappi1992@gmail.com', '01743222959', NULL, '$2y$10$5hoY4Y9Hey6CMU0z1Bi38u4j9L9C5lbQlwe/I/1CfG3mIky1JOKKm', NULL, 2, 1, 23, NULL, '2022-11-30 11:43:52', '2022-11-30 11:43:52', 'guardians'),
(26, 'Md. Zahidul Islam', 'mdzahidulislam57@gmail.com', '01744368146', NULL, '$2y$10$azPNksIafPO5KwWPuW7P3e0KVKPXsZWE3DiK8u38yYlwtFdBGAsAG', NULL, 2, 1, 24, NULL, '2022-11-30 15:23:52', '2022-11-30 15:23:52', 'M@sum@95'),
(27, 'Ms.yeasir', 'activeeducare235@gmail.com', '01531722856', NULL, '$2y$10$PX4kEltQATLhY0JVFVeDU.7jW71Qo1F8I1umggfHnF4TYJxhzwVfq', NULL, 2, 1, 25, NULL, '2022-11-30 17:02:54', '2022-11-30 17:02:54', 'pappu7878'),
(28, 'Md Zakir Hossain', 'hmzakir7373@gmail.com', '01511627373', NULL, '$2y$10$CpaDevQ6z1KDVy3DBm2k5.Aw9KgI9jDj7MnXzQ5d7FXhKtNraqAe6', NULL, 2, 1, 26, NULL, '2022-12-01 19:02:47', '2022-12-01 19:02:47', '01511627373'),
(29, 'Md. Azizul Hoque', 'azizul.math@gmail.com', '01913137694', NULL, '$2y$10$LRNoLc7hS3NGBBLOebt9G.3qr1p.dUAAzabQuRpAZJEgHLRlRoZZ6', NULL, 2, 1, 27, NULL, '2022-12-01 19:10:44', '2022-12-01 19:10:44', 'Azizul790'),
(30, 'Md. Jamal Hossen', 'jamalhossen345@gmail.com', '01834123998', NULL, '$2y$10$osJjgPRUkNAfBkzCXN9LdufGVQ58VK0.7TBgTTmYKg9vGl6/Tkas.', NULL, 2, 1, 28, NULL, '2022-12-01 19:19:34', '2022-12-01 19:19:34', 'jamal123998'),
(31, 'Rajib Roy', NULL, '01774378476', NULL, '$2y$10$p/FUe8WeL.wfUQvkbDgXDObhWlLl1FVtzhGiBrIPAllfkz7l1s6iG', NULL, 2, 1, 29, NULL, '2022-12-01 19:21:26', '2022-12-01 19:21:26', 'rajib777***'),
(32, 'AHAMMAD ALI', 'ahmad12081986@gmail.com', '01724647362', NULL, '$2y$10$7/pwz/qr/XpZNkkEmek/SOuCXgKNxztgnkgvWPpznDzyRQFqKlmsi', NULL, 2, 1, 30, NULL, '2022-12-01 19:40:28', '2022-12-01 19:40:28', 'ahmad2464'),
(33, 'নিউ অনুশীলন কোচিং সেন্টার', 'helal017kp@gmail.com', '01785052492', NULL, '$2y$10$zZ8gNAojSH0O794kTFCsheUux8fK25mTfU68yfrkhWP/icSm2SJSe', NULL, 2, 1, 31, 'oi3gIEgRCMdC12VzUD32EBbTLsWe3lt3SiYc5ffb2meEhSSNvFT0JKsQXlyj', '2022-12-01 19:43:39', '2022-12-01 19:43:39', '32056632'),
(34, 'Md. Masud rana', 'mayerdoyaa017@gmail.com', '1725443003', NULL, '$2y$10$MtcchNBQ924Nv.toXD1vM.4m3Ngni6oJ059TM1J1UUb1h8PPNl1nG', NULL, 2, 1, 32, NULL, '2022-12-01 20:03:19', '2022-12-01 20:03:19', '01725443003'),
(35, 'Md. Mizanur Rahman', 'choyon.ru4003@gmail.com', '01750365533', NULL, '$2y$10$mK81JljXWt/RhwOBdV1d8.iWinCvAuXqNDO3dI5NyFo5Td5Lzc8Ga', NULL, 2, 1, 33, NULL, '2022-12-01 23:12:10', '2022-12-01 23:12:10', '01743780990n'),
(36, 'salahuddin russell', 'salahuddin.russell@gmail.com', '01619116699', NULL, '$2y$10$VVmM2eM8OLieig9DZeE/Web/6sTElKz9CXuh1IoZq1NKPaZN1o0oi', NULL, 2, 1, 34, NULL, '2022-12-02 10:18:42', '2022-12-02 10:18:42', 'dob531978?'),
(37, 'Md Monirul Islam', NULL, '01767162653', NULL, '$2y$10$Rla4/4Y3./iD1uuESacOL.Q7HRD1bAtP3aq.xdtx0CHoboIhKD22C', NULL, 2, 1, 35, NULL, '2022-12-02 11:28:28', '2022-12-02 11:28:28', 'msmonirul53'),
(38, 'JAHID SIR', 'jahidsir.net@gmail.com', '1919184184', NULL, '$2y$10$xC6pjje8y9.lWy9ele9qbeltQgaymY1SHFhqfqvgjxKDIdSrnbBsC', NULL, 2, 1, 36, NULL, '2022-12-02 13:27:39', '2022-12-02 13:27:39', 'Jahid.187@'),
(39, 'মোঃ মনির হোসেন', 'mdmonir126491@gmail.com', '01767687804', NULL, '$2y$10$1CCu/wqLqZPRZ2w0D2Xt1.dp.5ZcyA5Gr1DsWi2PoMIEtK/5fO8Re', NULL, 2, 1, 37, NULL, '2022-12-02 15:41:32', '2022-12-02 15:41:32', 'monir126491'),
(40, 'Md. Abdullah al Mamun', 'mamunmy21@gmail.com', '01735710521', NULL, '$2y$10$gWlWDJCWx7EMm62oieUlF.2M73WiXQCogZbbwX74pw99ovsZTGxim', NULL, 2, 1, 38, NULL, '2022-12-02 18:46:22', '2022-12-02 18:46:22', 'mamunsafa21'),
(41, 'নিউ স্টার (NS) এডুকেশন', NULL, '01722060244', NULL, '$2y$10$RIJwNKuskTopZasUUzN60O4XJseh5nfmGl0xcg3.7IrKnQYdVk.LW', NULL, 2, 1, 39, 'W3s8L1Ezd3PyMXDZiuIfA3L5W1V4ujnv50sWSH2DcVLqTbtWEZNCUcfbykcm', '2022-12-02 21:24:38', '2022-12-02 21:24:38', 'APON1911'),
(42, 'Md Mosharraf Hossain', 'mosharraf8801711120876@gmail.com', '01711120876', NULL, '$2y$10$qY6jNHmoFaE7b6kO24hQ.eDCT0U.JI5yDG9nBXgp7gWpAWRjB9Z0y', NULL, 2, 1, 40, NULL, '2022-12-03 08:34:47', '2022-12-03 08:34:47', 'M@120876'),
(43, 'Jehad Asraf', 'jehadasrafuddin46@gmail.com', '01321869396', NULL, '$2y$10$wKE0bDuFauBjhtvRXm7kyeWrJBCht4g.S9hCLpQp6f3oeYLedzgDO', NULL, 2, 1, 41, 'CJ19Tj0p2Qy2AoPsimOYAmD7t2XlbpGsF7gzEGHxOjMDXASV1V7693yQ3m1P', '2022-12-03 13:25:55', '2022-12-03 13:25:55', 'Bankasia0159'),
(44, 'Rupan Chakma', 'chakmarupan52@gmail.com', '01518903267', NULL, '$2y$10$YrBQ4DyaNBHODUUgzWhcdOZIRTVc77rkN2j7H8mzUHiLk8yohT1p.', NULL, 2, 1, 42, NULL, '2022-12-03 15:59:42', '2022-12-03 15:59:42', 'rupanbd143'),
(45, 'Md Faisal islam', 'faisal.bcse@gmail.com', '01788228500', NULL, '$2y$10$M9.S5z.tCsYhwu2vOeCiQ.P14L4bOEqyBKxjbyfThuMowqvU4U572', NULL, 2, 1, 43, NULL, '2022-12-03 22:36:58', '2022-12-03 22:36:58', 'aassddff'),
(46, 'Niyamul Rasid Sani', 'niamulroshid@gmail.com', '01746508889', NULL, '$2y$10$WLC.tVNmIRQ.0eUX.zAyC.DOcjKqq.D.wrhZu/KjGX/sBMEFKvQc6', NULL, 2, 1, 44, NULL, '2022-12-03 22:42:37', '2022-12-03 22:42:37', 'Niyamul12'),
(47, 'মো. মোজাম্মেল হোসেন', 'mamozammelzi1990@gmail.com', '01312659150', NULL, '$2y$10$JItAI6Sn2cUxUsaUq3Tqf.SrQwRO9DqoUwgJZ6WBWSkkHFlVEFdD6', NULL, 2, 1, 45, NULL, '2022-12-04 07:06:15', '2022-12-04 07:06:15', 'mamun1234'),
(48, 'Dulal dattta', 'dulaldatta11@gmail.com', '01746950911', NULL, '$2y$10$0tNTxvcp50KqLa7h.Qf0.OW7gXBWb.Pfm5rAySQwUtXj3M7096dmK', NULL, 2, 1, 46, NULL, '2022-12-04 09:46:55', '2022-12-04 09:46:56', 'dulal123'),
(49, 'MD. MONIRUL ISLAM', 'paradoxicalmonir@gmail.com', '01758523129', NULL, '$2y$10$WQdfSR7B75.9xNVqy4fSCuFiNQl0UoHfwoMv7sIA4QWdpD5pOomJW', NULL, 2, 1, 47, NULL, '2022-12-04 10:04:18', '2022-12-04 10:04:18', '202020mi'),
(50, 'Md Saifullah', 'mdsaifullah77469@gmail.com', '01552636185', NULL, '$2y$10$fJhskQyhqm6anoFWT/cmhO6tMutrz6guffudwyO9WXLeevbUFxj9u', NULL, 2, 1, 48, NULL, '2022-12-04 18:47:52', '2022-12-04 18:47:52', 'Saif_1234'),
(51, 'Md. Al- Mamun', 'itzacademicworld@gmail.com', '01681032503', NULL, '$2y$10$4ERQsdly.y0C6us4YYV4quNTJYhe8vEFpffXMVgLs3CyQHuVEuIMG', NULL, 2, 1, 49, NULL, '2022-12-04 22:43:14', '2022-12-04 22:43:14', 'zafanaitz'),
(53, 'Nabo Kumar Bhatacharjee', 'nabomirtunjoy@gmail.vom', '+8801716352325', NULL, '$2y$10$5.Q8paQ3Bp8lv/lqZ0C2te0cZFX7lm.delEpVBDxvLrHKiuzaeMZ2', NULL, 2, 1, 51, NULL, '2022-12-05 18:11:59', '2022-12-05 18:11:59', 'qwerasdf'),
(54, 'BETA MATH ACADEMY', 'betamathacademy@gmail.com', '01979421021', NULL, '$2y$10$eptEHSg.7UfkSrFZRS7P7eJI4.FVfb8JJBsIfbk63qQVLQp8VN7wq', NULL, 2, 1, 52, NULL, '2022-12-05 19:43:14', '2022-12-05 19:43:14', '01979421021'),
(55, 'Syful Islam', 'jms.syful@gmail.com', '01710926320', NULL, '$2y$10$YofCrdmu5S8Es7Zh.1VE6OXLmiI4Hm6erSLpRxvg/oJ4t4h5i9iji', NULL, 2, 1, 53, NULL, '2022-12-05 21:13:55', '2022-12-05 21:13:55', '06207010'),
(56, 'Student care academic & private coaching center', 'mdiraqhossain01@gmail.com', '01601616512', NULL, '$2y$10$MvT61u3daEsBOB06gL2G2eGpgwBq20Sdorc5J1KOb93WIXdtUUddq', NULL, 2, 1, NULL, NULL, '2022-12-06 01:17:12', '2022-12-06 01:17:12', 'iraq486248'),
(57, 'Student care academic & private coaching center', 'mdiraqhossain49@gmail.com', '01749616512', NULL, '$2y$10$xQPCRekyEvwZBR/5DrRMFeVJmokdzG/QPwRrev1YGBrCQJShnYvC2', NULL, 2, 1, NULL, NULL, '2022-12-06 01:20:16', '2022-12-06 01:20:16', 'iraq486248'),
(58, 'Md.mojibul.haqe.', 'Mojibulhaqe958@gmail.com', '01837191065', NULL, '$2y$10$7DCb/4kmXV8hDEEr6p2nZuSygCtimltPzNPsBciJ/YhumpKfBae9i', NULL, 2, 1, 54, NULL, '2022-12-06 16:39:19', '2022-12-06 16:39:19', '345mojibul'),
(59, 'অহিদুজ্জামান', 'mdohid26@gmail.com', '01776309104', NULL, '$2y$10$6/gh5ub25gv8JhKG3Bm.v.nHgtKaFyv/ktSNiB7LVm3HHXc797KzK', NULL, 2, 1, 55, NULL, '2022-12-07 14:34:32', '2022-12-07 14:34:32', '01776309104'),
(60, 'PANJARI PRIVATE CENTER', 'arifulislam01021998@gmail.com', '01768939882', NULL, '$2y$10$s0muPBYOL93T/W8DofFkQeJUt3HT8i/dnKoUVXz6XHeP.AQCh1cpW', NULL, 2, 1, 56, NULL, '2022-12-07 15:51:16', '2022-12-07 15:51:16', '01768939882'),
(61, 'Md Murshed Kamal', 'mdmurshedkamalchm@gmail.com', '01870551208', NULL, '$2y$10$xzw.WGtSwJXm2E.URxE/i.2DUOazBkx3.rjSP3W1zlKgG/0VdXdMy', NULL, 2, 1, 57, NULL, '2022-12-08 11:25:07', '2022-12-08 11:25:07', 'creative@'),
(62, 'রায়হান', 'jahidsir@gmail.com', '01875978797', NULL, '$2y$10$twVtynQz7CDDh8947XC0GOVIJvEkcxHvh.i5nfIV4ggRf5MOFrnca', NULL, 2, 1, 36, NULL, '2022-12-10 19:47:19', '2022-12-10 19:48:35', '12345678'),
(63, 'Mosharrof Hossain', 'ronenice2017@gmail.com', '01735007681', NULL, '$2y$10$CaiJqF4n4ASA8i0fASyZ..3BDemG.kwebSEFiDwn4zZjX.tIe5ESu', NULL, 2, 1, 58, NULL, '2022-12-19 17:43:56', '2022-12-19 17:43:56', '01735007681'),
(64, 'salman', 'salmanhossain.xyt@gmail.com', '01990960456', NULL, '$2y$10$ipyQZh3gDDEr8yhprInuxOPN5zXvcc3IZ6TSlt0aA5OooC9SmxZWq', NULL, 2, 1, 59, NULL, '2022-12-29 21:24:22', '2023-02-01 22:50:04', '01990960456'),
(65, 'Iqbal hasan Lekhon', 'iqbalhasanlekhon@gmail.com', '01772928684', NULL, '$2y$10$fCWfJrlMiAo7jseo7luA9e7mYCe7TdXFwKvtHFzKGRHyyJtyMfpjG', NULL, 2, 1, 60, NULL, '2022-12-30 17:06:36', '2022-12-30 17:06:36', 'iqbalhasan'),
(66, 'Md Rahim  Ali', 'rahimali110022@gmail.com', '01743662561', NULL, '$2y$10$MlS08qpWE6Mw2AkImeCTQ.hcR2KoA3OfPgrU45MMEgBwXjg4QuHSq', NULL, 2, 1, 61, NULL, '2023-01-06 18:03:43', '2023-01-06 18:03:43', '@rahimali'),
(67, 'ANIMESH SUTRADHAR', 'animesh070707@gmail.com', '01718217423', NULL, '$2y$10$AdTDRuCFbRrMbAbYWFQ5AeottLRuhBlXVAwr6cn/FptMbp1b.Vz42', NULL, 2, 1, 62, 'WkkhcTig5UJsuGLYucNmxupkvgNc9xZCkE1R6BzprWLoXFREnsAeJVRTxk1j', '2023-01-23 11:25:36', '2023-01-23 11:25:36', 'animesh1975'),
(68, 'আব্দুল্লাহ লালু', NULL, '01840051419', NULL, '$2y$10$cqv.3jX/HZEbwVmPguFfiuU0ZzOkAQz10uZkLSHVmY8zEvSy9580W', NULL, 2, 1, 63, NULL, '2023-02-05 08:38:57', '2023-02-05 08:38:57', '44493289'),
(69, 'আব্দুল্লাহ লালু', NULL, '01777313300', NULL, '$2y$10$xP5dKLnovNC8QDE5F7rCA.2i5D5BTduKWTjqgPrfVQPMs3UJnVjJ2', NULL, 2, 1, 64, NULL, '2023-02-05 13:56:57', '2023-02-05 13:56:57', '44493289'),
(70, 'বৈরচুনা নিউ মডেল কেজি স্কুল', 'diliprajbongshi2018@gmail.com', '01755339940', NULL, '$2y$10$nVvjNpIQFAvK5O8kfFnHfemJf.r/Qngf6gseXeHa1w5zB91.O5KcS', NULL, 2, 1, 65, NULL, '2023-02-05 17:39:15', '2023-02-05 17:39:15', '@123456#'),
(71, 'Shohag', 'momota843301@gmail.com', '01620192646', NULL, '$2y$10$iaroJP5dv5MU48R733qjwOB8TH.lWXbO1DYIbW7rhwfDHBrd7FGZe', NULL, 2, 1, 66, NULL, '2023-02-05 17:45:23', '2023-02-05 17:45:24', 'S01714314514s%'),
(72, 'ENGLISH BUS', 'subrata22shuvo@gmail.com', '01730590974', NULL, '$2y$10$wnhQRWao/GMDx1g9T3En3ObFfRtlrscgP11/GC0P0e2QtVck1.Owi', NULL, 2, 1, 67, NULL, '2023-02-23 01:22:54', '2023-02-23 01:22:54', '12345678'),
(73, 'MD. KHALID HASAN', 'h.Khalid9458@gmail.com', '01319126576', NULL, '$2y$10$THUEO6Gdeyt5eM790M5UlO//1NC7D3qPFItqYfWlzbl4gZCAmFTGa', NULL, 2, 1, 68, NULL, '2023-02-26 00:09:03', '2023-02-26 00:09:03', 'khalid@1720031'),
(74, 'SAIFUL ISLAM', 'smprivet726@gmail.com', '+8801773729897', NULL, '$2y$10$AQdsM549Tvj4JzTJhb2u1er/8LE7KaZy7TU0L7VTnDYLOgnuTWHFy', NULL, 2, 1, 69, NULL, '2023-02-26 01:25:57', '2023-02-26 01:25:57', 'smprivet726'),
(75, 'Ayman ausaf mokter', 'mokterbapari12@gmail.com', '01327693318', NULL, '$2y$10$mor9hJQ6QTDUelgEGd8BP.AR6unIuccQ9kfru0Y2qjYFoJFUDkEfe', NULL, 2, 1, 70, NULL, '2023-03-31 14:41:08', '2023-03-31 14:41:08', 'M01972636642B'),
(76, 'Ayan Khan Shuvro', 'ayankhanlog@gmail.com', '01979278216', NULL, '$2y$10$t6hPviZSMT.3CIaWLqWkIewhCu8na4/a95.a61OSzoWnPkpeYV0A6', NULL, 2, 1, 71, NULL, '2023-04-18 20:46:24', '2023-04-18 20:46:24', 'HWreiXdmUu5aNRt'),
(77, 'Md.Rajibur Rahman', 'rajiburmath@gmail.com', '+8801521313053', NULL, '$2y$10$AhNRwYSpcBfAcY1A/tkf8ObkPrNebDvNzxK19ABv5Mp27krgv4LU2', NULL, 2, 1, 72, NULL, '2023-04-26 17:27:50', '2023-04-26 17:27:50', '100645Rr@@'),
(78, 'Md Rahim  Ali', 'rahimali01743662561@gmail.com', '01737815960', NULL, '$2y$10$4gijgzbIQsCEZfZN2aBskeh4lknrAWJ24Kd29Xu.kN.4tSY73BLN2', NULL, 2, 1, 73, NULL, '2023-05-14 21:42:52', '2023-05-14 21:42:52', '67t938QwC4BVWQn'),
(79, 'Omar Faroque', 'faroquedocuments@gmail.com', '01912154899', NULL, '$2y$10$H2qcobHprVr5CLHb6qRAGufNMy9E0sbUi7BXdDVRDm.N0QNbAJtJ6', NULL, 2, 1, 74, NULL, '2023-06-12 19:15:27', '2023-06-12 19:15:27', '01717180936@cvc'),
(80, 'Rebeka Sultana', 'rebeka.ndmhs@gmail.com', '01851612635', NULL, '$2y$10$a1Wka51984Qg9I8Un5Idaejs95H4tQozL42a980G7XaI239K287Hq', NULL, 2, 1, 75, NULL, '2023-06-12 19:18:37', '2023-06-12 19:18:37', '31121987');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batches_institution_id_index` (`institution_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ins_sms`
--
ALTER TABLE `ins_sms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ins_sms_institution_id_foreign` (`institution_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `online_payments`
--
ALTER TABLE `online_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_payments_student_id_foreign` (`student_id`),
  ADD KEY `online_payments_reference_index` (`reference`);

--
-- Indexes for table `online_payment_details`
--
ALTER TABLE `online_payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_payment_details_online_payment_id_foreign` (`online_payment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_student_id_index` (`student_id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_details_payment_id_index` (`payment_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_histories`
--
ALTER TABLE `sms_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_histories_institution_id_foreign` (`institution_id`),
  ADD KEY `sms_histories_student_id_foreign` (`student_id`);

--
-- Indexes for table `sms_packages`
--
ALTER TABLE `sms_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_package_purchases`
--
ALTER TABLE `sms_package_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_package_purchases_institution_id_index` (`institution_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_batch_id_index` (`batch_id`),
  ADD KEY `students_institution_id_index` (`institution_id`),
  ADD KEY `students_unique_id_index` (`unique_id`);

--
-- Indexes for table `student_payments`
--
ALTER TABLE `student_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_payments_student_id_index` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_institution_id_foreign` (`institution_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `ins_sms`
--
ALTER TABLE `ins_sms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `online_payments`
--
ALTER TABLE `online_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `online_payment_details`
--
ALTER TABLE `online_payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_histories`
--
ALTER TABLE `sms_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=507;

--
-- AUTO_INCREMENT for table `sms_packages`
--
ALTER TABLE `sms_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_package_purchases`
--
ALTER TABLE `sms_package_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `student_payments`
--
ALTER TABLE `student_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_payments`
--
ALTER TABLE `student_payments`
  ADD CONSTRAINT `student_payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
