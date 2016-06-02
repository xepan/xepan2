-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 02, 2016 at 10:19 AM
-- Server version: 5.6.28-0ubuntu0.15.04.1
-- PHP Version: 5.6.11-1ubuntu3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xepan2`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_balance_sheet`
--

CREATE TABLE `account_balance_sheet` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `positive_side` varchar(255) DEFAULT NULL,
  `is_pandl` tinyint(4) DEFAULT NULL,
  `show_sub` varchar(255) DEFAULT NULL,
  `subtract_from` varchar(255) DEFAULT NULL,
  `order` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_group`
--

CREATE TABLE `account_group` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `balance_sheet_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `parent_group_id` int(11) DEFAULT NULL,
  `root_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_transaction`
--

CREATE TABLE `account_transaction` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `Narration` text,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` decimal(8,6) DEFAULT NULL,
  `related_id` bigint(20) DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_transaction_row`
--

CREATE TABLE `account_transaction_row` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `ledger_id` int(11) DEFAULT NULL,
  `_amountDr` double DEFAULT NULL,
  `_amountCr` double DEFAULT NULL,
  `side` varchar(255) DEFAULT NULL,
  `accounts_in_side` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_transaction_types`
--

CREATE TABLE `account_transaction_types` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `FromAC` varchar(255) DEFAULT NULL,
  `ToAC` varchar(255) DEFAULT NULL,
  `Default_Narration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `id` int(11) UNSIGNED NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `document_type` varchar(45) DEFAULT NULL,
  `action_allowed` text,
  `allow_add` tinyint(4) DEFAULT NULL,
  `namespace` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) UNSIGNED NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `related_contact_id` int(11) DEFAULT NULL,
  `related_document_id` int(11) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `details` text,
  `created_at` datetime DEFAULT NULL,
  `notify_to` varchar(255) DEFAULT NULL,
  `notification` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate`
--

CREATE TABLE `affiliate` (
  `id` int(11) NOT NULL,
  `narration` text,
  `contact_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT '',
  `user_installable` tinyint(4) DEFAULT '1',
  `default_currency_price` double(8,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `id` int(11) UNSIGNED NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `blog_post_id` int(11) NOT NULL,
  `comment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_category`
--

CREATE TABLE `blog_post_category` (
  `id` tinyint(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_category_association`
--

CREATE TABLE `blog_post_category_association` (
  `id` int(11) NOT NULL,
  `blog_post_id` int(11) NOT NULL,
  `blog_post_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
  `document_id` int(11) NOT NULL,
  `schedule` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `starting_date` datetime NOT NULL,
  `ending_date` datetime NOT NULL,
  `campaign_type` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_category_association`
--

CREATE TABLE `campaign_category_association` (
  `id` int(11) NOT NULL,
  `marketing_category_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_socialuser_association`
--

CREATE TABLE `campaign_socialuser_association` (
  `id` int(11) NOT NULL,
  `socialuser_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
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
  `cat_image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_item_association`
--

CREATE TABLE `category_item_association` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_editors`
--

CREATE TABLE `cms_editors` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `can_edit_template` tinyint(4) DEFAULT NULL,
  `can_edit_page_content` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `communication_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `communication`
--

CREATE TABLE `communication` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `extra_info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `communication_attachment`
--

CREATE TABLE `communication_attachment` (
  `id` int(11) NOT NULL,
  `communication_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `communication_sms_setting`
--

CREATE TABLE `communication_sms_setting` (
  `id` int(11) NOT NULL,
  `gateway_url` varchar(255) DEFAULT NULL,
  `sms_username` varchar(255) DEFAULT NULL,
  `sms_password` varchar(255) DEFAULT NULL,
  `sms_user_name_qs_param` varchar(255) DEFAULT NULL,
  `sms_password_qs_param` varchar(255) DEFAULT NULL,
  `sms_number_qs_param` varchar(255) DEFAULT NULL,
  `sm_message_qs_param` varchar(255) DEFAULT NULL,
  `sms_prefix` varchar(255) DEFAULT NULL,
  `sms_postfix` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
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
  `image_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `search_string` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_info`
--

CREATE TABLE `contact_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `head` varchar(45) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_valid` tinyint(4) DEFAULT '1',
  `type` varchar(45) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `message_255` text NOT NULL,
  `title` text NOT NULL,
  `document_id` int(11) NOT NULL,
  `marketing_category_id` int(11) NOT NULL,
  `is_template` tinyint(1) NOT NULL,
  `message_3000` text NOT NULL,
  `message_blog` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `message_160` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `iso_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `document_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

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
  `id` int(11) NOT NULL,
  `tin_no` varchar(255) DEFAULT '',
  `pan_no` varchar(255) DEFAULT '',
  `currency_id` int(11) DEFAULT NULL,
  `same_as_billing_address` tinyint(4) DEFAULT NULL,
  `remark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customfield_association`
--

CREATE TABLE `customfield_association` (
  `id` bigint(20) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `customfield_generic_id` int(11) DEFAULT NULL,
  `can_effect_stock` tinyint(4) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customfield_generic`
--

CREATE TABLE `customfield_generic` (
  `name` varchar(255) NOT NULL,
  `display_type` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  `sequence_order` int(11) DEFAULT NULL,
  `is_filterable` tinyint(4) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customfield_value`
--

CREATE TABLE `customfield_value` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `customfield_association_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `highlight_it` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_form`
--

CREATE TABLE `custom_form` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `submit_button_name` varchar(255) DEFAULT NULL,
  `form_layout` varchar(255) DEFAULT NULL,
  `custom_form_layout_path` varchar(255) DEFAULT NULL,
  `recieve_email` tinyint(4) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `auto_reply` tinyint(4) DEFAULT NULL,
  `message_body` text,
  `email_subject` text,
  `emailsetting_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_form_field`
--

CREATE TABLE `custom_form_field` (
  `id` int(11) NOT NULL,
  `custom_form_id` int(11) DEFAULT NULL,
  `value` text,
  `is_mandatory` tinyint(4) DEFAULT NULL,
  `hint` text,
  `placeholder` text,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `auto_reply` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_form_submission`
--

CREATE TABLE `custom_form_submission` (
  `id` int(11) NOT NULL,
  `custom_form_id` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `document_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `production_level` int(11) DEFAULT NULL,
  `is_system` tinyint(4) DEFAULT '0',
  `is_outsourced` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `designer_images`
--

CREATE TABLE `designer_images` (
  `id` int(11) NOT NULL,
  `designer_category_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `designer_image_category`
--

CREATE TABLE `designer_image_category` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_library` tinyint(4) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `discount_voucher`
--

CREATE TABLE `discount_voucher` (
  `id` int(11) NOT NULL,
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
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `discount_voucher_condition`
--

CREATE TABLE `discount_voucher_condition` (
  `id` int(11) NOT NULL,
  `discountvoucher_id` int(11) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `discount_voucher_used`
--

CREATE TABLE `discount_voucher_used` (
  `id` int(11) NOT NULL,
  `qsp_master_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `discountvoucher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `sub_type` varchar(45) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `search_string` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emailsetting`
--

CREATE TABLE `emailsetting` (
  `id` int(11) NOT NULL,
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
  `mass_mail` tinyint(4) UNSIGNED DEFAULT NULL,
  `signature` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `contact_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `notified_till` int(11) DEFAULT '0',
  `id` int(11) NOT NULL,
  `offer_date` date DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `contract_date` date DEFAULT NULL,
  `leaving_date` date DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `remark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `employee_document_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_movement`
--

CREATE TABLE `employee_movement` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `narration` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `epan`
--

CREATE TABLE `epan` (
  `id` int(11) NOT NULL,
  `epan_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `xepan_template_id` int(11) DEFAULT NULL,
  `valid_till` datetime DEFAULT NULL,
  `is_published` varchar(255) DEFAULT NULL,
  `extra_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `epan_category`
--

CREATE TABLE `epan_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `epan_config`
--

CREATE TABLE `epan_config` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `value` longtext,
  `application` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `company_branch` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filestore_file`
--

CREATE TABLE `filestore_file` (
  `id` int(10) UNSIGNED NOT NULL,
  `filestore_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'File type',
  `filestore_volume_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Volume',
  `original_filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Original Name',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Internal Name',
  `filesize` int(11) NOT NULL DEFAULT '0' COMMENT 'File size',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Deleted file'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filestore_image`
--

CREATE TABLE `filestore_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `original_file_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Original File',
  `thumb_file_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Thumbnail file'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `filestore_type`
--

CREATE TABLE `filestore_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name',
  `mime_type` varchar(64) NOT NULL DEFAULT '' COMMENT 'MIME type',
  `extension` varchar(5) NOT NULL DEFAULT '' COMMENT 'Filename extension',
  `allow` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filestore_volume`
--

CREATE TABLE `filestore_volume` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Volume name',
  `dirname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Folder name',
  `total_space` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Total space (not implemented)',
  `used_space` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Used space (not implemented)',
  `stored_files_cnt` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Approximate count of stored files',
  `enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Volume enabled?'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `follower_task_association`
--

CREATE TABLE `follower_task_association` (
  `task_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `installed_application`
--

CREATE TABLE `installed_application` (
  `id` int(11) UNSIGNED NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `installed_on` datetime DEFAULT NULL,
  `valid_till` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_transaction_association`
--

CREATE TABLE `invoice_transaction_association` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `salesinvoice_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `exchange_rate` decimal(10,0) DEFAULT NULL,
  `exchange_amount` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

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
  `id` int(11) NOT NULL,
  `designer_id` int(11) DEFAULT NULL,
  `is_dispatchable` tinyint(1) DEFAULT NULL,
  `item_specific_upload_hint` text,
  `upload_file_label` text,
  `to_customer_id` int(11) DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `quantity_group` varchar(255) DEFAULT NULL,
  `upload_file_group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_department_association`
--

CREATE TABLE `item_department_association` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `can_redefine_qty` tinyint(4) NOT NULL,
  `can_redefine_item` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_department_consumption`
--

CREATE TABLE `item_department_consumption` (
  `id` int(11) NOT NULL,
  `composition_item_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `custom_fields` longtext,
  `item_department_association_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_image`
--

CREATE TABLE `item_image` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `customfield_value_id` int(11) DEFAULT NULL,
  `title` text,
  `alt_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_template_design`
--

CREATE TABLE `item_template_design` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `last_modified` date DEFAULT NULL,
  `is_ordered` tinyint(4) DEFAULT NULL,
  `designs` text,
  `contact_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobcard`
--

CREATE TABLE `jobcard` (
  `document_id` int(11) DEFAULT NULL,
  `outsourceparty_id` int(11) NOT NULL,
  `id` int(11) NOT NULL COMMENT ' ',
  `department_id` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `parent_jobcard_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobcard_detail`
--

CREATE TABLE `jobcard_detail` (
  `id` int(11) NOT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `parent_detail_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `jobcard_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `landingresponse`
--

CREATE TABLE `landingresponse` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `opportunity_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lead`
--

CREATE TABLE `lead` (
  `contact_id` int(11) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `remark` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lead_category_association`
--

CREATE TABLE `lead_category_association` (
  `id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `marketing_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

CREATE TABLE `ledger` (
  `id` int(11) NOT NULL,
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
  `related_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lodgement`
--

CREATE TABLE `lodgement` (
  `id` int(11) NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `currency` decimal(10,0) DEFAULT NULL,
  `exchange_rate` decimal(10,0) DEFAULT NULL,
  `salesinvoice_id` int(11) DEFAULT NULL,
  `account_transaction_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `marketingcampaign_socialconfig`
--

CREATE TABLE `marketingcampaign_socialconfig` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `social_app` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `appId` text,
  `secret` text,
  `post_in_groups` tinyint(1) DEFAULT NULL,
  `filter_repeated_posts` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `marketingcampaign_socialpostings`
--

CREATE TABLE `marketingcampaign_socialpostings` (
  `id` int(11) NOT NULL,
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
  `force_monitor` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `marketingcampaign_socialpostings_activities`
--

CREATE TABLE `marketingcampaign_socialpostings_activities` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `posting_id` int(11) DEFAULT NULL,
  `activityid_returned` varchar(255) DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `activity_on` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `activity_by` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `action_allowed` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `marketingcampaign_socialusers`
--

CREATE TABLE `marketingcampaign_socialusers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `userid_returned` varchar(255) DEFAULT NULL,
  `access_token` text,
  `access_token_secret` text,
  `access_token_expiry` datetime DEFAULT NULL,
  `is_access_token_valid` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `marketingcategory`
--

CREATE TABLE `marketingcategory` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunity`
--

CREATE TABLE `opportunity` (
  `document_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_item_departmental_status`
--

CREATE TABLE `order_item_departmental_status` (
  `id` int(11) NOT NULL,
  `qsp_detail_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_open` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outsource_party`
--

CREATE TABLE `outsource_party` (
  `contact_id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `pan_it_no` varchar(255) NOT NULL,
  `tin_no` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `account_no` int(11) NOT NULL,
  `os_country` varchar(135) NOT NULL,
  `time` datetime NOT NULL,
  `os_address` text NOT NULL,
  `department_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `os_city` varchar(255) NOT NULL,
  `os_state` varchar(255) DEFAULT NULL,
  `os_pincode` varchar(255) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `remark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE `payment_gateway` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `default_parameters` text,
  `parameters` text,
  `processing` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `gateway_image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `document_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `parent_post_id` int(11) DEFAULT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_email_association`
--

CREATE TABLE `post_email_association` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `emailsetting_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projectcomment`
--

CREATE TABLE `projectcomment` (
  `id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `comment` text,
  `employee_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qsp_detail`
--

CREATE TABLE `qsp_detail` (
  `id` int(11) NOT NULL,
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
  `express_shipping_duration` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qsp_detail_attachment`
--

CREATE TABLE `qsp_detail_attachment` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `qsp_detail_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `qsp_master`
--

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
  `id` int(11) NOT NULL,
  `paymentgateway_id` int(11) DEFAULT NULL,
  `related_qsp_master_id` int(11) DEFAULT NULL,
  `nominal_id` int(11) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `qualificaton_level` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quantity_condition`
--

CREATE TABLE `quantity_condition` (
  `id` bigint(20) NOT NULL,
  `quantity_set_id` int(11) NOT NULL,
  `customfield_value_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quantity_set`
--

CREATE TABLE `quantity_set` (
  `id` bigint(20) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` float NOT NULL,
  `price` double DEFAULT NULL,
  `old_price` double DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` bigint(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `day` varchar(255) NOT NULL,
  `document_id` int(11) NOT NULL,
  `client_event_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_association`
--

CREATE TABLE `shipping_association` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `shipping_rule_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_rule`
--

CREATE TABLE `shipping_rule` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `based_on` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_rule_row`
--

CREATE TABLE `shipping_rule_row` (
  `id` int(11) NOT NULL,
  `shipping_rule_id` int(11) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `shipping_charge` decimal(10,0) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `express_shipping_charge` decimal(10,0) DEFAULT NULL,
  `shipping_duration` text,
  `express_shipping_duration` text,
  `shipping_duration_days` tinyint(4) DEFAULT NULL,
  `express_shipping_duration_days` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `socialuser`
--

CREATE TABLE `socialuser` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `configuration` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `store_transaction`
--

CREATE TABLE `store_transaction` (
  `id` int(11) NOT NULL,
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
  `tracking_code` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_transaction_row`
--

CREATE TABLE `store_transaction_row` (
  `id` int(11) NOT NULL,
  `epan_id` int(11) DEFAULT NULL,
  `store_transaction_id` int(11) DEFAULT NULL,
  `qsp_detail_id` int(11) DEFAULT NULL,
  `customfield_generic_id` int(11) DEFAULT NULL,
  `customfield_value_id` int(11) DEFAULT NULL,
  `quantity` double(8,4) DEFAULT NULL,
  `jobcard_detail_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `contact_id` int(11) NOT NULL,
  `tin_no` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `pan_no` varchar(255) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `remark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket`
--

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
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
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
  `is_reminded` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task_attachment`
--

CREATE TABLE `task_attachment` (
  `id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxation`
--

CREATE TABLE `taxation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage` decimal(14,2) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxation_association`
--

CREATE TABLE `taxation_association` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `taxation_rule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxation_rule`
--

CREATE TABLE `taxation_rule` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `taxation_rule_row`
--

CREATE TABLE `taxation_rule_row` (
  `id` int(11) NOT NULL,
  `taxation_id` int(11) NOT NULL,
  `taxation_rule_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `team_project_association`
--

CREATE TABLE `team_project_association` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachment`
--

CREATE TABLE `ticket_attachment` (
  `id` int(11) UNSIGNED NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timesheet`
--

CREATE TABLE `timesheet` (
  `id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `remark` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tnc`
--

CREATE TABLE `tnc` (
  `id` int(11) NOT NULL,
  `content` text CHARACTER SET latin1 COLLATE latin1_general_cs,
  `name` varchar(255) DEFAULT NULL,
  `document_id` int(11) NOT NULL,
  `is_default_for_quotation` tinyint(4) DEFAULT NULL,
  `is_default_for_sale_order` tinyint(4) DEFAULT NULL,
  `is_default_for_sale_invoice` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `epan_id` int(11) DEFAULT NULL,
  `scope` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `last_login_date` date DEFAULT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xepan_template`
--

CREATE TABLE `xepan_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tags` text,
  `description` text,
  `is_active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xmarketingcampaign_googlebloggerconfig`
--

CREATE TABLE `xmarketingcampaign_googlebloggerconfig` (
  `id` int(11) NOT NULL,
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
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_balance_sheet`
--
ALTER TABLE `account_balance_sheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE;

--
-- Indexes for table `account_group`
--
ALTER TABLE `account_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `balance_sheet_id` (`balance_sheet_id`) USING BTREE,
  ADD KEY `parent_group_id` (`parent_group_id`) USING BTREE,
  ADD KEY `root_group_id` (`root_group_id`) USING BTREE;
ALTER TABLE `account_group` ADD FULLTEXT KEY `quick_search` (`name`);

--
-- Indexes for table `account_transaction`
--
ALTER TABLE `account_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `transaction_type_id` (`transaction_type_id`) USING BTREE;

--
-- Indexes for table `account_transaction_row`
--
ALTER TABLE `account_transaction_row`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `transaction_id` (`transaction_id`) USING BTREE,
  ADD KEY `ledger_id` (`ledger_id`) USING BTREE;

--
-- Indexes for table `account_transaction_types`
--
ALTER TABLE `account_transaction_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE;

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`) USING BTREE;

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `contact_id` (`contact_id`) USING BTREE,
  ADD KEY `related_contact_id` (`related_contact_id`) USING BTREE,
  ADD KEY `related_document_id` (`related_document_id`) USING BTREE;

--
-- Indexes for table `affiliate`
--
ALTER TABLE `affiliate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE,
  ADD KEY `file_id` (`file_id`) USING BTREE;

--
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `blog_post` ADD FULLTEXT KEY `search_string` (`title`,`description`,`tag`,`meta_title`,`meta_description`);

--
-- Indexes for table `blog_post_category`
--
ALTER TABLE `blog_post_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_post_category_association`
--
ALTER TABLE `blog_post_category_association`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_id` (`document_id`);

--
-- Indexes for table `campaign_category_association`
--
ALTER TABLE `campaign_category_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_category_id` (`marketing_category_id`) USING BTREE,
  ADD KEY `campaign_id` (`campaign_id`) USING BTREE;

--
-- Indexes for table `campaign_socialuser_association`
--
ALTER TABLE `campaign_socialuser_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_user_id` (`socialuser_id`) USING BTREE,
  ADD KEY `campaign_id` (`campaign_id`) USING BTREE;

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `parent_category_id` (`parent_category_id`),
  ADD KEY `cat_image_id` (`cat_image_id`) USING BTREE;

--
-- Indexes for table `category_item_association`
--
ALTER TABLE `category_item_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_document_id` (`item_id`,`category_id`),
  ADD KEY `item_id` (`item_id`) USING BTREE,
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `cms_editors`
--
ALTER TABLE `cms_editors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communication_id` (`communication_id`) USING BTREE,
  ADD KEY `ticket_id` (`ticket_id`) USING BTREE;

--
-- Indexes for table `communication`
--
ALTER TABLE `communication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_document_id` (`related_document_id`) USING BTREE;
ALTER TABLE `communication` ADD FULLTEXT KEY `search_string` (`title`,`description`,`communication_type`);

--
-- Indexes for table `communication_attachment`
--
ALTER TABLE `communication_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communication_id` (`communication_id`) USING BTREE,
  ADD KEY `file_id` (`file_id`) USING BTREE;

--
-- Indexes for table `communication_sms_setting`
--
ALTER TABLE `communication_sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_epan_id` (`epan_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `image_id` (`image_id`) USING BTREE;
ALTER TABLE `contact` ADD FULLTEXT KEY `search_string` (`search_string`);

--
-- Indexes for table `contact_info`
--
ALTER TABLE `contact_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE;

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE,
  ADD KEY `marketing_category_id` (`marketing_category_id`) USING BTREE;

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE;

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `currency_id` (`currency_id`) USING BTREE;

--
-- Indexes for table `customfield_association`
--
ALTER TABLE `customfield_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`) USING BTREE,
  ADD KEY `customfield_generic_id` (`customfield_generic_id`) USING BTREE,
  ADD KEY `department_id` (`department_id`) USING BTREE;

--
-- Indexes for table `customfield_generic`
--
ALTER TABLE `customfield_generic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sequence_order` (`sequence_order`);

--
-- Indexes for table `customfield_value`
--
ALTER TABLE `customfield_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemcustomassociation_id` (`customfield_association_id`);

--
-- Indexes for table `custom_form`
--
ALTER TABLE `custom_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_form_field`
--
ALTER TABLE `custom_form_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_form_submission`
--
ALTER TABLE `custom_form_submission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE;

--
-- Indexes for table `designer_images`
--
ALTER TABLE `designer_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designer_category_id` (`designer_category_id`) USING BTREE,
  ADD KEY `epan_id` (`epan_id`) USING BTREE;

--
-- Indexes for table `designer_image_category`
--
ALTER TABLE `designer_image_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`) USING BTREE,
  ADD KEY `epan_id` (`epan_id`) USING BTREE;

--
-- Indexes for table `discount_voucher`
--
ALTER TABLE `discount_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_voucher_condition`
--
ALTER TABLE `discount_voucher_condition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_voucher_used`
--
ALTER TABLE `discount_voucher_used`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_document_epan1_idx` (`epan_id`);
ALTER TABLE `document` ADD FULLTEXT KEY `search_string` (`search_string`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`) USING BTREE;

--
-- Indexes for table `emailsetting`
--
ALTER TABLE `emailsetting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE;

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee_contact1_idx` (`contact_id`),
  ADD KEY `fk_employee_post1_idx` (`post_id`),
  ADD KEY `department_id` (`department_id`) USING BTREE;

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_document_id` (`employee_document_id`) USING BTREE,
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `employee_movement`
--
ALTER TABLE `employee_movement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `epan`
--
ALTER TABLE `epan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_epan_category_id` (`epan_category_id`);

--
-- Indexes for table `epan_category`
--
ALTER TABLE `epan_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `epan_config`
--
ALTER TABLE `epan_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE;

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `filestore_file`
--
ALTER TABLE `filestore_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_filestore_file_filestore_type1_idx` (`filestore_type_id`) USING BTREE,
  ADD KEY `fk_filestore_file_filestore_volume1_idx` (`filestore_volume_id`) USING BTREE;

--
-- Indexes for table `filestore_image`
--
ALTER TABLE `filestore_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_filestore_image_filestore_file1_idx` (`original_file_id`) USING BTREE,
  ADD KEY `fk_filestore_image_filestore_file2_idx` (`thumb_file_id`) USING BTREE;

--
-- Indexes for table `filestore_type`
--
ALTER TABLE `filestore_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filestore_volume`
--
ALTER TABLE `filestore_volume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follower_task_association`
--
ALTER TABLE `follower_task_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`) USING BTREE,
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `installed_application`
--
ALTER TABLE `installed_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `application_id` (`application_id`) USING BTREE;

--
-- Indexes for table `invoice_transaction_association`
--
ALTER TABLE `invoice_transaction_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`) USING BTREE,
  ADD KEY `saleinvoice_id` (`salesinvoice_id`) USING BTREE;

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE,
  ADD KEY `duplicate_from_item_id` (`duplicate_from_item_id`) USING BTREE,
  ADD KEY `to_customer_id` (`to_customer_id`) USING BTREE;

--
-- Indexes for table `item_department_association`
--
ALTER TABLE `item_department_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`) USING BTREE,
  ADD KEY `item_id` (`item_id`) USING BTREE;

--
-- Indexes for table `item_department_consumption`
--
ALTER TABLE `item_department_consumption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `composition_item_id` (`composition_item_id`) USING BTREE,
  ADD KEY `item_department_association_id` (`item_department_association_id`) USING BTREE;

--
-- Indexes for table `item_image`
--
ALTER TABLE `item_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_id` (`file_id`) USING BTREE,
  ADD KEY `item_id` (`item_id`) USING BTREE,
  ADD KEY `custom_field_value_id` (`customfield_value_id`) USING BTREE;

--
-- Indexes for table `item_template_design`
--
ALTER TABLE `item_template_design`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`) USING BTREE,
  ADD KEY `contact_id` (`contact_id`) USING BTREE;

--
-- Indexes for table `jobcard`
--
ALTER TABLE `jobcard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE,
  ADD KEY `outsource_party_id` (`outsourceparty_id`) USING BTREE,
  ADD KEY `department_id` (`department_id`) USING BTREE,
  ADD KEY `oreder_item_id` (`order_item_id`) USING BTREE,
  ADD KEY `parent_jobcard_id` (`parent_jobcard_id`) USING BTREE;

--
-- Indexes for table `jobcard_detail`
--
ALTER TABLE `jobcard_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_detail_id` (`parent_detail_id`) USING BTREE,
  ADD KEY `jobcard_id` (`jobcard_id`) USING BTREE;

--
-- Indexes for table `landingresponse`
--
ALTER TABLE `landingresponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`) USING BTREE,
  ADD KEY `lead_id` (`lead_id`) USING BTREE,
  ADD KEY `opportunity_id` (`opportunity_id`) USING BTREE;

--
-- Indexes for table `lead`
--
ALTER TABLE `lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lead_contact1_idx` (`contact_id`);

--
-- Indexes for table `lead_category_association`
--
ALTER TABLE `lead_category_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`) USING BTREE,
  ADD KEY `marketing_category_id` (`marketing_category_id`) USING BTREE;

--
-- Indexes for table `ledger`
--
ALTER TABLE `ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`) USING BTREE,
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `related_id` (`related_id`) USING BTREE;
ALTER TABLE `ledger` ADD FULLTEXT KEY `search_string` (`name`,`ledger_type`,`LedgerDisplayName`);

--
-- Indexes for table `lodgement`
--
ALTER TABLE `lodgement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salesinvoice_id` (`salesinvoice_id`) USING BTREE,
  ADD KEY `account_transaction_id` (`account_transaction_id`) USING BTREE;

--
-- Indexes for table `marketingcampaign_socialconfig`
--
ALTER TABLE `marketingcampaign_socialconfig`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_epan_id` (`epan_id`);

--
-- Indexes for table `marketingcampaign_socialpostings`
--
ALTER TABLE `marketingcampaign_socialpostings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_epan_id` (`epan_id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_post_id` (`post_id`),
  ADD KEY `fk_campaign_id` (`campaign_id`);

--
-- Indexes for table `marketingcampaign_socialpostings_activities`
--
ALTER TABLE `marketingcampaign_socialpostings_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_epan_id` (`epan_id`),
  ADD KEY `fk_posting_id` (`posting_id`);

--
-- Indexes for table `marketingcampaign_socialusers`
--
ALTER TABLE `marketingcampaign_socialusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_epan_id` (`epan_id`),
  ADD KEY `fk_config_id` (`config_id`);

--
-- Indexes for table `marketingcategory`
--
ALTER TABLE `marketingcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE;

--
-- Indexes for table `opportunity`
--
ALTER TABLE `opportunity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE,
  ADD KEY `lead_id` (`lead_id`) USING BTREE;

--
-- Indexes for table `order_item_departmental_status`
--
ALTER TABLE `order_item_departmental_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qsp_detail_id` (`qsp_detail_id`) USING BTREE,
  ADD KEY `department_id` (`department_id`) USING BTREE;

--
-- Indexes for table `outsource_party`
--
ALTER TABLE `outsource_party`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`) USING BTREE,
  ADD KEY `department_id` (`department_id`) USING BTREE,
  ADD KEY `currency_id` (`currency_id`) USING BTREE;

--
-- Indexes for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gateway_image_id` (`gateway_image_id`) USING BTREE;

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post_department1_idx` (`department_id`),
  ADD KEY `parent_post_id` (`parent_post_id`) USING BTREE,
  ADD KEY `document_id` (`document_id`) USING BTREE;

--
-- Indexes for table `post_email_association`
--
ALTER TABLE `post_email_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`) USING BTREE,
  ADD KEY `email_settings_id` (`emailsetting_id`) USING BTREE;

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by_id` (`created_by_id`) USING BTREE;
ALTER TABLE `project` ADD FULLTEXT KEY `quick_search` (`name`,`description`,`type`);

--
-- Indexes for table `projectcomment`
--
ALTER TABLE `projectcomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`) USING BTREE,
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `qsp_detail`
--
ALTER TABLE `qsp_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qsp_master_id` (`qsp_master_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `taxation_id` (`taxation_id`) USING BTREE;

--
-- Indexes for table `qsp_detail_attachment`
--
ALTER TABLE `qsp_detail_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qsp_master`
--
ALTER TABLE `qsp_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document` (`document_id`),
  ADD KEY `contact_id` (`contact_id`) USING BTREE,
  ADD KEY `priority_id` (`priority_id`) USING BTREE,
  ADD KEY `tnc_id` (`tnc_id`) USING BTREE,
  ADD KEY `payment_gateway_id` (`paymentgateway_id`) USING BTREE,
  ADD KEY `related_qsp_master_id` (`related_qsp_master_id`) USING BTREE,
  ADD KEY `nominal_id` (`nominal_id`) USING BTREE;

--
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `quantity_condition`
--
ALTER TABLE `quantity_condition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qty_set_id` (`quantity_set_id`) USING BTREE,
  ADD KEY `customfield_value_id` (`customfield_value_id`) USING BTREE;

--
-- Indexes for table `quantity_set`
--
ALTER TABLE `quantity_set`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`) USING BTREE;

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`) USING BTREE,
  ADD KEY `document_id` (`document_id`) USING BTREE;

--
-- Indexes for table `shipping_association`
--
ALTER TABLE `shipping_association`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_rule`
--
ALTER TABLE `shipping_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_rule_row`
--
ALTER TABLE `shipping_rule_row`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialuser`
--
ALTER TABLE `socialuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_transaction`
--
ALTER TABLE `store_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `related_doc_id` (`related_document_id`) USING BTREE,
  ADD KEY `from_warehouse_id` (`from_warehouse_id`) USING BTREE,
  ADD KEY `to_warehouse_id` (`to_warehouse_id`) USING BTREE,
  ADD KEY `jobcard_id` (`jobcard_id`) USING BTREE;

--
-- Indexes for table `store_transaction_row`
--
ALTER TABLE `store_transaction_row`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epan_id` (`epan_id`) USING BTREE,
  ADD KEY `store_transaction_id` (`store_transaction_id`) USING BTREE,
  ADD KEY `qsp_detail_id` (`qsp_detail_id`) USING BTREE,
  ADD KEY `customfield_generic_id` (`customfield_generic_id`) USING BTREE,
  ADD KEY `customfield_value_id` (`customfield_value_id`) USING BTREE;

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `currency_id` (`currency_id`) USING BTREE;

--
-- Indexes for table `support_ticket`
--
ALTER TABLE `support_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE,
  ADD KEY `contact_id` (`contact_id`) USING BTREE,
  ADD KEY `communication_id` (`communication_id`) USING BTREE;

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `task` ADD FULLTEXT KEY `task_title_full_text` (`task_name`,`description`);

--
-- Indexes for table `task_attachment`
--
ALTER TABLE `task_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`) USING BTREE,
  ADD KEY `file_id` (`file_id`) USING BTREE;

--
-- Indexes for table `taxation`
--
ALTER TABLE `taxation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by_id` (`created_by_id`) USING BTREE;
ALTER TABLE `taxation` ADD FULLTEXT KEY `search_string` (`name`,`type`);

--
-- Indexes for table `taxation_association`
--
ALTER TABLE `taxation_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`) USING BTREE;

--
-- Indexes for table `taxation_rule`
--
ALTER TABLE `taxation_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxation_rule_row`
--
ALTER TABLE `taxation_rule_row`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_project_association`
--
ALTER TABLE `team_project_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`) USING BTREE,
  ADD KEY `project_id` (`project_id`) USING BTREE;

--
-- Indexes for table `ticket_attachment`
--
ALTER TABLE `ticket_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timesheet`
--
ALTER TABLE `timesheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`) USING BTREE,
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `tnc`
--
ALTER TABLE `tnc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_id` (`document_id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_epan1_idx` (`epan_id`),
  ADD KEY `created_by_id` (`created_by_id`) USING BTREE;
ALTER TABLE `user` ADD FULLTEXT KEY `search_string` (`username`,`type`,`scope`);

--
-- Indexes for table `xepan_template`
--
ALTER TABLE `xepan_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xmarketingcampaign_googlebloggerconfig`
--
ALTER TABLE `xmarketingcampaign_googlebloggerconfig`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_epan_id` (`epan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_balance_sheet`
--
ALTER TABLE `account_balance_sheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_group`
--
ALTER TABLE `account_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_transaction`
--
ALTER TABLE `account_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_transaction_row`
--
ALTER TABLE `account_transaction_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_transaction_types`
--
ALTER TABLE `account_transaction_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `affiliate`
--
ALTER TABLE `affiliate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_post_category`
--
ALTER TABLE `blog_post_category`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_post_category_association`
--
ALTER TABLE `blog_post_category_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_category_association`
--
ALTER TABLE `campaign_category_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_socialuser_association`
--
ALTER TABLE `campaign_socialuser_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category_item_association`
--
ALTER TABLE `category_item_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_editors`
--
ALTER TABLE `cms_editors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `communication`
--
ALTER TABLE `communication`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `communication_attachment`
--
ALTER TABLE `communication_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `communication_sms_setting`
--
ALTER TABLE `communication_sms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_info`
--
ALTER TABLE `contact_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customfield_association`
--
ALTER TABLE `customfield_association`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customfield_generic`
--
ALTER TABLE `customfield_generic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customfield_value`
--
ALTER TABLE `customfield_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_form`
--
ALTER TABLE `custom_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_form_field`
--
ALTER TABLE `custom_form_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_form_submission`
--
ALTER TABLE `custom_form_submission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `designer_images`
--
ALTER TABLE `designer_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `designer_image_category`
--
ALTER TABLE `designer_image_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discount_voucher`
--
ALTER TABLE `discount_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discount_voucher_condition`
--
ALTER TABLE `discount_voucher_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discount_voucher_used`
--
ALTER TABLE `discount_voucher_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emailsetting`
--
ALTER TABLE `emailsetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_movement`
--
ALTER TABLE `employee_movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `epan`
--
ALTER TABLE `epan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `epan_category`
--
ALTER TABLE `epan_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `epan_config`
--
ALTER TABLE `epan_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filestore_file`
--
ALTER TABLE `filestore_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filestore_image`
--
ALTER TABLE `filestore_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filestore_type`
--
ALTER TABLE `filestore_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `filestore_volume`
--
ALTER TABLE `filestore_volume`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `follower_task_association`
--
ALTER TABLE `follower_task_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `installed_application`
--
ALTER TABLE `installed_application`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_department_association`
--
ALTER TABLE `item_department_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_department_consumption`
--
ALTER TABLE `item_department_consumption`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_image`
--
ALTER TABLE `item_image`
  MODIFY `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_template_design`
--
ALTER TABLE `item_template_design`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobcard`
--
ALTER TABLE `jobcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ';
--
-- AUTO_INCREMENT for table `jobcard_detail`
--
ALTER TABLE `jobcard_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `landingresponse`
--
ALTER TABLE `landingresponse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lead`
--
ALTER TABLE `lead`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lead_category_association`
--
ALTER TABLE `lead_category_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ledger`
--
ALTER TABLE `ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lodgement`
--
ALTER TABLE `lodgement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marketingcampaign_socialconfig`
--
ALTER TABLE `marketingcampaign_socialconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marketingcampaign_socialpostings`
--
ALTER TABLE `marketingcampaign_socialpostings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marketingcampaign_socialpostings_activities`
--
ALTER TABLE `marketingcampaign_socialpostings_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marketingcampaign_socialusers`
--
ALTER TABLE `marketingcampaign_socialusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `marketingcategory`
--
ALTER TABLE `marketingcategory`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `opportunity`
--
ALTER TABLE `opportunity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_item_departmental_status`
--
ALTER TABLE `order_item_departmental_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `outsource_party`
--
ALTER TABLE `outsource_party`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post_email_association`
--
ALTER TABLE `post_email_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projectcomment`
--
ALTER TABLE `projectcomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qsp_detail`
--
ALTER TABLE `qsp_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qsp_detail_attachment`
--
ALTER TABLE `qsp_detail_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qsp_master`
--
ALTER TABLE `qsp_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quantity_condition`
--
ALTER TABLE `quantity_condition`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quantity_set`
--
ALTER TABLE `quantity_set`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shipping_association`
--
ALTER TABLE `shipping_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shipping_rule`
--
ALTER TABLE `shipping_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shipping_rule_row`
--
ALTER TABLE `shipping_rule_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialuser`
--
ALTER TABLE `socialuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store_transaction`
--
ALTER TABLE `store_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store_transaction_row`
--
ALTER TABLE `store_transaction_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `support_ticket`
--
ALTER TABLE `support_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `task_attachment`
--
ALTER TABLE `task_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `taxation`
--
ALTER TABLE `taxation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `taxation_association`
--
ALTER TABLE `taxation_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `taxation_rule`
--
ALTER TABLE `taxation_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `taxation_rule_row`
--
ALTER TABLE `taxation_rule_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `team_project_association`
--
ALTER TABLE `team_project_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ticket_attachment`
--
ALTER TABLE `ticket_attachment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tnc`
--
ALTER TABLE `tnc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xepan_template`
--
ALTER TABLE `xepan_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xmarketingcampaign_googlebloggerconfig`
--
ALTER TABLE `xmarketingcampaign_googlebloggerconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `fk_epan_id` FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT ```xepan2``.``customer``.``contact``.``id``` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`);

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk_document_epan1` FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `epan`
--
ALTER TABLE `epan`
  ADD CONSTRAINT `fk_epan_category_id` FOREIGN KEY (`epan_category_id`) REFERENCES `epan_category` (`id`);

--
-- Constraints for table `qsp_master`
--
ALTER TABLE `qsp_master`
  ADD CONSTRAINT `document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT ```xepan2``.``supplier``.``contact``.``id``` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_epan1` FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
