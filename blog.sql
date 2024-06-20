-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2024 at 07:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `author`, `created_at`) VALUES
(1, 'Exploring the Universe', 'The universe is vast and full of mysteries.', 'Jane Doe', '2024-06-19'),
(2, 'Exploring the Universe', 'The universe is vast and full of mysteries.', 'Jane Doe', '2024-06-19'),
(3, 'The Art of Cooking', 'Cooking is both an art and a science.', 'John Smith', '2024-06-19'),
(4, 'A Journey Through Time', 'Time travel has always fascinated scientists.', 'Emily Johnson', '2024-06-19'),
(5, 'The Wonders of Nature', 'Nature is full of breathtaking wonders.', 'Michael Brown', '2024-06-19'),
(6, 'The Science of Happiness', 'Happiness can be achieved through various means.', 'Sarah Davis', '2024-06-19'),
(7, 'The World of Technology', 'Technology is constantly evolving.', 'David Wilson', '2024-06-19'),
(8, 'Health and Wellness', 'Maintaining good health is essential for a fulfilling life.', 'Laura Martinez', '2024-06-19'),
(9, 'Traveling the Globe', 'Traveling allows you to experience new cultures.', 'Robert Garcia', '2024-06-19'),
(10, 'The History of Art', 'Art has a rich and diverse history.', 'Linda Rodriguez', '2024-06-19'),
(11, 'The Future of AI', 'Artificial Intelligence is shaping our future.', 'James Anderson', '2024-06-19'),
(12, 'The Power of Music', 'Music has the power to move and inspire.', 'Patricia Thomas', '2024-06-19'),
(13, 'Understanding Economics', 'Economics is crucial for understanding how the world works.', 'Christopher Martinez', '2024-06-19'),
(14, 'The Magic of Books', 'Books can transport you to different worlds.', 'Jessica Hernandez', '2024-06-19'),
(15, 'The World of Sports', 'Sports play an important role in society.', 'Daniel Lee', '2024-06-19'),
(16, 'Innovations in Medicine', 'Medical innovations are saving lives.', 'Barbara Walker', '2024-06-19'),
(17, 'The Beauty of Poetry', 'Poetry is a beautiful form of expression.', 'Richard Hall', '2024-06-19'),
(18, 'Exploring Psychology', 'Psychology helps us understand human behavior.', 'Susan Young', '2024-06-19'),
(19, 'The Impact of Climate Change', 'Climate change is one of the biggest challenges we face.', 'Matthew King', '2024-06-19'),
(20, 'The Evolution of Fashion', 'Fashion has evolved significantly over the years.', 'Nancy Scott', '2024-06-19'),
(21, 'The Science of Space', 'Space exploration is expanding our knowledge.', 'Elizabeth Green', '2024-06-19');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `author`, `article_id`) VALUES
(2, 'Great post! Very informative.', 'Alice', 2),
(3, 'I totally agree with this point.', 'Bob', 3),
(4, 'Thanks for sharing!', 'Charlie', 4),
(5, 'Interesting perspective.', 'David', 5),
(6, 'Loved this article!', 'Eve', 6),
(7, 'Well written and insightful.', 'Frank', 7),
(8, 'This was a helpful read.', 'Grace', 8),
(9, 'Keep up the good work!', 'Hank', 9),
(10, 'I learned a lot from this.', 'Ivy', 10),
(11, 'Fantastic write-up.', 'Jack', 11),
(12, 'This is exactly what I needed.', 'Kathy', 12),
(13, 'Could not agree more!', 'Leo', 13),
(14, 'Very well explained.', 'Mona', 14),
(15, 'Great advice!', 'Nina', 15),
(16, 'I have bookmarked this page.', 'Oscar', 16),
(17, 'Will definitely share this.', 'Paul', 17),
(18, 'Thanks for the tips!', 'Quinn', 18),
(19, 'Excellent article.', 'Rita', 19),
(20, 'Helpful and concise.', 'Steve', 1),
(21, 'Good read!', 'Tina', 2),
(22, 'Very informative.', 'Uma', 3),
(23, 'This was eye-opening.', 'Vince', 4),
(24, 'I appreciate the insights.', 'Wendy', 5),
(25, 'Really enjoyed this.', 'Xander', 6),
(26, 'Well done!', 'Yara', 7),
(27, 'I found this very useful.', 'Zane', 8),
(28, 'Thanks for the detailed post.', 'Amy', 9),
(29, 'I will share this with my friends.', 'Ben', 10),
(30, 'Nice blog!', 'Cara', 11),
(31, 'Interesting read.', 'Dylan', 12),
(32, 'Very helpful.', 'Ella', 13),
(33, 'Great job!', 'Finn', 14),
(34, 'This helped a lot.', 'Gina', 15),
(35, 'Informative content.', 'Hugo', 16),
(36, 'Appreciate this article.', 'Iris', 17),
(37, 'This is a must-read.', 'Jake', 18),
(38, 'Very engaging.', 'Karen', 19),
(39, 'I enjoyed this.', 'Liam', 1),
(40, 'Keep it up!', 'Mila', 2),
(41, 'Well written.', 'Nate', 3),
(42, 'Great insights.', 'Olivia', 4),
(43, 'Thanks for sharing.', 'Peter', 5),
(44, 'I learned something new today.', 'Queen', 6),
(45, 'Very good article.', 'Ryan', 7),
(46, 'I like this blog.', 'Sara', 8),
(47, 'Nicely explained.', 'Tom', 9),
(48, 'This was useful.', 'Ursula', 10),
(49, 'I appreciate the effort.', 'Victor', 11),
(50, 'Great content!', 'Willa', 12),
(51, 'Very well written.', 'Xena', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_articles_id` (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `ix_comments_id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
