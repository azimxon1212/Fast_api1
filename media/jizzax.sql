-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2023 at 05:07 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jizzax`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternative_component`
--

CREATE TABLE `alternative_component` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `for_id` int(11) NOT NULL,
  `value` double NOT NULL,
  `filial_id` int(11) NOT NULL,
  `utilizing` tinyint(1) NOT NULL,
  `type` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alternative_component`
--

INSERT INTO `alternative_component` (`id`, `item_id`, `for_id`, `value`, `filial_id`, `utilizing`, `type`) VALUES
(1, 6, 1, 20, 1, 1, 'homashyo'),
(2, 9, 2, 1.6, 1, 1, 'homashyo');

-- --------------------------------------------------------

--
-- Table structure for table `asosiy_vosita`
--

CREATE TABLE `asosiy_vosita` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cost` double NOT NULL,
  `filial_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asosiy_vosita`
--

INSERT INTO `asosiy_vosita` (`id`, `name`, `cost`, `filial_id`, `date`) VALUES
(1, 'Stol-Stullar', 45777, 0, '2022-09-24 21:54:21'),
(2, 'LolaJon', 78210001, 1, '2022-10-15 18:14:00'),
(3, 'Zavod 01', 7800000, 1, '2022-10-12 15:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(111) NOT NULL,
  `name` varchar(111) COLLATE utf8_unicode_ci NOT NULL,
  `balance` double NOT NULL,
  `user_id` int(111) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `name`, `balance`, `user_id`, `date`) VALUES
(1, 'Hamkorbank', 537000, 0, '2022-10-23 09:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `bot_chat`
--

CREATE TABLE `bot_chat` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `login` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `buyurtma`
--

CREATE TABLE `buyurtma` (
  `id` int(11) NOT NULL,
  `costumer_id` int(115) NOT NULL,
  `b_user_id` int(255) NOT NULL,
  `top_user_id` int(255) NOT NULL,
  `transport_user_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `type_product_id` int(222) NOT NULL,
  `value` double NOT NULL,
  `top_value` double NOT NULL,
  `ombor_value` double NOT NULL,
  `transport_value` double NOT NULL,
  `topshirildi_value` double NOT NULL,
  `date` datetime NOT NULL,
  `top_sana` date NOT NULL,
  `narx` int(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `yetkazish` tinyint(4) NOT NULL,
  `tannarx` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buyurtma`
--

INSERT INTO `buyurtma` (`id`, `costumer_id`, `b_user_id`, `top_user_id`, `transport_user_id`, `product_id`, `type_product_id`, `value`, `top_value`, `ombor_value`, `transport_value`, `topshirildi_value`, `date`, `top_sana`, `narx`, `sort`, `filial_id`, `yetkazish`, `tannarx`) VALUES
(1, 2, 2, 0, 0, 2, 1, 54, 8, 7, 0, 0, '2022-10-26 22:39:44', '2022-10-26', 350000, 1, 1, 0, 0),
(2, 3, 2, 0, 0, 1, 1, 23, 0, 5, 0, 16, '2022-10-27 09:52:45', '2022-11-04', 150000, 1, 1, 0, 0),
(3, 1, 2, 0, 0, 1, 1, 10, 0, 10, 0, 0, '2022-10-27 12:25:59', '2022-10-27', 150000, 1, 1, 0, 0),
(4, 1, 2, 0, 0, 2, 1, 20, 10, 0, 0, 0, '2022-10-27 12:26:21', '2022-11-17', 350000, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `buyurtma_transfer`
--

CREATE TABLE `buyurtma_transfer` (
  `id` int(11) NOT NULL,
  `buyurtma_id` int(11) NOT NULL,
  `from_costumer_id` int(11) NOT NULL,
  `to_costumer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buyurtma_transfer`
--

INSERT INTO `buyurtma_transfer` (`id`, `buyurtma_id`, `from_costumer_id`, `to_costumer_id`, `user_id`, `filial_id`, `date`) VALUES
(1, 2, 2, 1, 2, 1, '2022-10-19 15:52:51'),
(2, 2, 1, 2, 2, 1, '2022-10-19 16:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `cashback`
--

CREATE TABLE `cashback` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `disabled` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cashback`
--

INSERT INTO `cashback` (`id`, `product_id`, `value`, `customer_id`, `disabled`) VALUES
(1, 1, 78, 1, 1),
(2, 2, 16, 2, 1),
(3, 2, 25, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cashback_history`
--

CREATE TABLE `cashback_history` (
  `id` int(11) NOT NULL,
  `cashback_id` int(11) NOT NULL,
  `value` double NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `buyurtma_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cashback_history`
--

INSERT INTO `cashback_history` (`id`, `cashback_id`, `value`, `product_id`, `date`, `buyurtma_id`, `customer_id`) VALUES
(1, 3, 25, 2, '2022-10-19 16:44:31', 8, 1),
(2, 3, 25, 2, '2022-10-25 14:55:25', 9, 1),
(3, 3, 25, 2, '2022-10-25 20:54:16', 10, 1),
(4, 3, 25, 2, '2022-10-25 21:13:34', 11, 1),
(5, 3, 25, 2, '2022-10-27 12:26:21', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chiqim`
--

CREATE TABLE `chiqim` (
  `id` int(11) NOT NULL,
  `name` varchar(115) NOT NULL,
  `izoh` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `tolov_turi` varchar(111) NOT NULL,
  `coast` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `manba_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chiqim`
--

INSERT INTO `chiqim` (`id`, `name`, `izoh`, `type`, `tolov_turi`, `coast`, `date`, `user_id`, `filial_id`, `manba_id`) VALUES
(1, '1', 'Podarka berildi', 6, 'naqd', 14000, '2022-10-20 10:28:41', 2, 1, 1),
(2, '7', 'Mapsj berildi', 2, 'naqd', 145000, '2022-10-20 10:30:26', 2, 1, 1),
(3, '1', 'uygef', 1, 'naqd', 1000, '2022-10-23 08:46:13', 2, 1, 1),
(4, '1', 'qwqw', 1, 'otkazma', 50000, '2022-10-23 09:26:15', 2, 1, 1),
(5, '2', 'sDV', 5, 'naqd', 340000, '2022-10-23 16:31:58', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `costumer`
--

CREATE TABLE `costumer` (
  `id` int(11) NOT NULL,
  `top_sana` date NOT NULL,
  `filial_id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `address_orienter` text DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `cashback_balance` double NOT NULL,
  `nas_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `costumer_turi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `costumer`
--

INSERT INTO `costumer` (`id`, `top_sana`, `filial_id`, `name`, `date`, `phone`, `status`, `address`, `address_orienter`, `balance`, `cashback_balance`, `nas_date`, `user_id`, `costumer_turi`) VALUES
(1, '2022-11-17', 1, 'Husniddin', '2022-09-26', '913381679', 'show', 'Margilan', 'Sarmazor', 0, 0, '2022-09-26', 2, ''),
(2, '2022-10-26', 1, 'Yusufjon Ahemdov ', '2022-09-29', '913253395', 'show', 'Marg`ilon ', 'Baland masjid mfy', 2147143647, 20000, '2022-10-23', 3, ''),
(3, '2022-11-04', 1, 'Abdusamad', '2022-10-27', '913260330', 'show', 'test', 'test', -450000, 0, '2022-10-27', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `davomat`
--

CREATE TABLE `davomat` (
  `id` int(11) NOT NULL,
  `type` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `maosh` double NOT NULL,
  `fingerprint_id` int(11) NOT NULL,
  `sanavaqt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `davomat`
--

INSERT INTO `davomat` (`id`, `type`, `user_id`, `filial_id`, `maosh`, `fingerprint_id`, `sanavaqt`) VALUES
(37, 'entry', 3, 1, 0, 0, '2022-11-03 15:43:22'),
(38, 'entry', 4, 1, 0, 0, '2022-11-03 15:43:40'),
(39, 'entry', 5, 1, 0, 0, '2022-11-03 15:43:40'),
(40, 'exit', 3, 1, 0, 0, '2022-11-03 15:43:45'),
(41, 'exit', 4, 1, 0, 0, '2022-11-03 15:43:45'),
(42, 'exit', 5, 1, -203.92916666667, 0, '2022-11-03 15:43:45'),
(43, 'entry', 3, 1, 0, 2, '2022-11-03 16:42:25'),
(44, 'exit', 3, 1, 0, 2, '2022-11-03 16:42:57'),
(45, 'entry', 3, 1, 0, 2, '2022-11-03 16:43:18'),
(46, 'exit', 3, 1, 0, 1, '2022-11-03 16:52:02'),
(47, 'entry', 3, 1, 0, 1, '2022-11-03 16:52:24'),
(48, 'exit', 3, 1, 0, 0, '2022-11-03 21:02:05'),
(49, 'entry', 6, 1, 0, 0, '2022-11-03 21:02:22'),
(50, 'entry', 3, 1, 0, 0, '2022-11-03 21:03:20'),
(51, 'entry', 4, 1, 0, 0, '2022-11-03 21:03:20'),
(52, 'entry', 5, 1, 0, 0, '2022-11-03 21:03:20'),
(53, 'entry', 7, 1, 0, 0, '2022-11-03 21:03:20'),
(54, 'entry', 8, 1, 0, 0, '2022-11-03 21:03:20'),
(55, 'entry', 9, 1, 0, 0, '2022-11-03 21:03:20'),
(56, 'entry', 10, 1, 0, 0, '2022-11-03 21:03:20'),
(57, 'exit', 3, 1, 0, 0, '2022-11-03 21:03:30'),
(58, 'exit', 4, 1, 0, 0, '2022-11-03 21:03:30'),
(59, 'exit', 5, 1, -203.85833333333, 0, '2022-11-03 21:03:30'),
(60, 'exit', 6, 1, -39811.111111111, 0, '2022-11-03 21:03:30'),
(61, 'exit', 7, 1, -39972.222222222, 0, '2022-11-03 21:03:30'),
(62, 'exit', 8, 1, 0, 0, '2022-11-03 21:03:30'),
(63, 'exit', 9, 1, 0, 0, '2022-11-03 21:03:30'),
(64, 'exit', 10, 1, -39972.222222222, 0, '2022-11-03 21:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `emergency`
--

CREATE TABLE `emergency` (
  `id` int(11) NOT NULL,
  `seh_id` int(11) NOT NULL,
  `begin` datetime NOT NULL,
  `end` datetime NOT NULL,
  `comment` varchar(100) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emergency`
--

INSERT INTO `emergency` (`id`, `seh_id`, `begin`, `end`, `comment`, `filial_id`, `user_id`, `status`) VALUES
(1, 1, '2022-09-30 19:33:47', '2022-09-30 19:35:08', 'qwdqwd', 1, 3, 0),
(2, 1, '2022-09-30 20:29:22', '0000-00-00 00:00:00', '', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `finger`
--

CREATE TABLE `finger` (
  `id` int(11) NOT NULL,
  `hash_code` text NOT NULL,
  `finger_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `fingerprint_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finger`
--

INSERT INTO `finger` (`id`, `hash_code`, `finger_id`, `date`, `user_id`, `filial_id`, `fingerprint_id`) VALUES
(1, 'ewf849wefwe675wejfb', 1, '2022-11-03 16:21:03', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fingerprint`
--

CREATE TABLE `fingerprint` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fingerprint`
--

INSERT INTO `fingerprint` (`id`, `name`, `token`, `date`, `filial_id`) VALUES
(1, 'ESP 554 (Bosh darvoza)', 'wef89189fewHvuj498er8er***fwev9999', '2022-11-02 11:55:47', 1),
(2, 'Ikkinchi darvoza', 'wef89189fewHvuj498==qwd9977***fwev99', '2022-11-02 11:58:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `founder`
--

CREATE TABLE `founder` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `founder`
--

INSERT INTO `founder` (`id`, `name`, `phone`) VALUES
(1, 'qffwqf', 945656655);

-- --------------------------------------------------------

--
-- Table structure for table `founder_share`
--

CREATE TABLE `founder_share` (
  `id` int(11) NOT NULL,
  `profit_share` double NOT NULL,
  `ownership_share` double NOT NULL,
  `founder_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hajm`
--

CREATE TABLE `hajm` (
  `id` int(11) NOT NULL,
  `value` double NOT NULL,
  `n_olchov_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `olchov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hajm`
--

INSERT INTO `hajm` (`id`, `value`, `n_olchov_id`, `product_id`, `olchov_id`) VALUES
(1, 5, 4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hikvisiondb`
--

CREATE TABLE `hikvisiondb` (
  `id` int(11) NOT NULL,
  `sanavaqt` varchar(50) NOT NULL,
  `sana` varchar(50) NOT NULL,
  `vaqt` varchar(50) NOT NULL,
  `yonalish` varchar(50) NOT NULL,
  `qurilma_nomi` varchar(50) NOT NULL,
  `qurilma_seriya_raqami` varchar(50) NOT NULL,
  `odam_ism` varchar(50) NOT NULL,
  `card_raqami` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `homashyo`
--

CREATE TABLE `homashyo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `olchov_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `bil_value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homashyo`
--

INSERT INTO `homashyo` (`id`, `name`, `olchov_id`, `filial_id`, `bil_value`) VALUES
(1, 'sement', 2, 1, 2),
(2, 'Armatura(12)', 1, 1, 100),
(3, 'Pesok', 1, 1, 6900),
(4, 'Dobavka', 2, 1, 69),
(5, 'Plastikchalar', 1, 1, 0),
(6, 'Rang', 2, 1, 0),
(7, 'Rangrr', 2, 1, 0),
(8, 'Sheben', 2, 1, 0),
(9, 'Armatura(16)', 1, 1, 1500),
(10, 'Sheben 1', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `homashyo_hajm`
--

CREATE TABLE `homashyo_hajm` (
  `id` int(11) NOT NULL,
  `value` double NOT NULL,
  `olchov_id` int(11) NOT NULL,
  `homashyo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homashyo_hajm`
--

INSERT INTO `homashyo_hajm` (`id`, `value`, `olchov_id`, `homashyo_id`) VALUES
(1, 54, 1, 7),
(2, 25, 3, 8),
(3, 10, 2, 2),
(4, 1, 1, 9),
(5, 2400, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `homashyo_ishlatilishi`
--

CREATE TABLE `homashyo_ishlatilishi` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `value` double NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(11) NOT NULL,
  `production_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homashyo_ishlatilishi`
--

INSERT INTO `homashyo_ishlatilishi` (`id`, `item_id`, `value`, `date`, `type`, `production_id`, `filial_id`, `user_id`) VALUES
(1, 3, 8.6, '2022-10-26 22:43:10', 'homashyo', 1, 1, 2),
(2, 3, 8.6, '2022-10-26 22:44:43', 'homashyo', 2, 1, 2),
(3, 1, 2, '2022-10-27 09:59:46', 'homashyo', 3, 1, 2),
(4, 3, 8.6, '2022-10-27 10:06:05', 'homashyo', 4, 1, 2),
(5, 1, 2, '2022-10-27 10:19:53', 'homashyo', 5, 1, 2),
(6, 1, 2, '2022-10-27 12:28:54', 'homashyo', 6, 1, 2),
(7, 1, 2, '2022-10-27 12:30:41', 'homashyo', 7, 1, 2),
(8, 3, 8.6, '2022-10-27 16:25:29', 'homashyo', 8, 1, 2),
(9, 3, 8.6, '2022-10-29 16:11:13', 'homashyo', 9, 1, 2),
(10, 3, 8.6, '2022-11-03 11:42:23', 'homashyo', 10, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `narx` double NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jarayon`
--

CREATE TABLE `jarayon` (
  `id` int(11) NOT NULL,
  `name` varchar(111) NOT NULL,
  `seh_id` int(11) NOT NULL,
  `kpi` double NOT NULL,
  `proche` double NOT NULL,
  `operator` double NOT NULL,
  `transport` double NOT NULL,
  `transport_type` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `before_id` int(11) NOT NULL,
  `after_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jarayon`
--

INSERT INTO `jarayon` (`id`, `name`, `seh_id`, `kpi`, `proche`, `operator`, `transport`, `transport_type`, `product_id`, `before_id`, `after_id`, `filial_id`) VALUES
(1, 'Quyish', 1, 25600, 7800, 5600, 0, '', 1, 0, 2, 1),
(2, 'Yig`ish', 2, 47000, 0, 0, 0, '', 1, 1, 0, 1),
(3, 'Quyish', 2, 3, 8000, 78000, 50000, 'inside', 2, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kassa`
--

CREATE TABLE `kassa` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `balance` double NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kassa`
--

INSERT INTO `kassa` (`id`, `name`, `filial_id`, `balance`, `date`) VALUES
(1, 'Bosh Kassa', 1, 0, '2022-09-27 15:12:47');

-- --------------------------------------------------------

--
-- Table structure for table `kassa_history`
--

CREATE TABLE `kassa_history` (
  `id` int(115) NOT NULL,
  `summa` int(255) NOT NULL,
  `user_id` int(115) NOT NULL,
  `kassachi_id` int(255) NOT NULL,
  `date` datetime NOT NULL,
  `filial_id` int(11) NOT NULL,
  `type` varchar(111) NOT NULL,
  `where_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kassa_history`
--

INSERT INTO `kassa_history` (`id`, `summa`, `user_id`, `kassachi_id`, `date`, `filial_id`, `type`, `where_id`) VALUES
(1, 587000, 2, 2, '2022-10-23 09:25:42', 1, 'otkazma', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kirim`
--

CREATE TABLE `kirim` (
  `id` int(11) NOT NULL,
  `summa` int(116) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `tolov_turi` varchar(115) NOT NULL,
  `costumer_id` int(255) NOT NULL,
  `status` varchar(222) NOT NULL,
  `kassachi_id` int(11) NOT NULL,
  `filial_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kirim`
--

INSERT INTO `kirim` (`id`, `summa`, `date`, `user_id`, `tolov_turi`, `costumer_id`, `status`, `kassachi_id`, `filial_id`) VALUES
(1, 10000, '2022-10-11 12:04:23', 7, 'naqd', 2, 'topshirish', 0, 1),
(2, 100000, '2022-10-13 12:10:09', 2, 'naqd', 2, 'ok', 2, 1),
(3, 25000, '2022-10-13 16:17:24', 1, 'naqd', 2, 'topshirish', 0, 1),
(4, 12500, '2022-10-19 12:03:02', 2, 'naqd', 2, 'topshirish', 0, 1),
(5, 550, '2022-10-22 19:21:17', 2, 'naqd', 2, 'topshirish', 0, 1),
(6, 587000, '2022-10-23 09:25:28', 2, 'otkazma', 2, 'ok', 2, 1),
(7, 2147483647, '2022-10-23 16:19:11', 2, 'naqd', 2, 'topshirish', 0, 1),
(8, 1950000, '2022-10-27 08:10:45', 2, 'naqd', 3, 'topshirish', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kommunal`
--

CREATE TABLE `kommunal` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `olchov_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kommunal`
--

INSERT INTO `kommunal` (`id`, `name`, `price`, `olchov_id`, `filial_id`) VALUES
(1, 'Elektr Energiya', 11000, 3, 1),
(2, 'Tabiiy Gas', 1200, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kpi`
--

CREATE TABLE `kpi` (
  `id` int(11) NOT NULL,
  `summa` double NOT NULL,
  `filial_id` int(11) NOT NULL,
  `sana` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  `for_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `landing`
--

CREATE TABLE `landing` (
  `id` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mahsulot_ombor`
--

CREATE TABLE `mahsulot_ombor` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qabul_hajm` double NOT NULL,
  `qabul_brak` double NOT NULL,
  `hajm` double NOT NULL,
  `brak_hajm` double NOT NULL,
  `tannarx` double NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `money_transfer`
--

CREATE TABLE `money_transfer` (
  `id` int(11) NOT NULL,
  `beruvchi_shot_id` int(11) NOT NULL,
  `oluvchi_shot_id` int(11) NOT NULL,
  `izoh` varchar(11) NOT NULL,
  `summa` double NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nasiya`
--

CREATE TABLE `nasiya` (
  `id` int(11) NOT NULL,
  `summa` int(255) NOT NULL,
  `costumer_id` int(115) NOT NULL,
  `ber_date` date NOT NULL,
  `ol_date` date NOT NULL,
  `user_id` int(255) NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nasiya`
--

INSERT INTO `nasiya` (`id`, `summa`, `costumer_id`, `ber_date`, `ol_date`, `user_id`, `filial_id`) VALUES
(1, 750000, 2, '2022-10-09', '2022-10-20', 3, 1),
(2, 150000, 2, '2022-10-09', '2022-10-09', 3, 1),
(3, 150000, 2, '2022-10-10', '2022-10-10', 3, 1),
(4, 50000, 2, '2022-10-13', '2022-10-20', 2, 1),
(5, 27150000, 2, '2022-10-16', '2022-10-16', 8, 1),
(6, 450000, 3, '2022-10-27', '2022-11-03', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nasiya_kechish`
--

CREATE TABLE `nasiya_kechish` (
  `id` int(11) NOT NULL,
  `costumer_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `summa` double NOT NULL,
  `sana` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `olchov`
--

CREATE TABLE `olchov` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `olchov`
--

INSERT INTO `olchov` (`id`, `name`, `filial_id`) VALUES
(1, 'metr', 1),
(2, 'kg', 1),
(3, 'KWAT', 1),
(4, 'kub', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `seh_id` int(11) NOT NULL,
  `jarayon_id` int(11) NOT NULL,
  `buyurtma_id` int(11) NOT NULL,
  `value` double NOT NULL,
  `plan_value` double NOT NULL,
  `date` datetime NOT NULL,
  `filial_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `seh_id`, `jarayon_id`, `buyurtma_id`, `value`, `plan_value`, `date`, `filial_id`, `user_id`) VALUES
(1, 1, 3, 1, 44, 25, '2022-10-26 22:40:30', 1, 2),
(2, 1, 1, 2, 12, 2, '2022-10-27 09:55:04', 1, 2),
(3, 2, 1, 2, 11, 0, '2022-10-27 09:55:21', 1, 2),
(4, 1, 3, 1, 2, 0, '2022-10-27 10:02:20', 1, 2),
(5, 2, 1, 3, 10, 0, '2022-10-27 12:27:02', 1, 2),
(6, 1, 3, 4, 10, 10, '2022-10-27 12:27:17', 1, 2),
(7, 2, 3, 0, 5, 0, '2022-10-27 15:24:16', 1, 2),
(8, 1, 3, 0, 4, 0, '2022-10-27 15:38:40', 1, 2),
(9, 2, 3, 0, 5, 5, '2022-10-29 16:10:58', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `savdo_kpi` double NOT NULL,
  `narx` int(255) NOT NULL,
  `vitrina_narx` int(255) NOT NULL,
  `tp_id` int(255) NOT NULL,
  `image` text NOT NULL,
  `date` date NOT NULL,
  `filial_id` int(255) NOT NULL,
  `bil_value` double NOT NULL,
  `brak_value` double NOT NULL,
  `brak_narx` double NOT NULL,
  `dona` double NOT NULL,
  `status` tinyint(4) NOT NULL,
  `has_warehouse` tinyint(1) NOT NULL,
  `butun` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `savdo_kpi`, `narx`, `vitrina_narx`, `tp_id`, `image`, `date`, `filial_id`, `bil_value`, `brak_value`, `brak_narx`, `dona`, `status`, `has_warehouse`, `butun`) VALUES
(1, 'Beton(250)', 14000, 120000, 150000, 1, '1665302465.jpg', '2022-10-09', 1, 0, 0, 0, 0, 1, 0, 0),
(2, 'Temir Beton', 35000, 320000, 350000, 1, '1665980492.jpg', '2022-10-17', 1, 0, 0, 0, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `id` int(11) NOT NULL,
  `jarayon_id` int(11) NOT NULL,
  `seh_id` int(11) NOT NULL,
  `value` double NOT NULL,
  `qoldiq` double NOT NULL,
  `brak_value` double NOT NULL,
  `brak_qoldiq` double NOT NULL,
  `filial_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `tannarx` double NOT NULL,
  `omborchi` int(11) NOT NULL,
  `buyurtma_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`id`, `jarayon_id`, `seh_id`, `value`, `qoldiq`, `brak_value`, `brak_qoldiq`, `filial_id`, `user_id`, `date`, `tannarx`, `omborchi`, `buyurtma_id`, `plan_id`) VALUES
(1, 3, 0, 14, 0, 0, 0, 1, 2, '2022-10-26 22:43:10', 289080, 2, 1, 1),
(2, 3, 0, 5, 0, 0, 0, 1, 2, '2022-10-26 22:44:43', 289080, 2, 1, 1),
(3, 1, 0, 6, 0, 0, 0, 1, 2, '2022-10-27 09:59:46', 33400, 2, 2, 3),
(4, 3, 0, 2, 0, 0, 0, 1, 2, '2022-10-27 10:06:04', 289080, 2, 1, 4),
(5, 1, 0, 10, 0, 0, 0, 1, 2, '2022-10-27 10:19:53', 33400, 2, 2, 2),
(6, 1, 0, 10, 0, 0, 0, 1, 2, '2022-10-27 12:28:54', 33400, 2, 3, 5),
(7, 1, 0, 5, 0, 0, 0, 1, 2, '2022-10-27 12:30:41', 33400, 2, 2, 3),
(8, 3, 0, 4, 0, 0, 0, 1, 2, '2022-10-27 16:25:29', 289080, 2, 0, 8),
(9, 3, 0, 5, 0, 0, 0, 1, 2, '2022-10-29 16:11:13', 289080, 2, 0, 7),
(10, 3, 0, 2, 2, 0, 0, 1, 2, '2022-11-03 11:42:22', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `production_kpi`
--

CREATE TABLE `production_kpi` (
  `id` int(11) NOT NULL,
  `summa` int(115) NOT NULL,
  `date` datetime NOT NULL,
  `production_id` int(25) NOT NULL,
  `user_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `production_kpi`
--

INSERT INTO `production_kpi` (`id`, `summa`, `date`, `production_id`, `user_id`, `filial_id`, `type`) VALUES
(1, 42000, '2022-10-27 11:24:08', 2, 2, 1, 'b');

-- --------------------------------------------------------

--
-- Table structure for table `qabul_history`
--

CREATE TABLE `qabul_history` (
  `product_id` int(11) NOT NULL,
  `jarayon_id` int(11) NOT NULL,
  `seh_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hajm` double NOT NULL,
  `broken` double NOT NULL,
  `sana` datetime NOT NULL DEFAULT current_timestamp(),
  `filial_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recall`
--

CREATE TABLE `recall` (
  `id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `costumer_phone` int(20) NOT NULL,
  `costumer_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` int(1) NOT NULL,
  `izoh` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recall`
--

INSERT INTO `recall` (`id`, `filial_id`, `costumer_phone`, `costumer_id`, `date`, `time`, `status`, `izoh`, `user_id`, `operator_id`, `type`) VALUES
(1, 1, 913253395, 2, '2022-10-18', '11:24:11', 1, 'dqw', 2, 2, 'ijobiy'),
(2, 1, 913381679, 1, '2022-10-18', '13:10:01', 1, 'qwf', 2, 2, 'ijobiy'),
(3, 1, 913253395, 2, '2022-10-18', '13:10:07', 1, 'qwf', 2, 2, 'ijobiy');

-- --------------------------------------------------------

--
-- Table structure for table `script`
--

CREATE TABLE `script` (
  `id` int(11) NOT NULL,
  `request` varchar(100) NOT NULL,
  `response` varchar(100) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seh`
--

CREATE TABLE `seh` (
  `id` int(11) NOT NULL,
  `name` varchar(111) COLLATE utf8_unicode_ci NOT NULL,
  `filial_id` int(11) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `emergency` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seh`
--

INSERT INTO `seh` (`id`, `name`, `filial_id`, `from_time`, `to_time`, `emergency`) VALUES
(1, 'Asosiy polya', 1, '08:22:00', '18:22:00', 0),
(2, 'Keyingi polya', 1, '10:04:00', '10:04:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `seh_taminot`
--

CREATE TABLE `seh_taminot` (
  `id` int(11) NOT NULL,
  `tannarx` double NOT NULL,
  `homashyo_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `berdi_hajm` double NOT NULL,
  `hajm` double NOT NULL,
  `sana` datetime NOT NULL DEFAULT current_timestamp(),
  `seh_id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qabul_user` int(11) NOT NULL,
  `qabul_sana` datetime DEFAULT NULL,
  `buyurtma_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seh_taminot`
--

INSERT INTO `seh_taminot` (`id`, `tannarx`, `homashyo_id`, `type`, `berdi_hajm`, `hajm`, `sana`, `seh_id`, `filial_id`, `user_id`, `qabul_user`, `qabul_sana`, `buyurtma_id`, `plan_id`) VALUES
(1, 289080, 3, 'product', 14, 14, '2022-10-26 22:43:10', 1, 1, 2, 2, '2022-10-26 22:43:10', 1, 1),
(2, 289080, 3, 'product', 5, 5, '2022-10-26 22:44:44', 1, 1, 2, 2, '2022-10-26 22:44:44', 1, 1),
(3, 33400, 1, 'product', 6, 6, '2022-10-27 09:59:46', 2, 1, 2, 2, '2022-10-27 09:59:46', 2, 3),
(4, 289080, 3, 'product', 2, 2, '2022-10-27 10:06:05', 1, 1, 2, 2, '2022-10-27 10:06:05', 1, 4),
(5, 33400, 1, 'product', 10, 7, '2022-10-27 10:19:53', 1, 1, 2, 2, '2022-10-27 10:19:53', 2, 2),
(6, 33400, 1, 'product', 10, 10, '2022-10-27 12:28:54', 2, 1, 2, 2, '2022-10-27 12:28:54', 3, 5),
(7, 33400, 1, 'product', 5, 5, '2022-10-27 12:30:41', 2, 1, 2, 2, '2022-10-27 12:30:41', 2, 3),
(8, 289080, 3, 'product', 4, 4, '2022-10-27 16:25:29', 1, 1, 2, 2, '2022-10-27 16:25:29', 0, 8),
(9, 289080, 3, 'product', 5, 5, '2022-10-29 16:11:13', 2, 1, 2, 2, '2022-10-29 16:11:13', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sms_indicator`
--

CREATE TABLE `sms_indicator` (
  `id` int(4) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_sended`
--

CREATE TABLE `sms_sended` (
  `id` int(4) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `costumer_id` int(11) NOT NULL,
  `phone` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_sended`
--

INSERT INTO `sms_sended` (`id`, `filial_id`, `costumer_id`, `phone`, `text`, `date`, `status`) VALUES
(1, 1, 1, '98913253395', 'Salom', '2022-11-05 17:01:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `qadoqlanganda_status` int(1) NOT NULL,
  `yuvilganda_status` int(1) NOT NULL,
  `buyurtma_oln_status` int(1) NOT NULL,
  `transport_topshir` int(1) NOT NULL,
  `foydalanuvchi_qoshilganda` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE `sms_template` (
  `id` int(11) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `keyword` varchar(256) NOT NULL,
  `note` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `status` int(1) NOT NULL,
  `sms_driver` int(1) NOT NULL,
  `costumer_category` varchar(256) NOT NULL,
  `delete_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`id`, `filial_id`, `keyword`, `note`, `text`, `status`, `sms_driver`, `costumer_category`, `delete_status`) VALUES
(1, 1, '', 'Test', 'Assalomu alaykum{maxsulot_detalni}{total_price}{nasiya_date }{total_price}', 1, 0, 'barchaga', 0);

-- --------------------------------------------------------

--
-- Table structure for table `taminot`
--

CREATE TABLE `taminot` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `taminotchi_id` int(11) NOT NULL,
  `coast` double NOT NULL,
  `date` date NOT NULL,
  `value` double NOT NULL,
  `filial_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qabul` double NOT NULL,
  `qabul_sana` datetime NOT NULL,
  `qabul_user` int(11) NOT NULL,
  `olchov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taminot`
--

INSERT INTO `taminot` (`id`, `name`, `taminotchi_id`, `coast`, `date`, `value`, `filial_id`, `user_id`, `qabul`, `qabul_sana`, `qabul_user`, `olchov_id`) VALUES
(1, 1, 1, 5000, '2022-10-13', 23056, 1, 2, 82000, '2022-10-13 16:40:15', 2, 0),
(2, 4, 1, 6000, '2022-10-14', 4228, 1, 2, 10000, '2022-10-14 22:01:41', 2, 0),
(3, 3, 1, 8900, '2022-10-14', 6234.8, 1, 2, 10000, '2022-10-14 22:01:42', 2, 0),
(4, 1, 1, 1200, '2022-10-14', 9000, 1, 2, 9000, '2022-10-14 22:01:42', 2, 0),
(5, 2, 1, 6875, '2022-10-14', 11881, 1, 2, 14560, '2022-10-14 22:02:47', 2, 0),
(6, 7, 1, 200, '2022-10-22', 14000, 1, 2, 14000, '2022-10-26 15:50:05', 2, 0),
(7, 4, 1, 10000, '2022-10-22', 14000, 1, 2, 14000, '2022-10-26 15:50:08', 2, 0),
(8, 8, 1, 1, '2022-10-22', 1, 1, 2, 1, '2022-10-26 15:50:11', 2, 0),
(9, 8, 1, 200, '2022-10-22', 5000, 1, 2, 5000, '2022-10-22 14:23:08', 2, 2),
(10, 4, 1, 8000, '2022-10-30', 21, 1, 2, 21, '2022-11-01 12:31:51', 2, 2),
(11, 10, 2, 29, '2022-10-30', 50400, 1, 2, 50400, '2022-11-01 12:31:18', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `taminotchi`
--

CREATE TABLE `taminotchi` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` int(9) NOT NULL,
  `balance` int(11) NOT NULL,
  `date` date NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taminotchi`
--

INSERT INTO `taminotchi` (`id`, `name`, `phone`, `balance`, `date`, `filial_id`) VALUES
(1, 'Test Taminotchi', 987544744, 812857001, '2022-10-13', 1),
(2, 'Test Taminotchi 2 ', 987894574, 1449000, '2022-11-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tarkib`
--

CREATE TABLE `tarkib` (
  `id` int(11) NOT NULL,
  `homashyo_id` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value` float NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tarkib`
--

INSERT INTO `tarkib` (`id`, `homashyo_id`, `product_id`, `value`, `type`) VALUES
(1, 1, 1, 2, 'homashyo'),
(2, 2, 2, 21, 'homashyo'),
(3, 3, 2, 4, 'homashyo'),
(4, 4, 2, 1, 'homashyo'),
(5, 4, 3, 0, 'homashyo'),
(6, 3, 3, 8.6, 'homashyo');

-- --------------------------------------------------------

--
-- Table structure for table `topshiruv`
--

CREATE TABLE `topshiruv` (
  `id` int(11) NOT NULL,
  `buyurtma_id` int(116) NOT NULL,
  `costumer_id` int(11) NOT NULL,
  `narx` double NOT NULL,
  `tannarx` double NOT NULL,
  `date` datetime NOT NULL,
  `value` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `mah_id` int(11) NOT NULL,
  `izoh` varchar(255) NOT NULL,
  `filial_id` int(11) NOT NULL,
  `seh_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topshiruv`
--

INSERT INTO `topshiruv` (`id`, `buyurtma_id`, `costumer_id`, `narx`, `tannarx`, `date`, `value`, `user_id`, `type`, `mah_id`, `izoh`, `filial_id`, `seh_id`) VALUES
(1, 2, 3, 150000, 0, '2022-10-27 11:24:08', 3, 2, 'top', 1, ' ', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `id` int(11) NOT NULL,
  `haydovchi_id` int(25) NOT NULL,
  `date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `costumer_id` int(115) NOT NULL,
  `b_id` int(255) NOT NULL,
  `status` int(11) NOT NULL,
  `value` double NOT NULL,
  `filial_id` int(255) NOT NULL,
  `narx` int(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `yol_kira` double NOT NULL,
  `seh_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`id`, `haydovchi_id`, `date`, `address`, `costumer_id`, `b_id`, `status`, `value`, `filial_id`, `narx`, `user_id`, `yol_kira`, `seh_id`) VALUES
(1, 7, '2022-10-10 10:59:55', 'Marg`ilon ', 2, 2, 1, 2, 1, 150000, 3, 25000, 0),
(2, 7, '2022-10-10 11:01:57', 'Marg`ilon ', 2, 2, 1, 1, 1, 150000, 3, 45000, 0),
(3, 7, '2022-10-13 16:42:08', 'Marg`ilon ', 2, 2, 1, 255, 1, 150000, 3, 560000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `type_chiqim`
--

CREATE TABLE `type_chiqim` (
  `id` int(112) NOT NULL,
  `name` varchar(116) NOT NULL,
  `status` varchar(115) NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_product`
--

CREATE TABLE `type_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `filial_id` int(11) NOT NULL,
  `olchov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_product`
--

INSERT INTO `type_product` (`id`, `name`, `status`, `image`, `filial_id`, `olchov_id`) VALUES
(1, 'Tovarniy Beton', 'active', '1665302387.jpg', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filial_id` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `passport` text COLLATE utf8_unicode_ci NOT NULL,
  `maosh` int(25) NOT NULL,
  `oylik` int(11) NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(12) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `seh_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password_hash`, `auth_key`, `access_token`, `status`, `fullname`, `filial_id`, `image`, `passport`, `maosh`, `oylik`, `role`, `phone`, `created_at`, `updated_at`, `seh_id`) VALUES
(1, 'admin', '$2y$13$j4fWX578yIKfsFapPFKCyukIIi/RC6VkNwl6TYdogtf1o88Kmsn0u', '784879719898', '', 10, 'Bosh Admin', 0, 'user_446024692.ico', 'user_254037264.ico', 0, 0, 'bosh_admin', 913253392, 0, 0, 0),
(2, 'admin1111', '$2y$13$ewjBm.ZxMuLDjgxEPQre1Oi5SJ5vttnIsmbJpxFrdIfdsHQ6QdqcC', '0', 'yjVbDDD59N6fMAqTK0R_uemNxv_G6I96', 10, 'F admin', 1, 'user_668942754.png', 'user_1382035671.png', 1111, 42000, 'admin', 973253397, 1663957236, 1667670583, 0),
(3, 'sehadmin', '$2y$13$M/3gMKbqkYDs5jTJtADRbecqFHEfed9yVIQEmMtQ2wuex3gqfFpFS', '0', '', 10, 'S admin', 1, '1663958049user.jpg', 'd-pasport.png', 0, 2784266, 'ishchi_admin', 978784545, 1663958050, 1665883411, 1),
(4, 'ishchi1111', '$2y$13$0bNcBp23tSa7Llqu0D8bhuJOTeqGPliUtxxpIJXpc5D6Yfd.PBrS6', '', '', 10, 'ishchi', 1, '1664016739user.jpg', '1664016739passp.png', 0, 68266, 'ishchi', 2147483647, 0, 1665650273, 1),
(5, 'wefwefwef', '$2y$13$LjsxhYpUDgHp.pVk/A7qo.4a2np..2tjygQHmR.eAhvwzyczbDbGS', '', '', 10, 'qewfwevwe', 1, '1664016788user.jpg', '1664016788passp.png', 51, -406, 'omborchi', 94454451, 0, 1667491410, 0),
(6, 'ishchiman1111', '$2y$13$bbYgAgcVaEeIdsTVzY99Ru/g0bP7eqIfyjVleCFIvs/cBmJ6YK1Xm', '', '', 10, 'Asosiy Polya Ishchisi', 1, 'user_1022348951.jpg', '', 10000, 79606, 'ishchi', 998913254, 0, 1667491410, 1),
(7, 'transport1111', '$2y$13$47.d7uEUoNnplZcrTplx3.aKl0CsqTxPsEHiuxHHAEf8LQT.bhofa', '', '', 10, 'Transport Hodimi', 1, '1665375346user.jpg', '1665375346passp.jpg', 10000, -184972, 'transport', 987845445, 0, 1667491410, 0),
(8, 'sehadmin2', '$2y$13$RBsvBjvY2svdGtIecXtmLOAMOzGDlG8QrrfkI54y9bhHYjfnbjgyu', '', '', 10, 'Seh Admin 2', 1, '1665767186user.jpg', '1665767186passp.jpg', 0, 0, 'ishchi_admin', 986587887, 0, 0, 2),
(9, 'ishchi4444', '$2y$13$tCCgPsxIgx2VyGx6nmdiGuIW3g7stWh505nHgt4dree4K8cSkQTBW', '', '', 10, 'Transport Lollipop', 1, '1667477802user.jpg', '1667477802passp.jpg', 0, 0, 'omborchi', 986554878, 0, 0, 0),
(10, 'transport4444', '$2y$13$8g12ZUPtcmoQTcWWdisO8.eAlgDXWdbfQD2gKy2kiwa6uCGPVi266', '', '', 10, 'Nurislom Baxtiyorov', 1, '1667477908user.jpg', '1667477908passp.jpg', 10000, -39972, 'ishchi_admin', 998913257, 0, 1667491410, 2);

-- --------------------------------------------------------

--
-- Table structure for table `utilization`
--

CREATE TABLE `utilization` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `date` datetime NOT NULL,
  `omborchi_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `value` double NOT NULL,
  `filial_id` int(11) NOT NULL,
  `where_from` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilization`
--

INSERT INTO `utilization` (`id`, `item_id`, `type`, `date`, `omborchi_id`, `status`, `value`, `filial_id`, `where_from`) VALUES
(1, 3, 'h', '2022-10-22 19:27:51', 2, 1, 2, 1, 'ombor');

-- --------------------------------------------------------

--
-- Table structure for table `workplace`
--

CREATE TABLE `workplace` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(9) NOT NULL,
  `date` date NOT NULL,
  `image` text NOT NULL,
  `orienter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workplace`
--

INSERT INTO `workplace` (`id`, `name`, `address`, `phone`, `date`, `image`, `orienter`) VALUES
(1, 'Birinchi filial', 'test', 999999997, '2022-09-23', '1664271909.png', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `xyz_level`
--

CREATE TABLE `xyz_level` (
  `id` int(11) NOT NULL,
  `from_money` double NOT NULL,
  `to_money` double NOT NULL,
  `filial_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternative_component`
--
ALTER TABLE `alternative_component`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asosiy_vosita`
--
ALTER TABLE `asosiy_vosita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bot_chat`
--
ALTER TABLE `bot_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyurtma`
--
ALTER TABLE `buyurtma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyurtma_transfer`
--
ALTER TABLE `buyurtma_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashback`
--
ALTER TABLE `cashback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashback_history`
--
ALTER TABLE `cashback_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chiqim`
--
ALTER TABLE `chiqim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `davomat`
--
ALTER TABLE `davomat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency`
--
ALTER TABLE `emergency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finger`
--
ALTER TABLE `finger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fingerprint`
--
ALTER TABLE `fingerprint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `founder`
--
ALTER TABLE `founder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `founder_share`
--
ALTER TABLE `founder_share`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hajm`
--
ALTER TABLE `hajm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hikvisiondb`
--
ALTER TABLE `hikvisiondb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homashyo`
--
ALTER TABLE `homashyo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homashyo_hajm`
--
ALTER TABLE `homashyo_hajm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homashyo_ishlatilishi`
--
ALTER TABLE `homashyo_ishlatilishi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jarayon`
--
ALTER TABLE `jarayon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kassa`
--
ALTER TABLE `kassa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kassa_history`
--
ALTER TABLE `kassa_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kirim`
--
ALTER TABLE `kirim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kommunal`
--
ALTER TABLE `kommunal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kpi`
--
ALTER TABLE `kpi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing`
--
ALTER TABLE `landing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahsulot_ombor`
--
ALTER TABLE `mahsulot_ombor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfer`
--
ALTER TABLE `money_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nasiya`
--
ALTER TABLE `nasiya`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nasiya_kechish`
--
ALTER TABLE `nasiya_kechish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `olchov`
--
ALTER TABLE `olchov`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `production_kpi`
--
ALTER TABLE `production_kpi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qabul_history`
--
ALTER TABLE `qabul_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recall`
--
ALTER TABLE `recall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `script`
--
ALTER TABLE `script`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seh`
--
ALTER TABLE `seh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seh_taminot`
--
ALTER TABLE `seh_taminot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_indicator`
--
ALTER TABLE `sms_indicator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_sended`
--
ALTER TABLE `sms_sended`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template`
--
ALTER TABLE `sms_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taminot`
--
ALTER TABLE `taminot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taminotchi`
--
ALTER TABLE `taminotchi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tarkib`
--
ALTER TABLE `tarkib`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topshiruv`
--
ALTER TABLE `topshiruv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_chiqim`
--
ALTER TABLE `type_chiqim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_product`
--
ALTER TABLE `type_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `utilization`
--
ALTER TABLE `utilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workplace`
--
ALTER TABLE `workplace`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `xyz_level`
--
ALTER TABLE `xyz_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternative_component`
--
ALTER TABLE `alternative_component`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `asosiy_vosita`
--
ALTER TABLE `asosiy_vosita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bot_chat`
--
ALTER TABLE `bot_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buyurtma`
--
ALTER TABLE `buyurtma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buyurtma_transfer`
--
ALTER TABLE `buyurtma_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cashback`
--
ALTER TABLE `cashback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cashback_history`
--
ALTER TABLE `cashback_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chiqim`
--
ALTER TABLE `chiqim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `costumer`
--
ALTER TABLE `costumer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `davomat`
--
ALTER TABLE `davomat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `emergency`
--
ALTER TABLE `emergency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `finger`
--
ALTER TABLE `finger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fingerprint`
--
ALTER TABLE `fingerprint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `founder`
--
ALTER TABLE `founder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `founder_share`
--
ALTER TABLE `founder_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hajm`
--
ALTER TABLE `hajm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hikvisiondb`
--
ALTER TABLE `hikvisiondb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homashyo`
--
ALTER TABLE `homashyo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `homashyo_hajm`
--
ALTER TABLE `homashyo_hajm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `homashyo_ishlatilishi`
--
ALTER TABLE `homashyo_ishlatilishi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jarayon`
--
ALTER TABLE `jarayon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kassa`
--
ALTER TABLE `kassa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kassa_history`
--
ALTER TABLE `kassa_history`
  MODIFY `id` int(115) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kirim`
--
ALTER TABLE `kirim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kommunal`
--
ALTER TABLE `kommunal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kpi`
--
ALTER TABLE `kpi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing`
--
ALTER TABLE `landing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahsulot_ombor`
--
ALTER TABLE `mahsulot_ombor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `money_transfer`
--
ALTER TABLE `money_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nasiya`
--
ALTER TABLE `nasiya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nasiya_kechish`
--
ALTER TABLE `nasiya_kechish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `olchov`
--
ALTER TABLE `olchov`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `production`
--
ALTER TABLE `production`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `production_kpi`
--
ALTER TABLE `production_kpi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qabul_history`
--
ALTER TABLE `qabul_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recall`
--
ALTER TABLE `recall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `script`
--
ALTER TABLE `script`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seh`
--
ALTER TABLE `seh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seh_taminot`
--
ALTER TABLE `seh_taminot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sms_indicator`
--
ALTER TABLE `sms_indicator`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_sended`
--
ALTER TABLE `sms_sended`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_template`
--
ALTER TABLE `sms_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taminot`
--
ALTER TABLE `taminot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `taminotchi`
--
ALTER TABLE `taminotchi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tarkib`
--
ALTER TABLE `tarkib`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `topshiruv`
--
ALTER TABLE `topshiruv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_chiqim`
--
ALTER TABLE `type_chiqim`
  MODIFY `id` int(112) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_product`
--
ALTER TABLE `type_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `utilization`
--
ALTER TABLE `utilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `workplace`
--
ALTER TABLE `workplace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xyz_level`
--
ALTER TABLE `xyz_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
