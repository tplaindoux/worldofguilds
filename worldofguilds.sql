/*
Navicat MySQL Data Transfer

Source Server         : wog.localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : worldofguilds

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-09-29 15:34:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `acl_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `acl_permissions`;
CREATE TABLE `acl_permissions` (
  `perm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `perm_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_role_perm`
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_perm`;
CREATE TABLE `acl_role_perm` (
  `role_id` int(10) unsigned NOT NULL,
  `perm_id` int(10) unsigned NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `perm_id` (`perm_id`),
  CONSTRAINT `acl_role_perm_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`role_id`),
  CONSTRAINT `acl_role_perm_ibfk_2` FOREIGN KEY (`perm_id`) REFERENCES `acl_permissions` (`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_role_perm
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_roles`
-- ----------------------------
DROP TABLE IF EXISTS `acl_roles`;
CREATE TABLE `acl_roles` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `acl_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `acl_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for `designs`
-- ----------------------------
DROP TABLE IF EXISTS `designs`;
CREATE TABLE `designs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_creator` mediumint(8) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `timestamp_creation` int(10) unsigned NOT NULL,
  `timestamp_edition` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '0 private, 1 shared, 2 buyable',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `download` int(10) unsigned DEFAULT '0' COMMENT 'Number of time the theme has been downloaded',
  PRIMARY KEY (`id`,`id_creator`,`name`),
  UNIQUE KEY `id` (`id`),
  KEY `ids` (`id_creator`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of designs
-- ----------------------------

-- ----------------------------
-- Table structure for `games`
-- ----------------------------
DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cat` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`id_cat`),
  UNIQUE KEY `ids` (`id`),
  KEY `cats` (`id_cat`),
  CONSTRAINT `cats` FOREIGN KEY (`id_cat`) REFERENCES `games_cat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of games
-- ----------------------------

-- ----------------------------
-- Table structure for `games_cat`
-- ----------------------------
DROP TABLE IF EXISTS `games_cat`;
CREATE TABLE `games_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`title`),
  UNIQUE KEY `ids` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of games_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `locales`
-- ----------------------------
DROP TABLE IF EXISTS `locales`;
CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(4) NOT NULL COMMENT 'fr,en or fr_FR, en_EN',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '0 disabled, 1 available',
  PRIMARY KEY (`id`,`locale`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of locales
-- ----------------------------
INSERT INTO `locales` VALUES ('1', 'fr', '');
INSERT INTO `locales` VALUES ('2', 'en', '');

-- ----------------------------
-- Table structure for `plans`
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` mediumtext,
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plans
-- ----------------------------

-- ----------------------------
-- Table structure for `slinks`
-- ----------------------------
DROP TABLE IF EXISTS `slinks`;
CREATE TABLE `slinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_website` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT 'Type of content. Ie: article,news,forum,post,blog..',
  `slink` varchar(255) NOT NULL COMMENT 'the called variable, will be triggered through url.',
  `redirect` varchar(255) NOT NULL COMMENT 'The redirection url',
  `counter` int(11) NOT NULL COMMENT 'Counter. Auto increment for each redirection',
  PRIMARY KEY (`id`,`id_website`),
  UNIQUE KEY `slink` (`slink`),
  KEY `id_website` (`id_website`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slinks
-- ----------------------------

-- ----------------------------
-- Table structure for `sponsors`
-- ----------------------------
DROP TABLE IF EXISTS `sponsors`;
CREATE TABLE `sponsors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_website` int(10) unsigned NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`,`id_user`,`id_website`),
  UNIQUE KEY `sponsor_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I don''t remember the purpose of this table. \r\n\r\n';

-- ----------------------------
-- Records of sponsors
-- ----------------------------

-- ----------------------------
-- Table structure for `titles`
-- ----------------------------
DROP TABLE IF EXISTS `titles`;
CREATE TABLE `titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `id_req_title` int(10) unsigned NOT NULL COMMENT 'The parent title',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL,
  `catalogue` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`,`title`),
  KEY `ids` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of titles
-- ----------------------------

-- ----------------------------
-- Table structure for `transactions`
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_website` int(10) unsigned NOT NULL,
  `timestamp_creation` int(11) NOT NULL,
  `timestamp_validate` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`id_user`,`id_website`),
  KEY `user` (`id_user`),
  KEY `transaction_id` (`id`),
  CONSTRAINT `user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transactions
-- ----------------------------

-- ----------------------------
-- Table structure for `user_follows`
-- ----------------------------
DROP TABLE IF EXISTS `user_follows`;
CREATE TABLE `user_follows` (
  `id_user` int(10) unsigned NOT NULL,
  `id_following` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_user`,`id_following`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_follows
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `email` varchar(120) NOT NULL,
  `pseudo` char(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_ip` varchar(100) NOT NULL,
  `creation_timestamp` varchar(250) NOT NULL,
  `activate_status` bit(1) NOT NULL,
  `activate_token` int(10) unsigned NOT NULL,
  `login_attempt` tinyint(3) unsigned NOT NULL,
  `birtday` date NOT NULL,
  `newsletter_wog` tinyint(3) unsigned NOT NULL,
  `newsletter_partners` tinyint(3) unsigned NOT NULL,
  `signature` mediumtext,
  `description` mediumtext,
  `local` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `points` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`,`login`,`email`,`pseudo`),
  UNIQUE KEY `id_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `users_friends`
-- ----------------------------
DROP TABLE IF EXISTS `users_friends`;
CREATE TABLE `users_friends` (
  `id_user` int(10) unsigned NOT NULL,
  `id_friend` int(10) unsigned NOT NULL,
  `timestamp_creation` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_user`,`id_friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_friends
-- ----------------------------

-- ----------------------------
-- Table structure for `users_games`
-- ----------------------------
DROP TABLE IF EXISTS `users_games`;
CREATE TABLE `users_games` (
  `id_user` int(10) unsigned NOT NULL,
  `id_game` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_user`,`id_game`),
  CONSTRAINT `ids` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_games
-- ----------------------------

-- ----------------------------
-- Table structure for `users_online`
-- ----------------------------
DROP TABLE IF EXISTS `users_online`;
CREATE TABLE `users_online` (
  `ip` int(10) unsigned NOT NULL COMMENT 'use the INET_ATON() and INET_NTOA() functions to return the IP address from its numeric value',
  `id_user` int(10) unsigned NOT NULL,
  `id_website` int(10) unsigned NOT NULL,
  `id_resource` int(10) unsigned DEFAULT NULL,
  `timestamp_last_action` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip`,`id_user`,`id_website`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_online
-- ----------------------------

-- ----------------------------
-- Table structure for `users_titles`
-- ----------------------------
DROP TABLE IF EXISTS `users_titles`;
CREATE TABLE `users_titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_title` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `id_website` int(10) unsigned NOT NULL,
  `timestamp_unlock` int(10) unsigned NOT NULL,
  `seen` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_title` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_titles
-- ----------------------------

-- ----------------------------
-- Table structure for `users_token`
-- ----------------------------
DROP TABLE IF EXISTS `users_token`;
CREATE TABLE `users_token` (
  `id_user` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_token
-- ----------------------------

-- ----------------------------
-- Table structure for `users_wallet`
-- ----------------------------
DROP TABLE IF EXISTS `users_wallet`;
CREATE TABLE `users_wallet` (
  `id_user` int(10) unsigned NOT NULL,
  `credits` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of users_wallet
-- ----------------------------

-- ----------------------------
-- Table structure for `website_designs`
-- ----------------------------
DROP TABLE IF EXISTS `website_designs`;
CREATE TABLE `website_designs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_design` int(10) unsigned NOT NULL,
  `id_website` int(10) unsigned NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  `master` bit(1) NOT NULL DEFAULT b'0' COMMENT '0 false, 1 true. Unique 1. ',
  PRIMARY KEY (`id`,`id_design`,`id_website`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_designs
-- ----------------------------

-- ----------------------------
-- Table structure for `website_users`
-- ----------------------------
DROP TABLE IF EXISTS `website_users`;
CREATE TABLE `website_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_website` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`id_user`),
  UNIQUE KEY `id` (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_users
-- ----------------------------

-- ----------------------------
-- Table structure for `websites`
-- ----------------------------
DROP TABLE IF EXISTS `websites`;
CREATE TABLE `websites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_creator` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned NOT NULL,
  `id_plan` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `name` varchar(250) NOT NULL,
  `link` varchar(80) NOT NULL,
  `credits` int(100) unsigned DEFAULT '0',
  `timestamp_plan` int(10) unsigned NOT NULL COMMENT 'Last time the plan was edited. Need a Trigger',
  `timestamp_creation` int(10) unsigned NOT NULL COMMENT 'Date of website creation',
  `timestamp_expiration` int(10) unsigned NOT NULL COMMENT 'Date of when the website plan will be revoqued if not renewed',
  `expiration_reminder` int(10) unsigned NOT NULL COMMENT 'Last time we sent a mail to remind the owner(s) to renew',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Website status: 1 - live, 2 - archived, 3 - frozen, 4-  private',
  `active_theme` int(10) unsigned NOT NULL COMMENT 'The current theme on the website.',
  PRIMARY KEY (`id`,`id_creator`,`id_owner`,`link`),
  UNIQUE KEY `id_website` (`id`),
  KEY `ids` (`id_creator`,`id_owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of websites
-- ----------------------------
