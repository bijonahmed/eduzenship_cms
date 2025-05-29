-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2025 at 07:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_eduzenship`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_configs`
--

CREATE TABLE `api_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `app_id` varchar(255) NOT NULL,
  `api_url` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api_configs`
--

INSERT INTO `api_configs` (`id`, `name`, `app_id`, `api_url`, `api_key`, `created_at`, `updated_at`) VALUES
(1, 'Game List', '771', 'https://api-gametest.omgapi.cc/api/game/loadlist', 'dc7df6a77d8e82fcf26062d773b8d385', '2024-10-17 04:52:28', '2024-10-17 04:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE `api_key` (
  `id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_key`
--

INSERT INTO `api_key` (`id`, `merchant_id`, `key`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'hkttruzpxboovmme7s7ua6cppa6m0xp8', 'xRSLnG38I9uH', 1, '2024-12-08 13:33:06', '2024-12-08 15:26:39'),
(4, 3, 'TQUiTZzqypMpwSNTaKS1kye2p1MGd4tNvK', 'LRWwU5D6womf', 1, '2024-12-08 15:26:59', '2025-01-12 23:21:37'),
(5, 5, '5yjjrs1dqc064ikm9zf1opiyblj4xn4n', 'cTQt96aJIQZg', 1, '2024-12-08 15:30:33', '2024-12-08 15:30:33'),
(7, 22, 'a1z796m6004vd9t6euj6aheey7pieprg', 'BuUWvdAEE6pw', 1, '2025-01-10 14:39:03', '2025-01-10 14:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `bed_type`
--

CREATE TABLE `bed_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bed_type`
--

INSERT INTO `bed_type` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, '1 large double bed', '1-large-double-bed', 1, '2025-04-03 12:03:28', '2025-04-03 12:03:28'),
(2, '2 large double bed', '2-large-double-bed', 1, '2025-04-03 12:03:57', '2025-04-03 12:03:57'),
(3, '1 extra-large double bed', '1-extra-large-double-bed', 1, '2025-04-03 12:07:29', '2025-04-03 12:07:29'),
(4, '2 extra-large double bed', '2-extra-large-double-bed', 1, '2025-04-03 12:17:16', '2025-04-03 12:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `adult` int(11) DEFAULT 0,
  `child` int(11) DEFAULT 0,
  `room_price` double(10,2) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `arival_from` text DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `paymenttype` int(11) DEFAULT NULL COMMENT '1=online,2=offline',
  `booking_status` int(11) DEFAULT NULL COMMENT '1=Booked\r\n2=Release\r\n3=Cancel',
  `update_by` int(11) DEFAULT NULL,
  `booking_by` int(11) DEFAULT NULL COMMENT 'this admin entry track which user entry',
  `check_out_reason` text DEFAULT NULL,
  `check_out_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `booking_id`, `name`, `email`, `phone`, `checkin`, `checkout`, `room_id`, `adult`, `child`, `room_price`, `message`, `arival_from`, `customer_id`, `paymenttype`, `booking_status`, `update_by`, `booking_by`, `check_out_reason`, `check_out_by`, `created_at`, `updated_at`) VALUES
(1, '66962', 'Guest 1', 'guest1@gmail.com', '019155555111', '2025-04-12', '2025-04-20', 4, 20, 10, 19528.00, 'Living room: 1 sofa bed Comfy beds, 10 – Based on 1 review The unit has 2 beds.', 'Dhaka', 8, 2, 2, 1, NULL, 'this booking id relaease 66962', 1, '2025-04-12 05:58:52', '2025-04-15 11:24:34'),
(2, '56039', 'Guest 2', 'Guest2@gmail.com', NULL, '2025-04-20', '2025-04-25', 4, 0, 0, 19528.00, NULL, NULL, 9, 2, 2, NULL, NULL, '56039', 1, '2025-04-12 06:00:42', '2025-04-15 11:29:34'),
(3, '68387', 'Mr. Kamal', 'kamal897@gmail.com', NULL, '2025-04-13', '2025-04-23', 1, 1, 10, 7323.00, NULL, NULL, 9, 2, 2, NULL, NULL, 'testss', 1, '2025-04-12 06:44:51', '2025-04-15 11:31:29'),
(4, '45783', 'Abdur Rahman', 'abdurrahman@gmail.com', '00114568982', '2025-04-25', '2025-04-27', 1, 0, 0, 7323.00, NULL, NULL, 10, 2, 3, NULL, NULL, 'swss', 1, '2025-04-15 06:27:01', '2025-04-15 11:31:51'),
(5, '48956', 'Mowloda Begum', 'mowloda@gmail.com', NULL, '2025-04-17', '2025-04-19', 3, 5, 5, 19528.00, NULL, NULL, 10, 2, 1, NULL, NULL, NULL, NULL, '2025-04-15 06:28:15', '2025-04-15 06:28:15'),
(7, '60174', 'sajibAhmed', 'sajibahmed@gmail.com', '0125647878788', '2025-04-28', '2025-04-30', 2, 7, NULL, 19528.00, NULL, NULL, 14, 2, 1, 1, NULL, NULL, NULL, '2025-04-15 08:31:16', '2025-04-15 08:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `booking_type`
--

CREATE TABLE `booking_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_type`
--

INSERT INTO `booking_type` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SSSSS', 'sssss', 1, '2025-03-31 06:21:21', '2025-03-31 06:37:09'),
(2, 'Instant', 'instant', 1, '2025-03-31 06:21:31', '2025-03-31 06:21:31'),
(3, 'Groups', 'groups', 1, '2025-03-31 06:21:40', '2025-03-31 06:21:40'),
(4, 'Allocation', 'allocation', 1, '2025-03-31 06:21:46', '2025-03-31 06:21:46'),
(5, 'Business Seminar', 'business-seminar', 1, '2025-03-31 06:21:51', '2025-03-31 06:21:51'),
(6, 'Wedding', 'wedding', 1, '2025-03-31 06:21:56', '2025-03-31 06:21:56'),
(7, 'Birthday', 'birthday', 1, '2025-03-31 06:22:01', '2025-03-31 06:22:01'),
(8, 'Photoshoot', 'photoshoot', 1, '2025-03-31 06:22:06', '2025-03-31 06:22:06');

-- --------------------------------------------------------

--
-- Table structure for table `bulk_address`
--

CREATE TABLE `bulk_address` (
  `id` int(11) NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `walletAddress` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `block_status` int(11) NOT NULL DEFAULT 0 COMMENT '0=unblock,1=block',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bulk_address`
--

INSERT INTO `bulk_address` (`id`, `merchant_id`, `walletAddress`, `status`, `block_status`, `created_at`, `updated_at`, `entry_by`) VALUES
(2, 3, 'TPAgKfYzRdK83Qocc4gXvEVu4jPKfeuer5', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:38:30', 1),
(3, 3, 'JkP2d0VjGl98rF3Xz73s5Ye6ZTx4aBcqVJ', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(4, 3, '7pKm1NhbYoVqjW2tFJg8hV5Lp1sXyXtM2Z', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(5, 3, 'L3Pc9VrAK6f0WGb7hy2h7X0jt8Q7JwFcNe', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(6, 3, '0NzQ5R9kmTk04c2J7hZ2pHmQyFxpmW8cuv', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(7, 3, 'Bm5rTY7g1jw0AZ0eqP4k9h11vf4sQJklo1', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(8, 3, '8Wm2j1y1r7l3fXaPzR4Vgt8Q3KL64Db3Fw', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(9, 3, '4Ghp2KxA93NFzVy94P6tkGv7Qf1JxkL2X3', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(10, 3, 'kGfX6bY2aq4d80m3zV3jmGpLmPbF8hR2yX', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(11, 3, 'LdT6s3TqGh7Ykn9mAP0jZ3f5Qs1KwN08po', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(12, 3, '1n9Xf2tmLjv4b7cH5Y1KQwBz7e6s1kpN3E', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(13, 3, 'YR8Kv5PQFgXr2WoQFzXcz77n8bPLk09Z2A', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(14, 3, 'oZ4fTmYbHz88rI6WqP2g3xvL6h81Akh09X', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(15, 3, '3bWxTY4P6L0oC7Z8p9fE5DxNzS0yGVZ1Za', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(16, 3, '4AzM9PnS3t7pXg5u0vKcZ8GJXq2Wtf1lS', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(17, 3, 'P6v0n9p6Lh2XbE2mRyq5m0XsZ8K3V5Wk5H', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(18, 3, '8T7tV13oJbC92H4nS0Y0y7XZ7gKp29fB0h', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(19, 3, '2BxKa3p5JhR16vFzH1k4n9d8rLlm0w9VvD', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(20, 3, 'K2hWm4oFqR3ZkL2N1hN8yZ9Yb1tGvM7f7u', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(21, 3, 'oZt85c7m9W4zH9p6QaV0RZm8kXwP2uQ5Hh', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(22, 3, '0Tj8nN4Lkz5pX63X7g9vQ0sDb61CrZTj1D', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(23, 3, 'fC7t9k6bW0z9Yc8mVR2pLm3qF11XlO2n2y', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(24, 3, '2Gb0uH5jJf8t3m9kR1e2n9v7Z5l0G5Xj6', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(25, 3, 'yA0P8c3oZlK6r1DqR9v3d1W9x5Qh8V1mjY', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(26, 3, '3vGnC0d7R8X8y2jSh5m7fQcW9K7a2rjOhC', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(27, 3, 'YV3P6yJ2l9F0k1R6z9V2t9bPq7n2W0Lj1m', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(28, 3, '7gMr8zP2XkS4tD5nJ1p5V1Hq9bR4G9x0o', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(29, 3, 'fP1L6Vt0h2wR8d7nK2cJg5LmX0t9F9m1z7', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(30, 3, '3Tk8qF6oVbL1m3r1Z5Xy9fN1dJ6V7p9XH6', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(31, 3, 'B8gYf7P0Wm0X7F2T9hQ0J3y1b8g0d6m9oG', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(32, 3, 'V7z5K1v9cP6J4Z2r8qLmT0Wf7vH9Y8P5oD', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(33, 3, 'wU2V8c7mJ4gQ5r1o3p9L6yN9n0B8tG2h1J', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(34, 3, 'd9p8t9F4V3v2H8XK8L1Z9Q3W7t0y9C0r6A', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(35, 3, '5gY7kL9t6m9wH4y2Xr7pD9Z1n9t5V2Xb9L', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(36, 3, 'd8M9XyP6K7g0t8Jz1N3r7v9Wb0p6j9g1K', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(37, 3, 'o0R5d2N5tVb9X4y5qQ0M7P2h1F6C8j7Xy', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(38, 3, 'h2n8c5pV7Y1g3B8F7r0X9v9g6T5q9K1o9', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(39, 3, '3B0qF1R9p3dL7M9J6Y8z5Vb0o5X6H9p1z', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(40, 3, '5R3Z8V6p2F1m1W2tL0pV1K8n3B5x8v2L0', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(41, 3, 'Y7k2Q9z7P1t3F5J6gW0p9b8hV2m0X9R0D', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(42, 3, 'Z6wJ0v9dP1F2r1n8tM6L3t9Q9g5X3d5Xy', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(43, 3, 'f4P9X1Z0gK7v2J3p4mR6L8n5t9X6o7W7G', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(44, 3, 'H3Q9W2b5dR0zK7y9mX3P9t0F6w3o7d5Y6', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(45, 3, '0Q3J7p9L1X8g5Y2V9tW3R2zF9J1p4m7bY', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(46, 3, 'X9F0t2b7m0Q3Z8d9gY6L2J1V5n3H6p0W2', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(47, 3, 'j0L9t5P1fR8y2X5m7b3Q7v1Z5g9V0T7Xx', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(48, 3, '0X5Yt9h1pK7q6d8n2F1g3W9J5V8L9c6m2', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(49, 3, '4b0m6H5K2V3y8N0X7p1t9J1r8g7f3W0m3', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(50, 3, 'J2Q4y9W6g1tR7d3Z8p5F3V2mK8v9L1X0N', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(51, 3, '1P9J2yF5X6vR7L8m9n0b3Q7X9Y0t9K7oP', 1, 0, '2025-01-12 22:07:49', '2025-01-12 22:07:49', 4),
(53, 3, '0Q3J7p9L1X8g5Y2V9tW3R2zF9J1p4m7bY3', 1, 0, '2025-01-13 19:31:38', '2025-01-13 19:31:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `slug`, `file`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Global category', 'global-category', NULL, 1, NULL, NULL),
(2, 'Artificial Intelligence', 'artificial-intelligence', NULL, 1, NULL, NULL),
(3, 'Machine Learning', 'machine-learning', NULL, 1, NULL, NULL),
(4, 'Blockchain', 'blockchain', NULL, 1, NULL, NULL),
(5, 'Cloud Computing', 'cloud-computing', NULL, 1, NULL, NULL),
(6, 'Cybersecurity', 'cybersecurity', NULL, 1, NULL, NULL),
(7, 'Data Science', 'data-science', NULL, 1, NULL, NULL),
(8, 'Big Data', 'big-data', NULL, 1, NULL, NULL),
(9, 'Internet of Things', 'internet-of-things', NULL, 1, NULL, NULL),
(10, 'Augmented Reality', 'augmented-reality', NULL, 1, NULL, NULL),
(11, 'Virtual Reality', 'virtual-reality', NULL, 1, NULL, NULL),
(12, 'Web Development', 'web-development', NULL, 1, NULL, NULL),
(13, 'Mobile Development', 'mobile-development', NULL, 1, NULL, NULL),
(14, 'DevOps', 'devops', NULL, 1, NULL, NULL),
(15, 'Game Development', 'game-development', NULL, 1, NULL, NULL),
(16, 'Robotics', 'robotics', NULL, 1, NULL, NULL),
(17, 'Artificial Neural Networks', 'artificial-neural-networks', NULL, 1, NULL, NULL),
(18, 'Digital Marketing', 'digital-marketing', NULL, 1, NULL, NULL),
(19, 'E-commerce', 'e-commerce', NULL, 1, NULL, NULL),
(20, 'SEO Optimization', 'seo-optimization', NULL, 1, NULL, NULL),
(21, 'Software Development', 'software-development', NULL, 1, NULL, NULL),
(22, 'UI/UX Design', 'ui-ux-design', NULL, 1, NULL, NULL),
(23, 'Programming Languages', 'programming-languages', NULL, 1, NULL, NULL),
(24, 'Ethical Hacking', 'ethical-hacking', NULL, 1, NULL, NULL),
(25, 'Networking', 'networking', NULL, 1, NULL, NULL),
(26, 'System Administration', 'system-administration', NULL, 1, NULL, NULL),
(27, 'Database Management', 'database-management', NULL, 1, NULL, NULL),
(28, 'Cryptography', 'cryptography', NULL, 1, NULL, NULL),
(29, 'Automation', 'automation', NULL, 1, NULL, NULL),
(30, 'Computer Vision', 'computer-vision', NULL, 1, NULL, NULL),
(31, 'Natural Language Processing', 'natural-language-processing', NULL, 1, NULL, NULL),
(32, 'Edge Computing', 'edge-computing', NULL, 1, NULL, NULL),
(33, 'Quantum Computing', 'quantum-computing', NULL, 1, NULL, NULL),
(34, 'Digital Twins', 'digital-twins', NULL, 1, NULL, NULL),
(35, '5G Technology', '5g-technology', NULL, 1, NULL, NULL),
(36, 'Smart Cities', 'smart-cities', NULL, 1, NULL, NULL),
(37, 'Biometrics', 'biometrics', NULL, 1, NULL, NULL),
(38, 'Wearable Technology', 'wearable-technology', NULL, 1, NULL, NULL),
(39, '3D Printing', '3d-printing', NULL, 1, NULL, NULL),
(40, 'Open Source', 'open-source', NULL, 1, NULL, NULL),
(41, 'Augmented Analytics', 'augmented-analytics', NULL, 1, NULL, NULL),
(42, 'Edge AI', 'edge-ai', NULL, 1, NULL, NULL),
(43, 'Computer Graphics', 'computer-graphics', NULL, 1, NULL, NULL),
(44, 'Digital Transformation', 'digital-transformation', NULL, 1, NULL, NULL),
(45, 'Chatbots', 'chatbots', NULL, 1, NULL, NULL),
(46, 'API Development', 'api-development', NULL, 1, NULL, NULL),
(47, 'Backend Development', 'backend-development', NULL, 1, NULL, NULL),
(48, 'Frontend Development', 'frontend-development', NULL, 1, NULL, NULL),
(49, 'Augmented Workspaces', 'augmented-workspaces', NULL, 1, NULL, NULL),
(50, 'Full-stack Development', 'full-stack-development', NULL, 1, NULL, NULL),
(51, 'Digital Payments', 'digital-payments', NULL, 1, NULL, NULL),
(52, 'Smart Contracts', 'smart-contracts', NULL, 1, NULL, NULL),
(53, 'Drones', 'drones', NULL, 1, NULL, NULL),
(54, 'Virtual Assistants', 'virtual-assistants', NULL, 1, NULL, NULL),
(55, 'Mixed Reality', 'mixed-reality', NULL, 1, NULL, NULL),
(56, 'E-Learning', 'e-learning', NULL, 1, NULL, NULL),
(57, 'EdTech', 'edtech', NULL, 1, NULL, NULL),
(58, 'FinTech', 'fintech', NULL, 1, NULL, NULL),
(59, 'PropTech', 'proptech', NULL, 1, NULL, NULL),
(60, 'AgriTech', 'agritech', NULL, 1, NULL, NULL),
(61, 'HealthTech', 'healthtech', NULL, 1, NULL, NULL),
(62, 'MarTech', 'martech', NULL, 1, NULL, NULL),
(63, 'InsurTech', 'insurtech', NULL, 1, NULL, NULL),
(64, 'LegalTech', 'legaltech', NULL, 1, NULL, NULL),
(65, 'RegTech', 'regtech', NULL, 1, NULL, NULL),
(66, 'FoodTech', 'foodtech', NULL, 1, NULL, NULL),
(67, 'MedTech', 'medtech', NULL, 1, NULL, NULL),
(68, 'ClimateTech', 'climatetech', NULL, 1, NULL, NULL),
(69, 'GreenTech', 'greentech', NULL, 1, NULL, NULL),
(70, 'HRTech', 'hrtech', NULL, 1, NULL, NULL),
(71, 'RetailTech', 'retailtech', NULL, 1, NULL, NULL),
(72, 'EnergyTech', 'energytech', NULL, 1, NULL, NULL),
(73, 'SpaceTech', 'spacetech', NULL, 1, NULL, NULL),
(74, 'MobilityTech', 'mobilitytech', NULL, 1, NULL, NULL),
(75, 'Gaming', 'gaming', NULL, 1, NULL, NULL),
(76, 'Digital Advertising', 'digital-advertising', NULL, 1, NULL, NULL),
(77, 'Search Engines', 'search-engines', NULL, 1, NULL, NULL),
(78, 'Video Streaming', 'video-streaming', NULL, 1, NULL, NULL),
(79, 'Smart Home', 'smart-home', NULL, 1, NULL, NULL),
(80, 'Space Exploration', 'space-exploration', NULL, 1, NULL, NULL),
(81, 'Autonomous Vehicles', 'autonomous-vehicles', NULL, 1, NULL, NULL),
(82, 'AI Ethics', 'ai-ethics', NULL, 1, NULL, NULL),
(83, 'Digital Art', 'digital-art', NULL, 1, NULL, NULL),
(84, 'Design Thinking', 'design-thinking', NULL, 1, NULL, NULL),
(85, 'Predictive Analytics', 'predictive-analytics', NULL, 1, NULL, NULL),
(86, 'Customer Experience', 'customer-experience', NULL, 1, NULL, NULL),
(87, 'Content Management', 'content-management', NULL, 1, NULL, NULL),
(88, 'IT Governance', 'it-governance', NULL, 1, NULL, NULL),
(89, 'Social Media', 'social-media', NULL, 1, NULL, NULL),
(90, 'Innovation', 'innovation', NULL, 1, NULL, NULL),
(91, 'Digital Identity', 'digital-identity', NULL, 1, NULL, NULL),
(92, 'Crowdsourcing', 'crowdsourcing', NULL, 1, NULL, NULL),
(93, 'Disruptive Technology', 'disruptive-technology', NULL, 1, NULL, NULL),
(94, 'Technology Trends', 'technology-trends', NULL, 1, NULL, NULL),
(95, 'Tech Startups', 'tech-startups', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `shortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `shortname`, `name`, `phonecode`, `status`) VALUES
(1, 'AF', 'Afghanistan', 93, 1),
(2, 'AL', 'Albania', 355, 1),
(3, 'DZ', 'Algeria', 213, 1),
(4, 'AS', 'American Samoa', 1684, 1),
(5, 'AD', 'Andorra', 376, 1),
(6, 'AO', 'Angola', 244, 1),
(7, 'AI', 'Anguilla', 1264, 1),
(8, 'AQ', 'Antarctica', 0, 1),
(9, 'AG', 'Antigua And Barbuda', 1268, 1),
(10, 'AR', 'Argentina', 54, 1),
(11, 'AM', 'Armenia', 374, 1),
(12, 'AW', 'Aruba', 297, 1),
(13, 'AU', 'Australia', 61, 1),
(14, 'AT', 'Austria', 43, 1),
(15, 'AZ', 'Azerbaijan', 994, 1),
(16, 'BS', 'Bahamas The', 1242, 1),
(17, 'BH', 'Bahrain', 973, 1),
(18, 'BD', 'Bangladesh', 880, 1),
(19, 'BB', 'Barbados', 1246, 1),
(20, 'BY', 'Belarus', 375, 1),
(21, 'BE', 'Belgium', 32, 1),
(22, 'BZ', 'Belize', 501, 1),
(23, 'BJ', 'Benin', 229, 1),
(24, 'BM', 'Bermuda', 1441, 1),
(25, 'BT', 'Bhutan', 975, 1),
(26, 'BO', 'Bolivia', 591, 1),
(27, 'BA', 'Bosnia and Herzegovina', 387, 1),
(28, 'BW', 'Botswana', 267, 1),
(29, 'BV', 'Bouvet Island', 0, 1),
(30, 'BR', 'Brazil', 55, 1),
(31, 'IO', 'British Indian Ocean Territory', 246, 1),
(32, 'BN', 'Brunei', 673, 1),
(33, 'BG', 'Bulgaria', 359, 1),
(34, 'BF', 'Burkina Faso', 226, 1),
(35, 'BI', 'Burundi', 257, 1),
(36, 'KH', 'Cambodia', 855, 1),
(37, 'CM', 'Cameroon', 237, 1),
(38, 'CA', 'Canada', 1, 1),
(39, 'CV', 'Cape Verde', 238, 1),
(40, 'KY', 'Cayman Islands', 1345, 1),
(41, 'CF', 'Central African Republic', 236, 1),
(42, 'TD', 'Chad', 235, 1),
(43, 'CL', 'Chile', 56, 1),
(44, 'CN', 'China', 86, 1),
(45, 'CX', 'Christmas Island', 61, 1),
(46, 'CC', 'Cocos (Keeling) Islands', 672, 1),
(47, 'CO', 'Colombia', 57, 1),
(48, 'KM', 'Comoros', 269, 1),
(49, 'CG', 'Republic Of The Congo', 242, 1),
(50, 'CD', 'Democratic Republic Of The Congo', 242, 1),
(51, 'CK', 'Cook Islands', 682, 1),
(52, 'CR', 'Costa Rica', 506, 1),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 225, 1),
(54, 'HR', 'Croatia (Hrvatska)', 385, 1),
(55, 'CU', 'Cuba', 53, 1),
(56, 'CY', 'Cyprus', 357, 1),
(57, 'CZ', 'Czech Republic', 420, 1),
(58, 'DK', 'Denmark', 45, 1),
(59, 'DJ', 'Djibouti', 253, 1),
(60, 'DM', 'Dominica', 1767, 1),
(61, 'DO', 'Dominican Republic', 1809, 1),
(62, 'TP', 'East Timor', 670, 1),
(63, 'EC', 'Ecuador', 593, 1),
(64, 'EG', 'Egypt', 20, 1),
(65, 'SV', 'El Salvador', 503, 1),
(66, 'GQ', 'Equatorial Guinea', 240, 1),
(67, 'ER', 'Eritrea', 291, 1),
(68, 'EE', 'Estonia', 372, 1),
(69, 'ET', 'Ethiopia', 251, 1),
(70, 'XA', 'External Territories of Australia', 61, 1),
(71, 'FK', 'Falkland Islands', 500, 1),
(72, 'FO', 'Faroe Islands', 298, 1),
(73, 'FJ', 'Fiji Islands', 679, 1),
(74, 'FI', 'Finland', 358, 1),
(75, 'FR', 'France', 33, 1),
(76, 'GF', 'French Guiana', 594, 1),
(77, 'PF', 'French Polynesia', 689, 1),
(78, 'TF', 'French Southern Territories', 0, 1),
(79, 'GA', 'Gabon', 241, 1),
(80, 'GM', 'Gambia The', 220, 1),
(81, 'GE', 'Georgia', 995, 1),
(82, 'DE', 'Germany', 49, 1),
(83, 'GH', 'Ghana', 233, 1),
(84, 'GI', 'Gibraltar', 350, 1),
(85, 'GR', 'Greece', 30, 1),
(86, 'GL', 'Greenland', 299, 1),
(87, 'GD', 'Grenada', 1473, 1),
(88, 'GP', 'Guadeloupe', 590, 1),
(89, 'GU', 'Guam', 1671, 1),
(90, 'GT', 'Guatemala', 502, 1),
(91, 'XU', 'Guernsey and Alderney', 44, 1),
(92, 'GN', 'Guinea', 224, 1),
(93, 'GW', 'Guinea-Bissau', 245, 1),
(94, 'GY', 'Guyana', 592, 1),
(95, 'HT', 'Haiti', 509, 1),
(96, 'HM', 'Heard and McDonald Islands', 0, 1),
(97, 'HN', 'Honduras', 504, 1),
(98, 'HK', 'Hong Kong S.A.R.', 852, 1),
(99, 'HU', 'Hungary', 36, 1),
(100, 'IS', 'Iceland', 354, 1),
(101, 'IN', 'India', 91, 1),
(102, 'ID', 'Indonesia', 62, 1),
(103, 'IR', 'Iran', 98, 1),
(104, 'IQ', 'Iraq', 964, 1),
(105, 'IE', 'Ireland', 353, 1),
(106, 'IL', 'Israel', 972, 1),
(107, 'IT', 'Italy', 39, 1),
(108, 'JM', 'Jamaica', 1876, 1),
(109, 'JP', 'Japan', 81, 1),
(110, 'XJ', 'Jersey', 44, 1),
(111, 'JO', 'Jordan', 962, 1),
(112, 'KZ', 'Kazakhstan', 7, 1),
(113, 'KE', 'Kenya', 254, 1),
(114, 'KI', 'Kiribati', 686, 1),
(115, 'KP', 'Korea North', 850, 1),
(116, 'KR', 'Korea South', 82, 1),
(117, 'KW', 'Kuwait', 965, 1),
(118, 'KG', 'Kyrgyzstan', 996, 1),
(119, 'LA', 'Laos', 856, 1),
(120, 'LV', 'Latvia', 371, 1),
(121, 'LB', 'Lebanon', 961, 1),
(122, 'LS', 'Lesotho', 266, 1),
(123, 'LR', 'Liberia', 231, 1),
(124, 'LY', 'Libya', 218, 1),
(125, 'LI', 'Liechtenstein', 423, 1),
(126, 'LT', 'Lithuania', 370, 1),
(127, 'LU', 'Luxembourg', 352, 1),
(128, 'MO', 'Macau S.A.R.', 853, 1),
(129, 'MK', 'Macedonia', 389, 1),
(130, 'MG', 'Madagascar', 261, 1),
(131, 'MW', 'Malawi', 265, 1),
(132, 'MY', 'Malaysia', 60, 1),
(133, 'MV', 'Maldives', 960, 1),
(134, 'ML', 'Mali', 223, 1),
(135, 'MT', 'Malta', 356, 1),
(136, 'XM', 'Man (Isle of)', 44, 1),
(137, 'MH', 'Marshall Islands', 692, 1),
(138, 'MQ', 'Martinique', 596, 1),
(139, 'MR', 'Mauritania', 222, 1),
(140, 'MU', 'Mauritius', 230, 1),
(141, 'YT', 'Mayotte', 269, 1),
(142, 'MX', 'Mexico', 52, 1),
(143, 'FM', 'Micronesia', 691, 1),
(144, 'MD', 'Moldova', 373, 1),
(145, 'MC', 'Monaco', 377, 1),
(146, 'MN', 'Mongolia', 976, 1),
(147, 'MS', 'Montserrat', 1664, 1),
(148, 'MA', 'Morocco', 212, 1),
(149, 'MZ', 'Mozambique', 258, 1),
(150, 'MM', 'Myanmar', 95, 1),
(151, 'NA', 'Namibia', 264, 1),
(152, 'NR', 'Nauru', 674, 1),
(153, 'NP', 'Nepal', 977, 1),
(154, 'AN', 'Netherlands Antilles', 599, 1),
(155, 'NL', 'Netherlands The', 31, 1),
(156, 'NC', 'New Caledonia', 687, 1),
(157, 'NZ', 'New Zealand', 64, 1),
(158, 'NI', 'Nicaragua', 505, 1),
(159, 'NE', 'Niger', 227, 1),
(160, 'NG', 'Nigeria', 234, 1),
(161, 'NU', 'Niue', 683, 1),
(162, 'NF', 'Norfolk Island', 672, 1),
(163, 'MP', 'Northern Mariana Islands', 1670, 1),
(164, 'NO', 'Norway', 47, 1),
(165, 'OM', 'Oman', 968, 1),
(166, 'PK', 'Pakistan', 92, 1),
(167, 'PW', 'Palau', 680, 1),
(168, 'PS', 'Palestinian Territory Occupied', 970, 1),
(169, 'PA', 'Panama', 507, 1),
(170, 'PG', 'Papua new Guinea', 675, 1),
(171, 'PY', 'Paraguay', 595, 1),
(172, 'PE', 'Peru', 51, 1),
(173, 'PH', 'Philippines', 63, 1),
(174, 'PN', 'Pitcairn Island', 0, 1),
(175, 'PL', 'Poland', 48, 1),
(176, 'PT', 'Portugal', 351, 1),
(177, 'PR', 'Puerto Rico', 1787, 1),
(178, 'QA', 'Qatar', 974, 1),
(179, 'RE', 'Reunion', 262, 1),
(180, 'RO', 'Romania', 40, 1),
(181, 'RU', 'Russia', 70, 1),
(182, 'RW', 'Rwanda', 250, 1),
(183, 'SH', 'Saint Helena', 290, 1),
(184, 'KN', 'Saint Kitts And Nevis', 1869, 1),
(185, 'LC', 'Saint Lucia', 1758, 1),
(186, 'PM', 'Saint Pierre and Miquelon', 508, 1),
(187, 'VC', 'Saint Vincent And The Grenadines', 1784, 1),
(188, 'WS', 'Samoa', 684, 1),
(189, 'SM', 'San Marino', 378, 1),
(190, 'ST', 'Sao Tome and Principe', 239, 1),
(191, 'SA', 'Saudi Arabia', 966, 1),
(192, 'SN', 'Senegal', 221, 1),
(193, 'RS', 'Serbia', 381, 1),
(194, 'SC', 'Seychelles', 248, 1),
(195, 'SL', 'Sierra Leone', 232, 1),
(196, 'SG', 'Singapore', 65, 1),
(197, 'SK', 'Slovakia', 421, 1),
(198, 'SI', 'Slovenia', 386, 1),
(199, 'XG', 'Smaller Territories of the UK', 44, 1),
(200, 'SB', 'Solomon Islands', 677, 1),
(201, 'SO', 'Somalia', 252, 1),
(202, 'ZA', 'South Africa', 27, 1),
(203, 'GS', 'South Georgia', 0, 1),
(204, 'SS', 'South Sudan', 211, 1),
(205, 'ES', 'Spain', 34, 1),
(206, 'LK', 'Sri Lanka', 94, 1),
(207, 'SD', 'Sudan', 249, 1),
(208, 'SR', 'Suriname', 597, 1),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47, 1),
(210, 'SZ', 'Swaziland', 268, 1),
(211, 'SE', 'Sweden', 46, 1),
(212, 'CH', 'Switzerland', 41, 1),
(213, 'SY', 'Syria', 963, 1),
(214, 'TW', 'Taiwan', 886, 1),
(215, 'TJ', 'Tajikistan', 992, 1),
(216, 'TZ', 'Tanzania', 255, 1),
(217, 'TH', 'Thailand', 66, 1),
(218, 'TG', 'Togo', 228, 1),
(219, 'TK', 'Tokelau', 690, 1),
(220, 'TO', 'Tonga', 676, 1),
(221, 'TT', 'Trinidad And Tobago', 1868, 1),
(222, 'TN', 'Tunisia', 216, 1),
(223, 'TR', 'Turkey', 90, 1),
(224, 'TM', 'Turkmenistan', 7370, 1),
(225, 'TC', 'Turks And Caicos Islands', 1649, 1),
(226, 'TV', 'Tuvalu', 688, 1),
(227, 'UG', 'Uganda', 256, 1),
(228, 'UA', 'Ukraine', 380, 1),
(229, 'AE', 'United Arab Emirates', 971, 1),
(230, 'GB', 'United Kingdom', 44, 1),
(231, 'US', 'United States', 1, 1),
(232, 'UM', 'United States Minor Outlying Islands', 1, 1),
(233, 'UY', 'Uruguay', 598, 1),
(234, 'UZ', 'Uzbekistan', 998, 1),
(235, 'VU', 'Vanuatu', 678, 1),
(236, 'VA', 'Vatican City State (Holy See)', 39, 1),
(237, 'VE', 'Venezuela', 58, 1),
(238, 'VN', 'Vietnam', 84, 1),
(239, 'VG', 'Virgin Islands (British)', 1284, 1),
(240, 'VI', 'Virgin Islands (US)', 1340, 1),
(241, 'WF', 'Wallis And Futuna Islands', 681, 1),
(242, 'EH', 'Western Sahara', 212, 1),
(243, 'YE', 'Yemen', 967, 1),
(244, 'YU', 'Yugoslavia', 38, 1),
(245, 'ZM', 'Zambia', 260, 1),
(246, 'ZW', 'Zimbabwe', 263, 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency_type`
--

CREATE TABLE `currency_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_type`
--

INSERT INTO `currency_type` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USDT-TRC20-TRX', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(2, 'USDT-ERC20', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(3, 'USDT-OMNI', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(4, 'BTC', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(5, 'LTC', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(6, 'ETH', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(7, 'TRX', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11'),
(8, 'ADA', 1, '2024-03-21 19:13:11', '2024-03-21 19:13:11');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_request`
--

CREATE TABLE `deposit_request` (
  `id` int(11) NOT NULL,
  `depositID` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `deposit_amount` double(10,2) DEFAULT NULL,
  `receivable_amount` double(10,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `to_crypto_wallet_address` varchar(255) DEFAULT NULL,
  `trxId` varchar(255) DEFAULT NULL,
  `depscription` text DEFAULT NULL,
  `wallet_address` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0=Review,2=Reject,1=Approved',
  `approved_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposit_request`
--

INSERT INTO `deposit_request` (`id`, `depositID`, `user_id`, `merchant_id`, `deposit_amount`, `receivable_amount`, `payment_method`, `to_crypto_wallet_address`, `trxId`, `depscription`, `wallet_address`, `status`, `approved_by`, `created_at`, `updated_at`) VALUES
(1, 'DEPOSIT.0127b06252935c330e9f23651b398ce4', 6, 3, 600.00, NULL, NULL, 'B8gYf7P0Wm0X7F2T9hQ0J3y1b8g0d6m9oG', NULL, NULL, NULL, 0, NULL, '2025-01-16 02:41:56', '2025-01-16 02:41:56'),
(2, 'DEPOSIT.7e8750d4a701596732953c160d2ae096', 6, 3, 1050.00, NULL, NULL, 'X9F0t2b7m0Q3Z8d9gY6L2J1V5n3H6p0W2', NULL, NULL, NULL, 0, NULL, '2025-01-16 02:50:33', '2025-01-16 02:50:33'),
(3, 'DEPOSIT.c4de8ced6214345614d33fb0b16a8acd', 6, 3, 650.00, NULL, NULL, '7gMr8zP2XkS4tD5nJ1p5V1Hq9bR4G9x0o', NULL, NULL, NULL, 0, NULL, '2025-01-16 04:29:27', '2025-01-16 04:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `facility_group`
--

CREATE TABLE `facility_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facility_group`
--

INSERT INTO `facility_group` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General Amenities', 'general-amenities', 1, '2025-04-01 15:45:39', '2025-04-01 15:45:39'),
(2, 'Bed & Comfort', 'bed-comfort', 1, '2025-04-01 15:45:45', '2025-04-01 15:45:45'),
(3, 'Bathroom Facilities', 'bathroom-facilities', 1, '2025-04-01 15:45:51', '2025-04-01 15:45:51'),
(4, 'Kitchen & Dining', 'kitchen-dining', 1, '2025-04-01 15:45:57', '2025-04-01 15:45:57'),
(5, 'Technology & Security', 'technology-security', 1, '2025-04-01 15:46:04', '2025-04-01 15:46:04'),
(6, 'Leisure & Extras', 'leisure-extras', 1, '2025-04-01 15:46:11', '2025-04-01 15:46:11'),
(7, 'Additional Services', 'additional-services', 1, '2025-04-01 15:46:16', '2025-04-01 15:46:16'),
(8, 'In your private bathroom', 'in-your-private-bathroom', 1, '2025-04-03 06:17:45', '2025-04-03 06:17:45'),
(9, 'View', 'view', 1, '2025-04-03 06:19:20', '2025-04-03 06:19:20'),
(10, 'Bungalow facilities', 'bungalow-facilities', 1, '2025-04-03 06:20:15', '2025-04-03 06:20:15'),
(11, 'Smoking', 'smoking', 1, '2025-04-03 06:41:03', '2025-04-03 06:41:03'),
(12, 'Bungalow with Sea View', 'bungalow-with-sea-view', 1, '2025-04-03 06:44:46', '2025-04-03 06:44:46'),
(13, 'Executive Suite', 'executive-suite', 1, '2025-04-03 08:56:39', '2025-04-03 08:56:39');

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
-- Table structure for table `global_wallet_address`
--

CREATE TABLE `global_wallet_address` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `lock_unlock` int(11) NOT NULL COMMENT '1=lock,0=unlock',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `global_wallet_address`
--

INSERT INTO `global_wallet_address` (`id`, `name`, `slug`, `status`, `lock_unlock`, `created_at`, `updated_at`) VALUES
(1, 'TYspxFx6hpoPMY7bQD9sMAr8MXHXRGpZcV', NULL, 1, 0, '2024-07-12 18:37:40', '2024-07-15 22:18:01'),
(2, 'TYqqYjuu7Wu9rntHKkttg4bTRVQBJSKTVx', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-16 17:44:30'),
(3, 'TN2rjjCvFNHJn5GDEeYdtSoiUhS5pb5UBo', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-13 03:40:19'),
(4, 'TFfy3cXnTDTsbjrDmaxhtDUtegBQMTTsGB', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-13 03:46:32'),
(5, 'TW7MHZQktuHF3P8hjQtpALhFR3x7xcAarK', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-13 03:49:20'),
(6, 'TL2gcHbUskPiVBPrf8zFLMfswVp6B2yjK9', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-13 03:51:50'),
(7, 'TKpEvzgncwWUx252YUdmrJU2RLmoHzm43A', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-13 05:38:18'),
(8, 'TKvQL9ykYyDCEkNSoktjzDhQppX3Gz5oWE', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-13 06:16:18'),
(9, 'TAosrFLVXqRk1eEPisoKLAZ6KRu5yBSgVK', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-12 18:37:49'),
(10, 'TJ31ZrjgFBsdySaLqUaM2FQaGmNjqQBVb6', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-12 18:37:49'),
(11, 'TXbbicZTeHY3nv3g9v5GWjwpu6f9hGSNVN', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-12 18:37:49'),
(12, 'TFpS6PeSvGSRK6xv1GNftPb4dvfTHoeUfh', NULL, 1, 0, '2024-07-12 18:37:49', '2024-07-12 18:37:49'),
(13, 'TQUiTZzqypMpwSNTaKS1kye2p1MGd4tNvK', 'tquitzzqypmpwsntaks1kye2p1mgd4tnvk', 1, 0, '2024-07-12 18:37:49', '2024-12-09 18:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` text NOT NULL,
  `attempts` int(10) UNSIGNED DEFAULT 0,
  `reserved_at` timestamp NULL DEFAULT NULL,
  `available_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"6e08bc6a-fb56-41e5-8b8a-bf44b880f1ca\",\"displayName\":\"App\\\\Mail\\\\Guestsendingmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:25:\\\"App\\\\Mail\\\\Guestsendingmail\\\":3:{s:10:\\\"customData\\\";s:47:\\\"email=mdbijon%40gmail.com&password=%23123456%23\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"mdbijon@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'default', '{\"uuid\":\"aef278e5-a753-498b-b1b0-acfb138ef995\",\"displayName\":\"App\\\\Mail\\\\Guestsendingmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:25:\\\"App\\\\Mail\\\\Guestsendingmail\\\":3:{s:7:\\\"details\\\";s:48:\\\"email=1mdbijon%40gmail.com&password=%23123456%23\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"1mdbijon@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2024-10-26 11:34:03', '2024-10-26 11:34:03'),
(2, 'Bengali', 'bn', 1, '2024-10-26 11:34:03', '2024-10-27 06:00:00'),
(3, 'Hindi', 'hi', 0, '2024-10-26 11:34:03', '2024-10-26 11:34:03'),
(4, 'Tamil', 'ta', 0, '2024-10-26 11:34:03', '2024-10-27 10:16:45'),
(5, 'Chinese', 'zh', 0, '2024-10-26 11:34:03', '2024-10-27 11:10:21'),
(6, 'Spanish', 'es', 0, '2024-10-26 11:34:03', '2024-10-26 11:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `method` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchant_request`
--

CREATE TABLE `merchant_request` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_key_id` int(10) UNSIGNED NOT NULL,
  `merchant_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) DEFAULT 0 COMMENT '1=approved\r\n0=not approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(3, '2019_08_19_000000_create_failed_jobs_table', 3),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(1, 'gazigiashuddin@gmail.com', 'cBk8LmFh6xfydQ2ao78Qznbj4XtNcPMSJRlNxSUePN07sEr9Vg2yCl3Ou9Y9', '2024-07-11 17:39:05'),
(2, 'gazigiashuddin@gmail.com', 'mhEUCcET2u0JHkrS9srpcahx1Uz9g7D4AcohXUW4VutHE5qiNw73Ozjifyi4', '2024-07-11 17:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `post_category_id` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `thumnail_img` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `slug`, `description`, `post_category_id`, `entry_by`, `thumnail_img`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Slider-1', 'slider-1', '', 7, 1, '/backend/files/q0pgq2UTFfYccXuK9DYl.jpg', 1, '2025-04-25 12:18:34', '2025-04-25 12:18:34'),
(2, 'Slider-2', 'slider-2', '', 7, 1, '/backend/files/JDv2Mdp6EJ5YHGQKQNdW.jpg', 1, '2025-04-25 12:18:46', '2025-04-25 12:18:46'),
(3, 'Slider-3', 'slider-3', '', 7, 1, '/backend/files/SR9hdajh5jYK4qCSs743.jpg', 1, '2025-04-25 12:19:02', '2025-04-25 12:19:02'),
(4, 'Slider-4', 'slider-4', '', 7, 1, '/backend/files/FjogYS7wdUvC7kDA3QlM.jpg', 1, '2025-04-25 12:19:15', '2025-04-25 12:19:15'),
(5, 'Slider-5', 'slider-5', '', 7, 1, '/backend/files/EaRcFiYv6Ptfkss4YmCp.jpg', 1, '2025-04-25 12:19:27', '2025-04-25 12:19:27'),
(6, 'Slider-6', 'slider-6', '', 7, 1, '/backend/files/x1WEdQSvRv74UJy1v4P2.jpg', 1, '2025-04-25 12:19:40', '2025-04-25 12:19:40'),
(7, 'Slider-7', 'slider-7', '', 7, 1, '/backend/files/0jH0It8pmilnzrxRNqnx.jpg', 1, '2025-04-25 12:19:49', '2025-04-25 12:20:02'),
(8, 'Slider-8', 'slider-8', '', 7, 1, '/backend/files/W5dZdFCF5xFBXusodmLa.jpg', 1, '2025-04-25 12:20:23', '2025-04-25 12:20:31'),
(9, 'Slider-9', 'slider-9', '', 7, 1, '/backend/files/gnn8Q5Z79dpPIchQtune.jpg', 1, '2025-04-25 12:20:41', '2025-04-25 12:20:41'),
(11, 'Welcome to Eduzenship: Your Guide to Studying Abroad', 'welcome-to-eduzenship-your-guide-to-studying-abroad', '<p class=\"text-justify\"><strong>Welcome to Eduzenship,</strong> your top destination for comprehensive support in international education. Specializing in guiding students through the complexities of studying abroad, we ensure a seamless journey. Our team offers tailored services including visa application support, personalized advice on selecting the right overseas program, and facilitation of admissions at prestigious global universities. With a strong commitment to excellence and a deep understanding of global education, Eduzenship customizes our services to meet each student\'s unique goals.</p>\r\n<p class=\"text-justify\">At Eduzenship, we believe in empowering students with the knowledge and resources essential for a fulfilling educational experience abroad. Whether you\'re aspiring to study in Europe, North America, Asia, or beyond, our expertise spans diverse educational landscapes. We are dedicated to fostering a supportive environment where your educational ambitions can thrive.</p>\r\n<p class=\"text-justify\">Choose Eduzenship and confidently pursue global opportunities with a partner committed to your success. Join us today and embark on a transformative journey towards a brighter future.</p>', 1, 1, '/backend/files/58QcUmquj5kwTJQeb2ht.jpg', 1, '2025-04-25 15:25:34', '2025-05-29 11:26:01'),
(12, 'Mission & Vision', 'mission-vision', '<h3>Mission</h3>\r\n<p><strong>At Eduzenship</strong>, our mission is to empower students worldwide by providing comprehensive guidance and expert support throughout their journey to study abroad. We are committed to simplifying the complexities of international education, ensuring each student receives personalized assistance tailored to their unique needs. Our goal is to facilitate seamless transitions into prestigious global universities, enabling students to achieve their academic and professional aspirations with confidence and success.</p>\r\n<h3>Vision</h3>\r\n<p>Our vision at Eduzenship is to be a trusted leader in international education consultancy, known for our dedication to student success and excellence in service. We envision a future where every student has access to the opportunities and resources needed to thrive in a globalized world. Through innovative solutions and a deep understanding of global education trends, we aim to redefine the consultancy experience, creating pathways that inspire and empower students to pursue their dreams on an international scale.</p>\r\n<p>&nbsp;</p>', 5, 1, '/backend/files/A6ntXWczbh6vFu5KrxSb.png', 1, '2025-04-25 15:27:49', '2025-04-25 23:39:39'),
(13, 'Goals', 'goals', '<p class=\"text-justify\">&nbsp;</p>\r\n<p class=\"text-justify\">At Eduzenship, our goals are centered around empowering students and facilitating their success in international education. We aim to:</p>\r\n<ul class=\"text-justify\" style=\"padding-left: 20px;\">\r\n<li><strong>Provide Comprehensive Guidance:</strong> Offer detailed support and expert advice to students throughout their journey to study abroad, from choosing the right program to navigating visa processes.</li>\r\n<li><strong>Ensure Personalized Support:</strong> Tailor our services to meet the unique needs and aspirations of each student, ensuring they feel confident and prepared for their educational experience abroad.</li>\r\n<li><strong>Facilitate Seamless Transitions:</strong> Streamline the admission process to prestigious global universities, making it easier for students to access quality education opportunities worldwide.</li>\r\n<li><strong>Promote Student Success:</strong> Foster a supportive environment where students can thrive academically and professionally, equipping them with the skills and knowledge to excel in a globalized society.</li>\r\n<li><strong>Innovate and Lead:</strong> Continuously innovate our services and stay at the forefront of global education trends, setting benchmarks for excellence in international education consultancy.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p class=\"text-justify\">Through these goals, Eduzenship strives to make a positive impact on students\' lives by opening doors to international educational opportunities and shaping their future success on a global scale.</p>', 9, 1, '/backend/files/54T2Mrcs0BGJw6iZNPDI.png', 1, '2025-04-25 15:29:01', '2025-04-25 23:42:32'),
(15, 'Unveiling Our Expertise', 'unveiling-our-expertise', '<p class=\"text-justify\">Embark on a transformative educational journey with Eduzenship. We specialize in crafting personalized pathways tailored to your unique aspirations and academic goals. Our team of experienced consultants ensures that every step&mdash;from initial consultation to post-arrival support&mdash;is designed to maximize your success.</p>', 6, 1, '/backend/files/Yghv8D2JNmBx7zGYB7N1.png', 1, '2025-04-25 15:30:53', '2025-04-25 15:30:53'),
(16, 'Your Personal Compass', 'your-personal-compass', '<p class=\"text-justify\">At Eduzenship, we understand that navigating the global education landscape can be daunting. That&rsquo;s why our dedicated advisors serve as your personal compass, offering tailored guidance to help you make informed decisions. Whether you&rsquo;re exploring study options abroad or seeking advice on cultural integration, we are here to support you every step of the way.</p>', 6, 1, '/backend/files/DjZ8d6aL4lqgXKGSgngF.png', 1, '2025-04-25 15:31:29', '2025-04-25 15:31:29'),
(17, 'Beyond Borders', 'beyond-borders', '<p class=\"text-justify\">Discover the world&rsquo;s leading study destinations with Eduzenship&rsquo;s comprehensive country insights. From the bustling cities of the USA and Canada to the cultural richness of Europe and Asia, we provide detailed information on education systems, living standards, and cultural nuances. Empower yourself with knowledge to choose the perfect destination for your academic journey.</p>', 6, 1, '/backend/files/CBBUCuzCtox1SCDqUe3c.png', 1, '2025-04-25 15:31:52', '2025-04-25 15:31:52'),
(18, 'Course Compass', 'course-compass', '<p class=\"text-justify\">Choosing the right course is pivotal to your academic and career success. Eduzenship&rsquo;s expert consultants work closely with you to identify programs that align with your interests, skills, and future ambitions. Whether you&rsquo;re pursuing undergraduate, postgraduate, or specialized courses, we ensure that your educational path is tailored to your unique aspirations.</p>', 6, 1, '/backend/files/ulwNws3VRS5BsYzpyDlS.png', 1, '2025-04-25 15:32:18', '2025-04-25 15:32:18'),
(19, 'Opening Doors', 'opening-doors', '<p class=\"text-justify\">Navigate the complexities of admissions with confidence. Eduzenship streamlines the application process, offering strategic guidance on documentation, interviews, and application deadlines. Our goal is to equip you with a competitive edge, ensuring that your application stands out among global competitors.</p>', 6, 1, '/backend/files/5cDAztHoCQjz7C6D8fxO.png', 1, '2025-04-25 15:32:41', '2025-04-25 15:32:41'),
(20, 'Finding Your Haven', 'finding-your-haven', '<p class=\"text-justify\">Settle into your new home away from home with ease. Eduzenship provides comprehensive support in securing suitable accommodation that meets your preferences and budget. Whether it&rsquo;s on-campus housing, private rentals, or homestays, we ensure that your living arrangements enhance your overall study abroad experience.</p>', 6, 1, '/backend/files/nOkYAanh4LB69Q5OJmJs.png', 1, '2025-04-25 15:33:14', '2025-04-25 15:33:14'),
(21, 'Ready, Set, Go!', 'ready-set-go-', '<p class=\"text-justify\">Prepare for your international adventure with Eduzenship&rsquo;s comprehensive travel services. From visa application assistance to travel insurance guidance, we ensure that your journey abroad is smooth and stress-free. Our pre-departure orientation sessions prepare you for cultural adjustments and practicalities, setting the stage for a fulfilling educational experience.</p>', 6, 1, '/backend/files/QrIyN7ObpXF7GSwqdLEG.png', 1, '2025-04-25 15:33:29', '2025-04-25 15:33:29'),
(22, 'Your Shield Abroad', 'your-shield-abroad', '<p class=\"text-justify\">Your safety and well-being are our top priorities at Eduzenship. We provide essential resources and guidance on staying safe abroad, including health insurance options, emergency contacts, and local safety protocols. Our proactive approach ensures that you can focus on your studies with peace of mind, knowing that support is always within reach.</p>', 6, 1, '/backend/files/OY3mINZ1UQSOBhOW9U9D.png', 1, '2025-04-25 15:33:43', '2025-04-25 15:33:43'),
(23, 'Scholarships Unveiled', 'scholarships-unveiled', '<p class=\"text-justify\">Financing your education abroad is made easier with Eduzenship&rsquo;s dedicated scholarship support. Our consultants help you explore a range of scholarship opportunities, providing guidance on eligibility criteria, application procedures, and deadlines. Maximize your chances of securing financial aid and embark on your academic journey with confidence.</p>', 6, 1, '/backend/files/YLlaknaIloeF8mnyPalY.png', 1, '2025-04-25 15:34:03', '2025-04-25 15:34:03'),
(24, 'Hungary', 'hungary', '<p class=\"\" data-start=\"147\" data-end=\"442\">Explore the charm of Central Europe where ancient history meets modern ambition. Hungary invites you to discover stunning landscapes, vibrant cities, and a world of cultural richness. Whether you\'re seeking new opportunities or personal growth through travel, Hungary offers the perfect journey.</p>', 2, 1, '/backend/files/0IBDu2M3y3IyvOBaiys2.jpg', 1, '2025-04-26 00:34:07', '2025-04-26 00:58:56'),
(25, 'Lithuania', 'lithuania', '<p>Lithuania is a hidden gem in the heart of the Baltics, offering a perfect mix of history, culture, and natural beauty. Explore the charming streets of Vilnius, a UNESCO World Heritage site, or relax along the Curonian Spit&rsquo;s stunning coastline. From medieval castles to vibrant festivals and warm hospitality, Lithuania is an ideal destination for travelers seeking unique experiences, cultural richness, and peaceful escapes in a rapidly growing European country.</p>', 2, 1, '/backend/files/Mac9owp03OuJa8dTBuyW.jpg', 1, '2025-04-26 00:38:43', '2025-04-26 00:38:43'),
(26, 'Luxembourg', 'luxembourg', '<p>Luxembourg, a hidden gem in the heart of Europe, offers travelers a perfect mix of history, culture, and natural beauty. Explore its fairy-tale castles, lush green valleys, and charming old towns. The capital, Luxembourg City, blends medieval architecture with modern flair. Whether you\'re hiking in the Ardennes, enjoying local cuisine, or discovering its multilingual heritage, Luxembourg promises a peaceful, enriching travel experience.</p>', 2, 1, '/backend/files/4RQRqdaqyjb1yB4MWPwe.jpg', 1, '2025-04-26 00:39:43', '2025-04-26 00:39:43'),
(28, 'Poland', 'poland', '<p>Poland is a captivating travel destination where history, culture, and growth come together. From the medieval charm of Krak&oacute;w to the vibrant energy of Warsaw, Poland offers rich heritage, stunning architecture, and modern experiences. Explore historic castles, taste traditional cuisine, and enjoy scenic landscapes from the Tatra Mountains to the Baltic Sea. Poland invites travelers to discover its welcoming spirit and evolving opportunities.</p>', 2, 1, '/backend/files/foFpUNZZLMnaBvXSSYoq.jpg', 1, '2025-04-26 00:41:07', '2025-04-26 00:41:07'),
(29, 'Romania', 'romania', '<p>Romania is a captivating travel destination filled with natural beauty, medieval charm, and modern vibrancy. From the legendary castles of Transylvania to the scenic Carpathian Mountains and the serene Danube Delta, Romania offers rich experiences for every traveler. Discover vibrant cities like Bucharest, explore ancient traditions, and enjoy the warm hospitality. Romania is a hidden gem where culture, nature, and growth come together in harmony.</p>', 2, 1, '/backend/files/cYS6LU8M0vphsHvZQY8i.jpg', 1, '2025-04-26 00:41:54', '2025-04-26 00:41:54'),
(30, 'Switzerland', 'switzerland', '<p>Switzerland is a dream destination for travelers, offering breathtaking landscapes, world-class cities, and unmatched hospitality. From the snow-capped Alps to serene lakes and charming villages, every corner is picture-perfect. Enjoy scenic train rides, indulge in Swiss chocolate, and explore vibrant cities like Zurich and Geneva. Whether for adventure, relaxation, or cultural discovery, Switzerland promises a journey full of beauty and unforgettable moments.</p>', 2, 1, '/backend/files/s268d6weYF5v4WWNbcM8.jpg', 1, '2025-04-26 00:42:40', '2025-04-26 00:42:40'),
(31, 'Denmark', 'denmark', '<p>Denmark is a captivating travel destination where history meets modern innovation. Wander through charming streets in Copenhagen, explore Viking heritage, and enjoy scenic coastlines and fairy-tale castles. Known for its safety, cleanliness, and friendly locals, Denmark offers a perfect blend of cultural richness and contemporary comfort. Whether biking through cities or relaxing in nature, every moment in Denmark is a step into peaceful, stylish adventure.</p>', 2, 1, '/backend/files/WqynvEZg2dfnVYNT8VTm.jpg', 1, '2025-04-26 00:43:21', '2025-04-26 00:43:21'),
(32, 'Sweden', 'sweden', '<p>Sweden is a stunning destination that offers travelers a blend of natural beauty, rich history, and modern innovation. From the northern lights in Abisko to the vibrant culture in Stockholm, Sweden provides endless adventures. Explore the lush landscapes, picturesque archipelagos, and the world-renowned Swedish design scene. Whether you\'re hiking in the Swedish Lapland, experiencing Swedish cuisine, or learning about its sustainable lifestyle, Sweden promises a memorable and enriching journey.</p>', 2, 1, '/backend/files/20FEv75xmXPGFJvhVSnZ.jpg', 1, '2025-04-26 00:44:03', '2025-04-26 00:44:03'),
(33, 'USA', 'usa', '<p>The USA offers a vast array of travel opportunities, with something for every type of adventurer. From the bustling streets of New York City to the natural wonders of the Grand Canyon, the country provides diverse landscapes and cultures. Whether you\'re exploring iconic landmarks, experiencing world-class entertainment, or discovering hidden gems in charming small towns, the USA promises a journey of excitement, growth, and countless memories for every traveler.</p>', 2, 1, '/backend/files/DaasNfXuGYF1rEHcobHR.jpg', 1, '2025-04-26 00:44:51', '2025-04-26 00:44:51'),
(34, 'Business Studies', 'business-studies', '<p>At Eduzenship, we offer comprehensive guidance for Business Studies programs, including Bachelor of Business Administration (BBA) and Master of Business Administration (MBA) degrees. Our expert advisors provide personalized assistance to students interested in pursuing these dynamic fields of study. Whether you\'re looking to establish a strong foundation in business management with a BBA or aiming to advance your career with an MBA specializing in various disciplines, such as finance, marketing, or international business, Eduzenship is committed to helping you navigate the application process, choose the right program, and achieve your educational and professional goals in the global marketplace.</p>', 3, 1, '/backend/files/Z9HboSXTICKAsm4bDize.jpg', 1, '2025-04-26 01:16:45', '2025-04-26 01:18:50'),
(35, 'Engineering', 'engineering', '<p><strong>Courses - Engineering and Related Fields</strong><br>Eduzenship offers comprehensive support for a variety of Engineering and related disciplines, catering to students interested in pursuing careers in these dynamic fields. Our services cover:</p>\r\n<p><strong>Computer Science and Engineering (CSE): <br></strong>Guidance for students aiming to delve into the world of software development, artificial intelligence, cybersecurity, and more.<br><br><strong>Electrical and Electronic Engineering (EEE): <br><br></strong>Support for those looking to specialize in electrical systems, electronics, telecommunications, and renewable energy technologies.<br>Physics: Assistance for students interested in fundamental scientific principles, with applications ranging from materials science to theoretical research.<br>Industrial Engineering: Guidance for students interested in optimizing complex systems, improving efficiency, and managing resources in industrial settings.<br>Architecture: Support for aspiring architects in developing skills in design, sustainability, urban planning, and construction management.<br>Data Science: Assistance for students pursuing expertise in data analysis, machine learning, and big data applications across various industries.<br>Eduzenship is committed to helping students navigate the complexities of these fields, providing personalized guidance to choose the right program, prepare for admissions, and succeed academically and professionally in their chosen career paths.</p>\r\n<p>&nbsp;</p>', 3, 1, '/backend/files/tS0zn4FaOEh3X2MPGrKZ.jpg', 1, '2025-04-26 01:17:40', '2025-04-26 01:19:54'),
(36, 'Nursing', 'nursing', '<p><strong>Courses - Nursing</strong><br>Eduzenship provides dedicated support for students interested in pursuing a career in Nursing. Our services cater to individuals passionate about healthcare and nursing practice, offering guidance and assistance in various areas:</p>\r\n<p><strong>Bachelor of Science in Nursing (BSN):</strong> Comprehensive support for students seeking to earn their BSN degree, preparing them for roles in direct patient care, health promotion, and disease prevention.</p>\r\n<p><strong>Master of Science in Nursing (MSN): </strong>Assistance for registered nurses looking to advance their careers with specialized knowledge in areas such as nurse leadership, nurse education, or advanced clinical practice.</p>\r\n<p><strong>Nursing Licensure Exam Preparation: </strong>Guidance and resources to help students prepare for nursing licensure exams in their respective countries or regions, ensuring readiness for professional practice.<br><br><strong>International Nursing Education:</strong> Support for international students seeking to study Nursing abroad, including assistance with visa applications, admission processes, and cultural adaptation.<br><br>Eduzenship understands the critical role of nurses in healthcare and is committed to empowering aspiring nurses with the knowledge, skills, and support they need to succeed in this rewarding profession. Whether you\'re starting your journey in nursing education or advancing your career, we\'re here to help you achieve your academic and professional goals in the field of Nursing.</p>', 3, 1, '/backend/files/iIxROK78TAjLIshUi6vh.jpg', 1, '2025-04-26 01:21:12', '2025-04-26 01:21:12'),
(37, 'LAW', 'law', '<p><strong>Courses - Law</strong><br>Eduzenship offers comprehensive support for students interested in pursuing a career in Law, providing guidance and assistance across various legal disciplines:</p>\r\n<p><strong>Bachelor of Laws (LLB):</strong> Guidance for students aiming to build a solid foundation in legal principles, preparing them for entry into the legal profession or advanced studies in law.<br><br><strong>Master of Laws (LLM): </strong>Assistance for law graduates and legal professionals looking to specialize in specific areas of law such as international law, human rights law, business law, or intellectual property law.<br><br><strong>Bar Exam Preparation:</strong> Support and resources to help students prepare for bar exams in their respective jurisdictions, ensuring readiness for licensure and entry into legal practice.<br><br><strong>Legal Internships and Clerkships:</strong> Assistance in securing internships and clerkships at law firms, government agencies, or corporate legal departments to gain practical experience and enhance career prospects.<br><br>Eduzenship recognizes the importance of legal education in shaping societies and is committed to helping aspiring lawyers achieve their academic and professional goals. Whether you\'re starting your journey in legal studies or advancing your career in the legal field, we\'re here to provide personalized guidance and support throughout your educational and professional journey in Law</p>', 3, 1, '/backend/files/31DWBS1OCylJ2X3VYV8B.jpg', 1, '2025-04-26 01:23:51', '2025-04-26 01:23:51'),
(38, 'PhD', 'phd', '<p><strong>Courses - PhD Programs</strong><br>Eduzenship provides expert guidance and comprehensive support for students interested in pursuing a Doctor of Philosophy (PhD) degree. Whether you\'re aiming to advance knowledge in your field through research or seeking to enhance your career prospects in academia or industry, our services include:</p>\r\n<p>Program Selection: Personalized assistance in identifying PhD programs that align with your research interests, academic background, and career goals.<br>Application Support: Guidance throughout the application process, including advice on preparing research proposals, securing letters of recommendation, and meeting application deadlines.<br><br>Funding Opportunities: Information and support in exploring funding opportunities, such as scholarships, grants, and research assistantships, to support your PhD studies financially.<br><br>Visa and Immigration Support: Assistance with visa application processes for international students, ensuring compliance with immigration requirements and facilitating a smooth transition to studying abroad.<br><br>Thesis and Dissertation Support: Guidance and resources to help you navigate the thesis or dissertation writing process, including literature review, research methodology, data analysis, and manuscript preparation.<br>Career Development: Support in preparing for academic or industry careers post-PhD, including networking opportunities, job search strategies, and professional development workshops.<br><br>Eduzenship understands the significance of a PhD in advancing knowledge and career opportunities. We are committed to providing personalized support and expert guidance to help you succeed academically and professionally in your PhD journey.</p>', 3, 1, '/backend/files/zeo0XtiI8JfD104qMjK3.jpg', 1, '2025-04-26 01:25:14', '2025-04-26 01:25:14'),
(39, 'Eduzenship: Comprehensive Support for International Students', 'eduzenship-comprehensive-support-for-international-students', '<div class=\"item-content p-4\" style=\"max-width: 100%;\">\r\n<p class=\"text-justify\">Eduzenship provides a wide range of specialized services to support students at every stage of their study abroad journey:</p>\r\n<p class=\"text-justify\"><strong>1. Educational Consultation:</strong> Our expert advisors offer personalized guidance to help students choose academic programs and institutions that align with their goals. We ensure students make informed decisions that pave the way for long-term academic success.</p>\r\n<p class=\"text-justify\"><strong>2. Visa Application Assistance:</strong> We provide thorough support throughout the visa process, from document preparation to timely submission. Our team stays current with immigration policies to help students navigate the application smoothly and confidently.</p>\r\n<p class=\"text-justify\"><strong>3. Admission Counseling:</strong> We assist with all aspects of university applications, including personal statement development and meeting admission requirements. Our approach focuses on showcasing each student&rsquo;s strengths to boost their chances of acceptance.</p>\r\n<p class=\"text-justify\"><strong>4. Scholarship and Financial Aid Guidance:</strong> Recognizing the financial demands of international study, we guide students in identifying and applying for scholarships and financial aid. Our support helps ease the burden and make global education more accessible.</p>\r\n<p class=\"text-justify\"><strong>5. Pre-Departure Preparation:</strong> We equip students with essential pre-departure knowledge through orientation sessions, cultural insights, and practical tips to ensure a seamless transition into their new academic environment.</p>\r\n<p class=\"text-justify\"><strong>6. Post-Arrival Support:</strong> Eduzenship continues to support students after arrival, helping them settle in, handle administrative matters, and adapt to new cultural and academic settings.</p>\r\n<p class=\"text-justify\"><strong>7. Career and Employment Services:</strong> We provide career counseling and job search support to help students build fulfilling careers post-graduation. Our services include career planning, networking opportunities, and employment strategies tailored to global job markets.</p>\r\n</div>', 4, 1, '/backend/files/oAhZvJp6gyHGVouC4Luo.jpg', 1, '2025-04-26 01:31:34', '2025-04-26 01:31:34'),
(41, 'United States of America (USA)', 'united-states-of-america', '<p class=\"\" data-start=\"73\" data-end=\"350\">The United States of America (USA) hosts the world\'s largest number of international students. Quality education, unique curriculum, multicultural environment, and abundant opportunities are just some of the reasons why many Bangladeshi students aspire to study in the US.</p>\r\n<p class=\"\" data-start=\"352\" data-end=\"675\">American universities and colleges are known for their academic excellence, cutting-edge research facilities, and strong support for international students. Institutions such as Harvard, MIT, Stanford, and many others consistently rank among the top universities globally, attracting students from all corners of the world.</p>\r\n<p class=\"\" data-start=\"677\" data-end=\"1010\">In addition to world-class education, students in the US benefit from a diverse learning environment where individuals from different backgrounds come together, fostering global perspectives and cultural understanding. This exposure not only enhances academic learning but also prepares students to succeed in a globalized workforce.</p>\r\n<p class=\"\" data-start=\"1012\" data-end=\"1412\">Another major advantage of studying in the US is the flexibility of the education system. Students have the opportunity to explore a variety of subjects before declaring a major, which allows them to discover their true interests and career goals. Furthermore, universities offer a wide range of programs, specializations, and extracurricular activities to help students build a well-rounded profile.</p>\r\n<p class=\"\" data-start=\"1414\" data-end=\"1809\">The US also provides abundant opportunities for internships, research assistantships, and part-time work during studies, helping students gain practical experience and develop professional networks. After graduation, many students are eligible for programs like Optional Practical Training (OPT) and STEM extensions, which allow them to work in their field of study and gain valuable experience.</p>\r\n<p class=\"\" data-start=\"1811\" data-end=\"2112\">Scholarships and financial aid options are available at many institutions, making education in the US more accessible to talented Bangladeshi students. In addition, Bangladeshi student communities and organizations across the US offer support, friendship, and guidance, helping newcomers feel at home.</p>\r\n<p class=\"\" data-start=\"2114\" data-end=\"2302\">Choosing to study in the United States is not just about earning a degree &mdash; it is a life-changing experience that opens doors to endless possibilities for personal and professional growth.</p>', 8, 1, '/backend/files/djpMcOo2lIn2W6fuhcgB.jpeg', 1, '2025-04-27 02:14:10', '2025-04-27 02:14:10'),
(42, 'United States of America (USA)', 'united-states-of-america-usa-', '<p class=\"\" data-start=\"73\" data-end=\"350\">The United States of America (USA) hosts the world\'s largest number of international students. Quality education, unique curriculum, multicultural environment, and abundant opportunities are just some of the reasons why many Bangladeshi students aspire to study in the US.</p>\r\n<p class=\"\" data-start=\"352\" data-end=\"675\">American universities and colleges are known for their academic excellence, cutting-edge research facilities, and strong support for international students. Institutions such as Harvard, MIT, Stanford, and many others consistently rank among the top universities globally, attracting students from all corners of the world.</p>\r\n<p class=\"\" data-start=\"677\" data-end=\"1010\">In addition to world-class education, students in the US benefit from a diverse learning environment where individuals from different backgrounds come together, fostering global perspectives and cultural understanding. This exposure not only enhances academic learning but also prepares students to succeed in a globalized workforce.</p>\r\n<p class=\"\" data-start=\"1012\" data-end=\"1412\">Another major advantage of studying in the US is the flexibility of the education system. Students have the opportunity to explore a variety of subjects before declaring a major, which allows them to discover their true interests and career goals. Furthermore, universities offer a wide range of programs, specializations, and extracurricular activities to help students build a well-rounded profile.</p>\r\n<p class=\"\" data-start=\"1414\" data-end=\"1809\">The US also provides abundant opportunities for internships, research assistantships, and part-time work during studies, helping students gain practical experience and develop professional networks. After graduation, many students are eligible for programs like Optional Practical Training (OPT) and STEM extensions, which allow them to work in their field of study and gain valuable experience.</p>\r\n<p class=\"\" data-start=\"1811\" data-end=\"2112\">Scholarships and financial aid options are available at many institutions, making education in the US more accessible to talented Bangladeshi students. In addition, Bangladeshi student communities and organizations across the US offer support, friendship, and guidance, helping newcomers feel at home.</p>\r\n<p class=\"\" data-start=\"2114\" data-end=\"2302\">Choosing to study in the United States is not just about earning a degree &mdash; it is a life-changing experience that opens doors to endless possibilities for personal and professional growth.</p>', 8, 1, '/backend/files/djpMcOo2lIn2W6fuhcgB.jpeg', 1, '2025-04-27 02:14:10', '2025-04-27 02:14:10'),
(44, 'Malta', 'malta', '<p>Explore the beauty of Malta, a Mediterranean gem where rich history blends seamlessly with modern living. Malta invites you to experience breathtaking coastlines, charming cities, and a vibrant cultural heritage. Whether you are looking for new career opportunities, educational growth, or simply a memorable travel experience, Malta offers the perfect setting for your next journey.</p>', 2, 1, '/backend/files/yiUr0bkqzqMyfC5H6xEF.jpg', 1, '2025-04-27 02:19:39', '2025-04-27 02:19:39'),
(45, 'Title: Unlock the World: Why Traveling is the Ultimate Adventure', 'title-unlock-the-world-why-traveling-is-the-ultimate-adventure', '<p class=\"\" data-start=\"203\" data-end=\"434\">Traveling is more than just moving from one place to another &mdash; it\'s about experiencing life in its purest form. Each journey opens the door to new cultures, breathtaking landscapes, and unforgettable memories that shape who we are.</p>\r\n<p class=\"\" data-start=\"436\" data-end=\"827\">When you travel, you step outside your comfort zone. You meet people with different perspectives, taste foods you&rsquo;ve never heard of, and discover traditions that broaden your mind. Whether you\'re wandering through the historic streets of Rome, hiking in the lush mountains of Nepal, or relaxing on the pristine beaches of the Maldives, every moment adds a new chapter to your personal story.</p>\r\n<p class=\"\" data-start=\"829\" data-end=\"1045\">Travel also teaches you resilience and flexibility. Delayed flights, language barriers, or unexpected changes become opportunities to grow. You learn to adapt, to trust yourself, and to find beauty in the unexpected.</p>\r\n<p class=\"\" data-start=\"1047\" data-end=\"1230\">But beyond the adventure, traveling fosters a deep appreciation for the world. It reminds you that despite our differences, we are all connected by shared dreams, hopes, and kindness.</p>\r\n<p class=\"\" data-start=\"1232\" data-end=\"1342\">So pack your bags, open your heart, and chase new horizons. The world is full of wonders waiting just for you.</p>', 14, 1, '/backend/files/wQ7hmMQgYHKuGZTviRgC.webp', 1, '2025-04-27 02:36:57', '2025-04-27 02:36:57'),
(46, 'A Journey Through Nature, Culture, and Adventure', 'a-journey-through-nature-culture-and-adventure', '<p class=\"\" data-start=\"157\" data-end=\"443\">Canada, the second-largest country in the world, offers a stunning blend of natural beauty, vibrant cities, and rich cultural experiences. From the breathtaking peaks of the Rocky Mountains to the charming streets of Quebec City, Canada invites travelers to explore its endless wonders.</p>\r\n<p class=\"\" data-start=\"445\" data-end=\"732\">Nature lovers will find paradise in Canada&rsquo;s vast wilderness. Whether you\'re kayaking across the crystal-clear lakes of Banff, witnessing the awe-inspiring Northern Lights in Yukon, or hiking through the lush forests of British Columbia, the landscapes here are nothing short of magical.</p>\r\n<p class=\"\" data-start=\"734\" data-end=\"1006\">Canada&rsquo;s cities are equally captivating. Toronto buzzes with energy and diversity, Montreal charms with its European flair, and Vancouver offers a perfect balance of urban life and outdoor adventure. Each city tells its own unique story, welcoming visitors with open arms.</p>\r\n<p class=\"\" data-start=\"1008\" data-end=\"1240\">Beyond its stunning views and modern cities, Canada is a land of warm hospitality and multicultural richness. The country&rsquo;s deep-rooted history, indigenous traditions, and global influences create an unforgettable travel experience.</p>\r\n<p class=\"\" data-start=\"1242\" data-end=\"1464\">Whether you seek thrilling adventures, peaceful retreats, or cultural explorations, Canada promises a journey filled with lasting memories. Pack your bags and get ready to discover the true spirit of the Great White North!</p>', 14, 1, '/backend/files/uR7DN08IAqoqykL4KFU0.jpg', 1, '2025-04-27 02:37:46', '2025-04-27 02:38:18'),
(47, 'A Journey Through History, Culture, and Beauty', 'a-journey-through-history-culture-and-beauty', '<p class=\"\" data-start=\"161\" data-end=\"404\">Poland is a land where centuries of history meet vibrant modern life. From the charming cobblestone streets of Krak&oacute;w to the dynamic energy of Warsaw, traveling through Poland offers a rich tapestry of experiences that captivate every visitor.</p>\r\n<p class=\"\" data-start=\"406\" data-end=\"812\">Start your journey in Krak&oacute;w, a city filled with medieval architecture, lively squares, and a deep cultural heartbeat. Wander through the historic Old Town, explore Wawel Castle, and feel the stories whispered by the ancient walls. In Warsaw, Poland\'s resilient capital, discover a fascinating blend of old and new &mdash; where beautifully restored historic districts stand proudly alongside modern skyscrapers.</p>\r\n<p class=\"\" data-start=\"814\" data-end=\"1141\">Beyond the cities, Poland&rsquo;s natural landscapes are equally breathtaking. The Tatra Mountains offer majestic hiking trails and winter sports, while the serene Mazury lakes promise peaceful retreats surrounded by nature. Don&rsquo;t miss the Baltic coast, where golden beaches and charming seaside towns invite you to relax and unwind.</p>\r\n<p class=\"\" data-start=\"1143\" data-end=\"1346\">Polish hospitality is warm and genuine. Whether you\'re savoring a hearty plate of pierogi, visiting a cozy caf&eacute;, or joining a local festival, you\'ll feel the welcoming spirit that defines Polish culture.</p>\r\n<p class=\"\" data-start=\"1348\" data-end=\"1563\">Whether you\'re a history enthusiast, a nature lover, or simply a curious traveler, Poland promises an unforgettable adventure filled with beauty, resilience, and heart. Your story in Poland is waiting to be written.</p>', 14, 1, '/backend/files/h4tJbAbbGGcLD7Z8n8TV.jpg', 1, '2025-04-27 02:40:09', '2025-04-27 02:40:09'),
(48, 'Discover the Magic of Dubai: A World-Class Destination Awaits', 'discover-the-magic-of-dubai-a-world-class-destination-awaits', '<p class=\"\" data-start=\"145\" data-end=\"456\">Dubai is more than just a city &mdash; it&rsquo;s a phenomenon. A vibrant fusion of ancient traditions and cutting-edge modernity, Dubai stands as one of the most dynamic travel destinations in the world. Whether you&rsquo;re an adventure enthusiast, a shopping lover, or a history buff, Dubai offers an unforgettable experience.</p>\r\n<p class=\"\" data-start=\"458\" data-end=\"485\"><strong data-start=\"458\" data-end=\"485\">A Skyline Like No Other</strong></p>\r\n<p class=\"\" data-start=\"487\" data-end=\"982\">The Dubai skyline is iconic, with towering skyscrapers like the Burj Khalifa, the world&rsquo;s tallest building, piercing the clouds. From the observation decks of this architectural marvel, you can see the city stretch out like a glittering oasis in the desert. Dubai&rsquo;s skyline is constantly evolving, with new constructions that redefine modern architecture. Don&rsquo;t miss the chance to take a panoramic view of the city from above &ndash; it&rsquo;s an experience that&rsquo;s hard to match anywhere else in the world.</p>\r\n<p class=\"\" data-start=\"984\" data-end=\"1017\"><strong data-start=\"984\" data-end=\"1017\">Beaches and Desert Adventures</strong></p>\r\n<p class=\"\" data-start=\"1019\" data-end=\"1312\">While Dubai is known for its glitzy malls and luxury hotels, it&rsquo;s also home to stunning natural landscapes. The pristine beaches along the Arabian Gulf offer a relaxing escape with golden sand and turquoise waters. Enjoy world-class resorts or try water sports like jet skiing and parasailing.</p>\r\n<p class=\"\" data-start=\"1314\" data-end=\"1648\">For those seeking a more rugged adventure, the desert calls. Embark on a thrilling desert safari, where you can ride dune buggies, camel trek, or watch the mesmerizing sunset over the vast desert dunes. In the evenings, experience traditional Bedouin culture, complete with star-lit skies and delicious Arabic cuisine under the stars.</p>\r\n<p class=\"\" data-start=\"1650\" data-end=\"1671\"><strong data-start=\"1650\" data-end=\"1671\">Shopping Paradise</strong></p>\r\n<p class=\"\" data-start=\"1673\" data-end=\"2019\">Dubai is a shopper\'s paradise. The city\'s malls are some of the largest and most luxurious in the world. The Dubai Mall, home to thousands of stores, an ice rink, and even an aquarium, is an experience in itself. During the Dubai Shopping Festival, the entire city becomes one giant sale, with unbeatable discounts, promotions, and entertainment.</p>\r\n<p class=\"\" data-start=\"2021\" data-end=\"2276\">If you&rsquo;re looking for something more traditional, head to the Gold Souk or the Spice Souk, where you&rsquo;ll find everything from gold jewelry to exotic spices. These markets offer a more authentic Dubai experience and a chance to bargain for unique treasures.</p>\r\n<p class=\"\" data-start=\"2278\" data-end=\"2321\"><strong data-start=\"2278\" data-end=\"2321\">Cultural Wonders and Modern Attractions</strong></p>\r\n<p class=\"\" data-start=\"2323\" data-end=\"2638\">Dubai is also home to a blend of cultures and attractions that cater to all tastes. The Dubai Opera is an architectural masterpiece, offering world-class performances. The Dubai Museum in the Al Fahidi Fort gives insight into the city\'s humble beginnings before the oil boom transformed it into a global metropolis.</p>\r\n<p class=\"\" data-start=\"2640\" data-end=\"2949\">For those interested in family-friendly fun, Dubai Parks and Resorts offers theme parks that appeal to all ages, including motion picture-themed attractions and water parks. The famous Palm Jumeirah is a man-made island with upscale hotels and luxury villas, perfect for a relaxing stay or a leisurely stroll.</p>\r\n<p class=\"\" data-start=\"2951\" data-end=\"2983\"><strong data-start=\"2951\" data-end=\"2983\">A World of Culinary Delights</strong></p>\r\n<p class=\"\" data-start=\"2985\" data-end=\"3427\">No trip to Dubai would be complete without exploring its culinary scene. From traditional Arabic dishes like hummus and shawarma to world-class fine dining, Dubai offers flavors from all over the globe. The city is home to numerous Michelin-starred restaurants and celebrity chef establishments. Don&rsquo;t forget to visit the various food festivals and street markets, where you can taste everything from gourmet street food to decadent desserts.</p>\r\n<p class=\"\" data-start=\"3429\" data-end=\"3455\"><strong data-start=\"3429\" data-end=\"3455\">The Best Time to Visit</strong></p>\r\n<p class=\"\" data-start=\"3457\" data-end=\"3848\">Dubai is a year-round destination, but the best time to visit is during the cooler months, from November to March, when the weather is perfect for outdoor activities and sightseeing. The city hosts numerous events and festivals during this time, including the Dubai Food Festival, Dubai International Film Festival, and the Dubai Shopping Festival, making it an ideal time to plan your trip.</p>', 14, 1, '/backend/files/2ML6eGy0Q9aZvgczslku.jpg', 1, '2025-04-27 03:09:09', '2025-04-27 03:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_category`
--

INSERT INTO `post_category` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'About us', 'about-us', 1, '2025-04-25 11:53:28', '2025-04-26 00:30:59'),
(2, 'Countries', 'countries', 1, '2025-04-25 11:53:52', '2025-04-26 00:30:55'),
(3, 'Courses', 'courses', 1, '2025-04-25 11:54:17', '2025-04-26 00:30:51'),
(4, 'Services', 'services', 1, '2025-04-25 11:54:28', '2025-04-26 00:30:46'),
(5, 'Mission & Vision', 'mission-vision', 1, '2025-04-25 11:55:03', '2025-04-26 00:30:41'),
(6, 'Our Offerings', 'our-offerings', 1, '2025-04-25 11:55:17', '2025-04-26 00:30:35'),
(7, 'Sliders', 'sliders', 1, '2025-04-25 11:56:46', '2025-04-26 00:30:30'),
(8, 'Featured Article', 'featured-article', 1, '2025-04-25 15:12:53', '2025-04-26 00:30:26'),
(9, 'Goals', 'goals', 1, '2025-04-25 15:28:12', '2025-04-26 00:30:23'),
(14, 'Blog', 'blog', 1, '2025-04-27 02:04:14', '2025-04-27 02:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `promocode`
--

CREATE TABLE `promocode` (
  `id` bigint(20) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `form_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `promoCode` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promocode`
--

INSERT INTO `promocode` (`id`, `room_id`, `form_date`, `to_date`, `discount`, `promoCode`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, '2025-03-12', '2025-03-15', 500.00, 'BEFO-488', 1, '2025-04-01 13:20:55', '2025-04-01 13:20:55'),
(2, 5, '2025-04-07', '2025-04-17', 5366.00, 'BEFO-4882', 1, '2025-04-01 13:26:03', '2025-04-01 14:33:07'),
(3, 1, '2025-04-01', '2025-04-15', 33.00, 'BEFO-488233', 1, '2025-04-01 13:27:03', '2025-04-01 13:27:03');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `roomType` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `extraCapacity` varchar(255) DEFAULT NULL COMMENT 'extraCapability',
  `roomPrice` decimal(10,2) DEFAULT NULL,
  `bedCharge` int(11) DEFAULT NULL,
  `room_size_id` int(11) DEFAULT NULL,
  `bedNumber` varchar(255) DEFAULT NULL,
  `bed_type_id` int(11) DEFAULT NULL,
  `roomDescription` text DEFAULT NULL,
  `reserveCondition` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `booking_status` int(11) DEFAULT NULL COMMENT '1=Booked 2=Release 3=Cancel',
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `name`, `slug`, `roomType`, `capacity`, `extraCapacity`, `roomPrice`, `bedCharge`, `room_size_id`, `bedNumber`, `bed_type_id`, `roomDescription`, `reserveCondition`, `status`, `booking_status`, `created_at`, `updated_at`) VALUES
(1, 'Bungalow with Sea View', 'bungalow-with-sea-view', 'Bungalow with Sea View', 5, '', 7323.00, 0, 0, '', 1, 'Comfy beds, 10 – Based on 1 review\nThis bungalow includes 1 living room, 1 separate bedroom and 1 bathroom with a shower and free toiletries. The unit has air conditioning, sea views, a balcony and fruit is offered for guests. The unit has 1 bed. Bungalow size: 29 m²', '', 1, 2, '2025-04-03 14:43:03', '2025-04-15 17:31:51'),
(2, 'Executive Suite', 'executive-suite', 'Executive Suite', 5, '', 19528.00, 0, 0, '', 3, 'Living room: 1 sofa bed\n\nComfy beds, 10 – Based on 1 review\nThe unit has 2 beds.', '', 1, 1, '2025-04-03 14:56:26', '2025-04-15 14:31:16'),
(3, 'Deluxe Room', 'Deluxe-room', 'Deluxe-room', 5, '', 19528.00, 0, 0, '', 3, 'Living room: 1 sofa bed\r\n\r\nComfy beds, 10 – Based on 1 review\r\nThe unit has 2 beds.', '', 1, 1, '2025-04-03 14:56:26', '2025-04-15 14:22:28'),
(4, 'King Room', 'king-room', 'king-room', 5, '', 19528.00, 0, 0, '', 3, 'Living room: 1 sofa bed\r\n\r\nComfy beds, 10 – Based on 1 review\r\nThe unit has 2 beds.', '', 1, 2, '2025-04-03 14:56:26', '2025-04-15 17:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `room_facility`
--

CREATE TABLE `room_facility` (
  `id` bigint(20) NOT NULL,
  `room_facility_group_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_facility`
--

INSERT INTO `room_facility` (`id`, `room_facility_group_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Air conditioning', 'air-conditioning', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(2, 1, 'Free Wi-Fi', 'free-wifi', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(3, 1, 'Smart TV / Cable TV', 'smart-tv', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(4, 1, 'Work desk & chair', 'work-desk-chair', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(5, 1, 'Sofa or seating area', 'sofa-seating-area', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(6, 1, 'Wardrobe/Closet', 'wardrobe-closet', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(7, 1, 'Safe deposit box', 'safe-deposit-box', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(8, 1, 'Telephone', 'telephone', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(9, 1, 'Alarm clock', 'alarm-clock', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(10, 1, 'Full-length mirror', 'full-length-mirror', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(11, 1, 'Private entrance', 'private-entrance', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(12, 1, 'Coat rack', 'coat-rack', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(13, 1, 'Soundproof walls', 'soundproof-walls', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(14, 1, 'Blackout curtains', 'blackout-curtains', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(15, 1, 'Carpeting / Wooden flooring', 'carpeting-wooden-flooring', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(16, 2, 'King/Queen/Twin beds', 'king-queen-twin-beds', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(17, 2, 'High-quality mattress', 'high-quality-mattress', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(18, 2, 'Soft pillows & cushions', 'soft-pillows-cushions', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(19, 2, 'Extra blanket', 'extra-blanket', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(20, 2, 'Bedside table', 'bedside-table', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(21, 2, 'Adjustable bed lighting', 'adjustable-bed-lighting', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(22, 2, 'Reading lamp', 'reading-lamp', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(23, 2, 'Electric blanket (for winter)', 'electric-blanket', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(24, 10, 'Mosquito net', 'mosquito-net', 1, '2025-04-01 18:02:03', '2025-04-03 06:27:26'),
(25, 2, 'Hypoallergenic bedding', 'hypoallergenic-bedding', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(26, 3, 'Private bathroom', 'private-bathroom', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(27, 3, 'Rain shower', 'rain-shower', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(28, 3, 'Bathtub', 'bathtub', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(29, 3, 'Hot & cold water', 'hot-cold-water', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(30, 3, 'Fresh towels', 'fresh-towels', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(31, 3, 'Hairdryer', 'hairdryer', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(32, 3, 'Bathrobe & slippers', 'bathrobe-slippers', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(33, 3, 'Complimentary toiletries', 'complimentary-toiletries', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(34, 3, 'Magnifying makeup mirror', 'magnifying-makeup-mirror', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(35, 3, 'Bidet / Toilet hose', 'bidet-toilet-hose', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(36, 3, 'Heated towel rack', 'heated-towel-rack', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(37, 4, 'Mini refrigerator', 'mini-refrigerator', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(38, 4, 'Electric kettle', 'electric-kettle', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(39, 4, 'Coffee maker', 'coffee-maker', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(40, 4, 'Microwave oven', 'microwave-oven', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(41, 4, 'Dining table & chairs', 'dining-table-chairs', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(42, 4, 'Cutlery & crockery set', 'cutlery-crockery-set', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(43, 4, 'Bottled drinking water', 'bottled-drinking-water', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(44, 5, 'Electronic key card access', 'electronic-key-card', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(45, 5, 'Fire alarm & smoke detector', 'fire-alarm-smoke-detector', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(46, 5, 'Emergency evacuation plan', 'emergency-evacuation-plan', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(47, 5, 'CCTV security', 'cctv-security', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(48, 5, 'Power backup / Generator', 'power-backup-generator', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(49, 6, 'Balcony / Terrace', 'balcony-terrace', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(50, 6, 'In-room jacuzzi', 'in-room-jacuzzi', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(51, 6, 'Private swimming pool', 'private-swimming-pool', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(52, 6, 'City/Mountain/Sea view rooms', 'city-mountain-sea-view', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(53, 7, 'Room service (24/7)', 'room-service', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(54, 7, 'Newspaper delivery', 'newspaper-delivery', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(55, 7, 'Concierge service', 'concierge-service', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(56, 7, 'Laundry & dry-cleaning service', 'laundry-dry-cleaning', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(57, 7, 'Shoe polishing kit', 'shoe-polishing-kit', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(58, 7, 'Luggage storage', 'luggage-storage', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(59, 7, 'Turndown service', 'turndown-service', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(60, 7, 'Express check-in/check-out', 'express-check-in-out', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(61, 7, 'Babysitting service', 'babysitting-service', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(62, 7, 'Car rental assistance', 'car-rental-assistance', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(63, 7, 'Airport transfer service', 'airport-transfer-service', 1, '2025-04-01 18:02:03', '2025-04-01 18:02:03'),
(65, 8, 'Free toiletries', 'free-toiletries', 1, '2025-04-03 06:18:02', '2025-04-03 06:18:02'),
(66, 8, 'Toilet', 'toilet', 1, '2025-04-03 06:18:19', '2025-04-03 06:18:19'),
(67, 8, 'Shower', 'shower', 1, '2025-04-03 06:18:28', '2025-04-03 06:18:28'),
(68, 8, 'Toilet paper', 'toilet-paper', 1, '2025-04-03 06:18:37', '2025-04-03 06:18:37'),
(69, 8, 'Bidet', 'bidet', 1, '2025-04-03 06:18:54', '2025-04-03 06:18:54'),
(70, 9, 'Balcony', 'balcony', 1, '2025-04-03 06:19:46', '2025-04-03 06:46:39'),
(71, 9, 'Mountain view', 'mountain-view', 1, '2025-04-03 06:19:53', '2025-04-03 06:19:53'),
(72, 9, 'Sea view', 'sea-view', 1, '2025-04-03 06:20:00', '2025-04-03 06:20:00'),
(73, 10, 'Desk', 'desk', 1, '2025-04-03 06:26:27', '2025-04-03 06:26:27'),
(74, 10, 'Sofa', 'sofa', 1, '2025-04-03 06:26:35', '2025-04-03 06:26:35'),
(75, 10, 'Fan', 'fan', 1, '2025-04-03 06:26:41', '2025-04-03 06:26:41'),
(76, 10, 'Towels', 'towels', 1, '2025-04-03 06:26:48', '2025-04-03 06:26:48'),
(77, 10, 'Seating Area', 'seating-area', 1, '2025-04-03 06:26:53', '2025-04-03 06:26:53'),
(78, 11, 'Smoking permitted', 'smoking-permitted', 1, '2025-04-03 06:41:16', '2025-04-03 06:41:16'),
(79, 12, 'Entire bungalow', 'entire-bungalow', 1, '2025-04-03 06:44:59', '2025-04-03 06:44:59'),
(80, 12, '29 m²', '29-m-', 1, '2025-04-03 06:45:06', '2025-04-03 06:45:06'),
(81, 12, 'Balcony', 'balcony', 1, '2025-04-03 06:46:16', '2025-04-03 06:46:16'),
(82, 12, 'Sea view', 'sea-view', 1, '2025-04-03 06:47:04', '2025-04-03 06:47:12'),
(83, 12, 'Mountain view', 'mountain-view', 1, '2025-04-03 06:47:29', '2025-04-03 06:47:36'),
(84, 12, 'Private bathroom', 'private-bathroom', 1, '2025-04-03 06:47:52', '2025-04-03 06:47:59'),
(85, 13, 'Private suite', 'private-suite', 1, '2025-04-03 08:56:49', '2025-04-03 08:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `id` bigint(20) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `roomImage` varchar(255) DEFAULT NULL,
  `roomImgDescription` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`id`, `room_id`, `roomImage`, `roomImgDescription`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '/backend/files/s1SN4qUmrWizPxuKJarC.jpg', '', 1, '2025-04-03 14:48:09', '2025-04-03 14:48:09'),
(2, 1, '/backend/files/Ba0w970urOW4I2T6Mvms.jpg', '', 1, '2025-04-03 14:48:19', '2025-04-03 14:48:19'),
(3, 1, '/backend/files/cwUw8bJYAmoLODFqn88a.jpg', '', 1, '2025-04-03 14:48:27', '2025-04-03 14:48:27'),
(4, 1, '/backend/files/Dubpa6yUt4rm913yYmGk.jpg', '', 1, '2025-04-03 14:48:35', '2025-04-03 14:48:35'),
(5, 2, '/backend/files/mx7KULphkqXmCQNgdSGh.jpg', '', 1, '2025-04-03 14:59:21', '2025-04-03 14:59:21'),
(6, 2, '/backend/files/OQLjTlhmOZU98U93CeMP.jpg', '', 1, '2025-04-03 14:59:30', '2025-04-03 14:59:30'),
(7, 2, '/backend/files/XeEbspMBRrItpIratdBH.jpg', '', 1, '2025-04-03 14:59:36', '2025-04-03 14:59:36'),
(8, 2, '/backend/files/uQqq6pQo4KonWwCjs2a9.jpg', '', 1, '2025-04-03 14:59:44', '2025-04-03 14:59:44'),
(9, 2, '/backend/files/TMC44McTxlWjLA95VPP5.jpg', '', 1, '2025-04-03 14:59:53', '2025-04-03 14:59:53'),
(10, 2, '/backend/files/LRsLChikzBJ1PHQ3h7Uw.jpg', '', 1, '2025-04-03 15:00:01', '2025-04-03 15:00:01'),
(16, 3, '/backend/files/mx7KULphkqXmCQNgdSGh.jpg', '', 1, '2025-04-03 14:59:21', '2025-04-03 14:59:21'),
(17, 3, '/backend/files/LRsLChikzBJ1PHQ3h7Uw.jpg', '', 1, '2025-04-03 15:00:01', '2025-04-03 15:00:01'),
(18, 4, '/backend/files/LRsLChikzBJ1PHQ3h7Uw.jpg', '', 1, '2025-04-03 15:00:01', '2025-04-03 15:00:01'),
(19, 4, '/backend/files/Dubpa6yUt4rm913yYmGk.jpg', '', 1, '2025-04-03 15:00:01', '2025-04-03 15:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `room_size`
--

CREATE TABLE `room_size` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_size`
--

INSERT INTO `room_size` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Singal', 'singal', 1, '2025-03-31 06:40:50', '2025-03-31 06:40:50'),
(2, 'Double', 'double', 1, '2025-03-31 06:40:54', '2025-03-31 06:40:54'),
(3, 'Tripal', 'tripal', 1, '2025-03-31 06:40:58', '2025-03-31 06:40:58'),
(4, 'Quad', 'quad', 1, '2025-03-31 06:41:01', '2025-03-31 06:41:01'),
(5, 'Queen', 'queen', 1, '2025-03-31 06:41:05', '2025-03-31 06:41:05'),
(6, 'King', 'king', 1, '2025-03-31 06:41:09', '2025-03-31 06:41:09'),
(7, 'Studio', 'studio', 1, '2025-03-31 06:41:15', '2025-03-31 06:41:15'),
(8, 'Suite', 'suite', 1, '2025-03-31 06:41:21', '2025-03-31 06:41:21'),
(9, 'Penthouse', 'penthouse', 1, '2025-03-31 06:41:28', '2025-03-31 06:41:28'),
(10, 'Presidential Suite', 'presidential-suite', 1, '2025-03-31 06:41:34', '2025-03-31 06:41:34'),
(11, 'Duplex', 'duplex', 1, '2025-03-31 06:41:39', '2025-03-31 06:41:39'),
(12, 'Others', 'others', 1, '2025-03-31 06:41:46', '2025-03-31 06:41:46'),
(13, 'Twin', 'twin', 1, '2025-03-31 19:57:48', '2025-03-31 20:54:12'),
(14, 'Small', 'small', 1, '2025-03-31 21:02:43', '2025-03-31 21:02:43'),
(15, 'Vip', 'vip', 1, '2025-03-31 23:10:03', '2025-03-31 23:10:03'),
(16, 'Vip Guest', 'vip-guest', 1, '2025-03-31 23:10:18', '2025-03-31 23:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, '2024-04-16 10:33:46', '2024-04-16 10:33:46'),
(2, 'Customer', 1, '2024-04-16 10:56:15', '2024-04-16 10:56:15'),
(3, 'Admin', 1, '2024-04-16 10:56:27', '2024-12-06 12:43:05'),
(4, 'User', 1, '2024-04-16 10:56:27', '2024-12-06 12:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `select_room_facilities`
--

CREATE TABLE `select_room_facilities` (
  `id` bigint(20) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `room_facility_group_id` int(11) DEFAULT NULL,
  `facilities_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `select_room_facilities`
--

INSERT INTO `select_room_facilities` (`id`, `room_id`, `room_facility_group_id`, `facilities_id`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 79, 1, 6, '2025-04-03 08:44:06', '2025-04-03 08:44:06'),
(2, 1, 12, 80, 1, 6, '2025-04-03 08:44:06', '2025-04-03 08:44:06'),
(3, 1, 12, 81, 1, 6, '2025-04-03 08:44:06', '2025-04-03 08:44:06'),
(4, 1, 12, 82, 1, 6, '2025-04-03 08:44:06', '2025-04-03 08:44:06'),
(5, 1, 12, 83, 1, 6, '2025-04-03 08:44:06', '2025-04-03 08:44:06'),
(6, 1, 12, 84, 1, 6, '2025-04-03 08:44:06', '2025-04-03 08:44:06'),
(7, 1, 8, 65, 1, 6, '2025-04-03 08:44:18', '2025-04-03 08:44:18'),
(8, 1, 8, 66, 1, 6, '2025-04-03 08:44:18', '2025-04-03 08:44:18'),
(9, 1, 8, 67, 1, 6, '2025-04-03 08:44:18', '2025-04-03 08:44:18'),
(10, 1, 8, 68, 1, 6, '2025-04-03 08:44:18', '2025-04-03 08:44:18'),
(11, 1, 8, 69, 1, 6, '2025-04-03 08:44:18', '2025-04-03 08:44:18'),
(12, 1, 9, 70, 1, 6, '2025-04-03 08:44:31', '2025-04-03 08:44:31'),
(13, 1, 9, 71, 1, 6, '2025-04-03 08:44:31', '2025-04-03 08:44:31'),
(14, 1, 9, 72, 1, 6, '2025-04-03 08:44:31', '2025-04-03 08:44:31'),
(15, 1, 10, 24, 1, 6, '2025-04-03 08:45:10', '2025-04-03 08:45:10'),
(16, 1, 10, 73, 1, 6, '2025-04-03 08:45:10', '2025-04-03 08:45:10'),
(17, 1, 10, 74, 1, 6, '2025-04-03 08:45:10', '2025-04-03 08:45:10'),
(18, 1, 10, 75, 1, 6, '2025-04-03 08:45:10', '2025-04-03 08:45:10'),
(19, 1, 10, 76, 1, 6, '2025-04-03 08:45:10', '2025-04-03 08:45:10'),
(20, 1, 10, 77, 1, 6, '2025-04-03 08:45:10', '2025-04-03 08:45:10'),
(21, 1, 11, 78, 1, 6, '2025-04-03 08:45:46', '2025-04-03 08:45:46'),
(22, 2, 13, 85, 1, 6, '2025-04-03 08:57:15', '2025-04-03 08:57:15'),
(23, 2, 11, 78, 1, 6, '2025-04-03 08:57:33', '2025-04-03 08:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` mediumtext NOT NULL,
  `whatsApp` varchar(255) NOT NULL,
  `whatsAppTwo` varchar(255) DEFAULT NULL,
  `whatsAppThree` varchar(255) DEFAULT NULL,
  `about_us` mediumtext NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `fblink` varchar(255) DEFAULT NULL,
  `twitterlink` varchar(255) DEFAULT NULL,
  `linkdinlink` varchar(255) DEFAULT NULL,
  `instragramlink` varchar(255) DEFAULT NULL,
  `youtubelink` varchar(255) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `name`, `email`, `address`, `whatsApp`, `whatsAppTwo`, `whatsAppThree`, `about_us`, `copyright`, `fblink`, `twitterlink`, `linkdinlink`, `instragramlink`, `youtubelink`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 'Eduzenship', 'info@eduzenship.com', 'The Laureate, House # 56, Road # 11, Block # F, Banani, Dhaka, Bangladesh', '+8801407093964', '+8801407093967', '+8801761629043', 'Eduzenship is an international education consultancy that helps students who want to study in abroad.', 'All Right Reserved.Designed By Moon Nest', 'https://www.facebook.com/eduzenship.bd/', NULL, NULL, '#', '#', NULL, '2024-05-12 05:32:50', '2025-04-25 14:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `slider_images`
--

CREATE TABLE `slider_images` (
  `id` bigint(20) NOT NULL,
  `title_name` varchar(255) DEFAULT NULL,
  `sliderImage` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_images`
--

INSERT INTO `slider_images` (`id`, `title_name`, `sliderImage`, `status`, `created_at`, `updated_at`) VALUES
(19, 'Empowering Students Through Real-World Experience', '/backend/files/WJx7NM0P9P1e9ilTu8Go.jpg', 1, '2025-05-28 21:19:46', '2025-05-28 21:19:46'),
(20, 'Internships That Shape Your Future Career', '/backend/files/zoL9zG8OcwQhTyji5UQt.jpg', 1, '2025-05-28 21:20:05', '2025-05-28 21:20:05'),
(21, 'Learn, Apply, Succeed — The Eduzanship Way', '/backend/files/BPAxRpzwKvIXEwCKJail.jpg', 1, '2025-05-28 21:20:21', '2025-05-28 21:20:21'),
(22, 'Join a Community of Future Leaders & Innovators', '/backend/files/iQougBgKWL5VDOL3nPFX.jpg', 1, '2025-05-28 21:20:35', '2025-05-28 21:20:35'),
(23, 'Your Journey from Classroom to Career Starts Here', '/backend/files/Knb7hY04qK2UZlk7AF0a.jpg', 1, '2025-05-28 21:20:54', '2025-05-28 21:20:54');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fg_id` varchar(255) DEFAULT NULL,
  `fg_wallet_address` varchar(255) DEFAULT NULL,
  `inviteCode` varchar(255) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL COMMENT '1=Supper admin, 2=Customer, 3=Admin, 4=User',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `available_balance` double(10,8) DEFAULT NULL,
  `show_password` varchar(225) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `doc_file` varchar(255) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `website` varchar(225) DEFAULT NULL,
  `github` varchar(225) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `twitter` varchar(225) DEFAULT NULL,
  `instagram` varchar(225) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `facebook` varchar(225) DEFAULT NULL,
  `wallet_balance` decimal(10,2) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `whtsapp` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `register_ip` varchar(255) DEFAULT NULL,
  `lastlogin_ip` varchar(255) DEFAULT NULL,
  `lastlogin_country` varchar(255) DEFAULT NULL,
  `lastlogin_datetime` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 0,
  `logged_out` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fg_id`, `fg_wallet_address`, `inviteCode`, `ref_id`, `employee_id`, `company_name`, `role_id`, `name`, `email`, `username`, `phone`, `available_balance`, `show_password`, `password`, `real_name`, `phone_number`, `image`, `doc_file`, `address`, `address_1`, `address_2`, `website`, `github`, `gender`, `date_of_birth`, `twitter`, `instagram`, `nationality_id`, `state_id`, `otp`, `facebook`, `wallet_balance`, `email_verified_at`, `telegram`, `whtsapp`, `remember_token`, `entry_by`, `register_ip`, `lastlogin_ip`, `lastlogin_country`, `lastlogin_datetime`, `created_at`, `updated_at`, `status`, `logged_out`) VALUES
(1, NULL, '6f21357fs863ce24ce21c1a82f49a7d5d13', '0000123', 0, 4, 'FG IT', 1, 'Black jons', 'dev1@mail.com', 'dev', '019155555', NULL, 'dev', '$2y$10$egNt4iHOZ4sWab8IcaHE9..QCyQc3z4oFRYUwesyeTH52KDFzM5.y', NULL, '01915728982', '/backend/files/hZkagctUSINKsFU64UJr.png', NULL, 'Dhaka', '', '', 'http://localhost:3000/profile', 'http://localhost:3000/profile', '', '1982-01-30', 'http://localhost:3000/profile', 'http://localhost:3000/profile', 0, 0, NULL, 'http://localhost:3000/profile', NULL, NULL, NULL, NULL, NULL, 1, NULL, '127.0.0.1', NULL, '2024-11-22 09:50:10', '2023-06-22 03:20:43', '2025-04-27 19:03:25', 1, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Ibraheem', '12ibraheem@gmail.com', '4888', '045878787888', NULL, 'Ibraheem', '$2y$10$xD8SNrVUclcpYXMtzfx9OeMz98V4bTDYQG/0OwYS.xFv1rwMnufWC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-04-12 04:01:49', '2025-04-12 04:01:56', 1, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'jannat', 'jannat4874878@gmail.com', 'jannat', '458787888', NULL, 'jannat', '$2y$10$bfBvKWL5zKjjpz0IZIdSPeIPRt148zd6FVVDAL.2xRNzgUgiJ5qEK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-04-12 04:01:53', '2025-04-12 04:01:59', 1, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Rana', 'rana@gmail.com', 'rana', '59898989898', NULL, '124156', '$2y$10$PG63dsfnzkqO4t3OK/mTW.RvcnrD0i8bSeiGvkIgGi7F9bVJ2k1rG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-04-12 04:02:35', '2025-04-12 04:02:35', 1, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'Rabeya', 'rabeya@gmail.com', 'rabeya', '01989898999', NULL, 'rabeya', '$2y$10$O0VXjUpE0VYsFME.BP.R5ehmXaKPGE9gu.gXlsLHjqXdDKAs3BiZC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-04-12 04:12:44', '2025-04-12 04:12:44', 1, NULL),
(6, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'Ayesha', 'ayesha@gmail.com', 'ayesha123', '00157878788', NULL, 'ayesha123', '$2y$10$4FbfI7bUybzfYjzzRRwddeoUlucC4DgRG3JTMOFO8ED8lPHpmxtGG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-04-12 04:41:06', '2025-04-12 04:41:06', 1, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'Mr. Baker', 'baker@gmail.com', 'baker', '487487878', NULL, 'baker@gmail.com', '$2y$10$ep52U9TPaiqmEMpemLrLveVFdAW9PIlars1YVWuw3CjLRZZ07xNwy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-04-12 04:47:39', '2025-04-12 04:47:39', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_configs`
--
ALTER TABLE `api_configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_code_unique` (`app_id`);

--
-- Indexes for table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bed_type`
--
ALTER TABLE `bed_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`),
  ADD KEY `idx_room_id` (`room_id`),
  ADD KEY `idx_customer_id` (`customer_id`);

--
-- Indexes for table `booking_type`
--
ALTER TABLE `booking_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_address`
--
ALTER TABLE `bulk_address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `walletAddress` (`walletAddress`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_type`
--
ALTER TABLE `currency_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_request`
--
ALTER TABLE `deposit_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility_group`
--
ALTER TABLE `facility_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `global_wallet_address`
--
ALTER TABLE `global_wallet_address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `merchant_request`
--
ALTER TABLE `merchant_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_facility`
--
ALTER TABLE `room_facility`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_size`
--
ALTER TABLE `room_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `select_room_facilities`
--
ALTER TABLE `select_room_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_images`
--
ALTER TABLE `slider_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `fg_wallet_address` (`fg_wallet_address`),
  ADD UNIQUE KEY `fg_id` (`fg_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_configs`
--
ALTER TABLE `api_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_key`
--
ALTER TABLE `api_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bed_type`
--
ALTER TABLE `bed_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `booking_type`
--
ALTER TABLE `booking_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bulk_address`
--
ALTER TABLE `bulk_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `currency_type`
--
ALTER TABLE `currency_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deposit_request`
--
ALTER TABLE `deposit_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `facility_group`
--
ALTER TABLE `facility_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_wallet_address`
--
ALTER TABLE `global_wallet_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `merchant_request`
--
ALTER TABLE `merchant_request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_facility`
--
ALTER TABLE `room_facility`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `room_size`
--
ALTER TABLE `room_size`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rule`
--
ALTER TABLE `rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `select_room_facilities`
--
ALTER TABLE `select_room_facilities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider_images`
--
ALTER TABLE `slider_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
