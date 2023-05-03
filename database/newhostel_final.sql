-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2022 at 07:37 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newhostel`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_branch_year` (IN `category` NVARCHAR(30), IN `hos_id` INT)  BEGIN

if(category='branch') then
	SELECT dept as Department, count(*) as total_student
     from Student where Hostel_id=hos_id
     group by dept
     order by total_student desc;
     
     end if;

if(category='year') then
	SELECT GetYearName(cast(Year_of_study as unsigned)),count(*) as total_student
		 from Student where Hostel_id=hos_id
		 group by Year_of_study
		 order by total_student desc;
end if;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `GetYearName` (`yearnumber` INT) RETURNS VARCHAR(30) CHARSET latin1 BEGIN

   DECLARE yearName varchar(30);
   
   if yearnumber=1 then
   set yearName='First';
   end if;
   
   if yearnumber=2 then
   set yearName='Second';
   end if;
   
   if yearnumber=3 then
   set yearName='Third';
   end if;
   
   if yearnumber=4 then
   set yearName='Fourth';
   end if;
   
   
   RETURN yearName;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `Application_id` int(100) NOT NULL,
  `Student_id` varchar(255) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Application_status` tinyint(1) DEFAULT NULL,
  `Room_No` int(10) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `application_mess`
--

CREATE TABLE `application_mess` (
  `Application_id` int(100) NOT NULL,
  `Student_id` varchar(255) NOT NULL,
  `Mess_id` int(10) NOT NULL,
  `Application_status` tinyint(1) DEFAULT NULL,
  `Mess_card_No` int(10) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `Hostel_id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `rooms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `Hostel_id` int(10) NOT NULL,
  `Hostel_name` varchar(255) NOT NULL,
  `current_no_of_rooms` int(15) DEFAULT 0,
  `No_of_rooms` int(15) DEFAULT 5,
  `No_of_students` int(10) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`Hostel_id`, `Hostel_name`, `current_no_of_rooms`, `No_of_rooms`, `No_of_students`) VALUES
(1, 'A', 4, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `hostel_manager`
--

CREATE TABLE `hostel_manager` (
  `Hostel_man_id` int(10) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Mess_id` int(10) NOT NULL,
  `Pwd` longtext NOT NULL,
  `Isadmin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostel_manager`
--

INSERT INTO `hostel_manager` (`Hostel_man_id`, `Username`, `Fname`, `Lname`, `Mob_no`, `Hostel_id`, `Mess_id`, `Pwd`, `Isadmin`) VALUES
(1, 'mainadmin', 'Admin', 'NITK', '987654321', 1, 1, '$2y$10$k0hgSBMCarbZorLyDzEve./qZbWERWs1CReacaaLQdZxEamBstNiS', 1),
(10, 'manager', 'aaa', 'sss', '5464654', 1, 1, '$2y$10$rfcDwCCPUxWsA3stdejh2u0fHzN7f1aqMBUYMnUW1dB3I63zWQSbq', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `hostel_manager_profile`
-- (See below for the actual view)
--
CREATE TABLE `hostel_manager_profile` (
`Hostel_man_id` int(10)
,`Username` varchar(255)
,`Fname` varchar(255)
,`Lname` varchar(255)
,`Mob_no` varchar(255)
,`Hostel_name` varchar(255)
,`Mess_name` varchar(255)
,`Hostel_Occupancy` decimal(19,1)
,`Mess_Occupancy` decimal(20,1)
);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `Hostel_id` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `Hostel_id`, `filename`) VALUES
(1, 0, 'Untitled-1.jpg'),
(2, 1, '131652661Nashik_Kalaram_Mandir_Main.jpg'),
(3, 1, 'wallpaperflare.com_wallpaper(1).jpg'),
(4, 1, 'wallpaperflare.com_wallpaper(4).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mess`
--

CREATE TABLE `mess` (
  `Mess_id` int(10) NOT NULL,
  `Mess_name` varchar(255) NOT NULL,
  `Mess_type` varchar(255) NOT NULL,
  `Vacancy` int(15) DEFAULT 5,
  `Size` int(15) DEFAULT 5,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mess`
--

INSERT INTO `mess` (`Mess_id`, `Mess_name`, `Mess_type`, `Vacancy`, `Size`, `description`) VALUES
(1, 'A', 'Veg', 2, 5, ''),
(2, 'B', 'Veg', 3, 5, ''),
(3, 'C', 'Veg', 5, 5, ''),
(4, 'D', 'Non-veg', 4, 5, ''),
(5, 'E', 'Non-veg', 4, 5, ''),
(6, 'F', 'Non-veg', 4, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `messimage`
--

CREATE TABLE `messimage` (
  `id` int(11) NOT NULL,
  `mess_id` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messimage`
--

INSERT INTO `messimage` (`id`, `mess_id`, `filename`) VALUES
(6, 1, 'EPXUYD~1.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `mess_allocation`
--

CREATE TABLE `mess_allocation` (
  `Mess_card_id` int(10) NOT NULL,
  `Mess_id` int(10) NOT NULL,
  `Mess_card_No` int(10) NOT NULL,
  `Allocated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mess_allocation`
--

INSERT INTO `mess_allocation` (`Mess_card_id`, `Mess_id`, `Mess_card_No`, `Allocated`) VALUES
(26, 6, 1, 1),
(27, 6, 2, 0),
(28, 6, 3, 0),
(29, 6, 4, 0),
(30, 6, 5, 0);

--
-- Triggers `mess_allocation`
--
DELIMITER $$
CREATE TRIGGER `mess_allocation_update` AFTER UPDATE ON `mess_allocation` FOR EACH ROW IF NEW.Allocated =1 and OLD.Allocated!=NEW.Allocated THEN 
		update Mess set Vacancy=Vacancy-1 where Mess_id = NEW.Mess_id  ;
	else 
		if NEW.Allocated=0 and OLD.Allocated!=NEW.Allocated THEN
			update Mess set Vacancy = Vacancy +1 where Mess_id= NEW.Mess_id;
		END IF;
	END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Student_id` varchar(255) NOT NULL,
  `Status` tinyint(1) DEFAULT 0,
  `Amount` int(10) DEFAULT 75000
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_id` int(10) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Room_No` int(10) NOT NULL,
  `Allocated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `room`
--
DELIMITER $$
CREATE TRIGGER `allocation_update` AFTER UPDATE ON `room` FOR EACH ROW IF NEW.allocated =1 and OLD.allocated!=NEW.allocated THEN 
	update Hostel set current_no_of_rooms=current_no_of_rooms+1, No_of_students = No_of_students+1 where Hostel_id=NEW.Hostel_id;
else 
	if NEW.allocated=0 and OLD.allocated!=NEW.allocated THEN
		update Hostel set current_no_of_rooms = current_no_of_rooms-1, 
        No_of_students = No_of_students-1 where Hostel_id=NEW.Hostel_id;
	END IF;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_id` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Dept` varchar(255) NOT NULL,
  `Year_of_study` varchar(255) NOT NULL,
  `Pwd` longtext NOT NULL,
  `Hostel_id` int(10) DEFAULT NULL,
  `Room_id` int(10) DEFAULT NULL,
  `Mess_id` int(10) DEFAULT NULL,
  `Mess_card_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_id`, `Fname`, `Lname`, `Mob_no`, `Dept`, `Year_of_study`, `Pwd`, `Hostel_id`, `Room_id`, `Mess_id`, `Mess_card_id`) VALUES
('abc@gmail.com', 'awsas', 'asasa', '4564657465', 'CSE', '2015', '$2y$10$uRfA4Jn8YsFIqkGmWcFo8OxxORLxNaP3BGI067xa2kZ4ThJLHs41G', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure for view `hostel_manager_profile`
--
DROP TABLE IF EXISTS `hostel_manager_profile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hostel_manager_profile`  AS  select `hm`.`Hostel_man_id` AS `Hostel_man_id`,`hm`.`Username` AS `Username`,`hm`.`Fname` AS `Fname`,`hm`.`Lname` AS `Lname`,`hm`.`Mob_no` AS `Mob_no`,`h`.`Hostel_name` AS `Hostel_name`,`m`.`Mess_name` AS `Mess_name`,round(`h`.`current_no_of_rooms` / `h`.`No_of_rooms` * 100,1) AS `Hostel_Occupancy`,round((`m`.`Size` - `m`.`Vacancy`) / `m`.`Size` * 100,1) AS `Mess_Occupancy` from ((`hostel_manager` `hm` join `hostel` `h` on(`hm`.`Hostel_id` = `h`.`Hostel_id`)) join `mess` `m` on(`m`.`Mess_id` = `hm`.`Mess_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`Application_id`),
  ADD KEY `Student_id` (`Student_id`),
  ADD KEY `Hostel_id` (`Hostel_id`);

--
-- Indexes for table `application_mess`
--
ALTER TABLE `application_mess`
  ADD PRIMARY KEY (`Application_id`),
  ADD KEY `Student_id` (`Student_id`),
  ADD KEY `Mess_id` (`Mess_id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`Hostel_id`);

--
-- Indexes for table `hostel_manager`
--
ALTER TABLE `hostel_manager`
  ADD PRIMARY KEY (`Hostel_man_id`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `Hostel_id` (`Hostel_id`),
  ADD KEY `Mess_id` (`Mess_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mess`
--
ALTER TABLE `mess`
  ADD PRIMARY KEY (`Mess_id`);

--
-- Indexes for table `messimage`
--
ALTER TABLE `messimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mess_allocation`
--
ALTER TABLE `mess_allocation`
  ADD PRIMARY KEY (`Mess_card_id`),
  ADD KEY `Mess_id` (`Mess_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Student_id`),
  ADD KEY `Student_id` (`Student_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_id`),
  ADD KEY `Hostel_id` (`Hostel_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_id`),
  ADD KEY `Hostel_id` (`Hostel_id`),
  ADD KEY `Room_id` (`Room_id`),
  ADD KEY `Mess_id` (`Mess_id`),
  ADD KEY `Mess_card_id` (`Mess_card_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `Application_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `application_mess`
--
ALTER TABLE `application_mess`
  MODIFY `Application_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `Hostel_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hostel_manager`
--
ALTER TABLE `hostel_manager`
  MODIFY `Hostel_man_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mess`
--
ALTER TABLE `mess`
  MODIFY `Mess_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messimage`
--
ALTER TABLE `messimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mess_allocation`
--
ALTER TABLE `mess_allocation`
  MODIFY `Mess_card_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `Room_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `Application_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `student` (`Student_id`),
  ADD CONSTRAINT `Application_ibfk_2` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`);

--
-- Constraints for table `application_mess`
--
ALTER TABLE `application_mess`
  ADD CONSTRAINT `Application_mess_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `student` (`Student_id`),
  ADD CONSTRAINT `Application_mess_ibfk_2` FOREIGN KEY (`Mess_id`) REFERENCES `mess` (`Mess_id`);

--
-- Constraints for table `hostel_manager`
--
ALTER TABLE `hostel_manager`
  ADD CONSTRAINT `Hostel_Manager_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`),
  ADD CONSTRAINT `Hostel_Manager_ibfk_2` FOREIGN KEY (`Mess_id`) REFERENCES `mess` (`Mess_id`);

--
-- Constraints for table `mess_allocation`
--
ALTER TABLE `mess_allocation`
  ADD CONSTRAINT `Mess_ibfk_1` FOREIGN KEY (`Mess_id`) REFERENCES `mess` (`Mess_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `student` (`Student_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`),
  ADD CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`Room_id`) REFERENCES `room` (`Room_id`),
  ADD CONSTRAINT `Student_ibfk_3` FOREIGN KEY (`Mess_id`) REFERENCES `mess` (`Mess_id`),
  ADD CONSTRAINT `Student_ibfk_4` FOREIGN KEY (`Mess_card_id`) REFERENCES `mess_allocation` (`Mess_card_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
