-- Created at 20.5.2016 12:43 using David Grudl MySQL Dump Utility
-- Host: epan.xepan-local.org
-- MySQL Server: 5.5.5-10.0.21-MariaDB
-- Database: epan

SET NAMES utf8;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET FOREIGN_KEY_CHECKS=0;
-- --------------------------------------------------------

DROP TABLE IF EXISTS `account_balance_sheet`;

CREATE TABLE `account_balance_sheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `positive_side` varchar(255) DEFAULT NULL,
  `is_pandl` tinyint(4) DEFAULT NULL,
  `show_sub` varchar(255) DEFAULT NULL,
  `subtract_from` varchar(255) DEFAULT NULL,
  `order` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `account_balance_sheet` (`id`, `epan_id`, `name`, `positive_side`, `is_pandl`, `show_sub`, `subtract_from`, `order`, `created_at`) VALUES
(2,	3,	'Current Liabilities',	'RT',	0,	NULL,	'DR',	'3',	'2016-05-20');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `account_group`;

CREATE TABLE `account_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `balance_sheet_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `parent_group_id` int(11) DEFAULT NULL,
  `root_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `balance_sheet_id` (`balance_sheet_id`) USING BTREE,
  KEY `parent_group_id` (`parent_group_id`) USING BTREE,
  KEY `root_group_id` (`root_group_id`) USING BTREE,
  FULLTEXT KEY `quick_search` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `account_group` (`id`, `epan_id`, `balance_sheet_id`, `name`, `created_at`, `parent_group_id`, `root_group_id`) VALUES
(2,	3,	2,	'Sundry Creditor',	'2016-05-20',	NULL,	2);


-- --------------------------------------------------------

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
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `transaction_type_id` (`transaction_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `acl`;

CREATE TABLE `acl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `document_type` varchar(45) DEFAULT NULL,
  `action_allowed` text,
  `allow_add` tinyint(4) DEFAULT NULL,
  `namespace` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `post_id` (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `contact_id` (`contact_id`) USING BTREE,
  KEY `related_contact_id` (`related_contact_id`) USING BTREE,
  KEY `related_document_id` (`related_document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `affiliate`;

CREATE TABLE `affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `narration` text,
  `contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `application`;

CREATE TABLE `application` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT '',
  `user_installable` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `application` (`id`, `name`, `namespace`, `user_installable`) VALUES
(21,	'hr',	'xepan\\hr',	1),
(22,	'communication',	'xepan\\communication',	1),
(23,	'projects',	'xepan\\projects',	1),
(24,	'marketing',	'xepan\\marketing',	1),
(25,	'accounts',	'xepan\\accounts',	1),
(26,	'commerce',	'xepan\\commerce',	1),
(27,	'production',	'xepan\\production',	1),
(28,	'crm',	'xepan\\crm',	1),
(29,	'cms',	'xepan\\cms',	1),
(30,	'epanservices',	'xepan\\epanservices',	1);


-- --------------------------------------------------------

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
  UNIQUE KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `campaign_category_association`;

CREATE TABLE `campaign_category_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_category_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_category_id` (`marketing_category_id`) USING BTREE,
  KEY `campaign_id` (`campaign_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `campaign_socialuser_association`;

CREATE TABLE `campaign_socialuser_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialuser_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_user_id` (`socialuser_id`) USING BTREE,
  KEY `campaign_id` (`campaign_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cms_editors`;

CREATE TABLE `cms_editors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `can_edit_template` tinyint(4) DEFAULT NULL,
  `can_edit_page_content` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `communication_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_id` (`communication_id`) USING BTREE,
  KEY `ticket_id` (`ticket_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
  PRIMARY KEY (`id`),
  KEY `related_document_id` (`related_document_id`) USING BTREE,
  FULLTEXT KEY `search_string` (`title`,`description`,`communication_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `communication_attachment`;

CREATE TABLE `communication_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `communication_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_id` (`communication_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `image_id` (`image_id`) USING BTREE,
  FULLTEXT KEY `search_string` (`search_string`),
  CONSTRAINT `fk_epan_id` FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `contact` (`id`, `epan_id`, `first_name`, `last_name`, `type`, `status`, `address`, `city`, `state`, `country`, `pin_code`, `organization`, `post`, `website`, `image_id`, `user_id`, `created_at`, `updated_at`, `created_by_id`, `search_string`) VALUES
(3,	3,	'Super',	'User',	'Employee',	'Active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	6,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	2,	'   0        Super User');


-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `marketing_category_id` (`marketing_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `content` (`id`, `message_255`, `title`, `document_id`, `marketing_category_id`, `is_template`, `message_3000`, `message_blog`, `url`, `message_160`) VALUES
(3,	'No Content',	'Empty',	14,	13,	0,	'No Content',	'No Content',	'xavoc.com',	'No Content');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `document_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `currency` (`document_id`, `icon`, `name`, `value`, `id`) VALUES
(15,	NULL,	'Default Currency',	'1',	3);


-- --------------------------------------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `contact_id` int(11) NOT NULL,
  `billing_address` varchar(255) DEFAULT '',
  `billing_city` varchar(45) DEFAULT NULL,
  `billing_state` varchar(45) DEFAULT NULL,
  `billing_country` varchar(45) DEFAULT NULL,
  `billing_pincode` varchar(45) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT '',
  `shipping_city` varchar(45) DEFAULT NULL,
  `shipping_state` varchar(45) DEFAULT NULL,
  `shipping_country` varchar(45) DEFAULT NULL,
  `shipping_pincode` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tin_no` varchar(255) DEFAULT '',
  `pan_no` varchar(255) DEFAULT '',
  `currency_id` int(11) DEFAULT NULL,
  `same_as_billing_address` tinyint(4) DEFAULT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`),
  KEY `currency_id` (`currency_id`) USING BTREE,
  CONSTRAINT ```xepan2``.``customer``.``contact``.``id``` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `customfield_association`;

CREATE TABLE `customfield_association` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `customfield_generic_id` int(11) DEFAULT NULL,
  `can_effect_stock` tinyint(4) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE,
  KEY `customfield_generic_id` (`customfield_generic_id`) USING BTREE,
  KEY `department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `department` (`document_id`, `name`, `production_level`, `is_system`, `is_outsourced`, `id`) VALUES
(11,	'Company',	1,	1,	0,	3);


-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `designer_images`;

CREATE TABLE `designer_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designer_category_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designer_category_id` (`designer_category_id`) USING BTREE,
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `discount_voucher`;

CREATE TABLE `discount_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `updated_by_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount_percentage` decimal(10,0) NOT NULL,
  `start_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `no_of_person` int(11) NOT NULL,
  `one_user_how_many_time` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `discount_voucher_used`;

CREATE TABLE `discount_voucher_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qsp_master_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `discountvoucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



-- --------------------------------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO `document` (`id`, `epan_id`, `type`, `sub_type`, `created_by_id`, `created_at`, `updated_by_id`, `updated_at`, `status`, `search_string`) VALUES
(11,	3,	'Department',	NULL,	2,	'2016-05-20 12:43:23',	2,	'2016-05-20 12:43:23',	'Active',	'  Company 1 1  '),
(12,	3,	'Post',	NULL,	2,	'2016-05-20 12:43:23',	2,	'2016-05-20 12:43:23',	'Active',	'  CEO  '),
(13,	3,	'MarketingCategory',	NULL,	2,	'2016-05-20 12:43:23',	NULL,	'2016-05-20 12:43:23',	NULL,	'  default MarketingCategory '),
(14,	3,	'Newsletter',	NULL,	NULL,	'2016-05-20 12:43:23',	NULL,	'2016-05-20 12:43:23',	'Draft',	'  Empty Newsletter No Content No Content No Content No Content Draft'),
(15,	3,	'Currency',	NULL,	2,	'2016-05-20 12:43:23',	NULL,	'2016-05-20 12:43:23',	'Active',	'  Default Currency 1 Currency Active');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `emails`;

CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `employee` (`contact_id`, `post_id`, `department_id`, `notified_till`, `id`, `offer_date`, `doj`, `contract_date`, `leaving_date`, `mode`, `in_time`, `out_time`, `remark`) VALUES
(3,	12,	11,	0,	3,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);


-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
  PRIMARY KEY (`id`),
  KEY `fk_epan_category_id` (`epan_category_id`),
  CONSTRAINT `fk_epan_category_id` FOREIGN KEY (`epan_category_id`) REFERENCES `epan_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `epan` (`id`, `epan_category_id`, `name`, `status`, `created_by_id`, `created_at`, `type`) VALUES
(3,	3,	'default',	'Trial',	NULL,	'2016-05-20 12:43:23',	'Epan');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `epan_category`;

CREATE TABLE `epan_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `epan_category` (`id`, `name`) VALUES
(3,	'default');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `epan_config`;

CREATE TABLE `epan_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `epan_id` int(11) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `value` longtext,
  `application` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `epan_config` (`id`, `epan_id`, `head`, `value`, `application`) VALUES
(3,	3,	'DEFAULT_CURRENCY_ID',	'15',	'accounts');


-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `filestore_file`;

CREATE TABLE `filestore_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'File type',
  `filestore_volume_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Volume',
  `original_filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Original Name',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Internal Name',
  `filesize` int(11) NOT NULL DEFAULT '0' COMMENT 'File size',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Deleted file',
  PRIMARY KEY (`id`),
  KEY `fk_filestore_file_filestore_type1_idx` (`filestore_type_id`),
  KEY `fk_filestore_file_filestore_volume1_idx` (`filestore_volume_id`),
  CONSTRAINT `fk_filestore_file_filestore_type1` FOREIGN KEY (`filestore_type_id`) REFERENCES `filestore_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_filestore_file_filestore_volume1` FOREIGN KEY (`filestore_volume_id`) REFERENCES `filestore_volume` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `filestore_image`;

CREATE TABLE `filestore_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Original File',
  `thumb_file_id` int(10) unsigned DEFAULT NULL COMMENT 'Thumbnail file',
  PRIMARY KEY (`id`),
  KEY `fk_filestore_image_filestore_file1_idx` (`original_file_id`),
  KEY `fk_filestore_image_filestore_file2_idx` (`thumb_file_id`),
  CONSTRAINT `fk_filestore_image_filestore_file1` FOREIGN KEY (`original_file_id`) REFERENCES `filestore_file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_filestore_image_filestore_file2` FOREIGN KEY (`thumb_file_id`) REFERENCES `filestore_file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `filestore_type`;

CREATE TABLE `filestore_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name',
  `mime_type` varchar(64) NOT NULL DEFAULT '' COMMENT 'MIME type',
  `extension` varchar(5) NOT NULL DEFAULT '' COMMENT 'Filename extension',
  `allow` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

INSERT INTO `filestore_type` (`id`, `name`, `mime_type`, `extension`, `allow`) VALUES
(1,	'png',	'image/png',	'png',	1),
(2,	'jpeg',	'image/jpeg',	'jpg',	1),
(3,	'gif',	'image/gif',	'gif',	1),
(4,	'pdf',	'application/pdf',	'pdf',	1),
(5,	'doc',	'application/doc',	'doc',	0),
(6,	'xls',	'application/xls',	'xls',	0),
(7,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(8,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(9,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(10,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(11,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(12,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(13,	'application/msword',	'application/msword',	'',	1),
(14,	'application/vnd.openxmlformats-officedocument.spreadsheetml.shee',	'application/vnd.openxmlformats-officedocument.spreadsheetml.shee',	'',	1),
(15,	'application/zip',	'application/zip',	'',	1),
(16,	'application/vnd.oasis.opendocument.text',	'application/vnd.oasis.opendocument.text',	'',	1),
(17,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(18,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(19,	'application/CDFV2-unknown',	'application/CDFV2-unknown',	'',	1),
(20,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1),
(21,	'text/plain',	'text/plain',	'',	1),
(22,	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'application/vnd.openxmlformats-officedocument.wordprocessingml.d',	'',	1);


-- --------------------------------------------------------

DROP TABLE IF EXISTS `filestore_volume`;

CREATE TABLE `filestore_volume` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Volume name',
  `dirname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Folder name',
  `total_space` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Total space (not implemented)',
  `used_space` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Used space (not implemented)',
  `stored_files_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Approximate count of stored files',
  `enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Volume enabled?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `filestore_volume` (`id`, `name`, `dirname`, `total_space`, `used_space`, `stored_files_cnt`, `enabled`) VALUES
(1,	'upload',	'upload',	1000000000,	0,	333,	1);


-- --------------------------------------------------------

DROP TABLE IF EXISTS `follower_task_association`;

CREATE TABLE `follower_task_association` (
  `task_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `installed_application` (`id`, `epan_id`, `application_id`, `name`, `installed_on`, `valid_till`, `is_active`) VALUES
(21,	3,	21,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(22,	3,	22,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(23,	3,	23,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(24,	3,	24,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(25,	3,	25,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(26,	3,	26,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(27,	3,	27,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(28,	3,	28,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(29,	3,	29,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1),
(30,	3,	30,	NULL,	'2016-05-20 12:43:23',	'2016-05-20 12:43:23',	1);


-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
  `display_sequence` varchar(255) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `duplicate_from_item_id` (`duplicate_from_item_id`) USING BTREE,
  KEY `to_customer_id` (`to_customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `item_image`;

CREATE TABLE `item_image` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `file_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `customfield_value_id` int(11) DEFAULT NULL,
  `title` text,
  `alt_text` text,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`) USING BTREE,
  KEY `item_id` (`item_id`) USING BTREE,
  KEY `custom_field_value_id` (`customfield_value_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `landingresponse`;

CREATE TABLE `landingresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `opportunity_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_id` (`campaign_id`) USING BTREE,
  KEY `lead_id` (`lead_id`) USING BTREE,
  KEY `opportunity_id` (`opportunity_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `lead`;

CREATE TABLE `lead` (
  `contact_id` int(11) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remark` longblob,
  PRIMARY KEY (`id`),
  KEY `fk_lead_contact1_idx` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `lead_category_association`;

CREATE TABLE `lead_category_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `marketing_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`) USING BTREE,
  KEY `marketing_category_id` (`marketing_category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `ledger` (`id`, `contact_id`, `group_id`, `name`, `ledger_type`, `LedgerDisplayName`, `is_active`, `OpeningBalanceDr`, `OpeningBalanceCr`, `affectsBalanceSheet`, `created_at`, `updated_at`, `epan_id`, `related_id`) VALUES
(2,	3,	2,	'Super User',	'Employee',	'Super User',	1,	0,	0,	1,	'2016-05-20',	'2016-05-20',	3,	3);


-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_post_id` (`post_id`),
  KEY `fk_campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
  `is_active` tinyint(1) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_epan_id` (`epan_id`),
  KEY `fk_config_id` (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `marketingcategory`;

CREATE TABLE `marketingcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `marketingcategory` (`id`, `name`, `document_id`) VALUES
(3,	'default',	13);


-- --------------------------------------------------------

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



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
  `remark` longtext,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`) USING BTREE,
  KEY `department_id` (`department_id`) USING BTREE,
  KEY `currency_id` (`currency_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `post` (`document_id`, `name`, `department_id`, `id`, `parent_post_id`, `in_time`, `out_time`) VALUES
(12,	'CEO',	11,	3,	NULL,	'00:00:00',	'00:00:00');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `post_email_association`;

CREATE TABLE `post_email_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `emailsetting_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`) USING BTREE,
  KEY `email_settings_id` (`emailsetting_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by_id` (`created_by_id`) USING BTREE,
  FULLTEXT KEY `quick_search` (`name`,`description`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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
  PRIMARY KEY (`id`),
  KEY `qsp_master_id` (`qsp_master_id`),
  KEY `item_id` (`item_id`),
  KEY `taxation_id` (`taxation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `qsp_master`;

CREATE TABLE `qsp_master` (
  `document_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `document_no` varchar(45) NOT NULL DEFAULT '',
  `billing_address` text,
  `billing_city` varchar(255) DEFAULT NULL,
  `billing_state` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) DEFAULT NULL,
  `billing_pincode` varchar(255) DEFAULT NULL,
  `shipping_address` text,
  `shipping_city` varchar(255) DEFAULT NULL,
  `shipping_state` varchar(255) DEFAULT NULL,
  `shipping_country` varchar(255) DEFAULT NULL,
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



-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `quantity_condition`;

CREATE TABLE `quantity_condition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity_set_id` int(11) NOT NULL,
  `customfield_value_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qty_set_id` (`quantity_set_id`) USING BTREE,
  KEY `customfield_value_id` (`customfield_value_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `quantity_set`;

CREATE TABLE `quantity_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` float NOT NULL,
  `price` double DEFAULT NULL,
  `old_price` double DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `shipping_charge` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `day` varchar(255) NOT NULL,
  `document_id` int(11) NOT NULL,
  `client_event_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_id` (`campaign_id`) USING BTREE,
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `socialuser`;

CREATE TABLE `socialuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `configuration` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
  `shipping_address` text DEFAULT NULL,
  `shipping_charge` double(8,4) DEFAULT NULL,
  `narration` text DEFAULT NULL,
  `tracking_code` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epan_id` (`epan_id`) USING BTREE,
  KEY `related_doc_id` (`related_document_id`) USING BTREE,
  KEY `from_warehouse_id` (`from_warehouse_id`) USING BTREE,
  KEY `to_warehouse_id` (`to_warehouse_id`) USING BTREE,
  KEY `jobcard_id` (`jobcard_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `contact_id` int(11) NOT NULL,
  `tin_no` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pan_no` varchar(255) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`),
  KEY `currency_id` (`currency_id`) USING BTREE,
  CONSTRAINT ```xepan2``.``supplier``.``contact``.``id``` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `description` text,
  `starting_date` date DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  FULLTEXT KEY `task_title_full_text` (`task_name`),
  FULLTEXT KEY `task_name` (`task_name`,`description`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `task_attachment`;

CREATE TABLE `task_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

DROP TABLE IF EXISTS `taxation_association`;

CREATE TABLE `taxation_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `taxation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE,
  KEY `taxation_id` (`taxation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `team_project_association`;

CREATE TABLE `team_project_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`) USING BTREE,
  KEY `project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `ticket_attachment`;

CREATE TABLE `ticket_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `tnc`;

CREATE TABLE `tnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET latin1 COLLATE latin1_general_cs,
  `name` varchar(255) DEFAULT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

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
  `last_login_date` date DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_epan1_idx` (`epan_id`),
  KEY `created_by_id` (`created_by_id`) USING BTREE,
  FULLTEXT KEY `search_string` (`username`,`type`,`scope`),
  CONSTRAINT `fk_user_epan1` FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`, `username`, `password`, `status`, `epan_id`, `scope`, `type`, `hash`, `last_login_date`, `created_by_id`) VALUES
(6,	'admin@epan.in',	'21232f297a57a5a743894a0e4a801fc3',	'Active',	3,	'SuperUser',	'User',	NULL,	NULL,	0);


-- --------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

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



-- --------------------------------------------------------

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

DROP TABLE IF EXISTS `xepan_template`;
CREATE TABLE `xepan_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tags` text,
  `description` text,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- THE END