/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : laravelrestaurant

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-09-12 18:07:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('59', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('60', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('61', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('62', '2021_07_28_165620_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('63', '2021_07_28_165629_create_role_user_table', '1');
INSERT INTO `migrations` VALUES ('109', '2021_08_06_135632_create_t_categories_table', '2');
INSERT INTO `migrations` VALUES ('110', '2021_08_06_135644_create_t_products_table', '2');
INSERT INTO `migrations` VALUES ('111', '2021_08_06_135701_create_t_restaurants_table', '2');
INSERT INTO `migrations` VALUES ('112', '2021_08_06_135714_create_t_orders_table', '2');
INSERT INTO `migrations` VALUES ('113', '2021_08_06_135720_create_t_orderdetails_table', '2');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'Administrator', 'Qu???n tr??? vi??n', '2021-08-07 21:36:59', '2021-08-07 21:36:59');
INSERT INTO `roles` VALUES ('2', 'smod', 'Super Moderator', 'Ng?????i ??i???u h??nh c???p cao', '2021-08-07 21:36:59', '2021-08-07 21:36:59');
INSERT INTO `roles` VALUES ('3', 'mod', 'Moderator', 'Ng?????i ??i???u h??nh', '2021-08-07 21:36:59', '2021-08-07 21:36:59');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('4', '1');
INSERT INTO `role_user` VALUES ('4', '2');
INSERT INTO `role_user` VALUES ('5', '1');
INSERT INTO `role_user` VALUES ('5', '3');
INSERT INTO `role_user` VALUES ('6', '2');
INSERT INTO `role_user` VALUES ('7', '3');

-- ----------------------------
-- Table structure for t_categories
-- ----------------------------
DROP TABLE IF EXISTS `t_categories`;
CREATE TABLE `t_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Category_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Category_Slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category_Img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category_Description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category_Parent_ID` bigint(20) unsigned DEFAULT NULL,
  `Category_SystemStatus` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_categories_category_parent_id_foreign` (`Category_Parent_ID`),
  CONSTRAINT `t_categories_category_parent_id_foreign` FOREIGN KEY (`Category_Parent_ID`) REFERENCES `t_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_categories
-- ----------------------------
INSERT INTO `t_categories` VALUES ('11', 'FASTFOOD', 'fastfood', '', 'danh m???c ????? ??n nhanh', null, '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_categories` VALUES ('12', 'NOODLES', 'noodles', '', 'danh m???c c??c m??n s???i', null, '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_categories` VALUES ('14', 'DRINKS', 'drinks', '', 'danh m???c th???c u???ng', null, '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_categories` VALUES ('15', 'B??NH M??', 'banh-mi', '', 'c??c m??n b??nh m??', '11', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_categories` VALUES ('16', 'B??NH BAO', 'banh-bao', '', 'c??c m??n b??nh bao', '11', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_categories` VALUES ('17', 'PH???', 'pho', '', 'c??c m??n ph???', '12', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_categories` VALUES ('18', 'H??? TI???U', 'hu-tieu', '', 'c??c m??n h??? ti???u', '12', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_categories` VALUES ('19', 'B??N', 'bun', '', 'c??c m??n b??n', '12', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');

-- ----------------------------
-- Table structure for t_orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `t_orderdetails`;
CREATE TABLE `t_orderdetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Order_ID` bigint(20) unsigned DEFAULT NULL,
  `Product_ID` bigint(20) unsigned DEFAULT NULL,
  `OrderDetail_ProductName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderDetail_ProductPrice` double(12,2) NOT NULL,
  `OrderDetail_Quantity` int(11) NOT NULL,
  `OrderDetail_TotalPrice` double(12,2) NOT NULL,
  `OrderDetail_Note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OrderDetail_Status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_orderdetails_order_id_foreign` (`Order_ID`),
  KEY `t_orderdetails_product_id_foreign` (`Product_ID`),
  CONSTRAINT `t_orderdetails_order_id_foreign` FOREIGN KEY (`Order_ID`) REFERENCES `t_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_orderdetails_product_id_foreign` FOREIGN KEY (`Product_ID`) REFERENCES `t_products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_orderdetails
-- ----------------------------

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` bigint(20) unsigned DEFAULT NULL,
  `Customer_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Customer_Phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Customer_Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Customer_Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Restaurant_ID` bigint(20) unsigned DEFAULT NULL,
  `Restaurant_Staff` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Order_RestaurantName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_TotalItem` int(11) NOT NULL,
  `Order_TotalQuantity` int(11) NOT NULL,
  `Order_TotalPrice` double(15,2) NOT NULL,
  `Order_Note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Order_TrackingCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_Status` tinyint(4) NOT NULL,
  `Order_CancelBy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Order_CancelReason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Order_ReturnReason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Order_Time_Request` datetime DEFAULT NULL,
  `Order_Time_Accept` datetime DEFAULT NULL,
  `Order_Time_Complete` datetime DEFAULT NULL,
  `Order_Time_Receive` datetime DEFAULT NULL,
  `Order_Time_Cancel` datetime DEFAULT NULL,
  `Order_Time_Return` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_orders_user_id_foreign` (`User_ID`),
  KEY `t_orders_restaurant_id_foreign` (`Restaurant_ID`),
  CONSTRAINT `t_orders_restaurant_id_foreign` FOREIGN KEY (`Restaurant_ID`) REFERENCES `t_restaurants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_orders_user_id_foreign` FOREIGN KEY (`User_ID`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_orders
-- ----------------------------

-- ----------------------------
-- Table structure for t_products
-- ----------------------------
DROP TABLE IF EXISTS `t_products`;
CREATE TABLE `t_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Category_ID` bigint(20) unsigned NOT NULL,
  `Product_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Product_Img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_Description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_Price` double(12,2) NOT NULL,
  `Product_AvailableStatus` tinyint(4) NOT NULL,
  `Product_SystemStatus` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_products_category_id_foreign` (`Category_ID`),
  CONSTRAINT `t_products_category_id_foreign` FOREIGN KEY (`Category_ID`) REFERENCES `t_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_products
-- ----------------------------
INSERT INTO `t_products` VALUES ('101', '14', 'N?????c su???i', 'public/images_product/101.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisc', '7000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('102', '14', 'N?????c ??p cam', 'public/images_product/102.jpg', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum', '19000.00', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('103', '14', 'N?????c ??p d??a h???u', 'public/images_product/103.jpg', 'Laoreet id donec ultrices tincidunt arcu non sodale', '19000.00', '3', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('104', '14', 'N?????c ??p t??o', 'public/images_product/104.jpg', 'Senectus et netus et malesuada. Nunc pulvinar sapien et ligula ullamcorper malesuada proin', '19000.00', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('105', '14', 'Tr?? chanh', 'public/images_product/105.jpg', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', '12000.00', '0', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('106', '14', 'Tr?? t???c', 'public/images_product/106.jpg', 'Libero id faucibus nisl tincidunt eget. Leo a diam', '12000.00', '0', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('107', '14', 'Tr?? tr??i c??y', 'public/images_product/107.jpg', 'Porttitor rhoncus dolor purus non', '22000.00', '4', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('108', '15', 'B??nh m?? pate tr???ng', 'public/images_product/108.jpg', 'Et magnis dis parturient montes nascetur. Est placerat in egestas erat imperdiet', '20000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('109', '15', 'B??nh m?? x??u m???i', 'public/images_product/109.jpg', 'Consequat interdum varius', '25000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('110', '15', 'B??nh m?? x?? x??u', 'public/images_product/110.jpg', 'Sit amet nulla facilisi morbi tempus. Nulla facilisi cras fermentum odio eu. Etiam erat velit scelerisqu', '25000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('111', '15', 'B??nh m?? nem khoai', 'public/images_product/111.jpg', 'Eros donec ac odio tempor orci dapibus ultrices.', '25000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('112', '16', 'B??nh bao th???t tr???ng mu???i', 'public/images_product/112.jpg', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia', '17000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('113', '16', 'B??nh bao th???t tr???ng c??t', 'public/images_product/113.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisc', '17000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('114', '16', 'B??nh bao nh??n x?? x??u', 'public/images_product/114.jpg', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum', '24000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('115', '17', 'Ph??? b?? n???m g??n', 'public/images_product/115.jpg', 'Laoreet id donec ultrices tincidunt arcu non sodale', '35000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('116', '17', 'Ph??? b?? vi??n', 'public/images_product/116.jpg', 'Senectus et netus et malesuada. Nunc pulvinar sapien et ligula ullamcorper malesuada proin', '35000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('117', '17', 'Ph??? b?? x??o th???p c???m', 'public/images_product/117.jpg', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea comm', '45000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('118', '17', 'Ph??? g??', 'public/images_product/118.jpg', 'Libero id faucibus nisl tincidunt eget', '35000.00', '3', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('119', '18', 'H??? ti???u th???p c???m', 'public/images_product/119.jpg', 'Porttitor rhoncus dolor purus non enim praesent', '39000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('120', '18', 'H??? ti???u b?? vi??n', 'public/images_product/120.jpg', 'Et magnis dis parturient montes nascetur', '39000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('121', '18', 'H??? ti???u h???i s???n', 'public/images_product/121.jpg', 'Consequat interdum varius sit', '37000.00', '0', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('122', '19', 'B??n m??ng v???t', 'public/images_product/122.jpg', 'Sit amet nulla facilisi morbi tempus. Nulla facilisi cras fermentum odio eu. Etiam erat velit', '35000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('123', '19', 'B??n m??ng g??', 'public/images_product/123.jpg', 'Eros donec ac odio tempor orci dapibus ultrices.', '35000.00', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('124', '19', 'B??n m??ng s?????n heo', 'public/images_product/124.jpg', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia', '39000.00', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_products` VALUES ('125', '19', 'B??n m??ng gi?? heo', 'public/images_product/125.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisc', '45000.00', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');

-- ----------------------------
-- Table structure for t_restaurants
-- ----------------------------
DROP TABLE IF EXISTS `t_restaurants`;
CREATE TABLE `t_restaurants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Restaurant_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Restaurant_Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Restaurant_Area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Restaurant_Phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Restaurant_Description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Restaurant_OpenStatus` tinyint(4) NOT NULL,
  `Restaurant_SystemStatus` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_restaurants
-- ----------------------------
INSERT INTO `t_restaurants` VALUES ('1', 'Vinakook Paris', 'L?? 01, ???????ng 01, K??T Paris, Area 1', 'Area 1', '+123019001', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('2', 'Vinakook London', 'L?? 02, ???????ng 02, K??T London, Area 2', 'Area 2', '+321091002', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('3', 'Vinakook Milan', 'L?? 03, ???????ng 03, K??T Milan, Area 1', 'Area 1', '+123019003', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '0', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('4', 'Vinakook Venice', 'L?? 04, ???????ng 04, K??T Venice, Area 1', 'Area 1', '+321091004', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '3', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('5', 'Vinakook Marseille', 'L?? 05, ???????ng 05, K??T Marseille, Area 1', 'Area 1', '+123019005', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '0', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('6', 'Vinakook Amsterdam', 'L?? 06, ???????ng 06, K??T Amsterdam, Area 2', 'Area 2', '+321091006', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('7', 'Vinakook Munich', 'L?? 07, ???????ng 07, K??T Munich, Area 3', 'Area 3', '+123019007', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '2', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('8', 'Vinakook Rotterdam', 'L?? 08, ???????ng 08, K??T Rotterdam, Area 2', 'Area 2', '+321091008', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('9', 'Vinakook Berlin', 'L?? 09, ???????ng 09, K??T Berlin, Area 3', 'Area 3', '+123019009', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('10', 'Vinakook Rome', 'L?? 10, ???????ng 10, K??T Rome, Area 3', 'Area 3', '+321091010', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('11', 'Vinakook Edinburgh', 'L?? 11, ???????ng 11, K??T Edinburgh, Area 3', 'Area 3', '+123019011', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');
INSERT INTO `t_restaurants` VALUES ('12', 'Vinakook Hamburg', 'L?? 12, ???????ng 12, K??T Hamburg, Area 2', 'Area 2', '+321091012', 'nh?? h??ng,\nqu??n x??,\nti???m ??n u???ng.', '1', '1', '2021-08-26 21:25:59', '2021-08-26 22:25:19', '4', '5');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_FullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `User_Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `User_Phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `User_Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'sys1', '1', '$2y$10$4q8OmgiSDKoXVwxesT7iNu4pQFNumK0A2RaCQ8pLqIoQEKq87D7H.', 'System Administrator 1', null, null, null, null, '2021-08-11 11:08:45', '2021-08-11 15:22:14');
INSERT INTO `users` VALUES ('2', 'sys2', '1', '$2y$10$Yr3ZZTMSE1hDr8uQuVmIPOHpmEpRKFAPaLz7dbOtBDNnt9wKsMQ3C', 'System Administrator 2', null, null, null, null, '2021-08-11 11:08:46', '2021-08-11 15:22:14');
INSERT INTO `users` VALUES ('3', 'sys3', '1', '$2y$10$se7Ng6vaTOR1Uk51yKSZPeGcFT6sMDdffJ2tcPtHh2WD.P8OfU6DS', 'System Administrator 3', null, null, null, null, '2021-08-11 11:08:46', '2021-08-11 15:22:14');
INSERT INTO `users` VALUES ('4', 'admin1', '1', '$2y$10$Tuy.cVOFf7IQtCoDW5bGQOg4K2Qz.n6J8ZSs2NaCuU.dOKmuYQkrS', 'Admin One', 'admin1@rmail.com', '+0123456789', 'street, town, land', null, '2021-08-07 21:38:28', '2021-08-11 20:08:52');
INSERT INTO `users` VALUES ('5', 'admin2', '0', '$2y$10$ctXSRdRA4.MhKeMUosfpH./h9GtgK03uaFWfGjFguj/T05bV7Wrue', 'Admin Two', 'admin2@rmail.com', '+0123456789', 'street, town, land', null, '2021-08-07 21:39:06', '2021-09-04 17:50:46');
INSERT INTO `users` VALUES ('6', 'res1', '0', '$2y$10$Vp6SBIalEuueu9tFnnaGUOqpBI63gbHJbVeRAjvPl0xfcgnk4/e7O', 'Chef 1', 'chef1@rmail.com', '+9876543210', 'street, town, land', null, '2021-08-07 21:41:00', '2021-09-04 17:50:47');
INSERT INTO `users` VALUES ('7', 'res2', '0', '$2y$10$bSWkB0LqokCrthh.UwAKWuTOSFeGfpzZjxLtDoL3dN1vNagTRl2AW', 'Chef 2', 'chef2@rmail.com', '+9876543210', 'street, town, land', null, '2021-08-07 21:41:27', '2021-09-04 17:50:47');
INSERT INTO `users` VALUES ('8', 'cus1', '0', '$2y$10$R1QKheOhg.C9kZMolo1H9.b3McIketMARD.ysPK1hLdbYLn9v9huu', 'Customer 1', 'cus1@rmail.com', '+c1234567890', 'street, town, land', null, '2021-08-07 21:42:02', '2021-09-04 17:50:47');
INSERT INTO `users` VALUES ('9', 'cus2', '0', '$2y$10$V7opInlIzDtDTCpqO7MTqO0kFfdGmw5Umm4HO3osmWEoIU.k7naHO', 'Customer 2', 'cus2@rmail.com', '+c1234567890', 'street, town, land', null, '2021-08-10 23:13:18', '2021-09-04 17:50:47');
INSERT INTO `users` VALUES ('10', 'cus3', '0', '$2y$10$kuiHsMhWtNxXssa37X.OEuHIweZed48yPf4Ml1IT5i6nE8N87UUAG', 'Customer 3', 'cus3@rmail.com', '+c1234567890', 'street, town, land', null, '2021-09-04 17:46:40', '2021-09-04 17:50:47');
