-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2017 at 02:32 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pureoxy`
--

-- --------------------------------------------------------

--
-- Table structure for table `air_data`
--

CREATE TABLE `air_data` (
  `id` int(11) NOT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `co2` varchar(255) NOT NULL,
  `co` varchar(255) NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `air_data`
--

INSERT INTO `air_data` (`id`, `quality`, `co2`, `co`, `percentage`, `time`, `date`, `module_id`) VALUES
(12, 'SUBPAR', '650', '70', 50, '20:45:18', '2017-07-08', 1),
(13, 'ACCEPTABLE', '100', '15', 40, '4:50:04', '2017-07-07', 1),
(14, 'SAFE', '10', '10', 20, '8:40:00', '2017-07-06', 1),
(15, 'SAFE', '150', '15', 20, '9:40:00', '2017-07-05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cobalt_reporter`
--

CREATE TABLE `cobalt_reporter` (
  `module_name` varchar(255) NOT NULL,
  `report_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `show_field` blob NOT NULL,
  `operator` blob NOT NULL,
  `text_field` blob NOT NULL,
  `sum_field` blob NOT NULL,
  `count_field` blob NOT NULL,
  `group_field1` blob NOT NULL,
  `group_field2` blob NOT NULL,
  `group_field3` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cobalt_sst`
--

CREATE TABLE `cobalt_sst` (
  `auto_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `config_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `from_module`
--

CREATE TABLE `from_module` (
  `id` int(11) NOT NULL,
  `body` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `number` varchar(11) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `location`, `city`, `latitude`, `longitude`, `number`) VALUES
(1, 'Zapote', 'Makati', '14.555662118472565', '121.02517015838623', '09266386386'),
(2, 'APC', 'Makati', '14.530727567562602', '121.02043874168396', '09063948867'),
(3, 'Urdaneta', 'Makati', '14.5553713527648', '121.02980501556397', '09239203923');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `first_name`, `middle_name`, `last_name`, `gender`) VALUES
(1, 'Super User', 'X', 'Root', 'Male'),
(2, '', '', '', NULL),
(3, 'Adrian', '', 'Tobias', NULL),
(4, 'Adrian', '', 'Tobias', NULL),
(5, 'Adrian', '', 'Tobias', NULL),
(6, 'Adrian', 'De Vera', 'Tobias', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_in`
--

CREATE TABLE `sms_in` (
  `id` int(11) NOT NULL,
  `sms_text` varchar(1600) DEFAULT NULL,
  `sender_number` varchar(50) DEFAULT NULL,
  `sent_dt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_in`
--

INSERT INTO `sms_in` (`id`, `sms_text`, `sender_number`, `sent_dt`) VALUES
(1, '650,70,1', '+639266386386', '2017-07-08 20:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `entry_id` bigint(20) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `action` mediumtext NOT NULL,
  `module` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_log`
--

INSERT INTO `system_log` (`entry_id`, `ip_address`, `user`, `datetime`, `action`, `module`) VALUES
(1, '::1', 'root', '2017-06-28 15:13:49', 'Logged in', '/pureoxy/login.php'),
(2, '::1', 'root', '2017-06-28 15:13:49', 'Query Executed: UPDATE user SET `password`=?, `salt`=?, `iteration`=?, `method`=? WHERE username=?\r\nArray\n(\n    [0] => ssiss\n    [1] => $2y$12$MRuj.c3cTOku4xsAaEnvs.opSXjXJuf/0OsFzwu.pwsey9aGGL7w.\n    [2] => MRuj+c3cTOku4xsAaEnvsA\n    [3] => 12\n    [4] => blowfish\n    [5] => root\n)\n', '/pureoxy/login.php'),
(3, '::1', 'root', '2017-06-28 15:14:03', 'Pressed cancel button', '/pureoxy/modules/module/from_module/add_from_module.php'),
(4, '::1', 'root', '2017-06-28 15:15:16', 'Pressed cancel button', '/pureoxy/modules/air/air_data/add_air_data.php'),
(5, '::1', 'root', '2017-06-28 15:34:44', 'Pressed submit button', '/pureoxy/modules/module/module/add_module.php'),
(6, '::1', 'root', '2017-06-28 21:19:40', 'Logged in', '/pureoxy/login.php'),
(7, '::1', 'root', '2017-06-28 21:21:10', 'Pressed submit button', '/pureoxy/modules/module/module/add_module.php'),
(8, '::1', 'root', '2017-06-28 21:21:10', 'Query Executed: INSERT INTO module(id, location, city, latitude, longitude, number) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => Zapote\n    [3] => Makati\n    [4] => 14.555662118472565\n    [5] => 121.02517015838623\n    [6] => 09266386386\n)\n', '/pureoxy/modules/module/module/add_module.php'),
(9, '::1', 'root', '2017-06-29 12:27:19', 'Logged in', '/pureoxy/login.php'),
(10, '::1', 'root', '2017-06-29 12:28:34', 'Pressed cancel button', '/pureoxy/modules/air/air_data/add_air_data.php'),
(11, '::1', 'root', '2017-06-29 14:56:41', 'Logged in', '/pureoxy/login.php'),
(12, '::1', 'root', '2017-06-29 15:06:40', 'Pressed cancel button', '/pureoxy/sysadmin/add_user.php'),
(13, '::1', 'root', '2017-06-29 15:15:07', 'Pressed cancel button', '/pureoxy/sysadmin/add_user.php'),
(14, '::1', 'root', '2017-06-29 15:16:19', 'Pressed submit button', '/pureoxy/sysadmin/add_user.php'),
(15, '::1', 'root', '2017-06-29 15:16:20', 'Query Executed: INSERT INTO user(username, password, salt, iteration, method, person_id, role_id, skin_id) VALUES(?,?,?,?,?,?,?,?)\r\nArray\n(\n    [0] => sssisiii\n    [1] => cooladrian\n    [2] => $2y$12$4iL9xgPEBnw4cWT7NaABQ.7fcwAJRiqHDHmKbxxAEGupfNm5lOoRO\n    [3] => 4iL9xgPEBnw4cWT7NaABQA\n    [4] => 12\n    [5] => blowfish\n    [6] => 1\n    [7] => 2\n    [8] => 3\n)\n', '/pureoxy/sysadmin/add_user.php'),
(16, '::1', 'root', '2017-06-29 15:16:20', 'Query executed: INSERT `user_passport` SELECT ''cooladrian'', `link_id` FROM user_role_links WHERE role_id=''2''', '/pureoxy/sysadmin/add_user.php'),
(17, '::1', 'root', '2017-07-01 19:27:20', 'Logged in', '/pureoxy/login.php'),
(18, '::1', 'root', '2017-07-01 19:36:35', 'Logged out', '/pureoxy/end.php'),
(19, '::1', 'root', '2017-07-01 22:45:11', 'Logged in', '/pureoxy/login.php'),
(20, '::1', 'root', '2017-07-02 02:35:02', 'Logged in', '/pureoxy/login.php'),
(21, '::1', 'root', '2017-07-08 20:57:50', 'Logged in', '/pureoxy/login.php'),
(22, '::1', 'root', '2017-07-08 20:59:53', 'Query executed: DELETE FROM user_role_links WHERE role_id=''1''', '/pureoxy/sysadmin/role_permissions.php'),
(23, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''37'')', '/pureoxy/sysadmin/role_permissions.php'),
(24, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''33'')', '/pureoxy/sysadmin/role_permissions.php'),
(25, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''41'')', '/pureoxy/sysadmin/role_permissions.php'),
(26, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''45'')', '/pureoxy/sysadmin/role_permissions.php'),
(27, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''4'')', '/pureoxy/sysadmin/role_permissions.php'),
(28, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''16'')', '/pureoxy/sysadmin/role_permissions.php'),
(29, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''28'')', '/pureoxy/sysadmin/role_permissions.php'),
(30, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''8'')', '/pureoxy/sysadmin/role_permissions.php'),
(31, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''20'')', '/pureoxy/sysadmin/role_permissions.php'),
(32, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''24'')', '/pureoxy/sysadmin/role_permissions.php'),
(33, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''12'')', '/pureoxy/sysadmin/role_permissions.php'),
(34, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''39'')', '/pureoxy/sysadmin/role_permissions.php'),
(35, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''35'')', '/pureoxy/sysadmin/role_permissions.php'),
(36, '::1', 'root', '2017-07-08 20:59:54', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''40'')', '/pureoxy/sysadmin/role_permissions.php'),
(37, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''36'')', '/pureoxy/sysadmin/role_permissions.php'),
(38, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''44'')', '/pureoxy/sysadmin/role_permissions.php'),
(39, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''48'')', '/pureoxy/sysadmin/role_permissions.php'),
(40, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''7'')', '/pureoxy/sysadmin/role_permissions.php'),
(41, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''19'')', '/pureoxy/sysadmin/role_permissions.php'),
(42, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''31'')', '/pureoxy/sysadmin/role_permissions.php'),
(43, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''11'')', '/pureoxy/sysadmin/role_permissions.php'),
(44, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''23'')', '/pureoxy/sysadmin/role_permissions.php'),
(45, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''27'')', '/pureoxy/sysadmin/role_permissions.php'),
(46, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''15'')', '/pureoxy/sysadmin/role_permissions.php'),
(47, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''38'')', '/pureoxy/sysadmin/role_permissions.php'),
(48, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''34'')', '/pureoxy/sysadmin/role_permissions.php'),
(49, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''42'')', '/pureoxy/sysadmin/role_permissions.php'),
(50, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''46'')', '/pureoxy/sysadmin/role_permissions.php'),
(51, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''5'')', '/pureoxy/sysadmin/role_permissions.php'),
(52, '::1', 'root', '2017-07-08 20:59:55', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''17'')', '/pureoxy/sysadmin/role_permissions.php'),
(53, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''29'')', '/pureoxy/sysadmin/role_permissions.php'),
(54, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''9'')', '/pureoxy/sysadmin/role_permissions.php'),
(55, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''21'')', '/pureoxy/sysadmin/role_permissions.php'),
(56, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''25'')', '/pureoxy/sysadmin/role_permissions.php'),
(57, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''13'')', '/pureoxy/sysadmin/role_permissions.php'),
(58, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''43'')', '/pureoxy/sysadmin/role_permissions.php'),
(59, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''47'')', '/pureoxy/sysadmin/role_permissions.php'),
(60, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''1'')', '/pureoxy/sysadmin/role_permissions.php'),
(61, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''6'')', '/pureoxy/sysadmin/role_permissions.php'),
(62, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''32'')', '/pureoxy/sysadmin/role_permissions.php'),
(63, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''3'')', '/pureoxy/sysadmin/role_permissions.php'),
(64, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''2'')', '/pureoxy/sysadmin/role_permissions.php'),
(65, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''18'')', '/pureoxy/sysadmin/role_permissions.php'),
(66, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''30'')', '/pureoxy/sysadmin/role_permissions.php'),
(67, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''10'')', '/pureoxy/sysadmin/role_permissions.php'),
(68, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''22'')', '/pureoxy/sysadmin/role_permissions.php'),
(69, '::1', 'root', '2017-07-08 20:59:56', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''26'')', '/pureoxy/sysadmin/role_permissions.php'),
(70, '::1', 'root', '2017-07-08 20:59:57', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''14'')', '/pureoxy/sysadmin/role_permissions.php'),
(71, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: DELETE FROM user_role_links WHERE role_id=''1''', '/pureoxy/sysadmin/role_permissions.php'),
(72, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''37'')', '/pureoxy/sysadmin/role_permissions.php'),
(73, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''33'')', '/pureoxy/sysadmin/role_permissions.php'),
(74, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''41'')', '/pureoxy/sysadmin/role_permissions.php'),
(75, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''45'')', '/pureoxy/sysadmin/role_permissions.php'),
(76, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''4'')', '/pureoxy/sysadmin/role_permissions.php'),
(77, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''49'')', '/pureoxy/sysadmin/role_permissions.php'),
(78, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''16'')', '/pureoxy/sysadmin/role_permissions.php'),
(79, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''28'')', '/pureoxy/sysadmin/role_permissions.php'),
(80, '::1', 'root', '2017-07-08 21:00:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''8'')', '/pureoxy/sysadmin/role_permissions.php'),
(81, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''20'')', '/pureoxy/sysadmin/role_permissions.php'),
(82, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''24'')', '/pureoxy/sysadmin/role_permissions.php'),
(83, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''12'')', '/pureoxy/sysadmin/role_permissions.php'),
(84, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''39'')', '/pureoxy/sysadmin/role_permissions.php'),
(85, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''35'')', '/pureoxy/sysadmin/role_permissions.php'),
(86, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''40'')', '/pureoxy/sysadmin/role_permissions.php'),
(87, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''36'')', '/pureoxy/sysadmin/role_permissions.php'),
(88, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''44'')', '/pureoxy/sysadmin/role_permissions.php'),
(89, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''48'')', '/pureoxy/sysadmin/role_permissions.php'),
(90, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''7'')', '/pureoxy/sysadmin/role_permissions.php'),
(91, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''52'')', '/pureoxy/sysadmin/role_permissions.php'),
(92, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''19'')', '/pureoxy/sysadmin/role_permissions.php'),
(93, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''31'')', '/pureoxy/sysadmin/role_permissions.php'),
(94, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''11'')', '/pureoxy/sysadmin/role_permissions.php'),
(95, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''23'')', '/pureoxy/sysadmin/role_permissions.php'),
(96, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''27'')', '/pureoxy/sysadmin/role_permissions.php'),
(97, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''15'')', '/pureoxy/sysadmin/role_permissions.php'),
(98, '::1', 'root', '2017-07-08 21:00:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''38'')', '/pureoxy/sysadmin/role_permissions.php'),
(99, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''34'')', '/pureoxy/sysadmin/role_permissions.php'),
(100, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''42'')', '/pureoxy/sysadmin/role_permissions.php'),
(101, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''46'')', '/pureoxy/sysadmin/role_permissions.php'),
(102, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''5'')', '/pureoxy/sysadmin/role_permissions.php'),
(103, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''50'')', '/pureoxy/sysadmin/role_permissions.php'),
(104, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''17'')', '/pureoxy/sysadmin/role_permissions.php'),
(105, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''29'')', '/pureoxy/sysadmin/role_permissions.php'),
(106, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''9'')', '/pureoxy/sysadmin/role_permissions.php'),
(107, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''21'')', '/pureoxy/sysadmin/role_permissions.php'),
(108, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''25'')', '/pureoxy/sysadmin/role_permissions.php'),
(109, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''13'')', '/pureoxy/sysadmin/role_permissions.php'),
(110, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''43'')', '/pureoxy/sysadmin/role_permissions.php'),
(111, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''47'')', '/pureoxy/sysadmin/role_permissions.php'),
(112, '::1', 'root', '2017-07-08 21:00:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''1'')', '/pureoxy/sysadmin/role_permissions.php'),
(113, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''6'')', '/pureoxy/sysadmin/role_permissions.php'),
(114, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''32'')', '/pureoxy/sysadmin/role_permissions.php'),
(115, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''3'')', '/pureoxy/sysadmin/role_permissions.php'),
(116, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''2'')', '/pureoxy/sysadmin/role_permissions.php'),
(117, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''51'')', '/pureoxy/sysadmin/role_permissions.php'),
(118, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''18'')', '/pureoxy/sysadmin/role_permissions.php'),
(119, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''30'')', '/pureoxy/sysadmin/role_permissions.php'),
(120, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''10'')', '/pureoxy/sysadmin/role_permissions.php'),
(121, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''22'')', '/pureoxy/sysadmin/role_permissions.php'),
(122, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''26'')', '/pureoxy/sysadmin/role_permissions.php'),
(123, '::1', 'root', '2017-07-08 21:00:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''14'')', '/pureoxy/sysadmin/role_permissions.php'),
(124, '::1', 'root', '2017-07-08 21:00:10', 'Query executed: DELETE FROM user_passport WHERE username IN (''root'')', '/pureoxy/sysadmin/role_permissions_cascade.php'),
(125, '::1', 'root', '2017-07-08 21:00:10', 'Query executed: INSERT `user_passport` SELECT ''root'', `link_id` FROM user_role_links WHERE role_id=''1''', '/pureoxy/sysadmin/role_permissions_cascade.php'),
(126, '::1', 'root', '2017-07-08 21:00:11', 'Pressed cancel button', '/pureoxy/sysadmin/role_permissions_cascade.php'),
(127, '::1', 'root', '2017-07-08 21:21:51', 'Pressed submit button', '/pureoxy/sysadmin/add_user_links.php'),
(128, '::1', 'root', '2017-07-08 21:21:51', 'Query Executed: INSERT INTO user_links(link_id, name, target, descriptive_title, description, passport_group_id, show_in_tasklist, status, icon, priority) VALUES(?,?,?,?,?,?,?,?,?,?)\r\nArray\n(\n    [0] => issssisssi\n    [1] => \n    [2] => Generate\n    [3] => modules/generate/generate.php\n    [4] => Generate Data\n    [5] => \n    [6] => 2\n    [7] => Yes\n    [8] => On\n    [9] => form3.png\n    [10] => 0\n)\n', '/pureoxy/sysadmin/add_user_links.php'),
(129, '::1', 'root', '2017-07-08 21:22:01', 'Query executed: DELETE FROM user_role_links WHERE role_id=''1''', '/pureoxy/sysadmin/role_permissions.php'),
(130, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''37'')', '/pureoxy/sysadmin/role_permissions.php'),
(131, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''33'')', '/pureoxy/sysadmin/role_permissions.php'),
(132, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''41'')', '/pureoxy/sysadmin/role_permissions.php'),
(133, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''45'')', '/pureoxy/sysadmin/role_permissions.php'),
(134, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''4'')', '/pureoxy/sysadmin/role_permissions.php'),
(135, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''49'')', '/pureoxy/sysadmin/role_permissions.php'),
(136, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''16'')', '/pureoxy/sysadmin/role_permissions.php'),
(137, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''28'')', '/pureoxy/sysadmin/role_permissions.php'),
(138, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''8'')', '/pureoxy/sysadmin/role_permissions.php'),
(139, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''20'')', '/pureoxy/sysadmin/role_permissions.php'),
(140, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''24'')', '/pureoxy/sysadmin/role_permissions.php'),
(141, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''12'')', '/pureoxy/sysadmin/role_permissions.php'),
(142, '::1', 'root', '2017-07-08 21:22:02', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''39'')', '/pureoxy/sysadmin/role_permissions.php'),
(143, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''35'')', '/pureoxy/sysadmin/role_permissions.php'),
(144, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''40'')', '/pureoxy/sysadmin/role_permissions.php'),
(145, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''36'')', '/pureoxy/sysadmin/role_permissions.php'),
(146, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''44'')', '/pureoxy/sysadmin/role_permissions.php'),
(147, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''48'')', '/pureoxy/sysadmin/role_permissions.php'),
(148, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''7'')', '/pureoxy/sysadmin/role_permissions.php'),
(149, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''52'')', '/pureoxy/sysadmin/role_permissions.php'),
(150, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''19'')', '/pureoxy/sysadmin/role_permissions.php'),
(151, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''31'')', '/pureoxy/sysadmin/role_permissions.php'),
(152, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''11'')', '/pureoxy/sysadmin/role_permissions.php'),
(153, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''23'')', '/pureoxy/sysadmin/role_permissions.php'),
(154, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''27'')', '/pureoxy/sysadmin/role_permissions.php'),
(155, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''15'')', '/pureoxy/sysadmin/role_permissions.php'),
(156, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''38'')', '/pureoxy/sysadmin/role_permissions.php'),
(157, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''34'')', '/pureoxy/sysadmin/role_permissions.php'),
(158, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''42'')', '/pureoxy/sysadmin/role_permissions.php'),
(159, '::1', 'root', '2017-07-08 21:22:03', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''46'')', '/pureoxy/sysadmin/role_permissions.php'),
(160, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''5'')', '/pureoxy/sysadmin/role_permissions.php'),
(161, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''50'')', '/pureoxy/sysadmin/role_permissions.php'),
(162, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''17'')', '/pureoxy/sysadmin/role_permissions.php'),
(163, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''29'')', '/pureoxy/sysadmin/role_permissions.php'),
(164, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''9'')', '/pureoxy/sysadmin/role_permissions.php'),
(165, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''21'')', '/pureoxy/sysadmin/role_permissions.php'),
(166, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''25'')', '/pureoxy/sysadmin/role_permissions.php'),
(167, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''13'')', '/pureoxy/sysadmin/role_permissions.php'),
(168, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''43'')', '/pureoxy/sysadmin/role_permissions.php'),
(169, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''53'')', '/pureoxy/sysadmin/role_permissions.php'),
(170, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''47'')', '/pureoxy/sysadmin/role_permissions.php'),
(171, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''1'')', '/pureoxy/sysadmin/role_permissions.php'),
(172, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''6'')', '/pureoxy/sysadmin/role_permissions.php'),
(173, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''32'')', '/pureoxy/sysadmin/role_permissions.php'),
(174, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''3'')', '/pureoxy/sysadmin/role_permissions.php'),
(175, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''2'')', '/pureoxy/sysadmin/role_permissions.php'),
(176, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''51'')', '/pureoxy/sysadmin/role_permissions.php'),
(177, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''18'')', '/pureoxy/sysadmin/role_permissions.php'),
(178, '::1', 'root', '2017-07-08 21:22:04', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''30'')', '/pureoxy/sysadmin/role_permissions.php'),
(179, '::1', 'root', '2017-07-08 21:22:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''10'')', '/pureoxy/sysadmin/role_permissions.php'),
(180, '::1', 'root', '2017-07-08 21:22:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''22'')', '/pureoxy/sysadmin/role_permissions.php'),
(181, '::1', 'root', '2017-07-08 21:22:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''26'')', '/pureoxy/sysadmin/role_permissions.php'),
(182, '::1', 'root', '2017-07-08 21:22:05', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''1'', ''14'')', '/pureoxy/sysadmin/role_permissions.php'),
(183, '::1', 'root', '2017-07-08 21:22:10', 'Query executed: DELETE FROM user_passport WHERE username IN (''root'')', '/pureoxy/sysadmin/role_permissions_cascade.php'),
(184, '::1', 'root', '2017-07-08 21:22:10', 'Query executed: INSERT `user_passport` SELECT ''root'', `link_id` FROM user_role_links WHERE role_id=''1''', '/pureoxy/sysadmin/role_permissions_cascade.php'),
(185, '::1', 'root', '2017-07-08 21:24:26', 'Pressed submit button', '/pureoxy/sysadmin/edit_user_links.php'),
(186, '::1', 'root', '2017-07-08 21:24:26', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Generate\n    [2] => modules/generate/generate.php\n    [3] => Generate Data\n    [4] => \n    [5] => 1\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 53\n)\n', '/pureoxy/sysadmin/edit_user_links.php'),
(187, '::1', 'root', '2017-07-08 22:26:54', 'Query executed: SELECT `sms_text` FROM `sms_in`', '/pureoxy/modules/generate/generate.php'),
(188, '::1', 'root', '2017-07-08 22:26:54', 'Query executed: SELECT `sms_text` FROM `sms_in`', '/pureoxy/modules/generate/generate.php'),
(189, '::1', 'root', '2017-07-08 22:26:54', 'Query executed: SELECT `sms_text` FROM `sms_in`', '/pureoxy/modules/generate/generate.php'),
(190, '::1', 'root', '2017-07-08 22:26:54', 'Query executed: SELECT `sms_text` FROM `sms_in`', '/pureoxy/modules/generate/generate.php'),
(191, '::1', 'root', '2017-07-08 22:26:54', 'Query executed: SELECT `sms_text` FROM `sms_in`', '/pureoxy/modules/generate/generate.php'),
(192, '::1', 'root', '2017-07-08 22:45:40', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(193, '::1', 'root', '2017-07-08 22:45:40', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(194, '::1', 'root', '2017-07-08 22:45:40', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(195, '::1', 'root', '2017-07-08 22:45:40', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(196, '::1', 'root', '2017-07-08 22:45:40', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(197, '::1', 'root', '2017-07-08 22:57:30', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(198, '::1', 'root', '2017-07-08 22:57:30', 'Query executed: INSERT INTO air_data (co2, co, module_id) VALUES (1,2,3)', '/pureoxy/modules/generate/generate.php'),
(199, '::1', 'root', '2017-07-08 22:57:57', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(200, '::1', 'root', '2017-07-08 22:57:57', 'Query executed: INSERT INTO air_data (co2, co, module_id) VALUES (1,2,3)', '/pureoxy/modules/generate/generate.php'),
(201, '::1', 'root', '2017-07-08 23:01:16', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(202, '::1', 'root', '2017-07-08 23:02:12', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(203, '::1', 'root', '2017-07-08 23:39:11', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(204, '::1', 'root', '2017-07-08 23:40:03', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(205, '::1', 'root', '2017-07-08 23:52:52', 'Pressed cancel button', '/pureoxy/modules/air/air_data/edit_air_data.php'),
(206, '::1', 'root', '2017-07-08 23:52:57', 'Pressed cancel button', '/pureoxy/modules/air/air_data/edit_air_data.php'),
(207, '::1', 'root', '2017-07-09 00:01:40', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(208, '::1', 'root', '2017-07-09 00:01:49', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(209, '::1', 'root', '2017-07-09 00:02:27', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(210, '::1', 'root', '2017-07-09 00:03:58', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(211, '::1', 'root', '2017-07-09 00:04:53', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(212, '::1', 'root', '2017-07-09 00:05:51', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(213, '::1', 'root', '2017-07-09 00:06:30', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(214, '::1', 'root', '2017-07-09 00:08:52', 'Query executed: SELECT * FROM `sms_in` LIMIT 1', '/pureoxy/modules/generate/generate.php'),
(215, '::1', 'root', '2017-07-09 09:28:49', 'Logged in', '/pureoxy/login.php'),
(216, '::1', 'root', '2017-07-09 10:10:04', 'Pressed submit button', '/pureoxy/modules/air/air_data/add_air_data.php'),
(217, '::1', 'root', '2017-07-09 10:10:04', 'Query Executed: INSERT INTO air_data(id, quality, co2, co, percentage, time, date, module_id) VALUES(?,?,?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssissi\n    [1] => \n    [2] => SAFE\n    [3] => 10\n    [4] => 10\n    [5] => 20\n    [6] => 8:40:00\n    [7] => 2017-07-06\n    [8] => 1\n)\n', '/pureoxy/modules/air/air_data/add_air_data.php'),
(218, '::1', 'root', '2017-07-09 10:10:33', 'Pressed submit button', '/pureoxy/modules/air/air_data/add_air_data.php'),
(219, '::1', 'root', '2017-07-09 10:10:33', 'Query Executed: INSERT INTO air_data(id, quality, co2, co, percentage, time, date, module_id) VALUES(?,?,?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssissi\n    [1] => \n    [2] => SAFE\n    [3] => 150\n    [4] => 15\n    [5] => 20\n    [6] => 9:40:00\n    [7] => 2017-07-06\n    [8] => 1\n)\n', '/pureoxy/modules/air/air_data/add_air_data.php'),
(220, '::1', 'root', '2017-07-09 10:10:46', 'Pressed submit button', '/pureoxy/modules/air/air_data/edit_air_data.php'),
(221, '::1', 'root', '2017-07-09 10:10:46', 'Query Executed: UPDATE air_data SET quality = ?, co2 = ?, co = ?, percentage = ?, time = ?, date = ?, module_id = ? WHERE id = ?\r\nArray\n(\n    [0] => sssissii\n    [1] => ACCEPTABLE\n    [2] => 100\n    [3] => 15\n    [4] => 40\n    [5] => 4:50:04\n    [6] => 2017-07-07\n    [7] => 1\n    [8] => 13\n)\n', '/pureoxy/modules/air/air_data/edit_air_data.php'),
(222, '::1', 'root', '2017-07-09 10:10:52', 'Pressed submit button', '/pureoxy/modules/air/air_data/edit_air_data.php'),
(223, '::1', 'root', '2017-07-09 10:10:52', 'Query Executed: UPDATE air_data SET quality = ?, co2 = ?, co = ?, percentage = ?, time = ?, date = ?, module_id = ? WHERE id = ?\r\nArray\n(\n    [0] => sssissii\n    [1] => SAFE\n    [2] => 150\n    [3] => 15\n    [4] => 20\n    [5] => 9:40:00\n    [6] => 2017-07-05\n    [7] => 1\n    [8] => 15\n)\n', '/pureoxy/modules/air/air_data/edit_air_data.php'),
(224, '::1', 'root', '2017-07-09 12:37:48', 'Pressed submit button', '/pureoxy/modules/module/module/add_module.php'),
(225, '::1', 'root', '2017-07-09 12:37:49', 'Query Executed: INSERT INTO module(id, location, city, latitude, longitude, number) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => APC\n    [3] => Makati\n    [4] => 14.530727567562602\n    [5] => 121.02043874168396\n    [6] => 09063948867\n)\n', '/pureoxy/modules/module/module/add_module.php'),
(226, '::1', 'root', '2017-07-09 12:38:56', 'Pressed submit button', '/pureoxy/modules/module/module/add_module.php'),
(227, '::1', 'root', '2017-07-09 12:38:56', 'Query Executed: INSERT INTO module(id, location, city, latitude, longitude, number) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => Urdaneta\n    [3] => Makati\n    [4] => 14.5553713527648\n    [5] => 121.02980501556397\n    [6] => 09239203923\n)\n', '/pureoxy/modules/module/module/add_module.php');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `setting` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`setting`, `value`) VALUES
('Max Attachment Height', '0'),
('Max Attachment Size (MB)', '0'),
('Max Attachment Width', '0'),
('Security Level', 'HIGH');

-- --------------------------------------------------------

--
-- Table structure for table `system_skins`
--

CREATE TABLE `system_skins` (
  `skin_id` int(11) NOT NULL,
  `skin_name` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL,
  `footer` varchar(255) NOT NULL,
  `master_css` varchar(255) NOT NULL,
  `colors_css` varchar(255) NOT NULL,
  `fonts_css` varchar(255) NOT NULL,
  `override_css` varchar(255) NOT NULL,
  `icon_set` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_skins`
--

INSERT INTO `system_skins` (`skin_id`, `skin_name`, `header`, `footer`, `master_css`, `colors_css`, `fonts_css`, `override_css`, `icon_set`) VALUES
(1, 'Cobalt Default', 'skins/default_header.php', 'skins/default_footer.php', 'cobalt_master.css', 'cobalt_colors.css', 'cobalt_fonts.css', 'cobalt_override.css', 'cobalt'),
(2, 'Cobalt Minimal', 'skins/minimal_header.php', 'skins/minimal_footer.php', 'cobalt_minimal.css', 'cobalt_minimal.css', 'cobalt_minimal.css', 'cobalt_minimal.css', 'cobalt'),
(3, 'After Sunset', 'skins/default_header.php', 'skins/default_footer.php', 'after_sunset_master.css', 'after_sunset_colors.css', 'after_sunset_fonts.css', 'after_sunset_override.css', 'cobalt'),
(4, 'Hello There', 'skins/default_header.php', 'skins/default_footer.php', 'hello_there_master.css', 'hello_there_colors.css', 'hello_there_fonts.css', 'hello_there_override.css', 'cobalt'),
(5, 'Gold Titanium', 'skins/default_header.php', 'skins/default_footer.php', 'gold_titanium_master.css', 'gold_titanium_colors.css', 'gold_titanium_fonts.css', 'gold_titanium_override.css', 'cobalt'),
(6, 'Summer Rain', 'skins/default_header.php', 'skins/default_footer.php', 'summer_rain_master.css', 'summer_rain_colors.css', 'summer_rain_fonts.css', 'summer_rain_override.css', 'cobalt'),
(7, 'Salmon Impression', 'skins/default_header.php', 'skins/default_footer.php', 'salmon_impression_master.css', 'salmon_impression_colors.css', 'salmon_impression_fonts.css', 'salmon_impression_override.css', 'cobalt'),
(8, 'Royal Amethyst', 'skins/default_header.php', 'skins/default_footer.php', 'royal_amethyst_master.css', 'royal_amethyst_colors.css', 'royal_amethyst_fonts.css', 'royal_amethyst_override.css', 'cobalt'),
(9, 'Red Decadence', 'skins/default_header.php', 'skins/default_footer.php', 'red_decadence_master.css', 'red_decadence_colors.css', 'red_decadence_fonts.css', 'red_decadence_override.css', 'cobalt'),
(10, 'Modern Eden', 'skins/default_header.php', 'skins/default_footer.php', 'modern_eden_master.css', 'modern_eden_colors.css', 'modern_eden_fonts.css', 'modern_eden_override.css', 'cobalt'),
(11, 'Warm Teal', 'skins/default_header.php', 'skins/default_footer.php', 'warm_teal_master.css', 'warm_teal_colors.css', 'warm_teal_fonts.css', 'warm_teal_override.css', 'cobalt'),
(12, 'Purple Rain', 'skins/default_header.php', 'skins/default_footer.php', 'purple_rain_master.css', 'purple_rain_colors.css', 'purple_rain_fonts.css', 'purple_rain_override.css', 'cobalt');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `iteration` int(11) NOT NULL,
  `method` varchar(255) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `salt`, `iteration`, `method`, `person_id`, `role_id`, `skin_id`) VALUES
('cooladrian', '$2y$12$4iL9xgPEBnw4cWT7NaABQ.7fcwAJRiqHDHmKbxxAEGupfNm5lOoRO', '4iL9xgPEBnw4cWT7NaABQA', 12, 'blowfish', 1, 2, 3),
('root', '$2y$12$MRuj.c3cTOku4xsAaEnvs.opSXjXJuf/0OsFzwu.pwsey9aGGL7w.', 'MRuj+c3cTOku4xsAaEnvsA', 12, 'blowfish', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_links`
--

CREATE TABLE `user_links` (
  `link_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `descriptive_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `passport_group_id` int(11) NOT NULL,
  `show_in_tasklist` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_links`
--

INSERT INTO `user_links` (`link_id`, `name`, `target`, `descriptive_title`, `description`, `passport_group_id`, `show_in_tasklist`, `status`, `icon`, `priority`) VALUES
(1, 'Module Control', 'sysadmin/module_control.php', 'Module Control', 'Enable or disable system modules', 2, 'Yes', 'On', 'modulecontrol.png', 0),
(2, 'Set User Passports', 'sysadmin/set_user_passports.php', 'Set User Passports', 'Change the passport settings of system users', 2, 'Yes', 'On', 'passport.png', 0),
(3, 'Security Monitor', 'sysadmin/security_monitor.php', 'Security Monitor', 'Examine the system log', 2, 'Yes', 'On', 'security3.png', 0),
(4, 'Add person', 'sysadmin/add_person.php', 'Add Person', '', 2, 'No', 'On', 'form.png', 0),
(5, 'Edit person', 'sysadmin/edit_person.php', 'Edit Person', '', 2, 'No', 'On', 'form.png', 0),
(6, 'View person', 'sysadmin/listview_person.php', 'Person', '', 2, 'Yes', 'On', 'persons.png', 0),
(7, 'Delete person', 'sysadmin/delete_person.php', 'Delete Person', '', 2, 'No', 'On', 'form.png', 0),
(8, 'Add user', 'sysadmin/add_user.php', 'Add User', '', 2, 'No', 'On', 'form.png', 0),
(9, 'Edit user', 'sysadmin/edit_user.php', 'Edit User', '', 2, 'No', 'On', 'form.png', 0),
(10, 'View user', 'sysadmin/listview_user.php', 'User', '', 2, 'Yes', 'On', 'card.png', 0),
(11, 'Delete user', 'sysadmin/delete_user.php', 'Delete User', '', 2, 'No', 'On', 'form.png', 0),
(12, 'Add user role', 'sysadmin/add_user_role.php', 'Add User Role', '', 2, 'No', 'On', 'form.png', 0),
(13, 'Edit user role', 'sysadmin/edit_user_role.php', 'Edit User Role', '', 2, 'No', 'On', 'form.png', 0),
(14, 'View user role', 'sysadmin/listview_user_role.php', 'User Roles', '', 2, 'Yes', 'On', 'roles.png', 0),
(15, 'Delete user role', 'sysadmin/delete_user_role.php', 'Delete User Role', '', 2, 'No', 'On', 'form.png', 0),
(16, 'Add system settings', 'sysadmin/add_system_settings.php', 'Add System Settings', '', 2, 'No', 'On', 'form.png', 0),
(17, 'Edit system settings', 'sysadmin/edit_system_settings.php', 'Edit System Settings', '', 2, 'No', 'On', 'form.png', 0),
(18, 'View system settings', 'sysadmin/listview_system_settings.php', 'System Settings', '', 2, 'Yes', 'On', 'system_settings.png', 0),
(19, 'Delete system settings', 'sysadmin/delete_system_settings.php', 'Delete System Settings', '', 2, 'No', 'On', 'form.png', 0),
(20, 'Add user links', 'sysadmin/add_user_links.php', 'Add User Links', '', 2, 'No', 'On', 'form.png', 0),
(21, 'Edit user links', 'sysadmin/edit_user_links.php', 'Edit User Links', '', 2, 'No', 'On', 'form.png', 0),
(22, 'View user links', 'sysadmin/listview_user_links.php', 'User Links', '', 2, 'Yes', 'On', 'links.png', 0),
(23, 'Delete user links', 'sysadmin/delete_user_links.php', 'Delete User Links', '', 2, 'No', 'On', 'form.png', 0),
(24, 'Add user passport groups', 'sysadmin/add_user_passport_groups.php', 'Add User Passport Groups', '', 2, 'No', 'On', 'form.png', 0),
(25, 'Edit user passport groups', 'sysadmin/edit_user_passport_groups.php', 'Edit User Passport Groups', '', 2, 'No', 'On', 'form.png', 0),
(26, 'View user passport groups', 'sysadmin/listview_user_passport_groups.php', 'User Passport Groups', '', 2, 'Yes', 'On', 'passportgroup.png', 0),
(27, 'Delete user passport groups', 'sysadmin/delete_user_passport_groups.php', 'Delete User Passport Groups', '', 2, 'No', 'On', 'form.png', 0),
(28, 'Add system skins', 'sysadmin/add_system_skins.php', 'Add System Skins', '', 2, 'No', 'On', 'form.png', 0),
(29, 'Edit system skins', 'sysadmin/edit_system_skins.php', 'Edit System Skins', '', 2, 'No', 'On', 'form.png', 0),
(30, 'View system skins', 'sysadmin/listview_system_skins.php', 'System Skins', '', 2, 'Yes', 'On', 'system_skins.png', 0),
(31, 'Delete system skins', 'sysadmin/delete_system_skins.php', 'Delete System Skins', '', 2, 'No', 'On', 'form.png', 0),
(32, 'Reset Password', 'sysadmin/reset_password.php', 'Reset Password', '', 2, 'Yes', 'On', 'lock_big.png', 0),
(33, 'Add cobalt sst', 'sst/add_cobalt_sst.php', 'Add Cobalt SST', '', 2, 'No', 'On', 'form3.png', 0),
(34, 'Edit cobalt sst', 'sst/edit_cobalt_sst.php', 'Edit Cobalt SST', '', 2, 'No', 'On', 'form3.png', 0),
(35, 'View cobalt sst', 'sst/listview_cobalt_sst.php', 'Cobalt SST', '', 2, 'Yes', 'On', 'form3.png', 0),
(36, 'Delete cobalt sst', 'sst/delete_cobalt_sst.php', 'Delete Cobalt SST', '', 2, 'No', 'On', 'form3.png', 0),
(37, 'Add air data', 'modules/air/air_data/add_air_data.php', 'Add Air Data', '', 1, 'No', 'On', 'form3.png', 0),
(38, 'Edit air data', 'modules/air/air_data/edit_air_data.php', 'Edit Air Data', '', 1, 'No', 'On', 'form3.png', 0),
(39, 'View air data', 'modules/air/air_data/listview_air_data.php', 'Air Data', '', 1, 'Yes', 'On', 'form3.png', 0),
(40, 'Delete air data', 'modules/air/air_data/delete_air_data.php', 'Delete Air Data', '', 1, 'No', 'On', 'form3.png', 0),
(41, 'Add from module', 'modules/module/from_module/add_from_module.php', 'Add From Module', '', 1, 'No', 'On', 'form3.png', 0),
(42, 'Edit from module', 'modules/module/from_module/edit_from_module.php', 'Edit From Module', '', 1, 'No', 'On', 'form3.png', 0),
(43, 'View from module', 'modules/module/from_module/listview_from_module.php', 'From Module', '', 1, 'Yes', 'On', 'form3.png', 0),
(44, 'Delete from module', 'modules/module/from_module/delete_from_module.php', 'Delete From Module', '', 1, 'No', 'On', 'form3.png', 0),
(45, 'Add module', 'modules/module/module/add_module.php', 'Add Module', '', 1, 'No', 'On', 'form3.png', 0),
(46, 'Edit module', 'modules/module/module/edit_module.php', 'Edit Module', '', 1, 'No', 'On', 'form3.png', 0),
(47, 'View module', 'modules/module/module/listview_module.php', 'Module', '', 1, 'Yes', 'On', 'form3.png', 0),
(48, 'Delete module', 'modules/module/module/delete_module.php', 'Delete Module', '', 1, 'No', 'On', 'form3.png', 0),
(49, 'Add sms in', 'modules/module/sms_in/add_sms_in.php', 'Add Sms In', '', 1, 'No', 'On', 'form3.png', 0),
(50, 'Edit sms in', 'modules/module/sms_in/edit_sms_in.php', 'Edit Sms In', '', 1, 'No', 'On', 'form3.png', 0),
(51, 'View sms in', 'modules/module/sms_in/listview_sms_in.php', 'Sms In', '', 1, 'Yes', 'On', 'form3.png', 0),
(52, 'Delete sms in', 'modules/module/sms_in/delete_sms_in.php', 'Delete Sms In', '', 1, 'No', 'On', 'form3.png', 0),
(53, 'Generate', 'modules/generate/generate.php', 'Generate Data', '', 1, 'Yes', 'On', 'form3.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_passport`
--

CREATE TABLE `user_passport` (
  `username` varchar(255) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_passport`
--

INSERT INTO `user_passport` (`username`, `link_id`) VALUES
('cooladrian', 1),
('cooladrian', 2),
('cooladrian', 3),
('cooladrian', 4),
('cooladrian', 5),
('cooladrian', 6),
('cooladrian', 7),
('cooladrian', 8),
('cooladrian', 9),
('cooladrian', 10),
('cooladrian', 11),
('cooladrian', 12),
('cooladrian', 13),
('cooladrian', 14),
('cooladrian', 15),
('cooladrian', 16),
('cooladrian', 17),
('cooladrian', 18),
('cooladrian', 19),
('cooladrian', 20),
('cooladrian', 21),
('cooladrian', 22),
('cooladrian', 23),
('cooladrian', 24),
('cooladrian', 25),
('cooladrian', 26),
('cooladrian', 27),
('cooladrian', 28),
('cooladrian', 29),
('cooladrian', 30),
('cooladrian', 31),
('cooladrian', 32),
('cooladrian', 33),
('cooladrian', 34),
('cooladrian', 35),
('cooladrian', 36),
('root', 1),
('root', 2),
('root', 3),
('root', 4),
('root', 5),
('root', 6),
('root', 7),
('root', 8),
('root', 9),
('root', 10),
('root', 11),
('root', 12),
('root', 13),
('root', 14),
('root', 15),
('root', 16),
('root', 17),
('root', 18),
('root', 19),
('root', 20),
('root', 21),
('root', 22),
('root', 23),
('root', 24),
('root', 25),
('root', 26),
('root', 27),
('root', 28),
('root', 29),
('root', 30),
('root', 31),
('root', 32),
('root', 33),
('root', 34),
('root', 35),
('root', 36),
('root', 37),
('root', 38),
('root', 39),
('root', 40),
('root', 41),
('root', 42),
('root', 43),
('root', 44),
('root', 45),
('root', 46),
('root', 47),
('root', 48),
('root', 49),
('root', 50),
('root', 51),
('root', 52),
('root', 53);

-- --------------------------------------------------------

--
-- Table structure for table `user_passport_groups`
--

CREATE TABLE `user_passport_groups` (
  `passport_group_id` int(11) NOT NULL,
  `passport_group` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_passport_groups`
--

INSERT INTO `user_passport_groups` (`passport_group_id`, `passport_group`, `priority`, `icon`) VALUES
(1, 'Default', 0, 'blue_folder3.png'),
(2, 'Admin', 0, 'preferences-system.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role_id`, `role`, `description`) VALUES
(1, 'Super Admin', 'Super admin role with 100% system privileges'),
(2, 'System Admin', 'System admin role with all sysadmin permissions');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_links`
--

CREATE TABLE `user_role_links` (
  `role_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role_links`
--

INSERT INTO `user_role_links` (`role_id`, `link_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `air_data`
--
ALTER TABLE `air_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `cobalt_reporter`
--
ALTER TABLE `cobalt_reporter`
  ADD PRIMARY KEY (`module_name`,`report_name`);

--
-- Indexes for table `cobalt_sst`
--
ALTER TABLE `cobalt_sst`
  ADD PRIMARY KEY (`auto_id`);

--
-- Indexes for table `from_module`
--
ALTER TABLE `from_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `sms_in`
--
ALTER TABLE `sms_in`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`entry_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`setting`);

--
-- Indexes for table `system_skins`
--
ALTER TABLE `system_skins`
  ADD PRIMARY KEY (`skin_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_links`
--
ALTER TABLE `user_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `user_passport`
--
ALTER TABLE `user_passport`
  ADD PRIMARY KEY (`username`,`link_id`);

--
-- Indexes for table `user_passport_groups`
--
ALTER TABLE `user_passport_groups`
  ADD PRIMARY KEY (`passport_group_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user_role_links`
--
ALTER TABLE `user_role_links`
  ADD PRIMARY KEY (`role_id`,`link_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `air_data`
--
ALTER TABLE `air_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `cobalt_sst`
--
ALTER TABLE `cobalt_sst`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `from_module`
--
ALTER TABLE `from_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sms_in`
--
ALTER TABLE `sms_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `system_log`
--
ALTER TABLE `system_log`
  MODIFY `entry_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;
--
-- AUTO_INCREMENT for table `system_skins`
--
ALTER TABLE `system_skins`
  MODIFY `skin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user_links`
--
ALTER TABLE `user_links`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `user_passport_groups`
--
ALTER TABLE `user_passport_groups`
  MODIFY `passport_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
