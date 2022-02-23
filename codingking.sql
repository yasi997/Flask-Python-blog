-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2022 at 02:40 PM
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
-- Database: `codingking`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `Sno` int(100) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Phone_no` varchar(30) NOT NULL,
  `Message` varchar(500) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`Sno`, `Name`, `Email`, `Phone_no`, `Message`, `Date`) VALUES
(1, 'kkkk;;;', 'kkkk@gmail.com', '1212133', 'kmmmkm  kmk  m k', '2022-02-04 03:18:21'),
(2, 'kkk', 'yasir.hussain996@gma', '99999', 'bbbbbbbbbbb', '2022-02-04 03:46:52'),
(3, '', '', '', '', '2022-02-05 14:34:12'),
(4, '', '', '', '', '2022-02-05 14:34:50'),
(5, '', '', '', '', '2022-02-05 15:19:12'),
(6, 'ff', 'faikehussain222@gmai', '777', 'show hogaya', '2022-02-05 16:17:01'),
(7, 'ff', 'faikehussain222@gmai', '122', 'hogya', '2022-02-05 16:19:04'),
(8, 'ff', 'yasir.hussain996@gma', '99999', 'sssss', '2022-02-05 16:21:44'),
(9, 'ff', 'yasir.hussain996@gma', '99999', 'sssss', '2022-02-05 16:28:46'),
(10, 'ff', 'yasir.hussain996@gma', '99999', 'sssss', '2022-02-05 16:43:10'),
(11, 'zoya', 'faikehussain222@gmai', '12344', 'hello world', '2022-02-05 16:43:46'),
(12, 'zoya', 'faikehussain222@gmai', '12344', 'there', '2022-02-05 16:44:41'),
(13, 'jawad', 'yasir.hussain996@gma', '99999', 'ssssssdaa', '2022-02-05 16:53:52'),
(14, 'zoya', 'faikehussain222@gmai', '12344', 'Testing app', '2022-02-05 17:08:06'),
(15, 'zoya', 'faikehussain222@gmai', '12344', 'Testing app', '2022-02-05 17:14:49'),
(16, 'jawad', 'faikehussain222@gmai', '99999', 'testing purpose', '2022-02-05 17:15:27'),
(17, 'USMAN', 'faikehussain222@gmai', '12345', 'ALSO TESTING PURPOSE', '2022-02-06 17:06:11');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `Sno` int(11) NOT NULL,
  `Tittle` varchar(100) NOT NULL,
  `sub_heading` varchar(500) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `Content` varchar(500) NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`Sno`, `Tittle`, `sub_heading`, `slug`, `Content`, `img_file`, `Date`) VALUES
(2, 'Stock exchange', 'To be able to trade a security on a certain stock exchange.', 'second-post', 'A stock exchange, securities exchange, or bourse[note 1] is an exchange where stockbrokers and traders can buy and sell securities, such as shares of stock, bonds, and other financial instruments. Stock exchanges may also provide facilities for the issue and redemption of such securities and instruments and capital events including the payment of income and dividends.[citation needed] Securities traded on a stock exchange include stock issued by listed companies, unit trusts, derivatives, pooled', 'about-bg.jpg', '2022-02-07 00:32:17'),
(3, 'Facebook Side Effect', 'Danger Facebook', 'new-post', 'tittle', 'img.JPG', '2022-02-17 03:04:29'),
(4, 'Facebook Side Effect', 'Danger Facebook', 'new-post', 'tittle', 'img.JPG', '2022-02-17 03:09:03'),
(5, 'Stocks exchange', 'Danger Facebook', 'new-post', '>', 'img.JPG', '2022-02-17 04:15:51'),
(6, 'mmmm', ',mmmm', 'new-post', '>', 'img.JPG', '2022-02-17 04:16:54'),
(7, 'ta', 'ta', 'm-post', 'bbbbbbbbb', 'img.JPG', '2022-02-17 04:25:14'),
(8, 'Facebook Side Effect', 'Danger Facebook', 'new-post', 'mmmmmmmm', 'img.JPG', '2022-02-17 04:26:42'),
(9, 'Facebook Side Effect', 'Danger Facebook', 'new-post', 'mmmmmmmm', 'img.JPG', '2022-02-17 04:26:54'),
(10, 'Facebook Side Effect', 'Danger Facebook', 'new-post', 'mmmmmmmm', 'img.JPG', '2022-02-17 04:27:23'),
(11, 'Facebook Side Effect', 'Danger Facebook', 'new-post', 'mmmmmmmm', 'img.JPG', '2022-02-17 04:28:50'),
(12, '', 'ta', 'm-post', 'k', 'img.JPG', '2022-02-17 17:17:42'),
(13, '', '', '', '', '', '2022-02-17 16:58:08'),
(14, 'Facebook Side Effect', 'Danger Facebook', 'm-post', 'kikikiki', 'img.JPG', '2022-02-17 16:58:21'),
(15, 'Facebook Side Effect', 'Danger Facebook', 'm-post', 'kikikiki', 'img.JPG', '2022-02-17 17:04:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `Sno` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
