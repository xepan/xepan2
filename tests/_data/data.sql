/*
 Navicat Premium Data Transfer

 Source Server         : DO(Root)
 Source Server Type    : MariaDB
 Source Server Version : 100025
 Source Host           : epan.in
 Source Database       : demo

 Target Server Type    : MariaDB
 Target Server Version : 100025
 File Encoding         : utf-8

 Date: 08/16/2016 16:12:18 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `account_balance_sheet`
-- ----------------------------
DROP TABLE IF EXISTS `account_balance_sheet`;
CREATE TABLE `account_balance_sheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `positive_side` varchar(255) DEFAULT NULL,
  `report_name` varchar(25) DEFAULT NULL,
  `show_sub` varchar(255) DEFAULT NULL,
  `subtract_from` varchar(255) DEFAULT NULL,
  `order` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_group`
-- ----------------------------
DROP TABLE IF EXISTS `account_group`;
CREATE TABLE `account_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `balance_sheet_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `parent_group_id` int(11) DEFAULT NULL,
  `root_group_id` int(11) DEFAULT NULL,
  `path` text,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `balance_sheet_id` (`balance_sheet_id`) USING BTREE,
  KEY `parent_group_id` (`parent_group_id`) USING BTREE,
  KEY `root_group_id` (`root_group_id`) USING BTREE,
  FULLTEXT KEY `quick_search` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `account_transaction`;
CREATE TABLE `account_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `Narration` text,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` decimal(8,6) DEFAULT NULL,
  `related_id` bigint(20) DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `round_amount` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `transaction_type_id` (`transaction_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_transaction_row`
-- ----------------------------
DROP TABLE IF EXISTS `account_transaction_row`;
CREATE TABLE `account_transaction_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `ledger_id` int(11) DEFAULT NULL,
  `_amountDr` double DEFAULT NULL,
  `_amountCr` double DEFAULT NULL,
  `side` varchar(255) DEFAULT NULL,
  `accounts_in_side` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `transaction_id` (`transaction_id`) USING BTREE,
  KEY `ledger_id` (`ledger_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_transaction_types`
-- ----------------------------
DROP TABLE IF EXISTS `account_transaction_types`;
CREATE TABLE `account_transaction_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `FromAC` varchar(255) DEFAULT NULL,
  `ToAC` varchar(255) DEFAULT NULL,
  `Default_Narration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `acl`
-- ----------------------------
DROP TABLE IF EXISTS `acl`;
CREATE TABLE `acl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `action_allowed` text,
  `allow_add` tinyint(4) DEFAULT NULL,
  `namespace` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `post_id` (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `acl`
-- ----------------------------
BEGIN;
INSERT INTO `acl` VALUES ('212', '3', '2391', null, '[]', '1', 'xepan\\commerce'), ('213', '3', '2391', null, '[]', '1', 'xepan\\base'), ('214', '3', '2391', null, '[]', '1', 'xepan\\hr'), ('215', '3', '2391', null, '[]', '1', 'xepan\\projects'), ('216', '3', '2391', null, '[]', '1', 'xepan\\projects'), ('217', '3', '2391', null, '[]', '1', 'xepan\\commerce'), ('218', '3', '2391', null, '[]', '1', 'xepan\\marketing'), ('219', '3', '2391', 'Post', '[]', '1', 'xepan\\hr'), ('220', '3', '2391', 'Employee', '[]', '1', 'xepan\\hr');
COMMIT;

-- ----------------------------
--  Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `related_contact_id` int(11) DEFAULT NULL,
  `related_document_id` int(11) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `details` text,
  `created_at` datetime DEFAULT NULL,
  `notify_to` varchar(255) DEFAULT NULL,
  `notification` varchar(255) DEFAULT NULL,
  `document_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `contact_id` (`contact_id`) USING BTREE,
  KEY `related_contact_id` (`related_contact_id`) USING BTREE,
  KEY `related_document_id` (`related_document_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `activity`
-- ----------------------------
BEGIN;
INSERT INTO `activity` VALUES ('363', '3', '626', '626', null, 'Task Assigned', null, '2016-06-24 09:49:10', '[\"626\"]', 'Task Assigend to you : Base Application Documentation', null), ('364', '3', '626', '626', '291', 'Task Completed', null, '2016-06-24 09:49:19', '[\"626\"]', 'Task Completed : Base Application Documentation', null), ('365', '3', '626', '626', null, 'Task Assigned', null, '2016-06-24 09:50:33', '[\"626\"]', 'Task Assigend to you : Project Application Documentation', null);
COMMIT;

-- ----------------------------
--  Table structure for `affiliate`
-- ----------------------------
DROP TABLE IF EXISTS `affiliate`;
CREATE TABLE `affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `narration` text,
  `contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `application`
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT '',
  `user_installable` tinyint(4) DEFAULT '1',
  `default_currency_price` double(8,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `application`
-- ----------------------------
BEGIN;
INSERT INTO `application` VALUES ('11', 'communication', 'xepan\\communication', '1', null), ('12', 'hr', 'xepan\\hr', '1', null), ('13', 'projects', 'xepan\\projects', '1', null), ('14', 'marketing', 'xepan\\marketing', '1', null), ('15', 'accounts', 'xepan\\accounts', '1', null), ('16', 'commerce', 'xepan\\commerce', '1', null), ('17', 'production', 'xepan\\production', '1', null), ('18', 'crm', 'xepan\\crm', '1', null), ('19', 'cms', 'xepan\\cms', '1', null), ('20', 'blog', 'xepan\\blog', '1', null), ('21', 'epanservices', 'xepan\\epanservices', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `blog_post_id` int(11) NOT NULL,
  `comment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `blog_post`
-- ----------------------------
DROP TABLE IF EXISTS `blog_post`;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `anonymous_comment_config` varchar(255) DEFAULT NULL,
  `registered_comment_config` varchar(255) DEFAULT NULL,
  `show_comments` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `search_string` (`title`,`description`,`tag`,`meta_title`,`meta_description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `blog_post_category`
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_category`;
CREATE TABLE `blog_post_category` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `blog_post_category_association`
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_category_association`;
CREATE TABLE `blog_post_category_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_post_id` int(11) NOT NULL,
  `blog_post_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `campaign`
-- ----------------------------
DROP TABLE IF EXISTS `campaign`;
CREATE TABLE `campaign` (
  `document_id` int(11) NOT NULL,
  `schedule` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `starting_date` datetime NOT NULL,
  `ending_date` datetime NOT NULL,
  `campaign_type` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_id` (`document_id`),
  FULLTEXT KEY `search_string` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `campaign_category_association`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_category_association`;
CREATE TABLE `campaign_category_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_category_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_category_id` (`marketing_category_id`) USING BTREE,
  KEY `campaign_id` (`campaign_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `campaign_socialuser_association`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_socialuser_association`;
CREATE TABLE `campaign_socialuser_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialuser_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_user_id` (`socialuser_id`) USING BTREE,
  KEY `campaign_id` (`campaign_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_sequence` int(11) NOT NULL,
  `alt_text` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `custom_link` varchar(255) DEFAULT NULL,
  `cat_image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`),
  KEY `parent_category_id` (`parent_category_id`),
  KEY `cat_image_id` (`cat_image_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `category_item_association`
-- ----------------------------
DROP TABLE IF EXISTS `category_item_association`;
CREATE TABLE `category_item_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_document_id` (`item_id`,`category_id`),
  KEY `item_id` (`item_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cms_editors`
-- ----------------------------
DROP TABLE IF EXISTS `cms_editors`;
CREATE TABLE `cms_editors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `can_edit_template` tinyint(4) DEFAULT NULL,
  `can_edit_page_content` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_editors`
-- ----------------------------
BEGIN;
INSERT INTO `cms_editors` VALUES ('2', '11', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `communication_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_id` (`communication_id`) USING BTREE,
  KEY `ticket_id` (`ticket_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `communication`
-- ----------------------------
DROP TABLE IF EXISTS `communication`;
CREATE TABLE `communication` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mailbox` varchar(45) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `related_document_id` int(11) DEFAULT NULL,
  `from_raw` text,
  `to_raw` text,
  `cc_raw` text,
  `bcc_raw` text,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `communication_type` varchar(45) DEFAULT NULL,
  `flags` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `reply_to` varchar(255) DEFAULT NULL,
  `detailed` tinyint(4) DEFAULT NULL,
  `is_starred` tinyint(4) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `sent_on` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `extra_info` text,
  `type` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `related_document_id` (`related_document_id`) USING BTREE,
  FULLTEXT KEY `search_string` (`title`,`description`,`communication_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `communication_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `communication_attachment`;
CREATE TABLE `communication_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `communication_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_id` (`communication_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `communication_sms_setting`
-- ----------------------------
DROP TABLE IF EXISTS `communication_sms_setting`;
CREATE TABLE `communication_sms_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_url` varchar(255) DEFAULT NULL,
  `sms_username` varchar(255) DEFAULT NULL,
  `sms_password` varchar(255) DEFAULT NULL,
  `sms_user_name_qs_param` varchar(255) DEFAULT NULL,
  `sms_password_qs_param` varchar(255) DEFAULT NULL,
  `sms_number_qs_param` varchar(255) DEFAULT NULL,
  `sm_message_qs_param` varchar(255) DEFAULT NULL,
  `sms_prefix` varchar(255) DEFAULT NULL,
  `sms_postfix` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `pin_code` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `image_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `search_string` text,
  `source` varchar(255) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `image_id` (`image_id`) USING BTREE,
  FULLTEXT KEY `search_string` (`search_string`),
  CONSTRAINT `fk_epan_id` FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `contact`
-- ----------------------------
BEGIN;
INSERT INTO `contact` VALUES ('626', '3', 'Super', 'User', 'Employee', 'Active', null, null, null, null, null, null, null, null, null, '11', '2016-06-23 09:54:14', '2016-06-24 09:51:47', '0', '   365  2016-06-23      Super User', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `contact_info`
-- ----------------------------
DROP TABLE IF EXISTS `contact_info`;
CREATE TABLE `contact_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `head` varchar(45) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_valid` tinyint(4) DEFAULT '1',
  `type` varchar(45) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `content`
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_255` text NOT NULL,
  `title` text NOT NULL,
  `document_id` int(11) NOT NULL,
  `marketing_category_id` int(11) NOT NULL,
  `is_template` tinyint(1) NOT NULL,
  `message_3000` text NOT NULL,
  `message_blog` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `message_160` text NOT NULL,
  `content_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `marketing_category_id` (`marketing_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `content`
-- ----------------------------
BEGIN;
INSERT INTO `content` VALUES ('40', 'No Content', 'Empty', '2393', '2392', '0', '', 'No Content', 'xavoc.com', '', null);
COMMIT;

-- ----------------------------
--  Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `iso_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `document_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integer_part` varchar(255) DEFAULT NULL,
  `fractional_part` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1817 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `currency`
-- ----------------------------
BEGIN;
INSERT INTO `currency` VALUES ('2394', null, 'Default Currency', '1', '1816', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `custom_account_entries_templates`
-- ----------------------------
DROP TABLE IF EXISTS `custom_account_entries_templates`;
CREATE TABLE `custom_account_entries_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `detail` text,
  `is_favourite_menu_lister` tinyint(4) DEFAULT NULL,
  `is_merge_transaction` tinyint(4) DEFAULT NULL,
  `unique_trnasaction_template_code` varchar(255) DEFAULT NULL,
  `is_system_default` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `custom_account_entries_templates_transaction_row`
-- ----------------------------
DROP TABLE IF EXISTS `custom_account_entries_templates_transaction_row`;
CREATE TABLE `custom_account_entries_templates_transaction_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `side` varchar(255) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `is_include_subgroup_ledger_account` tinyint(4) DEFAULT NULL,
  `parent_group` varchar(255) DEFAULT NULL,
  `ledger` varchar(255) DEFAULT NULL,
  `is_ledger_changable` tinyint(4) DEFAULT NULL,
  `is_allow_add_ledger` tinyint(4) DEFAULT NULL,
  `is_include_currency` tinyint(4) DEFAULT NULL,
  `template_transaction_id` int(11) DEFAULT NULL,
  `balance_sheet` varchar(255) DEFAULT NULL,
  `ledger_type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `custom_account_entries_templates_transactions`
-- ----------------------------
DROP TABLE IF EXISTS `custom_account_entries_templates_transactions`;
CREATE TABLE `custom_account_entries_templates_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `custom_form`
-- ----------------------------
DROP TABLE IF EXISTS `custom_form`;
CREATE TABLE `custom_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `submit_button_name` varchar(255) DEFAULT NULL,
  `form_layout` varchar(255) DEFAULT NULL,
  `custom_form_layout_path` varchar(255) DEFAULT NULL,
  `recieve_email` tinyint(4) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `auto_reply` tinyint(4) DEFAULT NULL,
  `message_body` text,
  `email_subject` text,
  `emailsetting_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `custom_form_field`
-- ----------------------------
DROP TABLE IF EXISTS `custom_form_field`;
CREATE TABLE `custom_form_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_form_id` int(11) DEFAULT NULL,
  `value` text,
  `is_mandatory` tinyint(4) DEFAULT NULL,
  `hint` text,
  `placeholder` text,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `auto_reply` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `custom_form_submission`
-- ----------------------------
DROP TABLE IF EXISTS `custom_form_submission`;
CREATE TABLE `custom_form_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_form_id` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `contact_id` int(11) NOT NULL,
  `billing_address` varchar(255) DEFAULT '',
  `billing_city` varchar(45) DEFAULT NULL,
  `billing_state_id` int(11) DEFAULT NULL,
  `billing_country_id` int(11) DEFAULT NULL,
  `billing_pincode` varchar(45) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT '',
  `shipping_city` varchar(45) DEFAULT NULL,
  `shipping_state_id` int(11) DEFAULT NULL,
  `shipping_country_id` int(11) DEFAULT NULL,
  `shipping_pincode` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tin_no` varchar(255) DEFAULT '',
  `pan_no` varchar(255) DEFAULT '',
  `currency_id` int(11) DEFAULT NULL,
  `same_as_billing_address` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`),
  KEY `currency_id` (`currency_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customfield_association`
-- ----------------------------
DROP TABLE IF EXISTS `customfield_association`;
CREATE TABLE `customfield_association` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `customfield_generic_id` int(11) DEFAULT NULL,
  `can_effect_stock` tinyint(4) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE,
  KEY `customfield_generic_id` (`customfield_generic_id`) USING BTREE,
  KEY `department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customfield_generic`
-- ----------------------------
DROP TABLE IF EXISTS `customfield_generic`;
CREATE TABLE `customfield_generic` (
  `name` varchar(255) NOT NULL,
  `display_type` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sequence_order` int(11) DEFAULT NULL,
  `is_filterable` tinyint(4) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sequence_order` (`sequence_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `customfield_value`
-- ----------------------------
DROP TABLE IF EXISTS `customfield_value`;
CREATE TABLE `customfield_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `customfield_association_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `highlight_it` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemcustomassociation_id` (`customfield_association_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `document_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `production_level` int(11) DEFAULT NULL,
  `is_system` tinyint(4) DEFAULT '0',
  `is_outsourced` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `department`
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES ('2390', 'Company', '1', '1', '0', '36');
COMMIT;

-- ----------------------------
--  Table structure for `designer_image_category`
-- ----------------------------
DROP TABLE IF EXISTS `designer_image_category`;
CREATE TABLE `designer_image_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_library` tinyint(4) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`) USING BTREE,
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `designer_images`
-- ----------------------------
DROP TABLE IF EXISTS `designer_images`;
CREATE TABLE `designer_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designer_category_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `designer_category_id` (`designer_category_id`) USING BTREE,
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `discount_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `discount_voucher`;
CREATE TABLE `discount_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `updated_by_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `no_of_person` int(11) NOT NULL,
  `one_user_how_many_time` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `on_category_id` int(11) DEFAULT NULL,
  `on` varchar(255) DEFAULT NULL,
  `include_sub_category` tinyint(4) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `based_on` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `discount_voucher_condition`
-- ----------------------------
DROP TABLE IF EXISTS `discount_voucher_condition`;
CREATE TABLE `discount_voucher_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountvoucher_id` int(11) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `discount_voucher_used`
-- ----------------------------
DROP TABLE IF EXISTS `discount_voucher_used`;
CREATE TABLE `discount_voucher_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qsp_master_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `discountvoucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `sub_type` varchar(45) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `search_string` text,
  PRIMARY KEY (`id`),
  KEY `fk_document_epan1_idx` (`epan_id`),
  FULLTEXT KEY `search_string` (`search_string`),
  CONSTRAINT `fk_document_epan1` FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2395 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `document`
-- ----------------------------
BEGIN;
INSERT INTO `document` VALUES ('2390', '3', 'Department', null, null, '2016-06-23 09:54:14', null, '2016-06-23 09:54:14', 'Active', '  Company'), ('2391', '3', 'Post', null, null, '2016-06-23 09:54:14', null, '2016-06-23 09:54:14', 'Active', '  CEO  '), ('2392', '3', 'MarketingCategory', null, null, '2016-06-23 09:54:14', null, '2016-06-23 09:54:14', null, '  default MarketingCategory '), ('2393', '3', 'Newsletter', null, null, '2016-06-23 09:54:14', null, '2016-06-23 09:54:14', 'Draft', '  Empty Newsletter No Content No Content Draft'), ('2394', '3', 'Currency', null, null, '2016-06-23 09:54:14', null, '2016-06-23 09:54:14', 'Active', '  Default Currency Currency Active');
COMMIT;

-- ----------------------------
--  Table structure for `emails`
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `emailsetting`
-- ----------------------------
DROP TABLE IF EXISTS `emailsetting`;
CREATE TABLE `emailsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `email_transport` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `email_host` varchar(255) DEFAULT NULL,
  `email_port` varchar(244) DEFAULT NULL,
  `email_username` varchar(255) DEFAULT NULL,
  `email_password` varchar(255) DEFAULT NULL,
  `email_reply_to` varchar(255) DEFAULT NULL,
  `email_reply_to_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `smtp_auto_reconnect` int(11) DEFAULT NULL,
  `email_threshold` int(11) DEFAULT NULL,
  `emails_in_BCC` int(11) DEFAULT NULL,
  `last_emailed_at` date DEFAULT NULL,
  `email_sent_in_this_minute` int(11) DEFAULT NULL,
  `bounce_imap_email_host` varchar(255) DEFAULT NULL,
  `bounce_imap_email_port` varchar(255) DEFAULT NULL,
  `return_path` varchar(255) DEFAULT NULL,
  `bounce_imap_email_password` varchar(255) DEFAULT NULL,
  `bounce_imap_flags` varchar(255) DEFAULT NULL,
  `is_support_email` tinyint(4) DEFAULT NULL,
  `imap_email_host` varchar(255) DEFAULT NULL,
  `imap_email_port` varchar(255) DEFAULT NULL,
  `imap_email_username` varchar(255) DEFAULT NULL,
  `imap_email_password` varchar(255) DEFAULT NULL,
  `imap_flags` varchar(255) DEFAULT NULL,
  `auto_reply` tinyint(4) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_body` longtext,
  `denied_email_subject` varchar(255) DEFAULT NULL,
  `denied_email_body` text,
  `footer` text,
  `is_imap_enabled` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mass_mail` tinyint(4) unsigned DEFAULT NULL,
  `signature` text,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `contact_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `notified_till` int(11) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_date` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `contract_date` date DEFAULT NULL,
  `leaving_date` date DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_employee_contact1_idx` (`contact_id`),
  KEY `fk_employee_post1_idx` (`post_id`),
  KEY `department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `employee`
-- ----------------------------
BEGIN;
INSERT INTO `employee` VALUES ('626', '2391', '2390', '365', '23', null, '2016-06-23', null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `employee_documents`
-- ----------------------------
DROP TABLE IF EXISTS `employee_documents`;
CREATE TABLE `employee_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `employee_document_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_document_id` (`employee_document_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `employee_movement`
-- ----------------------------
DROP TABLE IF EXISTS `employee_movement`;
CREATE TABLE `employee_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `narration` text,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `employee_movement`
-- ----------------------------
BEGIN;
INSERT INTO `employee_movement` VALUES ('248', '626', '2016-06-23 10:05:18', 'Attandance', 'In', null, null), ('249', '626', '2016-06-24 03:52:01', 'Attandance', 'In', null, null), ('250', '626', '2016-06-28 09:22:10', 'Attandance', 'In', null, null), ('251', '626', '2016-06-29 12:56:50', 'Attandance', 'In', null, null), ('252', '626', '2016-08-05 08:23:40', 'Attandance', 'In', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `epan`
-- ----------------------------
DROP TABLE IF EXISTS `epan`;
CREATE TABLE `epan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `xepan_template_id` int(11) DEFAULT NULL,
  `valid_till` datetime DEFAULT NULL,
  `is_published` varchar(255) DEFAULT NULL,
  `extra_info` text,
  `aliases` text,
  `epan_dbversion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_category_id` (`epan_category_id`),
  CONSTRAINT `fk_epan_category_id` FOREIGN KEY (`epan_category_id`) REFERENCES `epan_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `epan`
-- ----------------------------
BEGIN;
INSERT INTO `epan` VALUES ('3', '2', 'demo', 'Trial', null, '2016-06-23 09:54:14', 'Epan', null, null, null, null, null, '3');
COMMIT;

-- ----------------------------
--  Table structure for `epan_category`
-- ----------------------------
DROP TABLE IF EXISTS `epan_category`;
CREATE TABLE `epan_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `epan_category`
-- ----------------------------
BEGIN;
INSERT INTO `epan_category` VALUES ('2', 'default');
COMMIT;

-- ----------------------------
--  Table structure for `epan_config`
-- ----------------------------
DROP TABLE IF EXISTS `epan_config`;
CREATE TABLE `epan_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `value` longtext,
  `application` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `epan_config`
-- ----------------------------
BEGIN;
INSERT INTO `epan_config` VALUES ('25', '3', 'RESET_PASSWORD_SUBJECT_FOR_ADMIN', 'Password Reset Request', 'communication'), ('26', '3', 'RESET_PASSWORD_BODY_FOR_ADMIN', '<style type=\"text/css\">\n  <!--\n  /* CLIENT-SPECIFIC STYLES */\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\n  /* RESET STYLES */\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\n  table{border-collapse: collapse !important;}\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\n  /* iOS BLUE LINKS */\n  a[x-apple-data-detectors] {\n  color: inherit !important;\n  text-decoration: none !important;\n  font-size: inherit !important;\n  font-family: inherit !important;\n  font-weight: inherit !important;\n  line-height: inherit !important;\n  }\n  /* MOBILE STYLES */\n  @media screen and (max-width: 525px) {\n  /* ALLOWS FOR FLUID TABLES */\n  .wrapper {\n  width: 100% !important;\n  max-width: 100% !important;\n  }\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\n  .logo img {\n  margin: 0 auto !important;\n  }\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\n  .mobile-hide {\n  display: none !important;\n  }\n  .img-max {\n  max-width: 100% !important;\n  width: 100% !important;\n  height: auto !important;\n  }\n  /* FULL-WIDTH TABLES */\n  .responsive-table {\n  width: 100% !important;\n  }\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\n  .padding {\n  padding: 10px 5% 15px 5% !important;\n  }\n  .padding-meta {\n  padding: 30px 5% 0px 5% !important;\n  text-align: center;\n  }\n  .padding-copy {\n  padding: 10px 5% 10px 5% !important;\n  text-align: center;\n  }\n  .no-padding {\n  padding: 0 !important;\n  }\n  .section-padding {\n  padding: 50px 15px 50px 15px !important;\n  }\n  /* ADJUST BUTTONS ON MOBILE */\n  .mobile-button-container {\n  margin: 0 auto;\n  width: 100% !important;\n  }\n  .mobile-button {\n  padding: 15px !important;\n  border: 0 !important;\n  font-size: 16px !important;\n  display: block !important;\n  }\n  }\n  /* ANDROID CENTER FIX */\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\n  -->\n</style>\n<!--if gte mso 12\nstyle(type=\'text/css\').\n  .mso-right {\n  padding-left: 20px;\n  }\n-->\n<!-- HIDDEN PREHEADER TEXT-->\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"></div>\n<!-- HEADER-->\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n  <tbody>\n    <tr style=\"height: 165px;\">\n      <td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <table style=\"max-width: 500px;\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapper\">\n          <tbody>\n            <tr>\n              <td style=\"padding: 15px 0;\" align=\"center\" valign=\"top\" class=\"logo\"><a href=\"http://litmus.com\" target=\"_blank\"><img caption=\"false\" alt=\"Logo\" src=\"blob:http://192.168.1.101/da82434c-a7ab-4271-b88d-42173fb7e58e\" style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" border=\"0\" height=\"120\" width=\"180\"/></a></td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n    <tr style=\"height: 10px;\">\n      <td style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\" class=\"section-padding\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td>\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                  <tbody>\n                    <tr>\n                      <td>\n                        <!-- COPY-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\" class=\"padding-copy\">Password Reset Request</td>\n                            </tr>\n                            <tr>\n                              <td style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\" class=\"padding-copy\">{$username},<br/>We received a request to reset the password for your account.<br/>Here\'s a one-time login link for you to use to access your account and set a new password. Click on the below button to proceed.  <br/>This link will expire after a day and nothing will happen if it\'s not used.<br/>See you!</td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td align=\"center\">\n                        <!-- BULLETPROOF BUTTON-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"padding-top: 25px;\" align=\"center\" class=\"padding\">\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile-button-container\">\n                                  <tbody>\n                                    <tr>\n                                      <td style=\"border-radius: 3px;\" align=\"center\" bgcolor=\"#256F9C\"><a href=\"{$url}\" target=\"_blank\" style=\"font-size: 16px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; border-radius: 3px; padding: 15px 25px; border: 1px solid #256F9C; display: inline-block;\" class=\"mobile-button\">Click Here →</a></td>\n                                    </tr>\n                                  </tbody>\n                                </table>\n                              </td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                  </tbody>\n                </table>\n              </td>\n            </tr>\n          </tbody>\n        </table>\n      </td>\n    </tr>\n    <tr style=\"height: 20px;\">\n      <td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <!-- UNSUBSCRIBE COPY-->\n        <table style=\"max-width: 500px;\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801,  +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.in\">info@epan.in</a><br/>A Xavoc Technocrats Pvt. Ltd. Product</td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n  </tbody>\n</table>', 'communication'), ('27', '3', 'UPDATE_PASSWORD_SUBJECT_FOR_ADMIN', 'Password Update', 'communication'), ('28', '3', 'UPDATE_PASSWORD_BODY_FOR_ADMIN', '<style type=\"text/css\">\n  <!--\n  /* CLIENT-SPECIFIC STYLES */\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\n  /* RESET STYLES */\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\n  table{border-collapse: collapse !important;}\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\n  /* iOS BLUE LINKS */\n  a[x-apple-data-detectors] {\n  color: inherit !important;\n  text-decoration: none !important;\n  font-size: inherit !important;\n  font-family: inherit !important;\n  font-weight: inherit !important;\n  line-height: inherit !important;\n  }\n  /* MOBILE STYLES */\n  @media screen and (max-width: 525px) {\n  /* ALLOWS FOR FLUID TABLES */\n  .wrapper {\n  width: 100% !important;\n  max-width: 100% !important;\n  }\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\n  .logo img {\n  margin: 0 auto !important;\n  }\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\n  .mobile-hide {\n  display: none !important;\n  }\n  .img-max {\n  max-width: 100% !important;\n  width: 100% !important;\n  height: auto !important;\n  }\n  /* FULL-WIDTH TABLES */\n  .responsive-table {\n  width: 100% !important;\n  }\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\n  .padding {\n  padding: 10px 5% 15px 5% !important;\n  }\n  .padding-meta {\n  padding: 30px 5% 0px 5% !important;\n  text-align: center;\n  }\n  .padding-copy {\n  padding: 10px 5% 10px 5% !important;\n  text-align: center;\n  }\n  .no-padding {\n  padding: 0 !important;\n  }\n  .section-padding {\n  padding: 50px 15px 50px 15px !important;\n  }\n  /* ADJUST BUTTONS ON MOBILE */\n  .mobile-button-container {\n  margin: 0 auto;\n  width: 100% !important;\n  }\n  .mobile-button {\n  padding: 15px !important;\n  border: 0 !important;\n  font-size: 16px !important;\n  display: block !important;\n  }\n  }\n  /* ANDROID CENTER FIX */\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\n  -->\n</style>\n<!--if gte mso 12\nstyle(type=\'text/css\').\n  .mso-right {\n  padding-left: 20px;\n  }\n-->\n<!-- HIDDEN PREHEADER TEXT-->\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"></div>\n<!-- HEADER-->\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n  <tbody>\n    <tr style=\"height: 165px;\">\n      <td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <table style=\"max-width: 500px;\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapper\">\n          <tbody>\n            <tr>\n              <td style=\"padding: 15px 0;\" align=\"center\" valign=\"top\" class=\"logo\"><a href=\"http://litmus.com\" target=\"_blank\"><img caption=\"false\" alt=\"Logo\" src=\"blob:http://192.168.1.101/da82434c-a7ab-4271-b88d-42173fb7e58e\" style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" border=\"0\" height=\"120\" width=\"180\"/></a></td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n    <tr style=\"height: 10px;\">\n      <td style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\" class=\"section-padding\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td>\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                  <tbody>\n                    <tr>\n                      <td>\n                        <!-- COPY-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\" class=\"padding-copy\">Password Updated</td>\n                            </tr>\n                            <tr>\n                              <td style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\" class=\"padding-copy\">Hi {$username},<br/>Your password has been successfully updated.<br/>If you are not the person who changed the password, please report it<br/>to superuser/authority and make sure to reset your password again.<br/><strong>Note: Don\'t share your password with anybody.</strong><br/><br/>Greetings!</td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td align=\"center\">\n                        <!-- BULLETPROOF BUTTON-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"padding-top: 25px;\" align=\"center\" class=\"padding\"></td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                  </tbody>\n                </table>\n              </td>\n            </tr>\n          </tbody>\n        </table>\n      </td>\n    </tr>\n    <tr style=\"height: 20px;\">\n      <td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <!-- UNSUBSCRIBE COPY-->\n        <table style=\"max-width: 500px;\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801,  +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.in\">info@epan.in</a><br/>A Xavoc Technocrats Pvt. Ltd. Product</td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n  </tbody>\n</table>', 'communication'), ('29', '3', 'REGISTRATION_TYPE', 'self_activated', 'communication'), ('30', '3', 'REGISTRATION_SUBJECT', 'Registration mail', 'base'), ('31', '3', 'REGISTRATION_BODY', '<style type=\"text/css\">\n  <!--\n  /* CLIENT-SPECIFIC STYLES */\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\n  /* RESET STYLES */\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\n  table{border-collapse: collapse !important;}\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\n  /* iOS BLUE LINKS */\n  a[x-apple-data-detectors] {\n  color: inherit !important;\n  text-decoration: none !important;\n  font-size: inherit !important;\n  font-family: inherit !important;\n  font-weight: inherit !important;\n  line-height: inherit !important;\n  }\n  /* MOBILE STYLES */\n  @media screen and (max-width: 525px) {\n  /* ALLOWS FOR FLUID TABLES */\n  .wrapper {\n  width: 100% !important;\n  max-width: 100% !important;\n  }\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\n  .logo img {\n  margin: 0 auto !important;\n  }\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\n  .mobile-hide {\n  display: none !important;\n  }\n  .img-max {\n  max-width: 100% !important;\n  width: 100% !important;\n  height: auto !important;\n  }\n  /* FULL-WIDTH TABLES */\n  .responsive-table {\n  width: 100% !important;\n  }\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\n  .padding {\n  padding: 10px 5% 15px 5% !important;\n  }\n  .padding-meta {\n  padding: 30px 5% 0px 5% !important;\n  text-align: center;\n  }\n  .padding-copy {\n  padding: 10px 5% 10px 5% !important;\n  text-align: center;\n  }\n  .no-padding {\n  padding: 0 !important;\n  }\n  .section-padding {\n  padding: 50px 15px 50px 15px !important;\n  }\n  /* ADJUST BUTTONS ON MOBILE */\n  .mobile-button-container {\n  margin: 0 auto;\n  width: 100% !important;\n  }\n  .mobile-button {\n  padding: 15px !important;\n  border: 0 !important;\n  font-size: 16px !important;\n  display: block !important;\n  }\n  }\n  /* ANDROID CENTER FIX */\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\n  -->\n</style>\n<!--if gte mso 12\nstyle(type=\'text/css\').\n  .mso-right {\n  padding-left: 20px;\n  }\n-->\n<!-- HIDDEN PREHEADER TEXT-->\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"></div>\n<!-- HEADER-->\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n  <tbody>\n    <tr style=\"height: 165px;\">\n      <td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <table style=\"max-width: 500px;\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapper\">\n          <tbody>\n            <tr>\n              <td style=\"padding: 15px 0;\" align=\"center\" valign=\"top\" class=\"logo\"><a href=\"http://litmus.com\" target=\"_blank\"><img caption=\"false\" alt=\"Logo\" src=\"blob:http://192.168.1.101/c55f4326-1714-47eb-9fd0-2f47ee8cf798\" style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" border=\"0\" height=\"120\" width=\"180\"/></a></td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n    <tr style=\"height: 10px;\">\n      <td style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\" class=\"section-padding\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td>\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                  <tbody>\n                    <tr>\n                      <td>\n                        <!-- COPY-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\" class=\"padding-copy\">It\'s Great To Have You</td>\n                            </tr>\n                            <tr>\n                              <td style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\" class=\"padding-copy\">Dear member,<br/>Thank you for registering. {$email_id}! It’s great to have you in the community.<br/>Before you can take advantage of all the great features your account comes with, you’ll need to verify your email address. <br/>Click the button below to verify your email and experience the best.</td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td align=\"center\">\n                        <!-- BULLETPROOF BUTTON-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"padding-top: 25px;\" align=\"center\" class=\"padding\">\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile-button-container\">\n                                  <tbody>\n                                    <tr>\n                                      <td style=\"border-radius: 3px;\" align=\"center\" bgcolor=\"#256F9C\"><a href=\"{$url}\" target=\"_blank\" style=\"font-size: 16px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; border-radius: 3px; padding: 15px 25px; border: 1px solid #256F9C; display: inline-block;\" class=\"mobile-button\">Click Here →</a></td>\n                                    </tr>\n                                  </tbody>\n                                </table>\n                              </td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                  </tbody>\n                </table>\n              </td>\n            </tr>\n          </tbody>\n        </table>\n      </td>\n    </tr>\n    <tr style=\"height: 20px;\">\n      <td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <!-- UNSUBSCRIBE COPY-->\n        <table style=\"max-width: 500px;\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801,  +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.i\">info@epan.in</a><br/>A Xavoc Technocrats Pvt. Ltd. Product</td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n  </tbody>\n</table>', 'base'), ('32', '3', 'RESET_PASSWORD_SUBJECT', 'Reset password', 'communication'), ('33', '3', 'RESET_PASSWORD_BODY', '<style type=\"text/css\">\n  <!--\n  /* CLIENT-SPECIFIC STYLES */\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\n  /* RESET STYLES */\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\n  table{border-collapse: collapse !important;}\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\n  /* iOS BLUE LINKS */\n  a[x-apple-data-detectors] {\n  color: inherit !important;\n  text-decoration: none !important;\n  font-size: inherit !important;\n  font-family: inherit !important;\n  font-weight: inherit !important;\n  line-height: inherit !important;\n  }\n  /* MOBILE STYLES */\n  @media screen and (max-width: 525px) {\n  /* ALLOWS FOR FLUID TABLES */\n  .wrapper {\n  width: 100% !important;\n  max-width: 100% !important;\n  }\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\n  .logo img {\n  margin: 0 auto !important;\n  }\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\n  .mobile-hide {\n  display: none !important;\n  }\n  .img-max {\n  max-width: 100% !important;\n  width: 100% !important;\n  height: auto !important;\n  }\n  /* FULL-WIDTH TABLES */\n  .responsive-table {\n  width: 100% !important;\n  }\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\n  .padding {\n  padding: 10px 5% 15px 5% !important;\n  }\n  .padding-meta {\n  padding: 30px 5% 0px 5% !important;\n  text-align: center;\n  }\n  .padding-copy {\n  padding: 10px 5% 10px 5% !important;\n  text-align: center;\n  }\n  .no-padding {\n  padding: 0 !important;\n  }\n  .section-padding {\n  padding: 50px 15px 50px 15px !important;\n  }\n  /* ADJUST BUTTONS ON MOBILE */\n  .mobile-button-container {\n  margin: 0 auto;\n  width: 100% !important;\n  }\n  .mobile-button {\n  padding: 15px !important;\n  border: 0 !important;\n  font-size: 16px !important;\n  display: block !important;\n  }\n  }\n  /* ANDROID CENTER FIX */\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\n  -->\n</style>\n<!--if gte mso 12\nstyle(type=\'text/css\').\n  .mso-right {\n  padding-left: 20px;\n  }\n-->\n<!-- HIDDEN PREHEADER TEXT-->\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"></div>\n<!-- HEADER-->\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n  <tbody>\n    <tr style=\"height: 165px;\">\n      <td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <table style=\"max-width: 500px;\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapper\">\n          <tbody>\n            <tr>\n              <td style=\"padding: 15px 0;\" align=\"center\" valign=\"top\" class=\"logo\"><a href=\"http://litmus.com\" target=\"_blank\"><img caption=\"false\" alt=\"Logo\" src=\"blob:http://192.168.1.101/da82434c-a7ab-4271-b88d-42173fb7e58e\" style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" border=\"0\" height=\"120\" width=\"180\"/></a></td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n    <tr style=\"height: 10px;\">\n      <td style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\" class=\"section-padding\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td>\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                  <tbody>\n                    <tr>\n                      <td>\n                        <!-- COPY-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\" class=\"padding-copy\">Password Reset Request</td>\n                            </tr>\n                            <tr>\n                              <td style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\" class=\"padding-copy\">{$username},<br/>We received a request to reset the password for your account.<br/>Here\'s a one-time login link for you to use to access your account and set a new password. Click on the below button to proceed.  <br/>This link will expire after a day and nothing will happen if it\'s not used.<br/>See you!</td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td align=\"center\">\n                        <!-- BULLETPROOF BUTTON-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"padding-top: 25px;\" align=\"center\" class=\"padding\">\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"mobile-button-container\">\n                                  <tbody>\n                                    <tr>\n                                      <td style=\"border-radius: 3px;\" align=\"center\" bgcolor=\"#256F9C\"><a href=\"{$url}\" target=\"_blank\" style=\"font-size: 16px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; border-radius: 3px; padding: 15px 25px; border: 1px solid #256F9C; display: inline-block;\" class=\"mobile-button\">Click Here →</a></td>\n                                    </tr>\n                                  </tbody>\n                                </table>\n                              </td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                  </tbody>\n                </table>\n              </td>\n            </tr>\n          </tbody>\n        </table>\n      </td>\n    </tr>\n    <tr style=\"height: 20px;\">\n      <td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <!-- UNSUBSCRIBE COPY-->\n        <table style=\"max-width: 500px;\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801,  +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.i\">info@epan.in</a><br/>A Xavoc Technocrats Pvt. Ltd. Product</td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n  </tbody>\n</table>', 'communication'), ('34', '3', 'VERIFICATIONE_MAIL_SUBJECT', 'Account validated', 'communication'), ('35', '3', 'VERIFICATIONE_MAIL_BODY', '<style type=\"text/css\">\n  <!--\n  /* CLIENT-SPECIFIC STYLES */\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\n  /* RESET STYLES */\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\n  table{border-collapse: collapse !important;}\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\n  /* iOS BLUE LINKS */\n  a[x-apple-data-detectors] {\n  color: inherit !important;\n  text-decoration: none !important;\n  font-size: inherit !important;\n  font-family: inherit !important;\n  font-weight: inherit !important;\n  line-height: inherit !important;\n  }\n  /* MOBILE STYLES */\n  @media screen and (max-width: 525px) {\n  /* ALLOWS FOR FLUID TABLES */\n  .wrapper {\n  width: 100% !important;\n  max-width: 100% !important;\n  }\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\n  .logo img {\n  margin: 0 auto !important;\n  }\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\n  .mobile-hide {\n  display: none !important;\n  }\n  .img-max {\n  max-width: 100% !important;\n  width: 100% !important;\n  height: auto !important;\n  }\n  /* FULL-WIDTH TABLES */\n  .responsive-table {\n  width: 100% !important;\n  }\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\n  .padding {\n  padding: 10px 5% 15px 5% !important;\n  }\n  .padding-meta {\n  padding: 30px 5% 0px 5% !important;\n  text-align: center;\n  }\n  .padding-copy {\n  padding: 10px 5% 10px 5% !important;\n  text-align: center;\n  }\n  .no-padding {\n  padding: 0 !important;\n  }\n  .section-padding {\n  padding: 50px 15px 50px 15px !important;\n  }\n  /* ADJUST BUTTONS ON MOBILE */\n  .mobile-button-container {\n  margin: 0 auto;\n  width: 100% !important;\n  }\n  .mobile-button {\n  padding: 15px !important;\n  border: 0 !important;\n  font-size: 16px !important;\n  display: block !important;\n  }\n  }\n  /* ANDROID CENTER FIX */\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\n  -->\n</style>\n<!--if gte mso 12\nstyle(type=\'text/css\').\n  .mso-right {\n  padding-left: 20px;\n  }\n-->\n<!-- HIDDEN PREHEADER TEXT-->\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"></div>\n<!-- HEADER-->\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n  <tbody>\n    <tr style=\"height: 165px;\">\n      <td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <table style=\"max-width: 500px;\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapper\">\n          <tbody>\n            <tr>\n              <td style=\"padding: 15px 0;\" align=\"center\" valign=\"top\" class=\"logo\"><a href=\"http://litmus.com\" target=\"_blank\"><img caption=\"false\" alt=\"Logo\" src=\"blob:http://192.168.1.101/da82434c-a7ab-4271-b88d-42173fb7e58e\" style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" border=\"0\" height=\"120\" width=\"180\"/></a></td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n    <tr style=\"height: 10px;\">\n      <td style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\" class=\"section-padding\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td>\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                  <tbody>\n                    <tr>\n                      <td>\n                        <!-- COPY-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\" class=\"padding-copy\">Account Validated</td>\n                            </tr>\n                            <tr>\n                              <td style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\" class=\"padding-copy\">{$username},<br/>Your account has been successfully validated.<br/>Now you can enjoy the services by just logging in your account.<br/>Don\'t forgot to try before you buy a service ! We provide <strong>14 day free</strong><strong>trial.<br/></strong><br/>Greetings!</td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td align=\"center\">\n                        <!-- BULLETPROOF BUTTON-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"padding-top: 25px;\" align=\"center\" class=\"padding\"></td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                  </tbody>\n                </table>\n              </td>\n            </tr>\n          </tbody>\n        </table>\n      </td>\n    </tr>\n    <tr style=\"height: 20px;\">\n      <td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <!-- UNSUBSCRIBE COPY-->\n        <table style=\"max-width: 500px;\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801,  +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.in\">info@epan.in</a><br/>A Xavoc Technocrats Pvt. Ltd. Product</td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n  </tbody>\n</table>', 'communication'), ('36', '3', 'UPDATE_PASSWORD_SUBJECT', 'Password updated', 'communication'), ('37', '3', 'UPDATE_PASSWORD_BODY', '<style type=\"text/css\">\n  <!--\n  /* CLIENT-SPECIFIC STYLES */\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\n  /* RESET STYLES */\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\n  table{border-collapse: collapse !important;}\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\n  /* iOS BLUE LINKS */\n  a[x-apple-data-detectors] {\n  color: inherit !important;\n  text-decoration: none !important;\n  font-size: inherit !important;\n  font-family: inherit !important;\n  font-weight: inherit !important;\n  line-height: inherit !important;\n  }\n  /* MOBILE STYLES */\n  @media screen and (max-width: 525px) {\n  /* ALLOWS FOR FLUID TABLES */\n  .wrapper {\n  width: 100% !important;\n  max-width: 100% !important;\n  }\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\n  .logo img {\n  margin: 0 auto !important;\n  }\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\n  .mobile-hide {\n  display: none !important;\n  }\n  .img-max {\n  max-width: 100% !important;\n  width: 100% !important;\n  height: auto !important;\n  }\n  /* FULL-WIDTH TABLES */\n  .responsive-table {\n  width: 100% !important;\n  }\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\n  .padding {\n  padding: 10px 5% 15px 5% !important;\n  }\n  .padding-meta {\n  padding: 30px 5% 0px 5% !important;\n  text-align: center;\n  }\n  .padding-copy {\n  padding: 10px 5% 10px 5% !important;\n  text-align: center;\n  }\n  .no-padding {\n  padding: 0 !important;\n  }\n  .section-padding {\n  padding: 50px 15px 50px 15px !important;\n  }\n  /* ADJUST BUTTONS ON MOBILE */\n  .mobile-button-container {\n  margin: 0 auto;\n  width: 100% !important;\n  }\n  .mobile-button {\n  padding: 15px !important;\n  border: 0 !important;\n  font-size: 16px !important;\n  display: block !important;\n  }\n  }\n  /* ANDROID CENTER FIX */\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\n  -->\n</style>\n<!--if gte mso 12\nstyle(type=\'text/css\').\n  .mso-right {\n  padding-left: 20px;\n  }\n-->\n<!-- HIDDEN PREHEADER TEXT-->\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"></div>\n<!-- HEADER-->\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n  <tbody>\n    <tr style=\"height: 165px;\">\n      <td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <table style=\"max-width: 500px;\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"wrapper\">\n          <tbody>\n            <tr>\n              <td style=\"padding: 15px 0;\" align=\"center\" valign=\"top\" class=\"logo\"><a href=\"http://litmus.com\" target=\"_blank\"><img caption=\"false\" alt=\"Logo\" src=\"blob:http://192.168.1.101/da82434c-a7ab-4271-b88d-42173fb7e58e\" style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" border=\"0\" height=\"120\" width=\"180\"/></a></td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n    <tr style=\"height: 10px;\">\n      <td style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\" class=\"section-padding\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"500\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td>\n                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                  <tbody>\n                    <tr>\n                      <td>\n                        <!-- COPY-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\" class=\"padding-copy\">Password Updated</td>\n                            </tr>\n                            <tr>\n                              <td style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\" class=\"padding-copy\">Hi {$username},<br/>Your password has been successfully updated.<br/>If you are not the person who changed the password, please report it<br/>to superuser/authority and make sure to reset your password again.<br/><strong>Note: Don\'t share your password with anybody.</strong><br/><br/>Greetings!</td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                    <tr>\n                      <td align=\"center\">\n                        <!-- BULLETPROOF BUTTON-->\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                          <tbody>\n                            <tr>\n                              <td style=\"padding-top: 25px;\" align=\"center\" class=\"padding\"></td>\n                            </tr>\n                          </tbody>\n                        </table>\n                      </td>\n                    </tr>\n                  </tbody>\n                </table>\n              </td>\n            </tr>\n          </tbody>\n        </table>\n      </td>\n    </tr>\n    <tr style=\"height: 20px;\">\n      <td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\">\n        <!--if (gte mso 9)|(IE)\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\n          tr\n            td(align=\'center\', valign=\'top\', width=\'500\')\n        -->\n        <!-- UNSUBSCRIBE COPY-->\n        <table style=\"max-width: 500px;\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" class=\"responsive-table\">\n          <tbody>\n            <tr>\n              <td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801,  +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.i\">info@epan.in</a><br/>A Xavoc Technocrats Pvt. Ltd. Product</td>\n            </tr>\n          </tbody>\n        </table>\n        <!--if (gte mso 9)|(IE)-->\n      </td>\n    </tr>\n  </tbody>\n</table>', 'communication'), ('38', '3', 'DEFAULT_CURRENCY_ID', '2394', 'accounts');
COMMIT;

-- ----------------------------
--  Table structure for `experience`
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `company_branch` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `filestore_file`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_file`;
CREATE TABLE `filestore_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'File type',
  `filestore_volume_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Volume',
  `original_filename` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'Original Name',
  `filename` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'Internal Name',
  `filesize` int(11) NOT NULL DEFAULT '0' COMMENT 'File size',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Deleted file',
  PRIMARY KEY (`id`),
  KEY `fk_filestore_file_filestore_type1_idx` (`filestore_type_id`),
  KEY `fk_filestore_file_filestore_volume1_idx` (`filestore_volume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `filestore_image`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_image`;
CREATE TABLE `filestore_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original File',
  `thumb_file_id` int(10) unsigned DEFAULT NULL COMMENT 'Thumbnail file',
  PRIMARY KEY (`id`),
  KEY `fk_filestore_image_filestore_file1_idx` (`original_file_id`),
  KEY `fk_filestore_image_filestore_file2_idx` (`thumb_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `filestore_type`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_type`;
CREATE TABLE `filestore_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'Name',
  `mime_type` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'MIME type',
  `extension` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'Filename extension',
  `allow` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `filestore_volume`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_volume`;
CREATE TABLE `filestore_volume` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'Volume name',
  `dirname` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'Folder name',
  `total_space` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Total space (not implemented)',
  `used_space` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Used space (not implemented)',
  `stored_files_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Approximate count of stored files',
  `enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Volume enabled?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `filestore_volume`
-- ----------------------------
BEGIN;
INSERT INTO `filestore_volume` VALUES ('2', 'upload', '', '0', '0', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `follower_task_association`
-- ----------------------------
DROP TABLE IF EXISTS `follower_task_association`;
CREATE TABLE `follower_task_association` (
  `task_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `installed_application`
-- ----------------------------
DROP TABLE IF EXISTS `installed_application`;
CREATE TABLE `installed_application` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `installed_on` datetime DEFAULT NULL,
  `valid_till` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `application_id` (`application_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `installed_application`
-- ----------------------------
BEGIN;
INSERT INTO `installed_application` VALUES ('11', '3', '12', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('12', '3', '11', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('13', '3', '13', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('14', '3', '14', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('15', '3', '15', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('16', '3', '16', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('17', '3', '17', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('18', '3', '18', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('19', '3', '19', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1'), ('20', '3', '20', null, '2016-06-23 09:54:14', '2016-06-23 09:54:14', '1');
COMMIT;

-- ----------------------------
--  Table structure for `invoice_transaction_association`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_transaction_association`;
CREATE TABLE `invoice_transaction_association` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `salesinvoice_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `exchange_rate` decimal(10,0) DEFAULT NULL,
  `exchange_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`) USING BTREE,
  KEY `saleinvoice_id` (`salesinvoice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `IP2LOCATION-LITE-DB11`
-- ----------------------------
DROP TABLE IF EXISTS `IP2LOCATION-LITE-DB11`;
CREATE TABLE `IP2LOCATION-LITE-DB11` (
  `ip_from` int(11) DEFAULT NULL,
  `ip_to` int(11) DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `document_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `original_price` decimal(14,2) DEFAULT NULL,
  `sale_price` decimal(14,2) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `description` text,
  `stock_availability` tinyint(4) DEFAULT NULL,
  `show_detail` tinyint(1) DEFAULT NULL,
  `show_price` tinyint(1) DEFAULT NULL,
  `display_sequence` int(11) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `is_feature` tinyint(1) DEFAULT NULL,
  `is_mostviewed` tinyint(1) DEFAULT NULL,
  `Item_enquiry_auto_reply` tinyint(1) DEFAULT NULL,
  `is_comment_allow` tinyint(1) DEFAULT NULL,
  `comment_api` varchar(255) DEFAULT NULL,
  `add_custom_button` tinyint(1) DEFAULT NULL,
  `custom_button_url` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `tags` text,
  `is_designable` tinyint(1) DEFAULT NULL,
  `designs` text,
  `is_party_publish` tinyint(1) DEFAULT NULL,
  `minimum_order_qty` int(11) DEFAULT NULL,
  `maximum_order_qty` int(11) DEFAULT NULL,
  `qty_unit` varchar(255) DEFAULT NULL,
  `is_attachment_allow` tinyint(1) DEFAULT NULL,
  `is_saleable` tinyint(1) DEFAULT NULL,
  `is_downloadable` tinyint(1) DEFAULT NULL,
  `is_rentable` tinyint(1) DEFAULT NULL,
  `is_enquiry_allow` tinyint(1) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT NULL,
  `negative_qty_allowed` varchar(255) DEFAULT NULL,
  `is_visible_sold` tinyint(1) DEFAULT NULL,
  `enquiry_send_to_admin` tinyint(1) DEFAULT NULL,
  `watermark_position` varchar(255) DEFAULT NULL,
  `watermark_opacity` varchar(255) DEFAULT NULL,
  `qty_from_set_only` tinyint(1) DEFAULT NULL,
  `custom_button_label` varchar(255) DEFAULT NULL,
  `is_servicable` tinyint(1) DEFAULT NULL,
  `is_purchasable` tinyint(1) DEFAULT NULL,
  `maintain_inventory` tinyint(1) DEFAULT NULL,
  `website_display` tinyint(1) DEFAULT NULL,
  `allow_negative_stock` tinyint(1) DEFAULT NULL,
  `is_productionable` tinyint(1) DEFAULT NULL,
  `warranty_days` int(11) DEFAULT NULL,
  `terms_and_conditions` text,
  `watermark_text` varchar(255) DEFAULT NULL,
  `duplicate_from_item_id` varchar(255) DEFAULT NULL,
  `is_allowuploadable` tinyint(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designer_id` int(11) DEFAULT NULL,
  `is_dispatchable` tinyint(1) DEFAULT NULL,
  `item_specific_upload_hint` text,
  `upload_file_label` text,
  `to_customer_id` int(11) DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `quantity_group` varchar(255) DEFAULT NULL,
  `upload_file_group` varchar(255) DEFAULT NULL,
  `is_renewable` tinyint(4) DEFAULT NULL,
  `remind_to` varchar(255) DEFAULT NULL,
  `renewable_value` int(11) DEFAULT NULL,
  `renewable_unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `duplicate_from_item_id` (`duplicate_from_item_id`) USING BTREE,
  KEY `to_customer_id` (`to_customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `item_department_association`
-- ----------------------------
DROP TABLE IF EXISTS `item_department_association`;
CREATE TABLE `item_department_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `can_redefine_qty` tinyint(4) NOT NULL,
  `can_redefine_item` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`) USING BTREE,
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `item_department_consumption`
-- ----------------------------
DROP TABLE IF EXISTS `item_department_consumption`;
CREATE TABLE `item_department_consumption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `composition_item_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `custom_fields` longtext,
  `item_department_association_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `composition_item_id` (`composition_item_id`) USING BTREE,
  KEY `item_department_association_id` (`item_department_association_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `item_image`
-- ----------------------------
DROP TABLE IF EXISTS `item_image`;
CREATE TABLE `item_image` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `file_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `customfield_value_id` int(11) DEFAULT NULL,
  `title` text,
  `alt_text` text,
  `auto_generated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`) USING BTREE,
  KEY `item_id` (`item_id`) USING BTREE,
  KEY `custom_field_value_id` (`customfield_value_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `item_template_design`
-- ----------------------------
DROP TABLE IF EXISTS `item_template_design`;
CREATE TABLE `item_template_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `last_modified` date DEFAULT NULL,
  `is_ordered` tinyint(4) DEFAULT NULL,
  `designs` text,
  `contact_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE,
  KEY `contact_id` (`contact_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jobcard`
-- ----------------------------
DROP TABLE IF EXISTS `jobcard`;
CREATE TABLE `jobcard` (
  `document_id` int(11) DEFAULT NULL,
  `outsourceparty_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `department_id` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `parent_jobcard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `outsource_party_id` (`outsourceparty_id`) USING BTREE,
  KEY `department_id` (`department_id`) USING BTREE,
  KEY `oreder_item_id` (`order_item_id`) USING BTREE,
  KEY `parent_jobcard_id` (`parent_jobcard_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jobcard_detail`
-- ----------------------------
DROP TABLE IF EXISTS `jobcard_detail`;
CREATE TABLE `jobcard_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` varchar(255) DEFAULT NULL,
  `parent_detail_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `jobcard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_detail_id` (`parent_detail_id`) USING BTREE,
  KEY `jobcard_id` (`jobcard_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `landingresponse`
-- ----------------------------
DROP TABLE IF EXISTS `landingresponse`;
CREATE TABLE `landingresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `opportunity_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `emailsetting_id` int(11) DEFAULT NULL,
  `social_user_id` int(11) DEFAULT NULL,
  `referrersite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_id` (`campaign_id`) USING BTREE,
  KEY `opportunity_id` (`opportunity_id`) USING BTREE,
  KEY `lead_id` (`contact_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lead`
-- ----------------------------
DROP TABLE IF EXISTS `lead`;
CREATE TABLE `lead` (
  `contact_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_lead_contact1_idx` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lead_category_association`
-- ----------------------------
DROP TABLE IF EXISTS `lead_category_association`;
CREATE TABLE `lead_category_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `marketing_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`) USING BTREE,
  KEY `marketing_category_id` (`marketing_category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ledger`
-- ----------------------------
DROP TABLE IF EXISTS `ledger`;
CREATE TABLE `ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ledger_type` varchar(255) DEFAULT NULL,
  `LedgerDisplayName` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `OpeningBalanceDr` double DEFAULT NULL,
  `OpeningBalanceCr` double DEFAULT NULL,
  `affectsBalanceSheet` tinyint(4) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `related_id` (`related_id`) USING BTREE,
  FULLTEXT KEY `search_string` (`name`,`ledger_type`,`LedgerDisplayName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lodgement`
-- ----------------------------
DROP TABLE IF EXISTS `lodgement`;
CREATE TABLE `lodgement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL,
  `currency` decimal(10,0) DEFAULT NULL,
  `exchange_rate` decimal(10,0) DEFAULT NULL,
  `salesinvoice_id` int(11) DEFAULT NULL,
  `account_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `salesinvoice_id` (`salesinvoice_id`) USING BTREE,
  KEY `account_transaction_id` (`account_transaction_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `marketingcampaign_socialconfig`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcampaign_socialconfig`;
CREATE TABLE `marketingcampaign_socialconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `social_app` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `appId` text,
  `secret` text,
  `post_in_groups` tinyint(1) DEFAULT NULL,
  `filter_repeated_posts` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `marketingcampaign_socialpostings`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcampaign_socialpostings`;
CREATE TABLE `marketingcampaign_socialpostings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `post_type` varchar(255) DEFAULT NULL,
  `postid_returned` varchar(255) DEFAULT NULL,
  `posted_on` datetime DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `likes` varchar(255) DEFAULT NULL,
  `share` varchar(255) DEFAULT NULL,
  `is_monitoring` tinyint(1) DEFAULT NULL,
  `force_monitor` tinyint(1) DEFAULT NULL,
  `return_data` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_by_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_post_id` (`post_id`),
  KEY `fk_campaign_id` (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `marketingcampaign_socialpostings_activities`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcampaign_socialpostings_activities`;
CREATE TABLE `marketingcampaign_socialpostings_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `posting_id` int(11) DEFAULT NULL,
  `activityid_returned` varchar(255) DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `activity_on` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `activity_by` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `action_allowed` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`),
  KEY `fk_posting_id` (`posting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `marketingcampaign_socialusers`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcampaign_socialusers`;
CREATE TABLE `marketingcampaign_socialusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `userid_returned` varchar(255) DEFAULT NULL,
  `access_token` text,
  `access_token_secret` text,
  `access_token_expiry` datetime DEFAULT NULL,
  `is_access_token_valid` tinyint(1) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `extra` longtext,
  `post_on_pages` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `post_on_timeline` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`),
  KEY `fk_config_id` (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `marketingcategory`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcategory`;
CREATE TABLE `marketingcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `marketingcategory`
-- ----------------------------
BEGIN;
INSERT INTO `marketingcategory` VALUES ('17', 'default', '2392');
COMMIT;

-- ----------------------------
--  Table structure for `opportunity`
-- ----------------------------
DROP TABLE IF EXISTS `opportunity`;
CREATE TABLE `opportunity` (
  `document_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `lead_id` (`lead_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_item_departmental_status`
-- ----------------------------
DROP TABLE IF EXISTS `order_item_departmental_status`;
CREATE TABLE `order_item_departmental_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qsp_detail_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_open` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qsp_detail_id` (`qsp_detail_id`) USING BTREE,
  KEY `department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `outsource_party`
-- ----------------------------
DROP TABLE IF EXISTS `outsource_party`;
CREATE TABLE `outsource_party` (
  `contact_id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `pan_it_no` varchar(255) NOT NULL,
  `tin_no` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `account_no` int(11) NOT NULL,
  `os_country` varchar(135) NOT NULL,
  `time` datetime NOT NULL,
  `os_address` text NOT NULL,
  `department_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `os_city` varchar(255) NOT NULL,
  `os_state` varchar(255) DEFAULT NULL,
  `os_pincode` varchar(255) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`) USING BTREE,
  KEY `department_id` (`department_id`) USING BTREE,
  KEY `currency_id` (`currency_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payment_gateway`
-- ----------------------------
DROP TABLE IF EXISTS `payment_gateway`;
CREATE TABLE `payment_gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `default_parameters` text,
  `parameters` text,
  `processing` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `gateway_image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gateway_image_id` (`gateway_image_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `point_system`
-- ----------------------------
DROP TABLE IF EXISTS `point_system`;
CREATE TABLE `point_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) DEFAULT NULL,
  `rule_option_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `score` decimal(10,0) DEFAULT NULL,
  `landing_campaign_id` int(11) DEFAULT NULL,
  `landing_content_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `document_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_post_id` int(11) DEFAULT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_department1_idx` (`department_id`),
  KEY `parent_post_id` (`parent_post_id`) USING BTREE,
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `post`
-- ----------------------------
BEGIN;
INSERT INTO `post` VALUES ('2391', 'CEO', '2390', '21', null, '00:00:00', '00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `post_email_association`
-- ----------------------------
DROP TABLE IF EXISTS `post_email_association`;
CREATE TABLE `post_email_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `emailsetting_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`) USING BTREE,
  KEY `email_settings_id` (`emailsetting_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `actual_completion_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_id` (`created_by_id`) USING BTREE,
  FULLTEXT KEY `quick_search` (`name`,`description`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `project`
-- ----------------------------
BEGIN;
INSERT INTO `project` VALUES ('14', 'Documentation', 'Documentation of Epan', 'project', 'Running', '626', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `projectcomment`
-- ----------------------------
DROP TABLE IF EXISTS `projectcomment`;
CREATE TABLE `projectcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `comment` text,
  `employee_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `publish_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `publish_schedule`;
CREATE TABLE `publish_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_post_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `is_posted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qsp_detail`
-- ----------------------------
DROP TABLE IF EXISTS `qsp_detail`;
CREATE TABLE `qsp_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qsp_master_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `price` decimal(14,4) NOT NULL,
  `quantity` decimal(14,2) NOT NULL,
  `tax_percentage` decimal(14,4) NOT NULL,
  `narration` text,
  `extra_info` text,
  `shipping_charge` float DEFAULT NULL,
  `taxation_id` int(11) DEFAULT NULL,
  `sale_amount` decimal(14,4) DEFAULT NULL,
  `original_amount` decimal(14,4) DEFAULT NULL,
  `shipping_duration` text,
  `express_shipping_charge` decimal(14,4) DEFAULT NULL,
  `express_shipping_duration` text,
  PRIMARY KEY (`id`),
  KEY `qsp_master_id` (`qsp_master_id`),
  KEY `item_id` (`item_id`),
  KEY `taxation_id` (`taxation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qsp_detail_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `qsp_detail_attachment`;
CREATE TABLE `qsp_detail_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `qsp_detail_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `qsp_master`
-- ----------------------------
DROP TABLE IF EXISTS `qsp_master`;
CREATE TABLE `qsp_master` (
  `document_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `document_no` varchar(45) NOT NULL DEFAULT '',
  `billing_address` text,
  `billing_city` varchar(255) DEFAULT NULL,
  `billing_state_id` int(11) NOT NULL,
  `billing_country_id` int(11) NOT NULL,
  `billing_pincode` varchar(255) DEFAULT NULL,
  `is_shipping_inclusive_tax` tinyint(4) DEFAULT NULL,
  `is_express_shipping` tinyint(4) DEFAULT NULL,
  `shipping_address` text,
  `shipping_city` varchar(255) DEFAULT NULL,
  `shipping_state_id` int(11) DEFAULT NULL,
  `shipping_country_id` int(11) DEFAULT NULL,
  `shipping_pincode` varchar(255) DEFAULT NULL,
  `currency_id` varchar(255) DEFAULT NULL,
  `discount_amount` varchar(255) DEFAULT NULL,
  `transaction_reference` varchar(255) DEFAULT NULL,
  `transaction_response_data` text,
  `narration` text,
  `priority_id` int(11) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `exchange_rate` decimal(14,6) DEFAULT NULL,
  `tnc_id` int(11) DEFAULT NULL,
  `tnc_text` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentgateway_id` int(11) DEFAULT NULL,
  `related_qsp_master_id` int(11) DEFAULT NULL,
  `nominal_id` int(11) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `round_amount` decimal(14,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document` (`document_id`),
  KEY `contact_id` (`contact_id`) USING BTREE,
  KEY `priority_id` (`priority_id`) USING BTREE,
  KEY `tnc_id` (`tnc_id`) USING BTREE,
  KEY `payment_gateway_id` (`paymentgateway_id`) USING BTREE,
  KEY `related_qsp_master_id` (`related_qsp_master_id`) USING BTREE,
  KEY `nominal_id` (`nominal_id`) USING BTREE,
  CONSTRAINT `document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qualification`
-- ----------------------------
DROP TABLE IF EXISTS `qualification`;
CREATE TABLE `qualification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `qualificaton_level` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `quantity_condition`
-- ----------------------------
DROP TABLE IF EXISTS `quantity_condition`;
CREATE TABLE `quantity_condition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity_set_id` int(11) NOT NULL,
  `customfield_value_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qty_set_id` (`quantity_set_id`) USING BTREE,
  KEY `customfield_value_id` (`customfield_value_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `quantity_set`
-- ----------------------------
DROP TABLE IF EXISTS `quantity_set`;
CREATE TABLE `quantity_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` float NOT NULL,
  `price` double DEFAULT NULL,
  `old_price` double DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `rule-options`
-- ----------------------------
DROP TABLE IF EXISTS `rule-options`;
CREATE TABLE `rule-options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `rules`
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `day` varchar(255) NOT NULL,
  `document_id` int(11) NOT NULL,
  `client_event_id` varchar(255) NOT NULL,
  `posted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_id` (`campaign_id`) USING BTREE,
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `shipping_association`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_association`;
CREATE TABLE `shipping_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `shipping_rule_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `shipping_rule`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_rule`;
CREATE TABLE `shipping_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `based_on` varchar(255) NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `shipping_rule_row`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_rule_row`;
CREATE TABLE `shipping_rule_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` int(11) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `shipping_charge` decimal(10,0) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `express_shipping_charge` decimal(10,0) DEFAULT NULL,
  `shipping_duration` text,
  `express_shipping_duration` text,
  `shipping_duration_days` tinyint(4) DEFAULT NULL,
  `express_shipping_duration_days` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `socialuser`
-- ----------------------------
DROP TABLE IF EXISTS `socialuser`;
CREATE TABLE `socialuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `configuration` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `state`
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `store_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `store_transaction`;
CREATE TABLE `store_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `related_document_id` int(11) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `from_warehouse_id` int(11) DEFAULT NULL,
  `to_warehouse_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `jobcard_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `delivery_via` varchar(255) DEFAULT NULL,
  `delivery_reference` varchar(255) DEFAULT NULL,
  `shipping_address` text,
  `shipping_charge` double(8,4) DEFAULT NULL,
  `narration` text,
  `tracking_code` text,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `related_doc_id` (`related_document_id`) USING BTREE,
  KEY `from_warehouse_id` (`from_warehouse_id`) USING BTREE,
  KEY `to_warehouse_id` (`to_warehouse_id`) USING BTREE,
  KEY `jobcard_id` (`jobcard_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `store_transaction_row`
-- ----------------------------
DROP TABLE IF EXISTS `store_transaction_row`;
CREATE TABLE `store_transaction_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `store_transaction_id` int(11) DEFAULT NULL,
  `qsp_detail_id` int(11) DEFAULT NULL,
  `customfield_generic_id` int(11) DEFAULT NULL,
  `customfield_value_id` int(11) DEFAULT NULL,
  `quantity` double(8,4) DEFAULT NULL,
  `jobcard_detail_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `store_transaction_id` (`store_transaction_id`) USING BTREE,
  KEY `qsp_detail_id` (`qsp_detail_id`) USING BTREE,
  KEY `customfield_generic_id` (`customfield_generic_id`) USING BTREE,
  KEY `customfield_value_id` (`customfield_value_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `contact_id` int(11) NOT NULL,
  `tin_no` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pan_no` varchar(255) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`),
  KEY `currency_id` (`currency_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `support_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `support_ticket`;
CREATE TABLE `support_ticket` (
  `document_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `communication_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `from_raw` text,
  `from_email` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_raw` text,
  `cc_raw` text,
  `bcc_raw` text,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext,
  `priority` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `contact_id` (`contact_id`) USING BTREE,
  KEY `communication_id` (`communication_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `description` text,
  `starting_date` datetime DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `estimate_time` varchar(255) DEFAULT NULL,
  `set_reminder` tinyint(4) DEFAULT NULL,
  `remind_via` varchar(255) DEFAULT NULL,
  `remind_value` decimal(10,0) DEFAULT NULL,
  `remind_unit` varchar(255) DEFAULT NULL,
  `is_recurring` tinyint(4) DEFAULT NULL,
  `recurring_span` varchar(255) DEFAULT NULL,
  `is_reminded` tinyint(4) DEFAULT NULL,
  `notify_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `task_title_full_text` (`task_name`,`description`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `task`
-- ----------------------------
BEGIN;
INSERT INTO `task` VALUES ('291', '14', 'Base Application Documentation', null, '626', '', '2016-06-24 00:00:00', '3', '626', 'Completed', 'Task', '2016-06-24 09:49:10', '50', '', '0', null, '0', null, '0', null, null, null), ('292', '14', 'Project Application Documentation', null, '626', '', null, '3', '626', 'Pending', 'Task', '2016-06-24 09:50:33', '50', '', '0', null, '0', null, '0', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `task_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `task_attachment`;
CREATE TABLE `task_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `taxation`
-- ----------------------------
DROP TABLE IF EXISTS `taxation`;
CREATE TABLE `taxation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `percentage` decimal(14,2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_id` (`created_by_id`) USING BTREE,
  FULLTEXT KEY `search_string` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `taxation_association`
-- ----------------------------
DROP TABLE IF EXISTS `taxation_association`;
CREATE TABLE `taxation_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `taxation_rule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `taxation_rule`
-- ----------------------------
DROP TABLE IF EXISTS `taxation_rule`;
CREATE TABLE `taxation_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `taxation_rule_row`
-- ----------------------------
DROP TABLE IF EXISTS `taxation_rule_row`;
CREATE TABLE `taxation_rule_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxation_id` int(11) NOT NULL,
  `taxation_rule_id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `team_project_association`
-- ----------------------------
DROP TABLE IF EXISTS `team_project_association`;
CREATE TABLE `team_project_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`) USING BTREE,
  KEY `project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ticket_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_attachment`;
CREATE TABLE `ticket_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `timesheet`
-- ----------------------------
DROP TABLE IF EXISTS `timesheet`;
CREATE TABLE `timesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `timesheet`
-- ----------------------------
BEGIN;
INSERT INTO `timesheet` VALUES ('147', '292', '626', '2016-06-24 09:50:39', '2016-06-24 10:29:10', null), ('148', '292', '626', '2016-06-24 10:43:18', '2016-06-24 11:14:10', null), ('149', '292', '626', '2016-06-24 11:16:44', '2016-06-28 09:22:18', null);
COMMIT;

-- ----------------------------
--  Table structure for `tnc`
-- ----------------------------
DROP TABLE IF EXISTS `tnc`;
CREATE TABLE `tnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET latin1 COLLATE latin1_general_cs,
  `name` varchar(255) DEFAULT NULL,
  `document_id` int(11) NOT NULL,
  `is_default_for_quotation` tinyint(4) DEFAULT NULL,
  `is_default_for_sale_order` tinyint(4) DEFAULT NULL,
  `is_default_for_sale_invoice` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `epan_id` int(11) DEFAULT NULL,
  `scope` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_epan1_idx` (`epan_id`),
  KEY `created_by_id` (`created_by_id`) USING BTREE,
  FULLTEXT KEY `search_string` (`username`,`type`,`scope`),
  CONSTRAINT `fk_user_epan1` FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('11', 'management@xavoc.com', '21232f297a57a5a743894a0e4a801fc3', 'Active', '3', 'SuperUser', 'User', null, '2016-08-05 08:23:40', '0');
COMMIT;

-- ----------------------------
--  Table structure for `xepan_template`
-- ----------------------------
DROP TABLE IF EXISTS `xepan_template`;
CREATE TABLE `xepan_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tags` text,
  `description` text,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xmarketingcampaign_googlebloggerconfig`
-- ----------------------------
DROP TABLE IF EXISTS `xmarketingcampaign_googlebloggerconfig`;
CREATE TABLE `xmarketingcampaign_googlebloggerconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `userid_returned` varchar(255) DEFAULT NULL,
  `blogid` varchar(255) DEFAULT NULL,
  `access_token` text,
  `access_token_secret` text,
  `refresh_token` text,
  `is_access_token_valid` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xshop_item_images`
-- ----------------------------
DROP TABLE IF EXISTS `xshop_item_images`;
CREATE TABLE `xshop_item_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_image_id` int(10) unsigned DEFAULT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `customefieldvalue_id` int(11) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_id` (`item_id`),
  KEY `fk_customefieldvalue_id` (`customefieldvalue_id`),
  KEY `fk_epan_id` (`epan_id`),
  KEY `fk_item_image_id` (`item_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `xshop_item_quantity_set_conditions`
-- ----------------------------
DROP TABLE IF EXISTS `xshop_item_quantity_set_conditions`;
CREATE TABLE `xshop_item_quantity_set_conditions` (
  `id` int(11) NOT NULL,
  `quantityset_id` int(11) DEFAULT NULL,
  `custom_field_value_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `customfield_id` int(11) DEFAULT NULL,
  `department_phase_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quantityset_id` (`quantityset_id`),
  KEY `fk_custom_field_value_id` (`custom_field_value_id`),
  KEY `fk_item_id` (`item_id`),
  KEY `fk_customfield_id` (`customfield_id`),
  KEY `fk_department_phase_id` (`department_phase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
