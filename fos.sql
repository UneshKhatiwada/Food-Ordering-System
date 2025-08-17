-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2025 at 10:08 AM
-- Server version: 11.7.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`, `language_chooser_control`, `list_filter_highlight`, `list_filter_removal_links`, `show_fieldsets_as_tabs`, `show_inlines_as_tabs`, `css_generic_link_active_color`, `collapsible_stacked_inlines`, `collapsible_stacked_inlines_collapsed`, `collapsible_tabular_inlines`, `collapsible_tabular_inlines_collapsed`) VALUES
(1, 'Django', 1, 'Django administration', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#0ce894', '#db5656', '#872d2d', '#46d990', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#82820a', '#ab6767', 100, 400, 1, 'default-select', 1, 0, 0, 0, '#29B864', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add page', 7, 'add_page'),
(26, 'Can change page', 7, 'change_page'),
(27, 'Can delete page', 7, 'delete_page'),
(28, 'Can view page', 7, 'view_page'),
(29, 'Can add profile', 8, 'add_profile'),
(30, 'Can change profile', 8, 'change_profile'),
(31, 'Can delete profile', 8, 'delete_profile'),
(32, 'Can view profile', 8, 'view_profile'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add food item', 10, 'add_fooditem'),
(38, 'Can change food item', 10, 'change_fooditem'),
(39, 'Can delete food item', 10, 'delete_fooditem'),
(40, 'Can view food item', 10, 'view_fooditem'),
(41, 'Can add cart', 11, 'add_cart'),
(42, 'Can change cart', 11, 'change_cart'),
(43, 'Can delete cart', 11, 'delete_cart'),
(44, 'Can view cart', 11, 'view_cart'),
(45, 'Can add cart item', 12, 'add_cartitem'),
(46, 'Can change cart item', 12, 'change_cartitem'),
(47, 'Can delete cart item', 12, 'delete_cartitem'),
(48, 'Can view cart item', 12, 'view_cartitem'),
(49, 'Can add order', 13, 'add_order'),
(50, 'Can change order', 13, 'change_order'),
(51, 'Can delete order', 13, 'delete_order'),
(52, 'Can view order', 13, 'view_order'),
(53, 'Can add order item', 14, 'add_orderitem'),
(54, 'Can change order item', 14, 'change_orderitem'),
(55, 'Can delete order item', 14, 'delete_orderitem'),
(56, 'Can view order item', 14, 'view_orderitem'),
(57, 'Can add payment', 15, 'add_payment'),
(58, 'Can change payment', 15, 'change_payment'),
(59, 'Can delete payment', 15, 'delete_payment'),
(60, 'Can view payment', 15, 'view_payment'),
(61, 'Can add contact message', 16, 'add_contactmessage'),
(62, 'Can change contact message', 16, 'change_contactmessage'),
(63, 'Can delete contact message', 16, 'delete_contactmessage'),
(64, 'Can view contact message', 16, 'view_contactmessage'),
(65, 'Can add Theme', 17, 'add_theme'),
(66, 'Can change Theme', 17, 'change_theme'),
(67, 'Can delete Theme', 17, 'delete_theme'),
(68, 'Can view Theme', 17, 'view_theme');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$jeapsipWBPKetrlVIJYa89$S0Ezxjyi5DIhpjQ4M3llxAWyRGNxCcaRmFdqPa05KfM=', '2025-08-15 04:02:01.472570', 1, 'Admin', 'Subarna', 'Khatiwoda', 'admin@gmail.com', 1, 1, '2025-04-26 08:59:53.000000'),
(2, 'pbkdf2_sha256$1000000$gexE5b38lb9stMgg14rw64$UyiaHqYw8sDNlJctO2IpAzfFbTr4oiiFW9vy+5hMvtM=', '2025-08-15 03:59:08.603308', 0, 'Subarna', 'Subarna', 'Khatiwada', 'sub@gmail.com', 0, 1, '2025-04-26 09:32:48.000000'),
(3, 'pbkdf2_sha256$1000000$mfHRGOyeKPguArhLtNfsOp$mx0J+eOYn+Z1s34IF35UKbyHn22tmdCILLA/F8yBQss=', NULL, 0, 'Bikash', 'Bikash', 'Sunar', 'vkas@gmail.com', 0, 1, '2025-05-20 03:59:35.000000'),
(4, 'pbkdf2_sha256$1000000$nQT1RWxC245ZH4MzbX190Z$1SenR/DMvZM+GYvjXPSqkWp2ESahV6m4Hty5M4BdU6E=', '2025-08-04 16:16:22.000000', 0, '@ram', 'Ram', 'Kumar', 'ram@gmail.com', 0, 1, '2025-05-20 04:56:24.000000'),
(5, 'pbkdf2_sha256$1000000$gOrc2m5TIM6sHAPVviC5GO$d6DZxwS1d9LmA3zGEBDX/3tyjLUZTCA3qkLplpeThnM=', '2025-08-13 12:21:54.342184', 0, '@_Unesh', 'Unesh', 'Khatiwada', 'unesh@gmail.com', 0, 1, '2025-08-08 07:46:29.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60);

-- --------------------------------------------------------

--
-- Table structure for table `cart_cart`
--

CREATE TABLE `cart_cart` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_cart`
--

INSERT INTO `cart_cart` (`id`, `created_at`, `updated_at`, `user_id`) VALUES
(1, '2025-04-26 09:33:09.903648', '2025-04-26 09:33:09.903683', 2),
(2, '2025-04-26 09:42:04.314471', '2025-04-26 09:42:04.314521', 1),
(3, '2025-05-20 05:08:18.008201', '2025-05-20 05:08:18.008233', 4),
(5, '2025-08-08 07:57:55.654844', '2025-08-08 07:57:55.654882', 5);

-- --------------------------------------------------------

--
-- Table structure for table `cart_cartitem`
--

CREATE TABLE `cart_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `cart_id` bigint(20) NOT NULL,
  `food_item_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-04-26 09:16:09.110170', '1', 'Pizza', 1, '[{\"added\": {}}]', 9, 1),
(2, '2025-04-26 09:17:43.937353', '2', 'Pizza', 1, '[{\"added\": {}}]', 9, 1),
(3, '2025-04-27 10:11:03.637053', '8', 'Drinks', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 9, 1),
(4, '2025-04-27 10:11:31.474803', '4', 'Food', 2, '[{\"changed\": {\"fields\": [\"Slug\", \"Image\"]}}]', 9, 1),
(5, '2025-04-27 10:29:15.859123', '9', 'Starters', 1, '[{\"added\": {}}]', 9, 1),
(6, '2025-04-27 10:30:50.039612', '10', 'Indian Cuisine', 1, '[{\"added\": {}}]', 9, 1),
(7, '2025-04-29 09:58:27.254462', '11', 'Dessert', 1, '[{\"added\": {}}]', 9, 1),
(8, '2025-04-29 11:31:18.606699', '11', 'Dessert', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 9, 1),
(9, '2025-05-20 03:59:37.048911', '3', 'Bikash', 1, '[{\"added\": {}}]', 4, 1),
(10, '2025-05-20 04:13:02.604865', '1', 'Admin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(11, '2025-05-20 04:14:03.830545', '1', 'Admin', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}, {\"changed\": {\"name\": \"profile\", \"object\": \"Admin Profile\", \"fields\": [\"Phone\", \"Address\", \"Profile pic\"]}}]', 4, 1),
(12, '2025-05-20 04:15:11.739203', '3', 'Bikash', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(13, '2025-05-20 04:15:56.748424', '3', 'Bikash', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"Bikash Profile\", \"fields\": [\"Phone\", \"Address\", \"Profile pic\"]}}]', 4, 1),
(14, '2025-05-20 05:40:38.631900', '1', 'Ram - order', 2, '[]', 16, 1),
(15, '2025-05-20 06:00:20.070958', '5', 'Order #46ZPMWD023', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 13, 1),
(16, '2025-05-20 06:00:42.603629', '5', 'Order #46ZPMWD023', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 13, 1),
(17, '2025-05-20 06:01:01.408606', '5', 'Order #46ZPMWD023', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 13, 1),
(18, '2025-05-20 06:01:28.270299', '5', 'Order #46ZPMWD023', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 13, 1),
(19, '2025-05-20 06:01:44.694282', '5', 'Order #46ZPMWD023', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 13, 1),
(20, '2025-06-05 02:31:42.850233', '12', 'Order #7WZR0NPYZ0', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 13, 1),
(21, '2025-06-05 02:32:14.830036', '12', 'Order #7WZR0NPYZ0', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 13, 1),
(22, '2025-06-05 02:53:44.740618', '16', 'Order #PGIPLRF2X0', 3, '', 13, 1),
(23, '2025-06-05 02:54:09.257604', '10', 'Order #AZP8H26J8J', 3, '', 13, 1),
(24, '2025-06-05 02:54:15.705821', '5', 'Order #46ZPMWD023', 3, '', 13, 1),
(25, '2025-06-05 02:54:24.280283', '15', 'Order #ZKUVH1RBS7', 3, '', 13, 1),
(26, '2025-07-25 08:16:06.071675', '1', 'Payment for Order #YIG16VM76T - Completed', 1, '[{\"added\": {}}]', 15, 1),
(27, '2025-07-25 08:16:55.214234', '1', 'Admin', 2, '[]', 4, 1),
(28, '2025-07-25 08:17:26.429061', '2', 'Subarna', 2, '[]', 4, 1),
(29, '2025-08-04 05:50:38.924900', '1', 'Django', 1, '[{\"added\": {}}]', 17, 1),
(30, '2025-08-04 05:55:32.371315', '1', 'Django', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 17, 1),
(31, '2025-08-04 06:00:48.927269', '2', 'Logo', 1, '[{\"added\": {}}]', 17, 1),
(32, '2025-08-04 06:01:25.699638', '1', 'Django', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 17, 1),
(33, '2025-08-04 06:01:34.932584', '2', 'Logo', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 17, 1),
(34, '2025-08-04 06:01:45.442168', '2', 'Logo', 3, '', 17, 1),
(35, '2025-08-04 06:02:20.997159', '3', 'Default', 1, '[{\"added\": {}}]', 17, 1),
(36, '2025-08-04 06:02:29.458468', '3', 'Default', 3, '', 17, 1),
(37, '2025-08-04 06:02:45.700302', '1', 'Django', 2, '[]', 17, 1),
(38, '2025-08-04 06:06:35.925034', '1', 'Services', 1, '[{\"added\": {}}]', 7, 1),
(39, '2025-08-04 06:08:21.628999', '1', 'Services', 3, '', 7, 1),
(40, '2025-08-04 16:33:40.739524', '4', 'Cart #4 - Subarna', 1, '[{\"added\": {}}]', 11, 1),
(41, '2025-08-04 16:33:53.279192', '4', 'Cart #4 - Subarna', 3, '', 11, 1),
(42, '2025-08-04 16:34:55.413782', '27', 'Order #', 1, '[{\"added\": {}}]', 13, 1),
(43, '2025-08-04 16:36:37.675623', '27', 'Order #', 3, '', 13, 1),
(44, '2025-08-04 16:36:37.675697', '26', 'Order #OIT4CNFFDN', 3, '', 13, 1),
(45, '2025-08-04 16:36:37.675736', '25', 'Order #CR90GMKHKY', 3, '', 13, 1),
(46, '2025-08-04 16:36:37.675780', '24', 'Order #5NARIYF8EV', 3, '', 13, 1),
(47, '2025-08-04 16:36:37.675819', '23', 'Order #1HLR7J25Z0', 3, '', 13, 1),
(48, '2025-08-04 16:36:37.675864', '22', 'Order #U9QNZ7H3DW', 3, '', 13, 1),
(49, '2025-08-04 16:36:37.675910', '21', 'Order #G6A03VBH3H', 3, '', 13, 1),
(50, '2025-08-04 16:36:37.675943', '20', 'Order #1Z3NCV88AT', 3, '', 13, 1),
(51, '2025-08-04 16:39:41.242932', '2', 'Subarna', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(52, '2025-08-04 16:40:20.844785', '4', '@ram', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(53, '2025-08-04 16:41:15.710035', '15', '1 x Butter Chicken', 2, '[]', 12, 1),
(54, '2025-08-04 16:42:20.328504', '19', 'Butter Chicken', 2, '[{\"changed\": {\"fields\": [\"Food type\"]}}]', 10, 1),
(55, '2025-08-04 16:42:32.593909', '18', 'Chicken Biryani', 2, '[{\"changed\": {\"fields\": [\"Food type\"]}}]', 10, 1),
(56, '2025-08-04 16:42:51.556686', '8', 'Chicken Wings', 2, '[{\"changed\": {\"fields\": [\"Food type\"]}}]', 10, 1),
(57, '2025-08-08 07:48:18.430039', '5', '@_Unesh', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}, {\"changed\": {\"name\": \"profile\", \"object\": \"@_Unesh Profile\", \"fields\": [\"Phone\", \"Address\"]}}]', 4, 1),
(58, '2025-08-08 07:49:04.941821', '2', 'Subarna', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 4, 1),
(59, '2025-08-13 07:14:00.894217', '14', 'Tiramisu', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(60, '2025-08-13 07:15:02.896932', '10', 'Spaghetti Carbonara', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(61, '2025-08-13 07:15:31.059619', '12', 'Lemonade', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(62, '2025-08-13 07:16:00.326393', '9', 'Thakali', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(63, '2025-08-13 07:16:34.993526', '20', 'Paneer Tikka Masala', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(64, '2025-08-13 07:16:48.309838', '19', 'Butter Chicken', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(65, '2025-08-13 07:17:06.677106', '18', 'Chicken Biryani', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(66, '2025-08-13 07:17:21.876202', '17', 'Garlic Naan', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(67, '2025-08-13 07:17:37.608462', '16', 'Ice Cream', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(68, '2025-08-13 07:18:01.653913', '15', 'Cheesecake', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(69, '2025-08-13 07:18:29.026574', '13', 'Chocolate Cake', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(70, '2025-08-13 07:18:50.739706', '11', 'Coke', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(71, '2025-08-13 07:19:05.323376', '11', 'Coke', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(72, '2025-08-13 07:19:24.793372', '8', 'Chicken Wings', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(73, '2025-08-13 07:19:42.090742', '7', 'Garlic Bread', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(74, '2025-08-13 07:19:48.385826', '6', 'Mozzarella Sticks', 2, '[]', 10, 1),
(75, '2025-08-13 07:20:07.109090', '6', 'Mozzarella Sticks', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(76, '2025-08-13 07:20:22.106124', '5', 'Spring Rolls', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(77, '2025-08-13 07:20:37.823700', '4', 'Iced Tea', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(78, '2025-08-13 07:21:15.738225', '1', 'Pizza', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(79, '2025-08-13 07:24:50.796798', '20', 'Paneer Tikka Masala', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(80, '2025-08-13 07:24:57.211250', '19', 'Butter Chicken', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(81, '2025-08-13 07:25:08.849945', '18', 'Chicken Biryani', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(82, '2025-08-13 07:25:17.530044', '17', 'Garlic Naan', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(83, '2025-08-13 07:25:26.281892', '16', 'Ice Cream', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(84, '2025-08-13 07:25:33.677237', '15', 'Cheesecake', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(85, '2025-08-13 07:25:42.212532', '14', 'Tiramisu', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(86, '2025-08-13 07:25:49.162694', '13', 'Chocolate Cake', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(87, '2025-08-13 07:25:56.314552', '12', 'Lemonade', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(88, '2025-08-13 07:26:04.427433', '11', 'Coke', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(89, '2025-08-13 07:26:11.998051', '10', 'Spaghetti Carbonara', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(90, '2025-08-13 07:26:20.229012', '9', 'Thakali', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(91, '2025-08-13 07:26:29.078721', '8', 'Chicken Wings', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(92, '2025-08-13 07:26:35.844800', '7', 'Garlic Bread', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(93, '2025-08-13 07:26:46.427871', '6', 'Mozzarella Sticks', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(94, '2025-08-13 07:26:54.642774', '1', 'Pizza', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(95, '2025-08-13 07:27:00.851020', '2', 'Burger', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(96, '2025-08-13 07:27:08.524473', '3', 'Coffee', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(97, '2025-08-13 07:27:17.963759', '4', 'Iced Tea', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(98, '2025-08-13 07:27:37.860030', '5', 'Spring Rolls', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(99, '2025-08-13 07:28:50.929694', '5', '@_Unesh', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"@_Unesh Profile\", \"fields\": [\"Profile pic\"]}}]', 4, 1),
(100, '2025-08-15 01:03:50.495708', '54', '1 x Burger', 3, '', 12, 1),
(101, '2025-08-15 01:03:50.495826', '53', '1 x Pizza', 3, '', 12, 1),
(102, '2025-08-15 01:03:50.495874', '15', '1 x Butter Chicken', 3, '', 12, 1),
(103, '2025-08-15 01:07:15.731743', '29', 'Order #FHXBSCHLUH', 3, '', 13, 1),
(104, '2025-08-15 01:07:15.731804', '28', 'Order #6M6TA50FJO', 3, '', 13, 1),
(105, '2025-08-15 01:07:15.731832', '19', 'Order #LQKR5BNS9G', 3, '', 13, 1),
(106, '2025-08-15 01:07:15.731858', '18', 'Order #H9QOB6DP2Y', 3, '', 13, 1),
(107, '2025-08-15 01:07:15.731882', '17', 'Order #9Y3B72RGWP', 3, '', 13, 1),
(108, '2025-08-15 04:02:20.949595', '32', 'Order #CGGSSQE34C', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Payment method\"]}}]', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(17, 'admin_interface', 'theme'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(11, 'cart', 'cart'),
(12, 'cart', 'cartitem'),
(5, 'contenttypes', 'contenttype'),
(16, 'main', 'contactmessage'),
(7, 'main', 'page'),
(9, 'menu', 'category'),
(10, 'menu', 'fooditem'),
(13, 'orders', 'order'),
(14, 'orders', 'orderitem'),
(15, 'payments', 'payment'),
(6, 'sessions', 'session'),
(8, 'users', 'profile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-04-26 08:47:34.830940'),
(2, 'auth', '0001_initial', '2025-04-26 08:47:35.150777'),
(3, 'admin', '0001_initial', '2025-04-26 08:47:35.225832'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-04-26 08:47:35.235231'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-04-26 08:47:35.248502'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-04-26 08:47:35.310734'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-04-26 08:47:35.345119'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-04-26 08:47:35.370352'),
(9, 'auth', '0004_alter_user_username_opts', '2025-04-26 08:47:35.384148'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-04-26 08:47:35.428365'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-04-26 08:47:35.431060'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-04-26 08:47:35.443341'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-04-26 08:47:35.543542'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-04-26 08:47:35.576470'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-04-26 08:47:35.599317'),
(16, 'auth', '0011_update_proxy_permissions', '2025-04-26 08:47:35.610241'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-04-26 08:47:35.633830'),
(18, 'menu', '0001_initial', '2025-04-26 08:47:35.697800'),
(19, 'cart', '0001_initial', '2025-04-26 08:47:35.813426'),
(20, 'main', '0001_initial', '2025-04-26 08:47:35.827019'),
(21, 'orders', '0001_initial', '2025-04-26 08:47:35.949993'),
(22, 'payments', '0001_initial', '2025-04-26 08:47:36.005027'),
(23, 'sessions', '0001_initial', '2025-04-26 08:47:36.039319'),
(24, 'users', '0001_initial', '2025-04-26 08:47:36.096100'),
(25, 'menu', '0002_alter_category_slug_alter_fooditem_slug', '2025-04-26 10:23:54.504289'),
(26, 'orders', '0002_order_payment_method', '2025-04-26 10:23:54.567253'),
(27, 'main', '0002_contactmessage', '2025-05-20 05:22:46.455492'),
(28, 'orders', '0003_order_esewa_ref_id_order_is_payment_verified_and_more', '2025-05-24 13:09:53.863126'),
(29, 'payments', '0002_remove_payment_updated_at_alter_payment_order_and_more', '2025-05-24 13:25:07.300669'),
(30, 'admin_interface', '0001_initial', '2025-08-04 05:38:45.020220'),
(31, 'admin_interface', '0002_add_related_modal', '2025-08-04 05:38:45.175501'),
(32, 'admin_interface', '0003_add_logo_color', '2025-08-04 05:38:45.218887'),
(33, 'admin_interface', '0004_rename_title_color', '2025-08-04 05:38:45.243790'),
(34, 'admin_interface', '0005_add_recent_actions_visible', '2025-08-04 05:38:45.300045'),
(35, 'admin_interface', '0006_bytes_to_str', '2025-08-04 05:38:45.399223'),
(36, 'admin_interface', '0007_add_favicon', '2025-08-04 05:38:45.435643'),
(37, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2025-08-04 05:38:45.498254'),
(38, 'admin_interface', '0009_add_enviroment', '2025-08-04 05:38:45.563592'),
(39, 'admin_interface', '0010_add_localization', '2025-08-04 05:38:45.597971'),
(40, 'admin_interface', '0011_add_environment_options', '2025-08-04 05:38:45.718713'),
(41, 'admin_interface', '0012_update_verbose_names', '2025-08-04 05:38:45.729053'),
(42, 'admin_interface', '0013_add_related_modal_close_button', '2025-08-04 05:38:45.764452'),
(43, 'admin_interface', '0014_name_unique', '2025-08-04 05:38:45.796060'),
(44, 'admin_interface', '0015_add_language_chooser_active', '2025-08-04 05:38:45.833990'),
(45, 'admin_interface', '0016_add_language_chooser_display', '2025-08-04 05:38:45.866885'),
(46, 'admin_interface', '0017_change_list_filter_dropdown', '2025-08-04 05:38:45.874112'),
(47, 'admin_interface', '0018_theme_list_filter_sticky', '2025-08-04 05:38:45.907270'),
(48, 'admin_interface', '0019_add_form_sticky', '2025-08-04 05:38:45.978180'),
(49, 'admin_interface', '0020_module_selected_colors', '2025-08-04 05:38:46.067028'),
(50, 'admin_interface', '0021_file_extension_validator', '2025-08-04 05:38:46.078239'),
(51, 'admin_interface', '0022_add_logo_max_width_and_height', '2025-08-04 05:38:46.145822'),
(52, 'admin_interface', '0023_theme_foldable_apps', '2025-08-04 05:38:46.196944'),
(53, 'admin_interface', '0024_remove_theme_css', '2025-08-04 05:38:46.221026'),
(54, 'admin_interface', '0025_theme_language_chooser_control', '2025-08-04 05:38:46.256055'),
(55, 'admin_interface', '0026_theme_list_filter_highlight', '2025-08-04 05:38:46.291513'),
(56, 'admin_interface', '0027_theme_list_filter_removal_links', '2025-08-04 05:38:46.327409'),
(57, 'admin_interface', '0028_theme_show_fieldsets_as_tabs_and_more', '2025-08-04 05:38:46.399420'),
(58, 'admin_interface', '0029_theme_css_generic_link_active_color', '2025-08-04 05:38:46.436598'),
(59, 'admin_interface', '0030_theme_collapsible_stacked_inlines_and_more', '2025-08-04 05:38:46.569599');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5vr6nv8mti9v3irva84zloog0g2kfmdg', '.eJxVjs0KwjAMx9-lZxnrmrWNRw--geeSpikVYcK6ncR3t4OCesvv_5HkpQLtWwl7lTXckzqrSZ1-tUj8kOUwDqxD5zpc1-eytenW5EsP_TUL1dJqxBLRaYsjY3SQWaeM0docjRnRyoQC7GbPHkmIc0LQBqwHmT2YzG1p7qe-X07vDyw1PY8:1umlau:kJ6c2SI5USZ6Di2GiqKwRApvut7eFG8OPGj8RzhrOg8', '2025-08-29 03:59:08.612392'),
('6hgsq7s333sbqtkcl35k5rilbj4zi7u9', '.eJxVjE0OwiAYBe_C2pAPkAAu3XsG8viTqqFJaVfGu1uSLnQ7M--9mce2Vr_1vPgpsQsT7PTLAuIztyHSA-0-8zi3dZkCHwk_bOe3OeXX9Wj_Dip6HWtFyTkiWRxJGFmK0DYp4WAVCZiInPdE7tAaQQVRu4wASBWiPhP7fAHTnzfk:1uHEwz:G0DXEypi7K1Lr6QnLEQi8KhA2dcX7gRa8OTjTMc40i4', '2025-06-03 04:51:37.228005'),
('jpys61xiboe6vlpywlxvmfcvfwkdwzcb', '.eJxVjs0KAjEMhN-lZ1mS1tLGowffwHNJ_6gIK2x3T4vvbhYK6i3zZSaTXQXe1ha2XpbwyOqiUJ1-WeT0LPOxOGSfhu7TbXnNq0x3wddh-ks27k1i2UAmAtCVQLPTtaL12SCxN4DsEpciFi3QO4TKyVLhyKxNTPYMcrSOqu-X-P4A97c9Fw:1umAoh:33s888NNMbFDCYr1J6ISqFnBi_5sctEkcBR1k6kckUI', '2025-08-27 12:42:55.925648'),
('rad3h5urd5wfltsqckd5nlfeyy09hy97', '.eJxVjEEOwiAQRe_C2pBSKDAu3XsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWozj9bhHpwXUH6Y711iS1ui5zlLsiD9rltSV-Xg7376BgL98aiSM4ZWEgiM5kUilDtDZHrQewPAIbcpMnD8hIOYFR2lhvePJGZxLvD_5QOFs:1uHEBB:ZETpkpxmUsLcyWgjULTLdbWj8AByPWWK0vxWmDM9ysA', '2025-06-03 04:02:13.395506'),
('slko28eflamaztmh6pfzl9exaj7nmmbm', '.eJxVjs0KAjEMhN-lZ1mS1tLGowffwHNJ_6gIK2x3T4vvbhYK6i3zZSaTXQXe1ha2XpbwyOqiUJ1-WeT0LPOxOGSfhu7TbXnNq0x3wddh-ks27k1i2UAmAtCVQLPTtaL12SCxN4DsEpciFi3QO4TKyVLhyKxNTPYMcrSOqu-X-P4A97c9Fw:1umAsg:c3HwbYQerkPwe_fHNOSc7IQ3dXRosF01x1w_LIG9f5E', '2025-08-27 12:47:02.159918'),
('tkhhrpyw2lt3ykz8g9v7mzktd56yvh3v', '.eJxVjksKAyEMhu_iugxajY8uu5gbdC0ZY7AUpjDOrErvXgWh7S7f_0jyEhGPvcSj5i3eSVyEEadfbcH0yGs3OtZpcJ3m7bnubbo1-TpCf82CtbSaBbBosiKnlTLBg2fJXlvtNTMuIaGTRnoKQJKArAPW2TKmsybjoC_lcer7pXl_AOOaPMM:1uIkNP:5A6lkpRufblOmuDEHlzizlohh-klYYKnfHbf4ybh8vo', '2025-06-07 08:37:07.807530'),
('tkjk1v33tqyls0zetbd15yrxgqg4ityj', '.eJxVjEEOwiAQRe_C2pBSKDAu3XsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWozj9bhHpwXUH6Y711iS1ui5zlLsiD9rltSV-Xg7376BgL98aiSM4ZWEgiM5kUilDtDZHrQewPAIbcpMnD8hIOYFR2lhvePJGZxLvD_5QOFs:1uDbS8:jiIsCo9N0pKjfoRqZUYRxN8vNVM_BSga40-8AKBGdqc', '2025-05-24 04:04:44.204806'),
('uun4uffo42ze4h1azjd1m3ydy2hpjs06', '.eJxVjEEOwiAQRe_C2pBSKDAu3XsGMgyDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWozj9bhHpwXUH6Y711iS1ui5zlLsiD9rltSV-Xg7376BgL98aiSM4ZWEgiM5kUilDtDZHrQewPAIbcpMnD8hIOYFR2lhvePJGZxLvD_5QOFs:1uHEBA:MUnEGWMswlIMeORAh7HsNZ4vbdZEUoZ6PCQ9DEFSz0I', '2025-06-03 04:02:12.859677'),
('w0ikpv2qwgnkrtsrttdnrztf1aeba6t4', '.eJxVjs0KAjEMhN-lZ1mS1tLGowffwHNJ_6gIK2x3T4vvbhYK6i3zZSaTXQXe1ha2XpbwyOqiUJ1-WeT0LPOxOGSfhu7TbXnNq0x3wddh-ks27k1i2UAmAtCVQLPTtaL12SCxN4DsEpciFi3QO4TKyVLhyKxNTPYMcrSOqu-X-P4A97c9Fw:1umAog:YvAy56BNV2HiO3LuBUXmfLTm7qzuCGxeHyiISUQajAA', '2025-08-27 12:42:54.878913');

-- --------------------------------------------------------

--
-- Table structure for table `main_contactmessage`
--

CREATE TABLE `main_contactmessage` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_contactmessage`
--

INSERT INTO `main_contactmessage` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(1, 'Ram', 'ram@gmail.com', 'order', 'I am not getting the food, after 2 hours of order', '2025-05-20 05:40:12.457159');

-- --------------------------------------------------------

--
-- Table structure for table `main_page`
--

CREATE TABLE `main_page` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE `menu_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`id`, `name`, `slug`, `description`, `image`) VALUES
(4, 'Main Course', 'veg_pizza', '', 'category_images/getimg_ai_img-ZnssU9vCPbpoOtm3R3MiW_hDbM5xA.jpeg'),
(8, 'Beverages', 'drinks', '', 'category_images/co.jpg'),
(9, 'Starters', 'starters', '', 'category_images/getimg_ai_img-gHnHcTZzXaFeURziQeruJ.jpeg'),
(10, 'Indian Cuisine', 'indian-cuisine', '', 'category_images/Indian-Cuisine.jpg'),
(11, 'Dessert', 'dessert', '', 'category_images/Dessert.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `menu_fooditem`
--

CREATE TABLE `menu_fooditem` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `food_type` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_fooditem`
--

INSERT INTO `menu_fooditem` (`id`, `name`, `slug`, `description`, `price`, `image`, `is_available`, `food_type`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Pizza', 'pizza', 'Best Pizza in Town', 200.99, 'food_images/pizza.jpeg', 1, 'Veg', '2025-04-26 10:07:44.452637', '2025-08-13 07:26:54.641328', 4),
(2, 'Burger', 'burger', 'Best Burger in Town', 100.00, 'food_images/burger.jpg', 1, 'Veg', '2025-04-26 10:08:13.971335', '2025-08-13 07:27:00.848458', 4),
(3, 'Coffee', 'coffee', 'For refreshment have a cup of coffee', 50.00, 'food_images/co.jpg', 1, 'Veg', '2025-04-26 10:09:13.016808', '2025-08-13 07:27:08.522901', 8),
(4, 'Iced Tea', 'iced-tea', 'a refreshing beverage made by brewing tea and chilling it with ice', 40.67, 'food_images/icetea_YGJXi2l.jpeg', 1, 'Veg', '2025-04-27 10:20:26.964091', '2025-08-13 07:27:17.961389', 8),
(5, 'Spring Rolls', 'spring-rolls', 'Crispy rolls filled with vegetables and served with a sweet chili dipping sauce', 40.99, 'food_images/springroll_9MH1QJX.jpeg', 1, 'Veg', '2025-04-29 09:39:33.043160', '2025-08-13 07:27:37.858440', 9),
(6, 'Mozzarella Sticks', 'mozzarella-sticks', '5.99', 50.99, 'food_images/ms_BdUuQA2.jpeg', 1, 'Veg', '2025-04-29 09:40:21.540880', '2025-08-13 07:26:46.426205', 9),
(7, 'Garlic Bread', 'garlic-bread', 'Warm and crispy garlic bread with melted butter and herbs.', 30.99, 'food_images/gb_PfmOU3S.jpeg', 1, 'Veg', '2025-04-29 09:41:06.139810', '2025-08-13 07:26:35.843254', 9),
(8, 'Chicken Wings', 'chicken-wings', 'Choice of BBQ or Honey Mustard glaze.', 70.99, 'food_images/cikWin_n8nWbFK.png', 1, 'Non-Veg', '2025-04-29 09:42:03.562238', '2025-08-13 07:26:29.076821', 9),
(9, 'Thakali', 'thakali', 'hakali cuisine is hearty, flavorful, and nourishing, offering a satisfying dining experience.', 120.99, 'food_images/thaakali_pFLp2sh.jpg', 1, 'Veg', '2025-04-29 09:46:49.695700', '2025-08-13 07:26:20.227041', 4),
(10, 'Spaghetti Carbonara', 'spaghetti-carbonara', 'Spaghetti with creamy Alfredo sauce, pancetta, and parmesan cheese.', 100.98, 'food_images/spaage.jpg', 1, 'Veg', '2025-04-29 09:48:42.609674', '2025-08-13 07:26:11.995276', 4),
(11, 'Coke', 'coke', 'Refreshing, fizzy soda with a sweet, caramelized taste and bubbles.', 30.24, 'food_images/cokee_aBBZERI.jpg', 1, 'Veg', '2025-04-29 09:51:38.369894', '2025-08-13 07:26:04.425741', 8),
(12, 'Lemonade', 'lemonade', 'Sweet and tangy drink made from fresh lemons, sugar, water.', 25.00, 'food_images/Leemo.jpg', 1, 'Veg', '2025-04-29 09:52:25.159985', '2025-08-13 07:25:56.311824', 8),
(13, 'Chocolate Cake', 'chocolate-cake', 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.', 45.54, 'food_images/ck.jpeg', 1, 'Veg', '2025-04-29 10:01:58.750889', '2025-08-13 07:25:49.160710', 11),
(14, 'Tiramisu', 'tiramisu', 'Layers of coffee-soaked ladyfingers, mascarpone cheese, and cocoa.', 35.87, 'food_images/Tiramisu_EyBoDyR.jpeg', 1, 'Veg', '2025-04-29 10:02:31.371075', '2025-08-13 07:25:42.210673', 11),
(15, 'Cheesecake', 'cheesecake', 'Creamy cheesecake with a graham cracker crust, topped with strawberry sauce.', 50.89, 'food_images/cheeseCake_5mmPAQV.jpeg', 1, 'Veg', '2025-04-29 10:03:06.273370', '2025-08-13 07:25:33.675760', 11),
(16, 'Ice Cream', 'ice-cream', 'Creamy, frozen dessert available in various flavors, rich and indulgent.', 80.99, 'food_images/icecream_X8YyyWt.jpeg', 1, 'Veg', '2025-04-29 10:04:07.731060', '2025-08-13 07:25:26.279492', 11),
(17, 'Garlic Naan', 'garlic-naan', 'Naan bread infused with garlic and herbs.', 20.67, 'food_images/GN_58k618R.jpeg', 1, 'Veg', '2025-04-29 10:08:45.265098', '2025-08-13 07:25:17.527994', 10),
(18, 'Chicken Biryani', 'chicken-biryani', 'Fragrant rice cooked with chicken, saffron, and spices.', 150.78, 'food_images/chicken_biryani_NUwf1JU.jpeg', 1, 'Non-Veg', '2025-04-29 10:09:30.315499', '2025-08-13 07:25:08.847764', 10),
(19, 'Butter Chicken', 'butter-chicken', 'Tender chicken cooked in a creamy, spiced tomato gravy.', 120.99, 'food_images/Butter_Chicken_jFmqmyR.jpeg', 1, 'Non-Veg', '2025-04-29 10:10:03.822825', '2025-08-13 07:24:57.209351', 10),
(20, 'Paneer Tikka Masala', 'paneer-tikka-masala', 'Grilled paneer cubes in a rich, flavorful tomato-based gravy.', 110.00, 'food_images/PTM_HHj0c1g.jpeg', 1, 'Veg', '2025-04-29 10:10:41.109972', '2025-08-13 07:24:50.794887', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders_order`
--

CREATE TABLE `orders_order` (
  `id` bigint(20) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `shipping_address` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `notes` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `esewa_ref_id` varchar(100) DEFAULT NULL,
  `is_payment_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_order`
--

INSERT INTO `orders_order` (`id`, `order_number`, `status`, `total`, `created_at`, `updated_at`, `shipping_address`, `phone`, `notes`, `user_id`, `payment_method`, `esewa_ref_id`, `is_payment_verified`) VALUES
(1, 'YIG16VM76T', 'Delivered', 205.00, '2025-04-26 10:24:14.080279', '2025-04-27 10:08:47.709125', 'Kathmandu', '9863993128', '', 1, 'Cash On Delivery', NULL, 0),
(2, '8L2CLMBVQG', 'Delivered', 55.00, '2025-04-26 10:25:28.873910', '2025-04-27 10:08:43.637827', 'Dillibazar', '9818234456', '', 2, 'Cash On Delivery', NULL, 0),
(3, 'OB0W219KZV', 'Delivered', 255.00, '2025-04-27 10:13:10.979205', '2025-04-28 01:58:31.047918', 'Baneshwor', '9863673653', '', 1, 'Cash On Delivery', NULL, 0),
(4, 'FG856ZFSRX', 'Delivered', 20.67, '2025-04-29 11:35:54.953628', '2025-04-29 11:37:17.884245', 'Thapathali', '9818234456', 'Will you please delivered fast', 1, 'Cash On Delivery', NULL, 0),
(6, 'I3Z2F7EZE3', 'Cancelled', 21.86, '2025-05-24 13:31:47.009800', '2025-06-05 02:06:15.453000', 'Maitidevi', '9863993128', '', 4, 'eSewa', NULL, 0),
(7, '3KDEWPBV92', 'Cancelled', 15.00, '2025-05-24 13:34:10.088138', '2025-06-05 02:06:10.530660', 'Maitidevi', '9863993128', '', 4, 'eSewa', NULL, 0),
(8, 'GFRWQ7KPV9', 'Cancelled', 25.99, '2025-05-24 13:40:34.604014', '2025-06-05 02:06:03.117902', 'Maitidevi', '9863993128', '', 4, 'eSewa', NULL, 0),
(9, 'LAD2G8R7JN', 'Cancelled', 15.00, '2025-05-24 13:55:19.676850', '2025-06-05 02:05:58.765618', 'maitidevi', '9818234456', '', 4, 'eSewa', NULL, 0),
(11, '7G15RS3CE4', 'Cancelled', 10.89, '2025-06-05 02:25:21.720838', '2025-07-25 07:02:24.404283', 'Maitidevi', '9863993128', '', 4, 'eSewa', NULL, 0),
(12, '7WZR0NPYZ0', 'Delivered', 16.00, '2025-06-05 02:28:04.750467', '2025-06-05 02:32:14.827548', 'ktm', '9863993128', '', 4, 'eSewa', 'MOCK123456', 1),
(13, 'MGJMO2VWFO', 'Cancelled', 25.99, '2025-06-05 02:35:28.091003', '2025-07-25 07:02:17.300724', 'maitidevi', '9863993128', '', 4, 'eSewa', NULL, 0),
(14, 'N74ADOBD5J', 'Cancelled', 9.99, '2025-06-05 02:42:24.461658', '2025-07-25 07:02:11.653293', 'ktm', '9863993128', '', 4, 'eSewa', NULL, 0),
(30, '1HP58XS1J8', 'Cancelled', 305.99, '2025-08-13 12:33:57.069079', '2025-08-13 12:34:07.618810', 'Kathmandu', '9818268002', '', 5, 'Cash On Delivery', NULL, 0),
(31, '7WY0CROBMG', 'Cancelled', 205.99, '2025-08-15 01:45:47.753896', '2025-08-15 01:46:26.424441', 'Maitideviiiiiiiiiii', '9863993128', '', 2, 'Cash On Delivery', NULL, 0),
(32, 'CGGSSQE34C', 'Processing', 205.99, '2025-08-15 04:01:07.496409', '2025-08-15 04:02:20.944908', 'Maitidevii', '9863993128', 'hvx', 2, 'eSewa', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders_orderitem`
--

CREATE TABLE `orders_orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `price` decimal(10,2) NOT NULL,
  `food_item_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_orderitem`
--

INSERT INTO `orders_orderitem` (`id`, `quantity`, `price`, `food_item_id`, `order_id`) VALUES
(1, 1, 100.00, 2, 1),
(2, 2, 50.00, 3, 1),
(3, 1, 50.00, 3, 2),
(4, 1, 200.00, 1, 3),
(5, 1, 50.00, 3, 3),
(6, 1, 4.67, 4, 4),
(7, 1, 11.00, 20, 4),
(9, 1, 3.87, 14, 6),
(10, 1, 12.99, 19, 6),
(11, 1, 10.00, 2, 7),
(12, 1, 20.99, 1, 8),
(13, 1, 10.00, 2, 9),
(15, 1, 5.89, 15, 11),
(16, 1, 11.00, 20, 12),
(17, 1, 20.99, 1, 13),
(18, 1, 4.99, 5, 14),
(35, 1, 100.00, 2, 30),
(36, 1, 200.99, 1, 30),
(37, 1, 200.99, 1, 31),
(38, 1, 200.99, 1, 32);

-- --------------------------------------------------------

--
-- Table structure for table `payments_payment`
--

CREATE TABLE `payments_payment` (
  `id` bigint(20) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments_payment`
--

INSERT INTO `payments_payment` (`id`, `transaction_id`, `amount`, `status`, `payment_method`, `created_at`, `order_id`) VALUES
(1, NULL, 11.89, 'Completed', 'eSewa', '2025-07-25 08:16:06.046493', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` bigint(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `phone`, `address`, `profile_pic`, `user_id`) VALUES
(1, '9863993128', 'Kathmandu', 'profile_pics/ME1.jpg', 1),
(2, '9863993128', 'Maitideviiiiiiiiiii', 'profile_pics/Shiva.jpg', 2),
(3, '9810020030', 'Kathmandu', 'profile_pics/0-02-03-9072e431b72512e3ca8a61058861d65cb522cc904fe952e0c53f5e264cec7ae0_af_5EXvQg8.jpg', 3),
(4, '9863993128', 'Gyaneshwar', 'profile_pics/logo_nUKCv4N.webp', 4),
(5, '9818268002', 'Kathmandu', 'profile_pics/36bff5e70448ae3440f6c276fb01643a.jpg', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_cart_user_id_9b4220b9_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` (`cart_id`),
  ADD KEY `cart_cartitem_food_item_id_ac0fb559_fk_menu_fooditem_id` (`food_item_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_contactmessage`
--
ALTER TABLE `main_contactmessage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_page`
--
ALTER TABLE `main_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `menu_fooditem`
--
ALTER TABLE `menu_fooditem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `menu_fooditem_category_id_944b9a6c_fk_menu_category_id` (`category_id`);

--
-- Indexes for table `orders_order`
--
ALTER TABLE `orders_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `orders_order_user_id_e9b59eb1_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `orders_orderitem`
--
ALTER TABLE `orders_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_orderitem_food_item_id_a906ceae_fk_menu_fooditem_id` (`food_item_id`),
  ADD KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`);

--
-- Indexes for table `payments_payment`
--
ALTER TABLE `payments_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_payment_order_id_22c479b7` (`order_id`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `cart_cart`
--
ALTER TABLE `cart_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `main_contactmessage`
--
ALTER TABLE `main_contactmessage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_page`
--
ALTER TABLE `main_page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menu_fooditem`
--
ALTER TABLE `menu_fooditem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders_order`
--
ALTER TABLE `orders_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders_orderitem`
--
ALTER TABLE `orders_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `payments_payment`
--
ALTER TABLE `payments_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD CONSTRAINT `cart_cart_user_id_9b4220b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  ADD CONSTRAINT `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  ADD CONSTRAINT `cart_cartitem_food_item_id_ac0fb559_fk_menu_fooditem_id` FOREIGN KEY (`food_item_id`) REFERENCES `menu_fooditem` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `menu_fooditem`
--
ALTER TABLE `menu_fooditem`
  ADD CONSTRAINT `menu_fooditem_category_id_944b9a6c_fk_menu_category_id` FOREIGN KEY (`category_id`) REFERENCES `menu_category` (`id`);

--
-- Constraints for table `orders_order`
--
ALTER TABLE `orders_order`
  ADD CONSTRAINT `orders_order_user_id_e9b59eb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `orders_orderitem`
--
ALTER TABLE `orders_orderitem`
  ADD CONSTRAINT `orders_orderitem_food_item_id_a906ceae_fk_menu_fooditem_id` FOREIGN KEY (`food_item_id`) REFERENCES `menu_fooditem` (`id`),
  ADD CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`);

--
-- Constraints for table `payments_payment`
--
ALTER TABLE `payments_payment`
  ADD CONSTRAINT `payments_payment_order_id_22c479b7_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`);

--
-- Constraints for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
