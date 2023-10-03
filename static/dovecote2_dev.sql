-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-10-01 13:21:51
-- 服务器版本： 5.7.31
-- PHP 版本： 8.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `dovecote2_dev`
--

-- --------------------------------------------------------

--
-- 表的结构 `adminlogs`
--

CREATE TABLE `adminlogs` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `authId` int(11) DEFAULT NULL,
  `action` text,
  `query` json DEFAULT NULL,
  `body` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `adminlogs`
--

INSERT INTO `adminlogs` (`id`, `userId`, `authId`, `action`, `query`, `body`, `createdAt`, `updatedAt`) VALUES
(1, 3, NULL, '/api/office/admin/audit/17/reject', '{}', '{\"message\": \"不行，佛说不行\"}', '2023-08-25 20:37:23', '2023-08-25 20:37:23'),
(2, 3, NULL, '/api/office/admin/audit/17/reject', '{}', '{\"message\": \"4657\"}', '2023-08-25 20:39:04', '2023-08-25 20:39:04'),
(3, 3, 78, '/api/office/admin/audit/5/accept', '{}', '{}', '2023-08-30 12:47:30', '2023-08-30 12:47:30'),
(4, 3, 78, '/api/office/admin/audit/6/accept', '{}', '{}', '2023-08-30 12:47:31', '2023-08-30 12:47:31'),
(5, 3, 78, '/api/office/admin/audit/17/accept', '{}', '{}', '2023-08-30 12:47:31', '2023-08-30 12:47:31'),
(6, 3, 78, '/api/office/admin/audit/21/accept', '{}', '{}', '2023-08-30 12:51:26', '2023-08-30 12:51:26'),
(7, 3, 78, '/api/office/admin/audit/2/accept', '{}', '{}', '2023-08-30 12:51:28', '2023-08-30 12:51:28'),
(8, 3, 78, '/api/office/admin/audit/16/accept', '{}', '{}', '2023-08-30 12:55:45', '2023-08-30 12:55:45'),
(9, 3, 78, '/api/office/admin/audit/18/accept', '{}', '{}', '2023-08-30 12:55:45', '2023-08-30 12:55:45'),
(10, 3, 78, '/api/office/admin/audit/24/accept', '{}', '{}', '2023-09-04 15:20:06', '2023-09-04 15:20:06'),
(11, 3, 80, '/api/office/admin/audit/26/accept', '{}', '{}', '2023-09-14 15:39:07', '2023-09-14 15:39:07');

-- --------------------------------------------------------

--
-- 表的结构 `audits`
--

CREATE TABLE `audits` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) DEFAULT NULL,
  `auditStartAt` datetime DEFAULT NULL,
  `auditEndAt` datetime DEFAULT NULL,
  `auditMessage` text,
  `status` varchar(64) DEFAULT 'draft',
  `circleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `note` text,
  `auditUserId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `audits`
--

INSERT INTO `audits` (`id`, `targetType`, `targetId`, `auditStartAt`, `auditEndAt`, `auditMessage`, `status`, `circleId`, `userId`, `note`, `auditUserId`, `createdAt`, `updatedAt`) VALUES
(1, 'circle', 1, '2023-07-30 11:04:15', '2023-07-30 11:06:10', NULL, 'accepted', 1, 3, NULL, NULL, '2023-07-18 18:15:10', '2023-07-30 11:06:10'),
(2, 'circle', 2, '2023-08-30 12:51:11', '2023-08-30 12:51:28', '', 'accepted', 2, 3, '123', NULL, '2023-07-20 11:44:47', '2023-08-30 12:51:28'),
(4, 'work', 3, NULL, NULL, NULL, 'draft', 1, 3, NULL, NULL, '2023-07-30 12:14:26', '2023-07-30 12:14:26'),
(5, 'work', 1, '2023-08-30 12:47:12', '2023-08-30 12:47:30', '', 'accepted', 1, 3, '123123', NULL, '2023-07-30 12:45:26', '2023-08-30 12:47:30'),
(6, 'work', 4, '2023-08-30 12:47:17', '2023-08-30 12:47:31', '', 'accepted', 1, 3, '', NULL, '2023-07-30 12:46:14', '2023-08-30 12:47:31'),
(7, 'event', 1, '2023-08-15 22:19:08', '2023-08-15 22:19:26', NULL, 'accepted', 1, 3, NULL, NULL, '2023-07-31 20:49:25', '2023-08-15 22:19:26'),
(8, 'work', 5, '2023-08-07 12:30:55', '2023-08-07 12:31:57', NULL, 'accepted', 1, 3, NULL, NULL, '2023-08-07 11:48:06', '2023-08-07 12:31:57'),
(9, 'work', 5, '2023-08-20 17:40:03', '2023-08-20 17:40:24', NULL, 'accepted', 1, 3, NULL, NULL, '2023-08-07 12:34:01', '2023-08-20 17:40:24'),
(10, 'work', 5, '2023-08-20 17:49:27', '2023-08-20 17:56:56', NULL, 'accepted', 1, 3, NULL, NULL, '2023-08-20 17:48:31', '2023-08-20 17:56:56'),
(11, 'work', 5, '2023-08-20 18:03:34', '2023-08-20 18:03:39', NULL, 'accepted', 1, 3, NULL, NULL, '2023-08-20 18:02:50', '2023-08-20 18:03:39'),
(12, 'event', 1, '2023-08-23 19:04:51', '2023-08-23 19:14:16', NULL, 'accepted', 1, 3, NULL, NULL, '2023-08-23 18:41:48', '2023-08-23 19:14:16'),
(13, 'event', 1, '2023-08-23 20:30:44', '2023-08-23 20:31:12', NULL, 'accepted', 1, 3, NULL, NULL, '2023-08-23 20:29:26', '2023-08-23 20:31:12'),
(14, 'event', 4, '2023-08-23 21:55:56', '2023-08-23 21:56:04', NULL, 'accepted', 1, 3, NULL, NULL, '2023-08-23 21:50:39', '2023-08-23 21:56:04'),
(15, 'event', 5, '2023-08-23 22:08:48', '2023-08-23 22:09:00', NULL, 'accepted', 1, 3, NULL, NULL, '2023-08-23 22:08:12', '2023-08-23 22:09:00'),
(16, 'event', 6, '2023-08-30 12:55:39', '2023-08-30 12:55:45', '', 'accepted', 1, 3, '12323', NULL, '2023-08-23 22:10:08', '2023-08-30 12:55:45'),
(17, 'work', 5, '2023-08-30 12:47:21', '2023-08-30 12:47:32', '', 'accepted', 1, 3, '123', NULL, '2023-08-24 20:57:26', '2023-08-30 12:47:32'),
(18, 'event', 4, '2023-08-30 12:55:20', '2023-08-30 12:55:45', '', 'accepted', 1, 3, '123123', NULL, '2023-08-25 12:43:19', '2023-08-30 12:55:45'),
(19, 'circle', 3, NULL, NULL, NULL, 'draft', 3, 3, NULL, NULL, '2023-08-25 13:39:09', '2023-08-25 13:39:09'),
(20, 'circle', 4, '2023-08-25 14:13:02', '2023-08-25 14:13:10', '', 'accepted', 4, 3, 'dsfdsfdfs', NULL, '2023-08-25 13:43:20', '2023-08-25 14:13:10'),
(21, 'circle', 1, '2023-08-30 12:51:06', '2023-08-30 12:51:26', '', 'accepted', 1, 3, '123', NULL, '2023-08-28 02:30:13', '2023-08-30 12:51:26'),
(22, 'work', 1, NULL, NULL, NULL, 'archived', 1, 3, NULL, NULL, '2023-08-30 21:26:32', '2023-09-20 11:49:56'),
(23, 'work', 6, NULL, NULL, NULL, 'draft', 1, 3, NULL, NULL, '2023-08-30 22:13:17', '2023-08-30 22:13:17'),
(24, 'event', 4, '2023-09-04 15:20:01', '2023-09-04 15:20:06', '', 'accepted', 1, 3, '123', NULL, '2023-09-04 15:19:47', '2023-09-04 15:20:06'),
(25, 'work', 7, NULL, NULL, NULL, 'draft', 4, 3, NULL, NULL, '2023-09-06 17:52:39', '2023-09-06 17:52:39'),
(26, 'circle', 5, '2023-09-14 15:38:30', '2023-09-14 15:39:07', '', 'accepted', 5, 5, NULL, NULL, '2023-09-14 15:38:26', '2023-09-14 15:39:07'),
(27, 'work', 8, NULL, NULL, NULL, 'draft', 2, 3, NULL, NULL, '2023-09-15 20:52:56', '2023-09-15 20:52:56'),
(28, 'circle', 6, NULL, NULL, NULL, 'draft', 6, 250, NULL, NULL, '2023-09-20 15:38:26', '2023-09-20 15:38:26');

-- --------------------------------------------------------

--
-- 表的结构 `auths`
--

CREATE TABLE `auths` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expiredAt` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ua` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auths`
--

INSERT INTO `auths` (`id`, `type`, `method`, `token`, `expiredAt`, `userId`, `ip`, `ua`, `createdAt`, `updatedAt`) VALUES
(2, 'web_session', 'sms', 'I2LGLCLuiibBLMF4GfdWw31d7LL20Tj9WYLSwpEwIHGfjml3uId1YCrhxzI9ua0j', '2023-06-27 19:40:33', 3, '::1', NULL, '2023-05-28 19:40:33', '2023-05-28 19:40:33'),
(3, 'web_session', 'password', 'TGo3vtsqAB9MxedKOd3xOr2VqRjYOyn5DfeGi2SRMMzlJj6udlGhLmXI6fvInGYp', '2023-06-27 19:46:21', 3, '::1', NULL, '2023-05-28 19:46:21', '2023-05-28 19:46:21'),
(4, 'web_session', 'password', 'JChbHANVe0Iav81wBXN7wkasyZAJjdbkA2w5cEodrQVBHKPESQTfRNxZRR87XKm8', '2023-06-27 19:47:18', 3, '::1', NULL, '2023-05-28 19:47:18', '2023-05-28 19:47:18'),
(5, 'office_web_session', 'password', 'J2qkMQLwZ4iUl4zutbjJrxPBQeaLEZH4VE4UIvHfCYHpdlLfoIRJMHSDdYbxxKRJ', '2023-07-13 06:09:36', 3, '::1', NULL, '2023-06-13 06:09:36', '2023-06-13 06:09:36'),
(6, 'office_web_session', 'password', 'ywtASRokZwFGGV0eNGNIfUuvwHX8n2QE0Kl9os41ewffxuuxOXd1fLbOxNIIImhS', '2023-08-01 16:50:23', 3, '::1', NULL, '2023-07-02 16:50:23', '2023-07-02 16:50:23'),
(7, 'office_web_session', 'password', 'MgN4OzGwDC8IyRdpc4I01dMVfKmCcxJhilSgmyhoNDyRddS7eNZGZSVAIOQYuk8P', '2023-08-01 16:52:54', 3, '::1', NULL, '2023-07-02 16:52:54', '2023-07-02 16:52:54'),
(8, 'office_web_session', 'password', 'B6iSIyFgVRg5E06wqyVEEjGoPHk6VehGGfgbvztPTXyUBYKIW2dirZAU9nYNSibc', '2023-08-01 16:56:52', 3, '::1', NULL, '2023-07-02 16:56:52', '2023-07-02 16:56:52'),
(9, 'office_web_session', 'password', 'ULGtkEWdj8EDeR7SofgTOyfocLZXsrI7o67o8rqXrjFdjKneFOftJdfvHKPKIFNr', '2023-08-01 19:40:51', 3, '::1', NULL, '2023-07-02 19:40:51', '2023-07-02 19:40:51'),
(10, 'office_web_session', 'password', 'L3zeguCO6l0Qt7C9jx0fnEgMRWmb5695CkkChQw9YzlNfO6cs9nnPaAnIa8WPa8t', '2023-08-01 21:19:12', 3, '::1', NULL, '2023-07-02 21:19:12', '2023-07-02 21:19:12'),
(11, 'office_web_session', 'password', 'p9pl9xSe2RJydbhqKTRDRQg28jdY3RwO23DOhWu1OLYc4URpW8HhF7Xs0I1BC6uo', '2023-08-11 11:57:44', 3, '::1', NULL, '2023-07-12 11:57:44', '2023-07-12 11:57:44'),
(12, 'office_web_session', 'password', '8ylGRJyyU5WU4PxswShWwDvbuyrdOeeW68q7L8JauaqOjzbi1uwGPIzFaA8QZHy7', '2023-08-11 12:10:13', 3, '::1', NULL, '2023-07-12 12:10:13', '2023-07-12 12:10:13'),
(13, 'office_web_session', 'password', 'l2bD17cnhpiy59L6LVx5AQSpgJPXrkbaOITYnLicI1DoeUkC4eTn0msDAja5ZmIW', '2023-08-11 12:13:51', 3, '::1', NULL, '2023-07-12 12:13:51', '2023-07-12 12:13:51'),
(14, 'office_web_session', 'password', 'VzZjuAnx2GysuAnowuuMTzOcEcomzdBSRRoiiHYEOJmwsyuBThEb0r1gV2KjHwo2', '2023-08-11 12:16:35', 3, '::1', NULL, '2023-07-12 12:16:35', '2023-07-12 12:16:35'),
(15, 'office_web_session', 'password', 'kshdka0hAQA7YICzCx6RTPsxV7kTqX5jVA6S4NIpKktw3AzGLksEeQ7O0hKh1sc1', '2023-08-12 07:39:18', 3, '::1', NULL, '2023-07-13 07:39:18', '2023-07-13 07:39:18'),
(16, 'office_web_session', 'password', '7YanHRopHjHLjAxfbflqV1InzW6dpbAiRoTAPe3mqDSOZOlQAI9wnajpEbB6D3dt', '2023-08-12 08:09:43', 3, '::1', NULL, '2023-07-13 08:09:43', '2023-07-13 08:09:43'),
(17, 'office_web_session', 'password', '9kk9L5NZUqQ4hJt9661uX8d1hGD3WQIFM6Yvxf58d1faqyl8QNIT8PuvRve1dRZS', '2023-08-12 08:13:14', 3, '::1', NULL, '2023-07-13 08:13:14', '2023-07-13 08:13:14'),
(18, 'office_web_session', 'password', '9vkCYnSph8y0BCv228E801Tnnhr3SGw9FS5VsR3NuZLTme3fzvhkIzabMoP4EwUu', '2023-08-12 08:15:12', 3, '::1', NULL, '2023-07-13 08:15:12', '2023-07-13 08:15:12'),
(19, 'office_web_session', 'password', 'g2hDofcDvIcwMASPzlbTQNxzZ1jbWIZqkjfBmtpokv11JoqGE0frfBf5jjHfUzB8', '2023-08-12 09:26:01', 3, '::1', NULL, '2023-07-13 09:26:01', '2023-07-13 09:26:01'),
(20, 'office_web_session', 'password', 'MEWpp42WUcO2vxn3UIxMROkp38bNPAO8Yi6VrUtEPfP0fpXKzTsK1agHuTbERQdH', '2023-08-16 09:32:21', 3, '::1', NULL, '2023-07-17 09:32:21', '2023-07-17 09:32:21'),
(21, 'office_web_session', 'password', 'cN7NJ0oXksKaupEWAIyBvX4QxRJ3FJx42jiVrsXPGKxWU5t8amMwtlP6FEvv1D5l', '2023-08-17 14:39:12', 3, '::1', NULL, '2023-07-18 14:39:12', '2023-07-18 14:39:12'),
(22, 'office_web_session', 'password', 'FhIvDGY0cyv03cxB8WIj9KCsD3gfRdfJ0NY0qBAMSMTc7B7JSrRMNIEZlul9cDzz', '2023-08-17 16:58:59', 3, '::1', NULL, '2023-07-18 16:58:59', '2023-07-18 16:58:59'),
(23, 'office_web_session', 'password', 'gb9iUFC15zjQyDtReeOG8ZVm8pqaNVE5FnGPlerLFnilaDY2eQTqGENnsJ549N03', '2023-08-17 17:06:32', 3, '::1', NULL, '2023-07-18 17:06:32', '2023-07-18 17:06:32'),
(24, 'office_web_session', 'password', 'QZv70lPsOSTSbdppG4gdxd5OUQmcdnPepW1uzR9MkyQzivH7QCPPBIeM9cD4W5P0', '2023-08-17 17:10:37', 3, '::1', NULL, '2023-07-18 17:10:37', '2023-07-18 17:10:37'),
(25, 'office_web_session', 'password', 'V29DXV33A6s1eAxd6sW2Vh16BXQvEK3nTeaT6B1nMJxjuLnZOvTGjWGhWMqBvzJZ', '2023-08-17 17:11:20', 3, '::1', NULL, '2023-07-18 17:11:20', '2023-07-18 17:11:20'),
(26, 'office_web_session', 'password', 'ReQePKU0WWxiGX3PGLRsT23lRB6I7XwbjbYouJPlu3wQKkNFcftQkMQIehqeh0bv', '2023-08-17 17:24:09', 3, '::1', NULL, '2023-07-18 17:24:09', '2023-07-18 17:24:09'),
(27, 'office_web_session', 'password', '3E79z9iYSHrz72L5OUvUQo3nQWGEp8oB3n1DWelilMnQWqnoI90joxkoiPWokjG4', '2023-08-17 17:51:57', 3, '::1', NULL, '2023-07-18 17:51:57', '2023-07-18 17:51:57'),
(28, 'office_web_session', 'password', 'bRc8AQBtwQzbrYeOf6CNqw4jDoIDPaWKkatoVi8ZgI2XRUWghZB6ruyDPkq8OoQF', '2023-08-17 17:55:33', 3, '::1', NULL, '2023-07-18 17:55:33', '2023-07-18 17:55:33'),
(29, 'office_web_session', 'password', 'IFUqM7M1qFBZae1yds2NfeVPN3e1clopMc6Lh0NaRPQduLGLAODdrZYBu06XAu8I', '2023-08-17 17:58:52', 3, '::1', NULL, '2023-07-18 17:58:52', '2023-07-18 17:58:52'),
(30, 'office_web_session', 'password', 'cFVODscJXfuyrbkK8AMPmOKDsuO6XaQttNQGLZJRQJMydZDMzGul19GiRo7WJqNn', '2023-08-17 18:02:55', 3, '::1', NULL, '2023-07-18 18:02:55', '2023-07-18 18:02:55'),
(31, 'office_web_session', 'password', '9STh6GdpBpUQvMPg2BkXbEoUctIZXfAnUNxcyFCxFwFUU5yQnIkaoPN91Prb67kb', '2023-08-17 18:17:12', 3, '::1', NULL, '2023-07-18 18:17:12', '2023-07-18 18:17:12'),
(32, 'office_web_session', 'password', 'N68MkluFJ5gRlzAMO1i1jU56xA3WedT9hwhMit0UbjVXnryWICweCtHh6cqPsPjR', '2023-08-17 18:18:33', 3, '::1', NULL, '2023-07-18 18:18:33', '2023-07-18 18:18:33'),
(33, 'office_web_session', 'password', 'gt2v0a051LWAGI3iHkSX0iUqHv08WzrB3MN3RRsSlwc6z1psm8Dtf9UfEmttsmH0', '2023-08-17 18:22:55', 3, '::1', NULL, '2023-07-18 18:22:55', '2023-07-18 18:22:55'),
(34, 'office_web_session', 'password', 'iAMvnvXHmzZShoWecfP4GP9wM6G4QSbaEfYvUn9qwuqbGjGF2hNl2f01iZnXIJin', '2023-08-18 07:35:56', 3, '::1', NULL, '2023-07-19 07:35:56', '2023-07-19 07:35:56'),
(35, 'office_web_session', 'password', '7qgPLMpqC0v2Tr6y5bmCM79BBDgl6Gg7u8GSOGpAlZqwwd1SfIvNvOJH4tk2caqF', '2023-08-18 07:37:01', 3, '::1', NULL, '2023-07-19 07:37:01', '2023-07-19 07:37:01'),
(36, 'office_web_session', 'password', '4PIkSGBxBgWbrM45CtNpEA1IHi4cOyZlPlMZ5X5NzpOFb6kP75xbZlDBezqmRsSO', '2023-08-18 07:41:27', 3, '::1', NULL, '2023-07-19 07:41:27', '2023-07-19 07:41:27'),
(37, 'office_web_session', 'password', '9gWVxrbGd8Y63CQZjjDF0s4dtWvnwnO34Qv7ZgJsRnP5sVIY4fMVQYufPjCjGqRk', '2023-08-18 07:42:40', 3, '::1', NULL, '2023-07-19 07:42:40', '2023-07-19 07:42:40'),
(38, 'office_web_session', 'password', 'IC5UsMC41gvu9rNkOchRKlmuEjwjtQPIu9wp2BtKCa1UQ7IDpzpsbaKcBN77s6yN', '2023-08-18 07:48:06', 3, '::1', NULL, '2023-07-19 07:48:06', '2023-07-19 07:48:06'),
(39, 'office_web_session', 'password', 'UQFnOhNlTBEIbihhPTM4Q9uF4RJtZPED9uVV5DuzwymW4BkyiI6DCas6dGKUk4fG', '2023-08-18 07:51:04', 3, '::1', NULL, '2023-07-19 07:51:04', '2023-07-19 07:51:04'),
(40, 'office_web_session', 'password', 'YxM4rLH5SPiAZIon3jOgtqaK0ZnJsNUFt6FlpN0v5sdwAa8OQLDbwXhNPVvHYE07', '2023-08-19 06:52:05', 3, '::1', NULL, '2023-07-20 06:52:05', '2023-07-20 06:52:05'),
(41, 'office_web_session', 'password', 'uRm7ZPSNOZM3QGiIYCOCd5NkBzSwPr0akqi2rKk1Vb6NmDr4f3XHfzC5m5QXiq1V', '2023-08-21 17:55:13', 3, '::1', NULL, '2023-07-22 17:55:13', '2023-07-22 17:55:13'),
(42, 'office_web_session', 'password', 'ByIIWNtdVM2pDzo2kMtRx4Ds7aFEEKK8tJayqVrHPNxqOT4Pn8CTjizj5qry7l36', '2023-08-29 10:57:44', 3, '::1', NULL, '2023-07-30 10:57:44', '2023-07-30 10:57:44'),
(43, 'web_session', 'password', 'dKzywysHhKyuMCVtlwrMlRnGWh8EsvBVfP7NQTpSObHp6M9Pr7RUqpzp8fivTMjS', '2023-09-08 15:30:17', 3, '::1', NULL, '2023-08-09 15:30:17', '2023-08-09 15:30:17'),
(44, 'web_session', 'password', '40hF9I10QQYG8qtYM46JHX8gY6Jnji5si7iysHhzyYblRg6pkgPMx8M9TTEc3iEA', '2023-09-08 15:43:55', 3, '::1', NULL, '2023-08-09 15:43:55', '2023-08-09 15:43:55'),
(45, 'web_session', 'password', 'Aw6wdZiiSoJNi1kfGsN30F5DUmb4KJvHeKIW0c3rJdpjtxlO3HzCZwUteT4A5y8Z', '2023-09-08 16:18:20', 3, '::1', NULL, '2023-08-09 16:18:20', '2023-08-09 16:18:20'),
(46, 'web_session', 'password', 'O3snP0tTMKOljrJRODFPlGYXHzewzua1fKFaAghWiIM5jq1J4KromRh4svQX9GEf', '2023-09-08 16:29:09', 3, '::1', NULL, '2023-08-09 16:29:09', '2023-08-09 16:29:09'),
(47, 'web_session', 'password', 'hbLEc1udCPe4Rj5fI1HSfLQu97O3KlRGKNqOKGKccu2nBQZVgWhXCASB6IvCwzbc', '2023-09-08 17:08:17', 3, '::1', NULL, '2023-08-09 17:08:17', '2023-08-09 17:08:17'),
(48, 'web_session', 'password', '3TTPNLME1taCKps52lPQ7f2CNKR3WZd9CUhfapAyqLHDK0YcqYViQlJLIxKhHE3E', '2023-09-08 17:11:05', 3, '::1', NULL, '2023-08-09 17:11:05', '2023-08-09 17:11:05'),
(49, 'web_session', 'password', 'ZFLU3hKLDWQBjqUCmwyAdo7Jx5iMQX3KgBRa2h071RSd56y649SIxO6BeKxsYb9g', '2023-09-14 09:52:01', 3, '::1', NULL, '2023-08-15 09:52:01', '2023-08-15 09:52:01'),
(50, 'web_session', 'password', 'dYarmkb0xtZSieJt08LmJOMnnPu8FkUTA2fm5qActxYy8yedIvf0jCgmtt5Dwcf5', '2023-09-14 09:52:15', 3, '::1', NULL, '2023-08-15 09:52:15', '2023-08-15 09:52:15'),
(51, 'web_session', 'password', 'eIuQddFwS2zfa1dzuzpxrBYeSRiUIM6hv7Ub0QuRM3rZZZyJ3XRmsy76yfm7D17s', '2023-09-14 09:56:38', 3, '::1', NULL, '2023-08-15 09:56:38', '2023-08-15 09:56:38'),
(52, 'web_session', 'password', '57S4xJeS8deXM8ZggoL9QnK6AhrNQp2RzO4EcjLXOelyX4cpMU4G8KNdQONycQD2', '2023-09-14 10:03:07', 3, '::1', NULL, '2023-08-15 10:03:07', '2023-08-15 10:03:07'),
(53, 'web_session', 'password', 'TwcT0kAYuzV5Vop5tST8mQRmWQq3NJz7E2DoQIqDzDyq7Ql8fr0JKxVyP38lcz4b', '2023-09-14 10:06:52', 3, '::1', NULL, '2023-08-15 10:06:52', '2023-08-15 10:06:52'),
(54, 'web_session', 'password', 'GXwQi1EvTUQmR3LaKt402c8lxNYGj92ATrepPekvDE33rpZzmWx2CGerN53B7ZZU', '2023-09-14 10:07:44', 3, '::1', NULL, '2023-08-15 10:07:44', '2023-08-15 10:07:44'),
(55, 'web_session', 'password', 'dUJleZPnG75n2IJxIiRqt7HLIltd0SZnCnbgl6hE6WbdX7qstcg8pQlMP4ZXgwdr', '2023-09-14 10:12:47', 3, '::1', NULL, '2023-08-15 10:12:47', '2023-08-15 10:12:47'),
(56, 'web_session', 'password', '6rsqKoT7jS0wwqJlhz9eLiownMJIOul7if3zLocMPnkSJN7KMln49x5f6t8R9fMG', '2023-09-14 10:15:28', 3, '::1', NULL, '2023-08-15 10:15:28', '2023-08-15 10:15:28'),
(57, 'web_session', 'password', 'iXqBBVzfPlXNHeJgIAllJfLD88LwxpY04CEt0nv3RyS7uNhVfC59ufZArHk6YkNC', '2023-09-14 13:48:36', 3, '::1', NULL, '2023-08-15 13:48:36', '2023-08-15 13:48:36'),
(58, 'web_session', 'password', 'Giwq0zH7I7iZXmaxYnClA0DIGuCSHgz8jR7BW5q8kkVSi96nFMc3o4rnWRcAD7V6', '2023-09-14 18:48:04', 3, '::1', NULL, '2023-08-15 18:48:04', '2023-08-15 18:48:04'),
(59, 'web_session', 'password', '7jvE2tcf8nwxZ0AkvGAzsOwCg1vvvAX2gU8rNGijqOdTybRiO3YhPOXbD8ov53Nu', '2023-09-14 19:52:14', 3, '::1', NULL, '2023-08-15 19:52:14', '2023-08-15 19:52:14'),
(60, 'web_session', 'password', 'S58VFYCjwJrEhamofKebhwhVnXC0UNMPXb4PPOROfVlSX0pnHvG1hAz1GJc6hziG', '2023-09-14 20:10:48', 3, '::1', NULL, '2023-08-15 20:10:48', '2023-08-15 20:10:48'),
(61, 'web_session', 'password', 'jvRIMVVs8cF7xRzbiaHBm1zHYJTppj5DeHFLMmOwiwAYQgFBgkIS21NW23mvsDi4', '2023-09-14 20:34:24', 3, '::1', NULL, '2023-08-15 20:34:24', '2023-08-15 20:34:24'),
(62, 'web_session', 'password', 'cLwaphRy3jsEELWg35ld9fkYMJ9RJxiY8BZbbKo1i4EuuTk19qK5V7ASohuW8JsB', '2023-09-14 20:37:06', 3, '::1', NULL, '2023-08-15 20:37:06', '2023-08-15 20:37:06'),
(63, 'web_session', 'password', 'h4GpzfdpguLzgBiuLZmS4scZSU5aFYvXDktEqD7hjX2kCXwsm2Px5Bqujx9U3shX', '2023-09-19 19:37:51', 3, '::1', NULL, '2023-08-20 19:37:51', '2023-08-20 19:37:51'),
(64, 'web_session', 'password', 'GQOoPSPeHrspDE0pmxqpEPnKf1td9ak2zoqZO74rLN15w6YnJ68kFISpSEZvKd1B', '2023-09-19 19:47:09', 3, '::1', NULL, '2023-08-20 19:47:09', '2023-08-20 19:47:09'),
(65, 'office_web_session', 'password', 'W5yoNiqGk4GRQrm98tpKgmV2xMoo95Z6tBHYrQWn7KE3VDemg3yG8YZDWNYGXkuQ', '2023-09-22 20:30:02', 3, '::1', NULL, '2023-08-23 20:30:02', '2023-08-23 20:30:02'),
(66, 'web_session', 'password', 'gwOsxdp9EghaxpHvNe0s41Vn9SJq5JWHwTJqKR39Z1j3iuDBtPwum21Gg9J16ihh', '2023-09-23 19:17:30', 3, '::1', NULL, '2023-08-24 19:17:30', '2023-08-24 19:17:30'),
(67, 'web_session', 'password', 'BxNPLbmUjIHFGRLyDXAoByQSRpD7Fw0rlsZfVnczJZNf9hHfkCojfEC4OYpss8qe', '2023-09-23 19:26:51', 3, '::1', NULL, '2023-08-24 19:26:51', '2023-08-24 19:26:51'),
(68, 'web_session', 'password', '78gadaPHEVxpvYA48EsHVllL3ecrYHtB9ogxUzA5JSb9FGXOLkyh1fmiLAFoekZi', '2023-09-23 19:27:14', 3, '::1', NULL, '2023-08-24 19:27:14', '2023-08-24 19:27:14'),
(69, 'web_session', 'password', 'EzgNkFgifAEFlsR9lyuKj5UvntrQGF8AlZ37tnJFhQFsItTJ9syOIH0rExlE7Lmu', '2023-09-23 19:33:48', 3, '::1', NULL, '2023-08-24 19:33:48', '2023-08-24 19:33:48'),
(70, 'office_web_session', 'password', 'wc8koGiXObHKGrQnLDXi7urBptVosTMoBWjYbCLwZBDydD6EfNSyV2n06gHtj6ug', '2023-09-23 19:34:22', 3, '::1', NULL, '2023-08-24 19:34:22', '2023-08-24 19:34:22'),
(71, 'web_session', 'password', 'LdglbWH73Rh5wuNuMjyjizeHDCzeENocoZx7r9L24YVz1dj9DPgLT0xYQmKe5FVH', '2023-09-23 19:38:51', 3, '::1', NULL, '2023-08-24 19:38:51', '2023-08-24 19:38:51'),
(72, 'web_session', 'password', 'UbkMVV36h1BXG1YdOVmiJbESAqSdxJKAk5jz3ZIXlkkXTEqZl5VlKcWz3k00GmvT', '2023-09-23 19:49:12', 3, '::1', NULL, '2023-08-24 19:49:12', '2023-08-24 19:49:12'),
(73, 'office_web_session', 'password', 'oBmMwq3Z1GLPU6ITCOa7zKPukrmigK6o7KLd62gcbDBgmsYH7E14P7JctwijVOMr', '2023-09-24 12:45:26', 3, '::1', NULL, '2023-08-25 12:45:26', '2023-08-25 12:45:26'),
(74, 'office_web_session', 'password', 'wP3x9pUQFMYpesf5bnrYJfVlJiQPYp5LLPBSGX9hqydp2ZTLQesZxGTs8OFaNqpp', '2023-09-24 12:53:48', 3, '::1', NULL, '2023-08-25 12:53:48', '2023-08-25 12:53:48'),
(75, 'office_web_session', 'password', '7mw3qsw7YvliknFmDFdfxuseoMmUhJUgLXLGhoaACYQCzZuhsp4wqGLUT94ABSEK', '2023-09-24 13:10:29', 3, '::1', NULL, '2023-08-25 13:10:29', '2023-08-25 13:10:29'),
(76, 'office_web_session', 'password', 'XcBZD7JTbWBIyCyR3kdCa3zQmXZO37ogUZqZiJ1btoi6Za5EZh5fsV2nqEBqS7dN', '2023-09-24 13:54:21', 3, '::1', NULL, '2023-08-25 13:54:21', '2023-08-25 13:54:21'),
(77, 'office_web_session', 'password', '0WH5VdnRkUjLi5P18d8tR6k2K1yxz4eQK7JQGEDwnNtvtSRuQ9Fea48j4U0PP8In', '2023-09-27 12:43:26', 3, '::ffff:127.0.0.1', NULL, '2023-08-28 12:43:26', '2023-08-28 12:43:26'),
(78, 'office_web_session', 'password', 'vw2C0kSKL3lwgEpj2tFXwxOVUGKYdw2Ik825MrDo3V4FNPX5ENp0tuGLrl6UH4fQ', '2023-09-28 20:06:08', 3, '::1', NULL, '2023-08-29 20:06:08', '2023-08-29 20:06:08'),
(79, 'web_session', 'sms', 'yZBt4PixmkIH7vrY7m8WX7q58YsunXPsR0hJoo5aZDguniB6bWJu5qIjrg1r9Pjb', '2023-09-30 10:42:49', 4, '::1', NULL, '2023-08-31 10:42:49', '2023-08-31 10:42:49'),
(80, 'web_session', 'password', 'A7l0vB6PglIr7Xr1PzdAoyxlIBJUdi8FebBxTAzugLnuKVoc7ahgtAon7asS70rw', '2023-10-14 10:53:20', 3, '::1', NULL, '2023-09-14 10:53:20', '2023-09-14 10:53:20'),
(81, 'web_session', 'sms', '8Ifwzc9GajeXZWhUWVJzn7gJIVie0Fk9q8oI4U8g8lUJXGRsiekmtw5BkpI4Xno0', '2023-10-14 15:37:25', 5, '::1', NULL, '2023-09-14 15:37:25', '2023-09-14 15:37:25'),
(82, 'web_session', 'password', 'fRbGR45NcbEbz8CLtpBYys2feuB9RgVkR6PVAB2fxaWWmR2hQxh0dcfgMgA9utAr', '2023-10-18 14:42:44', 3, '::1', NULL, '2023-09-18 14:42:44', '2023-09-18 14:42:44'),
(83, 'web_session', 'password', '1SgrJlkUoNsSGam4UEv4UP4fygIYqRc1D9xtuqtjmGfT1IqXa4bEAe94rmgbyYPe', '2023-10-20 11:11:08', 3, '::1', NULL, '2023-09-20 11:11:08', '2023-09-20 11:11:08'),
(84, 'office_web_session', 'password', 'nyR3xihtL7nQCb1c1hFc4qkchyzw3jPgqLJun4AWwcZ4icmfptzMgyhCC7oBtD6q', '2023-10-20 11:48:52', 3, '::1', NULL, '2023-09-20 11:48:52', '2023-09-20 11:48:52'),
(85, 'web_session', 'sms', 'KcNcsvSEzRoITww9pPJhcPi846ZiWuAi29SVfV3tVAwnAcpvdD7sE2nCBjTuo0V2', '2023-10-20 14:37:33', 250, '::1', NULL, '2023-09-20 14:37:33', '2023-09-20 14:37:33'),
(86, 'web_session', 'password', '1t5HNrc7yOh9X3hG0mgy3KKegVhS0RqW0F3t0cOKfmu8LJT8r3vgeIBxy8DFcfso', '2023-10-20 14:38:06', 250, '::ffff:127.0.0.1', NULL, '2023-09-20 14:38:06', '2023-09-20 14:38:06'),
(87, 'office_web_session', 'password', 'sPl1bQs7iVUGpICk6rV39Fa83ClJH6smKqCygMyJg7FyT8KDVzCsQ9yL5G0cf40V', '2023-10-20 15:54:23', 250, '::1', NULL, '2023-09-20 15:54:23', '2023-09-20 15:54:23'),
(88, 'web_session', 'password', 'uKUx5JcXooodMyN4AjLKoElIGA8HScWYcBBEnnfM6RvWuMuj1OPQW9t9BklARQp6', '2023-10-20 17:14:30', 3, '::1', NULL, '2023-09-20 17:14:30', '2023-09-20 17:14:30');

-- --------------------------------------------------------

--
-- 表的结构 `circles`
--

CREATE TABLE `circles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover` text,
  `alias` varchar(128) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `description` text,
  `content` text,
  `foundAt` datetime DEFAULT NULL,
  `workCount` int(10) UNSIGNED DEFAULT '0',
  `eventCount` int(10) UNSIGNED DEFAULT '0',
  `viewCount` int(10) UNSIGNED DEFAULT '0',
  `likeCount` int(10) UNSIGNED DEFAULT '0',
  `threadCount` int(10) UNSIGNED DEFAULT '0',
  `commentThreadCount` int(10) UNSIGNED DEFAULT '0',
  `commentThreadId` int(11) DEFAULT NULL,
  `commentPostCount` int(11) DEFAULT '0',
  `isSensitive` tinyint(1) DEFAULT '0',
  `isHidden` tinyint(1) DEFAULT '0',
  `status` varchar(64) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `tagIds` json DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `circles`
--

INSERT INTO `circles` (`id`, `name`, `cover`, `alias`, `type`, `description`, `content`, `foundAt`, `workCount`, `eventCount`, `viewCount`, `likeCount`, `threadCount`, `commentThreadCount`, `commentThreadId`, `commentPostCount`, `isSensitive`, `isHidden`, `status`, `userId`, `tagIds`, `source`, `createdAt`, `updatedAt`) VALUES
(1, '测试1', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/c9ad7d468a01123b539f1f1ac532f96f.png', 'doujin', 'doujin', '测试', '测试1123\n2345456', '2023-08-30 11:02:18', 0, 0, 0, 0, 2, 0, 17, 0, 0, 0, 'enabled', 3, '[]', 'official', '2023-07-30 11:03:59', '2023-09-24 11:29:05'),
(2, '空白', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/1c3a7f468a01b11aecc290cb19665503.jpg', NULL, 'doujin', '12123', '撒电风扇东方时代第三方史蒂夫', '2023-04-30 12:30:01', 0, 0, 0, 0, 3, 0, 16, 0, 0, 0, 'enabled', 3, '[]', 'official', '2023-07-30 12:30:17', '2023-09-22 19:38:51'),
(3, '一个新的社团！', 'https://q.cdn.dove.cafe/w/fe45e52c8a01168782a1dc8cb01d496a.png', NULL, 'doujin', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 'reviewing', 3, '[]', NULL, '2023-08-25 13:33:56', '2023-08-25 13:33:56'),
(4, '33333', 'https://q.cdn.dove.cafe/w/c43fef2c8a01074b14a6f34e8267c437.jpg', NULL, 'doujin', '爱仕达大厦下次v程序', ' 热工5 该喝喝把尾巴特文化问过二姑父大v发现搞定', '2023-08-25 13:43:16', 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 'enabled', 4, '[5]', 'enthusiast', '2023-08-25 13:43:20', '2023-08-25 14:13:10'),
(5, '你好！', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/circle/cover/5-09b057948a01d43bbe9588597d767ac4.png', NULL, 'doujin', 'hello', '12123123123456456', '2023-01-14 15:38:20', 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 'enabled', 5, '[6]', 'enthusiast', '2023-09-14 15:38:26', '2023-09-14 15:39:07'),
(6, '新社团3', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/circle/cover/250-9fdc3db38a013eb43d0bed3c604e133f.jfif', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 'reviewing', 250, '[]', NULL, '2023-09-20 15:38:26', '2023-09-20 15:38:26');

-- --------------------------------------------------------

--
-- 表的结构 `circleusers`
--

CREATE TABLE `circleusers` (
  `id` int(11) NOT NULL,
  `circleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `role` varchar(64) DEFAULT NULL,
  `replyMessage` text,
  `applyMessage` text,
  `status` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `subtitle` varchar(256) DEFAULT NULL,
  `avatar` text,
  `link` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `circleusers`
--

INSERT INTO `circleusers` (`id`, `circleId`, `userId`, `role`, `replyMessage`, `applyMessage`, `status`, `name`, `subtitle`, `avatar`, `link`, `createdAt`, `updatedAt`) VALUES
(2, 2, 3, 'creator', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-07-18 18:15:10', '2023-07-18 18:15:10'),
(3, 3, 3, 'creator', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-07-20 11:57:15', '2023-07-20 11:57:15'),
(4, 1, 3, 'creator', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-07-30 11:03:59', '2023-07-30 11:03:59'),
(5, 2, 3, 'creator', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-07-30 12:30:17', '2023-07-30 12:30:17'),
(6, 3, 3, 'creator', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-08-25 13:33:56', '2023-08-25 13:33:56'),
(7, 4, 4, 'creator', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-08-25 13:43:20', '2023-08-25 13:43:20'),
(8, 4, 3, 'maintainer', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-09-06 15:49:08', '2023-09-06 15:49:08'),
(9, 2, 1, 'maintainer', NULL, NULL, 'requested', NULL, NULL, NULL, NULL, '2023-09-14 11:38:29', '2023-09-14 11:38:29'),
(10, 5, 5, 'creator', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-09-14 15:38:26', '2023-09-14 16:18:50'),
(11, 1, 1, 'maintainer', '', '我是哞菇啊！', 'requested', NULL, NULL, NULL, NULL, '2023-09-14 15:49:00', '2023-09-14 16:10:52'),
(12, 6, 250, 'creator', NULL, NULL, 'joined', NULL, NULL, NULL, NULL, '2023-09-20 15:38:26', '2023-09-20 15:38:26');

-- --------------------------------------------------------

--
-- 表的结构 `commentitems`
--

CREATE TABLE `commentitems` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) NOT NULL,
  `commentSubjectId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `content` text,
  `rootCommentId` int(11) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `likeCount` int(11) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) NOT NULL,
  `commentCount` int(11) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) DEFAULT NULL,
  `auditTargetType` varchar(128) DEFAULT NULL,
  `auditTargetId` int(11) DEFAULT NULL,
  `action` varchar(64) DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `editAt` datetime DEFAULT NULL,
  `submitAt` datetime DEFAULT NULL,
  `updateMessage` text,
  `status` varchar(64) DEFAULT NULL,
  `merged` int(11) DEFAULT '0',
  `auditId` int(11) DEFAULT NULL,
  `circleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `drafts`
--

INSERT INTO `drafts` (`id`, `targetType`, `targetId`, `auditTargetType`, `auditTargetId`, `action`, `payload`, `editAt`, `submitAt`, `updateMessage`, `status`, `merged`, `auditId`, `circleId`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'circle', 1, 'circle', 1, 'update', '{\"name\": \"你好\", \"cover\": \"https://q.cdn.dove.cafe/w/8dcbfc498901b0eba28647baa343e76d.png\", \"content\": \"nihaonihaoasd a kl sadkl; dsjklf;ajdskf l;dsajkfl;dsajfkl;ds ajfkld;sa fjkld;sa fjka;lsd \", \"foundAt\": \"2023-10-12T12:04:41.000Z\", \"description\": \"test\"}', NULL, NULL, NULL, 'submitted', 0, 1, 1, 3, '2023-07-18 18:15:10', '2023-07-30 11:06:10'),
(2, 'gallery', 1, 'circle', 1, 'update', '{\"data\": {\"items\": [{\"src\": \"\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}}', '2023-07-20 07:56:52', NULL, NULL, 'submitted', 0, 1, 1, 3, '2023-07-20 07:56:52', '2023-07-30 11:06:10'),
(3, 'meta', 1, 'circle', 1, 'update', '{\"data\": [{\"name\": \"123\", \"type\": \"text\", \"value\": \"678\"}]}', '2023-07-20 09:13:00', NULL, NULL, 'submitted', 0, 1, 1, 3, '2023-07-20 09:13:00', '2023-07-30 11:06:10'),
(4, 'gate', 1, 'circle', 1, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"123\", \"links\": [{\"link\": \"jkl\", \"name\": \"sdf\", \"website\": \"\"}], \"description\": \"567\"}]}}', '2023-07-20 11:07:11', NULL, NULL, 'submitted', 0, 1, 1, 3, '2023-07-20 11:07:11', '2023-07-30 11:06:10'),
(5, 'circle', 3, 'circle', 3, 'update', '{\"name\": \"你完整测试\", \"cover\": \"https://q.cdn.dove.cafe/w/ec41297389017e43be705cd11597fe19.png\", \"content\": \"爱思帝哦啊四回家了德拉克斯；很好看拉屎还款计划加快速度几号开工大撒谎dfs\\n\\n的三个阶段反应阖家快乐多少感觉\", \"foundAt\": \"2020-01-20T11:56:39.537Z\", \"description\": \"三个阶段反应阖家快乐多少感觉\"}', NULL, NULL, NULL, 'submitted', 0, NULL, 3, 3, '2023-07-20 11:57:15', '2023-07-20 12:05:39'),
(6, 'gallery', 2, 'circle', 3, 'update', '{\"data\": {\"items\": [{\"src\": \"\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}}', '2023-07-20 11:58:19', NULL, NULL, 'submitted', 0, NULL, 3, 3, '2023-07-20 11:58:19', '2023-07-20 12:05:39'),
(7, 'gate', 2, 'circle', 3, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"你好你好\", \"links\": [{\"link\": \"321\", \"name\": \"123\", \"website\": \"\"}], \"description\": \"我好我好\"}]}}', '2023-07-20 11:58:45', NULL, NULL, 'submitted', 0, NULL, 3, 3, '2023-07-20 11:58:45', '2023-07-20 12:05:39'),
(8, 'meta', 2, 'circle', 3, 'update', '{\"data\": [{\"name\": \"我好\", \"type\": \"text\", \"value\": \"zxczxc\"}]}', '2023-07-20 11:58:55', NULL, NULL, 'submitted', 0, NULL, 3, 3, '2023-07-20 11:58:55', '2023-07-20 12:05:39'),
(9, 'circle', 1, 'circle', 1, 'create', '{\"name\": \"测试\", \"cover\": \"https://q.cdn.dove.cafe/w/947a75a6890185eff026a85995126d7c.jpg\", \"tagIds\": [{\"id\": 1, \"name\": \"测试\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T11:03:59.179Z\", \"updatedAt\": \"2023-07-30T11:03:59.179Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}, {\"id\": 2, \"name\": \"挺好\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T11:03:59.187Z\", \"updatedAt\": \"2023-07-30T11:03:59.187Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}, {\"id\": 3, \"name\": \"111\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T11:03:59.197Z\", \"updatedAt\": \"2023-07-30T11:03:59.197Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}], \"content\": \"测试1123\\n2345456\", \"foundAt\": \"2023-08-30T11:02:18.957Z\", \"description\": \"测试\"}', NULL, NULL, NULL, 'submitted', 0, 1, NULL, 3, '2023-07-30 11:03:59', '2023-07-30 11:06:10'),
(12, 'work', 3, 'work', 3, 'create', '{\"name\": \"测试\", \"type\": \"art\", \"cover\": \"https://q.cdn.dove.cafe/work/cover/3-f8d8b4a68901cebf9f21acfcfbfc5b1b.jpg\", \"tagIds\": [{\"id\": 3, \"name\": \"111\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T11:03:59.000Z\", \"updatedAt\": \"2023-07-30T11:03:59.000Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}, {\"id\": 4, \"name\": \"2222\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T12:11:09.000Z\", \"updatedAt\": \"2023-07-30T12:11:09.000Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}], \"content\": \"asdasdasdasd\", \"circleId\": 1, \"releaseAt\": \"2023-08-30T12:10:21.107Z\", \"description\": \"123123\"}', NULL, NULL, NULL, 'created', 0, 4, 1, 3, '2023-07-30 12:14:26', '2023-07-30 12:14:26'),
(13, 'circle', 2, 'circle', 2, 'create', '{\"name\": \"空白\", \"type\": \"doujin\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/1c3a7f468a01b11aecc290cb19665503.jpg\", \"source\": \"official\", \"tagIds\": [], \"content\": \"撒电风扇东方时代第三方史蒂夫\", \"foundAt\": \"2023-04-30T12:30:01.046Z\", \"description\": \"12123\"}', '2023-08-30 12:50:59', NULL, NULL, 'submitted', 1, 2, NULL, 3, '2023-07-30 12:30:17', '2023-08-30 12:51:28'),
(14, 'work', 4, 'work', 4, 'create', '{\"name\": \"测试啊哈2\", \"type\": \"art\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-7d7a7b468a01033f136ac112595f9b0b.jfif\", \"tagIds\": [3, 5], \"content\": \"多下功夫但如果二十个号别人发的女短发\", \"circleId\": 1, \"releaseAt\": \"2023-08-30T12:46:06.062Z\", \"description\": \"asdasd\"}', '2023-08-30 12:46:54', NULL, NULL, 'submitted', 1, 6, 1, 3, '2023-07-30 12:46:14', '2023-08-30 12:47:31'),
(15, 'event', 1, 'event', 1, 'create', '{\"city\": \"大连市\", \"name\": \"123321\", \"site\": \"online\", \"type\": \"comic\", \"cover\": \"https://q.cdn.dove.cafe/w/bfb8b5ad8901169e82d891512cff1487.jpg\", \"endAt\": \"2023-08-24T20:47:30.215Z\", \"tagIds\": [6, 3], \"content\": \"哇少的发水电阿爱仕达范德萨的的风格隧道股份多少 1231231231231231234324543发的根深asdklahs jkd hjksdfh jdfh jk hdjaklf hjksda hlfjsdkljf hjdas fhlasdlkjh fjksdf d hjf hjklcv lhkcdxj vjkldsa fhlkjdfa hljklkhj蒂固防水袋\", \"startAt\": \"2022-07-06T20:47:30.168Z\", \"circleId\": 1, \"mapPoint\": {\"lat\": 31.222712, \"lng\": 121.484944}, \"province\": \"辽宁省\", \"description\": \"12313123123\"}', NULL, NULL, NULL, 'submitted', 1, 7, 1, 3, '2023-07-31 20:49:25', '2023-08-15 22:19:26'),
(16, 'work', 5, 'work', 5, 'create', '{\"name\": \"你好世界\", \"type\": \"book\", \"cover\": \"https://q.cdn.dove.cafe/work/cover/3-0f2dd3cf89019d43b933e24e77d100f7.jpg\", \"tagIds\": [3], \"content\": \"啊收到见客户嘎嘣贵人故8i4规健康幸福国际快递\\nd发过的粉碎欧派公司发的jkfdvb fbd\\n收到\\n辅导费v有789额会哦【特回了VBdf\\nf df\'吃饱你89也回我纪律差\", \"circleId\": 1, \"releaseAt\": \"2023-07-07T11:47:53.356Z\", \"description\": \"嘎嘎\"}', NULL, NULL, NULL, 'submitted', 1, 8, 1, 3, '2023-08-07 11:48:06', '2023-08-07 12:31:57'),
(17, 'gallery', 3, 'work', 5, 'update', '{\"data\": {\"items\": [{\"src\": \"//player.bilibili.com/player.html?aid=641333837&bvid=BV1jY4y1b73s&cid=713446425&page=1\", \"link\": \"https://www.bilibili.com/video/BV1jY4y1b73s\", \"type\": \"biliVideo\"}], \"version\": 1}}', '2023-08-07 12:29:42', NULL, NULL, 'submitted', 1, 8, 1, 3, '2023-08-07 12:29:42', '2023-08-07 12:31:57'),
(18, 'gate', 3, 'work', 5, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"链接分组\", \"links\": [{\"link\": \"http://localhost:8290/work/edit?method=edit&workId=5&auditId=8\", \"name\": \"http://localhost:8290/work/edit?method=edit&workId=5&auditId=8\", \"website\": \"default\"}], \"description\": \"啦啦啦啦啊啊啊\"}]}}', '2023-08-07 12:30:19', NULL, NULL, 'submitted', 1, 8, 1, 3, '2023-08-07 12:30:19', '2023-08-07 12:31:57'),
(19, 'meta', 3, 'work', 5, 'update', '{\"data\": [{\"name\": \"元信息\", \"type\": \"text\", \"value\": \"123123\"}, {\"name\": \"收录说明\", \"type\": \"text\", \"value\": \"社团版块目前收录各种意义上的创作者，创作者至少需要发布/发表/举办过一个作品， 没有作品的创作者将会被标记为需要补充内容。\"}]}', '2023-08-07 12:30:36', NULL, NULL, 'submitted', 1, 8, 1, 3, '2023-08-07 12:30:36', '2023-08-07 12:31:57'),
(20, 'work', 5, 'work', 5, 'update', '{\"name\": \"你好世界\", \"type\": \"book\", \"cover\": \"https://q.cdn.dove.cafe/work/cover/3-ec5800d08901a9df2d97234617c8ce6f.jpg\", \"tagIds\": [3, 5], \"content\": \"啊收到见客户嘎嘣贵人故8i4规健康幸福国际快递\\nd发过的粉碎欧派公司发的jkfdvb fbd\\n收到\\n辅导费v有789额会哦【特回了VBdf\\nf df\'吃饱你89也回我纪律差\", \"circleId\": 1, \"releaseAt\": \"2023-07-07T11:47:53.000Z\", \"description\": \"嘎嘎\"}', '2023-08-07 12:37:14', NULL, NULL, 'submitted', 1, 9, 1, 3, '2023-08-07 12:37:14', '2023-08-20 17:40:24'),
(21, 'gallery', 3, 'work', 5, 'update', '{\"data\": {\"items\": [{\"src\": \"//player.bilibili.com/player.html?aid=641333837&bvid=BV1jY4y1b73s&cid=713446425&page=1\", \"link\": \"https://www.bilibili.com/video/BV1jY4y1b73s\", \"type\": \"biliVideo\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-b37307d089013f3df8afa7f2f6ccb827.jpg\", \"link\": \"http://localhost:8280/work/5\", \"type\": \"image\"}], \"version\": 1}}', '2023-08-07 12:45:17', NULL, NULL, 'submitted', 1, 9, 1, 3, '2023-08-07 12:45:17', '2023-08-20 17:40:24'),
(22, 'gate', 3, 'work', 5, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"社交平台\", \"links\": [{\"link\": \"https://space.bilibili.com/489703\", \"name\": \"B站\", \"website\": \"bilibili\"}, {\"link\": \"https://weibo.com/u/1496862394\", \"name\": \"微博\", \"website\": \"weibo\"}], \"description\": \"在这里查看我们的最新动态\"}, {\"name\": \"加群\", \"links\": [{\"link\": \"http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=dBJTHrr-7oI0lK9RKTMgUN_F4MOWqwxl&authKey=QcjFjZFG1ATG89XQozMcLT5nYdL2KFJ8YrqLax937nKucKEjPezqVltEg3CkXdjL&noverify=0&group_code=386286978\", \"name\": \"QQ群\", \"website\": \"default\"}], \"description\": \"\"}]}}', '2023-08-20 10:53:49', NULL, NULL, 'submitted', 1, 9, 1, 3, '2023-08-20 10:53:49', '2023-08-20 17:40:24'),
(23, 'gallery', 3, 'work', 5, 'update', '{\"data\": {\"items\": [{\"src\": \"//player.bilibili.com/player.html?aid=641333837&bvid=BV1jY4y1b73s&cid=713446425&page=1\", \"link\": \"https://www.bilibili.com/video/BV1jY4y1b73s\", \"type\": \"biliVideo\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-b37307d089013f3df8afa7f2f6ccb827.jpg\", \"link\": \"http://localhost:8280/work/5\", \"type\": \"image\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-524b10148a013d040fcc9db5aeb449f5.png\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}}', '2023-08-20 17:48:49', NULL, NULL, 'submitted', 1, 10, 1, 3, '2023-08-20 17:48:49', '2023-08-20 17:56:56'),
(24, 'gate', 3, 'work', 5, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"\", \"links\": [], \"description\": \"\"}]}}', '2023-08-20 17:48:57', NULL, NULL, 'submitted', 1, 10, 1, 3, '2023-08-20 17:48:57', '2023-08-20 17:56:56'),
(25, 'meta', 3, 'work', 5, 'update', '{\"data\": [{\"name\": \"元信息\", \"type\": \"text\", \"value\": \"123123\"}, {\"name\": \"收录说明\", \"type\": \"text\", \"value\": \"社团版块目前收录各种意义上的创作者，创作者至少需要发布/发表/举办过一个作品， 没有作品的创作者将会被标记为需要补充内容。\"}, {\"name\": \"111\", \"type\": \"text\", \"value\": \"2222\"}, {\"name\": \"多个文本\", \"type\": \"multi\", \"value\": \"33333\"}]}', '2023-08-20 17:49:19', NULL, NULL, 'submitted', 1, 10, 1, 3, '2023-08-20 17:49:19', '2023-08-20 17:56:56'),
(26, 'gate', 3, 'work', 5, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"社交平台\", \"links\": [{\"link\": \"https://space.bilibili.com/489703\", \"name\": \"B站\", \"website\": \"bilibili\"}, {\"link\": \"https://weibo.com/u/1496862394\", \"name\": \"微博\", \"website\": \"weibo\"}], \"description\": \"在这里查看我们的最新动态\"}, {\"name\": \"加群\", \"links\": [{\"link\": \"http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=dBJTHrr-7oI0lK9RKTMgUN_F4MOWqwxl&authKey=QcjFjZFG1ATG89XQozMcLT5nYdL2KFJ8YrqLax937nKucKEjPezqVltEg3CkXdjL&noverify=0&group_code=386286978\", \"name\": \"QQ群\", \"website\": \"default\"}], \"description\": \"\"}]}}', '2023-08-20 18:03:01', NULL, NULL, 'submitted', 1, 11, 1, 3, '2023-08-20 18:03:01', '2023-08-20 18:03:39'),
(27, 'event', 1, 'event', 1, 'update', '{\"city\": \"大连市\", \"name\": \"123321\", \"site\": \"online\", \"type\": \"comic\", \"cover\": \"https://q.cdn.dove.cafe/w/bfb8b5ad8901169e82d891512cff1487.jpg\", \"endAt\": \"2023-08-24T20:47:30.000Z\", \"tagIds\": [3, 6], \"content\": \"哇少的发水电阿爱仕达范德萨的的风格隧道股份多少 1231231231231231234324543发的根深asdklahs jkd hjksdfh jdfh jk hdjaklf hjksda hlfjsdkljf hjdas fhlasdlkjh fjksdf d hjf hjklcv lhkcdxj vjkldsa fhlkjdfa hljklkhj蒂固防水袋\", \"startAt\": \"2022-07-06T20:47:30.000Z\", \"mapPoint\": {\"lat\": 31.222712, \"lng\": 121.484944}, \"province\": \"辽宁省\", \"description\": \"12313123123\"}', '2023-08-23 18:45:44', NULL, NULL, 'submitted', 1, 12, 1, 3, '2023-08-23 18:45:44', '2023-08-23 19:14:16'),
(28, 'gate', 4, 'event', 1, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"活动网站\", \"links\": [{\"link\": \"http://localhost:8280/event/1\", \"name\": \"标题\", \"website\": \"default\"}], \"description\": \"嘿嘿嘿\"}]}}', '2023-08-23 18:46:54', NULL, NULL, 'submitted', 1, 12, 1, 3, '2023-08-23 18:46:54', '2023-08-23 19:14:16'),
(29, 'meta', 4, 'event', 1, 'update', '{\"data\": [{\"name\": \"元信息\", \"type\": \"text\", \"value\": \"啥元？\"}, {\"name\": \"2\", \"type\": \"text\", \"value\": \"3\"}]}', '2023-08-23 18:47:09', NULL, NULL, 'submitted', 1, 12, 1, 3, '2023-08-23 18:47:09', '2023-08-23 19:14:16'),
(30, 'gallery', 4, 'event', 1, 'update', '{\"data\": {\"items\": [{\"src\": \"https://q.cdn.dove.cafe/gallery/3-4895b9238a01c78e8585e0f3f0e81a0b.jpg\", \"link\": \"123\", \"type\": \"image\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-57c7b9238a0105cb845ad1fa56b6e56e.png\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}}', '2023-08-23 18:47:34', NULL, NULL, 'submitted', 1, 12, 1, 3, '2023-08-23 18:47:34', '2023-08-23 19:14:16'),
(31, 'event', 1, 'event', 1, 'update', '{\"city\": \"大连市\", \"name\": \"123321\", \"site\": \"online\", \"type\": \"comic\", \"cover\": \"https://q.cdn.dove.cafe/w/c86b17248a01e121f64abd9bdfef3bde.jpg\", \"endAt\": \"2023-08-24T20:47:30.000Z\", \"tagIds\": [3, 6], \"content\": \"哇少的发水电阿爱仕达范德萨的的风格隧道股份多少 1231231231231231234324543发的根深asdklahs jkd hjksdfh jdfh jk hdjaklf hjksda hlfjsdkljf hjdas fhlasdlkjh fjksdf d hjf hjklcv lhkcdxj vjkldsa fhlkjdfa hljklkhj蒂固防水袋\", \"startAt\": \"2022-07-06T20:47:30.000Z\", \"mapPoint\": {\"lat\": 31.222712, \"lng\": 121.484944}, \"province\": \"辽宁省\", \"description\": \"12313123123\"}', '2023-08-23 20:30:33', NULL, NULL, 'submitted', 1, 13, 1, 3, '2023-08-23 20:30:33', '2023-08-23 20:31:12'),
(32, 'event', 4, 'event', 4, 'update', '{\"city\": \"大连市\", \"name\": \"已经过过过期的活动\", \"site\": \"offline\", \"type\": \"comic\", \"cover\": \"https://q.cdn.dove.cafe/w/2db55e248a01755dffd05e06dda6efa1.jpg\", \"endAt\": \"2023-08-02T12:00:00.245Z\", \"tagIds\": [7, 8], \"content\": \"asdasd啊df‘gdf b\'fcvb d\\n\\nc半\\ndf半\\nv[cbvcgvc](http://asd.cn)\\n \\n \\n \\n\\n发出\\nd和vxb\\n| Head | Head |\\n| --- | --- |\\n| Data | Data |\\n| Data | Data |\\n\\n\\n~~史蒂夫~~\", \"startAt\": \"2023-08-01T01:00:00.539Z\", \"mapPoint\": {\"lat\": 38.915578, \"lng\": 121.587392}, \"province\": \"辽宁省\", \"description\": \"兴工街啦啦啦啦啦啦\"}', '2023-08-23 21:53:23', NULL, NULL, 'submitted', 1, 14, 1, 3, '2023-08-23 21:50:39', '2023-08-23 21:56:04'),
(33, 'gallery', 5, 'event', 4, 'update', '{\"data\": {\"items\": [{\"src\": \"https://q.cdn.dove.cafe/gallery/3-d17963248a013245f4853ab154fe9ea1.gif\", \"link\": \"\", \"type\": \"image\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-37cd63248a0165446c78935b96fa49bd.jpg\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}}', '2023-08-23 21:53:57', NULL, NULL, 'submitted', 1, 14, 1, 3, '2023-08-23 21:53:57', '2023-08-23 21:56:04'),
(34, 'gate', 5, 'event', 4, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"购票链接\", \"links\": [{\"link\": \"http://localhost/phpmyadmin/index.php?route=/sql&pos=0&db=dovecote2_dev&table=drafts\", \"name\": \"本地链接\", \"website\": \"default\"}, {\"link\": \"https://s.weibo.com/weibo?q=%23%E4%B9%A0%E8%BF%91%E5%B9%B3%E5%9C%A8%E9%87%91%E7%A0%96%E5%9B%BD%E5%AE%B6%E9%A2%86%E5%AF%BC%E4%BA%BA%E7%AC%AC%E5%8D%81%E4%BA%94%E6%AC%A1%E4%BC%9A%E6%99%A4%E4%B8%8A%E7%9A%84%E8%AE%B2%E8%AF%9D%23&topic_ad=\", \"name\": \"微博\", \"website\": \"weibo\"}], \"description\": \"很不错捏\"}, {\"name\": \"试试这个\", \"links\": [{\"link\": \"https://s.weibo.com/weibo?q=%23%E4%B9%A0%E8%BF%91%E5%B9%B3%E5%9C%A8%E9%87%91%E7%A0%96%E5%9B%BD%E5%AE%B6%E9%A2%86%E5%AF%BC%E4%BA%BA%E7%AC%AC%E5%8D%81%E4%BA%94%E6%AC%A1%E4%BC%9A%E6%99%A4%E4%B8%8A%E7%9A%84%E8%AE%B2%E8%AF%9D%23&topic_ad=\", \"name\": \"11\", \"website\": \"weibo\"}], \"description\": \"aa\"}]}}', '2023-08-23 21:54:55', NULL, NULL, 'submitted', 1, 14, 1, 3, '2023-08-23 21:54:55', '2023-08-23 21:56:04'),
(35, 'meta', 5, 'event', 4, 'update', '{\"data\": [{\"name\": \"元？\", \"type\": \"text\", \"value\": \"111\"}, {\"name\": \"vvv\", \"type\": \"text\", \"value\": \"安师大\"}]}', '2023-08-23 21:55:38', NULL, NULL, 'submitted', 1, 14, 1, 3, '2023-08-23 21:55:38', '2023-08-23 21:56:04'),
(36, 'event', 5, 'event', 5, 'create', '{\"city\": \"阳泉市\", \"name\": \"你好新活动\", \"site\": \"offline\", \"type\": \"hangout\", \"cover\": \"https://q.cdn.dove.cafe/w/d26670248a010eca9cbcf3316150f30e.jpg\", \"endAt\": \"2023-08-23T22:07:55.531Z\", \"tagIds\": [5], \"content\": \"123\", \"startAt\": \"2023-08-23T22:07:54.622Z\", \"circleId\": 1, \"mapPoint\": {\"lat\": 37.49286, \"lng\": 109.938464}, \"province\": \"山西省\", \"description\": \"12\"}', NULL, NULL, NULL, 'submitted', 1, 15, 1, 3, '2023-08-23 22:08:12', '2023-08-23 22:09:00'),
(37, 'event', 6, 'event', 6, 'update', '{\"city\": \"河东区\", \"name\": \"新活动44\", \"site\": \"online\", \"type\": \"other\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/467183468a01f2135859e63aee531297.jpg\", \"endAt\": \"2023-08-23T22:10:05.678Z\", \"tagIds\": [9], \"content\": \"123\", \"startAt\": \"2023-08-23T22:10:04.385Z\", \"mapPoint\": {\"lat\": 37.50902, \"lng\": 107.632652}, \"province\": \"天津市\", \"description\": \"123\"}', '2023-08-30 12:55:35', NULL, NULL, 'submitted', 1, 16, 1, 3, '2023-08-23 22:10:08', '2023-08-30 12:55:45'),
(38, 'work', 5, 'work', 5, 'update', '{\"name\": \"你好世界9999999\", \"type\": \"book\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-ecf57a468a014075d0a58189a0979a65.png\", \"tagIds\": [3, 5], \"content\": \"啊收到见客户嘎嘣贵人故8i4规健康幸福国际快递\\nd发过的粉碎欧派公司发的jkfdvb fbd\\n收到\\n辅导费v有789额会哦【特回了VBdf\\nf df\'吃饱你89也回我纪律差9999\\n9\\n9\\n9\\n9\\n\\n9\\n9\\n\\n9\", \"circleId\": 1, \"releaseAt\": \"2023-07-07T11:47:53.000Z\", \"description\": \"嘎嘎999999\"}', '2023-08-30 12:46:22', NULL, NULL, 'submitted', 1, 17, 1, 3, '2023-08-24 20:57:44', '2023-08-30 12:47:32'),
(39, 'gate', 3, 'work', 5, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"社交平台999\", \"links\": [{\"link\": \"https://space.bilibili.com/489703\", \"name\": \"B站\", \"website\": \"bilibili\"}, {\"link\": \"https://weibo.com/u/1496862394\", \"name\": \"微博\", \"website\": \"weibo\"}], \"description\": \"在这里查看我们的最新动态\"}, {\"name\": \"加群\", \"links\": [{\"link\": \"32123123123123123213123\", \"name\": \"QQ群\", \"website\": \"default\"}, {\"link\": \"123123高等师范公对公地方感\", \"name\": \"Discord\", \"website\": \"default\"}], \"description\": \"让朋友们快速加群\"}]}}', '2023-08-28 14:21:11', NULL, NULL, 'submitted', 1, 17, 1, 3, '2023-08-24 20:57:56', '2023-08-30 12:47:32'),
(40, 'meta', 3, 'work', 5, 'update', '{\"data\": [{\"name\": \"艺术家\", \"type\": \"text\", \"value\": \"哞菇\"}, {\"name\": \"原作\", \"type\": \"text\", \"value\": \"梦里啥都有\"}, {\"name\": \"语言\", \"type\": \"text\", \"value\": \"中文\"}, {\"name\": \"材质\", \"type\": \"text\", \"value\": \"CD\"}, {\"name\": \"碟数\", \"type\": \"text\", \"value\": \"1\"}, {\"name\": \"时长\", \"type\": \"text\", \"value\": \"23:33\"}, {\"name\": \"价格\", \"type\": \"text\", \"value\": \"114514元\"}]}', '2023-08-28 14:27:23', NULL, NULL, 'submitted', 1, 17, 1, 3, '2023-08-24 20:58:01', '2023-08-30 12:47:32'),
(41, 'circle', 3, 'circle', 3, 'create', '{\"name\": \"一个新的社团！\", \"cover\": \"https://q.cdn.dove.cafe/w/fe45e52c8a01168782a1dc8cb01d496a.png\", \"tagIds\": [3], \"content\": \"456456\", \"foundAt\": \"2023-07-25T13:32:28.418Z\", \"description\": \"123123456456\"}', NULL, NULL, NULL, 'created', 0, NULL, NULL, 3, '2023-08-25 13:33:56', '2023-08-25 13:33:56'),
(42, 'circle', 4, 'circle', 4, 'create', '{\"name\": \"33333\", \"cover\": \"https://q.cdn.dove.cafe/w/c43fef2c8a01074b14a6f34e8267c437.jpg\", \"tagIds\": [5], \"content\": \" 热工5 该喝喝把尾巴特文化问过二姑父大v发现搞定\", \"foundAt\": \"2023-08-25T13:43:16.428Z\", \"description\": \"爱仕达大厦下次v程序\"}', NULL, NULL, NULL, 'submitted', 1, 20, NULL, 3, '2023-08-25 13:43:20', '2023-08-25 14:13:11'),
(43, 'gallery', 6, 'circle', 4, 'update', '{\"data\": {\"items\": [{\"src\": \"https://q.cdn.dove.cafe/gallery/3-920ef22c8a01ff29c2e07c9d13e1376d.jpg\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}}', '2023-08-25 13:46:23', NULL, NULL, 'submitted', 1, 20, 4, 3, '2023-08-25 13:46:23', '2023-08-25 14:13:11'),
(44, 'gate', 6, 'circle', 4, 'update', '{\"data\": {\"version\": 1, \"sections\": [{\"name\": \"你好任意门\", \"links\": [{\"link\": \"https://ant.design/components/icon-cn\", \"name\": \"1231231\", \"website\": \"default\"}], \"description\": \"123123\"}]}}', '2023-08-25 13:46:40', NULL, NULL, 'submitted', 1, 20, 4, 3, '2023-08-25 13:46:40', '2023-08-25 14:13:11'),
(45, 'meta', 6, 'circle', 4, 'update', '{\"data\": [{\"name\": \"元信息\", \"type\": \"text\", \"value\": \"123131322132131232\"}, {\"name\": \"师德师风\", \"type\": \"text\", \"value\": \"发过十多个35 有5一个或 \"}]}', '2023-08-25 13:46:53', NULL, NULL, 'submitted', 1, 20, 4, 3, '2023-08-25 13:46:53', '2023-08-25 14:13:11'),
(46, 'work', 1, 'work', 1, 'update', '{\"name\": \"测试\", \"type\": \"art\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-e9b37b468a0148feeae8907d83b45dd4.jpg\", \"tagIds\": [], \"content\": \"asdasdasdasd\", \"circleId\": 1, \"releaseAt\": \"2023-08-30T12:10:21.000Z\", \"description\": \"123123\"}', '2023-08-30 12:47:08', NULL, NULL, 'submitted', 1, 5, 1, 3, '2023-08-30 12:47:08', '2023-08-30 12:47:30'),
(47, 'circle', 1, 'circle', 1, 'update', '{\"name\": \"测试1\", \"type\": \"doujin\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/c9ad7d468a01123b539f1f1ac532f96f.png\", \"source\": \"official\", \"tagIds\": [], \"content\": \"测试1123\\n2345456\", \"foundAt\": \"2023-08-30T11:02:18.000Z\", \"description\": \"测试\"}', '2023-08-30 12:49:19', NULL, NULL, 'submitted', 1, 21, 1, 3, '2023-08-30 12:49:19', '2023-08-30 12:51:26'),
(48, 'event', 4, 'event', 4, 'update', '{\"city\": \"大连市\", \"name\": \"已经过过过期的活动\", \"site\": \"offline\", \"type\": \"comic\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/016881468a01e5995c81204c1057ce76.png\", \"endAt\": \"2023-08-02T12:00:00.000Z\", \"tagIds\": [7, 8], \"content\": \"asdasd啊df‘gdf b\'fcvb d\\n\\nc半\\ndf半\\nv[cbvcgvc](http://asd.cn)\\n \\n \\n \\n\\n发出\\nd和vxb\\n| Head | Head |\\n| --- | --- |\\n| Data | Data |\\n| Data | Data |\\n\\n\\n~~史蒂夫~~\", \"startAt\": \"2023-08-01T01:00:00.000Z\", \"mapPoint\": {\"lat\": 38.915578, \"lng\": 121.587392}, \"province\": \"辽宁省\", \"description\": \"兴工街啦啦啦啦啦啦\"}', '2023-08-30 12:55:15', NULL, NULL, 'submitted', 1, 18, 1, 3, '2023-08-30 12:55:15', '2023-08-30 12:55:45'),
(49, 'work', 6, 'work', 6, 'create', '{\"name\": \"123\", \"type\": \"book\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-46ea81488a01b3be2dc37836d4ab05df.jpg\", \"tagIds\": [10], \"content\": \"123123\", \"circleId\": 1, \"releaseAt\": \"2023-08-30T22:13:15.256Z\", \"description\": \"123123\"}', NULL, NULL, NULL, 'created', 0, 23, 1, 3, '2023-08-30 22:13:17', '2023-08-30 22:13:17'),
(50, 'event', 4, 'event', 4, 'update', '{\"city\": \"大连市\", \"name\": \"已经过过过期的活动\", \"site\": \"offline\", \"type\": \"comic\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/016881468a01e5995c81204c1057ce76.png\", \"endAt\": \"2023-08-02T12:00:00.000Z\", \"tagIds\": [7, 8], \"address\": \"大连星海国际金融酒店3A宴会厅\", \"content\": \"asdasd啊df‘gdf b\'fcvb d\\n\\nc半\\ndf半\\nv[cbvcgvc](http://asd.cn)\\n \\n \\n \\n\\n发出\\nd和vxb\\n| Head | Head |\\n| --- | --- |\\n| Data | Data |\\n| Data | Data |\\n\\n\\n~~史蒂夫~~\", \"startAt\": \"2023-08-01T01:00:00.000Z\", \"mapPoint\": {\"lat\": 38.915578, \"lng\": 121.587392}, \"province\": \"辽宁省\", \"description\": \"兴工街啦啦啦啦啦啦\"}', '2023-09-04 15:19:54', NULL, NULL, 'submitted', 1, 24, 1, 3, '2023-09-04 15:19:54', '2023-09-04 15:20:06'),
(51, 'work', 7, 'work', 7, 'create', '{\"name\": \"你好世界\", \"type\": \"book\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-adb7586b8a01699b0fc2a217a7c816fb.jpg\", \"tagIds\": [11], \"content\": \"reterdffh h vcvbvc 123123\", \"circleId\": 4, \"releaseAt\": \"2023-08-06T17:52:36.645Z\", \"description\": \"234234234\"}', NULL, NULL, NULL, 'created', 0, 25, 4, 3, '2023-09-06 17:52:39', '2023-09-06 17:52:39'),
(52, 'circle', 5, 'circle', 5, 'create', '{\"name\": \"你好！\", \"type\": \"doujin\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/circle/cover/5-09b057948a01d43bbe9588597d767ac4.png\", \"source\": \"enthusiast\", \"tagIds\": [6], \"content\": \"12123123123456456\", \"foundAt\": \"2023-01-14T15:38:20.846Z\", \"description\": \"hello\"}', NULL, NULL, NULL, 'submitted', 1, 26, NULL, 5, '2023-09-14 15:38:26', '2023-09-14 15:39:07'),
(53, 'work', 8, 'work', 8, 'create', '{\"name\": \"test\", \"type\": \"book\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-531c9e9a8a0136172802ae5a0f5ececf.png\", \"tagIds\": [12], \"content\": \"test\", \"circleId\": 2, \"releaseAt\": \"2023-11-15T20:52:53.841Z\", \"description\": \"test\"}', NULL, NULL, NULL, 'created', 0, 27, 2, 3, '2023-09-15 20:52:56', '2023-09-15 20:52:56'),
(54, 'circle', 6, 'circle', 6, 'create', '{\"name\": \"新社团3\", \"type\": \"other\", \"cover\": \"https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/circle/cover/250-9fdc3db38a013eb43d0bed3c604e133f.jfif\", \"source\": \"official\", \"tagIds\": [9], \"content\": \"123示范点4 古典风格热给发个发过非\", \"foundAt\": \"2023-08-20T15:38:21.593Z\", \"description\": \"你好朋友\"}', NULL, NULL, NULL, 'created', 0, 28, NULL, 250, '2023-09-20 15:38:26', '2023-09-20 15:38:26');

-- --------------------------------------------------------

--
-- 表的结构 `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover` text,
  `site` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `alias` varchar(128) DEFAULT NULL,
  `province` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `address` text,
  `mapPoint` json DEFAULT NULL,
  `description` text,
  `content` text,
  `startAt` datetime DEFAULT NULL,
  `endAt` datetime DEFAULT NULL,
  `viewCount` int(10) UNSIGNED DEFAULT '0',
  `likeCount` int(10) UNSIGNED DEFAULT '0',
  `threadCount` int(10) UNSIGNED DEFAULT '0',
  `commentThreadCount` int(10) UNSIGNED DEFAULT '0',
  `commentThreadId` int(11) DEFAULT NULL,
  `commentPostCount` int(10) UNSIGNED DEFAULT '0',
  `isSensitive` tinyint(1) DEFAULT '0',
  `isHidden` tinyint(1) DEFAULT '0',
  `status` varchar(64) DEFAULT NULL,
  `circleId` int(11) DEFAULT NULL,
  `tagIds` json DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `events`
--

INSERT INTO `events` (`id`, `name`, `cover`, `site`, `type`, `alias`, `province`, `city`, `address`, `mapPoint`, `description`, `content`, `startAt`, `endAt`, `viewCount`, `likeCount`, `threadCount`, `commentThreadCount`, `commentThreadId`, `commentPostCount`, `isSensitive`, `isHidden`, `status`, `circleId`, `tagIds`, `source`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, '123321', 'https://q.cdn.dove.cafe/w/c86b17248a01e121f64abd9bdfef3bde.jpg', 'online', 'comic', NULL, '辽宁省', '大连市', NULL, '{\"lat\": 31.222712, \"lng\": 121.484944}', '12313123123', '哇少的发水电阿爱仕达范德萨的的风格隧道股份多少 1231231231231231234324543发的根深asdklahs jkd hjksdfh jdfh jk hdjaklf hjksda hlfjsdkljf hjdas fhlasdlkjh fjksdf d hjf hjklcv lhkcdxj vjkldsa fhlkjdfa hljklkhj蒂固防水袋', '2022-07-06 20:47:30', '2023-08-24 20:47:30', 0, 1, 1, 0, 3, 1, 0, 0, 'enabled', 1, '[3, 6]', NULL, NULL, '2023-07-31 20:49:25', '2023-08-24 12:13:01'),
(4, '已经过过过期的活动', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/016881468a01e5995c81204c1057ce76.png', 'offline', 'comic', NULL, '辽宁省', '大连市', '大连星海国际金融酒店3A宴会厅', '{\"lat\": 38.915578, \"lng\": 121.587392}', '兴工街啦啦啦啦啦啦', 'asdasd啊df‘gdf b\'fcvb d\n\nc半\ndf半\nv[cbvcgvc](http://asd.cn)\n \n \n \n\n发出\nd和vxb\n| Head | Head |\n| --- | --- |\n| Data | Data |\n| Data | Data |\n\n\n~~史蒂夫~~', '2023-08-01 01:00:00', '2023-08-02 12:00:00', 0, 0, 0, 0, NULL, 0, 0, 0, 'enabled', 1, '[7, 8]', NULL, NULL, '2023-08-23 21:50:39', '2023-09-04 15:20:06'),
(5, '你好新活动', 'https://q.cdn.dove.cafe/w/d26670248a010eca9cbcf3316150f30e.jpg', 'offline', 'hangout', NULL, '山西省', '阳泉市', NULL, '{\"lat\": 37.49286, \"lng\": 109.938464}', '12', '123', '2023-08-23 22:07:54', '2023-08-23 22:07:55', 0, 1, 0, 0, NULL, 0, 0, 0, 'enabled', 1, '[5]', NULL, NULL, '2023-08-23 22:08:12', '2023-08-24 12:12:53'),
(6, '新活动44', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/w/467183468a01f2135859e63aee531297.jpg', 'online', 'other', NULL, '天津市', '河东区', NULL, '{\"lat\": 37.50902, \"lng\": 107.632652}', '123', '123', '2023-08-23 22:10:04', '2023-08-23 22:10:05', 0, 0, 0, 0, NULL, 0, 0, 0, 'reviewing', 1, '[9]', NULL, NULL, '2023-08-23 22:10:08', '2023-08-30 12:55:45');

-- --------------------------------------------------------

--
-- 表的结构 `galleries`
--

CREATE TABLE `galleries` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) NOT NULL,
  `data` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `galleries`
--

INSERT INTO `galleries` (`id`, `targetType`, `targetId`, `data`, `createdAt`, `updatedAt`) VALUES
(1, 'circle', 1, '{\"items\": [{\"src\": \"\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}', '2023-07-20 06:56:16', '2023-07-30 11:06:10'),
(2, 'circle', 3, NULL, '2023-07-20 11:58:19', '2023-07-20 11:58:19'),
(3, 'work', 5, '{\"items\": [{\"src\": \"//player.bilibili.com/player.html?aid=641333837&bvid=BV1jY4y1b73s&cid=713446425&page=1\", \"link\": \"https://www.bilibili.com/video/BV1jY4y1b73s\", \"type\": \"biliVideo\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-b37307d089013f3df8afa7f2f6ccb827.jpg\", \"link\": \"http://localhost:8280/work/5\", \"type\": \"image\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-524b10148a013d040fcc9db5aeb449f5.png\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}', '2023-08-07 12:29:42', '2023-08-20 17:56:56'),
(4, 'event', 1, '{\"items\": [{\"src\": \"https://q.cdn.dove.cafe/gallery/3-4895b9238a01c78e8585e0f3f0e81a0b.jpg\", \"link\": \"123\", \"type\": \"image\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-57c7b9238a0105cb845ad1fa56b6e56e.png\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}', '2023-08-23 18:47:34', '2023-08-23 19:14:16'),
(5, 'event', 4, '{\"items\": [{\"src\": \"https://q.cdn.dove.cafe/gallery/3-d17963248a013245f4853ab154fe9ea1.gif\", \"link\": \"\", \"type\": \"image\"}, {\"src\": \"https://q.cdn.dove.cafe/gallery/3-37cd63248a0165446c78935b96fa49bd.jpg\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}', '2023-08-23 21:53:57', '2023-08-23 21:56:04'),
(6, 'circle', 4, '{\"items\": [{\"src\": \"https://q.cdn.dove.cafe/gallery/3-920ef22c8a01ff29c2e07c9d13e1376d.jpg\", \"link\": \"\", \"type\": \"image\"}], \"version\": 1}', '2023-08-25 13:46:23', '2023-08-25 14:13:11');

-- --------------------------------------------------------

--
-- 表的结构 `gates`
--

CREATE TABLE `gates` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) NOT NULL,
  `data` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gates`
--

INSERT INTO `gates` (`id`, `targetType`, `targetId`, `data`, `createdAt`, `updatedAt`) VALUES
(1, 'circle', 1, NULL, '2023-07-20 11:07:11', '2023-07-20 11:07:11'),
(2, 'circle', 3, NULL, '2023-07-20 11:58:45', '2023-07-20 11:58:45'),
(3, 'work', 5, '{\"version\": 1, \"sections\": [{\"name\": \"社交平台999\", \"links\": [{\"link\": \"https://space.bilibili.com/489703\", \"name\": \"B站\", \"website\": \"bilibili\"}, {\"link\": \"https://weibo.com/u/1496862394\", \"name\": \"微博\", \"website\": \"weibo\"}], \"description\": \"在这里查看我们的最新动态\"}, {\"name\": \"加群\", \"links\": [{\"link\": \"32123123123123123213123\", \"name\": \"QQ群\", \"website\": \"default\"}, {\"link\": \"123123高等师范公对公地方感\", \"name\": \"Discord\", \"website\": \"default\"}], \"description\": \"让朋友们快速加群\"}]}', '2023-08-07 12:30:19', '2023-08-30 12:47:32'),
(4, 'event', 1, '{\"version\": 1, \"sections\": [{\"name\": \"活动网站\", \"links\": [{\"link\": \"http://localhost:8280/event/1\", \"name\": \"标题\", \"website\": \"default\"}], \"description\": \"嘿嘿嘿\"}]}', '2023-08-23 18:46:54', '2023-08-23 19:14:16'),
(5, 'event', 4, '{\"version\": 1, \"sections\": [{\"name\": \"购票链接\", \"links\": [{\"link\": \"http://localhost/phpmyadmin/index.php?route=/sql&pos=0&db=dovecote2_dev&table=drafts\", \"name\": \"本地链接\", \"website\": \"default\"}, {\"link\": \"https://s.weibo.com/weibo?q=%23%E4%B9%A0%E8%BF%91%E5%B9%B3%E5%9C%A8%E9%87%91%E7%A0%96%E5%9B%BD%E5%AE%B6%E9%A2%86%E5%AF%BC%E4%BA%BA%E7%AC%AC%E5%8D%81%E4%BA%94%E6%AC%A1%E4%BC%9A%E6%99%A4%E4%B8%8A%E7%9A%84%E8%AE%B2%E8%AF%9D%23&topic_ad=\", \"name\": \"微博\", \"website\": \"weibo\"}], \"description\": \"很不错捏\"}, {\"name\": \"试试这个\", \"links\": [{\"link\": \"https://s.weibo.com/weibo?q=%23%E4%B9%A0%E8%BF%91%E5%B9%B3%E5%9C%A8%E9%87%91%E7%A0%96%E5%9B%BD%E5%AE%B6%E9%A2%86%E5%AF%BC%E4%BA%BA%E7%AC%AC%E5%8D%81%E4%BA%94%E6%AC%A1%E4%BC%9A%E6%99%A4%E4%B8%8A%E7%9A%84%E8%AE%B2%E8%AF%9D%23&topic_ad=\", \"name\": \"11\", \"website\": \"weibo\"}], \"description\": \"aa\"}]}', '2023-08-23 21:54:55', '2023-08-23 21:56:04'),
(6, 'circle', 4, '{\"version\": 1, \"sections\": [{\"name\": \"你好任意门\", \"links\": [{\"link\": \"https://ant.design/components/icon-cn\", \"name\": \"1231231\", \"website\": \"default\"}], \"description\": \"123123\"}]}', '2023-08-25 13:46:40', '2023-08-25 14:13:11');

-- --------------------------------------------------------

--
-- 表的结构 `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `type` varchar(128) DEFAULT NULL,
  `targetType` varchar(128) DEFAULT NULL,
  `targetId` int(11) DEFAULT NULL,
  `cover` text,
  `alias` varchar(128) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `accessible` varchar(64) DEFAULT NULL,
  `likeCount` int(11) DEFAULT '0',
  `threadCount` int(11) DEFAULT '0',
  `lastPostAt` datetime DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `type`, `targetType`, `targetId`, `cover`, `alias`, `userId`, `accessible`, `likeCount`, `threadCount`, `lastPostAt`, `status`, `createdAt`, `updatedAt`) VALUES
(1, '鸽舍公告板', '鸽舍官方公告板', NULL, NULL, NULL, NULL, 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/user/avatar-3-dc168a478a01fbc996b69dca771efb27.png', 3, 'public', 0, 4, '2023-09-04 14:23:00', 'enabled', '2023-09-03 18:34:06', '2023-09-04 14:23:00');

-- --------------------------------------------------------

--
-- 表的结构 `kvs`
--

CREATE TABLE `kvs` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `likeitems`
--

CREATE TABLE `likeitems` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) NOT NULL,
  `likeSubjectId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `likeitems`
--

INSERT INTO `likeitems` (`id`, `targetType`, `targetId`, `likeSubjectId`, `userId`, `createdAt`, `updatedAt`) VALUES
(22, 'work', 5, NULL, 3, '2023-08-24 11:39:47', '2023-08-24 11:39:47'),
(24, 'event', 5, NULL, 3, '2023-08-24 12:12:53', '2023-08-24 12:12:53'),
(26, 'event', 1, NULL, 3, '2023-08-24 12:13:01', '2023-08-24 12:13:01'),
(27, 'work', 4, NULL, 3, '2023-08-30 17:38:46', '2023-08-30 17:38:46');

-- --------------------------------------------------------

--
-- 表的结构 `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) NOT NULL,
  `likeCount` int(10) UNSIGNED DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `likes`
--

INSERT INTO `likes` (`id`, `targetType`, `targetId`, `likeCount`, `createdAt`, `updatedAt`) VALUES
(1, 'work', 5, 1, '2023-08-24 11:32:09', '2023-08-24 11:39:47'),
(2, 'event', 5, 1, '2023-08-24 12:12:47', '2023-08-24 12:12:53'),
(3, 'circle', 1, 0, '2023-08-24 12:12:57', '2023-08-24 12:12:58'),
(4, 'event', 1, 1, '2023-08-24 12:13:01', '2023-08-24 12:13:01'),
(5, 'work', 4, 1, '2023-08-30 17:38:46', '2023-08-30 17:38:46'),
(6, 'thread_post', 9, 0, '2023-09-04 13:06:57', '2023-09-04 13:06:58');

-- --------------------------------------------------------

--
-- 表的结构 `meta`
--

CREATE TABLE `meta` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) NOT NULL,
  `data` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `meta`
--

INSERT INTO `meta` (`id`, `targetType`, `targetId`, `data`, `createdAt`, `updatedAt`) VALUES
(1, 'circle', 1, '[{\"name\": \"123\", \"type\": \"text\", \"value\": \"678\"}]', '2023-07-20 09:13:00', '2023-07-30 11:06:10'),
(2, 'circle', 3, NULL, '2023-07-20 11:58:55', '2023-07-20 11:58:55'),
(3, 'work', 5, '[{\"name\": \"艺术家\", \"type\": \"text\", \"value\": \"哞菇\"}, {\"name\": \"原作\", \"type\": \"text\", \"value\": \"梦里啥都有\"}, {\"name\": \"语言\", \"type\": \"text\", \"value\": \"中文\"}, {\"name\": \"材质\", \"type\": \"text\", \"value\": \"CD\"}, {\"name\": \"碟数\", \"type\": \"text\", \"value\": \"1\"}, {\"name\": \"时长\", \"type\": \"text\", \"value\": \"23:33\"}, {\"name\": \"价格\", \"type\": \"text\", \"value\": \"114514元\"}]', '2023-08-07 12:30:36', '2023-08-30 12:47:32'),
(4, 'event', 1, '[{\"name\": \"元信息\", \"type\": \"text\", \"value\": \"啥元？\"}, {\"name\": \"2\", \"type\": \"text\", \"value\": \"3\"}]', '2023-08-23 18:47:09', '2023-08-23 19:14:16'),
(5, 'event', 4, '[{\"name\": \"元？\", \"type\": \"text\", \"value\": \"111\"}, {\"name\": \"vvv\", \"type\": \"text\", \"value\": \"安师大\"}]', '2023-08-23 21:55:38', '2023-08-23 21:56:04'),
(6, 'circle', 4, '[{\"name\": \"元信息\", \"type\": \"text\", \"value\": \"123131322132131232\"}, {\"name\": \"师德师风\", \"type\": \"text\", \"value\": \"发过十多个35 有5一个或 \"}]', '2023-08-25 13:46:53', '2023-08-25 14:13:11');

-- --------------------------------------------------------

--
-- 表的结构 `smscaptchas`
--

CREATE TABLE `smscaptchas` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `expiredAt` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tagitems`
--

CREATE TABLE `tagitems` (
  `id` int(11) NOT NULL,
  `tagId` int(11) DEFAULT NULL,
  `targetType` varchar(128) NOT NULL,
  `targetId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tagitems`
--

INSERT INTO `tagitems` (`id`, `tagId`, `targetType`, `targetId`, `createdAt`, `updatedAt`) VALUES
(1, 3, 'work', 4, '2023-08-30 12:47:31', '2023-08-30 12:47:31'),
(2, 5, 'work', 4, '2023-08-30 12:47:31', '2023-08-30 12:47:31'),
(3, 3, 'work', 5, '2023-08-30 12:47:32', '2023-08-30 12:47:32'),
(4, 5, 'work', 5, '2023-08-30 12:47:32', '2023-08-30 12:47:32'),
(5, 9, 'event', 6, '2023-08-30 12:55:45', '2023-08-30 12:55:45'),
(8, 7, 'event', 4, '2023-09-04 15:20:06', '2023-09-04 15:20:06'),
(9, 8, 'event', 4, '2023-09-04 15:20:06', '2023-09-04 15:20:06'),
(10, 6, 'circle', 5, '2023-09-14 15:39:07', '2023-09-14 15:39:07');

-- --------------------------------------------------------

--
-- 表的结构 `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `workCount` int(11) DEFAULT NULL,
  `circleCount` int(11) DEFAULT NULL,
  `eventCount` int(11) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tags`
--

INSERT INTO `tags` (`id`, `name`, `workCount`, `circleCount`, `eventCount`, `status`, `createdAt`, `updatedAt`) VALUES
(1, '测试', -1, 0, 0, 'enabled', '2023-07-30 11:03:59', '2023-08-20 17:40:24'),
(2, '挺好', 0, 0, -1, 'enabled', '2023-07-30 11:03:59', '2023-08-23 19:14:16'),
(3, '111', 4, 0, 2, 'enabled', '2023-07-30 11:03:59', '2023-08-30 12:47:32'),
(4, '2222', 0, 0, 0, 'enabled', '2023-07-30 12:11:09', '2023-07-30 12:11:09'),
(5, '222', 3, 1, 1, 'enabled', '2023-07-30 12:46:14', '2023-08-30 12:47:32'),
(6, '123', 0, 1, 0, 'enabled', '2023-07-31 20:49:25', '2023-09-14 15:39:07'),
(7, 'ttt', 0, 0, 1, 'enabled', '2023-08-23 21:50:39', '2023-09-04 15:20:06'),
(8, 'qqq', 0, 0, 3, 'enabled', '2023-08-23 21:50:39', '2023-09-04 15:20:06'),
(9, '1', 0, 0, 1, 'enabled', '2023-08-23 22:10:08', '2023-08-30 12:55:45'),
(10, '11', 0, 0, 0, 'enabled', '2023-08-30 22:13:17', '2023-08-30 22:13:17'),
(11, '安师大', 0, 0, 0, 'enabled', '2023-09-06 17:52:39', '2023-09-06 17:52:39'),
(12, 'test', 0, 0, 0, 'enabled', '2023-09-15 20:52:56', '2023-09-15 20:52:56');

-- --------------------------------------------------------

--
-- 表的结构 `threadposts`
--

CREATE TABLE `threadposts` (
  `id` int(11) NOT NULL,
  `threadId` int(11) DEFAULT NULL,
  `content` text,
  `userId` int(11) DEFAULT NULL,
  `likeCount` int(11) DEFAULT '0',
  `status` varchar(64) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `threadposts`
--

INSERT INTO `threadposts` (`id`, `threadId`, `content`, `userId`, `likeCount`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 2, '你好这个活动！', 3, 0, 'enabled', '2023-08-23 20:52:21', '2023-08-23 20:52:21'),
(2, 1, '我来评论评论', 3, 0, 'enabled', '2023-08-23 20:56:27', '2023-08-23 20:56:27'),
(3, 1, '哈哈11', 3, 0, 'enabled', '2023-08-23 20:56:31', '2023-08-23 20:56:31'),
(4, 1, '哈哈22', 3, 0, 'enabled', '2023-08-23 20:56:34', '2023-08-23 20:56:34'),
(5, 3, '你好呀', 3, 0, 'enabled', '2023-08-23 21:05:54', '2023-08-23 21:05:54'),
(8, 9, '456456', 3, 0, 'enabled', '2023-09-03 21:18:32', '2023-09-03 21:18:32'),
(9, 10, '你好1231231', 3, 0, 'enabled', '2023-09-04 13:05:21', '2023-09-04 13:06:58'),
(10, 10, '路口监控处理尽量快点放假开始了；发快手了； 就看电视了； fjk\n的说法监控立杆kl\n\n东富龙控股i903噗i监控量测就看到了说；给', 3, 0, 'enabled', '2023-09-04 13:07:17', '2023-09-04 13:07:17'),
(11, 10, '安师大安师大萨达下次v下次v下次v下次v\n123i噢噢噢哦哦的方式附后的发\n\n房产过户返利科技麻烦尽快金科股份\n\ngf好fgdgd\n \n \n\n\n\n \n \n \n   \n \n\n\n \n \n   \n\n方大化工发的好地方干活g ', 3, 0, 'enabled', '2023-09-04 14:23:00', '2023-09-04 14:23:00'),
(12, 1, '你好你好啊数据库的很骄傲数控刀具安徽三建黑胡椒凯盛科技发抠脚大汉健康看见的工会经费课间活动个静电纺丝客户给f\n‘ 讲课风格喝咖啡了焦热动捕②\n hfg nbg发货\n\nbv b如\nfbvc小白\nv bebvc be hr', 3, 0, 'enabled', '2023-09-04 14:23:57', '2023-09-04 14:23:57');

-- --------------------------------------------------------

--
-- 表的结构 `threads`
--

CREATE TABLE `threads` (
  `id` int(11) NOT NULL,
  `targetType` varchar(128) DEFAULT NULL,
  `targetId` int(11) DEFAULT NULL,
  `type` varchar(64) DEFAULT 'default',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `lastPostAt` datetime DEFAULT NULL,
  `lastPostUserId` int(11) DEFAULT NULL,
  `lastUpdateAt` datetime DEFAULT NULL,
  `postCount` int(10) UNSIGNED DEFAULT '0',
  `clickCount` int(10) UNSIGNED DEFAULT '0',
  `userId` int(11) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `threads`
--

INSERT INTO `threads` (`id`, `targetType`, `targetId`, `type`, `title`, `content`, `lastPostAt`, `lastPostUserId`, `lastUpdateAt`, `postCount`, `clickCount`, `userId`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'work', 5, 'default', '标题标题标题标题标题', NULL, '2023-09-04 14:23:57', 3, NULL, 7, 0, 3, 'enabled', '2023-08-09 15:23:30', '2023-09-04 14:23:57'),
(2, 'work', 1, 'subject_comment', '条目讨论', NULL, '2023-08-23 20:52:21', 3, NULL, 1, 0, NULL, NULL, '2023-08-23 20:51:18', '2023-08-23 20:52:21'),
(3, 'event', 1, 'subject_comment', '条目讨论', NULL, '2023-08-23 21:05:54', 3, NULL, 1, 0, NULL, NULL, '2023-08-23 21:05:49', '2023-08-23 21:05:54'),
(4, 'circle', 4, 'subject_comment', '条目讨论', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2023-08-25 14:25:27', '2023-08-25 14:25:27'),
(5, 'event', 5, 'subject_comment', '条目讨论', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2023-08-25 14:27:59', '2023-08-25 14:27:59'),
(6, 'work', 4, 'subject_comment', '条目讨论', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2023-08-30 17:18:32', '2023-08-30 17:18:32'),
(7, 'group', 1, 'default', '1231231111', NULL, NULL, NULL, NULL, 0, 0, 3, 'enabled', '2023-09-03 21:15:58', '2023-09-03 21:15:58'),
(8, 'group', 1, 'default', '123123222', NULL, NULL, NULL, NULL, 0, 0, 3, 'enabled', '2023-09-03 21:17:08', '2023-09-03 21:17:08'),
(9, 'group', 1, 'default', '1231233333', NULL, '2023-09-03 21:18:32', 3, NULL, 1, 0, 3, 'enabled', '2023-09-03 21:18:32', '2023-09-03 21:18:32'),
(10, 'group', 1, 'default', '你好呀', '这是文章的内容\n\n## 标题\n\n今天天气怎么样。\n\n**123**\n\n++213短信发送地方下次v中~~是发的发~~++\n\n> 安师大放到发的三个放到、\n`湿答答撒\n\n`\n\n\n```\n撒旦发生的发是风格化对方改变VB\n```\n\n| Head | Head |\n| --- | --- |\n| Data | Data |\n| Data | Data |\n\n[爱上大时代发顺丰](的风格谁的风格的方式)\n', '2023-09-04 14:23:00', 3, NULL, 3, 0, 3, 'enabled', '2023-09-04 11:25:01', '2023-09-04 14:23:00'),
(11, 'circle', 1, 'subject_comment', '条目讨论', '', NULL, NULL, NULL, 0, 0, NULL, NULL, '2023-09-14 13:39:29', '2023-09-14 13:39:29'),
(12, 'circle', 5, 'subject_comment', '条目讨论', '', NULL, NULL, NULL, 0, 0, NULL, NULL, '2023-09-14 16:20:46', '2023-09-14 16:20:46'),
(13, 'event', 4, 'subject_comment', '条目讨论', '', NULL, NULL, NULL, 0, 0, NULL, NULL, '2023-09-15 16:10:51', '2023-09-15 16:10:51'),
(14, 'circle', 2, 'subject_comment', '条目讨论', '', NULL, NULL, NULL, 0, 0, NULL, NULL, '2023-09-21 15:44:50', '2023-09-21 15:44:50'),
(15, 'circle', 2, 'default', '你好2', '测试\n- -你好世界', '2023-09-21 20:42:07', NULL, '2023-09-21 20:44:06', 0, 0, 3, 'enabled', '2023-09-21 20:42:07', '2023-09-21 20:44:06'),
(16, 'circle', 2, 'default', '321', '123', '2023-09-22 19:38:51', NULL, NULL, 0, 0, 3, 'removed', '2023-09-22 19:38:51', '2023-09-22 19:39:01'),
(17, 'circle', 1, 'default', '测试文章', '测试', '2023-09-24 11:29:05', NULL, NULL, 0, 0, 3, 'enabled', '2023-09-24 11:29:05', '2023-09-24 11:29:05');

-- --------------------------------------------------------

--
-- 表的结构 `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `provider` varchar(64) NOT NULL,
  `scene` varchar(64) DEFAULT NULL,
  `key` text,
  `extension` varchar(64) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `uploads`
--

INSERT INTO `uploads` (`id`, `provider`, `scene`, `key`, `extension`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'q-cloud', 'circle-cover', '/w/8dcbfc498901b0eba28647baa343e76d.png', 'png', 3, '2023-07-12 12:04:11', '2023-07-12 12:04:11'),
(2, 'q-cloud', 'circle-cover', '/w/ec41297389017e43be705cd11597fe19.png', 'png', 3, '2023-07-20 11:57:11', '2023-07-20 11:57:11'),
(3, 'q-cloud', 'circle-cover', '/w/947a75a6890185eff026a85995126d7c.jpg', 'jpg', 3, '2023-07-30 11:01:04', '2023-07-30 11:01:04'),
(4, 'q-cloud', 'work-cover', '/work/cover/3-976b8aa689011c4f0b7eca9910c5ca5c.jpg', 'jpg', 3, '2023-07-30 11:23:56', '2023-07-30 11:23:56'),
(5, 'q-cloud', 'work-cover', '/work/cover/3-dace8ba68901314a868741769e0af2c3.jpg', 'jpg', 3, '2023-07-30 11:25:27', '2023-07-30 11:25:27'),
(6, 'q-cloud', 'work-cover', '/work/cover/3-252995a6890151da219517c88ef9653e.jpg', 'jpg', 3, '2023-07-30 11:35:40', '2023-07-30 11:35:40'),
(7, 'q-cloud', 'work-cover', '/work/cover/3-5dfeaba689018de0aa74fe135c3e0dfd.jpg', 'jpg', 3, '2023-07-30 12:00:37', '2023-07-30 12:00:37'),
(8, 'q-cloud', 'work-cover', '/work/cover/3-f8d8b4a68901cebf9f21acfcfbfc5b1b.jpg', 'jpg', 3, '2023-07-30 12:10:17', '2023-07-30 12:10:17'),
(9, 'q-cloud', 'circle-cover', '/w/7307c7a689015af96421df31952d0510.jpg', 'jpg', 3, '2023-07-30 12:30:09', '2023-07-30 12:30:09'),
(10, 'q-cloud', 'work-cover', '/work/cover/3-d899d5a68901ca9fcb0e2dc3a1b2c447.jpg', 'jpg', 3, '2023-07-30 12:46:04', '2023-07-30 12:46:04'),
(11, 'q-cloud', 'event-cover', '/w/bfb8b5ad8901169e82d891512cff1487.jpg', 'jpg', 3, '2023-07-31 20:48:35', '2023-07-31 20:48:35'),
(12, 'q-cloud', 'work-cover', '/work/cover/3-b151a9cf8901ba2d2b625ceecd619bb5.jpg', 'jpg', 3, '2023-08-07 11:02:07', '2023-08-07 11:02:07'),
(13, 'q-cloud', 'work-cover', '/work/cover/3-0f2dd3cf89019d43b933e24e77d100f7.jpg', 'jpg', 3, '2023-08-07 11:47:51', '2023-08-07 11:47:51'),
(14, 'q-cloud', 'work-cover', '/work/cover/3-c694fdcf8901e19da86f922bc64ba970.jpg', 'jpg', 3, '2023-08-07 12:34:10', '2023-08-07 12:34:10'),
(15, 'q-cloud', 'work-cover', '/work/cover/3-3dc2ffcf89013df96d1a3dec5854d163.jpg', 'jpg', 3, '2023-08-07 12:36:32', '2023-08-07 12:36:32'),
(16, 'q-cloud', 'work-cover', '/work/cover/3-ec5800d08901a9df2d97234617c8ce6f.jpg', 'jpg', 3, '2023-08-07 12:37:11', '2023-08-07 12:37:11'),
(17, 'q-cloud', 'gallery', '/gallery/3-b37307d089013f3df8afa7f2f6ccb827.jpg', 'jpg', 3, '2023-08-07 12:44:56', '2023-08-07 12:44:56'),
(18, 'q-cloud', 'gallery', '/gallery/3-524b10148a013d040fcc9db5aeb449f5.png', 'png', 3, '2023-08-20 17:48:47', '2023-08-20 17:48:47'),
(19, 'q-cloud', 'event-cover', '/w/3d4bb4238a01272d330362e84df36c1a.jpg', 'jpg', 3, '2023-08-23 18:42:13', '2023-08-23 18:42:13'),
(20, 'q-cloud', 'gallery', '/gallery/3-dadfb7238a018c03cd3a59cb369923fd.jpg', 'jpg', 3, '2023-08-23 18:46:07', '2023-08-23 18:46:07'),
(21, 'q-cloud', 'gallery', '/gallery/3-ea2bb8238a0104425ce9dfa9486b2cec.png', 'png', 3, '2023-08-23 18:46:27', '2023-08-23 18:46:27'),
(22, 'q-cloud', 'gallery', '/gallery/3-4895b9238a01c78e8585e0f3f0e81a0b.jpg', 'jpg', 3, '2023-08-23 18:47:59', '2023-08-23 18:47:59'),
(23, 'q-cloud', 'gallery', '/gallery/3-57c7b9238a0105cb845ad1fa56b6e56e.png', 'png', 3, '2023-08-23 18:48:12', '2023-08-23 18:48:12'),
(24, 'q-cloud', 'event-cover', '/w/c86b17248a01e121f64abd9bdfef3bde.jpg', 'jpg', 3, '2023-08-23 20:30:29', '2023-08-23 20:30:29'),
(25, 'q-cloud', 'event-cover', '/w/2db55e248a01755dffd05e06dda6efa1.jpg', 'jpg', 3, '2023-08-23 21:48:21', '2023-08-23 21:48:21'),
(26, 'q-cloud', 'gallery', '/gallery/3-d17963248a013245f4853ab154fe9ea1.gif', 'gif', 3, '2023-08-23 21:53:33', '2023-08-23 21:53:33'),
(27, 'q-cloud', 'gallery', '/gallery/3-37cd63248a0165446c78935b96fa49bd.jpg', 'jpg', 3, '2023-08-23 21:53:55', '2023-08-23 21:53:55'),
(28, 'q-cloud', 'event-cover', '/w/d26670248a010eca9cbcf3316150f30e.jpg', 'jpg', 3, '2023-08-23 22:07:40', '2023-08-23 22:07:40'),
(29, 'q-cloud', 'event-cover', '/w/806972248a01bc2c3595773225ee0474.jpg', 'jpg', 3, '2023-08-23 22:09:52', '2023-08-23 22:09:52'),
(30, 'q-cloud', 'user-avatar', '/user/avatar-3-c05e18298a01aa9ade2ad919d997da3f.jpg', 'jpg', 3, '2023-08-24 19:49:37', '2023-08-24 19:49:37'),
(31, 'q-cloud', 'circle-cover', '/w/fe45e52c8a01168782a1dc8cb01d496a.png', 'png', 3, '2023-08-25 13:32:18', '2023-08-25 13:32:18'),
(32, 'q-cloud', 'circle-cover', '/w/09a1ed2c8a01995a7f7f2eb308728a97.jpg', 'jpg', 3, '2023-08-25 13:41:25', '2023-08-25 13:41:25'),
(33, 'q-cloud', 'circle-cover', '/w/c43fef2c8a01074b14a6f34e8267c437.jpg', 'jpg', 3, '2023-08-25 13:43:11', '2023-08-25 13:43:11'),
(34, 'q-cloud', 'gallery', '/gallery/3-920ef22c8a01ff29c2e07c9d13e1376d.jpg', 'jpg', 3, '2023-08-25 13:46:15', '2023-08-25 13:46:15'),
(35, 'q-cloud', 'work-cover', '/work/cover/3-313679468a0177550213a0c8db47a1c7.png', 'png', 3, '2023-08-30 12:44:23', '2023-08-30 12:44:23'),
(36, 'q-cloud', 'work-cover', '/work/cover/3-ecf57a468a014075d0a58189a0979a65.png', 'png', 3, '2023-08-30 12:46:18', '2023-08-30 12:46:18'),
(37, 'q-cloud', 'work-cover', '/work/cover/3-7d7a7b468a01033f136ac112595f9b0b.jfif', 'jfif', 3, '2023-08-30 12:46:52', '2023-08-30 12:46:52'),
(38, 'q-cloud', 'work-cover', '/work/cover/3-e9b37b468a0148feeae8907d83b45dd4.jpg', 'jpg', 3, '2023-08-30 12:47:06', '2023-08-30 12:47:06'),
(39, 'q-cloud', 'circle-cover', '/w/c9ad7d468a01123b539f1f1ac532f96f.png', 'png', 3, '2023-08-30 12:49:16', '2023-08-30 12:49:16'),
(40, 'q-cloud', 'circle-cover', '/w/ade57d468a01b77221806353e0b5434b.jpg', 'jpg', 3, '2023-08-30 12:49:30', '2023-08-30 12:49:30'),
(41, 'q-cloud', 'circle-cover', '/w/1c3a7f468a01b11aecc290cb19665503.jpg', 'jpg', 3, '2023-08-30 12:50:57', '2023-08-30 12:50:57'),
(42, 'q-cloud', 'event-cover', '/w/016881468a01e5995c81204c1057ce76.png', 'png', 3, '2023-08-30 12:53:20', '2023-08-30 12:53:20'),
(43, 'q-cloud', 'event-cover', '/w/467183468a01f2135859e63aee531297.jpg', 'jpg', 3, '2023-08-30 12:55:34', '2023-08-30 12:55:34'),
(44, 'q-cloud', 'user-avatar', '/user/avatar-3-dc168a478a01fbc996b69dca771efb27.png', 'png', 3, '2023-08-30 17:42:27', '2023-08-30 17:42:27'),
(45, 'q-cloud', 'work-cover', '/work/cover/3-46ea81488a01b3be2dc37836d4ab05df.jpg', 'jpg', 3, '2023-08-30 22:13:08', '2023-08-30 22:13:08'),
(46, 'q-cloud', 'gallery', '/gallery/3-7150614a8a0123a299efba4681ccc152.jpg', 'jpg', 3, '2023-08-31 06:56:46', '2023-08-31 06:56:46'),
(47, 'q-cloud', 'gallery', '/gallery/3-5669794a8a017888a52ead692d3b81a1.png', 'png', 3, '2023-08-31 07:23:05', '2023-08-31 07:23:05'),
(48, 'q-cloud', 'work-cover', '/work/cover/3-adb7586b8a01699b0fc2a217a7c816fb.jpg', 'jpg', 3, '2023-09-06 16:34:51', '2023-09-06 16:34:51'),
(49, 'q-cloud', 'circle-cover', '/circle/cover/5-09b057948a01d43bbe9588597d767ac4.png', 'png', 5, '2023-09-14 15:38:09', '2023-09-14 15:38:09'),
(50, 'q-cloud', 'work-cover', '/work/cover/3-531c9e9a8a0136172802ae5a0f5ececf.png', 'png', 3, '2023-09-15 20:52:48', '2023-09-15 20:52:48'),
(51, 'q-cloud', 'circle-cover', '/circle/cover/250-9fdc3db38a013eb43d0bed3c604e133f.jfif', 'jfif', 250, '2023-09-20 15:38:10', '2023-09-20 15:38:10');

-- --------------------------------------------------------

--
-- 表的结构 `userinvites`
--

CREATE TABLE `userinvites` (
  `id` int(11) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `expiredAt` datetime DEFAULT NULL,
  `availableCount` int(11) DEFAULT NULL,
  `usedCount` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `userinvites`
--

INSERT INTO `userinvites` (`id`, `type`, `code`, `expiredAt`, `availableCount`, `usedCount`, `name`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'system', '1231231231', '2025-05-29 03:35:25', 995, 3, 'hello', 1, '2023-05-29 03:35:25', '2023-09-20 14:37:33'),
(3, 'user_invite', 'DOVEW8PzgplJ', NULL, 1, 0, '123 的邀请', 3, '2023-08-15 20:03:22', '2023-08-15 20:03:22'),
(5, 'user_invite', 'dove-oxojuMPqP1', '2023-08-22 20:11:40', 1, 0, '123 的邀请', 3, '2023-08-15 20:11:40', '2023-08-15 20:11:40');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatar` text,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `isPhoneVerified` tinyint(1) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `isEmailVerified` tinyint(1) DEFAULT '0',
  `password` text,
  `status` varchar(255) DEFAULT NULL,
  `role` varchar(64) DEFAULT 'user',
  `lastLoginInAt` datetime DEFAULT NULL,
  `inviteUserId` int(11) DEFAULT NULL,
  `inviteId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `username`, `avatar`, `nickname`, `phone`, `isPhoneVerified`, `email`, `isEmailVerified`, `password`, `status`, `role`, `lastLoginInAt`, `inviteUserId`, `inviteId`, `createdAt`, `updatedAt`) VALUES
(1, 'system', '123', 'system', '000', 1, 'sys@s.s', 1, NULL, 'enabled', 'admin', NULL, NULL, NULL, '2023-05-29 03:34:27', '2023-05-29 03:34:27'),
(3, '123123', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/user/avatar-3-dc168a478a01fbc996b69dca771efb27.png', 'Nektora', NULL, 0, NULL, 0, '$2a$10$sKsWtO4p4Xk1j8CZGVQhW.nqw9QyRJkPoUvnRG44RwQ1Q0Il2895W', 'enabled', 'admin', '2023-09-20 17:14:30', NULL, NULL, '2023-05-28 19:40:33', '2023-09-20 17:14:30'),
(4, 'test', NULL, 'test22', NULL, 0, NULL, 0, '$2a$10$/5Zaoq/VR245r2eL49DyY.2IAASFuKJfKTlLnbXXd5GJqEE6/fA36', 'enabled', 'user', NULL, 1, 1, '2023-08-31 10:42:49', '2023-08-31 10:56:33'),
(5, 'a456456', NULL, '456456', NULL, 0, NULL, 0, '$2a$10$EJmVSUglQrmydPuh7nubbul07yWJl6C3yTRONcMbX/Jq8xIAAEglS', 'enabled', 'user', NULL, 1, 1, '2023-09-14 15:37:25', '2023-09-14 15:37:25'),
(101, 'nekotoraold', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210110015255-zkpIn5p8.jpg', 'Nekotora', NULL, 0, 'i@flag.moe', 0, '$2y$10$qNS0FnfCOA/iMAGye1pBXe3/ElsWzP3ROoY10OqwxwZG7nuE97Xl.', 'enabled', 'user', '2023-08-31 05:20:00', NULL, NULL, '2020-04-19 03:58:00', '2023-08-31 05:20:00'),
(102, '云霞', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210110214816-OEnu1LS8.jpg', '云霞', NULL, 0, 'kwenkasumi@gmail.com', 0, '$2y$10$c0IRNraBkwwbpgeFXehrOu6U7cbWH.GaCtTw29vKPsHycpfdtq/jq', 'enabled', 'user', '2021-05-12 09:57:00', NULL, NULL, '2021-01-10 21:29:00', '2021-05-12 09:57:00'),
(103, '荒宇', NULL, '荒宇', NULL, 0, '775229547@qq.com', 0, '$2y$10$LyuL5u0WWh1v5E9zb0jr4uNpqtDEf/E0ZrpsdsNIGFOtaK2dOVimy', 'enabled', 'user', '2021-01-10 21:56:00', NULL, NULL, '2021-01-10 21:53:00', '2021-01-10 21:56:00'),
(104, 'Saikka', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210110223729-fNkR1u5I.jpg', 'Saikka', NULL, 0, 'zaiwo@me.com', 0, '$2y$10$aFDkca6Ag7aEqSpJGEsW/eTk.Eh2S3GZ2az2XnEEUDK/TqmmGJqfm', 'enabled', 'user', '2021-01-12 10:12:00', NULL, NULL, '2021-01-10 22:34:00', '2021-01-12 10:12:00'),
(105, 'Johnolive', NULL, NULL, NULL, 0, '3305301609@qq.com', 0, '$2y$10$NrNWif7icUWscEI7XtclHucVpsIA7z7u0kbTqIjoBI9kIOGuY9pv6', 'enabled', 'user', '2021-09-13 00:15:00', NULL, NULL, '2021-01-10 23:14:00', '2021-09-13 00:15:00'),
(106, 'autosakura', NULL, NULL, NULL, 0, '2622101002@qq.com', 0, '$2y$10$i2GMUwmoR.bv7rgIuNR95uf0FY686H2sak96.dQBZicfWa0Y.dehO', 'enabled', 'user', '2021-01-11 00:28:00', NULL, NULL, '2021-01-11 00:27:00', '2021-01-11 00:28:00'),
(107, 'agulator', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210111102351-V8hdGqFy.jpg', 'OceanAGUL', NULL, 0, 'awakeagul@gmail.com', 0, '$2y$10$iq3sayjh2anRELmsRrpvZePaAjDty7XqPj.Zo05oBP/XjFVDc5gdG', 'enabled', 'user', '2021-01-18 22:06:00', NULL, NULL, '2021-01-11 10:17:00', '2021-01-18 22:06:00'),
(108, 'RemiIO', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210113030030-SnNZefMm.webp', '蕾咪io', NULL, 0, 'i@remi.email', 0, '$2y$10$QJQ/OkeMFBUiXC1hAO4oA.3.BZrb0a1SCqMRa4.VdcRHrXLmfKROu', 'enabled', 'user', '2021-01-13 02:59:00', NULL, NULL, '2021-01-13 02:59:00', '2021-01-13 03:00:00'),
(109, 'hitomi', NULL, '凌晓', NULL, 0, 'huahuohe@foxmail.com', 0, '$2y$10$UplIIpMmnuzZk611dY5jc.oUdwzlj4a/R5uwY4R94UFZaGjdtE/di', 'enabled', 'user', '2021-01-14 01:06:00', NULL, NULL, '2021-01-14 01:05:00', '2021-01-14 01:12:00'),
(110, '夜城光棱', NULL, '夜城光棱', NULL, 0, 'zjwpeter@hotmail.com', 0, '$2y$10$k7q.1ibUMyIP8T8HfhRNwud9jtzEwQON7FmE/bmQi6M/V3oU5B912', 'enabled', 'user', '2023-03-29 01:24:00', NULL, NULL, '2021-01-14 22:48:00', '2023-03-29 01:25:00'),
(111, 'TaKaYuMe', NULL, 'TaKaYuMe', NULL, 0, '469861059@qq.com', 0, '$2y$10$0GssdN43t.nWkWh3UZgWH.PuqkTEb.6ro.ib4pkpKYJJhjDWItTZS', 'enabled', 'user', '2021-01-24 21:25:00', NULL, NULL, '2021-01-24 21:25:00', '2021-01-24 21:25:00'),
(112, 'sunshina503', NULL, '狮纳仙人', NULL, 0, 'hlsun0503@163.com', 0, '$2y$10$A3mMWRALNtTC7zPJVjKzleJT44JZq1pZuOwQMHTqKDlQVp7r4lFVG', 'enabled', 'user', '2021-01-31 17:29:00', NULL, NULL, '2021-01-31 17:23:00', '2021-01-31 17:29:00'),
(113, '2369888061', NULL, 'ChinaSouth', NULL, 0, '2369888061@qq.com', 0, '$2y$10$isejj1RT0iz7h/HcM8Q0S.g6EvM7uQvPnua6baK51Nqluhb4uJPJ2', 'enabled', 'user', '2022-12-12 05:47:00', NULL, NULL, '2021-02-01 11:10:00', '2022-12-12 05:47:00'),
(114, 'NERV', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210208165527-StmorThX.jpeg', 'NERV', NULL, 0, '1124648302@qq.com', 0, '$2y$10$EpoGo0Kqb3AEUBiwT1/ThO1.K5rgpvda.Cvpx/CZLSsTYpe0Ah7Bu', 'enabled', 'user', '2022-09-27 14:49:00', NULL, NULL, '2021-02-08 16:52:00', '2022-09-27 14:49:00'),
(115, 'hello', NULL, 'hello', NULL, 0, 'hello@hello.com', 0, '$2y$10$UVeBrYujt5395hf3QsKogu15YJHT/cOq0argi5bq8ZEx/BizadjKG', 'enabled', 'user', '2021-10-07 02:08:00', NULL, NULL, '2021-02-09 03:54:00', '2021-10-07 02:08:00'),
(116, 'windhadow', NULL, '摸鱼王老G', NULL, 0, 'jifengyueying@gmail.com', 0, '$2y$10$4xzDyNTjihspLmiQQsJoVOSuUC3n.0TE0xQfeavoiZEw4TAqO7stm', 'enabled', 'user', '2021-04-14 22:35:00', NULL, NULL, '2021-02-12 01:29:00', '2021-04-14 22:35:00'),
(117, 'pzio', NULL, 'pzio', NULL, 0, 'pzio@par.ink', 0, '$2y$10$n1oFGUuYmxNJmOmz0XJ9D.yZDS7ICMmypBBTy35u1YnE9tlri0UDi', 'enabled', 'user', '2022-01-26 18:55:00', NULL, NULL, '2021-02-12 19:13:00', '2022-01-26 18:55:00'),
(118, 'Kuikuikui_', NULL, '葵葵葵葵葵子', NULL, 0, '3153407248@qq.com', 0, '$2y$10$hs0FYDqyDfk1AHG95arnTOMEEvjl9DNFciYTboYivMBN6KJTAD/Qe', 'enabled', 'user', '2021-02-15 17:31:00', NULL, NULL, '2021-02-15 17:30:00', '2021-02-15 17:31:00'),
(119, 'mengdiao', NULL, '萌弔', NULL, 0, '987761232@qq.com', 0, '$2y$10$OhPWmPELf89tSLsbt1MOxufCy2RlJ1mr9Hm6kaiSu5VYFx.otrRge', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 18:27:00', '2021-02-19 18:27:00'),
(120, 'Eevee_pu', NULL, '伊布pu', NULL, 0, '1821131981@qq.com', 0, '$2y$10$HAjpGf7m9l4hSfN.eh4nyOpnrYXm4K4W5W1H6Q6vqen.BFeZxary6', 'enabled', 'user', '2021-02-19 18:31:00', NULL, NULL, '2021-02-19 18:30:00', '2021-02-19 18:31:00'),
(121, 'UsamiAlice', NULL, '流浪', NULL, 0, '695454202@qq.com', 0, '$2y$10$Po8ehVnRjbX4OmBSXbPjSe.ndbMs775/JDJIjKideh2b3mn5l3IJW', 'enabled', 'user', '2021-02-19 18:38:00', NULL, NULL, '2021-02-19 18:35:00', '2021-02-19 18:38:00'),
(122, 'NULL', NULL, 'NULL', NULL, 0, '7579650@qq.com', 0, '$2y$10$uHJaYBmLlSCCp9rS3y45ze1QZ3rFhDtwx.5OZCrM4d9scW1w0Fj9q', 'enabled', 'user', '2023-01-05 14:09:00', NULL, NULL, '2021-02-19 18:39:00', '2023-01-05 14:09:00'),
(123, 'Cirno_9', NULL, 'Baka9', NULL, 0, '897748102@qq.com', 0, '$2y$10$psiU4tPGw76RvbKJsrhzK.7zCbwz982f6g7GMeF5IcJ2oY/MfRJf.', 'enabled', 'user', '2021-02-19 18:42:00', NULL, NULL, '2021-02-19 18:41:00', '2021-02-19 18:42:00'),
(124, 'DNS451', NULL, '华氏451', NULL, 0, 'silencesuu@gmail.com', 0, '$2y$10$jtUXQQkth0xWrMD1wEBfK.yH9UN.DVT2dWKS9qmqD0slYsxYbkF3a', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 18:48:00', '2021-02-19 18:48:00'),
(125, 'Kishin_suiito', NULL, '天星晓欲稀', NULL, 0, '1282443047@qq.com', 0, '$2y$10$FECstys/lnmPtx8CQd35QezUT4rbidTju4eCTFmr46fbm6A73qCdy', 'enabled', 'user', '2021-02-19 18:49:00', NULL, NULL, '2021-02-19 18:49:00', '2021-02-19 18:49:00'),
(126, 'TOKdawn', NULL, 'Dawn', NULL, 0, '18746442232@163.com', 0, '$2y$10$5EaXxfzqGdXceRro/JPuBe3zzd3i0olh9Jb6qtUn7fWAk5wrGgQ7.', 'enabled', 'user', '2021-02-19 18:52:00', NULL, NULL, '2021-02-19 18:51:00', '2021-02-19 18:52:00'),
(127, '1003284949', NULL, '悠久之风', NULL, 0, '1003284949@qq.com', 0, '$2y$10$bZbSXDaaiq0XLkhEB.KBYeD8CBZ/1OMXZ3B4Sq2Dd4c6rA3lpWSYa', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 18:55:00', '2021-02-19 18:55:00'),
(128, 'Novel', NULL, '咕咕saika', NULL, 0, '3023900441@qq.com', 0, '$2y$10$i1L8o2oR21WWugmnBkByWua19r8tVNm49rjpWUVV1UL85BpgrsoP2', 'enabled', 'user', '2021-02-19 19:07:00', NULL, NULL, '2021-02-19 19:04:00', '2021-02-19 19:07:00'),
(129, 'Qsr007', NULL, '藏狐', NULL, 0, '1552159463@qq.com', 0, '$2y$10$oRsupjG408RziHTEN61R1OAATo95G0OjbAjgLzlbtEDHRCKProw/e', 'enabled', 'user', '2021-02-19 19:15:00', NULL, NULL, '2021-02-19 19:13:00', '2021-02-19 19:15:00'),
(130, 'Pamernt', NULL, 'Pamernt', NULL, 0, 'tonyprice335@gmail.com', 0, '$2y$10$5D1rMrmfIU8.YqVgVpmWxOmQTIqowusef97gEtqUg09/D53qzg9WG', 'enabled', 'user', '2021-02-19 19:15:00', NULL, NULL, '2021-02-19 19:15:00', '2021-02-19 19:15:00'),
(131, 'kiseopt', NULL, 'kiseopt', NULL, 0, 'hibiya@live.cn', 0, '$2y$10$gm6wG3bRPW4XSB7klqNX2uIQWQy69xs3vVw9Tn3PUq6rHB0O8U8T2', 'enabled', 'user', '2021-07-08 12:07:00', NULL, NULL, '2021-02-19 19:33:00', '2021-07-08 12:07:00'),
(132, 'XrayBravoGolf', NULL, '逍遥哥ShPd', NULL, 0, 'xuxiaoyao213@gmail.com', 0, '$2y$10$pobyrx/ldfzg/v3Em11YV.Ges1BQ0hv6kD44IEnFxivMk0mVcmmPe', 'enabled', 'user', '2021-02-19 19:45:00', NULL, NULL, '2021-02-19 19:44:00', '2021-02-19 19:45:00'),
(133, 'MashiroUsagi', NULL, 'MashiroUsagi', NULL, 0, 'vwtuguan@gmail.com', 0, '$2y$10$rS9hsXcnADFa7oiK0aAkh.LIiKvqpEdz3RWakRrIf7wWjjb50Atcu', 'enabled', 'user', '2021-02-19 19:50:00', NULL, NULL, '2021-02-19 19:50:00', '2021-02-19 19:50:00'),
(134, 'MoTIEdsuNe', NULL, '狸', NULL, 0, 'MoTIEdsuNe@outlook.com', 0, '$2y$10$/zoLWhQdH52mY3T5t5VuqObtqh8z1aNBdLB3RmE6rCc1wc0VtghXi', 'enabled', 'user', '2021-03-02 14:23:00', NULL, NULL, '2021-02-19 20:04:00', '2021-03-02 14:23:00'),
(135, 'hycuihz', NULL, '神楽坂 卡諾', NULL, 0, 'hello@kanocui.top', 0, '$2y$10$8BiMG9gZ3u3yZXv9Qqc/2.AcFW7/qJgghz9L2tZu1Idbzodyiuxmy', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 20:20:00', '2021-02-19 20:20:00'),
(136, 'wzhone', NULL, 'wzhone', NULL, 0, 'i@wzh.one', 0, '$2y$10$1sz95VkFtBt81OVCYqeWQOOdMZW8qzEoxFSCRK76VqlbUFIseK4PC', 'enabled', 'user', '2021-02-19 20:24:00', NULL, NULL, '2021-02-19 20:24:00', '2021-02-19 20:24:00'),
(137, 'ssyximmlove', NULL, 'ssyximmlove', NULL, 0, 'ssyximmlove@gmail.com', 0, '$2y$10$Zsotguv9ARnxSIKhqmgj0eWXjOxazGrZLSJ.qtV3la985z5.3nFqy', 'enabled', 'user', '2021-02-20 16:22:00', NULL, NULL, '2021-02-19 20:29:00', '2021-02-20 16:22:00'),
(138, '18781084155', NULL, 'MaNnySa', NULL, 0, '908178991@qq.com', 0, '$2y$10$zA2ZRvDlPGa1D6CvDEA8J..tpyD29ZJDcTaL5J2TVODAaP2vs6wUq', 'enabled', 'user', '2021-02-19 21:36:00', NULL, NULL, '2021-02-19 21:36:00', '2021-02-19 21:36:00'),
(139, 'SatsukiRin', NULL, '冴月燐', NULL, 0, '2963758836@qq.com', 0, '$2y$10$guLPaBX8/oYEEwKrySi3RuaVJYQjbsyG4yuzBnv/GON7ITcJamYjS', 'enabled', 'user', '2021-02-19 21:43:00', NULL, NULL, '2021-02-19 21:42:00', '2021-02-19 21:43:00'),
(140, 'Dylan', NULL, '神', NULL, 0, 'Andylaw8964@icloud.com', 0, '$2y$10$zQKAHp4avD9A5V4hooSzNOb412f3nVZJMOeusaIhNwdO/VjfaLaiu', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 21:44:00', '2021-02-19 21:44:00'),
(141, 'swb233', NULL, '潮到出水鸣上悠', NULL, 0, '2823412593@qq.com', 0, '$2y$10$1Boc1BD3rEPH153YWKINjua3ywksvosvK4gng.NfZMqH1ZB9VrIja', 'enabled', 'user', '2021-02-19 21:55:00', NULL, NULL, '2021-02-19 21:55:00', '2021-02-19 21:55:00'),
(142, 'ShidianAr', NULL, 'ShidianAr', NULL, 0, '1150169766@qq.com', 0, '$2y$10$LReeUikoH/NveAiCV5SdHOGpfRyS1oKem4Wouw8FXen07.qHw5fla', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 22:01:00', '2021-02-19 22:01:00'),
(143, 'shezhangw', NULL, '射长w', NULL, 0, '3335964534@qq.com', 0, '$2y$10$zlJa8r8UrskNXkbEHL2uUOSz9432kiMPelI1cqPkRBpHprYuZiYX2', 'enabled', 'user', '2021-02-19 22:02:00', NULL, NULL, '2021-02-19 22:01:00', '2021-02-19 22:02:00'),
(144, 'Reimu_Lunatic', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210219220410-MxZNonRB.png', '黎月残', NULL, 0, 'mrstonesmith@qq.com', 0, '$2y$10$6./cPLEnf9mdL6vf47UFh.U/ms3ePiHQU04UYh8a1xYvPbMZhDaqq', 'enabled', 'user', '2021-02-19 22:03:00', NULL, NULL, '2021-02-19 22:02:00', '2021-02-19 22:04:00'),
(145, 'lokiforever37', NULL, '鸠字签', NULL, 0, '1909045679@qq.com', 0, '$2y$10$xKXwMxyXhOpyxa1S9gJaaeBiUhmJC.spELb72f1eTN7i1jBRuZqCK', 'enabled', 'user', '2021-02-19 22:04:00', NULL, NULL, '2021-02-19 22:03:00', '2021-02-19 22:04:00'),
(146, '1925428107', NULL, '账号已注销', NULL, 0, '1925428107@qq.com', 0, '$2y$10$GXH3FeaYyzBBc5TC3BfIhOID7QybqH8RJg8A0XVwQIULzcTSjUKsK', 'enabled', 'user', '2021-02-19 22:08:00', NULL, NULL, '2021-02-19 22:08:00', '2021-02-19 22:08:00'),
(147, 'biaoqinjun', NULL, '情君表', NULL, 0, '932552568@qq.com', 0, '$2y$10$ijSmkbCklBy6xYmX5x9SouYh7Klwl/2D43sMnI1riyYC0URPgwqLi', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 22:13:00', '2021-02-19 22:13:00'),
(148, 'yyty', NULL, '绵月丰姬', NULL, 0, '764235612@qq.com', 0, '$2y$10$ubCJq4a8l6uEXbGSsSW05eUaPV22ZVUlJRa0EvMtCz/zyWeb8eNtK', 'enabled', 'user', '2021-02-19 22:17:00', NULL, NULL, '2021-02-19 22:17:00', '2021-02-19 22:17:00'),
(149, 'HinanawiTenshi', NULL, 'HinanawiTenshi', NULL, 0, '2024222380@qq.com', 0, '$2y$10$NpVf7iP5dUvry1eM5m.U4uy57qoEgthmiCm/QbBH.m8roE6ZnVdzu', 'enabled', 'user', '2021-02-19 22:20:00', NULL, NULL, '2021-02-19 22:18:00', '2021-02-19 22:20:00'),
(150, 'qianjun233', NULL, '千筠酱酱酱qwq', NULL, 0, '1269091507@qq.com', 0, '$2y$10$8DEsK.Kj9mxf5UC.L8LLweuokzADvJOigVx54RNj9wukaDazBlk7e', 'enabled', 'user', '2021-02-19 22:38:00', NULL, NULL, '2021-02-19 22:36:00', '2021-02-19 22:38:00'),
(151, 'susan_xsy990411', NULL, '从前有只妙妙猫', NULL, 0, '18991164938@126.com', 0, '$2y$10$yJzmazJUHdE918Ot2QYeC.0i7Ls1oqRdJv8B.tV..CA9CjfzVYWb2', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 22:41:00', '2021-02-19 22:41:00'),
(152, 'egomuse', NULL, '白玩具', NULL, 0, '1924028181@qq.com', 0, '$2y$10$OEg6LUQFq5rzY.YHvs//I.DF7.ecG5fJYymztLmgeB9ydl.qksNQO', 'enabled', 'user', '2021-02-20 20:04:00', NULL, NULL, '2021-02-19 22:53:00', '2021-02-20 20:04:00'),
(153, 'real_scv', NULL, '艾斯细微', NULL, 0, 'real_scv@qq.com', 0, '$2y$10$pnNLbKe/THYRf5gWQATr2eVvkxHsokelaXSBZBUhDx63phWDVnpuS', 'enabled', 'user', '2021-02-21 16:19:00', NULL, NULL, '2021-02-19 22:56:00', '2021-02-21 16:19:00'),
(154, 'redaking', NULL, 'Alixia', NULL, 0, '1812831065@qq.com', 0, '$2y$10$bhWv2PMoSoHAqHm5PvtaNe08lu7nncU3xFI./yDxl1xzXHHg2l2lu', 'enabled', 'user', '2021-02-19 22:57:00', NULL, NULL, '2021-02-19 22:57:00', '2021-02-19 22:57:00'),
(155, 'yunyiaidai', NULL, '云翳叆叇', NULL, 0, '975443651@qq.com', 0, '$2y$10$4YFTAPGDvXrQ5znVaxXoZOpH64Qu1SI4aKblvhd8IajCRM85C1Dgq', 'enabled', 'user', '2021-03-08 10:02:00', NULL, NULL, '2021-02-19 23:15:00', '2021-03-08 10:02:00'),
(156, 'joey_ichi', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210219232738-xmYz1CIy.jpg', '当代的幻想书屋', NULL, 0, '1052718283@qq.com', 0, '$2y$10$oq5S7tauS9a9uiJ.gZuTQ.FfsUzAGnOqTSz.HC8c4GfcOcp2AV3em', 'enabled', 'user', '2021-02-19 23:25:00', NULL, NULL, '2021-02-19 23:25:00', '2021-02-19 23:27:00'),
(157, 'q1499406428', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210219233436-AB5OyLXx.png', '风不玄', NULL, 0, '1499406428@qq.com', 0, '$2y$10$EZ8KPaP8lcxZ1.dnXw2tAOVADybxv7AC13T37qsz1URXSnDgEuViK', 'enabled', 'user', '2021-03-21 13:20:00', NULL, NULL, '2021-02-19 23:32:00', '2021-03-21 13:20:00'),
(158, 'losecoco', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210219234058-ryW4Gr8b.jpg', 'losecoco', NULL, 0, '772011819@qq.com', 0, '$2y$10$fjcoqEI/yvL7NaT96RE57eDntNAf1y00l.mswWX3BSGPKBhC1sq0q', 'enabled', 'user', '2021-02-19 23:35:00', NULL, NULL, '2021-02-19 23:34:00', '2021-02-19 23:42:00'),
(159, 'alchemist2015', NULL, '一月一', NULL, 0, '447304568@qq.com', 0, '$2y$10$Zx9nq1p8RMqbeF5TRWOiKubc56j13DZ02noX.Li8tqDKtFvGJpiCu', 'enabled', 'user', NULL, NULL, NULL, '2021-02-19 23:40:00', '2021-02-19 23:40:00'),
(160, 'YukinaCL', NULL, '阿房aze', NULL, 0, '1186574187@qq.com', 0, '$2y$10$5wt.mBweUmH0FJK.8kL/7ezNGwUDLC/r6LakjZAFJM2Sjf86WU/3y', 'enabled', 'user', '2021-02-19 23:42:00', NULL, NULL, '2021-02-19 23:42:00', '2021-02-19 23:42:00'),
(161, 'Sorakongkong', NULL, '空空', NULL, 0, '2628823235@qq.com', 0, '$2y$10$.FEBxsFTlX7EibeT/AotduklUGEkixql3sACeRoldbT7SJT8.gP0a', 'enabled', 'user', '2021-02-19 23:54:00', NULL, NULL, '2021-02-19 23:53:00', '2021-02-19 23:54:00'),
(162, 'maoyicat', NULL, '猫伊cat', NULL, 0, '1778048962@qq.com', 0, '$2y$10$t0wVwzOmjDbsaA8Qw3vUseGSSRPH3DRi6bBu9ar/5ejQddRuSwTTW', 'enabled', 'user', NULL, NULL, NULL, '2021-02-20 00:05:00', '2021-02-20 00:05:00'),
(163, 'yunmiaoyanmiao', NULL, '羲雲', NULL, 0, '13104975889@163.com', 0, '$2y$10$tMOCTnUWedzCGkAjXhtL8uz/AExo360vN9BtjDG4shFUMzIyt1.ka', 'enabled', 'user', '2023-06-06 13:15:00', NULL, NULL, '2021-02-20 00:19:00', '2023-06-06 13:15:00'),
(164, '0--0', NULL, '綺星', NULL, 0, 'jiang-mt@qq.com', 0, '$2y$10$x9a.zNvo87BC1v5C7/.yJOFxzfXjR49RnTo5n1P95mbYaOVHMfTMu', 'enabled', 'user', '2021-02-20 00:22:00', NULL, NULL, '2021-02-20 00:21:00', '2021-02-20 00:22:00'),
(165, 'skimige', NULL, '天幻', NULL, 0, 'dove.moe@xyx.moe', 0, '$2y$10$IP2mPt3lOCV/Ed3sYXA4UuZSiBAy02O.Ct.A2o5rqhcl/G8T5MAZO', 'enabled', 'user', '2021-02-20 23:56:00', NULL, NULL, '2021-02-20 00:24:00', '2021-02-20 23:56:00'),
(166, 'Makkosu', NULL, 'Makkosu', NULL, 0, '929799134@qq.com', 0, '$2y$10$wqeRG4mK87qhLYM6nzW4V.Ltya7UDJuB2Av9KEwZGttfhK5Na3Vtu', 'enabled', 'user', '2021-02-20 00:27:00', NULL, NULL, '2021-02-20 00:26:00', '2021-02-20 00:27:00'),
(167, 'ClassicOldSong', NULL, 'Yukino Song', NULL, 0, 'yukino@yuki.network', 0, '$2y$10$huMDeJeQ0YrbxCKGrzb/3ex.z.mBGdsB6DDkNyETvLr6ZoMwiJNpu', 'enabled', 'user', '2021-02-20 00:32:00', NULL, NULL, '2021-02-20 00:30:00', '2021-02-20 00:32:00'),
(168, 'connorliu', NULL, '龙猫爱吃薯片', NULL, 0, '672242302@qq.com', 0, '$2y$10$xpPM7uCWRvD3iz1fKWQpm.m9fZz2rj5lnsjcKm7b2OFbzP8A9oBie', 'enabled', 'user', NULL, NULL, NULL, '2021-02-20 00:49:00', '2021-02-20 00:49:00'),
(169, 'nirvanazhu', NULL, 'Aqua Nir', NULL, 0, 'hello@aquanir.cc', 0, '$2y$10$GEMlsVirz7h9/Vk9P.NsfOoVDpMDPKBMWOeduo41GJqQ/fjCTJm4e', 'enabled', 'user', '2021-02-20 09:48:00', NULL, NULL, '2021-02-20 00:50:00', '2021-02-20 09:48:00'),
(170, 'SinceZH', NULL, '中午睡不着', NULL, 0, '1373690562@qq.com', 0, '$2y$10$Jts/3ChOxNTkCSNlVY3RQ.besmmZzWb4MSnCjEHhbbEpTjAALe8bK', 'enabled', 'user', '2021-05-05 23:01:00', NULL, NULL, '2021-02-20 00:55:00', '2021-05-05 23:01:00'),
(171, 'dove', NULL, 'moe', NULL, 0, 'hi@max.moe', 0, '$2y$10$Hi9.e9uQ.nnKuXdlofAOheQa3dbxyH5D8jeAtIlOE72bPRiPQX8nC', 'enabled', 'user', '2021-02-20 05:50:00', NULL, NULL, '2021-02-20 00:58:00', '2021-02-20 05:50:00'),
(172, 'Moedrian', NULL, 'moedrian', NULL, 0, 'ikamitse@gmail.com', 0, '$2y$10$MqGxmZVMq1huPLbO3s5It.EXYgD.qzWoVzVUR4IM6JD.uu4/E3twC', 'enabled', 'user', '2021-02-20 01:02:00', NULL, NULL, '2021-02-20 01:02:00', '2021-02-20 01:02:00'),
(173, 'Cirneko', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210220011544-I8gzjKAB.jpg', '琪露喵', NULL, 0, 'sunnyadrink@gmail.com', 0, '$2y$10$LAWxtk/vlZrMn3iek8MZlu4TaThnRPPyY1ZWEHhX/1ScxuccNpvxa', 'enabled', 'user', '2021-08-29 06:32:00', NULL, NULL, '2021-02-20 01:06:00', '2021-08-29 06:32:00'),
(174, 'miuchan', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210220015245-KdHUFMWv.jpeg', '雨宮美羽', NULL, 0, 'k737566@gmail.com', 0, '$2y$10$pRUMZjXbd49cw.5tZG9f8.dQvWf2/JmUzL8vxF64sRfWTaWiwIbr2', 'enabled', 'user', '2021-02-20 01:34:00', NULL, NULL, '2021-02-20 01:20:00', '2021-02-20 01:52:00'),
(175, 'Neko_Error', NULL, 'Neko_Error', NULL, 0, '2848860591@qq.com', 0, '$2y$10$3z8jxuJ8Ku9Yww7tT7Vs3u7yA3KGOYJpZe3Z56eNqkg78vzyTybi6', 'enabled', 'user', '2021-02-20 01:27:00', NULL, NULL, '2021-02-20 01:26:00', '2021-02-20 01:27:00'),
(176, 'txrtanzi', NULL, '坛子菌', NULL, 0, 'txrtanzi@gmail.com', 0, '$2y$10$MQVQw5yhigE3R3ArORQUF.4B1Kg5djS15eg0Ozl7Iek92DfWoAgou', 'enabled', 'user', '2021-02-20 01:41:00', NULL, NULL, '2021-02-20 01:40:00', '2021-02-20 01:41:00'),
(177, 'tcdw', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210220023441-X07mKiCq.png', '土豆大王', NULL, 0, 'tcdw2011@gmail.com', 0, '$2y$10$kfX5K8d0KA.f19hTOyyE3u0jOncbDSq5idni0WJP6m0.p1qJ3cGOi', 'enabled', 'user', '2021-03-02 13:51:00', NULL, NULL, '2021-02-20 02:33:00', '2021-03-02 13:51:00'),
(178, 'pululin36', NULL, 'pululin36', NULL, 0, 'pululin36@hotmail.com', 0, '$2y$10$tWwbFxHOI9pDHq0pbvXz5eqTw/RF5XMBlhVImX0MIpEPL5hB/Yidu', 'enabled', 'user', '2021-02-20 08:02:00', NULL, NULL, '2021-02-20 08:02:00', '2021-02-20 08:02:00'),
(179, 'KurokiTomoko', NULL, 'pixiu', NULL, 0, 'y1x2w4@gmail.com', 0, '$2y$10$7kD11TbMKHyInPKCUZAgk.qpy7IkfRlPMBKqIlHEt0lMD.pkEaM46', 'enabled', 'user', '2021-02-20 09:07:00', NULL, NULL, '2021-02-20 09:06:00', '2021-02-20 09:07:00'),
(180, 'irkallaxeynox', NULL, '猫离', NULL, 0, 'irkallaxeynox@gmail.com', 0, '$2y$10$mFsh.B7zclKGWpojRKeTGe2mW9LvZDtJzB5UO82QZ6fOAUU0qmPGK', 'enabled', 'user', '2023-04-27 11:27:00', NULL, NULL, '2021-02-20 09:20:00', '2023-04-27 11:27:00'),
(181, 'huishenghuise', NULL, '绘言慧语', NULL, 0, 'zhaonai777@126.com', 0, '$2y$10$GhrZB/eyP3k66I6dB9XQcuWvIqrszoLQJm09.MRZlfxtVf/L8HNx2', 'enabled', 'user', '2021-03-23 14:24:00', NULL, NULL, '2021-02-20 09:51:00', '2021-03-23 14:24:00'),
(182, 'ddlxs', NULL, '好多的小伞', NULL, 0, '3296677248@qq.com', 0, '$2y$10$n6z7GpKV6mXszkWPmWfw7uwygeiUJOLCaJbyovc3fMFUo1LxV6Tie', 'enabled', 'user', NULL, NULL, NULL, '2021-02-20 10:44:00', '2021-02-20 10:44:00'),
(183, 'HoshinoMirai', NULL, 'HoshinoMirai', NULL, 0, 'owenguo929@gmail.com', 0, '$2y$10$yX59ikYZJgig/U5Tjb3ziOxqo0N6pSTT0MsxKe7RHcAS/1roH1NFa', 'enabled', 'user', '2021-02-20 10:47:00', NULL, NULL, '2021-02-20 10:46:00', '2021-02-20 10:47:00'),
(184, 'meow', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210220105449-M2j2XlM5.png', 'kiyi', NULL, 0, '1769056702@qq.com', 0, '$2y$10$kZIFsA8dtgLGkQs5YuFt0OYGNVFcVJ22Q0xx/EjaHpmbm2F73qllm', 'enabled', 'user', '2021-02-20 10:53:00', NULL, NULL, '2021-02-20 10:53:00', '2021-02-20 10:54:00'),
(185, 'XYenon', NULL, 'XYenon', NULL, 0, 'register@xyenon.bid', 0, '$2y$10$fXqF//Rug3rPHPnUtuoDEOR/jZebilu067y0lxaF/CDps6Q4A5OH2', 'enabled', 'user', '2021-02-20 11:20:00', NULL, NULL, '2021-02-20 11:20:00', '2021-02-20 11:20:00'),
(186, 'ABAEX', NULL, 'ABAEX', NULL, 0, '952335306@qq.com', 0, '$2y$10$wMiQFyLjM.Pzx3tdjZRQneGsJSA7LPv85GkR7i8MFvBTT607Vy6yu', 'enabled', 'user', '2021-02-23 17:10:00', NULL, NULL, '2021-02-20 12:59:00', '2021-02-23 17:10:00'),
(187, 'Cyrus', NULL, 'Cyrus', NULL, 0, 'fcs98@sina.com', 0, '$2y$10$UAM5vqUWDnsVPIUgqY4GCeeApzDIvrLoe9BaVjQUOm4UqfEwf3zZG', 'enabled', 'user', '2021-02-20 13:34:00', NULL, NULL, '2021-02-20 13:33:00', '2021-02-20 13:34:00'),
(188, 'qwer123', NULL, '鸽王', NULL, 0, '670609873@qq.com', 0, '$2y$10$2wFBsGcC6dxCwy5Yek38rOvP27Nrq5jmzlzTpO3VCpFf16f/LUsK2', 'enabled', 'user', '2021-02-20 15:55:00', NULL, NULL, '2021-02-20 15:55:00', '2021-02-20 15:55:00'),
(189, 'bombvillian', NULL, 'bombvillian', NULL, 0, 'bombvillian@gmail.com', 0, '$2y$10$gruH9grYuTaOW2XWDreil.h.Kqubrwga.lKT8Cx3MVZgpL/IUGIai', 'enabled', 'user', '2021-02-20 16:16:00', NULL, NULL, '2021-02-20 16:15:00', '2021-02-20 16:16:00'),
(190, 'tuzi', NULL, '兔子', NULL, 0, 'tu@lovelive.team', 0, '$2y$10$aSIvrETpJfi56f1C79dzwe53L8mMoX.G/mCI506Od6gUN0SAIrKDu', 'enabled', 'user', '2021-02-20 17:26:00', NULL, NULL, '2021-02-20 17:26:00', '2021-02-20 17:26:00'),
(191, 'idofkhezk', NULL, 'Khezk', NULL, 0, 'khezk@qq.com', 0, '$2y$10$1Wqm8ZxYiL1ouRt40S3eIebJTOVHNU/HESOLNJsVgPiodjM/9dHRe', 'enabled', 'user', '2021-02-20 17:28:00', NULL, NULL, '2021-02-20 17:26:00', '2021-02-20 17:28:00'),
(192, 'm1435666322', NULL, '虎杖悠仁', NULL, 0, '1435666322@qq.com', 0, '$2y$10$KS2toCDY2psI4yfu0pgcU.NuYo1JReynORF3.R3saT4rLToewQ5RS', 'enabled', 'user', '2021-02-20 19:15:00', NULL, NULL, '2021-02-20 19:15:00', '2021-02-20 19:15:00'),
(193, 'hewenhua1451', NULL, '东碧社', NULL, 0, 'q3874784814@163.com', 0, '$2y$10$F1YYXI7Aj.9PfdBulwNiv.0Yc208K2.VTiEW.ESpUP96c7J3zzWzO', 'enabled', 'user', '2021-02-20 19:41:00', NULL, NULL, '2021-02-20 19:39:00', '2021-02-20 19:41:00'),
(194, 'digua', NULL, '地瓜', NULL, 0, 'hellodigua@qq.com', 0, '$2y$10$viYslC.rS.Ovl9/4Hp9Nk.g76MVv/dJlStP1vLRc0.EjEvxV6Pgti', 'enabled', 'user', '2021-02-20 20:28:00', NULL, NULL, '2021-02-20 20:19:00', '2021-02-20 20:28:00'),
(195, 'yukikaze', NULL, 'Owo', NULL, 0, 'yukkikaze@foxmail.com', 0, '$2y$10$xMh6Gvlw6OZZ2FlGdArka.Fsu8miVRio5RGngpSt9SRUCHSIBSILi', 'enabled', 'user', '2021-02-20 21:11:00', NULL, NULL, '2021-02-20 21:03:00', '2021-02-20 21:11:00'),
(196, 'yokiusagi55', NULL, 'YokiUsagi', NULL, 0, '2289148167@qq.com', 0, '$2y$10$wR6mafE2EGNr6WIj.2RDXuTpKynb0AAA.WzhDdn2Eu3M1Qg/z0GFi', 'enabled', 'user', NULL, NULL, NULL, '2021-02-20 21:53:00', '2021-02-20 21:53:00'),
(197, 'Azure', NULL, '蓝染末', NULL, 0, '765301779@qq.com', 0, '$2y$10$KhO5/v2bssATt3VpMJZBo.mYqOZV90YhmO3DEYBxoX7BJh8ZZjM56', 'enabled', 'user', '2021-02-20 21:57:00', NULL, NULL, '2021-02-20 21:56:00', '2021-02-20 21:57:00'),
(198, 'neko404', NULL, 'neko404', NULL, 0, 'neko404@163.com', 0, '$2y$10$6/i6MhOqvTrynZvd.T6v9O9ABUG3SC5Vh/XgRsm0E.Gzk/xWkaKJi', 'enabled', 'user', '2021-02-20 22:00:00', NULL, NULL, '2021-02-20 21:59:00', '2021-02-20 22:00:00'),
(199, '15055695733', NULL, '徽针院蓬莱', NULL, 0, '542000642@qq.com', 0, '$2y$10$TiWXrfOVUiJxxBGzRwPXHurpXlEFI35SgRbgaIPI7/ufM6sx9rjs6', 'enabled', 'user', '2021-04-28 13:09:00', NULL, NULL, '2021-02-21 00:35:00', '2021-04-28 13:09:00'),
(200, 'admin', NULL, 'Zz', NULL, 0, 'pigmen765172@gmail.com', 0, '$2y$10$ETOkPaRC13iI7SFtMgcKk.10DnohO9J5KUhZTHN8MIr7JWsw565re', 'enabled', 'user', '2021-02-21 00:55:00', NULL, NULL, '2021-02-21 00:55:00', '2021-02-21 00:55:00'),
(201, 'roshan', NULL, 'roshan', NULL, 0, 'mengyu1998@gmail.com', 0, '$2y$10$wq3alpMTbx81YG0uGsP8l.a2gaoA8PyyST/W81fDxupnaHEnDXXjG', 'enabled', 'user', '2021-07-08 12:14:00', NULL, NULL, '2021-02-21 02:43:00', '2021-07-08 12:14:00'),
(202, 'FSJohn', NULL, 'FSJohn', NULL, 0, 'johnzqh@qq.com', 0, '$2y$10$sr61eJLlXzEML4X0jqphiuoZBt7IolffouO5/BoipazSs49wsOZK6', 'enabled', 'user', '2021-02-21 08:09:00', NULL, NULL, '2021-02-21 08:09:00', '2021-02-21 08:09:00'),
(203, 'BianDan', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210221090216-k2dBrHX0.png', '我是笨蛋小扁担', NULL, 0, 'biantan@outlook.com', 0, '$2y$10$91/JNG37oAFhAjYDXjhz6uTiYDDS/sbZU5fQDUlFQ9Lhf9btgtjfe', 'enabled', 'user', '2022-07-25 14:53:00', NULL, NULL, '2021-02-21 08:58:00', '2022-07-25 14:53:00'),
(204, 'moe_orange', NULL, '橘子', NULL, 0, '240021906@qq.com', 0, '$2y$10$c7GBlnXiKF5UMkasUBDmguX6JAGYIC.ZJhXwdesIYUQ7A5nzTxMEi', 'enabled', 'user', NULL, NULL, NULL, '2021-02-21 11:59:00', '2021-02-21 11:59:00'),
(205, 'shuangya', NULL, '泷涯', NULL, 0, '896640547@qq.com', 0, '$2y$10$OxbEL6CXmSxUTp5fEAphCuxwVw03UT6gZS6Q0I8KNeDyTtHevtOCe', 'enabled', 'user', '2021-02-21 14:47:00', NULL, NULL, '2021-02-21 14:46:00', '2021-02-21 14:47:00'),
(206, 'herry001', NULL, 'Herry001', NULL, 0, 'herry001@live.com', 0, '$2y$10$vVUAWX.xUpdE6G2cGZcLzuO5atPgOQQzf0Hq8ibO3CWBI4VMGWbL6', 'enabled', 'user', '2022-04-22 16:45:00', NULL, NULL, '2021-02-21 17:54:00', '2022-04-22 16:45:00'),
(207, 'spacelit', NULL, 'spacelit', NULL, 0, 'spacelit@qq.com', 0, '$2y$10$dmQZlA4P3/yV25T9Iq.1gechO3je/k9MrJ9OqXCCjqCd2bHHNtBkW', 'enabled', 'user', '2021-02-21 19:18:00', NULL, NULL, '2021-02-21 19:17:00', '2021-02-21 19:18:00'),
(208, 'VGL503', NULL, 'VGL', NULL, 0, 'Wgl19960503@gmail.com', 0, '$2y$10$9T7TvnlEV3ojkZOOVT4k3.ycQTicKJgk6YRNQyNFTy5M3y9qWzx2K', 'enabled', 'user', '2021-02-22 22:47:00', NULL, NULL, '2021-02-22 22:45:00', '2021-02-22 22:47:00'),
(209, 'Sagume', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210225221235-GQMk74E1.jpg', 'Sagume', NULL, 0, '564433851@qq.com', 0, '$2y$10$xb1VY51O.89HO5gwP.BMgunR//J4k7c7J7jLKOvRavF116V0e2662', 'enabled', 'user', '2021-03-07 10:09:00', NULL, NULL, '2021-02-25 22:11:00', '2021-03-07 10:09:00'),
(210, 'glass_of_prague', NULL, '布拉格的玻璃', NULL, 0, '1163521570@qq.com', 0, '$2y$10$aImllR3P.yrATL6N61qlsOHz.h1qAXl3R/GaMruVLDmU6SnmqSdgq', 'enabled', 'user', '2021-04-01 00:21:00', NULL, NULL, '2021-02-25 22:13:00', '2021-04-01 00:21:00'),
(211, '2893324928', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210226042543-r5uxxTCx.jpg', '竹水子', NULL, 0, '2893324928@qq.com', 0, '$2y$10$40Q4/zVHSmXDm.RufKRCl.DmbLb/onyg0.evd7i6XAPdA/lGcydJ2', 'enabled', 'user', '2021-02-26 23:52:00', NULL, NULL, '2021-02-25 22:24:00', '2021-02-26 23:52:00'),
(212, 'Zanjitsu', NULL, '残实', NULL, 0, '2361083974@qq.com', 0, '$2y$10$EnTle/06scZIsTjZb8NeX.O5TXXGTPzU0QsPj.SVZHAoV.wYWr1PS', 'enabled', 'user', '2021-02-25 22:51:00', NULL, NULL, '2021-02-25 22:50:00', '2021-02-25 22:51:00'),
(213, 'Red_Jackal', NULL, '红豺与至高联合', NULL, 0, 'komismom@gmail.com', 0, '$2y$10$u3CEBo766f5JgFUQLj9rG.npRpNDGDp6.gfWgGUFtefbVvCQoARKO', 'enabled', 'user', NULL, NULL, NULL, '2021-02-25 22:54:00', '2021-02-25 22:54:00'),
(214, 'EdwardCalhoun', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210225232556-0eaXgxdU.png', '雾雨卡尔霍恩', NULL, 0, 'fortheapocalypse@hotmail.com', 0, '$2y$10$/uFWuS4/Ur3kpV53tlmqpem7fzzTnQ8Y2DRhAeKgry/O0skE1pofK', 'enabled', 'user', '2021-07-18 18:38:00', NULL, NULL, '2021-02-25 22:59:00', '2021-07-18 18:38:00'),
(215, 'nekotora2', NULL, 'test2', NULL, 0, 'fmoe@qq.com', 0, '$2y$10$noAGtmeOVxtgwdWL57dkIO4/qNCo/3RlO8oJiliNakxo5ng41yZAi', 'enabled', 'user', NULL, NULL, NULL, '2021-02-25 23:15:00', '2021-02-25 23:15:00'),
(216, 'Eastfate', NULL, '343', NULL, 0, 'www.eastfate@gmail.com', 0, '$2y$10$tumtXIl8qKXCmndBVQLwGekv5K9j9SBaRY4DlFm.OyY8YXoVGtLse', 'enabled', 'user', NULL, NULL, NULL, '2021-02-25 23:25:00', '2021-02-25 23:25:00'),
(217, 'x104570807', NULL, '天道老师', NULL, 0, '1065411990@qq.com', 0, '$2y$10$QABuf9vDk5DXBdB7Hn2dDuqT6437SeK1Tp4IDVLVXzOu6AKUYpr26', 'enabled', 'user', NULL, NULL, NULL, '2021-02-25 23:41:00', '2021-02-25 23:41:00'),
(218, 'NightChaos', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210226005412-apXyATdZ.png', '夜极', NULL, 0, 'nightchaos@qq.com', 0, '$2y$10$vW3KRMHtX5z2U36gBKVZbu9q3hpeef6q8KEtu.mQkeUcqZB7N.FVm', 'enabled', 'user', '2021-02-26 00:31:00', NULL, NULL, '2021-02-26 00:31:00', '2021-02-26 00:55:00'),
(219, 'mese580', NULL, '夢違科學世紀', NULL, 0, '1952954457@qq.com', 0, '$2y$10$y3T2bbn1PS1c.rMeDhgSB.wop1SimslpEsLOMtm8/CTsFb7C3hFcS', 'enabled', 'user', '2021-02-26 01:12:00', NULL, NULL, '2021-02-26 01:08:00', '2021-02-26 01:12:00'),
(220, 'xiaomei965321', NULL, '小美鱼', NULL, 0, '854859597@qq.com', 0, '$2y$10$JSPFpocgjtnS/B9EJJ4Wbex2vr/pWDHfhH1J3ZhG.uhvYWYJEdwIS', 'enabled', 'user', '2021-05-03 20:32:00', NULL, NULL, '2021-02-26 01:23:00', '2021-05-03 20:32:00'),
(221, 'odtl', NULL, '东陵君', NULL, 0, '1808181845@qq.com', 0, '$2y$10$JETK5jYCcwv.0/M0NfRVmesS/sHQXjZKaRKXfHVHci.Jpyw0wOGHq', 'enabled', 'user', NULL, NULL, NULL, '2021-02-26 01:26:00', '2021-02-26 01:26:00'),
(222, 'IRONFANG', NULL, 'IRONFANG', NULL, 0, 'IRONFANG@yeah.net', 0, '$2y$10$YgSZD3LPdtpkVK1jmIM78u4lk63hdfGmkkOmnqoMB02Q5DvRFwje2', 'enabled', 'user', NULL, NULL, NULL, '2021-02-26 09:19:00', '2021-02-26 09:19:00'),
(223, 'Sillyfox', NULL, '蠢狐', NULL, 0, '2843745784@qq.com', 0, '$2y$10$486KDWDaABwzaPASxrh9V.xZl5gH6bTNoPE9SmlQeyKNCHjf6ovNu', 'enabled', 'user', '2021-02-26 10:42:00', NULL, NULL, '2021-02-26 10:37:00', '2021-02-26 10:42:00'),
(224, 'Prism', NULL, 'Prism', NULL, 0, 'hzxct2000@163.com', 0, '$2y$10$TTg4cSf3QG3uldpzI9cPBeIH5uOghM9/sV9EKO85je2HPY81WJ44m', 'enabled', 'user', '2021-02-26 11:38:00', NULL, NULL, '2021-02-26 11:37:00', '2021-02-26 11:38:00'),
(225, '757441098', NULL, '天意怜幽草', NULL, 0, '757441068@qq.com', 0, '$2y$10$kFJMv.2tJnw/nmr9M27Yt.rQ/C8p7lKz.q3g04M2d8gMVsszlYxG.', 'enabled', 'user', NULL, NULL, NULL, '2021-02-27 17:34:00', '2021-02-27 17:34:00'),
(226, 'Nairola', NULL, '路过的凡人', NULL, 0, 'zhangtianxin2009@163.com', 0, '$2y$10$R5MgCST/Fw7H3Qhz.wYRfu0E44kBIuUA7r7BWOKSPU62r/tWSxYL.', 'enabled', 'user', '2021-02-27 21:51:00', NULL, NULL, '2021-02-27 21:50:00', '2021-02-27 21:51:00'),
(227, 'Satsuki_Rin', NULL, 'Satsuki_Rin', NULL, 0, '2219269221@qq.com', 0, '$2y$10$v16d1e/2Iz57wG/9aDAyruE6kTYzscudv.f4Afl44FawEA/gYZ/.q', 'enabled', 'user', NULL, NULL, NULL, '2021-02-28 02:24:00', '2021-02-28 02:24:00'),
(228, 'Moeko', NULL, 'Moeko', NULL, 0, 'ovosakura@gmail.com', 0, '$2y$10$1gFVmsbQCxlHfnTQEfdauOot0DOvlGs/lXsiz1GLb7VICcutjNW4e', 'enabled', 'user', '2021-03-02 13:07:00', NULL, NULL, '2021-02-28 06:22:00', '2021-03-02 13:07:00'),
(229, 'Ju87R', NULL, 'Ju87R', NULL, 0, 'JU87R3@GMAIL.COM', 0, '$2y$10$.MZ.Qp.AyyrWuYv9fJlfgO2Rs92uPnZ1dOLAudDQJWc7NehXn1iOe', 'enabled', 'user', '2021-02-28 08:31:00', NULL, NULL, '2021-02-28 08:31:00', '2021-02-28 08:31:00'),
(230, 'damien_rice', NULL, 'damien_rice', NULL, 0, 'Ckokevin@163.com', 0, '$2y$10$HAh9GF3QdImuwNGei1eRRuNo5RiTuCHe8uoM2WXLxODbqz5zh55AK', 'enabled', 'user', '2021-02-28 09:51:00', NULL, NULL, '2021-02-28 09:47:00', '2021-02-28 09:51:00'),
(231, 'kuohuxiao', NULL, 'kuohuxiao', NULL, 0, '1624790851@qq.com', 0, '$2y$10$.V4c1oILFxWoCogMPnzj3.rsJRo0yy.m1/pA370BN9PXKJhEot/b6', 'enabled', 'user', '2021-02-28 10:02:00', NULL, NULL, '2021-02-28 10:02:00', '2021-02-28 10:02:00'),
(232, 'Giiiiiiiky', NULL, 'GG子', NULL, 0, '1513715404@qq.com', 0, '$2y$10$NimMe9pvNbNSaHUTVauu7uCgbTCGzg.DfR1Y70eN/KxyPpSNuFfFC', 'enabled', 'user', NULL, NULL, NULL, '2021-02-28 11:00:00', '2021-02-28 11:00:00'),
(233, 'lzy1596321478', NULL, '梦无泪痕', NULL, 0, '1598403517@qq.com', 0, '$2y$10$e6tYsa8H7D9grTBA1107jeLkOdjOtp2CwCGQZbRuhBiQY5d6Refpi', 'enabled', 'user', NULL, NULL, NULL, '2021-02-28 11:56:00', '2021-02-28 11:56:00'),
(234, 'SANAESAN', NULL, 'SANAESAN', NULL, 0, '472368024@qq.com', 0, '$2y$10$tRGctScxjYqwrF9fTtJ8ae9yN1l2Y3A7sbFHj2qGg7e53M0VRDT56', 'enabled', 'user', '2021-03-02 01:40:00', NULL, NULL, '2021-03-02 01:40:00', '2021-03-02 01:40:00'),
(235, 'awsl', NULL, 'huggy', NULL, 0, 'dove+w23re@huggy.moe', 0, '$2y$10$LOo7foyTRIdh2LderVH3T.AlrK3GKae/GeyrhhQdWmNFAERIzTUpq', 'enabled', 'user', '2021-05-29 13:38:00', NULL, NULL, '2021-03-02 13:52:00', '2021-05-29 13:38:00'),
(236, 'JerryLen_Chensen', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210302225024-j01T4p4n.png', 'Jerry/辰昕', NULL, 0, '2087826155@qq.com', 0, '$2y$10$2FqOMD4LMM5rv.gKL3pH1eiKZ.YU6vVp7Mqxwi7pnSEY9XitCUF8O', 'enabled', 'user', '2021-03-02 22:12:00', NULL, NULL, '2021-03-02 21:56:00', '2021-03-02 22:50:00'),
(237, 'BlingWang', NULL, '派兹', NULL, 0, 'admin@blingwang.cn', 0, '$2y$10$ViFXqhJDKCP0dN/eJa4I1OmXhKFxZMkEB/KJLfgVaza/6swr9/4T2', 'enabled', 'user', '2021-03-02 23:56:00', NULL, NULL, '2021-03-02 23:56:00', '2021-03-02 23:56:00'),
(238, 'Neutrino_X', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210303203917-XVFQrhWb.jpg', '中微子', NULL, 0, 'latencyvladimir@gmail.com', 0, '$2y$10$PeB7UijhJTFYajETC2gOVe.bbkhlxvSsx1YfdG3fBjGWjQ/B9jvW.', 'enabled', 'user', '2021-03-03 20:31:00', NULL, NULL, '2021-03-03 20:30:00', '2021-03-03 20:39:00'),
(239, '827844971', NULL, '零', NULL, 0, '827844971@qq.com', 0, '$2y$10$samrTuwKbRAd6Blcu.IaCO03Mjomt/VTk4bd7oCOjK8IcfbuBE85y', 'enabled', 'user', '2021-03-04 01:09:00', NULL, NULL, '2021-03-04 01:09:00', '2021-03-04 01:09:00'),
(240, 'stevesensei', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210502114003-m8RUPwqZ.png', 'stevesensei', NULL, 0, 'wxtalt@163.com', 0, '$2y$10$t7IADWMhdtW04tkkJtBawuDqmWxOO5M5i4PAdaS7OZzlS7BKw4f3q', 'enabled', 'user', '2021-05-02 10:53:00', NULL, NULL, '2021-03-06 22:46:00', '2021-05-02 11:40:00'),
(241, 'tzknc100', NULL, '幻梦流光交响社', NULL, 0, '1084896582@qq.com', 0, '$2y$10$X9iZv5Zhm0phPAcGcUVB4eSP3So1M.pigKjG0PLU8UpRiJPWdj.A2', 'enabled', 'user', '2021-03-06 23:09:00', NULL, NULL, '2021-03-06 23:09:00', '2021-03-06 23:09:00'),
(242, 'cosing', NULL, '闲者', NULL, 0, 'opensor@foxmail.com', 0, '$2y$10$IV68LcxULWBoXXq/P4E65u6TdzaUGinBA8ZTBPqvrGzMh3gBUf1X6', 'enabled', 'user', '2023-01-09 10:32:00', NULL, NULL, '2021-03-09 11:02:00', '2023-01-09 10:32:00'),
(243, 'cs538138', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20210314165340-12EjmVyJ.jpg', '管理员', NULL, 0, '522425381@qq.com', 0, '$2y$10$Vo8gUgyHCAEHBL3v4hEWLuUn/hR5GZG.uWZvRThV3Ycxc484sMqVu', 'enabled', 'user', '2021-03-14 16:50:00', NULL, NULL, '2021-03-14 16:45:00', '2021-03-14 16:54:00'),
(244, 'sakuramako', NULL, '芥末', NULL, 0, '407148943@qq.com', 0, '$2y$10$NnIVS/RUOEBiOkBszNg0beOHQhY4r9DYNcHpyfGEZ.LCqJ71Sgu2C', 'enabled', 'user', NULL, NULL, NULL, '2021-03-18 10:46:00', '2021-03-18 10:46:00'),
(247, 'JoPunking', 'http://qn.cdn.dove.fmoe.cn/user-avatar/20220420152128-jHQz0rh6.png', 'JOPunk', NULL, 0, '1574020931@qq.com', 0, '$2y$10$WbdtkvR7Zq8kW5iUtaXR8OQ7/WFSuLx/RQswZtVUxvYBbux5YZbui', 'enabled', 'user', '2022-04-20 15:03:00', NULL, NULL, '2022-03-07 10:18:00', '2022-04-20 15:22:00'),
(248, 'Natsume_Ai', NULL, '盐', NULL, 0, '2777509536@qq.com', 0, '$2y$10$uFco0s0iZC5F.vtkKHXRFebLNf7toG0QWEibBOo9zTuns8ZNc42/u', 'enabled', 'user', '2022-11-09 00:48:00', NULL, NULL, '2022-11-09 00:36:00', '2022-11-09 00:48:00'),
(249, 'HUOYAN', NULL, '轻工赤染', NULL, 0, '997681975@qq.com', 0, '$2y$10$buvjsyhEDoQCuiP64G.QveYEmoCHyjqKT1beHmxWg2uBXprFbdcFW', 'enabled', 'user', '2023-06-08 00:00:00', NULL, NULL, '2023-04-10 23:16:00', '2023-06-08 00:00:00'),
(250, 'test1', NULL, 'test1', NULL, 0, 'lixinze123@gmail.com', 0, '$2a$10$MdaRPJae4DLQ5zMFvaArfuL04d6YIRBAxWS1XMD9Sp.8YksOgIWOC', 'enabled', 'user', '2023-09-20 14:38:06', 1, 1, '2023-09-20 14:37:33', '2023-09-20 14:38:06');

-- --------------------------------------------------------

--
-- 表的结构 `works`
--

CREATE TABLE `works` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover` text,
  `type` varchar(64) DEFAULT NULL,
  `alias` varchar(128) DEFAULT NULL,
  `description` text,
  `content` text,
  `releaseAt` datetime DEFAULT NULL,
  `viewCount` int(11) DEFAULT '0',
  `likeCount` int(11) DEFAULT '0',
  `threadCount` int(11) DEFAULT '0',
  `commentThreadCount` int(11) DEFAULT '0',
  `commentThreadId` int(11) DEFAULT NULL,
  `commentPostCount` int(11) DEFAULT '0',
  `isSensitive` tinyint(1) DEFAULT '0',
  `isHidden` tinyint(1) DEFAULT '0',
  `status` varchar(64) DEFAULT NULL,
  `circleId` int(11) DEFAULT NULL,
  `tagIds` json DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `works`
--

INSERT INTO `works` (`id`, `name`, `cover`, `type`, `alias`, `description`, `content`, `releaseAt`, `viewCount`, `likeCount`, `threadCount`, `commentThreadCount`, `commentThreadId`, `commentPostCount`, `isSensitive`, `isHidden`, `status`, `circleId`, `tagIds`, `source`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, '测试', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-e9b37b468a0148feeae8907d83b45dd4.jpg', 'art', NULL, '123123', 'asdasdasdasd', '2023-08-30 12:10:21', 0, 0, 1, 0, 2, 1, 0, 0, NULL, 1, '[]', NULL, NULL, '2023-07-30 12:11:09', '2023-08-30 12:47:30'),
(2, '测试', 'https://q.cdn.dove.cafe/work/cover/3-f8d8b4a68901cebf9f21acfcfbfc5b1b.jpg', 'art', NULL, '123123', 'asdasdasdasd', '2023-08-30 12:10:21', 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 1, '[{\"id\": 3, \"name\": \"111\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T11:03:59.000Z\", \"updatedAt\": \"2023-07-30T11:03:59.000Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}, {\"id\": 4, \"name\": \"2222\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T12:11:09.000Z\", \"updatedAt\": \"2023-07-30T12:11:09.000Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}]', NULL, NULL, '2023-07-30 12:11:58', '2023-07-30 12:11:58'),
(3, '测试', 'https://q.cdn.dove.cafe/work/cover/3-f8d8b4a68901cebf9f21acfcfbfc5b1b.jpg', 'art', NULL, '123123', 'asdasdasdasd', '2023-08-30 12:10:21', 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 1, '[{\"id\": 3, \"name\": \"111\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T11:03:59.000Z\", \"updatedAt\": \"2023-07-30T11:03:59.000Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}, {\"id\": 4, \"name\": \"2222\", \"status\": \"enabled\", \"createdAt\": \"2023-07-30T12:11:09.000Z\", \"updatedAt\": \"2023-07-30T12:11:09.000Z\", \"workCount\": 0, \"eventCount\": 0, \"circleCount\": 0}]', NULL, NULL, '2023-07-30 12:14:26', '2023-07-30 12:14:26'),
(4, '测试啊哈2', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-7d7a7b468a01033f136ac112595f9b0b.jfif', 'art', NULL, 'asdasd', '多下功夫但如果二十个号别人发的女短发', '2023-08-30 12:46:06', 0, 1, 0, 0, NULL, 0, 0, 0, 'enabled', 1, '[3, 5]', NULL, NULL, '2023-07-30 12:46:14', '2023-08-30 17:38:46'),
(5, '你好世界9999999', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-ecf57a468a014075d0a58189a0979a65.png', 'book', NULL, '嘎嘎999999', '啊收到见客户嘎嘣贵人故8i4规健康幸福国际快递\nd发过的粉碎欧派公司发的jkfdvb fbd\n收到\n辅导费v有789额会哦【特回了VBdf\nf df\'吃饱你89也回我纪律差9999\n9\n9\n9\n9\n\n9\n9\n\n9', '2023-07-07 11:47:53', 0, 1, 1, 0, 1, 7, 0, 0, 'enabled', 1, '[3]', NULL, NULL, '2023-08-07 11:48:06', '2023-09-04 14:23:57'),
(6, '123', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-46ea81488a01b3be2dc37836d4ab05df.jpg', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 'reviewing', 1, '[]', NULL, 3, '2023-08-30 22:13:17', '2023-08-30 22:13:17'),
(7, '你好世界', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-adb7586b8a01699b0fc2a217a7c816fb.jpg', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 'reviewing', 4, '[]', NULL, 3, '2023-09-06 17:52:39', '2023-09-06 17:52:39'),
(8, 'test', 'https://dovecafe-dev-1251952746.cos.ap-shanghai.myqcloud.com/work/cover/3-531c9e9a8a0136172802ae5a0f5ececf.png', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 'reviewing', 2, '[]', NULL, 3, '2023-09-15 20:52:56', '2023-09-15 20:52:56');

--
-- 转储表的索引
--

--
-- 表的索引 `adminlogs`
--
ALTER TABLE `adminlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `authId` (`authId`);

--
-- 表的索引 `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `circleId` (`circleId`),
  ADD KEY `auditUserId` (`auditUserId`);

--
-- 表的索引 `auths`
--
ALTER TABLE `auths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `circles`
--
ALTER TABLE `circles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentThreadId` (`commentThreadId`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `circleusers`
--
ALTER TABLE `circleusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `circleId` (`circleId`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `commentitems`
--
ALTER TABLE `commentitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentSubjectId` (`commentSubjectId`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auditId` (`auditId`),
  ADD KEY `circleId` (`circleId`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentThreadId` (`commentThreadId`),
  ADD KEY `circleId` (`circleId`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `kvs`
--
ALTER TABLE `kvs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `key_2` (`key`),
  ADD UNIQUE KEY `key_3` (`key`);

--
-- 表的索引 `likeitems`
--
ALTER TABLE `likeitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likeSubjectId` (`likeSubjectId`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `meta`
--
ALTER TABLE `meta`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `smscaptchas`
--
ALTER TABLE `smscaptchas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `tagitems`
--
ALTER TABLE `tagitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagId` (`tagId`);

--
-- 表的索引 `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `threadposts`
--
ALTER TABLE `threadposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threadId` (`threadId`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastPostUserId` (`lastPostUserId`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `userinvites`
--
ALTER TABLE `userinvites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_invites_code` (`code`),
  ADD KEY `userId` (`userId`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `username_3` (`username`),
  ADD UNIQUE KEY `username_4` (`username`),
  ADD UNIQUE KEY `username_5` (`username`),
  ADD UNIQUE KEY `username_6` (`username`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_2` (`phone`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `phone_3` (`phone`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `phone_4` (`phone`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `phone_5` (`phone`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `phone_6` (`phone`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD KEY `inviteId` (`inviteId`);

--
-- 表的索引 `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentThreadId` (`commentThreadId`),
  ADD KEY `circleId` (`circleId`),
  ADD KEY `userId` (`userId`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `adminlogs`
--
ALTER TABLE `adminlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `auths`
--
ALTER TABLE `auths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- 使用表AUTO_INCREMENT `circles`
--
ALTER TABLE `circles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `circleusers`
--
ALTER TABLE `circleusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `commentitems`
--
ALTER TABLE `commentitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- 使用表AUTO_INCREMENT `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `gates`
--
ALTER TABLE `gates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `kvs`
--
ALTER TABLE `kvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `likeitems`
--
ALTER TABLE `likeitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用表AUTO_INCREMENT `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `meta`
--
ALTER TABLE `meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `smscaptchas`
--
ALTER TABLE `smscaptchas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tagitems`
--
ALTER TABLE `tagitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `threadposts`
--
ALTER TABLE `threadposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- 使用表AUTO_INCREMENT `userinvites`
--
ALTER TABLE `userinvites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- 使用表AUTO_INCREMENT `works`
--
ALTER TABLE `works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 限制导出的表
--

--
-- 限制表 `adminlogs`
--
ALTER TABLE `adminlogs`
  ADD CONSTRAINT `adminlogs_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `adminlogs_ibfk_2` FOREIGN KEY (`authId`) REFERENCES `auths` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `adminlogs_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `adminlogs_ibfk_4` FOREIGN KEY (`authId`) REFERENCES `auths` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `adminlogs_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `adminlogs_ibfk_6` FOREIGN KEY (`authId`) REFERENCES `auths` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `audits`
--
ALTER TABLE `audits`
  ADD CONSTRAINT `audits_ibfk_1` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_10` FOREIGN KEY (`auditUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_11` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_12` FOREIGN KEY (`auditUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_3` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_4` FOREIGN KEY (`auditUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_5` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_6` FOREIGN KEY (`auditUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_7` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_8` FOREIGN KEY (`auditUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `audits_ibfk_9` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `auths`
--
ALTER TABLE `auths`
  ADD CONSTRAINT `auths_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `auths_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `auths_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `auths_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `auths_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `auths_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `circles`
--
ALTER TABLE `circles`
  ADD CONSTRAINT `circles_ibfk_1` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_11` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_3` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_5` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_7` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circles_ibfk_9` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `circleusers`
--
ALTER TABLE `circleusers`
  ADD CONSTRAINT `circleusers_ibfk_1` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_11` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_3` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_5` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_7` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `circleusers_ibfk_9` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `commentitems`
--
ALTER TABLE `commentitems`
  ADD CONSTRAINT `commentitems_ibfk_1` FOREIGN KEY (`commentSubjectId`) REFERENCES `comments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `commentitems_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_ibfk_1` FOREIGN KEY (`auditId`) REFERENCES `audits` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_10` FOREIGN KEY (`auditId`) REFERENCES `audits` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_11` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_13` FOREIGN KEY (`auditId`) REFERENCES `audits` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_14` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_15` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_16` FOREIGN KEY (`auditId`) REFERENCES `audits` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_17` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_18` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_2` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_4` FOREIGN KEY (`auditId`) REFERENCES `audits` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_5` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_7` FOREIGN KEY (`auditId`) REFERENCES `audits` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_8` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `drafts_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_10` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_12` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_13` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_14` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_15` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_16` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_17` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_4` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_6` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_7` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_9` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `likeitems`
--
ALTER TABLE `likeitems`
  ADD CONSTRAINT `likeitems_ibfk_1` FOREIGN KEY (`likeSubjectId`) REFERENCES `likes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_11` FOREIGN KEY (`likeSubjectId`) REFERENCES `likes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_3` FOREIGN KEY (`likeSubjectId`) REFERENCES `likes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_5` FOREIGN KEY (`likeSubjectId`) REFERENCES `likes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_7` FOREIGN KEY (`likeSubjectId`) REFERENCES `likes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `likeitems_ibfk_9` FOREIGN KEY (`likeSubjectId`) REFERENCES `likes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `smscaptchas`
--
ALTER TABLE `smscaptchas`
  ADD CONSTRAINT `smscaptchas_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `smscaptchas_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `smscaptchas_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `smscaptchas_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `smscaptchas_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `smscaptchas_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `tagitems`
--
ALTER TABLE `tagitems`
  ADD CONSTRAINT `tagitems_ibfk_1` FOREIGN KEY (`tagId`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tagitems_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tagitems_ibfk_3` FOREIGN KEY (`tagId`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tagitems_ibfk_4` FOREIGN KEY (`tagId`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `threadposts`
--
ALTER TABLE `threadposts`
  ADD CONSTRAINT `threadposts_ibfk_1` FOREIGN KEY (`threadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_11` FOREIGN KEY (`threadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_3` FOREIGN KEY (`threadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_5` FOREIGN KEY (`threadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_7` FOREIGN KEY (`threadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threadposts_ibfk_9` FOREIGN KEY (`threadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threads_ibfk_1` FOREIGN KEY (`lastPostUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threads_ibfk_2` FOREIGN KEY (`lastPostUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threads_ibfk_3` FOREIGN KEY (`lastPostUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threads_ibfk_4` FOREIGN KEY (`lastPostUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threads_ibfk_5` FOREIGN KEY (`lastPostUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threads_ibfk_6` FOREIGN KEY (`lastPostUserId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `threads_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `uploads_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `uploads_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `uploads_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `uploads_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `uploads_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `userinvites`
--
ALTER TABLE `userinvites`
  ADD CONSTRAINT `userinvites_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `userinvites_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `userinvites_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `userinvites_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `userinvites_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `userinvites_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`inviteId`) REFERENCES `userinvites` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`inviteId`) REFERENCES `userinvites` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`inviteId`) REFERENCES `userinvites` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`inviteId`) REFERENCES `userinvites` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`inviteId`) REFERENCES `userinvites` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `works`
--
ALTER TABLE `works`
  ADD CONSTRAINT `works_ibfk_1` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_10` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_12` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_13` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_14` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_15` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_16` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_17` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_2` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_3` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_4` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_6` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_7` FOREIGN KEY (`circleId`) REFERENCES `circles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `works_ibfk_9` FOREIGN KEY (`commentThreadId`) REFERENCES `threads` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
