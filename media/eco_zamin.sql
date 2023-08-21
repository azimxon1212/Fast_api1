-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2023 at 02:08 PM
-- Server version: 8.0.30
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eco_zamin`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `comment` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`id`, `name`, `address`, `comment`, `user_id`, `created_on`, `status`) VALUES
(1, 'string', 'string', 'string', 1, '2023-04-13 12:24:49', 1),
(2, 'string', 'string', 'string', 1, '2023-04-13 13:56:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Expenses`
--

CREATE TABLE `Expenses` (
  `id` int NOT NULL,
  `money` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `source_id` int NOT NULL,
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Expenses`
--

INSERT INTO `Expenses` (`id`, `money`, `type`, `source_id`, `source`, `user_id`, `date_time`, `status`) VALUES
(1, 0, 'fine', 1, 'string', 1, '2023-04-13 12:29:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Extra`
--

CREATE TABLE `Extra` (
  `id` int NOT NULL,
  `money` int NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `source_id` int NOT NULL,
  `source` varchar(20) NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `user_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Extra`
--

INSERT INTO `Extra` (`id`, `money`, `type`, `source_id`, `source`, `comment`, `user_id`, `date_time`, `status`) VALUES
(1, 0, 'string', 1, 'string', 'string', 1, '2023-04-13 12:29:30', 1),
(2, 0, 'fine', 1, 'string', 'string', 1, '2023-04-13 12:29:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Incomes`
--

CREATE TABLE `Incomes` (
  `id` int NOT NULL,
  `money` int NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `source_id` int NOT NULL,
  `source` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Incomes`
--

INSERT INTO `Incomes` (`id`, `money`, `type`, `source_id`, `source`, `user_id`, `date_time`, `status`) VALUES
(1, 0, 'string', 1, 'Trade', 1, '2023-04-13 12:28:44', 1),
(2, 0, 'Naqd', 1, 'Trade', 1, '2023-04-13 12:49:35', 1),
(3, 0, 'string', 1, 'Trade', 1, '2023-04-13 12:55:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Kpi`
--

CREATE TABLE `Kpi` (
  `id` int NOT NULL,
  `percentage` float NOT NULL,
  `source_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Kpi`
--

INSERT INTO `Kpi` (`id`, `percentage`, `source_id`, `user_id`, `date`, `status`) VALUES
(1, 0, 1, 1, '2023-04-13 12:27:28', 1),
(2, 0, 1, 1, '2023-04-13 13:01:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Kpi_History`
--

CREATE TABLE `Kpi_History` (
  `id` int NOT NULL,
  `money` int DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `order_id` int NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `return_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Kpi_History`
--

INSERT INTO `Kpi_History` (`id`, `money`, `type`, `order_id`, `comment`, `user_id`, `date`, `status`, `return_date`) VALUES
(1, 0, 'string', 1, 'string', 1, '2023-04-13 12:55:26', 1, '2023-04-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Nasiya`
--

CREATE TABLE `Nasiya` (
  `id` int NOT NULL,
  `money` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Nasiya`
--

INSERT INTO `Nasiya` (`id`, `money`, `customer_id`, `order_id`, `user_id`, `date_time`, `status`, `deadline`) VALUES
(1, 0, 1, 1, 1, '2023-04-13 12:36:23', 0, '2023-04-13'),
(2, 0, 1, 1, 1, '2023-04-13 12:36:32', 1, '2023-04-13'),
(3, 0, 1, 1, 1, '2023-04-13 12:37:18', 1, '2023-04-13'),
(4, 0, 1, 1, 1, '2023-04-13 12:38:59', 1, '2023-04-13'),
(5, 0, 1, 1, 1, '2023-04-13 12:42:16', 1, '2023-04-13');

-- --------------------------------------------------------

--
-- Table structure for table `Notifications`
--

CREATE TABLE `Notifications` (
  `id` int NOT NULL,
  `money` int NOT NULL,
  `worker_id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`id`, `customer_id`, `comment`, `user_id`, `date`, `status`) VALUES
(1, 1, 'string', 1, '2023-04-13 12:26:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Phones`
--

CREATE TABLE `Phones` (
  `id` int NOT NULL,
  `number` varchar(20) NOT NULL,
  `source_id` int NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `user_id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Phones`
--

INSERT INTO `Phones` (`id`, `number`, `source_id`, `comment`, `user_id`, `created_on`, `status`) VALUES
(3, 'string', 1, 'string', 1, '2023-04-13 13:03:49', 1),
(4, 'string', 2, 'string', 1, '2023-04-13 13:56:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `birlik` varchar(20) NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `price` int NOT NULL,
  `user_id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`id`, `name`, `birlik`, `comment`, `price`, `user_id`, `created_on`, `status`) VALUES
(1, 'string', 'string', 'string', 0, 1, '2023-04-13 12:25:07', 0),
(2, 'string', 'string', 'string', 0, 1, '2023-04-13 12:26:24', 1),
(3, 'string', 'string', 'string', 0, 1, '2023-04-13 13:09:01', 1),
(4, 'string', 'string', 'string', 0, 1, '2023-04-13 13:46:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Trades`
--

CREATE TABLE `Trades` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Trades`
--

INSERT INTO `Trades` (`id`, `product_id`, `quantity`, `user_id`, `order_id`, `date`, `status`) VALUES
(1, 1, 1, 1, 1, '2023-04-13 12:26:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `roll` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(20) NOT NULL,
  `balance` float DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `token` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `roll`, `name`, `number`, `balance`, `salary`, `username`, `password`, `status`, `token`) VALUES
(1, 'admin', 'www', '123', 0, 24.42, 'string', '$2b$12$HGh59BB/0Z6XvTOtCFFgmuxKOJ7wobyg3feVVYOjmShRbqnVx75UK', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzdHJpbmciLCJleHAiOjE2ODE0NTAwNTh9.lk0Ce2Ij-GupewM2Vos_bEaF0SX4FwVofOjef57d-ys');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Expenses`
--
ALTER TABLE `Expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Extra`
--
ALTER TABLE `Extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Incomes`
--
ALTER TABLE `Incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Kpi`
--
ALTER TABLE `Kpi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`source_id`);

--
-- Indexes for table `Kpi_History`
--
ALTER TABLE `Kpi_History`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `Nasiya`
--
ALTER TABLE `Nasiya`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Phones`
--
ALTER TABLE `Phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`source_id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Trades`
--
ALTER TABLE `Trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Expenses`
--
ALTER TABLE `Expenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Extra`
--
ALTER TABLE `Extra`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Incomes`
--
ALTER TABLE `Incomes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Kpi`
--
ALTER TABLE `Kpi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Kpi_History`
--
ALTER TABLE `Kpi_History`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Nasiya`
--
ALTER TABLE `Nasiya`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Notifications`
--
ALTER TABLE `Notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Phones`
--
ALTER TABLE `Phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Trades`
--
ALTER TABLE `Trades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Kpi`
--
ALTER TABLE `Kpi`
  ADD CONSTRAINT `kpi_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Kpi_History`
--
ALTER TABLE `Kpi_History`
  ADD CONSTRAINT `kpi_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`);

--
-- Constraints for table `Nasiya`
--
ALTER TABLE `Nasiya`
  ADD CONSTRAINT `nasiya_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`id`),
  ADD CONSTRAINT `nasiya_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`);

--
-- Constraints for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`id`);

--
-- Constraints for table `Phones`
--
ALTER TABLE `Phones`
  ADD CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `Customers` (`id`);

--
-- Constraints for table `Trades`
--
ALTER TABLE `Trades`
  ADD CONSTRAINT `trades_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`),
  ADD CONSTRAINT `trades_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
