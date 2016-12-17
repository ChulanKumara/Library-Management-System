-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2016 at 05:33 AM
-- Server version: 5.6.17-log
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sksc_library_ms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `username` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `fname`, `lname`, `username`, `password`) VALUES
(1, 'test', 'test', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int(15) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `author` varchar(150) NOT NULL,
  `publisher` varchar(150) NOT NULL,
  `category` varchar(150) NOT NULL,
  `ISBN` varchar(25) NOT NULL,
  `edition` varchar(50) NOT NULL,
  `available_copies` int(5) NOT NULL,
  `number_of_copies` int(5) NOT NULL,
  `popularity` int(5) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `category`, `ISBN`, `edition`, `available_copies`, `number_of_copies`, `popularity`) VALUES
(1, 'Story of a Real Man', 'Boris Nicholaevich Polevoi', 'S. Godage and Brothers', 'Novel', 'ISBN 978-955-30-1399-6', '2', 9, 10, 1),
(2, 'The Blue Economy', 'Gunter Pauli', 'Paradigm Publications', 'Technology: biomimetics', 'ISBN 1-930865-31-7', '1', 5, 5, NULL),
(3, 'A Civil Action', 'Jonathan Harr', 'Random House', 'Pollution: water pollution', 'ISBN 0-679-77267-7', '2', 4, 4, NULL),
(4, 'Collapse: How Societies Choose to Fail or Succeed', 'Jared M. Diamond', 'Viking Press', 'hardback and paperback', 'ISBN 0-14-303655-6', '2', 5, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `member_id` int(15) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `NIC` varchar(35) NOT NULL,
  `age` int(2) NOT NULL,
  `registered_date` date NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `fname`, `lname`, `address`, `city`, `street`, `phone`, `email`, `NIC`, `age`, `registered_date`) VALUES
(212, 'Samintha', 'Kaveesh', '125', 'Kelaniya', 'Pamunuwila', '0710860330', 'skaveesh@gmail.com', '950527777V', 21, '2016-03-17'),
(414, 'Chulan', 'Kotudurage', '213/A', 'Makola', 'Sirimangala Road', '0713253234', 'chulankotudurage@gmail.com', '95364467V', 20, '2016-03-19'),
(616, 'Kalana', 'Wijesekara', '323', 'Thalawathugoda', 'Depanama', '0772313412', 'manjitharox@gmail.com', '942482821V', 21, '2016-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` int(5) NOT NULL AUTO_INCREMENT,
  `member_id` int(15) DEFAULT NULL,
  `book_id` int(15) DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `transactions_ibfk_2` (`book_id`),
  KEY `transactions_ibfk_1` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `member_id`, `book_id`, `borrow_date`, `due_date`) VALUES
(1, 212, 1, '2016-03-19', '2016-03-25');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
