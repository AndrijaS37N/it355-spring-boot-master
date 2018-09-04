-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 31, 2018 at 04:24 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`name`) VALUES
('ADMIN'),
('USER');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` bigint(20) NOT NULL,
  `date` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `stop_time` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `date`, `description`, `start_time`, `stop_time`, `user_email`) VALUES
(1, '2018-01-01', 'Task task task 1.', '01:00', '01:00', 'admin@gmail.com'),
(2, '2018-08-16', 'Bla bla bla.', '01:00', '01:00', 'admin@gmail.com'),
(3, '2018-08-21', 'Task ta ta ta.', '00:00', '00:00', 'andrija5@gmail.com'),
(4, '2018-08-23', 'Task ta ta ta. Ta ta.', '00:00', '01:00', 'andrija5@gmail.com'),
(5, '2018-08-10', 'Task ta ta ta. Bla bla.', '01:00', '01:00', 'andrija5@gmail.com'),
(6, '2018-08-10', 'Task ta ta ta. Bla bla. La la.', '02:00', '01:00', 'andrija5@gmail.com'),
(7, '2018-08-11', 'Task ta ta ta. Bla bla. Za za.', '02:30', '01:00', 'andrija5@gmail.com'),
(8, '2018-08-12', 'Task ta ta ta. Bla bla. Za za. He he.', '02:30', '01:30', 'andrija5@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `name`, `password`) VALUES
('admin@gmail.com', 'Admin', '$2a$10$0r4PHNvNYNPKdXY7/0kvNuXkcU16FbgAko8Y.0uosHHSJSI03JB.a'),
('andrija1@gmail.com', 'Andrija1', '$2a$10$0r4PHNvNYNPKdXY7/0kvNuXkcU16FbgAko8Y.0uosHHSJSI03JB.a'),
('andrija2@gmail.com', 'Andrija2', '$2a$10$YEUuzqIUsTcgjTiOP1YI3eS3JG9o6GXnUPAq.k2PkR8QLX8HDB2oS'),
('andrija3@gmail.com', 'Andrija3', '$2a$10$YEUuzqIUsTcgjTiOP1YI3eS3JG9o6GXnUPAq.k2PkR8QLX8HDB2oS'),
('andrija4@gmail.com', 'Andrija4', '$2a$10$YEUuzqIUsTcgjTiOP1YI3eS3JG9o6GXnUPAq.k2PkR8QLX8HDB2oS'),
('andrija5@gmail.com', 'Andrija5', '$2a$10$jt5UyxlyMdZ5cWVXX3VUIOrc7Yfsp46abzLMVA3Gt7oWcN/otIgEO');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_email` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_email`, `role_name`) VALUES
('andrija3@gmail.com', 'USER'),
('admin@gmail.com', 'ADMIN'),
('andrija5@gmail.com', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKegybiiy48edolpxof9xq44xiy` (`user_email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `FK53v9b6vwc56nm9llvcdhs8y8f` (`role_name`),
  ADD KEY `FKfinmcawb90mtj05cpco76b963` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FKegybiiy48edolpxof9xq44xiy` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK53v9b6vwc56nm9llvcdhs8y8f` FOREIGN KEY (`role_name`) REFERENCES `role` (`name`),
  ADD CONSTRAINT `FKfinmcawb90mtj05cpco76b963` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
