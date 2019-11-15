-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2019 at 03:50 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(93, '103.121.156.219', 'abu.hasanastutemyndz@gmail.com', 1572953961),
(94, '103.121.156.219', 'abu.hasan@astutemyndz.com', 1572953989);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_advertisements`
--

CREATE TABLE `tk_cbs_advertisements` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_advertisements`
--

INSERT INTO `tk_cbs_advertisements` (`id`, `image`, `created`, `status`) VALUES
(1, 'app/web/upload/artist_images/1_97551a781a37e9cd18873d1c5e614f33.jpg', '2019-07-26 15:20:57', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_artists`
--

CREATE TABLE `tk_cbs_artists` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `artist_image` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_artists`
--

INSERT INTO `tk_cbs_artists` (`id`, `name`, `artist_image`, `created`, `deleted_at`, `status`) VALUES
(3, 'Abc', 'app/web/upload/artist_images/3_262e9cd6a374f0f9be455c1297948a5d.jpg', '2019-10-17 13:30:42', NULL, 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_bookings`
--

CREATE TABLE `tk_cbs_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `event_id` int(10) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `sub_total` decimal(9,2) UNSIGNED DEFAULT NULL,
  `quantity` int(1) DEFAULT NULL,
  `tax` decimal(9,2) UNSIGNED DEFAULT NULL,
  `total` decimal(9,2) UNSIGNED DEFAULT NULL,
  `deposit` decimal(9,2) UNSIGNED DEFAULT NULL,
  `payment_method` enum('paypal','authorize','creditcard','cash','bank') DEFAULT NULL,
  `status` enum('confirmed','cancelled','pending') DEFAULT 'pending',
  `txn_id` varchar(255) DEFAULT NULL,
  `processed_on` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `is_sent` enum('T','F') DEFAULT 'F',
  `ip` varchar(255) DEFAULT NULL,
  `c_title` varchar(255) DEFAULT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `c_phone` varchar(255) DEFAULT NULL,
  `c_email` varchar(255) DEFAULT NULL,
  `c_company` varchar(255) DEFAULT NULL,
  `c_notes` text DEFAULT NULL,
  `c_address` varchar(255) DEFAULT NULL,
  `c_city` varchar(255) DEFAULT NULL,
  `c_state` varchar(255) DEFAULT NULL,
  `c_zip` varchar(255) DEFAULT NULL,
  `c_country` int(10) UNSIGNED DEFAULT NULL,
  `cc_type` blob DEFAULT NULL,
  `cc_num` blob DEFAULT NULL,
  `cc_exp_month` blob DEFAULT NULL,
  `cc_exp_year` blob DEFAULT NULL,
  `cc_code` blob DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_bookings`
--

INSERT INTO `tk_cbs_bookings` (`id`, `uuid`, `event_id`, `date_time`, `sub_total`, `quantity`, `tax`, `total`, `deposit`, `payment_method`, `status`, `txn_id`, `processed_on`, `created`, `is_sent`, `ip`, `c_title`, `c_name`, `c_phone`, `c_email`, `c_company`, `c_notes`, `c_address`, `c_city`, `c_state`, `c_zip`, `c_country`, `cc_type`, `cc_num`, `cc_exp_month`, `cc_exp_year`, `cc_code`, `deleted_at`) VALUES
(295, 'VQ1568214297', 14, '2019-09-11 22:00:00', '50.00', 1, NULL, '50.00', NULL, 'creditcard', 'confirmed', 'PAY-73P00661LJ141392MLV4Q2EI', '2019-09-11 15:04:49', '2019-09-11 15:04:49', 'F', '103.121.156.219', NULL, 'test test2', '231545325', 'test@gmail.com', NULL, NULL, 'abc', 'Liberta', 'Saint Paul', '44444', 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_bookings_payments`
--

CREATE TABLE `tk_cbs_bookings_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method` enum('paypal','authorize','creditcard','bank','cash') DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `amount` decimal(9,2) UNSIGNED DEFAULT NULL,
  `status` enum('paid','notpaid') DEFAULT 'paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_bookings_shows`
--

CREATE TABLE `tk_cbs_bookings_shows` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `show_id` int(10) UNSIGNED NOT NULL,
  `seat_id` int(10) UNSIGNED NOT NULL,
  `price_id` int(10) UNSIGNED DEFAULT NULL,
  `price` decimal(9,2) UNSIGNED DEFAULT NULL,
  `cnt` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_bookings_shows`
--

INSERT INTO `tk_cbs_bookings_shows` (`booking_id`, `show_id`, `seat_id`, `price_id`, `price`, `cnt`) VALUES
(295, 41, 1585, 27, '50.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_bookings_tickets`
--

CREATE TABLE `tk_cbs_bookings_tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) DEFAULT NULL,
  `ticket_id` varchar(50) DEFAULT NULL,
  `price_id` int(10) DEFAULT NULL,
  `seat_id` int(10) DEFAULT NULL,
  `unit_price` decimal(9,2) UNSIGNED DEFAULT NULL,
  `is_used` enum('T','F') NOT NULL DEFAULT 'F',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_bookings_tickets`
--

INSERT INTO `tk_cbs_bookings_tickets` (`id`, `booking_id`, `ticket_id`, `price_id`, `seat_id`, `unit_price`, `is_used`, `deleted_at`) VALUES
(751, 295, 'VQ1568214297-1585-1', 27, 1585, '50.00', 'F', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_bookings_users`
--

CREATE TABLE `tk_cbs_bookings_users` (
  `id` int(10) NOT NULL,
  `id_bookings` int(10) DEFAULT NULL,
  `id_users` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_bookings_users`
--

INSERT INTO `tk_cbs_bookings_users` (`id`, `id_bookings`, `id_users`) VALUES
(1, 295, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_cms`
--

CREATE TABLE `tk_cbs_cms` (
  `id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_cms`
--

INSERT INTO `tk_cbs_cms` (`id`, `page_name`, `created`, `status`) VALUES
(1, 'Terms & Conditions ', '2019-07-15 10:19:48', 'T'),
(4, 'About ticket at guru documents', '2019-08-09 12:30:48', 'T'),
(5, 'Privacy Policy', '2019-08-12 19:25:40', 'T'),
(6, 'Contact Us', '2019-08-12 19:54:20', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_customers`
--

CREATE TABLE `tk_cbs_customers` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T',
  `tk_cbs_roles_id` int(10) NOT NULL DEFAULT 2,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL,
  `on_deleted` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_customers`
--

INSERT INTO `tk_cbs_customers` (`id`, `ip_address`, `first_name`, `last_name`, `email`, `username`, `salt`, `password`, `slug`, `activation_code`, `last_login`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `active`, `status`, `tk_cbs_roles_id`, `created`, `updated`, `on_deleted`) VALUES
(34, '103.121.156.219', 'Rakesh', 'Maity', 'rakesh@gmail.com', 'rakesh', NULL, '$2y$08$1BSKChEIe8/nd18c0ucatOp4HZJpbObH6IATkWoM5qlnclV9KAgEu', '', NULL, 1568802087, NULL, NULL, NULL, 1567757229, 1, 'T', 8, '2019-09-06 08:07:09', NULL, NULL),
(35, '103.121.156.219', 'Rakesh', 'Maity', 'rakesh@astutemyndz.com', 'rakesh maity', NULL, '$2y$08$noplxREwrb/KrHJUgPDRBe/Uzytl6dKKtiCxEsLcC1JFgBAhfUTbW', '', NULL, 1571840353, NULL, NULL, NULL, 1568114185, 1, 'T', 8, '2019-09-10 11:16:25', NULL, NULL),
(36, '103.121.156.219', 'Jhon', 'doe', 'jhon@gmail.com', 'jhondoe', NULL, '$2y$08$hYVPyY2jdG.bKC3q46qeruhFFJkbQuw/deoOO9jW9ee/ktLmTNfsG', '', NULL, 1568115599, NULL, NULL, NULL, 1568115598, 1, 'T', 8, '2019-09-10 11:39:58', NULL, NULL),
(37, '103.121.156.219', 'Rakesh', 'Maity', 'rakeshmaity27@gmail.com', 'rakeshmaity27', NULL, '$2y$08$6bD49mhzmj5wyQOIlQ6Mku5yMMqRbpHo8ETikHJK3Sns3ilDT2ZQm', '', NULL, 1571832472, NULL, NULL, NULL, 1568127541, 1, 'T', 8, '2019-09-10 14:59:01', NULL, NULL),
(38, '103.121.156.219', 'test', 'test2', 'test@gmail.com', 'test2', NULL, '$2y$08$E.abQRANR93Pxreui7WGF.kHJQnxQmyOJ.xJn.yG5AF3SvPT/KRh.', '', NULL, 1568214095, NULL, NULL, NULL, 1568214094, 1, 'T', 8, '2019-09-11 15:01:35', NULL, NULL),
(39, '103.121.156.218', 'Monikanta', 'Dutta', 'monikanto@astutemyndz.com', 'moni', NULL, '$2y$08$/PL1U/ciASjFTzoURhktQeNPEox0yGaqPdiTVDbaj246Sd5xpGSxO', '', NULL, 1568798259, NULL, NULL, NULL, 1568798259, 1, 'T', 8, '2019-09-18 09:17:39', NULL, NULL),
(40, '103.121.156.219', 'Sid', 'Singh', 'sid@gmail.com', 'sid', NULL, '$2y$08$.2/S2DyBH0cFm0rckDg2zON2EIvggABsNORhBrbPQh8wUoAp6cRYu', '', NULL, 1573024020, NULL, NULL, NULL, 1571840621, 1, 'T', 8, '2019-10-23 14:23:41', NULL, NULL),
(41, '103.121.156.219', 'abc', 'axy', 'ad@gmail.com', 'addd', NULL, '$2y$08$Y/Lm62CC/aGLhUVBA3fMb.l5UTtWCgzzr79romOGTy77jjtYHpeey', '', NULL, 1571907880, NULL, NULL, NULL, 1571907879, 1, 'T', 8, '2019-10-24 09:04:39', NULL, NULL),
(42, '103.121.156.219', 'a', 'b', 'a@a.a', 'a@a.a', NULL, '$2y$08$gfYSJkI8NkG0FG69S.AAe.2MtF1LBvhWpoqRigfMhf7F2t4of9HXu', '', NULL, 1572956781, NULL, NULL, NULL, 1572002824, 1, 'T', 8, '2019-10-25 11:27:04', NULL, NULL),
(43, '103.121.156.219', 'Rima', 'Maituy', 'rima@gmail.com', 'rima@gmail.com', NULL, '$2y$08$1ZhESG7J/jq5mVy8Eg0xhuP8cHjFtf8VN07lmuz7IbNvmEernPND.', '', NULL, 1572004459, NULL, NULL, NULL, 1572004134, 1, 'T', 8, '2019-10-25 11:48:54', NULL, NULL),
(44, '103.121.156.219', 'Jhon', 'Cina', 'jhoncina@gmail.com', 'jhoncina@gmail.com', NULL, '$2y$08$SdgJJ.hsfrnvSaCPYi7NFuOQYvdQLKQr5f4o673HijEqXAKTYSfVG', '', NULL, 1572529176, NULL, NULL, NULL, 1572528234, 1, 'T', 8, '2019-10-31 13:23:54', NULL, NULL),
(45, '103.121.156.219', 'a', 'b', 'b@b.b', 'b@b.b', NULL, '$2y$08$yoSLcazjDiiRrydm4Wc8.eT9JofhCxRUvbPk7/bYwopnNgr9caeWO', '', NULL, 1572603058, NULL, NULL, NULL, 1572603058, 1, 'T', 8, '2019-11-01 10:10:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_customer_groups`
--

CREATE TABLE `tk_cbs_customer_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `tk_cbs_customers_id` int(11) UNSIGNED NOT NULL,
  `tk_cbs_roles_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_customer_groups`
--

INSERT INTO `tk_cbs_customer_groups` (`id`, `tk_cbs_customers_id`, `tk_cbs_roles_id`) VALUES
(35, 34, 8),
(36, 35, 8),
(37, 36, 8),
(38, 37, 8),
(39, 38, 8),
(40, 39, 8),
(41, 40, 8),
(42, 41, 8),
(43, 42, 8),
(44, 43, 8),
(45, 44, 8),
(46, 45, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_customer_requests`
--

CREATE TABLE `tk_cbs_customer_requests` (
  `id` int(10) NOT NULL,
  `tk_cbs_customers_id` int(10) DEFAULT NULL,
  `tk_cbs_artists_id` int(10) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_documents`
--

CREATE TABLE `tk_cbs_documents` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `size` double DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `deleteUrl` varchar(100) DEFAULT NULL,
  `deleteType` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_events`
--

CREATE TABLE `tk_cbs_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `released_date` date DEFAULT NULL,
  `event_img` varchar(255) DEFAULT NULL,
  `event_thumb_img` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T',
  `event_type` enum('1','2') DEFAULT NULL COMMENT '1 =  upcoming, 2 = Just Announced,',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_events`
--

INSERT INTO `tk_cbs_events` (`id`, `slug`, `duration`, `released_date`, `event_img`, `event_thumb_img`, `date_time`, `created`, `status`, `event_type`, `deleted_at`) VALUES
(14, 'arijit-singh-live-concert-2019', '150', NULL, 'app/web/upload/events/14_ae004c7aabd114e97c66885d2f0c3ee6.jpg', 'app/web/upload/events/thumbnails/14_b624f65d03cbb06ae8f01197459edf45.tmp', '2019-11-30 11:00:00', '2019-09-11 19:35:39', 'T', '1', NULL),
(24, 'arijit-singh-midnight-live-concert-2019', '120', NULL, 'app/web/upload/events/24_068dd9f52a0868ff8255bac156944d43.jpg', NULL, '2019-12-01 01:00:00', '2019-10-21 12:51:25', 'T', '2', NULL),
(25, 'shreya-ghoshal-live-with-symphony-us-canada-tour', '300', NULL, 'app/web/upload/events/25_cdfa1fb28c6e174f0e4332ef9e573044.jpg', NULL, '2019-12-02 00:00:00', '2019-10-25 15:54:09', 'T', '1', NULL),
(26, 'a-r-rahman-live-in-concert-sydney', '150', NULL, 'app/web/upload/events/26_3b4283dd614825490b19dab852a02901.jpg', NULL, '2020-01-01 00:00:00', '2019-10-25 15:58:26', 'T', '1', NULL),
(31, 'arijit-singh-live-mtv-india-tour', '180', NULL, 'app/web/upload/events/31_79d1a6e779edc1536b0b33f9e0b28d3f.jpg', NULL, '2019-11-08 19:00:00', '2019-10-30 20:35:39', 'T', '1', NULL),
(32, 'test-test-test', '3', NULL, NULL, NULL, '2019-11-30 00:00:00', '2019-10-30 20:38:05', 'F', NULL, '2019-11-06 14:25:31'),
(33, 'test-test-test', '3', NULL, NULL, NULL, '2019-11-30 00:00:00', '2019-10-30 20:39:44', 'F', NULL, '2019-11-06 14:25:33'),
(34, 'arijit-singh-live-at-gima-awards', '200', NULL, 'app/web/upload/events/34_026534eded7d33b114287b98ca7df070.jpg', NULL, '2020-01-01 00:00:00', '2019-10-30 20:39:56', 'T', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_fields`
--

CREATE TABLE `tk_cbs_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) DEFAULT NULL,
  `type` enum('backend','frontend','arrays') DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `source` enum('script','plugin') DEFAULT 'script',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_fields`
--

INSERT INTO `tk_cbs_fields` (`id`, `key`, `type`, `label`, `source`, `created_at`, `modified`) VALUES
(1, 'addLocale', 'backend', 'Add language', 'script', '2019-09-06 10:13:39', NULL),
(2, 'adminForgot', 'backend', 'Forgot password', 'script', '2019-09-06 10:13:39', NULL),
(3, 'adminLogin', 'backend', 'Admin Login', 'script', '2019-09-06 10:13:39', NULL),
(4, 'backend', 'backend', 'Backend titles', 'script', '2019-09-06 10:13:39', NULL),
(5, 'btnAdd', 'backend', 'Button Add', 'script', '2019-09-06 10:13:39', NULL),
(6, 'btnAddBooking', 'backend', 'Button / + Add booking', 'script', '2019-09-06 10:13:39', '2016-07-28 03:52:42'),
(7, 'btnAddHall', 'backend', 'Button / + Add hall', 'script', '2019-09-06 10:13:39', '2016-07-28 03:44:28'),
(8, 'btnAddMovie', 'backend', 'Button / + Add movie', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(9, 'btnAddUser', 'backend', 'Button / + Add user', 'script', '2019-09-06 10:13:39', '2016-07-28 03:36:30'),
(10, 'btnBack', 'backend', 'Button Back', 'script', '2019-09-06 10:13:39', NULL),
(11, 'btnBackup', 'backend', 'Button Backup', 'script', '2019-09-06 10:13:39', NULL),
(12, 'btnCancel', 'backend', 'Button Cancel', 'script', '2019-09-06 10:13:39', NULL),
(13, 'btnCheck', 'backend', 'Button / Check', 'script', '2019-09-06 10:13:39', NULL),
(14, 'btnContinue', 'backend', 'Button Continue', 'script', '2019-09-06 10:13:39', NULL),
(15, 'btnCreateInvoice', 'backend', 'Button / Create Invoice', 'script', '2019-09-06 10:13:39', '2015-12-09 03:23:26'),
(16, 'btnDelete', 'backend', 'Button Delete', 'script', '2019-09-06 10:13:39', NULL),
(17, 'btnDeleteMap', 'backend', 'Buttons / Delete map', 'script', '2019-09-06 10:13:39', NULL),
(18, 'btnExport', 'backend', 'Button / Export', 'script', '2019-09-06 10:13:39', NULL),
(19, 'btnGetFeedURL', 'backend', 'Button / Get Feed URL', 'script', '2019-09-06 10:13:39', NULL),
(20, 'btnLogin', 'backend', 'Login', 'script', '2019-09-06 10:13:39', NULL),
(21, 'btnNextDay', 'backend', 'Button / Next day', 'script', '2019-09-06 10:13:39', NULL),
(22, 'btnNextHour', 'backend', 'Button / Next hour', 'script', '2019-09-06 10:13:39', NULL),
(23, 'btnNextWeek', 'backend', 'Button / Next week', 'script', '2019-09-06 10:13:39', NULL),
(24, 'btnPrint', 'backend', 'Button / Print', 'script', '2019-09-06 10:13:39', NULL),
(25, 'btnRemove', 'backend', 'Button / Remove', 'script', '2019-09-06 10:13:39', NULL),
(26, 'btnReset', 'backend', 'Reset', 'script', '2019-09-06 10:13:39', NULL),
(27, 'btnSave', 'backend', 'Save', 'script', '2019-09-06 10:13:39', NULL),
(28, 'btnSearch', 'backend', 'Search', 'script', '2019-09-06 10:13:39', NULL),
(29, 'btnSend', 'backend', 'Button Send', 'script', '2019-09-06 10:13:39', NULL),
(30, 'btnUpdate', 'backend', 'Update', 'script', '2019-09-06 10:13:39', NULL),
(31, 'btnUseThisTheme', 'backend', 'Label / Use this theme', 'script', '2019-09-06 10:13:39', '2016-07-28 02:12:41'),
(32, 'created', 'backend', 'Created', 'script', '2019-09-06 10:13:39', NULL),
(33, 'delete_confirmation', 'backend', 'Label / delete confirmation', 'script', '2019-09-06 10:13:39', NULL),
(34, 'delete_selected', 'backend', 'Label / Delete selected', 'script', '2019-09-06 10:13:39', NULL),
(35, 'email', 'backend', 'E-Mail', 'script', '2019-09-06 10:13:39', NULL),
(36, 'emailForgotBody', 'backend', 'Email / Forgot Body', 'script', '2019-09-06 10:13:39', NULL),
(37, 'emailForgotSubject', 'backend', 'Email / Forgot Subject', 'script', '2019-09-06 10:13:39', NULL),
(38, 'email_taken', 'backend', 'Label / email taken', 'script', '2019-09-06 10:13:39', NULL),
(39, 'frontend', 'backend', 'Front-end titles', 'script', '2019-09-06 10:13:39', NULL),
(40, 'gridActionTitle', 'backend', 'Grid / Action Title', 'script', '2019-09-06 10:13:39', NULL),
(41, 'gridBtnCancel', 'backend', 'Grid / Button Cancel', 'script', '2019-09-06 10:13:39', NULL),
(42, 'gridBtnDelete', 'backend', 'Grid / Button Delete', 'script', '2019-09-06 10:13:39', NULL),
(43, 'gridBtnOk', 'backend', 'Grid / Button OK', 'script', '2019-09-06 10:13:39', NULL),
(44, 'gridChooseAction', 'backend', 'Grid / Choose Action', 'script', '2019-09-06 10:13:39', NULL),
(45, 'gridConfirmationTitle', 'backend', 'Grid / Confirmation Title', 'script', '2019-09-06 10:13:39', NULL),
(46, 'gridDeleteConfirmation', 'backend', 'Grid / Delete confirmation', 'script', '2019-09-06 10:13:39', NULL),
(47, 'gridEmptyBody', 'backend', 'Grid / No records selected', 'script', '2019-09-06 10:13:39', NULL),
(48, 'gridEmptyResult', 'backend', 'Grid / Empty resultset', 'script', '2019-09-06 10:13:39', NULL),
(49, 'gridEmptyTitle', 'backend', 'Grid / No records selected', 'script', '2019-09-06 10:13:39', NULL),
(50, 'gridGotoPage', 'backend', 'Grid / Go to page', 'script', '2019-09-06 10:13:39', NULL),
(51, 'gridItemsPerPage', 'backend', 'Grid / Items per page', 'script', '2019-09-06 10:13:39', NULL),
(52, 'gridNext', 'backend', 'Grid / Next', 'script', '2019-09-06 10:13:39', NULL),
(53, 'gridNextPage', 'backend', 'Grid / Next page', 'script', '2019-09-06 10:13:39', NULL),
(54, 'gridPrev', 'backend', 'Grid / Prev', 'script', '2019-09-06 10:13:39', NULL),
(55, 'gridPrevPage', 'backend', 'Grid / Prev page', 'script', '2019-09-06 10:13:39', NULL),
(56, 'gridTotalItems', 'backend', 'Grid / Total items', 'script', '2019-09-06 10:13:39', NULL),
(57, 'infoAddBookingDesc', 'backend', 'Infobox / Add New Booking', 'script', '2019-09-06 10:13:39', NULL),
(58, 'infoAddBookingTitle', 'backend', 'Infobox / Add New Booking', 'script', '2019-09-06 10:13:39', NULL),
(59, 'infoAddEventDesc', 'backend', 'Infobox / Add new event', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(60, 'infoAddEventTitle', 'backend', 'Infobox / Add new event', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(61, 'infoAddUserDesc', 'backend', 'Infobox / Add user', 'script', '2019-09-06 10:13:39', '2016-07-28 03:40:51'),
(62, 'infoAddUserTitle', 'backend', 'Infobox / Add user', 'script', '2019-09-06 10:13:39', '2016-07-28 03:40:31'),
(63, 'infoAddVenueDesc', 'backend', 'Label / Add new venue', 'script', '2019-09-06 10:13:39', NULL),
(64, 'infoAddVenueTitle', 'backend', 'Label / Add new venue', 'script', '2019-09-06 10:13:39', NULL),
(65, 'infoBarcodeReaderDesc', 'backend', 'Infobox / Barcode reader', 'script', '2019-09-06 10:13:39', NULL),
(66, 'infoBarcodeReaderTitle', 'backend', 'Infobox / Barcode reader', 'script', '2019-09-06 10:13:39', NULL),
(67, 'infoBookingFormDesc', 'backend', 'Infobox / Booking form', 'script', '2019-09-06 10:13:39', NULL),
(68, 'infoBookingFormTitle', 'backend', 'Infobox / Booking form', 'script', '2019-09-06 10:13:39', NULL),
(69, 'infoBookingsDesc', 'backend', 'Infobox / Booking options', 'script', '2019-09-06 10:13:39', NULL),
(70, 'infoBookingsListDesc', 'backend', 'Infobox / List of bookings', 'script', '2019-09-06 10:13:39', NULL),
(71, 'infoBookingsListTitle', 'backend', 'Infobox / List of bookings', 'script', '2019-09-06 10:13:39', NULL),
(72, 'infoBookingsTitle', 'backend', 'Infobox / Booking options', 'script', '2019-09-06 10:13:39', NULL),
(73, 'infoEventBookingsDesc', 'backend', 'Infobox / List of bookings', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(74, 'infoEventBookingsTitle', 'backend', 'Infobox / List of bookings', 'script', '2019-09-06 10:13:39', NULL),
(75, 'infoEventPriceDesc', 'backend', 'Infobox / Prices', 'script', '2019-09-06 10:13:39', '2019-09-10 15:32:46'),
(76, 'infoEventPriceTitle', 'backend', 'Infobox / Tickets', 'script', '2019-09-06 10:13:39', NULL),
(77, 'infoEventsDesc', 'backend', 'Infobox / List of events', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(78, 'infoEventsTitle', 'backend', 'Infobox / List of events', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(79, 'infoGeneralDesc', 'backend', 'Infobox / General options', 'script', '2019-09-06 10:13:39', NULL),
(80, 'infoGeneralTitle', 'backend', 'Infobox / General options', 'script', '2019-09-06 10:13:39', NULL),
(81, 'infoListingAddressBody', 'backend', 'Infobox / Listing Address Body', 'script', '2019-09-06 10:13:39', NULL),
(82, 'infoListingAddressTitle', 'backend', 'Infobox / Listing Address Title', 'script', '2019-09-06 10:13:39', NULL),
(83, 'infoListingBookingsBody', 'backend', 'Infobox / Listing Bookings Body', 'script', '2019-09-06 10:13:39', NULL),
(84, 'infoListingBookingsTitle', 'backend', 'Infobox / Listing Bookings Title', 'script', '2019-09-06 10:13:39', NULL),
(85, 'infoListingContactBody', 'backend', 'Infobox / Listing Contact Body', 'script', '2019-09-06 10:13:39', NULL),
(86, 'infoListingContactTitle', 'backend', 'Infobox / Listing Contact Title', 'script', '2019-09-06 10:13:39', NULL),
(87, 'infoListingExtendBody', 'backend', 'Infobox / Extend exp.date Body', 'script', '2019-09-06 10:13:39', NULL),
(88, 'infoListingExtendTitle', 'backend', 'Infobox / Extend exp.date Title', 'script', '2019-09-06 10:13:39', NULL),
(89, 'infoListingPricesBody', 'backend', 'Infobox / Listing Prices Body', 'script', '2019-09-06 10:13:39', NULL),
(90, 'infoListingPricesTitle', 'backend', 'Infobox / Listing Prices Title', 'script', '2019-09-06 10:13:39', NULL),
(91, 'infoLocalesArraysBody', 'backend', 'Locale / Languages Array Body', 'script', '2019-09-06 10:13:39', NULL),
(92, 'infoLocalesArraysTitle', 'backend', 'Locale / Languages Array Title', 'script', '2019-09-06 10:13:39', NULL),
(93, 'infoLocalesBackendBody', 'backend', 'Infobox / Locales Backend Body', 'script', '2019-09-06 10:13:39', NULL),
(94, 'infoLocalesBackendTitle', 'backend', 'Infobox / Locales Backend Title', 'script', '2019-09-06 10:13:39', NULL),
(95, 'infoLocalesBody', 'backend', 'Infobox / Locales Body', 'script', '2019-09-06 10:13:39', NULL),
(96, 'infoLocalesFrontendBody', 'backend', 'Infobox / Locales Frontend Body', 'script', '2019-09-06 10:13:39', NULL),
(97, 'infoLocalesFrontendTitle', 'backend', 'Infobox / Locales Frontend Title', 'script', '2019-09-06 10:13:39', NULL),
(98, 'infoLocalesTitle', 'backend', 'Infobox / Locales Title', 'script', '2019-09-06 10:13:39', NULL),
(99, 'infoMoviesFeedDesc', 'backend', 'Infobox / Movies Feed URL', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(100, 'infoMoviesFeedTitle', 'backend', 'Infobox / Movies Feed URL', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(101, 'infoPreviewDesc', 'backend', 'Infobox / Preview front end', 'script', '2019-09-06 10:13:39', '2016-07-28 02:08:29'),
(102, 'infoPreviewTitle', 'backend', 'Infobox / Preview front end', 'script', '2019-09-06 10:13:39', '2016-07-28 02:08:08'),
(103, 'infoResendDesc', 'backend', 'Infobox / Resend tickets', 'script', '2019-09-06 10:13:39', NULL),
(104, 'infoResendTitle', 'backend', 'Infobox / Resend tickets', 'script', '2019-09-06 10:13:39', NULL),
(105, 'infoScheduleDesc', 'backend', 'Infobox / Schedule', 'script', '2019-09-06 10:13:39', NULL),
(106, 'infoScheduleTitle', 'backend', 'Infobox / Schedule', 'script', '2019-09-06 10:13:39', NULL),
(107, 'infoSectorDesc', 'backend', 'Infobox / Sectors', 'script', '2019-09-06 10:13:39', NULL),
(108, 'infoSectorTitle', 'backend', 'Infobox / Sectors', 'script', '2019-09-06 10:13:39', NULL),
(109, 'infoTermsDesc', 'backend', 'Infobox / Terms and Conditions', 'script', '2019-09-06 10:13:39', NULL),
(110, 'infoTermsTitle', 'backend', 'Infobox / Terms and Conditions', 'script', '2019-09-06 10:13:39', NULL),
(111, 'infoTicketDesc', 'backend', 'Infobox / Ticket setting', 'script', '2019-09-06 10:13:39', NULL),
(112, 'infoTicketTitle', 'backend', 'Infobox / Ticket setting', 'script', '2019-09-06 10:13:39', NULL),
(113, 'infoToAdministratorsDesc', 'backend', 'Infobox / Notifications sent to script administrators', 'script', '2019-09-06 10:13:39', NULL),
(114, 'infoToAdministratorsTitle', 'backend', 'Infobox / Notifications sent to script administrators', 'script', '2019-09-06 10:13:39', NULL),
(115, 'infoToCustomersDesc', 'backend', 'Infobox / Notifications sent to customers', 'script', '2019-09-06 10:13:39', NULL),
(116, 'infoToCustomersTitle', 'backend', 'Infobox / ', 'script', '2019-09-06 10:13:39', NULL),
(117, 'infoUpdateBookingDesc', 'backend', 'Infobox / Update booking', 'script', '2019-09-06 10:13:39', NULL),
(118, 'infoUpdateBookingTitle', 'backend', 'Infobox / Update booking', 'script', '2019-09-06 10:13:39', NULL),
(119, 'infoUpdateEventDesc', 'backend', 'Infobox / Details', 'script', '2019-09-06 10:13:39', NULL),
(120, 'infoUpdateEventTitle', 'backend', 'Infobox / Details', 'script', '2019-09-06 10:13:39', NULL),
(121, 'infoUpdateShowDesc', 'backend', 'Infobox / Shows', 'script', '2019-09-06 10:13:39', NULL),
(122, 'infoUpdateShowTitle', 'backend', 'Infobox / Shows', 'script', '2019-09-06 10:13:39', NULL),
(123, 'infoUpdateUserDesc', 'backend', 'Infobox / Update user', 'script', '2019-09-06 10:13:39', '2016-07-28 03:43:06'),
(124, 'infoUpdateUserTitle', 'backend', 'Infobox / Update user', 'script', '2019-09-06 10:13:39', '2016-07-28 03:42:47'),
(125, 'infoUpdateVenueDesc', 'backend', 'Infobox / Update venue', 'script', '2019-09-06 10:13:39', NULL),
(126, 'infoUpdateVenueTitle', 'backend', 'Infobox / Update venue', 'script', '2019-09-06 10:13:39', NULL),
(127, 'infoUsersDesc', 'backend', 'Infobox / Users', 'script', '2019-09-06 10:13:39', '2016-07-28 03:37:40'),
(128, 'infoUsersTitle', 'backend', 'Infobox / Users', 'script', '2019-09-06 10:13:39', '2016-07-28 03:37:06'),
(129, 'infoVenuesDesc', 'backend', 'Infobox / List of venues', 'script', '2019-09-06 10:13:39', NULL),
(130, 'infoVenuesTitle', 'backend', 'Infobox / List of venues', 'script', '2019-09-06 10:13:39', NULL),
(131, 'lblActive', 'backend', 'Label / Active', 'script', '2019-09-06 10:13:39', NULL),
(132, 'lblAddBooking', 'backend', 'Label / Add booking', 'script', '2019-09-06 10:13:39', NULL),
(133, 'lblAddEvent', 'backend', 'Label / Add event', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(134, 'lblAddUser', 'backend', 'Add user', 'script', '2019-09-06 10:13:39', NULL),
(135, 'lblAddVenue', 'backend', 'Label / Add venue', 'script', '2019-09-06 10:13:39', NULL),
(136, 'lblAll', 'backend', 'Label / All', 'script', '2019-09-06 10:13:39', NULL),
(137, 'lblAvailableSeats', 'backend', 'Label / Available seats', 'script', '2019-09-06 10:13:39', NULL),
(138, 'lblAvailableTokens', 'backend', 'Label / Available tokens', 'script', '2019-09-06 10:13:39', '2016-07-28 03:09:27'),
(139, 'lblBackupDatabase', 'backend', 'Backup / Database', 'script', '2019-09-06 10:13:39', NULL),
(140, 'lblBackupFiles', 'backend', 'Backup / Files', 'script', '2019-09-06 10:13:39', NULL),
(141, 'lblBarcodeDetails', 'backend', 'Label / Barcode Details', 'script', '2019-09-06 10:13:39', NULL),
(142, 'lblBookedSeats', 'backend', 'Label / Booked seats', 'script', '2019-09-06 10:13:39', NULL),
(143, 'lblBooking', 'backend', 'Label / booking', 'script', '2019-09-06 10:13:39', NULL),
(144, 'lblBookingAddress', 'backend', 'Label / Address', 'script', '2019-09-06 10:13:39', NULL),
(145, 'lblBookingCity', 'backend', 'Label / City', 'script', '2019-09-06 10:13:39', NULL),
(146, 'lblBookingCompany', 'backend', 'Label / Company', 'script', '2019-09-06 10:13:39', NULL),
(147, 'lblBookingCountry', 'backend', 'Label / Country', 'script', '2019-09-06 10:13:39', NULL),
(148, 'lblBookingDetails', 'backend', 'Label / Booking details', 'script', '2019-09-06 10:13:39', NULL),
(149, 'lblBookingEmail', 'backend', 'Label / Email', 'script', '2019-09-06 10:13:39', NULL),
(150, 'lblBookingIDExists', 'backend', 'Label / Booking with such ID already exists.', 'script', '2019-09-06 10:13:39', NULL),
(151, 'lblBookingMadeToday', 'backend', 'Label / booking made today', 'script', '2019-09-06 10:13:39', NULL),
(152, 'lblBookingName', 'backend', 'Label / Name', 'script', '2019-09-06 10:13:39', NULL),
(153, 'lblBookingNotes', 'backend', 'Label / Notes', 'script', '2019-09-06 10:13:39', NULL),
(154, 'lblBookingPhone', 'backend', 'Label / Phone', 'script', '2019-09-06 10:13:39', NULL),
(155, 'lblBookings', 'backend', 'Button / Bookings', 'script', '2019-09-06 10:13:39', NULL),
(156, 'lblBookingsMadeToday', 'backend', 'Label / bookings made today', 'script', '2019-09-06 10:13:39', NULL),
(157, 'lblBookingsNotFound', 'backend', 'Label / Bookings not found', 'script', '2019-09-06 10:13:39', NULL),
(158, 'lblBookingState', 'backend', 'Label / State', 'script', '2019-09-06 10:13:39', NULL),
(159, 'lblBookingTitle', 'backend', 'Label / Title', 'script', '2019-09-06 10:13:39', NULL),
(160, 'lblBookingZip', 'backend', 'Label / Zip', 'script', '2019-09-06 10:13:39', NULL),
(161, 'lblCCCode', 'backend', 'Label / CC code', 'script', '2019-09-06 10:13:39', NULL),
(162, 'lblCCExp', 'backend', 'Label / CC expiration', 'script', '2019-09-06 10:13:39', NULL),
(163, 'lblCCNum', 'backend', 'Label / CC number', 'script', '2019-09-06 10:13:39', NULL),
(164, 'lblCCType', 'backend', 'Label / CC type', 'script', '2019-09-06 10:13:39', NULL),
(165, 'lblChoose', 'backend', 'Choose', 'script', '2019-09-06 10:13:39', NULL),
(166, 'lblChooseTheme', 'backend', 'Label / Choose theme', 'script', '2019-09-06 10:13:39', '2016-07-28 02:09:21'),
(167, 'lblClientDetails', 'backend', 'Label / Client details', 'script', '2019-09-06 10:13:39', NULL),
(168, 'lblConfirmationEmail', 'backend', 'Label / Confirmation email', 'script', '2019-09-06 10:13:39', NULL),
(169, 'lblCreatedOn', 'backend', 'Label / Created on', 'script', '2019-09-06 10:13:39', NULL),
(170, 'lblCurrentlyInUse', 'backend', 'Label / Currently in use', 'script', '2019-09-06 10:13:39', '2016-06-23 09:55:08'),
(171, 'lblDashboardHall', 'backend', 'Label / hall', 'script', '2019-09-06 10:13:39', NULL),
(172, 'lblDashboardHalls', 'backend', 'Label / halls', 'script', '2019-09-06 10:13:39', NULL),
(173, 'lblDashLastLogin', 'backend', 'Label / Last login', 'script', '2019-09-06 10:13:39', NULL),
(174, 'lblDate', 'backend', 'Label / Date', 'script', '2019-09-06 10:13:39', NULL),
(175, 'lblDateTime', 'backend', 'Label / Date & time', 'script', '2019-09-06 10:13:39', NULL),
(176, 'lblDays', 'backend', 'Days', 'script', '2019-09-06 10:13:39', NULL),
(177, 'lblDefineSeats', 'backend', 'Label / Define seats', 'script', '2019-09-06 10:13:39', NULL),
(178, 'lblDelete', 'backend', 'Delete', 'script', '2019-09-06 10:13:39', NULL),
(179, 'lblDeleteConfirmation', 'backend', 'Label / Delete confirmation', 'script', '2019-09-06 10:13:39', NULL),
(180, 'lblDeleteImage', 'backend', 'Label / Delete image', 'script', '2019-09-06 10:13:39', NULL),
(181, 'lblDeleteImageConfirm', 'backend', 'Label / Delete image confirmation', 'script', '2019-09-06 10:13:39', NULL),
(182, 'lblDeleteMapConfirm', 'backend', 'Buttons / Delete map', 'script', '2019-09-06 10:13:39', NULL),
(183, 'lblDeleteShowConfirmation', 'backend', 'Label / Delete confirmation', 'script', '2019-09-06 10:13:39', NULL),
(184, 'lblDeleteTicket', 'backend', 'Label / Delete ticket', 'script', '2019-09-06 10:13:39', NULL),
(185, 'lblDeleteTicketConfirm', 'backend', 'Label / Delete ticket confirmation', 'script', '2019-09-06 10:13:39', NULL),
(186, 'lblDeposit', 'backend', 'Label / Deposit', 'script', '2019-09-06 10:13:39', NULL),
(187, 'lblDescription', 'backend', 'Label / Description', 'script', '2019-09-06 10:13:39', NULL),
(188, 'lblDetails', 'backend', 'Labl / Details', 'script', '2019-09-06 10:13:39', NULL),
(189, 'lblDuplicatedShowtimesDesc', 'backend', 'Label / Duplicated showtimes', 'script', '2019-09-06 10:13:39', NULL),
(190, 'lblDuplicatedShowtimesTitle', 'backend', 'Label / Duplicated showtimes', 'script', '2019-09-06 10:13:39', NULL),
(191, 'lblDuration', 'backend', 'Label / Duration', 'script', '2019-09-06 10:13:39', NULL),
(192, 'lblDurationGreaterThanZero', 'backend', 'Label / Duration must be greater than 0.', 'script', '2019-09-06 10:13:39', NULL),
(193, 'lblEditBooking', 'backend', 'Label / Edit booking', 'script', '2019-09-06 10:13:39', NULL),
(194, 'lblEmail', 'backend', 'Label / Email', 'script', '2019-09-06 10:13:39', NULL),
(195, 'lblEnterPassword', 'backend', 'Label / Enter password', 'script', '2019-09-06 10:13:39', NULL),
(196, 'lblError', 'backend', 'Error', 'script', '2019-09-06 10:13:39', NULL),
(197, 'lblEvent', 'backend', 'Label / Event', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(198, 'lblExport', 'backend', 'Export', 'script', '2019-09-06 10:13:39', NULL),
(199, 'lblForgot', 'backend', 'Forgot password', 'script', '2019-09-06 10:13:39', NULL),
(200, 'lblFormat', 'backend', 'Label / Format', 'script', '2019-09-06 10:13:39', NULL),
(201, 'lblFrom', 'backend', 'Label / from', 'script', '2019-09-06 10:13:39', NULL),
(202, 'lblHeight', 'backend', 'Label / Height', 'script', '2019-09-06 10:13:39', '2016-05-31 10:39:33'),
(203, 'lblHour', 'backend', 'Label / Hour', 'script', '2019-09-06 10:13:39', NULL),
(204, 'lblID', 'backend', 'Label / ID', 'script', '2019-09-06 10:13:39', NULL),
(205, 'lblImage', 'backend', 'Label / Image', 'script', '2019-09-06 10:13:39', NULL),
(206, 'lblInactive', 'backend', 'Label / Inactive', 'script', '2019-09-06 10:13:39', NULL),
(207, 'lblInstallConfig', 'backend', 'Label / Language options', 'script', '2019-09-06 10:13:39', NULL),
(208, 'lblInstallConfigHide', 'backend', 'Label / Hide language selector ', 'script', '2019-09-06 10:13:39', NULL),
(209, 'lblInstallConfigLocale', 'backend', 'Label / Language', 'script', '2019-09-06 10:13:39', NULL),
(210, 'lblInstallJs1_body', 'backend', 'Label / Install code', 'script', '2019-09-06 10:13:39', NULL),
(211, 'lblInstallJs1_title', 'backend', 'Label / Install code', 'script', '2019-09-06 10:13:39', NULL),
(212, 'lblInvalidDate', 'backend', 'Label / Invalid date! No movies found.', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(213, 'lblIp', 'backend', 'IP address', 'script', '2019-09-06 10:13:39', NULL),
(214, 'lblIsActive', 'backend', 'Is Active', 'script', '2019-09-06 10:13:39', NULL),
(215, 'lblLatestBookings', 'backend', 'Label / Latest bookings', 'script', '2019-09-06 10:13:39', NULL),
(216, 'lblLegendEmails', 'backend', 'Label / Emails', 'script', '2019-09-06 10:13:39', NULL),
(217, 'lblLegendSMS', 'backend', 'Label / SMS', 'script', '2019-09-06 10:13:39', NULL),
(218, 'lblMap', 'backend', 'Label / Map', 'script', '2019-09-06 10:13:39', NULL),
(219, 'lblMaxAttendants', 'backend', 'Label / Max attendants', 'script', '2019-09-06 10:13:39', NULL),
(220, 'lblMessage', 'backend', 'Label / Message', 'script', '2019-09-06 10:13:39', NULL),
(221, 'lblMinutes', 'backend', 'Label / minutes', 'script', '2019-09-06 10:13:39', NULL),
(222, 'lblMovie', 'backend', 'Label / Movie', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(223, 'lblMovies', 'backend', 'Label / Events', 'script', '2019-09-06 10:13:39', '2019-07-05 13:26:38'),
(224, 'lblMoviesFeedURL', 'backend', 'Label / Movies Feed URL', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(225, 'lblMovieShowingToday', 'backend', 'Label / movie showing today', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(226, 'lblMoviesNotFound', 'backend', 'Label / No movies found', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(227, 'lblMoviesShowingToday', 'backend', 'Label / movies showing today', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(228, 'lblName', 'backend', 'Name', 'script', '2019-09-06 10:13:39', NULL),
(229, 'lblNextMovies', 'backend', 'Label / Next movies', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(230, 'lblNextTicketType', 'backend', 'Label / Next ticket type', 'script', '2019-09-06 10:13:39', NULL),
(231, 'lblNo', 'backend', 'No', 'script', '2019-09-06 10:13:39', NULL),
(232, 'lblNoAccessToFeed', 'backend', 'Label / No access to feed', 'script', '2019-09-06 10:13:39', NULL),
(233, 'lblNoEventFound', 'backend', 'Label / No events found', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(234, 'lblNowShowing', 'backend', 'Label / Now showing', 'script', '2019-09-06 10:13:39', NULL),
(235, 'lblOption', 'backend', 'Option', 'script', '2019-09-06 10:13:39', NULL),
(236, 'lblOptionList', 'backend', 'Option list', 'script', '2019-09-06 10:13:39', NULL),
(237, 'lblPaymentEmail', 'backend', 'Label / Payment email', 'script', '2019-09-06 10:13:39', NULL),
(238, 'lblPaymentMethod', 'backend', 'Label / Payment method', 'script', '2019-09-06 10:13:39', NULL),
(239, 'lblPeopleWatching', 'backend', 'Label / people watching', 'script', '2019-09-06 10:13:39', NULL),
(240, 'lblPersonWatching', 'backend', 'Label / person watching', 'script', '2019-09-06 10:13:39', NULL),
(241, 'lblPhone', 'backend', 'Label / Phone', 'script', '2019-09-06 10:13:39', '2016-07-28 03:39:03'),
(242, 'lblPluralBooking', 'backend', 'Label / bookings', 'script', '2019-09-06 10:13:39', NULL),
(243, 'lblPluralTickets', 'backend', 'Label / tickets', 'script', '2019-09-06 10:13:39', '2016-07-29 02:36:00'),
(244, 'lblPrice', 'backend', 'Label / Price', 'script', '2019-09-06 10:13:39', NULL),
(245, 'lblPrint', 'backend', 'Label / Print', 'script', '2019-09-06 10:13:39', NULL),
(246, 'lblPrintTickets', 'backend', 'Label / Print tickets', 'script', '2019-09-06 10:13:39', NULL),
(247, 'lblRemoveSeats', 'backend', 'Label / click on a seat above to remove it', 'script', '2019-09-06 10:13:39', NULL),
(248, 'lblResendTickets', 'backend', 'Label / Resend tickets', 'script', '2019-09-06 10:13:39', NULL),
(249, 'lblRole', 'backend', 'Role', 'script', '2019-09-06 10:13:39', NULL),
(250, 'lblSeatCountGreaterThanZero', 'backend', 'Label / Number of seats must be greater than zero.', 'script', '2019-09-06 10:13:39', NULL),
(251, 'lblSeatNumbers', 'backend', 'Label / Seat numbers', 'script', '2019-09-06 10:13:39', NULL),
(252, 'lblSeatNumbersRequired', 'backend', 'Label / You need to enter all numbers/IDs.', 'script', '2019-09-06 10:13:39', NULL),
(253, 'lblSeatNumbersText1', 'backend', 'Label / Seat numbers', 'script', '2019-09-06 10:13:39', NULL),
(254, 'lblSeatNumbersText2', 'backend', 'Label / Seat numbers', 'script', '2019-09-06 10:13:39', NULL),
(255, 'lblSeats', 'backend', 'Label / Seat(s)', 'script', '2019-09-06 10:13:39', NULL),
(256, 'lblSeatsCount', 'backend', 'Label / Number of seats', 'script', '2019-09-06 10:13:39', NULL),
(257, 'lblSeatsMap', 'backend', 'Label / Seats map', 'script', '2019-09-06 10:13:39', NULL),
(258, 'lblSectors', 'backend', 'Labl / Sectors', 'script', '2019-09-06 10:13:39', NULL),
(259, 'lblSelectAvailableSeats', 'backend', 'Label / Select available seats', 'script', '2019-09-06 10:13:39', NULL),
(260, 'lblSelectedSeats', 'backend', 'Label / Selected seats', 'script', '2019-09-06 10:13:39', NULL),
(261, 'lblSelectMoreSeats', 'backend', 'Label / Please select more seats.', 'script', '2019-09-06 10:13:39', NULL),
(262, 'lblSelectSeats', 'backend', 'Label / Select seats', 'script', '2019-09-06 10:13:39', NULL),
(263, 'lblSelectSeatsHint', 'backend', 'Label / Select seats hint', 'script', '2019-09-06 10:13:39', NULL),
(264, 'lblSetHotspotSize', 'backend', 'Label / set hotspot size', 'script', '2019-09-06 10:13:39', '2016-05-31 10:31:26'),
(265, 'lblShow', 'backend', 'Label / Show', 'script', '2019-09-06 10:13:39', NULL),
(266, 'lblShowNotFound', 'backend', 'Label / No shows found', 'script', '2019-09-06 10:13:39', NULL),
(267, 'lblShows', 'backend', 'Button / Shows', 'script', '2019-09-06 10:13:39', NULL),
(268, 'lblShowtime', 'backend', 'Label / Showtime', 'script', '2019-09-06 10:13:39', NULL),
(269, 'lblSigularTicket', 'backend', 'Label / ticket', 'script', '2019-09-06 10:13:39', '2016-07-29 02:36:29'),
(270, 'lblSingularTicket', 'backend', 'Label / ticket', 'script', '2019-09-06 10:13:39', NULL),
(271, 'lblStatus', 'backend', 'Status', 'script', '2019-09-06 10:13:39', NULL),
(272, 'lblStatusDuplicated', 'backend', 'Label / Duplicated showtimes', 'script', '2019-09-06 10:13:39', '2015-11-02 06:53:38'),
(273, 'lblStatusEnd', 'backend', 'Label / Showtimes have been saved.', 'script', '2019-09-06 10:13:39', '2015-11-02 10:51:07'),
(274, 'lblStatusFail', 'backend', 'Label / Showtimes could not be saved.', 'script', '2019-09-06 10:13:39', '2015-11-02 06:54:00'),
(275, 'lblStatusStart', 'backend', 'Label / Please wait while showtimes are saving...', 'script', '2019-09-06 10:13:39', '2015-11-02 06:54:24'),
(276, 'lblStatusTitle', 'backend', 'Label / Status', 'script', '2019-09-06 10:13:39', '2015-11-02 06:51:41'),
(277, 'lblSubject', 'backend', 'Label / Subject', 'script', '2019-09-06 10:13:39', NULL),
(278, 'lblSubTotal', 'backend', 'Label / Sub-total', 'script', '2019-09-06 10:13:39', NULL),
(279, 'lblTabInvoices', 'backend', 'Tab / Invoices', 'script', '2019-09-06 10:13:39', '2015-12-09 02:55:05'),
(280, 'lblTax', 'backend', 'Label / Tax', 'script', '2019-09-06 10:13:39', NULL),
(281, 'lblTicket', 'backend', 'Label / Ticket', 'script', '2019-09-06 10:13:39', NULL),
(282, 'lblTicketConfirmationDesc', 'backend', 'Label / Ticket confirmation', 'script', '2019-09-06 10:13:39', NULL),
(283, 'lblTicketConfirmationTitle', 'backend', 'Label / Ticket confirmation', 'script', '2019-09-06 10:13:39', NULL),
(284, 'lblTickets', 'backend', 'Label / Tickets', 'script', '2019-09-06 10:13:39', NULL),
(285, 'lblTitle', 'backend', 'Label / Title', 'script', '2019-09-06 10:13:39', NULL),
(286, 'lblTo', 'backend', 'Label / to', 'script', '2019-09-06 10:13:39', NULL),
(287, 'lblToAdministrators', 'backend', 'Label / To administrators', 'script', '2019-09-06 10:13:39', NULL),
(288, 'lblToCustomers', 'backend', 'Label / To customers', 'script', '2019-09-06 10:13:39', NULL),
(289, 'lblToday', 'backend', 'Label / Today', 'script', '2019-09-06 10:13:39', NULL),
(290, 'lblTomorrow', 'backend', 'Label / Tomorrow', 'script', '2019-09-06 10:13:39', NULL),
(291, 'lblTotal', 'backend', 'Label / Total', 'script', '2019-09-06 10:13:39', NULL),
(292, 'lblTotalBookings', 'backend', 'Label / Total bookings', 'script', '2019-09-06 10:13:39', NULL),
(293, 'lblTotalPrice', 'backend', 'Label / Total price', 'script', '2019-09-06 10:13:39', NULL),
(294, 'lblTotalSeats', 'backend', 'Label / Total seats', 'script', '2019-09-06 10:13:39', NULL),
(295, 'lblType', 'backend', 'Type', 'script', '2019-09-06 10:13:39', NULL),
(296, 'lblUpdateBooking', 'backend', 'Label / Update booking', 'script', '2019-09-06 10:13:39', NULL),
(297, 'lblUpdateEvent', 'backend', 'Button / Update event', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(298, 'lblUpdateMapDesc', 'backend', 'Label/ Update map', 'script', '2019-09-06 10:13:39', NULL),
(299, 'lblUpdateMapTitle', 'backend', 'Label/ Update map', 'script', '2019-09-06 10:13:39', NULL),
(300, 'lblUpdateUser', 'backend', 'Update user', 'script', '2019-09-06 10:13:39', NULL),
(301, 'lblUpdateVenue', 'backend', 'Label / Update venue', 'script', '2019-09-06 10:13:39', NULL),
(302, 'lblUserCreated', 'backend', 'User / Registration Date & Time', 'script', '2019-09-06 10:13:39', NULL),
(303, 'lblUserSeatsMap', 'backend', 'Label / Use seats map', 'script', '2019-09-06 10:13:39', NULL),
(304, 'lblUseTicket', 'backend', 'Label / Use ticket', 'script', '2019-09-06 10:13:39', NULL),
(305, 'lblValue', 'backend', 'Value', 'script', '2019-09-06 10:13:39', NULL),
(306, 'lblVenue', 'backend', 'Label / Venue', 'script', '2019-09-06 10:13:39', NULL),
(307, 'lblWidth', 'backend', 'Label / Width', 'script', '2019-09-06 10:13:39', '2016-05-31 10:39:15'),
(308, 'lblYes', 'backend', 'Yes', 'script', '2019-09-06 10:13:39', NULL),
(309, 'lnkBack', 'backend', 'Link Back', 'script', '2019-09-06 10:13:39', NULL),
(310, 'localeArrays', 'backend', 'Locale / Arrays titles', 'script', '2019-09-06 10:13:39', NULL),
(311, 'locales', 'backend', 'Languages', 'script', '2019-09-06 10:13:39', NULL),
(312, 'locale_flag', 'backend', 'Locale / Flag', 'script', '2019-09-06 10:13:39', NULL),
(313, 'locale_is_default', 'backend', 'Locale / Is default', 'script', '2019-09-06 10:13:39', NULL),
(314, 'locale_order', 'backend', 'Locale / Order', 'script', '2019-09-06 10:13:39', NULL),
(315, 'locale_title', 'backend', 'Locale / Title', 'script', '2019-09-06 10:13:39', NULL),
(316, 'menuBackup', 'backend', 'Menu Backup', 'script', '2019-09-06 10:13:39', NULL),
(317, 'menuBookingForm', 'backend', 'Menu / Booking form', 'script', '2019-09-06 10:13:39', NULL),
(318, 'menuBookings', 'backend', 'Menu / Bookings', 'script', '2019-09-06 10:13:39', NULL),
(319, 'menuDashboard', 'backend', 'Menu Dashboard', 'script', '2019-09-06 10:13:39', NULL),
(320, 'menuEvents', 'backend', 'Menu / Events', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(321, 'menuGeneral', 'backend', 'Menu / General', 'script', '2019-09-06 10:13:39', NULL),
(322, 'menuInstall', 'backend', 'Menu / Install', 'script', '2019-09-06 10:13:39', NULL),
(323, 'menuLang', 'backend', 'Menu Multi lang', 'script', '2019-09-06 10:13:39', NULL),
(324, 'menuLocales', 'backend', 'Menu Languages', 'script', '2019-09-06 10:13:39', NULL),
(325, 'menuLogout', 'backend', 'Menu Logout', 'script', '2019-09-06 10:13:39', NULL),
(326, 'menuNotifications', 'backend', 'Menu / Notifications', 'script', '2019-09-06 10:13:39', NULL),
(327, 'menuOptions', 'backend', 'Menu Options', 'script', '2019-09-06 10:13:39', NULL),
(328, 'menuPlugins', 'backend', 'Menu Plugins', 'script', '2019-09-06 10:13:39', NULL),
(329, 'menuPreview', 'backend', 'Menu / Preview', 'script', '2019-09-06 10:13:39', NULL),
(330, 'menuPreviewInstall', 'backend', 'Menu / Preview & Install', 'script', '2019-09-06 10:13:39', '2016-07-28 02:03:23'),
(331, 'menuProfile', 'backend', 'Menu Profile', 'script', '2019-09-06 10:13:39', NULL),
(332, 'menuSchedule', 'backend', 'Menu / Schedule', 'script', '2019-09-06 10:13:39', NULL),
(333, 'menuTerms', 'backend', 'Menu / Terms', 'script', '2019-09-06 10:13:39', NULL),
(334, 'menuTicket', 'backend', 'Menu / Ticket', 'script', '2019-09-06 10:13:39', NULL),
(335, 'menuUsers', 'backend', 'Menu Users', 'script', '2019-09-06 10:13:39', NULL),
(336, 'menuVenues', 'backend', 'Menu / Venues', 'script', '2019-09-06 10:13:39', '2019-07-05 13:33:24'),
(337, 'multilangTooltip', 'backend', 'MultiLang / Tooltip', 'script', '2019-09-06 10:13:39', NULL),
(338, 'opt_o_admin_sms_confirmation_message', 'backend', 'Options / New booking SMS', 'script', '2019-09-06 10:13:39', NULL),
(339, 'opt_o_admin_sms_confirmation_message_text', 'backend', 'Options / New booking SMS', 'script', '2019-09-06 10:13:39', NULL),
(340, 'opt_o_admin_sms_payment_message', 'backend', 'Options / Payment confirmation SMS', 'script', '2019-09-06 10:13:39', NULL),
(341, 'opt_o_admin_sms_payment_message_text', 'backend', 'Options / Payment confirmation SMS', 'script', '2019-09-06 10:13:39', NULL),
(342, 'opt_o_allow_authorize', 'backend', 'Options / Allow payments with Authorize.net ', 'script', '2019-09-06 10:13:39', NULL),
(343, 'opt_o_allow_bank', 'backend', 'Options / Provide Bank account details for wire transfers', 'script', '2019-09-06 10:13:39', NULL),
(344, 'opt_o_allow_cash', 'backend', 'Options / Allow payment with cash', 'script', '2019-09-06 10:13:39', NULL),
(345, 'opt_o_allow_creditcard', 'backend', 'Options / Collect Credit Card details for offline processing', 'script', '2019-09-06 10:13:39', NULL),
(346, 'opt_o_allow_paypal', 'backend', 'Options / Allow payments with PayPal', 'script', '2019-09-06 10:13:39', NULL),
(347, 'opt_o_authorize_md5_hash', 'backend', 'Options / Authorize.net MD5 hash', 'script', '2019-09-06 10:13:39', NULL),
(348, 'opt_o_authorize_merchant_id', 'backend', 'Options / Authorize.net merchant ID', 'script', '2019-09-06 10:13:39', NULL),
(349, 'opt_o_authorize_timezone', 'backend', 'Options / Authorize.net time zone', 'script', '2019-09-06 10:13:39', NULL),
(350, 'opt_o_authorize_transkey', 'backend', 'Options / Authorize.net transaction key', 'script', '2019-09-06 10:13:39', NULL),
(351, 'opt_o_bank_account', 'backend', 'Options / Bank Account', 'script', '2019-09-06 10:13:39', NULL),
(352, 'opt_o_bf_include_address', 'backend', 'Options / Address', 'script', '2019-09-06 10:13:39', NULL),
(353, 'opt_o_bf_include_captcha', 'backend', 'Options / Captcha', 'script', '2019-09-06 10:13:39', NULL),
(354, 'opt_o_bf_include_city', 'backend', 'Options / City', 'script', '2019-09-06 10:13:39', NULL),
(355, 'opt_o_bf_include_company', 'backend', 'Options / Company', 'script', '2019-09-06 10:13:39', NULL),
(356, 'opt_o_bf_include_country', 'backend', 'Options / Country', 'script', '2019-09-06 10:13:39', NULL),
(357, 'opt_o_bf_include_email', 'backend', 'Options / Email', 'script', '2019-09-06 10:13:39', NULL),
(358, 'opt_o_bf_include_name', 'backend', 'Options / Name', 'script', '2019-09-06 10:13:39', NULL),
(359, 'opt_o_bf_include_notes', 'backend', 'Options / Notes', 'script', '2019-09-06 10:13:39', NULL),
(360, 'opt_o_bf_include_phone', 'backend', 'Options / Phone', 'script', '2019-09-06 10:13:39', NULL),
(361, 'opt_o_bf_include_state', 'backend', 'Options / State', 'script', '2019-09-06 10:13:39', NULL),
(362, 'opt_o_bf_include_title', 'backend', 'Options / Title', 'script', '2019-09-06 10:13:39', NULL),
(363, 'opt_o_bf_include_zip', 'backend', 'Options / Zip', 'script', '2019-09-06 10:13:39', NULL),
(364, 'opt_o_booking_earlier', 'backend', 'Options / Book X minutes before the movie', 'script', '2019-09-06 10:13:39', '2019-07-05 13:31:17'),
(365, 'opt_o_booking_earlier_text', 'backend', 'Options / Book X hours before the event', 'script', '2019-09-06 10:13:39', NULL),
(366, 'opt_o_booking_status', 'backend', 'Options / Default booking status', 'script', '2019-09-06 10:13:39', NULL),
(367, 'opt_o_booking_status_text', 'backend', 'Options / Default booking status', 'script', '2019-09-06 10:13:39', NULL),
(368, 'opt_o_currency', 'backend', 'Options / Currency', 'script', '2019-09-06 10:13:39', NULL),
(369, 'opt_o_date_format', 'backend', 'Options / Date format', 'script', '2019-09-06 10:13:39', NULL),
(370, 'opt_o_deposit_payment', 'backend', 'Options / Deposit payment', 'script', '2019-09-06 10:13:39', NULL),
(371, 'opt_o_deposit_payment_text', 'backend', 'Options / Deposit payment', 'script', '2019-09-06 10:13:39', NULL),
(372, 'opt_o_email_cancel', 'backend', 'Options / Send cancellation email', 'script', '2019-09-06 10:13:39', NULL),
(373, 'opt_o_email_cancel_message', 'backend', 'Options / Cancel confirmation message', 'script', '2019-09-06 10:13:39', NULL),
(374, 'opt_o_email_cancel_message_text', 'backend', 'Options / Payment confirmation message', 'script', '2019-09-06 10:13:39', NULL),
(375, 'opt_o_email_cancel_subject', 'backend', 'Options / Cancel confirmation subject', 'script', '2019-09-06 10:13:39', NULL),
(376, 'opt_o_email_confirmation', 'backend', 'Options / New booking received email', 'script', '2019-09-06 10:13:39', NULL),
(377, 'opt_o_email_confirmation_message', 'backend', 'Options / New booking confirmation message', 'script', '2019-09-06 10:13:39', NULL),
(378, 'opt_o_email_confirmation_message_text', 'backend', 'Options / New booking confirmation message', 'script', '2019-09-06 10:13:39', NULL),
(379, 'opt_o_email_confirmation_subject', 'backend', 'Options / New booking confirmation subject', 'script', '2019-09-06 10:13:39', NULL),
(380, 'opt_o_email_confirmation_text', 'backend', 'Options / New booking received email', 'script', '2019-09-06 10:13:39', NULL),
(381, 'opt_o_email_payment', 'backend', 'Options / Send payment confirmation email', 'script', '2019-09-06 10:13:39', NULL),
(382, 'opt_o_email_payment_message', 'backend', 'Options / Payment confirmation message', 'script', '2019-09-06 10:13:39', NULL),
(383, 'opt_o_email_payment_message_text', 'backend', 'Options / Payment confirmation message', 'script', '2019-09-06 10:13:39', NULL),
(384, 'opt_o_email_payment_subject', 'backend', 'Options / Payment confirmation subject', 'script', '2019-09-06 10:13:39', NULL),
(385, 'opt_o_email_payment_text', 'backend', 'Options / Send payment confirmation email', 'script', '2019-09-06 10:13:39', NULL),
(386, 'opt_o_layout', 'backend', 'Options / Layout', 'script', '2019-09-06 10:13:39', NULL),
(387, 'opt_o_payment_disable', 'backend', 'Options / Payment disable', 'script', '2019-09-06 10:13:39', NULL),
(388, 'opt_o_payment_status', 'backend', 'Options / Default payment status', 'script', '2019-09-06 10:13:39', NULL),
(389, 'opt_o_paypal_address', 'backend', 'Options / PayPal business email address', 'script', '2019-09-06 10:13:39', NULL),
(390, 'opt_o_send_email', 'backend', 'opt_o_send_email', 'script', '2019-09-06 10:13:39', NULL),
(391, 'opt_o_send_pdf_ticket', 'backend', 'Options / Send PDF ticket', 'script', '2019-09-06 10:13:39', NULL),
(392, 'opt_o_sms_confirmation_message', 'backend', 'Options / Booking reminder SMS', 'script', '2019-09-06 10:13:39', NULL),
(393, 'opt_o_sms_confirmation_message_text', 'backend', 'Options / Booking reminder SMS', 'script', '2019-09-06 10:13:39', NULL),
(394, 'opt_o_smtp_host', 'backend', 'opt_o_smtp_host', 'script', '2019-09-06 10:13:39', NULL),
(395, 'opt_o_smtp_pass', 'backend', 'opt_o_smtp_pass', 'script', '2019-09-06 10:13:39', NULL),
(396, 'opt_o_smtp_port', 'backend', 'opt_o_smtp_port', 'script', '2019-09-06 10:13:39', NULL),
(397, 'opt_o_smtp_user', 'backend', 'opt_o_smtp_user', 'script', '2019-09-06 10:13:39', NULL),
(398, 'opt_o_tax_payment', 'backend', 'Options / Tax payment', 'script', '2019-09-06 10:13:39', NULL),
(399, 'opt_o_tax_payment_text', 'backend', 'Options / Tax payment', 'script', '2019-09-06 10:13:39', NULL),
(400, 'opt_o_terms', 'backend', 'Options / Terms and Conditions', 'script', '2019-09-06 10:13:39', NULL),
(401, 'opt_o_thank_you_page', 'backend', 'Options / Thank you page', 'script', '2019-09-06 10:13:39', NULL),
(402, 'opt_o_ticket_data', 'backend', 'Options / Ticket data', 'script', '2019-09-06 10:13:39', NULL),
(403, 'opt_o_ticket_data_text', 'backend', 'Options / Ticket data', 'script', '2019-09-06 10:13:39', NULL),
(404, 'opt_o_ticket_image', 'backend', 'Options / Ticket', 'script', '2019-09-06 10:13:39', NULL),
(405, 'opt_o_timezone', 'backend', 'Options / Timezone', 'script', '2019-09-06 10:13:39', NULL),
(406, 'opt_o_time_format', 'backend', 'Options / Time format', 'script', '2019-09-06 10:13:39', NULL),
(407, 'opt_o_week_start', 'backend', 'Options / First day of the week', 'script', '2019-09-06 10:13:39', NULL),
(408, 'pass', 'backend', 'Password', 'script', '2019-09-06 10:13:39', NULL),
(409, 'pj_email_taken', 'backend', 'Users / Email already taken', 'script', '2019-09-06 10:13:39', NULL),
(410, 'revert_status', 'backend', 'Revert status', 'script', '2019-09-06 10:13:39', NULL),
(411, 'tabBarcodeReader', 'backend', 'Tab / Barcode reader', 'script', '2019-09-06 10:13:39', NULL),
(412, 'tb_field_required', 'backend', 'Label / This field is required.', 'script', '2019-09-06 10:13:39', NULL),
(413, 'tb_seats_required', 'backend', 'Label / You have to set up at least one seat on the map.', 'script', '2019-09-06 10:13:39', NULL),
(414, 'url', 'backend', 'URL', 'script', '2019-09-06 10:13:39', NULL),
(415, 'user', 'backend', 'Username', 'script', '2019-09-06 10:13:39', NULL),
(416, 'front_available', 'frontend', 'Label / Available', 'script', '2019-09-06 10:13:39', NULL),
(417, 'front_back', 'frontend', 'Label / Back', 'script', '2019-09-06 10:13:39', NULL),
(418, 'front_bank_account', 'frontend', 'Label / Bank account', 'script', '2019-09-06 10:13:39', NULL),
(419, 'front_blocked', 'frontend', 'Label / Blocked', 'script', '2019-09-06 10:13:39', NULL),
(420, 'front_booking_created', 'frontend', 'Label / Booking created', 'script', '2019-09-06 10:13:39', NULL),
(421, 'front_button_cancel', 'frontend', 'Button / Cancel', 'script', '2019-09-06 10:13:39', NULL),
(422, 'front_button_confirm', 'frontend', 'Button / Cancel', 'script', '2019-09-06 10:13:39', NULL),
(423, 'front_button_confirm_booking', 'frontend', 'Button / Confirm Booking', 'script', '2019-09-06 10:13:39', NULL),
(424, 'front_button_continue', 'frontend', 'Button / Continue', 'script', '2019-09-06 10:13:39', NULL),
(425, 'front_button_purchase_tickets', 'frontend', 'Button / Purchase tickets', 'script', '2019-09-06 10:13:39', NULL),
(426, 'front_button_start_over', 'frontend', 'Button / Start over', 'script', '2019-09-06 10:13:39', NULL),
(427, 'front_cancel_booking_id', 'frontend', 'Label / Booking ID', 'script', '2019-09-06 10:13:39', NULL),
(428, 'front_cancel_booking_seats', 'frontend', 'Label / Booking seats', 'script', '2019-09-06 10:13:39', NULL),
(429, 'front_cancel_date_time', 'frontend', 'Label / Event date & time', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(430, 'front_cancel_event', 'frontend', 'Label / Event', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(431, 'front_cancel_heading', 'frontend', 'Button / Your booking details', 'script', '2019-09-06 10:13:39', NULL),
(432, 'front_cancel_tickets', 'frontend', 'Label / Tickets & prices', 'script', '2019-09-06 10:13:39', NULL),
(433, 'front_captcha', 'frontend', 'Label / Captcha', 'script', '2019-09-06 10:13:39', NULL),
(434, 'front_cc_exp', 'frontend', 'Label / CC expiration', 'script', '2019-09-06 10:13:39', NULL),
(435, 'front_cc_num', 'frontend', 'Label / CC number', 'script', '2019-09-06 10:13:39', NULL),
(436, 'front_cc_sec', 'frontend', 'Label / CC code', 'script', '2019-09-06 10:13:39', NULL),
(437, 'front_cc_type', 'frontend', 'Label / CC type', 'script', '2019-09-06 10:13:39', NULL),
(438, 'front_current_month', 'frontend', 'Label / Current month', 'script', '2019-09-06 10:13:39', '2016-06-01 07:43:15'),
(439, 'front_customer_address', 'frontend', 'Label / Address', 'script', '2019-09-06 10:13:39', NULL),
(440, 'front_customer_city', 'frontend', 'Label / City', 'script', '2019-09-06 10:13:39', NULL),
(441, 'front_customer_company', 'frontend', 'Label / Company', 'script', '2019-09-06 10:13:39', NULL),
(442, 'front_customer_country', 'frontend', 'Label / Country', 'script', '2019-09-06 10:13:39', NULL),
(443, 'front_customer_email', 'frontend', 'Label / Email', 'script', '2019-09-06 10:13:39', NULL),
(444, 'front_customer_name', 'frontend', 'Label / Name', 'script', '2019-09-06 10:13:39', NULL),
(445, 'front_customer_notes', 'frontend', 'Label / Notes', 'script', '2019-09-06 10:13:39', NULL),
(446, 'front_customer_phone', 'frontend', 'Label / Phone', 'script', '2019-09-06 10:13:39', NULL),
(447, 'front_customer_state', 'frontend', 'Label / State', 'script', '2019-09-06 10:13:39', NULL),
(448, 'front_customer_title', 'frontend', 'Label / Title', 'script', '2019-09-06 10:13:39', NULL),
(449, 'front_customer_zip', 'frontend', 'Label / Zip', 'script', '2019-09-06 10:13:39', NULL),
(450, 'front_date', 'frontend', 'Label / Date', 'script', '2019-09-06 10:13:39', NULL),
(451, 'front_deposit', 'frontend', 'Label / Deposit', 'script', '2019-09-06 10:13:39', NULL),
(452, 'front_dropdown_choose', 'frontend', 'Label / Choose', 'script', '2019-09-06 10:13:39', NULL),
(453, 'front_fill_details', 'frontend', 'Label / Fill in your details', 'script', '2019-09-06 10:13:39', NULL),
(454, 'front_hall', 'frontend', 'Label / Hall', 'script', '2019-09-06 10:13:39', '2016-02-15 03:20:34'),
(455, 'front_how_to_remove_seats', 'frontend', 'Label / click on selected seats below to remove it', 'script', '2019-09-06 10:13:39', NULL),
(456, 'front_label_payment_medthod', 'frontend', 'Label / Payment method', 'script', '2019-09-06 10:13:39', NULL),
(457, 'front_label_processed_on', 'frontend', 'Label / Processed on', 'script', '2019-09-06 10:13:39', NULL),
(458, 'front_label_txn_id', 'frontend', 'Label / Paypal Transaction ID', 'script', '2019-09-06 10:13:39', NULL),
(459, 'front_minutes', 'frontend', 'Label / Minutes', 'script', '2019-09-06 10:13:39', NULL),
(460, 'front_movie', 'frontend', 'Label / Movie', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(461, 'front_na', 'frontend', 'Label / N/A', 'script', '2019-09-06 10:13:39', NULL),
(462, 'front_no_events_found', 'frontend', 'Label / No movies found', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(463, 'front_no_seats_available', 'frontend', 'Label / No available seats', 'script', '2019-09-06 10:13:39', NULL),
(464, 'front_no_shows_on_selected_date', 'frontend', 'Label / No shows on selected date.', 'script', '2019-09-06 10:13:39', NULL),
(465, 'front_payment_information', 'frontend', 'Label / Payment information', 'script', '2019-09-06 10:13:39', NULL),
(466, 'front_payment_method', 'frontend', 'Label / Payment method', 'script', '2019-09-06 10:13:39', NULL),
(467, 'front_personal_details', 'frontend', 'Button / Personal details', 'script', '2019-09-06 10:13:39', NULL),
(468, 'front_placeholder_address', 'frontend', 'Label / Your address', 'script', '2019-09-06 10:13:39', NULL),
(469, 'front_placeholder_city', 'frontend', 'Label / City', 'script', '2019-09-06 10:13:39', NULL),
(470, 'front_placeholder_company', 'frontend', 'Label / Company name', 'script', '2019-09-06 10:13:39', NULL),
(471, 'front_placeholder_email', 'frontend', 'Label / Your email', 'script', '2019-09-06 10:13:39', NULL),
(472, 'front_placeholder_name', 'frontend', 'Label / Your name', 'script', '2019-09-06 10:13:39', NULL),
(473, 'front_placeholder_notes', 'frontend', 'Label / Notes', 'script', '2019-09-06 10:13:39', NULL),
(474, 'front_placeholder_phone', 'frontend', 'Label / Phone number', 'script', '2019-09-06 10:13:39', NULL),
(475, 'front_placeholder_state', 'frontend', 'Label / State', 'script', '2019-09-06 10:13:39', NULL),
(476, 'front_placeholder_zip', 'frontend', 'Label / Postal code', 'script', '2019-09-06 10:13:39', NULL),
(477, 'front_running_time', 'frontend', 'Label / Running time', 'script', '2019-09-06 10:13:39', NULL),
(478, 'front_selected', 'frontend', 'Label / Selected', 'script', '2019-09-06 10:13:39', NULL),
(479, 'front_selected_date', 'frontend', 'Label / Selected date', 'script', '2019-09-06 10:13:39', NULL),
(480, 'front_selected_seats', 'frontend', 'Label / Selected seat(s)', 'script', '2019-09-06 10:13:39', NULL),
(481, 'front_select_available_seats', 'frontend', 'Label / click on available seats to select it', 'script', '2019-09-06 10:13:39', NULL),
(482, 'front_select_date', 'frontend', 'Label / Select date', 'script', '2019-09-06 10:13:39', NULL),
(483, 'front_select_ticket_types_above', 'frontend', 'Label / Select ticket types above', 'script', '2019-09-06 10:13:39', NULL),
(484, 'front_select_time', 'frontend', 'Label / Select time', 'script', '2019-09-06 10:13:39', '2016-07-27 10:00:49'),
(485, 'front_start_over_message', 'frontend', 'Label / Start over', 'script', '2019-09-06 10:13:39', NULL),
(486, 'front_sub_total', 'frontend', 'Label / Sub-total', 'script', '2019-09-06 10:13:39', NULL),
(487, 'front_tax', 'frontend', 'Label / Tax', 'script', '2019-09-06 10:13:39', NULL),
(488, 'front_terms', 'frontend', 'Label / Accept terms of booking', 'script', '2019-09-06 10:13:39', NULL),
(489, 'front_terms_title', 'frontend', 'Label / Terms and conditions', 'script', '2019-09-06 10:13:39', NULL),
(490, 'front_time', 'frontend', 'Label / Time', 'script', '2019-09-06 10:13:39', NULL),
(491, 'front_today', 'frontend', 'Label / Today', 'script', '2019-09-06 10:13:39', NULL);
INSERT INTO `tk_cbs_fields` (`id`, `key`, `type`, `label`, `source`, `created_at`, `modified`) VALUES
(492, 'front_tomorrow', 'frontend', 'Label / Tomorrow', 'script', '2019-09-06 10:13:39', NULL),
(493, 'front_total', 'frontend', 'Label / Total', 'script', '2019-09-06 10:13:39', NULL),
(494, 'front_total_price', 'frontend', 'Label / Total price', 'script', '2019-09-06 10:13:39', NULL),
(495, 'front_your_details', 'frontend', 'Label / Your details', 'script', '2019-09-06 10:13:39', NULL),
(496, 'system_109', 'frontend', 'Label / Missing parameters', 'script', '2019-09-06 10:13:39', NULL),
(497, 'system_110', 'frontend', 'Label / Missing or wrong captcha.', 'script', '2019-09-06 10:13:39', NULL),
(498, 'system_118', 'frontend', 'Label / System message', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(499, 'system_119', 'frontend', 'Label / System message', 'script', '2019-09-06 10:13:39', NULL),
(500, 'system_211', 'frontend', 'Label / Checkout submitted', 'script', '2019-09-06 10:13:39', NULL),
(501, 'admin_sms_arr_ARRAY_confirmation', 'arrays', 'admin_sms_arr_ARRAY_confirmation', 'script', '2019-09-06 10:13:39', '2016-07-28 02:55:56'),
(502, 'admin_sms_arr_ARRAY_payment', 'arrays', 'admin_sms_arr_ARRAY_payment', 'script', '2019-09-06 10:13:39', '2016-07-28 02:56:20'),
(503, 'booking_statuses_ARRAY_cancelled', 'arrays', 'booking_statuses_ARRAY_cancelled', 'script', '2019-09-06 10:13:39', NULL),
(504, 'booking_statuses_ARRAY_confirmed', 'arrays', 'booking_statuses_ARRAY_confirmed', 'script', '2019-09-06 10:13:39', NULL),
(505, 'booking_statuses_ARRAY_pending', 'arrays', 'booking_statuses_ARRAY_pending', 'script', '2019-09-06 10:13:39', NULL),
(506, 'buttons_ARRAY_cancel', 'arrays', 'buttons_ARRAY_cancel', 'script', '2019-09-06 10:13:39', NULL),
(507, 'buttons_ARRAY_delete', 'arrays', 'buttons_ARRAY_delete', 'script', '2019-09-06 10:13:39', NULL),
(508, 'buttons_ARRAY_no', 'arrays', 'buttons_ARRAY_no', 'script', '2019-09-06 10:13:39', NULL),
(509, 'buttons_ARRAY_ok', 'arrays', 'buttons_ARRAY_ok', 'script', '2019-09-06 10:13:39', NULL),
(510, 'buttons_ARRAY_save', 'arrays', 'buttons_ARRAY_save', 'script', '2019-09-06 10:13:39', NULL),
(511, 'buttons_ARRAY_set', 'arrays', 'buttons_ARRAY_set', 'script', '2019-09-06 10:13:39', '2016-05-31 10:35:29'),
(512, 'buttons_ARRAY_yes', 'arrays', 'buttons_ARRAY_yes', 'script', '2019-09-06 10:13:39', NULL),
(513, 'cancel_err_ARRAY_1', 'arrays', 'cancel_err_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(514, 'cancel_err_ARRAY_2', 'arrays', 'cancel_err_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(515, 'cancel_err_ARRAY_200', 'arrays', 'cancel_err_ARRAY_200', 'script', '2019-09-06 10:13:39', NULL),
(516, 'cancel_err_ARRAY_3', 'arrays', 'cancel_err_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(517, 'cancel_err_ARRAY_4', 'arrays', 'cancel_err_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(518, 'cc_types_ARRAY_AmericanExpress', 'arrays', 'cc_types_ARRAY_AmericanExpress', 'script', '2019-09-06 10:13:39', NULL),
(519, 'cc_types_ARRAY_Maestro', 'arrays', 'cc_types_ARRAY_Maestro', 'script', '2019-09-06 10:13:39', NULL),
(520, 'cc_types_ARRAY_MasterCard', 'arrays', 'cc_types_ARRAY_MasterCard', 'script', '2019-09-06 10:13:39', NULL),
(521, 'cc_types_ARRAY_Visa', 'arrays', 'cc_types_ARRAY_Visa', 'script', '2019-09-06 10:13:39', NULL),
(522, 'client_notify_arr_ARRAY_cancel', 'arrays', 'client_notify_arr_ARRAY_cancel', 'script', '2019-09-06 10:13:39', '2016-07-28 02:44:43'),
(523, 'client_notify_arr_ARRAY_confirmation', 'arrays', 'client_notify_arr_ARRAY_confirmation', 'script', '2019-09-06 10:13:39', '2016-07-28 02:43:45'),
(524, 'client_notify_arr_ARRAY_payment', 'arrays', 'client_notify_arr_ARRAY_payment', 'script', '2019-09-06 10:13:39', '2016-07-28 02:44:13'),
(525, 'coming_arr_ARRAY_1', 'arrays', 'coming_arr_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(526, 'coming_arr_ARRAY_2', 'arrays', 'coming_arr_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(527, 'coming_arr_ARRAY_3', 'arrays', 'coming_arr_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(528, 'coming_arr_ARRAY_4', 'arrays', 'coming_arr_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(529, 'coming_arr_ARRAY_5', 'arrays', 'coming_arr_ARRAY_5', 'script', '2019-09-06 10:13:39', NULL),
(530, 'coming_arr_ARRAY_6', 'arrays', 'coming_arr_ARRAY_6', 'script', '2019-09-06 10:13:39', NULL),
(531, 'days_ARRAY_0', 'arrays', 'days_ARRAY_0', 'script', '2019-09-06 10:13:39', NULL),
(532, 'days_ARRAY_1', 'arrays', 'days_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(533, 'days_ARRAY_2', 'arrays', 'days_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(534, 'days_ARRAY_3', 'arrays', 'days_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(535, 'days_ARRAY_4', 'arrays', 'days_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(536, 'days_ARRAY_5', 'arrays', 'days_ARRAY_5', 'script', '2019-09-06 10:13:39', NULL),
(537, 'days_ARRAY_6', 'arrays', 'days_ARRAY_6', 'script', '2019-09-06 10:13:39', NULL),
(538, 'day_names_ARRAY_0', 'arrays', 'day_names_ARRAY_0', 'script', '2019-09-06 10:13:39', NULL),
(539, 'day_names_ARRAY_1', 'arrays', 'day_names_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(540, 'day_names_ARRAY_2', 'arrays', 'day_names_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(541, 'day_names_ARRAY_3', 'arrays', 'day_names_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(542, 'day_names_ARRAY_4', 'arrays', 'day_names_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(543, 'day_names_ARRAY_5', 'arrays', 'day_names_ARRAY_5', 'script', '2019-09-06 10:13:39', NULL),
(544, 'day_names_ARRAY_6', 'arrays', 'day_names_ARRAY_6', 'script', '2019-09-06 10:13:39', NULL),
(545, 'error_bodies_ARRAY_AA10', 'arrays', 'error_bodies_ARRAY_AA10', 'script', '2019-09-06 10:13:39', NULL),
(546, 'error_bodies_ARRAY_AA11', 'arrays', 'error_bodies_ARRAY_AA11', 'script', '2019-09-06 10:13:39', NULL),
(547, 'error_bodies_ARRAY_AA12', 'arrays', 'error_bodies_ARRAY_AA12', 'script', '2019-09-06 10:13:39', NULL),
(548, 'error_bodies_ARRAY_AA13', 'arrays', 'error_bodies_ARRAY_AA13', 'script', '2019-09-06 10:13:39', NULL),
(549, 'error_bodies_ARRAY_AB01', 'arrays', 'error_bodies_ARRAY_AB01', 'script', '2019-09-06 10:13:39', NULL),
(550, 'error_bodies_ARRAY_AB02', 'arrays', 'error_bodies_ARRAY_AB02', 'script', '2019-09-06 10:13:39', NULL),
(551, 'error_bodies_ARRAY_AB03', 'arrays', 'error_bodies_ARRAY_AB03', 'script', '2019-09-06 10:13:39', NULL),
(552, 'error_bodies_ARRAY_AB04', 'arrays', 'error_bodies_ARRAY_AB04', 'script', '2019-09-06 10:13:39', NULL),
(553, 'error_bodies_ARRAY_AE01', 'arrays', 'error_bodies_ARRAY_AE01', 'script', '2019-09-06 10:13:39', '2019-07-05 13:28:14'),
(554, 'error_bodies_ARRAY_AE03', 'arrays', 'error_bodies_ARRAY_AE03', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(555, 'error_bodies_ARRAY_AE04', 'arrays', 'error_bodies_ARRAY_AE04', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(556, 'error_bodies_ARRAY_AE05', 'arrays', 'error_bodies_ARRAY_AE05', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(557, 'error_bodies_ARRAY_AE06', 'arrays', 'error_bodies_ARRAY_AE06', 'script', '2019-09-06 10:13:39', NULL),
(558, 'error_bodies_ARRAY_AE08', 'arrays', 'error_bodies_ARRAY_AE08', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(559, 'error_bodies_ARRAY_AE09', 'arrays', 'error_bodies_ARRAY_AE09', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(560, 'error_bodies_ARRAY_AE10', 'arrays', 'error_bodies_ARRAY_AE10', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(561, 'error_bodies_ARRAY_AE11', 'arrays', 'error_bodies_ARRAY_AE11', 'script', '2019-09-06 10:13:39', NULL),
(562, 'error_bodies_ARRAY_AE12', 'arrays', 'error_bodies_ARRAY_AE12', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(563, 'error_bodies_ARRAY_AE13', 'arrays', 'error_bodies_ARRAY_AE13', 'script', '2019-09-06 10:13:39', NULL),
(564, 'error_bodies_ARRAY_ALC01', 'arrays', 'error_bodies_ARRAY_ALC01', 'script', '2019-09-06 10:13:39', NULL),
(565, 'error_bodies_ARRAY_AO01', 'arrays', 'error_bodies_ARRAY_AO01', 'script', '2019-09-06 10:13:39', NULL),
(566, 'error_bodies_ARRAY_AO02', 'arrays', 'error_bodies_ARRAY_AO02', 'script', '2019-09-06 10:13:39', NULL),
(567, 'error_bodies_ARRAY_AO03', 'arrays', 'error_bodies_ARRAY_AO03', 'script', '2019-09-06 10:13:39', NULL),
(568, 'error_bodies_ARRAY_AO04', 'arrays', 'error_bodies_ARRAY_AO04', 'script', '2019-09-06 10:13:39', NULL),
(569, 'error_bodies_ARRAY_AO05', 'arrays', 'error_bodies_ARRAY_AO05', 'script', '2019-09-06 10:13:39', NULL),
(570, 'error_bodies_ARRAY_AO06', 'arrays', 'error_bodies_ARRAY_AO06', 'script', '2019-09-06 10:13:39', NULL),
(571, 'error_bodies_ARRAY_AO07', 'arrays', 'error_bodies_ARRAY_AO07', 'script', '2019-09-06 10:13:39', NULL),
(572, 'error_bodies_ARRAY_AR01', 'arrays', 'error_bodies_ARRAY_AR01', 'script', '2019-09-06 10:13:39', NULL),
(573, 'error_bodies_ARRAY_AR03', 'arrays', 'error_bodies_ARRAY_AR03', 'script', '2019-09-06 10:13:39', NULL),
(574, 'error_bodies_ARRAY_AR04', 'arrays', 'error_bodies_ARRAY_AR04', 'script', '2019-09-06 10:13:39', NULL),
(575, 'error_bodies_ARRAY_AR08', 'arrays', 'error_bodies_ARRAY_AR08', 'script', '2019-09-06 10:13:39', NULL),
(576, 'error_bodies_ARRAY_AR10', 'arrays', 'error_bodies_ARRAY_AR10', 'script', '2019-09-06 10:13:39', NULL),
(577, 'error_bodies_ARRAY_AR21', 'arrays', 'error_bodies_ARRAY_AR21', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(578, 'error_bodies_ARRAY_AU01', 'arrays', 'error_bodies_ARRAY_AU01', 'script', '2019-09-06 10:13:39', '2019-07-24 15:38:08'),
(579, 'error_bodies_ARRAY_AU03', 'arrays', 'error_bodies_ARRAY_AU03', 'script', '2019-09-06 10:13:39', NULL),
(580, 'error_bodies_ARRAY_AU04', 'arrays', 'error_bodies_ARRAY_AU04', 'script', '2019-09-06 10:13:39', NULL),
(581, 'error_bodies_ARRAY_AU08', 'arrays', 'error_bodies_ARRAY_AU08', 'script', '2019-09-06 10:13:39', NULL),
(582, 'error_bodies_ARRAY_AV01', 'arrays', 'error_bodies_ARRAY_AV01', 'script', '2019-09-06 10:13:39', NULL),
(583, 'error_bodies_ARRAY_AV03', 'arrays', 'error_bodies_ARRAY_AV03', 'script', '2019-09-06 10:13:39', NULL),
(584, 'error_bodies_ARRAY_AV04', 'arrays', 'error_bodies_ARRAY_AV04', 'script', '2019-09-06 10:13:39', NULL),
(585, 'error_bodies_ARRAY_AV05', 'arrays', 'error_bodies_ARRAY_AV05', 'script', '2019-09-06 10:13:39', NULL),
(586, 'error_bodies_ARRAY_AV06', 'arrays', 'error_bodies_ARRAY_AV06', 'script', '2019-09-06 10:13:39', NULL),
(587, 'error_bodies_ARRAY_AV08', 'arrays', 'error_bodies_ARRAY_AV08', 'script', '2019-09-06 10:13:39', NULL),
(588, 'error_bodies_ARRAY_AV09', 'arrays', 'error_bodies_ARRAY_AV09', 'script', '2019-09-06 10:13:39', NULL),
(589, 'error_bodies_ARRAY_AV10', 'arrays', 'error_bodies_ARRAY_AV10', 'script', '2019-09-06 10:13:39', NULL),
(590, 'error_bodies_ARRAY_AV11', 'arrays', 'error_bodies_ARRAY_AV11', 'script', '2019-09-06 10:13:39', NULL),
(591, 'error_bodies_ARRAY_AV12', 'arrays', 'error_bodies_ARRAY_AV12', 'script', '2019-09-06 10:13:39', NULL),
(592, 'error_titles_ARRAY_AA10', 'arrays', 'error_titles_ARRAY_AA10', 'script', '2019-09-06 10:13:39', NULL),
(593, 'error_titles_ARRAY_AA11', 'arrays', 'error_titles_ARRAY_AA11', 'script', '2019-09-06 10:13:39', NULL),
(594, 'error_titles_ARRAY_AA12', 'arrays', 'error_titles_ARRAY_AA12', 'script', '2019-09-06 10:13:39', NULL),
(595, 'error_titles_ARRAY_AA13', 'arrays', 'error_titles_ARRAY_AA13', 'script', '2019-09-06 10:13:39', NULL),
(596, 'error_titles_ARRAY_AB01', 'arrays', 'error_titles_ARRAY_AB01', 'script', '2019-09-06 10:13:39', NULL),
(597, 'error_titles_ARRAY_AB02', 'arrays', 'error_titles_ARRAY_AB02', 'script', '2019-09-06 10:13:39', NULL),
(598, 'error_titles_ARRAY_AB03', 'arrays', 'error_titles_ARRAY_AB03', 'script', '2019-09-06 10:13:39', NULL),
(599, 'error_titles_ARRAY_AB04', 'arrays', 'error_titles_ARRAY_AB04', 'script', '2019-09-06 10:13:39', NULL),
(600, 'error_titles_ARRAY_AE01', 'arrays', 'error_titles_ARRAY_AE01', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(601, 'error_titles_ARRAY_AE03', 'arrays', 'error_titles_ARRAY_AE03', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(602, 'error_titles_ARRAY_AE04', 'arrays', 'error_titles_ARRAY_AE04', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(603, 'error_titles_ARRAY_AE05', 'arrays', 'error_titles_ARRAY_AE05', 'script', '2019-09-06 10:13:39', NULL),
(604, 'error_titles_ARRAY_AE06', 'arrays', 'error_titles_ARRAY_AE06', 'script', '2019-09-06 10:13:39', NULL),
(605, 'error_titles_ARRAY_AE08', 'arrays', 'error_titles_ARRAY_AE08', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(606, 'error_titles_ARRAY_AE09', 'arrays', 'error_titles_ARRAY_AE09', 'script', '2019-09-06 10:13:39', NULL),
(607, 'error_titles_ARRAY_AE10', 'arrays', 'error_titles_ARRAY_AE10', 'script', '2019-09-06 10:13:39', NULL),
(608, 'error_titles_ARRAY_AE11', 'arrays', 'error_titles_ARRAY_AE11', 'script', '2019-09-06 10:13:39', NULL),
(609, 'error_titles_ARRAY_AE12', 'arrays', 'error_titles_ARRAY_AE12', 'script', '2019-09-06 10:13:39', NULL),
(610, 'error_titles_ARRAY_AE13', 'arrays', 'error_titles_ARRAY_AE13', 'script', '2019-09-06 10:13:39', NULL),
(611, 'error_titles_ARRAY_AO01', 'arrays', 'error_titles_ARRAY_AO01', 'script', '2019-09-06 10:13:39', NULL),
(612, 'error_titles_ARRAY_AO02', 'arrays', 'error_titles_ARRAY_AO02', 'script', '2019-09-06 10:13:39', NULL),
(613, 'error_titles_ARRAY_AO03', 'arrays', 'error_titles_ARRAY_AO03', 'script', '2019-09-06 10:13:39', NULL),
(614, 'error_titles_ARRAY_AO04', 'arrays', 'error_titles_ARRAY_AO04', 'script', '2019-09-06 10:13:39', NULL),
(615, 'error_titles_ARRAY_AO05', 'arrays', 'error_titles_ARRAY_AO05', 'script', '2019-09-06 10:13:39', NULL),
(616, 'error_titles_ARRAY_AO06', 'arrays', 'error_titles_ARRAY_AO06', 'script', '2019-09-06 10:13:39', NULL),
(617, 'error_titles_ARRAY_AO07', 'arrays', 'error_titles_ARRAY_AO07', 'script', '2019-09-06 10:13:39', NULL),
(618, 'error_titles_ARRAY_AR01', 'arrays', 'error_titles_ARRAY_AR01', 'script', '2019-09-06 10:13:39', NULL),
(619, 'error_titles_ARRAY_AR03', 'arrays', 'error_titles_ARRAY_AR03', 'script', '2019-09-06 10:13:39', NULL),
(620, 'error_titles_ARRAY_AR04', 'arrays', 'error_titles_ARRAY_AR04', 'script', '2019-09-06 10:13:39', NULL),
(621, 'error_titles_ARRAY_AR08', 'arrays', 'error_titles_ARRAY_AR08', 'script', '2019-09-06 10:13:39', NULL),
(622, 'error_titles_ARRAY_AR10', 'arrays', 'error_titles_ARRAY_AR10', 'script', '2019-09-06 10:13:39', NULL),
(623, 'error_titles_ARRAY_AR21', 'arrays', 'error_titles_ARRAY_AR21', 'script', '2019-09-06 10:13:39', '2019-07-05 13:29:40'),
(624, 'error_titles_ARRAY_AU01', 'arrays', 'error_titles_ARRAY_AU01', 'script', '2019-09-06 10:13:39', NULL),
(625, 'error_titles_ARRAY_AU03', 'arrays', 'error_titles_ARRAY_AU03', 'script', '2019-09-06 10:13:39', NULL),
(626, 'error_titles_ARRAY_AU04', 'arrays', 'error_titles_ARRAY_AU04', 'script', '2019-09-06 10:13:39', NULL),
(627, 'error_titles_ARRAY_AU08', 'arrays', 'error_titles_ARRAY_AU08', 'script', '2019-09-06 10:13:39', NULL),
(628, 'error_titles_ARRAY_AV01', 'arrays', 'error_titles_ARRAY_AV01', 'script', '2019-09-06 10:13:39', NULL),
(629, 'error_titles_ARRAY_AV03', 'arrays', 'error_titles_ARRAY_AV03', 'script', '2019-09-06 10:13:39', NULL),
(630, 'error_titles_ARRAY_AV04', 'arrays', 'error_titles_ARRAY_AV04', 'script', '2019-09-06 10:13:39', NULL),
(631, 'error_titles_ARRAY_AV05', 'arrays', 'error_titles_ARRAY_AV05', 'script', '2019-09-06 10:13:39', NULL),
(632, 'error_titles_ARRAY_AV06', 'arrays', 'error_titles_ARRAY_AV06', 'script', '2019-09-06 10:13:39', NULL),
(633, 'error_titles_ARRAY_AV08', 'arrays', 'error_titles_ARRAY_AV08', 'script', '2019-09-06 10:13:39', NULL),
(634, 'error_titles_ARRAY_AV09', 'arrays', 'error_titles_ARRAY_AV09', 'script', '2019-09-06 10:13:39', NULL),
(635, 'error_titles_ARRAY_AV10', 'arrays', 'error_titles_ARRAY_AV10', 'script', '2019-09-06 10:13:39', NULL),
(636, 'error_titles_ARRAY_AV11', 'arrays', 'error_titles_ARRAY_AV11', 'script', '2019-09-06 10:13:39', NULL),
(637, 'error_titles_ARRAY_AV12', 'arrays', 'error_titles_ARRAY_AV12', 'script', '2019-09-06 10:13:39', NULL),
(638, 'export_formats_ARRAY_csv', 'arrays', 'export_formats_ARRAY_csv', 'script', '2019-09-06 10:13:39', NULL),
(639, 'export_formats_ARRAY_ical', 'arrays', 'export_formats_ARRAY_ical', 'script', '2019-09-06 10:13:39', NULL),
(640, 'export_formats_ARRAY_xml', 'arrays', 'export_formats_ARRAY_xml', 'script', '2019-09-06 10:13:39', NULL),
(641, 'export_periods_ARRAY_last', 'arrays', 'export_periods_ARRAY_last', 'script', '2019-09-06 10:13:39', NULL),
(642, 'export_periods_ARRAY_next', 'arrays', 'export_periods_ARRAY_next', 'script', '2019-09-06 10:13:39', NULL),
(643, 'export_types_ARRAY_feed', 'arrays', 'export_types_ARRAY_feed', 'script', '2019-09-06 10:13:39', NULL),
(644, 'export_types_ARRAY_file', 'arrays', 'export_types_ARRAY_file', 'script', '2019-09-06 10:13:39', NULL),
(645, 'filter_ARRAY_active', 'arrays', 'filter_ARRAY_active', 'script', '2019-09-06 10:13:39', NULL),
(646, 'filter_ARRAY_inactive', 'arrays', 'filter_ARRAY_inactive', 'script', '2019-09-06 10:13:39', NULL),
(647, 'front_booking_statuses_ARRAY_1', 'arrays', 'front_booking_statuses_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(648, 'front_booking_statuses_ARRAY_11', 'arrays', 'front_booking_statuses_ARRAY_11', 'script', '2019-09-06 10:13:39', NULL),
(649, 'front_err_ARRAY_empty', 'arrays', 'front_err_ARRAY_empty', 'script', '2019-09-06 10:13:39', NULL),
(650, 'front_err_ARRAY_enough', 'arrays', 'front_err_ARRAY_enough', 'script', '2019-09-06 10:13:39', NULL),
(651, 'front_err_ARRAY_not_enough', 'arrays', 'front_err_ARRAY_not_enough', 'script', '2019-09-06 10:13:39', NULL),
(652, 'front_err_ARRAY_no_tickets', 'arrays', 'front_err_ARRAY_no_tickets', 'script', '2019-09-06 10:13:39', NULL),
(653, 'front_guide_ARRAY_continue', 'arrays', 'front_guide_ARRAY_continue', 'script', '2019-09-06 10:13:39', NULL),
(654, 'front_guide_ARRAY_select_seats_for', 'arrays', 'front_guide_ARRAY_select_seats_for', 'script', '2019-09-06 10:13:39', NULL),
(655, 'front_guide_ARRAY_select_seat_for', 'arrays', 'front_guide_ARRAY_select_seat_for', 'script', '2019-09-06 10:13:39', NULL),
(656, 'login_err_ARRAY_1', 'arrays', 'login_err_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(657, 'login_err_ARRAY_2', 'arrays', 'login_err_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(658, 'login_err_ARRAY_3', 'arrays', 'login_err_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(659, 'made_arr_ARRAY_1', 'arrays', 'made_arr_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(660, 'made_arr_ARRAY_2', 'arrays', 'made_arr_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(661, 'made_arr_ARRAY_3', 'arrays', 'made_arr_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(662, 'made_arr_ARRAY_4', 'arrays', 'made_arr_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(663, 'made_arr_ARRAY_5', 'arrays', 'made_arr_ARRAY_5', 'script', '2019-09-06 10:13:39', NULL),
(664, 'made_arr_ARRAY_6', 'arrays', 'made_arr_ARRAY_6', 'script', '2019-09-06 10:13:39', NULL),
(665, 'months_ARRAY_1', 'arrays', 'months_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(666, 'months_ARRAY_10', 'arrays', 'months_ARRAY_10', 'script', '2019-09-06 10:13:39', NULL),
(667, 'months_ARRAY_11', 'arrays', 'months_ARRAY_11', 'script', '2019-09-06 10:13:39', NULL),
(668, 'months_ARRAY_12', 'arrays', 'months_ARRAY_12', 'script', '2019-09-06 10:13:39', NULL),
(669, 'months_ARRAY_2', 'arrays', 'months_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(670, 'months_ARRAY_3', 'arrays', 'months_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(671, 'months_ARRAY_4', 'arrays', 'months_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(672, 'months_ARRAY_5', 'arrays', 'months_ARRAY_5', 'script', '2019-09-06 10:13:39', NULL),
(673, 'months_ARRAY_6', 'arrays', 'months_ARRAY_6', 'script', '2019-09-06 10:13:39', NULL),
(674, 'months_ARRAY_7', 'arrays', 'months_ARRAY_7', 'script', '2019-09-06 10:13:39', NULL),
(675, 'months_ARRAY_8', 'arrays', 'months_ARRAY_8', 'script', '2019-09-06 10:13:39', NULL),
(676, 'months_ARRAY_9', 'arrays', 'months_ARRAY_9', 'script', '2019-09-06 10:13:39', NULL),
(677, 'option_themes_ARRAY_1', 'arrays', 'option_themes_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(678, 'option_themes_ARRAY_10', 'arrays', 'option_themes_ARRAY_10', 'script', '2019-09-06 10:13:39', NULL),
(679, 'option_themes_ARRAY_2', 'arrays', 'option_themes_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(680, 'option_themes_ARRAY_3', 'arrays', 'option_themes_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(681, 'option_themes_ARRAY_4', 'arrays', 'option_themes_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(682, 'option_themes_ARRAY_5', 'arrays', 'option_themes_ARRAY_5', 'script', '2019-09-06 10:13:39', NULL),
(683, 'option_themes_ARRAY_6', 'arrays', 'option_themes_ARRAY_6', 'script', '2019-09-06 10:13:39', NULL),
(684, 'option_themes_ARRAY_7', 'arrays', 'option_themes_ARRAY_7', 'script', '2019-09-06 10:13:39', NULL),
(685, 'option_themes_ARRAY_8', 'arrays', 'option_themes_ARRAY_8', 'script', '2019-09-06 10:13:39', NULL),
(686, 'option_themes_ARRAY_9', 'arrays', 'option_themes_ARRAY_9', 'script', '2019-09-06 10:13:39', NULL),
(687, 'payment_methods_ARRAY_authorize', 'arrays', 'payment_methods_ARRAY_authorize', 'script', '2019-09-06 10:13:39', NULL),
(688, 'payment_methods_ARRAY_bank', 'arrays', 'payment_methods_ARRAY_bank', 'script', '2019-09-06 10:13:39', NULL),
(689, 'payment_methods_ARRAY_cash', 'arrays', 'payment_methods_ARRAY_cash', 'script', '2019-09-06 10:13:39', NULL),
(690, 'payment_methods_ARRAY_creditcard', 'arrays', 'payment_methods_ARRAY_creditcard', 'script', '2019-09-06 10:13:39', NULL),
(691, 'payment_methods_ARRAY_paypal', 'arrays', 'payment_methods_ARRAY_paypal', 'script', '2019-09-06 10:13:39', NULL),
(692, 'personal_titles_ARRAY_dr', 'arrays', 'personal_titles_ARRAY_dr', 'script', '2019-09-06 10:13:39', NULL),
(693, 'personal_titles_ARRAY_miss', 'arrays', 'personal_titles_ARRAY_miss', 'script', '2019-09-06 10:13:39', NULL),
(694, 'personal_titles_ARRAY_mr', 'arrays', 'personal_titles_ARRAY_mr', 'script', '2019-09-06 10:13:39', NULL),
(695, 'personal_titles_ARRAY_mrs', 'arrays', 'personal_titles_ARRAY_mrs', 'script', '2019-09-06 10:13:39', NULL),
(696, 'personal_titles_ARRAY_ms', 'arrays', 'personal_titles_ARRAY_ms', 'script', '2019-09-06 10:13:39', NULL),
(697, 'personal_titles_ARRAY_other', 'arrays', 'personal_titles_ARRAY_other', 'script', '2019-09-06 10:13:39', NULL),
(698, 'personal_titles_ARRAY_prof', 'arrays', 'personal_titles_ARRAY_prof', 'script', '2019-09-06 10:13:39', NULL),
(699, 'personal_titles_ARRAY_rev', 'arrays', 'personal_titles_ARRAY_rev', 'script', '2019-09-06 10:13:39', NULL),
(700, 'short_days_ARRAY_0', 'arrays', 'short_days_ARRAY_0', 'script', '2019-09-06 10:13:39', NULL),
(701, 'short_days_ARRAY_1', 'arrays', 'short_days_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(702, 'short_days_ARRAY_2', 'arrays', 'short_days_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(703, 'short_days_ARRAY_3', 'arrays', 'short_days_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(704, 'short_days_ARRAY_4', 'arrays', 'short_days_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(705, 'short_days_ARRAY_5', 'arrays', 'short_days_ARRAY_5', 'script', '2019-09-06 10:13:39', NULL),
(706, 'short_days_ARRAY_6', 'arrays', 'short_days_ARRAY_6', 'script', '2019-09-06 10:13:39', NULL),
(707, 'short_months_ARRAY_1', 'arrays', 'short_months_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(708, 'short_months_ARRAY_10', 'arrays', 'short_months_ARRAY_10', 'script', '2019-09-06 10:13:39', NULL),
(709, 'short_months_ARRAY_11', 'arrays', 'short_months_ARRAY_11', 'script', '2019-09-06 10:13:39', NULL),
(710, 'short_months_ARRAY_12', 'arrays', 'short_months_ARRAY_12', 'script', '2019-09-06 10:13:39', NULL),
(711, 'short_months_ARRAY_2', 'arrays', 'short_months_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(712, 'short_months_ARRAY_3', 'arrays', 'short_months_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(713, 'short_months_ARRAY_4', 'arrays', 'short_months_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(714, 'short_months_ARRAY_5', 'arrays', 'short_months_ARRAY_5', 'script', '2019-09-06 10:13:39', NULL),
(715, 'short_months_ARRAY_6', 'arrays', 'short_months_ARRAY_6', 'script', '2019-09-06 10:13:39', NULL),
(716, 'short_months_ARRAY_7', 'arrays', 'short_months_ARRAY_7', 'script', '2019-09-06 10:13:39', NULL),
(717, 'short_months_ARRAY_8', 'arrays', 'short_months_ARRAY_8', 'script', '2019-09-06 10:13:39', NULL),
(718, 'short_months_ARRAY_9', 'arrays', 'short_months_ARRAY_9', 'script', '2019-09-06 10:13:39', NULL),
(719, 'status_ARRAY_1', 'arrays', 'status_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(720, 'status_ARRAY_123', 'arrays', 'status_ARRAY_123', 'script', '2019-09-06 10:13:39', NULL),
(721, 'status_ARRAY_2', 'arrays', 'status_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(722, 'status_ARRAY_3', 'arrays', 'status_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(723, 'status_ARRAY_7', 'arrays', 'status_ARRAY_7', 'script', '2019-09-06 10:13:39', NULL),
(724, 'status_ARRAY_996', 'arrays', 'status_ARRAY_996', 'script', '2019-09-06 10:13:39', NULL),
(725, 'status_ARRAY_997', 'arrays', 'status_ARRAY_997', 'script', '2019-09-06 10:13:39', NULL),
(726, 'status_ARRAY_998', 'arrays', 'status_ARRAY_998', 'script', '2019-09-06 10:13:39', NULL),
(727, 'status_ARRAY_999', 'arrays', 'status_ARRAY_999', 'script', '2019-09-06 10:13:39', NULL),
(728, 'status_ARRAY_9997', 'arrays', 'status_ARRAY_9997', 'script', '2019-09-06 10:13:39', NULL),
(729, 'status_ARRAY_9998', 'arrays', 'status_ARRAY_9998', 'script', '2019-09-06 10:13:39', NULL),
(730, 'status_ARRAY_9999', 'arrays', 'status_ARRAY_9999', 'script', '2019-09-06 10:13:39', NULL),
(731, 'ticket_statuses_ARRAY_1', 'arrays', 'ticket_statuses_ARRAY_1', 'script', '2019-09-06 10:13:39', NULL),
(732, 'ticket_statuses_ARRAY_2', 'arrays', 'ticket_statuses_ARRAY_2', 'script', '2019-09-06 10:13:39', NULL),
(733, 'ticket_statuses_ARRAY_3', 'arrays', 'ticket_statuses_ARRAY_3', 'script', '2019-09-06 10:13:39', NULL),
(734, 'ticket_statuses_ARRAY_4', 'arrays', 'ticket_statuses_ARRAY_4', 'script', '2019-09-06 10:13:39', NULL),
(735, 'timezones_ARRAY_-10800', 'arrays', 'timezones_ARRAY_-10800', 'script', '2019-09-06 10:13:39', NULL),
(736, 'timezones_ARRAY_-14400', 'arrays', 'timezones_ARRAY_-14400', 'script', '2019-09-06 10:13:39', NULL),
(737, 'timezones_ARRAY_-18000', 'arrays', 'timezones_ARRAY_-18000', 'script', '2019-09-06 10:13:39', NULL),
(738, 'timezones_ARRAY_-21600', 'arrays', 'timezones_ARRAY_-21600', 'script', '2019-09-06 10:13:39', NULL),
(739, 'timezones_ARRAY_-25200', 'arrays', 'timezones_ARRAY_-25200', 'script', '2019-09-06 10:13:39', NULL),
(740, 'timezones_ARRAY_-28800', 'arrays', 'timezones_ARRAY_-28800', 'script', '2019-09-06 10:13:39', NULL),
(741, 'timezones_ARRAY_-32400', 'arrays', 'timezones_ARRAY_-32400', 'script', '2019-09-06 10:13:39', NULL),
(742, 'timezones_ARRAY_-3600', 'arrays', 'timezones_ARRAY_-3600', 'script', '2019-09-06 10:13:39', NULL),
(743, 'timezones_ARRAY_-36000', 'arrays', 'timezones_ARRAY_-36000', 'script', '2019-09-06 10:13:39', NULL),
(744, 'timezones_ARRAY_-39600', 'arrays', 'timezones_ARRAY_-39600', 'script', '2019-09-06 10:13:39', NULL),
(745, 'timezones_ARRAY_-43200', 'arrays', 'timezones_ARRAY_-43200', 'script', '2019-09-06 10:13:39', NULL),
(746, 'timezones_ARRAY_-7200', 'arrays', 'timezones_ARRAY_-7200', 'script', '2019-09-06 10:13:39', NULL),
(747, 'timezones_ARRAY_0', 'arrays', 'timezones_ARRAY_0', 'script', '2019-09-06 10:13:39', NULL),
(748, 'timezones_ARRAY_10800', 'arrays', 'timezones_ARRAY_10800', 'script', '2019-09-06 10:13:39', NULL),
(749, 'timezones_ARRAY_14400', 'arrays', 'timezones_ARRAY_14400', 'script', '2019-09-06 10:13:39', NULL),
(750, 'timezones_ARRAY_18000', 'arrays', 'timezones_ARRAY_18000', 'script', '2019-09-06 10:13:39', NULL),
(751, 'timezones_ARRAY_21600', 'arrays', 'timezones_ARRAY_21600', 'script', '2019-09-06 10:13:39', NULL),
(752, 'timezones_ARRAY_25200', 'arrays', 'timezones_ARRAY_25200', 'script', '2019-09-06 10:13:39', NULL),
(753, 'timezones_ARRAY_28800', 'arrays', 'timezones_ARRAY_28800', 'script', '2019-09-06 10:13:39', NULL),
(754, 'timezones_ARRAY_32400', 'arrays', 'timezones_ARRAY_32400', 'script', '2019-09-06 10:13:39', NULL),
(755, 'timezones_ARRAY_3600', 'arrays', 'timezones_ARRAY_3600', 'script', '2019-09-06 10:13:39', NULL),
(756, 'timezones_ARRAY_36000', 'arrays', 'timezones_ARRAY_36000', 'script', '2019-09-06 10:13:39', NULL),
(757, 'timezones_ARRAY_39600', 'arrays', 'timezones_ARRAY_39600', 'script', '2019-09-06 10:13:39', NULL),
(758, 'timezones_ARRAY_43200', 'arrays', 'timezones_ARRAY_43200', 'script', '2019-09-06 10:13:39', NULL),
(759, 'timezones_ARRAY_46800', 'arrays', 'timezones_ARRAY_46800', 'script', '2019-09-06 10:13:39', NULL),
(760, 'timezones_ARRAY_7200', 'arrays', 'timezones_ARRAY_7200', 'script', '2019-09-06 10:13:39', NULL),
(761, 'u_statarr_ARRAY_F', 'arrays', 'u_statarr_ARRAY_F', 'script', '2019-09-06 10:13:39', NULL),
(762, 'u_statarr_ARRAY_T', 'arrays', 'u_statarr_ARRAY_T', 'script', '2019-09-06 10:13:39', NULL),
(763, 'validate_ARRAY_address', 'arrays', 'validate_ARRAY_address', 'script', '2019-09-06 10:13:39', NULL),
(764, 'validate_ARRAY_captcha', 'arrays', 'validate_ARRAY_captcha', 'script', '2019-09-06 10:13:39', NULL),
(765, 'validate_ARRAY_captcha_wrong', 'arrays', 'validate_ARRAY_captcha_wrong', 'script', '2019-09-06 10:13:39', NULL),
(766, 'validate_ARRAY_cc_code', 'arrays', 'validate_ARRAY_cc_code', 'script', '2019-09-06 10:13:39', '2015-12-24 06:28:40'),
(767, 'validate_ARRAY_cc_number', 'arrays', 'validate_ARRAY_cc_number', 'script', '2019-09-06 10:13:39', '2015-12-24 06:29:14'),
(768, 'validate_ARRAY_cc_type', 'arrays', 'validate_ARRAY_cc_type', 'script', '2019-09-06 10:13:39', '2015-12-24 06:29:47'),
(769, 'validate_ARRAY_city', 'arrays', 'validate_ARRAY_city', 'script', '2019-09-06 10:13:39', NULL),
(770, 'validate_ARRAY_company', 'arrays', 'validate_ARRAY_company', 'script', '2019-09-06 10:13:39', NULL),
(771, 'validate_ARRAY_country', 'arrays', 'validate_ARRAY_country', 'script', '2019-09-06 10:13:39', NULL),
(772, 'validate_ARRAY_email', 'arrays', 'validate_ARRAY_email', 'script', '2019-09-06 10:13:39', NULL),
(773, 'validate_ARRAY_email_invalid', 'arrays', 'validate_ARRAY_email_invalid', 'script', '2019-09-06 10:13:39', NULL),
(774, 'validate_ARRAY_name', 'arrays', 'validate_ARRAY_name', 'script', '2019-09-06 10:13:39', NULL),
(775, 'validate_ARRAY_notes', 'arrays', 'validate_ARRAY_notes', 'script', '2019-09-06 10:13:39', NULL),
(776, 'validate_ARRAY_payment_method', 'arrays', 'validate_ARRAY_payment_method', 'script', '2019-09-06 10:13:39', '2015-12-24 06:31:12'),
(777, 'validate_ARRAY_phone', 'arrays', 'validate_ARRAY_phone', 'script', '2019-09-06 10:13:39', NULL),
(778, 'validate_ARRAY_state', 'arrays', 'validate_ARRAY_state', 'script', '2019-09-06 10:13:39', NULL),
(779, 'validate_ARRAY_terms', 'arrays', 'validate_ARRAY_terms', 'script', '2019-09-06 10:13:39', NULL),
(780, 'validate_ARRAY_title', 'arrays', 'validate_ARRAY_title', 'script', '2019-09-06 10:13:39', NULL),
(781, 'validate_ARRAY_zip', 'arrays', 'validate_ARRAY_zip', 'script', '2019-09-06 10:13:39', NULL),
(782, '_yesno_ARRAY_F', 'arrays', '_yesno_ARRAY_F', 'script', '2019-09-06 10:13:39', NULL),
(783, '_yesno_ARRAY_T', 'arrays', '_yesno_ARRAY_T', 'script', '2019-09-06 10:13:39', NULL),
(784, 'plugin_locale_languages', 'backend', 'Locale plugin / Languages', 'plugin', '2019-09-06 10:13:39', NULL),
(785, 'plugin_locale_titles', 'backend', 'Locale plugin / Title', 'plugin', '2019-09-06 10:13:39', NULL),
(786, 'plugin_locale_index_title', 'backend', 'Locale plugin / Languages info title', 'plugin', '2019-09-06 10:13:39', NULL),
(787, 'plugin_locale_index_body', 'backend', 'Locale plugin / Languages info body', 'plugin', '2019-09-06 10:13:39', NULL),
(788, 'plugin_locale_titles_title', 'backend', 'Locale plugin / Titles info title', 'plugin', '2019-09-06 10:13:39', NULL),
(789, 'plugin_locale_titles_body', 'backend', 'Locale plugin / Titles info body', 'plugin', '2019-09-06 10:13:39', '2019-07-05 13:32:22'),
(790, 'plugin_locale_lbl_title', 'backend', 'Locale plugin / Title', 'plugin', '2019-09-06 10:13:39', NULL),
(791, 'plugin_locale_lbl_flag', 'backend', 'Locale plugin / Flag', 'plugin', '2019-09-06 10:13:39', NULL),
(792, 'plugin_locale_lbl_is_default', 'backend', 'Locale plugin / Is default', 'plugin', '2019-09-06 10:13:39', NULL),
(793, 'plugin_locale_lbl_order', 'backend', 'Locale plugin / Order', 'plugin', '2019-09-06 10:13:39', NULL),
(794, 'plugin_locale_add_lang', 'backend', 'Locale plugin / Add Language', 'plugin', '2019-09-06 10:13:39', NULL),
(795, 'plugin_locale_lbl_field', 'backend', 'Locale plugin / Field', 'plugin', '2019-09-06 10:13:39', NULL),
(796, 'plugin_locale_lbl_value', 'backend', 'Locale plugin / Value', 'plugin', '2019-09-06 10:13:39', NULL),
(797, 'plugin_locale_type_backend', 'backend', 'Locale plugin / Back-end title', 'plugin', '2019-09-06 10:13:39', NULL),
(798, 'plugin_locale_type_frontend', 'backend', 'Locale plugin / Front-end title', 'plugin', '2019-09-06 10:13:39', NULL),
(799, 'plugin_locale_type_arrays', 'backend', 'Locale plugin / Special title', 'plugin', '2019-09-06 10:13:39', NULL),
(800, 'error_titles_ARRAY_PAL01', 'arrays', 'Locale plugin / Status title', 'plugin', '2019-09-06 10:13:39', NULL),
(801, 'error_bodies_ARRAY_PAL01', 'arrays', 'Locale plugin / Status body', 'plugin', '2019-09-06 10:13:39', NULL),
(802, 'plugin_locale_lbl_rows', 'backend', 'Locale plugin / Per page', 'plugin', '2019-09-06 10:13:39', NULL),
(803, 'error_titles_ARRAY_PAL02', 'arrays', 'Locale plugin / Status title', 'plugin', '2019-09-06 10:13:39', NULL),
(804, 'error_bodies_ARRAY_PAL02', 'arrays', 'Locale plugin / Status body', 'plugin', '2019-09-06 10:13:39', NULL),
(805, 'error_titles_ARRAY_PAL03', 'arrays', 'Locale plugin / Status title', 'plugin', '2019-09-06 10:13:39', NULL),
(806, 'error_bodies_ARRAY_PAL03', 'arrays', 'Locale plugin / Status body', 'plugin', '2019-09-06 10:13:39', NULL),
(807, 'error_titles_ARRAY_PAL04', 'arrays', 'Locale plugin / Status title', 'plugin', '2019-09-06 10:13:39', NULL),
(808, 'error_bodies_ARRAY_PAL04', 'arrays', 'Locale plugin / Status body', 'plugin', '2019-09-06 10:13:39', NULL),
(809, 'error_titles_ARRAY_PAL05', 'arrays', 'Locale plugin / Status title', 'plugin', '2019-09-06 10:13:39', NULL),
(810, 'error_bodies_ARRAY_PAL05', 'arrays', 'Locale plugin / Status body', 'plugin', '2019-09-06 10:13:39', NULL),
(811, 'plugin_locale_import_export', 'backend', 'Locale plugin / Import Export menu', 'plugin', '2019-09-06 10:13:39', NULL),
(812, 'plugin_locale_import', 'backend', 'Locale plugin / Import', 'plugin', '2019-09-06 10:13:39', NULL),
(813, 'plugin_locale_export', 'backend', 'Locale plugin / Export', 'plugin', '2019-09-06 10:13:39', NULL),
(814, 'plugin_locale_browse', 'backend', 'Locale plugin / Browse your computer', 'plugin', '2019-09-06 10:13:39', NULL),
(815, 'plugin_locale_ie_title', 'backend', 'Locale plugin / Import Export (title)', 'plugin', '2019-09-06 10:13:39', NULL),
(816, 'plugin_locale_ie_body', 'backend', 'Locale plugin / Import Export (body)', 'plugin', '2019-09-06 10:13:39', NULL),
(817, 'plugin_locale_lbl_id', 'backend', 'Label / ID:', 'plugin', '2019-09-06 10:13:39', NULL),
(818, 'plugin_locale_lbl_show_id', 'backend', 'Label / Show ID in all titles to easily locate them', 'plugin', '2019-09-06 10:13:39', NULL),
(819, 'plugin_locale_separator', 'backend', 'Locale plugin / Delimiter', 'plugin', '2019-09-06 10:13:39', '2014-07-16 14:02:18'),
(820, 'plugin_locale_separators_ARRAY_comma', 'arrays', 'Locale plugin / Delimiter: comma', 'plugin', '2019-09-06 10:13:39', '2014-07-16 14:02:36'),
(821, 'plugin_locale_separators_ARRAY_semicolon', 'arrays', 'Locale plugin / Delimiter: semicolon', 'plugin', '2019-09-06 10:13:39', '2014-07-16 14:02:52'),
(822, 'plugin_locale_separators_ARRAY_tab', 'arrays', 'Locale plugin / Delimiter: tab', 'plugin', '2019-09-06 10:13:39', '2014-07-16 14:03:09'),
(823, 'error_bodies_ARRAY_PAL20', 'arrays', 'error_bodies_ARRAY_PAL20', 'plugin', '2019-09-06 10:13:39', '2014-07-21 07:54:40'),
(824, 'error_titles_ARRAY_PAL20', 'arrays', 'error_titles_ARRAY_PAL20', 'plugin', '2019-09-06 10:13:39', '2014-07-21 07:55:25'),
(825, 'error_titles_ARRAY_PAL11', 'arrays', 'error_titles_ARRAY_PAL11', 'plugin', '2019-09-06 10:13:39', '2014-07-21 07:58:06'),
(826, 'error_bodies_ARRAY_PAL11', 'arrays', 'error_bodies_ARRAY_PAL11', 'plugin', '2019-09-06 10:13:39', '2014-07-21 07:58:37'),
(827, 'error_titles_ARRAY_PAL12', 'arrays', 'error_titles_ARRAY_PAL12', 'plugin', '2019-09-06 10:13:39', '2014-07-21 07:59:00'),
(828, 'error_bodies_ARRAY_PAL12', 'arrays', 'error_bodies_ARRAY_PAL12', 'plugin', '2019-09-06 10:13:39', '2014-07-21 07:59:46'),
(829, 'error_titles_ARRAY_PAL13', 'arrays', 'error_titles_ARRAY_PAL13', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:00:05'),
(830, 'error_bodies_ARRAY_PAL13', 'arrays', 'error_bodies_ARRAY_PAL13', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:01:02'),
(831, 'error_titles_ARRAY_PAL14', 'arrays', 'error_titles_ARRAY_PAL14', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:01:15'),
(832, 'error_bodies_ARRAY_PAL14', 'arrays', 'error_bodies_ARRAY_PAL14', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:01:37'),
(833, 'error_titles_ARRAY_PAL15', 'arrays', 'error_titles_ARRAY_PAL15', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:01:51'),
(834, 'error_bodies_ARRAY_PAL15', 'arrays', 'error_bodies_ARRAY_PAL15', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:04:05'),
(835, 'error_titles_ARRAY_PAL16', 'arrays', 'error_titles_ARRAY_PAL16', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:04:13'),
(836, 'error_bodies_ARRAY_PAL16', 'arrays', 'error_bodies_ARRAY_PAL16', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:05:29'),
(837, 'error_titles_ARRAY_PAL17', 'arrays', 'error_titles_ARRAY_PAL17', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:06:10'),
(838, 'error_bodies_ARRAY_PAL17', 'arrays', 'error_bodies_ARRAY_PAL17', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:06:27'),
(839, 'error_titles_ARRAY_PAL18', 'arrays', 'error_titles_ARRAY_PAL18', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:26:34'),
(840, 'error_bodies_ARRAY_PAL18', 'arrays', 'error_bodies_ARRAY_PAL18', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:27:01'),
(841, 'error_titles_ARRAY_PAL19', 'arrays', 'error_titles_ARRAY_PAL19', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:27:15'),
(842, 'error_bodies_ARRAY_PAL19', 'arrays', 'error_bodies_ARRAY_PAL19', 'plugin', '2019-09-06 10:13:39', '2014-07-21 08:27:27'),
(843, 'plugin_locale_showid_dialog_title', 'backend', 'Label / Show IDs', 'plugin', '2019-09-06 10:13:39', NULL),
(844, 'plugin_locale_showid_dialog_desc', 'backend', 'Label / Show IDs', 'plugin', '2019-09-06 10:13:39', NULL),
(845, 'plugin_locale_button_confirm', 'backend', 'Button / Confirm', 'plugin', '2019-09-06 10:13:39', NULL),
(846, 'plugin_locale_button_cancel', 'backend', 'Button / Cancel', 'plugin', '2019-09-06 10:13:39', NULL),
(847, 'plugin_locale_default', 'backend', 'Label / default', 'plugin', '2019-09-06 10:13:39', NULL),
(848, 'plugin_locale_lbl_dir', 'backend', 'Locale plugin / Text direction', 'plugin', '2019-09-06 10:13:39', '2016-02-05 10:14:28'),
(849, 'plugin_locale_lbl_fend', 'backend', 'Locale plugin / Front-end title', 'plugin', '2019-09-06 10:13:39', '2016-02-05 10:17:06'),
(850, 'plugin_locale_dir_ARRAY_ltr', 'arrays', 'Locale plugin / Left to Right', 'plugin', '2019-09-06 10:13:39', '2016-02-05 10:54:19'),
(851, 'plugin_locale_dir_ARRAY_rtl', 'arrays', 'Locale plugin / Right to Left', 'plugin', '2019-09-06 10:13:39', '2016-02-05 10:54:34'),
(852, 'plugin_locale_flag_reset_title', 'backend', 'Locale plugin / Reset flag', 'plugin', '2019-09-06 10:13:39', '2016-02-05 14:24:57'),
(853, 'plugin_locale_flag_reset_content', 'backend', 'Locale plugin / Reset flag: confirmation', 'plugin', '2019-09-06 10:13:39', '2016-02-05 14:25:26'),
(854, 'plugin_locale_btn_reset', 'backend', 'Locale plugin / Button: Reset', 'plugin', '2019-09-06 10:13:39', '2016-02-05 14:27:33'),
(855, 'plugin_locale_tooltip_upload', 'backend', 'Locale plugin / Upload tooltip', 'plugin', '2019-09-06 10:13:39', '2016-02-05 14:32:44'),
(856, 'plugin_locale_tooltip_reset', 'backend', 'Locale plugin / Reset tooltip', 'plugin', '2019-09-06 10:13:39', '2016-02-05 14:32:59'),
(857, 'plugin_locale_lbl_language', 'backend', 'Locale plugin / Language', 'plugin', '2019-09-06 10:13:39', '2016-02-05 14:55:07'),
(858, 'plugin_locale_btn_close', 'backend', 'Locale plugin / Button: Close', 'plugin', '2019-09-06 10:13:39', '2016-03-07 13:10:40'),
(859, 'plugin_locale_flag_info_title', 'backend', 'Locale plugin / Info message', 'plugin', '2019-09-06 10:13:39', '2016-03-07 13:13:33'),
(860, 'plugin_locale_error_line', 'backend', 'Label / Error found at line', 'plugin', '2019-09-06 10:13:39', NULL),
(861, 'plugin_locale_reset_search', 'backend', 'Locale plugin / Reset search', 'plugin', '2019-09-06 10:13:39', '2016-08-23 09:48:29'),
(862, 'error_titles_ARRAY_PBU01', 'arrays', 'error_titles_ARRAY_PBU01', 'plugin', '2019-09-06 10:13:39', NULL),
(863, 'error_titles_ARRAY_PBU02', 'arrays', 'error_titles_ARRAY_PBU02', 'plugin', '2019-09-06 10:13:39', NULL),
(864, 'error_titles_ARRAY_PBU03', 'arrays', 'error_titles_ARRAY_PBU03', 'plugin', '2019-09-06 10:13:39', NULL),
(865, 'error_titles_ARRAY_PBU04', 'arrays', 'error_titles_ARRAY_PBU04', 'plugin', '2019-09-06 10:13:39', NULL),
(866, 'error_bodies_ARRAY_PBU01', 'arrays', 'error_bodies_ARRAY_PBU01', 'plugin', '2019-09-06 10:13:39', NULL),
(867, 'error_bodies_ARRAY_PBU02', 'arrays', 'error_bodies_ARRAY_PBU02', 'plugin', '2019-09-06 10:13:39', NULL),
(868, 'error_bodies_ARRAY_PBU03', 'arrays', 'error_bodies_ARRAY_PBU03', 'plugin', '2019-09-06 10:13:39', NULL),
(869, 'error_bodies_ARRAY_PBU04', 'arrays', 'error_bodies_ARRAY_PBU04', 'plugin', '2019-09-06 10:13:39', NULL),
(870, 'plugin_backup_menu_backup', 'backend', 'Backup plugin / Menu Backup', 'plugin', '2019-09-06 10:13:39', NULL),
(871, 'plugin_backup_database', 'backend', 'Backup plugin / Backup database', 'plugin', '2019-09-06 10:13:39', NULL),
(872, 'plugin_backup_files', 'backend', 'Backup plugin / Backup files', 'plugin', '2019-09-06 10:13:39', NULL),
(873, 'plugin_backup_btn_backup', 'backend', 'Backup plugin / Backup button', 'plugin', '2019-09-06 10:13:39', NULL),
(874, 'error_titles_ARRAY_PBU05', 'arrays', 'error_titles_ARRAY_PBU05', 'plugin', '2019-09-06 10:13:39', NULL),
(875, 'error_bodies_ARRAY_PBU05', 'arrays', 'error_bodies_ARRAY_PBU05', 'plugin', '2019-09-06 10:13:39', NULL),
(876, 'error_titles_ARRAY_PBU06', 'arrays', 'error_titles_ARRAY_PBU06', 'plugin', '2019-09-06 10:13:39', NULL),
(877, 'error_bodies_ARRAY_PBU06', 'arrays', 'error_bodies_ARRAY_PBU06', 'plugin', '2019-09-06 10:13:39', NULL),
(878, 'plugin_backup_datetime', 'backend', 'Label / Date/time', 'plugin', '2019-09-06 10:13:39', '2015-11-17 09:38:32'),
(879, 'plugin_backup_type', 'backend', 'Label / Type', 'plugin', '2019-09-06 10:13:39', '2015-11-17 09:38:57'),
(880, 'plugin_backup_file', 'backend', 'Label / File', 'plugin', '2019-09-06 10:13:39', '2015-11-17 09:39:15'),
(881, 'plugin_backup_delete_confirmation', 'backend', 'Backup plugin / Delete confirmation', 'plugin', '2019-09-06 10:13:39', '2015-11-17 09:40:22'),
(882, 'plugin_backup_delete_selected', 'backend', 'Backup plugin / Delete selected', 'plugin', '2019-09-06 10:13:39', '2015-11-17 09:41:00'),
(883, 'plugin_backup_size', 'backend', 'Plugin / Size', 'script', '2019-09-06 10:13:39', '2016-01-04 08:58:41'),
(884, 'plugin_backup_sizeXXXXXX', 'backend', 'Plugin / Size', 'script', '2019-09-06 10:13:39', '2016-01-04 08:58:41'),
(885, 'plugin_log_menu_log', 'backend', 'Log plugin / Menu Log', 'plugin', '2019-09-06 10:13:39', NULL),
(886, 'plugin_log_menu_config', 'backend', 'Log plugin / Menu Config', 'plugin', '2019-09-06 10:13:39', NULL),
(887, 'plugin_log_btn_empty', 'backend', 'Log plugin / Empty button', 'plugin', '2019-09-06 10:13:39', NULL),
(888, 'error_titles_ARRAY_PLG01', 'arrays', 'error_titles_ARRAY_PLG01', 'plugin', '2019-09-06 10:13:39', NULL),
(889, 'error_bodies_ARRAY_PLG01', 'arrays', 'error_bodies_ARRAY_PLG01', 'plugin', '2019-09-06 10:13:39', NULL),
(890, 'plugin_one_admin_menu_index', 'backend', 'One Admin plugin / List', 'plugin', '2019-09-06 10:13:39', NULL),
(891, 'plugin_one_admin_btn_add', 'backend', 'One Admin plugin / Add button', 'plugin', '2019-09-06 10:13:39', NULL),
(892, 'error_titles_ARRAY_POA01', 'arrays', 'error_titles_ARRAY_POA01', 'plugin', '2019-09-06 10:13:39', NULL),
(893, 'error_bodies_ARRAY_POA01', 'arrays', 'error_bodies_ARRAY_POA01', 'plugin', '2019-09-06 10:13:39', NULL),
(894, 'plugin_paypal_dt', 'backend', 'Paypal plugin / Date & Time', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:21:44'),
(895, 'plugin_paypal_mc_gross', 'backend', 'Paypal plugin / MC Gross', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:21:59'),
(896, 'plugin_paypal_mc_currency', 'backend', 'Paypal plugin / MC Currency', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:22:15'),
(897, 'plugin_paypal_payer_email', 'backend', 'Paypal plugin / Payer email', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:22:31'),
(898, 'plugin_paypal_txn_type', 'backend', 'Paypal plugin / Txn type', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:22:49'),
(899, 'plugin_paypal_txn_id', 'backend', 'Paypal plugin / Txn ID', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:22:58'),
(900, 'plugin_paypal_subscr_id', 'backend', 'Paypal plugin / Subscription ID', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:23:13'),
(901, 'plugin_paypal_foreign_id', 'backend', 'Paypal plugin / Foreign ID', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:23:25'),
(902, 'plugin_paypal_btn_close', 'backend', 'Paypal plugin / Close', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:27:07'),
(903, 'plugin_paypal_info_title', 'backend', 'Paypal plugin / Transaction details', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:30:48'),
(904, 'plugin_paypal_btn_view', 'backend', 'Paypal plugin / View', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:37:18'),
(905, 'plugin_paypal_menu_ipn', 'backend', 'Paypal plugin / IPN', 'plugin', '2019-09-06 10:13:39', '2014-07-18 14:53:47'),
(906, 'plugin_country_name', 'backend', 'Country plugin / Country name', 'plugin', '2019-09-06 10:13:39', NULL),
(907, 'plugin_country_alpha_2', 'backend', 'Country plugin / Alpha 2', 'plugin', '2019-09-06 10:13:39', NULL),
(908, 'plugin_country_alpha_3', 'backend', 'Country plugin / Alpha 3', 'plugin', '2019-09-06 10:13:39', NULL),
(909, 'plugin_country_status', 'backend', 'Country plugin / Status', 'plugin', '2019-09-06 10:13:39', NULL),
(910, 'plugin_country_btn_add', 'backend', 'Country plugin / Button Add', 'plugin', '2019-09-06 10:13:39', NULL),
(911, 'plugin_country_statuses_ARRAY_T', 'arrays', 'Country plugin / Status (active)', 'plugin', '2019-09-06 10:13:39', NULL),
(912, 'plugin_country_statuses_ARRAY_F', 'arrays', 'Country plugin / Status (inactive)', 'plugin', '2019-09-06 10:13:39', NULL),
(913, 'plugin_country_btn_save', 'backend', 'Country plugin / Button Save', 'plugin', '2019-09-06 10:13:39', NULL),
(914, 'plugin_country_btn_cancel', 'backend', 'Country plugin / Button Cancel', 'plugin', '2019-09-06 10:13:39', NULL),
(915, 'plugin_country_menu_countries', 'backend', 'Country plugin / Menu Countries', 'plugin', '2019-09-06 10:13:39', NULL),
(916, 'error_titles_ARRAY_PCY01', 'arrays', 'error_titles_ARRAY_PCY01', 'plugin', '2019-09-06 10:13:39', NULL),
(917, 'error_titles_ARRAY_PCY03', 'arrays', 'error_titles_ARRAY_PCY03', 'plugin', '2019-09-06 10:13:39', NULL),
(918, 'error_titles_ARRAY_PCY04', 'arrays', 'error_titles_ARRAY_PCY04', 'plugin', '2019-09-06 10:13:39', NULL),
(919, 'error_titles_ARRAY_PCY08', 'arrays', 'error_titles_ARRAY_PCY08', 'plugin', '2019-09-06 10:13:39', NULL),
(920, 'error_titles_ARRAY_PCY10', 'arrays', 'error_titles_ARRAY_PCY10', 'plugin', '2019-09-06 10:13:39', NULL),
(921, 'error_titles_ARRAY_PCY11', 'arrays', 'error_titles_ARRAY_PCY11', 'plugin', '2019-09-06 10:13:39', NULL),
(922, 'error_titles_ARRAY_PCY12', 'arrays', 'error_titles_ARRAY_PCY12', 'plugin', '2019-09-06 10:13:39', NULL),
(923, 'error_bodies_ARRAY_PCY01', 'arrays', 'error_bodies_ARRAY_PCY01', 'plugin', '2019-09-06 10:13:39', NULL),
(924, 'error_bodies_ARRAY_PCY03', 'arrays', 'error_bodies_ARRAY_PCY03', 'plugin', '2019-09-06 10:13:39', NULL),
(925, 'error_bodies_ARRAY_PCY04', 'arrays', 'error_bodies_ARRAY_PCY04', 'plugin', '2019-09-06 10:13:39', NULL),
(926, 'error_bodies_ARRAY_PCY08', 'arrays', 'error_bodies_ARRAY_PCY08', 'plugin', '2019-09-06 10:13:39', NULL),
(927, 'error_bodies_ARRAY_PCY10', 'arrays', 'error_bodies_ARRAY_PCY10', 'plugin', '2019-09-06 10:13:39', NULL),
(928, 'error_bodies_ARRAY_PCY11', 'arrays', 'error_bodies_ARRAY_PCY11', 'plugin', '2019-09-06 10:13:39', NULL),
(929, 'error_bodies_ARRAY_PCY12', 'arrays', 'error_bodies_ARRAY_PCY12', 'plugin', '2019-09-06 10:13:39', NULL),
(930, 'plugin_country_delete_confirmation', 'backend', 'Country plugin / Delete confirmation', 'plugin', '2019-09-06 10:13:39', NULL),
(931, 'plugin_country_delete_selected', 'backend', 'Country plugin / Delete selected', 'plugin', '2019-09-06 10:13:39', NULL),
(932, 'plugin_country_btn_all', 'backend', 'Country plugin / Button All', 'plugin', '2019-09-06 10:13:39', NULL),
(933, 'plugin_country_btn_search', 'backend', 'Country plugin / Button Search', 'plugin', '2019-09-06 10:13:39', NULL),
(934, 'plugin_country_revert_status', 'backend', 'Plugin / Revert status', 'script', '2019-09-06 10:13:39', NULL),
(935, 'plugin_invoice_menu_invoices', 'backend', 'Invoice plugin / Menu Invoices', 'plugin', '2019-09-06 10:13:39', NULL),
(936, 'plugin_invoice_config', 'backend', 'Invoice plugin / Invoice config', 'plugin', '2019-09-06 10:13:39', NULL),
(937, 'plugin_invoice_i_logo', 'backend', 'Invoice plugin / Company logo', 'plugin', '2019-09-06 10:13:39', NULL),
(938, 'plugin_invoice_i_company', 'backend', 'Invoice plugin / Company name', 'plugin', '2019-09-06 10:13:39', NULL),
(939, 'plugin_invoice_i_name', 'backend', 'Invoice plugin / Name', 'plugin', '2019-09-06 10:13:39', NULL),
(940, 'plugin_invoice_i_street_address', 'backend', 'Invoice plugin / Street address', 'plugin', '2019-09-06 10:13:39', NULL),
(941, 'plugin_invoice_i_city', 'backend', 'Invoice plugin / City', 'plugin', '2019-09-06 10:13:39', NULL),
(942, 'plugin_invoice_i_state', 'backend', 'Invoice plugin / State', 'plugin', '2019-09-06 10:13:39', NULL);
INSERT INTO `tk_cbs_fields` (`id`, `key`, `type`, `label`, `source`, `created_at`, `modified`) VALUES
(943, 'plugin_invoice_i_zip', 'backend', 'Invoice plugin / Zip', 'plugin', '2019-09-06 10:13:39', NULL),
(944, 'plugin_invoice_i_phone', 'backend', 'Invoice plugin / Phone', 'plugin', '2019-09-06 10:13:39', NULL),
(945, 'plugin_invoice_i_fax', 'backend', 'Invoice plugin / Fax', 'plugin', '2019-09-06 10:13:39', NULL),
(946, 'plugin_invoice_i_email', 'backend', 'Invoice plugin / Email', 'plugin', '2019-09-06 10:13:39', NULL),
(947, 'plugin_invoice_i_url', 'backend', 'Invoice plugin / Website', 'plugin', '2019-09-06 10:13:39', NULL),
(948, 'error_titles_ARRAY_PIN01', 'arrays', 'Invoice plugin / Info title', 'plugin', '2019-09-06 10:13:39', NULL),
(949, 'error_bodies_ARRAY_PIN01', 'arrays', 'Invoice plugin / Info body', 'plugin', '2019-09-06 10:13:39', NULL),
(950, 'error_titles_ARRAY_PIN02', 'arrays', 'Invoice plugin / Invoice config updated title', 'plugin', '2019-09-06 10:13:39', NULL),
(951, 'error_bodies_ARRAY_PIN02', 'arrays', 'Invoice plugin / Info body', 'plugin', '2019-09-06 10:13:39', NULL),
(952, 'error_titles_ARRAY_PIN03', 'arrays', 'Invoice plugin / Upload failed', 'plugin', '2019-09-06 10:13:39', NULL),
(953, 'plugin_invoice_template', 'backend', 'Invoice plugin / Invoice Template', 'plugin', '2019-09-06 10:13:39', NULL),
(954, 'plugin_invoice_delete_logo_title', 'backend', 'Invoice plugin / Delete logo title', 'plugin', '2019-09-06 10:13:39', NULL),
(955, 'plugin_invoice_delete_logo_body', 'backend', 'Invoice plugin / Delete logo body', 'plugin', '2019-09-06 10:13:39', NULL),
(956, 'plugin_invoice_billing_info', 'backend', 'Invoice plugin / Billing information', 'plugin', '2019-09-06 10:13:39', NULL),
(957, 'plugin_invoice_shipping_info', 'backend', 'Invoice plugin / Shipping information', 'plugin', '2019-09-06 10:13:39', NULL),
(958, 'plugin_invoice_company_info', 'backend', 'Invoice plugin / Company information', 'plugin', '2019-09-06 10:13:39', NULL),
(959, 'plugin_invoice_payment_info', 'backend', 'Invoice plugin / Payment information', 'plugin', '2019-09-06 10:13:39', NULL),
(960, 'plugin_invoice_i_address', 'backend', 'Invoice plugin / Address', 'plugin', '2019-09-06 10:13:39', NULL),
(961, 'plugin_invoice_i_billing_address', 'backend', 'Invoice plugin / Billing address', 'plugin', '2019-09-06 10:13:39', NULL),
(962, 'plugin_invoice_general_info', 'backend', 'Invoice plugin / General information', 'plugin', '2019-09-06 10:13:39', NULL),
(963, 'plugin_invoice_i_uuid', 'backend', 'Invoice plugin / Invoice no.', 'plugin', '2019-09-06 10:13:39', NULL),
(964, 'plugin_invoice_i_order_id', 'backend', 'Invoice plugin / Order no.', 'plugin', '2019-09-06 10:13:39', NULL),
(965, 'plugin_invoice_i_issue_date', 'backend', 'Invoice plugin / Issue date', 'plugin', '2019-09-06 10:13:39', NULL),
(966, 'plugin_invoice_i_due_date', 'backend', 'Invoice plugin / Due date', 'plugin', '2019-09-06 10:13:39', NULL),
(967, 'plugin_invoice_i_shipping_date', 'backend', 'Invoice plugin / Shipping date', 'plugin', '2019-09-06 10:13:39', NULL),
(968, 'plugin_invoice_i_shipping_terms', 'backend', 'Invoice plugin / Shipping terms', 'plugin', '2019-09-06 10:13:39', NULL),
(969, 'plugin_invoice_i_subtotal', 'backend', 'Invoice plugin / Subtotal', 'plugin', '2019-09-06 10:13:39', NULL),
(970, 'plugin_invoice_i_discount', 'backend', 'Invoice plugin / Discount', 'plugin', '2019-09-06 10:13:39', NULL),
(971, 'plugin_invoice_i_tax', 'backend', 'Invoice plugin / Tax', 'plugin', '2019-09-06 10:13:39', NULL),
(972, 'plugin_invoice_i_shipping', 'backend', 'Invoice plugin / Tax', 'plugin', '2019-09-06 10:13:39', NULL),
(973, 'plugin_invoice_i_total', 'backend', 'Invoice plugin / Total', 'plugin', '2019-09-06 10:13:39', NULL),
(974, 'plugin_invoice_i_paid_deposit', 'backend', 'Invoice plugin / Paid deposit', 'plugin', '2019-09-06 10:13:39', NULL),
(975, 'plugin_invoice_i_amount_due', 'backend', 'Invoice plugin / Amount due', 'plugin', '2019-09-06 10:13:39', NULL),
(976, 'plugin_invoice_i_currency', 'backend', 'Invoice plugin / Currency', 'plugin', '2019-09-06 10:13:39', NULL),
(977, 'plugin_invoice_i_notes', 'backend', 'Invoice plugin / Notes', 'plugin', '2019-09-06 10:13:39', NULL),
(978, 'plugin_invoice_i_shipping_address', 'backend', 'Invoice plugin / Shipping address', 'plugin', '2019-09-06 10:13:39', NULL),
(979, 'plugin_invoice_i_created', 'backend', 'Invoice plugin / Created', 'plugin', '2019-09-06 10:13:39', NULL),
(980, 'plugin_invoice_i_modified', 'backend', 'Invoice plugin / Modified', 'plugin', '2019-09-06 10:13:39', NULL),
(981, 'plugin_invoice_i_item', 'backend', 'Invoice plugin / Item', 'plugin', '2019-09-06 10:13:39', NULL),
(982, 'plugin_invoice_i_qty', 'backend', 'Invoice plugin / Qty', 'plugin', '2019-09-06 10:13:39', NULL),
(983, 'plugin_invoice_i_unit', 'backend', 'Invoice plugin / Unit price', 'plugin', '2019-09-06 10:13:39', NULL),
(984, 'plugin_invoice_i_amount', 'backend', 'Invoice plugin / Amount', 'plugin', '2019-09-06 10:13:39', NULL),
(985, 'plugin_invoice_add_item_title', 'backend', 'Invoice plugin / Add item title', 'plugin', '2019-09-06 10:13:39', NULL),
(986, 'plugin_invoice_edit_item_title', 'backend', 'Invoice plugin / Update item title', 'plugin', '2019-09-06 10:13:39', NULL),
(987, 'plugin_invoice_i_description', 'backend', 'Invoice plugin / Description', 'plugin', '2019-09-06 10:13:39', NULL),
(988, 'plugin_invoice_i_accept_payments', 'backend', 'Invoice plugin / Accept payments', 'plugin', '2019-09-06 10:13:39', NULL),
(989, 'plugin_invoice_print', 'backend', 'Invoice plugin / Print invoice', 'plugin', '2019-09-06 10:13:39', NULL),
(990, 'plugin_invoice_send', 'backend', 'Invoice plugin / Send invoice', 'plugin', '2019-09-06 10:13:39', NULL),
(991, 'plugin_invoice_view', 'backend', 'Invoice plugin / View invoice', 'plugin', '2019-09-06 10:13:39', NULL),
(992, 'plugin_invoice_send_invoice_title', 'backend', 'Invoice plugin / Send invoice dialog title', 'plugin', '2019-09-06 10:13:39', NULL),
(993, 'plugin_invoice_send_subject', 'backend', 'Invoice plugin / Send invoice subject', 'plugin', '2019-09-06 10:13:39', NULL),
(994, 'plugin_invoice_items_info', 'backend', 'Invoice plugin / Items information', 'plugin', '2019-09-06 10:13:39', NULL),
(995, 'plugin_invoice_i_accept_paypal', 'backend', 'Invoice plugin / Accept payments with PayPal', 'plugin', '2019-09-06 10:13:39', NULL),
(996, 'plugin_invoice_i_accept_authorize', 'backend', 'Invoice plugin / Accept payments with Authorize.NET', 'plugin', '2019-09-06 10:13:39', NULL),
(997, 'plugin_invoice_i_accept_creditcard', 'backend', 'Invoice plugin / Accept payments with Credit Card', 'plugin', '2019-09-06 10:13:39', NULL),
(998, 'plugin_invoice_i_accept_bank', 'backend', 'Invoice plugin / Accept payments with Bank Account', 'plugin', '2019-09-06 10:13:39', NULL),
(999, 'plugin_invoice_i_s_include', 'backend', 'Invoice plugin / Include Shipping information', 'plugin', '2019-09-06 10:13:39', NULL),
(1000, 'plugin_invoice_i_s_shipping_address', 'backend', 'Invoice plugin / Include Shipping address', 'plugin', '2019-09-06 10:13:39', NULL),
(1001, 'plugin_invoice_i_s_company', 'backend', 'Invoice plugin / Include Company', 'plugin', '2019-09-06 10:13:39', NULL),
(1002, 'plugin_invoice_i_s_name', 'backend', 'Invoice plugin / Include Name', 'plugin', '2019-09-06 10:13:39', NULL),
(1003, 'plugin_invoice_i_s_address', 'backend', 'Invoice plugin / Include Address', 'plugin', '2019-09-06 10:13:39', NULL),
(1004, 'plugin_invoice_i_s_city', 'backend', 'Invoice plugin / Include City', 'plugin', '2019-09-06 10:13:39', NULL),
(1005, 'plugin_invoice_i_s_state', 'backend', 'Invoice plugin / Include State', 'plugin', '2019-09-06 10:13:39', NULL),
(1006, 'plugin_invoice_i_s_zip', 'backend', 'Invoice plugin / Include Zip', 'plugin', '2019-09-06 10:13:39', NULL),
(1007, 'plugin_invoice_i_s_phone', 'backend', 'Invoice plugin / Include Phone', 'plugin', '2019-09-06 10:13:39', NULL),
(1008, 'plugin_invoice_i_s_fax', 'backend', 'Invoice plugin / Include Fax', 'plugin', '2019-09-06 10:13:39', NULL),
(1009, 'plugin_invoice_i_s_email', 'backend', 'Invoice plugin / Include Email', 'plugin', '2019-09-06 10:13:39', NULL),
(1010, 'plugin_invoice_i_s_url', 'backend', 'Invoice plugin / Include Website', 'plugin', '2019-09-06 10:13:39', NULL),
(1011, 'plugin_invoice_i_s_street_address', 'backend', 'Invoice plugin / Include Street address', 'plugin', '2019-09-06 10:13:39', NULL),
(1012, 'error_titles_ARRAY_PIN05', 'arrays', 'Invoice plugin / Invoice updated title', 'plugin', '2019-09-06 10:13:39', NULL),
(1013, 'error_bodies_ARRAY_PIN05', 'arrays', 'Invoice plugin / Invoice updated body', 'plugin', '2019-09-06 10:13:39', NULL),
(1014, 'error_titles_ARRAY_PIN04', 'arrays', 'Invoice plugin / Invoice Not Found title', 'plugin', '2019-09-06 10:13:39', NULL),
(1015, 'error_bodies_ARRAY_PIN04', 'arrays', 'Invoice plugin / Invoice Not Found body', 'plugin', '2019-09-06 10:13:39', NULL),
(1016, 'error_titles_ARRAY_PIN06', 'arrays', 'Invoice plugin / Invalid data title', 'plugin', '2019-09-06 10:13:39', NULL),
(1017, 'error_bodies_ARRAY_PIN06', 'arrays', 'Invoice plugin / Invalid data body', 'plugin', '2019-09-06 10:13:39', NULL),
(1018, 'plugin_invoice_i_status', 'backend', 'Invoice plugin / Status', 'plugin', '2019-09-06 10:13:39', NULL),
(1019, 'plugin_invoice_pay_with_paypal', 'backend', 'Invoice plugin / Pay with Paypal', 'plugin', '2019-09-06 10:13:39', NULL),
(1020, 'plugin_invoice_pay_with_authorize', 'backend', 'Invoice plugin / Pay with Authorize.Net', 'plugin', '2019-09-06 10:13:39', NULL),
(1021, 'plugin_invoice_pay_with_creditcard', 'backend', 'Invoice plugin / Pay with Credit Card', 'plugin', '2019-09-06 10:13:39', NULL),
(1022, 'plugin_invoice_pay_with_bank', 'backend', 'Invoice plugin / Pay with Bank Account', 'plugin', '2019-09-06 10:13:39', NULL),
(1023, 'plugin_invoice_pay_now', 'backend', 'Invoice plugin / Pay Now', 'plugin', '2019-09-06 10:13:39', NULL),
(1024, 'plugin_invoice_paypal_title', 'frontend', 'Invoice plugin / Paypal title', 'plugin', '2019-09-06 10:13:39', NULL),
(1025, 'plugin_invoice_authorize_title', 'frontend', 'Invoice plugin / Payment Authorize title', 'plugin', '2019-09-06 10:13:39', NULL),
(1026, 'plugin_invoice_i_paypal_address', 'backend', 'Invoice plugin / Paypal address', 'plugin', '2019-09-06 10:13:39', NULL),
(1027, 'plugin_invoice_i_authorize_tz', 'backend', 'Invoice plugin / Authorize.Net Timezone', 'plugin', '2019-09-06 10:13:39', NULL),
(1028, 'plugin_invoice_i_authorize_mid', 'backend', 'Invoice plugin / Authorize.Net Merchant ID', 'plugin', '2019-09-06 10:13:39', NULL),
(1029, 'plugin_invoice_i_authorize_key', 'backend', 'Invoice plugin / Authorize.Net Transaction Key', 'plugin', '2019-09-06 10:13:39', NULL),
(1030, 'plugin_invoice_i_bank_account', 'backend', 'Invoice plugin / Bank Account', 'plugin', '2019-09-06 10:13:39', NULL),
(1031, 'plugin_invoice_paypal_redirect', 'backend', 'Invoice plugin / Paypal redirect', 'plugin', '2019-09-06 10:13:39', NULL),
(1032, 'plugin_invoice_authorize_redirect', 'backend', 'Invoice plugin / Authorize.Net redirect', 'plugin', '2019-09-06 10:13:39', NULL),
(1033, 'plugin_invoice_paypal_proceed', 'backend', 'Invoice plugin / Paypal proceed button', 'plugin', '2019-09-06 10:13:39', NULL),
(1034, 'plugin_invoice_authorize_proceed', 'backend', 'Invoice plugin / Authorize.Net proceed button', 'plugin', '2019-09-06 10:13:39', NULL),
(1035, 'plugin_invoice_i_delete_title', 'backend', 'Invoice plugin / Delete title', 'plugin', '2019-09-06 10:13:39', NULL),
(1036, 'plugin_invoice_i_delete_body', 'backend', 'Invoice plugin / Delete body', 'plugin', '2019-09-06 10:13:39', NULL),
(1037, 'plugin_invoice_i_is_shipped', 'backend', 'Invoice plugin / Is shipped', 'plugin', '2019-09-06 10:13:39', NULL),
(1038, 'plugin_invoice_i_s_date', 'backend', 'Invoice plugin / Include Shipping date', 'plugin', '2019-09-06 10:13:39', NULL),
(1039, 'plugin_invoice_i_s_terms', 'backend', 'Invoice plugin / Include Shipping terms', 'plugin', '2019-09-06 10:13:39', NULL),
(1040, 'plugin_invoice_i_s_is_shipped', 'backend', 'Invoice plugin / Include Is Shipped', 'plugin', '2019-09-06 10:13:39', NULL),
(1041, 'plugin_invoice_statuses_ARRAY_not_paid', 'arrays', 'Invoice plugin / Status: Not Paid', 'plugin', '2019-09-06 10:13:39', NULL),
(1042, 'plugin_invoice_statuses_ARRAY_paid', 'arrays', 'Invoice plugin / Status: Paid', 'plugin', '2019-09-06 10:13:39', NULL),
(1043, 'plugin_invoice_statuses_ARRAY_cancelled', 'arrays', 'Invoice plugin / Status: Cancelled', 'plugin', '2019-09-06 10:13:39', NULL),
(1044, 'plugin_invoice_i_num', 'backend', 'Invoice plugin / No.', 'plugin', '2019-09-06 10:13:39', NULL),
(1045, 'plugin_invoice_add', 'backend', 'Invoice plugin / Add', 'plugin', '2019-09-06 10:13:39', NULL),
(1046, 'plugin_invoice_save', 'backend', 'Invoice plugin / Save', 'plugin', '2019-09-06 10:13:39', NULL),
(1047, 'plugin_invoice_i_booking_url', 'backend', 'Invoice plugin / Booking URL - Token: {ORDER_ID}', 'plugin', '2019-09-06 10:13:39', NULL),
(1048, 'plugin_invoice_i_s_shipping', 'backend', 'Invoice plugin / Include Shipping', 'plugin', '2019-09-06 10:13:39', NULL),
(1049, 'error_titles_ARRAY_PIN07', 'arrays', 'Invoice plugin / Invoice added title', 'plugin', '2019-09-06 10:13:39', NULL),
(1050, 'error_bodies_ARRAY_PIN07', 'arrays', 'Invoice plugin / Invoice added body', 'plugin', '2019-09-06 10:13:39', NULL),
(1051, 'error_titles_ARRAY_PIN08', 'arrays', 'Invoice plugin / Invoice failed to add title', 'plugin', '2019-09-06 10:13:39', NULL),
(1052, 'error_bodies_ARRAY_PIN08', 'arrays', 'Invoice plugin / Invoice failed to add body', 'plugin', '2019-09-06 10:13:39', NULL),
(1053, 'error_titles_ARRAY_PIN09', 'arrays', 'Invoice plugin / Invoice Send title', 'plugin', '2019-09-06 10:13:39', NULL),
(1054, 'error_bodies_ARRAY_PIN09', 'arrays', 'Invoice plugin / Invoice send body', 'plugin', '2019-09-06 10:13:39', NULL),
(1055, 'error_titles_ARRAY_PIN10', 'arrays', 'Invoice plugin / Invoice heading title', 'plugin', '2019-09-06 10:13:39', NULL),
(1056, 'error_bodies_ARRAY_PIN10', 'arrays', 'Invoice plugin / Invoice heading body', 'plugin', '2019-09-06 10:13:39', NULL),
(1057, 'error_titles_ARRAY_PIN11', 'arrays', 'Invoice plugin / Invoice billing title', 'plugin', '2019-09-06 10:13:39', NULL),
(1058, 'error_bodies_ARRAY_PIN11', 'arrays', 'Invoice plugin / Invoice billing body', 'plugin', '2019-09-06 10:13:39', NULL),
(1059, 'plugin_invoice_i_qty_is_int', 'backend', 'Invoice plugin / Quantity format', 'plugin', '2019-09-06 10:13:39', NULL),
(1060, 'plugin_invoice_i_qty_int', 'backend', 'Invoice plugin / Quantity INT instead of FLOAT', 'plugin', '2019-09-06 10:13:39', NULL),
(1061, 'plugin_invoice_i_authorize_hash', 'backend', 'Invoice plugin / Authorize.Net hash value', 'plugin', '2019-09-06 10:13:39', NULL),
(1062, 'plugin_invoice_i_accept_cash', 'backend', 'Invoice plugin / Allow cash payments', 'plugin', '2019-09-06 10:13:39', NULL),
(1063, 'plugin_invoice_i_use_shipping_details', 'backend', 'Invoice plugin / Use Shipping Details', 'plugin', '2019-09-06 10:13:39', NULL),
(1064, 'plugin_invoice_view_invoice', 'backend', 'Invoice plugin / View invoice', 'plugin', '2019-09-06 10:13:39', NULL),
(1065, 'plugin_invoice_print_invoice', 'backend', 'Invoice plugin / Print invoice', 'plugin', '2019-09-06 10:13:39', NULL),
(1066, 'plugin_invoice_i_company_information', 'backend', 'Invoice plugin / Company information', 'plugin', '2019-09-06 10:13:39', NULL),
(1067, 'plugin_invoice_i_invoice_config', 'backend', 'Invoice plugin / Invoice config', 'plugin', '2019-09-06 10:13:39', NULL),
(1068, 'plugin_invoice_i_invoice_template', 'backend', 'Invoice plugin / Invoice template', 'plugin', '2019-09-06 10:13:39', NULL),
(1069, 'plugin_invoice_i_details', 'backend', 'Invoice plugin / Details', 'plugin', '2019-09-06 10:13:39', NULL),
(1070, 'plugin_invoice_i_client', 'backend', 'Invoice plugin / Client', 'plugin', '2019-09-06 10:13:39', NULL),
(1071, 'plugin_invoice_i_invoice', 'backend', 'Invoice plugin / Invoice', 'plugin', '2019-09-06 10:13:39', NULL),
(1072, 'plugin_invoice_i_payment_method', 'backend', 'Invoice plugin / Payment method', 'plugin', '2019-09-06 10:13:39', NULL),
(1073, 'plugin_invoice_payment_methods_ARRAY_authorize', 'arrays', 'Invoice plugin / Payment method: Authorize.net', 'plugin', '2019-09-06 10:13:39', NULL),
(1074, 'plugin_invoice_payment_methods_ARRAY_bank', 'arrays', 'Invoice plugin / Payment method: Bank account', 'plugin', '2019-09-06 10:13:39', NULL),
(1075, 'plugin_invoice_payment_methods_ARRAY_creditcard', 'arrays', 'Invoice plugin / Payment method: Credit card', 'plugin', '2019-09-06 10:13:39', NULL),
(1076, 'plugin_invoice_payment_methods_ARRAY_paypal', 'arrays', 'Invoice plugin / Payment method: PayPal', 'plugin', '2019-09-06 10:13:39', NULL),
(1077, 'plugin_invoice_payment_methods_ARRAY_cash', 'arrays', 'Invoice plugin / Payment method: Cash', 'plugin', '2019-09-06 10:13:39', NULL),
(1078, 'plugin_invoice_i_option', 'backend', 'Invoice plugin / Option', 'plugin', '2019-09-06 10:13:39', NULL),
(1079, 'plugin_invoice_i_value', 'backend', 'Invoice plugin / Value', 'plugin', '2019-09-06 10:13:39', NULL),
(1080, 'plugin_invoice_pay_with_cash', 'backend', 'Invoice plugin / Pay with Cash', 'plugin', '2019-09-06 10:13:39', NULL),
(1081, 'plugin_invoice_i_cc_type', 'backend', 'Invoice plugin / CC Type', 'plugin', '2019-09-06 10:13:39', NULL),
(1082, 'plugin_invoice_i_cc_num', 'backend', 'Invoice plugin / CC Number', 'plugin', '2019-09-06 10:13:39', NULL),
(1083, 'plugin_invoice_i_cc_code', 'backend', 'Invoice plugin / CC Code', 'plugin', '2019-09-06 10:13:39', NULL),
(1084, 'plugin_invoice_i_cc_exp', 'backend', 'Invoice plugin / CC Expiration', 'plugin', '2019-09-06 10:13:39', NULL),
(1085, 'plugin_invoice_i_uuid_exists', 'backend', 'Invoice plugin / Invoice ID already exists.', 'plugin', '2019-09-06 10:13:39', NULL),
(1086, 'plugin_invoice_cc_types_ARRAY_Maestro', 'arrays', 'Invoice plugin / CC Types: Maestro', 'plugin', '2019-09-06 10:13:39', NULL),
(1087, 'plugin_invoice_cc_types_ARRAY_AmericanExpress', 'arrays', 'Invoice plugin / CC Types: AmericanExpress', 'plugin', '2019-09-06 10:13:39', NULL),
(1088, 'plugin_invoice_cc_types_ARRAY_MasterCard', 'arrays', 'Invoice plugin / CC Types: MasterCard', 'plugin', '2019-09-06 10:13:39', NULL),
(1089, 'plugin_invoice_cc_types_ARRAY_Visa', 'arrays', 'Invoice plugin / CC Types: Visa', 'plugin', '2019-09-06 10:13:39', NULL),
(1090, 'plugin_invoice_i_cc_details', 'backend', 'Invoice plugin / CC Details', 'plugin', '2019-09-06 10:13:39', NULL),
(1091, 'plugin_invoice_i_country', 'backend', 'Invoice plugin / Country', 'plugin', '2019-09-06 10:13:39', NULL),
(1092, 'plugin_invoice_i_use_qty_unit_price', 'backend', 'Invoice plugin / Use quantity and Unit price', 'plugin', '2019-09-06 10:13:39', NULL),
(1093, 'plugin_invoice_i_payment_confirm', 'backend', 'Invoice plugin / Payment confirm', 'plugin', '2019-09-06 10:13:39', NULL),
(1094, 'plugin_invoice_i_send_invoice_link', 'backend', 'Invoice plugin / Send invoice link', 'plugin', '2019-09-06 10:13:39', NULL),
(1095, 'plugin_invoice_yesno_ARRAY_1', 'arrays', 'Invoice plugin / Yes', 'plugin', '2019-09-06 10:13:39', NULL),
(1096, 'plugin_invoice_yesno_ARRAY_0', 'arrays', 'Invoice plugin / No', 'plugin', '2019-09-06 10:13:39', NULL),
(1097, 'error_titles_ARRAY_PIN12', 'arrays', 'Invoice plugin / Invoice billing title', 'plugin', '2019-09-06 10:13:39', NULL),
(1098, 'error_bodies_ARRAY_PIN12', 'arrays', 'Invoice plugin / Invoice billing body', 'plugin', '2019-09-06 10:13:39', NULL),
(1099, 'error_titles_ARRAY_PIN13', 'arrays', 'Invoice plugin / Invoice billing title', 'plugin', '2019-09-06 10:13:39', NULL),
(1100, 'error_bodies_ARRAY_PIN13', 'arrays', 'Invoice plugin / Invoice billing body', 'plugin', '2019-09-06 10:13:39', NULL),
(1101, 'error_titles_ARRAY_PIN14', 'arrays', 'Invoice plugin / Invoice config', 'plugin', '2019-09-06 10:13:39', NULL),
(1102, 'error_bodies_ARRAY_PIN14', 'arrays', 'Invoice plugin / Invoice billing body', 'plugin', '2019-09-06 10:13:39', NULL),
(1103, 'error_titles_ARRAY_PIN15', 'arrays', 'Invoice plugin / Invoice template', 'plugin', '2019-09-06 10:13:39', '2015-01-20 13:30:56'),
(1104, 'error_bodies_ARRAY_PIN15', 'arrays', 'Invoice plugin / Invoice billing body', 'plugin', '2019-09-06 10:13:39', '2015-01-20 13:42:25'),
(1105, 'plugin_invoice_email_invoice', 'backend', 'Plugin / Email invoice', 'script', '2019-09-06 10:13:39', '2016-01-04 06:47:39'),
(1106, 'plugin_invoice_status_required', 'backend', 'Invoice plugin / Status required', 'plugin', '2019-09-06 10:13:39', '2016-01-08 14:33:31'),
(1107, 'plugin_invoice_i_amount_paid', 'backend', 'Plugin / Amount paid', 'script', '2019-09-06 10:13:39', '2016-05-03 17:12:32'),
(1108, 'plugin_sms_menu_sms', 'backend', 'SMS plugin / Menu SMS', 'plugin', '2019-09-06 10:13:39', NULL),
(1109, 'plugin_sms_config', 'backend', 'SMS plugin / SMS config', 'plugin', '2019-09-06 10:13:39', NULL),
(1110, 'plugin_sms_number', 'backend', 'SMS plugin / Number', 'plugin', '2019-09-06 10:13:39', NULL),
(1111, 'plugin_sms_text', 'backend', 'SMS plugin / Text', 'plugin', '2019-09-06 10:13:39', NULL),
(1112, 'plugin_sms_status', 'backend', 'SMS plugin / Status', 'plugin', '2019-09-06 10:13:39', NULL),
(1113, 'plugin_sms_created', 'backend', 'SMS plugin / Date & Time', 'plugin', '2019-09-06 10:13:39', NULL),
(1114, 'plugin_sms_api', 'backend', 'SMS plugin / API Key', 'plugin', '2019-09-06 10:13:39', NULL),
(1115, 'error_titles_ARRAY_PSS01', 'arrays', 'SMS plugin / Info title', 'plugin', '2019-09-06 10:13:39', NULL),
(1116, 'error_bodies_ARRAY_PSS01', 'arrays', 'SMS plugin / Info body', 'plugin', '2019-09-06 10:13:39', NULL),
(1117, 'error_titles_ARRAY_PSS02', 'arrays', 'SMS plugin / API key updates info title', 'plugin', '2019-09-06 10:13:39', NULL),
(1118, 'error_bodies_ARRAY_PSS02', 'arrays', 'SMS plugin / API key updates info body', 'plugin', '2019-09-06 10:13:39', NULL),
(1119, 'plugin_sms_reset_search', 'backend', 'SMS plugin / Reset search', 'plugin', '2019-09-06 10:13:39', '2016-08-23 07:22:36'),
(1120, 'opt_o_email_address', 'backend', 'Options / Email account for email notifications', 'script', '2019-09-06 10:13:39', NULL),
(1121, 'lblOptionEmailTip', 'backend', 'Label / Email tooltip', 'script', '2019-09-06 10:13:39', NULL),
(1122, 'system_212', 'frontend', 'Label / Captcha is expired.', 'script', '2019-09-06 10:13:39', '2017-08-18 04:02:23'),
(1123, 'front_available_seats', 'frontend', 'Label / Available seats', 'script', '2019-09-06 10:13:39', '2017-08-18 04:02:23'),
(1124, 'menuCms', 'backend', 'Menu / CMS Pages', 'script', '2019-09-06 10:13:39', '2019-07-08 11:01:46'),
(1125, 'infoAddGalleryImage', 'backend', 'Infobox / Add Gallery Image', 'script', '2019-09-06 10:13:39', '2019-07-08 11:57:22'),
(1126, 'infoAddImageGalleryDesc', 'backend', 'Infobox / Add new gallery image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-08 12:00:04'),
(1127, 'menuItemList', 'backend', 'Menu / List of items', 'script', '2019-09-06 10:13:39', '2019-07-08 12:01:59'),
(1128, 'menuImageGallery', 'backend', 'Menu / Image Gallery', 'script', '2019-09-06 10:13:39', NULL),
(1129, 'infoImageGalleryTitle', 'backend', 'Infobox / List of gallery images\r\n', 'script', '2019-09-06 10:13:39', '2019-07-08 13:59:23'),
(1130, 'infoClientsTitle', 'backend', 'Infobox / List of Clients', 'script', '2019-09-06 10:13:39', '2019-07-08 13:59:23'),
(1133, 'infoAddCms', 'backend', 'Infobox / Add Pages', 'script', '2019-09-06 10:13:39', '2019-07-12 15:00:25'),
(1134, 'infoAddCmsDesc', 'backend', 'Infobox / Add new Cms Pages\r\n', 'script', '2019-09-06 10:13:39', '2019-07-12 15:01:32'),
(1135, 'infoCmsTitle', 'backend', 'Infobox / List of Pages\r\n', 'script', '2019-09-06 10:13:39', '2019-07-12 15:03:19'),
(1136, 'infoCmsDesc', 'backend', 'Infobox / List of pages', 'script', '2019-09-06 10:13:39', '2019-07-12 15:04:21'),
(1137, 'cmsPageTitle', 'backend', 'Label / Page Title', 'script', '2019-09-06 10:13:39', '2019-07-12 15:03:19'),
(1138, 'cmsPageName', 'backend', 'Label / Page Name', 'script', '2019-09-06 10:13:39', '2019-07-12 15:09:12'),
(1139, 'cmsMetaTitle', 'backend', 'Label / Meta Title', 'script', '2019-09-06 10:13:39', '2019-07-15 08:26:46'),
(1140, 'cmsMetaDesc', 'backend', 'Label / Meta Description', 'script', '2019-09-06 10:13:39', '2019-07-15 08:28:16'),
(1141, 'cmsMetaKey', 'backend', 'Label / Meta Key', 'script', '2019-09-06 10:13:39', '2019-07-15 08:28:16'),
(1142, 'infoEditCms', 'backend', 'Infobox / Edit Pages', 'script', '2019-09-06 10:13:39', '2019-07-15 12:46:11'),
(1143, 'infoEditCmsDesc', 'backend', 'Infobox / Edit new Cms Pages\r\n', 'script', '2019-09-06 10:13:39', '2019-07-15 12:45:53'),
(1144, 'error_titles_ARRAY_CMS01', 'arrays', 'error_titles_ARRAY_CMS01', 'script', '2019-09-06 10:13:39', NULL),
(1145, 'error_bodies_ARRAY_CMS01', 'arrays', 'error_bodies_ARRAY_CMS01', 'script', '2019-09-06 10:13:39', NULL),
(1146, 'error_bodies_ARRAY_CMS03', 'arrays', 'error_bodies_ARRAY_CMS03', 'script', '2019-09-06 10:13:39', NULL),
(1147, 'error_titles_ARRAY_CMS03', 'arrays', 'error_titles_ARRAY_CMS03', 'script', '2019-09-06 10:13:39', NULL),
(1148, 'menuSubscriber', 'backend', 'Menu / Subscribers', 'script', '2019-09-06 10:13:39', '2019-07-15 15:03:29'),
(1149, 'menuSlider', 'backend', 'Menu / Slider', 'script', '2019-09-06 10:13:39', '2019-07-16 09:57:27'),
(1150, 'infoSliderTitle', 'backend', 'Infobox / List of gallery images\r\n', 'script', '2019-09-06 10:13:39', '2019-07-16 10:28:48'),
(1151, 'infoSliderDesc', 'backend', 'Infobox / List of Sliders Description', 'script', '2019-09-06 10:13:39', '2019-07-16 10:28:48'),
(1152, 'error_titles_ARRAY_SLDR03', 'arrays', 'error_titles_ARRAY_SLDR03', 'script', '2019-09-06 10:13:39', '2019-07-16 10:40:49'),
(1153, 'error_bodies_ARRAY_SLDR03', 'arrays', 'error_bodies_ARRAY_SLDR03', 'script', '2019-09-06 10:13:39', '2019-07-16 10:40:49'),
(1154, 'error_bodies_ARRAY_SLDR01', 'arrays', 'error_bodies_ARRAY_SLDR01', 'script', '2019-09-06 10:13:39', '2019-07-16 10:39:54'),
(1155, 'error_titles_ARRAY_SLDR01', 'arrays', 'error_titles_ARRAY_SLDR01', 'script', '2019-09-06 10:13:39', '2019-07-16 10:39:54'),
(1156, 'infoAddSliderDesc', 'backend', 'Infobox / Enter slider link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-16 10:37:26'),
(1157, 'infoAddSlider', 'backend', 'Infobox / Add Slider Image', 'script', '2019-09-06 10:13:39', '2019-07-16 10:37:26'),
(1158, 'infoEditSlider', 'backend', 'Infobox / Edit Slider Image', 'script', '2019-09-06 10:13:39', '2019-07-16 10:37:41'),
(1159, 'infoEditSliderDesc', 'backend', 'Infobox / Edit slider link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-16 10:37:41'),
(1160, 'cmsBannerLink', 'backend', 'Label / Link', 'script', '2019-09-06 10:13:39', '2019-07-16 11:00:56'),
(1161, 'menuGroups', 'backend', 'Menu / Groups', 'script', '2019-09-06 10:13:39', '2019-07-17 07:14:24'),
(1162, 'infoGroupTitle', 'backend', 'Infobox / Group list title', 'script', '2019-09-06 10:13:39', '2019-07-17 08:13:49'),
(1163, 'infoGroupBody', 'backend', 'Infobox / Group list body', 'script', '2019-09-06 10:13:39', '2019-07-17 08:13:49'),
(1164, 'infoAddGroupTitle', 'backend', 'Infobox / Add group title', 'script', '2019-09-06 10:13:39', '2019-07-17 08:13:49'),
(1165, 'infoAddGroupBody', 'backend', 'Infobox / Add group body', 'script', '2019-09-06 10:13:39', '2019-07-17 08:13:49'),
(1166, 'infoUpdateGroupTitle', 'backend', 'Infobox / Update group title', 'script', '2019-09-06 10:13:39', '2019-07-17 08:13:49'),
(1167, 'infoUpdateGroupBody', 'backend', 'Infobox / Update group body', 'script', '2019-09-06 10:13:39', '2019-07-17 08:13:49'),
(1168, 'lblAddToGroup', 'backend', 'Label / Add to group', 'script', '2019-09-06 10:13:39', '2019-07-17 15:18:59'),
(1169, 'lblAssignToGroup', 'backend', 'Label / Assign to group', 'script', '2019-09-06 10:13:39', '2019-07-17 15:18:59'),
(1170, 'lblAddGroupText', 'backend', 'Label / Add group text', 'script', '2019-09-06 10:13:39', '2019-07-17 15:18:59'),
(1171, 'btnCreateList', 'backend', 'Button / + Create list', 'script', '2019-09-06 10:13:39', '2019-07-17 15:18:59'),
(1172, 'lblGroupDetails', 'backend', 'Label / Group details', 'script', '2019-09-06 10:13:39', '2019-07-17 17:41:06'),
(1173, 'lblConfirmation', 'backend', 'Label / Confirmation', 'script', '2019-09-06 10:13:39', '2019-07-17 17:42:41'),
(1174, 'lblSubsciptionForm', 'backend', 'Label / Subscription form', 'script', '2019-09-06 10:13:39', '2019-07-17 17:42:41'),
(1175, 'lblSelectField', 'backend', 'Label / Select at least a fields', 'script', '2019-09-06 10:13:39', '2019-07-17 17:42:41'),
(1176, 'lblSubscriberData', 'backend', 'Label / Subscriber data', 'script', '2019-09-06 10:13:39', '2019-07-17 17:44:12'),
(1177, 'lblDashTotalSubscribers', 'backend', 'Label / Total subscribers', 'script', '2019-09-06 10:13:39', '2019-07-17 17:45:35'),
(1178, 'lblDashSubscribed', 'backend', 'Label / Subscribed', 'script', '2019-09-06 10:13:39', '2019-07-17 17:46:23'),
(1179, 'lblDashUnsubscribed', 'backend', 'Label / Unsubscribed', 'script', '2019-09-06 10:13:39', '2019-07-17 17:47:31'),
(1180, 'lblGroup', 'backend', 'Label / Group', 'script', '2019-09-06 10:13:39', '2019-07-17 17:48:36'),
(1181, 'infoSubscriberDataTitle', 'backend', 'Infobox / Subscribers data title', 'script', '2019-09-06 10:13:39', '2019-07-17 17:50:41'),
(1208, 'lblFirstName', 'backend', 'Label / First name', 'script', '2019-09-06 10:13:39', '2019-07-17 18:02:32'),
(1209, 'lblLastName', 'backend', 'Label / Last name', 'script', '2019-09-06 10:13:39', '2019-07-17 18:02:32'),
(1210, 'lblWebsite', 'backend', 'Label / Website', 'script', '2019-09-06 10:13:39', '2019-07-17 18:02:32'),
(1211, 'lblGender', 'backend', 'Label / Gender', 'script', '2019-09-06 10:13:39', '2019-07-17 18:02:32'),
(1212, 'lblAge', 'backend', 'Label / Age', 'script', '2019-09-06 10:13:39', '2019-07-17 18:02:32'),
(1213, 'lblBirthday', 'backend', 'Label / Birthday', 'script', '2019-09-06 10:13:39', '2019-07-17 18:02:32'),
(1214, 'lblAddress', 'backend', 'Label / Address', 'script', '2019-09-06 10:13:39', '2019-07-17 19:07:30'),
(1215, 'lblCity', 'backend', 'Label / City', 'script', '2019-09-06 10:13:39', '2019-07-17 19:07:30'),
(1216, 'lblState', 'backend', 'Label / State', 'script', '2019-09-06 10:13:39', '2019-07-17 19:07:30'),
(1217, 'lblCountry', 'backend', 'Label / Country', 'script', '2019-09-06 10:13:39', '2019-07-17 19:07:30'),
(1218, 'lblZip', 'backend', 'Label / Zip', 'script', '2019-09-06 10:13:39', '2019-07-17 19:07:30'),
(1232, 'lblCompanyName', 'backend', 'Label / Company name', 'script', '2019-09-06 10:13:39', '2019-07-17 19:11:23'),
(1235, 'infoSubscriberDataBody', 'backend', 'Infobox / Subscriber data body', 'script', '2019-09-06 10:13:39', '2019-07-17 19:18:52'),
(1236, 'infoSendConfirmTitle', 'backend', 'Infobox / Send confirmation title', 'script', '2019-09-06 10:13:39', '2019-07-17 19:18:52'),
(1237, 'infoSendConfirmBody', 'backend', 'Infobox / Send confirmation body', 'script', '2019-09-06 10:13:39', '2019-07-17 19:18:52'),
(1238, 'infoSendResponseTitle', 'backend', 'Infobox / Send response title', 'script', '2019-09-06 10:13:39', '2019-07-17 19:18:52'),
(1239, 'infoSendResponseBody', 'backend', 'Infobox / Send response body', 'script', '2019-09-06 10:13:39', '2019-07-17 19:18:52'),
(1785, 'lblMessageTokens', 'backend', 'Label / Message tokens', 'script', '2019-09-06 10:13:39', '2019-07-17 19:37:22'),
(1786, 'lblSendConfirmMessage', 'backend', 'label / Send confirmation message', 'script', '2019-09-06 10:13:39', '2019-07-17 19:39:18'),
(1787, 'error_titles_ARRAY_AG01', 'arrays', 'error_titles_ARRAY_AG01', 'script', '2019-09-06 10:13:39', NULL),
(1788, 'error_bodies_ARRAY_AG01', 'arrays', 'error_bodies_ARRAY_AG01', 'script', '2019-09-06 10:13:39', NULL),
(1789, 'error_titles_ARRAY_AG03', 'arrays', 'error_titles_ARRAY_AG03', 'script', '2019-09-06 10:13:39', NULL),
(1790, 'error_bodies_ARRAY_AG03', 'arrays', 'error_bodies_ARRAY_AG03', 'script', '2019-09-06 10:13:39', NULL),
(1791, 'error_titles_ARRAY_AG04', 'arrays', 'error_titles_ARRAY_AG04', 'script', '2019-09-06 10:13:39', NULL),
(1792, 'error_bodies_ARRAY_AG04', 'arrays', 'error_bodies_ARRAY_AG04', 'script', '2019-09-06 10:13:39', NULL),
(1793, 'error_titles_ARRAY_AG08', 'arrays', 'error_bodies_ARRAY_AG08', 'script', '2019-09-06 10:13:39', NULL),
(1794, 'error_bodies_ARRAY_AG08', 'arrays', 'error_bodies_ARRAY_AG08', 'script', '2019-09-06 10:13:39', NULL),
(1795, 'lblUpdateGroup', 'backend', 'Label / Update group', 'script', '2019-09-06 10:13:39', NULL),
(1796, 'error_titles_ARRAY_AS01', 'arrays', 'error_titles_ARRAY_AS01', 'script', '2019-09-06 10:13:39', NULL),
(1797, 'error_bodies_ARRAY_AS01', 'arrays', 'error_bodies_ARRAY_AS01', 'script', '2019-09-06 10:13:39', NULL),
(1798, 'error_titles_ARRAY_AS03', 'arrays', 'error_titles_ARRAY_AS03', 'script', '2019-09-06 10:13:39', NULL),
(1799, 'error_bodies_ARRAY_AS03', 'arrays', 'error_bodies_ARRAY_AS03', 'script', '2019-09-06 10:13:39', NULL),
(1800, 'error_titles_ARRAY_AS04', 'arrays', 'error_titles_ARRAY_AS04', 'script', '2019-09-06 10:13:39', NULL),
(1801, 'error_bodies_ARRAY_AS04', 'arrays', 'error_bodies_ARRAY_AS04', 'script', '2019-09-06 10:13:39', NULL),
(1802, 'error_titles_ARRAY_AS08', 'arrays', 'error_titles_ARRAY_AS08', 'script', '2019-09-06 10:13:39', NULL),
(1803, 'error_bodies_ARRAY_AS08', 'arrays', 'error_bodies_ARRAY_AS08', 'script', '2019-09-06 10:13:39', NULL),
(1811, 'menuSubscribers', 'backend', 'Menu / Subscribers', 'script', '2019-09-06 10:13:39', '2019-07-18 15:23:21'),
(1812, 'lblImport', 'backend', 'Label / Import', 'script', '2019-09-06 10:13:39', '2019-07-18 15:23:21'),
(1813, 'infoAddSubscriberTitle', 'backend', 'Infobox / Add subscriber title', 'script', '2019-09-06 10:13:39', '2019-07-18 15:23:21'),
(1814, 'infoAddSubscriberBody', 'backend', 'Infobox / Add subscriber body', 'script', '2019-09-06 10:13:39', '2019-07-18 15:23:21'),
(1815, 'lblNoGroupFound', 'backend', 'Label / No groups found', 'script', '2019-09-06 10:13:39', '2019-07-18 15:23:21'),
(1816, 'lblAddAGroup', 'backend', 'Label / Add a group', 'script', '2019-09-06 10:13:39', '2019-07-18 15:23:21'),
(2052, 'infoSubscribersTitle', 'backend', 'Infobox / List of subscribers', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2053, 'infoSubscribersDesc', 'backend', 'Infobox / List of subscribers', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2054, 'btnAddSubscriber', 'backend', 'Label / + Add subscriber', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2055, 'lblSendMessage', 'backend', 'Label / Send message', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2056, 'lblPrompSelectMessage', 'backend', 'Label / Select message', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2057, 'lblNoMessageFound', 'backend', 'Label / No message', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2058, 'lblAddAMessage', 'backend', 'Label / Add a message', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2059, 'lblRemoveFromCurrentGroup', 'backend', 'Label / Remove from current group(s)', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2060, 'infoImportTitle', 'backend', 'Infobox / Import title', 'script', '2019-09-06 10:13:39', '2019-07-18 15:53:59'),
(2061, 'infoImportBody', 'backend', 'Infobox / Import body', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2062, 'lblCSVFile', 'backend', 'Label / CSV file', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2063, 'lblSubscribers', 'backend', 'Label / Subscribers', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2064, 'lblUpdateSubscribers', 'backend', 'Label / Update subscribers', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2065, 'infoUpdateSubscriberBody', 'backend', 'Infobox / Update subscriber body', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2066, 'infoUpdateSubscriberTitle', 'backend', 'Infobox / Update subscriber title', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2067, 'lblCreatedDateTime', 'backend', 'Label / Date time created', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2068, 'lblModifiedDateTime', 'backend', 'Label / Date time modified', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2069, 'lblMessageSent', 'backend', 'Label / Messages sent', 'script', '2019-09-06 10:13:39', '2019-07-18 15:55:45'),
(2070, 'subscribed_arr_ARRAY_T', 'arrays', 'subscribed_arr_ARRAY_T', 'script', '2019-09-06 10:13:39', '2019-07-18 15:58:23'),
(2071, 'subscribed_arr_ARRAY_F', 'arrays', 'subscribed_arr_ARRAY_F', 'script', '2019-09-06 10:13:39', '2019-07-18 15:58:23'),
(2072, 'lblNameEmail', 'backend', 'Label / Name & Email', 'script', '2019-09-06 10:13:39', '2019-07-18 16:02:07'),
(2073, 'lblTotalSent', 'backend', 'Label / Total sent', 'script', '2019-09-06 10:13:39', '2019-07-18 16:02:07'),
(2074, 'lblLastSent', 'backend', 'Label / Last sent', 'script', '2019-09-06 10:13:39', '2019-07-18 16:02:07'),
(2075, 'genderarr_ARRAY_F', 'arrays', 'genderarr_ARRAY_F', 'script', '2019-09-06 10:13:39', '2019-07-18 16:04:53'),
(2076, 'genderarr_ARRAY_M', 'arrays', 'genderarr_ARRAY_M', 'script', '2019-09-06 10:13:39', '2019-07-18 16:05:04'),
(2173, 'infoAddMessageTitle', 'backend', 'Infobox / Add message title', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2174, 'infoAddMessageBody', 'backend', 'Infobox / Add message body', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2175, 'infoUpdateMessageTitle', 'backend', 'Infobox / Update message title', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2176, 'infoUpdateMessageBody', 'backend', 'Infobox / Update message body', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2177, 'menuMessages', 'backend', 'Menu / Messages', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2178, 'lblAddMessage', 'backend', 'Label / Add message', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2179, 'lblAttachFiles', 'backend', 'Label / Attach file(s)', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2180, 'lblUpdateMessage', 'backend', 'Label / Update message', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2181, 'lblDownload', 'backend', 'Label / download', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2182, 'lblDeleteFileTitle', 'backend', 'Label / Delete file title', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2183, 'lblDeleteFileBody', 'backend', 'Label / delete file body', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2184, 'lblSend', 'backend', 'Label / Send', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2185, 'lblSchedule', 'backend', 'Label / Schedule', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2186, 'lblSendNow', 'backend', 'Label / send now', 'script', '2019-09-06 10:13:39', '2019-07-18 19:35:52'),
(2187, 'lblSendLater', 'backend', 'Label / Send later', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2188, 'lblSendOn', 'backend', 'Label / Send on', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2189, 'lblSendInBatches', 'backend', 'Label / Send in batches', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2190, 'lblEmailsEvery', 'backend', 'Label / emails every', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2191, 'lblHTMLMessage', 'backend', 'Label / HTML message', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2192, 'lblPlainMessage', 'backend', 'Label / Plain message', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2193, 'infoMessagesTitle', 'backend', 'Infobox / List of messages', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2194, 'infoMessagesDesc', 'backend', 'Infobox / List of messages', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2195, 'btnCreateMessage', 'backend', 'Button / + Create message', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2196, 'lblSendTestTitle', 'backend', 'label / Send test title', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2197, 'lblDuplicateTitle', 'backend', 'Label / Make a message copy', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2198, 'lblDuplicateConfirm', 'backend', 'Label / Duplicate confirm', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2199, 'lblMailQueue', 'backend', 'Label / Mail queue', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2200, 'infoSendTitle', 'backend', 'Infobox / Send message title', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2201, 'infoSendBody', 'backend', 'Infobox / Send message body', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:15'),
(2202, 'lblTotalSubscribers', 'backend', 'Label / Total subscribers', 'script', '2019-09-06 10:13:39', '2019-07-18 19:38:33'),
(2256, 'error_titles_ARRAY_AM09', 'arrays', 'error_titles_ARRAY_AM09', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2257, 'error_bodies_ARRAY_AM09', 'arrays', 'error_bodies_ARRAY_AM09', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2258, 'error_titles_ARRAY_AM10', 'arrays', 'error_titles_ARRAY_AM10', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2259, 'error_bodies_ARRAY_AM10', 'arrays', 'error_bodies_ARRAY_AM10', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2260, 'error_titles_ARRAY_AM01', 'arrays', 'error_titles_ARRAY_AM01', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2261, 'error_bodies_ARRAY_AM01', 'arrays', 'error_bodies_ARRAY_AM01', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2262, 'error_titles_ARRAY_AM03', 'arrays', 'error_titles_ARRAY_AM03', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2263, 'error_bodies_ARRAY_AM03', 'arrays', 'error_bodies_ARRAY_AM03', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2264, 'error_titles_ARRAY_AM04', 'arrays', 'error_bodies_ARRAY_AM04', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2265, 'error_bodies_ARRAY_AM04', 'arrays', 'error_bodies_ARRAY_AM04', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2266, 'error_titles_ARRAY_AM08', 'arrays', 'error_titles_ARRAY_AM08', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2267, 'error_bodies_ARRAY_AM08', 'arrays', 'error_bodies_ARRAY_AM08', 'script', '2019-09-06 10:13:39', '2019-07-18 20:12:55'),
(2268, 'error_bodies_ARRAY_ASP01', 'arrays', 'error_bodies_ARRAY_ASP01', 'script', '2019-09-06 10:13:39', '2019-07-19 13:43:38'),
(2269, 'error_bodies_ARRAY_ASP03', 'arrays', 'error_bodies_ARRAY_ASP03', 'script', '2019-09-06 10:13:39', '2019-07-19 13:43:38'),
(2270, 'error_bodies_ARRAY_ASP04', 'arrays', 'error_bodies_ARRAY_ASP04', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2271, 'error_bodies_ARRAY_ASP05', 'arrays', 'error_bodies_ARRAY_ASP05', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2272, 'error_bodies_ARRAY_ASP06', 'arrays', 'error_bodies_ARRAY_ASP06', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2273, 'error_bodies_ARRAY_ASP08', 'arrays', 'error_bodies_ARRAY_ASP08', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2274, 'error_bodies_ARRAY_ASP09', 'arrays', 'error_bodies_ARRAY_ASP09', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2275, 'error_bodies_ARRAY_ASP10', 'arrays', 'error_bodies_ARRAY_ASP10', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2276, 'error_bodies_ARRAY_ASP11', 'arrays', 'error_bodies_ARRAY_ASP11', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2277, 'error_bodies_ARRAY_ASP12', 'arrays', 'error_bodies_ARRAY_ASP12', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2278, 'error_bodies_ARRAY_ASP13', 'arrays', 'error_bodies_ARRAY_ASP13', 'script', '2019-09-06 10:13:39', '2019-07-19 13:47:57'),
(2279, 'menuSponsor', 'backend', 'Menu / Sponsor Pages', 'script', '2019-09-06 10:13:39', '2019-07-19 14:48:23'),
(2280, 'infoAddSponsorDesc', 'backend', 'Infobox / Enter Sponsor link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-19 15:12:29'),
(2281, 'infoAddSponsor', 'backend', 'Infobox / Add Sponsor Image', 'script', '2019-09-06 10:13:39', '2019-07-19 15:12:29'),
(2282, 'infoEditSponsor', 'backend', 'Infobox / Edit Sponsor Image', 'script', '2019-09-06 10:13:39', '2019-07-19 15:12:29'),
(2283, 'infoEditSponsorDesc', 'backend', 'Infobox / Edit Sponsor link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-19 15:12:29'),
(2284, 'SponsorLink', 'backend', 'Label / Link', 'script', '2019-09-06 10:13:39', '2019-07-19 15:12:29'),
(2285, 'infoSponsorTitle', 'backend', 'Infobox / List of images\r\n', 'script', '2019-09-06 10:13:39', '2019-07-19 15:12:48'),
(2286, 'infoSponsorDesc', 'backend', 'Infobox / List of Sponsors Description', 'script', '2019-09-06 10:13:39', '2019-07-19 15:13:51'),
(2287, 'SponsorYear', 'backend', 'Infobox / Sponsor Year', 'script', '2019-09-06 10:13:39', '2019-07-19 15:18:09'),
(2302, 'error_titles_ARRAY_AS09', 'arrays', 'error_titles_ARRAY_AS09', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:31'),
(2303, 'error_bodies_ARRAY_AS09', 'arrays', 'error_bodies_ARRAY_AS09', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:31'),
(2304, 'error_titles_ARRAY_AS13', 'arrays', 'error_titles_ARRAY_AS13', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:31'),
(2305, 'error_bodies_ARRAY_AS13', 'arrays', 'error_bodies_ARRAY_AS13', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:31'),
(2306, 'error_titles_ARRAY_AS12', 'arrays', 'error_titles_ARRAY_AS12', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:32'),
(2307, 'error_bodies_ARRAY_AS12', 'arrays', 'error_bodies_ARRAY_AS12', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:32'),
(2308, 'error_titles_ARRAY_AS10', 'arrays', 'error_titles_ARRAY_AS10', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:32'),
(2309, 'error_bodies_ARRAY_AS10', 'arrays', 'error_bodies_ARRAY_AS10', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:32'),
(2310, 'error_titles_ARRAY_AS11', 'arrays', 'error_titles_ARRAY_AS11', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:32'),
(2311, 'error_bodies_ARRAY_AS11', 'arrays', 'error_bodies_ARRAY_AS11', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:32'),
(2312, 'error_titles_ARRAY_AS20', 'arrays', 'error_titles_ARRAY_AS20', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:32'),
(2313, 'error_bodies_ARRAY_AS20', 'arrays', 'error_bodies_ARRAY_AS20', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:32'),
(2314, 'error_titles_ARRAY_AS21', 'arrays', 'error_titles_ARRAY_AS21', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:54'),
(2315, 'error_bodies_ARRAY_AS21', 'arrays', 'error_bodies_ARRAY_AS21', 'script', '2019-09-06 10:13:39', '2019-07-22 16:48:54'),
(2316, 'infoMailQueueTitle', 'backend', 'Infobox / Mail queue title', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2317, 'infoMailQueueBody', 'backend', 'Infobox / Mail queue body', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2318, 'queue_arr_ARRAY_inprogress', 'arrays', 'queue_arr_ARRAY_inprogress', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2319, 'queue_arr_ARRAY_completed', 'arrays', 'queue_arr_ARRAY_completed', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2320, 'lblInProgress', 'backend', 'label / In progress', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2321, 'lblCompleted', 'backend', 'Label / Completed', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2322, 'lblMessageID', 'backend', 'Label / Message ID', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2323, 'lblDateSent', 'backend', 'Label / Date sent', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2324, 'lblPreview', 'backend', 'Label / Preview', 'script', '2019-09-06 10:13:39', '2019-07-22 17:09:15'),
(2337, 'infoCustomersDesc', 'backend', 'Infobox / Customers', 'script', '2019-09-06 10:13:39', '2019-07-24 15:22:42'),
(2338, 'infoCustomersTitle', 'backend', 'Infobox / Customers', 'script', '2019-09-06 10:13:39', '2019-07-24 15:22:42'),
(2339, 'infoAddCustomerDesc', 'backend', 'Infobox / Add Customer', 'script', '2019-09-06 10:13:39', '2019-07-24 15:22:42'),
(2340, 'infoAddCustomerTitle', 'backend', 'Infobox / Add Customer', 'script', '2019-09-06 10:13:39', '2019-07-24 15:22:42'),
(2341, 'infoUpdateCustomerTitle', 'backend', 'Infobox / Update Customer', 'script', '2019-09-06 10:13:39', '2019-07-24 15:23:38'),
(2342, 'infoUpdateCustomerDesc', 'backend', 'Infobox / Update Customer', 'script', '2019-09-06 10:13:39', '2019-07-24 15:23:38'),
(2343, 'btnAddCustomer', 'backend', 'Button / + Add Customer', 'script', '2019-09-06 10:13:39', '2019-07-24 15:28:21'),
(2344, 'menuCustomers', 'backend', 'Menu Customers', 'script', '2019-09-06 10:13:39', '2019-07-24 15:30:22'),
(2345, 'error_bodies_ARRAY_AC01', 'arrays', 'error_bodies_ARRAY_AC01', 'script', '2019-09-06 10:13:39', '2019-07-24 15:39:19'),
(2346, 'error_bodies_ARRAY_AC03', 'arrays', 'error_bodies_ARRAY_AC03', 'script', '2019-09-06 10:13:39', '2019-07-24 15:39:19'),
(2347, 'error_bodies_ARRAY_AC04', 'arrays', 'error_bodies_ARRAY_AC04', 'script', '2019-09-06 10:13:39', '2019-07-24 15:39:19'),
(2348, 'error_bodies_ARRAY_AC08', 'arrays', 'error_bodies_ARRAY_AC08', 'script', '2019-09-06 10:13:39', '2019-07-24 15:39:19'),
(2351, 'menuArtist', 'backend', 'Menu / Artist Pages', 'script', '2019-09-06 10:13:39', '2019-07-25 18:54:18'),
(2352, 'infoAddArtistDesc', 'backend', 'Infobox / Enter Artist link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-25 18:54:18'),
(2353, 'infoAddArtist', 'backend', 'Infobox / Add Artist Image', 'script', '2019-09-06 10:13:39', '2019-07-25 18:54:18'),
(2354, 'infoEditArtist', 'backend', 'Infobox / Edit Artist Image', 'script', '2019-09-06 10:13:39', '2019-07-25 18:54:18'),
(2355, 'infoEditArtistDesc', 'backend', 'Infobox / Edit Artist link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-25 18:54:18'),
(2357, 'infoArtistTitle', 'backend', 'Infobox / List of images\r\n', 'script', '2019-09-06 10:13:39', '2019-07-25 18:54:18'),
(2358, 'infoArtistDesc', 'backend', 'Infobox / List of Artists Description', 'script', '2019-09-06 10:13:39', '2019-07-25 18:54:33'),
(2360, 'error_bodies_ARRAY_ART01', 'arrays', 'error_bodies_ARRAY_ART01', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2361, 'error_bodies_ARRAY_ART03', 'arrays', 'error_bodies_ARRAY_ART03', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2362, 'error_bodies_ARRAY_ART04', 'arrays', 'error_bodies_ARRAY_ART04', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25');
INSERT INTO `tk_cbs_fields` (`id`, `key`, `type`, `label`, `source`, `created_at`, `modified`) VALUES
(2363, 'error_bodies_ARRAY_ART05', 'arrays', 'error_bodies_ARRAY_ART05', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2364, 'error_bodies_ARRAY_ART06', 'arrays', 'error_bodies_ARRAY_ART06', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2365, 'error_bodies_ARRAY_ART08', 'arrays', 'error_bodies_ARRAY_ART08', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2366, 'error_bodies_ARRAY_ART09', 'arrays', 'error_bodies_ARRAY_ART09', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2367, 'error_bodies_ARRAY_ART10', 'arrays', 'error_bodies_ARRAY_ART10', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2368, 'error_bodies_ARRAY_ART11', 'arrays', 'error_bodies_ARRAY_ART11', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2369, 'error_bodies_ARRAY_ART12', 'arrays', 'error_bodies_ARRAY_ART12', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2370, 'error_bodies_ARRAY_ART13', 'arrays', 'error_bodies_ARRAY_ART13', 'script', '2019-09-06 10:13:39', '2019-07-25 18:50:25'),
(2371, 'error_bodies_ARRAY_ADVT13', 'arrays', 'error_bodies_ARRAY_ADVT13', 'script', '2019-09-06 10:13:39', '2019-07-29 19:02:52'),
(2372, 'error_bodies_ARRAY_ADVT12', 'arrays', 'error_bodies_ARRAY_ADVT12', 'script', '2019-09-06 10:13:39', '2019-07-29 19:02:52'),
(2373, 'error_bodies_ARRAY_ADVT11', 'arrays', 'error_bodies_ARRAY_ADVT11', 'script', '2019-09-06 10:13:39', '2019-07-29 19:02:52'),
(2374, 'error_bodies_ARRAY_ADVT10', 'arrays', 'error_bodies_ARRAY_ADVT10', 'script', '2019-09-06 10:13:39', '2019-07-29 19:02:52'),
(2375, 'error_bodies_ARRAY_ADVT09', 'arrays', 'error_bodies_ARRAY_ADVT09', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2376, 'error_bodies_ARRAY_ADVT08', 'arrays', 'error_bodies_ARRAY_ADVT08', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2377, 'error_bodies_ARRAY_ADVT06', 'arrays', 'error_bodies_ARRAY_ADVT06', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2378, 'error_bodies_ARRAY_ADVT05', 'arrays', 'error_bodies_ARRAY_ADVT05', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2379, 'error_bodies_ARRAY_ADVT04', 'arrays', 'error_bodies_ARRAY_ADVT04', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2380, 'error_bodies_ARRAY_ADVT03', 'arrays', 'error_bodies_ARRAY_ADVT03', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2381, 'error_bodies_ARRAY_ADVT01', 'arrays', 'error_bodies_ARRAY_ADVT01', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2382, 'infoAdvertisementDesc', 'backend', 'Infobox / List of Advertisement Description', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2383, 'infoAdvertisementTitle', 'backend', 'Infobox / List of images\r\n', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2384, 'infoEditAdvertisementDesc', 'backend', 'Infobox / Edit Advertisement link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2385, 'infoEditAdvertisement', 'backend', 'Infobox / Edit Advertisement Image', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2386, 'infoAddAdvertisement', 'backend', 'Infobox / Add Advertisement Image', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2387, 'infoAddAdvertisementDesc', 'backend', 'Infobox / Enter Advertisement link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-29 19:06:30'),
(2388, 'menuAdvertisement', 'backend', 'Menu / Advertisement Pages', 'script', '2019-09-06 10:13:39', '2019-07-29 19:09:35'),
(2407, 'error_bodies_ARRAY_AVDO13', 'arrays', 'error_bodies_ARRAY_AVDO13', 'script', '2019-09-06 10:13:39', '2019-07-30 15:34:39'),
(2408, 'error_bodies_ARRAY_AVDO12', 'arrays', 'error_bodies_ARRAY_AVDO12', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2409, 'error_bodies_ARRAY_AVDO11', 'arrays', 'error_bodies_ARRAY_AVDO11', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2410, 'error_bodies_ARRAY_AVDO10', 'arrays', 'error_bodies_ARRAY_AVDO10', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2411, 'error_bodies_ARRAY_AVDO09', 'arrays', 'error_bodies_ARRAY_AVDO09', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2412, 'error_bodies_ARRAY_AVDO08', 'arrays', 'error_bodies_ARRAY_AVDO08', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2413, 'error_bodies_ARRAY_AVDO06', 'arrays', 'error_bodies_ARRAY_AVDO06', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2414, 'error_bodies_ARRAY_AVDO05', 'arrays', 'error_bodies_ARRAY_AVDO05', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2415, 'error_bodies_ARRAY_AVDO04', 'arrays', 'error_bodies_ARRAY_AVDO04', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2416, 'error_bodies_ARRAY_AVDO03', 'arrays', 'error_bodies_ARRAY_AVDO03', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2417, 'error_bodies_ARRAY_AVDO01', 'arrays', 'error_bodies_ARRAY_AVDO01', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2418, 'infoVideoDesc', 'backend', 'Infobox / List of Video Description', 'script', '2019-09-06 10:13:39', '2019-07-30 15:53:09'),
(2419, 'infoVideoTitle', 'backend', 'Infobox / List of images\r\n', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2420, 'infoEditVideoDesc', 'backend', 'Infobox / Edit Video link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2421, 'infoEditVideo', 'backend', 'Infobox / Edit Video Image', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2422, 'infoAddVideo', 'backend', 'Infobox / Add Video Image', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:02'),
(2423, 'infoAddVideoDesc', 'backend', 'Infobox / Enter Video link,tittle and image\r\n', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:38'),
(2424, 'menuVideo', 'backend', 'Menu / Video Pages', 'script', '2019-09-06 10:13:39', '2019-07-30 15:41:38'),
(2425, 'lblVideo', 'backend', 'Label / Video', 'script', '2019-09-06 10:13:39', '2019-07-30 19:52:12'),
(2426, 'btnAddRole', 'backend', 'Label / Role', 'script', '2019-09-06 10:13:39', '2019-08-06 14:53:54'),
(2427, 'menuPrivilege', 'backend', 'Menu Privilege', 'script', '2019-09-06 10:13:39', '2019-08-06 15:04:14'),
(2428, 'error_titles_ARRAY_AP01', 'arrays', 'error_titles_ARRAY_AP01', 'script', '2019-09-06 10:13:39', '2019-08-06 18:51:42'),
(2429, 'error_titles_ARRAY_AP02', 'arrays', 'error_titles_ARRAY_AP02', 'script', '2019-09-06 10:13:39', '2019-08-06 18:51:42'),
(2430, 'error_titles_ARRAY_AP03', 'arrays', 'error_titles_ARRAY_AP03', 'script', '2019-09-06 10:13:39', '2019-08-06 18:51:42'),
(2431, 'error_titles_ARRAY_AP04', 'arrays', 'error_titles_ARRAY_AP04', 'script', '2019-09-06 10:13:39', '2019-08-06 18:51:42'),
(2432, 'infoUserRoleDesc', 'backend', 'Infobox / User Role', 'script', '2019-09-06 10:13:39', '2019-08-06 18:57:50'),
(2433, 'infoUserRoleTitle', 'backend', 'Infobox / User Roles', 'script', '2019-09-06 10:13:39', '2019-08-06 18:59:42'),
(2434, 'error_bodies_ARRAY_AP01', 'arrays', 'error_bodies_ARRAY_AP01', 'script', '2019-09-06 10:13:39', '2019-08-06 19:12:13'),
(2435, 'error_bodies_ARRAY_AP02', 'arrays', 'error_bodies_ARRAY_AP02', 'script', '2019-09-06 10:13:39', '2019-08-06 19:12:13'),
(2436, 'error_bodies_ARRAY_AP03', 'arrays', 'error_bodies_ARRAY_AP03', 'script', '2019-09-06 10:13:39', '2019-08-06 19:12:13'),
(2437, 'error_bodies_ARRAY_AP04', 'arrays', 'error_bodies_ARRAY_AP04', 'script', '2019-09-06 10:13:39', '2019-08-06 19:12:13'),
(2438, 'infoAddUserRoleTitle', 'backend', 'Infobox / Add user role', 'script', '2019-09-06 10:13:39', '2019-08-06 19:16:29'),
(2439, 'infoAddUserRoleDesc', 'backend', 'Infobox / Add user role', 'script', '2019-09-06 10:13:39', '2019-08-06 19:16:29'),
(2440, 'infoUpdateUserRoleTitle', 'backend', 'Infobox / Update user role', 'script', '2019-09-06 10:13:39', '2019-08-06 19:19:20'),
(2441, 'infoUpdateUserRoleDesc', 'backend', 'Infobox / Update user role', 'script', '2019-09-06 10:13:39', '2019-08-06 19:19:20'),
(2442, 'customerName', 'backend', 'Customer Name', 'script', '2019-09-06 10:13:39', '2019-09-06 16:31:25'),
(2443, 'artistName', 'backend', 'Artist Name', 'script', '2019-09-06 10:13:39', '2019-09-06 16:31:25'),
(2444, 'customerRequestedSong', 'backend', 'Customer Requested Song', 'script', '2019-09-06 10:17:48', '2019-09-06 16:31:25'),
(2445, 'createdAt', 'backend', 'Created At', 'script', '2019-09-06 10:22:48', '2019-09-06 16:31:25'),
(2446, 'updatedAt', 'backend', 'Updated At', 'script', '2019-09-06 10:22:48', '2019-09-06 16:31:25'),
(2447, 'infoCustomerRequestTitle', 'backend', 'Customer Requested Songs', 'script', '2019-09-06 10:27:05', '2019-09-06 16:31:25'),
(2448, 'infoCustomerRequestDesc', 'backend', 'Here you can see the customer request songs.', 'script', '2019-09-06 10:27:05', '2019-09-06 16:31:25'),
(2449, 'menuCustomerRequest', 'backend', 'Menu / Customer Request Songs', 'script', '2019-09-06 10:13:39', '2019-09-06 16:32:03'),
(2450, 'menuInvoice', 'backend', 'Menu Booking Invoices', 'script', '2019-09-06 10:13:39', '2019-09-11 14:20:00'),
(2451, 'menuReports', 'backend', 'Menu Reports', 'script', '2019-09-06 10:13:39', '2019-10-03 12:24:40'),
(2452, 'menuDocumentUpload', 'backend', 'Menu / Document Upload', 'script', '2019-09-06 10:13:39', '2019-10-16 19:18:43'),
(2453, 'lblGarbageRecords', 'backend', 'Garbage Records', 'script', '2019-09-06 10:13:39', '2019-10-21 13:12:36'),
(2454, 'lblSmallDescription', 'backend', 'Label / Small Description', 'script', '2019-09-06 10:13:39', '2019-10-24 18:51:50'),
(2456, 'lblEventType', 'backend', 'Label / Type of event', 'script', '2019-09-06 10:13:39', '2019-11-04 19:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_groups`
--

CREATE TABLE `tk_cbs_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_title` varchar(255) DEFAULT NULL,
  `subscribed_fields` varchar(255) NOT NULL DEFAULT 'first_name,email',
  `send_confirm` enum('T','F') NOT NULL DEFAULT 'F',
  `confirm_subject` varchar(255) DEFAULT NULL,
  `confirm_message` text DEFAULT NULL,
  `send_response` enum('T','F') NOT NULL DEFAULT 'F',
  `response_subject` varchar(255) DEFAULT NULL,
  `response_message` text DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_groups`
--

INSERT INTO `tk_cbs_groups` (`id`, `group_title`, `subscribed_fields`, `send_confirm`, `confirm_subject`, `confirm_message`, `send_response`, `response_subject`, `response_message`, `status`) VALUES
(1, 'Newsletter', 'first_name', 'T', 'Subscription 1', '<p>First Name :&nbsp;{FirstName}</p>\r\n<p>Last Name :&nbsp;{LastName}</p>\r\n<p>Email :&nbsp;{Email}</p>', 'F', NULL, NULL, 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_groups_subscribers`
--

CREATE TABLE `tk_cbs_groups_subscribers` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `subscriber_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_groups_subscribers`
--

INSERT INTO `tk_cbs_groups_subscribers` (`group_id`, `subscriber_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_image_galleries`
--

CREATE TABLE `tk_cbs_image_galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `gallery_image` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_image_galleries`
--

INSERT INTO `tk_cbs_image_galleries` (`id`, `gallery_image`, `created`, `status`) VALUES
(1, 'app/web/upload/gallery_images/1_55197f3b32497a100d6b43af80c8589d.jpg', '2019-07-11 10:41:17', 'T'),
(3, 'app/web/upload/gallery_images/3_b1772bc7f599b48c1b4a966a4722bc63.jpg', '2019-07-11 12:23:19', 'T'),
(4, 'app/web/upload/gallery_images/4_10d094af02724a22d4c78684526f0805.jpg', '2019-08-09 17:27:19', 'T'),
(5, 'app/web/upload/gallery_images/5_34e3e51768ed9760ef420d9d60a1dc93.jpg', '2019-08-09 17:34:09', 'T'),
(6, 'app/web/upload/gallery_images/6_d6090104e44e17b2b7feead09870f6e9.jpg', '2019-08-09 17:34:35', 'T'),
(7, 'app/web/upload/gallery_images/7_bd5df894bfd680060f8308625a8975b3.jpg', '2019-08-09 17:35:33', 'T'),
(8, 'app/web/upload/gallery_images/8_d51a3ee5d40c662509914a6dc56a383c.jpg', '2019-08-09 17:35:48', 'T'),
(9, 'app/web/upload/gallery_images/9_aac7445135ba28a4a5b4dd4da6ce26ee.jpg', '2019-08-09 17:36:05', 'T'),
(10, 'app/web/upload/gallery_images/10_9edaa189e4ff38ec405d3608900b75c2.jpg', '2019-08-28 17:56:01', 'T'),
(12, 'app/web/upload/gallery_images/10_9edaa189e4ff38ec405d3608900b75c2.jpg', '2019-08-28 17:56:01', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_marks`
--

CREATE TABLE `tk_cbs_marks` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_marks`
--

INSERT INTO `tk_cbs_marks` (`id`, `name`, `price`) VALUES
(1, 'Red', 100.00),
(2, 'Blue', 200.00),
(3, 'Green', 300.00),
(4, 'Yellow', 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_messages`
--

CREATE TABLE `tk_cbs_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `tinymce_message` text DEFAULT NULL,
  `plain_message` text DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_messages`
--

INSERT INTO `tk_cbs_messages` (`id`, `subject`, `tinymce_message`, `plain_message`, `modified`, `created`, `status`) VALUES
(1, 'Message 1', '<p>First name:&nbsp;{FirstName}</p>\r\n<p>Email :&nbsp;{Email}</p>', NULL, NULL, '2019-08-28 18:05:29', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_modules`
--

CREATE TABLE `tk_cbs_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tk_cbs_modules`
--

INSERT INTO `tk_cbs_modules` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(364, 'AdminSchedule', NULL, 'controller=pjAdminSchedule&action=pjActionIndex', NULL, 'pjAdminSchedule', 0, 0, '2019-08-02 14:20:45', '2019-08-02 14:20:45', '2019-08-02 14:20:45'),
(365, 'Admin', NULL, 'controller=pjAdmin&action=pjActionMessages', NULL, 'pjAdmin', 0, 0, '2019-08-02 14:20:45', '2019-08-02 14:20:45', '2019-08-02 14:20:45'),
(366, 'AdminBookings', NULL, 'controller=pjAdminBookings&action=pjActionIndex', NULL, 'pjAdminBookings', 0, 0, '2019-08-02 14:20:54', '2019-08-02 14:20:54', '2019-08-02 14:20:54'),
(367, 'AdminArtists', NULL, 'controller=pjAdminArtists&action=pjActionIndex', NULL, 'pjAdminArtists', 0, 0, '2019-08-02 14:20:55', '2019-08-02 14:20:55', '2019-08-02 14:20:55'),
(368, 'AdminEvents', NULL, 'controller=pjAdminEvents&action=pjActionIndex', NULL, 'pjAdminEvents', 0, 0, '2019-08-02 14:20:56', '2019-08-02 14:20:56', '2019-08-02 14:20:56'),
(369, 'AdminVenues', NULL, 'controller=pjAdminVenues&action=pjActionIndex', NULL, 'pjAdminVenues', 0, 0, '2019-08-02 14:20:57', '2019-08-02 14:20:57', '2019-08-02 14:20:57'),
(370, 'AdminImageGallery', NULL, 'controller=pjAdminImageGallery&action=pjActionIndex', NULL, 'pjAdminImageGallery', 0, 0, '2019-08-02 14:20:58', '2019-08-02 14:20:58', '2019-08-02 14:20:58'),
(371, 'AdminSlider', NULL, 'controller=pjAdminSlider&action=pjActionIndex', NULL, 'pjAdminSlider', 0, 0, '2019-08-02 14:20:58', '2019-08-02 14:20:58', '2019-08-02 14:20:58'),
(372, 'AdminSponsors', NULL, 'controller=pjAdminSponsors&action=pjActionIndex', NULL, 'pjAdminSponsors', 0, 0, '2019-08-02 14:21:00', '2019-08-02 14:21:00', '2019-08-02 14:21:00'),
(373, 'AdminGroups', NULL, 'controller=pjAdminGroups&action=pjActionIndex', NULL, 'pjAdminGroups', 0, 0, '2019-08-02 14:21:01', '2019-08-02 14:21:01', '2019-08-02 14:21:01'),
(374, 'AdminSubscribers', NULL, 'controller=pjAdminSubscribers&action=pjActionIndex', NULL, 'pjAdminSubscribers', 0, 0, '2019-08-02 14:21:02', '2019-08-02 14:21:02', '2019-08-02 14:21:02'),
(375, 'AdminMessages', NULL, 'controller=pjAdminMessages&action=pjActionIndex', NULL, 'pjAdminMessages', 0, 0, '2019-08-02 14:21:03', '2019-08-02 14:21:03', '2019-08-02 14:21:03'),
(376, 'AdminCms', NULL, 'controller=pjAdminCms&action=pjActionIndex', NULL, 'pjAdminCms', 0, 0, '2019-08-02 14:21:06', '2019-08-02 14:21:06', '2019-08-02 14:21:06'),
(377, 'AdminAdvertisements', NULL, 'controller=pjAdminAdvertisements&action=pjActionIndex', NULL, 'pjAdminAdvertisements', 0, 0, '2019-08-02 14:21:07', '2019-08-02 14:21:07', '2019-08-02 14:21:07'),
(378, 'AdminVideo', NULL, 'controller=pjAdminVideo&action=pjActionIndex', NULL, 'pjAdminVideo', 0, 0, '2019-08-02 14:21:09', '2019-08-02 14:21:09', '2019-08-02 14:21:09'),
(379, 'AdminOptions', NULL, 'controller=pjAdminOptions&action=pjActionIndex', NULL, 'pjAdminOptions', 0, 0, '2019-08-02 14:21:11', '2019-08-02 14:21:11', '2019-08-02 14:21:11'),
(380, 'AdminCustomers', NULL, 'controller=pjAdminCustomers&action=pjActionIndex', NULL, 'pjAdminCustomers', 0, 0, '2019-08-02 14:21:13', '2019-08-02 14:21:13', '2019-08-02 14:21:13'),
(381, 'AdminUsers', NULL, 'controller=pjAdminUsers&action=pjActionIndex', NULL, 'pjAdminUsers', 0, 0, '2019-08-02 14:21:15', '2019-08-02 14:21:15', '2019-08-02 14:21:15'),
(382, 'AdminRoleAcl', NULL, 'controller=pjAdminRoleAcl&action=pjActionCreate', NULL, 'pjAdminRoleAcl', 0, 0, '2019-08-02 14:24:07', '2019-08-02 14:24:07', '2019-08-02 14:24:07'),
(383, 'Locale', NULL, 'controller=pjLocale&action=pjActionLocales&tab=1', NULL, 'pjLocale', 0, 0, '2019-08-06 09:47:35', '2019-08-06 09:47:35', '2019-08-06 09:47:35'),
(384, 'Backup', NULL, 'controller=pjBackup&action=pjActionIndex', NULL, 'pjBackup', 0, 0, '2019-08-06 10:24:42', '2019-08-06 10:24:42', '2019-08-06 10:24:42'),
(385, 'Invoice', NULL, 'controller=pjInvoice&action=pjActionIndex', NULL, 'pjInvoice', 0, 0, '2019-08-06 10:24:43', '2019-08-06 10:24:43', '2019-08-06 10:24:43'),
(386, 'Sms', NULL, 'controller=pjSms&action=pjActionIndex', NULL, 'pjSms', 0, 0, '2019-08-06 10:24:44', '2019-08-06 10:24:44', '2019-08-06 10:24:44'),
(387, 'Paypal', NULL, 'controller=pjPaypal&action=pjActionConfirm', NULL, 'pjPaypal', 0, 0, '2019-08-12 07:47:56', '2019-08-12 07:47:56', '2019-08-12 07:47:56'),
(388, 'AdminCustomerRequest', NULL, 'controller=pjAdminCustomerRequest&action=pjActionIndex', NULL, 'pjAdminCustomerRequest', 0, 0, '2019-09-06 10:50:15', '2019-09-06 10:50:15', '2019-09-06 10:50:15'),
(389, 'AdminReport', NULL, 'controller=pjAdminReport&action=pjActionIndex', NULL, 'pjAdminReport', 0, 0, '2019-10-03 07:24:43', '2019-10-03 07:24:43', '2019-10-03 07:24:43'),
(390, 'AdminReports', NULL, 'controller=pjAdminReports&action=pjActionDashboard', NULL, 'pjAdminReports', 0, 0, '2019-10-03 07:53:33', '2019-10-03 07:53:33', '2019-10-03 07:53:33');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_multi_lang`
--

CREATE TABLE `tk_cbs_multi_lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `foreign_id` int(10) UNSIGNED DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `locale` tinyint(3) UNSIGNED DEFAULT NULL,
  `field` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `source` enum('script','plugin','data') DEFAULT 'script',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_multi_lang`
--

INSERT INTO `tk_cbs_multi_lang` (`id`, `foreign_id`, `model`, `locale`, `field`, `content`, `source`, `deleted_at`) VALUES
(1, 1, 'pjField', 1, 'title', 'Add language', 'script', NULL),
(2, 2, 'pjField', 1, 'title', 'Password reminder', 'script', NULL),
(3, 3, 'pjField', 1, 'title', 'Admin Login', 'script', NULL),
(4, 4, 'pjField', 1, 'title', 'Back-end titles', 'script', NULL),
(5, 5, 'pjField', 1, 'title', 'Add +', 'script', NULL),
(6, 6, 'pjField', 1, 'title', '+ Add booking', 'script', NULL),
(7, 7, 'pjField', 1, 'title', '+ Add hall', 'script', NULL),
(8, 8, 'pjField', 1, 'title', '+ Add Events', 'script', NULL),
(9, 9, 'pjField', 1, 'title', '+ Add user', 'script', NULL),
(10, 10, 'pjField', 1, 'title', '« Back', 'script', NULL),
(11, 11, 'pjField', 1, 'title', 'Backup', 'script', NULL),
(12, 12, 'pjField', 1, 'title', 'Cancel', 'script', NULL),
(13, 13, 'pjField', 1, 'title', 'Check', 'script', NULL),
(14, 14, 'pjField', 1, 'title', 'Continue', 'script', NULL),
(15, 15, 'pjField', 1, 'title', 'Create Invoice', 'script', NULL),
(16, 16, 'pjField', 1, 'title', 'Delete', 'script', NULL),
(17, 17, 'pjField', 1, 'title', 'Delete map', 'script', NULL),
(18, 18, 'pjField', 1, 'title', 'Export', 'script', NULL),
(19, 19, 'pjField', 1, 'title', 'Get Feed URL', 'script', NULL),
(20, 20, 'pjField', 1, 'title', 'Login', 'script', NULL),
(21, 21, 'pjField', 1, 'title', 'Next day', 'script', NULL),
(22, 22, 'pjField', 1, 'title', 'Next hour', 'script', NULL),
(23, 23, 'pjField', 1, 'title', 'Next week', 'script', NULL),
(24, 24, 'pjField', 1, 'title', 'Print', 'script', NULL),
(25, 25, 'pjField', 1, 'title', 'Remove', 'script', NULL),
(26, 26, 'pjField', 1, 'title', 'Reset', 'script', NULL),
(27, 27, 'pjField', 1, 'title', 'Save', 'script', NULL),
(28, 28, 'pjField', 1, 'title', 'Search', 'script', NULL),
(29, 29, 'pjField', 1, 'title', 'Send', 'script', NULL),
(30, 30, 'pjField', 1, 'title', 'Update', 'script', NULL),
(31, 31, 'pjField', 1, 'title', 'Use this theme', 'script', NULL),
(32, 32, 'pjField', 1, 'title', 'DateTime', 'script', NULL),
(33, 33, 'pjField', 1, 'title', 'Are you sure that you want to delete selected record(s)?', 'script', NULL),
(34, 34, 'pjField', 1, 'title', 'Delete selected', 'script', NULL),
(35, 35, 'pjField', 1, 'title', 'Email', 'script', NULL),
(36, 36, 'pjField', 1, 'title', 'Dear {Name},Your password: {Password}', 'script', NULL),
(37, 37, 'pjField', 1, 'title', 'Password reminder', 'script', NULL),
(38, 38, 'pjField', 1, 'title', 'Client with such email address exists.', 'script', NULL),
(39, 39, 'pjField', 1, 'title', 'Front-end titles', 'script', NULL),
(40, 40, 'pjField', 1, 'title', 'Action confirmation', 'script', NULL),
(41, 41, 'pjField', 1, 'title', 'Cancel', 'script', NULL),
(42, 42, 'pjField', 1, 'title', 'Delete', 'script', NULL),
(43, 43, 'pjField', 1, 'title', 'OK', 'script', NULL),
(44, 44, 'pjField', 1, 'title', 'Choose Action', 'script', NULL),
(45, 45, 'pjField', 1, 'title', 'Are you sure you want to delete selected record?', 'script', NULL),
(46, 46, 'pjField', 1, 'title', 'Delete confirmation', 'script', NULL),
(47, 47, 'pjField', 1, 'title', 'You need to select at least a single record.', 'script', NULL),
(48, 48, 'pjField', 1, 'title', 'No records found', 'script', NULL),
(49, 49, 'pjField', 1, 'title', 'No records selected', 'script', NULL),
(50, 50, 'pjField', 1, 'title', 'Go to page:', 'script', NULL),
(51, 51, 'pjField', 1, 'title', 'Items per page', 'script', NULL),
(52, 52, 'pjField', 1, 'title', 'Next »', 'script', NULL),
(53, 53, 'pjField', 1, 'title', 'Next page', 'script', NULL),
(54, 54, 'pjField', 1, 'title', '« Prev', 'script', NULL),
(55, 55, 'pjField', 1, 'title', 'Prev page', 'script', NULL),
(56, 56, 'pjField', 1, 'title', 'Total items:', 'script', NULL),
(57, 57, 'pjField', 1, 'title', 'Use the form below to manually add new booking. You need to fill in the required data in both tabs, Booking Details and Client Details. The system will calculate the total amount automatically.', 'script', NULL),
(58, 58, 'pjField', 1, 'title', 'Add New Booking', 'script', NULL),
(59, 59, 'pjField', 1, 'title', 'Enter event title, description, duration and image. You can also upload ticket image which will be used to generate ticket(s) for each booking.', 'script', NULL),
(60, 60, 'pjField', 1, 'title', 'Add new event', 'script', NULL),
(61, 61, 'pjField', 1, 'title', 'Fill in the form below and \"save\" to add a new user.', 'script', NULL),
(62, 62, 'pjField', 1, 'title', 'Add user', 'script', NULL),
(63, 63, 'pjField', 1, 'title', 'Use the form below to add a new hall. You can upload and manage a seat map for the hall. This will allow your customers to select specific seats on the map during the booking process. To upload a seat map use the browse button below and click on \"Save\" button. Only images in JPG file format are accepted. Once you upload the seat map you can define hot spots for the exact seats. If you don\'t want to use a seats map then just define the number of seats available for this hall. In this case the system will automatically assign available seats to each booking and ticket.', 'script', NULL),
(64, 64, 'pjField', 1, 'title', 'Add new hall', 'script', NULL),
(65, 65, 'pjField', 1, 'title', 'Use your bar code scanner to read the barcodes and fill in the ticket ID into the text below. Then click on Check button to read ticket details and confirm it.', 'script', NULL),
(66, 66, 'pjField', 1, 'title', 'Barcode reader', 'script', NULL),
(67, 67, 'pjField', 1, 'title', 'Select the available and required fields on the front-end. Select \'Yes\' if you want to include the field in the booking form, otherwise select \'No\'.', 'script', NULL),
(68, 68, 'pjField', 1, 'title', 'Booking form', 'script', NULL),
(69, 69, 'pjField', 1, 'title', 'Here you can choose your payment methods and set payment gateway accounts and payment preferences. Note that for cash payments the system will not be able to collect deposit amount online.', 'script', NULL),
(70, 70, 'pjField', 1, 'title', 'Here you can see the list of bookings. To see more details of each booking, click on the Pencil icon on the corresponding row.', 'script', NULL),
(71, 71, 'pjField', 1, 'title', 'Bookings', 'script', NULL),
(72, 72, 'pjField', 1, 'title', 'Booking options', 'script', NULL),
(73, 73, 'pjField', 1, 'title', 'Below you can see the list of bookings made for this event. You can also print that list.', 'script', NULL),
(74, 74, 'pjField', 1, 'title', 'Bookings', 'script', NULL),
(75, 75, 'pjField', 1, 'title', 'You can add different tickets (e.g. Blue, Yellow, Green, ...) for the event. Just click on ADD button and enter new ticket.', 'script', NULL),
(76, 76, 'pjField', 1, 'title', 'Tickets', 'script', NULL),
(77, 77, 'pjField', 1, 'title', 'Here you can see the list of events. To add a new event, click on the \'Add event\' tab. In order to see more details or edit event information, click on the \'Pencil\' icon on the corresponding row.', 'script', NULL),
(78, 78, 'pjField', 1, 'title', 'List of events', 'script', NULL),
(79, 79, 'pjField', 1, 'title', 'Here you can set the General options for the Cinema Booking System.', 'script', NULL),
(80, 80, 'pjField', 1, 'title', 'General options', 'script', NULL),
(81, 81, 'pjField', 1, 'title', 'You can show a map with the location of the listing accommodation on the listing details page. Submit the full address first and then click on \'Get coordinates from Google Maps API\' button. Save your data.', 'script', NULL),
(82, 82, 'pjField', 1, 'title', 'Location and address', 'script', NULL),
(83, 83, 'pjField', 1, 'title', 'Listing Bookings Body', 'script', NULL),
(84, 84, 'pjField', 1, 'title', 'Listing Bookings Title', 'script', NULL),
(85, 85, 'pjField', 1, 'title', 'Listing Contact Body', 'script', NULL),
(86, 86, 'pjField', 1, 'title', 'Listing Contact Title', 'script', NULL),
(87, 87, 'pjField', 1, 'title', 'Extend exp.date Body', 'script', NULL),
(88, 88, 'pjField', 1, 'title', 'Extend exp.date Title', 'script', NULL),
(89, 89, 'pjField', 1, 'title', 'Listing Prices Body', 'script', NULL),
(90, 90, 'pjField', 1, 'title', 'Listing Prices Title', 'script', NULL),
(91, 91, 'pjField', 1, 'title', 'Languages Array Body', 'script', NULL),
(92, 92, 'pjField', 1, 'title', 'Languages Arrays Title', 'script', NULL),
(93, 93, 'pjField', 1, 'title', 'Languages Backend Body', 'script', NULL),
(94, 94, 'pjField', 1, 'title', 'Languages Backend Title', 'script', NULL),
(95, 95, 'pjField', 1, 'title', 'Languages Body', 'script', NULL),
(96, 96, 'pjField', 1, 'title', 'Languages Frontend Body', 'script', NULL),
(97, 97, 'pjField', 1, 'title', 'Languages Frontend Title', 'script', NULL),
(98, 98, 'pjField', 1, 'title', 'Languages Title', 'script', NULL),
(99, 99, 'pjField', 1, 'title', 'Use the URL below to have access to all events. Please, note that if you change the password the URL will change too as password is used in the URL itself so no one else can open it.', 'script', NULL),
(100, 100, 'pjField', 1, 'title', 'Events Feed URL', 'script', NULL),
(101, 101, 'pjField', 1, 'title', 'There are multiple color schemes available for the front end. Click on each of the thumbnails below to preview it. Click on \"Use this theme\" button for the theme you want to use.', 'script', NULL),
(102, 102, 'pjField', 1, 'title', 'Preview front end', 'script', NULL),
(103, 103, 'pjField', 1, 'title', 'You are about to re-send the confirmation email and tickets to client who made the booking. Please click on the button Send of which email you refer to.', 'script', NULL),
(104, 104, 'pjField', 1, 'title', 'Resend tickets', 'script', NULL),
(105, 105, 'pjField', 1, 'title', 'Below is the schedule of all events that will happen in a certain date. You can change the selected date via the date picker. You also print the schedule as desired.', 'script', NULL),
(106, 106, 'pjField', 1, 'title', 'Now Showing', 'script', NULL),
(107, 107, 'pjField', 1, 'title', 'Here you can put custom name for each of the seats on your map. You can also set number of bookings that each seat can take. This is useful if you want to add a sector with multiple tickets - for example football stadium where instead of tickets for exact seats, tickets are sold for sectors.', 'script', NULL),
(108, 108, 'pjField', 1, 'title', 'Sectors', 'script', NULL),
(109, 109, 'pjField', 1, 'title', 'Please write down the Terms and Conditions for making booking and click SAVE button.', 'script', NULL),
(110, 110, 'pjField', 1, 'title', 'Terms and Conditions', 'script', NULL),
(111, 111, 'pjField', 1, 'title', 'Here you can set the template for printing PDF ticket. There are several available tokens.', 'script', NULL),
(112, 112, 'pjField', 1, 'title', 'Ticket setting', 'script', NULL),
(113, 113, 'pjField', 1, 'title', 'Set the automated email notifications sent to the script admins. You can use the available tokens to personalize the messages. Please note that if you wish to use the SMS notification you need to set SMS valid API Key at SMS tab. ', 'script', NULL),
(114, 114, 'pjField', 1, 'title', 'Notifications sent to script administrators', 'script', NULL),
(115, 115, 'pjField', 1, 'title', 'Below you can create different types of auto-responders triggered by different events, such as new booking notification, payment received and more. You can use the available tokens to personalize your message. Please note that if you wish to use the SMS notification you need to set SMS valid API Key at SMS tab.', 'script', NULL),
(116, 116, 'pjField', 1, 'title', 'Notifications sent to customers', 'script', NULL),
(117, 117, 'pjField', 1, 'title', 'Use the from below to update the selected booking. Note that booking details and client details are separated into two tabs. ', 'script', NULL),
(118, 118, 'pjField', 1, 'title', 'Update booking', 'script', NULL),
(119, 119, 'pjField', 1, 'title', 'Here you can update details information of the event.', 'script', NULL),
(120, 120, 'pjField', 1, 'title', 'Details', 'script', NULL),
(121, 121, 'pjField', 1, 'title', 'Using the form below you can manage showtimes for the movie. You can select date & time, hall where movie will be showing, ticket type and exact seats that can be booked for selected ticket type.', 'script', NULL),
(122, 122, 'pjField', 1, 'title', 'Showtimes', 'script', NULL),
(123, 123, 'pjField', 1, 'title', 'You can make any changes on the form below and click \"Save\" button to update the user information.', 'script', NULL),
(124, 124, 'pjField', 1, 'title', 'Update user', 'script', NULL),
(125, 125, 'pjField', 1, 'title', 'Use the form below to edit the hall. If you have uploaded a seat map you can either delete it (then you will have to set the \"Number of seats\" value) or manage it. To make the map active for users you need to set the available seats on the map. Just click on the map and a blue rectangle titled \"1\" will show. You can place the rectangle where appropriate via drag & drop. You can also change its size: point the cursor at rectangle\'s border, click and drag to the resize it. The rectangle added represents one seat on the map. Customers will be able to select seats by clicking on these rectangles during the booking process. You can add as many rectangles as your hall has. The system will automatically count the number of seats this hall has after saving the changes. You can also click on each of these hotspots and define extra options for each - seat ID and number of bookings it may take. This is useful if you want to define sectors in your hall, instead of exact seats. In that case you can set halls which can take 10,20... or as many seats as you need.', 'script', NULL),
(126, 126, 'pjField', 1, 'title', 'Update hall', 'script', NULL),
(127, 127, 'pjField', 1, 'title', 'You can see below the list of users. If you want to add new user, click on the button \"+ Add user\".', 'script', NULL),
(128, 128, 'pjField', 1, 'title', 'Users', 'script', NULL),
(129, 129, 'pjField', 1, 'title', 'Below is a list of all halls in the cinema. For each you can define the number of seats and/or a seat map. Customers will be able to select exact seats that they want to book.', 'script', NULL),
(130, 130, 'pjField', 1, 'title', 'List of halls', 'script', NULL),
(131, 131, 'pjField', 1, 'title', 'Active', 'script', NULL),
(132, 132, 'pjField', 1, 'title', 'Add booking', 'script', NULL),
(133, 133, 'pjField', 1, 'title', 'Add event', 'script', NULL),
(134, 134, 'pjField', 1, 'title', 'Add user', 'script', NULL),
(135, 135, 'pjField', 1, 'title', 'Add hall', 'script', NULL),
(136, 136, 'pjField', 1, 'title', 'All', 'script', NULL),
(137, 137, 'pjField', 1, 'title', 'Available seats', 'script', NULL),
(138, 138, 'pjField', 1, 'title', 'Use the tokens below to personalize your email messages. <br/><br/><div class=\"float_left w200\">{Name}<br/>{Email}<br/>{Phone}<br/>{Country}<br/>{Address}<br/>{Notes}<br/>{Movie}<br/>{MovieID}</div><div class=\"float_left w250\">{Showtime}<br/>{BookingID}<br/>{CinemaHall<br/>{BookingSeats}<br/>{Tickets}<br/>{Deposit}<br/>{Total}<br/>{Tax}<br/></div><div class=\"float_left w200\">{PaymentMethod}<br/>{CCType}<br/>{CCNum}<br/>{CCExp}<br/>{CCSec}<br/>{CancelURL}<br/>{TicketPrice}<br/>{PDFticket}</div>', 'script', NULL),
(139, 139, 'pjField', 1, 'title', 'Backup database', 'script', NULL),
(140, 140, 'pjField', 1, 'title', 'Backup files', 'script', NULL),
(141, 141, 'pjField', 1, 'title', 'Barcode Details', 'script', NULL),
(142, 142, 'pjField', 1, 'title', 'Booked seats', 'script', NULL),
(143, 143, 'pjField', 1, 'title', 'booking', 'script', NULL),
(144, 144, 'pjField', 1, 'title', 'Address', 'script', NULL),
(145, 145, 'pjField', 1, 'title', 'City', 'script', NULL),
(146, 146, 'pjField', 1, 'title', 'Company', 'script', NULL),
(147, 147, 'pjField', 1, 'title', 'Country', 'script', NULL),
(148, 148, 'pjField', 1, 'title', 'Booking details', 'script', NULL),
(149, 149, 'pjField', 1, 'title', 'Email', 'script', NULL),
(150, 150, 'pjField', 1, 'title', 'Booking with such ID already exists.', 'script', NULL),
(151, 151, 'pjField', 1, 'title', 'booking made today', 'script', NULL),
(152, 152, 'pjField', 1, 'title', 'Name', 'script', NULL),
(153, 153, 'pjField', 1, 'title', 'Notes', 'script', NULL),
(154, 154, 'pjField', 1, 'title', 'Phone', 'script', NULL),
(155, 155, 'pjField', 1, 'title', 'Bookings', 'script', NULL),
(156, 156, 'pjField', 1, 'title', 'bookings made today', 'script', NULL),
(157, 157, 'pjField', 1, 'title', 'Bookings not found', 'script', NULL),
(158, 158, 'pjField', 1, 'title', 'State', 'script', NULL),
(159, 159, 'pjField', 1, 'title', 'Title', 'script', NULL),
(160, 160, 'pjField', 1, 'title', 'Zip', 'script', NULL),
(161, 161, 'pjField', 1, 'title', 'CC code', 'script', NULL),
(162, 162, 'pjField', 1, 'title', 'CC expiration', 'script', NULL),
(163, 163, 'pjField', 1, 'title', 'CC number', 'script', NULL),
(164, 164, 'pjField', 1, 'title', 'CC type', 'script', NULL),
(165, 165, 'pjField', 1, 'title', 'Choose', 'script', NULL),
(166, 166, 'pjField', 1, 'title', 'Choose theme', 'script', NULL),
(167, 167, 'pjField', 1, 'title', 'Client details', 'script', NULL),
(168, 168, 'pjField', 1, 'title', 'Confirmation email', 'script', NULL),
(169, 169, 'pjField', 1, 'title', 'Created on', 'script', NULL),
(170, 170, 'pjField', 1, 'title', 'Currently in use', 'script', NULL),
(171, 171, 'pjField', 1, 'title', 'hall', 'script', NULL),
(172, 172, 'pjField', 1, 'title', 'halls', 'script', NULL),
(173, 173, 'pjField', 1, 'title', 'Last login', 'script', NULL),
(174, 174, 'pjField', 1, 'title', 'Date', 'script', NULL),
(175, 175, 'pjField', 1, 'title', 'Showtime', 'script', NULL),
(176, 176, 'pjField', 1, 'title', 'days', 'script', NULL),
(177, 177, 'pjField', 1, 'title', 'Once you upload the image you will be able to define seats.', 'script', NULL),
(178, 178, 'pjField', 1, 'title', 'Delete', 'script', NULL),
(179, 179, 'pjField', 1, 'title', 'Delete confirmation', 'script', NULL),
(180, 180, 'pjField', 1, 'title', 'Delete image', 'script', NULL),
(181, 181, 'pjField', 1, 'title', 'Are you sure that you want to delete the image?', 'script', NULL),
(182, 182, 'pjField', 1, 'title', 'If the map is deleted, all of seats you defined for this map will be removed as well. Are you sure that you want to delete the map?', 'script', NULL),
(183, 183, 'pjField', 1, 'title', 'Are you sure that you want to delete the selected show?', 'script', NULL),
(184, 184, 'pjField', 1, 'title', 'Delete ticket', 'script', NULL),
(185, 185, 'pjField', 1, 'title', 'Are you sure that you want to delete the ticket image?', 'script', NULL),
(186, 186, 'pjField', 1, 'title', 'Deposit', 'script', NULL),
(187, 187, 'pjField', 1, 'title', 'Description', 'script', NULL),
(188, 188, 'pjField', 1, 'title', 'Details', 'script', NULL),
(189, 189, 'pjField', 1, 'title', 'Please check again for duplicated showtimes.', 'script', NULL),
(190, 190, 'pjField', 1, 'title', 'Duplicated showtimes', 'script', NULL),
(191, 191, 'pjField', 1, 'title', 'Duration', 'script', NULL),
(192, 192, 'pjField', 1, 'title', 'Duration time is invalid.', 'script', NULL),
(193, 193, 'pjField', 1, 'title', 'Edit booking', 'script', NULL),
(194, 194, 'pjField', 1, 'title', 'Email', 'script', NULL),
(195, 195, 'pjField', 1, 'title', 'Enter password', 'script', NULL),
(196, 196, 'pjField', 1, 'title', 'Error', 'script', NULL),
(197, 197, 'pjField', 1, 'title', 'Events', 'script', NULL),
(198, 198, 'pjField', 1, 'title', 'Export', 'script', NULL),
(199, 199, 'pjField', 1, 'title', 'Forgot password', 'script', NULL),
(200, 200, 'pjField', 1, 'title', 'Format', 'script', NULL),
(201, 201, 'pjField', 1, 'title', 'from', 'script', NULL),
(202, 202, 'pjField', 1, 'title', 'Height', 'script', NULL),
(203, 203, 'pjField', 1, 'title', 'Hour', 'script', NULL),
(204, 204, 'pjField', 1, 'title', 'ID', 'script', NULL),
(205, 205, 'pjField', 1, 'title', 'Image', 'script', NULL),
(206, 206, 'pjField', 1, 'title', 'Inactive', 'script', NULL),
(207, 207, 'pjField', 1, 'title', 'Language options', 'script', NULL),
(208, 208, 'pjField', 1, 'title', 'Hide language selector ', 'script', NULL),
(209, 209, 'pjField', 1, 'title', 'Language', 'script', NULL),
(210, 210, 'pjField', 1, 'title', 'Copy the code below and put it on your web page. It will show the front end booking engine. Please, note that the code should be used on a web page from the same domain name where script is installed.', 'script', NULL),
(211, 211, 'pjField', 1, 'title', 'Install code', 'script', NULL),
(212, 212, 'pjField', 1, 'title', 'Invalid date! No events found.', 'script', NULL),
(213, 213, 'pjField', 1, 'title', 'IP address', 'script', NULL),
(214, 214, 'pjField', 1, 'title', 'Is confirmed', 'script', NULL),
(215, 215, 'pjField', 1, 'title', 'Latest bookings', 'script', NULL),
(216, 216, 'pjField', 1, 'title', 'Emails', 'script', NULL),
(217, 217, 'pjField', 1, 'title', 'SMS', 'script', NULL),
(218, 218, 'pjField', 1, 'title', 'Map', 'script', NULL),
(219, 219, 'pjField', 1, 'title', 'Max attendants', 'script', NULL),
(220, 220, 'pjField', 1, 'title', 'Message', 'script', NULL),
(221, 221, 'pjField', 1, 'title', 'minutes', 'script', NULL),
(222, 222, 'pjField', 1, 'title', 'Event', 'script', NULL),
(223, 223, 'pjField', 1, 'title', 'Events', 'script', NULL),
(224, 224, 'pjField', 1, 'title', 'Events Feed URL', 'script', NULL),
(225, 225, 'pjField', 1, 'title', 'event showing today', 'script', NULL),
(226, 226, 'pjField', 1, 'title', 'No events found', 'script', NULL),
(227, 227, 'pjField', 1, 'title', 'events showing today', 'script', NULL),
(228, 228, 'pjField', 1, 'title', 'Name', 'script', NULL),
(229, 229, 'pjField', 1, 'title', 'Next events', 'script', NULL),
(230, 230, 'pjField', 1, 'title', 'Next ticket type', 'script', NULL),
(231, 231, 'pjField', 1, 'title', 'No', 'script', NULL),
(232, 232, 'pjField', 1, 'title', 'No access to feed', 'script', NULL),
(233, 233, 'pjField', 1, 'title', 'No events found', 'script', NULL),
(234, 234, 'pjField', 1, 'title', 'Now showing', 'script', NULL),
(235, 235, 'pjField', 1, 'title', 'Option', 'script', NULL),
(236, 236, 'pjField', 1, 'title', 'Option list', 'script', NULL),
(237, 237, 'pjField', 1, 'title', 'Payment email', 'script', NULL),
(238, 238, 'pjField', 1, 'title', 'Payment method', 'script', NULL),
(239, 239, 'pjField', 1, 'title', 'people watching', 'script', NULL),
(240, 240, 'pjField', 1, 'title', 'person watching', 'script', NULL),
(241, 241, 'pjField', 1, 'title', 'Phone', 'script', NULL),
(242, 242, 'pjField', 1, 'title', 'bookings', 'script', NULL),
(243, 243, 'pjField', 1, 'title', 'tickets', 'script', NULL),
(244, 244, 'pjField', 1, 'title', 'Price', 'script', NULL),
(245, 245, 'pjField', 1, 'title', 'Print', 'script', NULL),
(246, 246, 'pjField', 1, 'title', 'Print tickets', 'script', NULL),
(247, 247, 'pjField', 1, 'title', 'click on a seat above to remove it', 'script', NULL),
(248, 248, 'pjField', 1, 'title', 'Resend tickets', 'script', NULL),
(249, 249, 'pjField', 1, 'title', 'Role', 'script', NULL),
(250, 250, 'pjField', 1, 'title', 'Number of seats must be greater than zero.', 'script', NULL),
(251, 251, 'pjField', 1, 'title', 'Seat numbers', 'script', NULL),
(252, 252, 'pjField', 1, 'title', 'You need to enter all numbers/IDs.', 'script', NULL),
(253, 253, 'pjField', 1, 'title', 'Enter amount of seats to set actual seat numbers.', 'script', NULL),
(254, 254, 'pjField', 1, 'title', 'Enter actual numbers/IDs for all the seats that you have.', 'script', NULL),
(255, 255, 'pjField', 1, 'title', 'Seat(s)', 'script', NULL),
(256, 256, 'pjField', 1, 'title', 'Number of seats', 'script', NULL),
(257, 257, 'pjField', 1, 'title', 'Seats map', 'script', NULL),
(258, 258, 'pjField', 1, 'title', 'Sectors', 'script', NULL),
(259, 259, 'pjField', 1, 'title', 'click on available seat on the map to reserve it', 'script', NULL),
(260, 260, 'pjField', 1, 'title', 'Selected seats', 'script', NULL),
(261, 261, 'pjField', 1, 'title', 'Please select more seats.', 'script', NULL),
(262, 262, 'pjField', 1, 'title', 'Select seats', 'script', NULL),
(263, 263, 'pjField', 1, 'title', 'Please click on seat(s) you want to book. If you change your mind, let click on the selected seats again. Finally, please click on OK button to complete. ', 'script', NULL),
(264, 264, 'pjField', 1, 'title', 'set hotspot size', 'script', NULL),
(265, 265, 'pjField', 1, 'title', 'Show', 'script', NULL),
(266, 266, 'pjField', 1, 'title', 'No shows found', 'script', NULL),
(267, 267, 'pjField', 1, 'title', 'Showtimes', 'script', NULL),
(268, 268, 'pjField', 1, 'title', 'Showtime', 'script', NULL),
(269, 269, 'pjField', 1, 'title', 'ticket', 'script', NULL),
(270, 270, 'pjField', 1, 'title', 'ticket', 'script', NULL),
(271, 271, 'pjField', 1, 'title', 'Status', 'script', NULL),
(272, 272, 'pjField', 1, 'title', 'Please check again for duplicated showtimes.', 'script', NULL),
(273, 273, 'pjField', 1, 'title', 'Showtimes have been saved.', 'script', NULL),
(274, 274, 'pjField', 1, 'title', 'Showtimes could not be saved.', 'script', NULL),
(275, 275, 'pjField', 1, 'title', 'Please wait while showtimes are saving...', 'script', NULL),
(276, 276, 'pjField', 1, 'title', 'Status', 'script', NULL),
(277, 277, 'pjField', 1, 'title', 'Subject', 'script', NULL),
(278, 278, 'pjField', 1, 'title', 'Sub-total', 'script', NULL),
(279, 279, 'pjField', 1, 'title', 'Invoices', 'script', NULL),
(280, 280, 'pjField', 1, 'title', 'Tax', 'script', NULL),
(281, 281, 'pjField', 1, 'title', 'Ticket', 'script', NULL),
(282, 282, 'pjField', 1, 'title', 'Are you sure that you want to set this ticket as used.', 'script', NULL),
(283, 283, 'pjField', 1, 'title', 'Ticket confirmation', 'script', NULL),
(284, 284, 'pjField', 1, 'title', 'Tickets', 'script', NULL),
(285, 285, 'pjField', 1, 'title', 'Title', 'script', NULL),
(286, 286, 'pjField', 1, 'title', 'to', 'script', NULL),
(287, 287, 'pjField', 1, 'title', 'To administrators', 'script', NULL),
(288, 288, 'pjField', 1, 'title', 'To customers', 'script', NULL),
(289, 289, 'pjField', 1, 'title', 'Today', 'script', NULL),
(290, 290, 'pjField', 1, 'title', 'Tomorrow', 'script', NULL),
(291, 291, 'pjField', 1, 'title', 'Total', 'script', NULL),
(292, 292, 'pjField', 1, 'title', 'Total bookings', 'script', NULL),
(293, 293, 'pjField', 1, 'title', 'Total price', 'script', NULL),
(294, 294, 'pjField', 1, 'title', 'Total seats', 'script', NULL),
(295, 295, 'pjField', 1, 'title', 'Type', 'script', NULL),
(296, 296, 'pjField', 1, 'title', 'Update booking', 'script', NULL),
(297, 297, 'pjField', 1, 'title', 'Update event', 'script', NULL),
(298, 298, 'pjField', 1, 'title', 'Add a custom name for this spot on the map (VIP sector, Sector A, etc..). Also set how many available seats can be reserved in this sector.', 'script', NULL),
(299, 299, 'pjField', 1, 'title', 'Update map', 'script', NULL),
(300, 300, 'pjField', 1, 'title', 'Update user', 'script', NULL),
(301, 301, 'pjField', 1, 'title', 'Update hall', 'script', NULL),
(302, 302, 'pjField', 1, 'title', 'Registration date/time', 'script', NULL),
(303, 303, 'pjField', 1, 'title', 'Use seats map', 'script', NULL),
(304, 304, 'pjField', 1, 'title', 'Use ticket', 'script', NULL),
(305, 305, 'pjField', 1, 'title', 'Value', 'script', NULL),
(306, 306, 'pjField', 1, 'title', 'Hall', 'script', NULL),
(307, 307, 'pjField', 1, 'title', 'Width', 'script', NULL),
(308, 308, 'pjField', 1, 'title', 'Yes', 'script', NULL),
(309, 309, 'pjField', 1, 'title', 'Back', 'script', NULL),
(310, 310, 'pjField', 1, 'title', 'Arrays titles', 'script', NULL),
(311, 311, 'pjField', 1, 'title', 'Languages', 'script', NULL),
(312, 312, 'pjField', 1, 'title', 'Flag', 'script', NULL),
(313, 313, 'pjField', 1, 'title', 'Is default', 'script', NULL),
(314, 314, 'pjField', 1, 'title', 'Order', 'script', NULL),
(315, 315, 'pjField', 1, 'title', 'Title', 'script', NULL),
(316, 316, 'pjField', 1, 'title', 'Backup', 'script', NULL),
(317, 317, 'pjField', 1, 'title', 'Booking form', 'script', NULL),
(318, 318, 'pjField', 1, 'title', 'Bookings', 'script', NULL),
(319, 319, 'pjField', 1, 'title', 'Dashboard', 'script', NULL),
(320, 320, 'pjField', 1, 'title', 'Events', 'script', NULL),
(321, 321, 'pjField', 1, 'title', 'General', 'script', NULL),
(322, 322, 'pjField', 1, 'title', 'Install', 'script', NULL),
(323, 323, 'pjField', 1, 'title', 'Multi Lang', 'script', NULL),
(324, 324, 'pjField', 1, 'title', 'Languages', 'script', NULL),
(325, 325, 'pjField', 1, 'title', 'Logout', 'script', NULL),
(326, 326, 'pjField', 1, 'title', 'Notifications', 'script', NULL),
(327, 327, 'pjField', 1, 'title', 'Options', 'script', NULL),
(328, 328, 'pjField', 1, 'title', 'Plugins', 'script', NULL),
(329, 329, 'pjField', 1, 'title', 'Preview', 'script', NULL),
(330, 330, 'pjField', 1, 'title', 'Preview & Install', 'script', NULL),
(331, 331, 'pjField', 1, 'title', 'Profile', 'script', NULL),
(332, 332, 'pjField', 1, 'title', 'Now Showing', 'script', NULL),
(333, 333, 'pjField', 1, 'title', 'Terms', 'script', NULL),
(334, 334, 'pjField', 1, 'title', 'Ticket', 'script', NULL),
(335, 335, 'pjField', 1, 'title', 'Users', 'script', NULL),
(336, 336, 'pjField', 1, 'title', 'Auditorium', 'script', NULL),
(337, 337, 'pjField', 1, 'title', 'Click on the flag icon to choose which language version of the content you wish to edit.', 'script', NULL),
(338, 338, 'pjField', 1, 'title', 'New booking SMS', 'script', NULL),
(339, 339, 'pjField', 1, 'title', '<u>Available tokens</u>{Name}<br/>{Email}<br/>{Movie}<br/>{Showtime}<br/>{CinemaHall}<br/>{BookingSeats}<br/>{Tickets}<br/>{Deposit}<br/>{Total}<br/>{Tax}', 'script', NULL),
(340, 340, 'pjField', 1, 'title', 'Payment confirmation SMS', 'script', NULL),
(341, 341, 'pjField', 1, 'title', '<u>Available tokens</u>{Name}<br/>{Email}<br/>{Movie}<br/>{Showtime}<br/>{CinemaHall}<br/>{BookingSeats}<br/>{Tickets}<br/>{Deposit}<br/>{Total}<br/>{Tax}', 'script', NULL),
(342, 342, 'pjField', 1, 'title', 'Allow payments with Authorize.net ', 'script', NULL),
(343, 343, 'pjField', 1, 'title', 'Provide Bank account details for wire transfers', 'script', NULL),
(344, 344, 'pjField', 1, 'title', 'Allow payment with cash', 'script', NULL),
(345, 345, 'pjField', 1, 'title', 'Collect Credit Card details for offline processing', 'script', NULL),
(346, 346, 'pjField', 1, 'title', 'Allow payments with PayPal', 'script', NULL),
(347, 347, 'pjField', 1, 'title', 'Authorize.net MD5 hash', 'script', NULL),
(348, 348, 'pjField', 1, 'title', 'Authorize.net merchant ID', 'script', NULL),
(349, 349, 'pjField', 1, 'title', 'Authorize.net time zone', 'script', NULL),
(350, 350, 'pjField', 1, 'title', 'Authorize.net transaction key', 'script', NULL),
(351, 351, 'pjField', 1, 'title', 'Bank Account', 'script', NULL),
(352, 352, 'pjField', 1, 'title', 'Address', 'script', NULL),
(353, 353, 'pjField', 1, 'title', 'Captcha', 'script', NULL),
(354, 354, 'pjField', 1, 'title', 'City', 'script', NULL),
(355, 355, 'pjField', 1, 'title', 'Company', 'script', NULL),
(356, 356, 'pjField', 1, 'title', 'Country', 'script', NULL),
(357, 357, 'pjField', 1, 'title', 'Email', 'script', NULL),
(358, 358, 'pjField', 1, 'title', 'Name', 'script', NULL),
(359, 359, 'pjField', 1, 'title', 'Notes', 'script', NULL),
(360, 360, 'pjField', 1, 'title', 'Phone', 'script', NULL),
(361, 361, 'pjField', 1, 'title', 'State', 'script', NULL),
(362, 362, 'pjField', 1, 'title', 'Title', 'script', NULL),
(363, 363, 'pjField', 1, 'title', 'Zip', 'script', NULL),
(364, 364, 'pjField', 1, 'title', 'Book X minutes before the event', 'script', NULL),
(365, 365, 'pjField', 1, 'title', 'set how many hours before the event start time a booking can be made', 'script', NULL),
(366, 366, 'pjField', 1, 'title', 'All bookings which are only made but NOT paid will be set with the following status', 'script', NULL),
(367, 367, 'pjField', 1, 'title', 'set the default status for each booking after it is made', 'script', NULL),
(368, 368, 'pjField', 1, 'title', 'Currency', 'script', NULL),
(369, 369, 'pjField', 1, 'title', 'Date format', 'script', NULL),
(370, 370, 'pjField', 1, 'title', 'Deposit payment', 'script', NULL),
(371, 371, 'pjField', 1, 'title', 'set % of the booking amount to be paid as a deposit. For full payment enter 100', 'script', NULL),
(372, 372, 'pjField', 1, 'title', 'Send cancellation email', 'script', NULL),
(373, 373, 'pjField', 1, 'title', 'Cancel confirmation message', 'script', NULL),
(374, 374, 'pjField', 1, 'title', '<u>Available Tokens:</u>{Name}<br/>{Email}<br/>{Phone}<br/>{Country}<br/>{City}<br/>{Address}<br/>{Notes}<br/>{Movie}<br/>{MovieID}<br/>{Showtime}<br/>{BookingID}<br/>{CinemaHall}<br/>{BookingSeats}<br/>{Tickets}<br/>{Deposit}<br/>{Total}<br/>{Tax}<br/>{PaymentMethod}<br/>{CCType}<br/>{CCNum}<br/>{CCExp}<br/>{CCSec}<br/>{CancelURL}<br/>{TicketPrice}<br/>{PDFticket}', 'script', NULL),
(375, 375, 'pjField', 1, 'title', 'Cancel confirmation subject', 'script', NULL),
(376, 376, 'pjField', 1, 'title', 'New booking received email', 'script', NULL),
(377, 377, 'pjField', 1, 'title', 'New booking confirmation message', 'script', NULL),
(378, 378, 'pjField', 1, 'title', '<u>Available Tokens:</u>{Name}<br/>{Email}<br/>{Phone}<br/>{Country}<br/>{City}<br/>{Address}<br/>{Notes}<br/>{Movie}<br/>{MovieID}<br/>{Showtime}<br/>{BookingID}<br/>{CinemaHall}<br/>{BookingSeats}<br/>{Tickets}<br/>{Deposit}<br/>{Total}<br/>{Tax}<br/>{PaymentMethod}<br/>{CCType}<br/>{CCNum}<br/>{CCExp}<br/>{CCSec}<br/>{CancelURL}<br/>{TicketPrice}<br/>{PDFticket}', 'script', NULL),
(379, 379, 'pjField', 1, 'title', 'New booking confirmation subject', 'script', NULL),
(380, 380, 'pjField', 1, 'title', 'Select \'Yes\' if you\'d like to let your customers know that you received their bookings. ', 'script', NULL),
(381, 381, 'pjField', 1, 'title', 'Send payment confirmation email', 'script', NULL),
(382, 382, 'pjField', 1, 'title', 'Payment confirmation message', 'script', NULL),
(383, 383, 'pjField', 1, 'title', '<u>Available Tokens:</u>{Name}<br/>{Email}<br/>{Phone}<br/>{Country}<br/>{City}<br/>{Address}<br/>{Notes}<br/>{Movie}<br/>{MovieID}<br/>{Showtime}<br/>{BookingID}<br/>{CinemaHall}<br/>{BookingSeats}<br/>{Tickets}<br/>{Deposit}<br/>{Total}<br/>{Tax}<br/>{PaymentMethod}<br/>{CCType}<br/>{CCNum}<br/>{CCExp}<br/>{CCSec}<br/>{CancelURL}<br/>{TicketPrice}<br/>{PDFticket}', 'script', NULL),
(384, 384, 'pjField', 1, 'title', 'Payment confirmation subject', 'script', NULL),
(385, 385, 'pjField', 1, 'title', 'Select \'Yes\' if you want to notify your customers for receiving their payment.', 'script', NULL),
(386, 386, 'pjField', 1, 'title', 'Theme', 'script', NULL),
(387, 387, 'pjField', 1, 'title', 'Select \'Yes\' if you want to disable payments and only collect booking details ', 'script', NULL),
(388, 388, 'pjField', 1, 'title', 'All bookings which are made and paid will be set with the following status', 'script', NULL),
(389, 389, 'pjField', 1, 'title', 'PayPal business email address', 'script', NULL),
(390, 390, 'pjField', 1, 'title', 'Send email', 'script', NULL),
(391, 391, 'pjField', 1, 'title', 'Send PDF ticket', 'script', NULL),
(392, 392, 'pjField', 1, 'title', 'Booking reminder SMS', 'script', NULL),
(393, 393, 'pjField', 1, 'title', '<u>Available tokens</u>{Name}<br/>{Email}<br/>{Movie}<br/>{Showtime}<br/>{CinemaHall}<br/>{BookingSeats}<br/>{Tickets}<br/>{Deposit}<br/>{Total}<br/>{Tax}', 'script', NULL),
(394, 394, 'pjField', 1, 'title', 'SMTP Host', 'script', NULL),
(395, 395, 'pjField', 1, 'title', 'SMTP Password', 'script', NULL),
(396, 396, 'pjField', 1, 'title', 'SMTP Port', 'script', NULL),
(397, 397, 'pjField', 1, 'title', 'SMTP Username', 'script', NULL),
(398, 398, 'pjField', 1, 'title', 'Tax payment', 'script', NULL),
(399, 399, 'pjField', 1, 'title', 'set % for tax that clients pay', 'script', NULL),
(400, 400, 'pjField', 1, 'title', 'Terms and Conditions', 'script', NULL),
(401, 401, 'pjField', 1, 'title', 'URL for the web page where your clients will be redirected after PayPal or Authorize.net payment ', 'script', NULL),
(402, 402, 'pjField', 1, 'title', 'Ticket data', 'script', NULL),
(403, 403, 'pjField', 1, 'title', '<u>Available Tokens:</u><br/>{Name}<br/>{Email}<br/>{Phone}<br/>{Movie}<br/>{Showtime}<br/>{CinemaHall}<br/>{BookingSeats}<br/>{TicketPrice}', 'script', NULL),
(404, 404, 'pjField', 1, 'title', 'Ticket', 'script', NULL),
(405, 405, 'pjField', 1, 'title', 'Timezone', 'script', NULL),
(406, 406, 'pjField', 1, 'title', 'Time format', 'script', NULL),
(407, 407, 'pjField', 1, 'title', 'First day of the week', 'script', NULL),
(408, 408, 'pjField', 1, 'title', 'Password', 'script', NULL),
(409, 409, 'pjField', 1, 'title', 'User with such email address exists.', 'script', NULL),
(410, 410, 'pjField', 1, 'title', 'Revert status', 'script', NULL),
(411, 411, 'pjField', 1, 'title', 'Barcode reader', 'script', NULL),
(412, 412, 'pjField', 1, 'title', 'This field is required.', 'script', NULL),
(413, 413, 'pjField', 1, 'title', 'You have to set up at least one seat on the map.', 'script', NULL),
(414, 414, 'pjField', 1, 'title', 'URL', 'script', NULL),
(415, 415, 'pjField', 1, 'title', 'Username', 'script', NULL),
(416, 416, 'pjField', 1, 'title', 'Available', 'script', NULL),
(417, 417, 'pjField', 1, 'title', 'Back', 'script', NULL),
(418, 418, 'pjField', 1, 'title', 'Bank account', 'script', NULL),
(419, 419, 'pjField', 1, 'title', 'Blocked', 'script', NULL),
(420, 420, 'pjField', 1, 'title', 'Booking created', 'script', NULL),
(421, 421, 'pjField', 1, 'title', 'Cancel', 'script', NULL),
(422, 422, 'pjField', 1, 'title', 'Cancel', 'script', NULL),
(423, 423, 'pjField', 1, 'title', 'Confirm Booking', 'script', NULL),
(424, 424, 'pjField', 1, 'title', 'Continue', 'script', NULL),
(425, 425, 'pjField', 1, 'title', 'Purchase tickets', 'script', NULL),
(426, 426, 'pjField', 1, 'title', 'Start over', 'script', NULL),
(427, 427, 'pjField', 1, 'title', 'Booking ID', 'script', NULL),
(428, 428, 'pjField', 1, 'title', 'Booking seats', 'script', NULL),
(429, 429, 'pjField', 1, 'title', 'Event showtime', 'script', NULL),
(430, 430, 'pjField', 1, 'title', 'Event', 'script', NULL),
(431, 431, 'pjField', 1, 'title', 'Your booking details', 'script', NULL),
(432, 432, 'pjField', 1, 'title', 'Tickets & prices', 'script', NULL),
(433, 433, 'pjField', 1, 'title', 'Captcha', 'script', NULL),
(434, 434, 'pjField', 1, 'title', 'CC expiration', 'script', NULL),
(435, 435, 'pjField', 1, 'title', 'CC number', 'script', NULL),
(436, 436, 'pjField', 1, 'title', 'CC code', 'script', NULL),
(437, 437, 'pjField', 1, 'title', 'CC type', 'script', NULL),
(438, 438, 'pjField', 1, 'title', 'Current month', 'script', NULL),
(439, 439, 'pjField', 1, 'title', 'Address', 'script', NULL),
(440, 440, 'pjField', 1, 'title', 'City', 'script', NULL),
(441, 441, 'pjField', 1, 'title', 'Company', 'script', NULL),
(442, 442, 'pjField', 1, 'title', 'Country', 'script', NULL),
(443, 443, 'pjField', 1, 'title', 'Email', 'script', NULL),
(444, 444, 'pjField', 1, 'title', 'Name', 'script', NULL),
(445, 445, 'pjField', 1, 'title', 'Notes', 'script', NULL),
(446, 446, 'pjField', 1, 'title', 'Phone', 'script', NULL),
(447, 447, 'pjField', 1, 'title', 'State', 'script', NULL),
(448, 448, 'pjField', 1, 'title', 'Title', 'script', NULL),
(449, 449, 'pjField', 1, 'title', 'Zip', 'script', NULL),
(450, 450, 'pjField', 1, 'title', 'Date', 'script', NULL),
(451, 451, 'pjField', 1, 'title', 'Deposit', 'script', NULL),
(452, 452, 'pjField', 1, 'title', 'Choose', 'script', NULL),
(453, 453, 'pjField', 1, 'title', 'Fill in your details', 'script', NULL),
(454, 454, 'pjField', 1, 'title', 'Hall', 'script', NULL),
(455, 455, 'pjField', 1, 'title', 'click on a seat above to remove it', 'script', NULL),
(456, 456, 'pjField', 1, 'title', 'Payment method', 'script', NULL),
(457, 457, 'pjField', 1, 'title', 'Processed on', 'script', NULL),
(458, 458, 'pjField', 1, 'title', 'Paypal Transaction ID', 'script', NULL),
(459, 459, 'pjField', 1, 'title', 'Minutes', 'script', NULL),
(460, 460, 'pjField', 1, 'title', 'Event', 'script', NULL),
(461, 461, 'pjField', 1, 'title', 'N/A', 'script', NULL),
(462, 462, 'pjField', 1, 'title', 'No events found', 'script', NULL),
(463, 463, 'pjField', 1, 'title', 'No available seats.', 'script', NULL),
(464, 464, 'pjField', 1, 'title', 'No showtimes on selected date.', 'script', NULL),
(465, 465, 'pjField', 1, 'title', 'Payment information', 'script', NULL),
(466, 466, 'pjField', 1, 'title', 'Payment method', 'script', NULL),
(467, 467, 'pjField', 1, 'title', 'Personal details', 'script', NULL),
(468, 468, 'pjField', 1, 'title', 'Your address', 'script', NULL),
(469, 469, 'pjField', 1, 'title', 'City', 'script', NULL),
(470, 470, 'pjField', 1, 'title', 'Company name', 'script', NULL),
(471, 471, 'pjField', 1, 'title', 'Your email', 'script', NULL),
(472, 472, 'pjField', 1, 'title', 'Your name', 'script', NULL),
(473, 473, 'pjField', 1, 'title', 'Notes', 'script', NULL),
(474, 474, 'pjField', 1, 'title', 'Phone number', 'script', NULL),
(475, 475, 'pjField', 1, 'title', 'State', 'script', NULL),
(476, 476, 'pjField', 1, 'title', 'Postal code', 'script', NULL),
(477, 477, 'pjField', 1, 'title', 'Running time', 'script', NULL),
(478, 478, 'pjField', 1, 'title', 'Selected', 'script', NULL),
(479, 479, 'pjField', 1, 'title', 'Selected date', 'script', NULL),
(480, 480, 'pjField', 1, 'title', 'Selected seat(s)', 'script', NULL),
(481, 481, 'pjField', 1, 'title', 'click on available seat on the map to reserve it', 'script', NULL),
(482, 482, 'pjField', 1, 'title', 'Select date', 'script', NULL),
(483, 483, 'pjField', 1, 'title', 'Select ticket types below', 'script', NULL),
(484, 484, 'pjField', 1, 'title', 'Select time', 'script', NULL),
(485, 485, 'pjField', 1, 'title', 'Missing parameters. Please click on the \"Start over\" button to make new booking.', 'script', NULL),
(486, 486, 'pjField', 1, 'title', 'Sub-total', 'script', NULL),
(487, 487, 'pjField', 1, 'title', 'Tax', 'script', NULL),
(488, 488, 'pjField', 1, 'title', 'Accept terms of booking', 'script', NULL),
(489, 489, 'pjField', 1, 'title', 'Terms and conditions', 'script', NULL),
(490, 490, 'pjField', 1, 'title', 'Time', 'script', NULL),
(491, 491, 'pjField', 1, 'title', 'Today', 'script', NULL),
(492, 492, 'pjField', 1, 'title', 'Tomorrow', 'script', NULL),
(493, 493, 'pjField', 1, 'title', 'Total', 'script', NULL),
(494, 494, 'pjField', 1, 'title', 'Total price', 'script', NULL),
(495, 495, 'pjField', 1, 'title', 'Your details', 'script', NULL),
(496, 496, 'pjField', 1, 'title', 'Missing parameters', 'script', NULL),
(497, 497, 'pjField', 1, 'title', 'Missing or wrong captcha.', 'script', NULL),
(498, 498, 'pjField', 1, 'title', 'We are sorry, but your booking failed. The available seat(s) for the selected event have finished while you were placing your order. You can [STAG]start over[ETAG] searching for other seats.', 'script', NULL),
(499, 499, 'pjField', 1, 'title', 'The booking could not be saved successfully.', 'script', NULL),
(500, 500, 'pjField', 1, 'title', 'Checkout submitted', 'script', NULL),
(501, 501, 'pjField', 1, 'title', 'New booking SMS', 'script', NULL),
(502, 502, 'pjField', 1, 'title', 'Payment confirmation SMS', 'script', NULL),
(503, 503, 'pjField', 1, 'title', 'Cancelled', 'script', NULL),
(504, 504, 'pjField', 1, 'title', 'Confirmed', 'script', NULL),
(505, 505, 'pjField', 1, 'title', 'Pending', 'script', NULL),
(506, 506, 'pjField', 1, 'title', 'Cancel', 'script', NULL),
(507, 507, 'pjField', 1, 'title', 'Delete', 'script', NULL),
(508, 508, 'pjField', 1, 'title', 'No', 'script', NULL),
(509, 509, 'pjField', 1, 'title', 'OK', 'script', NULL),
(510, 510, 'pjField', 1, 'title', 'Save', 'script', NULL),
(511, 511, 'pjField', 1, 'title', 'Set', 'script', NULL),
(512, 512, 'pjField', 1, 'title', 'Yes', 'script', NULL),
(513, 513, 'pjField', 1, 'title', 'Missing parameters', 'script', NULL),
(514, 514, 'pjField', 1, 'title', 'Booking with such ID does not exist.', 'script', NULL),
(515, 515, 'pjField', 1, 'title', 'Booking has been cancelled successfully.', 'script', NULL),
(516, 516, 'pjField', 1, 'title', 'Security hash did not match.', 'script', NULL),
(517, 517, 'pjField', 1, 'title', 'Booking is already cancelled.', 'script', NULL),
(518, 518, 'pjField', 1, 'title', 'AmericanExpress', 'script', NULL),
(519, 519, 'pjField', 1, 'title', 'Maestro', 'script', NULL),
(520, 520, 'pjField', 1, 'title', 'MasterCard', 'script', NULL),
(521, 521, 'pjField', 1, 'title', 'Visa', 'script', NULL),
(522, 522, 'pjField', 1, 'title', 'Send cancellation email', 'script', NULL),
(523, 523, 'pjField', 1, 'title', 'New booking received email', 'script', NULL),
(524, 524, 'pjField', 1, 'title', 'Send payment confirmation email', 'script', NULL),
(525, 525, 'pjField', 1, 'title', 'Today', 'script', NULL),
(526, 526, 'pjField', 1, 'title', 'Tomorrow', 'script', NULL),
(527, 527, 'pjField', 1, 'title', 'This week', 'script', NULL),
(528, 528, 'pjField', 1, 'title', 'Next week', 'script', NULL),
(529, 529, 'pjField', 1, 'title', 'This month', 'script', NULL),
(530, 530, 'pjField', 1, 'title', 'Next month', 'script', NULL),
(531, 531, 'pjField', 1, 'title', 'Sunday', 'script', NULL),
(532, 532, 'pjField', 1, 'title', 'Monday', 'script', NULL),
(533, 533, 'pjField', 1, 'title', 'Tuesday', 'script', NULL),
(534, 534, 'pjField', 1, 'title', 'Wednesday', 'script', NULL),
(535, 535, 'pjField', 1, 'title', 'Thursday', 'script', NULL),
(536, 536, 'pjField', 1, 'title', 'Friday', 'script', NULL),
(537, 537, 'pjField', 1, 'title', 'Saturday', 'script', NULL),
(538, 538, 'pjField', 1, 'title', 'S', 'script', NULL),
(539, 539, 'pjField', 1, 'title', 'M', 'script', NULL),
(540, 540, 'pjField', 1, 'title', 'T', 'script', NULL),
(541, 541, 'pjField', 1, 'title', 'W', 'script', NULL),
(542, 542, 'pjField', 1, 'title', 'T', 'script', NULL),
(543, 543, 'pjField', 1, 'title', 'F', 'script', NULL),
(544, 544, 'pjField', 1, 'title', 'S', 'script', NULL),
(545, 545, 'pjField', 1, 'title', 'Given email address is not associated with any account.', 'script', NULL),
(546, 546, 'pjField', 1, 'title', 'For further instructions please check your mailbox.', 'script', NULL),
(547, 547, 'pjField', 1, 'title', 'We are sorry, please try again later.', 'script', NULL),
(548, 548, 'pjField', 1, 'title', 'All the changes made to your profile have been saved.', 'script', NULL),
(549, 549, 'pjField', 1, 'title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at ligula non arcu dignissim pretium. Praesent in magna nulla, in porta leo.', 'script', NULL),
(550, 550, 'pjField', 1, 'title', 'All backup files have been saved.', 'script', NULL),
(551, 551, 'pjField', 1, 'title', 'No option was selected.', 'script', NULL),
(552, 552, 'pjField', 1, 'title', 'Backup not performed.', 'script', NULL),
(553, 553, 'pjField', 1, 'title', 'All changes made to the event have been saved.', 'script', NULL),
(554, 554, 'pjField', 1, 'title', 'New event has been added.', 'script', NULL),
(555, 555, 'pjField', 1, 'title', 'New event could not be added successfully.', 'script', NULL),
(556, 556, 'pjField', 1, 'title', 'New event could not be added because image size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(557, 557, 'pjField', 1, 'title', 'The event could not be updated because image size too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(558, 558, 'pjField', 1, 'title', 'No such event.', 'script', NULL),
(559, 559, 'pjField', 1, 'title', 'Event has been added. Image file is too big and was not uploaded.', 'script', NULL),
(560, 560, 'pjField', 1, 'title', 'Event has been added. Image file is too big and was not uploaded.', 'script', NULL),
(561, 561, 'pjField', 1, 'title', 'Directory app/web/upload/events or app/web/upload/tickets  has no permissions to upload seat maps. Please set permissions to 777.', 'script', NULL),
(562, 562, 'pjField', 1, 'title', 'The Event image could not be uploaded because it is not image file. Please upload another image.', 'script', NULL),
(563, 563, 'pjField', 1, 'title', 'All changes made to the showtimes have been saved.', 'script', NULL),
(564, 564, 'pjField', 1, 'title', 'All the changes made to titles have been saved.', 'script', NULL),
(565, 565, 'pjField', 1, 'title', 'All the changes made to options have been saved.', 'script', NULL),
(566, 566, 'pjField', 1, 'title', 'All changes made to the booking options have been saved successfully.', 'script', NULL),
(567, 567, 'pjField', 1, 'title', 'All changes made to notifications have been saved successfully.', 'script', NULL),
(568, 568, 'pjField', 1, 'title', 'All changes made to booking form have been saved successfully.', 'script', NULL),
(569, 569, 'pjField', 1, 'title', 'All changes made to ticket setting have been saved successfully.', 'script', NULL),
(570, 570, 'pjField', 1, 'title', 'All changes made to Terms and Conditions have been saved successfully.', 'script', NULL),
(571, 571, 'pjField', 1, 'title', 'The ticket information could not be updated because image size too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(572, 572, 'pjField', 1, 'title', 'All changes to the booking have been saved.', 'script', NULL),
(573, 573, 'pjField', 1, 'title', 'A new booking has been added into the list.', 'script', NULL),
(574, 574, 'pjField', 1, 'title', 'We are sorry that new booking could not be added successfully.', 'script', NULL),
(575, 575, 'pjField', 1, 'title', 'We are sorry that booking you are looking is missing.', 'script', NULL),
(576, 576, 'pjField', 1, 'title', 'The confirmation email has been sent to the client.', 'script', NULL),
(577, 577, 'pjField', 1, 'title', 'You can export events in different formats. You can either download a file with event details or use a link for a feed which load all the events.', 'script', NULL),
(578, 578, 'pjField', 1, 'title', 'All the changes made to this user have been saved.', 'script', NULL),
(579, 579, 'pjField', 1, 'title', 'All the changes made to this user have been saved.', 'script', NULL),
(580, 580, 'pjField', 1, 'title', 'We are sorry, but the user has not been added.', 'script', NULL),
(581, 581, 'pjField', 1, 'title', 'User your looking for is missing.', 'script', NULL),
(582, 582, 'pjField', 1, 'title', 'All changes made to the hall have been saved.', 'script', NULL),
(583, 583, 'pjField', 1, 'title', 'Hall has been added.', 'script', NULL),
(584, 584, 'pjField', 1, 'title', 'Hall was not added.', 'script', NULL),
(585, 585, 'pjField', 1, 'title', 'New hall could not be added because image size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(586, 586, 'pjField', 1, 'title', 'The hall could not be updated because image size too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL);
INSERT INTO `tk_cbs_multi_lang` (`id`, `foreign_id`, `model`, `locale`, `field`, `content`, `source`, `deleted_at`) VALUES
(587, 587, 'pjField', 1, 'title', 'Hall not found.', 'script', NULL),
(588, 588, 'pjField', 1, 'title', 'Uploaded image is too big. Please, upload smaller image.', 'script', NULL),
(589, 589, 'pjField', 1, 'title', 'New hall has been added, but uploaded image is too big. Please, upload smaller image.', 'script', NULL),
(590, 590, 'pjField', 1, 'title', 'Directory app/web/upload/maps has no permissions to upload seat maps. Please set permissions to 777.', 'script', NULL),
(591, 591, 'pjField', 1, 'title', 'The map file could not be uploaded because actually it is not image file. Please upload another image.', 'script', NULL),
(592, 592, 'pjField', 1, 'title', 'Account not found!', 'script', NULL),
(593, 593, 'pjField', 1, 'title', 'Password send!', 'script', NULL),
(594, 594, 'pjField', 1, 'title', 'Password not send!', 'script', NULL),
(595, 595, 'pjField', 1, 'title', 'Profile updated!', 'script', NULL),
(596, 596, 'pjField', 1, 'title', 'Backup', 'script', NULL),
(597, 597, 'pjField', 1, 'title', 'Backup complete!', 'script', NULL),
(598, 598, 'pjField', 1, 'title', 'Backup failed!', 'script', NULL),
(599, 599, 'pjField', 1, 'title', 'Backup failed!', 'script', NULL),
(600, 600, 'pjField', 1, 'title', 'Event updated', 'script', NULL),
(601, 601, 'pjField', 1, 'title', 'Event added', 'script', NULL),
(602, 602, 'pjField', 1, 'title', 'Event was not added.', 'script', NULL),
(603, 603, 'pjField', 1, 'title', 'Image size too large', 'script', NULL),
(604, 604, 'pjField', 1, 'title', 'Image size too large', 'script', NULL),
(605, 605, 'pjField', 1, 'title', 'Event not found.', 'script', NULL),
(606, 606, 'pjField', 1, 'title', 'File size exceeded', 'script', NULL),
(607, 607, 'pjField', 1, 'title', 'File size exceeded', 'script', NULL),
(608, 608, 'pjField', 1, 'title', 'No permissions', 'script', NULL),
(609, 609, 'pjField', 1, 'title', 'Wrong file type', 'script', NULL),
(610, 610, 'pjField', 1, 'title', 'Showtimes updated', 'script', NULL),
(611, 611, 'pjField', 1, 'title', 'Options updated!', 'script', NULL),
(612, 612, 'pjField', 1, 'title', 'Booking options updated', 'script', NULL),
(613, 613, 'pjField', 1, 'title', 'Notifications updated', 'script', NULL),
(614, 614, 'pjField', 1, 'title', 'Booking form updated', 'script', NULL),
(615, 615, 'pjField', 1, 'title', 'Ticket setting update', 'script', NULL),
(616, 616, 'pjField', 1, 'title', 'Terms and conditions updated', 'script', NULL),
(617, 617, 'pjField', 1, 'title', 'Image size too large', 'script', NULL),
(618, 618, 'pjField', 1, 'title', 'Booking updated', 'script', NULL),
(619, 619, 'pjField', 1, 'title', 'Booking added', 'script', NULL),
(620, 620, 'pjField', 1, 'title', 'Booking failed to add', 'script', NULL),
(621, 621, 'pjField', 1, 'title', 'Booking not found', 'script', NULL),
(622, 622, 'pjField', 1, 'title', 'Confirmation email sent', 'script', NULL),
(623, 623, 'pjField', 1, 'title', 'Export events', 'script', NULL),
(624, 624, 'pjField', 1, 'title', 'User updated!', 'script', NULL),
(625, 625, 'pjField', 1, 'title', 'User added!', 'script', NULL),
(626, 626, 'pjField', 1, 'title', 'User failed to add.', 'script', NULL),
(627, 627, 'pjField', 1, 'title', 'User not found.', 'script', NULL),
(628, 628, 'pjField', 1, 'title', 'Hall updated.', 'script', NULL),
(629, 629, 'pjField', 1, 'title', 'Hall added', 'script', NULL),
(630, 630, 'pjField', 1, 'title', 'Hall was not added.', 'script', NULL),
(631, 631, 'pjField', 1, 'title', 'Image size too large', 'script', NULL),
(632, 632, 'pjField', 1, 'title', 'Image size too large', 'script', NULL),
(633, 633, 'pjField', 1, 'title', 'Hall not found.', 'script', NULL),
(634, 634, 'pjField', 1, 'title', 'File size exceeded', 'script', NULL),
(635, 635, 'pjField', 1, 'title', 'File size exceeded', 'script', NULL),
(636, 636, 'pjField', 1, 'title', 'No permissions', 'script', NULL),
(637, 637, 'pjField', 1, 'title', 'Wrong file type', 'script', NULL),
(638, 638, 'pjField', 1, 'title', 'CSV', 'script', NULL),
(639, 639, 'pjField', 1, 'title', 'iCal', 'script', NULL),
(640, 640, 'pjField', 1, 'title', 'XML', 'script', NULL),
(641, 641, 'pjField', 1, 'title', 'Past', 'script', NULL),
(642, 642, 'pjField', 1, 'title', 'Coming', 'script', NULL),
(643, 643, 'pjField', 1, 'title', 'Feed', 'script', NULL),
(644, 644, 'pjField', 1, 'title', 'File', 'script', NULL),
(645, 645, 'pjField', 1, 'title', 'Active', 'script', NULL),
(646, 646, 'pjField', 1, 'title', 'Inactive', 'script', NULL),
(647, 647, 'pjField', 1, 'title', 'Thank you! Your booking has been made. Please click on the \"Start over\" button to make new booking.', 'script', NULL),
(648, 648, 'pjField', 1, 'title', 'Please wait while redirect to secure payment processor webpage complete...', 'script', NULL),
(649, 649, 'pjField', 1, 'title', 'You need to select seat(s).', 'script', NULL),
(650, 650, 'pjField', 1, 'title', 'You already selected enough numbers of [TICKET] tickets.', 'script', NULL),
(651, 651, 'pjField', 1, 'title', 'The selected seats are not equal to the number of selected tickets. Please select more seats.', 'script', NULL),
(652, 652, 'pjField', 1, 'title', 'You need to select [TICKET] ticket.', 'script', NULL),
(653, 653, 'pjField', 1, 'title', 'Tickets and seats selected. {STAG}Continue{ETAG}', 'script', NULL),
(654, 654, 'pjField', 1, 'title', 'Select seats for {tickets} tickets.', 'script', NULL),
(655, 655, 'pjField', 1, 'title', 'Select seat for {tickets} ticket.', 'script', NULL),
(656, 656, 'pjField', 1, 'title', 'Wrong username or password', 'script', NULL),
(657, 657, 'pjField', 1, 'title', 'Access denied', 'script', NULL),
(658, 658, 'pjField', 1, 'title', 'Account is disabled', 'script', NULL),
(659, 659, 'pjField', 1, 'title', 'Today', 'script', NULL),
(660, 660, 'pjField', 1, 'title', 'Yesterday', 'script', NULL),
(661, 661, 'pjField', 1, 'title', 'This week', 'script', NULL),
(662, 662, 'pjField', 1, 'title', 'Last week', 'script', NULL),
(663, 663, 'pjField', 1, 'title', 'This month', 'script', NULL),
(664, 664, 'pjField', 1, 'title', 'Last month', 'script', NULL),
(665, 665, 'pjField', 1, 'title', 'January', 'script', NULL),
(666, 666, 'pjField', 1, 'title', 'October', 'script', NULL),
(667, 667, 'pjField', 1, 'title', 'November', 'script', NULL),
(668, 668, 'pjField', 1, 'title', 'December', 'script', NULL),
(669, 669, 'pjField', 1, 'title', 'February', 'script', NULL),
(670, 670, 'pjField', 1, 'title', 'March', 'script', NULL),
(671, 671, 'pjField', 1, 'title', 'April', 'script', NULL),
(672, 672, 'pjField', 1, 'title', 'May', 'script', NULL),
(673, 673, 'pjField', 1, 'title', 'June', 'script', NULL),
(674, 674, 'pjField', 1, 'title', 'July', 'script', NULL),
(675, 675, 'pjField', 1, 'title', 'August', 'script', NULL),
(676, 676, 'pjField', 1, 'title', 'September', 'script', NULL),
(677, 677, 'pjField', 1, 'title', 'Theme 1', 'script', NULL),
(678, 678, 'pjField', 1, 'title', 'Theme 10', 'script', NULL),
(679, 679, 'pjField', 1, 'title', 'Theme 2', 'script', NULL),
(680, 680, 'pjField', 1, 'title', 'Theme 3', 'script', NULL),
(681, 681, 'pjField', 1, 'title', 'Theme 4', 'script', NULL),
(682, 682, 'pjField', 1, 'title', 'Theme 5', 'script', NULL),
(683, 683, 'pjField', 1, 'title', 'Theme 6', 'script', NULL),
(684, 684, 'pjField', 1, 'title', 'Theme 7', 'script', NULL),
(685, 685, 'pjField', 1, 'title', 'Theme 8', 'script', NULL),
(686, 686, 'pjField', 1, 'title', 'Theme 9', 'script', NULL),
(687, 687, 'pjField', 1, 'title', 'Authorize.net', 'script', NULL),
(688, 688, 'pjField', 1, 'title', 'Bank account', 'script', NULL),
(689, 689, 'pjField', 1, 'title', 'Cash', 'script', NULL),
(690, 690, 'pjField', 1, 'title', 'Credit card', 'script', NULL),
(691, 691, 'pjField', 1, 'title', 'PayPal', 'script', NULL),
(692, 692, 'pjField', 1, 'title', 'Dr.', 'script', NULL),
(693, 693, 'pjField', 1, 'title', 'Miss', 'script', NULL),
(694, 694, 'pjField', 1, 'title', 'Mr.', 'script', NULL),
(695, 695, 'pjField', 1, 'title', 'Mrs.', 'script', NULL),
(696, 696, 'pjField', 1, 'title', 'Ms.', 'script', NULL),
(697, 697, 'pjField', 1, 'title', 'Other', 'script', NULL),
(698, 698, 'pjField', 1, 'title', 'Prof.', 'script', NULL),
(699, 699, 'pjField', 1, 'title', 'Rev.', 'script', NULL),
(700, 700, 'pjField', 1, 'title', 'Su', 'script', NULL),
(701, 701, 'pjField', 1, 'title', 'Mo', 'script', NULL),
(702, 702, 'pjField', 1, 'title', 'Tu', 'script', NULL),
(703, 703, 'pjField', 1, 'title', 'We', 'script', NULL),
(704, 704, 'pjField', 1, 'title', 'Th', 'script', NULL),
(705, 705, 'pjField', 1, 'title', 'Fr', 'script', NULL),
(706, 706, 'pjField', 1, 'title', 'Sa', 'script', NULL),
(707, 707, 'pjField', 1, 'title', 'Jan', 'script', NULL),
(708, 708, 'pjField', 1, 'title', 'Oct', 'script', NULL),
(709, 709, 'pjField', 1, 'title', 'Nov', 'script', NULL),
(710, 710, 'pjField', 1, 'title', 'Dec', 'script', NULL),
(711, 711, 'pjField', 1, 'title', 'Feb', 'script', NULL),
(712, 712, 'pjField', 1, 'title', 'Mar', 'script', NULL),
(713, 713, 'pjField', 1, 'title', 'Apr', 'script', NULL),
(714, 714, 'pjField', 1, 'title', 'May', 'script', NULL),
(715, 715, 'pjField', 1, 'title', 'Jun', 'script', NULL),
(716, 716, 'pjField', 1, 'title', 'Jul', 'script', NULL),
(717, 717, 'pjField', 1, 'title', 'Aug', 'script', NULL),
(718, 718, 'pjField', 1, 'title', 'Sep', 'script', NULL),
(719, 719, 'pjField', 1, 'title', 'You are not loged in.', 'script', NULL),
(720, 720, 'pjField', 1, 'title', 'Your hosting account does not allow uploading such a large image.', 'script', NULL),
(721, 721, 'pjField', 1, 'title', 'Access denied. You have not requisite rights to.', 'script', NULL),
(722, 722, 'pjField', 1, 'title', 'Empty resultset.', 'script', NULL),
(723, 723, 'pjField', 1, 'title', 'The operation is not allowed in demo mode.', 'script', NULL),
(724, 724, 'pjField', 1, 'title', 'No property for the reservation found', 'script', NULL),
(725, 725, 'pjField', 1, 'title', 'No reservation found', 'script', NULL),
(726, 726, 'pjField', 1, 'title', 'No permisions to edit the reservation', 'script', NULL),
(727, 727, 'pjField', 1, 'title', 'No permisions to edit the property', 'script', NULL),
(728, 728, 'pjField', 1, 'title', 'E-Mail address already exist', 'script', NULL),
(729, 729, 'pjField', 1, 'title', 'Your registration was successfull. Your account needs to be approved.', 'script', NULL),
(730, 730, 'pjField', 1, 'title', 'Your registration was successfull.', 'script', NULL),
(731, 731, 'pjField', 1, 'title', 'The ticket is valid.', 'script', NULL),
(732, 732, 'pjField', 1, 'title', 'Booking is not confirmed yet.', 'script', NULL),
(733, 733, 'pjField', 1, 'title', 'The ticket was already used.', 'script', NULL),
(734, 734, 'pjField', 1, 'title', 'The ticket could not be found in the system.', 'script', NULL),
(735, 735, 'pjField', 1, 'title', 'GMT-03:00', 'script', NULL),
(736, 736, 'pjField', 1, 'title', 'GMT-04:00', 'script', NULL),
(737, 737, 'pjField', 1, 'title', 'GMT-05:00', 'script', NULL),
(738, 738, 'pjField', 1, 'title', 'GMT-06:00', 'script', NULL),
(739, 739, 'pjField', 1, 'title', 'GMT-07:00', 'script', NULL),
(740, 740, 'pjField', 1, 'title', 'GMT-08:00', 'script', NULL),
(741, 741, 'pjField', 1, 'title', 'GMT-09:00', 'script', NULL),
(742, 742, 'pjField', 1, 'title', 'GMT-01:00', 'script', NULL),
(743, 743, 'pjField', 1, 'title', 'GMT-10:00', 'script', NULL),
(744, 744, 'pjField', 1, 'title', 'GMT-11:00', 'script', NULL),
(745, 745, 'pjField', 1, 'title', 'GMT-12:00', 'script', NULL),
(746, 746, 'pjField', 1, 'title', 'GMT-02:00', 'script', NULL),
(747, 747, 'pjField', 1, 'title', 'GMT', 'script', NULL),
(748, 748, 'pjField', 1, 'title', 'GMT+03:00', 'script', NULL),
(749, 749, 'pjField', 1, 'title', 'GMT+04:00', 'script', NULL),
(750, 750, 'pjField', 1, 'title', 'GMT+05:00', 'script', NULL),
(751, 751, 'pjField', 1, 'title', 'GMT+06:00', 'script', NULL),
(752, 752, 'pjField', 1, 'title', 'GMT+07:00', 'script', NULL),
(753, 753, 'pjField', 1, 'title', 'GMT+08:00', 'script', NULL),
(754, 754, 'pjField', 1, 'title', 'GMT+09:00', 'script', NULL),
(755, 755, 'pjField', 1, 'title', 'GMT+01:00', 'script', NULL),
(756, 756, 'pjField', 1, 'title', 'GMT+10:00', 'script', NULL),
(757, 757, 'pjField', 1, 'title', 'GMT+11:00', 'script', NULL),
(758, 758, 'pjField', 1, 'title', 'GMT+12:00', 'script', NULL),
(759, 759, 'pjField', 1, 'title', 'GMT+13:00', 'script', NULL),
(760, 760, 'pjField', 1, 'title', 'GMT+02:00', 'script', NULL),
(761, 761, 'pjField', 1, 'title', 'Inactive', 'script', NULL),
(762, 762, 'pjField', 1, 'title', 'Active', 'script', NULL),
(763, 763, 'pjField', 1, 'title', 'Address is required.', 'script', NULL),
(764, 764, 'pjField', 1, 'title', 'Captcha is required.', 'script', NULL),
(765, 765, 'pjField', 1, 'title', 'Captcha is incorrect.', 'script', NULL),
(766, 766, 'pjField', 1, 'title', 'CC code is required.', 'script', NULL),
(767, 767, 'pjField', 1, 'title', 'CC number is required.', 'script', NULL),
(768, 768, 'pjField', 1, 'title', 'CC type is required.', 'script', NULL),
(769, 769, 'pjField', 1, 'title', 'City is required.', 'script', NULL),
(770, 770, 'pjField', 1, 'title', 'Company is required.', 'script', NULL),
(771, 771, 'pjField', 1, 'title', 'Country is required.', 'script', NULL),
(772, 772, 'pjField', 1, 'title', 'Email is required.', 'script', NULL),
(773, 773, 'pjField', 1, 'title', 'Email is invalid.', 'script', NULL),
(774, 774, 'pjField', 1, 'title', 'Name is required.', 'script', NULL),
(775, 775, 'pjField', 1, 'title', 'Notes is required.', 'script', NULL),
(776, 776, 'pjField', 1, 'title', 'Payment method is required.', 'script', NULL),
(777, 777, 'pjField', 1, 'title', 'Phone is required.', 'script', NULL),
(778, 778, 'pjField', 1, 'title', 'State is required.', 'script', NULL),
(779, 779, 'pjField', 1, 'title', 'You need to accept terms of booking.', 'script', NULL),
(780, 780, 'pjField', 1, 'title', 'Title is required.', 'script', NULL),
(781, 781, 'pjField', 1, 'title', 'Zip is required.', 'script', NULL),
(782, 782, 'pjField', 1, 'title', 'No', 'script', NULL),
(783, 783, 'pjField', 1, 'title', 'Yes', 'script', NULL),
(784, 1, 'pjOption', 1, 'o_ticket_data', 'Name : {Name}\r\nEvent : {Movie}\r\n{Showtime}\r\nPrice: {TicketPrice}\r\nSeats: {BookingSeats}', 'data', NULL),
(785, 1, 'pjOption', 1, 'o_terms', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu ipsum consectetur arcu commodo egestas nec eu ante. Aenean nec enim lorem. Proin accumsan luctus luctus. Vivamus pulvinar mollis orci, id convallis eros ultricies vel. Nullam adipiscing, risus non pellentesque aliquam, nibh ligula dictum justo, quis commodo nisi dolor ut nulla.\r\n\r\nSuspendisse porttitor, odio eget eleifend aliquet, nibh urna placerat lacus, a rhoncus metus metus et lectus. Fusce convallis nunc dignissim magna condimentum sed lobortis nibh faucibus. Vivamus gravida libero et elit sagittis vel dignissim erat euismod.', 'data', NULL),
(786, 1, 'pjOption', 1, 'o_email_confirmation_subject', 'Your booking has been received', 'data', NULL),
(787, 1, 'pjOption', 1, 'o_email_confirmation_message', 'Your booking has been received.<br/><br/>Personal details:<br/>Name: {Name}<br/>E-Mail: {Email}<br/>Phone: {Phone}<br/>Country: {Country}<br/>City: {City}<br/>Address: {Address}<br/>Notes: {Notes}<br/><br/>Booking details:<br/>Movie: {Movie}<br/>Movie ID: {MovieID}<br/>Showtime: {Showtime}<br/>Booking ID: {BookingID}<br/>Booking Seats: {BookingSeats}<br/>Tickets & Prices: {TicketPrice}<br/><br/>Payment information:<br/>Payment method: {PaymentMethod}<br/>Deposit: {Deposit}<br/>Total: {Total}<br/>Tax: {Tax}<br/><br/>If you want to cancel your booking follow next link: {CancelURL}<br/><br/>Thank you, we will contact you ASAP.', 'data', NULL),
(788, 1, 'pjOption', 1, 'o_email_payment_subject', 'We received your payment', 'data', NULL),
(789, 1, 'pjOption', 1, 'o_email_payment_message', 'Your payment has been received. You\'ve just made a payment for booking with the following details.<br/><br/>Personal details:<br/>Name: {Name}<br/>E-Mail: {Email}<br/>Phone: {Phone}<br/>Country: {Country}<br/>City: {City}<br/>Address: {Address}<br/>Notes: {Notes}<br/><br/>Booking details:<br/>Movie: {Movie}<br/>Movie ID: {MovieID}<br/>Showtime: {Showtime}<br/>Booking ID: {BookingID}<br/>Booking Seats: {BookingSeats}<br/>Deposit: {Deposit}<br/>Total: {Total}<br/>Tax: {Tax}<br/><br/>If you want to cancel your booking follow next link: {CancelURL}<br/><br/>Thank you, we will contact you ASAP.', 'data', NULL),
(790, 1, 'pjOption', 1, 'o_email_cancel_subject', 'Cancel confirmation', 'data', NULL),
(791, 1, 'pjOption', 1, 'o_email_cancel_message', 'You\'ve just cancelled your booking.<br/><br/>Personal details:<br/>Name: {Name}<br/>E-Mail: {Email}<br/>Phone: {Phone}<br/>Country: {Country}<br/>City: {City}<br/>Address: {Address}<br/>Notes: {Notes}<br/><br/>Booking details:<br/>Movie: {Movie}<br/>Movie ID: {MovieID}<br/>Showtime: {Showtime}<br/>Booking ID: {BookingID}<br/>Booking Seats: {BookingSeats}<br/>Deposit: {Deposit}<br/>Total: {Total}<br/>Tax: {Tax}<br/><br/>Thank you, we will contact you ASAP.', 'data', NULL),
(792, 1, 'pjOption', 1, 'o_sms_confirmation_message', NULL, 'data', NULL),
(793, 1, 'pjOption', 1, 'o_admin_email_confirmation_subject', 'New booking received', 'data', NULL),
(794, 1, 'pjOption', 1, 'o_admin_email_confirmation_message', 'You\'ve just received a booking. <br/><br/>Personal details:<br/>Name: {Name}<br/>E-Mail: {Email}<br/>Phone: {Phone}<br/>Country: {Country}<br/>City: {City}<br/>Address: {Address}<br/>Notes: {Notes}<br/><br/>Booking details:<br/>Movie: {Movie}<br/>Movie ID: {MovieID}<br/>Showtime: {Showtime}<br/>Booking ID: {BookingID}<br/>Booking Seats: {BookingSeats}<br/>Tickets & Prices: {TicketPrice}<br/><br/>Payment information:<br/>Payment method: {PaymentMethod}<br/>Deposit: {Deposit}<br/>Total: {Total}<br/>Tax: {Tax}<br/><br/>Thank you!', 'data', NULL),
(795, 1, 'pjOption', 1, 'o_admin_email_payment_subject', 'New payment received', 'data', NULL),
(796, 1, 'pjOption', 1, 'o_admin_email_payment_message', 'You\'ve just received payment for the booking.<br/><br/>Personal details:<br/>Name: {Name}<br/>E-Mail: {Email}<br/>Phone: {Phone}<br/>Country: {Country}<br/>City: {City}<br/>Address: {Address}<br/>Notes: {Notes}<br/><br/>Booking details:<br/>Movie: {Movie}<br/>Movie ID: {MovieID}<br/>Showtime: {Showtime}<br/>Booking ID: {BookingID}<br/>Booking Seats: {BookingSeats}<br/>Deposit: {Deposit}<br/>Total: {Total}<br/>Tax: {Tax}<br/><br/>Thank you!', 'data', NULL),
(797, 1, 'pjOption', 1, 'o_admin_email_cancel_subject', 'Booking cancelled', 'data', NULL),
(798, 1, 'pjOption', 1, 'o_admin_email_cancel_message', 'A booking has been cancelled.<br/><br/>Personal details:<br/>Name: {Name}<br/>E-Mail: {Email}<br/>Phone: {Phone}<br/>Country: {Country}<br/>City: {City}<br/>Address: {Address}<br/>Notes: {Notes}<br/><br/>Booking details:<br/>Movie: {Movie}<br/>Movie ID: {MovieID}<br/>Showtime: {Showtime}<br/>Booking ID: {BookingID}<br/>Booking Seats: {BookingSeats}<br/>Deposit: {Deposit}<br/>Total: {Total}<br/>Tax: {Tax}<br/><br/>Thank you!', 'data', NULL),
(799, 1, 'pjOption', 1, 'o_admin_sms_confirmation_message', NULL, 'data', NULL),
(800, 1, 'pjOption', 1, 'o_admin_sms_payment_message', NULL, 'data', NULL),
(801, 784, 'pjField', 1, 'title', 'Languages', 'plugin', NULL),
(802, 785, 'pjField', 1, 'title', 'Translate', 'plugin', NULL),
(803, 786, 'pjField', 1, 'title', 'Languages', 'plugin', NULL),
(804, 787, 'pjField', 1, 'title', 'Add as many languages as you need to your script. For each of the languages added you need to translate all the text titles.', 'plugin', NULL),
(805, 788, 'pjField', 1, 'title', 'Titles', 'plugin', NULL),
(806, 789, 'pjField', 1, 'title', 'Using the form below you can edit all the text in the software.<br /><br />Each piece of text used in the software is saved in the database and has its own unique ID. In the first column below you can see the ID for each piece of text. To show these IDs in the script itself check the \"Show IDs\" checkbox and click Save button next to it. This will show the corresponding :ID: for each text message. Please, note that ONLY you will see these IDs. Now you can search for any ID and easily change and/or translate the text. Have in mind that you should use : before and after the ID when you search for it.  <br /><br />Check our <a target=\"_blank\" href=\"https://www.astutemyndz.com/\">knowledgebase</a> and watch video tutorial how to change and/or translate the text.', 'plugin', NULL),
(807, 790, 'pjField', 1, 'title', 'Title', 'plugin', NULL),
(808, 791, 'pjField', 1, 'title', 'Flag', 'plugin', NULL),
(809, 792, 'pjField', 1, 'title', 'Is default', 'plugin', NULL),
(810, 793, 'pjField', 1, 'title', 'Order', 'plugin', NULL),
(811, 794, 'pjField', 1, 'title', 'Add Language', 'plugin', NULL),
(812, 795, 'pjField', 1, 'title', 'Field', 'plugin', NULL),
(813, 796, 'pjField', 1, 'title', 'Value', 'plugin', NULL),
(814, 797, 'pjField', 1, 'title', 'Back-end title', 'plugin', NULL),
(815, 798, 'pjField', 1, 'title', 'Front-end title', 'plugin', NULL),
(816, 799, 'pjField', 1, 'title', 'Special title', 'plugin', NULL),
(817, 800, 'pjField', 1, 'title', 'Titles Updated', 'plugin', NULL),
(818, 801, 'pjField', 1, 'title', 'All the changes made to titles have been saved.', 'plugin', NULL),
(819, 802, 'pjField', 1, 'title', 'Per page', 'plugin', NULL),
(820, 803, 'pjField', 1, 'title', 'Import error', 'plugin', NULL),
(821, 804, 'pjField', 1, 'title', 'Import failed due missing parameters.', 'plugin', NULL),
(822, 805, 'pjField', 1, 'title', 'Import complete', 'plugin', NULL),
(823, 806, 'pjField', 1, 'title', 'The import was performed successfully.', 'plugin', NULL),
(824, 807, 'pjField', 1, 'title', 'Import error', 'plugin', NULL),
(825, 808, 'pjField', 1, 'title', 'Import failed due empty data.', 'plugin', NULL),
(826, 809, 'pjField', 1, 'title', 'Import error', 'plugin', NULL),
(827, 810, 'pjField', 1, 'title', 'Import failed because file cannot be open.', 'plugin', NULL),
(828, 811, 'pjField', 1, 'title', 'Import / Export', 'plugin', NULL),
(829, 812, 'pjField', 1, 'title', 'Import', 'plugin', NULL),
(830, 813, 'pjField', 1, 'title', 'Export', 'plugin', NULL),
(831, 814, 'pjField', 1, 'title', 'Browse your computer', 'plugin', NULL),
(832, 815, 'pjField', 1, 'title', 'Import / Export', 'plugin', NULL),
(833, 816, 'pjField', 1, 'title', 'Use the form below to Import or Export CSV with all titles. Please, do not change first row and first and second column in the CSV file.', 'plugin', NULL),
(834, 817, 'pjField', 1, 'title', 'ID:', 'plugin', NULL),
(835, 818, 'pjField', 1, 'title', 'Show IDs', 'plugin', NULL),
(836, 819, 'pjField', 1, 'title', 'Delimiter', 'plugin', NULL),
(837, 820, 'pjField', 1, 'title', 'Comma', 'plugin', NULL),
(838, 821, 'pjField', 1, 'title', 'Semicolon', 'plugin', NULL),
(839, 822, 'pjField', 1, 'title', 'Tab', 'plugin', NULL),
(840, 823, 'pjField', 1, 'title', 'The following languages have been found. Select those you want to import.', 'plugin', NULL),
(841, 824, 'pjField', 1, 'title', 'Import confirmation', 'plugin', NULL),
(842, 825, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(843, 826, 'pjField', 1, 'title', 'Missing, empty or invalid parameters.', 'plugin', NULL),
(844, 827, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(845, 828, 'pjField', 1, 'title', 'File have not been uploaded.', 'plugin', NULL),
(846, 829, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(847, 830, 'pjField', 1, 'title', 'Uploaded file cannot open for reading.', 'plugin', NULL),
(848, 831, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(849, 832, 'pjField', 1, 'title', 'New line(s) have been found.', 'plugin', NULL),
(850, 833, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(851, 834, 'pjField', 1, 'title', 'Uploaded file doesn\'t contain the necessary columns.', 'plugin', NULL),
(852, 835, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(853, 836, 'pjField', 1, 'title', 'Number of columns are not equal on every row.', 'plugin', NULL),
(854, 837, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(855, 838, 'pjField', 1, 'title', 'Invalid data found.', 'plugin', NULL),
(856, 839, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(857, 840, 'pjField', 1, 'title', 'Missing columns.', 'plugin', NULL),
(858, 841, 'pjField', 1, 'title', 'Import failed', 'plugin', NULL),
(859, 842, 'pjField', 1, 'title', 'Invalid data found.', 'plugin', NULL),
(860, 843, 'pjField', 1, 'title', 'Show IDs', 'plugin', NULL),
(861, 844, 'pjField', 1, 'title', 'ID will be displayed next to each text found in the software. You can then search for an ID to easily change or translate the text.', 'plugin', NULL),
(862, 845, 'pjField', 1, 'title', 'Confirm', 'plugin', NULL),
(863, 846, 'pjField', 1, 'title', 'Cancel', 'plugin', NULL),
(864, 847, 'pjField', 1, 'title', 'default', 'plugin', NULL),
(865, 848, 'pjField', 1, 'title', 'Text direction', 'plugin', NULL),
(866, 849, 'pjField', 1, 'title', 'Front-end title', 'plugin', NULL),
(867, 850, 'pjField', 1, 'title', 'Left to Right', 'plugin', NULL),
(868, 851, 'pjField', 1, 'title', 'Right to Left', 'plugin', NULL),
(869, 852, 'pjField', 1, 'title', 'Reset flag', 'plugin', NULL),
(870, 853, 'pjField', 1, 'title', 'Are you sure you want to reset selected flag?', 'plugin', NULL),
(871, 854, 'pjField', 1, 'title', 'Reset', 'plugin', NULL),
(872, 855, 'pjField', 1, 'title', 'Click to upload', 'plugin', NULL),
(873, 856, 'pjField', 1, 'title', 'Click to reset', 'plugin', NULL),
(874, 857, 'pjField', 1, 'title', 'Language', 'plugin', NULL),
(875, 858, 'pjField', 1, 'title', 'Close', 'plugin', NULL),
(876, 859, 'pjField', 1, 'title', 'Info message', 'plugin', NULL),
(877, 860, 'pjField', 1, 'title', 'The error was found at line: %s', 'plugin', NULL),
(878, 861, 'pjField', 1, 'title', 'Reset search', 'plugin', NULL),
(879, 862, 'pjField', 1, 'title', 'Backup', 'plugin', NULL),
(880, 863, 'pjField', 1, 'title', 'Backup complete!', 'plugin', NULL),
(881, 864, 'pjField', 1, 'title', 'Backup failed!', 'plugin', NULL),
(882, 865, 'pjField', 1, 'title', 'Backup failed!', 'plugin', NULL),
(883, 866, 'pjField', 1, 'title', 'We recommend you to regularly back up your database and files to prevent any loss of information.', 'plugin', NULL),
(884, 867, 'pjField', 1, 'title', 'All backup files have been saved.', 'plugin', NULL),
(885, 868, 'pjField', 1, 'title', 'No option was selected.', 'plugin', NULL),
(886, 869, 'pjField', 1, 'title', 'Backup not performed.', 'plugin', NULL),
(887, 870, 'pjField', 1, 'title', 'Backup', 'plugin', NULL),
(888, 871, 'pjField', 1, 'title', 'Backup database', 'plugin', NULL),
(889, 872, 'pjField', 1, 'title', 'Backup files', 'plugin', NULL),
(890, 873, 'pjField', 1, 'title', 'Backup', 'plugin', NULL),
(891, 874, 'pjField', 1, 'title', 'Backup failed!', 'plugin', NULL),
(892, 875, 'pjField', 1, 'title', 'Backup folder not found. Please ensure that \"app/web/backup\" folder exists.', 'plugin', NULL),
(893, 876, 'pjField', 1, 'title', 'Backup failed!', 'plugin', NULL),
(894, 877, 'pjField', 1, 'title', 'You need to set write permissions (chmod 777) to \"app/web/backup\" folder.', 'plugin', NULL),
(895, 878, 'pjField', 1, 'title', 'Date/time', 'plugin', NULL),
(896, 879, 'pjField', 1, 'title', 'Type', 'plugin', NULL),
(897, 880, 'pjField', 1, 'title', 'File', 'plugin', NULL),
(898, 881, 'pjField', 1, 'title', 'Are you sure you want to delete selected file?', 'plugin', NULL),
(899, 882, 'pjField', 1, 'title', 'Delete selected', 'plugin', NULL),
(900, 883, 'pjField', 1, 'title', 'Size', 'script', NULL),
(901, 884, 'pjField', 1, 'title', 'SizeXXXX', 'script', NULL),
(902, 885, 'pjField', 1, 'title', 'Log', 'plugin', NULL),
(903, 886, 'pjField', 1, 'title', 'Config log', 'plugin', NULL),
(904, 887, 'pjField', 1, 'title', 'Empty log', 'plugin', NULL),
(905, 888, 'pjField', 1, 'title', 'Config log updated.', 'plugin', NULL),
(906, 889, 'pjField', 1, 'title', 'The config log have been updated.', 'plugin', NULL),
(907, 890, 'pjField', 1, 'title', 'List', 'plugin', NULL),
(908, 891, 'pjField', 1, 'title', '+ Add', 'plugin', NULL),
(909, 892, 'pjField', 1, 'title', 'Information', 'plugin', NULL),
(910, 893, 'pjField', 1, 'title', 'Please, note that after changing the scripts in the list below you will need to refresh the page to apply the new updates in the \"One admiN\" menu.', 'plugin', NULL),
(911, 894, 'pjField', 1, 'title', 'Date/Time', 'plugin', NULL),
(912, 895, 'pjField', 1, 'title', 'MC Gross', 'plugin', NULL),
(913, 896, 'pjField', 1, 'title', 'MC Currency', 'plugin', NULL),
(914, 897, 'pjField', 1, 'title', 'Payer email', 'plugin', NULL),
(915, 898, 'pjField', 1, 'title', 'Txn type', 'plugin', NULL),
(916, 899, 'pjField', 1, 'title', 'Txn ID', 'plugin', NULL),
(917, 900, 'pjField', 1, 'title', 'Subscription ID', 'plugin', NULL),
(918, 901, 'pjField', 1, 'title', 'Foreign ID', 'plugin', NULL),
(919, 902, 'pjField', 1, 'title', 'Close', 'plugin', NULL),
(920, 903, 'pjField', 1, 'title', 'Transaction details', 'plugin', NULL),
(921, 904, 'pjField', 1, 'title', 'View', 'plugin', NULL),
(922, 905, 'pjField', 1, 'title', 'IPN', 'plugin', NULL),
(923, 906, 'pjField', 1, 'title', 'Country name', 'plugin', NULL),
(924, 907, 'pjField', 1, 'title', 'Alpha 2', 'plugin', NULL),
(925, 908, 'pjField', 1, 'title', 'Alpha 3', 'plugin', NULL),
(926, 909, 'pjField', 1, 'title', 'Status', 'plugin', NULL),
(927, 910, 'pjField', 1, 'title', 'Add +', 'plugin', NULL),
(928, 911, 'pjField', 1, 'title', 'Active', 'plugin', NULL),
(929, 912, 'pjField', 1, 'title', 'Inactive', 'plugin', NULL),
(930, 913, 'pjField', 1, 'title', 'Save', 'plugin', NULL),
(931, 914, 'pjField', 1, 'title', 'Cancel', 'plugin', NULL),
(932, 915, 'pjField', 1, 'title', 'Countries', 'plugin', NULL),
(933, 916, 'pjField', 1, 'title', 'Country updated', 'plugin', NULL),
(934, 917, 'pjField', 1, 'title', 'Country added', 'plugin', NULL),
(935, 918, 'pjField', 1, 'title', 'Country failed to add', 'plugin', NULL),
(936, 919, 'pjField', 1, 'title', 'Country not found', 'plugin', NULL),
(937, 920, 'pjField', 1, 'title', 'Add country', 'plugin', NULL),
(938, 921, 'pjField', 1, 'title', 'Update country', 'plugin', NULL),
(939, 922, 'pjField', 1, 'title', 'Manage countries', 'plugin', NULL),
(940, 923, 'pjField', 1, 'title', 'Country has been updated successfully.', 'plugin', NULL),
(941, 924, 'pjField', 1, 'title', 'Country has been added successfully.', 'plugin', NULL),
(942, 925, 'pjField', 1, 'title', 'Country has not been added successfully.', 'plugin', NULL),
(943, 926, 'pjField', 1, 'title', 'Country you are looking for has not been found.', 'plugin', NULL),
(944, 927, 'pjField', 1, 'title', 'Use form below to add a country.', 'plugin', NULL),
(945, 928, 'pjField', 1, 'title', 'Use form below to update a country.', 'plugin', NULL),
(946, 929, 'pjField', 1, 'title', 'Use grid below to organize your country list.', 'plugin', NULL),
(947, 930, 'pjField', 1, 'title', 'Are you sure you want to delete selected country?', 'plugin', NULL),
(948, 931, 'pjField', 1, 'title', 'Delete selected', 'plugin', NULL),
(949, 932, 'pjField', 1, 'title', 'All', 'plugin', NULL),
(950, 933, 'pjField', 1, 'title', 'Search', 'plugin', NULL),
(951, 1, 'pjCountry', 1, 'name', 'Afghanistan', 'plugin', NULL),
(952, 2, 'pjCountry', 1, 'name', 'Åland Islands', 'plugin', NULL),
(953, 3, 'pjCountry', 1, 'name', 'Albania', 'plugin', NULL),
(954, 4, 'pjCountry', 1, 'name', 'Algeria', 'plugin', NULL),
(955, 5, 'pjCountry', 1, 'name', 'American Samoa', 'plugin', NULL),
(956, 6, 'pjCountry', 1, 'name', 'Andorra', 'plugin', NULL),
(957, 7, 'pjCountry', 1, 'name', 'Angola', 'plugin', NULL),
(958, 8, 'pjCountry', 1, 'name', 'Anguilla', 'plugin', NULL),
(959, 9, 'pjCountry', 1, 'name', 'Antarctica', 'plugin', NULL),
(960, 10, 'pjCountry', 1, 'name', 'Antigua and Barbuda', 'plugin', NULL),
(961, 11, 'pjCountry', 1, 'name', 'Argentina', 'plugin', NULL),
(962, 12, 'pjCountry', 1, 'name', 'Armenia', 'plugin', NULL),
(963, 13, 'pjCountry', 1, 'name', 'Aruba', 'plugin', NULL),
(964, 14, 'pjCountry', 1, 'name', 'Australia', 'plugin', NULL),
(965, 15, 'pjCountry', 1, 'name', 'Austria', 'plugin', NULL),
(966, 16, 'pjCountry', 1, 'name', 'Azerbaijan', 'plugin', NULL),
(967, 17, 'pjCountry', 1, 'name', 'Bahamas', 'plugin', NULL),
(968, 18, 'pjCountry', 1, 'name', 'Bahrain', 'plugin', NULL),
(969, 19, 'pjCountry', 1, 'name', 'Bangladesh', 'plugin', NULL),
(970, 20, 'pjCountry', 1, 'name', 'Barbados', 'plugin', NULL),
(971, 21, 'pjCountry', 1, 'name', 'Belarus', 'plugin', NULL),
(972, 22, 'pjCountry', 1, 'name', 'Belgium', 'plugin', NULL),
(973, 23, 'pjCountry', 1, 'name', 'Belize', 'plugin', NULL),
(974, 24, 'pjCountry', 1, 'name', 'Benin', 'plugin', NULL),
(975, 25, 'pjCountry', 1, 'name', 'Bermuda', 'plugin', NULL),
(976, 26, 'pjCountry', 1, 'name', 'Bhutan', 'plugin', NULL),
(977, 27, 'pjCountry', 1, 'name', 'Bolivia, Plurinational State of', 'plugin', NULL),
(978, 28, 'pjCountry', 1, 'name', 'Bonaire, Sint Eustatius and Saba', 'plugin', NULL),
(979, 29, 'pjCountry', 1, 'name', 'Bosnia and Herzegovina', 'plugin', NULL),
(980, 30, 'pjCountry', 1, 'name', 'Botswana', 'plugin', NULL),
(981, 31, 'pjCountry', 1, 'name', 'Bouvet Island', 'plugin', NULL),
(982, 32, 'pjCountry', 1, 'name', 'Brazil', 'plugin', NULL),
(983, 33, 'pjCountry', 1, 'name', 'British Indian Ocean Territory', 'plugin', NULL),
(984, 34, 'pjCountry', 1, 'name', 'Brunei Darussalam', 'plugin', NULL),
(985, 35, 'pjCountry', 1, 'name', 'Bulgaria', 'plugin', NULL),
(986, 36, 'pjCountry', 1, 'name', 'Burkina Faso', 'plugin', NULL),
(987, 37, 'pjCountry', 1, 'name', 'Burundi', 'plugin', NULL),
(988, 38, 'pjCountry', 1, 'name', 'Cambodia', 'plugin', NULL),
(989, 39, 'pjCountry', 1, 'name', 'Cameroon', 'plugin', NULL),
(990, 40, 'pjCountry', 1, 'name', 'Canada', 'plugin', NULL),
(991, 41, 'pjCountry', 1, 'name', 'Cape Verde', 'plugin', NULL),
(992, 42, 'pjCountry', 1, 'name', 'Cayman Islands', 'plugin', NULL),
(993, 43, 'pjCountry', 1, 'name', 'Central African Republic', 'plugin', NULL),
(994, 44, 'pjCountry', 1, 'name', 'Chad', 'plugin', NULL),
(995, 45, 'pjCountry', 1, 'name', 'Chile', 'plugin', NULL),
(996, 46, 'pjCountry', 1, 'name', 'China', 'plugin', NULL),
(997, 47, 'pjCountry', 1, 'name', 'Christmas Island', 'plugin', NULL),
(998, 48, 'pjCountry', 1, 'name', 'Cocos array(Keeling) Islands', 'plugin', NULL),
(999, 49, 'pjCountry', 1, 'name', 'Colombia', 'plugin', NULL),
(1000, 50, 'pjCountry', 1, 'name', 'Comoros', 'plugin', NULL),
(1001, 51, 'pjCountry', 1, 'name', 'Congo', 'plugin', NULL),
(1002, 52, 'pjCountry', 1, 'name', 'Congo, the Democratic Republic of the', 'plugin', NULL),
(1003, 53, 'pjCountry', 1, 'name', 'Cook Islands', 'plugin', NULL),
(1004, 54, 'pjCountry', 1, 'name', 'Costa Rica', 'plugin', NULL),
(1005, 55, 'pjCountry', 1, 'name', 'Côte d\'Ivoire', 'plugin', NULL),
(1006, 56, 'pjCountry', 1, 'name', 'Croatia', 'plugin', NULL),
(1007, 57, 'pjCountry', 1, 'name', 'Cuba', 'plugin', NULL),
(1008, 58, 'pjCountry', 1, 'name', 'Curaçao', 'plugin', NULL),
(1009, 59, 'pjCountry', 1, 'name', 'Cyprus', 'plugin', NULL),
(1010, 60, 'pjCountry', 1, 'name', 'Czech Republic', 'plugin', NULL),
(1011, 61, 'pjCountry', 1, 'name', 'Denmark', 'plugin', NULL),
(1012, 62, 'pjCountry', 1, 'name', 'Djibouti', 'plugin', NULL),
(1013, 63, 'pjCountry', 1, 'name', 'Dominica', 'plugin', NULL),
(1014, 64, 'pjCountry', 1, 'name', 'Dominican Republic', 'plugin', NULL),
(1015, 65, 'pjCountry', 1, 'name', 'Ecuador', 'plugin', NULL),
(1016, 66, 'pjCountry', 1, 'name', 'Egypt', 'plugin', NULL),
(1017, 67, 'pjCountry', 1, 'name', 'El Salvador', 'plugin', NULL),
(1018, 68, 'pjCountry', 1, 'name', 'Equatorial Guinea', 'plugin', NULL),
(1019, 69, 'pjCountry', 1, 'name', 'Eritrea', 'plugin', NULL),
(1020, 70, 'pjCountry', 1, 'name', 'Estonia', 'plugin', NULL),
(1021, 71, 'pjCountry', 1, 'name', 'Ethiopia', 'plugin', NULL),
(1022, 72, 'pjCountry', 1, 'name', 'Falkland Islands array(Malvinas)', 'plugin', NULL),
(1023, 73, 'pjCountry', 1, 'name', 'Faroe Islands', 'plugin', NULL),
(1024, 74, 'pjCountry', 1, 'name', 'Fiji', 'plugin', NULL),
(1025, 75, 'pjCountry', 1, 'name', 'Finland', 'plugin', NULL),
(1026, 76, 'pjCountry', 1, 'name', 'France', 'plugin', NULL),
(1027, 77, 'pjCountry', 1, 'name', 'French Guiana', 'plugin', NULL),
(1028, 78, 'pjCountry', 1, 'name', 'French Polynesia', 'plugin', NULL),
(1029, 79, 'pjCountry', 1, 'name', 'French Southern Territories', 'plugin', NULL),
(1030, 80, 'pjCountry', 1, 'name', 'Gabon', 'plugin', NULL),
(1031, 81, 'pjCountry', 1, 'name', 'Gambia', 'plugin', NULL),
(1032, 82, 'pjCountry', 1, 'name', 'Georgia', 'plugin', NULL),
(1033, 83, 'pjCountry', 1, 'name', 'Germany', 'plugin', NULL),
(1034, 84, 'pjCountry', 1, 'name', 'Ghana', 'plugin', NULL),
(1035, 85, 'pjCountry', 1, 'name', 'Gibraltar', 'plugin', NULL),
(1036, 86, 'pjCountry', 1, 'name', 'Greece', 'plugin', NULL),
(1037, 87, 'pjCountry', 1, 'name', 'Greenland', 'plugin', NULL),
(1038, 88, 'pjCountry', 1, 'name', 'Grenada', 'plugin', NULL),
(1039, 89, 'pjCountry', 1, 'name', 'Guadeloupe', 'plugin', NULL),
(1040, 90, 'pjCountry', 1, 'name', 'Guam', 'plugin', NULL),
(1041, 91, 'pjCountry', 1, 'name', 'Guatemala', 'plugin', NULL),
(1042, 92, 'pjCountry', 1, 'name', 'Guernsey', 'plugin', NULL),
(1043, 93, 'pjCountry', 1, 'name', 'Guinea', 'plugin', NULL),
(1044, 94, 'pjCountry', 1, 'name', 'Guinea-Bissau', 'plugin', NULL),
(1045, 95, 'pjCountry', 1, 'name', 'Guyana', 'plugin', NULL),
(1046, 96, 'pjCountry', 1, 'name', 'Haiti', 'plugin', NULL),
(1047, 97, 'pjCountry', 1, 'name', 'Heard Island and McDonald Islands', 'plugin', NULL),
(1048, 98, 'pjCountry', 1, 'name', 'Holy See array(Vatican City State)', 'plugin', NULL),
(1049, 99, 'pjCountry', 1, 'name', 'Honduras', 'plugin', NULL),
(1050, 100, 'pjCountry', 1, 'name', 'Hong Kong', 'plugin', NULL),
(1051, 101, 'pjCountry', 1, 'name', 'Hungary', 'plugin', NULL),
(1052, 102, 'pjCountry', 1, 'name', 'Iceland', 'plugin', NULL),
(1053, 103, 'pjCountry', 1, 'name', 'India', 'plugin', NULL),
(1054, 104, 'pjCountry', 1, 'name', 'Indonesia', 'plugin', NULL),
(1055, 105, 'pjCountry', 1, 'name', 'Iran, Islamic Republic of', 'plugin', NULL),
(1056, 106, 'pjCountry', 1, 'name', 'Iraq', 'plugin', NULL),
(1057, 107, 'pjCountry', 1, 'name', 'Ireland', 'plugin', NULL),
(1058, 108, 'pjCountry', 1, 'name', 'Isle of Man', 'plugin', NULL),
(1059, 109, 'pjCountry', 1, 'name', 'Israel', 'plugin', NULL),
(1060, 110, 'pjCountry', 1, 'name', 'Italy', 'plugin', NULL),
(1061, 111, 'pjCountry', 1, 'name', 'Jamaica', 'plugin', NULL),
(1062, 112, 'pjCountry', 1, 'name', 'Japan', 'plugin', NULL),
(1063, 113, 'pjCountry', 1, 'name', 'Jersey', 'plugin', NULL),
(1064, 114, 'pjCountry', 1, 'name', 'Jordan', 'plugin', NULL),
(1065, 115, 'pjCountry', 1, 'name', 'Kazakhstan', 'plugin', NULL),
(1066, 116, 'pjCountry', 1, 'name', 'Kenya', 'plugin', NULL),
(1067, 117, 'pjCountry', 1, 'name', 'Kiribati', 'plugin', NULL),
(1068, 118, 'pjCountry', 1, 'name', 'Korea, Democratic People\'s Republic of', 'plugin', NULL),
(1069, 119, 'pjCountry', 1, 'name', 'Korea, Republic of', 'plugin', NULL),
(1070, 120, 'pjCountry', 1, 'name', 'Kuwait', 'plugin', NULL),
(1071, 121, 'pjCountry', 1, 'name', 'Kyrgyzstan', 'plugin', NULL),
(1072, 122, 'pjCountry', 1, 'name', 'Lao People\'s Democratic Republic', 'plugin', NULL),
(1073, 123, 'pjCountry', 1, 'name', 'Latvia', 'plugin', NULL),
(1074, 124, 'pjCountry', 1, 'name', 'Lebanon', 'plugin', NULL),
(1075, 125, 'pjCountry', 1, 'name', 'Lesotho', 'plugin', NULL),
(1076, 126, 'pjCountry', 1, 'name', 'Liberia', 'plugin', NULL),
(1077, 127, 'pjCountry', 1, 'name', 'Libya', 'plugin', NULL),
(1078, 128, 'pjCountry', 1, 'name', 'Liechtenstein', 'plugin', NULL),
(1079, 129, 'pjCountry', 1, 'name', 'Lithuania', 'plugin', NULL),
(1080, 130, 'pjCountry', 1, 'name', 'Luxembourg', 'plugin', NULL),
(1081, 131, 'pjCountry', 1, 'name', 'Macao', 'plugin', NULL),
(1082, 132, 'pjCountry', 1, 'name', 'Macedonia, The Former Yugoslav Republic of', 'plugin', NULL),
(1083, 133, 'pjCountry', 1, 'name', 'Madagascar', 'plugin', NULL),
(1084, 134, 'pjCountry', 1, 'name', 'Malawi', 'plugin', NULL),
(1085, 135, 'pjCountry', 1, 'name', 'Malaysia', 'plugin', NULL),
(1086, 136, 'pjCountry', 1, 'name', 'Maldives', 'plugin', NULL),
(1087, 137, 'pjCountry', 1, 'name', 'Mali', 'plugin', NULL),
(1088, 138, 'pjCountry', 1, 'name', 'Malta', 'plugin', NULL),
(1089, 139, 'pjCountry', 1, 'name', 'Marshall Islands', 'plugin', NULL),
(1090, 140, 'pjCountry', 1, 'name', 'Martinique', 'plugin', NULL),
(1091, 141, 'pjCountry', 1, 'name', 'Mauritania', 'plugin', NULL),
(1092, 142, 'pjCountry', 1, 'name', 'Mauritius', 'plugin', NULL),
(1093, 143, 'pjCountry', 1, 'name', 'Mayotte', 'plugin', NULL),
(1094, 144, 'pjCountry', 1, 'name', 'Mexico', 'plugin', NULL),
(1095, 145, 'pjCountry', 1, 'name', 'Micronesia, Federated States of', 'plugin', NULL),
(1096, 146, 'pjCountry', 1, 'name', 'Moldova, Republic of', 'plugin', NULL),
(1097, 147, 'pjCountry', 1, 'name', 'Monaco', 'plugin', NULL),
(1098, 148, 'pjCountry', 1, 'name', 'Mongolia', 'plugin', NULL),
(1099, 149, 'pjCountry', 1, 'name', 'Montenegro', 'plugin', NULL),
(1100, 150, 'pjCountry', 1, 'name', 'Montserrat', 'plugin', NULL),
(1101, 151, 'pjCountry', 1, 'name', 'Morocco', 'plugin', NULL),
(1102, 152, 'pjCountry', 1, 'name', 'Mozambique', 'plugin', NULL),
(1103, 153, 'pjCountry', 1, 'name', 'Myanmar', 'plugin', NULL),
(1104, 154, 'pjCountry', 1, 'name', 'Namibia', 'plugin', NULL),
(1105, 155, 'pjCountry', 1, 'name', 'Nauru', 'plugin', NULL),
(1106, 156, 'pjCountry', 1, 'name', 'Nepal', 'plugin', NULL),
(1107, 157, 'pjCountry', 1, 'name', 'Netherlands', 'plugin', NULL),
(1108, 158, 'pjCountry', 1, 'name', 'New Caledonia', 'plugin', NULL),
(1109, 159, 'pjCountry', 1, 'name', 'New Zealand', 'plugin', NULL),
(1110, 160, 'pjCountry', 1, 'name', 'Nicaragua', 'plugin', NULL),
(1111, 161, 'pjCountry', 1, 'name', 'Niger', 'plugin', NULL),
(1112, 162, 'pjCountry', 1, 'name', 'Nigeria', 'plugin', NULL),
(1113, 163, 'pjCountry', 1, 'name', 'Niue', 'plugin', NULL),
(1114, 164, 'pjCountry', 1, 'name', 'Norfolk Island', 'plugin', NULL),
(1115, 165, 'pjCountry', 1, 'name', 'Northern Mariana Islands', 'plugin', NULL),
(1116, 166, 'pjCountry', 1, 'name', 'Norway', 'plugin', NULL),
(1117, 167, 'pjCountry', 1, 'name', 'Oman', 'plugin', NULL),
(1118, 168, 'pjCountry', 1, 'name', 'Pakistan', 'plugin', NULL),
(1119, 169, 'pjCountry', 1, 'name', 'Palau', 'plugin', NULL),
(1120, 170, 'pjCountry', 1, 'name', 'Palestine, State of', 'plugin', NULL),
(1121, 171, 'pjCountry', 1, 'name', 'Panama', 'plugin', NULL),
(1122, 172, 'pjCountry', 1, 'name', 'Papua New Guinea', 'plugin', NULL),
(1123, 173, 'pjCountry', 1, 'name', 'Paraguay', 'plugin', NULL),
(1124, 174, 'pjCountry', 1, 'name', 'Peru', 'plugin', NULL),
(1125, 175, 'pjCountry', 1, 'name', 'Philippines', 'plugin', NULL),
(1126, 176, 'pjCountry', 1, 'name', 'Pitcairn', 'plugin', NULL),
(1127, 177, 'pjCountry', 1, 'name', 'Poland', 'plugin', NULL),
(1128, 178, 'pjCountry', 1, 'name', 'Portugal', 'plugin', NULL),
(1129, 179, 'pjCountry', 1, 'name', 'Puerto Rico', 'plugin', NULL),
(1130, 180, 'pjCountry', 1, 'name', 'Qatar', 'plugin', NULL),
(1131, 181, 'pjCountry', 1, 'name', 'Réunion', 'plugin', NULL),
(1132, 182, 'pjCountry', 1, 'name', 'Romania', 'plugin', NULL),
(1133, 183, 'pjCountry', 1, 'name', 'Russian Federation', 'plugin', NULL),
(1134, 184, 'pjCountry', 1, 'name', 'Rwanda', 'plugin', NULL),
(1135, 185, 'pjCountry', 1, 'name', 'Saint Barthélemy', 'plugin', NULL),
(1136, 186, 'pjCountry', 1, 'name', 'Saint Helena, Ascension and Tristan da Cunha', 'plugin', NULL),
(1137, 187, 'pjCountry', 1, 'name', 'Saint Kitts and Nevis', 'plugin', NULL),
(1138, 188, 'pjCountry', 1, 'name', 'Saint Lucia', 'plugin', NULL),
(1139, 189, 'pjCountry', 1, 'name', 'Saint Martin array(French part)', 'plugin', NULL),
(1140, 190, 'pjCountry', 1, 'name', 'Saint Pierre and Miquelon', 'plugin', NULL),
(1141, 191, 'pjCountry', 1, 'name', 'Saint Vincent and the Grenadines', 'plugin', NULL),
(1142, 192, 'pjCountry', 1, 'name', 'Samoa', 'plugin', NULL),
(1143, 193, 'pjCountry', 1, 'name', 'San Marino', 'plugin', NULL),
(1144, 194, 'pjCountry', 1, 'name', 'Sao Tome and Principe', 'plugin', NULL),
(1145, 195, 'pjCountry', 1, 'name', 'Saudi Arabia', 'plugin', NULL),
(1146, 196, 'pjCountry', 1, 'name', 'Senegal', 'plugin', NULL),
(1147, 197, 'pjCountry', 1, 'name', 'Serbia', 'plugin', NULL),
(1148, 198, 'pjCountry', 1, 'name', 'Seychelles', 'plugin', NULL),
(1149, 199, 'pjCountry', 1, 'name', 'Sierra Leone', 'plugin', NULL),
(1150, 200, 'pjCountry', 1, 'name', 'Singapore', 'plugin', NULL),
(1151, 201, 'pjCountry', 1, 'name', 'Sint Maarten array(Dutch part)', 'plugin', NULL),
(1152, 202, 'pjCountry', 1, 'name', 'Slovakia', 'plugin', NULL),
(1153, 203, 'pjCountry', 1, 'name', 'Slovenia', 'plugin', NULL),
(1154, 204, 'pjCountry', 1, 'name', 'Solomon Islands', 'plugin', NULL),
(1155, 205, 'pjCountry', 1, 'name', 'Somalia', 'plugin', NULL),
(1156, 206, 'pjCountry', 1, 'name', 'South Africa', 'plugin', NULL),
(1157, 207, 'pjCountry', 1, 'name', 'South Georgia and the South Sandwich Islands', 'plugin', NULL),
(1158, 208, 'pjCountry', 1, 'name', 'South Sudan', 'plugin', NULL),
(1159, 209, 'pjCountry', 1, 'name', 'Spain', 'plugin', NULL),
(1160, 210, 'pjCountry', 1, 'name', 'Sri Lanka', 'plugin', NULL),
(1161, 211, 'pjCountry', 1, 'name', 'Sudan', 'plugin', NULL),
(1162, 212, 'pjCountry', 1, 'name', 'Suriname', 'plugin', NULL),
(1163, 213, 'pjCountry', 1, 'name', 'Svalbard and Jan Mayen', 'plugin', NULL),
(1164, 214, 'pjCountry', 1, 'name', 'Swaziland', 'plugin', NULL),
(1165, 215, 'pjCountry', 1, 'name', 'Sweden', 'plugin', NULL),
(1166, 216, 'pjCountry', 1, 'name', 'Switzerland', 'plugin', NULL),
(1167, 217, 'pjCountry', 1, 'name', 'Syrian Arab Republic', 'plugin', NULL),
(1168, 218, 'pjCountry', 1, 'name', 'Taiwan, Province of China', 'plugin', NULL),
(1169, 219, 'pjCountry', 1, 'name', 'Tajikistan', 'plugin', NULL),
(1170, 220, 'pjCountry', 1, 'name', 'Tanzania, United Republic of', 'plugin', NULL),
(1171, 221, 'pjCountry', 1, 'name', 'Thailand', 'plugin', NULL),
(1172, 222, 'pjCountry', 1, 'name', 'Timor-Leste', 'plugin', NULL),
(1173, 223, 'pjCountry', 1, 'name', 'Togo', 'plugin', NULL),
(1174, 224, 'pjCountry', 1, 'name', 'Tokelau', 'plugin', NULL),
(1175, 225, 'pjCountry', 1, 'name', 'Tonga', 'plugin', NULL),
(1176, 226, 'pjCountry', 1, 'name', 'Trinidad and Tobago', 'plugin', NULL),
(1177, 227, 'pjCountry', 1, 'name', 'Tunisia', 'plugin', NULL),
(1178, 228, 'pjCountry', 1, 'name', 'Turkey', 'plugin', NULL),
(1179, 229, 'pjCountry', 1, 'name', 'Turkmenistan', 'plugin', NULL),
(1180, 230, 'pjCountry', 1, 'name', 'Turks and Caicos Islands', 'plugin', NULL),
(1181, 231, 'pjCountry', 1, 'name', 'Tuvalu', 'plugin', NULL),
(1182, 232, 'pjCountry', 1, 'name', 'Uganda', 'plugin', NULL),
(1183, 233, 'pjCountry', 1, 'name', 'Ukraine', 'plugin', NULL),
(1184, 234, 'pjCountry', 1, 'name', 'United Arab Emirates', 'plugin', NULL),
(1185, 235, 'pjCountry', 1, 'name', 'United Kingdom', 'plugin', NULL),
(1186, 236, 'pjCountry', 1, 'name', 'United States', 'plugin', NULL),
(1187, 237, 'pjCountry', 1, 'name', 'United States Minor Outlying Islands', 'plugin', NULL),
(1188, 238, 'pjCountry', 1, 'name', 'Uruguay', 'plugin', NULL),
(1189, 239, 'pjCountry', 1, 'name', 'Uzbekistan', 'plugin', NULL),
(1190, 240, 'pjCountry', 1, 'name', 'Vanuatu', 'plugin', NULL),
(1191, 241, 'pjCountry', 1, 'name', 'Venezuela, Bolivarian Republic of', 'plugin', NULL),
(1192, 242, 'pjCountry', 1, 'name', 'Viet Nam', 'plugin', NULL),
(1193, 243, 'pjCountry', 1, 'name', 'Virgin Islands, British', 'plugin', NULL),
(1194, 244, 'pjCountry', 1, 'name', 'Virgin Islands, U.S.', 'plugin', NULL),
(1195, 245, 'pjCountry', 1, 'name', 'Wallis and Futuna', 'plugin', NULL),
(1196, 246, 'pjCountry', 1, 'name', 'Western Sahara', 'plugin', NULL),
(1197, 247, 'pjCountry', 1, 'name', 'Yemen', 'plugin', NULL),
(1198, 248, 'pjCountry', 1, 'name', 'Zambia', 'plugin', NULL),
(1199, 249, 'pjCountry', 1, 'name', 'Zimbabwe', 'plugin', NULL),
(1200, 934, 'pjField', 1, 'title', 'Revert status', 'script', NULL),
(1201, 935, 'pjField', 1, 'title', 'Invoices', 'plugin', NULL),
(1202, 936, 'pjField', 1, 'title', 'Invoice Config', 'plugin', NULL),
(1203, 937, 'pjField', 1, 'title', 'Company logo', 'plugin', NULL),
(1204, 938, 'pjField', 1, 'title', 'Company name', 'plugin', NULL),
(1205, 939, 'pjField', 1, 'title', 'Name', 'plugin', NULL),
(1206, 940, 'pjField', 1, 'title', 'Street address', 'plugin', NULL),
(1207, 941, 'pjField', 1, 'title', 'City', 'plugin', NULL),
(1208, 942, 'pjField', 1, 'title', 'State', 'plugin', NULL),
(1209, 943, 'pjField', 1, 'title', 'Zip', 'plugin', NULL),
(1210, 944, 'pjField', 1, 'title', 'Phone', 'plugin', NULL),
(1211, 945, 'pjField', 1, 'title', 'Fax', 'plugin', NULL),
(1212, 946, 'pjField', 1, 'title', 'Email', 'plugin', NULL),
(1213, 947, 'pjField', 1, 'title', 'Website', 'plugin', NULL),
(1214, 948, 'pjField', 1, 'title', 'Invoice', 'plugin', NULL),
(1215, 949, 'pjField', 1, 'title', 'Use the form below to set up your company details. These details will be used for all the invoices that you create. To view all invoices <a href=\"index.php?controller=pjInvoice&action=pjActionInvoices\">click here</a>', 'plugin', NULL),
(1216, 950, 'pjField', 1, 'title', 'Invoice config updated!', 'plugin', NULL),
(1217, 951, 'pjField', 1, 'title', 'Invoice config data has been properly updated.', 'plugin', NULL),
(1218, 952, 'pjField', 1, 'title', 'Upload failed', 'plugin', NULL),
(1219, 953, 'pjField', 1, 'title', 'Template', 'plugin', NULL),
(1220, 954, 'pjField', 1, 'title', 'Delete confirmation', 'plugin', NULL),
(1221, 955, 'pjField', 1, 'title', 'Are you sure you want to delete selected logo?', 'plugin', NULL),
(1222, 956, 'pjField', 1, 'title', 'Billing information', 'plugin', NULL),
(1223, 957, 'pjField', 1, 'title', 'Shipping information', 'plugin', NULL),
(1224, 958, 'pjField', 1, 'title', 'Company Details', 'plugin', NULL),
(1225, 959, 'pjField', 1, 'title', 'Payment information', 'plugin', NULL),
(1226, 960, 'pjField', 1, 'title', 'Address', 'plugin', NULL),
(1227, 961, 'pjField', 1, 'title', 'Billing address', 'plugin', NULL),
(1228, 962, 'pjField', 1, 'title', 'General information', 'plugin', NULL),
(1229, 963, 'pjField', 1, 'title', 'Invoice no.', 'plugin', NULL),
(1230, 964, 'pjField', 1, 'title', 'Order no.', 'plugin', NULL),
(1231, 965, 'pjField', 1, 'title', 'Issue date', 'plugin', NULL),
(1232, 966, 'pjField', 1, 'title', 'Due date', 'plugin', NULL),
(1233, 967, 'pjField', 1, 'title', 'Shipping date', 'plugin', NULL),
(1234, 968, 'pjField', 1, 'title', 'Shipping terms', 'plugin', NULL),
(1235, 969, 'pjField', 1, 'title', 'Subtotal', 'plugin', NULL),
(1236, 970, 'pjField', 1, 'title', 'Discount', 'plugin', NULL),
(1237, 971, 'pjField', 1, 'title', 'Tax', 'plugin', NULL),
(1238, 972, 'pjField', 1, 'title', 'Shipping', 'plugin', NULL),
(1239, 973, 'pjField', 1, 'title', 'Total', 'plugin', NULL);
INSERT INTO `tk_cbs_multi_lang` (`id`, `foreign_id`, `model`, `locale`, `field`, `content`, `source`, `deleted_at`) VALUES
(1240, 974, 'pjField', 1, 'title', 'Paid deposit', 'plugin', NULL),
(1241, 975, 'pjField', 1, 'title', 'Amount due', 'plugin', NULL),
(1242, 976, 'pjField', 1, 'title', 'Currency', 'plugin', NULL),
(1243, 977, 'pjField', 1, 'title', 'Notes', 'plugin', NULL),
(1244, 978, 'pjField', 1, 'title', 'Shipping address', 'plugin', NULL),
(1245, 979, 'pjField', 1, 'title', 'Created', 'plugin', NULL),
(1246, 980, 'pjField', 1, 'title', 'Modified', 'plugin', NULL),
(1247, 981, 'pjField', 1, 'title', 'Item', 'plugin', NULL),
(1248, 982, 'pjField', 1, 'title', 'Qty', 'plugin', NULL),
(1249, 983, 'pjField', 1, 'title', 'Unit price', 'plugin', NULL),
(1250, 984, 'pjField', 1, 'title', 'Amount', 'plugin', NULL),
(1251, 985, 'pjField', 1, 'title', 'Add item', 'plugin', NULL),
(1252, 986, 'pjField', 1, 'title', 'Update item', 'plugin', NULL),
(1253, 987, 'pjField', 1, 'title', 'Description', 'plugin', NULL),
(1254, 988, 'pjField', 1, 'title', 'Accept payments', 'plugin', NULL),
(1255, 989, 'pjField', 1, 'title', 'PRINT', 'plugin', NULL),
(1256, 990, 'pjField', 1, 'title', 'EMAIL', 'plugin', NULL),
(1257, 991, 'pjField', 1, 'title', 'VIEW', 'plugin', NULL),
(1258, 992, 'pjField', 1, 'title', 'Send invoice', 'plugin', NULL),
(1259, 993, 'pjField', 1, 'title', 'Invoice', 'plugin', NULL),
(1260, 994, 'pjField', 1, 'title', 'Items information', 'plugin', NULL),
(1261, 995, 'pjField', 1, 'title', 'Accept payments with PayPal', 'plugin', NULL),
(1262, 996, 'pjField', 1, 'title', 'Accept payments with Authorize.NET', 'plugin', NULL),
(1263, 997, 'pjField', 1, 'title', 'Accept payments with Credit Card', 'plugin', NULL),
(1264, 998, 'pjField', 1, 'title', 'Accept payments with Bank Account', 'plugin', NULL),
(1265, 999, 'pjField', 1, 'title', 'Include Shipping information', 'plugin', NULL),
(1266, 1000, 'pjField', 1, 'title', 'Include Shipping address', 'plugin', NULL),
(1267, 1001, 'pjField', 1, 'title', 'Include Company', 'plugin', NULL),
(1268, 1002, 'pjField', 1, 'title', 'Include Name', 'plugin', NULL),
(1269, 1003, 'pjField', 1, 'title', 'Include Address', 'plugin', NULL),
(1270, 1004, 'pjField', 1, 'title', 'Include City', 'plugin', NULL),
(1271, 1005, 'pjField', 1, 'title', 'Include State', 'plugin', NULL),
(1272, 1006, 'pjField', 1, 'title', 'Include Zip', 'plugin', NULL),
(1273, 1007, 'pjField', 1, 'title', 'Include Phone', 'plugin', NULL),
(1274, 1008, 'pjField', 1, 'title', 'Include Fax', 'plugin', NULL),
(1275, 1009, 'pjField', 1, 'title', 'Include Email', 'plugin', NULL),
(1276, 1010, 'pjField', 1, 'title', 'Include Website', 'plugin', NULL),
(1277, 1011, 'pjField', 1, 'title', 'Include Street address', 'plugin', NULL),
(1278, 1012, 'pjField', 1, 'title', 'Invoice updated!', 'plugin', NULL),
(1279, 1013, 'pjField', 1, 'title', 'Invoice has been updated.', 'plugin', NULL),
(1280, 1014, 'pjField', 1, 'title', 'Invoice Not Found', 'plugin', NULL),
(1281, 1015, 'pjField', 1, 'title', 'Invoice with such ID was not found.', 'plugin', NULL),
(1282, 1016, 'pjField', 1, 'title', 'Update failed', 'plugin', NULL),
(1283, 1017, 'pjField', 1, 'title', 'Some of the data is not valid.', 'plugin', NULL),
(1284, 1018, 'pjField', 1, 'title', 'Status', 'plugin', NULL),
(1285, 1019, 'pjField', 1, 'title', 'Pay with Paypal', 'plugin', NULL),
(1286, 1020, 'pjField', 1, 'title', 'Pay with Authorize.Net', 'plugin', NULL),
(1287, 1021, 'pjField', 1, 'title', 'Pay with Credit Card', 'plugin', NULL),
(1288, 1022, 'pjField', 1, 'title', 'Pay with Bank Account', 'plugin', NULL),
(1289, 1023, 'pjField', 1, 'title', 'Pay Now', 'plugin', NULL),
(1290, 1024, 'pjField', 1, 'title', 'Invoice module', 'plugin', NULL),
(1291, 1025, 'pjField', 1, 'title', 'Invoice module', 'plugin', NULL),
(1292, 1026, 'pjField', 1, 'title', 'Paypal address', 'plugin', NULL),
(1293, 1027, 'pjField', 1, 'title', 'Authorize.Net Timezone', 'plugin', NULL),
(1294, 1028, 'pjField', 1, 'title', 'Authorize.Net Merchant ID', 'plugin', NULL),
(1295, 1029, 'pjField', 1, 'title', 'Authorize.Net Transaction Key', 'plugin', NULL),
(1296, 1030, 'pjField', 1, 'title', 'Bank Account', 'plugin', NULL),
(1297, 1031, 'pjField', 1, 'title', 'You will be redirected to Paypal in 3 seconds. If not please click on the button.', 'plugin', NULL),
(1298, 1032, 'pjField', 1, 'title', 'You will be redirected to Authorize.net in 3 seconds. If not please click on the button.', 'plugin', NULL),
(1299, 1033, 'pjField', 1, 'title', 'Proceed with payment', 'plugin', NULL),
(1300, 1034, 'pjField', 1, 'title', 'Proceed with payment', 'plugin', NULL),
(1301, 1035, 'pjField', 1, 'title', 'Delete selected', 'plugin', NULL),
(1302, 1036, 'pjField', 1, 'title', 'Are you sure you want to delete selected invoices?', 'plugin', NULL),
(1303, 1037, 'pjField', 1, 'title', 'Is shipped', 'plugin', NULL),
(1304, 1038, 'pjField', 1, 'title', 'Include Shipping date', 'plugin', NULL),
(1305, 1039, 'pjField', 1, 'title', 'Include Shipping terms', 'plugin', NULL),
(1306, 1040, 'pjField', 1, 'title', 'Include Is Shipped', 'plugin', NULL),
(1307, 1041, 'pjField', 1, 'title', 'Not Paid', 'plugin', NULL),
(1308, 1042, 'pjField', 1, 'title', 'Paid', 'plugin', NULL),
(1309, 1043, 'pjField', 1, 'title', 'Cancelled', 'plugin', NULL),
(1310, 1044, 'pjField', 1, 'title', 'No.', 'plugin', NULL),
(1311, 1045, 'pjField', 1, 'title', 'ADD +', 'plugin', NULL),
(1312, 1046, 'pjField', 1, 'title', 'SAVE', 'plugin', NULL),
(1313, 1047, 'pjField', 1, 'title', 'Booking URL - Token: {ORDER_ID}', 'plugin', NULL),
(1314, 1048, 'pjField', 1, 'title', 'Include Shipping', 'plugin', NULL),
(1315, 1049, 'pjField', 1, 'title', 'Invoice added!', 'plugin', NULL),
(1316, 1050, 'pjField', 1, 'title', 'Invoice has been added.', 'plugin', NULL),
(1317, 1051, 'pjField', 1, 'title', 'Invoice has not been added.', 'plugin', NULL),
(1318, 1052, 'pjField', 1, 'title', 'Invoice failed to add!', 'plugin', NULL),
(1319, 1053, 'pjField', 1, 'title', 'Notice', 'plugin', NULL),
(1320, 1054, 'pjField', 1, 'title', 'Invoice will be sent to the following email address(es). You can change or delete any of them.', 'plugin', NULL),
(1321, 1055, 'pjField', 1, 'title', 'Invoice details', 'plugin', NULL),
(1322, 1056, 'pjField', 1, 'title', 'Fill in invoice details and use the buttons below to view, print or email the invoice.', 'plugin', NULL),
(1323, 1057, 'pjField', 1, 'title', 'Billing details', 'plugin', NULL),
(1324, 1058, 'pjField', 1, 'title', 'Under \"Billing information\" you can edit your customer billing details. Under \"Company information\" is your company billing information which will be used for the invoice.', 'plugin', NULL),
(1325, 1059, 'pjField', 1, 'title', 'Quantity format', 'plugin', NULL),
(1326, 1060, 'pjField', 1, 'title', 'Format as INT instead of FLOAT', 'plugin', NULL),
(1327, 1061, 'pjField', 1, 'title', 'Authorize.Net hash value', 'plugin', NULL),
(1328, 1062, 'pjField', 1, 'title', 'Allow cash payments', 'plugin', NULL),
(1329, 1063, 'pjField', 1, 'title', 'Use Shipping Details', 'plugin', NULL),
(1330, 1064, 'pjField', 1, 'title', 'View invoice', 'plugin', NULL),
(1331, 1065, 'pjField', 1, 'title', 'Print invoice', 'plugin', NULL),
(1332, 1066, 'pjField', 1, 'title', 'Company Details', 'plugin', NULL),
(1333, 1067, 'pjField', 1, 'title', 'Options', 'plugin', NULL),
(1334, 1068, 'pjField', 1, 'title', 'Template', 'plugin', NULL),
(1335, 1069, 'pjField', 1, 'title', 'Details', 'plugin', NULL),
(1336, 1070, 'pjField', 1, 'title', 'Client', 'plugin', NULL),
(1337, 1071, 'pjField', 1, 'title', 'Invoice', 'plugin', NULL),
(1338, 1072, 'pjField', 1, 'title', 'Payment method', 'plugin', NULL),
(1339, 1073, 'pjField', 1, 'title', 'Authorize.net', 'plugin', NULL),
(1340, 1074, 'pjField', 1, 'title', 'Bank account', 'plugin', NULL),
(1341, 1075, 'pjField', 1, 'title', 'Credit card', 'plugin', NULL),
(1342, 1076, 'pjField', 1, 'title', 'PayPal', 'plugin', NULL),
(1343, 1077, 'pjField', 1, 'title', 'Cash', 'plugin', NULL),
(1344, 1078, 'pjField', 1, 'title', 'Option', 'plugin', NULL),
(1345, 1079, 'pjField', 1, 'title', 'Value', 'plugin', NULL),
(1346, 1080, 'pjField', 1, 'title', 'Pay with Cash', 'plugin', NULL),
(1347, 1081, 'pjField', 1, 'title', 'CC Type', 'plugin', NULL),
(1348, 1082, 'pjField', 1, 'title', 'CC Number', 'plugin', NULL),
(1349, 1083, 'pjField', 1, 'title', 'CC Code', 'plugin', NULL),
(1350, 1084, 'pjField', 1, 'title', 'CC Expiration', 'plugin', NULL),
(1351, 1085, 'pjField', 1, 'title', 'Invoice ID already exists.', 'plugin', NULL),
(1352, 1086, 'pjField', 1, 'title', 'Maestro', 'plugin', NULL),
(1353, 1087, 'pjField', 1, 'title', 'AmericanExpress', 'plugin', NULL),
(1354, 1088, 'pjField', 1, 'title', 'MasterCard', 'plugin', NULL),
(1355, 1089, 'pjField', 1, 'title', 'Visa', 'plugin', NULL),
(1356, 1090, 'pjField', 1, 'title', 'CC Details', 'plugin', NULL),
(1357, 1091, 'pjField', 1, 'title', 'Country', 'plugin', NULL),
(1358, 1092, 'pjField', 1, 'title', 'Use quantity and Unit price', 'plugin', NULL),
(1359, 1093, 'pjField', 1, 'title', 'Thank you for your payment. We will contact you as soon as possible.', 'plugin', NULL),
(1360, 1094, 'pjField', 1, 'title', 'Click on the link below to view the invoice.', 'plugin', NULL),
(1361, 1095, 'pjField', 1, 'title', 'Yes', 'plugin', NULL),
(1362, 1096, 'pjField', 1, 'title', 'No', 'plugin', NULL),
(1363, 1097, 'pjField', 1, 'title', 'List of invoices', 'plugin', NULL),
(1364, 1098, 'pjField', 1, 'title', 'Here you can see the list of generated invoices.', 'plugin', NULL),
(1365, 1099, 'pjField', 1, 'title', 'Company Details', 'plugin', NULL),
(1366, 1100, 'pjField', 1, 'title', 'Use the form below to set up your company details. These details will be used for all the invoices that you create. To view all invoices <a href=\"index.php?controller=pjInvoice&action=pjActionInvoices\">click here</a>', 'plugin', NULL),
(1367, 1101, 'pjField', 1, 'title', 'Options', 'plugin', NULL),
(1368, 1102, 'pjField', 1, 'title', 'Set payment methods to be accepted when invoices are paid. You can also specify if Shipping details will be used in the invoices you create or not.', 'plugin', NULL),
(1369, 1103, 'pjField', 1, 'title', 'Template', 'plugin', NULL),
(1370, 1104, 'pjField', 1, 'title', 'Use the editor below to create a template for your invoices. Include different tokens which will be replaced by invoice data.<br /><br /><br /> <table width=\"100%\" border=\"0\" cellpadding=\"5\">   <tr>     <td align=\"left\" valign=\"top\" width=\"50%\">{uuid} - invoice unique ID<br />      	{order_id} - order ID          {issue_date} - invoice issue date<br />         {due_date} - payment due date<br />         {created} - created date and time<br />         {modified} - update date and time<br />         {status} - invoice status<br />         {subtotal} - sub total amount<br />         {discount} - discount amount<br />         {tax} - tax amount<br />         {shipping} - shipping amount<br />         {total} - total amount<br />         {paid_deposit} - paid deposit amount<br />         {amount_due} - amount due<br />         {currency} - currency<br />         {notes} - notes<br /> 	    {items} - items         <strong>Company details</strong><br />         {y_logo} - logo<br />         {y_company} - company name<br />         {y_name} - name<br />         {y_street_address} - address<br />         {y_country} - country<br />         {y_city} - city<br />         {y_state} - state<br />         {y_zip} - zip<br />         {y_phone} - phone<br />         {y_fax} - fax<br />         {y_email} - email<br />         {y_url} - url</td>     <td align=\"left\" valign=\"top\" width=\"50%\">     <strong>Client billing details</strong><br />     {b_billing_address} - address<br />     {b_company} - company<br />     {b_name} - name<br />     {b_address} - address<br />     {b_street_address} - street address<br />     {b_country} - country<br />     {b_city} - city<br />     {b_state} - state<br />     {b_zip} - zip<br />     {b_phone} - phone<br />     {b_fax} - fax<br />     {b_email} - email<br />     {b_url} - url<br />     <strong>Client shipping details</strong><br />     {s_shipping_address} - address<br />     {s_company} - company<br />     {s_name} - name<br />     {s_address} - address<br />     {s_street_address} - street address<br />     {s_country} - country<br />     {s_city} - city<br />     {s_state} - state<br />     {s_zip} - zip<br />     {s_phone} - phone<br />     {s_fax} - fax<br />     {s_email} - email<br />     {s_url} - url<br />     {s_date} - shipping date<br />     {s_terms} - shipping terms<br />     {s_is_shipped} - is shipped status<br />     </td>   </tr> </table>', 'plugin', NULL),
(1371, 1105, 'pjField', 1, 'title', 'Email invoice', 'script', NULL),
(1372, 1106, 'pjField', 1, 'title', 'Status is required', 'plugin', NULL),
(1373, 1, 'pjInvoiceConfig', 1, 'y_company', 'Ticket@Guru', 'plugin', NULL),
(1374, 1, 'pjInvoiceConfig', 1, 'y_name', 'Global Gala', 'plugin', NULL),
(1375, 1, 'pjInvoiceConfig', 1, 'y_street_address', '34 El-Hassan Street', 'plugin', NULL),
(1376, 1, 'pjInvoiceConfig', 1, 'y_city', 'Ad Doqi', 'plugin', NULL),
(1377, 1, 'pjInvoiceConfig', 1, 'y_state', 'Giza Governorate', 'plugin', NULL),
(1378, 1, 'pjInvoiceConfig', 1, 'y_template', '<table style=\"width: 100%;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%;\"><strong>{y_company}</strong></td>\r\n<td><strong>Invoice no.</strong> {uuid}</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td><strong>Date</strong> {issue_date}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<table style=\"width: 85%;\" border=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"border-bottom-style: solid; border-bottom-width: 1px;\"><strong>Bill To:</strong></td>\r\n</tr>\r\n<tr>\r\n<td><strong>{b_name}</strong></td>\r\n</tr>\r\n<tr>\r\n<td><strong>{b_company}</strong></td>\r\n</tr>\r\n<tr>\r\n<td>{b_billing_address}</td>\r\n</tr>\r\n<tr>\r\n<td>{b_city}</td>\r\n</tr>\r\n<tr>\r\n<td>{b_state} {b_zip}</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>Phone: {b_phone}, Fax: {b_fax}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: large;\"><strong>Invoice</strong></span></p>\r\n<p>{items}</p>\r\n<p>&nbsp;</p>\r\n<table style=\"width: 100%;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>Note:</td>\r\n<td style=\"text-align: right;\">SubTotal:</td>\r\n<td style=\"text-align: right;\">{subtotal}</td>\r\n</tr>\r\n<tr>\r\n<td>Thanks for your business!</td>\r\n<td style=\"text-align: right;\">Discount:</td>\r\n<td style=\"text-align: right;\">{discount}</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td style=\"text-align: right;\"><strong>Total:</strong></td>\r\n<td style=\"text-align: right;\"><strong>{total}</strong></td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td style=\"text-align: right;\">Amount paid:</td>\r\n<td style=\"text-align: right;\">{paid_deposit}</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td style=\"text-align: right;\"><strong>Amount Due:</strong></td>\r\n<td style=\"text-align: right;\"><strong>{amount_due}</strong></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<table style=\"width: 100%; border-collapse: collapse;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"border-bottom-style: solid; border-bottom-width: 1px;\"><strong>{y_company}</strong></td>\r\n<td style=\"border-bottom-style: solid; border-bottom-width: 1px;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>{y_street_address}</td>\r\n<td>Phone: {y_phone}</td>\r\n</tr>\r\n<tr>\r\n<td>{y_city}</td>\r\n<td>Email: {y_email}</td>\r\n</tr>\r\n<tr>\r\n<td style=\"border-bottom-style: solid; border-bottom-width: 1px;\">{y_state} {y_zip}</td>\r\n<td style=\"border-bottom-style: solid; border-bottom-width: 1px;\">Website: {y_url}</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'plugin', NULL),
(1379, 1, 'pjInvoiceConfig', 1, 'p_paypal_address', 'info@domain.com', 'plugin', NULL),
(1380, 1, 'pjInvoiceConfig', 1, 'p_bank_account', 'bank account information goes here', 'plugin', NULL),
(1381, 1107, 'pjField', 1, 'title', 'Amount paid', 'script', NULL),
(1382, 1108, 'pjField', 1, 'title', 'SMS', 'plugin', NULL),
(1383, 1109, 'pjField', 1, 'title', 'SMS Config', 'plugin', NULL),
(1384, 1110, 'pjField', 1, 'title', 'Phone number', 'plugin', NULL),
(1385, 1111, 'pjField', 1, 'title', 'Message', 'plugin', NULL),
(1386, 1112, 'pjField', 1, 'title', 'Status', 'plugin', NULL),
(1387, 1113, 'pjField', 1, 'title', 'Date/Time sent', 'plugin', NULL),
(1388, 1114, 'pjField', 1, 'title', 'API Key', 'plugin', NULL),
(1389, 1115, 'pjField', 1, 'title', 'SMS', 'plugin', NULL),
(1390, 1116, 'pjField', 1, 'title', 'To send SMS you need a valid API Key. Please, contact StivaSoft to purchase an API key.', 'plugin', NULL),
(1391, 1117, 'pjField', 1, 'title', 'SMS API key updated!', 'plugin', NULL),
(1392, 1118, 'pjField', 1, 'title', 'All changes have been saved.', 'plugin', NULL),
(1393, 1119, 'pjField', 1, 'title', 'Reset search', 'plugin', NULL),
(1394, 1120, 'pjField', 1, 'title', 'Email account for email notifications', 'script', NULL),
(1395, 1121, 'pjField', 1, 'title', 'Set the email which users will see when they receive emails from the system. Go to Notifications tab to manage automated email notifications.', 'script', NULL),
(1396, 1122, 'pjField', 1, 'title', 'The captcha is not correct. Please try again.', 'script', NULL),
(1397, 1123, 'pjField', 1, 'title', 'Available seats', 'script', NULL),
(1401, 1, 'pjPrice', 1, 'price_name', 'Adults', 'data', NULL),
(1536, 2, 'pjPrice', 1, 'price_name', 'All', 'data', NULL),
(1552, 3, 'pjPrice', 1, 'price_name', 'Adult', 'data', NULL),
(1562, 4, 'pjPrice', 1, 'price_name', 'Adult', 'data', NULL),
(3623, 1124, 'pjField', 1, 'title', 'CMS', 'script', NULL),
(3652, 1125, 'pjField', 1, 'title', 'Add Gallery Image', 'script', NULL),
(3653, 1126, 'pjField', 1, 'title', 'Add new gallery image', 'script', NULL),
(3655, 1127, 'pjField', 1, 'title', 'List of items', 'script', NULL),
(3657, 1128, 'pjField', 1, 'title', 'Image Gallery', 'script', NULL),
(3665, 5, 'pjPrice', 1, 'price_name', 'Gold', 'data', NULL),
(3685, 1129, 'pjField', 1, 'title', 'List of gallery images', 'script', NULL),
(5809, 1, 'pjImageGallery', 1, 'title', 'Mohamed Abdo Concert 20191', 'data', NULL),
(5810, 1, 'pjImageGallery', 1, 'description', 'Mohamed Abdo Concert 20191', 'data', NULL),
(5813, 3, 'pjImageGallery', 1, 'title', 'Mohamed Abdo Concert 2019', 'data', NULL),
(5814, 3, 'pjImageGallery', 1, 'description', 'Mohamed Abdo Concert 2019', 'data', NULL),
(5836, 1130, 'pjField', 1, 'title', 'All changes made to the gallery have been saved.', 'script', NULL),
(5844, 6, 'pjPrice', 1, 'price_name', 'family', 'data', NULL),
(5845, 7, 'pjPrice', 1, 'price_name', 'youth', 'data', NULL),
(5846, 8, 'pjPrice', 1, 'price_name', 'childrn', 'data', NULL),
(5854, 1133, 'pjField', 1, 'title', 'Add Pages', 'script', NULL),
(5855, 1134, 'pjField', 1, 'title', 'Add new Cms Pages', 'script', NULL),
(5856, 1135, 'pjField', 1, 'title', 'List of Pages', 'script', NULL),
(5857, 1136, 'pjField', 1, 'title', 'Here you can see the list of pages.', 'script', NULL),
(5858, 1137, 'pjField', 1, 'title', 'Page Title', 'script', NULL),
(5909, 1138, 'pjField', 1, 'title', 'Page Name', 'script', NULL),
(5921, 1139, 'pjField', 1, 'title', 'Meta Title', 'script', NULL),
(5934, 1140, 'pjField', 1, 'title', 'Meta Description', 'script', NULL),
(5935, 1141, 'pjField', 1, 'title', 'Meta Key', 'script', NULL),
(5946, 1, 'pjCms', 1, 'cms_title', 'Terms & Conditions', 'data', NULL),
(5947, 1, 'pjCms', 1, 'cms_description', '<ul>\r\n<li><a href=\"#ticket\">Ticket Delivery Method</a></li>\r\n<li><a href=\"#return\">Returns</a></li>\r\n<li><a href=\"#refund\">Refund &amp; Cancellation</a></li>\r\n</ul>\r\n<h1 id=\"ticket\">Ticket Delivery Method</h1>\r\n<p>We\'ll send your ticket confirmation immediately after you have ordered, or when we receive the website notification. Your tickets will be available to pick up at the box office once you received an order confirmation from our website. If your ticket is not ready once you arrive with proof of purchase we will print the ticket as you wait.<br /><br />We\'ll keep our website homepage updated for all the big events happening across the UK over the next few months, so be sure to check back there for general information. If you were unable to confirm a ticket don\'t worry, you can always visit the box office directly in case seating becomes available. <br /> <br />To check if your order\'s on its way out yet, just log into the Global Gala or Six Stars website and go to your order history &ndash; the Order Status in your account will state to show the information about your ticket, and the latest you should receive them is around 24 before the eve.</p>\r\n<hr />\r\n<h1 id=\"return\">Returns</h1>\r\n<p>We\'ll send your ticket confirmation immediately after you have ordered, or when we receive the website notification. Your tickets will be available to pick up at the box office once you received an order confirmation from our website. If your ticket is not ready once you arrive with proof of purchase we will print the ticket as you wait.<br /><br />We\'ll keep our website homepage updated for all the big events happening across the UK over the next few months, so be sure to check back there for general information. If you were unable to confirm a ticket don\'t worry, you can always visit the box office directly in case seating becomes available. <br /> <br />To check if your order\'s on its way out yet, just log into the Global Gala or Six Stars website and go to your order history &ndash; the Order Status in your account will state to show the information about your ticket, and the latest you should receive them is around 24 before the eve.</p>\r\n<hr />\r\n<h1 id=\"refund\">Refund &amp; Cancellation</h1>\r\n<p>We understand that refund policies vary depending on the type of event and the Organizer. Six Stars Events refund policy is simple, if the event is cancelled or you are denied entry for any reason, we will refund the amount you paid for your tickets (minus any processing or services fees) using the same payment method used for purchase.</p>\r\n<p>If your event is postponed, we will contact you with the new date and time. Event details such as Venue and Times are subject to change without notice and are not grounds for a refund. E-Tickets can be reprinted at any time by accessing the confirmation page in your email or by logging into your account if you are a registered member. Anything promised by the event organizer that is unfulfilled is not guaranteed by Six Stars Events and is not grounds for a refund. E-Tickets cannot be exchanged.</p>\r\n<p>In the event that Organizer fails to honour a refund that an Attendee believes is due under the applicable refund policy and/or the minimum requirements set forth above, that Attendee may request that Global Gala Ltd. initiate a refund by contacting us. Six Stars Events will review the facts and circumstances and determine whether or not a refund is due in accordance with the applicable refund policy and the minimum requirements set forth above.</p>\r\n<p>All ticket purchases must be cancelled 48 hours before the event has commenced.</p>\r\n<p>All ticket purchases must be cancelled 48 hours before the event has commenced.</p>\r\n<p>Updated June 2018.</p>', 'data', NULL),
(5948, 1, 'pjCms', 1, 'cms_meta_key', 'Terms & Conditions', 'data', NULL),
(5949, 1, 'pjCms', 1, 'cms_meta_title', 'Terms & Conditions', 'data', NULL),
(5950, 1, 'pjCms', 1, 'cms_meta_desc', 'Terms & Conditions', 'data', NULL),
(5956, 1143, 'pjField', 1, 'title', 'Edit Cms Pages', 'script', NULL),
(5971, 1142, 'pjField', 1, 'title', 'Edit Page', 'script', NULL),
(5979, 1144, 'pjField', 1, 'title', 'Page updated.', 'script', NULL),
(5982, 1145, 'pjField', 1, 'title', 'All changes made to the hall have been saved.', 'script', NULL),
(5996, 1146, 'pjField', 1, 'title', 'New page has been added.', 'script', NULL),
(5997, 1147, 'pjField', 1, 'title', 'Page added.', 'script', NULL),
(6018, 1148, 'pjField', 1, 'title', 'Subscribers', 'script', NULL),
(6025, 1149, 'pjField', 1, 'title', 'Sliders', 'script', NULL),
(6033, 1150, 'pjField', 1, 'title', 'List of Slider images ', 'script', NULL),
(6034, 1151, 'pjField', 1, 'title', 'Here you can see the list of sliders. To add a new slider, click on the \'Add slider\' tab. In order to see more details or edit slider information, click on the \'Pencil\' icon on the corresponding row.', 'script', NULL),
(6044, 1152, 'pjField', 1, 'title', 'Slider added', 'script', NULL),
(6045, 1153, 'pjField', 1, 'title', 'New slider has been added.', 'script', NULL),
(6046, 1154, 'pjField', 1, 'title', 'All changes made to the slider have been saved.', 'script', NULL),
(6047, 1155, 'pjField', 1, 'title', 'Slider updated', 'script', NULL),
(6048, 1156, 'pjField', 1, 'title', 'Enter slider link,tittle and image ', 'script', NULL),
(6049, 1157, 'pjField', 1, 'title', 'Add Slider Image', 'script', NULL),
(6050, 1158, 'pjField', 1, 'title', 'Edit Slider Image', 'script', NULL),
(6051, 1159, 'pjField', 1, 'title', 'Edit slider link,tittle and image ', 'script', NULL),
(6087, 1160, 'pjField', 1, 'title', 'Banner Link', 'script', NULL),
(6091, 2, 'pjSlider', 1, 'title', 'Mohamed Abdo Concert 2019', 'data', NULL),
(6095, 1161, 'pjField', 1, 'title', 'Subscriber Groups', 'script', NULL),
(6096, 1162, 'pjField', 1, 'title', 'Lists', 'script', NULL),
(6097, 1163, 'pjField', 1, 'title', 'You can organize the subscribers in lists. Create as many lists as you want and assign each subscriber to one or multiple lists. Later you can send messages to specific lists only. Each list has own registration form so people can subscribe to specific list only.', 'script', NULL),
(6098, 1164, 'pjField', 1, 'title', 'Create new list', 'script', NULL),
(6099, 1165, 'pjField', 1, 'title', 'Enter list name and click on \"Save\" button. On next screen you will be able to set various option for the list - subscribers\' data to be collected, confirmation and autoresponder messages, subscription form code.', 'script', NULL),
(6100, 1166, 'pjField', 1, 'title', 'Update list', 'script', NULL),
(6101, 1167, 'pjField', 1, 'title', 'Open the tabs below to change different settings for this list.', 'script', NULL),
(6122, 1168, 'pjField', 1, 'title', 'Add to list', 'script', NULL),
(6123, 1169, 'pjField', 1, 'title', 'Assign to list', 'script', NULL),
(6124, 1170, 'pjField', 1, 'title', 'Please select list(s) below to assign selected subscribers.', 'script', NULL),
(6125, 1171, 'pjField', 1, 'title', '+ Create list', 'script', NULL),
(6129, 9, 'pjPrice', 1, 'price_name', 'Blue', 'data', NULL),
(6144, 1172, 'pjField', 1, 'title', 'List details', 'script', NULL),
(6145, 1173, 'pjField', 1, 'title', 'Emails', 'script', NULL),
(6146, 1174, 'pjField', 1, 'title', 'Subscription form', 'script', NULL),
(6147, 1175, 'pjField', 1, 'title', 'Please select at least one field.', 'script', NULL),
(6151, 1176, 'pjField', 1, 'title', 'Subscribers data', 'script', NULL),
(6156, 1177, 'pjField', 1, 'title', 'Total subscribers', 'script', NULL),
(6162, 1178, 'pjField', 1, 'title', 'Subscribed', 'script', NULL),
(6169, 1179, 'pjField', 1, 'title', 'Unsubscribed', 'script', NULL),
(6177, 1180, 'pjField', 1, 'title', 'List', 'script', NULL),
(6186, 1181, 'pjField', 1, 'title', 'Subscribers data', 'script', NULL),
(6196, 1208, 'pjField', 1, 'title', 'First name', 'script', NULL),
(6197, 1209, 'pjField', 1, 'title', 'Last name', 'script', NULL),
(6198, 1210, 'pjField', 1, 'title', 'Website', 'script', NULL),
(6199, 1211, 'pjField', 1, 'title', 'Gender', 'script', NULL),
(6200, 1212, 'pjField', 1, 'title', 'Age', 'script', NULL),
(6201, 1213, 'pjField', 1, 'title', 'Birthday', 'script', NULL),
(6202, 1214, 'pjField', 1, 'title', 'Address', 'script', NULL),
(6203, 1215, 'pjField', 1, 'title', 'City', 'script', NULL),
(6204, 1216, 'pjField', 1, 'title', 'State', 'script', NULL),
(6205, 1217, 'pjField', 1, 'title', 'Country', 'script', NULL),
(6206, 1218, 'pjField', 1, 'title', 'Zip', 'script', NULL),
(6212, 1232, 'pjField', 1, 'title', 'Company name', 'script', NULL),
(6219, 1235, 'pjField', 1, 'title', 'Select the fields that this list\'s subscribers should fill in on the subscription form.', 'script', NULL),
(6220, 1236, 'pjField', 1, 'title', 'Confirm subscription', 'script', NULL),
(6221, 1237, 'pjField', 1, 'title', 'If you check \"Confirm subscription\" then people who subscribe for this list will receive a confirmation message with a link in it. Please, note that you should include {ConfirmURL} token which is used for this confirmation link. They should click on that link to confirm their subscription. Use additional tokens to personalize the confirmation message.', 'script', NULL),
(6222, 1238, 'pjField', 1, 'title', 'Autoresponder', 'script', NULL),
(6223, 1239, 'pjField', 1, 'title', 'Autoresponder', 'script', NULL),
(6235, 1785, 'pjField', 1, 'title', 'Use these tokens and the message and they will be replaced by the actual subscriber\'s data.<br /><br /><label>{FirstName}</label><label>{LastName}</label><label>{Email}</label><label>{Phone}</label><label>{Website}</label><label>{Gender}</label><label>{Age}</label><label>{Birthday}</label><label>{Address}</label><label>{City}</label><label>{State}</label><label>{Country}</label><label>{Zip}</label><label>{CompanyName}</label><label>{Unsubscribe}</label>', 'script', NULL),
(6248, 1786, 'pjField', 1, 'title', 'Confirm subscription', 'script', NULL),
(6249, 1787, 'pjField', 1, 'title', 'List updated!', 'script', NULL),
(6250, 1788, 'pjField', 1, 'title', 'All changes made to the list have been saved.', 'script', NULL),
(6251, 1789, 'pjField', 1, 'title', 'List was added!', 'script', NULL),
(6252, 1790, 'pjField', 1, 'title', 'A new list has been added.', 'script', NULL),
(6253, 1791, 'pjField', 1, 'title', 'List could not be added.', 'script', NULL),
(6254, 1792, 'pjField', 1, 'title', 'List could not be created. Please, try again.', 'script', NULL),
(6255, 1793, 'pjField', 1, 'title', 'List not found!', 'script', NULL),
(6256, 1794, 'pjField', 1, 'title', 'List you are looking for is missing.', 'script', NULL),
(6257, 1795, 'pjField', 1, 'title', 'Update list', 'script', NULL),
(6258, 1796, 'pjField', 1, 'title', 'Subscriber updated', 'script', NULL),
(6259, 1797, 'pjField', 1, 'title', 'All changes made to the subscriber have been saved.', 'script', NULL),
(6260, 1798, 'pjField', 1, 'title', 'Subscriber added', 'script', NULL),
(6261, 1799, 'pjField', 1, 'title', 'A new subscriber has been added to the list.', 'script', NULL),
(6262, 1800, 'pjField', 1, 'title', 'Subscriber failed to add', 'script', NULL),
(6263, 1801, 'pjField', 1, 'title', 'Subscriber could not be added. Please, try again.', 'script', NULL),
(6264, 1802, 'pjField', 1, 'title', 'Subscriber not found', 'script', NULL),
(6265, 1803, 'pjField', 1, 'title', 'Subscriber you are looking for is missing.', 'script', NULL),
(6266, 1811, 'pjField', 1, 'title', 'Subscribers', 'script', NULL),
(6267, 1812, 'pjField', 1, 'title', 'Import', 'script', NULL),
(6268, 1813, 'pjField', 1, 'title', 'Add а subscriber', 'script', NULL),
(6269, 1814, 'pjField', 1, 'title', 'Fill in the form below to add a subscriber. You can assign the subscriber to one or multiple different lists.', 'script', NULL),
(6270, 1815, 'pjField', 1, 'title', 'There are no lists.', 'script', NULL),
(6271, 1816, 'pjField', 1, 'title', 'Add a list', 'script', NULL),
(6278, 2052, 'pjField', 1, 'title', 'List of subscribers', 'script', NULL),
(6279, 2053, 'pjField', 1, 'title', 'You can find below the list of subscriber. Click on the button \"+ Add subscriber\" to add new subscriber. You can view more details about a specific subscriber by clicking on the pencil icon on the corresponding entry.', 'script', NULL),
(6280, 2054, 'pjField', 1, 'title', '+ Add subscriber', 'script', NULL),
(6281, 2055, 'pjField', 1, 'title', 'Send message to subscriber', 'script', NULL),
(6282, 2056, 'pjField', 1, 'title', 'Send message', 'script', NULL),
(6283, 2057, 'pjField', 1, 'title', 'Send message', 'script', NULL),
(6284, 2058, 'pjField', 1, 'title', 'Add a message', 'script', NULL),
(6285, 2059, 'pjField', 1, 'title', 'Remove from current list(s)', 'script', NULL),
(6286, 2060, 'pjField', 1, 'title', 'Import subscribers', 'script', NULL),
(6287, 2061, 'pjField', 1, 'title', 'You can either upload a CSV file with your subscribers or copy/paste from Excel. If you check \"Update subscribers\" then subscribers who are already in your list will be updated with the new data provided. Otherwise each new subscriber will be added to the list and duplicates may be possible. Sample CSV file can be found <a href=\"import-sample.csv\">here</a>.', 'script', NULL),
(6288, 2062, 'pjField', 1, 'title', 'CSV file', 'script', NULL),
(6289, 2063, 'pjField', 1, 'title', 'Subscribers', 'script', NULL),
(6290, 2064, 'pjField', 1, 'title', 'Subscribers', 'script', NULL),
(6291, 2065, 'pjField', 1, 'title', 'Fill in the form below to edit subscriber information. You can assign the subscriber to one or multiple different lists.', 'script', NULL),
(6292, 2066, 'pjField', 1, 'title', 'Update subscriber', 'script', NULL),
(6293, 2067, 'pjField', 1, 'title', 'Date/time created', 'script', NULL),
(6294, 2068, 'pjField', 1, 'title', 'Date/time modified', 'script', NULL),
(6295, 2069, 'pjField', 1, 'title', 'Messages sent', 'script', NULL),
(6305, 2070, 'pjField', 1, 'title', 'Subscribed', 'script', NULL),
(6306, 2071, 'pjField', 1, 'title', 'Unsubscribed', 'script', NULL),
(6318, 2072, 'pjField', 1, 'title', 'Name & Email', 'script', NULL),
(6319, 2073, 'pjField', 1, 'title', 'Total sent', 'script', NULL),
(6320, 2074, 'pjField', 1, 'title', ' Last sent', 'script', NULL),
(6335, 2075, 'pjField', 1, 'title', 'Female', 'script', NULL),
(6336, 2076, 'pjField', 1, 'title', 'Male', 'script', NULL),
(6338, 2173, 'pjField', 1, 'title', 'Create a message', 'script', NULL),
(6339, 2174, 'pjField', 1, 'title', 'You can create a message using the form below. Just fill in message subject and body, attach files and save it. You have the option to add both HTML and Plain text version for your email message.<br /><br />  Use these tokens and the message and they will be replaced by the actual subscriber\'s data.<br /><br /><label>{FirstName}</label><label>{LastName}</label><label>{Email}</label><label>{Phone}</label><label>{Website}</label><label>{Gender}</label><label>{Age}</label><label>{Birthday}</label><label>{Address}</label><label>{City}</label><label>{State}</label><label>{Country}</label><label>{Zip}</label><label>{CompanyName}</label><label>{Unsubscribe}</label>', 'script', NULL),
(6340, 2175, 'pjField', 1, 'title', 'Edit message', 'script', NULL),
(6341, 2176, 'pjField', 1, 'title', 'You can change your email message. Please, note that all the messages in the queue will be sent using that new message. We advise you to create a new message every time you need to send different message to your subscribers instead of editing existing messages.', 'script', NULL),
(6342, 2177, 'pjField', 1, 'title', 'Messages', 'script', NULL),
(6343, 2178, 'pjField', 1, 'title', 'Add message', 'script', NULL),
(6344, 2179, 'pjField', 1, 'title', 'Attach file(s)', 'script', NULL),
(6345, 2180, 'pjField', 1, 'title', 'Update message', 'script', NULL),
(6346, 2181, 'pjField', 1, 'title', 'download', 'script', NULL),
(6347, 2182, 'pjField', 1, 'title', 'Delete file', 'script', NULL),
(6348, 2183, 'pjField', 1, 'title', 'Are you sure that you really want to delete this file?', 'script', NULL),
(6349, 2184, 'pjField', 1, 'title', 'Send', 'script', NULL),
(6350, 2185, 'pjField', 1, 'title', 'Schedule', 'script', NULL),
(6351, 2186, 'pjField', 1, 'title', 'Send now', 'script', NULL),
(6352, 2187, 'pjField', 1, 'title', 'Send later', 'script', NULL),
(6353, 2188, 'pjField', 1, 'title', 'Send on', 'script', NULL),
(6354, 2189, 'pjField', 1, 'title', 'Send in batches', 'script', NULL),
(6355, 2190, 'pjField', 1, 'title', 'emails every', 'script', NULL),
(6356, 2191, 'pjField', 1, 'title', 'HTML message', 'script', NULL),
(6357, 2192, 'pjField', 1, 'title', 'Plain message', 'script', NULL),
(6358, 2193, 'pjField', 1, 'title', 'List of messages', 'script', NULL),
(6359, 2194, 'pjField', 1, 'title', 'List of messages', 'script', NULL),
(6360, 2195, 'pjField', 1, 'title', '+ Create message', 'script', NULL),
(6361, 2196, 'pjField', 1, 'title', 'Send test message', 'script', NULL),
(6362, 2197, 'pjField', 1, 'title', 'Make a message copy', 'script', NULL),
(6363, 2198, 'pjField', 1, 'title', 'Are you sure that you want to make a copy of the message?', 'script', NULL),
(6364, 2199, 'pjField', 1, 'title', 'Mail queue', 'script', NULL),
(6365, 2200, 'pjField', 1, 'title', 'Send a message', 'script', NULL),
(6366, 2201, 'pjField', 1, 'title', 'Send an email message to one or multiple subscribers\' lists. Once you select a message you can click on the two icons either to edit or preview the message. Then you need to select the list(s) you want to send message to. A new line with total subscribers for the selected list(s) will show up so you know how many subscribers will receive the message.<br /><br />  With the \"Schedule\" option you can set the message to be sent right after you click the Send button or select a date/time when the message should be sent.<br /><br />  With the \"Send in batches\" option you can split the subscribers in portions and send the message to each portion in equal intervals. This is useful if you have to send many emails but your server limits the number of outgoing messages.', 'script', NULL),
(6367, 2202, 'pjField', 1, 'title', 'Total subscribers', 'script', NULL),
(6372, 2256, 'pjField', 1, 'title', 'Message sent', 'script', NULL),
(6373, 2257, 'pjField', 1, 'title', 'The message has been sent to subscribers of the selected list(s).', 'script', NULL),
(6374, 2258, 'pjField', 1, 'title', 'Message saved', 'script', NULL),
(6375, 2259, 'pjField', 1, 'title', 'The message has been saved to the queue and waited for sending to subscribers.', 'script', NULL),
(6376, 2260, 'pjField', 1, 'title', 'Message updated', 'script', NULL),
(6377, 2261, 'pjField', 1, 'title', 'All changes made to the message have been saved.', 'script', NULL),
(6378, 2262, 'pjField', 1, 'title', 'Message added', 'script', NULL),
(6379, 2263, 'pjField', 1, 'title', 'A new message has been added to the list.', 'script', NULL),
(6380, 2264, 'pjField', 1, 'title', 'Message failed to add', 'script', NULL),
(6381, 2265, 'pjField', 1, 'title', 'Message could not be saved. Please, try again.', 'script', NULL),
(6382, 2266, 'pjField', 1, 'title', 'Message not found', 'script', NULL),
(6383, 2267, 'pjField', 1, 'title', 'Message you are looking for is missing.', 'script', NULL),
(6397, 2268, 'pjField', 1, 'title', 'All changes made to the sponsor have been saved.', 'script', NULL),
(6398, 2269, 'pjField', 1, 'title', 'New sponsor has been added.', 'script', NULL),
(6399, 2270, 'pjField', 1, 'title', 'New sponsor could not be added successfully.', 'script', NULL),
(6400, 2271, 'pjField', 1, 'title', 'New sponsor could not be added because image size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(6401, 2272, 'pjField', 1, 'title', 'The sponsor could not be updated because image size too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(6402, 2273, 'pjField', 1, 'title', 'No such sponsor.', 'script', NULL),
(6403, 2274, 'pjField', 1, 'title', 'Sponsor has been added. Image file is too big and was not uploaded.', 'script', NULL),
(6404, 2275, 'pjField', 1, 'title', 'Sponsor has been added. Image file is too big and was not uploaded.', 'script', NULL),
(6405, 2276, 'pjField', 1, 'title', 'Directory app/web/upload/sponsor_images has no permissions to upload seat maps. Please set permissions to 777.', 'script', NULL),
(6406, 2277, 'pjField', 1, 'title', 'The Sponsor image could not be uploaded because it is not image file. Please upload another image.', 'script', NULL),
(6407, 2278, 'pjField', 1, 'title', 'All changes made to the showtimes have been saved.', 'script', NULL),
(6417, 2279, 'pjField', 1, 'title', 'Sponsors', 'script', NULL),
(6428, 2280, 'pjField', 1, 'title', 'Enter Sponsor link,tittle and image', 'script', NULL),
(6429, 2281, 'pjField', 1, 'title', 'Add Sponsor Image', 'script', NULL),
(6430, 2282, 'pjField', 1, 'title', 'Edit Sponsor Image', 'script', NULL),
(6431, 2283, 'pjField', 1, 'title', 'Edit Sponsor link,tittle and image', 'script', NULL),
(6432, 2284, 'pjField', 1, 'title', 'Sponsor Link', 'script', NULL),
(6433, 2285, 'pjField', 1, 'title', 'List of images', 'script', NULL),
(6434, 2286, 'pjField', 1, 'title', 'List of Sponsors', 'script', NULL),
(6439, 2287, 'pjField', 1, 'title', 'Year', 'script', NULL),
(6440, 1, 'pjSponsor', 1, 'title', 'Rotana', 'data', NULL),
(6441, 2, 'pjSponsor', 1, 'title', 'Egyptair', 'data', NULL),
(6448, 3, 'pjSponsor', 1, 'title', 'Six Stars Events', 'data', NULL),
(6449, 4, 'pjSponsor', 1, 'title', 'Multi Plus Travels', 'data', NULL),
(6454, 2302, 'pjField', 1, 'title', 'Subscriber imported', 'script', NULL),
(6455, 2303, 'pjField', 1, 'title', 'Subscriber list has been imported successfully.', 'script', NULL),
(6456, 2304, 'pjField', 1, 'title', 'Subscriber imported', 'script', NULL),
(6457, 2305, 'pjField', 1, 'title', 'Subscriber list has been imported, but there are some duplicated emails.', 'script', NULL),
(6458, 2306, 'pjField', 1, 'title', 'Subscribers updated', 'script', NULL),
(6459, 2307, 'pjField', 1, 'title', 'Subscribers in CSV file have been updated.', 'script', NULL),
(6460, 2308, 'pjField', 1, 'title', 'File type error', 'script', NULL),
(6461, 2309, 'pjField', 1, 'title', 'Only csv files are allowed.', 'script', NULL),
(6462, 2310, 'pjField', 1, 'title', 'CSV file missing', 'script', NULL),
(6463, 2311, 'pjField', 1, 'title', 'Importing subscribers could not be process because of missing of CSV file.', 'script', NULL),
(6464, 2312, 'pjField', 1, 'title', 'Subscribers updated', 'script', NULL),
(6465, 2313, 'pjField', 1, 'title', 'Subscribers pasted from Excel have been updated.', 'script', NULL),
(6466, 2314, 'pjField', 1, 'title', 'Subscribers data invalid', 'script', NULL),
(6467, 2315, 'pjField', 1, 'title', 'Importing cannot be processed because of invalid data. ', 'script', NULL),
(6470, 2316, 'pjField', 1, 'title', 'E-Mail queue', 'script', NULL),
(6471, 2317, 'pjField', 1, 'title', 'Below you can send a list with all messages that have been sent or waiting to be sent. You can delete any of the messages from the queue.', 'script', NULL),
(6472, 2318, 'pjField', 1, 'title', 'In progress', 'script', NULL),
(6473, 2319, 'pjField', 1, 'title', 'Completed', 'script', NULL),
(6474, 2320, 'pjField', 1, 'title', 'In progress', 'script', NULL),
(6475, 2321, 'pjField', 1, 'title', 'Completed', 'script', NULL),
(6476, 2322, 'pjField', 1, 'title', 'Message ID', 'script', NULL),
(6477, 2323, 'pjField', 1, 'title', 'Date sent', 'script', NULL),
(6478, 2324, 'pjField', 1, 'title', 'Preview', 'script', NULL),
(6490, 2337, 'pjField', 1, 'title', 'You can see below the list of customers. If you want to add new Customer, click on the button \"+ Add Customer\".', 'script', NULL),
(6491, 2338, 'pjField', 1, 'title', 'Customers', 'script', NULL),
(6492, 2339, 'pjField', 1, 'title', 'Fill in the form below and \"save\" to add a new customer.', 'script', NULL),
(6493, 2340, 'pjField', 1, 'title', 'Add Customer', 'script', NULL),
(6494, 2341, 'pjField', 1, 'title', 'You can make any changes on the form below and click \"Save\" button to update the user information.', 'script', NULL),
(6495, 2342, 'pjField', 1, 'title', 'Update Customer', 'script', NULL),
(6498, 2343, 'pjField', 1, 'title', 'Add Customer', 'script', NULL),
(6502, 2344, 'pjField', 1, 'title', 'Customers', 'script', NULL),
(6509, 2345, 'pjField', 1, 'title', 'All the changes made to this customer have been saved.', 'script', NULL),
(6510, 2346, 'pjField', 1, 'title', 'All the changes made to this customer have been saved.', 'script', NULL),
(6511, 2347, 'pjField', 1, 'title', 'We are sorry, but the customer has not been added.', 'script', NULL),
(6512, 2348, 'pjField', 1, 'title', 'Customer your looking for is missing.', 'script', NULL),
(6513, 2358, 'pjField', 1, 'title', 'List of Artists', 'script', NULL),
(6514, 2359, 'pjField', 1, 'title', NULL, 'script', NULL),
(6515, 2360, 'pjField', 1, 'title', 'All changes made to the artist have been saved.', 'script', NULL),
(6516, 2361, 'pjField', 1, 'title', 'New artist has been added.', 'script', NULL),
(6517, 2362, 'pjField', 1, 'title', 'New artist could not be added successfully.', 'script', NULL),
(6518, 2363, 'pjField', 1, 'title', 'New artist could not be added because image size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(6519, 2364, 'pjField', 1, 'title', 'New artist could not be added because image size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(6520, 2365, 'pjField', 1, 'title', 'No such artist.', 'script', NULL),
(6521, 2366, 'pjField', 1, 'title', 'Artist has been added. Image file is too big and was not uploaded.', 'script', NULL),
(6522, 2367, 'pjField', 1, 'title', 'Artist has been added. Image file is too big and was not uploaded.', 'script', NULL),
(6523, 2368, 'pjField', 1, 'title', 'Directory app/web/upload/artist_images has no permissions to upload seat maps. Please set permissions to 777.', 'script', NULL),
(6524, 2369, 'pjField', 1, 'title', 'The artist image could not be uploaded because it is not image file. Please upload another image.', 'script', NULL),
(6525, 2370, 'pjField', 1, 'title', 'All changes made to the showtimes have been saved.', 'script', NULL),
(6534, 2351, 'pjField', 1, 'title', 'Artist List', 'script', NULL),
(6535, 2352, 'pjField', 1, 'title', 'Enter Artist tittle and image and description', 'script', NULL),
(6536, 2353, 'pjField', 1, 'title', 'Add Artist Image', 'script', NULL),
(6537, 2354, 'pjField', 1, 'title', 'Edit Artist Image', 'script', NULL),
(6538, 2355, 'pjField', 1, 'title', 'Edit Artist tittle and image and description', 'script', NULL),
(6539, 2356, 'pjField', 1, 'title', NULL, 'script', NULL),
(6540, 2357, 'pjField', 1, 'title', 'List of images', 'script', NULL),
(6569, 10, 'pjPrice', 1, 'price_name', 'Green', 'data', NULL),
(6573, 11, 'pjPrice', 1, 'price_name', 'child', 'data', NULL),
(6585, 2371, 'pjField', 1, 'title', 'All changes made to the showtimes have been saved.', 'script', NULL),
(6586, 2372, 'pjField', 1, 'title', 'The advertisement image could not be uploaded because it is not image file. Please upload another image.', 'script', NULL),
(6587, 2373, 'pjField', 1, 'title', 'advertisement_images', 'script', NULL),
(6588, 2374, 'pjField', 1, 'title', 'Advertisement has been added. Image file is too big and was not uploaded.', 'script', NULL),
(6589, 2375, 'pjField', 1, 'title', 'Advertisement has been added. Image file is too big and was not uploaded.', 'script', NULL),
(6590, 2376, 'pjField', 1, 'title', 'Advertisement has been added. Image file is too big and was not uploaded.', 'script', NULL),
(6591, 2377, 'pjField', 1, 'title', 'New Advertisement could not be added because image size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(6592, 2378, 'pjField', 1, 'title', 'New advertisement could not be added because image size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller image.', 'script', NULL),
(6593, 2379, 'pjField', 1, 'title', 'New advertisement could not be added successfully.', 'script', NULL),
(6594, 2380, 'pjField', 1, 'title', 'New advertisement has been added.', 'script', NULL),
(6595, 2381, 'pjField', 1, 'title', 'All changes made to the advertisement have been saved.', 'script', NULL),
(6596, 2382, 'pjField', 1, 'title', 'List of Advertisements', 'script', NULL),
(6597, 2383, 'pjField', 1, 'title', 'List of images', 'script', NULL),
(6598, 2384, 'pjField', 1, 'title', 'Edit Advertisement tittle and image and description', 'script', NULL),
(6599, 2385, 'pjField', 1, 'title', 'Edit Advertisement Image', 'script', NULL),
(6600, 2386, 'pjField', 1, 'title', 'Add Advertisement Image', 'script', NULL),
(6601, 2387, 'pjField', 1, 'title', 'Enter Advertisement link,tittle and image ', 'script', NULL),
(6602, 2388, 'pjField', 1, 'title', 'Advertisement', 'script', NULL),
(6617, 1, 'pjAdvertisement', 1, 'title', 'Mohamed Abdo Concert 2019', 'data', NULL),
(6618, 1, 'pjAdvertisement', 1, 'description', '<p>Mohamed Abdo Concert 2019</p>', 'data', NULL),
(6633, 2407, 'pjField', 1, 'title', 'All changes made to the showtimes have been saved.', 'script', NULL),
(6634, 2408, 'pjField', 1, 'title', 'The Video could not be uploaded because it is not exact file type. Please upload another Video.', 'script', NULL),
(6635, 2409, 'pjField', 1, 'title', 'Directory app/web/upload/home_video has no permissions to upload seat maps. Please set permissions to 777.', 'script', NULL),
(6636, 2410, 'pjField', 1, 'title', 'Video has been added. File is too big and was not uploaded.', 'script', NULL),
(6637, 2411, 'pjField', 1, 'title', 'Video has been added. File is too big and was not uploaded.', 'script', NULL),
(6638, 2412, 'pjField', 1, 'title', 'No such video.', 'script', NULL),
(6639, 2413, 'pjField', 1, 'title', 'New Video could not be added because file size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller file.', 'script', NULL),
(6640, 2414, 'pjField', 1, 'title', 'New Video could not be added because file size is too large and your server cannot upload it. Maximum allowed size is {SIZE}. Please, upload smaller file.', 'script', NULL),
(6641, 2415, 'pjField', 1, 'title', 'New video could not be added successfully.', 'script', NULL),
(6642, 2416, 'pjField', 1, 'title', 'New video has been added.', 'script', NULL),
(6643, 2417, 'pjField', 1, 'title', 'All changes made to the video have been saved.', 'script', NULL),
(6644, 2418, 'pjField', 1, 'title', ' ', 'script', NULL),
(6645, 2419, 'pjField', 1, 'title', 'List of Video', 'script', NULL),
(6646, 2420, 'pjField', 1, 'title', 'Edit Video', 'script', NULL),
(6647, 2421, 'pjField', 1, 'title', 'Edit Video', 'script', NULL);
INSERT INTO `tk_cbs_multi_lang` (`id`, `foreign_id`, `model`, `locale`, `field`, `content`, `source`, `deleted_at`) VALUES
(6648, 2422, 'pjField', 1, 'title', 'Add Video', 'script', NULL),
(6649, 2423, 'pjField', 1, 'title', 'Upload Video', 'script', NULL),
(6650, 2424, 'pjField', 1, 'title', 'Home Video', 'script', NULL),
(6683, 1, 'pjVideo', 1, 'title', 'Mohamed Abdo', 'data', NULL),
(6693, 2425, 'pjField', 1, 'title', 'Video', 'script', NULL),
(8793, 2426, 'pjField', 1, 'title', '+ Add Role', 'script', NULL),
(8798, 2427, 'pjField', 1, 'title', 'Privilege', 'script', NULL),
(8799, 2428, 'pjField', 1, 'title', 'Role added!', 'script', NULL),
(8800, 2429, 'pjField', 1, 'title', 'Role updated!', 'script', NULL),
(8801, 2430, 'pjField', 1, 'title', 'Role failed to add.', 'script', NULL),
(8802, 2431, 'pjField', 1, 'title', 'Role failed to update.', 'script', NULL),
(8812, 2432, 'pjField', 1, 'title', 'You can see below the list of user role. If you want to add new role, click on the button \"+ Add role\".', 'script', NULL),
(8823, 2433, 'pjField', 1, 'title', 'User Roles', 'script', NULL),
(8835, 2434, 'pjField', 1, 'title', 'All the changes made to this user role have been saved.', 'script', NULL),
(8836, 2435, 'pjField', 1, 'title', 'All the changes made to this user role have been saved.', 'script', NULL),
(8837, 2436, 'pjField', 1, 'title', 'We are sorry, but the user role has not been added.', 'script', NULL),
(8838, 2437, 'pjField', 1, 'title', 'User role failed to update.', 'script', NULL),
(8841, 2438, 'pjField', 1, 'title', 'Add user role', 'script', NULL),
(8842, 2439, 'pjField', 1, 'title', 'Fill in the form below and \"save\" to add a new user role.', 'script', NULL),
(8845, 2440, 'pjField', 1, 'title', 'Update user role', 'script', NULL),
(8846, 2441, 'pjField', 1, 'title', 'You can make any changes on the form below and click \"Save\" button to update the user role information.', 'script', NULL),
(8851, 4, 'pjCms', 1, 'cms_title', 'About ticket at guru', 'data', NULL),
(8852, 4, 'pjCms', 1, 'cms_description', '<p>Ticket at guru is a festival of concerts by Six Stars Events. Ticket at guru is an established name in the music industry with over 15 years of experience in delivering concerts and high-end gala functions. We have traditionally hosted all our world-class galas at the Grosvenor House 5-star hotel at Park Lane in Central London.</p>\r\n<p>Our galas always attract the cr&egrave;me de la cr&egrave;me of the Arabian music fraternity who are always more than happy to perform and join our prestigious hall of fame. In addition, celebrities and assorted dignitaries are invariably in attendance at our events. The musicians continually perform live music on stage with their full bands and this gives our guests that authentic experience that we have become synonymous with. On top of great music, we also offer a tantalizing dining experiences that will leave all your gastronomical senses completely satisfied.</p>\r\n<p>Since we have been organizing events for two almost two decades, we wanted to begin something special this year, we are taking Six Stars Events a notch higher.</p>', 'data', NULL),
(8853, 4, 'pjCms', 1, 'cms_meta_key', 'About ticket at guru', 'data', NULL),
(8854, 4, 'pjCms', 1, 'cms_meta_title', 'About ticket at guru', 'data', NULL),
(8855, 4, 'pjCms', 1, 'cms_meta_desc', 'About ticket at guru', 'data', NULL),
(8865, 4, 'pjImageGallery', 1, 'title', 'Lorem ipsum dolor sit amet', 'data', NULL),
(8866, 4, 'pjImageGallery', 1, 'description', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', 'data', NULL),
(8867, 5, 'pjImageGallery', 1, 'title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit', 'data', NULL),
(8868, 5, 'pjImageGallery', 1, 'description', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>', 'data', NULL),
(8869, 6, 'pjImageGallery', 1, 'title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit', 'data', NULL),
(8870, 6, 'pjImageGallery', 1, 'description', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</p>', 'data', NULL),
(8871, 7, 'pjImageGallery', 1, 'title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit', 'data', NULL),
(8872, 7, 'pjImageGallery', 1, 'description', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</p>', 'data', NULL),
(8873, 8, 'pjImageGallery', 1, 'title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit', 'data', NULL),
(8874, 8, 'pjImageGallery', 1, 'description', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</p>', 'data', NULL),
(8875, 9, 'pjImageGallery', 1, 'title', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit', 'data', NULL),
(8876, 9, 'pjImageGallery', 1, 'description', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</p>', 'data', NULL),
(8894, 5, 'pjCms', 1, 'cms_title', 'Privacy Policy', 'data', NULL),
(8895, 5, 'pjCms', 1, 'cms_description', '<h1>Privacy Policy</h1>\r\n<hr />\r\n<p>We\'ll send your ticket confirmation immediately after you have ordered, or when we receive the website notification. Your tickets will be available to pick up at the box office once you received an order confirmation from our website. If your ticket is not ready once you arrive with proof of purchase we will print the ticket as you wait.</p>\r\n<p>We\'ll keep our website homepage updated for all the big events happening across the UK over the next few months, so be sure to check back there for general information. If you were unable to confirm a ticket don\'t worry, you can always visit the box office directly in case seating becomes available.</p>\r\n<p>To check if your order\'s on its way out yet, just log into the Global Gala or Six Stars website and go to your order history &ndash; the Order Status in your account will state to show the information about your ticket, and the latest you should receive them is around 24 before the event.</p>', 'data', NULL),
(8896, 5, 'pjCms', 1, 'cms_meta_key', 'Privacy Policy', 'data', NULL),
(8897, 5, 'pjCms', 1, 'cms_meta_title', 'Privacy Policy', 'data', NULL),
(8898, 5, 'pjCms', 1, 'cms_meta_desc', 'Privacy Policy', 'data', NULL),
(8909, 6, 'pjCms', 1, 'cms_title', 'Contact Us', 'data', NULL),
(8910, 6, 'pjCms', 1, 'cms_description', '<div class=\"col-md-6\">\r\n<div class=\"address\">\r\n<h3>Find Us</h3>\r\n<ul class=\"nav nav-tabs\">\r\n<li class=\"active\"><a href=\"#london\" data-toggle=\"tab\"> <span class=\"heading\">our london office</span></a>\r\n<ul class=\"uk\">\r\n<li>3 Park Road, Crouch End London N8 8TE</li>\r\n<li>+44 771 828 666</li>\r\n<li>info@ticketatguru.com</li>\r\n</ul>\r\n</li>\r\n<li><a href=\"#egypt\" data-toggle=\"tab\"> <span class=\"heading\">our egypt office</span></a>\r\n<ul class=\"egypt\">\r\n<li>34 El-Hassan Street, Ad Doqi Giza Governorate</li>\r\n<li>+201022221915</li>\r\n<li>info@ticketatguru.co.uk</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"col-md-6\">\r\n<div class=\"tab-content\">\r\n<div id=\"london\" class=\"tab-pane fade in active map\"><iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1726.8977684863996!2d31.194714605814376!3d30.042723185816367!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x145846cac104cfe3%3A0x81d471bd744436e4!2s34+El-Hassan%2C+Ad+Doqi%2C+Dokki%2C+Giza+Governorate%2C+Egypt!5e0!3m2!1sen!2sin!4v1565170397901!5m2!1sen!2sin\" width=\"100%\" height=\"445\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></div>\r\n<div id=\"egypt\" class=\"tab-pane fade in map\"><iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2479.334824446668!2d-0.12648078468863364!3d51.580426613182865!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48761bc728bdaec5%3A0x210b7d3db454205!2s3+Park+Mews%2C+Park+Rd%2C+Crouch+End%2C+London+N8+8GB%2C+UK!5e0!3m2!1sen!2sin!4v1565170471679!5m2!1sen!2sin\" width=\"100%\" height=\"445\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></div>\r\n</div>\r\n</div>', 'data', NULL),
(8911, 6, 'pjCms', 1, 'cms_meta_key', 'Contact Us', 'data', NULL),
(8912, 6, 'pjCms', 1, 'cms_meta_title', 'Contact Us', 'data', NULL),
(8913, 6, 'pjCms', 1, 'cms_meta_desc', 'Contact Us', 'data', NULL),
(8955, 12, 'pjPrice', 1, 'price_name', 'Children', 'data', NULL),
(8966, 10, 'pjImageGallery', 1, 'title', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'data', NULL),
(8967, 10, 'pjImageGallery', 1, 'description', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'data', NULL),
(8970, 3, 'pjSlider', 1, 'title', 'Slider 3', 'data', NULL),
(8972, 5, 'pjSponsor', 1, 'title', 'sponsers 5', 'data', NULL),
(9013, 2449, 'pjField', 1, 'title', 'Request Songs', 'script', NULL),
(9018, 2442, 'pjField', 1, 'title', 'Customer Name', 'script', NULL),
(9019, 2443, 'pjField', 1, 'title', 'Artist Name', 'script', NULL),
(9020, 2444, 'pjField', 1, 'title', 'Customer Requested Song', 'script', NULL),
(9021, 2445, 'pjField', 1, 'title', 'Created At', 'script', NULL),
(9022, 2446, 'pjField', 1, 'title', 'Updated At', 'script', NULL),
(9023, 2447, 'pjField', 1, 'title', 'Customer Requested Songs', 'script', NULL),
(9024, 2448, 'pjField', 1, 'title', 'Here you can see the customer request songs.', 'script', NULL),
(9106, 13, 'pjPrice', 1, 'price_name', 'Yellow', 'data', NULL),
(9107, 14, 'pjPrice', 1, 'price_name', 'Green', 'data', NULL),
(9108, 15, 'pjPrice', 1, 'price_name', 'Blue', 'data', NULL),
(9114, 16, 'pjPrice', 1, 'price_name', 'Blue', 'data', NULL),
(9115, 17, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(9129, 18, 'pjPrice', 1, 'price_name', 'Blue', 'data', NULL),
(9137, 19, 'pjPrice', 1, 'price_name', 'Blue', 'data', NULL),
(9138, 20, 'pjPrice', 1, 'price_name', 'Green', 'data', NULL),
(9139, 21, 'pjPrice', 1, 'price_name', 'Yellow', 'data', NULL),
(9150, 22, 'pjPrice', 1, 'price_name', 'Yellow', 'data', NULL),
(9151, 23, 'pjPrice', 1, 'price_name', 'Green', 'data', NULL),
(9157, 24, 'pjPrice', 1, 'price_name', 'Green', 'data', NULL),
(9202, 2450, 'pjField', 1, 'title', 'Booking Invoices', 'script', NULL),
(9204, 39, 'pjVenue', 1, 'name', 'Global Gala', 'data', NULL),
(9206, 14, 'pjEvent', 1, 'title', 'Arijit Singh Live Concert 2019', 'data', NULL),
(9207, 14, 'pjEvent', 1, 'description', '<div>\r\n<p>Live Nation and BookMyShow are excited to announce that U2 will bring their acclaimed U2: The Joshua Tree Tour - the record-breaking smash hit tour celebrating the band&rsquo;s seminal 1987 album &lsquo;The Joshua Tree&rsquo; - to India for the very first time ever. The Mumbai date also marks the final stop as part of the iconic era of performing this album globally.</p>\r\n<p>&nbsp;</p>\r\n<p>The Joshua Tree Tour is a celebration of the original album and tour of the same name undertaken by U2 in 1987 and features the complete album played in sequence along with a selection of highlights from U2&rsquo;s extensive catalogue of songs. The innovative staging includes a specially commissioned series of haunting and evocative films from Dutch photographer, film-maker and longtime collaborator Anton Corbijn &ndash; whose iconic photography accompanied the original recording- in brilliant 8k resolution on a 200 x 45 foot cinematic screen, the largest high-res LED screen ever used in a touring show.</p>\r\n<p>&nbsp;</p>\r\n<p>The Joshua Tree album Released to universal acclaim on 9 th March 1987 and featuring hit singles &ldquo;With Or Without You&rdquo;,&ldquo;I Still Haven&rsquo;t Found What I&rsquo;m Looking For&rdquo; and &ldquo;Where The Streets Have No Name&rdquo;, The Joshua Tree went to #1 in the U.K, Ireland and around the world, selling in excess of 25 million albums, and catapulting Bono, The Edge, Adam Clayton and Larry Mullen Jr &ldquo;&hellip; from heroes to superstars&rdquo; (Rolling Stone).</p>\r\n<p>&nbsp;</p>\r\n<p>Time Magazine put U2 on its cover in April 1987, proclaiming them &ldquo;Rock&rsquo;s Hottest Ticket&rdquo; in a defining year for the band that saw their arena dates roll into stadium shows to accommodate escalating demand - setting them on course to become one of the greatest live acts in the world today. The 12 months that followed saw the band create now-iconic moments: the traffic-stopping Grammy Award-winning music video on the roof of a Los Angeles liquor store, winning a BRIT Award and two Grammys - including Album of the Year - their first of 22 received to date, distinguishing U2 as the most awarded rock band in Grammy history; as well as a triumphant return home for four unforgettable shows in Belfast, Dublin and Cork in the summer of 1987.</p>\r\n</div>', 'data', NULL),
(9208, 14, 'pjEvent', 1, 'price_name', NULL, 'data', NULL),
(9209, 25, 'pjPrice', 1, 'price_name', 'Blue', 'data', NULL),
(9210, 26, 'pjPrice', 1, 'price_name', 'Yellow', 'data', NULL),
(9215, 27, 'pjPrice', 1, 'price_name', 'Green', 'data', NULL),
(9229, 2451, 'pjField', 1, 'title', 'Reports', 'script', NULL),
(9244, 2452, 'pjField', 1, 'title', 'Document Upload', 'script', NULL),
(9247, 3, 'pjArtist', 1, 'title', 'Abc', 'data', NULL),
(9248, 3, 'pjArtist', 1, 'description', '<p>asdfsadfgdssdgsdgfsd</p>', 'data', NULL),
(9252, 28, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(9259, 29, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(9263, 30, 'pjPrice', 1, 'price_name', 'Blue', 'data', NULL),
(9264, 24, 'pjEvent', 1, 'title', 'Arijit Singh Midnight Live Concert 2019 ', 'data', NULL),
(9265, 24, 'pjEvent', 1, 'description', '<div>\r\n<p>Live Nation and BookMyShow are excited to announce that U2 will bring their acclaimed U2: The Joshua Tree Tour - the record-breaking smash hit tour celebrating the band&rsquo;s seminal 1987 album &lsquo;The Joshua Tree&rsquo; - to India for the very first time ever. The Mumbai date also marks the final stop as part of the iconic era of performing this album globally.</p>\r\n<p>&nbsp;</p>\r\n<p>The Joshua Tree Tour is a celebration of the original album and tour of the same name undertaken by U2 in 1987 and features the complete album played in sequence along with a selection of highlights from U2&rsquo;s extensive catalogue of songs. The innovative staging includes a specially commissioned series of haunting and evocative films from Dutch photographer, film-maker and longtime collaborator Anton Corbijn &ndash; whose iconic photography accompanied the original recording- in brilliant 8k resolution on a 200 x 45 foot cinematic screen, the largest high-res LED screen ever used in a touring show.</p>\r\n<p>&nbsp;</p>\r\n<p>The Joshua Tree album Released to universal acclaim on 9 th March 1987 and featuring hit singles &ldquo;With Or Without You&rdquo;,&ldquo;I Still Haven&rsquo;t Found What I&rsquo;m Looking For&rdquo; and &ldquo;Where The Streets Have No Name&rdquo;, The Joshua Tree went to #1 in the U.K, Ireland and around the world, selling in excess of 25 million albums, and catapulting Bono, The Edge, Adam Clayton and Larry Mullen Jr &ldquo;&hellip; from heroes to superstars&rdquo; (Rolling Stone).</p>\r\n<p>&nbsp;</p>\r\n<p>Time Magazine put U2 on its cover in April 1987, proclaiming them &ldquo;Rock&rsquo;s Hottest Ticket&rdquo; in a defining year for the band that saw their arena dates roll into stadium shows to accommodate escalating demand - setting them on course to become one of the greatest live acts in the world today. The 12 months that followed saw the band create now-iconic moments: the traffic-stopping Grammy Award-winning music video on the roof of a Los Angeles liquor store, winning a BRIT Award and two Grammys - including Album of the Year - their first of 22 received to date, distinguishing U2 as the most awarded rock band in Grammy history; as well as a triumphant return home for four unforgettable shows in Belfast, Dublin and Cork in the summer of 1987.</p>\r\n</div>', 'data', NULL),
(9266, 24, 'pjEvent', 1, 'price_name', NULL, 'data', NULL),
(9267, 31, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(9268, 2453, 'pjField', 1, 'title', 'Garbage Records', 'script', NULL),
(9281, 2454, 'pjField', 1, 'title', 'Small Description', 'script', NULL),
(9283, 14, 'pjEvent', 1, 'small_description', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s</p>', 'data', NULL),
(9289, 24, 'pjEvent', 1, 'small_description', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</p>', 'data', NULL),
(9361, 25, 'pjEvent', 1, 'title', 'Shreya Ghoshal Live With Symphony - US Canada Tour', 'data', NULL),
(9362, 25, 'pjEvent', 1, 'small_description', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s</p>', 'data', NULL),
(9363, 25, 'pjEvent', 1, 'description', '<div>\r\n<p>Live Nation and BookMyShow are excited to announce that U2 will bring their acclaimed U2: The Joshua Tree Tour - the record-breaking smash hit tour celebrating the band&rsquo;s seminal 1987 album &lsquo;The Joshua Tree&rsquo; - to India for the very first time ever. The Mumbai date also marks the final stop as part of the iconic era of performing this album globally.</p>\r\n<p>&nbsp;</p>\r\n<p>The Joshua Tree Tour is a celebration of the original album and tour of the same name undertaken by U2 in 1987 and features the complete album played in sequence along with a selection of highlights from U2&rsquo;s extensive catalogue of songs. The innovative staging includes a specially commissioned series of haunting and evocative films from Dutch photographer, film-maker and longtime collaborator Anton Corbijn &ndash; whose iconic photography accompanied the original recording- in brilliant 8k resolution on a 200 x 45 foot cinematic screen, the largest high-res LED screen ever used in a touring show.</p>\r\n<p>&nbsp;</p>\r\n<p>The Joshua Tree album Released to universal acclaim on 9 th March 1987 and featuring hit singles &ldquo;With Or Without You&rdquo;,&ldquo;I Still Haven&rsquo;t Found What I&rsquo;m Looking For&rdquo; and &ldquo;Where The Streets Have No Name&rdquo;, The Joshua Tree went to #1 in the U.K, Ireland and around the world, selling in excess of 25 million albums, and catapulting Bono, The Edge, Adam Clayton and Larry Mullen Jr &ldquo;&hellip; from heroes to superstars&rdquo; (Rolling Stone).</p>\r\n<p>&nbsp;</p>\r\n<p>Time Magazine put U2 on its cover in April 1987, proclaiming them &ldquo;Rock&rsquo;s Hottest Ticket&rdquo; in a defining year for the band that saw their arena dates roll into stadium shows to accommodate escalating demand - setting them on course to become one of the greatest live acts in the world today. The 12 months that followed saw the band create now-iconic moments: the traffic-stopping Grammy Award-winning music video on the roof of a Los Angeles liquor store, winning a BRIT Award and two Grammys - including Album of the Year - their first of 22 received to date, distinguishing U2 as the most awarded rock band in Grammy history; as well as a triumphant return home for four unforgettable shows in Belfast, Dublin and Cork in the summer of 1987.</p>\r\n</div>', 'data', NULL),
(9364, 25, 'pjEvent', 1, 'price_name', NULL, 'data', NULL),
(9365, 32, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(9370, 26, 'pjEvent', 1, 'title', 'A R Rahman LIVE in concert Sydney', 'data', NULL),
(9371, 26, 'pjEvent', 1, 'small_description', '<p>Create a jQuery object using a&nbsp;<strong>unique input</strong>&nbsp;selector. Then chain the</p>', 'data', NULL),
(9372, 26, 'pjEvent', 1, 'description', '<p>Create a jQuery object using a&nbsp;<strong>unique input</strong>&nbsp;selector. Then chain the</p>', 'data', NULL),
(9373, 26, 'pjEvent', 1, 'price_name', NULL, 'data', NULL),
(9374, 33, 'pjPrice', 1, 'price_name', 'Blue', 'data', NULL),
(9389, 34, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(11477, 35, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(11495, 36, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(11545, 37, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(11631, 31, 'pjEvent', 1, 'title', 'Arijit Singh Live MTV India Tour ', 'data', NULL),
(11632, 31, 'pjEvent', 1, 'small_description', '<div>\r\n<p>Live Nation and BookMyShow are excited to announce that U2 will bring their acclaimed U2: The Joshua Tree Tour - the record-breaking smash hit tour celebrating the band&rsquo;s seminal 1987 album &lsquo;The Joshua Tree&rsquo; - to India for the very first time ever. The Mumbai date also marks the final stop as part of the iconic era of performing this album globally.</p>\r\n</div>', 'data', NULL),
(11633, 31, 'pjEvent', 1, 'description', '<div>\r\n<p>Live Nation and BookMyShow are excited to announce that U2 will bring their acclaimed U2: The Joshua Tree Tour - the record-breaking smash hit tour celebrating the band&rsquo;s seminal 1987 album &lsquo;The Joshua Tree&rsquo; - to India for the very first time ever. The Mumbai date also marks the final stop as part of the iconic era of performing this album globally.</p>\r\n<p>&nbsp;</p>\r\n<p>The Joshua Tree Tour is a celebration of the original album and tour of the same name undertaken by U2 in 1987 and features the complete album played in sequence along with a selection of highlights from U2&rsquo;s extensive catalogue of songs. The innovative staging includes a specially commissioned series of haunting and evocative films from Dutch photographer, film-maker and longtime collaborator Anton Corbijn &ndash; whose iconic photography accompanied the original recording- in brilliant 8k resolution on a 200 x 45 foot cinematic screen, the largest high-res LED screen ever used in a touring show.</p>\r\n<p>&nbsp;</p>\r\n<p>The Joshua Tree album Released to universal acclaim on 9 th March 1987 and featuring hit singles &ldquo;With Or Without You&rdquo;,&ldquo;I Still Haven&rsquo;t Found What I&rsquo;m Looking For&rdquo; and &ldquo;Where The Streets Have No Name&rdquo;, The Joshua Tree went to #1 in the U.K, Ireland and around the world, selling in excess of 25 million albums, and catapulting Bono, The Edge, Adam Clayton and Larry Mullen Jr &ldquo;&hellip; from heroes to superstars&rdquo; (Rolling Stone).</p>\r\n<p>&nbsp;</p>\r\n<p>Time Magazine put U2 on its cover in April 1987, proclaiming them &ldquo;Rock&rsquo;s Hottest Ticket&rdquo; in a defining year for the band that saw their arena dates roll into stadium shows to accommodate escalating demand - setting them on course to become one of the greatest live acts in the world today. The 12 months that followed saw the band create now-iconic moments: the traffic-stopping Grammy Award-winning music video on the roof of a Los Angeles liquor store, winning a BRIT Award and two Grammys - including Album of the Year - their first of 22 received to date, distinguishing U2 as the most awarded rock band in Grammy history; as well as a triumphant return home for four unforgettable shows in Belfast, Dublin and Cork in the summer of 1987.</p>\r\n</div>', 'data', NULL),
(11634, 31, 'pjEvent', 1, 'price_name', NULL, 'data', NULL),
(11639, 38, 'pjPrice', 1, 'price_name', 'Red', 'data', NULL),
(11641, 34, 'pjEvent', 1, 'title', 'Arijit Singh LIVE at GIMA Awards', 'data', NULL),
(11642, 34, 'pjEvent', 1, 'small_description', '<p>Test Test Test</p>', 'data', NULL),
(11643, 34, 'pjEvent', 1, 'description', '<p>Test Test Test</p>', 'data', NULL),
(11644, 34, 'pjEvent', 1, 'price_name', NULL, 'data', NULL),
(11649, 39, 'pjPrice', 1, 'price_name', 'Green', 'data', NULL),
(13792, 2456, 'pjField', 1, 'title', 'Type of event', 'script', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_options`
--

CREATE TABLE `tk_cbs_options` (
  `foreign_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(255) NOT NULL DEFAULT '',
  `tab_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `value` text DEFAULT NULL,
  `label` text DEFAULT NULL,
  `type` enum('string','text','int','float','enum','bool') NOT NULL DEFAULT 'string',
  `order` int(10) UNSIGNED DEFAULT NULL,
  `is_visible` tinyint(1) UNSIGNED DEFAULT 1,
  `style` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_options`
--

INSERT INTO `tk_cbs_options` (`foreign_id`, `key`, `tab_id`, `value`, `label`, `type`, `order`, `is_visible`, `style`) VALUES
(1, 'o_admin_email_cancel', 3, '0|1::1', 'No|Yes', 'enum', 13, 1, NULL),
(1, 'o_admin_email_cancel_message', 3, '', NULL, 'text', 15, 1, NULL),
(1, 'o_admin_email_cancel_subject', 3, '', NULL, 'string', 14, 1, NULL),
(1, 'o_admin_email_confirmation', 3, '0|1::1', 'No|Yes', 'enum', 7, 1, NULL),
(1, 'o_admin_email_confirmation_message', 3, '', NULL, 'text', 9, 1, NULL),
(1, 'o_admin_email_confirmation_subject', 3, '', NULL, 'string', 8, 1, NULL),
(1, 'o_admin_email_payment', 3, '0|1::1', 'No|Yes', 'enum', 10, 1, NULL),
(1, 'o_admin_email_payment_message', 3, '', NULL, 'text', 12, 1, NULL),
(1, 'o_admin_email_payment_subject', 3, '', NULL, 'string', 11, 1, NULL),
(1, 'o_admin_sms_confirmation_message', 3, '', NULL, 'text', 2, 1, NULL),
(1, 'o_admin_sms_payment_message', 3, '', NULL, 'text', 4, 1, NULL),
(1, 'o_allow_authorize', 2, 'Yes|No::No', 'Yes|No', 'enum', 12, 1, NULL),
(1, 'o_allow_bank', 2, 'Yes|No::No', NULL, 'enum', 19, 1, NULL),
(1, 'o_allow_cash', 2, 'Yes|No::Yes', 'Yes|No', 'enum', 17, 1, NULL),
(1, 'o_allow_creditcard', 2, 'Yes|No::No', 'Yes|No', 'enum', 18, 1, NULL),
(1, 'o_allow_paypal', 2, 'Yes|No::Yes', 'Yes|No', 'enum', 10, 1, NULL),
(1, 'o_authorize_md5_hash', 2, NULL, NULL, 'string', 16, 1, NULL),
(1, 'o_authorize_merchant_id', 2, NULL, NULL, 'string', 14, 1, NULL),
(1, 'o_authorize_timezone', 2, '-43200|-39600|-36000|-32400|-28800|-25200|-21600|-18000|-14400|-10800|-7200|-3600|0|3600|7200|10800|14400|18000|21600|25200|28800|32400|36000|39600|43200|46800::0', 'GMT-12:00|GMT-11:00|GMT-10:00|GMT-09:00|GMT-08:00|GMT-07:00|GMT-06:00|GMT-05:00|GMT-04:00|GMT-03:00|GMT-02:00|GMT-01:00|GMT|GMT+01:00|GMT+02:00|GMT+03:00|GMT+04:00|GMT+05:00|GMT+06:00|GMT+07:00|GMT+08:00|GMT+09:00|GMT+10:00|GMT+11:00|GMT+12:00|GMT+13:00', 'enum', 15, 1, NULL),
(1, 'o_authorize_transkey', 2, NULL, NULL, 'string', 13, 1, NULL),
(1, 'o_bank_account', 2, NULL, NULL, 'text', 20, 1, NULL),
(1, 'o_bf_include_address', 5, '1|2|3::2', 'No|Yes|Yes (required)', 'enum', 6, 1, NULL),
(1, 'o_bf_include_captcha', 5, '1|2|3::3', 'No|Yes|Yes (required)', 'enum', 12, 1, NULL),
(1, 'o_bf_include_city', 5, '1|2|3::2', 'No|Yes|Yes (required)', 'enum', 9, 1, NULL),
(1, 'o_bf_include_company', 5, '1|2|3::3', 'No|Yes|Yes (required)', 'enum', 5, 1, NULL),
(1, 'o_bf_include_country', 5, '1|2|3::2', 'No|Yes|Yes (required)', 'enum', 7, 1, NULL),
(1, 'o_bf_include_email', 5, '1|2|3::3', 'No|Yes|Yes (required)', 'enum', 3, 1, NULL),
(1, 'o_bf_include_name', 5, '1|2|3::3', 'No|Yes|Yes (required)', 'enum', 2, 1, NULL),
(1, 'o_bf_include_notes', 5, '1|2|3::1', 'No|Yes|Yes (required)', 'enum', 11, 1, NULL),
(1, 'o_bf_include_phone', 5, '1|2|3::3', 'No|Yes|Yes (required)', 'enum', 4, 1, NULL),
(1, 'o_bf_include_state', 5, '1|2|3::2', 'No|Yes|Yes (required)', 'enum', 8, 1, NULL),
(1, 'o_bf_include_title', 5, '1|2|3::3', 'No|Yes|Yes (required)', 'enum', 1, 1, NULL),
(1, 'o_bf_include_zip', 5, '1|2|3::2', 'No|Yes|Yes (required)', 'enum', 10, 1, NULL),
(1, 'o_booking_earlier', 2, '120', NULL, 'int', 4, 1, NULL),
(1, 'o_booking_status', 2, 'confirmed|pending|cancelled::pending', 'Confirmed|Pending|Cancelled', 'enum', 5, 1, NULL),
(1, 'o_currency', 2, 'AED|AFN|ALL|AMD|ANG|AOA|ARS|AUD|AWG|AZN|BAM|BBD|BDT|BGN|BHD|BIF|BMD|BND|BOB|BOV|BRL|BSD|BTN|BWP|BYR|BZD|CAD|CDF|CHE|CHF|CHW|CLF|CLP|CNY|COP|COU|CRC|CUC|CUP|CVE|CZK|DJF|DKK|DOP|DZD|EEK|EGP|ERN|ETB|EUR|FJD|FKP|GBP|GEL|GHS|GIP|GMD|GNF|GTQ|GYD|HKD|HNL|HRK|HTG|HUF|IDR|ILS|INR|IQD|IRR|ISK|JMD|JOD|JPY|KES|KGS|KHR|KMF|KPW|KRW|KWD|KYD|KZT|LAK|LBP|LKR|LRD|LSL|LTL|LVL|LYD|MAD|MDL|MGA|MKD|MMK|MNT|MOP|MRO|MUR|MVR|MWK|MXN|MXV|MYR|MZN|NAD|NGN|NIO|NOK|NPR|NZD|OMR|PAB|PEN|PGK|PHP|PKR|PLN|PYG|QAR|RON|RSD|RUB|RWF|SAR|SBD|SCR|SDG|SEK|SGD|SHP|SLL|SOS|SRD|STD|SYP|SZL|THB|TJS|TMT|TND|TOP|TRY|TTD|TWD|TZS|UAH|UGX|USD|USN|USS|UYU|UZS|VEF|VND|VUV|WST|XAF|XAG|XAU|XBA|XBB|XBC|XBD|XCD|XDR|XFU|XOF|XPD|XPF|XPT|XTS|XXX|YER|ZAR|ZMK|ZWL::EUR', NULL, 'enum', 1, 1, NULL),
(1, 'o_date_format', 1, 'd.m.Y|m.d.Y|Y.m.d|j.n.Y|n.j.Y|Y.n.j|d/m/Y|m/d/Y|Y/m/d|j/n/Y|n/j/Y|Y/n/j|d-m-Y|m-d-Y|Y-m-d|j-n-Y|n-j-Y|Y-n-j::d-m-Y', 'd.m.Y (25.09.2012)|m.d.Y (09.25.2012)|Y.m.d (2012.09.25)|j.n.Y (25.9.2012)|n.j.Y (9.25.2012)|Y.n.j (2012.9.25)|d/m/Y (25/09/2012)|m/d/Y (09/25/2012)|Y/m/d (2012/09/25)|j/n/Y (25/9/2012)|n/j/Y (9/25/2012)|Y/n/j (2012/9/25)|d-m-Y (25-09-2012)|m-d-Y (09-25-2012)|Y-m-d (2012-09-25)|j-n-Y (25-9-2012)|n-j-Y (9-25-2012)|Y-n-j (2012-9-25)', 'enum', 1, 1, NULL),
(1, 'o_deposit_payment', 2, '10', NULL, 'int', 2, 1, NULL),
(1, 'o_email_address', 1, 'info@ticketatguru.com', NULL, 'string', 7, 1, NULL),
(1, 'o_email_cancel', 3, '0|1::1', 'No|Yes', 'enum', 7, 1, NULL),
(1, 'o_email_cancel_message', 3, '', NULL, 'text', 9, 1, NULL),
(1, 'o_email_cancel_subject', 3, '', NULL, 'string', 8, 1, NULL),
(1, 'o_email_confirmation', 3, '0|1::1', 'No|Yes', 'enum', 1, 1, NULL),
(1, 'o_email_confirmation_message', 3, '', NULL, 'text', 3, 1, NULL),
(1, 'o_email_confirmation_subject', 3, '', NULL, 'string', 2, 1, NULL),
(1, 'o_email_payment', 3, '0|1::1', 'No|Yes', 'enum', 4, 1, NULL),
(1, 'o_email_payment_message', 3, '', NULL, 'text', 6, 1, NULL),
(1, 'o_email_payment_subject', 3, '', NULL, 'string', 5, 1, NULL),
(1, 'o_fields_index', 99, '5ed557c3caf5c11a1e9c11a10e08d7e4', NULL, 'string', NULL, 0, NULL),
(1, 'o_multi_lang', 99, '1|0::1', NULL, 'enum', NULL, 1, NULL),
(1, 'o_payment_disable', 2, 'Yes|No::No', 'Yes|No', 'enum', 9, 1, NULL),
(1, 'o_payment_status', 2, 'confirmed|pending|cancelled::confirmed', 'Confirmed|Pending|Cancelled', 'enum', 6, 1, NULL),
(1, 'o_paypal_address', 2, 'paypal@domain.com', NULL, 'string', 11, 1, NULL),
(1, 'o_plugin_pjAuthorize', 99, '2019-06-26 14:15:43', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjBackup', 99, '2019-06-26 14:15:39', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjCountry', 99, '2019-06-26 14:15:46', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjInstaller', 99, '2019-06-26 14:15:40', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjInvoice', 99, '2019-06-26 14:16:22', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjLocale', 99, '2019-06-26 14:15:39', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjLog', 99, '2019-06-26 14:15:40', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjOneAdmin', 99, '2019-06-26 14:15:41', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjPaypal', 99, '2019-06-26 14:15:43', NULL, 'string', NULL, 1, NULL),
(1, 'o_plugin_pjSms', 99, '2019-06-26 14:16:23', NULL, 'string', NULL, 1, NULL),
(1, 'o_send_email', 1, 'mail|smtp::smtp', 'PHP mail()|SMTP', 'enum', 7, 1, NULL),
(1, 'o_sms_confirmation_message', 3, '', NULL, 'text', 2, 1, NULL),
(1, 'o_smtp_host', 1, 'smtp.mailtrap.io', '', 'string', 8, 1, NULL),
(1, 'o_smtp_pass', 1, 'f56d0696931ad0', '', 'string', 9, 1, NULL),
(1, 'o_smtp_port', 1, '465', '', 'int', 10, 1, NULL),
(1, 'o_smtp_user', 1, 'a47d3fed4ffdac', '', 'string', 11, 1, NULL),
(1, 'o_tax_payment', 2, '0.00', NULL, 'int', 3, 1, NULL),
(1, 'o_terms', 7, '', NULL, 'text', 1, 1, NULL),
(1, 'o_thank_you_page', 2, 'https://www.astutemyndz.com/', NULL, 'string', 8, 1, NULL),
(1, 'o_theme', 1, 'theme1|theme2|theme3|theme4|theme5|theme6|theme7|theme8|theme9|theme10::theme6', 'Theme 1|Theme 2|Theme 3|Theme 4|Theme 5|Theme 6|Theme 7|Theme 8|Theme 9|Theme 10', 'enum', 5, 0, NULL),
(1, 'o_ticket_data', 6, '', NULL, 'text', 2, 1, NULL),
(1, 'o_ticket_image', 6, 'app/web/upload/tickets/dd3ac5bfa3f4ccf5781d571e9652b9b5.png', NULL, 'text', 1, 1, NULL),
(1, 'o_timezone', 1, '-43200|-39600|-36000|-32400|-28800|-25200|-21600|-18000|-14400|-10800|-7200|-3600|0|3600|7200|10800|14400|18000|21600|25200|28800|32400|36000|39600|43200|46800::18000', 'GMT-12:00|GMT-11:00|GMT-10:00|GMT-09:00|GMT-08:00|GMT-07:00|GMT-06:00|GMT-05:00|GMT-04:00|GMT-03:00|GMT-02:00|GMT-01:00|GMT|GMT+01:00|GMT+02:00|GMT+03:00|GMT+04:00|GMT+05:00|GMT+06:00|GMT+07:00|GMT+08:00|GMT+09:00|GMT+10:00|GMT+11:00|GMT+12:00|GMT+13:00', 'enum', 3, 1, NULL),
(1, 'o_time_format', 1, 'H:i|G:i|h:i|h:i a|h:i A|g:i|g:i a|g:i A::h:i a', 'H:i (09:45)|G:i (9:45)|h:i (09:45)|h:i a (09:45 am)|h:i A (09:45 AM)|g:i (9:45)|g:i a (9:45 am)|g:i A (9:45 AM)', 'enum', 2, 1, NULL),
(1, 'o_update_2015_01_29_10_06_23.sql_c3ecae951615a5bcd117fb80f50c1743', 99, '2019-06-26 14:16:11', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2015_04_06_14_45_32.sql_5e93b78bbeea3e1f99aea14483af8a3c', 99, '2019-06-26 14:15:35', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2015_04_09_03_33_52.sql_3a0d87997ad0a44e99d79d9437965add', 99, '2019-06-26 14:15:35', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2015_09_16_03_21_43.sql_72df9a6e0520d460747a8204dc2a6d3b', 99, '2019-06-26 14:15:35', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2015_09_16_03_42_45.sql_2cd7a0de3921936034221fed457b67f7', 99, '2019-06-26 14:15:35', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2015_11_17_09_42_31.sql_4d763b352f1dc5cbbed0fb9ecb13905f', 99, '2019-06-26 14:15:39', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2015_12_30_08_46_57.sql_96b0436dd1fac8c704774d5d0fac96f9', 99, '2019-06-26 14:15:46', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_01_04_07_03_00.sql_fb28838f43264b9f7f44ca75aa330ee8', 99, '2019-06-26 14:16:11', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_01_04_09_08_31.sql_de9a7d57d2a8380c05ef1d34f054371c', 99, '2019-06-26 14:15:39', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_01_08_14_33_51.sql_37b47016637942f443e377da67137042', 99, '2019-06-26 14:16:11', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_01_11_00_00_00.sql_86f4ca29534fec60455343b882416d95', 99, '2019-06-26 14:15:39', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_02_05_15_10_22.sql_1c9a3e2f3c12022ded2e3bd6af50a175', 99, '2019-06-26 14:15:38', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_03_07_13_35_49.sql_07ddd68fb34c49c06ab124d6fb590bf8', 99, '2019-06-26 14:15:38', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_03_08_15_21_41.sql_2c45f2225d13a875280636f866bab443', 99, '2019-06-26 14:15:38', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_03_18_11_26_43.sql_e4990c229f50cc2f429c797f31250dcc', 99, '2019-06-26 14:16:12', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_07_08_14_41_22.sql_e2f96991c3ece9f0e35062f55fdf1307', 99, '2019-06-26 14:15:38', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_08_23_07_54_31.sql_01bd53aece520e26e67750b0a3ecd456', 99, '2019-06-26 14:16:23', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2016_08_23_09_53_59.sql_b3e0e8f521dee1796f7b9880312650ae', 99, '2019-06-26 14:15:38', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2017_02_07_06_48_09.sql_048ba2a8df33fee6b8204143fea29570', 99, '2019-06-26 14:16:14', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2017_03_13_13_13_13.sql_1efbf847bde11b629f453514783e5d7e', 99, '2019-06-26 14:15:38', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2017_03_15_08_13_48.sql_ad3f5abfb2cae4d2a964d601a87ccd5e', 99, '2019-06-26 14:16:21', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2017_07_27_06_59_22.sql_55ce8368eb8ba74a555f427f1ad2dbbb', 99, '2019-06-26 14:16:22', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2017_08_18_03_10_54.sql_dc2b900393d5037bdc8606a8f71ab0f8', 99, '2019-06-26 14:16:23', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2017_08_18_04_02_37.sql_76e2c4b6094e19e0f66485816f47d456', 99, '2019-06-26 14:16:23', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2018_04_13_17_34_00.sql_c6bd08943c2a8da17a9e387690ec4996', 99, '2019-06-26 14:16:24', NULL, 'string', NULL, 1, NULL),
(1, 'o_week_start', 1, '0|1|2|3|4|5|6::1', 'Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday', 'enum', 4, 1, NULL),
(1, 'private_key', 99, 'J1gSdSJsJXkBRMa9FPYB4y3nX5ernSb4GPuZaEDvO09252RzkaSOMDUZyEmysZMEvWIW9xnj8DMYh8We3cn7Fk6aiSTH8pRNTx7OFgFA3zUaxO1WE3F+evgwYmz+fdWCXr/zWOpKk5EFIzxPLBLbat9jMMS2yuMzysdvDwQ3YCJUI+rNlo/lEbUaEq+vt2VY2sqTjiCpAFL4rmOsiM9Y8A7fxMtNakHQ9YkvEnyt/m85Bh3sIdtRPOhXp5ULxwK9EfTSAYhz4PNb+j3g0JV2AgRrapc1Oi3pOSiBp23423OXBO7YJkTjdkUG/QsEvdq6LqBI1/YeFPJFpodBkLyPow==', NULL, 'string', NULL, 1, 'string');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_password`
--

CREATE TABLE `tk_cbs_password` (
  `id` int(10) UNSIGNED NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_country`
--

CREATE TABLE `tk_cbs_plugin_country` (
  `id` int(10) UNSIGNED NOT NULL,
  `alpha_2` varchar(2) DEFAULT NULL,
  `alpha_3` varchar(3) DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_plugin_country`
--

INSERT INTO `tk_cbs_plugin_country` (`id`, `alpha_2`, `alpha_3`, `status`) VALUES
(1, 'AF', 'AFG', 'T'),
(2, 'AX', 'ALA', 'T'),
(3, 'AL', 'ALB', 'T'),
(4, 'DZ', 'DZA', 'T'),
(5, 'AS', 'ASM', 'T'),
(6, 'AD', 'AND', 'T'),
(7, 'AO', 'AGO', 'T'),
(8, 'AI', 'AIA', 'T'),
(9, 'AQ', 'ATA', 'T'),
(10, 'AG', 'ATG', 'T'),
(11, 'AR', 'ARG', 'T'),
(12, 'AM', 'ARM', 'T'),
(13, 'AW', 'ABW', 'T'),
(14, 'AU', 'AUS', 'T'),
(15, 'AT', 'AUT', 'T'),
(16, 'AZ', 'AZE', 'T'),
(17, 'BS', 'BHS', 'T'),
(18, 'BH', 'BHR', 'T'),
(19, 'BD', 'BGD', 'T'),
(20, 'BB', 'BRB', 'T'),
(21, 'BY', 'BLR', 'T'),
(22, 'BE', 'BEL', 'T'),
(23, 'BZ', 'BLZ', 'T'),
(24, 'BJ', 'BEN', 'T'),
(25, 'BM', 'BMU', 'T'),
(26, 'BT', 'BTN', 'T'),
(27, 'BO', 'BOL', 'T'),
(28, 'BQ', 'BES', 'T'),
(29, 'BA', 'BIH', 'T'),
(30, 'BW', 'BWA', 'T'),
(31, 'BV', 'BVT', 'T'),
(32, 'BR', 'BRA', 'T'),
(33, 'IO', 'IOT', 'T'),
(34, 'BN', 'BRN', 'T'),
(35, 'BG', 'BGR', 'T'),
(36, 'BF', 'BFA', 'T'),
(37, 'BI', 'BDI', 'T'),
(38, 'KH', 'KHM', 'T'),
(39, 'CM', 'CMR', 'T'),
(40, 'CA', 'CAN', 'T'),
(41, 'CV', 'CPV', 'T'),
(42, 'KY', 'CYM', 'T'),
(43, 'CF', 'CAF', 'T'),
(44, 'TD', 'TCD', 'T'),
(45, 'CL', 'CHL', 'T'),
(46, 'CN', 'CHN', 'T'),
(47, 'CX', 'CXR', 'T'),
(48, 'CC', 'CCK', 'T'),
(49, 'CO', 'COL', 'T'),
(50, 'KM', 'COM', 'T'),
(51, 'CG', 'COG', 'T'),
(52, 'CD', 'COD', 'T'),
(53, 'CK', 'COK', 'T'),
(54, 'CR', 'CRI', 'T'),
(55, 'CI', 'CIV', 'T'),
(56, 'HR', 'HRV', 'T'),
(57, 'CU', 'CUB', 'T'),
(58, 'CW', 'CUW', 'T'),
(59, 'CY', 'CYP', 'T'),
(60, 'CZ', 'CZE', 'T'),
(61, 'DK', 'DNK', 'T'),
(62, 'DJ', 'DJI', 'T'),
(63, 'DM', 'DMA', 'T'),
(64, 'DO', 'DOM', 'T'),
(65, 'EC', 'ECU', 'T'),
(66, 'EG', 'EGY', 'T'),
(67, 'SV', 'SLV', 'T'),
(68, 'GQ', 'GNQ', 'T'),
(69, 'ER', 'ERI', 'T'),
(70, 'EE', 'EST', 'T'),
(71, 'ET', 'ETH', 'T'),
(72, 'FK', 'FLK', 'T'),
(73, 'FO', 'FRO', 'T'),
(74, 'FJ', 'FJI', 'T'),
(75, 'FI', 'FIN', 'T'),
(76, 'FR', 'FRA', 'T'),
(77, 'GF', 'GUF', 'T'),
(78, 'PF', 'PYF', 'T'),
(79, 'TF', 'ATF', 'T'),
(80, 'GA', 'GAB', 'T'),
(81, 'GM', 'GMB', 'T'),
(82, 'GE', 'GEO', 'T'),
(83, 'DE', 'DEU', 'T'),
(84, 'GH', 'GHA', 'T'),
(85, 'GI', 'GIB', 'T'),
(86, 'GR', 'GRC', 'T'),
(87, 'GL', 'GRL', 'T'),
(88, 'GD', 'GRD', 'T'),
(89, 'GP', 'GLP', 'T'),
(90, 'GU', 'GUM', 'T'),
(91, 'GT', 'GTM', 'T'),
(92, 'GG', 'GGY', 'T'),
(93, 'GN', 'GIN', 'T'),
(94, 'GW', 'GNB', 'T'),
(95, 'GY', 'GUY', 'T'),
(96, 'HT', 'HTI', 'T'),
(97, 'HM', 'HMD', 'T'),
(98, 'VA', 'VAT', 'T'),
(99, 'HN', 'HND', 'T'),
(100, 'HK', 'HKG', 'T'),
(101, 'HU', 'HUN', 'T'),
(102, 'IS', 'ISL', 'T'),
(103, 'IN', 'IND', 'T'),
(104, 'ID', 'IDN', 'T'),
(105, 'IR', 'IRN', 'T'),
(106, 'IQ', 'IRQ', 'T'),
(107, 'IE', 'IRL', 'T'),
(108, 'IM', 'IMN', 'T'),
(109, 'IL', 'ISR', 'T'),
(110, 'IT', 'ITA', 'T'),
(111, 'JM', 'JAM', 'T'),
(112, 'JP', 'JPN', 'T'),
(113, 'JE', 'JEY', 'T'),
(114, 'JO', 'JOR', 'T'),
(115, 'KZ', 'KAZ', 'T'),
(116, 'KE', 'KEN', 'T'),
(117, 'KI', 'KIR', 'T'),
(118, 'KP', 'PRK', 'T'),
(119, 'KR', 'KOR', 'T'),
(120, 'KW', 'KWT', 'T'),
(121, 'KG', 'KGZ', 'T'),
(122, 'LA', 'LAO', 'T'),
(123, 'LV', 'LVA', 'T'),
(124, 'LB', 'LBN', 'T'),
(125, 'LS', 'LSO', 'T'),
(126, 'LR', 'LBR', 'T'),
(127, 'LY', 'LBY', 'T'),
(128, 'LI', 'LIE', 'T'),
(129, 'LT', 'LTU', 'T'),
(130, 'LU', 'LUX', 'T'),
(131, 'MO', 'MAC', 'T'),
(132, 'MK', 'MKD', 'T'),
(133, 'MG', 'MDG', 'T'),
(134, 'MW', 'MWI', 'T'),
(135, 'MY', 'MYS', 'T'),
(136, 'MV', 'MDV', 'T'),
(137, 'ML', 'MLI', 'T'),
(138, 'MT', 'MLT', 'T'),
(139, 'MH', 'MHL', 'T'),
(140, 'MQ', 'MTQ', 'T'),
(141, 'MR', 'MRT', 'T'),
(142, 'MU', 'MUS', 'T'),
(143, 'YT', 'MYT', 'T'),
(144, 'MX', 'MEX', 'T'),
(145, 'FM', 'FSM', 'T'),
(146, 'MD', 'MDA', 'T'),
(147, 'MC', 'MCO', 'T'),
(148, 'MN', 'MNG', 'T'),
(149, 'ME', 'MNE', 'T'),
(150, 'MS', 'MSR', 'T'),
(151, 'MA', 'MAR', 'T'),
(152, 'MZ', 'MOZ', 'T'),
(153, 'MM', 'MMR', 'T'),
(154, 'NA', 'NAM', 'T'),
(155, 'NR', 'NRU', 'T'),
(156, 'NP', 'NPL', 'T'),
(157, 'NL', 'NLD', 'T'),
(158, 'NC', 'NCL', 'T'),
(159, 'NZ', 'NZL', 'T'),
(160, 'NI', 'NIC', 'T'),
(161, 'NE', 'NER', 'T'),
(162, 'NG', 'NGA', 'T'),
(163, 'NU', 'NIU', 'T'),
(164, 'NF', 'NFK', 'T'),
(165, 'MP', 'MNP', 'T'),
(166, 'NO', 'NOR', 'T'),
(167, 'OM', 'OMN', 'T'),
(168, 'PK', 'PAK', 'T'),
(169, 'PW', 'PLW', 'T'),
(170, 'PS', 'PSE', 'T'),
(171, 'PA', 'PAN', 'T'),
(172, 'PG', 'PNG', 'T'),
(173, 'PY', 'PRY', 'T'),
(174, 'PE', 'PER', 'T'),
(175, 'PH', 'PHL', 'T'),
(176, 'PN', 'PCN', 'T'),
(177, 'PL', 'POL', 'T'),
(178, 'PT', 'PRT', 'T'),
(179, 'PR', 'PRI', 'T'),
(180, 'QA', 'QAT', 'T'),
(181, 'RE', 'REU', 'T'),
(182, 'RO', 'ROU', 'T'),
(183, 'RU', 'RUS', 'T'),
(184, 'RW', 'RWA', 'T'),
(185, 'BL', 'BLM', 'T'),
(186, 'SH', 'SHN', 'T'),
(187, 'KN', 'KNA', 'T'),
(188, 'LC', 'LCA', 'T'),
(189, 'MF', 'MAF', 'T'),
(190, 'PM', 'SPM', 'T'),
(191, 'VC', 'VCT', 'T'),
(192, 'WS', 'WSM', 'T'),
(193, 'SM', 'SMR', 'T'),
(194, 'ST', 'STP', 'T'),
(195, 'SA', 'SAU', 'T'),
(196, 'SN', 'SEN', 'T'),
(197, 'RS', 'SRB', 'T'),
(198, 'SC', 'SYC', 'T'),
(199, 'SL', 'SLE', 'T'),
(200, 'SG', 'SGP', 'T'),
(201, 'SX', 'SXM', 'T'),
(202, 'SK', 'SVK', 'T'),
(203, 'SI', 'SVN', 'T'),
(204, 'SB', 'SLB', 'T'),
(205, 'SO', 'SOM', 'T'),
(206, 'ZA', 'ZAF', 'T'),
(207, 'GS', 'SGS', 'T'),
(208, 'SS', 'SSD', 'T'),
(209, 'ES', 'ESP', 'T'),
(210, 'LK', 'LKA', 'T'),
(211, 'SD', 'SDN', 'T'),
(212, 'SR', 'SUR', 'T'),
(213, 'SJ', 'SJM', 'T'),
(214, 'SZ', 'SWZ', 'T'),
(215, 'SE', 'SWE', 'T'),
(216, 'CH', 'CHE', 'T'),
(217, 'SY', 'SYR', 'T'),
(218, 'TW', 'TWN', 'T'),
(219, 'TJ', 'TJK', 'T'),
(220, 'TZ', 'TZA', 'T'),
(221, 'TH', 'THA', 'T'),
(222, 'TL', 'TLS', 'T'),
(223, 'TG', 'TGO', 'T'),
(224, 'TK', 'TKL', 'T'),
(225, 'TO', 'TON', 'T'),
(226, 'TT', 'TTO', 'T'),
(227, 'TN', 'TUN', 'T'),
(228, 'TR', 'TUR', 'T'),
(229, 'TM', 'TKM', 'T'),
(230, 'TC', 'TCA', 'T'),
(231, 'TV', 'TUV', 'T'),
(232, 'UG', 'UGA', 'T'),
(233, 'UA', 'UKR', 'T'),
(234, 'AE', 'ARE', 'T'),
(235, 'GB', 'GBR', 'T'),
(236, 'US', 'USA', 'T'),
(237, 'UM', 'UMI', 'T'),
(238, 'UY', 'URY', 'T'),
(239, 'UZ', 'UZB', 'T'),
(240, 'VU', 'VUT', 'T'),
(241, 'VE', 'VEN', 'T'),
(242, 'VN', 'VNM', 'T'),
(243, 'VG', 'VGB', 'T'),
(244, 'VI', 'VIR', 'T'),
(245, 'WF', 'WLF', 'T'),
(246, 'EH', 'ESH', 'T'),
(247, 'YE', 'YEM', 'T'),
(248, 'ZM', 'ZMB', 'T'),
(249, 'ZW', 'ZWE', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_invoice`
--

CREATE TABLE `tk_cbs_plugin_invoice` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(12) DEFAULT NULL,
  `order_id` varchar(12) DEFAULT NULL,
  `foreign_id` int(10) UNSIGNED DEFAULT NULL,
  `locale_id` int(10) UNSIGNED DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` enum('not_paid','paid','cancelled') DEFAULT NULL,
  `payment_method` enum('paypal','authorize','creditcard','bank','cash') DEFAULT NULL,
  `cc_type` blob DEFAULT NULL,
  `cc_num` blob DEFAULT NULL,
  `cc_exp_month` blob DEFAULT NULL,
  `cc_exp_year` blob DEFAULT NULL,
  `cc_code` blob DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `processed_on` datetime DEFAULT NULL,
  `subtotal` decimal(9,2) DEFAULT NULL,
  `discount` decimal(9,2) DEFAULT NULL,
  `tax` decimal(9,2) DEFAULT NULL,
  `shipping` decimal(9,2) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `paid_deposit` decimal(9,2) DEFAULT NULL,
  `amount_due` decimal(9,2) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `y_logo` varchar(255) DEFAULT NULL,
  `y_company` varchar(255) DEFAULT NULL,
  `y_name` varchar(255) DEFAULT NULL,
  `y_street_address` varchar(255) DEFAULT NULL,
  `y_country` int(10) DEFAULT NULL,
  `y_city` varchar(255) DEFAULT NULL,
  `y_state` varchar(255) DEFAULT NULL,
  `y_zip` varchar(255) DEFAULT NULL,
  `y_phone` varchar(255) DEFAULT NULL,
  `y_fax` varchar(255) DEFAULT NULL,
  `y_email` varchar(255) DEFAULT NULL,
  `y_url` varchar(255) DEFAULT NULL,
  `b_billing_address` varchar(255) DEFAULT NULL,
  `b_company` varchar(255) DEFAULT NULL,
  `b_name` varchar(255) DEFAULT NULL,
  `b_address` varchar(255) DEFAULT NULL,
  `b_street_address` varchar(255) DEFAULT NULL,
  `b_country` int(10) DEFAULT NULL,
  `b_city` varchar(255) DEFAULT NULL,
  `b_state` varchar(255) DEFAULT NULL,
  `b_zip` varchar(255) DEFAULT NULL,
  `b_phone` varchar(255) DEFAULT NULL,
  `b_fax` varchar(255) DEFAULT NULL,
  `b_email` varchar(255) DEFAULT NULL,
  `b_url` varchar(255) DEFAULT NULL,
  `s_shipping_address` varchar(255) DEFAULT NULL,
  `s_company` varchar(255) DEFAULT NULL,
  `s_name` varchar(255) DEFAULT NULL,
  `s_address` varchar(255) DEFAULT NULL,
  `s_street_address` varchar(255) DEFAULT NULL,
  `s_country` int(10) DEFAULT NULL,
  `s_city` varchar(255) DEFAULT NULL,
  `s_state` varchar(255) DEFAULT NULL,
  `s_zip` varchar(255) DEFAULT NULL,
  `s_phone` varchar(255) DEFAULT NULL,
  `s_fax` varchar(255) DEFAULT NULL,
  `s_email` varchar(255) DEFAULT NULL,
  `s_url` varchar(255) DEFAULT NULL,
  `s_date` date DEFAULT NULL,
  `s_terms` text DEFAULT NULL,
  `s_is_shipped` tinyint(1) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_plugin_invoice`
--

INSERT INTO `tk_cbs_plugin_invoice` (`id`, `uuid`, `order_id`, `foreign_id`, `locale_id`, `issue_date`, `due_date`, `created`, `modified`, `status`, `payment_method`, `cc_type`, `cc_num`, `cc_exp_month`, `cc_exp_year`, `cc_code`, `txn_id`, `processed_on`, `subtotal`, `discount`, `tax`, `shipping`, `total`, `paid_deposit`, `amount_due`, `currency`, `notes`, `y_logo`, `y_company`, `y_name`, `y_street_address`, `y_country`, `y_city`, `y_state`, `y_zip`, `y_phone`, `y_fax`, `y_email`, `y_url`, `b_billing_address`, `b_company`, `b_name`, `b_address`, `b_street_address`, `b_country`, `b_city`, `b_state`, `b_zip`, `b_phone`, `b_fax`, `b_email`, `b_url`, `s_shipping_address`, `s_company`, `s_name`, `s_address`, `s_street_address`, `s_country`, `s_city`, `s_state`, `s_zip`, `s_phone`, `s_fax`, `s_email`, `s_url`, `s_date`, `s_terms`, `s_is_shipped`) VALUES
(19, '1', 'JF1568127631', 1, 1, '2019-09-11', '2019-09-11', '2019-09-11 17:35:17', '2019-09-11 18:16:39', 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100.00', '0.00', NULL, '0.00', '100.00', NULL, '100.00', 'EUR', NULL, NULL, 'Ticket@Guru', 'Global Gala', '34 El-Hassan Street', 235, 'Ad Doqi', 'Giza Governorate', '11222', '(44) 771 828 666', '(222) 333 4444', 'info@globalgala.co.uk', 'https://www.globalgala.com/', 'xyz ', NULL, 'Rakesh Maity', 'xyz ', 'xyz ', NULL, 'Ballykelly', 'Northern Ireland', '7585', '7898695896', NULL, 'rakeshmaity27@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_invoice_config`
--

CREATE TABLE `tk_cbs_plugin_invoice_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `y_logo` varchar(255) DEFAULT NULL,
  `y_country` int(10) DEFAULT NULL,
  `y_zip` varchar(255) DEFAULT NULL,
  `y_phone` varchar(255) DEFAULT NULL,
  `y_fax` varchar(255) DEFAULT NULL,
  `y_email` varchar(255) DEFAULT NULL,
  `y_url` varchar(255) DEFAULT NULL,
  `p_accept_payments` tinyint(1) UNSIGNED DEFAULT 0,
  `p_accept_paypal` tinyint(1) UNSIGNED DEFAULT 0,
  `p_accept_authorize` tinyint(1) UNSIGNED DEFAULT 0,
  `p_accept_creditcard` tinyint(1) UNSIGNED DEFAULT 0,
  `p_accept_cash` tinyint(1) UNSIGNED DEFAULT 0,
  `p_accept_bank` tinyint(1) UNSIGNED DEFAULT 0,
  `p_authorize_tz` varchar(255) DEFAULT NULL,
  `p_authorize_key` varchar(255) DEFAULT NULL,
  `p_authorize_mid` varchar(255) DEFAULT NULL,
  `p_authorize_hash` varchar(255) DEFAULT NULL,
  `si_include` tinyint(1) UNSIGNED DEFAULT 0,
  `si_shipping_address` tinyint(1) UNSIGNED DEFAULT 0,
  `si_company` tinyint(1) UNSIGNED DEFAULT 0,
  `si_name` tinyint(1) UNSIGNED DEFAULT 0,
  `si_address` tinyint(1) UNSIGNED DEFAULT 0,
  `si_street_address` tinyint(1) UNSIGNED DEFAULT 0,
  `si_city` tinyint(1) UNSIGNED DEFAULT 0,
  `si_state` tinyint(1) UNSIGNED DEFAULT 0,
  `si_zip` tinyint(1) UNSIGNED DEFAULT 0,
  `si_phone` tinyint(1) UNSIGNED DEFAULT 0,
  `si_fax` tinyint(1) UNSIGNED DEFAULT 0,
  `si_email` tinyint(1) UNSIGNED DEFAULT 0,
  `si_url` tinyint(1) UNSIGNED DEFAULT 0,
  `si_date` tinyint(1) UNSIGNED DEFAULT 0,
  `si_terms` tinyint(1) UNSIGNED DEFAULT 0,
  `si_is_shipped` tinyint(1) UNSIGNED DEFAULT 0,
  `si_shipping` tinyint(1) UNSIGNED DEFAULT 0,
  `o_booking_url` varchar(255) DEFAULT NULL,
  `o_qty_is_int` tinyint(1) UNSIGNED DEFAULT 0,
  `o_use_qty_unit_price` tinyint(1) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_plugin_invoice_config`
--

INSERT INTO `tk_cbs_plugin_invoice_config` (`id`, `y_logo`, `y_country`, `y_zip`, `y_phone`, `y_fax`, `y_email`, `y_url`, `p_accept_payments`, `p_accept_paypal`, `p_accept_authorize`, `p_accept_creditcard`, `p_accept_cash`, `p_accept_bank`, `p_authorize_tz`, `p_authorize_key`, `p_authorize_mid`, `p_authorize_hash`, `si_include`, `si_shipping_address`, `si_company`, `si_name`, `si_address`, `si_street_address`, `si_city`, `si_state`, `si_zip`, `si_phone`, `si_fax`, `si_email`, `si_url`, `si_date`, `si_terms`, `si_is_shipped`, `si_shipping`, `o_booking_url`, `o_qty_is_int`, `o_use_qty_unit_price`) VALUES
(1, NULL, 235, '11222', '(44) 771 828 666', '(222) 333 4444', 'info@globalgala.co.uk', 'https://www.globalgala.com/', 1, 1, 0, 1, 1, 1, '0', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'index.php?controller=pjAdminReservations&action=pjActionUpdate&uuid={ORDER_ID}', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_invoice_items`
--

CREATE TABLE `tk_cbs_plugin_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `tmp` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `qty` decimal(9,2) DEFAULT NULL,
  `unit_price` decimal(9,2) DEFAULT NULL,
  `amount` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_plugin_invoice_items`
--

INSERT INTO `tk_cbs_plugin_invoice_items` (`id`, `invoice_id`, `tmp`, `name`, `description`, `qty`, `unit_price`, `amount`) VALUES
(1, 1, NULL, 'Mohamed Abdo Concert 2019', 'Adult(&euro;10.00) x 1', '1.00', '10.00', '10.00'),
(2, 2, NULL, 'Rabeh Saqer Concert 2019', 'Green(&euro;8.00) x 2', '1.00', '16.00', '16.00'),
(3, 3, NULL, 'Rabeh Saqer Concert 2019', 'Green(&euro;8.00) x 1', '1.00', '8.00', '8.00'),
(4, 4, NULL, 'Rabeh Saqer Concert 2019', 'Gold(&euro;50.00) x 4', '1.00', '200.00', '200.00'),
(5, 5, NULL, NULL, '(40.00<span class=\"pj-form-field-icon-text-small\"></span>) x 2<br/>(50.00<span class=\"pj-form-field-icon-text-small\"></span>) x 2<br/>(70.00<span class=\"pj-form-field-icon-text-small\"></span>) x 1', '1.00', '250.00', '250.00'),
(6, 6, NULL, 'Rabeh Saqer Concert 2019', 'Green(&euro;70.00) x 1', '1.00', '70.00', '70.00'),
(7, 7, NULL, 'Rabeh Saqer Concert 2019', 'Blue(&euro;40.00) x 1', '1.00', '40.00', '40.00'),
(8, 8, NULL, 'Rabeh Saqer Concert 2019', 'Gold(&euro;50.00) x 1', '1.00', '50.00', '50.00'),
(9, 9, NULL, 'Mohamed Abdo Concert 2019', 'Adult(&euro;10.00) x 3', '1.00', '30.00', '30.00'),
(11, 10, NULL, 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(13, NULL, 'e5caaae5a3cd08b03a7043e589f7b19b', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(16, 13, NULL, 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(17, NULL, 'f7aaafcfbcf9634b455f1d3f2560e4ab', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(18, NULL, '91d42a0eec4593830ea2ec60b557c989', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(19, NULL, 'aff198fbe638c6851fc096c6bc191a87', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(20, NULL, '6a3126b553129761fb730675929f8c95', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(21, NULL, '0b9d74b7865abd1575b53028708b0130', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(23, NULL, 'd5b3ee2dd80751e607356d5471ca2658', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(24, NULL, '7bf12f2d9543afc5ce01ee4d6d4931e0', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(26, 14, NULL, 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(29, 15, NULL, 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(30, 16, NULL, 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(31, NULL, 'b305bddd5ef4a3f0184e47dacda469c9', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(32, NULL, 'bc7962bb08c3fac00d6d7ffa3f100112', 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(35, 18, NULL, 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(37, 19, NULL, 'Good Morning', 'Green(€50.00) x 2', '1.00', '100.00', '100.00'),
(38, NULL, '085fd99ceef6c01e4cc204d94b1f9be8', 'My New Event', 'Green(€50.00) x 1', '1.00', '50.00', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_locale`
--

CREATE TABLE `tk_cbs_plugin_locale` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_iso` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `dir` enum('ltr','rtl') DEFAULT 'ltr',
  `sort` int(10) UNSIGNED DEFAULT NULL,
  `is_default` tinyint(1) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_plugin_locale`
--

INSERT INTO `tk_cbs_plugin_locale` (`id`, `language_iso`, `name`, `flag`, `dir`, `sort`, `is_default`) VALUES
(1, 'en-GB', 'English (United Kingdom)', NULL, 'ltr', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_locale_languages`
--

CREATE TABLE `tk_cbs_plugin_locale_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso` varchar(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `native` varchar(255) DEFAULT NULL,
  `dir` enum('ltr','rtl') DEFAULT 'ltr',
  `country_abbr` varchar(3) DEFAULT NULL,
  `language_abbr` varchar(3) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_plugin_locale_languages`
--

INSERT INTO `tk_cbs_plugin_locale_languages` (`id`, `iso`, `title`, `region`, `native`, `dir`, `country_abbr`, `language_abbr`, `file`) VALUES
(1, 'af-ZA', 'Afrikaans', 'South Africa', 'Afrikaans (Suid Afrika)', 'ltr', 'ZAF', 'AFK', 'za.png'),
(2, 'sq-AL', 'Albanian', 'Albania', 'shqipe (Shqipëria)', 'ltr', 'ALB', 'SQI', 'al.png'),
(3, 'gsw-FR', 'Alsatian', 'France', 'Elsässisch (Frànkrisch)', 'ltr', 'FRA', 'GSW', 'fr.png'),
(4, 'am-ET', 'Amharic', 'Ethiopia', 'አማርኛ (ኢትዮጵያ)', 'ltr', 'ETH', 'AMH', 'et.png'),
(5, 'ar', 'Arabic‎', NULL, 'العربية‏', 'rtl', 'SAU', 'ARA', 'empty.png'),
(6, 'ar-DZ', 'Arabic', 'Algeria', 'العربية (الجزائر)‏', 'rtl', 'DZA', 'ARG', 'dz.png'),
(7, 'ar-BH', 'Arabic', 'Bahrain', 'العربية (البحرين)‏', 'rtl', 'BHR', 'ARH', 'bh.png'),
(8, 'ar-EG', 'Arabic', 'Egypt', 'العربية (مصر)‏', 'rtl', 'EGY', 'ARE', 'eg.png'),
(9, 'ar-IQ', 'Arabic', 'Iraq', 'العربية (العراق)‏', 'rtl', 'IRQ', 'ARI', 'iq.png'),
(10, 'ar-JO', 'Arabic', 'Jordan', 'العربية (الأردن)‏', 'rtl', 'JOR', 'ARJ', 'jo.png'),
(11, 'ar-KW', 'Arabic', 'Kuwait', 'العربية (الكويت)‏', 'rtl', 'KWT', 'ARK', 'kw.png'),
(12, 'ar-LB', 'Arabic', 'Lebanon', 'العربية (لبنان)‏', 'rtl', 'LBN', 'ARB', 'lb.png'),
(13, 'ar-LY', 'Arabic', 'Libya', 'العربية (ليبيا)‏', 'rtl', 'LBY', 'ARL', 'ly.png'),
(14, 'ar-MA', 'Arabic', 'Morocco', 'العربية (المملكة المغربية)‏', 'rtl', 'MAR', 'ARM', 'ma.png'),
(15, 'ar-OM', 'Arabic', 'Oman', 'العربية (عمان)‏', 'rtl', 'OMN', 'ARO', 'om.png'),
(16, 'ar-QA', 'Arabic', 'Qatar', 'العربية (قطر)‏', 'rtl', 'QAT', 'ARQ', 'qa.png'),
(17, 'ar-SA', 'Arabic', 'Saudi Arabia', 'العربية (المملكة العربية السعودية)‏', 'rtl', 'SAU', 'ARA', 'sa.png'),
(18, 'ar-SY', 'Arabic', 'Syria', 'العربية (سوريا)‏', 'rtl', 'SYR', 'ARS', 'sy.png'),
(19, 'ar-TN', 'Arabic', 'Tunisia', 'العربية (تونس)‏', 'rtl', 'TUN', 'ART', 'tn.png'),
(20, 'ar-AE', 'Arabic', 'U.A.E.', 'العربية (الإمارات العربية المتحدة)‏', 'rtl', 'ARE', 'ARU', 'ae.png'),
(21, 'ar-YE', 'Arabic', 'Yemen', 'العربية (اليمن)‏', 'rtl', 'YEM', 'ARY', 'ye.png'),
(22, 'hy-AM', 'Armenian', 'Armenia', 'Հայերեն (Հայաստան)', 'ltr', 'ARM', 'HYE', 'am.png'),
(23, 'as-IN', 'Assamese', 'India', 'অসমীয়া (ভাৰত)', 'ltr', 'IND', 'ASM', 'in.png'),
(24, 'az', 'Azeri', NULL, 'Azərbaycan­ılı', 'rtl', 'AZE', 'AZE', 'empty.png'),
(25, 'az-Cyrl', 'Azeri', 'Cyrillic', 'Азәрбајҹан дили', 'rtl', 'AZE', 'AZC', 'az.png'),
(26, 'az-Cyrl-AZ', 'Azeri', 'Cyrillic, Azerbaijan', 'Азәрбајҹан (Азәрбајҹан)', 'rtl', 'AZE', 'AZC', 'az.png'),
(27, 'az-Latn', 'Azeri', 'Latin', 'Azərbaycan­ılı', 'rtl', 'AZE', 'AZE', 'az.png'),
(28, 'az-Latn-AZ', 'Azeri', 'Latin, Azerbaijan', 'Azərbaycan­ılı (Azərbaycan)', 'rtl', 'AZE', 'AZE', 'az.png'),
(29, 'ba-RU', 'Bashkir', 'Russia', 'Башҡорт (Россия)', 'ltr', 'RUS', 'BAS', 'ru.png'),
(30, 'eu-ES', 'Basque', 'Basque', 'euskara (euskara)', 'ltr', 'ESP', 'EUQ', 'es.png'),
(31, 'be-BY', 'Belarusian', 'Belarus', 'Беларускі (Беларусь)', 'ltr', 'BLR', 'BEL', 'by.png'),
(32, 'bn', 'Bengali', NULL, 'বাংলা', 'ltr', 'IND', 'BNG', 'empty.png'),
(33, 'bn-BD', 'Bengali', 'Bangladesh', 'বাংলা (বাংলাদেশ)', 'ltr', 'BGD', 'BNB', 'bd.png'),
(34, 'bn-IN', 'Bengali', 'India', 'বাংলা (ভারত)', 'ltr', 'IND', 'BNG', 'in.png'),
(35, 'bs', 'Bosnian', NULL, 'bosanski', 'ltr', 'BIH', 'BSB', 'empty.png'),
(36, 'bs-Cyrl', 'Bosnian', 'Cyrillic', 'босански (Ћирилица)', 'ltr', 'BIH', 'BSC', 'ba.png'),
(37, 'bs-Cyrl-BA', 'Bosnian', 'Cyrillic, Bosnia and Herzegovina', 'босански (Босна и Херцеговина)', 'ltr', 'BIH', 'BSC', 'ba.png'),
(38, 'bs-Latn', 'Bosnian', 'Latin', 'bosanski (Latinica)', 'ltr', 'BIH', 'BSB', 'ba.png'),
(39, 'bs-Latn-BA', 'Bosnian', 'Latin, Bosnia and Herzegovina', 'bosanski (Bosna i Hercegovina)', 'ltr', 'BIH', 'BSB', 'ba.png'),
(40, 'br-FR', 'Breton', 'France', 'brezhoneg (Frañs)', 'ltr', 'FRA', 'BRE', 'fr.png'),
(41, 'bg-BG', 'Bulgarian', 'Bulgaria', 'български (България)', 'ltr', 'BGR', 'BGR', 'bg.png'),
(42, 'ca-ES', 'Catalan', 'Catalan', 'català (català)', 'ltr', 'ESP', 'CAT', 'es.png'),
(43, 'zh', 'Chinese', NULL, '中文', 'ltr', 'CHN', 'CHS', 'empty.png'),
(44, 'zh-Hans', 'Chinese', 'Simplified', '中文(简体)', 'ltr', 'CHN', 'CHS', 'cn.png'),
(45, 'zh-CN', 'Chinese', 'Simplified, PRC', '中文(中华人民共和国)', 'ltr', 'CHN', 'CHS', 'cn.png'),
(46, 'zh-SG', 'Chinese', 'Simplified, Singapore', '中文(新加坡)', 'ltr', 'SGP', 'ZHI', 'sg.png'),
(47, 'zh-Hant', 'Chinese', 'Traditional', '中文(繁體)', 'ltr', 'HKG', 'ZHH', 'hk.png'),
(48, 'zh-HK', 'Chinese', 'Traditional, Hong Kong S.A.R.', '中文(香港特別行政區)', 'ltr', 'HKG', 'ZHH', 'hk.png'),
(49, 'zh-MO', 'Chinese', 'Traditional, Macao S.A.R.', '中文(澳門特別行政區)', 'ltr', 'MCO', 'ZHM', 'mc.png'),
(50, 'zh-TW', 'Chinese', 'Traditional, Taiwan', '中文(台灣)', 'ltr', 'TWN', 'CHT', 'tw.png'),
(51, 'co-FR', 'Corsican', 'France', 'Corsu (France)', 'ltr', 'FRA', 'COS', 'fr.png'),
(52, 'hr', 'Croatian', NULL, 'hrvatski', 'ltr', 'HRV', 'HRV', 'empty.png'),
(53, 'hr-HR', 'Croatian', 'Croatia', 'hrvatski (Hrvatska)', 'ltr', 'HRV', 'HRV', 'hr.png'),
(54, 'hr-BA', 'Croatian', 'Latin, Bosnia and Herzegovina', 'hrvatski (Bosna i Hercegovina)', 'ltr', 'BIH', 'HRB', 'ba.png'),
(55, 'cs-CZ', 'Czech', 'Czech Republic', 'čeština (Česká republika)', 'ltr', 'CZE', 'CSY', 'cz.png'),
(56, 'da-DK', 'Danish', 'Denmark', 'dansk (Danmark)', 'ltr', 'DNK', 'DAN', 'dk.png'),
(57, 'prs-AF', 'Dari', 'Afghanistan', 'درى (افغانستان)‏', 'ltr', 'AFG', 'PRS', 'af.png'),
(58, 'dv-MV', 'Divehi', 'Maldives', 'ދިވެހިބަސް (ދިވެހި ރާއްޖެ)‏', 'rtl', 'MDV', 'DIV', 'mv.png'),
(59, 'nl', 'Dutch', NULL, 'Nederlands', 'ltr', 'NLD', 'NLD', 'empty.png'),
(60, 'nl-BE', 'Dutch', 'Belgium', 'Nederlands (België)', 'ltr', 'BEL', 'NLB', 'be.png'),
(61, 'nl-NL', 'Dutch', 'Netherlands', 'Nederlands (Nederland)', 'ltr', 'NLD', 'NLD', 'nl.png'),
(62, 'en', 'English', NULL, 'English', 'ltr', 'USA', 'ENU', 'empty.png'),
(63, 'en-AU', 'English', 'Australia', 'English (Australia)', 'ltr', 'AUS', 'ENA', 'au.png'),
(64, 'en-BZ', 'English', 'Belize', 'English (Belize)', 'ltr', 'BLZ', 'ENL', 'bz.png'),
(65, 'en-CA', 'English', 'Canada', 'English (Canada)', 'ltr', 'CAN', 'ENC', 'ca.png'),
(66, 'en-029', 'English', 'Caribbean', 'English (Caribbean)', 'ltr', 'CAR', 'ENB', 'en.png'),
(67, 'en-IN', 'English', 'India', 'English (India)', 'ltr', 'IND', 'ENN', 'in.png'),
(68, 'en-IE', 'English', 'Ireland', 'English (Ireland)', 'ltr', 'IRL', 'ENI', 'ie.png'),
(69, 'en-JM', 'English', 'Jamaica', 'English (Jamaica)', 'ltr', 'JAM', 'ENJ', 'jm.png'),
(70, 'en-MY', 'English', 'Malaysia', 'English (Malaysia)', 'ltr', 'MYS', 'ENM', 'my.png'),
(71, 'en-NZ', 'English', 'New Zealand', 'English (New Zealand)', 'ltr', 'NZL', 'ENZ', 'nz.png'),
(72, 'en-PH', 'English', 'Republic of the Philippines', 'English (Philippines)', 'ltr', 'PHL', 'ENP', 'ph.png'),
(73, 'en-SG', 'English', 'Singapore', 'English (Singapore)', 'ltr', 'SGP', 'ENE', 'sg.png'),
(74, 'en-ZA', 'English', 'South Africa', 'English (South Africa)', 'ltr', 'ZAF', 'ENS', 'za.png'),
(75, 'en-TT', 'English', 'Trinidad and Tobago', 'English (Trinidad y Tobago)', 'ltr', 'TTO', 'ENT', 'tt.png'),
(76, 'en-GB', 'English', 'United Kingdom', 'English (United Kingdom)', 'ltr', 'GBR', 'ENG', 'gb.png'),
(77, 'en-US', 'English', 'United States', 'English (United States)', 'ltr', 'USA', 'ENU', 'us.png'),
(78, 'en-ZW', 'English', 'Zimbabwe', 'English (Zimbabwe)', 'ltr', 'ZWE', 'ENW', 'zw.png'),
(79, 'et-EE', 'Estonian', 'Estonia', 'eesti (Eesti)', 'ltr', 'EST', 'ETI', 'ee.png'),
(80, 'fo-FO', 'Faroese', 'Faroe Islands', 'føroyskt (Føroyar)', 'ltr', 'FRO', 'FOS', 'fo.png'),
(81, 'fil-PH', 'Filipino', 'Philippines', 'Filipino (Pilipinas)', 'ltr', 'PHL', 'FPO', 'ph.png'),
(82, 'fi-FI', 'Finnish', 'Finland', 'suomi (Suomi)', 'ltr', 'FIN', 'FIN', 'fi.png'),
(83, 'fr', 'French', NULL, 'français', 'ltr', 'FRA', 'FRA', 'empty.png'),
(84, 'fr-BE', 'French', 'Belgium', 'français (Belgique)', 'ltr', 'BEL', 'FRB', 'be.png'),
(85, 'fr-CA', 'French', 'Canada', 'français (Canada)', 'ltr', 'CAN', 'FRC', 'ca.png'),
(86, 'fr-FR', 'French', 'France', 'français (France)', 'ltr', 'FRA', 'FRA', 'fr.png'),
(87, 'fr-LU', 'French', 'Luxembourg', 'français (Luxembourg)', 'ltr', 'LUX', 'FRL', 'lu.png'),
(88, 'fr-MC', 'French', 'Monaco', 'français (Principauté de Monaco)', 'ltr', 'MCO', 'FRM', 'mc.png'),
(89, 'fr-CH', 'French', 'Switzerland', 'français (Suisse)', 'ltr', 'CHE', 'FRS', 'ch.png'),
(90, 'fy-NL', 'Frisian', 'Netherlands', 'Frysk (Nederlân)', 'ltr', 'NLD', 'FYN', 'nl.png'),
(91, 'gl-ES', 'Galician', 'Galician', 'galego (galego)', 'ltr', 'ESP', 'GLC', 'es.png'),
(92, 'ka-GE', 'Georgian', 'Georgia', 'ქართული (საქართველო)', 'ltr', 'GEO', 'KAT', 'ge.png'),
(93, 'de', 'German', NULL, 'Deutsch', 'ltr', 'DEU', 'DEU', 'empty.png'),
(94, 'de-AT', 'German', 'Austria', 'Deutsch (Österreich)', 'ltr', 'AUT', 'DEA', 'at.png'),
(95, 'de-DE', 'German', 'Germany', 'Deutsch (Deutschland)', 'ltr', 'DEU', 'DEU', 'de.png'),
(96, 'de-LI', 'German', 'Liechtenstein', 'Deutsch (Liechtenstein)', 'ltr', 'LIE', 'DEC', 'li.png'),
(97, 'de-LU', 'German', 'Luxembourg', 'Deutsch (Luxemburg)', 'ltr', 'LUX', 'DEL', 'lu.png'),
(98, 'de-CH', 'German', 'Switzerland', 'Deutsch (Schweiz)', 'ltr', 'CHE', 'DES', 'ch.png'),
(99, 'el-GR', 'Greek', 'Greece', 'Ελληνικά (Ελλάδα)', 'ltr', 'GRC', 'ELL', 'gr.png'),
(100, 'kl-GL', 'Greenlandic', 'Greenland', 'kalaallisut (Kalaallit Nunaat)', 'ltr', 'GRL', 'KAL', 'gl.png'),
(101, 'gu-IN', 'Gujarati', 'India', 'ગુજરાતી (ભારત)', 'ltr', 'IND', 'GUJ', 'in.png'),
(102, 'ha', 'Hausa', NULL, 'Hausa', 'ltr', 'NGA', 'HAU', 'empty.png'),
(103, 'ha-Latn', 'Hausa', 'Latin', 'Hausa (Latin)', 'ltr', 'NGA', 'HAU', 'ng.png'),
(104, 'ha-Latn-NG', 'Hausa', 'Latin, Nigeria', 'Hausa (Nigeria)', 'ltr', 'NGA', 'HAU', 'ng.png'),
(105, 'he-IL', 'Hebrew', 'Israel', 'עברית (ישראל)‏', 'rtl', 'ISR', 'HEB', 'il.png'),
(106, 'hi-IN', 'Hindi', 'India', 'हिंदी (भारत)', 'ltr', 'IND', 'HIN', 'in.png'),
(107, 'hu-HU', 'Hungarian', 'Hungary', 'magyar (Magyarország)', 'ltr', 'HUN', 'HUN', 'hu.png'),
(108, 'is-IS', 'Icelandic', 'Iceland', 'íslenska (Ísland)', 'ltr', 'ISL', 'ISL', 'is.png'),
(109, 'ig-NG', 'Igbo', 'Nigeria', 'Igbo (Nigeria)', 'ltr', 'NGA', 'IBO', 'ng.png'),
(110, 'id-ID', 'Indonesian', 'Indonesia', 'Bahasa Indonesia (Indonesia)', 'ltr', 'IDN', 'IND', 'id.png'),
(111, 'iu', 'Inuktitut', NULL, 'Inuktitut', 'ltr', 'CAN', 'IUK', 'empty.png'),
(112, 'iu-Latn', 'Inuktitut', 'Latin', 'Inuktitut (Qaliujaaqpait)', 'ltr', 'CAN', 'IUK', 'ca.png'),
(113, 'iu-Latn-CA', 'Inuktitut', 'Latin, Canada', 'Inuktitut', 'ltr', 'CAN', 'IUK', 'ca.png'),
(114, 'iu-Cans', 'Inuktitut', 'Syllabics', 'ᐃᓄᒃᑎᑐᑦ (ᖃᓂᐅᔮᖅᐸᐃᑦ)', 'ltr', 'CAN', 'IUS', 'ca.png'),
(115, 'iu-Cans-CA', 'Inuktitut', 'Syllabics, Canada', 'ᐃᓄᒃᑎᑐᑦ (ᑲᓇᑕᒥ)', 'ltr', 'CAN', 'IUS', 'ca.png'),
(116, 'ga-IE', 'Irish', 'Ireland', 'Gaeilge (Éire)', 'ltr', 'IRL', 'IRE', 'ie.png'),
(117, 'xh-ZA', 'isiXhosa', 'South Africa', 'isiXhosa (uMzantsi Afrika)', 'ltr', 'ZAF', 'XHO', 'za.png'),
(118, 'zu-ZA', 'isiZulu', 'South Africa', 'isiZulu (iNingizimu Afrika)', 'ltr', 'ZAF', 'ZUL', 'za.png'),
(119, 'it', 'Italian', NULL, 'italiano', 'ltr', 'ITA', 'ITA', 'empty.png'),
(120, 'it-IT', 'Italian', 'Italy', 'italiano (Italia)', 'ltr', 'ITA', 'ITA', 'it.png'),
(121, 'it-CH', 'Italian', 'Switzerland', 'italiano (Svizzera)', 'ltr', 'CHE', 'ITS', 'ch.png'),
(122, 'ja-JP', 'Japanese', 'Japan', '日本語 (日本)', 'ltr', 'JPN', 'JPN', 'jp.png'),
(123, 'kn-IN', 'Kannada', 'India', 'ಕನ್ನಡ (ಭಾರತ)', 'ltr', 'IND', 'KDI', 'in.png'),
(124, 'kk-KZ', 'Kazakh', 'Kazakhstan', 'Қазақ (Қазақстан)', 'rtl', 'KAZ', 'KKZ', 'kz.png'),
(125, 'km-KH', 'Khmer', 'Cambodia', 'ខ្មែរ (កម្ពុជា)', 'ltr', 'KHM', 'KHM', 'kh.png'),
(126, 'qut-GT', 'K\'iche', 'Guatemala', 'K\'iche (Guatemala)', 'ltr', 'GTM', 'QUT', 'gt.png'),
(127, 'rw-RW', 'Kinyarwanda', 'Rwanda', 'Kinyarwanda (Rwanda)', 'ltr', 'RWA', 'KIN', 'rw.png'),
(128, 'sw-KE', 'Kiswahili', 'Kenya', 'Kiswahili (Kenya)', 'ltr', 'KEN', 'SWK', 'ke.png'),
(129, 'kok-IN', 'Konkani', 'India', 'कोंकणी (भारत)', 'ltr', 'IND', 'KNK', 'in.png'),
(130, 'ko-KR', 'Korean', 'Korea', '한국어 (대한민국)', 'ltr', 'KOR', 'KOR', 'kr.png'),
(131, 'ky-KG', 'Kyrgyz', 'Kyrgyzstan', 'Кыргыз (Кыргызстан)', 'ltr', 'KGZ', 'KYR', 'kg.png'),
(132, 'lo-LA', 'Lao', 'Lao P.D.R.', 'ລາວ (ສ.ປ.ປ. ລາວ)', 'ltr', 'LAO', 'LAO', 'la.png'),
(133, 'lv-LV', 'Latvian', 'Latvia', 'latviešu (Latvija)', 'ltr', 'LVA', 'LVI', 'lv.png'),
(134, 'lt-LT', 'Lithuanian', 'Lithuania', 'lietuvių (Lietuva)', 'ltr', 'LTU', 'LTH', 'lt.png'),
(135, 'dsb-DE', 'Lower Sorbian', 'Germany', 'dolnoserbšćina (Nimska)', 'ltr', 'GER', 'DSB', 'de.png'),
(136, 'lb-LU', 'Luxembourgish', 'Luxembourg', 'Lëtzebuergesch (Luxembourg)', 'ltr', 'LUX', 'LBX', 'lu.png'),
(137, 'mk-MK', 'Macedonian', 'Former Yugoslav Republic of Macedonia', 'македонски јазик (Македонија)', 'ltr', 'MKD', 'MKI', 'mk.png'),
(138, 'mk', 'Macedonian', 'FYROM', 'македонски јазик', 'ltr', 'MKD', 'MKI', 'mk.png'),
(139, 'ms', 'Malay', NULL, 'Bahasa Melayu', 'ltr', 'MYS', 'MSL', 'empty.png'),
(140, 'ms-BN', 'Malay', 'Brunei Darussalam', 'Bahasa Melayu (Brunei Darussalam)', 'ltr', 'BRN', 'MSB', 'bn.png'),
(141, 'ms-MY', 'Malay', 'Malaysia', 'Bahasa Melayu (Malaysia)', 'ltr', 'MYS', 'MSL', 'my.png'),
(142, 'ml-IN', 'Malayalam', 'India', 'മലയാളം (ഭാരതം)', 'rtl', 'IND', 'MYM', 'in.png'),
(143, 'mt-MT', 'Maltese', 'Malta', 'Malti (Malta)', 'ltr', 'MLT', 'MLT', 'mt.png'),
(144, 'mi-NZ', 'Maori', 'New Zealand', 'Reo Māori (Aotearoa)', 'ltr', 'NZL', 'MRI', 'nz.png'),
(145, 'arn-CL', 'Mapudungun', 'Chile', 'Mapudungun (Chile)', 'ltr', 'CHL', 'MPD', 'cl.png'),
(146, 'mr-IN', 'Marathi', 'India', 'मराठी (भारत)', 'ltr', 'IND', 'MAR', 'in.png'),
(147, 'moh-CA', 'Mohawk', 'Mohawk', 'Kanien\'kéha', 'ltr', 'CAN', 'MWK', 'ca.png'),
(148, 'mn', 'Mongolian', 'Cyrillic', 'Монгол хэл', 'ltr', 'MNG', 'MNN', 'mn.png'),
(149, 'mn-Cyrl', 'Mongolian', 'Cyrillic', 'Монгол хэл', 'ltr', 'MNG', 'MNN', 'mn.png'),
(150, 'mn-MN', 'Mongolian', 'Cyrillic, Mongolia', 'Монгол хэл (Монгол улс)', 'ltr', 'MNG', 'MNN', 'mn.png'),
(151, 'mn-Mong', 'Mongolian', 'Traditional Mongolian', 'ᠮᠤᠨᠭᠭᠤᠯ ᠬᠡᠯᠡ', 'ltr', 'CHN', 'MNG', 'cn.png'),
(152, 'mn-Mong-CN', 'Mongolian', 'Traditional Mongolian, PRC', 'ᠮᠤᠨᠭᠭᠤᠯ ᠬᠡᠯᠡ (ᠪᠦᠭᠦᠳᠡ ᠨᠠᠢᠷᠠᠮᠳᠠᠬᠤ ᠳᠤᠮᠳᠠᠳᠤ ᠠᠷᠠᠳ ᠣᠯᠣᠰ)', 'ltr', 'CHN', 'MNG', 'cn.png'),
(153, 'ne-NP', 'Nepali', 'Nepal', 'नेपाली (नेपाल)', 'ltr', 'NEP', 'NEP', 'np.png'),
(154, 'no', 'Norwegian', NULL, 'norsk', 'ltr', 'NOR', 'NOR', 'empty.png'),
(155, 'nb', 'Norwegian', 'Bokmål', 'norsk (bokmål)', 'ltr', 'NOR', 'NOR', 'no.png'),
(156, 'nn', 'Norwegian', 'Nynorsk', 'norsk (nynorsk)', 'ltr', 'NOR', 'NON', 'no.png'),
(157, 'nb-NO', 'Norwegian, Bokmål', 'Norway', 'norsk, bokmål (Norge)', 'ltr', 'NOR', 'NOR', 'no.png'),
(158, 'nn-NO', 'Norwegian, Nynorsk', 'Norway', 'norsk, nynorsk (Noreg)', 'ltr', 'NOR', 'NON', 'no.png'),
(159, 'oc-FR', 'Occitan', 'France', 'Occitan (França)', 'ltr', 'FRA', 'OCI', 'fr.png'),
(160, 'or-IN', 'Oriya', 'India', 'ଓଡ଼ିଆ (ଭାରତ)', 'ltr', 'IND', 'ORI', 'in.png'),
(161, 'ps-AF', 'Pashto', 'Afghanistan', 'پښتو (افغانستان)‏', 'rtl', 'AFG', 'PAS', 'af.png'),
(162, 'fa-IR', 'Persian‎', NULL, 'فارسى (ایران)‏', 'rtl', 'IRN', 'FAR', 'empty.png'),
(163, 'pl-PL', 'Polish', 'Poland', 'polski (Polska)', 'ltr', 'POL', 'PLK', 'pl.png'),
(164, 'pt', 'Portuguese', NULL, 'Português', 'ltr', 'BRA', 'PTB', 'empty.png'),
(165, 'pt-BR', 'Portuguese', 'Brazil', 'Português (Brasil)', 'ltr', 'BRA', 'PTB', 'br.png'),
(166, 'pt-PT', 'Portuguese', 'Portugal', 'português (Portugal)', 'ltr', 'PRT', 'PTG', 'pt.png'),
(167, 'pa-IN', 'Punjabi', 'India', 'ਪੰਜਾਬੀ (ਭਾਰਤ)', 'rtl', 'IND', 'PAN', 'in.png'),
(168, 'quz', 'Quechua', NULL, 'runasimi', 'ltr', 'BOL', 'QUB', 'empty.png'),
(169, 'quz-BO', 'Quechua', 'Bolivia', 'runasimi (Qullasuyu)', 'ltr', 'BOL', 'QUB', 'bo.png'),
(170, 'quz-EC', 'Quechua', 'Ecuador', 'runasimi (Ecuador)', 'ltr', 'ECU', 'QUE', 'ec.png'),
(171, 'quz-PE', 'Quechua', 'Peru', 'runasimi (Piruw)', 'ltr', 'PER', 'QUP', 'pe.png'),
(172, 'ro-RO', 'Romanian', 'Romania', 'română (România)', 'ltr', 'ROM', 'ROM', 'ro.png'),
(173, 'rm-CH', 'Romansh', 'Switzerland', 'Rumantsch (Svizra)', 'ltr', 'CHE', 'RMC', 'ch.png'),
(174, 'ru-RU', 'Russian', 'Russia', 'русский (Россия)', 'ltr', 'RUS', 'RUS', 'ru.png'),
(175, 'smn', 'Sami', 'Inari', 'sämikielâ', 'ltr', 'FIN', 'SMN', 'fi.png'),
(176, 'smj', 'Sami', 'Lule', 'julevusámegiella', 'ltr', 'SWE', 'SMK', 'se.png'),
(177, 'se', 'Sami', 'Northern', 'davvisámegiella', 'ltr', 'NOR', 'SME', 'no.png'),
(178, 'sms', 'Sami', 'Skolt', 'sääm´ǩiõll', 'ltr', 'FIN', 'SMS', 'fi.png'),
(179, 'sma', 'Sami', 'Southern', 'åarjelsaemiengiele', 'ltr', 'SWE', 'SMB', 'se.png'),
(180, 'smn-FI', 'Sami, Inari', 'Finland', 'sämikielâ (Suomâ)', 'ltr', 'FIN', 'SMN', 'fi.png'),
(181, 'smj-NO', 'Sami, Lule', 'Norway', 'julevusámegiella (Vuodna)', 'ltr', 'NOR', 'SMJ', 'no.png'),
(182, 'smj-SE', 'Sami, Lule', 'Sweden', 'julevusámegiella (Svierik)', 'ltr', 'SWE', 'SMK', 'se.png'),
(183, 'se-FI', 'Sami, Northern', 'Finland', 'davvisámegiella (Suopma)', 'ltr', 'FIN', 'SMG', 'fi.png'),
(184, 'se-NO', 'Sami, Northern', 'Norway', 'davvisámegiella (Norga)', 'ltr', 'NOR', 'SME', 'no.png'),
(185, 'se-SE', 'Sami, Northern', 'Sweden', 'davvisámegiella (Ruoŧŧa)', 'ltr', 'SWE', 'SMF', 'se.png'),
(186, 'sms-FI', 'Sami, Skolt', 'Finland', 'sääm´ǩiõll (Lää´ddjânnam)', 'ltr', 'FIN', 'SMS', 'fi.png'),
(187, 'sma-NO', 'Sami, Southern', 'Norway', 'åarjelsaemiengiele (Nöörje)', 'ltr', 'NOR', 'SMA', 'no.png'),
(188, 'sma-SE', 'Sami, Southern', 'Sweden', 'åarjelsaemiengiele (Sveerje)', 'ltr', 'SWE', 'SMB', 'se.png'),
(189, 'sa-IN', 'Sanskrit', 'India', 'संस्कृत (भारतम्)', 'ltr', 'IND', 'SAN', 'in.png'),
(190, 'gd-GB', 'Scottish Gaelic', 'United Kingdom', 'Gàidhlig (An Rìoghachd Aonaichte)', 'ltr', 'GBR', 'GLA', 'gb.png'),
(191, 'sr', 'Serbian', NULL, 'srpski', 'ltr', 'SRB', 'SRM', 'empty.png'),
(192, 'sr-Cyrl', 'Serbian', 'Cyrillic', 'српски (Ћирилица)', 'ltr', 'SRB', 'SRO', 'rs.png'),
(193, 'sr-Cyrl-BA', 'Serbian', 'Cyrillic, Bosnia and Herzegovina', 'српски (Босна и Херцеговина)', 'ltr', 'BIH', 'SRN', 'ba.png'),
(194, 'sr-Cyrl-ME', 'Serbian', 'Cyrillic, Montenegro', 'српски (Црна Гора)', 'ltr', 'MNE', 'SRQ', 'me.png'),
(195, 'sr-Cyrl-CS', 'Serbian', 'Cyrillic, Serbia and Montenegro (Former)', 'српски (Србија и Црна Гора (Претходно))', 'ltr', 'SCG', 'SRB', 'rs.png'),
(196, 'sr-Cyrl-RS', 'Serbian', 'Cyrillic, Serbia', 'српски (Србија)', 'ltr', 'SRB', 'SRO', 'rs.png'),
(197, 'sr-Latn', 'Serbian', 'Latin', 'srpski (Latinica)', 'ltr', 'SRB', 'SRM', 'rs.png'),
(198, 'sr-Latn-BA', 'Serbian', 'Latin, Bosnia and Herzegovina', 'srpski (Bosna i Hercegovina)', 'ltr', 'BIH', 'SRS', 'ba.png'),
(199, 'sr-Latn-ME', 'Serbian', 'Latin, Montenegro', 'srpski (Crna Gora)', 'ltr', 'MNE', 'SRP', 'me.png'),
(200, 'sr-Latn-CS', 'Serbian', 'Latin, Serbia and Montenegro (Former)', 'srpski (Srbija i Crna Gora (Prethodno))', 'ltr', 'SCG', 'SRL', 'rs.png'),
(201, 'sr-Latn-RS', 'Serbian', 'Latin, Serbia', 'srpski (Srbija)', 'ltr', 'SRB', 'SRM', 'rs.png'),
(202, 'nso-ZA', 'Sesotho sa Leboa', 'South Africa', 'Sesotho sa Leboa (Afrika Borwa)', 'ltr', 'ZAF', 'NSO', 'za.png'),
(203, 'tn-ZA', 'Setswana', 'South Africa', 'Setswana (Aforika Borwa)', 'ltr', 'ZAF', 'TSN', 'za.png'),
(204, 'si-LK', 'Sinhala', 'Sri Lanka', 'සිංහ (ශ්‍රී ලංකා)', 'ltr', 'LKA', 'SIN', 'lk.png'),
(205, 'sk-SK', 'Slovak', 'Slovakia', 'slovenčina (Slovenská republika)', 'ltr', 'SVK', 'SKY', 'sk.png'),
(206, 'sl-SI', 'Slovenian', 'Slovenia', 'slovenski (Slovenija)', 'ltr', 'SVN', 'SLV', 'si.png'),
(207, 'es', 'Spanish', NULL, 'español', 'ltr', 'ESP', 'ESN', 'empty.png'),
(208, 'es-AR', 'Spanish', 'Argentina', 'Español (Argentina)', 'ltr', 'ARG', 'ESS', 'ar.png'),
(209, 'es-BO', 'Spanish', 'Bolivia', 'Español (Bolivia)', 'ltr', 'BOL', 'ESB', 'bo.png'),
(210, 'es-CL', 'Spanish', 'Chile', 'Español (Chile)', 'ltr', 'CHL', 'ESL', 'cl.png'),
(211, 'es-CO', 'Spanish', 'Colombia', 'Español (Colombia)', 'ltr', 'COL', 'ESO', 'co.png'),
(212, 'es-CR', 'Spanish', 'Costa Rica', 'Español (Costa Rica)', 'ltr', 'CRI', 'ESC', 'cr.png'),
(213, 'es-DO', 'Spanish', 'Dominican Republic', 'Español (República Dominicana)', 'ltr', 'DOM', 'ESD', 'do.png'),
(214, 'es-EC', 'Spanish', 'Ecuador', 'Español (Ecuador)', 'ltr', 'ECU', 'ESF', 'ec.png'),
(215, 'es-SV', 'Spanish', 'El Salvador', 'Español (El Salvador)', 'ltr', 'SLV', 'ESE', 'sv.png'),
(216, 'es-GT', 'Spanish', 'Guatemala', 'Español (Guatemala)', 'ltr', 'GTM', 'ESG', 'gt.png'),
(217, 'es-HN', 'Spanish', 'Honduras', 'Español (Honduras)', 'ltr', 'HND', 'ESH', 'hn.png'),
(218, 'es-MX', 'Spanish', 'Mexico', 'Español (México)', 'ltr', 'MEX', 'ESM', 'mx.png'),
(219, 'es-NI', 'Spanish', 'Nicaragua', 'Español (Nicaragua)', 'ltr', 'NIC', 'ESI', 'ni.png'),
(220, 'es-PA', 'Spanish', 'Panama', 'Español (Panamá)', 'ltr', 'PAN', 'ESA', 'pa.png'),
(221, 'es-PY', 'Spanish', 'Paraguay', 'Español (Paraguay)', 'ltr', 'PRY', 'ESZ', 'py.png'),
(222, 'es-PE', 'Spanish', 'Peru', 'Español (Perú)', 'ltr', 'PER', 'ESR', 'pe.png'),
(223, 'es-PR', 'Spanish', 'Puerto Rico', 'Español (Puerto Rico)', 'ltr', 'PRI', 'ESU', 'pr.png'),
(224, 'es-ES', 'Spanish', 'Spain, International Sort', 'Español (España, alfabetización internacional)', 'ltr', 'ESP', 'ESN', 'es.png'),
(225, 'es-US', 'Spanish', 'United States', 'Español (Estados Unidos)', 'ltr', 'USA', 'EST', 'us.png'),
(226, 'es-UY', 'Spanish', 'Uruguay', 'Español (Uruguay)', 'ltr', 'URY', 'ESY', 'uy.png'),
(227, 'es-VE', 'Spanish', 'Venezuela', 'Español (Republica Bolivariana de Venezuela)', 'ltr', 'VEN', 'ESV', 've.png'),
(228, 'sv', 'Swedish', NULL, 'svenska', 'ltr', 'SWE', 'SVE', 'empty.png'),
(229, 'sv-FI', 'Swedish', 'Finland', 'svenska (Finland)', 'ltr', 'FIN', 'SVF', 'fi.png'),
(230, 'sv-SE', 'Swedish', 'Sweden', 'svenska (Sverige)', 'ltr', 'SWE', 'SVE', 'se.png'),
(231, 'syr-SY', 'Syriac', 'Syria', 'ܣܘܪܝܝܐ (سوريا)‏', 'rtl', 'SYR', 'SYR', 'sy.png'),
(232, 'tg', 'Tajik', 'Cyrillic', 'Тоҷикӣ', 'ltr', 'TAJ', 'TAJ', 'tj.png'),
(233, 'tg-Cyrl', 'Tajik', 'Cyrillic', 'Тоҷикӣ', 'ltr', 'TAJ', 'TAJ', 'tj.png'),
(234, 'tg-Cyrl-TJ', 'Tajik', 'Cyrillic, Tajikistan', 'Тоҷикӣ (Тоҷикистон)', 'ltr', 'TAJ', 'TAJ', 'tj.png'),
(235, 'tzm', 'Tamazight', NULL, 'Tamazight', 'ltr', 'DZA', 'TZM', 'empty.png'),
(236, 'tzm-Latn', 'Tamazight', 'Latin', 'Tamazight (Latin)', 'ltr', 'DZA', 'TZM', 'dz.png'),
(237, 'tzm-Latn-DZ', 'Tamazight', 'Latin, Algeria', 'Tamazight (Djazaïr)', 'ltr', 'DZA', 'TZM', 'dz.png'),
(238, 'ta-IN', 'Tamil', 'India', 'தமிழ் (இந்தியா)', 'ltr', 'IND', 'TAM', 'in.png'),
(239, 'tt-RU', 'Tatar', 'Russia', 'Татар (Россия)', 'ltr', 'RUS', 'TTT', 'ru.png'),
(240, 'te-IN', 'Telugu', 'India', 'తెలుగు (భారత దేశం)', 'ltr', 'IND', 'TEL', 'in.png'),
(241, 'th-TH', 'Thai', 'Thailand', 'ไทย (ไทย)', 'ltr', 'THA', 'THA', 'th.png'),
(242, 'bo-CN', 'Tibetan', 'PRC', 'བོད་ཡིག (ཀྲུང་ཧྭ་མི་དམངས་སྤྱི་མཐུན་རྒྱལ་ཁབ།)', 'ltr', 'CHN', 'BOB', 'cn.png'),
(243, 'tr-TR', 'Turkish', 'Turkey', 'Türkçe (Türkiye)', 'ltr', 'TUR', 'TRK', 'tr.png'),
(244, 'tk-TM', 'Turkmen', 'Turkmenistan', 'türkmençe (Türkmenistan)', 'rtl', 'TKM', 'TUK', 'tm.png'),
(245, 'uk-UA', 'Ukrainian', 'Ukraine', 'українська (Україна)', 'ltr', 'UKR', 'UKR', 'ua.png'),
(246, 'hsb-DE', 'Upper Sorbian', 'Germany', 'hornjoserbšćina (Němska)', 'ltr', 'GER', 'HSB', 'de.png'),
(247, 'ur-PK', 'Urdu', 'Islamic Republic of Pakistan', 'اُردو (پاکستان)‏', 'rtl', 'PAK', 'URD', 'pk.png'),
(248, 'ug-CN', 'Uyghur', 'PRC', '(ئۇيغۇر يېزىقى (جۇڭخۇا خەلق جۇمھۇرىيىتى‏', 'rtl', 'CHN', 'UIG', 'cn.png'),
(249, 'uz-Cyrl', 'Uzbek', 'Cyrillic', 'Ўзбек', 'ltr', 'UZB', 'UZB', 'uz.png'),
(250, 'uz-Cyrl-UZ', 'Uzbek', 'Cyrillic, Uzbekistan', 'Ўзбек (Ўзбекистон)', 'ltr', 'UZB', 'UZB', 'uz.png'),
(251, 'uz', 'Uzbek', 'Latin', 'U\'zbek', 'ltr', 'UZB', 'UZB', 'uz.png'),
(252, 'uz-Latn', 'Uzbek', 'Latin', 'U\'zbek', 'ltr', 'UZB', 'UZB', 'uz.png'),
(253, 'uz-Latn-UZ', 'Uzbek', 'Latin, Uzbekistan', 'U\'zbek (U\'zbekiston Respublikasi)', 'ltr', 'UZB', 'UZB', 'uz.png'),
(254, 'vi-VN', 'Vietnamese', 'Vietnam', 'Tiếng Việt (Việt Nam)', 'ltr', 'VNM', 'VIT', 'vn.png'),
(255, 'cy-GB', 'Welsh', 'United Kingdom', 'Cymraeg (y Deyrnas Unedig)', 'ltr', 'GBR', 'CYM', 'gb.png'),
(256, 'wo-SN', 'Wolof', 'Senegal', 'Wolof (Sénégal)', 'ltr', 'SEN', 'WOL', 'sn.png'),
(257, 'sah-RU', 'Yakut', 'Russia', 'саха (Россия)', 'ltr', 'RUS', 'SAH', 'ru.png'),
(258, 'ii-CN', 'Yi', 'PRC', 'ꆈꌠꁱꂷ (ꍏꉸꏓꂱꇭꉼꇩ)', 'ltr', 'CHN', 'III', 'cn.png'),
(259, 'yo-NG', 'Yoruba', 'Nigeria', 'Yoruba (Nigeria)', 'ltr', 'NGA', 'YOR', 'ng.png');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_log`
--

CREATE TABLE `tk_cbs_plugin_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_log_config`
--

CREATE TABLE `tk_cbs_plugin_log_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_one_admin`
--

CREATE TABLE `tk_cbs_plugin_one_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_paypal`
--

CREATE TABLE `tk_cbs_plugin_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `foreign_id` int(10) UNSIGNED DEFAULT NULL,
  `subscr_id` varchar(25) DEFAULT NULL,
  `txn_id` varchar(25) DEFAULT NULL,
  `txn_type` varchar(50) DEFAULT NULL,
  `mc_gross` decimal(9,2) UNSIGNED DEFAULT NULL,
  `mc_currency` varchar(3) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_plugin_sms`
--

CREATE TABLE `tk_cbs_plugin_sms` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_prices`
--

CREATE TABLE `tk_cbs_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_prices`
--

INSERT INTO `tk_cbs_prices` (`id`, `event_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(11, 4),
(5, 5),
(9, 5),
(10, 5),
(6, 6),
(7, 6),
(8, 6),
(12, 7),
(13, 8),
(14, 8),
(15, 8),
(16, 9),
(17, 9),
(18, 10),
(19, 11),
(20, 11),
(21, 11),
(22, 12),
(23, 12),
(24, 13),
(25, 14),
(26, 14),
(27, 14),
(28, 21),
(29, 22),
(30, 23),
(31, 24),
(32, 25),
(33, 26),
(34, 27),
(35, 28),
(36, 29),
(37, 30),
(38, 31),
(39, 34);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_queues`
--

CREATE TABLE `tk_cbs_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED DEFAULT NULL,
  `subscriber_id` int(10) UNSIGNED DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `status` enum('completed','inprogress') NOT NULL DEFAULT 'inprogress'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_roles`
--

CREATE TABLE `tk_cbs_roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T',
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `is_customer` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_roles`
--

INSERT INTO `tk_cbs_roles` (`id`, `role`, `status`, `is_superadmin`, `is_customer`) VALUES
(1, 'Superadmin', 'T', 1, 0),
(7, 'Ticket Offices', 'T', 0, 0),
(8, 'Customer', 'T', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_role_acls`
--

CREATE TABLE `tk_cbs_role_acls` (
  `id` int(11) NOT NULL,
  `id_tk_cbs_roles` tinyint(1) DEFAULT NULL,
  `id_tk_cbs_modules` int(11) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_role_acls`
--

INSERT INTO `tk_cbs_role_acls` (`id`, `id_tk_cbs_roles`, `id_tk_cbs_modules`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`) VALUES
(188, 1, 364, 1, 1, 1, 1, 1),
(189, 1, 365, 1, 1, 1, 1, 1),
(190, 1, 366, 1, 1, 1, 1, 1),
(191, 1, 367, 1, 1, 1, 1, 1),
(192, 1, 368, 1, 1, 1, 1, 1),
(193, 1, 369, 1, 1, 1, 1, 1),
(194, 1, 370, 1, 1, 1, 1, 1),
(195, 1, 371, 1, 1, 1, 1, 1),
(196, 1, 372, 1, 1, 1, 1, 1),
(197, 1, 373, 1, 1, 1, 1, 1),
(198, 1, 374, 1, 1, 1, 1, 1),
(199, 1, 375, 1, 1, 1, 1, 1),
(200, 1, 376, 1, 1, 1, 1, 1),
(201, 1, 377, 1, 1, 1, 1, 1),
(202, 1, 378, 1, 1, 1, 1, 1),
(203, 1, 379, 1, 1, 1, 1, 1),
(204, 1, 380, 1, 1, 1, 1, 1),
(205, 1, 381, 1, 1, 1, 1, 1),
(206, 1, 382, 1, 1, 1, 1, 1),
(207, 1, 383, 1, 1, 1, 1, 1),
(208, 1, 384, 1, 1, 1, 1, 1),
(209, 1, 385, 1, 1, 1, 1, 1),
(210, 1, 386, 1, 1, 1, 1, 1),
(220, 7, 365, 1, 1, 1, 1, 1),
(221, 7, 366, 1, 1, 1, 1, 1),
(222, 7, 367, 1, 1, 1, 1, 1),
(223, 7, 368, 1, 1, 1, 1, 1),
(224, 7, 383, 1, 1, 1, 1, 1),
(225, 7, 385, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_seats`
--

CREATE TABLE `tk_cbs_seats` (
  `id` int(10) UNSIGNED NOT NULL,
  `venue_id` int(10) UNSIGNED DEFAULT NULL,
  `width` smallint(5) UNSIGNED DEFAULT NULL,
  `height` smallint(5) UNSIGNED DEFAULT NULL,
  `top` smallint(5) UNSIGNED DEFAULT NULL,
  `left` smallint(5) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `seats` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_seats`
--

INSERT INTO `tk_cbs_seats` (`id`, `venue_id`, `width`, `height`, `top`, `left`, `name`, `seats`) VALUES
(1584, 39, 3, 2, 209, 119, '102, A1', 1),
(1585, 39, 3, 2, 215, 118, '102, A3', 1),
(1586, 39, 3, 2, 221, 119, '102, A5', 1),
(1587, 39, 3, 2, 288, 423, '1587', 1),
(1588, 39, 3, 2, 297, 435, '1588', 1),
(1589, 39, 3, 2, 290, 434, '1589', 1),
(1590, 39, 3, 2, 295, 419, '1590', 1),
(1591, 39, 3, 2, 311, 418, '1591', 1),
(1592, 39, 3, 2, 320, 421, '1592', 1),
(1593, 39, 3, 2, 258, 408, '1593', 1),
(1594, 39, 3, 2, 265, 408, '1594', 1),
(1595, 39, 3, 2, 272, 409, '1595', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_shows`
--

CREATE TABLE `tk_cbs_shows` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `venue_id` int(10) UNSIGNED NOT NULL,
  `price_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_shows`
--

INSERT INTO `tk_cbs_shows` (`id`, `event_id`, `venue_id`, `price_id`, `price`, `date_time`, `deleted_at`) VALUES
(40, 14, 39, 25, '20.00', '2019-11-30 11:00:00', NULL),
(41, 25, 39, 27, '50.00', '2019-12-02 00:00:00', NULL),
(42, 24, 39, 31, '20.00', '2019-12-01 01:00:00', NULL),
(43, 26, 39, 31, '20.00', '2020-01-01 00:00:00', NULL),
(44, 31, 39, 31, NULL, '2019-11-08 19:00:00', NULL),
(45, 34, 39, 31, NULL, '2020-01-01 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_shows_seats`
--

CREATE TABLE `tk_cbs_shows_seats` (
  `show_id` int(10) UNSIGNED NOT NULL,
  `seat_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_shows_seats`
--

INSERT INTO `tk_cbs_shows_seats` (`show_id`, `seat_id`) VALUES
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(2, 94),
(2, 95),
(3, 84),
(3, 85),
(3, 86),
(3, 87),
(3, 88),
(3, 89),
(3, 90),
(3, 91),
(3, 92),
(3, 93),
(3, 94),
(3, 95),
(4, 84),
(4, 85),
(4, 86),
(4, 87),
(4, 88),
(4, 89),
(4, 90),
(4, 91),
(4, 92),
(4, 93),
(4, 94),
(4, 95),
(5, 84),
(5, 85),
(5, 86),
(5, 87),
(5, 88),
(5, 89),
(5, 90),
(5, 91),
(5, 92),
(5, 93),
(5, 94),
(5, 95),
(6, 84),
(6, 85),
(6, 86),
(6, 87),
(6, 88),
(6, 89),
(6, 90),
(6, 91),
(6, 92),
(6, 93),
(6, 94),
(6, 95),
(7, 84),
(7, 85),
(7, 86),
(7, 87),
(7, 88),
(7, 89),
(7, 90),
(7, 91),
(7, 92),
(7, 93),
(7, 94),
(7, 95),
(9, 1190),
(9, 1191),
(9, 1192),
(9, 1193),
(9, 1194),
(9, 1195),
(9, 1196),
(9, 1197),
(9, 1198),
(9, 1199),
(9, 1200),
(9, 1201),
(9, 1202),
(9, 1203),
(9, 1204),
(15, 1190),
(15, 1191),
(15, 1192),
(15, 1193),
(15, 1194),
(15, 1195),
(15, 1196),
(15, 1197),
(15, 1198),
(15, 1199),
(15, 1200),
(15, 1201),
(15, 1202),
(15, 1203),
(15, 1204),
(18, 182),
(18, 183),
(18, 184),
(18, 185),
(18, 186),
(18, 187),
(18, 188),
(18, 189),
(18, 190),
(18, 191),
(18, 192),
(18, 193),
(18, 194),
(18, 195),
(18, 196),
(18, 197),
(18, 198),
(18, 199),
(18, 200),
(18, 201),
(18, 202),
(18, 203),
(18, 204),
(18, 205),
(18, 206),
(18, 207),
(18, 208),
(18, 209),
(18, 210),
(18, 211),
(18, 212),
(18, 213),
(19, 182),
(19, 183),
(19, 184),
(19, 185),
(19, 186),
(19, 187),
(19, 188),
(19, 189),
(19, 190),
(19, 191),
(19, 192),
(19, 193),
(19, 194),
(19, 195),
(19, 196),
(19, 197),
(19, 198),
(19, 199),
(19, 200),
(19, 201),
(19, 202),
(19, 203),
(19, 204),
(19, 205),
(19, 206),
(19, 207),
(19, 208),
(19, 209),
(19, 210),
(19, 211),
(19, 212),
(19, 213),
(23, 1193),
(23, 1194),
(23, 1195),
(24, 1190),
(24, 1191),
(24, 1192),
(26, 1188),
(26, 1189),
(29, 1431),
(29, 1514),
(29, 1552),
(30, 1553),
(30, 1554),
(30, 1555),
(31, 1556),
(31, 1557),
(31, 1558),
(31, 1559),
(33, 1574),
(34, 1575),
(34, 1576),
(34, 1577),
(35, 1578),
(36, 1579),
(37, 1580),
(38, 1581),
(39, 1582),
(39, 1583),
(40, 1584),
(41, 1585),
(42, 1584);

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_sliders`
--

CREATE TABLE `tk_cbs_sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `slider_image` varchar(255) DEFAULT NULL,
  `slider_link` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_sliders`
--

INSERT INTO `tk_cbs_sliders` (`id`, `slider_image`, `slider_link`, `created`, `status`) VALUES
(2, 'app/web/upload/slider_images/2_cb25b3599cf55c5e2788dece0a7b1ed5.jpg', 'http://103.121.156.221/projects/booking/', '2019-07-16 12:57:25', 'T'),
(3, 'app/web/upload/slider_images/3_9a8503faade10b179560937d5fc07a27.jpg', '#', '2019-08-28 18:00:06', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_sponsors`
--

CREATE TABLE `tk_cbs_sponsors` (
  `id` int(10) UNSIGNED NOT NULL,
  `sponsor_image` varchar(255) DEFAULT NULL,
  `sponsor_link` varchar(255) DEFAULT NULL,
  `sponsor_year` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_sponsors`
--

INSERT INTO `tk_cbs_sponsors` (`id`, `sponsor_image`, `sponsor_link`, `sponsor_year`, `created`, `status`) VALUES
(1, 'app/web/upload/sponsor_images/1_47cdc0b917ec96277bdb1f81b3333b2b.png', 'https://www.rotana.net', '2019', '2019-07-19 15:58:32', 'T'),
(2, 'app/web/upload/sponsor_images/2_a3df000286ce9cc77de913a219ed7594.png', 'http://www.egyptair.com/', '2019', '2019-07-19 15:59:48', 'T'),
(3, 'app/web/upload/sponsor_images/3_eff383b32ee1c021a8efaebeafcb4ab8.png', 'https://www.globalgala.com/', '2018', '2019-07-19 16:45:40', 'T'),
(4, 'app/web/upload/sponsor_images/4_e2aceb319d85229b0f574a7add88e230.jpg', 'https://www.globalgala.com', '2018', '2019-07-19 17:28:29', 'T'),
(5, 'app/web/upload/sponsor_images/5_2af5445f9b5382374a9a23e66b6c1450.jpg', '#', '2019', '2019-08-28 18:01:16', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_subscribers`
--

CREATE TABLE `tk_cbs_subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `gender` enum('F','M') DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country_id` int(10) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `subscribed` enum('T','F') DEFAULT 'F',
  `ip` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_subscribers`
--

INSERT INTO `tk_cbs_subscribers` (`id`, `first_name`, `last_name`, `email`, `phone`, `website`, `gender`, `age`, `birthday`, `address`, `city`, `state`, `country_id`, `zip`, `company_name`, `subscribed`, `ip`, `modified`, `created`) VALUES
(1, 'Basudev MOndal', NULL, 'basudev@astutemyndz.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T', '103.121.156.219', '2019-07-19 17:50:18', '2019-07-17 09:00:00'),
(2, 'Rakesh Maity', NULL, 'rakesh@astutemyndz.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T', '103.121.156.219', NULL, '2019-07-18 16:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_users`
--

CREATE TABLE `tk_cbs_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` blob DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T',
  `is_active` enum('T','F') NOT NULL DEFAULT 'F',
  `ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_users`
--

INSERT INTO `tk_cbs_users` (`id`, `role_id`, `email`, `password`, `name`, `phone`, `created`, `last_login`, `status`, `is_active`, `ip`) VALUES
(1, 1, 'admin@admin.com', 0xfc5a0fec65c89132b49448b690ce9022, 'Administrator', NULL, '2019-06-26 14:16:24', '2019-11-06 15:32:12', 'T', 'T', '::1'),
(3, 7, 'basu@gmail.com', 0xee690420c97758bccb2ec3cf472358c8, 'Basudev MOndal', NULL, '2019-07-08 14:37:48', '2019-09-10 17:01:30', 'T', 'T', '103.120.188.123'),
(5, 7, 'rakesh@astutemyndz.com', 0x23b67fc3d16115bccd6b0603a8076370, 'Rakesh', '1236598596', '2019-08-07 12:40:52', '2019-08-08 17:33:35', 'T', 'T', '103.121.156.219');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_venues`
--

CREATE TABLE `tk_cbs_venues` (
  `id` int(10) UNSIGNED NOT NULL,
  `map_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `map_name` varchar(255) DEFAULT NULL,
  `seats_count` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_cbs_venues`
--

INSERT INTO `tk_cbs_venues` (`id`, `map_path`, `mime_type`, `map_name`, `seats_count`, `status`) VALUES
(39, 'app/web/upload/maps/39_12a616510d87f5fb1394a26d4f12b3e4.jpg', 'image/jpeg', '12_c812034b868d6d539fbf3a856cafab60.jpg', 12, 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_cbs_video`
--

CREATE TABLE `tk_cbs_video` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(155) NOT NULL,
  `mime_type` varchar(155) NOT NULL,
  `created` datetime DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_cbs_video`
--

INSERT INTO `tk_cbs_video` (`id`, `video_path`, `file_name`, `mime_type`, `created`, `status`) VALUES
(1, 'app/web/upload/home_video/d7e2d52889148bb1008146f40075b80f.mp4', 'FULL.mp4', 'video/mp4', '2019-07-26 15:20:57', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tk_countries`
--

CREATE TABLE `tk_countries` (
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `countryName` varchar(52) NOT NULL DEFAULT '',
  `localName` varchar(45) NOT NULL,
  `webCode` varchar(2) NOT NULL,
  `region` varchar(26) NOT NULL,
  `continent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL,
  `latitude` double NOT NULL DEFAULT 0,
  `longitude` double NOT NULL DEFAULT 0,
  `surfaceArea` float(10,2) NOT NULL DEFAULT 0.00,
  `population` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tk_countries`
--

INSERT INTO `tk_countries` (`countryID`, `countryName`, `localName`, `webCode`, `region`, `continent`, `latitude`, `longitude`, `surfaceArea`, `population`) VALUES
('BRA', 'Brazil', 'Brasil', 'BR', 'South America', 'South America', -10, -55, 8547403.00, 170115000),
('CHN', 'China', 'Zhongquo', 'CN', 'Eastern Asia', 'Asia', 35, 105, 9572900.00, 1277558000),
('FRA', 'France', '', 'FR', 'Western Europe', 'Europe', 47, 2, 551500.00, 59225700),
('IND', 'India', 'Bharat/India', 'IN', 'Southern and Central Asia', 'Asia', 28.47, 77.03, 3287263.00, 1013662000),
('USA', 'USA', 'United States', 'US', 'North America', 'North America', 38, -97, 9363520.00, 278357000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `user_type` int(10) NOT NULL DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `on_deleted` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `first_name`, `last_name`, `email`, `username`, `salt`, `password`, `slug`, `activation_code`, `last_login`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `active`, `user_type`, `created_at`, `updated_at`, `on_deleted`) VALUES
(15, '103.120.188.123', 'Rakesh', 'Maity', 'rakesh@gmail.com', 'rakesh@gmail.com', NULL, '$2y$08$jSQ6e32d16GWCDgJ2PuGm.Cu8MetpNdxvD6lOu5hnTddYnfRn8vQ.', '', NULL, 1565353746, NULL, NULL, NULL, 1562687697, 1, 2, '2019-07-09 15:54:57', '2019-08-09 12:29:06', NULL),
(16, '103.120.188.123', 'Test', 'test', 'test@gmail.com', 'test@gmail.com', NULL, '$2y$08$3/kOqnwz.tid8EFG4ormpuP/Q.Q23bqNKlhcjYec9k2NcKwj33Aty', '', NULL, 1564154337, NULL, NULL, NULL, 1562755110, 1, 2, '2019-07-10 10:38:30', '2019-07-26 15:18:57', NULL),
(17, '103.121.156.219', 'saran', 'maity', 'saran@gmail.com', 'saran123', NULL, '$2y$08$0f2AZJ5Kb1DpIkQL1RTvAeYaPhsogu8weLl7HtSSYn.Y5CxPdVv.q', '', NULL, 1564156720, NULL, NULL, 'FMurwiFPIlUpWmSiSFaTdu', 1564156411, 1, 2, '2019-07-26 15:53:31', '2019-07-26 15:58:40', NULL),
(18, '103.121.156.219', 'Basudev', 'Mondal', 'basudev@astutemyndz.com', 'basu', NULL, '$2y$08$MA0qy4c0WnobSCQ.55G7xezAoVoUQfgH11SbvY6EKlvgTsgP5OvCO', '', NULL, 1565085645, NULL, NULL, NULL, 1565085619, 1, 2, '2019-08-06 10:00:19', '2019-08-06 10:00:45', NULL),
(19, '103.121.156.219', 'Basudev', 'Mondal', 'basu.web89@gmail.com', 'testbasu', NULL, '$2y$08$TyNdUVHyv9KwcPaTuLybOORiVp2p1tl2g0g1E6BsscXn39xSNEnI2', '', NULL, 1565267776, NULL, NULL, NULL, 1565267604, 1, 2, '2019-08-08 12:33:24', '2019-08-08 12:36:16', NULL),
(20, '103.121.156.219', 'test', 'test', 'test3@gmail.com', 'test3', NULL, '$2y$08$fhxTHLdBDQ2j8vHML0GYqehIB49YmazDJi4q.BWPEIlDiRWDqhAKS', '', NULL, NULL, NULL, NULL, NULL, 1565268230, 1, 2, '2019-08-08 12:43:50', NULL, NULL),
(21, '103.121.156.219', 'test4', 'test4', 'test4@gmail.com', 'test4', NULL, '$2y$08$EK92t1pmnILsj3jRJgbo4.08/4ONzXpqw0YKq3s3/nn9PBjV/bsP2', '', NULL, NULL, NULL, NULL, NULL, 1565268713, 1, 2, '2019-08-08 12:51:53', NULL, NULL),
(22, '103.121.156.219', 'test', 'test', 'test1@gmail.com', 'ttte', NULL, '$2y$08$IqMh8bkA14x9o.JFZnpEXOOAb238UQku53FKgdMvBgD1RfrMvi6cK', '', NULL, NULL, NULL, NULL, NULL, 1565270232, 1, 2, '2019-08-08 13:17:12', NULL, NULL),
(23, '103.121.156.219', 'test', 'test', 'test12@gmail.com', 'ttte123', NULL, '$2y$08$5gUR.unViptD3lLxrcsEaeUCFoN73CqxWTauJaCf43QTryLdZqABq', '', NULL, NULL, NULL, NULL, NULL, 1565270279, 1, 2, '2019-08-08 13:17:59', NULL, NULL),
(24, '103.121.156.219', 'asd', 'asd', 'as@as.in', 'asd', NULL, '$2y$08$W69KTxqg7LdISQ0cPjEEvul1PUDz4DCZ8.7ZXpocADxOHQb8I6WCu', '', NULL, NULL, NULL, NULL, NULL, 1565270324, 1, 2, '2019-08-08 13:18:44', NULL, NULL),
(25, '103.121.156.219', 'test5', 'test5', 'test5@gmail.com', 'test5', NULL, '$2y$08$wwNVwn.AvYTwsX3olruiMeEsE3UB4RB.yFth1d9AJ/reLcgc8Y42m', '', NULL, NULL, NULL, NULL, NULL, 1565277963, 1, 2, '2019-08-08 15:26:03', NULL, NULL),
(26, '103.121.156.219', 'test6', 'test6', 'test6@gmail.com', 'test6', NULL, '$2y$08$Pq.CHKR3U1xdl3TDJ5XXW.VPv4/7GGKoUYzfUmBQXyNwtQiCMFxAW', '', NULL, NULL, NULL, NULL, NULL, 1565278307, 1, 2, '2019-08-08 15:31:47', NULL, NULL),
(27, '103.121.156.219', 'test6', 'test6', 'test7@gmail.com', 'test7', NULL, '$2y$08$wBDO6Qf866lQNQ9w2m2Lu.R6IaibQichmjxS1/DFRt6SQHnk7UqIS', '', NULL, NULL, NULL, NULL, NULL, 1565278338, 1, 2, '2019-08-08 15:32:18', NULL, NULL),
(28, '103.121.156.219', 'andranil', 'mondal', 'indranil@gmail.com', 'indranil', NULL, '$2y$08$2DwF.FIyZdG4FMup0768O.wHP4AryRWIY2E8Y0vaJ4TzNRaDTB2cm', '', NULL, 1567684100, NULL, NULL, NULL, 1565335858, 1, 2, '2019-08-09 07:30:59', '2019-09-05 11:48:20', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_advertisements`
--
ALTER TABLE `tk_cbs_advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_artists`
--
ALTER TABLE `tk_cbs_artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_bookings`
--
ALTER TABLE `tk_cbs_bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `tk_cbs_bookings_payments`
--
ALTER TABLE `tk_cbs_bookings_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tk_cbs_bookings_shows`
--
ALTER TABLE `tk_cbs_bookings_shows`
  ADD PRIMARY KEY (`show_id`,`seat_id`,`booking_id`),
  ADD KEY `show_id` (`show_id`),
  ADD KEY `seat_id` (`seat_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `tk_cbs_bookings_tickets`
--
ALTER TABLE `tk_cbs_bookings_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `price_id` (`price_id`),
  ADD KEY `seat_id` (`seat_id`);

--
-- Indexes for table `tk_cbs_bookings_users`
--
ALTER TABLE `tk_cbs_bookings_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_cms`
--
ALTER TABLE `tk_cbs_cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_customers`
--
ALTER TABLE `tk_cbs_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `tk_cbs_customer_groups`
--
ALTER TABLE `tk_cbs_customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`tk_cbs_customers_id`,`tk_cbs_roles_id`),
  ADD KEY `fk_users_groups_users1_idx` (`tk_cbs_customers_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`tk_cbs_roles_id`);

--
-- Indexes for table `tk_cbs_customer_requests`
--
ALTER TABLE `tk_cbs_customer_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_documents`
--
ALTER TABLE `tk_cbs_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_events`
--
ALTER TABLE `tk_cbs_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_fields`
--
ALTER TABLE `tk_cbs_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `tk_cbs_groups`
--
ALTER TABLE `tk_cbs_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tk_cbs_groups_subscribers`
--
ALTER TABLE `tk_cbs_groups_subscribers`
  ADD PRIMARY KEY (`group_id`,`subscriber_id`),
  ADD UNIQUE KEY `group_id` (`group_id`,`subscriber_id`);

--
-- Indexes for table `tk_cbs_image_galleries`
--
ALTER TABLE `tk_cbs_image_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_marks`
--
ALTER TABLE `tk_cbs_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_messages`
--
ALTER TABLE `tk_cbs_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tk_cbs_modules`
--
ALTER TABLE `tk_cbs_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_multi_lang`
--
ALTER TABLE `tk_cbs_multi_lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `foreign_id` (`foreign_id`,`model`,`locale`,`field`);

--
-- Indexes for table `tk_cbs_options`
--
ALTER TABLE `tk_cbs_options`
  ADD PRIMARY KEY (`foreign_id`,`key`);

--
-- Indexes for table `tk_cbs_password`
--
ALTER TABLE `tk_cbs_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_plugin_country`
--
ALTER TABLE `tk_cbs_plugin_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alpha_2` (`alpha_2`),
  ADD UNIQUE KEY `alpha_3` (`alpha_3`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tk_cbs_plugin_invoice`
--
ALTER TABLE `tk_cbs_plugin_invoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `foreign_id` (`foreign_id`);

--
-- Indexes for table `tk_cbs_plugin_invoice_config`
--
ALTER TABLE `tk_cbs_plugin_invoice_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_plugin_invoice_items`
--
ALTER TABLE `tk_cbs_plugin_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `tk_cbs_plugin_locale`
--
ALTER TABLE `tk_cbs_plugin_locale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `language_iso` (`language_iso`);

--
-- Indexes for table `tk_cbs_plugin_locale_languages`
--
ALTER TABLE `tk_cbs_plugin_locale_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso` (`iso`);

--
-- Indexes for table `tk_cbs_plugin_log`
--
ALTER TABLE `tk_cbs_plugin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_plugin_log_config`
--
ALTER TABLE `tk_cbs_plugin_log_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_plugin_one_admin`
--
ALTER TABLE `tk_cbs_plugin_one_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_plugin_paypal`
--
ALTER TABLE `tk_cbs_plugin_paypal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fid` (`foreign_id`,`subscr_id`,`txn_id`,`txn_type`),
  ADD UNIQUE KEY `txn_id` (`txn_id`);

--
-- Indexes for table `tk_cbs_plugin_sms`
--
ALTER TABLE `tk_cbs_plugin_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_prices`
--
ALTER TABLE `tk_cbs_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `tk_cbs_queues`
--
ALTER TABLE `tk_cbs_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_roles`
--
ALTER TABLE `tk_cbs_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tk_cbs_role_acls`
--
ALTER TABLE `tk_cbs_role_acls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_seats`
--
ALTER TABLE `tk_cbs_seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- Indexes for table `tk_cbs_shows`
--
ALTER TABLE `tk_cbs_shows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `venue_id` (`venue_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `tk_cbs_shows_seats`
--
ALTER TABLE `tk_cbs_shows_seats`
  ADD PRIMARY KEY (`show_id`,`seat_id`),
  ADD KEY `show_id` (`show_id`),
  ADD KEY `seat_id` (`seat_id`);

--
-- Indexes for table `tk_cbs_sliders`
--
ALTER TABLE `tk_cbs_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_sponsors`
--
ALTER TABLE `tk_cbs_sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_subscribers`
--
ALTER TABLE `tk_cbs_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_users`
--
ALTER TABLE `tk_cbs_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tk_cbs_venues`
--
ALTER TABLE `tk_cbs_venues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_cbs_video`
--
ALTER TABLE `tk_cbs_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tk_countries`
--
ALTER TABLE `tk_countries`
  ADD PRIMARY KEY (`countryID`),
  ADD UNIQUE KEY `webCode` (`webCode`),
  ADD UNIQUE KEY `countryName` (`countryName`),
  ADD KEY `region` (`region`),
  ADD KEY `continent` (`continent`),
  ADD KEY `population` (`population`),
  ADD KEY `surfaceArea` (`surfaceArea`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `tk_cbs_advertisements`
--
ALTER TABLE `tk_cbs_advertisements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tk_cbs_artists`
--
ALTER TABLE `tk_cbs_artists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tk_cbs_bookings`
--
ALTER TABLE `tk_cbs_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `tk_cbs_bookings_payments`
--
ALTER TABLE `tk_cbs_bookings_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_bookings_tickets`
--
ALTER TABLE `tk_cbs_bookings_tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=752;

--
-- AUTO_INCREMENT for table `tk_cbs_bookings_users`
--
ALTER TABLE `tk_cbs_bookings_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tk_cbs_cms`
--
ALTER TABLE `tk_cbs_cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tk_cbs_customers`
--
ALTER TABLE `tk_cbs_customers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tk_cbs_customer_groups`
--
ALTER TABLE `tk_cbs_customer_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tk_cbs_customer_requests`
--
ALTER TABLE `tk_cbs_customer_requests`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_documents`
--
ALTER TABLE `tk_cbs_documents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tk_cbs_events`
--
ALTER TABLE `tk_cbs_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tk_cbs_fields`
--
ALTER TABLE `tk_cbs_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2457;

--
-- AUTO_INCREMENT for table `tk_cbs_groups`
--
ALTER TABLE `tk_cbs_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tk_cbs_image_galleries`
--
ALTER TABLE `tk_cbs_image_galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tk_cbs_marks`
--
ALTER TABLE `tk_cbs_marks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tk_cbs_messages`
--
ALTER TABLE `tk_cbs_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tk_cbs_modules`
--
ALTER TABLE `tk_cbs_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT for table `tk_cbs_multi_lang`
--
ALTER TABLE `tk_cbs_multi_lang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14121;

--
-- AUTO_INCREMENT for table `tk_cbs_password`
--
ALTER TABLE `tk_cbs_password`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_country`
--
ALTER TABLE `tk_cbs_plugin_country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_invoice`
--
ALTER TABLE `tk_cbs_plugin_invoice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_invoice_config`
--
ALTER TABLE `tk_cbs_plugin_invoice_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_invoice_items`
--
ALTER TABLE `tk_cbs_plugin_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_locale`
--
ALTER TABLE `tk_cbs_plugin_locale`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_locale_languages`
--
ALTER TABLE `tk_cbs_plugin_locale_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_log`
--
ALTER TABLE `tk_cbs_plugin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_log_config`
--
ALTER TABLE `tk_cbs_plugin_log_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_one_admin`
--
ALTER TABLE `tk_cbs_plugin_one_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_paypal`
--
ALTER TABLE `tk_cbs_plugin_paypal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_plugin_sms`
--
ALTER TABLE `tk_cbs_plugin_sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_prices`
--
ALTER TABLE `tk_cbs_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tk_cbs_queues`
--
ALTER TABLE `tk_cbs_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tk_cbs_roles`
--
ALTER TABLE `tk_cbs_roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tk_cbs_role_acls`
--
ALTER TABLE `tk_cbs_role_acls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `tk_cbs_seats`
--
ALTER TABLE `tk_cbs_seats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1596;

--
-- AUTO_INCREMENT for table `tk_cbs_shows`
--
ALTER TABLE `tk_cbs_shows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tk_cbs_sliders`
--
ALTER TABLE `tk_cbs_sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tk_cbs_sponsors`
--
ALTER TABLE `tk_cbs_sponsors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tk_cbs_subscribers`
--
ALTER TABLE `tk_cbs_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tk_cbs_users`
--
ALTER TABLE `tk_cbs_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tk_cbs_venues`
--
ALTER TABLE `tk_cbs_venues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tk_cbs_video`
--
ALTER TABLE `tk_cbs_video`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
