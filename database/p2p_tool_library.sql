-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2026 at 12:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `p2p_tool_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `battery_health`
--

CREATE TABLE `battery_health` (
  `battery_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `charge_cycles` int(11) DEFAULT 0,
  `health_percentage` int(11) DEFAULT 100,
  `last_checked` timestamp NOT NULL DEFAULT current_timestamp(),
  `voltage` decimal(5,2) DEFAULT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `needs_replacement` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `battery_health`
--

INSERT INTO `battery_health` (`battery_id`, `tool_id`, `charge_cycles`, `health_percentage`, `last_checked`, `voltage`, `temperature`, `needs_replacement`) VALUES
(1, 1, 150, 85, '2026-04-29 12:10:30', NULL, NULL, 0),
(2, 1, 10, 95, '2026-05-02 08:57:49', NULL, NULL, 0),
(3, 3, 1, 100, '2026-05-02 13:35:14', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `librarian_id` int(11) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `actual_return_time` timestamp NULL DEFAULT NULL,
  `rental_cost` decimal(15,2) NOT NULL,
  `deposit_amount` decimal(15,2) NOT NULL,
  `insurance_amount` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `discount_amount` decimal(15,2) DEFAULT 0.00,
  `promo_code_applied` varchar(50) DEFAULT NULL,
  `status` enum('pending','confirmed','active','completed','cancelled','disputed','overdue') DEFAULT 'pending',
  `qr_handover_code` varchar(100) DEFAULT NULL,
  `handover_time` timestamp NULL DEFAULT NULL,
  `return_handover_time` timestamp NULL DEFAULT NULL,
  `late_fee_charged` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `tool_id`, `borrower_id`, `librarian_id`, `start_time`, `end_time`, `actual_return_time`, `rental_cost`, `deposit_amount`, `insurance_amount`, `total_price`, `discount_amount`, `promo_code_applied`, `status`, `qr_handover_code`, `handover_time`, `return_handover_time`, `late_fee_charged`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 5, '2024-12-01 08:00:00', '2024-12-03 16:00:00', NULL, 450.00, 1000.00, 22.50, 1472.50, 0.00, NULL, 'completed', NULL, NULL, NULL, 0.00, '2024-11-25 08:00:00', '2026-04-27 21:53:29'),
(2, 3, 4, 5, '2024-12-10 07:00:00', '2024-12-15 15:00:00', NULL, 1000.00, 2000.00, 100.00, 3100.00, 0.00, NULL, 'completed', NULL, NULL, NULL, 0.00, '2024-12-05 12:00:00', '2026-04-27 21:53:29'),
(3, 5, 2, 5, '2025-01-05 06:00:00', '2025-01-07 18:00:00', NULL, 540.00, 1500.00, 43.20, 2083.20, 0.00, NULL, 'completed', NULL, NULL, NULL, 0.00, '2025-01-01 07:00:00', '2026-04-27 21:53:29'),
(4, 1, 2, NULL, '2026-04-30 09:13:46', '2026-05-02 09:13:46', NULL, 300.00, 1000.00, 15.00, 1315.00, 0.00, NULL, 'pending', NULL, NULL, NULL, 0.00, '2026-04-29 09:13:46', '2026-04-29 09:13:46'),
(5, 1, 2, NULL, '2026-04-30 09:27:28', '2026-05-02 09:27:28', NULL, 300.00, 1000.00, 15.00, 1315.00, 0.00, NULL, 'pending', NULL, NULL, NULL, 0.00, '2026-04-29 09:27:28', '2026-04-29 09:27:28'),
(6, 6, 13, 12, '2026-05-02 12:12:10', '2026-05-04 12:11:00', NULL, 0.00, 600.00, 0.00, 600.00, 0.00, 'AM123', 'pending', 'f38ce4fe0b0b9960e8d66853c1387b12ffe180ee19b08a4c99f490db31753a9b', NULL, NULL, 0.00, '2026-05-02 12:12:10', '2026-05-02 12:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `level` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `icon_url` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `parent_id`, `name`, `level`, `description`, `icon_url`, `created_at`) VALUES
(1, NULL, 'Power Tools', 1, 'Electric and battery-powered tools for professional and home use', NULL, '2026-04-27 21:53:29'),
(2, NULL, 'Hand Tools', 1, 'Manual tools for various tasks', NULL, '2026-04-27 21:53:29'),
(3, NULL, 'Gardening Tools', 1, 'Outdoor and garden equipment', NULL, '2026-04-27 21:53:29'),
(4, NULL, '3D Printers', 1, '3D printing equipment and accessories', NULL, '2026-04-27 21:53:29'),
(5, NULL, 'Safety Equipment', 1, 'Protective gear and safety equipment', NULL, '2026-04-27 21:53:29'),
(6, 1, 'Drills', 2, 'Electric drills and hammer drills', NULL, '2026-04-27 21:53:29'),
(7, 1, 'Saws', 2, 'Circular saws, jigsaws, and band saws', NULL, '2026-04-27 21:53:29'),
(8, 1, 'Sanders', 2, 'Orbital and belt sanders', NULL, '2026-04-27 21:53:29'),
(9, 2, 'Hammers', 2, 'Various types of hammers', NULL, '2026-04-27 21:53:29'),
(10, 2, 'Screwdrivers', 2, 'Manual and electric screwdrivers', NULL, '2026-04-27 21:53:29'),
(11, 3, 'Lawn Mowers', 2, 'Gas and electric lawn mowers', NULL, '2026-04-27 21:53:29'),
(12, 3, 'Trimmers', 2, 'Hedge trimmers and grass trimmers', NULL, '2026-04-27 21:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `consumables_inventory`
--

CREATE TABLE `consumables_inventory` (
  `consumable_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `consumable_type` varchar(100) NOT NULL,
  `current_quantity` decimal(10,2) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `reorder_threshold` decimal(10,2) NOT NULL,
  `reorder_quantity` decimal(10,2) DEFAULT NULL,
  `last_reordered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consumables_inventory`
--

INSERT INTO `consumables_inventory` (`consumable_id`, `tool_id`, `consumable_type`, `current_quantity`, `unit`, `reorder_threshold`, `reorder_quantity`, `last_reordered_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Drill Bits', 25.00, 'pieces', 10.00, NULL, NULL, '2026-04-29 12:10:30', '2026-04-29 12:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `damage_reports`
--

CREATE TABLE `damage_reports` (
  `report_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `reported_by_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `photo_evidence_url` varchar(500) DEFAULT NULL,
  `estimated_repair_cost` decimal(10,2) DEFAULT NULL,
  `technician_id` int(11) DEFAULT NULL,
  `status` enum('pending','under_review','approved','rejected','resolved') DEFAULT 'pending',
  `librarian_decision` text DEFAULT NULL,
  `decision_by_librarian_id` int(11) DEFAULT NULL,
  `decision_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `damage_reports`
--

INSERT INTO `damage_reports` (`report_id`, `booking_id`, `reported_by_id`, `description`, `photo_evidence_url`, `estimated_repair_cost`, `technician_id`, `status`, `librarian_decision`, `decision_by_librarian_id`, `decision_at`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'ay haga delwaqt', '/uploads/damage_photos/69f22cf62959e_Screenshot 2026-04-20 084702.png', NULL, NULL, 'pending', NULL, NULL, NULL, '2026-04-29 16:08:22', '2026-04-29 16:08:22');

-- --------------------------------------------------------

--
-- Table structure for table `disposal_records`
--

CREATE TABLE `disposal_records` (
  `disposal_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `disposal_reason` enum('unrepairable','unsafe','obsolete','damaged','recalled') NOT NULL,
  `disposal_method` enum('recycled','donated','parted_out','landfill','certified_disposal') NOT NULL,
  `recycling_certificate` varchar(255) DEFAULT NULL,
  `recycling_center` varchar(255) DEFAULT NULL,
  `eco_notes` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disposal_records`
--

INSERT INTO `disposal_records` (`disposal_id`, `tool_id`, `technician_id`, `disposal_reason`, `disposal_method`, `recycling_certificate`, `recycling_center`, `eco_notes`, `approved_by`, `approved_at`, `created_at`) VALUES
(1, 2, 13, 'unrepairable', 'parted_out', '12', 'mesh aaarefff', 'lets try', NULL, NULL, '2026-05-02 10:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `dispute_reports`
--

CREATE TABLE `dispute_reports` (
  `dispute_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `reported_by_id` int(11) NOT NULL,
  `reported_against_id` int(11) NOT NULL,
  `dispute_type` enum('damage','late_return','missing_tool','deposit_dispute','other') NOT NULL,
  `description` text NOT NULL,
  `evidence_photos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`evidence_photos`)),
  `librarian_notes` text DEFAULT NULL,
  `status` enum('pending','under_review','resolved','rejected') DEFAULT 'pending',
  `assigned_librarian_id` int(11) DEFAULT NULL,
  `decision` text DEFAULT NULL,
  `deposit_decision` enum('full_refund','partial_refund','no_refund','charge_lender') DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT 0.00,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dispute_reports`
--

INSERT INTO `dispute_reports` (`dispute_id`, `booking_id`, `reported_by_id`, `reported_against_id`, `dispute_type`, `description`, `evidence_photos`, `librarian_notes`, `status`, `assigned_librarian_id`, `decision`, `deposit_decision`, `refund_amount`, `resolved_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3, 'damage', 'The tool was returned with a broken handle. I have photos as evidence.', NULL, NULL, 'pending', NULL, NULL, NULL, 0.00, NULL, '2026-05-01 15:58:30', '2026-05-01 15:58:30');

-- --------------------------------------------------------

--
-- Table structure for table `escrow_transactions`
--

CREATE TABLE `escrow_transactions` (
  `transaction_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `transaction_type` enum('deposit','rental','insurance','refund','penalty','damage_claim') NOT NULL,
  `status` enum('held','released_to_lender','released_to_borrower','claimed','disputed') DEFAULT 'held',
  `librarian_approved_at` timestamp NULL DEFAULT NULL,
  `approved_by_librarian_id` int(11) DEFAULT NULL,
  `release_date` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `escrow_transactions`
--

INSERT INTO `escrow_transactions` (`transaction_id`, `booking_id`, `amount`, `transaction_type`, `status`, `librarian_approved_at`, `approved_by_librarian_id`, `release_date`, `notes`, `created_at`, `updated_at`) VALUES
(1, 6, 600.00, 'deposit', 'held', NULL, NULL, NULL, NULL, '2026-05-02 12:12:10', '2026-05-02 12:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_articles`
--

CREATE TABLE `knowledge_articles` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `tool_category_id` int(11) DEFAULT NULL,
  `knowledge_category_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `helpful_count` int(11) DEFAULT 0,
  `not_helpful_count` int(11) DEFAULT 0,
  `status` enum('draft','published','archived') DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `knowledge_articles`
--

INSERT INTO `knowledge_articles` (`article_id`, `title`, `content`, `tool_category_id`, `knowledge_category_id`, `author_id`, `tags`, `views`, `helpful_count`, `not_helpful_count`, `status`, `created_at`, `updated_at`) VALUES
(7, 'How to Fix Drill Motor Burnout', 'Step-by-step guide to diagnose and fix motor burnout in power drills...', 1, 1, 13, 'drill, motor, burnout, repair', 0, 25, 0, 'published', '2026-05-02 09:39:56', '2026-05-02 09:39:56'),
(8, '3D Printer Bed Leveling Guide', 'Complete guide to leveling your 3D printer bed for perfect first layers...', 4, 2, 13, '3d printer, bed leveling, calibration', 0, 42, 0, 'published', '2026-05-02 09:39:56', '2026-05-02 09:39:56'),
(9, 'Lithium Battery Health Check', 'How to test and maintain lithium-ion batteries...', NULL, 3, 13, 'battery, lithium, health, testing', 0, 18, 0, 'published', '2026-05-02 09:39:56', '2026-05-02 09:39:56'),
(10, 'ay7aga', 'lets repair everything', 3, 1, 13, 'drill, repair, battery', 5, 1, 1, 'published', '2026-05-02 10:27:30', '2026-05-02 13:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_categories`
--

CREATE TABLE `knowledge_categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `knowledge_categories`
--

INSERT INTO `knowledge_categories` (`category_id`, `name`, `description`, `icon`, `parent_id`, `created_at`) VALUES
(1, 'Power Tools', 'Repair tips for drills, saws, sanders', 'fas fa-bolt', NULL, '2026-05-02 09:34:24'),
(2, '3D Printers', 'Troubleshooting and maintenance for 3D printers', 'fas fa-print', NULL, '2026-05-02 09:34:24'),
(3, 'Battery Tools', 'Battery issues, charging problems', 'fas fa-battery-full', NULL, '2026-05-02 09:34:24'),
(4, 'Safety Equipment', 'Safety gear maintenance and inspection', 'fas fa-shield-alt', NULL, '2026-05-02 09:34:24'),
(5, 'Power Tools', 'Repair tips for drills, saws, sanders', 'fas fa-bolt', NULL, '2026-05-02 09:35:09'),
(6, '3D Printers', 'Troubleshooting and maintenance for 3D printers', 'fas fa-print', NULL, '2026-05-02 09:35:09'),
(7, 'Battery Tools', 'Battery issues, charging problems', 'fas fa-battery-full', NULL, '2026-05-02 09:35:09'),
(8, 'Safety Equipment', 'Safety gear maintenance and inspection', 'fas fa-shield-alt', NULL, '2026-05-02 09:35:09'),
(9, 'Power Tools', 'Repair tips for drills, saws, sanders', 'fas fa-bolt', NULL, '2026-05-02 09:39:56'),
(10, '3D Printers', 'Troubleshooting and maintenance for 3D printers', 'fas fa-print', NULL, '2026-05-02 09:39:56'),
(11, 'Battery Tools', 'Battery issues, charging problems', 'fas fa-battery-full', NULL, '2026-05-02 09:39:56'),
(12, 'Safety Equipment', 'Safety gear maintenance and inspection', 'fas fa-shield-alt', NULL, '2026-05-02 09:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_comments`
--

CREATE TABLE `knowledge_comments` (
  `comment_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `knowledge_comments`
--

INSERT INTO `knowledge_comments` (`comment_id`, `article_id`, `user_id`, `comment`, `created_at`) VALUES
(1, 10, 13, 'aaaaaaa', '2026-05-02 10:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_logs`
--

CREATE TABLE `maintenance_logs` (
  `maintenance_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `technician_id` int(11) DEFAULT NULL,
  `task_description` text NOT NULL,
  `cost` decimal(10,2) DEFAULT 0.00,
  `usage_hours_at_service` int(11) DEFAULT 0,
  `service_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `next_service_due` timestamp NULL DEFAULT NULL,
  `priority_score` int(11) DEFAULT 0,
  `status` enum('scheduled','in_progress','completed','cancelled') DEFAULT 'scheduled',
  `completed_at` timestamp NULL DEFAULT NULL,
  `repair_shop_name` varchar(255) DEFAULT NULL,
  `external_repair_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_logs`
--

INSERT INTO `maintenance_logs` (`maintenance_id`, `tool_id`, `technician_id`, `task_description`, `cost`, `usage_hours_at_service`, `service_date`, `next_service_due`, `priority_score`, `status`, `completed_at`, `repair_shop_name`, `external_repair_id`, `created_at`, `updated_at`) VALUES
(1, 1, 13, 'Routine inspection and cleaning', 50.00, 0, '2026-04-29 12:10:30', NULL, 0, 'scheduled', NULL, NULL, NULL, '2026-04-29 12:10:30', '2026-05-02 13:34:37'),
(2, 1, 13, 'repair the machine', 250.00, 1, '2026-05-02 08:40:28', NULL, 0, 'completed', NULL, NULL, NULL, '2026-05-02 08:40:28', '2026-05-02 08:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `membership_tiers`
--

CREATE TABLE `membership_tiers` (
  `tier_id` int(11) NOT NULL,
  `tier_name` varchar(50) NOT NULL,
  `discount_rate` decimal(5,2) DEFAULT 0.00,
  `min_rentals_required` int(11) DEFAULT 0,
  `min_trust_score` decimal(5,2) DEFAULT 0.00,
  `max_tool_value` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `membership_tiers`
--

INSERT INTO `membership_tiers` (`tier_id`, `tier_name`, `discount_rate`, `min_rentals_required`, `min_trust_score`, `max_tool_value`, `created_at`) VALUES
(1, 'Basic', 0.00, 0, 0.00, NULL, '2026-04-27 21:53:29'),
(2, 'Silver', 5.00, 5, 70.00, NULL, '2026-04-27 21:53:29'),
(3, 'Gold', 10.00, 15, 80.00, NULL, '2026-04-27 21:53:29'),
(4, 'Platinum', 15.00, 30, 90.00, NULL, '2026-04-27 21:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `encrypted_content` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `receiver_id`, `booking_id`, `encrypted_content`, `is_read`, `read_at`, `sent_at`) VALUES
(5, 2, 3, NULL, 'Hello! I saw you have a drill for rent. Is it available?', 1, '2026-05-01 08:26:59', '2026-04-30 07:53:30'),
(6, 3, 2, NULL, 'Yes, it is available! When do you need it?', 1, '2026-04-30 09:26:11', '2026-04-30 07:58:30'),
(7, 2, 3, NULL, 'I need it for this weekend. How much per day?', 1, '2026-05-01 08:26:59', '2026-04-30 08:03:30'),
(8, 3, 2, NULL, '150 EGP per day. Does that work for you?', 1, '2026-04-30 09:26:11', '2026-04-30 08:08:30'),
(9, 3, 2, NULL, 'aG93', 1, '2026-05-01 12:20:10', '2026-05-01 12:18:35'),
(10, 3, 2, NULL, 'bm93', 1, '2026-05-01 12:20:10', '2026-05-01 12:19:25'),
(11, 3, 2, NULL, 'aGVsbG8=', 1, '2026-05-01 12:39:38', '2026-05-01 12:39:30'),
(12, 3, 7, NULL, 'aG93IGFyZSB5b3U=', 1, '2026-05-01 12:55:58', '2026-05-01 12:55:15'),
(13, 7, 3, NULL, 'aSBhbSBmaW5lIHRoYW5rIHlvdQ==', 1, '2026-05-01 12:56:13', '2026-05-01 12:56:07'),
(14, 12, 7, NULL, 'aGk=', 0, NULL, '2026-05-01 18:58:05'),
(15, 12, 7, NULL, 'aGVsbG8=', 0, NULL, '2026-05-02 13:38:32'),
(16, 12, 7, NULL, 'YWJkbyBzYXllZA==', 0, NULL, '2026-05-02 14:40:34');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `message`, `type`, `booking_id`, `tool_id`, `is_read`, `read_at`, `created_at`) VALUES
(1, 3, 'Your booking for Bosch Hammer Drill has been confirmed', 'booking_confirmed', NULL, NULL, 1, NULL, '2024-11-25 09:00:00'),
(2, 3, 'Reminder: Return your tool by tomorrow', 'return_reminder', NULL, NULL, 0, NULL, '2024-12-02 07:00:00'),
(3, 4, 'Your booking for Creality 3D Printer is starting soon', 'booking_reminder', NULL, NULL, 0, NULL, '2024-12-09 08:00:00'),
(4, 2, 'You received a 5-star review from Ahmed Mostafa', 'new_review', NULL, NULL, 0, NULL, '2024-12-04 13:00:00'),
(5, 2, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(6, 3, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(7, 4, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(8, 7, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(9, 8, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(10, 9, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(11, 10, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(12, 11, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 1, '2026-05-02 08:21:50', '2026-05-01 19:42:41'),
(13, 12, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 1, '2026-05-02 08:16:00', '2026-05-01 19:42:41'),
(14, 13, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 1, '2026-05-02 09:58:01', '2026-05-01 19:42:41'),
(15, 17, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(16, 18, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(17, 19, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(18, 21, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(19, 23, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(20, 24, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(21, 25, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(22, 26, 'winter vibes: winter starts tomorrow', 'broadcast', NULL, NULL, 0, NULL, '2026-05-01 19:42:41'),
(23, 2, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(24, 3, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(25, 4, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(26, 7, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(27, 8, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(28, 9, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(29, 10, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(30, 11, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 1, '2026-05-02 08:23:01', '2026-05-02 08:22:09'),
(31, 12, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 1, '2026-05-02 08:23:44', '2026-05-02 08:22:09'),
(32, 13, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 1, '2026-05-02 09:58:01', '2026-05-02 08:22:09'),
(33, 17, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(34, 18, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(35, 19, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(36, 21, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(37, 23, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(38, 24, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(39, 25, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(40, 26, 'hello: hollllllllllaaaaaaaaaaa', 'broadcast', NULL, NULL, 0, NULL, '2026-05-02 08:22:09'),
(41, 4, 'New booking request from Mohamed Technician. Please review and confirm.', 'booking_request', 6, NULL, 0, NULL, '2026-05-02 12:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int(11) NOT NULL,
  `promo_code` varchar(50) NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `min_booking_value` decimal(10,2) DEFAULT 0.00,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used_count` int(11) DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`promotion_id`, `promo_code`, `discount_percent`, `category_id`, `zone_id`, `min_booking_value`, `max_discount_amount`, `usage_limit`, `used_count`, `start_date`, `end_date`, `is_active`, `created_by`, `created_at`) VALUES
(11, 'WELCOME10', 10.00, NULL, NULL, 100.00, 50.00, 100, 0, '2026-05-01', '2026-05-31', 1, 12, '2026-05-01 15:17:28'),
(12, 'SUMMER20', 20.00, NULL, NULL, 200.00, 100.00, 50, 0, '2026-05-01', '2026-06-30', 1, 12, '2026-05-01 15:17:28'),
(13, 'POWER15', 15.00, 1, NULL, 150.00, 75.00, 30, 0, '2026-05-01', '2026-06-15', 1, 12, '2026-05-01 15:17:28'),
(14, 'MAADI10', 10.00, NULL, 1, 50.00, 30.00, 20, 0, '2026-05-01', '2026-05-16', 1, 12, '2026-05-01 15:17:28'),
(15, 'FLASH50', 50.00, NULL, NULL, 500.00, 250.00, 10, 0, '2026-05-01', '2026-05-08', 1, 12, '2026-05-01 15:17:28'),
(17, 'AM123', 15.00, NULL, NULL, 120.00, NULL, 25, 12, '2026-05-01', '2026-06-01', 1, 12, '2026-05-01 15:25:00'),
(18, 'NA123', 25.00, 4, NULL, 250.00, NULL, 25, 0, '2026-05-01', '2026-06-01', 1, 12, '2026-05-01 15:47:23'),
(19, 'MY123', 55.00, NULL, NULL, 370.00, NULL, 201, 1, '2026-05-02', '2026-06-02', 1, 11, '2026-05-02 08:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `referral_rewards`
--

CREATE TABLE `referral_rewards` (
  `reward_id` int(11) NOT NULL,
  `referrer_id` int(11) NOT NULL,
  `referred_user_id` int(11) NOT NULL,
  `reward_amount` decimal(10,2) NOT NULL DEFAULT 100.00,
  `status` enum('pending','credited','cancelled') DEFAULT 'pending',
  `credited_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `refund_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `librarian_notes` text DEFAULT NULL,
  `processed_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repair_cost_estimates`
--

CREATE TABLE `repair_cost_estimates` (
  `estimate_id` int(11) NOT NULL,
  `tool_category_id` int(11) DEFAULT NULL,
  `fault_type` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `estimated_cost_min` decimal(10,2) NOT NULL,
  `estimated_cost_max` decimal(10,2) NOT NULL,
  `estimated_time_hours` int(11) DEFAULT NULL,
  `common_fix` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repair_cost_estimates`
--

INSERT INTO `repair_cost_estimates` (`estimate_id`, `tool_category_id`, `fault_type`, `description`, `estimated_cost_min`, `estimated_cost_max`, `estimated_time_hours`, `common_fix`) VALUES
(1, 1, 'Motor Burnout', 'Electric motor stopped working or burning smell', 400.00, 800.00, 3, 'Replace motor brushes or entire motor'),
(2, 1, 'Battery Not Charging', 'Battery won\'t hold charge or charger issues', 200.00, 500.00, 2, 'Replace battery cells or charger'),
(3, 2, 'Blade Dull/Bent', 'Saw blade not cutting straight or dull', 50.00, 150.00, 1, 'Sharpen or replace blade'),
(4, 3, 'Gearbox Failure', 'Grinding noise or gears slipping', 300.00, 600.00, 4, 'Replace gear assembly'),
(5, 4, 'Heated Bed Not Working', '3D printer heated bed not reaching temperature', 150.00, 350.00, 2, 'Replace heating element or thermistor');

-- --------------------------------------------------------

--
-- Table structure for table `replacement_parts`
--

CREATE TABLE `replacement_parts` (
  `part_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `part_name` varchar(255) NOT NULL,
  `part_number` varchar(100) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `cost_per_unit` decimal(10,2) NOT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_contact` varchar(100) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `expected_delivery_date` date DEFAULT NULL,
  `received_date` timestamp NULL DEFAULT NULL,
  `status` enum('ordered','shipped','received','installed') DEFAULT 'ordered',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `replacement_parts`
--

INSERT INTO `replacement_parts` (`part_id`, `tool_id`, `part_name`, `part_number`, `quantity`, `cost_per_unit`, `supplier_name`, `supplier_contact`, `order_date`, `expected_delivery_date`, `received_date`, `status`, `notes`) VALUES
(1, 2, 'motor', '1', 1, 200.00, 'abdo', '0102245852', '2026-05-02 09:25:22', '2026-05-01', NULL, 'ordered', 'motor is fault');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `reviewee_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `tool_condition_rating` int(11) DEFAULT NULL CHECK (`tool_condition_rating` between 1 and 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `booking_id`, `reviewer_id`, `reviewee_id`, `rating`, `comment`, `tool_condition_rating`, `created_at`) VALUES
(1, 1, 3, 2, 5, 'Excellent drill! Worked perfectly for my renovation project. Owner was very helpful.', 5, '2026-04-27 21:53:29'),
(2, 2, 4, 3, 4, 'Great 3D printer, but took a while to calibrate. Good experience overall.', 4, '2026-04-27 21:53:29'),
(3, 3, 2, 4, 5, 'Lawn mower worked great. Made my garden look fantastic!', 5, '2026-04-27 21:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `permission_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `permission` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`permission_id`, `role_name`, `permission`) VALUES
(5, 'admin', 'manage_all_bookings'),
(4, 'admin', 'manage_all_tools'),
(2, 'admin', 'manage_roles'),
(1, 'admin', 'manage_users'),
(3, 'admin', 'view_reports'),
(6, 'librarian', 'approve_bookings'),
(7, 'librarian', 'manage_tools'),
(10, 'member', 'borrow_tools'),
(11, 'member', 'list_tools'),
(12, 'member', 'view_profile'),
(9, 'technician', 'update_maintenance'),
(8, 'technician', 'view_maintenance');

-- --------------------------------------------------------

--
-- Table structure for table `technician_performance`
--

CREATE TABLE `technician_performance` (
  `performance_id` int(11) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `total_repairs` int(11) DEFAULT 0,
  `completed_repairs` int(11) DEFAULT 0,
  `avg_repair_time_hours` decimal(10,2) DEFAULT 0.00,
  `success_rate` decimal(5,2) DEFAULT 0.00,
  `customer_rating` decimal(3,2) DEFAULT 0.00,
  `month` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technician_performance`
--

INSERT INTO `technician_performance` (`performance_id`, `technician_id`, `total_repairs`, `completed_repairs`, `avg_repair_time_hours`, `success_rate`, `customer_rating`, `month`, `created_at`) VALUES
(1, 13, 2, 1, 36.00, 50.00, 0.00, '2026-05-01', '2026-05-02 10:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `tool_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `tool_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  `weekly_rate` decimal(10,2) DEFAULT NULL,
  `deposit_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `insurance_percent` decimal(5,2) DEFAULT 5.00,
  `buffer_hours` int(11) DEFAULT 24,
  `max_borrow_days` int(11) DEFAULT 14,
  `min_trust_score_required` decimal(5,2) DEFAULT 0.00,
  `status` enum('available','borrowed','maintenance','retired','pending_approval') DEFAULT 'pending_approval',
  `external_repair_id` varchar(100) DEFAULT NULL,
  `repair_shop_name` varchar(255) DEFAULT NULL,
  `repair_status` enum('pending','sent','in_progress','completed','returned') DEFAULT NULL,
  `sent_for_repair_at` timestamp NULL DEFAULT NULL,
  `expected_return_date` date DEFAULT NULL,
  `current_location_lat` decimal(10,8) DEFAULT NULL,
  `current_location_lng` decimal(11,8) DEFAULT NULL,
  `total_borrow_count` int(11) DEFAULT 0,
  `total_revenue` decimal(15,2) DEFAULT 0.00,
  `is_featured` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`tool_id`, `owner_id`, `category_id`, `zone_id`, `tool_name`, `description`, `serial_number`, `hourly_rate`, `daily_rate`, `weekly_rate`, `deposit_amount`, `insurance_percent`, `buffer_hours`, `max_borrow_days`, `min_trust_score_required`, `status`, `external_repair_id`, `repair_shop_name`, `repair_status`, `sent_for_repair_at`, `expected_return_date`, `current_location_lat`, `current_location_lng`, `total_borrow_count`, `total_revenue`, `is_featured`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 1, 'Bosch Professional Hammer Drill', 'Powerful 800W hammer drill with 13mm chuck, ideal for concrete and masonry', NULL, NULL, 150.00, NULL, 1000.00, 5.00, 24, 14, 0.00, 'maintenance', '55', '7neish', 'sent', '2026-05-02 09:22:37', '2026-05-02', 29.96800000, 31.25180000, 0, 0.00, 1, '2026-04-27 21:53:29', '2026-05-02 09:22:37', NULL),
(2, 2, 2, 1, 'DEWALT Circular Saw 7-1/4\"', 'High-performance circular saw with 15A motor, includes carbide blade', NULL, NULL, 120.00, NULL, 800.00, 5.00, 24, 14, 0.00, 'retired', NULL, NULL, NULL, NULL, NULL, 29.96800000, 31.25180000, 0, 0.00, 1, '2026-04-27 21:53:29', '2026-05-02 10:44:14', '2026-05-02 10:44:14'),
(3, 3, 4, 2, 'Creality Ender 3 V2 3D Printer', 'Popular 3D printer with heated bed, 220x220x250mm build volume', NULL, NULL, 200.00, NULL, 2000.00, 10.00, 24, 14, 60.00, 'available', NULL, NULL, NULL, NULL, NULL, 30.05160000, 31.36430000, 0, 0.00, 1, '2026-04-27 21:53:29', '2026-04-27 21:53:29', NULL),
(5, 4, 6, 3, 'Electric Lawn Mower', '1600W electric lawn mower, 17-inch cutting width', NULL, NULL, 180.00, NULL, 1500.00, 8.00, 24, 14, 50.00, 'available', NULL, NULL, NULL, NULL, NULL, 30.05880000, 31.22390000, 0, 0.00, 1, '2026-04-27 21:53:29', '2026-04-27 21:53:29', NULL),
(6, 4, 7, 3, 'Hedge Trimmer', '550W electric hedge trimmer, 20-inch dual-action blades', NULL, NULL, 90.00, NULL, 600.00, 5.00, 24, 14, 0.00, 'available', NULL, NULL, NULL, NULL, NULL, 30.05880000, 31.22390000, 0, 0.00, 0, '2026-04-27 21:53:29', '2026-04-27 21:53:29', NULL),
(7, 2, 3, 1, 'Bosch Jigsaw', '650W jigsaw with adjustable speed, 4 orbital actions', NULL, NULL, 100.00, NULL, 700.00, 5.00, 24, 14, 0.00, 'available', NULL, NULL, NULL, NULL, NULL, 29.96800000, 31.25180000, 0, 0.00, 0, '2026-04-27 21:53:29', '2026-04-27 21:53:29', NULL),
(8, 3, 1, 2, 'Impact Driver Kit', '18V brushless impact driver, includes 2 batteries and charger', NULL, NULL, 130.00, NULL, 1200.00, 8.00, 24, 14, 40.00, 'available', NULL, NULL, NULL, NULL, NULL, 30.05160000, 31.36430000, 0, 0.00, 1, '2026-04-27 21:53:29', '2026-04-27 21:53:29', NULL),
(9, 3, 2, 1, 'Makita Orbital Sander', '5-inch random orbit sander, variable speed control', NULL, NULL, 80.00, NULL, 500.00, 5.00, 24, 14, 0.00, 'pending_approval', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, '2026-04-29 15:56:03', '2026-04-29 15:56:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trust_score_history`
--

CREATE TABLE `trust_score_history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `old_score` decimal(5,2) NOT NULL,
  `new_score` decimal(5,2) NOT NULL,
  `change_reason` varchar(255) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `change_type` enum('borrow_completed','late_return','damage_report','positive_review','negative_review','resolution') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trust_score_history`
--

INSERT INTO `trust_score_history` (`history_id`, `user_id`, `old_score`, `new_score`, `change_reason`, `booking_id`, `change_type`, `created_at`) VALUES
(1, 3, 85.00, 88.00, 'Successfully completed borrowing', 1, 'borrow_completed', '2026-04-27 21:53:29'),
(2, 3, 88.00, 90.00, 'Received positive review', 1, 'positive_review', '2026-04-27 21:53:29'),
(3, 4, 70.00, 75.00, 'Successfully completed borrowing', 2, 'borrow_completed', '2026-04-27 21:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `role` enum('member','librarian','technician','admin') DEFAULT 'member',
  `current_trust_score` decimal(5,2) DEFAULT 0.00,
  `tier_id` int(11) DEFAULT NULL,
  `wallet_balance` decimal(15,2) DEFAULT 0.00,
  `referral_code` varchar(50) DEFAULT NULL,
  `referred_by_id` int(11) DEFAULT NULL,
  `kyc_status` enum('pending','verified','rejected') DEFAULT 'pending',
  `kyc_document_url` varchar(500) DEFAULT NULL,
  `is_blacklisted` tinyint(1) DEFAULT 0,
  `blacklist_reason` text DEFAULT NULL,
  `blacklisted_at` timestamp NULL DEFAULT NULL,
  `suspension_end_date` timestamp NULL DEFAULT NULL,
  `suspension_reason` varchar(255) DEFAULT NULL,
  `auto_suspended` tinyint(1) DEFAULT 0,
  `total_borrow_count` int(11) DEFAULT 0,
  `on_time_return_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password_hash`, `full_name`, `phone`, `address`, `latitude`, `longitude`, `role`, `current_trust_score`, `tier_id`, `wallet_balance`, `referral_code`, `referred_by_id`, `kyc_status`, `kyc_document_url`, `is_blacklisted`, `blacklist_reason`, `blacklisted_at`, `suspension_end_date`, `suspension_reason`, `auto_suspended`, `total_borrow_count`, `on_time_return_count`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'mariam@example.com', '$2y$10$/UUQb7DguUPxo8.4qC1Es.LhjxNqdcU/vBJBYfP7u/rxo/gwiV.vG', 'Mariam Hassan', '+201234567891', NULL, 29.96800000, 31.25180000, 'member', 95.00, 4, 5000.00, 'MARIAM01', NULL, 'verified', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-27 21:53:29', '2026-04-30 08:46:27', NULL),
(3, 'ahmed@example.com', '$2y$10$MszT7YBIbVkf2FwD4V9ZDOywwhAcLMvC7GQ1JRx4KOeXxwH5RlZJG', 'Ahmed Mostafa', '+201234567892', NULL, 30.05160000, 31.36430000, 'member', 88.00, 3, 5000.00, 'AHMED01', NULL, 'verified', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-27 21:53:29', '2026-04-29 09:52:38', NULL),
(4, 'sara@example.com', 'e10adc3949ba59abbe56e057f20f883e', 'Sara Khalid', '+201234567893', NULL, 30.05880000, 31.22390000, 'member', 75.00, 2, 5000.00, 'SARA01', NULL, 'verified', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-27 21:53:29', '2026-04-29 09:52:24', NULL),
(7, 'yahyamohamed2492006@gmail.com', '$2y$10$0cWgDx5YSUmWnb4XpC8r1eGbFpD3kEYqX9Bvw/I.sY9e0wE6645YW', 'yahya', '01009290417', NULL, NULL, NULL, 'member', 0.00, NULL, 5000.00, 'D11EA686', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 09:51:24', '2026-05-01 12:55:50', NULL),
(8, 'john@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'yahya', '0123456789', NULL, NULL, NULL, 'member', 0.00, NULL, 5000.00, '866ED4ED', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 10:37:59', '2026-04-29 09:52:24', NULL),
(9, 'test_1777372851@example.com', 'e10adc3949ba59abbe56e057f20f883e', 'Test User', '0123456789', NULL, NULL, NULL, 'member', 0.00, NULL, 5000.00, '1C9E3AEC', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 10:40:51', '2026-04-29 09:52:24', NULL),
(10, 'ahmed@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'yahya', '0123456789', NULL, NULL, NULL, 'member', 0.00, NULL, 5000.00, '6602FEF3', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 10:44:53', '2026-04-29 09:52:24', NULL),
(11, 'admin@toollibrary.com', '$2y$10$X3Sbi7Hy4jPI96kVeMABp.qmWXtL83FJPqgd34PqUlyOvgMQNvGi.', 'System Administrator', '+201234567890', NULL, NULL, NULL, 'admin', 100.00, NULL, 10000.00, 'ADMIN001', NULL, 'verified', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 15:15:36', '2026-04-29 11:07:12', NULL),
(12, 'librarian@toollibrary.com', '$2y$10$wBIsqX3L3anPVsQ0XucJ0OOGsZJhCCektIBIqdAti8lhgQNbZhM4W', 'Ahmed Librarian', '+201234567891', NULL, NULL, NULL, 'librarian', 100.00, NULL, 5000.00, 'LIB001', NULL, 'verified', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 15:15:36', '2026-05-01 13:16:53', NULL),
(13, 'technician@toollibrary.com', '$2y$10$4uZxTLNY5rqaIZNQ0ZhROO3pl0kT.N43Ch11Eg0NfaVPjp8O7rpoe', 'Mohamed Technician', '+201234567892', NULL, NULL, NULL, 'technician', 100.00, NULL, 2400.00, 'TECH001', NULL, 'verified', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 15:15:36', '2026-05-02 12:12:10', NULL),
(17, 'admin2@toollibrary.com', 'e10adc3949ba59abbe56e057f20f883e', 'Admin User', '01234567890', NULL, NULL, NULL, 'admin', 0.00, NULL, 0.00, NULL, NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 15:18:18', '2026-04-29 09:52:24', NULL),
(18, '7heish@toollibrary.com', 'e10adc3949ba59abbe56e057f20f883e', '7neish', '0123456789', NULL, NULL, NULL, 'librarian', 0.00, NULL, 0.00, 'ADC068E7', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 17:52:45', '2026-04-29 09:52:24', NULL),
(19, '7heish12@toollibrary.com', 'e10adc3949ba59abbe56e057f20f883e', '7neish123', '01234567891', NULL, NULL, NULL, 'member', 0.00, NULL, 5000.00, 'A39D971D', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-28 17:55:55', '2026-04-29 09:52:24', NULL),
(21, 'test_1777452612213@example.com', 'e10adc3949ba59abbe56e057f20f883e', 'Test User', '0123456789', NULL, NULL, NULL, 'librarian', 0.00, NULL, 0.00, '48D57F90', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-29 08:50:12', '2026-04-29 09:52:24', NULL),
(23, 'testuser@example.com', 'e10adc3949ba59abbe56e057f20f883e', 'Test User', '01234567890', NULL, NULL, NULL, 'member', 0.00, NULL, 5000.00, NULL, NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-04-29 09:40:31', '2026-05-01 15:49:25', NULL),
(24, 'ay7aga@toollibrary.com', '$2y$10$e2eLCTHRugB83/slLzQ86uRsz61NqCfdImLWvHc2GcJBDamSdB0Wi', 'ay7aga', '0100000000', NULL, NULL, NULL, 'technician', 0.00, NULL, 0.00, 'A74FA595', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-05-01 18:50:04', '2026-05-01 18:50:04', NULL),
(25, 'testuser1@example.com', '$2y$10$3uZPa276HQwtrkV.qqOphuAv45WlqqvQONx5oLAZyBBG2nOn04NLG', 'Test User', '0123456789', NULL, NULL, NULL, 'member', 0.00, NULL, 0.00, '04040423', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-05-01 19:10:31', '2026-05-01 19:10:31', NULL),
(26, 'aaaaaaaaa@toollibrary.com', '$2y$10$NaMb7vX5C9RjbVlnjyFMV.FRh/LPrXhwEH8M5O/Tv/evOPCf8efKq', 'aaa', '15987456', NULL, NULL, NULL, 'technician', 0.00, NULL, 0.00, '44A80F49', NULL, 'pending', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-05-01 19:17:13', '2026-05-01 19:17:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_log`
--

CREATE TABLE `user_activity_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_activity_log`
--

INSERT INTO `user_activity_log` (`log_id`, `user_id`, `action`, `details`, `ip_address`, `created_at`) VALUES
(1, 11, 'login', 'User logged in', '127.0.0.1', '2026-04-28 16:29:05'),
(2, 18, 'user_created', 'User created with role: librarian', '::1', '2026-04-28 17:52:45'),
(3, 19, 'user_created', 'User created with role: member', '::1', '2026-04-28 17:55:55'),
(5, 21, 'user_created', 'User created with role: librarian', '::1', '2026-04-29 08:50:12'),
(8, 11, 'user_deleted', 'User ID 22 deleted permanently', '::1', '2026-04-29 08:59:28'),
(9, 11, 'user_deleted', 'User ID 20 deleted permanently', '::1', '2026-04-29 08:59:44'),
(10, 24, 'user_created', 'User created with role: technician', '::1', '2026-05-01 18:50:04'),
(11, 25, 'user_created', 'User created with role: member', '::1', '2026-05-01 19:10:31'),
(12, 26, 'user_created', 'User created with role: technician', '::1', '2026-05-01 19:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `librarian_id` int(11) DEFAULT NULL,
  `center_latitude` decimal(10,8) NOT NULL,
  `center_longitude` decimal(11,8) NOT NULL,
  `radius_km` decimal(5,2) DEFAULT 5.00,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `name`, `librarian_id`, `center_latitude`, `center_longitude`, `radius_km`, `is_active`, `created_at`) VALUES
(1, 'Maadi', 5, 29.96800000, 31.25180000, 5.00, 1, '2026-04-27 21:53:29'),
(2, 'Nasr City', 5, 30.05160000, 31.36430000, 5.00, 1, '2026-04-27 21:53:29'),
(3, 'Zamalek', 5, 30.05880000, 31.22390000, 5.00, 1, '2026-04-27 21:53:29'),
(4, 'Heliopolis', 5, 30.09080000, 31.32260000, 10.00, 1, '2026-04-27 21:53:29'),
(5, 'Downtown', 5, 30.04440000, 31.23570000, 3.00, 1, '2026-04-27 21:53:29'),
(6, 'Maadi', NULL, 29.96800000, 31.25180000, 5.00, 1, '2026-05-01 14:57:53'),
(7, 'Nasr City', NULL, 30.05160000, 31.36430000, 5.00, 1, '2026-05-01 14:57:53'),
(8, 'Zamalek', NULL, 30.05880000, 31.22390000, 5.00, 1, '2026-05-01 14:57:53'),
(9, 'Heliopolis', NULL, 30.09080000, 31.32260000, 10.00, 1, '2026-05-01 14:57:53'),
(10, 'Downtown Cairo', NULL, 30.04440000, 31.23570000, 3.00, 1, '2026-05-01 14:57:53'),
(11, 'Mohandiseen', NULL, 30.05600000, 31.21000000, 4.00, 1, '2026-05-01 14:57:53'),
(12, 'Dokki', NULL, 30.03600000, 31.21500000, 3.00, 1, '2026-05-01 14:57:53'),
(13, '6th October City', NULL, 29.93600000, 30.93600000, 15.00, 1, '2026-05-01 14:57:53'),
(14, 'New Cairo', NULL, 30.02000000, 31.45000000, 12.00, 1, '2026-05-01 14:57:53'),
(15, 'Shubra', NULL, 30.07200000, 31.24000000, 4.00, 1, '2026-05-01 14:57:53'),
(16, 'elshoubak', 18, 30.54800000, 25.14800000, 6.00, 1, '2026-05-01 18:40:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `battery_health`
--
ALTER TABLE `battery_health`
  ADD PRIMARY KEY (`battery_id`),
  ADD KEY `idx_tool` (`tool_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `idx_tool` (`tool_id`),
  ADD KEY `idx_borrower` (`borrower_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `consumables_inventory`
--
ALTER TABLE `consumables_inventory`
  ADD PRIMARY KEY (`consumable_id`),
  ADD KEY `idx_tool` (`tool_id`);

--
-- Indexes for table `damage_reports`
--
ALTER TABLE `damage_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `idx_booking` (`booking_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `reported_by_id` (`reported_by_id`),
  ADD KEY `technician_id` (`technician_id`),
  ADD KEY `decision_by_librarian_id` (`decision_by_librarian_id`);

--
-- Indexes for table `disposal_records`
--
ALTER TABLE `disposal_records`
  ADD PRIMARY KEY (`disposal_id`),
  ADD KEY `tool_id` (`tool_id`),
  ADD KEY `technician_id` (`technician_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `dispute_reports`
--
ALTER TABLE `dispute_reports`
  ADD PRIMARY KEY (`dispute_id`),
  ADD KEY `idx_booking` (`booking_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_librarian` (`assigned_librarian_id`),
  ADD KEY `reported_by_id` (`reported_by_id`),
  ADD KEY `reported_against_id` (`reported_against_id`);

--
-- Indexes for table `escrow_transactions`
--
ALTER TABLE `escrow_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `idx_booking` (`booking_id`);

--
-- Indexes for table `knowledge_articles`
--
ALTER TABLE `knowledge_articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `tool_category_id` (`tool_category_id`),
  ADD KEY `knowledge_category_id` (`knowledge_category_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `knowledge_categories`
--
ALTER TABLE `knowledge_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `knowledge_comments`
--
ALTER TABLE `knowledge_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `maintenance_logs`
--
ALTER TABLE `maintenance_logs`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `idx_tool` (`tool_id`),
  ADD KEY `idx_technician` (`technician_id`);

--
-- Indexes for table `membership_tiers`
--
ALTER TABLE `membership_tiers`
  ADD PRIMARY KEY (`tier_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `idx_sender` (`sender_id`),
  ADD KEY `idx_receiver` (`receiver_id`),
  ADD KEY `idx_booking` (`booking_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_read` (`is_read`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `tool_id` (`tool_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`),
  ADD UNIQUE KEY `promo_code` (`promo_code`),
  ADD KEY `idx_code` (`promo_code`),
  ADD KEY `idx_dates` (`start_date`,`end_date`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `zone_id` (`zone_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `referral_rewards`
--
ALTER TABLE `referral_rewards`
  ADD PRIMARY KEY (`reward_id`),
  ADD KEY `idx_referrer` (`referrer_id`),
  ADD KEY `idx_referred` (`referred_user_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `repair_cost_estimates`
--
ALTER TABLE `repair_cost_estimates`
  ADD PRIMARY KEY (`estimate_id`),
  ADD KEY `tool_category_id` (`tool_category_id`);

--
-- Indexes for table `replacement_parts`
--
ALTER TABLE `replacement_parts`
  ADD PRIMARY KEY (`part_id`),
  ADD KEY `tool_id` (`tool_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `idx_booking` (`booking_id`),
  ADD KEY `idx_reviewee` (`reviewee_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD UNIQUE KEY `unique_role_permission` (`role_name`,`permission`);

--
-- Indexes for table `technician_performance`
--
ALTER TABLE `technician_performance`
  ADD PRIMARY KEY (`performance_id`),
  ADD UNIQUE KEY `unique_technician_month` (`technician_id`,`month`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`tool_id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD KEY `idx_owner` (`owner_id`),
  ADD KEY `idx_category` (`category_id`),
  ADD KEY `idx_zone` (`zone_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `trust_score_history`
--
ALTER TABLE `trust_score_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `referral_code` (`referral_code`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_referral` (`referral_code`),
  ADD KEY `idx_tier` (`tier_id`),
  ADD KEY `referred_by_id` (`referred_by_id`);

--
-- Indexes for table `user_activity_log`
--
ALTER TABLE `user_activity_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `battery_health`
--
ALTER TABLE `battery_health`
  MODIFY `battery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `consumables_inventory`
--
ALTER TABLE `consumables_inventory`
  MODIFY `consumable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `damage_reports`
--
ALTER TABLE `damage_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disposal_records`
--
ALTER TABLE `disposal_records`
  MODIFY `disposal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dispute_reports`
--
ALTER TABLE `dispute_reports`
  MODIFY `dispute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `escrow_transactions`
--
ALTER TABLE `escrow_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `knowledge_articles`
--
ALTER TABLE `knowledge_articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `knowledge_categories`
--
ALTER TABLE `knowledge_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `knowledge_comments`
--
ALTER TABLE `knowledge_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_logs`
--
ALTER TABLE `maintenance_logs`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `membership_tiers`
--
ALTER TABLE `membership_tiers`
  MODIFY `tier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `referral_rewards`
--
ALTER TABLE `referral_rewards`
  MODIFY `reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repair_cost_estimates`
--
ALTER TABLE `repair_cost_estimates`
  MODIFY `estimate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `replacement_parts`
--
ALTER TABLE `replacement_parts`
  MODIFY `part_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `technician_performance`
--
ALTER TABLE `technician_performance`
  MODIFY `performance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `tool_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `trust_score_history`
--
ALTER TABLE `trust_score_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_activity_log`
--
ALTER TABLE `user_activity_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `battery_health`
--
ALTER TABLE `battery_health`
  ADD CONSTRAINT `battery_health_ibfk_1` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `consumables_inventory`
--
ALTER TABLE `consumables_inventory`
  ADD CONSTRAINT `consumables_inventory_ibfk_1` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`) ON DELETE CASCADE;

--
-- Constraints for table `damage_reports`
--
ALTER TABLE `damage_reports`
  ADD CONSTRAINT `damage_reports_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `damage_reports_ibfk_2` FOREIGN KEY (`reported_by_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `damage_reports_ibfk_3` FOREIGN KEY (`technician_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `damage_reports_ibfk_4` FOREIGN KEY (`decision_by_librarian_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `disposal_records`
--
ALTER TABLE `disposal_records`
  ADD CONSTRAINT `disposal_records_ibfk_1` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disposal_records_ibfk_2` FOREIGN KEY (`technician_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `disposal_records_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `dispute_reports`
--
ALTER TABLE `dispute_reports`
  ADD CONSTRAINT `dispute_reports_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dispute_reports_ibfk_2` FOREIGN KEY (`reported_by_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `dispute_reports_ibfk_3` FOREIGN KEY (`reported_against_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `dispute_reports_ibfk_4` FOREIGN KEY (`assigned_librarian_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `escrow_transactions`
--
ALTER TABLE `escrow_transactions`
  ADD CONSTRAINT `escrow_transactions_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

--
-- Constraints for table `knowledge_articles`
--
ALTER TABLE `knowledge_articles`
  ADD CONSTRAINT `knowledge_articles_ibfk_1` FOREIGN KEY (`tool_category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `knowledge_articles_ibfk_2` FOREIGN KEY (`knowledge_category_id`) REFERENCES `knowledge_categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `knowledge_articles_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `knowledge_comments`
--
ALTER TABLE `knowledge_comments`
  ADD CONSTRAINT `knowledge_comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `knowledge_articles` (`article_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `knowledge_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `maintenance_logs`
--
ALTER TABLE `maintenance_logs`
  ADD CONSTRAINT `maintenance_logs_ibfk_1` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `maintenance_logs_ibfk_2` FOREIGN KEY (`technician_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`) ON DELETE SET NULL;

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `promotions_ibfk_2` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`) ON DELETE SET NULL;

--
-- Constraints for table `referral_rewards`
--
ALTER TABLE `referral_rewards`
  ADD CONSTRAINT `referral_rewards_ibfk_1` FOREIGN KEY (`referrer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `referral_rewards_ibfk_2` FOREIGN KEY (`referred_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`),
  ADD CONSTRAINT `refunds_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `repair_cost_estimates`
--
ALTER TABLE `repair_cost_estimates`
  ADD CONSTRAINT `repair_cost_estimates_ibfk_1` FOREIGN KEY (`tool_category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `replacement_parts`
--
ALTER TABLE `replacement_parts`
  ADD CONSTRAINT `replacement_parts_ibfk_1` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`reviewee_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `technician_performance`
--
ALTER TABLE `technician_performance`
  ADD CONSTRAINT `technician_performance_ibfk_1` FOREIGN KEY (`technician_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `tools`
--
ALTER TABLE `tools`
  ADD CONSTRAINT `tools_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tools_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `tools_ibfk_3` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`zone_id`);

--
-- Constraints for table `trust_score_history`
--
ALTER TABLE `trust_score_history`
  ADD CONSTRAINT `trust_score_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`tier_id`) REFERENCES `membership_tiers` (`tier_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`referred_by_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `user_activity_log`
--
ALTER TABLE `user_activity_log`
  ADD CONSTRAINT `user_activity_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
