/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : xepan2

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-08-20 14:49:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_balance_sheet`
-- ----------------------------
DROP TABLE IF EXISTS `account_balance_sheet`;
CREATE TABLE `account_balance_sheet` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`positive_side`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`report_name`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`show_sub`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`subtract_from`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`order`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_at`  date NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of account_balance_sheet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_group`
-- ----------------------------
DROP TABLE IF EXISTS `account_group`;
CREATE TABLE `account_group` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`balance_sheet_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_at`  date NULL DEFAULT NULL ,
`parent_group_id`  int(11) NULL DEFAULT NULL ,
`root_group_id`  int(11) NULL DEFAULT NULL ,
`path`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `balance_sheet_id` (`balance_sheet_id`) USING BTREE ,
INDEX `parent_group_id` (`parent_group_id`) USING BTREE ,
INDEX `root_group_id` (`root_group_id`) USING BTREE ,
FULLTEXT INDEX `quick_search` (`name`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of account_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `account_transaction`;
CREATE TABLE `account_transaction` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`transaction_type_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Narration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`created_at`  date NULL DEFAULT NULL ,
`updated_at`  date NULL DEFAULT NULL ,
`currency_id`  int(11) NULL DEFAULT NULL ,
`exchange_rate`  decimal(8,6) NULL DEFAULT NULL ,
`related_id`  bigint(20) NULL DEFAULT NULL ,
`related_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`round_amount`  decimal(8,2) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `transaction_type_id` (`transaction_type_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of account_transaction
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_transaction_row`
-- ----------------------------
DROP TABLE IF EXISTS `account_transaction_row`;
CREATE TABLE `account_transaction_row` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`transaction_id`  int(11) NULL DEFAULT NULL ,
`ledger_id`  int(11) NULL DEFAULT NULL ,
`_amountDr`  double NULL DEFAULT NULL ,
`_amountCr`  double NULL DEFAULT NULL ,
`side`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`accounts_in_side`  int(11) NULL DEFAULT NULL ,
`currency_id`  int(11) NULL DEFAULT NULL ,
`exchange_rate`  double NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `transaction_id` (`transaction_id`) USING BTREE ,
INDEX `ledger_id` (`ledger_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of account_transaction_row
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_transaction_types`
-- ----------------------------
DROP TABLE IF EXISTS `account_transaction_types`;
CREATE TABLE `account_transaction_types` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`FromAC`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ToAC`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Default_Narration`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of account_transaction_types
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `acl`
-- ----------------------------
DROP TABLE IF EXISTS `acl`;
CREATE TABLE `acl` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`post_id`  int(11) NULL DEFAULT NULL ,
`type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`action_allowed`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`allow_add`  tinyint(4) NULL DEFAULT NULL ,
`namespace`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `post_id` (`post_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=50

;

-- ----------------------------
-- Records of acl
-- ----------------------------
BEGIN;
INSERT INTO `acl` VALUES ('1', '1', '2', 'Department', '[]', '1', 'xepan\\hr'), ('2', '1', '2', 'Post', '[]', '1', 'xepan\\hr'), ('3', '1', '2', 'CustomField', '[]', '1', 'xepan\\commerce'), ('4', '1', '2', 'Item', '[]', '1', 'xepan\\commerce'), ('5', '1', '2', 'Specification', '[]', '1', 'xepan\\commerce'), ('6', '1', '2', 'Customer', '[]', '1', 'xepan\\commerce'), ('7', '1', '2', 'User', '[]', '1', 'xepan\\base'), ('8', '1', '2', 'Category', '[]', '1', 'xepan\\commerce'), ('9', '1', '2', 'Store_Transaction', '[]', '1', 'xepan\\commerce'), ('10', '1', '2', 'PostCategory', '[]', '1', 'xepan\\blog'), ('11', '1', '2', 'BlogPost', '[]', '1', 'xepan\\blog'), ('12', '1', '2', 'Jobcard', '[]', '1', 'xepan\\production'), ('13', '1', '2', 'Lead', '[]', '1', 'xepan\\marketing'), ('14', '1', '2', 'SalesOrder', '[]', '1', 'xepan\\commerce'), ('15', '1', '2', 'SalesInvoice', '[]', '1', 'xepan\\commerce'), ('16', '1', '2', 'MarketingCategory', '[]', '1', 'xepan\\marketing'), ('17', '1', '2', 'Opportunity', '[]', '1', 'xepan\\marketing'), ('18', '1', '2', 'Country', '[]', '1', 'xepan\\base'), ('19', '1', '2', 'Newsletter', '[]', '1', 'xepan\\marketing'), ('20', '1', '2', 'SupportTicket', '[]', '1', 'xepan\\crm'), ('21', '1', '2', 'PurchaseOrder', '[]', '1', 'xepan\\commerce'), ('22', '1', '2', 'Employee', '[]', '1', 'xepan\\hr'), ('23', '1', '2', 'Taxation', '[]', '1', 'xepan\\commerce'), ('24', '1', '2', 'Taxation_Rule', '[]', '1', 'xepan\\commerce'), ('25', '1', '2', 'Shipping_Rule', '[]', '1', 'xepan\\commerce'), ('26', '1', '2', 'Taxation_Rule_Row', '[]', '1', 'xepan\\commerce'), ('27', '1', '2', 'Epan', '[]', '1', 'xepan\\epanservices'), ('28', '1', '2', 'TaxationRule', '[]', '1', 'xepan\\commerce'), ('29', '1', '2', 'SocialPost', '[]', '1', 'xepan\\marketing'), ('30', '1', '2', 'Campaign', '[]', '1', 'xepan\\marketing'), ('31', '1', '2', 'BlogComment', '[]', '1', 'xepan\\blog'), ('32', '1', '2', 'Contact', '[]', '1', 'xepan\\marketing'), ('33', '1', '2', 'TeleCommunication', '[]', '1', 'xepan\\marketing'), ('34', '1', '2', 'Employee', '[]', '1', 'xepan\\marketing'), ('35', '1', '2', 'project', '[]', '1', 'xepan\\projects'), ('36', '1', '2', 'SocialPosters_Facebook_FacebookConfig', '[]', '1', 'xepan\\marketing'), ('37', '1', '2', 'SocialPosters_Base_SocialConfig', '[]', '1', 'xepan\\marketing'), ('38', '1', '2', 'socialPosting', '[]', '1', 'xepan\\marketing'), ('39', '1', '2', 'Customer', '[]', '1', 'xepan\\marketing'), ('40', '1', '2', 'SocialPosters_Linkedin_LinkedinConfig', '[]', '1', 'xepan\\marketing'), ('41', '1', '2', 'Affiliate', '[]', '1', 'xepan\\hr'), ('42', '1', '2', 'Sms', '[]', '1', 'xepan\\marketing'), ('43', '1', '2', 'Ledger', '[]', '1', 'xepan\\accounts'), ('44', '1', '2', 'Currency', '[]', '1', 'xepan\\accounts'), ('45', '1', '2', 'AccountEntryTemplate', '[]', '1', 'xepan\\accounts'), ('46', '1', '2', 'Supplier', '[]', '1', 'xepan\\commerce'), ('47', '1', '2', 'Quotation', '[]', '1', 'xepan\\commerce'), ('48', '1', '2', 'Discount_Voucher', '[]', '1', 'xepan\\commerce'), ('49', '1', '2', 'TNC', '[]', '1', 'xepan\\commerce');
COMMIT;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`contact_id`  int(11) NULL DEFAULT NULL ,
`related_contact_id`  int(11) NULL DEFAULT NULL ,
`related_document_id`  int(11) NULL DEFAULT NULL ,
`activity`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`details`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`created_at`  datetime NULL DEFAULT NULL ,
`notify_to`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`notification`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`document_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `contact_id` (`contact_id`) USING BTREE ,
INDEX `related_contact_id` (`related_contact_id`) USING BTREE ,
INDEX `related_document_id` (`related_document_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=122

;

-- ----------------------------
-- Records of activity
-- ----------------------------
BEGIN;
INSERT INTO `activity` VALUES ('1', '1', null, '6', '57', ' Amount \'2000.00\' of sales invoice no. \'4\' have been recieved  ', null, '2016-06-14 11:48:20', '[]', null, null), ('2', '1', null, '6', '56', 'Sales Order no. \'4\' has submitted', null, '2016-06-14 11:48:20', '[]', null, null), ('3', '1', null, '6', '71', ' Amount \'200000.00\' of sales invoice no. \'11\' have been recieved  ', null, '2016-06-14 12:18:40', '[]', null, null), ('4', '1', null, '6', '70', 'Sales Order no. \'11\' has submitted', null, '2016-06-14 12:18:40', '[]', null, null), ('5', '1', null, '6', '71', ' Amount \'200000.00\' of sales invoice no. \'11\' have been recieved  ', null, '2016-06-14 12:48:39', '[]', null, null), ('6', '1', null, '6', '70', 'Sales Order no. \'11\' has submitted', null, '2016-06-14 12:48:39', '[]', null, null), ('7', '1', null, '6', '81', ' Amount \'2000.00\' of sales invoice no. \'15\' have been recieved  ', null, '2016-06-14 12:53:34', '[]', null, null), ('8', '1', null, '6', '80', 'Sales Order no. \'15\' has submitted', null, '2016-06-14 12:53:34', '[]', null, null), ('9', '1', null, '6', '81', ' Amount \'2000.00\' of sales invoice no. \'15\' have been recieved  ', null, '2016-06-14 12:53:56', '[]', null, null), ('10', '1', null, '6', '80', 'Sales Order no. \'15\' has submitted', null, '2016-06-14 12:53:56', '[]', null, null), ('11', '1', null, '6', '81', ' Amount \'2000.00\' of sales invoice no. \'15\' have been recieved  ', null, '2016-06-14 12:56:17', '[]', null, null), ('12', '1', null, '6', '80', 'Sales Order no. \'15\' has submitted', null, '2016-06-14 12:56:17', '[]', null, null), ('13', '1', null, '6', '83', ' Amount \'2000.00\' of sales invoice no. \'16\' have been recieved  ', null, '2016-06-14 12:58:59', '[]', null, null), ('14', '1', null, '6', '82', 'Sales Order no. \'16\' has submitted', null, '2016-06-14 12:58:59', '[]', null, null), ('15', '1', null, '6', '87', ' Amount \'2000.00\' of sales invoice no. \'18\' have been recieved  ', null, '2016-06-14 13:30:31', '[]', null, null), ('16', '1', null, '6', '86', 'Sales Order no. \'18\' has submitted', null, '2016-06-14 13:30:31', '[]', null, null), ('17', '1', '1', null, '102', 'Item \'Digital Marketing\' has been unpublished', null, '2016-06-22 09:56:19', '[]', null, null), ('18', '1', '1', null, '103', 'Item \'CRM\' has been unpublished', null, '2016-06-22 09:56:29', '[]', null, null), ('19', '1', '1', '9', '48', 'Invoice Deleted', null, '2016-06-23 09:24:44', '[]', null, null), ('20', '1', '1', '9', '112', 'Invoice Deleted', null, '2016-06-23 09:46:17', '[]', null, null), ('21', '1', '1', null, '120', 'Submitted Newsletter', null, '2016-06-27 16:05:14', '[]', null, null), ('22', '1', '1', null, '120', 'Approved Newsletter', null, '2016-06-27 16:05:24', '[]', null, null), ('23', '1', '1', null, '119', 'Submitted Campaign', null, '2016-06-28 07:12:20', '[]', null, null), ('24', '1', '1', null, '119', 'Approved Campaign', null, '2016-06-28 07:12:27', '[]', null, null), ('25', '1', '1', null, '119', 'Rejected Campaign', null, '2016-06-28 19:13:45', '[]', null, null), ('26', '1', '1', null, '147', 'Submitted Newsletter', null, '2016-06-30 14:48:43', '[]', null, null), ('27', '1', '1', null, '147', 'Approved Newsletter', null, '2016-06-30 14:48:47', '[]', null, null), ('28', '1', '1', null, '119', 'Submitted Campaign', null, '2016-06-30 15:26:45', '[]', null, null), ('29', '1', '1', null, '119', 'Approved Campaign', null, '2016-06-30 15:26:50', '[]', null, null), ('30', '1', '1', '11', '146', 'Invoice Deleted', null, '2016-06-30 17:43:33', '[]', null, null), ('31', '1', '1', '11', '144', 'Invoice Deleted', null, '2016-06-30 17:43:46', '[]', null, null), ('32', '1', '1', '11', '142', 'Invoice Deleted', null, '2016-06-30 17:43:51', '[]', null, null), ('33', '1', '1', '11', '140', 'Invoice Deleted', null, '2016-06-30 17:43:55', '[]', null, null), ('34', '1', '1', '11', '138', 'Invoice Deleted', null, '2016-06-30 17:43:58', '[]', null, null), ('35', '1', '1', '11', '136', 'Invoice Deleted', null, '2016-06-30 17:44:02', '[]', null, null), ('36', '1', '1', '11', '134', 'Invoice Deleted', null, '2016-06-30 17:44:06', '[]', null, null), ('37', '1', '1', '11', '132', 'Invoice Deleted', null, '2016-06-30 17:44:08', '[]', null, null), ('38', '1', '1', '11', '130', 'Invoice Deleted', null, '2016-06-30 17:44:11', '[]', null, null), ('39', '1', '1', '11', '128', 'Invoice Deleted', null, '2016-06-30 17:44:14', '[]', null, null), ('40', '1', '1', '11', '126', 'Invoice Deleted', null, '2016-06-30 17:44:17', '[]', null, null), ('41', '1', '1', '11', '124', 'Invoice Deleted', null, '2016-06-30 17:44:22', '[]', null, null), ('42', '1', '1', '3', null, 'Blog Post \'Launching Startup! Read \'Step 1\' To increase your success rate\' not available for show on web', null, '2016-07-01 22:52:52', '[]', null, null), ('43', '1', '1', null, '148', 'Submitted Newsletter', null, '2016-07-01 23:59:53', '[]', null, null), ('44', '1', '1', null, '148', 'Approved Newsletter', null, '2016-07-01 23:59:59', '[]', null, null), ('45', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-02 00:00:17', '[]', null, null), ('46', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-02 00:00:25', '[]', null, null), ('47', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-02 00:00:31', '[]', null, null), ('48', '1', '1', '3', null, 'Blog Post \'Launching Startup! Read \'Step 1\' To increase your success rate\' can be view on web', null, '2016-07-02 11:14:40', '[]', null, null), ('49', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-02 13:54:47', '[]', null, null), ('50', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-02 13:54:51', '[]', null, null), ('51', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-02 14:43:18', '[]', null, null), ('52', '1', '1', null, '151', 'Submitted Newsletter', null, '2016-07-02 14:43:56', '[]', null, null), ('53', '1', '1', null, '151', 'Approved Newsletter', null, '2016-07-02 14:44:02', '[]', null, null), ('54', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-02 14:44:59', '[]', null, null), ('55', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-02 14:45:02', '[]', null, null), ('56', '1', '1', '5', null, 'This \'jnmmn\' comment pending to show on web', null, '2016-07-02 14:53:12', '[]', null, null), ('57', '1', '1', null, null, ' Communicated ', null, '2016-07-03 22:56:59', '[]', null, null), ('58', '1', '1', null, null, ' Communicated ', null, '2016-07-03 22:56:59', '[]', null, null), ('59', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-04 15:28:47', '[]', null, null), ('60', '1', '1', null, null, ' Communicated ', null, '2016-07-04 20:08:15', '[]', null, null), ('61', '1', '1', null, null, ' Communicated ', null, '2016-07-04 20:08:15', '[]', null, null), ('62', '1', '1', null, null, ' Communicated ', null, '2016-07-05 09:33:47', '[]', null, null), ('63', '1', '1', null, null, ' Communicated ', null, '2016-07-05 09:33:47', '[]', null, null), ('64', '1', '1', '5', null, 'Blog Post \'What if we can code humans.  Comparing humans with machine !\' not available for show on web', null, '2016-07-18 11:37:25', '[]', null, null), ('65', '1', '1', '14', null, 'Blog Post \'5 Common mistakes we make which reduces business productivity\' can be view on web', null, '2016-07-18 15:38:29', '[]', null, null), ('66', '1', '1', '14', null, 'Blog Post \'5 Common mistakes we make which reduces business productivity\' not available for show on web', null, '2016-07-18 15:40:58', '[]', null, null), ('67', '1', '1', '14', null, 'Blog Post \'5 Common mistakes we make which reduces business productivity\' can be view on web', null, '2016-07-18 16:57:31', '[]', null, null), ('68', '1', '1', '14', null, 'Blog Post \'5 Common mistakes we make which reduces business productivity\' not available for show on web', null, '2016-07-18 16:58:07', '[]', null, null), ('69', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-23 18:23:50', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id=119'), ('70', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-23 18:23:54', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('71', '1', '1', null, '181', '\'What if we can code humans. Comparing humans with machine ! - Author: Vaibhav Sharma\' named social post has been submitted ', null, '2016-07-23 18:26:09', '[]', null, 'xepan_marketing_socialpost&post_id=181'), ('72', '1', '1', null, '181', '\'What if we can code humans. Comparing humans with machine ! - Author: Vaibhav Sharma\' named social post approved ', null, '2016-07-23 18:26:14', '[]', null, 'xepan_marketing_socialpost&post_id=181'), ('73', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-23 18:28:07', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('74', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-23 18:35:06', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id=119'), ('75', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-23 18:35:11', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('76', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-23 18:36:19', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('77', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-23 18:37:19', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id=119'), ('78', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-23 18:37:22', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('79', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-23 20:31:36', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('80', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-23 20:32:25', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id=119'), ('81', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-23 20:32:31', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('82', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-23 20:43:41', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('83', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-23 20:44:39', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id=119'), ('84', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-23 20:44:44', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('85', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-24 10:10:57', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('86', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-24 10:15:35', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id=119'), ('87', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-24 10:15:40', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('88', '1', '1', null, '119', 'Rejected Campaign', null, '2016-07-24 10:20:32', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('89', '1', '1', null, '119', 'Submitted Campaign', null, '2016-07-24 10:21:07', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id=119'), ('90', '1', '1', null, '119', 'Approved Campaign', null, '2016-07-24 10:21:11', '[]', null, 'xepan_marketing_subscriberschedule&campaign_id119'), ('91', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-07-28 15:30:02', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=192'), ('92', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-07-28 15:30:02', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=193'), ('93', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-07-28 17:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=195'), ('94', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-07-28 17:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=196'), ('95', '1', null, '42', null, ' Communicated Kalpana Bhanawat', null, '2016-07-30 11:32:34', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=203'), ('96', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-02 00:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=208'), ('97', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-02 00:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=209'), ('98', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-02 00:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=210'), ('99', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-02 00:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=211'), ('100', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-02 00:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=212');
INSERT INTO `activity` VALUES ('101', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-02 00:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=213'), ('102', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-02 00:00:01', '[\"1\",\"31\"]', null, 'xepan_communication_viewer&comm_id=214'), ('103', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-07 00:00:02', null, null, 'xepan_communication_viewer&comm_id=224'), ('104', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-07 00:00:02', null, null, 'xepan_communication_viewer&comm_id=225'), ('105', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-07 00:00:02', null, null, 'xepan_communication_viewer&comm_id=226'), ('106', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-07 00:00:02', null, null, 'xepan_communication_viewer&comm_id=227'), ('107', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-12 00:00:01', null, null, 'xepan_communication_viewer&comm_id=234'), ('108', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-12 00:00:01', null, null, 'xepan_communication_viewer&comm_id=235'), ('109', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-12 00:00:01', null, null, 'xepan_communication_viewer&comm_id=236'), ('110', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-12 00:00:01', null, null, 'xepan_communication_viewer&comm_id=237'), ('111', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-12 00:00:01', null, null, 'xepan_communication_viewer&comm_id=238'), ('112', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-12 00:00:01', null, null, 'xepan_communication_viewer&comm_id=239'), ('113', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-12 00:00:01', null, null, 'xepan_communication_viewer&comm_id=240'), ('114', '1', '1', '20', null, 'Blog Post \'Social blast &amp; internet has given local maxima and compromised satisfaction.\' not available for show on web', null, '2016-08-16 00:23:15', '[\"1\",\"31\"]', null, null), ('115', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-17 00:00:01', null, null, 'xepan_communication_viewer&comm_id=247'), ('116', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-17 00:00:01', null, null, 'xepan_communication_viewer&comm_id=248'), ('117', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-17 00:00:01', null, null, 'xepan_communication_viewer&comm_id=249'), ('118', '1', null, '3', null, ' Communicated Deepak Modi', null, '2016-08-17 00:00:01', null, null, 'xepan_communication_viewer&comm_id=250'), ('119', '1', null, '28', null, ' Communicated Vaibhav Sharma', null, '2016-08-17 10:36:27', null, null, 'xepan_communication_viewer&comm_id=252'), ('120', '1', null, '28', null, ' Communicated Vaibhav Sharma', null, '2016-08-17 10:37:43', null, null, 'xepan_communication_viewer&comm_id=253'), ('121', '1', null, '43', null, ' Communicated Test User', null, '2016-08-17 11:46:54', null, null, 'xepan_communication_viewer&comm_id=256');
COMMIT;

-- ----------------------------
-- Table structure for `affiliate`
-- ----------------------------
DROP TABLE IF EXISTS `affiliate`;
CREATE TABLE `affiliate` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`narration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`contact_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of affiliate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `application`
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`namespace`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`user_installable`  tinyint(4) NULL DEFAULT 1 ,
`default_currency_price`  double(8,4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of application
-- ----------------------------
BEGIN;
INSERT INTO `application` VALUES ('1', 'hr', 'xepan\\hr', '1', null), ('2', 'communication', 'xepan\\communication', '1', null), ('3', 'projects', 'xepan\\projects', '1', null), ('4', 'marketing', 'xepan\\marketing', '1', null), ('5', 'accounts', 'xepan\\accounts', '1', null), ('6', 'commerce', 'xepan\\commerce', '1', null), ('7', 'production', 'xepan\\production', '1', null), ('8', 'crm', 'xepan\\crm', '1', null), ('9', 'cms', 'xepan\\cms', '1', null), ('10', 'epanservices', 'xepan\\epanservices', '1', null), ('11', 'blog', 'xepan\\blog', '1', null);
COMMIT;

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`document_id`  int(11) NULL DEFAULT NULL ,
`file_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE ,
INDEX `file_id` (`file_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`created_by_id`  int(11) NOT NULL ,
`comment`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`status`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`type`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`blog_post_id`  int(11) NOT NULL ,
`comment_date`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=8

;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
BEGIN;
INSERT INTO `blog_comment` VALUES ('2', '13', 'You  Should develop this type of theme www.buypeel.com', 'Approved', 'BlogComment', '1', '2016-06-28 15:06:59'), ('4', '2', 'Hey Navjeet, Thank you for pointing to a good template. Yes, another template designing team is working on various templates and we have forwarded your choice too, hope to see this or similar to this template very soon ;) Any how we are updating our documentation and you can anytime follow that to create any of template by your self too.', 'Approved', 'BlogComment', '1', '2016-06-29 10:21:13'), ('6', '0', 'Well, it\'s easy to solve this November/December puzzle. In one word - it\'s Christmas time.\r\nBasically all search terms which relate to some kind of possible Christmas presents - laptop, amazon, ebay, android and probably many more will be on top in November/December. But all search terms which are related to work will go down because of holidays.', 'Approved', 'BlogComment', '2', '2016-07-03 03:38:35'), ('7', '1', 'well said !!! IT skill in combination of such thoughts makes our coders more logical and HUMAN ;) Loved this short read (y)', 'Approved', 'BlogComment', '5', '2016-07-22 23:27:38');
COMMIT;

-- ----------------------------
-- Table structure for `blog_post`
-- ----------------------------
DROP TABLE IF EXISTS `blog_post`;
CREATE TABLE `blog_post` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`created_by_id`  int(11) NOT NULL ,
`title`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`description`  longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`tag`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`meta_title`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`meta_description`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`created_at`  datetime NOT NULL ,
`status`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`type`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`image_id`  int(11) NULL DEFAULT NULL ,
`anonymous_comment_config`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`registered_comment_config`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`show_comments`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`order`  int(11) NOT NULL ,
`updated_at`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FULLTEXT INDEX `search_string` (`title`, `description`, `tag`, `meta_title`, `meta_description`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=21

;

-- ----------------------------
-- Records of blog_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `blog_post_category`
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_category`;
CREATE TABLE `blog_post_category` (
`id`  tinyint(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`status`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`created_by_id`  int(11) NOT NULL ,
`order`  int(11) NULL DEFAULT NULL ,
`group`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of blog_post_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `blog_post_category_association`
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_category_association`;
CREATE TABLE `blog_post_category_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`blog_post_id`  int(11) NOT NULL ,
`blog_post_category_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=33

;

-- ----------------------------
-- Records of blog_post_category_association
-- ----------------------------
BEGIN;
INSERT INTO `blog_post_category_association` VALUES ('1', '1', '1'), ('2', '2', '1'), ('3', '3', '1'), ('4', '4', '1'), ('5', '5', '1'), ('6', '6', '1'), ('7', '7', '1'), ('8', '8', '1'), ('9', '9', '1'), ('10', '10', '1'), ('11', '11', '1'), ('12', '12', '1'), ('13', '13', '1'), ('14', '14', '1'), ('28', '16', '3'), ('30', '15', '3'), ('31', '19', '3'), ('32', '20', '1');
COMMIT;

-- ----------------------------
-- Table structure for `campaign`
-- ----------------------------
DROP TABLE IF EXISTS `campaign`;
CREATE TABLE `campaign` (
`document_id`  int(11) NOT NULL ,
`schedule`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`starting_date`  datetime NOT NULL ,
`ending_date`  datetime NOT NULL ,
`campaign_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
PRIMARY KEY (`id`),
UNIQUE INDEX `document_id` (`document_id`) USING BTREE ,
FULLTEXT INDEX `search_string` (`title`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of campaign
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `campaign_category_association`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_category_association`;
CREATE TABLE `campaign_category_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`marketing_category_id`  int(11) NOT NULL ,
`campaign_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `marketing_category_id` (`marketing_category_id`) USING BTREE ,
INDEX `campaign_id` (`campaign_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=8

;

-- ----------------------------
-- Records of campaign_category_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `campaign_socialuser_association`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_socialuser_association`;
CREATE TABLE `campaign_socialuser_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`socialuser_id`  int(11) NOT NULL ,
`campaign_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `social_user_id` (`socialuser_id`) USING BTREE ,
INDEX `campaign_id` (`campaign_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=18

;

-- ----------------------------
-- Records of campaign_socialuser_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`document_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`display_sequence`  int(11) NOT NULL ,
`alt_text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`meta_title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`meta_description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`meta_keywords`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`parent_category_id`  int(11) NULL DEFAULT NULL ,
`custom_link`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`cat_image_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE ,
INDEX `parent_category_id` (`parent_category_id`) USING BTREE ,
INDEX `cat_image_id` (`cat_image_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES ('1', '10', 'Epan', '0', '', '', '', '', '', null, '', null);
COMMIT;

-- ----------------------------
-- Table structure for `category_item_association`
-- ----------------------------
DROP TABLE IF EXISTS `category_item_association`;
CREATE TABLE `category_item_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`item_id`  int(11) NOT NULL ,
`category_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `item_document_id` (`item_id`, `category_id`) USING BTREE ,
INDEX `item_id` (`item_id`) USING BTREE ,
INDEX `category_id` (`category_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=16

;

-- ----------------------------
-- Records of category_item_association
-- ----------------------------
BEGIN;
INSERT INTO `category_item_association` VALUES ('1', '6', '10'), ('2', '12', '10'), ('8', '97', '10'), ('9', '98', '10'), ('10', '99', '10'), ('11', '100', '10'), ('12', '101', '10'), ('13', '102', '10'), ('14', '103', '10'), ('15', '104', '10');
COMMIT;

-- ----------------------------
-- Table structure for `cms_editors`
-- ----------------------------
DROP TABLE IF EXISTS `cms_editors`;
CREATE TABLE `cms_editors` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NULL DEFAULT NULL ,
`can_edit_template`  tinyint(4) NULL DEFAULT NULL ,
`can_edit_page_content`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of cms_editors
-- ----------------------------
BEGIN;
INSERT INTO `cms_editors` VALUES ('1', '1', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`communication_id`  int(11) NULL DEFAULT NULL ,
`ticket_id`  int(11) NULL DEFAULT NULL ,
`created_by`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_at`  datetime NULL DEFAULT NULL ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `communication_id` (`communication_id`) USING BTREE ,
INDEX `ticket_id` (`ticket_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of comments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `communication`
-- ----------------------------
DROP TABLE IF EXISTS `communication`;
CREATE TABLE `communication` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`mailbox`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`uid`  int(11) NULL DEFAULT NULL ,
`from_id`  int(11) NULL DEFAULT NULL ,
`to_id`  int(11) NULL DEFAULT NULL ,
`related_document_id`  int(11) NULL DEFAULT NULL ,
`from_raw`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`to_raw`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`cc_raw`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`bcc_raw`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`communication_type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`flags`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`tags`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`direction`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`uuid`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`reply_to`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`detailed`  tinyint(4) NULL DEFAULT NULL ,
`is_starred`  tinyint(4) NULL DEFAULT NULL ,
`related_id`  int(11) NULL DEFAULT NULL ,
`sent_on`  date NULL DEFAULT NULL ,
`created_at`  datetime NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`extra_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `related_document_id` (`related_document_id`) USING BTREE ,
FULLTEXT INDEX `search_string` (`title`, `description`, `communication_type`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of communication
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `communication_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `communication_attachment`;
CREATE TABLE `communication_attachment` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`communication_id`  int(11) NOT NULL ,
`file_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `communication_id` (`communication_id`) USING BTREE ,
INDEX `file_id` (`file_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of communication_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `communication_sms_setting`
-- ----------------------------
DROP TABLE IF EXISTS `communication_sms_setting`;
CREATE TABLE `communication_sms_setting` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`gateway_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sms_username`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sms_password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sms_user_name_qs_param`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sms_password_qs_param`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sms_number_qs_param`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sm_message_qs_param`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sms_prefix`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sms_postfix`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of communication_sms_setting
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`first_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`last_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`city`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`state_id`  int(11) NULL DEFAULT NULL ,
`country_id`  int(11) NULL DEFAULT NULL ,
`pin_code`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`organization`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`post`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`website`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`image_id`  int(10) UNSIGNED NULL DEFAULT NULL ,
`user_id`  int(11) NULL DEFAULT NULL ,
`created_at`  datetime NULL DEFAULT NULL ,
`updated_at`  datetime NULL DEFAULT NULL ,
`created_by_id`  int(11) NOT NULL ,
`search_string`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`source`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`remark`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `fk_epan_id` (`epan_id`) USING BTREE ,
INDEX `user_id` (`user_id`) USING BTREE ,
INDEX `image_id` (`image_id`) USING BTREE ,
FULLTEXT INDEX `search_string` (`search_string`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=44

;

-- ----------------------------
-- Records of contact
-- ----------------------------
BEGIN;
INSERT INTO `contact` VALUES ('1', '1', 'Gowrav', 'Vishwakarma', 'Employee', 'Active', '', '', null, null, '', '', null, '', null, '1', '2016-06-02 23:19:14', '2016-08-16 16:07:14', '0', '   114  2016-06-02      Gowrav Vishwakarma', null, null);
COMMIT;

-- ----------------------------
-- Table structure for `contact_info`
-- ----------------------------
DROP TABLE IF EXISTS `contact_info`;
CREATE TABLE `contact_info` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`head`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_active`  tinyint(1) NULL DEFAULT 1 ,
`is_valid`  tinyint(4) NULL DEFAULT 1 ,
`type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=25

;

-- ----------------------------
-- Records of contact_info
-- ----------------------------
BEGIN;
INSERT INTO `contact_info` VALUES ('1', '1', 'Personal', 'deepakhmodi@gmail.com', '1', '1', 'Email', '3'), ('2', '1', 'Personal', '9785700672', '1', '1', 'Phone', '3'), ('3', '1', 'Personal', 'vijay.mali552@gmail.com', '1', '1', 'Email', '6'), ('4', '1', 'DOB', '2016-06-15', '1', '1', 'Event', '3'), ('15', '1', 'Official', 'vaibhavsharma38@gmail.com', '1', '1', 'Email', '28'), ('16', '1', 'Official', 'gowravvishwakarma@gmail.com', '1', '1', 'Email', '30'), ('23', '1', 'Official', 'kalpanabhanawat1995@gmail.com', '1', '1', 'Email', '42'), ('24', '1', 'Official', 'test@abc.om', '1', '1', 'Email', '43');
COMMIT;

-- ----------------------------
-- Table structure for `content`
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`message_255`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`title`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`document_id`  int(11) NOT NULL ,
`marketing_category_id`  int(11) NOT NULL ,
`is_template`  tinyint(1) NOT NULL ,
`message_3000`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`message_blog`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`message_160`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE ,
INDEX `marketing_category_id` (`marketing_category_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of content
-- ----------------------------
BEGIN;
INSERT INTO `content` VALUES ('9', '', 'How To Configure SSH Key-Based Authentication on a Linux Server - Author: Vijay Mali', '188', '3', '0', '', '', 'https://epan.in?page=blog-item&post_id=16', '', null);
COMMIT;

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`iso_code`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of country
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
`document_id`  int(11) NULL DEFAULT NULL ,
`icon`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`value`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`integer_part`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`fractional_part`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of currency
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `custom_account_entries_templates`
-- ----------------------------
DROP TABLE IF EXISTS `custom_account_entries_templates`;
CREATE TABLE `custom_account_entries_templates` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`detail`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`is_favourite_menu_lister`  tinyint(4) NULL DEFAULT NULL ,
`is_merge_transaction`  tinyint(4) NULL DEFAULT NULL ,
`unique_trnasaction_template_code`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_system_default`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of custom_account_entries_templates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `custom_account_entries_templates_transaction_row`
-- ----------------------------
DROP TABLE IF EXISTS `custom_account_entries_templates_transaction_row`;
CREATE TABLE `custom_account_entries_templates_transaction_row` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`side`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`group`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`is_include_subgroup_ledger_account`  tinyint(4) NULL DEFAULT NULL ,
`parent_group`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`ledger`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`is_ledger_changable`  tinyint(4) NULL DEFAULT NULL ,
`is_allow_add_ledger`  tinyint(4) NULL DEFAULT NULL ,
`is_include_currency`  tinyint(4) NULL DEFAULT NULL ,
`template_transaction_id`  int(11) NULL DEFAULT NULL ,
`balance_sheet`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`ledger_type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`title`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of custom_account_entries_templates_transaction_row
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `custom_account_entries_templates_transactions`
-- ----------------------------
DROP TABLE IF EXISTS `custom_account_entries_templates_transactions`;
CREATE TABLE `custom_account_entries_templates_transactions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`template_id`  int(11) NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of custom_account_entries_templates_transactions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `custom_form`
-- ----------------------------
DROP TABLE IF EXISTS `custom_form`;
CREATE TABLE `custom_form` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`submit_button_name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`form_layout`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`custom_form_layout_path`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`recieve_email`  tinyint(4) NULL DEFAULT NULL ,
`recipient_email`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`auto_reply`  tinyint(4) NULL DEFAULT NULL ,
`message_body`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`email_subject`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`emailsetting_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of custom_form
-- ----------------------------
BEGIN;
INSERT INTO `custom_form` VALUES ('1', 'If Any Enquiry', 'Queries ??', 'horizontal', '', '1', 'info@xavoc.com', '1', 'It is pleasure with us, that you querying about our epan. We will definitely replied to as per your queries.', 'Thank You For Queries ', '1');
COMMIT;

-- ----------------------------
-- Table structure for `custom_form_field`
-- ----------------------------
DROP TABLE IF EXISTS `custom_form_field`;
CREATE TABLE `custom_form_field` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`custom_form_id`  int(11) NULL DEFAULT NULL ,
`value`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`is_mandatory`  tinyint(4) NULL DEFAULT NULL ,
`hint`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`placeholder`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`auto_reply`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of custom_form_field
-- ----------------------------
BEGIN;
INSERT INTO `custom_form_field` VALUES ('1', '1', '', '1', 'Your Name', '', 'Name', 'line', '0'), ('2', '1', '', '1', 'example@something.com', '', 'Email', 'email', '1'), ('4', '1', '', '0', 'Any message', '', 'Message', 'text', '0');
COMMIT;

-- ----------------------------
-- Table structure for `custom_form_submission`
-- ----------------------------
DROP TABLE IF EXISTS `custom_form_submission`;
CREATE TABLE `custom_form_submission` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`custom_form_id`  int(11) NOT NULL ,
`value`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of custom_form_submission
-- ----------------------------
BEGIN;
INSERT INTO `custom_form_submission` VALUES ('1', '1', '{\"Name\":\"Deepak\",\"Email\":\"dkanojia93@gmail.com\",\"Message\":\"no comment\"}'), ('2', '1', '{\"Name\":\"Deepak\",\"Email\":\"dkanojia93@gmail.com\",\"Message\":\"No message\"}'), ('3', '1', '{\"Name\":\"Deepak\",\"Email\":\"dkanojia93@gmail.com\",\"Message\":\"No message\"}'), ('4', '1', '{\"Name\":\"Deepak\",\"Email\":\"dkanojia93@gmail.com\",\"Message\":\"no message\\r\\n\"}'), ('5', '1', '{\"Name\":\"Deepak\",\"Email\":\"dkanojia93@gmail.com\",\"Message\":\"no message\\r\\n\"}'), ('6', '1', '{\"Name\":\"Deepak\",\"Email\":\"dkanojia93@gmail.com\",\"Message\":\"no message\"}');
COMMIT;

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
`contact_id`  int(11) NOT NULL ,
`billing_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`billing_city`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`billing_state_id`  int(11) NULL DEFAULT NULL ,
`billing_country_id`  int(11) NULL DEFAULT NULL ,
`billing_pincode`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shipping_address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`shipping_city`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shipping_state_id`  int(11) NULL DEFAULT NULL ,
`shipping_country_id`  int(11) NULL DEFAULT NULL ,
`shipping_pincode`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`tin_no`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`pan_no`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`currency_id`  int(11) NULL DEFAULT NULL ,
`same_as_billing_address`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `contact_id` (`contact_id`) USING BTREE ,
INDEX `currency_id` (`currency_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=15

;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `customfield_association`
-- ----------------------------
DROP TABLE IF EXISTS `customfield_association`;
CREATE TABLE `customfield_association` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`item_id`  int(11) NULL DEFAULT NULL ,
`customfield_generic_id`  int(11) NULL DEFAULT NULL ,
`can_effect_stock`  tinyint(4) NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`department_id`  int(11) NULL DEFAULT NULL ,
`group`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`order`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `item_id` (`item_id`) USING BTREE ,
INDEX `customfield_generic_id` (`customfield_generic_id`) USING BTREE ,
INDEX `department_id` (`department_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=93

;

-- ----------------------------
-- Records of customfield_association
-- ----------------------------
BEGIN;
INSERT INTO `customfield_association` VALUES ('1', '6', '1', '0', 'Active', '1', '', '0'), ('2', '6', '2', '0', 'Active', null, null, '0'), ('3', '6', '3', '0', 'Active', null, null, '0'), ('4', '6', '4', '0', 'Active', null, null, '0'), ('5', '6', '5', '0', 'Active', null, null, '0'), ('6', '6', '6', '0', 'Active', null, null, '0'), ('7', '6', '7', '0', 'Active', null, null, '0'), ('8', '6', '8', '0', 'Active', null, null, '0'), ('9', '6', '9', '0', 'Active', null, null, '0'), ('10', '6', '10', '0', 'Active', null, null, '0'), ('11', '6', '11', '0', 'Active', null, null, '0'), ('16', '50', '13', '0', 'Active', null, null, '0'), ('17', '55', '13', '0', 'Active', null, null, '0'), ('18', '72', '13', '0', 'Active', null, null, '0'), ('19', '79', '13', '0', 'Active', null, null, '0'), ('20', '94', '13', '0', 'Active', null, null, '0'), ('23', '98', '2', '0', 'Active', null, null, '0'), ('24', '98', '3', '0', 'Active', null, null, '0'), ('25', '98', '4', '0', 'Active', null, null, '0'), ('26', '98', '14', '0', 'Active', null, null, '0'), ('27', '98', '6', '0', 'Active', null, null, '0'), ('28', '98', '7', '0', 'Active', null, null, '0'), ('29', '98', '8', '0', 'Active', null, null, '0'), ('30', '98', '9', '0', 'Active', null, null, '0'), ('31', '98', '10', '0', 'Active', null, null, '0'), ('32', '98', '11', '0', 'Active', null, null, '0'), ('33', '99', '2', '0', 'Active', '0', null, null), ('34', '99', '3', '0', 'Active', '0', null, null), ('35', '99', '4', '0', 'Active', '0', null, null), ('36', '99', '14', '0', 'Active', '0', null, null), ('37', '99', '6', '0', 'Active', '0', null, null), ('38', '99', '7', '0', 'Active', '0', null, null), ('39', '99', '8', '0', 'Active', '0', null, null), ('40', '99', '9', '0', 'Active', '0', null, null), ('41', '99', '10', '0', 'Active', '0', null, null), ('42', '99', '11', '0', 'Active', '0', null, null), ('43', '100', '2', '0', 'Active', '0', null, null), ('44', '100', '3', '0', 'Active', '0', null, null), ('45', '100', '4', '0', 'Active', '0', null, null), ('46', '100', '14', '0', 'Active', '0', null, null), ('47', '100', '6', '0', 'Active', '0', null, null), ('48', '100', '7', '0', 'Active', '0', null, null), ('49', '100', '8', '0', 'Active', '0', null, null), ('50', '100', '9', '0', 'Active', '0', null, null), ('51', '100', '10', '0', 'Active', '0', null, null), ('52', '100', '11', '0', 'Active', '0', null, null), ('53', '101', '2', '0', 'Active', '0', null, null), ('54', '101', '3', '0', 'Active', '0', null, null), ('55', '101', '4', '0', 'Active', '0', null, null), ('56', '101', '14', '0', 'Active', '0', null, null), ('57', '101', '6', '0', 'Active', '0', null, null), ('58', '101', '7', '0', 'Active', '0', null, null), ('59', '101', '8', '0', 'Active', '0', null, null), ('60', '101', '9', '0', 'Active', '0', null, null), ('61', '101', '10', '0', 'Active', '0', null, null), ('62', '101', '11', '0', 'Active', '0', null, null), ('63', '102', '2', '0', 'Active', '0', null, null), ('64', '102', '3', '0', 'Active', '0', null, null), ('65', '102', '4', '0', 'Active', '0', null, null), ('66', '102', '14', '0', 'Active', '0', null, null), ('67', '102', '6', '0', 'Active', '0', null, null), ('68', '102', '7', '0', 'Active', '0', null, null), ('69', '102', '8', '0', 'Active', '0', null, null), ('70', '102', '9', '0', 'Active', '0', null, null), ('71', '102', '10', '0', 'Active', '0', null, null), ('72', '102', '11', '0', 'Active', '0', null, null), ('73', '103', '2', '0', 'Active', '0', null, null), ('74', '103', '3', '0', 'Active', '0', null, null), ('75', '103', '4', '0', 'Active', '0', null, null), ('76', '103', '14', '0', 'Active', '0', null, null), ('77', '103', '6', '0', 'Active', '0', null, null), ('78', '103', '7', '0', 'Active', '0', null, null), ('79', '103', '8', '0', 'Active', '0', null, null), ('80', '103', '9', '0', 'Active', '0', null, null), ('81', '103', '10', '0', 'Active', '0', null, null), ('82', '103', '11', '0', 'Active', '0', null, null), ('83', '104', '2', '0', 'Active', '0', null, null), ('84', '104', '3', '0', 'Active', '0', null, null), ('85', '104', '4', '0', 'Active', '0', null, null), ('86', '104', '14', '0', 'Active', '0', null, null), ('87', '104', '6', '0', 'Active', '0', null, null), ('88', '104', '7', '0', 'Active', '0', null, null), ('89', '104', '8', '0', 'Active', '0', null, null), ('90', '104', '9', '0', 'Active', '0', null, null), ('91', '104', '10', '0', 'Active', '0', null, null), ('92', '104', '11', '0', 'Active', '0', null, null);
COMMIT;

-- ----------------------------
-- Table structure for `customfield_generic`
-- ----------------------------
DROP TABLE IF EXISTS `customfield_generic`;
CREATE TABLE `customfield_generic` (
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`display_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`sequence_order`  int(11) NULL DEFAULT NULL ,
`is_filterable`  tinyint(4) NOT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `sequence_order` (`sequence_order`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=15

;

-- ----------------------------
-- Records of customfield_generic
-- ----------------------------
BEGIN;
INSERT INTO `customfield_generic` VALUES ('epan name', 'Line', '1', '0', '0', 'CustomField', '1'), ('Hr', 'Line', '2', '0', '0', 'Specification', '1'), ('Communication', 'Line', '3', '1', '0', 'Specification', '1'), ('Projects', 'Line', '4', '0', '0', 'Specification', '1'), ('Marketing', 'Line', '5', '0', '0', 'Specification', '1'), ('Accounts', 'Line', '6', '0', '0', 'Specification', '1'), ('Commerce', 'Line', '7', '0', '0', 'Specification', '1'), ('Production', 'Line', '8', '0', '0', 'Specification', '1'), ('Crm', 'Line', '9', '0', '0', 'Specification', '1'), ('Cms', 'Line', '10', '0', '0', 'Specification', '1'), ('Blog', 'Line', '11', '0', '0', 'Specification', '1'), ('epan theme', 'DropDown', '12', '0', '0', 'CustomField', '1'), ('Color', 'Line', '13', '0', '0', 'Specification', '1'), ('Digital Marketing', 'Line', '14', '0', '0', 'Specification', '1');
COMMIT;

-- ----------------------------
-- Table structure for `customfield_value`
-- ----------------------------
DROP TABLE IF EXISTS `customfield_value`;
CREATE TABLE `customfield_value` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`customfield_association_id`  int(11) NOT NULL ,
`status`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`highlight_it`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `itemcustomassociation_id` (`customfield_association_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=92

;

-- ----------------------------
-- Records of customfield_value
-- ----------------------------
BEGIN;
INSERT INTO `customfield_value` VALUES ('1', 'Yes', '2', 'Active', '1'), ('2', 'Yes', '3', 'Active', '1'), ('3', 'Yes', '4', 'Active', '1'), ('4', 'Yes', '5', 'Active', '1'), ('5', 'Yes', '6', 'Active', '1'), ('6', 'Yes', '7', 'Active', '1'), ('7', 'Yes', '8', 'Active', '1'), ('8', 'Yes', '9', 'Active', '1'), ('9', 'Yes', '10', 'Active', '1'), ('10', 'Yes', '11', 'Active', '1'), ('15', 'Gray', '16', 'Active', '1'), ('16', 'Blue', '17', 'Active', '1'), ('17', 'Pink', '18', 'Active', '1'), ('18', 'Orange', '19', 'Active', '1'), ('19', 'Blue', '20', 'Active', '0'), ('22', 'No', '31', 'Active', '1'), ('23', 'No', '23', 'Active', '1'), ('24', 'No', '24', 'Active', '1'), ('25', 'No', '25', 'Active', '1'), ('26', 'No', '26', 'Active', '1'), ('27', 'No', '27', 'Active', '1'), ('28', 'No', '28', 'Active', '1'), ('29', 'No', '29', 'Active', '1'), ('30', 'No', '30', 'Active', '1'), ('31', 'No', '32', 'Active', '1'), ('32', 'No', '33', 'Active', '1'), ('33', 'Yes', '34', 'Active', '1'), ('34', 'No', '35', 'Active', '1'), ('35', 'No', '36', 'Active', '1'), ('36', 'No', '37', 'Active', '1'), ('37', 'No', '38', 'Active', '1'), ('38', 'No', '39', 'Active', '1'), ('39', 'No', '40', 'Active', '1'), ('40', 'Yes', '41', 'Active', '1'), ('41', 'No', '42', 'Active', '1'), ('42', 'No', '43', 'Active', '1'), ('43', 'No', '44', 'Active', '1'), ('44', 'No', '45', 'Active', '1'), ('45', 'No', '46', 'Active', '1'), ('46', 'No', '47', 'Active', '1'), ('47', 'No', '48', 'Active', '1'), ('48', 'No', '49', 'Active', '1'), ('49', 'No', '50', 'Active', '1'), ('50', 'Yes', '51', 'Active', '1'), ('51', 'Yes', '52', 'Active', '1'), ('52', 'Yes', '53', 'Active', '1'), ('53', 'No', '54', 'Active', '1'), ('54', 'No', '55', 'Active', '1'), ('55', 'No', '56', 'Active', '1'), ('56', 'Yes', '57', 'Active', '1'), ('57', 'Yes', '58', 'Active', '1'), ('58', 'No', '59', 'Active', '1'), ('59', 'No', '60', 'Active', '1'), ('60', 'Yes', '61', 'Active', '1'), ('61', 'Yes', '62', 'Active', '1'), ('62', 'No', '63', 'Active', '1'), ('63', 'No', '64', 'Active', '1'), ('64', 'No', '65', 'Active', '1'), ('65', 'Yes', '66', 'Active', '1'), ('66', 'No', '67', 'Active', '1'), ('67', 'No', '68', 'Active', '1'), ('68', 'No', '69', 'Active', '1'), ('69', 'No', '70', 'Active', '1'), ('70', 'No', '71', 'Active', '1'), ('71', 'No', '72', 'Active', '1'), ('72', 'No', '73', 'Active', '1'), ('73', 'No', '74', 'Active', '1'), ('74', 'No', '75', 'Active', '1'), ('75', 'Yes', '76', 'Active', '1'), ('76', 'No', '77', 'Active', '1'), ('77', 'Yes', '78', 'Active', '1'), ('78', 'No', '79', 'Active', '1'), ('79', 'Yes', '80', 'Active', '1'), ('80', 'Yes', '81', 'Active', '1'), ('81', 'Yes', '82', 'Active', '1'), ('82', 'Yes', '83', 'Active', '1'), ('83', 'Yes', '84', 'Active', '1'), ('84', 'Yes', '85', 'Active', '1'), ('85', 'Yes', '86', 'Active', '1'), ('86', 'Yes', '87', 'Active', '1'), ('87', 'Yes', '88', 'Active', '1'), ('88', 'Yes', '89', 'Active', '1'), ('89', 'Yes', '90', 'Active', '1'), ('90', 'Yes', '91', 'Active', '1'), ('91', 'Yes', '92', 'Active', '1');
COMMIT;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
`document_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`production_level`  int(11) NULL DEFAULT NULL ,
`is_system`  tinyint(4) NULL DEFAULT 0 ,
`is_outsourced`  tinyint(4) NOT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES ('1', 'Company', '1', '1', '0', '1');
COMMIT;

-- ----------------------------
-- Table structure for `designer_image_category`
-- ----------------------------
DROP TABLE IF EXISTS `designer_image_category`;
CREATE TABLE `designer_image_category` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`contact_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_library`  tinyint(4) NULL DEFAULT NULL ,
`epan_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `contact_id` (`contact_id`) USING BTREE ,
INDEX `epan_id` (`epan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of designer_image_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `designer_images`
-- ----------------------------
DROP TABLE IF EXISTS `designer_images`;
CREATE TABLE `designer_images` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`designer_category_id`  int(11) NULL DEFAULT NULL ,
`image_id`  int(11) NULL DEFAULT NULL ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `designer_category_id` (`designer_category_id`) USING BTREE ,
INDEX `epan_id` (`epan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of designer_images
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `discount_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `discount_voucher`;
CREATE TABLE `discount_voucher` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NOT NULL ,
`created_by_id`  int(11) NOT NULL ,
`updated_by_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`start_date`  datetime NOT NULL ,
`expire_date`  datetime NOT NULL ,
`no_of_person`  int(11) NOT NULL ,
`one_user_how_many_time`  int(11) NULL DEFAULT NULL ,
`created_at`  datetime NOT NULL ,
`updated_at`  datetime NOT NULL ,
`on_category_id`  int(11) NULL DEFAULT NULL ,
`on`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`include_sub_category`  tinyint(4) NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`based_on`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of discount_voucher
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `discount_voucher_condition`
-- ----------------------------
DROP TABLE IF EXISTS `discount_voucher_condition`;
CREATE TABLE `discount_voucher_condition` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`discountvoucher_id`  int(11) NOT NULL ,
`from`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`to`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of discount_voucher_condition
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `discount_voucher_used`
-- ----------------------------
DROP TABLE IF EXISTS `discount_voucher_used`;
CREATE TABLE `discount_voucher_used` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`qsp_master_id`  int(11) NOT NULL ,
`customer_id`  int(11) NOT NULL ,
`discountvoucher_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of discount_voucher_used
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NOT NULL ,
`type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sub_type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
`created_at`  datetime NOT NULL ,
`updated_by_id`  int(11) NULL DEFAULT NULL ,
`updated_at`  datetime NULL DEFAULT NULL ,
`status`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`search_string`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `fk_document_epan1_idx` (`epan_id`) USING BTREE ,
FULLTEXT INDEX `search_string` (`search_string`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=225

;

-- ----------------------------
-- Records of document
-- ----------------------------
BEGIN;
INSERT INTO `document` VALUES ('1', '1', 'Department', null, null, '2016-06-02 23:19:14', null, '2016-06-02 23:19:14', 'Active', '  Company CEO 00:00:00 00:00:00   2016-06-02    '), ('2', '1', 'Post', null, null, '2016-06-02 23:19:14', null, '2016-06-02 23:19:14', 'Active', '  CEO 00:00:00 00:00:00  2016-06-02'), ('3', '1', 'MarketingCategory', null, null, '2016-06-02 23:19:14', null, '2016-06-02 23:19:14', null, '  Epan Services MarketingCategory '), ('6', '1', 'Item', null, '1', '2016-06-05 16:51:14', '1', '2016-06-05 16:51:14', 'Published', '  EpanTrial ep-full-trial 0.00 0.00   6 10 epan name CustomFieldYes Hr SpecificationYes Communication SpecificationYes Projects SpecificationYes Marketing SpecificationYes Accounts SpecificationYes Commerce SpecificationYes Production SpecificationYes Crm SpecificationYes Cms SpecificationYes Blog Specification'), ('10', '1', 'Category', null, '1', '2016-06-07 05:20:15', '1', '2016-06-07 05:20:15', 'Active', '  Epan Category Active    '), ('50', '1', 'Item', null, '1', '2016-06-14 11:04:39', '1', '2016-06-14 11:04:39', 'Published', '  Elegent Blogger default 2100 2000 If you are looking for a theme for blogging, profile, or for a simple website then this could be the theme you are searching for. This single theme will fit in for a large amount of devices.  50 49 1 2000Gray Color Specification'), ('51', '1', 'SalesOrder', null, null, '2016-06-14 11:42:17', null, '2016-06-14 11:42:17', 'OnlineUnpaid', '  2016-06-14 11:42:17 2016-06-14 11:42:17 2 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesOrder 2000.0000 1.00 2000.000000 0.0000 0  []'), ('52', '1', 'SalesInvoice', null, null, '2016-06-14 11:42:17', null, '2016-06-14 11:42:17', 'Due', '  2016-06-14 11:42:17 2016-06-14 11:42:17 2 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesInvoice'), ('53', '1', 'SalesOrder', null, null, '2016-06-14 11:43:25', null, '2016-06-14 11:43:25', 'OnlineUnpaid', '  2016-06-14 11:43:25 2016-06-14 11:43:25 3 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesOrder 2000.0000 1.00 2000.000000 0.0000 0  []'), ('54', '1', 'SalesInvoice', null, null, '2016-06-14 11:43:25', null, '2016-06-14 11:43:25', 'Due', '  2016-06-14 11:43:25 2016-06-14 11:43:25 3 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesInvoice'), ('55', '1', 'Item', null, '1', '2016-06-14 11:45:42', '1', '2016-06-14 11:45:42', 'Published', '  E-Commerce Theme (Blue) e-store 2650 2500 With features like Bootstrap,&nbsp;&nbsp;Responsiveness, Search Engine Friendly, Crossbrowser Compatibility,&nbsp;&nbsp;Dropdown Menu,&nbsp;&nbsp;Favicon, Social Options,&nbsp;&nbsp;Tabs,&nbsp;&nbsp;Tag Cloud,&nbsp;&nbsp;Tooltips, this theme can come handy for E-Commerce business.  55 49 1 2500Blue Color Specification'), ('56', '1', 'SalesOrder', null, null, '2016-06-14 11:46:22', null, '2016-06-14 11:46:22', 'Submitted', '  2016-06-14 11:46:22 2016-06-14 11:46:22 4 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesOrder 2000.0000 1.00 2000.000000 0.0000 0  []'), ('57', '1', 'SalesInvoice', null, null, '2016-06-14 11:46:22', null, '2016-06-14 11:46:22', 'Paid', '  2016-06-14 11:46:22 2016-06-14 11:46:22 4 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesInvoice 1.0000 2000.00 2000.000000 0.0000 0  []'), ('58', '1', 'SalesOrder', null, null, '2016-06-14 11:49:53', null, '2016-06-14 11:49:53', 'OnlineUnpaid', '  2016-06-14 11:49:53 2016-06-14 11:49:53 5 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 0.000000 0.00 0.00 0 SalesOrder 0.0000 5.00 0.000000 0.0000 0  []'), ('59', '1', 'SalesInvoice', null, null, '2016-06-14 11:49:53', null, '2016-06-14 11:49:53', 'Due', '  2016-06-14 11:49:53 2016-06-14 11:49:53 5 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesInvoice'), ('60', '1', 'SalesOrder', null, null, '2016-06-14 11:50:56', null, '2016-06-14 11:50:56', 'OnlineUnpaid', '  2016-06-14 11:50:56 2016-06-14 11:50:56 6 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 0.000000 0.00 0.00 0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  []'), ('61', '1', 'SalesInvoice', null, null, '2016-06-14 11:50:56', null, '2016-06-14 11:50:56', 'Due', '  2016-06-14 11:50:56 2016-06-14 11:50:56 6 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesInvoice'), ('62', '1', 'SalesOrder', null, null, '2016-06-14 11:53:37', null, '2016-06-14 11:53:37', 'OnlineUnpaid', '  2016-06-14 11:53:37 2016-06-14 11:53:37 7 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 0.000000 0.00 0.00 0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  []'), ('63', '1', 'SalesInvoice', null, null, '2016-06-14 11:53:37', null, '2016-06-14 11:53:37', 'Due', '  2016-06-14 11:53:37 2016-06-14 11:53:37 7 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesInvoice'), ('64', '1', 'SalesOrder', null, null, '2016-06-14 12:02:59', null, '2016-06-14 12:02:59', 'OnlineUnpaid', '  2016-06-14 12:02:59 2016-06-14 12:02:59 8 Online     0 0       0 0      0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"e-store\",\"custom_field_value_name\":\"e-store\"}}]'), ('65', '1', 'SalesInvoice', null, null, '2016-06-14 12:02:59', null, '2016-06-14 12:02:59', 'Due', '  2016-06-14 12:02:59 2016-06-14 12:02:59 8 Offline     0 0       0 0      0 SalesInvoice'), ('66', '1', 'SalesOrder', null, null, '2016-06-14 12:03:19', null, '2016-06-14 12:03:19', 'OnlineUnpaid', '  2016-06-14 12:03:19 2016-06-14 12:03:19 9 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 0.000000 0.00 0.00 0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  []'), ('67', '1', 'SalesInvoice', null, null, '2016-06-14 12:03:19', null, '2016-06-14 12:03:19', 'Due', '  2016-06-14 12:03:19 2016-06-14 12:03:19 9 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesInvoice'), ('68', '1', 'SalesOrder', null, null, '2016-06-14 12:06:43', null, '2016-06-14 12:06:43', 'OnlineUnpaid', '  2016-06-14 12:06:43 2016-06-14 12:06:43 10 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 0.000000 0.00 0.00 0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  []'), ('69', '1', 'SalesInvoice', null, null, '2016-06-14 12:06:43', null, '2016-06-14 12:06:43', 'Due', '  2016-06-14 12:06:43 2016-06-14 12:06:43 10 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesInvoice'), ('70', '1', 'SalesOrder', null, null, '2016-06-14 12:13:38', null, '2016-06-14 12:13:38', 'Submitted', '  2016-06-14 12:13:38 2016-06-14 12:13:38 11 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 200000.000000 200000.00 200000.00 0 SalesOrder 20000.0000 10.00 200000.000000 0.0000 0  []'), ('71', '1', 'SalesInvoice', null, null, '2016-06-14 12:13:38', null, '2016-06-14 12:13:38', 'Paid', '  2016-06-14 12:13:38 2016-06-14 12:13:38 11 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 200000.000000 200000.00 200000.00 0 SalesInvoice 10.0000 20000.00 200000.000000 0.0000 0  []'), ('72', '1', 'Item', null, '1', '2016-06-14 12:31:37', '1', '2016-06-14 12:31:37', 'Published', '  E-Commerce Theme (Pink) webstore 2450 2450 If you are looking for a modern E-Commerce Bootstrap Theme then <strong>this</strong> could very well be the theme you\'ve been searching for all this time.  72 49 1 2450Pink Color Specification'), ('73', '1', 'SalesOrder', null, null, '2016-06-14 12:35:18', null, '2016-06-14 12:35:18', 'OnlineUnpaid', '  2016-06-14 12:35:18 2016-06-14 12:35:18 12 Online     0 0       0 0      0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"webstore\",\"custom_field_value_name\":\"webstore\"}}]'), ('74', '1', 'SalesInvoice', null, null, '2016-06-14 12:35:18', null, '2016-06-14 12:35:18', 'Due', '  2016-06-14 12:35:18 2016-06-14 12:35:18 12 Offline     0 0       0 0      0 SalesInvoice'), ('75', '1', 'SalesOrder', null, null, '2016-06-14 12:42:06', null, '2016-06-14 12:42:06', 'OnlineUnpaid', '  2016-06-14 12:42:06 2016-06-14 12:42:06 13 Online     0 0       0 0      0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"default\",\"custom_field_value_name\":\"default\"}}]'), ('76', '1', 'SalesInvoice', null, null, '2016-06-14 12:42:06', null, '2016-06-14 12:42:06', 'Due', '  2016-06-14 12:42:06 2016-06-14 12:42:06 13 Offline     0 0       0 0      0 SalesInvoice'), ('77', '1', 'SalesOrder', null, null, '2016-06-14 12:46:54', null, '2016-06-14 12:46:54', 'OnlineUnpaid', '  2016-06-14 12:46:54 2016-06-14 12:46:54 14 Online     0 0       0 0      0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"default\",\"custom_field_value_name\":\"default\"}}]'), ('78', '1', 'SalesInvoice', null, null, '2016-06-14 12:46:54', null, '2016-06-14 12:46:54', 'Due', '  2016-06-14 12:46:54 2016-06-14 12:46:54 14 Offline     0 0       0 0      0 SalesInvoice'), ('79', '1', 'Item', null, '1', '2016-06-14 12:52:19', '1', '2016-06-14 12:52:19', 'Published', '  E-Commerce Theme (Orange) onlinestore 2200.00 2000.00 <p>Thanks to E-Commerce Theme (Orange) that your search for an amazing e-commerce template is going to be over. It is a&nbsp; responsive template with lot of features like a clean design, device friendly layout etc.</p>  79 49 1 2000Orange Color Specification'), ('80', '1', 'SalesOrder', null, null, '2016-06-14 12:53:08', null, '2016-06-14 12:53:08', 'Submitted', '  2016-06-14 12:53:08 2016-06-14 12:53:08 15 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesOrder 2000.0000 1.00 2000.000000 0.0000 0  []'), ('81', '1', 'SalesInvoice', null, null, '2016-06-14 12:53:08', null, '2016-06-14 12:53:08', 'Paid', '  2016-06-14 12:53:08 2016-06-14 12:53:08 15 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesInvoice 1.0000 2000.00 2000.000000 0.0000 0  []'), ('82', '1', 'SalesOrder', null, null, '2016-06-14 12:58:39', null, '2016-06-14 12:58:39', 'Submitted', '  2016-06-14 12:58:39 2016-06-14 12:58:39 16 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesOrder 2000.0000 1.00 2000.000000 0.0000 0  []'), ('83', '1', 'SalesInvoice', null, null, '2016-06-14 12:58:39', null, '2016-06-14 12:58:39', 'Paid', '  2016-06-14 12:58:39 2016-06-14 12:58:39 16 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesInvoice 1.0000 2000.00 2000.000000 0.0000 0  []'), ('84', '1', 'SalesOrder', null, null, '2016-06-14 13:02:56', null, '2016-06-14 13:02:56', 'OnlineUnpaid', '  2016-06-14 13:02:56 2016-06-14 13:02:56 17 Online     0 0       0 0      0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"onlinestore\",\"custom_field_value_name\":\"onlinestore\"}}]'), ('85', '1', 'SalesInvoice', null, null, '2016-06-14 13:02:56', null, '2016-06-14 13:02:56', 'Due', '  2016-06-14 13:02:56 2016-06-14 13:02:56 17 Offline     0 0       0 0      0 SalesInvoice'), ('86', '1', 'SalesOrder', null, null, '2016-06-14 13:30:09', null, '2016-06-14 13:30:09', 'Submitted', '  2016-06-14 13:30:09 2016-06-14 13:30:09 18 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesOrder 2000.0000 1.00 2000.000000 0.0000 0  []'), ('87', '1', 'SalesInvoice', null, null, '2016-06-14 13:30:09', null, '2016-06-14 13:30:09', 'Paid', '  2016-06-14 13:30:09 2016-06-14 13:30:09 18 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesInvoice 1.0000 2000.00 2000.000000 0.0000 0  []'), ('88', '1', 'SalesOrder', null, null, '2016-06-14 13:32:47', null, '2016-06-14 13:32:47', 'OnlineUnpaid', '  2016-06-14 13:32:47 2016-06-14 13:32:47 19 Online 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001 2000.000000 2000.00 2000.00 0 SalesOrder 2000.0000 1.00 2000.000000 0.0000 0  []'), ('89', '1', 'SalesInvoice', null, null, '2016-06-14 13:32:47', null, '2016-06-14 13:32:47', 'Due', '  2016-06-14 13:32:47 2016-06-14 13:32:47 19 Offline 29, mali colony tekri road udaipur 95 100 313001 29, mali colony tekri road udaipur 95 100 313001    0 SalesInvoice'), ('90', '1', 'SalesOrder', null, null, '2016-06-14 13:36:47', null, '2016-06-14 13:36:47', 'OnlineUnpaid', '  2016-06-14 13:36:47 2016-06-14 13:36:47 20 Online     0 0       0 0      0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"onlinestore\",\"custom_field_value_name\":\"onlinestore\"}}]'), ('91', '1', 'SalesInvoice', null, null, '2016-06-14 13:36:47', null, '2016-06-14 13:36:47', 'Due', '  2016-06-14 13:36:47 2016-06-14 13:36:47 20 Offline     0 0       0 0      0 SalesInvoice'), ('92', '1', 'SalesOrder', null, null, '2016-06-14 13:43:42', null, '2016-06-14 13:43:42', 'OnlineUnpaid', '  2016-06-14 13:43:42 2016-06-14 13:43:42 21 Online     0 0       0 0      0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"onlinestore\",\"custom_field_value_name\":\"onlinestore\"}}]'), ('93', '1', 'SalesInvoice', null, null, '2016-06-14 13:43:42', null, '2016-06-14 13:43:42', 'Due', '  2016-06-14 13:43:42 2016-06-14 13:43:42 21 Offline     0 0       0 0      0 SalesInvoice'), ('94', '1', 'Item', null, '1', '2016-06-14 13:50:51', '1', '2016-06-14 13:50:51', 'Published', '  E-Commerce Theme (primary) e-shop 2550 2400 An E-Commerce website template with lots of features which will make you stop your search for templates. It comes with like buttons, awesome icons, clean layout, responsiveness etc.  94 49 1 2400Blue Color Specification'), ('95', '1', 'SalesOrder', null, null, '2016-06-14 13:56:55', null, '2016-06-14 13:56:55', 'OnlineUnpaid', '  2016-06-14 13:56:55 2016-06-14 13:56:55 22 Online     0 0       0 0      0 SalesOrder 0.0000 1.00 0.000000 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"e-shop\",\"custom_field_value_name\":\"e-shop\"}}]'), ('96', '1', 'SalesInvoice', null, null, '2016-06-14 13:56:55', null, '2016-06-14 13:56:55', 'Due', '  2016-06-14 13:56:55 2016-06-14 13:56:55 22 Offline     0 0       0 0      0 SalesInvoice'), ('98', '1', 'Item', null, '1', '2016-06-14 14:25:04', '1', '2016-06-14 14:25:04', 'Published', '  Epan Item Template epan-item-template 1500.00 1000.00 $5/month  98 10 1 Year  12000 2 Year  24000 3 Year  36000 4 Year  48000 5 Year  60000No Hr SpecificationNo Communication SpecificationNo Projects SpecificationNo Digital Marketing SpecificationNo Accounts SpecificationNo Commerce SpecificationNo Production SpecificationNo Crm SpecificationNo Cms SpecificationNo Blog Specification'), ('99', '1', 'Item', null, '1', '2016-06-14 14:38:24', '1', '2016-06-14 14:25:04', 'Published', '  CMS/BLOG cms-001 600.00 500.00 <div style=\"text-align: center;\"><strong>Less Than $ 8 / Month (billed annually)<br /></strong></div>\r\n<p><br />CMS/Blog package is perfect choice for bloggers or any company requiring an informative website. Purchasing now will let you have Drag and Drop CMS with live editing feature absolutely FREE. this tool lets you manage your website easily.</p>  99 10 1 Year 500No Hr SpecificationYes Communication SpecificationNo Projects SpecificationNo Digital Marketing SpecificationNo Accounts SpecificationNo Commerce SpecificationNo Production SpecificationNo Crm SpecificationYes Cms SpecificationNo Blog Specification'), ('100', '1', 'Item', null, '1', '2016-06-14 14:41:25', '1', '2016-06-14 14:25:04', 'UnPublished', '  Blog blog-001 1500.00 1000.00   100 10 1 Year 12000 2 Year 24000 3 Year 36000 4 Year 48000 5 Year 60000No Hr SpecificationNo Communication SpecificationNo Projects SpecificationNo Digital Marketing SpecificationNo Accounts SpecificationNo Commerce SpecificationNo Production SpecificationNo Crm SpecificationYes Cms SpecificationYes Blog Specification'), ('101', '1', 'Item', null, '1', '2016-06-14 14:42:58', '1', '2016-06-14 14:25:04', 'Published', '  E-commerce ecommerce-001 6666.00 4999.00 <div style=\"text-align: center;\"><strong>Less Than $ 75 / Month (billed annually)</strong></div>\r\n<p><br />Epan services provides one of best E-commerce system with increasing features daily. Highly customization based design makes Epan E-Commerce suitable for all sort of business, including products and services. Fully integrated with simple accounting, generating full features Balance sheet and P&amp;L from simple tasks.<br /><br />Offline ready: Yes! Epan E-Commerce is designed in such a away that you can manage your Offline business as well as Online. <br /><br />From Lead to Quotation. Followup to Newsletters, Sales order to Dispatch management. Everything you may need.&nbsp;<br /><br />Got something that is not managed by our E-commerce! just contact our friendly technical experts and share your ideas with them.</p>  101 10 1 Year 4999Yes Hr SpecificationNo Communication SpecificationNo Projects SpecificationNo Digital Marketing SpecificationYes Accounts SpecificationYes Commerce SpecificationNo Production SpecificationNo Crm SpecificationYes Cms SpecificationYes Blog Specification'), ('102', '1', 'Item', null, '1', '2016-06-14 14:45:02', '1', '2016-06-14 14:25:04', 'UnPublished', '  Digital Marketing Digital-marketing-001 1500.00 1000.00   102 10 1 Year 1000 2 Year 1000 3 Year 1000 4 Year 1000 5 Year 1000No Hr SpecificationNo Communication SpecificationNo Projects SpecificationYes Digital Marketing SpecificationNo Accounts SpecificationNo Commerce SpecificationNo Production SpecificationNo Crm SpecificationNo Cms SpecificationNo Blog Specification'), ('103', '1', 'Item', null, '1', '2016-06-14 14:46:03', '1', '2016-06-14 14:25:04', 'UnPublished', '  CRM crm-001 1500.00 1000.00   103 10 1 Year 1000 2 Year 1000 3 Year 1000 4 Year 1000 5 Year 1000No Hr SpecificationNo Communication SpecificationNo Projects SpecificationYes Digital Marketing SpecificationNo Accounts SpecificationYes Commerce SpecificationNo Production SpecificationYes Crm SpecificationYes Cms SpecificationYes Blog Specification'), ('104', '1', 'Item', null, '1', '2016-06-14 00:00:00', '1', '2016-06-14 14:25:04', 'Published', '  ERP/CRM/E-Comm erp-001 16999.00 9999.00 <p style=\"text-align: center;\"><strong>Less Than $ 150 / Month (billed annually)</strong></p>\r\n<p><br />Epan services ERP is one of world\'s most sophisticated ERP.&nbsp; In-fact it is a package of highly integrated yet modular ERP, CRM and E-Commerce with Digital Marketing. Apart from its Job processing and Bird eye views, accountability feature of Our ERP is really unique. <br /><br />Manage uniquely designed Email system to get all your communications in one place.</p>  104 10 1 Year 9999Yes Hr SpecificationYes Communication SpecificationYes Projects SpecificationYes Digital Marketing SpecificationYes Accounts SpecificationYes Commerce SpecificationYes Production SpecificationYes Crm SpecificationYes Cms SpecificationYes Blog Specification'), ('105', '1', 'SalesOrder', null, null, '2016-06-21 08:46:58', null, '2016-06-21 08:46:58', 'OnlineUnpaid', '  2016-06-21 08:46:58 2016-06-21 08:46:58 23 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"documentation\",\"custom_field_value_name\":\"documentation\"}}]'), ('106', '1', 'SalesInvoice', null, null, '2016-06-21 08:46:58', null, '2016-06-21 08:46:58', 'Due', '  2016-06-21 08:46:58 2016-06-21 08:46:58 23 Online                0 SalesInvoice'), ('107', '1', 'SalesOrder', null, null, '2016-06-21 08:52:25', null, '2016-06-21 08:52:25', 'OnlineUnpaid', '  2016-06-21 08:52:25 2016-06-21 08:52:25 24 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"documentation\",\"custom_field_value_name\":\"documentation\"}}]'), ('108', '1', 'SalesInvoice', null, null, '2016-06-21 08:52:25', null, '2016-06-21 08:52:25', 'Due', '  2016-06-21 08:52:25 2016-06-21 08:52:25 24 Online                0 SalesInvoice'), ('109', '1', 'SalesOrder', null, null, '2016-06-21 13:41:28', null, '2016-06-21 13:41:28', 'OnlineUnpaid', '  2016-06-21 13:41:28 2016-06-21 13:41:28 25 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"rakesh\",\"custom_field_value_name\":\"rakesh\"}}]'), ('110', '1', 'SalesInvoice', null, null, '2016-06-21 13:41:28', null, '2016-06-21 13:41:28', 'Due', '  2016-06-21 13:41:28 2016-06-21 13:41:28 25 Online                0 SalesInvoice'), ('113', '1', 'SalesOrder', null, null, '2016-06-23 09:54:14', null, '2016-06-23 09:54:14', 'OnlineUnpaid', '  2016-06-23 09:54:14 2016-06-23 09:54:14 26 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"demo\",\"custom_field_value_name\":\"demo\"}}]'), ('114', '1', 'SalesInvoice', null, null, '2016-06-23 09:54:14', null, '2016-06-23 09:54:14', 'Due', '  2016-06-23 09:54:14 2016-06-23 09:54:14 26 Online                0 SalesInvoice'), ('115', '1', 'SalesOrder', null, null, '2016-06-24 14:06:51', null, '2016-06-24 14:06:51', 'OnlineUnpaid', '  2016-06-24 14:06:51 2016-06-24 14:06:51 27 Online 29, mali colony tekri road udaipur 313001 29, mali colony tekri road udaipur 313001 2000 2000.00 2000.00 0 SalesOrder Elegent Blogger 2000.0000 2000 0.0000 0  []'), ('116', '1', 'SalesInvoice', null, null, '2016-06-24 14:06:51', null, '2016-06-24 14:06:51', 'Due', '  2016-06-24 14:06:51 2016-06-24 14:06:51 27 Online 29, mali colony tekri road udaipur 313001 29, mali colony tekri road udaipur 313001    0 SalesInvoice'), ('117', '1', 'SalesOrder', null, null, '2016-06-24 14:32:35', null, '2016-06-24 14:32:35', 'OnlineUnpaid', '  2016-06-24 14:32:35 2016-06-24 14:32:35 28 Online 29, mali colony tekri road udaipur 313001 29, mali colony tekri road udaipur 313001 119988 119988.00 119988.00 0 SalesOrder ERP/CRM/E-Comm 9999.0000 119988 0.0000 0  []'), ('118', '1', 'SalesInvoice', null, null, '2016-06-24 14:32:35', null, '2016-06-24 14:32:35', 'Due', '  2016-06-24 14:32:35 2016-06-24 14:32:35 28 Online 29, mali colony tekri road udaipur 313001 29, mali colony tekri road udaipur 313001    0 SalesInvoice'), ('121', '1', 'SalesOrder', null, null, '2016-06-28 15:08:36', null, '2016-06-28 15:08:36', 'OnlineUnpaid', '  2016-06-28 15:08:36 2016-06-28 15:08:36 29 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"navjeet\",\"custom_field_value_name\":\"navjeet\"}}]'), ('122', '1', 'SalesInvoice', null, null, '2016-06-28 15:08:36', null, '2016-06-28 15:08:36', 'Due', '  2016-06-28 15:08:36 2016-06-28 15:08:36 29 Online                0 SalesInvoice'), ('149', '1', 'SalesOrder', null, null, '2016-07-02 11:35:54', null, '2016-07-02 11:35:54', 'OnlineUnpaid', '  2016-07-02 11:35:54 2016-07-02 11:35:54 30 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"printing\",\"custom_field_value_name\":\"printing\"}}]'), ('150', '1', 'SalesInvoice', null, null, '2016-07-02 11:35:54', null, '2016-07-02 11:35:54', 'Due', '  2016-07-02 11:35:54 2016-07-02 11:35:54 30 Online                0 SalesInvoice'), ('152', '1', 'SalesOrder', null, null, '2016-07-02 20:17:45', null, '2016-07-02 20:17:45', 'OnlineUnpaid', '  2016-07-02 20:17:45 2016-07-02 20:17:45 31 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"mynewepanfortest\",\"custom_field_value_name\":\"mynewepanfortest\"}}]'), ('153', '1', 'SalesInvoice', null, null, '2016-07-02 20:17:45', null, '2016-07-02 20:17:45', 'Due', '  2016-07-02 20:17:45 2016-07-02 20:17:45 31 Online                0 SalesInvoice'), ('154', '1', 'SalesOrder', null, null, '2016-07-06 13:28:54', null, '2016-07-06 13:28:54', 'OnlineUnpaid', '  2016-07-06 13:28:54 2016-07-06 13:28:54 32 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"004usertest\",\"custom_field_value_name\":\"004usertest\"}}]'), ('155', '1', 'SalesInvoice', null, null, '2016-07-06 13:28:54', null, '2016-07-06 13:28:54', 'Due', '  2016-07-06 13:28:54 2016-07-06 13:28:54 32 Online                0 SalesInvoice'), ('156', '1', 'SalesOrder', null, null, '2016-07-06 13:39:11', null, '2016-07-06 13:39:11', 'OnlineUnpaid', '  2016-07-06 13:39:11 2016-07-06 13:39:11 33 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('157', '1', 'SalesInvoice', null, null, '2016-07-06 13:39:11', null, '2016-07-06 13:39:11', 'Due', '  2016-07-06 13:39:11 2016-07-06 13:39:11 33 Online                0 SalesInvoice'), ('158', '1', 'SalesOrder', null, null, '2016-07-15 11:20:43', null, '2016-07-15 11:20:43', 'OnlineUnpaid', '  2016-07-15 11:20:43 2016-07-15 11:20:43 34 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"xcideveloper\",\"custom_field_value_name\":\"xcideveloper\"}}]'), ('159', '1', 'SalesInvoice', null, null, '2016-07-15 11:20:43', null, '2016-07-15 11:20:43', 'Due', '  2016-07-15 11:20:43 2016-07-15 11:20:43 34 Online                0 SalesInvoice'), ('160', '1', 'SalesOrder', null, null, '2016-07-15 11:53:42', null, '2016-07-15 11:53:42', 'OnlineUnpaid', '  2016-07-15 11:53:42 2016-07-15 11:53:42 35 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"xcideveloper\",\"custom_field_value_name\":\"xcideveloper\"}}]'), ('161', '1', 'SalesInvoice', null, null, '2016-07-15 11:53:42', null, '2016-07-15 11:53:42', 'Due', '  2016-07-15 11:53:42 2016-07-15 11:53:42 35 Online                0 SalesInvoice'), ('162', '1', 'SalesOrder', null, null, '2016-07-16 12:52:12', null, '2016-07-16 12:52:12', 'OnlineUnpaid', '  2016-07-16 12:52:12 2016-07-16 12:52:12 36 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001testepan\",\"custom_field_value_name\":\"001testepan\"}}]'), ('163', '1', 'SalesInvoice', null, null, '2016-07-16 12:52:12', null, '2016-07-16 12:52:12', 'Due', '  2016-07-16 12:52:12 2016-07-16 12:52:12 36 Online                0 SalesInvoice'), ('164', '1', 'SalesOrder', null, null, '2016-07-18 12:06:59', null, '2016-07-18 12:06:59', 'OnlineUnpaid', '  2016-07-18 12:06:59 2016-07-18 12:06:59 37 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"test\",\"custom_field_value_name\":\"test\"}}]'), ('165', '1', 'SalesInvoice', null, null, '2016-07-18 12:06:59', null, '2016-07-18 12:06:59', 'Due', '  2016-07-18 12:06:59 2016-07-18 12:06:59 37 Online                0 SalesInvoice'), ('167', '1', 'SalesOrder', null, null, '2016-07-21 12:36:04', null, '2016-07-21 12:36:04', 'OnlineUnpaid', '  2016-07-21 12:36:04 2016-07-21 12:36:04 38 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"xavoclife\",\"custom_field_value_name\":\"xavoclife\"}}]'), ('168', '1', 'SalesInvoice', null, null, '2016-07-21 12:36:04', null, '2016-07-21 12:36:04', 'Due', '  2016-07-21 12:36:04 2016-07-21 12:36:04 38 Online                0 SalesInvoice'), ('169', '1', 'SalesOrder', null, null, '2016-07-21 12:45:40', null, '2016-07-21 12:45:40', 'OnlineUnpaid', '  2016-07-21 12:45:40 2016-07-21 12:45:40 39 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"xavoclife\",\"custom_field_value_name\":\"xavoclife\"}}]'), ('170', '1', 'SalesInvoice', null, null, '2016-07-21 12:45:40', null, '2016-07-21 12:45:40', 'Due', '  2016-07-21 12:45:40 2016-07-21 12:45:40 39 Online                0 SalesInvoice'), ('171', '1', 'SalesOrder', null, null, '2016-07-21 19:56:01', null, '2016-07-21 19:56:01', 'OnlineUnpaid', '  2016-07-21 19:56:01 2016-07-21 19:56:01 40 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('172', '1', 'SalesInvoice', null, null, '2016-07-21 19:56:01', null, '2016-07-21 19:56:01', 'Due', '  2016-07-21 19:56:01 2016-07-21 19:56:01 40 Online                0 SalesInvoice'), ('173', '1', 'SalesOrder', null, null, '2016-07-21 20:09:43', null, '2016-07-21 20:09:43', 'OnlineUnpaid', '  2016-07-21 20:09:43 2016-07-21 20:09:43 41 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('174', '1', 'SalesInvoice', null, null, '2016-07-21 20:09:43', null, '2016-07-21 20:09:43', 'Due', '  2016-07-21 20:09:43 2016-07-21 20:09:43 41 Online                0 SalesInvoice'), ('175', '1', 'SalesOrder', null, null, '2016-07-21 20:14:09', null, '2016-07-21 20:14:09', 'OnlineUnpaid', '  2016-07-21 20:14:09 2016-07-21 20:14:09 42 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('176', '1', 'SalesInvoice', null, null, '2016-07-21 20:14:09', null, '2016-07-21 20:14:09', 'Due', '  2016-07-21 20:14:09 2016-07-21 20:14:09 42 Online                0 SalesInvoice'), ('177', '1', 'SalesOrder', null, null, '2016-07-21 20:18:56', null, '2016-07-21 20:18:56', 'OnlineUnpaid', '  2016-07-21 20:18:56 2016-07-21 20:18:56 43 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]');
INSERT INTO `document` VALUES ('178', '1', 'SalesInvoice', null, null, '2016-07-21 20:18:56', null, '2016-07-21 20:18:56', 'Due', '  2016-07-21 20:18:56 2016-07-21 20:18:56 43 Online                0 SalesInvoice'), ('179', '1', 'SalesOrder', null, null, '2016-07-21 20:20:06', null, '2016-07-21 20:20:06', 'OnlineUnpaid', '  2016-07-21 20:20:06 2016-07-21 20:20:06 44 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"newepantest\",\"custom_field_value_name\":\"newepantest\"}}]'), ('180', '1', 'SalesInvoice', null, null, '2016-07-21 20:20:06', null, '2016-07-21 20:20:06', 'Due', '  2016-07-21 20:20:06 2016-07-21 20:20:06 44 Online                0 SalesInvoice'), ('182', '1', 'SalesOrder', null, null, '2016-07-27 05:37:02', null, '2016-07-27 05:37:02', 'OnlineUnpaid', '  2016-07-27 05:37:02 2016-07-27 05:37:02 45 Online address udaipur 313001 address udaipur 313001 2000 2000.00 2000.00 0 SalesOrder E-Commerce Theme (Orange) 2000.0000 2000 0.0000 0  []'), ('183', '1', 'SalesInvoice', null, null, '2016-07-27 05:37:02', null, '2016-07-27 05:37:02', 'Due', '  2016-07-27 05:37:02 2016-07-27 05:37:02 45 Online address udaipur 313001 address udaipur 313001    0 SalesInvoice'), ('184', '1', 'SalesOrder', null, null, '2016-07-27 05:41:25', null, '2016-07-27 05:41:25', 'OnlineUnpaid', '  2016-07-27 05:41:25 2016-07-27 05:41:25 46 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"kuldeep\",\"custom_field_value_name\":\"kuldeep\"}}]'), ('185', '1', 'SalesInvoice', null, null, '2016-07-27 05:41:25', null, '2016-07-27 05:41:25', 'Due', '  2016-07-27 05:41:25 2016-07-27 05:41:25 46 Online                0 SalesInvoice'), ('188', '1', 'SocialPost', null, '31', '2016-07-28 16:50:33', null, '2016-07-28 16:50:33', 'Approved', '  How To Configure SSH Key-Based Authentication on a Linux Server - Author: Vijay Mali SocialPost   Approved'), ('190', '1', 'SalesOrder', null, null, '2016-07-28 20:50:38', null, '2016-07-28 20:50:38', 'OnlineUnpaid', '  2016-07-28 20:50:38 2016-07-28 20:50:38 47 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"gowrav\",\"custom_field_value_name\":\"gowrav\"}}]'), ('191', '1', 'SalesInvoice', null, null, '2016-07-28 20:50:38', null, '2016-07-28 20:50:38', 'Due', '  2016-07-28 20:50:38 2016-07-28 20:50:38 47 Online                0 SalesInvoice'), ('192', '1', 'SalesOrder', null, null, '2016-07-29 16:15:46', null, '2016-07-29 16:15:46', 'OnlineUnpaid', '  2016-07-29 16:15:46 2016-07-29 16:15:46 48 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"vijay\",\"custom_field_value_name\":\"vijay\"}}]'), ('193', '1', 'SalesInvoice', null, null, '2016-07-29 16:15:46', null, '2016-07-29 16:15:46', 'Due', '  2016-07-29 16:15:46 2016-07-29 16:15:46 48 Online                0 SalesInvoice'), ('194', '1', 'SalesOrder', null, null, '2016-07-29 16:46:36', null, '2016-07-29 16:46:36', 'OnlineUnpaid', '  2016-07-29 16:46:36 2016-07-29 16:46:36 49 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"vijay1\",\"custom_field_value_name\":\"vijay1\"}}]'), ('195', '1', 'SalesInvoice', null, null, '2016-07-29 16:46:36', null, '2016-07-29 16:46:36', 'Due', '  2016-07-29 16:46:36 2016-07-29 16:46:36 49 Online                0 SalesInvoice'), ('196', '1', 'SalesOrder', null, null, '2016-07-29 16:51:17', null, '2016-07-29 16:51:17', 'OnlineUnpaid', '  2016-07-29 16:51:17 2016-07-29 16:51:17 50 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"vijay2\",\"custom_field_value_name\":\"vijay2\"}}]'), ('197', '1', 'SalesInvoice', null, null, '2016-07-29 16:51:17', null, '2016-07-29 16:51:17', 'Due', '  2016-07-29 16:51:17 2016-07-29 16:51:17 50 Online                0 SalesInvoice'), ('198', '1', 'SalesOrder', null, null, '2016-07-29 16:55:41', null, '2016-07-29 16:55:41', 'OnlineUnpaid', '  2016-07-29 16:55:41 2016-07-29 16:55:41 51 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"vijay3\",\"custom_field_value_name\":\"vijay3\"}}]'), ('199', '1', 'SalesInvoice', null, null, '2016-07-29 16:55:41', null, '2016-07-29 16:55:41', 'Due', '  2016-07-29 16:55:41 2016-07-29 16:55:41 51 Online                0 SalesInvoice'), ('200', '1', 'SalesOrder', null, null, '2016-07-29 17:16:24', null, '2016-07-29 17:16:24', 'OnlineUnpaid', '  2016-07-29 17:16:24 2016-07-29 17:16:24 52 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"vijay\",\"custom_field_value_name\":\"vijay\"}}]'), ('201', '1', 'SalesInvoice', null, null, '2016-07-29 17:16:24', null, '2016-07-29 17:16:24', 'Due', '  2016-07-29 17:16:24 2016-07-29 17:16:24 52 Online                0 SalesInvoice'), ('202', '1', 'SalesOrder', null, null, '2016-08-05 14:49:48', null, '2016-08-05 14:49:48', 'OnlineUnpaid', '  2016-08-05 14:49:48 2016-08-05 14:49:48 53 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001testepan\",\"custom_field_value_name\":\"001testepan\"}}]'), ('203', '1', 'SalesInvoice', null, null, '2016-08-05 14:49:48', null, '2016-08-05 14:49:48', 'Due', '  2016-08-05 14:49:48 2016-08-05 14:49:48 53 Online                0 SalesInvoice'), ('204', '1', 'SalesOrder', null, null, '2016-08-05 16:10:44', null, '2016-08-05 16:10:44', 'OnlineUnpaid', '  2016-08-05 16:10:44 2016-08-05 16:10:44 54 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('205', '1', 'SalesInvoice', null, null, '2016-08-05 16:10:44', null, '2016-08-05 16:10:44', 'Due', '  2016-08-05 16:10:44 2016-08-05 16:10:44 54 Online                0 SalesInvoice'), ('206', '1', 'SalesOrder', null, null, '2016-08-05 16:39:16', null, '2016-08-05 16:39:16', 'OnlineUnpaid', '  2016-08-05 16:39:16 2016-08-05 16:39:16 55 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('207', '1', 'SalesInvoice', null, null, '2016-08-05 16:39:16', null, '2016-08-05 16:39:16', 'Due', '  2016-08-05 16:39:16 2016-08-05 16:39:16 55 Online                0 SalesInvoice'), ('208', '1', 'SalesOrder', null, null, '2016-08-05 17:02:07', null, '2016-08-05 17:02:07', 'OnlineUnpaid', '  2016-08-05 17:02:07 2016-08-05 17:02:07 56 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('209', '1', 'SalesInvoice', null, null, '2016-08-05 17:02:07', null, '2016-08-05 17:02:07', 'Due', '  2016-08-05 17:02:07 2016-08-05 17:02:07 56 Online                0 SalesInvoice'), ('210', '1', 'SalesOrder', null, null, '2016-08-05 17:09:38', null, '2016-08-05 17:09:38', 'OnlineUnpaid', '  2016-08-05 17:09:38 2016-08-05 17:09:38 57 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('211', '1', 'SalesInvoice', null, null, '2016-08-05 17:09:38', null, '2016-08-05 17:09:38', 'Due', '  2016-08-05 17:09:38 2016-08-05 17:09:38 57 Online                0 SalesInvoice'), ('212', '1', 'SalesOrder', null, null, '2016-08-13 18:25:38', null, '2016-08-13 18:25:38', 'OnlineUnpaid', '  2016-08-13 18:25:38 2016-08-13 18:25:38 58 Online 29, mali colony tekri road udaipur 313001 29, mali colony tekri road udaipur 313001 2000 2000.00 2000.00 0 SalesOrder Elegent Blogger 2000.0000 2000 0.0000 0  []'), ('213', '1', 'SalesInvoice', null, null, '2016-08-13 18:25:38', null, '2016-08-13 18:25:38', 'Due', '  2016-08-13 18:25:38 2016-08-13 18:25:38 58 Online 29, mali colony tekri road udaipur 313001 29, mali colony tekri road udaipur 313001    0 SalesInvoice'), ('214', '1', 'MarketingCategory', null, '1', '2016-08-15 19:21:24', null, '2016-08-15 19:21:24', null, '  Epan Service Partners MarketingCategory '), ('217', '1', 'SalesOrder', null, null, '2016-08-17 11:14:41', null, '2016-08-17 11:14:41', 'OnlineUnpaid', '  2016-08-17 11:14:41 2016-08-17 11:14:41 59 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('218', '1', 'SalesInvoice', null, null, '2016-08-17 11:14:41', null, '2016-08-17 11:14:41', 'Due', '  2016-08-17 11:14:41 2016-08-17 11:14:41 59 Online             0 0.00 0.00 0 SalesInvoice EpanTrial 1.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('219', '1', 'SalesOrder', null, null, '2016-08-17 11:21:35', null, '2016-08-17 11:21:35', 'OnlineUnpaid', '  2016-08-17 11:21:35 2016-08-17 11:21:35 60 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('220', '1', 'SalesInvoice', null, null, '2016-08-17 11:21:35', null, '2016-08-17 11:21:35', 'Due', '  2016-08-17 11:21:35 2016-08-17 11:21:35 60 Online             0 0.00 0.00 0 SalesInvoice EpanTrial 1.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('221', '1', 'SalesOrder', null, null, '2016-08-17 11:38:59', null, '2016-08-17 11:38:59', 'OnlineUnpaid', '  2016-08-17 11:38:59 2016-08-17 11:38:59 61 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('222', '1', 'SalesInvoice', null, null, '2016-08-17 11:38:59', null, '2016-08-17 11:38:59', 'Due', '  2016-08-17 11:38:59 2016-08-17 11:38:59 61 Online             0 0.00 0.00 0 SalesInvoice EpanTrial 1.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"001trialepan\",\"custom_field_value_name\":\"001trialepan\"}}]'), ('223', '1', 'SalesOrder', null, null, '2016-08-17 11:59:20', null, '2016-08-17 11:59:20', 'OnlineUnpaid', '  2016-08-17 11:59:20 2016-08-17 11:59:20 62 Online                0 SalesOrder EpanTrial 0.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"sententia\",\"custom_field_value_name\":\"sententia\"}}]'), ('224', '1', 'SalesInvoice', null, null, '2016-08-17 11:59:20', null, '2016-08-17 11:59:20', 'Due', '  2016-08-17 11:59:20 2016-08-17 11:59:20 62 Online             0 0.00 0.00 0 SalesInvoice EpanTrial 1.0000 0 0.0000 0  [{\"department_name\":\"\",\"1\":{\"custom_field_name\":\"epan name\",\"custom_field_value_id\":\"sententia\",\"custom_field_value_name\":\"sententia\"}}]');
COMMIT;

-- ----------------------------
-- Table structure for `emails`
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`contact_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `contact_id` (`contact_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of emails
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `emailsetting`
-- ----------------------------
DROP TABLE IF EXISTS `emailsetting`;
CREATE TABLE `emailsetting` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`email_transport`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`encryption`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email_host`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email_port`  varchar(244) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email_username`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email_password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email_reply_to`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email_reply_to_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`from_email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`from_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sender_email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sender_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`smtp_auto_reconnect`  int(11) NULL DEFAULT NULL ,
`email_threshold`  int(11) NULL DEFAULT NULL ,
`emails_in_BCC`  int(11) NULL DEFAULT NULL ,
`last_emailed_at`  date NULL DEFAULT NULL ,
`email_sent_in_this_minute`  int(11) NULL DEFAULT NULL ,
`bounce_imap_email_host`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bounce_imap_email_port`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`return_path`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bounce_imap_email_password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bounce_imap_flags`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_support_email`  tinyint(4) NULL DEFAULT NULL ,
`imap_email_host`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`imap_email_port`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`imap_email_username`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`imap_email_password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`imap_flags`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`auto_reply`  tinyint(4) NULL DEFAULT NULL ,
`email_subject`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email_body`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`denied_email_subject`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`denied_email_body`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`footer`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`is_imap_enabled`  tinyint(4) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`mass_mail`  tinyint(4) UNSIGNED NULL DEFAULT NULL ,
`signature`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of emailsetting
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
`contact_id`  int(11) NOT NULL ,
`post_id`  int(11) NULL DEFAULT NULL ,
`department_id`  int(11) NULL DEFAULT NULL ,
`notified_till`  int(11) NULL DEFAULT 0 ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`offer_date`  date NULL DEFAULT NULL ,
`doj`  date NULL DEFAULT NULL ,
`contract_date`  date NULL DEFAULT NULL ,
`leaving_date`  date NULL DEFAULT NULL ,
`mode`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`in_time`  time NULL DEFAULT NULL ,
`out_time`  time NULL DEFAULT NULL ,
`remark`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `fk_employee_contact1_idx` (`contact_id`) USING BTREE ,
INDEX `fk_employee_post1_idx` (`post_id`) USING BTREE ,
INDEX `department_id` (`department_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` VALUES ('1', '2', '1', '114', '1', null, '2016-06-02', null, null, null, null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for `employee_documents`
-- ----------------------------
DROP TABLE IF EXISTS `employee_documents`;
CREATE TABLE `employee_documents` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`employee_document_id`  int(11) NOT NULL ,
`employee_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `employee_document_id` (`employee_document_id`) USING BTREE ,
INDEX `employee_id` (`employee_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of employee_documents
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `employee_movement`
-- ----------------------------
DROP TABLE IF EXISTS `employee_movement`;
CREATE TABLE `employee_movement` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`employee_id`  int(11) NOT NULL ,
`time`  datetime NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`direction`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`reason`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`narration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `employee_id` (`employee_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=73

;

-- ----------------------------
-- Records of employee_movement
-- ----------------------------
BEGIN;
INSERT INTO `employee_movement` VALUES ('1', '1', '2016-06-03 18:10:03', 'Attandance', 'In', null, null), ('2', '1', '2016-06-04 17:44:45', 'Attandance', 'In', null, null), ('3', '1', '2016-06-05 16:14:48', 'Attandance', 'In', null, null), ('4', '1', '2016-06-07 05:13:45', 'Attandance', 'In', null, null), ('5', '1', '2016-06-07 05:39:13', 'Attandance', 'Out', 'Personal Outing', ''), ('6', '1', '2016-06-07 05:39:20', 'Attandance', 'In', null, null), ('7', '1', '2016-06-08 08:30:09', 'Attandance', 'In', null, null), ('8', '1', '2016-06-09 04:08:36', 'Attandance', 'In', null, null), ('9', '1', '2016-06-12 13:39:33', 'Attandance', 'In', null, null), ('10', '1', '2016-06-13 05:40:39', 'Attandance', 'In', null, null), ('11', '1', '2016-06-14 04:15:32', 'Attandance', 'In', null, null), ('12', '1', '2016-06-14 13:02:13', 'Attandance', 'Out', 'Personal Outing', ''), ('13', '1', '2016-06-14 14:20:07', 'Attandance', 'In', null, null), ('14', '1', '2016-06-15 04:53:21', 'Attandance', 'In', null, null), ('15', '1', '2016-06-16 04:33:39', 'Attandance', 'In', null, null), ('16', '1', '2016-06-20 13:28:02', 'Attandance', 'In', null, null), ('17', '1', '2016-06-21 03:55:17', 'Attandance', 'In', null, null), ('18', '1', '2016-06-22 05:01:16', 'Attandance', 'In', null, null), ('19', '1', '2016-06-23 04:13:47', 'Attandance', 'In', null, null), ('20', '1', '2016-06-24 05:48:04', 'Attandance', 'In', null, null), ('21', '1', '2016-06-27 03:49:46', 'Attandance', 'In', null, null), ('22', '1', '2016-06-28 06:42:30', 'Attandance', 'In', null, null), ('23', '1', '2016-06-29 09:21:20', 'Attandance', 'In', null, null), ('24', '1', '2016-06-30 13:13:26', 'Attandance', 'In', null, null), ('25', '1', '2016-07-01 12:04:08', 'Attandance', 'In', null, null), ('26', '1', '2016-07-02 09:56:47', 'Attandance', 'In', null, null), ('27', '1', '2016-07-04 09:58:22', 'Attandance', 'In', null, null), ('28', '1', '2016-07-05 09:46:04', 'Attandance', 'In', null, null), ('29', '1', '2016-07-06 10:10:56', 'Attandance', 'In', null, null), ('30', '1', '2016-07-07 11:58:35', 'Attandance', 'In', null, null), ('31', '1', '2016-07-08 13:15:41', 'Attandance', 'In', null, null), ('32', '1', '2016-07-11 10:16:25', 'Attandance', 'In', null, null), ('33', '1', '2016-07-12 11:55:34', 'Attandance', 'In', null, null), ('34', '1', '2016-07-13 11:30:39', 'Attandance', 'In', null, null), ('35', '1', '2016-07-14 14:48:19', 'Attandance', 'In', null, null), ('36', '1', '2016-07-14 16:31:58', 'Attandance', 'Out', 'Personal Outing', ''), ('37', '1', '2016-07-14 19:16:18', 'Attandance', 'Out', 'Official Outing', ''), ('38', '1', '2016-07-15 11:22:12', 'Attandance', 'In', null, null), ('39', '1', '2016-07-16 12:21:28', 'Attandance', 'In', null, null), ('40', '1', '2016-07-17 09:28:12', 'Attandance', 'In', null, null), ('41', '1', '2016-07-18 09:16:18', 'Attandance', 'In', null, null), ('42', '1', '2016-07-18 14:48:51', 'Attandance', 'Out', 'Official Outing', ''), ('43', '1', '2016-07-19 18:20:17', 'Attandance', 'In', null, null), ('44', '1', '2016-07-20 08:54:33', 'Attandance', 'In', null, null), ('45', '1', '2016-07-21 12:42:22', 'Attandance', 'In', null, null), ('46', '1', '2016-07-22 09:35:43', 'Attandance', 'In', null, null), ('47', '1', '2016-07-23 10:26:16', 'Attandance', 'In', null, null), ('48', '1', '2016-07-23 20:43:07', 'Attandance', 'Out', 'Official Outing', ''), ('49', '1', '2016-07-23 20:43:19', 'Attandance', 'In', null, null), ('50', '1', '2016-07-26 16:17:11', 'Attandance', 'In', null, null), ('51', '1', '2016-07-27 06:10:48', 'Attandance', 'In', null, null), ('54', '1', '2016-07-28 14:58:47', 'Attandance', 'In', null, null), ('55', '1', '2016-07-28 18:11:12', 'Attandance', 'Out', 'Official Outing', ''), ('56', '1', '2016-07-29 16:52:22', 'Attandance', 'In', null, null), ('57', '1', '2016-07-30 10:12:19', 'Attandance', 'In', null, null), ('59', '1', '2016-07-31 14:02:20', 'Attandance', 'In', null, null), ('60', '1', '2016-08-01 10:05:24', 'Attandance', 'In', null, null), ('61', '1', '2016-08-02 09:12:45', 'Attandance', 'In', null, null), ('62', '1', '2016-08-03 09:16:36', 'Attandance', 'In', null, null), ('63', '1', '2016-08-04 10:32:09', 'Attandance', 'In', null, null), ('64', '1', '2016-08-05 08:48:34', 'Attandance', 'In', null, null), ('66', '1', '2016-08-08 14:08:14', 'Attandance', 'In', null, null), ('67', '1', '2016-08-12 17:00:20', 'Attandance', 'In', null, null), ('68', '1', '2016-08-13 17:45:28', 'Attandance', 'In', null, null), ('69', '1', '2016-08-15 12:50:36', 'Attandance', 'In', null, null), ('70', '1', '2016-08-16 16:07:09', 'Attandance', 'In', null, null), ('71', '1', '2016-08-17 10:33:28', 'Attandance', 'In', null, null), ('72', '1', '2016-08-20 14:30:51', 'Attandance', 'In', null, null);
COMMIT;

-- ----------------------------
-- Table structure for `epan`
-- ----------------------------
DROP TABLE IF EXISTS `epan`;
CREATE TABLE `epan` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_category_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
`created_at`  datetime NULL DEFAULT NULL ,
`type`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`xepan_template_id`  int(11) NULL DEFAULT NULL ,
`valid_till`  datetime NULL DEFAULT NULL ,
`is_published`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`extra_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`aliases`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`epan_dbversion`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`epan_category_id`) REFERENCES `epan_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `fk_epan_category_id` (`epan_category_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=47

;

-- ----------------------------
-- Records of epan
-- ----------------------------
BEGIN;
INSERT INTO `epan` VALUES ('1', '1', 'www', 'Paid', null, '2016-06-02 23:19:14', 'Epan', null, null, null, '{\"title\":\"Epan services: ERP, CRM & E-Comm with accountability features\",\"meta_keyword\":\"Epan, xEpan, ERP, Drag & Drop Website Builder, PHP, CRM, Support system, Hosted service\",\"meta_description\":\"Epan Services are hosted system based on xEpan Opensource PHP based system.\"}', null, '3'), ('3', '1', 'e-store', 'Paid', '9', '2016-06-14 12:02:59', 'Epan', null, null, '1', '{\"qsp_detail_id\":\"58\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', null, null), ('4', '1', 'webstore', 'Paid', '9', '2016-06-14 12:35:18', 'Epan', null, null, '1', '{\"qsp_detail_id\":\"66\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', null, null), ('6', '1', 'default', 'Paid', '9', '2016-06-14 12:46:54', 'Epan', null, null, '1', '{\"qsp_detail_id\":\"70\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', null, null), ('9', '1', 'onlinestore', 'Paid', '9', '2016-06-14 13:43:42', 'Epan', null, null, '1', '{\"qsp_detail_id\":\"84\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', null, null), ('10', '1', 'e-shop', 'Paid', '9', '2016-06-14 13:56:55', 'Epan', null, null, '1', '{\"qsp_detail_id\":\"86\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', null, null), ('13', '1', 'rakesh', 'Paid', '12', '2016-06-21 13:41:28', 'Epan', '0', null, '1', '{\"qsp_detail_id\":\"92\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', '', null), ('14', '1', 'documentation', 'Paid', '9', '2016-06-23 09:41:43', 'Epan', null, null, null, '{\"qsp_detail_id\":\"94\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', null, null), ('15', '1', 'demo', 'Paid', '9', '2016-06-23 09:54:14', 'Epan', '0', null, '1', '{\"qsp_detail_id\":\"96\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', '', null), ('16', '1', 'printing', 'Paid', '9', '2016-07-02 11:35:54', 'Epan', null, null, '1', '{\"qsp_detail_id\":\"104\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', null, null), ('21', '1', 'xcideveloper', 'Paid', '9', '2016-07-15 11:53:42', 'Epan', null, null, '1', '{\"qsp_detail_id\":\"114\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', null, null), ('25', '1', 'xavoclife', 'Paid', '12', '2016-07-21 12:45:40', 'Epan', '0', null, '1', '{\"qsp_detail_id\":\"122\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', '', null), ('31', '1', 'kuldeep', 'Paid', '9', '2016-07-27 05:41:25', 'Epan', '0', null, '', '{\"qsp_detail_id\":\"136\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', '', ''), ('32', '1', 'gowrav', 'Paid', '2', '2016-07-28 20:50:38', 'Epan', '0', null, '', '{\"qsp_detail_id\":\"138\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', '', ''), ('37', '1', 'vijay', 'Paid', '6', '2016-07-29 17:16:24', 'Epan', '0', null, '1', '{\"qsp_detail_id\":\"148\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', '', '2'), ('46', '1', 'sententia', 'Paid', '28', '2016-08-17 11:59:20', 'Epan', '0', null, '1', '{\"qsp_detail_id\":\"168\",\"item_id\":\"6\",\"specification\":{\"Hr\":\"Yes\",\"Communication\":\"Yes\",\"Projects\":\"Yes\",\"Marketing\":\"Yes\",\"Accounts\":\"Yes\",\"Commerce\":\"Yes\",\"Production\":\"Yes\",\"Crm\":\"Yes\",\"Cms\":\"Yes\",\"Blog\":\"Yes\"}}', '', '3');
COMMIT;

-- ----------------------------
-- Table structure for `epan_category`
-- ----------------------------
DROP TABLE IF EXISTS `epan_category`;
CREATE TABLE `epan_category` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of epan_category
-- ----------------------------
BEGIN;
INSERT INTO `epan_category` VALUES ('1', 'default');
COMMIT;

-- ----------------------------
-- Table structure for `epan_config`
-- ----------------------------
DROP TABLE IF EXISTS `epan_config`;
CREATE TABLE `epan_config` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`head`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`value`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`application`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=25

;

-- ----------------------------
-- Records of epan_config
-- ----------------------------
BEGIN;
INSERT INTO `epan_config` VALUES ('1', '1', 'DEFAULT_CURRENCY_ID', '5', 'accounts'), ('2', '1', 'REGISTRATION_TYPE', 'self_activated', 'base'), ('3', '1', 'REGISTRATION_SUBJECT', 'Epan services - Registration mail', 'base'), ('4', '1', 'REGISTRATION_BODY', '<style type=\"text/css\"><!--\r\n/* CLIENT-SPECIFIC STYLES */\r\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\r\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\r\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\r\n  /* RESET STYLES */\r\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\r\n  table{border-collapse: collapse !important;}\r\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\r\n  /* iOS BLUE LINKS */\r\n  a[x-apple-data-detectors] {\r\n  color: inherit !important;\r\n  text-decoration: none !important;\r\n  font-size: inherit !important;\r\n  font-family: inherit !important;\r\n  font-weight: inherit !important;\r\n  line-height: inherit !important;\r\n  }\r\n  /* MOBILE STYLES */\r\n  @media screen and (max-width: 525px) {\r\n  /* ALLOWS FOR FLUID TABLES */\r\n  .wrapper {\r\n  width: 100% !important;\r\n  max-width: 100% !important;\r\n  }\r\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\r\n  .logo img {\r\n  margin: 0 auto !important;\r\n  }\r\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\r\n  .mobile-hide {\r\n  display: none !important;\r\n  }\r\n  .img-max {\r\n  max-width: 100% !important;\r\n  width: 100% !important;\r\n  height: auto !important;\r\n  }\r\n  /* FULL-WIDTH TABLES */\r\n  .responsive-table {\r\n  width: 100% !important;\r\n  }\r\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\r\n  .padding {\r\n  padding: 10px 5% 15px 5% !important;\r\n  }\r\n  .padding-meta {\r\n  padding: 30px 5% 0px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .padding-copy {\r\n  padding: 10px 5% 10px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .no-padding {\r\n  padding: 0 !important;\r\n  }\r\n  .section-padding {\r\n  padding: 50px 15px 50px 15px !important;\r\n  }\r\n  /* ADJUST BUTTONS ON MOBILE */\r\n  .mobile-button-container {\r\n  margin: 0 auto;\r\n  width: 100% !important;\r\n  }\r\n  .mobile-button {\r\n  padding: 15px !important;\r\n  border: 0 !important;\r\n  font-size: 16px !important;\r\n  display: block !important;\r\n  }\r\n  }\r\n  /* ANDROID CENTER FIX */\r\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\r\n--></style>\r\n<!--if gte mso 12\r\nstyle(type=\'text/css\').\r\n  .mso-right {\r\n  padding-left: 20px;\r\n  }\r\n-->\r\n<p>&nbsp;</p>\r\n<!-- HIDDEN PREHEADER TEXT-->\r\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">&nbsp;</div>\r\n<!-- HEADER-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"height: 165px;\">\r\n<td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        -->\r\n<table class=\"wrapper\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"xEpan\" style=\"padding: 15px 0;\" align=\"center\" valign=\"top\"><a href=\"#\" target=\"_blank\"><img style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" src=\"websites/www/assets/logo.png\" alt=\"Logo\" width=\"180\" height=\"120\" border=\"0\" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n<tr style=\"height: 10px;\">\r\n<td class=\"section-padding\" style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\">\r\n<table class=\"responsive-table\" border=\"0\" width=\"500\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><!-- COPY-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\">It\'s Great To Have You</td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\">Dear member,<br />Thank you for registering. {$email_id}! It&rsquo;s great to have you in the community.<br />Before you can take advantage of all the great features your account comes with, you&rsquo;ll need to verify your email address. <br />Click the button below to verify your email and experience the best.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align=\"center\"><!-- BULLETPROOF BUTTON-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding\" style=\"padding-top: 25px;\" align=\"center\">\r\n<table class=\"mobile-button-container\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"border-radius: 3px;\" align=\"center\" bgcolor=\"#256F9C\"><a class=\"mobile-button\" style=\"font-size: 16px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; border-radius: 3px; padding: 15px 25px; border: 1px solid #256F9C; display: inline-block;\" href=\"{$url}\" target=\"_blank\">Click Here &rarr;</a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 20px;\">\r\n<td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        --> <!-- UNSUBSCRIBE COPY-->\r\n<table class=\"responsive-table\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801, +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.i\">info@epan.in</a><br />A Xavoc Technocrats Pvt. Ltd. Product</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', 'base'), ('5', '1', 'RESET_PASSWORD_SUBJECT', 'Epan services - Reset password', 'base'), ('6', '1', 'RESET_PASSWORD_BODY', '<style type=\"text/css\"><!--\r\n/* CLIENT-SPECIFIC STYLES */\r\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\r\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\r\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\r\n  /* RESET STYLES */\r\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\r\n  table{border-collapse: collapse !important;}\r\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\r\n  /* iOS BLUE LINKS */\r\n  a[x-apple-data-detectors] {\r\n  color: inherit !important;\r\n  text-decoration: none !important;\r\n  font-size: inherit !important;\r\n  font-family: inherit !important;\r\n  font-weight: inherit !important;\r\n  line-height: inherit !important;\r\n  }\r\n  /* MOBILE STYLES */\r\n  @media screen and (max-width: 525px) {\r\n  /* ALLOWS FOR FLUID TABLES */\r\n  .wrapper {\r\n  width: 100% !important;\r\n  max-width: 100% !important;\r\n  }\r\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\r\n  .logo img {\r\n  margin: 0 auto !important;\r\n  }\r\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\r\n  .mobile-hide {\r\n  display: none !important;\r\n  }\r\n  .img-max {\r\n  max-width: 100% !important;\r\n  width: 100% !important;\r\n  height: auto !important;\r\n  }\r\n  /* FULL-WIDTH TABLES */\r\n  .responsive-table {\r\n  width: 100% !important;\r\n  }\r\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\r\n  .padding {\r\n  padding: 10px 5% 15px 5% !important;\r\n  }\r\n  .padding-meta {\r\n  padding: 30px 5% 0px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .padding-copy {\r\n  padding: 10px 5% 10px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .no-padding {\r\n  padding: 0 !important;\r\n  }\r\n  .section-padding {\r\n  padding: 50px 15px 50px 15px !important;\r\n  }\r\n  /* ADJUST BUTTONS ON MOBILE */\r\n  .mobile-button-container {\r\n  margin: 0 auto;\r\n  width: 100% !important;\r\n  }\r\n  .mobile-button {\r\n  padding: 15px !important;\r\n  border: 0 !important;\r\n  font-size: 16px !important;\r\n  display: block !important;\r\n  }\r\n  }\r\n  /* ANDROID CENTER FIX */\r\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\r\n--></style>\r\n<!--if gte mso 12\r\nstyle(type=\'text/css\').\r\n  .mso-right {\r\n  padding-left: 20px;\r\n  }\r\n-->\r\n<p>&nbsp;</p>\r\n<!-- HIDDEN PREHEADER TEXT-->\r\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">&nbsp;</div>\r\n<!-- HEADER-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"height: 165px;\">\r\n<td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        -->\r\n<table class=\"wrapper\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"xEpan\" style=\"padding: 15px 0;\" align=\"center\" valign=\"top\"><a href=\"#\" target=\"_blank\"><img style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" src=\"websites/www/assets/logo.png\" alt=\"Logo\" width=\"180\" height=\"120\" border=\"0\" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n<tr style=\"height: 10px;\">\r\n<td class=\"section-padding\" style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\">\r\n<table class=\"responsive-table\" border=\"0\" width=\"500\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><!-- COPY-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\">Password Reset Request</td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\">{$username},<br />We received a request to reset the password for your account.<br />Here\'s a one-time login link for you to use to access your account and set a new password. Click on the below button to proceed. <br />This link will expire after a day and nothing will happen if it\'s not used.<br />See you!</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align=\"center\"><!-- BULLETPROOF BUTTON-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding\" style=\"padding-top: 25px;\" align=\"center\">\r\n<table class=\"mobile-button-container\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"border-radius: 3px;\" align=\"center\" bgcolor=\"#256F9C\"><a class=\"mobile-button\" style=\"font-size: 16px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; border-radius: 3px; padding: 15px 25px; border: 1px solid #256F9C; display: inline-block;\" href=\"{$url}\" target=\"_blank\">Click Here &rarr;</a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 20px;\">\r\n<td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        --> <!-- UNSUBSCRIBE COPY-->\r\n<table class=\"responsive-table\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801, +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.i\">info@epan.in</a><br />A Xavoc Technocrats Pvt. Ltd. Product</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'base'), ('7', '1', 'VERIFICATIONE_MAIL_SUBJECT', 'Epan services - Account validated', 'base'), ('8', '1', 'VERIFICATIONE_MAIL_BODY', '<style type=\"text/css\"><!--\r\n/* CLIENT-SPECIFIC STYLES */\r\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\r\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\r\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\r\n  /* RESET STYLES */\r\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\r\n  table{border-collapse: collapse !important;}\r\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\r\n  /* iOS BLUE LINKS */\r\n  a[x-apple-data-detectors] {\r\n  color: inherit !important;\r\n  text-decoration: none !important;\r\n  font-size: inherit !important;\r\n  font-family: inherit !important;\r\n  font-weight: inherit !important;\r\n  line-height: inherit !important;\r\n  }\r\n  /* MOBILE STYLES */\r\n  @media screen and (max-width: 525px) {\r\n  /* ALLOWS FOR FLUID TABLES */\r\n  .wrapper {\r\n  width: 100% !important;\r\n  max-width: 100% !important;\r\n  }\r\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\r\n  .logo img {\r\n  margin: 0 auto !important;\r\n  }\r\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\r\n  .mobile-hide {\r\n  display: none !important;\r\n  }\r\n  .img-max {\r\n  max-width: 100% !important;\r\n  width: 100% !important;\r\n  height: auto !important;\r\n  }\r\n  /* FULL-WIDTH TABLES */\r\n  .responsive-table {\r\n  width: 100% !important;\r\n  }\r\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\r\n  .padding {\r\n  padding: 10px 5% 15px 5% !important;\r\n  }\r\n  .padding-meta {\r\n  padding: 30px 5% 0px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .padding-copy {\r\n  padding: 10px 5% 10px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .no-padding {\r\n  padding: 0 !important;\r\n  }\r\n  .section-padding {\r\n  padding: 50px 15px 50px 15px !important;\r\n  }\r\n  /* ADJUST BUTTONS ON MOBILE */\r\n  .mobile-button-container {\r\n  margin: 0 auto;\r\n  width: 100% !important;\r\n  }\r\n  .mobile-button {\r\n  padding: 15px !important;\r\n  border: 0 !important;\r\n  font-size: 16px !important;\r\n  display: block !important;\r\n  }\r\n  }\r\n  /* ANDROID CENTER FIX */\r\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\r\n--></style>\r\n<!--if gte mso 12\r\nstyle(type=\'text/css\').\r\n  .mso-right {\r\n  padding-left: 20px;\r\n  }\r\n-->\r\n<p>&nbsp;</p>\r\n<!-- HIDDEN PREHEADER TEXT-->\r\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">&nbsp;</div>\r\n<!-- HEADER-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"height: 165px;\">\r\n<td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        -->\r\n<table class=\"wrapper\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"xEpan\" style=\"padding: 15px 0;\" align=\"center\" valign=\"top\"><a href=\"#\" target=\"_blank\"><img style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" src=\"websites/www/assets/logo.png\" alt=\"Logo\" width=\"180\" height=\"120\" border=\"0\" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n<tr style=\"height: 10px;\">\r\n<td class=\"section-padding\" style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\">\r\n<table class=\"responsive-table\" border=\"0\" width=\"500\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><!-- COPY-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\">Account Validated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\">{$username},<br />Your account has been successfully validated.<br />Now you can enjoy the services by just logging in your account.<br />Don\'t forgot to try before you buy a service ! We provide <strong>14 day free</strong><strong>trial.<br /></strong><br />Greetings!</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align=\"center\"><!-- BULLETPROOF BUTTON-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding\" style=\"padding-top: 25px;\" align=\"center\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 20px;\">\r\n<td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        --> <!-- UNSUBSCRIBE COPY-->\r\n<table class=\"responsive-table\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801, +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.in\">info@epan.in</a><br />A Xavoc Technocrats Pvt. Ltd. Product</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', 'base'), ('9', '1', 'UPDATE_PASSWORD_SUBJECT', 'Epan services - Password updated', 'base'), ('10', '1', 'UPDATE_PASSWORD_BODY', '<style type=\"text/css\"><!--\r\n/* CLIENT-SPECIFIC STYLES */\r\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\r\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\r\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\r\n  /* RESET STYLES */\r\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\r\n  table{border-collapse: collapse !important;}\r\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\r\n  /* iOS BLUE LINKS */\r\n  a[x-apple-data-detectors] {\r\n  color: inherit !important;\r\n  text-decoration: none !important;\r\n  font-size: inherit !important;\r\n  font-family: inherit !important;\r\n  font-weight: inherit !important;\r\n  line-height: inherit !important;\r\n  }\r\n  /* MOBILE STYLES */\r\n  @media screen and (max-width: 525px) {\r\n  /* ALLOWS FOR FLUID TABLES */\r\n  .wrapper {\r\n  width: 100% !important;\r\n  max-width: 100% !important;\r\n  }\r\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\r\n  .logo img {\r\n  margin: 0 auto !important;\r\n  }\r\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\r\n  .mobile-hide {\r\n  display: none !important;\r\n  }\r\n  .img-max {\r\n  max-width: 100% !important;\r\n  width: 100% !important;\r\n  height: auto !important;\r\n  }\r\n  /* FULL-WIDTH TABLES */\r\n  .responsive-table {\r\n  width: 100% !important;\r\n  }\r\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\r\n  .padding {\r\n  padding: 10px 5% 15px 5% !important;\r\n  }\r\n  .padding-meta {\r\n  padding: 30px 5% 0px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .padding-copy {\r\n  padding: 10px 5% 10px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .no-padding {\r\n  padding: 0 !important;\r\n  }\r\n  .section-padding {\r\n  padding: 50px 15px 50px 15px !important;\r\n  }\r\n  /* ADJUST BUTTONS ON MOBILE */\r\n  .mobile-button-container {\r\n  margin: 0 auto;\r\n  width: 100% !important;\r\n  }\r\n  .mobile-button {\r\n  padding: 15px !important;\r\n  border: 0 !important;\r\n  font-size: 16px !important;\r\n  display: block !important;\r\n  }\r\n  }\r\n  /* ANDROID CENTER FIX */\r\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\r\n--></style>\r\n<!--if gte mso 12\r\nstyle(type=\'text/css\').\r\n  .mso-right {\r\n  padding-left: 20px;\r\n  }\r\n-->\r\n<p>&nbsp;</p>\r\n<!-- HIDDEN PREHEADER TEXT-->\r\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">&nbsp;</div>\r\n<!-- HEADER-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"height: 165px;\">\r\n<td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        -->\r\n<table class=\"wrapper\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"xEpan\" style=\"padding: 15px 0;\" align=\"center\" valign=\"top\"><a href=\"#\" target=\"_blank\"><img style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" src=\"websites/www/assets/logo.png\" alt=\"Logo\" width=\"180\" height=\"120\" border=\"0\" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n<tr style=\"height: 10px;\">\r\n<td class=\"section-padding\" style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\">\r\n<table class=\"responsive-table\" border=\"0\" width=\"500\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><!-- COPY-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\">Password Updated</td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\">Hi {$username},<br />Your password has been successfully updated.<br />If you are not the person who changed the password, please report it<br />to superuser/authority and make sure to reset your password again.<br /><strong>Note: Don\'t share your password with anybody.</strong><br /><br />Greetings!</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align=\"center\"><!-- BULLETPROOF BUTTON-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding\" style=\"padding-top: 25px;\" align=\"center\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 20px;\">\r\n<td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        --> <!-- UNSUBSCRIBE COPY-->\r\n<table class=\"responsive-table\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801, +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.i\">info@epan.in</a><br />A Xavoc Technocrats Pvt. Ltd. Product</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', 'base'), ('11', '1', 'SALES_INVOICE_FROM_EMAIL_ONLINE', '1', 'commerce'), ('12', '1', 'SALES_INVOICE_SUBJECT_ONLINE', 'Online Invoice Email  Subject', 'commerce'), ('13', '1', 'SALES_INVOICE_BODY_ONLINE', 'Online Invoice Email&nbsp; Body<br /><br />\r\n<p>Online Sales Invoice Body<br /><br />{$contact}<br />{$first_name}<br />{$last_name}<br />{$name}<br />{$user}<br />{$emails_str}<br />{$contacts_str}<br />{$organization}<br />{$post}<br />{$address}<br />{$city}<br />{$state}<br />{$pin_code}<br />{$country}<br />{$created_at}<br />{$billing_address}<br />{$billing_pincode}<br />{$billing_city}<br />{$billing_state}<br />{$billing_country}<br />{$shipping_address}<br />{$shipping_city}<br />{$shipping_pincode}<br />{$shipping_state}<br />{$shipping_country}<br />{$search_string}<br />{$document_no}<br />{$related_qsp_master}<br />{$total_amount}<br />{$gross_amount}<br />{$discount_amount}<br />{$net_amount}<br />{$net_amount_self_currency}<br />{$round_amount}<br />{$exchange_rate}<br />{$narration}<br />{$tnc}<br />{$tnc_text}</p>', 'commerce'), ('14', '1', 'TAX_ON_SHIPPING', '0', 'commerce'), ('15', '1', 'TAX_AS_PER', 'billing', 'commerce'), ('16', '1', 'TIME_ZONE', 'Asia/Kolkata', 'base'), ('18', '1', 'COMPANY_AND_OWNER_INFORMATION', '{\"5773a08fb4522\":{\"company_name\":\"Xavoc Technocrats Pvt. Ltd\",\"company_owner\":\"Gowrav Vishwakarma\",\"mobile_no\":\"9783807100\",\"company_email\":\"info@xavoc.com\",\"company_address\":\"18\\/436, Gaytri marg, kanji ka hata, Inside Surajpol, Udaipur, Rajasthan, India.\",\"company_pin_code\":\"313001\",\"company_description\":\"test\",\"company_logo_absolute_url\":\"https:\\/\\/www.epan.in\\/websites\\/www\\/www\\/images\\/logo3.png\",\"company_twitter_url\":\"https:\\/\\/www.twitter.com\\/xavoc.international\\/\",\"company_facebook_url\":\"https:\\/\\/www.facebook.com\\/xavoc.international\\/\",\"company_google_url\":\"https:\\/\\/www.google.com\\/xavoc.international\\/\",\"company_linkedin_url\":\"https:\\/\\/www.linkedin.com\\/company\\/xavoc-technocrats-pvt-ltd---india\"}}', 'communication'), ('19', '1', 'STRATEGY_PLANNING_TARGET_AUDIENCE', '{\"1\":{\"data\":{\"id\":1,\"name\":\"Companies in need of smart, better management and marketing\",\"parent\":0,\"level\":1},\"children\":[{\"data\":{\"id\":2,\"name\":\"e-Commerce\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":7,\"name\":\"Printing Industry\",\"parent\":\"2\",\"level\":3},\"children\":[]},{\"data\":{\"id\":8,\"name\":\"Electronics Delaers\",\"parent\":\"2\",\"level\":3},\"children\":[]}]},{\"data\":{\"id\":3,\"name\":\"IT Developers\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":12,\"name\":\"Digital Marketing\",\"parent\":\"3\",\"level\":3},\"children\":[]}]},{\"data\":{\"id\":9,\"name\":\"Bloggers\",\"parent\":\"1\",\"level\":2},\"children\":[]},{\"data\":{\"id\":10,\"name\":\"Startups\",\"parent\":\"1\",\"level\":2},\"children\":[]},{\"data\":{\"id\":11,\"name\":\"Manufacturers\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":6,\"name\":\"Furniture Manufactureres\",\"parent\":\"11\",\"level\":3},\"children\":[]}]}]},\"2\":{\"data\":{\"id\":2,\"name\":\"e-Commerce\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":7,\"name\":\"Printing Industry\",\"parent\":\"2\",\"level\":3},\"children\":[]},{\"data\":{\"id\":8,\"name\":\"Electronics Delaers\",\"parent\":\"2\",\"level\":3},\"children\":[]}]},\"3\":{\"data\":{\"id\":3,\"name\":\"IT Developers\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":12,\"name\":\"Digital Marketing\",\"parent\":\"3\",\"level\":3},\"children\":[]}]},\"6\":{\"data\":{\"id\":6,\"name\":\"Furniture Manufactureres\",\"parent\":\"11\",\"level\":3},\"children\":[]},\"7\":{\"data\":{\"id\":7,\"name\":\"Printing Industry\",\"parent\":\"2\",\"level\":3},\"children\":[]},\"8\":{\"data\":{\"id\":8,\"name\":\"Electronics Delaers\",\"parent\":\"2\",\"level\":3},\"children\":[]},\"9\":{\"data\":{\"id\":9,\"name\":\"Bloggers\",\"parent\":\"1\",\"level\":2},\"children\":[]},\"10\":{\"data\":{\"id\":10,\"name\":\"Startups\",\"parent\":\"1\",\"level\":2},\"children\":[]},\"11\":{\"data\":{\"id\":11,\"name\":\"Manufacturers\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":6,\"name\":\"Furniture Manufactureres\",\"parent\":\"11\",\"level\":3},\"children\":[]}]},\"12\":{\"data\":{\"id\":12,\"name\":\"Digital Marketing\",\"parent\":\"3\",\"level\":3},\"children\":[]}}', 'marketing'), ('20', '1', 'SUBSCRIPTION_MAIL_SUBJECT', 'Subscription confirmed to epan feeds', 'base'), ('21', '1', 'SUBSCRIPTION_MAIL_BODY', '<style type=\"text/css\"><!--\r\n/* CLIENT-SPECIFIC STYLES */\r\n  body, table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\r\n  table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up */\r\n  img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\r\n  /* RESET STYLES */\r\n  img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}\r\n  table{border-collapse: collapse !important;}\r\n  body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}\r\n  /* iOS BLUE LINKS */\r\n  a[x-apple-data-detectors] {\r\n  color: inherit !important;\r\n  text-decoration: none !important;\r\n  font-size: inherit !important;\r\n  font-family: inherit !important;\r\n  font-weight: inherit !important;\r\n  line-height: inherit !important;\r\n  }\r\n  /* MOBILE STYLES */\r\n  @media screen and (max-width: 525px) {\r\n  /* ALLOWS FOR FLUID TABLES */\r\n  .wrapper {\r\n  width: 100% !important;\r\n  max-width: 100% !important;\r\n  }\r\n  /* ADJUSTS LAYOUT OF LOGO IMAGE */\r\n  .logo img {\r\n  margin: 0 auto !important;\r\n  }\r\n  /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */\r\n  .mobile-hide {\r\n  display: none !important;\r\n  }\r\n  .img-max {\r\n  max-width: 100% !important;\r\n  width: 100% !important;\r\n  height: auto !important;\r\n  }\r\n  /* FULL-WIDTH TABLES */\r\n  .responsive-table {\r\n  width: 100% !important;\r\n  }\r\n  /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */\r\n  .padding {\r\n  padding: 10px 5% 15px 5% !important;\r\n  }\r\n  .padding-meta {\r\n  padding: 30px 5% 0px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .padding-copy {\r\n  padding: 10px 5% 10px 5% !important;\r\n  text-align: center;\r\n  }\r\n  .no-padding {\r\n  padding: 0 !important;\r\n  }\r\n  .section-padding {\r\n  padding: 50px 15px 50px 15px !important;\r\n  }\r\n  /* ADJUST BUTTONS ON MOBILE */\r\n  .mobile-button-container {\r\n  margin: 0 auto;\r\n  width: 100% !important;\r\n  }\r\n  .mobile-button {\r\n  padding: 15px !important;\r\n  border: 0 !important;\r\n  font-size: 16px !important;\r\n  display: block !important;\r\n  }\r\n  }\r\n  /* ANDROID CENTER FIX */\r\n  div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\r\n--></style>\r\n<!--if gte mso 12\r\nstyle(type=\'text/css\').\r\n  .mso-right {\r\n  padding-left: 20px;\r\n  }\r\n-->\r\n<p>&nbsp;</p>\r\n<!-- HIDDEN PREHEADER TEXT-->\r\n<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">&nbsp;</div>\r\n<!-- HEADER-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr style=\"height: 165px;\">\r\n<td style=\"height: 165px;\" align=\"center\" bgcolor=\"#34495E\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        -->\r\n<table class=\"wrapper\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"xEpan\" style=\"padding: 15px 0;\" align=\"center\" valign=\"top\"><a href=\"#\" target=\"_blank\"><img style=\"display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;\" src=\"websites/www/assets/logo.png\" alt=\"Logo\" width=\"180\" height=\"120\" border=\"0\" /></a></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n<tr style=\"height: 10px;\">\r\n<td class=\"section-padding\" style=\"padding: 70px 15px; height: 10px;\" align=\"center\" bgcolor=\"#ffffff\">\r\n<table class=\"responsive-table\" border=\"0\" width=\"500\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td><!-- COPY-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"font-size: 25px; font-family: Helvetica, Arial, sans-serif; color: #333333; padding-top: 30px;\" align=\"center\">Subscription Confirmed</td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-copy\" style=\"padding: 20px 0px 0px; font-size: 16px; line-height: 25px; font-family: Helvetica,Arial,sans-serif; color: #666666; text-align: left;\" align=\"center\">\r\n<p>Hi {$username},<br />Thanks for subscribing to Epan feeds.<br />Your subscription has been confirmed. You\'ve been added to our list and will hear from us soon.</p>\r\n<p><br />Greetings!</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align=\"center\"><!-- BULLETPROOF BUTTON-->\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding\" style=\"padding-top: 25px;\" align=\"center\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 20px;\">\r\n<td style=\"padding: 20px 0px; height: 20px;\" align=\"center\" bgcolor=\"#ffffff\"><!--if (gte mso 9)|(IE)\r\n        table(align=\'center\', border=\'0\', cellspacing=\'0\', cellpadding=\'0\', width=\'500\')\r\n          tr\r\n            td(align=\'center\', valign=\'top\', width=\'500\')\r\n        --> <!-- UNSUBSCRIBE COPY-->\r\n<table class=\"responsive-table\" style=\"max-width: 500px;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666;\" align=\"center\">+91-9782300801, +91-8875191258 <a href=\"mailto:support@epan.in|\">support@epan.in</a> <a href=\"mailto:info@epan.i\">info@epan.in</a><br />A Xavoc Technocrats Pvt. Ltd. Product</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<!--if (gte mso 9)|(IE)--></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'base'), ('22', '1', 'STRATEGY_PLANNING_DIGITAL_PRESENCE', '{\"1\":{\"data\":{\"id\":1,\"name\":\"Digital Presence\",\"parent\":0,\"level\":1},\"children\":[{\"data\":{\"id\":2,\"name\":\"Facebook\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":4,\"name\":\"https://www.facebook.com/Xavoc-Technocrats-Pvt-Ltd-135211709885606\",\"parent\":\"2\",\"level\":3},\"children\":[]},{\"data\":{\"id\":5,\"name\":\"https://www.facebook.com/epanservices\",\"parent\":\"2\",\"level\":3},\"children\":[]}]},{\"data\":{\"id\":3,\"name\":\"Linkedin\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":6,\"name\":\"https://www.linkedin.com/company/xavoc-technocrats-pvt.-ltd.\",\"parent\":\"3\",\"level\":3},\"children\":[]}]},{\"data\":{\"id\":7,\"name\":\"Google Forum\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":8,\"name\":\"https://groups.google.com/forum/#!forum/xepan\",\"parent\":\"7\",\"level\":3},\"children\":[]}]}]},\"2\":{\"data\":{\"id\":2,\"name\":\"Facebook\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":4,\"name\":\"https://www.facebook.com/Xavoc-Technocrats-Pvt-Ltd-135211709885606\",\"parent\":\"2\",\"level\":3},\"children\":[]},{\"data\":{\"id\":5,\"name\":\"https://www.facebook.com/epanservices\",\"parent\":\"2\",\"level\":3},\"children\":[]}]},\"3\":{\"data\":{\"id\":3,\"name\":\"Linkedin\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":6,\"name\":\"https://www.linkedin.com/company/xavoc-technocrats-pvt.-ltd.\",\"parent\":\"3\",\"level\":3},\"children\":[]}]},\"4\":{\"data\":{\"id\":4,\"name\":\"https://www.facebook.com/Xavoc-Technocrats-Pvt-Ltd-135211709885606\",\"parent\":\"2\",\"level\":3},\"children\":[]},\"5\":{\"data\":{\"id\":5,\"name\":\"https://www.facebook.com/epanservices\",\"parent\":\"2\",\"level\":3},\"children\":[]},\"6\":{\"data\":{\"id\":6,\"name\":\"https://www.linkedin.com/company/xavoc-technocrats-pvt.-ltd.\",\"parent\":\"3\",\"level\":3},\"children\":[]},\"7\":{\"data\":{\"id\":7,\"name\":\"Google Forum\",\"parent\":\"1\",\"level\":2},\"children\":[{\"data\":{\"id\":8,\"name\":\"https://groups.google.com/forum/#!forum/xepan\",\"parent\":\"7\",\"level\":3},\"children\":[]}]},\"8\":{\"data\":{\"id\":8,\"name\":\"https://groups.google.com/forum/#!forum/xepan\",\"parent\":\"7\",\"level\":3},\"children\":[]}}', 'marketing'), ('23', '1', 'STRATEGY_PLANNING_COMETETORS', '{\"577e12f68bd87\":{\"name\":\"Hubspot\",\"url\":\"www.hubspot.com\",\"description\":\"HubSpot is an inbound marketing and sales platform that helps companies attract visitors, convert leads, and close customers.\"},\"577e135e637ce\":{\"name\":\"ERP Next\",\"url\":\"https:\\/\\/erpnext.com\",\"description\":\"ERP Made Simple. ERPNext helps you take full control of your business. It is as powerful as it is easy to use.\"},\"577e13b27ef43\":{\"name\":\"ERP 5\",\"url\":\"https:\\/\\/www.erp5.com\\/\",\"description\":\"The ERP5.com website (using Simplicity theme)\"},\"577e142e14932\":{\"name\":\"Shopify\",\"url\":\"https:\\/\\/www.shopify.in\\/\",\"description\":\"Everything you need to sell. Build your online store with Shopify&#39;s ecommerce software and easily sell in person with Shopify&#39;s iPad POS.\"},\"577e1546aad58\":{\"name\":\"WordPress\",\"url\":\"https:\\/\\/wordpress.com\\/\",\"description\":\"Create a free website or easily build a blog on WordPress.com. Hundreds of free, customizable, mobile-ready designs and themes. Free hosting and support.\"}}', 'base'), ('24', '1', 'URL OF BLOG POST', null, 'blog');
COMMIT;

-- ----------------------------
-- Table structure for `experience`
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`employee_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`department`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`company_branch`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`salary`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`designation`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`duration`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `employee_id` (`employee_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of experience
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `filestore_file`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_file`;
CREATE TABLE `filestore_file` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`filestore_type_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'File type' ,
`filestore_volume_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Volume' ,
`original_filename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Original Name' ,
`filename`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Internal Name' ,
`filesize`  int(11) NOT NULL DEFAULT 0 COMMENT 'File size' ,
`deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Deleted file' ,
PRIMARY KEY (`id`),
INDEX `fk_filestore_file_filestore_type1_idx` (`filestore_type_id`) USING BTREE ,
INDEX `fk_filestore_file_filestore_volume1_idx` (`filestore_volume_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of filestore_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `filestore_image`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_image`;
CREATE TABLE `filestore_image` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`original_file_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Original File' ,
`thumb_file_id`  int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Thumbnail file' ,
PRIMARY KEY (`id`),
INDEX `fk_filestore_image_filestore_file1_idx` (`original_file_id`) USING BTREE ,
INDEX `fk_filestore_image_filestore_file2_idx` (`thumb_file_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=21

;

-- ----------------------------
-- Records of filestore_image
-- ----------------------------
BEGIN;
INSERT INTO `filestore_image` VALUES ('1', '46', '45'), ('2', '47', '45'), ('3', '49', '48'), ('4', '50', '48'), ('5', '52', '51'), ('6', '53', '51'), ('8', '57', '55'), ('10', '60', '58'), ('11', '62', '61'), ('12', '63', '61'), ('13', '65', '64'), ('14', '66', '64'), ('15', '68', '67'), ('16', '69', '67'), ('17', '71', '70'), ('18', '72', '70'), ('19', '75', '74'), ('20', '76', '74');
COMMIT;

-- ----------------------------
-- Table structure for `filestore_type`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_type`;
CREATE TABLE `filestore_type` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Name' ,
`mime_type`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MIME type' ,
`extension`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Filename extension' ,
`allow`  tinyint(1) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of filestore_type
-- ----------------------------
BEGIN;
INSERT INTO `filestore_type` VALUES ('1', 'application/pdf', 'application/pdf', '', '1'), ('2', 'image/png', 'image/png', '', '1'), ('3', 'image/jpeg', 'image/jpeg', '', '1'), ('4', 'image/jpg', 'image/jpg', '', '1');
COMMIT;

-- ----------------------------
-- Table structure for `filestore_volume`
-- ----------------------------
DROP TABLE IF EXISTS `filestore_volume`;
CREATE TABLE `filestore_volume` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Volume name' ,
`dirname`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Folder name' ,
`total_space`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Total space (not implemented)' ,
`used_space`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Used space (not implemented)' ,
`stored_files_cnt`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Approximate count of stored files' ,
`enabled`  tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Volume enabled?' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of filestore_volume
-- ----------------------------
BEGIN;
INSERT INTO `filestore_volume` VALUES ('1', 'upload', 'upload', '1000000000', '0', '455', '1');
COMMIT;

-- ----------------------------
-- Table structure for `follower_task_association`
-- ----------------------------
DROP TABLE IF EXISTS `follower_task_association`;
CREATE TABLE `follower_task_association` (
`task_id`  int(11) NULL DEFAULT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`employee_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `task_id` (`task_id`) USING BTREE ,
INDEX `employee_id` (`employee_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of follower_task_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `installed_application`
-- ----------------------------
DROP TABLE IF EXISTS `installed_application`;
CREATE TABLE `installed_application` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`application_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`installed_on`  datetime NULL DEFAULT NULL ,
`valid_till`  datetime NULL DEFAULT NULL ,
`is_active`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `application_id` (`application_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of installed_application
-- ----------------------------
BEGIN;
INSERT INTO `installed_application` VALUES ('1', '1', '1', null, '2016-06-02 23:19:14', '2016-06-02 23:19:14', '1'), ('2', '1', '2', null, null, null, '1'), ('3', '1', '3', null, null, null, '1'), ('4', '1', '4', null, null, null, '1'), ('5', '1', '5', null, null, null, '1'), ('6', '1', '6', null, null, null, '1'), ('7', '1', '7', null, null, null, '1'), ('8', '1', '8', null, null, null, '1'), ('9', '1', '9', null, null, null, '1'), ('10', '1', '10', null, null, null, '1'), ('11', '1', '11', null, null, null, '1');
COMMIT;

-- ----------------------------
-- Table structure for `invoice_transaction_association`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_transaction_association`;
CREATE TABLE `invoice_transaction_association` (
`id`  int(11) NOT NULL ,
`transaction_id`  int(11) NULL DEFAULT NULL ,
`salesinvoice_id`  int(11) NULL DEFAULT NULL ,
`amount`  double NULL DEFAULT NULL ,
`currency`  int(11) NULL DEFAULT NULL ,
`exchange_rate`  decimal(10,0) NULL DEFAULT NULL ,
`exchange_amount`  decimal(10,0) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `transaction_id` (`transaction_id`) USING BTREE ,
INDEX `saleinvoice_id` (`salesinvoice_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of invoice_transaction_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `IP2LOCATION-LITE-DB11`
-- ----------------------------
DROP TABLE IF EXISTS `IP2LOCATION-LITE-DB11`;
CREATE TABLE `IP2LOCATION-LITE-DB11` (
`ip_from`  int(11) NULL DEFAULT NULL ,
`ip_to`  int(11) NULL DEFAULT NULL ,
`country_code`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`country`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`state`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`city`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`latitude`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`longitude`  float NULL DEFAULT NULL ,
`zip_code`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`time_zone`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of IP2LOCATION-LITE-DB11
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
`document_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`sku`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`original_price`  decimal(14,2) NULL DEFAULT NULL ,
`sale_price`  decimal(14,2) NULL DEFAULT NULL ,
`expiry_date`  date NULL DEFAULT NULL ,
`description`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`stock_availability`  tinyint(4) NULL DEFAULT NULL ,
`show_detail`  tinyint(1) NULL DEFAULT NULL ,
`show_price`  tinyint(1) NULL DEFAULT NULL ,
`display_sequence`  int(11) NULL DEFAULT NULL ,
`is_new`  tinyint(1) NULL DEFAULT NULL ,
`is_feature`  tinyint(1) NULL DEFAULT NULL ,
`is_mostviewed`  tinyint(1) NULL DEFAULT NULL ,
`Item_enquiry_auto_reply`  tinyint(1) NULL DEFAULT NULL ,
`is_comment_allow`  tinyint(1) NULL DEFAULT NULL ,
`comment_api`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`add_custom_button`  tinyint(1) NULL DEFAULT NULL ,
`custom_button_url`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`meta_title`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`meta_description`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`tags`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`is_designable`  tinyint(1) NULL DEFAULT NULL ,
`designs`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`is_party_publish`  tinyint(1) NULL DEFAULT NULL ,
`minimum_order_qty`  int(11) NULL DEFAULT NULL ,
`maximum_order_qty`  int(11) NULL DEFAULT NULL ,
`qty_unit`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`is_attachment_allow`  tinyint(1) NULL DEFAULT NULL ,
`is_saleable`  tinyint(1) NULL DEFAULT NULL ,
`is_downloadable`  tinyint(1) NULL DEFAULT NULL ,
`is_rentable`  tinyint(1) NULL DEFAULT NULL ,
`is_enquiry_allow`  tinyint(1) NULL DEFAULT NULL ,
`is_template`  tinyint(1) NULL DEFAULT NULL ,
`negative_qty_allowed`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`is_visible_sold`  tinyint(1) NULL DEFAULT NULL ,
`enquiry_send_to_admin`  tinyint(1) NULL DEFAULT NULL ,
`watermark_position`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`watermark_opacity`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`qty_from_set_only`  tinyint(1) NULL DEFAULT NULL ,
`custom_button_label`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`is_servicable`  tinyint(1) NULL DEFAULT NULL ,
`is_purchasable`  tinyint(1) NULL DEFAULT NULL ,
`maintain_inventory`  tinyint(1) NULL DEFAULT NULL ,
`website_display`  tinyint(1) NULL DEFAULT NULL ,
`allow_negative_stock`  tinyint(1) NULL DEFAULT NULL ,
`is_productionable`  tinyint(1) NULL DEFAULT NULL ,
`warranty_days`  int(11) NULL DEFAULT NULL ,
`terms_and_conditions`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`watermark_text`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`duplicate_from_item_id`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`is_allowuploadable`  tinyint(1) NULL DEFAULT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`designer_id`  int(11) NULL DEFAULT NULL ,
`is_dispatchable`  tinyint(1) NULL DEFAULT NULL ,
`item_specific_upload_hint`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`upload_file_label`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`to_customer_id`  int(11) NULL DEFAULT NULL ,
`weight`  decimal(10,0) NULL DEFAULT NULL ,
`quantity_group`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`upload_file_group`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`is_renewable`  tinyint(4) NULL DEFAULT NULL ,
`remind_to`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`renewable_value`  int(11) NULL DEFAULT NULL ,
`renewable_unit`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE ,
INDEX `duplicate_from_item_id` (`duplicate_from_item_id`) USING BTREE ,
INDEX `to_customer_id` (`to_customer_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=16

;

-- ----------------------------
-- Records of item
-- ----------------------------
BEGIN;
INSERT INTO `item` VALUES ('6', 'EpanTrial', 'ep-full-trial', '0.00', '0.00', null, '', null, '1', '1', '0', '1', '0', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', null, null, '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Center', '50', '1', '', '0', '0', '0', '0', '0', '0', null, '', '', null, '0', '1', null, '0', '', '', null, '0', null, '', null, null, null, null), ('50', 'Elegent Blogger', 'default', '2100.00', '2000.00', null, 'If you are looking for a theme for blogging, profile, or for a simple website then this could be the theme you are searching for. This single theme will fit in for a large amount of devices.', null, '1', '1', '0', '0', '0', '1', '0', '1', 'disqus', '0', '', null, null, null, '0', null, '0', '1', '1', '', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', null, '0', '3', '1', '0', '', '', null, '0', '', '', null, null, null, null), ('55', 'E-Commerce Theme (Blue)', 'e-store', '2650.00', '2500.00', '2017-03-31', 'With features like Bootstrap,&nbsp;&nbsp;Responsiveness, Search Engine Friendly, Crossbrowser Compatibility,&nbsp;&nbsp;Dropdown Menu,&nbsp;&nbsp;Favicon, Social Options,&nbsp;&nbsp;Tabs,&nbsp;&nbsp;Tag Cloud,&nbsp;&nbsp;Tooltips, this theme can come handy for E-Commerce business.', null, '1', '1', '0', '0', '0', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '1000', 'pcs', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', null, '0', '4', null, '0', '', '', null, '0', '', '', null, null, null, null), ('72', 'E-Commerce Theme (Pink)', 'webstore', '2450.00', '2450.00', '2017-03-31', 'If you are looking for a modern E-Commerce Bootstrap Theme then <strong>this</strong> could very well be the theme you\'ve been searching for all this time.', null, '1', '1', '0', '0', '0', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '1000', 'pcs', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', null, '0', '5', null, '0', '', '', null, '0', '', '', null, null, null, null), ('79', 'E-Commerce Theme (Orange)', 'onlinestore', '2200.00', '2000.00', '2017-03-31', '<p>Thanks to E-Commerce Theme (Orange) that your search for an amazing e-commerce template is going to be over. It is a&nbsp; responsive template with lot of features like a clean design, device friendly layout etc.</p>', null, '1', '1', '0', '0', '0', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '1000', 'pcs', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', null, '0', '6', null, '0', '', '', null, '0', '', '', null, null, null, null), ('94', 'E-Commerce Theme (primary)', 'e-shop', '2550.00', '2400.00', '2017-03-31', 'An E-Commerce website template with lots of features which will make you stop your search for templates. It comes with like buttons, awesome icons, clean layout, responsiveness etc.', null, '1', '1', '0', '0', '0', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '1', '', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', null, '0', '7', null, '0', '', '', null, '0', '', '', null, null, null, null), ('98', 'Epan Item Template', 'epan-item-template', '1500.00', '1000.00', null, '$5/month', null, '0', '0', '0', '0', '0', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '10', 'month', '0', '1', '0', '0', '0', '1', '0', '0', '0', 'Center', '50', '1', '', '0', '0', '0', '0', '0', '0', null, '', '', null, '0', '9', null, '0', '', '', null, '0', '', '', null, null, null, null), ('99', 'CMS/BLOG', 'cms-001', '600.00', '500.00', null, '<div style=\"text-align: center;\"><strong>Less Than $ 8 / Month (billed annually)<br /></strong></div>\r\n<p><br />CMS/Blog package is perfect choice for bloggers or any company requiring an informative website. Purchasing now will let you have Drag and Drop CMS with live editing feature absolutely FREE. this tool lets you manage your website easily.</p>', null, '1', '1', '0', '0', '0', '1', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '10', 'Month', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', '98', '0', '10', null, '0', '', '', null, '0', '', '', null, null, null, null), ('100', 'Blog', 'blog-001', '1500.00', '1000.00', null, '', null, '1', '1', '0', '0', '0', '1', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '10', 'month', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', '98', '0', '11', null, '0', '', '', null, '0', '', '', null, null, null, null), ('101', 'E-commerce', 'ecommerce-001', '6666.00', '4999.00', null, '<div style=\"text-align: center;\"><strong>Less Than $ 75 / Month (billed annually)</strong></div>\r\n<p><br />Epan services provides one of best E-commerce system with increasing features daily. Highly customization based design makes Epan E-Commerce suitable for all sort of business, including products and services. Fully integrated with simple accounting, generating full features Balance sheet and P&amp;L from simple tasks.<br /><br />Offline ready: Yes! Epan E-Commerce is designed in such a away that you can manage your Offline business as well as Online. <br /><br />From Lead to Quotation. Followup to Newsletters, Sales order to Dispatch management. Everything you may need.&nbsp;<br /><br />Got something that is not managed by our E-commerce! just contact our friendly technical experts and share your ideas with them.</p>', null, '1', '1', '0', '0', '1', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '10', 'Month', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', '98', '0', '12', null, '0', '', '', null, '0', '', '', null, null, null, null), ('102', 'Digital Marketing', 'Digital-marketing-001', '1500.00', '1000.00', null, '', null, '1', '1', '0', '1', '0', '1', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '10', 'month', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', '98', '0', '13', null, '0', '', '', null, '0', '', '', null, null, null, null), ('103', 'CRM', 'crm-001', '1500.00', '1000.00', null, '', null, '1', '1', '0', '1', '1', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '10', 'month', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', '98', '0', '14', null, '0', '', '', null, '0', '', '', null, null, null, null), ('104', 'ERP/CRM/E-Comm', 'erp-001', '16999.00', '9999.00', null, '<p style=\"text-align: center;\"><strong>Less Than $ 150 / Month (billed annually)</strong></p>\r\n<p><br />Epan services ERP is one of world\'s most sophisticated ERP.&nbsp; In-fact it is a package of highly integrated yet modular ERP, CRM and E-Commerce with Digital Marketing. Apart from its Job processing and Bird eye views, accountability feature of Our ERP is really unique. <br /><br />Manage uniquely designed Email system to get all your communications in one place.</p>', null, '1', '1', '0', '1', '0', '0', '0', '0', null, '0', '', null, null, null, '0', null, '0', '1', '10', 'Month', '0', '1', '0', '0', '0', '0', '0', '1', '0', 'Center', '50', '1', '', '0', '0', '0', '1', '0', '0', null, '', '', '98', '0', '15', null, '0', '', '', null, '0', '', '', null, null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for `item_department_association`
-- ----------------------------
DROP TABLE IF EXISTS `item_department_association`;
CREATE TABLE `item_department_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`department_id`  int(11) NOT NULL ,
`item_id`  int(11) NOT NULL ,
`can_redefine_qty`  tinyint(4) NOT NULL ,
`can_redefine_item`  tinyint(4) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `department_id` (`department_id`) USING BTREE ,
INDEX `item_id` (`item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of item_department_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `item_department_consumption`
-- ----------------------------
DROP TABLE IF EXISTS `item_department_consumption`;
CREATE TABLE `item_department_consumption` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`composition_item_id`  int(11) NULL DEFAULT NULL ,
`quantity`  float NULL DEFAULT NULL ,
`unit`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`custom_fields`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`item_department_association_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `composition_item_id` (`composition_item_id`) USING BTREE ,
INDEX `item_department_association_id` (`item_department_association_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of item_department_consumption
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `item_image`
-- ----------------------------
DROP TABLE IF EXISTS `item_image`;
CREATE TABLE `item_image` (
`id`  int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT ,
`file_id`  int(11) NULL DEFAULT NULL ,
`item_id`  int(11) NULL DEFAULT NULL ,
`customfield_value_id`  int(11) NULL DEFAULT NULL ,
`title`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`alt_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`auto_generated`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `file_id` (`file_id`) USING BTREE ,
INDEX `item_id` (`item_id`) USING BTREE ,
INDEX `custom_field_value_id` (`customfield_value_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=35

;

-- ----------------------------
-- Records of item_image
-- ----------------------------
BEGIN;
INSERT INTO `item_image` VALUES ('00000000013', '21', '99', null, 'Drag And Drop', 'Drag And Drop', null), ('00000000014', '22', '99', null, 'Rich Text Editor', 'Rich Text Editor', null), ('00000000015', '23', '101', null, 'E-Comm Screen shot', 'Item Creation in E-Comm', null), ('00000000016', '24', '104', null, 'Projects Page', 'Projects Page', null), ('00000000017', '25', '104', null, 'Centralized Email system', 'Centralized Email system', null), ('00000000018', '26', '104', null, 'Support System', 'Support System Email', null), ('00000000019', '29', '104', null, 'Ticket Detail Page', 'Ticket Detail Page', null), ('00000000020', '28', '104', null, 'Marketing Dashboard', 'Marketing Dashboard', null), ('00000000022', '32', '55', null, '', '', null), ('00000000023', '33', '72', null, '', '', null), ('00000000024', '34', '72', null, '', '', null), ('00000000025', '35', '55', null, '', '', null), ('00000000026', '36', '79', null, '', '', null), ('00000000027', '37', '79', null, '', '', null), ('00000000028', '38', '50', null, '', '', null), ('00000000031', '41', '50', null, '', '', null), ('00000000032', '42', '94', null, '', '', null), ('00000000034', '44', '94', null, '', '', null);
COMMIT;

-- ----------------------------
-- Table structure for `item_template_design`
-- ----------------------------
DROP TABLE IF EXISTS `item_template_design`;
CREATE TABLE `item_template_design` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`item_id`  int(11) NULL DEFAULT NULL ,
`last_modified`  date NULL DEFAULT NULL ,
`is_ordered`  tinyint(4) NULL DEFAULT NULL ,
`designs`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`contact_id`  int(20) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `item_id` (`item_id`) USING BTREE ,
INDEX `contact_id` (`contact_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of item_template_design
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `jobcard`
-- ----------------------------
DROP TABLE IF EXISTS `jobcard`;
CREATE TABLE `jobcard` (
`document_id`  int(11) NULL DEFAULT NULL ,
`outsourceparty_id`  int(11) NOT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '	' ,
`department_id`  int(11) NOT NULL ,
`due_date`  date NULL DEFAULT NULL ,
`order_item_id`  int(11) NULL DEFAULT NULL ,
`parent_jobcard_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE ,
INDEX `outsource_party_id` (`outsourceparty_id`) USING BTREE ,
INDEX `department_id` (`department_id`) USING BTREE ,
INDEX `oreder_item_id` (`order_item_id`) USING BTREE ,
INDEX `parent_jobcard_id` (`parent_jobcard_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of jobcard
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `jobcard_detail`
-- ----------------------------
DROP TABLE IF EXISTS `jobcard_detail`;
CREATE TABLE `jobcard_detail` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`quantity`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`parent_detail_id`  int(11) NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`jobcard_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `parent_detail_id` (`parent_detail_id`) USING BTREE ,
INDEX `jobcard_id` (`jobcard_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of jobcard_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `landingresponse`
-- ----------------------------
DROP TABLE IF EXISTS `landingresponse`;
CREATE TABLE `landingresponse` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`campaign_id`  int(11) NULL DEFAULT NULL ,
`contact_id`  int(11) NULL DEFAULT NULL ,
`opportunity_id`  int(11) NULL DEFAULT NULL ,
`date`  datetime NULL DEFAULT NULL ,
`action`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`latitude`  float(10,6) NULL DEFAULT NULL ,
`longitude`  float(10,6) NULL DEFAULT NULL ,
`content_id`  int(11) NULL DEFAULT NULL ,
`emailsetting_id`  int(11) NULL DEFAULT NULL ,
`social_user_id`  int(11) NULL DEFAULT NULL ,
`referrersite`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `campaign_id` (`campaign_id`) USING BTREE ,
INDEX `opportunity_id` (`opportunity_id`) USING BTREE ,
INDEX `lead_id` (`contact_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=803

;

-- ----------------------------
-- Records of landingresponse
-- ----------------------------
BEGIN;
INSERT INTO `landingresponse` VALUES ('1', '6566', null, null, '2016-06-27 05:48:09', null, 'Newsletter Response', '173.252.123.129', null, null, '6565', null, null, null), ('2', '6566', null, null, '2016-06-27 05:48:15', null, 'Newsletter Response', '173.252.121.116', null, null, '6565', null, null, null), ('3', '6566', null, null, '2016-06-27 06:02:21', null, 'Newsletter Response', '150.242.254.2', null, null, '6565', null, null, 'https://www.facebook.com'), ('4', '6566', null, null, '2016-06-27 06:17:41', null, 'Newsletter Response', '150.242.254.2', null, null, '6565', null, null, 'https://www.facebook.com'), ('5', '6559', '455', null, '2016-06-27 07:10:25', null, 'Newsletter Response', '150.242.254.2', null, null, '6568', '2', null, null), ('6', '6561', null, null, '2016-06-27 11:31:27', null, 'Newsletter Response', '108.174.5.115', null, null, '6557', null, null, null), ('7', '6561', null, null, '2016-06-27 12:10:46', null, 'Newsletter Response', '108.174.2.206', null, null, '6558', null, null, null), ('8', '6561', null, null, '2016-06-27 12:28:20', null, 'Newsletter Response', '108.174.5.117', null, null, '6558', null, null, null), ('174', null, null, null, '2016-06-30 17:17:00', null, 'twitter', '199.59.148.211', null, null, '2', null, null, null), ('175', null, null, null, '2016-06-30 17:17:01', null, 'twitter', '17.142.155.175', null, null, '2', null, null, null), ('176', null, null, null, '2016-06-30 17:17:02', null, 'twitter', '216.46.175.37', null, null, '2', null, null, null), ('177', null, null, null, '2016-06-30 17:17:02', null, 'twitter', '216.46.175.36', null, null, '2', null, null, null), ('178', null, null, null, '2016-06-30 17:17:06', null, 'twitter', '144.76.23.132', null, null, '2', null, null, null), ('179', null, null, null, '2016-06-30 17:17:16', null, 'twitter', '199.16.156.125', null, null, '2', null, null, null), ('180', null, null, null, '2016-06-30 17:17:16', null, 'twitter', '23.96.208.137', null, null, '2', null, null, null), ('181', null, null, null, '2016-06-30 17:17:21', null, 'twitter', '74.6.254.117', null, null, '2', null, null, null), ('182', null, null, null, '2016-06-30 17:17:46', null, 'twitter', '37.187.167.30', null, null, '2', null, null, null), ('183', null, null, null, '2016-06-30 17:18:09', null, 'twitter', '199.59.148.209', null, null, '2', null, null, null), ('184', null, null, null, '2016-06-30 17:18:09', null, 'twitter', '66.220.146.23', null, null, '2', null, null, null), ('185', null, null, null, '2016-06-30 17:18:10', null, 'twitter', '216.46.175.37', null, null, '2', null, null, null), ('186', null, null, null, '2016-06-30 17:18:11', null, 'twitter', '216.46.175.34', null, null, '2', null, null, null), ('187', null, null, null, '2016-06-30 17:18:19', null, 'twitter', '74.6.254.117', null, null, '2', null, null, null), ('188', null, null, null, '2016-06-30 17:18:19', null, 'twitter', '66.220.146.25', null, null, '2', null, null, null), ('189', null, null, null, '2016-06-30 17:18:20', null, 'facebook', '31.13.102.125', null, null, '2', null, null, null), ('190', null, null, null, '2016-06-30 17:18:34', null, 'twitter', '167.114.1.197', null, null, '2', null, null, null), ('191', null, null, null, '2016-06-30 17:19:58', null, 'twitter', '74.6.254.117', null, null, '2', null, null, null), ('192', null, null, null, '2016-06-30 17:20:03', null, 'twitter', '74.6.254.117', null, null, '2', null, null, null), ('193', null, null, null, '2016-06-30 17:20:05', null, 'googleplus', '66.249.84.209', null, null, '2', null, null, null), ('194', null, null, null, '2016-06-30 17:20:55', null, 'googleplus', '72.14.199.97', null, null, '2', null, null, null), ('195', null, null, null, '2016-06-30 17:21:27', null, 'googleplus', '66.102.8.152', null, null, '2', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CDAQFjAB&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D2%26post_id%3D2%26source%3Dgoogleplus&ei=vgd1V9KZHL7MhgPWRg&usg=AFQjCNEXgnC0sMiVrfAkcfvCX0Td48RgJQ'), ('196', null, null, null, '2016-06-30 17:21:27', null, 'googleplus', '66.102.6.218', null, null, '2', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CCQQFjAB&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D2%26post_id%3D2%26source%3Dgoogleplus&ei=vgd1V6n8Gq_9vAfyNw&usg=AFQjCNEXgnC0sMiVrfAkcfvCX0Td48RgJQ'), ('197', null, null, null, '2016-06-30 17:22:02', null, 'googleplus', '66.102.6.170', null, null, '2', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CEQQFjAG&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D2%26post_id%3D2%26source%3Dgoogleplus&ei=vgd1V-K5Ks_AwgLPjgE&usg=AFQjCNEXgnC0sMiVrfAkcfvCX0Td48RgJQ'), ('198', null, null, null, '2016-06-30 17:22:07', null, 'googleplus', '66.249.84.213', null, null, '1', null, null, null), ('201', null, null, null, '2016-06-30 17:22:50', null, 'googleplus', '72.14.199.101', null, null, '1', null, null, null), ('202', null, null, null, '2016-06-30 17:23:26', null, 'googleplus', '66.102.8.152', null, null, '1', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=3&ved=0CEQQFjAF&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D1%26post_id%3D1%26source%3Dgoogleplus&ei=NQh1V7GbD7WHkQODXQ&usg=AFQjCNGxUSysjU2v7M2QINEsgnqobmpqlg'), ('203', null, null, null, '2016-06-30 17:23:32', null, 'googleplus', '66.102.8.158', null, null, '1', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=3&ved=0CDwQFjAB&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D1%26post_id%3D1%26source%3Dgoogleplus&ei=Owh1V4O0H-HH9waENA&usg=AFQjCNGxUSysjU2v7M2QINEsgnqobmpqlg'), ('204', null, null, null, '2016-06-30 17:23:43', null, 'googleplus', '66.102.8.152', null, null, '1', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=3&ved=0CEMQFjAD&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D1%26post_id%3D1%26source%3Dgoogleplus&ei=Lwh1V5HZMsCsKMuNAQ&usg=AFQjCNGxUSysjU2v7M2QINEsgnqobmpqlg'), ('205', null, null, null, '2016-06-30 17:25:23', null, 'twitter', '45.79.102.112', null, null, '2', null, null, null), ('206', null, null, null, '2016-06-30 17:25:54', null, 'googleplus', '72.14.199.101', null, null, '2', null, null, null), ('207', null, null, null, '2016-06-30 17:27:40', null, 'googleplus', '72.14.199.97', null, null, '1', null, null, null), ('209', null, null, null, '2016-06-30 17:36:06', null, 'twitter', '173.252.113.118', null, null, '2', null, null, null), ('210', null, null, null, '2016-06-30 17:40:43', null, 'twitter', '54.145.253.70', null, null, '2', null, null, null), ('211', null, null, null, '2016-06-30 17:40:45', null, 'twitter', '54.145.253.70', null, null, '2', null, null, null), ('220', null, null, null, '2016-06-30 18:11:13', null, 'twitter', '74.6.254.117', null, null, '2', null, null, null), ('222', null, null, null, '2016-06-30 18:14:51', null, 'twitter', '66.220.145.151', null, null, '2', null, null, null), ('224', null, null, null, '2016-06-30 18:41:22', null, 'googleplus', '66.249.71.134', null, null, '1', null, null, null), ('227', null, null, null, '2016-06-30 18:55:00', null, 'twitter', '106.215.176.34', null, null, '2', null, null, 'https://t.co/0Aqs2WvxMZ'), ('228', null, null, null, '2016-06-30 19:14:02', null, 'twitter', '74.6.254.117', null, null, '2', null, null, null), ('230', null, null, null, '2016-06-30 19:40:59', null, 'twitter', '173.252.79.114', null, null, '2', null, null, null), ('236', null, null, null, '2016-06-30 20:17:50', null, 'twitter', '66.220.146.186', null, null, '2', null, null, null), ('237', null, null, null, '2016-06-30 20:23:18', null, 'twitter', '173.252.114.117', null, null, '2', null, null, null), ('238', null, null, null, '2016-06-30 20:29:45', null, 'googleplus', '72.14.199.88', null, null, '2', null, null, null), ('239', null, null, null, '2016-06-30 20:29:46', null, 'googleplus', '72.14.199.84', null, null, '1', null, null, null), ('240', null, null, null, '2016-06-30 20:30:16', null, 'twitter', '173.252.115.11', null, null, '2', null, null, null), ('243', null, null, null, '2016-06-30 21:12:41', null, 'twitter', '173.252.105.115', null, null, '2', null, null, null), ('247', null, null, null, '2016-06-30 21:41:54', null, 'twitter', '173.252.75.113', null, null, '2', null, null, null), ('250', null, null, null, '2016-06-30 23:45:13', null, 'googleplus', '66.249.71.148', null, null, '2', null, null, null), ('254', null, null, null, '2016-07-01 01:57:41', null, 'twitter', '173.252.115.169', null, null, '2', null, null, null), ('255', null, null, null, '2016-07-01 02:07:02', null, 'twitter', '173.252.80.112', null, null, '2', null, null, null), ('256', null, null, null, '2016-07-01 02:12:41', null, 'twitter', '173.252.113.113', null, null, '2', null, null, null), ('257', null, null, null, '2016-07-01 04:58:57', null, 'twitter', '73.75.238.77', null, null, '2', null, null, 'https://t.co/0Aqs2WvxMZ'), ('258', null, null, null, '2016-07-01 06:14:31', null, 'twitter', '31.13.100.118', null, null, '2', null, null, null), ('259', null, null, null, '2016-07-01 07:27:48', null, 'twitter', '31.13.100.113', null, null, '2', null, null, null), ('260', null, null, null, '2016-07-01 07:43:45', null, 'twitter', '173.252.115.11', null, null, '2', null, null, null), ('261', null, null, null, '2016-07-01 08:36:56', null, 'twitter', '73.75.238.77', null, null, '2', null, null, 'https://t.co/0Aqs2WvxMZ'), ('263', null, null, null, '2016-07-01 09:24:23', null, 'twitter', '173.252.80.118', null, null, '2', null, null, null), ('264', null, null, null, '2016-07-01 09:54:45', null, 'facebook', '173.252.90.239', null, null, '1', null, null, null), ('265', null, null, null, '2016-07-01 10:02:18', null, 'twitter', '54.175.28.92', null, null, '2', null, null, null), ('273', null, null, null, '2016-07-01 21:13:07', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('278', null, null, null, '2016-07-02 11:15:23', null, 'googleplus', '66.249.84.217', null, null, '3', null, null, null), ('279', null, null, null, '2016-07-02 11:15:42', null, 'googleplus', '72.14.199.84', null, null, '3', null, null, null), ('280', null, null, null, '2016-07-02 11:16:31', null, 'googleplus', '72.14.199.97', null, null, '3', null, null, null), ('281', null, null, null, '2016-07-02 11:16:46', null, 'twitter', '199.59.148.211', null, null, '3', null, null, null), ('282', null, null, null, '2016-07-02 11:16:46', null, 'twitter', '66.220.146.21', null, null, '3', null, null, null), ('283', null, null, null, '2016-07-02 11:16:46', null, 'twitter', '17.142.155.175', null, null, '3', null, null, null), ('284', null, null, null, '2016-07-02 11:16:47', null, 'twitter', '178.32.216.192', null, null, '3', null, null, 'https://epan.in/?page=blog-item&xepan_landing_content_id=3&post_id=3&source=twitter'), ('285', null, null, null, '2016-07-02 11:16:48', null, 'twitter', '74.6.254.117', null, null, '3', null, null, null), ('286', null, null, null, '2016-07-02 11:16:49', null, 'twitter', '216.46.190.188', null, null, '3', null, null, null), ('287', null, null, null, '2016-07-02 11:16:49', null, 'twitter', '216.46.190.189', null, null, '3', null, null, null), ('288', null, null, null, '2016-07-02 11:16:51', null, 'twitter', '136.243.154.102', null, null, '3', null, null, null), ('289', null, null, null, '2016-07-02 11:16:55', null, 'twitter', '136.243.154.102', null, null, '3', null, null, null), ('290', null, null, null, '2016-07-02 11:16:56', null, 'twitter', '144.76.22.203', null, null, '3', null, null, null), ('291', null, null, null, '2016-07-02 11:16:56', null, 'twitter', '66.220.146.21', null, null, '3', null, null, null), ('292', null, null, null, '2016-07-02 11:17:06', null, 'googleplus', '66.249.88.63', null, null, '3', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CFEQFjAA&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D3%26post_id%3D3%26source%3Dgoogleplus&ei=WlV3V8a-CNy9ywWPYQ&usg=AFQjCNEsyMJMIlw81iLYpp4BCArwwdoaaw'), ('293', null, null, null, '2016-07-02 11:17:08', null, 'googleplus', '66.249.88.52', null, null, '3', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CEEQFjAD&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D3%26post_id%3D3%26source%3Dgoogleplus&ei=XFV3V_iOKrGLkAe-iQE&usg=AFQjCNEsyMJMIlw81iLYpp4BCArwwdoaaw'), ('294', null, null, null, '2016-07-02 11:17:10', null, 'twitter', '23.96.208.137', null, null, '3', null, null, null), ('295', null, null, null, '2016-07-02 11:17:25', null, 'twitter', '37.187.162.184', null, null, '3', null, null, null), ('296', null, null, null, '2016-07-02 11:17:31', null, 'googleplus', '66.102.6.166', null, null, '3', null, null, 'http://www.google.dk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=4&ved=0CEQQFjAF&url=http%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26xepan_landing_content_id%3D3%26post_id%3D3%26source%3Dgoogleplus&ei=VFV3V_OmE4q11gWTuAE&usg=AFQjCNEsyMJMIlw81iLYpp4BCArwwdoaaw'), ('297', null, null, null, '2016-07-02 11:18:06', null, 'twitter', '198.57.213.80', null, null, '3', null, null, 'http://api.recuweb.com/curate/contents.php?u_request=Y3Jvbj0xJnRpbWU9MTQ2NzQzODMwMy4xNTczJmxhbmc9ZW4mdG9wPXN0YXJ0dXAmdV9uYW1lPXJlY3V3ZWImdV9zZXJ2aWNlPXR3aXR0ZXImdV90b2tlbj1mMDhhN2NlZGZiYTFkNDcyZGRiMDJiY2E1ZTI1NTg5OQ=='), ('298', null, null, null, '2016-07-02 11:19:06', null, 'twitter', '198.57.213.80', null, null, '3', null, null, 'http://api.recuweb.com/curate/contents.php?u_request=Y3Jvbj0xJnRpbWU9MTQ2NzQzODMwMy4xNTczJmxhbmc9ZW4mdG9wPXN0YXJ0dXAmdV9uYW1lPXJlY3V3ZWImdV9zZXJ2aWNlPXR3aXR0ZXImdV90b2tlbj1mMDhhN2NlZGZiYTFkNDcyZGRiMDJiY2E1ZTI1NTg5OQ=='), ('299', null, null, null, '2016-07-02 11:20:06', null, 'twitter', '74.6.254.117', null, null, '3', null, null, null), ('300', null, null, null, '2016-07-02 11:20:09', null, 'twitter', '198.57.213.80', null, null, '3', null, null, 'http://api.recuweb.com/curate/contents.php?u_request=Y3Jvbj0xJnRpbWU9MTQ2NzQzODMwMy4xNTczJmxhbmc9ZW4mdG9wPXN0YXJ0dXAmdV9uYW1lPXJlY3V3ZWImdV9zZXJ2aWNlPXR3aXR0ZXImdV90b2tlbj1mMDhhN2NlZGZiYTFkNDcyZGRiMDJiY2E1ZTI1NTg5OQ=='), ('301', null, null, null, '2016-07-02 11:20:59', null, 'googleplus', '72.14.199.101', null, null, '3', null, null, null), ('302', null, null, null, '2016-07-02 11:21:04', null, 'twitter', '198.57.213.80', null, null, '3', null, null, 'http://api.recuweb.com/curate/contents.php?u_request=Y3Jvbj0xJnRpbWU9MTQ2NzQzODYwMy4wNzEzJmxhbmc9ZW4mdG9wPXN0YXJ0dXAmdV9uYW1lPXJlY3V3ZWImdV9zZXJ2aWNlPXR3aXR0ZXImdV90b2tlbj1mMDhhN2NlZGZiYTFkNDcyZGRiMDJiY2E1ZTI1NTg5OQ=='), ('303', null, null, null, '2016-07-02 11:22:01', null, 'twitter', '192.81.133.229', null, null, '3', null, null, null), ('304', null, null, null, '2016-07-02 11:22:07', null, 'twitter', '198.57.213.80', null, null, '3', null, null, 'http://api.recuweb.com/curate/contents.php?u_request=Y3Jvbj0xJnRpbWU9MTQ2NzQzODYwMy4wNzEzJmxhbmc9ZW4mdG9wPXN0YXJ0dXAmdV9uYW1lPXJlY3V3ZWImdV9zZXJ2aWNlPXR3aXR0ZXImdV90b2tlbj1mMDhhN2NlZGZiYTFkNDcyZGRiMDJiY2E1ZTI1NTg5OQ=='), ('305', null, null, null, '2016-07-02 11:22:40', null, 'twitter', '195.154.172.59', null, null, '3', null, null, null), ('306', null, null, null, '2016-07-02 11:23:03', null, 'twitter', '198.57.213.80', null, null, '3', null, null, 'http://api.recuweb.com/curate/contents.php?u_request=Y3Jvbj0xJnRpbWU9MTQ2NzQzODYwMy4wNzEzJmxhbmc9ZW4mdG9wPXN0YXJ0dXAmdV9uYW1lPXJlY3V3ZWImdV9zZXJ2aWNlPXR3aXR0ZXImdV90b2tlbj1mMDhhN2NlZGZiYTFkNDcyZGRiMDJiY2E1ZTI1NTg5OQ=='), ('307', null, null, null, '2016-07-02 11:24:06', null, 'twitter', '198.57.213.80', null, null, '3', null, null, 'http://api.recuweb.com/curate/contents.php?u_request=Y3Jvbj0xJnRpbWU9MTQ2NzQzODYwMy4wNzEzJmxhbmc9ZW4mdG9wPXN0YXJ0dXAmdV9uYW1lPXJlY3V3ZWImdV9zZXJ2aWNlPXR3aXR0ZXImdV90b2tlbj1mMDhhN2NlZGZiYTFkNDcyZGRiMDJiY2E1ZTI1NTg5OQ=='), ('308', null, null, null, '2016-07-02 11:31:11', null, 'twitter', '173.252.105.118', null, null, '3', null, null, null);
INSERT INTO `landingresponse` VALUES ('309', null, null, null, '2016-07-02 11:32:38', null, 'twitter', '66.199.146.149', null, null, '3', null, null, null), ('310', null, null, null, '2016-07-02 11:36:23', null, 'twitter', '173.252.122.116', null, null, '3', null, null, null), ('311', null, null, null, '2016-07-02 12:14:24', null, 'twitter', '74.6.254.117', null, null, '3', null, null, null), ('312', null, null, null, '2016-07-02 12:57:31', null, 'twitter', '164.132.99.59', null, null, '2', null, null, null), ('313', null, null, null, '2016-07-02 12:57:39', null, 'twitter', '51.254.205.197', null, null, '2', null, null, null), ('314', null, null, null, '2016-07-02 13:14:04', null, 'twitter', '52.90.236.65', null, null, '3', null, null, null), ('315', null, null, null, '2016-07-02 13:14:04', null, 'twitter', '54.174.101.173', null, null, '3', null, null, null), ('316', null, null, null, '2016-07-02 13:36:56', null, 'googleplus', '66.249.71.134', null, null, '3', null, null, null), ('317', null, null, null, '2016-07-02 13:46:44', null, 'twitter', '66.220.152.37', null, null, '3', null, null, null), ('318', null, null, null, '2016-07-02 14:17:48', null, 'twitter', '69.171.228.118', null, null, '3', null, null, null), ('319', null, null, null, '2016-07-02 14:33:53', null, 'twitter', '66.220.159.118', null, null, '3', null, null, null), ('320', null, null, null, '2016-07-02 14:56:24', null, 'twitter', '17.142.155.175', null, null, '3', null, null, null), ('321', null, null, null, '2016-07-02 14:56:24', null, 'twitter', '199.59.148.211', null, null, '3', null, null, null), ('322', null, null, null, '2016-07-02 14:56:25', null, 'twitter', '199.59.148.210', null, null, '3', null, null, null), ('323', null, null, null, '2016-07-02 14:56:26', null, 'twitter', '54.151.42.39', null, null, '3', null, null, null), ('324', null, null, null, '2016-07-02 14:56:26', null, 'twitter', '54.151.42.39', null, null, '3', null, null, null), ('325', null, null, null, '2016-07-02 14:56:26', null, 'twitter', '74.6.254.117', null, null, '3', null, null, null), ('326', null, null, null, '2016-07-02 14:56:29', null, 'twitter', '52.21.15.183', null, null, '3', null, null, null), ('327', null, null, null, '2016-07-02 14:56:29', null, 'twitter', '144.76.23.234', null, null, '3', null, null, null), ('328', null, null, null, '2016-07-02 14:56:34', null, 'twitter', '23.96.208.137', null, null, '3', null, null, null), ('329', null, null, null, '2016-07-02 14:58:52', null, 'twitter', '74.6.254.117', null, null, '3', null, null, null), ('330', null, null, null, '2016-07-02 15:01:11', null, 'twitter', '45.79.102.112', null, null, '3', null, null, null), ('331', null, null, null, '2016-07-02 15:01:28', null, 'googleplus', '66.249.84.226', null, null, '3', null, null, null), ('332', null, null, null, '2016-07-02 15:01:56', null, 'googleplus', '72.14.199.104', null, null, '3', null, null, null), ('333', null, null, null, '2016-07-02 15:02:03', null, 'googleplus', '144.76.94.113', null, null, '3', null, null, null), ('334', null, null, null, '2016-07-02 15:03:26', null, 'googleplus', '72.14.199.97', null, null, '3', null, null, null), ('335', null, null, null, '2016-07-02 15:03:36', null, 'twitter', '52.41.73.255', null, null, '3', null, null, null), ('342', null, null, null, '2016-07-02 16:04:25', null, 'twitter', '74.6.254.117', null, null, '3', null, null, null), ('346', null, null, null, '2016-07-02 16:12:09', null, 'twitter', '164.81.168.3', null, null, '3', null, null, null), ('350', null, null, null, '2016-07-02 18:20:49', null, 'googleplus', '66.249.71.231', null, null, '3', null, null, null), ('373', null, null, null, '2016-07-02 23:06:03', null, 'twitter', '173.252.115.7', null, null, '3', null, null, null), ('381', null, null, null, '2016-07-02 23:30:20', null, 'googleplus', '66.249.84.209', null, null, '3', null, null, null), ('382', null, null, null, '2016-07-02 23:30:32', null, 'googleplus', '72.14.199.84', null, null, '3', null, null, null), ('383', null, null, null, '2016-07-02 23:31:03', null, 'twitter', '17.142.155.175', null, null, '3', null, null, null), ('384', null, null, null, '2016-07-02 23:31:05', null, 'twitter', '66.220.145.243', null, null, '3', null, null, 'https://t.co/DCPgJP4paq'), ('385', null, null, null, '2016-07-02 23:31:07', null, 'twitter', '216.46.190.188', null, null, '3', null, null, null), ('386', null, null, null, '2016-07-02 23:31:11', null, 'twitter', '216.46.190.188', null, null, '3', null, null, null), ('387', null, null, null, '2016-07-02 23:31:21', null, 'twitter', '144.76.22.203', null, null, '3', null, null, null), ('388', null, null, null, '2016-07-02 23:32:33', null, 'googleplus', '72.14.199.97', null, null, '3', null, null, null), ('391', null, null, null, '2016-07-02 23:46:13', null, 'twitter', '199.59.148.211', null, null, '2', null, null, null), ('392', null, null, null, '2016-07-02 23:46:13', null, 'twitter', '199.59.148.210', null, null, '2', null, null, null), ('393', null, null, null, '2016-07-02 23:46:13', null, 'twitter', '17.142.155.175', null, null, '2', null, null, null), ('394', null, null, null, '2016-07-02 23:46:14', null, 'twitter', '216.46.175.36', null, null, '2', null, null, null), ('395', null, null, null, '2016-07-02 23:46:14', null, 'twitter', '216.46.175.34', null, null, '2', null, null, null), ('396', null, null, null, '2016-07-02 23:46:15', null, 'twitter', '66.220.145.245', null, null, '2', null, null, 'https://t.co/0Aqs2WvxMZ'), ('397', null, null, null, '2016-07-02 23:46:17', null, 'twitter', '144.76.23.172', null, null, '2', null, null, null), ('398', null, null, null, '2016-07-02 23:46:38', null, 'twitter', '136.243.150.138', null, null, '2', null, null, null), ('399', null, null, null, '2016-07-02 23:46:42', null, 'twitter', '136.243.150.138', null, null, '2', null, null, null), ('400', null, null, null, '2016-07-02 23:46:52', null, 'twitter', '31.13.98.114', null, null, '3', null, null, null), ('401', null, null, null, '2016-07-02 23:46:56', null, 'twitter', '37.187.167.30', null, null, '2', null, null, null), ('404', null, null, null, '2016-07-02 23:59:13', null, 'twitter', '17.142.155.175', null, null, '2', null, null, null), ('411', null, null, null, '2016-07-03 00:54:07', null, 'twitter', '74.6.254.117', null, null, '2', null, null, null), ('414', null, null, null, '2016-07-03 01:13:04', null, 'twitter', '31.13.100.116', null, null, '3', null, null, null), ('417', null, null, null, '2016-07-03 01:34:08', null, 'twitter', '69.171.228.120', null, null, '3', null, null, null), ('419', null, null, null, '2016-07-03 02:08:40', null, 'twitter', '173.252.75.116', null, null, '3', null, null, null), ('420', null, null, null, '2016-07-03 02:30:35', null, 'twitter', '31.13.109.117', null, null, '3', null, null, null), ('422', null, null, null, '2016-07-03 03:14:40', null, 'twitter', '173.252.114.117', null, null, '3', null, null, null), ('434', null, null, null, '2016-07-03 08:20:49', null, 'twitter', '1.39.87.241', null, null, '2', null, null, 'https://t.co/0Aqs2WvxMZ'), ('438', null, null, null, '2016-07-03 09:05:41', null, 'twitter', '31.13.112.120', null, null, '3', null, null, null), ('439', null, null, null, '2016-07-03 09:15:10', null, 'twitter', '173.252.105.116', null, null, '3', null, null, null), ('441', null, null, null, '2016-07-03 11:13:56', null, 'twitter', '173.252.122.118', null, null, '3', null, null, null), ('445', null, null, null, '2016-07-03 12:22:57', null, 'twitter', '175.100.175.61', null, null, '3', null, null, 'https://t.co/DCPgJP4paq'), ('449', null, null, null, '2016-07-03 13:05:51', null, 'twitter', '69.171.228.118', null, null, '3', null, null, null), ('454', null, null, null, '2016-07-03 13:24:00', null, 'twitter', '52.90.154.139', null, null, '3', null, null, null), ('455', null, null, null, '2016-07-03 13:24:00', null, 'twitter', '52.90.154.139', null, null, '2', null, null, null), ('456', '1195', null, null, '2016-07-03 14:24:29', null, 'ZnexrgvatNhgbzngvbaRkcregfYvaxrqva', '213.254.241.7', null, null, '14829', null, null, null), ('466', null, null, null, '2016-07-03 21:09:08', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('467', null, null, null, '2016-07-03 22:01:40', null, 'googleplus', '37.187.162.187', null, null, '3', null, null, null), ('468', null, null, null, '2016-07-03 22:01:41', null, 'googleplus', '37.187.167.30', null, null, '3', null, null, null), ('469', '11990', null, null, '2016-07-03 22:16:18', null, 'ZnexrgvatNhgbzngvbaRkcregfYvaxrqva', '213.254.241.5', null, null, '14877', null, null, null), ('474', null, null, null, '2016-07-04 14:20:58', null, 'twitter', '149.202.58.109', null, null, '2', null, null, null), ('475', null, null, null, '2016-07-04 16:52:26', null, 'twitter', '149.56.135.228', null, null, '3', null, null, null), ('476', null, null, null, '2016-07-04 19:50:41', null, 'twitter', '149.56.135.228', null, null, '3', null, null, null), ('483', null, null, null, '2016-07-05 21:14:14', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('485', null, null, null, '2016-07-07 20:24:39', null, 'twitter', '199.59.148.209', null, null, '2', null, null, null), ('486', null, null, null, '2016-07-07 21:14:38', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('487', null, null, null, '2016-07-08 20:26:01', null, 'twitter', '144.76.23.138', null, null, '2', null, null, null), ('488', null, null, null, '2016-07-09 11:27:07', null, 'twitter', '144.76.14.15', null, null, '3', null, null, null), ('489', null, null, null, '2016-07-09 12:44:09', null, 'twitter', '144.76.22.181', null, null, '3', null, null, null), ('490', null, null, null, '2016-07-09 14:47:17', null, 'twitter', '144.76.23.12', null, null, '3', null, null, null), ('491', null, null, null, '2016-07-09 21:12:15', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('492', null, null, null, '2016-07-09 21:32:03', null, 'twitter', '52.91.96.8', null, null, '2', null, null, null), ('493', null, null, null, '2016-07-09 21:32:03', null, 'twitter', '52.91.96.8', null, null, '3', null, null, null), ('494', null, null, null, '2016-07-10 11:21:41', null, 'twitter', '199.16.156.125', null, null, '3', null, null, null), ('495', null, null, null, '2016-07-11 21:19:07', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('496', null, null, null, '2016-07-13 21:16:17', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('497', null, null, null, '2016-07-14 19:05:09', null, 'twitter', '199.59.148.211', null, null, '3', null, null, null), ('498', null, null, null, '2016-07-14 21:01:57', null, 'twitter', '199.16.156.125', null, null, '2', null, null, null), ('499', null, null, null, '2016-07-15 21:16:46', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('500', null, null, null, '2016-07-15 21:17:04', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('501', null, null, null, '2016-07-18 16:27:38', null, 'twitter', '199.59.148.210', null, null, '3', null, null, null), ('502', null, null, null, '2016-07-19 22:13:22', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('503', null, null, null, '2016-07-22 15:36:48', null, 'twitter', '199.16.156.126', null, null, '2', null, null, null), ('504', null, null, null, '2016-07-23 18:43:49', null, 'twitter', '199.59.148.209', null, null, '5', null, null, null), ('505', null, null, null, '2016-07-23 18:43:49', null, 'twitter', '17.142.155.175', null, null, '5', null, null, null), ('506', null, null, null, '2016-07-23 18:43:50', null, 'twitter', '54.151.42.39', null, null, '5', null, null, null), ('507', null, null, null, '2016-07-23 18:43:50', null, 'twitter', '54.151.42.39', null, null, '5', null, null, null), ('508', null, null, null, '2016-07-23 18:43:52', null, 'twitter', '144.76.22.239', null, null, '5', null, null, null), ('509', null, null, null, '2016-07-23 18:43:53', null, 'twitter', '74.6.254.119', null, null, '5', null, null, null), ('510', null, null, null, '2016-07-23 18:43:56', null, 'twitter', '23.96.208.137', null, null, '5', null, null, null);
INSERT INTO `landingresponse` VALUES ('511', null, null, null, '2016-07-23 18:43:59', null, 'twitter', '69.171.230.119', null, null, '5', null, null, null), ('512', null, null, null, '2016-07-23 18:44:05', null, 'twitter', '69.171.230.119', null, null, '5', null, null, null), ('513', null, null, null, '2016-07-23 18:44:44', null, 'twitter', '17.142.155.175', null, null, '5', null, null, null), ('514', null, null, null, '2016-07-23 18:45:29', null, 'twitter', '136.243.154.102', null, null, '5', null, null, null), ('515', null, null, null, '2016-07-23 18:45:30', null, 'twitter', '136.243.154.102', null, null, '5', null, null, null), ('516', null, null, null, '2016-07-23 18:48:22', null, 'twitter', '74.6.254.119', null, null, '5', null, null, null), ('517', null, null, null, '2016-07-23 18:49:53', null, 'twitter', '37.187.162.191', null, null, '5', null, null, null), ('518', null, null, null, '2016-07-23 18:51:50', null, 'twitter', '62.210.181.15', null, null, '5', null, null, null), ('519', null, null, null, '2016-07-23 18:54:14', null, 'twitter', '173.252.79.113', null, null, '5', null, null, null), ('520', null, null, null, '2016-07-23 19:00:13', null, 'twitter', '173.252.108.113', null, null, '5', null, null, null), ('521', null, null, null, '2016-07-23 19:07:07', null, 'twitter', '173.252.75.114', null, null, '5', null, null, null), ('522', null, null, null, '2016-07-23 20:17:26', null, 'twitter', '74.6.254.119', null, null, '5', null, null, null), ('528', null, null, null, '2016-07-23 21:10:52', null, 'twitter', '31.13.103.106', null, null, '5', null, null, null), ('529', null, null, null, '2016-07-23 21:15:08', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('531', null, null, null, '2016-07-23 21:35:26', null, 'twitter', '31.13.100.115', null, null, '5', null, null, null), ('532', null, null, null, '2016-07-23 21:48:53', null, 'twitter', '173.252.105.112', null, null, '5', null, null, null), ('533', null, null, null, '2016-07-23 22:32:09', null, 'twitter', '31.13.100.115', null, null, '5', null, null, null), ('534', null, null, null, '2016-07-23 22:39:22', null, 'twitter', '31.13.112.121', null, null, '5', null, null, null), ('538', null, null, null, '2016-07-24 05:37:38', null, 'twitter', '173.252.122.120', null, null, '5', null, null, null), ('539', null, null, null, '2016-07-24 07:26:34', null, 'twitter', '173.252.102.117', null, null, '5', null, null, null), ('541', null, null, null, '2016-07-24 08:47:28', null, 'twitter', '173.252.113.114', null, null, '5', null, null, null), ('542', null, null, null, '2016-07-24 09:28:40', null, 'twitter', '173.252.115.194', null, null, '5', null, null, null), ('545', null, null, null, '2016-07-24 09:58:10', null, 'twitter', '31.13.100.118', null, null, '5', null, null, null), ('577', null, null, null, '2016-07-25 21:39:10', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('580', null, null, null, '2016-07-26 19:02:40', null, 'twitter', '199.59.148.211', null, null, '3', null, null, null), ('584', null, null, null, '2016-07-28 14:20:04', null, 'twitter', '199.16.156.126', null, null, '3', null, null, null), ('624', null, null, null, '2016-07-28 19:11:40', null, 'twitter', '199.16.156.125', null, null, '15', null, null, null), ('627', null, null, null, '2016-07-28 19:36:36', null, 'googleplus', '66.102.7.185', null, null, '15', null, null, null), ('628', null, null, null, '2016-07-28 19:38:52', null, 'facebook', '31.13.102.121', null, null, '15', null, null, null), ('629', null, null, null, '2016-07-28 19:39:54', null, 'facebook', '31.13.100.118', null, null, '15', null, null, null), ('630', null, null, null, '2016-07-28 19:41:52', null, 'linkedin', '108.174.2.205', null, null, '15', null, null, null), ('631', null, null, null, '2016-07-28 19:43:14', null, 'facebook', '31.13.102.125', null, null, '16', null, null, null), ('632', null, null, null, '2016-07-28 19:43:15', null, 'googleplus', '66.102.7.188', null, null, '16', null, null, null), ('633', null, null, null, '2016-07-28 19:43:28', null, 'linkedin', '108.174.2.203', null, null, '16', null, null, null), ('634', null, null, null, '2016-07-28 19:44:26', null, 'facebook', '31.13.100.119', null, null, '16', null, null, null), ('635', null, null, null, '2016-07-28 19:51:32', null, 'googleplus', '66.102.7.188', null, null, '15', null, null, null), ('636', null, null, null, '2016-07-28 19:55:17', null, 'linkedin', '108.174.5.117', null, null, '15', null, null, null), ('638', null, null, null, '2016-07-28 20:05:56', null, 'facebook', '108.174.5.115', null, null, '15', null, null, null), ('640', null, null, null, '2016-07-28 20:22:22', null, 'facebook', '106.194.49.82', null, null, '16', null, null, 'http://m.facebook.com/'), ('641', null, null, null, '2016-07-28 20:32:20', null, 'facebook', '150.242.254.2', null, null, '16', null, null, 'http://m.facebook.com/'), ('642', null, null, null, '2016-07-28 20:33:20', null, 'facebook', '117.220.121.1', null, null, '15', null, null, 'http://m.facebook.com/'), ('643', null, null, null, '2016-07-28 20:33:52', null, 'facebook', '78.131.40.208', null, null, '15', null, null, 'http://m.facebook.com/'), ('644', null, null, null, '2016-07-28 20:36:07', null, 'facebook', '117.200.245.212', null, null, '15', null, null, 'http://m.facebook.com/'), ('648', null, null, null, '2016-07-28 21:23:23', null, 'facebook', '117.212.80.142', null, null, '15', null, null, 'http://m.facebook.com/'), ('655', null, null, null, '2016-07-28 22:17:23', null, 'facebook', '223.196.24.49', null, null, '15', null, null, 'http://m.facebook.com/'), ('656', null, null, null, '2016-07-28 22:39:53', null, 'facebook', '49.32.44.200', null, null, '15', null, null, 'http://m.facebook.com/'), ('657', null, null, null, '2016-07-28 22:47:14', null, 'facebook', '160.238.77.36', null, null, '15', null, null, 'http://m.facebook.com/'), ('658', null, null, null, '2016-07-28 22:59:15', null, 'facebook', '223.176.138.60', null, null, '15', null, null, 'http://m.facebook.com/'), ('662', null, null, null, '2016-07-28 23:56:08', null, 'facebook', '175.100.174.114', null, null, '15', null, null, 'http://m.facebook.com/'), ('665', null, null, null, '2016-07-29 01:08:36', null, 'facebook', '49.32.44.167', null, null, '15', null, null, 'http://m.facebook.com/'), ('666', null, null, null, '2016-07-29 01:31:05', null, 'facebook', '103.47.18.246', null, null, '16', null, null, 'http://m.facebook.com/'), ('667', null, null, null, '2016-07-29 01:44:57', null, 'facebook', '94.65.143.104', null, null, '15', null, null, 'http://m.facebook.com/'), ('668', null, null, null, '2016-07-29 01:55:58', null, 'facebook', '94.65.143.104', null, null, '15', null, null, 'http://m.facebook.com/'), ('669', null, null, null, '2016-07-29 02:00:12', null, 'facebook', '94.65.143.104', null, null, '16', null, null, 'http://m.facebook.com/'), ('672', null, null, null, '2016-07-29 02:09:29', null, 'facebook', '27.58.18.154', null, null, '15', null, null, 'http://m.facebook.com/'), ('673', null, null, null, '2016-07-29 04:11:39', null, 'facebook', '54.172.41.175', null, null, '15', null, null, null), ('675', null, null, null, '2016-07-29 07:43:21', null, 'facebook', '14.98.124.31', null, null, '15', null, null, 'http://m.facebook.com/'), ('677', null, null, null, '2016-07-29 08:14:00', null, 'facebook', '45.115.191.69', null, null, '15', null, null, 'http://lnkd.in/'), ('678', null, null, null, '2016-07-29 08:27:37', null, 'facebook', '223.196.24.46', null, null, '15', null, null, 'http://m.facebook.com/'), ('679', null, null, null, '2016-07-29 08:31:24', null, 'facebook', '103.240.209.211', null, null, '15', null, null, 'http://m.facebook.com/'), ('681', null, null, null, '2016-07-29 09:01:57', null, 'facebook', '103.193.254.200', null, null, '15', null, null, 'http://m.facebook.com/'), ('682', null, null, null, '2016-07-29 09:53:09', null, 'facebook', '117.200.248.201', null, null, '15', null, null, 'http://m.facebook.com/'), ('684', null, null, null, '2016-07-29 10:43:58', null, 'facebook', '182.64.53.2', null, null, '15', null, null, 'http://m.facebook.com/'), ('686', null, null, null, '2016-07-29 10:53:47', null, 'facebook', '103.193.254.200', null, null, '15', null, null, 'http://m.facebook.com/'), ('687', null, null, null, '2016-07-29 11:01:14', null, 'facebook', '49.32.44.99', null, null, '15', null, null, 'http://m.facebook.com/'), ('688', null, null, null, '2016-07-29 11:05:06', null, 'facebook', '220.227.1.58', null, null, '15', null, null, 'http://m.facebook.com/'), ('690', null, null, null, '2016-07-29 11:24:23', null, 'facebook', '142.4.218.55', null, null, '15', null, null, null), ('693', null, null, null, '2016-07-29 12:18:15', null, 'googleplus', '72.14.199.64', null, null, '15', null, null, null), ('694', null, null, null, '2016-07-29 12:18:15', null, 'googleplus', '72.14.199.64', null, null, '15', null, null, null), ('695', null, null, null, '2016-07-29 12:18:17', null, 'googleplus', '72.14.199.64', null, null, '16', null, null, null), ('698', null, null, null, '2016-07-29 16:45:46', null, 'facebook', '106.215.190.79', null, null, '15', null, null, 'http://m.facebook.com/'), ('699', null, null, null, '2016-07-29 16:51:50', null, 'facebook', '103.193.254.200', null, null, '16', null, null, 'http://m.facebook.com/'), ('702', null, null, null, '2016-07-29 18:39:56', null, 'facebook', '50.199.200.59', null, null, '15', null, null, 'https://www.linkedin.com/'), ('703', null, null, null, '2016-07-29 21:22:22', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('704', null, null, null, '2016-07-30 00:28:12', null, 'facebook', '124.123.170.163', null, null, '15', null, null, 'http://m.facebook.com/'), ('705', null, null, null, '2016-07-30 01:41:20', null, 'facebook', '205.210.27.251', null, null, '15', null, null, 'https://www.linkedin.com/'), ('706', null, null, null, '2016-07-30 11:14:51', null, 'facebook', '94.197.121.196', null, null, '15', null, null, 'android-app://com.linkedin.android'), ('708', null, null, null, '2016-07-30 12:27:43', null, 'facebook', '115.99.170.104', null, null, '15', null, null, 'http://lnkd.in'), ('709', null, null, null, '2016-07-30 21:08:19', null, 'facebook', '70.192.128.131', null, null, '15', null, null, 'http://lnkd.in'), ('717', null, null, null, '2016-07-31 12:52:45', null, 'facebook', '82.71.41.169', null, null, '15', null, null, 'http://lnkd.in/'), ('720', null, null, null, '2016-07-31 19:31:51', null, 'facebook', '106.215.187.190', null, null, '15', null, null, 'http://m.facebook.com/'), ('721', null, null, null, '2016-07-31 22:21:26', null, 'facebook', '167.114.1.197', null, null, '15', null, null, null), ('722', null, null, null, '2016-07-31 23:28:37', null, 'twitter', '199.59.148.210', null, null, '2', null, null, null), ('723', null, null, null, '2016-07-31 23:28:44', null, 'twitter', '199.59.148.211', null, null, '2', null, null, null), ('724', null, null, null, '2016-08-01 05:41:33', null, 'facebook', '192.0.220.216', null, null, '15', null, null, 'https://www.linkedin.com'), ('725', null, null, null, '2016-08-01 10:58:34', null, 'googleplus', '66.102.7.182', null, null, '19', null, null, null), ('726', null, null, null, '2016-08-01 15:50:25', null, 'facebook', '223.191.249.114', null, null, '15', null, null, 'http://m.facebook.com/'), ('727', null, null, null, '2016-08-01 19:58:32', null, 'googleplus', '66.249.89.93', null, null, '16', null, null, null), ('728', null, null, null, '2016-08-01 19:58:56', null, 'googleplus', '66.249.89.93', null, null, '15', null, null, null), ('729', null, null, null, '2016-08-02 11:09:26', null, 'googleplus', '150.242.254.119', null, null, '16', null, null, 'https://plus.google.com/u/0/_/streamwidgets/canvas'), ('730', null, null, null, '2016-08-02 18:25:21', null, 'googleplus', '49.213.40.33', null, null, '16', null, null, 'https://plus.url.google.com/url?sa=j&url=https%3A%2F%2Fepan.in%2F%3Fpage%3Dblog-item%26category_id%3D3%26xepan_landing_content_id%3D16%26post_id%3D16%26source%3Dgoogleplus&uct=1469714528&usg=MhgOodxI7mg_pHIZPlKKxUHOH2U.'), ('731', null, null, null, '2016-08-02 21:12:31', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('732', null, null, null, '2016-08-02 22:37:40', null, 'linkedin', '114.143.40.42', null, null, '15', null, null, 'http://lnkd.in/'), ('734', null, null, null, '2016-08-04 23:44:47', null, 'facebook', '52.91.98.155', null, null, '15', null, null, null), ('738', null, null, null, '2016-08-06 21:08:23', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('739', null, null, null, '2016-08-08 12:53:44', null, 'twitter', '199.59.148.210', null, null, '2', null, null, null), ('740', null, null, null, '2016-08-08 12:53:44', null, 'twitter', '199.59.148.209', null, null, '3', null, null, null), ('741', null, null, null, '2016-08-08 21:17:38', null, 'googleplus', '37.187.162.178', null, null, '1', null, null, null), ('745', null, null, null, '2016-08-09 21:14:34', null, 'facebook', '150.242.254.2', null, null, '15', null, null, 'http://m.facebook.com/'), ('747', null, null, null, '2016-08-10 09:39:22', null, 'facebook', '103.193.254.200', null, null, '15', null, null, 'http://m.facebook.com/');
INSERT INTO `landingresponse` VALUES ('749', null, null, null, '2016-08-10 09:39:57', null, 'facebook', '103.193.254.200', null, null, '16', null, null, 'http://m.facebook.com/'), ('750', null, null, null, '2016-08-12 01:50:18', null, 'facebook', '69.171.230.117', null, null, '15', null, null, null), ('751', null, null, null, '2016-08-12 02:10:12', null, 'facebook', '59.98.231.246', null, null, '15', null, null, 'http://m.facebook.com/'), ('752', null, null, null, '2016-08-12 02:20:45', null, 'facebook', '49.32.44.244', null, null, '15', null, null, 'http://m.facebook.com/'), ('753', null, null, null, '2016-08-12 03:34:41', null, 'facebook', '43.227.225.209', null, null, '15', null, null, 'http://m.facebook.com/'), ('754', null, null, null, '2016-08-12 04:04:19', null, 'facebook', '183.87.196.44', null, null, '15', null, null, 'http://m.facebook.com/'), ('755', null, null, null, '2016-08-12 07:45:47', null, 'facebook', '1.39.61.92', null, null, '15', null, null, 'http://m.facebook.com'), ('756', null, null, null, '2016-08-12 09:15:22', null, 'facebook', '150.242.254.2', null, null, '15', null, null, 'http://m.facebook.com/'), ('757', null, null, null, '2016-08-12 09:36:04', null, 'facebook', '123.201.178.80', null, null, '15', null, null, 'http://m.facebook.com/'), ('758', null, null, null, '2016-08-12 10:17:55', null, 'facebook', '43.252.221.142', null, null, '15', null, null, 'http://m.facebook.com/'), ('759', null, null, null, '2016-08-12 10:49:56', null, 'facebook', '101.60.204.87', null, null, '15', null, null, 'http://m.facebook.com/'), ('760', null, null, null, '2016-08-12 11:28:31', null, 'facebook', '103.240.10.34', null, null, '15', null, null, 'http://m.facebook.com/'), ('761', null, null, null, '2016-08-12 11:34:23', null, 'facebook', '59.98.231.246', null, null, '15', null, null, 'http://m.facebook.com/'), ('762', null, null, null, '2016-08-12 11:55:59', null, 'facebook', '106.215.133.0', null, null, '15', null, null, 'http://m.facebook.com/'), ('763', null, null, null, '2016-08-12 13:00:56', null, 'facebook', '117.211.48.80', null, null, '15', null, null, 'http://m.facebook.com/'), ('764', null, null, null, '2016-08-12 14:24:41', null, 'facebook', '43.252.221.142', null, null, '15', null, null, 'http://m.facebook.com/'), ('765', null, null, null, '2016-08-12 14:47:29', null, 'facebook', '182.64.151.151', null, null, '15', null, null, 'http://m.facebook.com/'), ('766', null, null, null, '2016-08-12 17:37:02', null, 'facebook', '122.170.33.101', null, null, '15', null, null, 'http://m.facebook.com/'), ('767', null, null, null, '2016-08-12 18:18:42', null, 'facebook', '117.211.48.80', null, null, '15', null, null, 'http://m.facebook.com/'), ('768', null, null, null, '2016-08-12 20:25:22', null, 'facebook', '182.64.151.151', null, null, '15', null, null, 'http://m.facebook.com/'), ('769', null, null, null, '2016-08-12 21:20:01', null, 'facebook', '123.201.57.55', null, null, '15', null, null, 'https://www.facebook.com/'), ('770', null, null, null, '2016-08-12 21:31:18', null, 'facebook', '1.39.15.196', null, null, '15', null, null, 'http://m.facebook.com/'), ('771', null, null, null, '2016-08-13 07:50:30', null, 'facebook', '223.176.139.200', null, null, '15', null, null, 'https://m.facebook.com/l.php?u=https%3A%2F%2Fwww.epan.in%2F%3Fpage%3Dblog-item%26post_id%3D15%26xepan_landing_content_id%3D15%26source%3Dfacebook&h=iAQHzEe1b&enc=AZOSQUpGB9ogTg2Tvaw_DXHY4wWawRo20CCGg0QGdyRUMdaY8AxcxeT5pqzRR3fiZ3g&s=1'), ('772', null, null, null, '2016-08-13 16:17:09', null, 'linkedin', '108.174.2.203', null, null, '15', null, null, null), ('773', null, null, null, '2016-08-13 16:23:56', null, 'linkedin', '199.16.156.126', null, null, '15', null, null, null), ('774', null, null, null, '2016-08-13 16:23:57', null, 'linkedin', '216.46.190.188', null, null, '15', null, null, null), ('775', null, null, null, '2016-08-13 16:23:57', null, 'linkedin', '216.46.175.33', null, null, '15', null, null, null), ('776', null, null, null, '2016-08-13 16:23:57', null, 'linkedin', '192.99.1.145', null, null, '15', null, null, 'https://www.linkedin.com/slink?code=fjYRJsQ'), ('777', null, null, null, '2016-08-13 16:24:00', null, 'linkedin', '62.210.37.82', null, null, '15', null, null, null), ('778', null, null, null, '2016-08-13 16:24:01', null, 'linkedin', '23.96.208.78', null, null, '15', null, null, null), ('779', null, null, null, '2016-08-13 16:24:03', null, 'linkedin', '199.16.156.126', null, null, '15', null, null, null), ('780', null, null, null, '2016-08-13 16:24:05', null, 'linkedin', '136.243.154.105', null, null, '15', null, null, null), ('781', null, null, null, '2016-08-13 16:24:06', null, 'linkedin', '136.243.154.105', null, null, '15', null, null, null), ('782', null, null, null, '2016-08-13 16:24:08', null, 'linkedin', '52.8.91.105', null, null, '15', null, null, null), ('783', null, null, null, '2016-08-13 16:24:59', null, 'linkedin', '199.59.148.209', null, null, '16', null, null, null), ('784', null, null, null, '2016-08-13 16:25:00', null, 'linkedin', '216.46.175.35', null, null, '16', null, null, null), ('785', null, null, null, '2016-08-13 16:25:01', null, 'linkedin', '216.46.175.34', null, null, '16', null, null, null), ('786', null, null, null, '2016-08-13 16:25:01', null, 'linkedin', '198.27.82.205', null, null, '16', null, null, 'https://www.linkedin.com/slink?code=fyR4bAH'), ('787', null, null, null, '2016-08-13 16:25:05', null, 'linkedin', '23.96.208.137', null, null, '16', null, null, null), ('788', null, null, null, '2016-08-13 16:25:14', null, 'linkedin', '199.16.156.126', null, null, '16', null, null, null), ('789', null, null, null, '2016-08-13 16:25:15', null, 'linkedin', '150.242.254.2', null, null, '15', null, null, 'https://www.linkedin.com/'), ('790', null, null, null, '2016-08-13 16:25:16', null, 'linkedin', '199.16.156.126', null, null, '15', null, null, null), ('791', null, null, null, '2016-08-13 16:25:17', null, 'linkedin', '136.243.154.105', null, null, '15', null, null, null), ('792', null, null, null, '2016-08-13 16:25:17', null, 'linkedin', '216.46.175.37', null, null, '15', null, null, null), ('793', null, null, null, '2016-08-13 16:25:17', null, 'linkedin', '198.27.82.109', null, null, '15', null, null, 'https://www.linkedin.com/slink?code=fND3uud'), ('794', null, null, null, '2016-08-13 16:25:18', null, 'linkedin', '216.46.175.37', null, null, '15', null, null, null), ('795', null, null, null, '2016-08-13 16:25:18', null, 'linkedin', '136.243.154.105', null, null, '15', null, null, null), ('796', null, null, null, '2016-08-13 16:25:23', null, 'linkedin', '23.96.208.137', null, null, '15', null, null, null), ('797', null, null, null, '2016-08-13 16:25:29', null, 'linkedin', '52.8.0.31', null, null, '15', null, null, null), ('798', null, null, null, '2016-08-13 16:25:52', null, 'linkedin', '136.243.154.105', null, null, '16', null, null, null), ('799', null, null, null, '2016-08-13 16:25:53', null, 'linkedin', '136.243.154.105', null, null, '16', null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for `lead`
-- ----------------------------
DROP TABLE IF EXISTS `lead`;
CREATE TABLE `lead` (
`contact_id`  int(11) NOT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
PRIMARY KEY (`id`),
INDEX `fk_lead_contact1_idx` (`contact_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of lead
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `lead_category_association`
-- ----------------------------
DROP TABLE IF EXISTS `lead_category_association`;
CREATE TABLE `lead_category_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`lead_id`  int(11) NOT NULL ,
`marketing_category_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `lead_id` (`lead_id`) USING BTREE ,
INDEX `marketing_category_id` (`marketing_category_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of lead_category_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `ledger`
-- ----------------------------
DROP TABLE IF EXISTS `ledger`;
CREATE TABLE `ledger` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`contact_id`  int(11) NULL DEFAULT NULL ,
`group_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ledger_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`LedgerDisplayName`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_active`  tinyint(4) NULL DEFAULT NULL ,
`OpeningBalanceDr`  double NULL DEFAULT NULL ,
`OpeningBalanceCr`  double NULL DEFAULT NULL ,
`affectsBalanceSheet`  tinyint(4) NULL DEFAULT NULL ,
`created_at`  date NULL DEFAULT NULL ,
`updated_at`  date NULL DEFAULT NULL ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`related_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `contact_id` (`contact_id`) USING BTREE ,
INDEX `group_id` (`group_id`) USING BTREE ,
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `related_id` (`related_id`) USING BTREE ,
FULLTEXT INDEX `search_string` (`name`, `ledger_type`, `LedgerDisplayName`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of ledger
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `lodgement`
-- ----------------------------
DROP TABLE IF EXISTS `lodgement`;
CREATE TABLE `lodgement` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`amount`  decimal(10,0) NULL DEFAULT NULL ,
`currency`  decimal(10,0) NULL DEFAULT NULL ,
`exchange_rate`  decimal(10,0) NULL DEFAULT NULL ,
`salesinvoice_id`  int(11) NULL DEFAULT NULL ,
`account_transaction_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `salesinvoice_id` (`salesinvoice_id`) USING BTREE ,
INDEX `account_transaction_id` (`account_transaction_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of lodgement
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `marketingcampaign_socialconfig`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcampaign_socialconfig`;
CREATE TABLE `marketingcampaign_socialconfig` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`social_app`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`appId`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`secret`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`post_in_groups`  tinyint(1) NULL DEFAULT NULL ,
`filter_repeated_posts`  tinyint(1) NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_by_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `fk_epan_id` (`epan_id`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of marketingcampaign_socialconfig
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `marketingcampaign_socialpostings`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcampaign_socialpostings`;
CREATE TABLE `marketingcampaign_socialpostings` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`user_id`  int(11) NULL DEFAULT NULL ,
`post_id`  int(11) NULL DEFAULT NULL ,
`campaign_id`  int(11) NULL DEFAULT NULL ,
`post_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`postid_returned`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`posted_on`  datetime NULL DEFAULT NULL ,
`group_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`group_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`likes`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`share`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_monitoring`  tinyint(1) NULL DEFAULT NULL ,
`force_monitor`  tinyint(1) NULL DEFAULT NULL ,
`return_data`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_by_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `fk_epan_id` (`epan_id`) USING BTREE ,
INDEX `fk_user_id` (`user_id`) USING BTREE ,
INDEX `fk_post_id` (`post_id`) USING BTREE ,
INDEX `fk_campaign_id` (`campaign_id`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=26

;

-- ----------------------------
-- Records of marketingcampaign_socialpostings
-- ----------------------------
BEGIN;
INSERT INTO `marketingcampaign_socialpostings` VALUES ('1', '1', '1', '120', '119', 'link', '10209704190071241_10209711926784654', '2016-06-28 14:49:09', null, null, '0', '0', '1', '0', null, null, null, null), ('2', '1', '2', '120', '119', 'Share', 'UPDATE-196827964-6153486679308066817', '2016-06-28 14:49:09', null, null, '0', '0', '1', '0', null, null, null, null), ('3', '1', '1', '147', '119', 'link', '10209704190071241_10209727785901122', '2016-06-30 15:30:01', null, null, '0', '0', '1', '0', null, null, null, null), ('4', '1', '2', '147', '119', 'Share', 'UPDATE-196827964-6154221796125179904', '2016-06-30 15:30:01', null, null, '0', '0', '1', '0', null, null, null, null), ('5', '1', '1', '148', '119', 'link', '10209704190071241_10209743861823010', '2016-07-02 15:35:01', null, null, '0', '0', '1', '0', null, null, null, null), ('6', '1', '1', '148', '119', 'link', '10209704190071241_10209743861903012', '2016-07-02 15:35:02', null, null, '0', '0', '1', '0', null, null, null, null), ('7', '1', '1', '151', '119', 'link', '10209704190071241_10209743862103017', '2016-07-02 15:35:02', null, null, '0', '0', '1', '0', null, null, null, null), ('8', '1', '2', '148', '119', 'Share', 'UPDATE-196827964-6154947827391922176', '2016-07-02 15:35:02', null, null, '0', '0', '1', '0', null, null, null, null), ('9', '1', '2', '151', '119', 'Share', 'UPDATE-196827964-6154947828700536832', '2016-07-02 15:35:02', null, null, '0', '0', '1', '0', null, null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for `marketingcampaign_socialpostings_activities`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcampaign_socialpostings_activities`;
CREATE TABLE `marketingcampaign_socialpostings_activities` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`posting_id`  int(11) NULL DEFAULT NULL ,
`activityid_returned`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`activity_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`activity_on`  datetime NULL DEFAULT NULL ,
`is_read`  tinyint(1) NULL DEFAULT NULL ,
`activity_by`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`action_allowed`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `fk_epan_id` (`epan_id`) USING BTREE ,
INDEX `fk_posting_id` (`posting_id`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of marketingcampaign_socialpostings_activities
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `marketingcampaign_socialusers`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcampaign_socialusers`;
CREATE TABLE `marketingcampaign_socialusers` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`userid`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`userid_returned`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`access_token`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`access_token_secret`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`access_token_expiry`  datetime NULL DEFAULT NULL ,
`is_access_token_valid`  tinyint(1) NULL DEFAULT NULL ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`config_id`  int(11) NULL DEFAULT NULL ,
`extra`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`post_on_pages`  tinyint(4) NULL DEFAULT NULL ,
`is_active`  tinyint(4) NULL DEFAULT NULL ,
`post_on_timeline`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `fk_epan_id` (`epan_id`) USING BTREE ,
INDEX `fk_config_id` (`config_id`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of marketingcampaign_socialusers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `marketingcategory`
-- ----------------------------
DROP TABLE IF EXISTS `marketingcategory`;
CREATE TABLE `marketingcategory` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`document_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of marketingcategory
-- ----------------------------
BEGIN;
INSERT INTO `marketingcategory` VALUES ('1', 'Epan Services', '3'), ('2', 'Epan Service Partners', '214');
COMMIT;

-- ----------------------------
-- Table structure for `opportunity`
-- ----------------------------
DROP TABLE IF EXISTS `opportunity`;
CREATE TABLE `opportunity` (
`document_id`  int(11) NOT NULL ,
`title`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`duration`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lead_id`  int(11) NOT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE ,
INDEX `lead_id` (`lead_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of opportunity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `order_item_departmental_status`
-- ----------------------------
DROP TABLE IF EXISTS `order_item_departmental_status`;
CREATE TABLE `order_item_departmental_status` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`qsp_detail_id`  int(11) NULL DEFAULT NULL ,
`department_id`  int(11) NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_open`  tinyint(4) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `qsp_detail_id` (`qsp_detail_id`) USING BTREE ,
INDEX `department_id` (`department_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_item_departmental_status
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `outsource_party`
-- ----------------------------
DROP TABLE IF EXISTS `outsource_party`;
CREATE TABLE `outsource_party` (
`contact_id`  int(11) NOT NULL ,
`bank_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`pan_it_no`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`tin_no`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`account_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`account_no`  int(11) NOT NULL ,
`os_country`  varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`time`  datetime NOT NULL ,
`os_address`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`department_id`  int(11) NOT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`os_city`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`os_state`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`os_pincode`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`currency_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `contact_id` (`contact_id`) USING BTREE ,
INDEX `department_id` (`department_id`) USING BTREE ,
INDEX `currency_id` (`currency_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of outsource_party
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `payment_gateway`
-- ----------------------------
DROP TABLE IF EXISTS `payment_gateway`;
CREATE TABLE `payment_gateway` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`default_parameters`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`parameters`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`processing`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_active`  tinyint(4) NULL DEFAULT NULL ,
`gateway_image_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `gateway_image_id` (`gateway_image_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=34

;

-- ----------------------------
-- Records of payment_gateway
-- ----------------------------
BEGIN;
INSERT INTO `payment_gateway` VALUES ('1', 'AuthorizeNet_AIM', '{\"apiLoginId\":\"\",\"transactionKey\":\"\",\"testMode\":false,\"developerMode\":false,\"liveEndpoint\":\"https:\\/\\/api.authorize.net\\/xml\\/v1\\/request.api\",\"developerEndpoint\":\"https:\\/\\/apitest.authorize.net\\/xml\\/v1\\/request.api\"}', null, 'OffSite', '0', null), ('2', 'AuthorizeNet_SIM', '{\"apiLoginId\":\"\",\"transactionKey\":\"\",\"testMode\":false,\"developerMode\":false,\"liveEndpoint\":\"https:\\/\\/secure2.authorize.net\\/gateway\\/transact.dll\",\"developerEndpoint\":\"https:\\/\\/test.authorize.net\\/gateway\\/transact.dll\",\"hashSecret\":\"\"}', null, 'OffSite', '0', null), ('3', 'Buckaroo_Ideal', '{\"websiteKey\":\"\",\"secretKey\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('4', 'Buckaroo_PayPal', '{\"websiteKey\":\"\",\"secretKey\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('5', 'CardSave', '{\"merchantId\":\"\",\"password\":\"\"}', null, 'OffSite', '0', null), ('6', 'Coinbase', '{\"apiKey\":\"\",\"secret\":\"\",\"accountId\":\"\"}', null, 'OffSite', '0', null), ('7', 'Dummy', '[]', null, 'OffSite', '0', null), ('8', 'Eway_Rapid', '{\"apiKey\":\"\",\"password\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('9', 'FirstData_Connect', '{\"storeId\":\"\",\"sharedSecret\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('10', 'GoCardless', '{\"appId\":\"\",\"appSecret\":\"\",\"merchantId\":\"\",\"accessToken\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('11', 'Manual', '[]', null, 'OffSite', '0', null), ('12', 'Migs_ThreeParty', '{\"merchantId\":\"\",\"merchantAccessCode\":\"\",\"secureHash\":\"\"}', null, 'OffSite', '0', null), ('13', 'Migs_TwoParty', '{\"merchantId\":\"\",\"merchantAccessCode\":\"\",\"secureHash\":\"\"}', null, 'OffSite', '0', null), ('14', 'Mollie', '{\"apiKey\":\"\"}', null, 'OffSite', '0', null), ('15', 'MultiSafepay', '{\"accountId\":\"\",\"siteId\":\"\",\"siteCode\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('16', 'Netaxept', '{\"merchantId\":\"\",\"password\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('17', 'NetBanx', '{\"accountNumber\":\"\",\"storeId\":\"\",\"storePassword\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('18', 'PayFast', '{\"merchantId\":\"\",\"merchantKey\":\"\",\"pdtKey\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('19', 'Payflow_Pro', '{\"username\":\"\",\"password\":\"\",\"vendor\":\"\",\"partner\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('20', 'PaymentExpress_PxPay', '{\"username\":\"\",\"password\":\"\",\"pxPostUsername\":\"\",\"pxPostPassword\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('21', 'PaymentExpress_PxPost', '{\"username\":\"\",\"password\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('22', 'PayPal_Express', '{\"username\":\"\",\"password\":\"\",\"signature\":\"\",\"testMode\":false,\"solutionType\":[\"Sole\",\"Mark\"],\"landingPage\":[\"Billing\",\"Login\"],\"brandName\":\"\",\"headerImageUrl\":\"\",\"logoImageUrl\":\"\",\"borderColor\":\"\"}', null, 'OffSite', '0', null), ('23', 'PayPal_Pro', '{\"username\":\"\",\"password\":\"\",\"signature\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('24', 'Pin', '{\"secretKey\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('25', 'SagePay_Direct', '{\"vendor\":\"\",\"testMode\":false,\"referrerId\":\"\"}', null, 'OffSite', '0', null), ('26', 'SagePay_Server', '{\"vendor\":\"\",\"testMode\":false,\"referrerId\":\"\"}', null, 'OffSite', '0', null), ('27', 'SecurePay_DirectPost', '{\"merchantId\":\"\",\"transactionPassword\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('28', 'Stripe', '{\"apiKey\":\"\"}', null, 'OffSite', '0', null), ('29', 'TargetPay_Directebanking', '{\"subAccountId\":\"\"}', null, 'OffSite', '0', null), ('30', 'TargetPay_Ideal', '{\"subAccountId\":\"\"}', null, 'OffSite', '0', null), ('31', 'TargetPay_Mrcash', '{\"subAccountId\":\"\"}', null, 'OffSite', '0', null), ('32', 'WorldPay', '{\"installationId\":\"\",\"accountId\":\"\",\"secretWord\":\"\",\"callbackPassword\":\"\",\"testMode\":false}', null, 'OffSite', '0', null), ('33', 'CCAvenue', '{\"profileId\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"testMode\":false}', '{\"profileId\":\"100645\",\"secretKey\":\"031B8E94DD42B3472D7101C6183809D0\",\"accessKey\":\"AVRX65DF56AF28XRFA\",\"testMode\":\"\"}', 'OffSite', '1', '30');
COMMIT;

-- ----------------------------
-- Table structure for `point_system`
-- ----------------------------
DROP TABLE IF EXISTS `point_system`;
CREATE TABLE `point_system` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`rule_id`  int(11) NULL DEFAULT NULL ,
`rule_option_id`  int(11) NULL DEFAULT NULL ,
`contact_id`  int(11) NULL DEFAULT NULL ,
`score`  decimal(10,0) NULL DEFAULT NULL ,
`landing_campaign_id`  int(11) NULL DEFAULT NULL ,
`landing_content_id`  int(11) NULL DEFAULT NULL ,
`created_at`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
AUTO_INCREMENT=324

;

-- ----------------------------
-- Records of point_system
-- ----------------------------
BEGIN;
INSERT INTO `point_system` VALUES ('1', null, null, '0', '30', '0', '1', '2016-07-09 21:12:15'), ('2', null, null, '0', '30', '0', '2', '2016-07-09 21:32:03'), ('3', null, null, '0', '30', '0', '3', '2016-07-09 21:32:03'), ('4', null, null, '0', '30', '0', '3', '2016-07-10 11:21:41'), ('5', null, null, '0', '30', '0', '1', '2016-07-11 21:19:07'), ('6', null, null, '0', '30', '0', '1', '2016-07-13 21:16:17'), ('7', null, null, '0', '30', '0', '3', '2016-07-14 19:05:09'), ('8', null, null, '0', '30', '0', '2', '2016-07-14 21:01:57'), ('9', null, null, '0', '30', '0', '1', '2016-07-15 21:16:46'), ('10', null, null, '0', '30', '0', '1', '2016-07-15 21:17:04'), ('11', null, null, '0', '30', '0', '3', '2016-07-18 16:27:38'), ('12', null, null, '0', '30', '0', '1', '2016-07-19 22:13:22'), ('13', null, null, '0', '30', '0', '2', '2016-07-22 15:36:48'), ('14', null, null, '0', '30', '0', '5', '2016-07-23 18:43:49'), ('15', null, null, '0', '30', '0', '5', '2016-07-23 18:43:49'), ('16', null, null, '0', '30', '0', '5', '2016-07-23 18:43:50'), ('17', null, null, '0', '30', '0', '5', '2016-07-23 18:43:50'), ('18', null, null, '0', '30', '0', '5', '2016-07-23 18:43:52'), ('19', null, null, '0', '30', '0', '5', '2016-07-23 18:43:53'), ('20', null, null, '0', '30', '0', '5', '2016-07-23 18:43:56'), ('21', null, null, '0', '30', '0', '5', '2016-07-23 18:43:59'), ('22', null, null, '0', '30', '0', '5', '2016-07-23 18:44:05'), ('23', null, null, '0', '30', '0', '5', '2016-07-23 18:44:44'), ('24', null, null, '0', '30', '0', '5', '2016-07-23 18:45:29'), ('25', null, null, '0', '30', '0', '5', '2016-07-23 18:45:30'), ('26', null, null, '0', '30', '0', '5', '2016-07-23 18:48:22'), ('27', null, null, '0', '30', '0', '5', '2016-07-23 18:49:53'), ('28', null, null, '0', '30', '0', '5', '2016-07-23 18:51:50'), ('29', null, null, '0', '30', '0', '5', '2016-07-23 18:54:14'), ('30', null, null, '0', '30', '0', '5', '2016-07-23 19:00:13'), ('31', null, null, '0', '30', '0', '5', '2016-07-23 19:07:07'), ('32', null, null, '0', '30', '0', '5', '2016-07-23 20:17:26'), ('33', null, null, '0', '30', '119', '181', '2016-07-23 20:44:56'), ('34', null, null, '0', '30', '119', '181', '2016-07-23 20:45:02'), ('35', null, null, '0', '30', '119', '181', '2016-07-23 20:45:04'), ('36', null, null, '0', '30', '119', '181', '2016-07-23 20:56:39'), ('37', null, null, '0', '30', '119', '181', '2016-07-23 20:56:57'), ('38', null, null, '0', '30', '0', '5', '2016-07-23 21:10:52'), ('39', null, null, '0', '30', '0', '1', '2016-07-23 21:15:08'), ('40', null, null, '0', '30', '119', '181', '2016-07-23 21:28:40'), ('41', null, null, '0', '30', '0', '5', '2016-07-23 21:35:26'), ('42', null, null, '0', '30', '0', '5', '2016-07-23 21:48:53'), ('43', null, null, '0', '30', '0', '5', '2016-07-23 22:32:09'), ('44', null, null, '0', '30', '0', '5', '2016-07-23 22:39:22'), ('45', null, null, '0', '30', '119', '181', '2016-07-23 23:42:11'), ('46', null, null, '0', '30', '119', '181', '2016-07-23 23:46:54'), ('47', null, null, '0', '30', '119', '181', '2016-07-24 00:32:59'), ('48', null, null, '0', '30', '0', '5', '2016-07-24 05:37:38'), ('49', null, null, '0', '30', '0', '5', '2016-07-24 07:26:34'), ('50', null, null, '0', '30', '119', '181', '2016-07-24 07:54:49'), ('51', null, null, '0', '30', '0', '5', '2016-07-24 08:47:28'), ('52', null, null, '0', '30', '0', '5', '2016-07-24 09:28:40'), ('53', null, null, '0', '30', '119', '181', '2016-07-24 09:38:36'), ('54', null, null, '0', '30', '119', '181', '2016-07-24 09:40:45'), ('55', null, null, '0', '30', '0', '5', '2016-07-24 09:58:10'), ('56', null, null, '0', '30', '119', '181', '2016-07-24 10:28:10'), ('57', null, null, '0', '30', '119', '181', '2016-07-24 10:30:05'), ('58', null, null, '0', '30', '119', '181', '2016-07-24 10:38:19'), ('59', null, null, '0', '30', '119', '181', '2016-07-24 10:39:38'), ('60', null, null, '0', '30', '119', '181', '2016-07-24 10:40:09'), ('61', null, null, '0', '30', '119', '181', '2016-07-24 10:53:51'), ('62', null, null, '0', '30', '119', '181', '2016-07-24 11:49:56'), ('63', null, null, '0', '30', '119', '181', '2016-07-24 12:13:05'), ('64', null, null, '0', '30', '119', '181', '2016-07-24 13:09:03'), ('65', null, null, '0', '30', '119', '181', '2016-07-24 13:58:51'), ('66', null, null, '0', '30', '119', '181', '2016-07-24 14:08:35'), ('67', null, null, '0', '30', '119', '181', '2016-07-24 14:19:27'), ('68', null, null, '0', '30', '119', '181', '2016-07-24 14:53:56'), ('69', null, null, '0', '30', '119', '181', '2016-07-24 15:04:43'), ('70', null, null, '0', '30', '119', '181', '2016-07-24 15:22:52'), ('71', null, null, '0', '30', '119', '181', '2016-07-24 17:47:42'), ('72', null, null, '0', '30', '119', '181', '2016-07-24 20:12:26'), ('73', null, null, '0', '30', '119', '181', '2016-07-24 23:03:47'), ('74', null, null, '0', '30', '119', '181', '2016-07-25 01:02:56'), ('75', null, null, '0', '30', '119', '181', '2016-07-25 07:14:35'), ('76', null, null, '0', '30', '119', '181', '2016-07-25 08:34:00'), ('77', null, null, '0', '30', '119', '181', '2016-07-25 11:19:21'), ('78', null, null, '0', '30', '119', '181', '2016-07-25 11:49:23'), ('79', null, null, '0', '30', '119', '181', '2016-07-25 12:36:06'), ('80', null, null, '0', '30', '119', '181', '2016-07-25 12:37:58'), ('81', null, null, '0', '30', '119', '181', '2016-07-25 12:45:41'), ('82', null, null, '0', '30', '119', '181', '2016-07-25 13:27:38'), ('83', null, null, '0', '30', '119', '181', '2016-07-25 17:57:41'), ('84', null, null, '0', '30', '119', '181', '2016-07-25 19:39:38'), ('85', null, null, '0', '30', '119', '120', '2016-07-25 19:41:03'), ('86', null, null, '0', '30', '119', '181', '2016-07-25 21:25:00'), ('87', null, null, '0', '30', '0', '1', '2016-07-25 21:39:10'), ('88', null, null, '0', '30', '119', '181', '2016-07-25 23:14:52'), ('89', null, null, '0', '30', '119', '181', '2016-07-26 09:40:35'), ('90', null, null, '0', '30', '0', '3', '2016-07-26 19:02:40'), ('91', null, null, '0', '30', '119', '181', '2016-07-26 22:50:31'), ('92', null, null, '33', '50', '0', '0', '2016-07-27 18:36:00'), ('101', null, null, '0', '30', '119', '181', '2016-07-27 22:29:31'), ('102', null, null, '0', '30', '119', '181', '2016-07-27 22:36:26'), ('103', null, null, '0', '30', '0', '3', '2016-07-28 14:20:04'), ('104', null, null, '0', '30', '119', '186', '2016-07-28 15:30:07'), ('105', null, null, '0', '30', '119', '186', '2016-07-28 15:30:18'), ('106', null, null, '0', '30', '119', '186', '2016-07-28 15:30:20'), ('107', null, null, '0', '30', '119', '187', '2016-07-28 15:30:25'), ('108', null, null, '0', '30', '119', '187', '2016-07-28 15:30:35');
INSERT INTO `point_system` VALUES ('109', null, null, '0', '30', '119', '187', '2016-07-28 15:30:37'), ('110', null, null, '0', '30', '119', '187', '2016-07-28 15:33:03'), ('111', null, null, '0', '30', '119', '187', '2016-07-28 15:33:44'), ('112', null, null, '0', '30', '119', '187', '2016-07-28 15:36:23'), ('113', null, null, '0', '30', '119', '187', '2016-07-28 15:37:06'), ('114', null, null, '0', '30', '119', '186', '2016-07-28 15:37:10'), ('115', null, null, '0', '30', '119', '187', '2016-07-28 15:55:32'), ('116', null, null, '0', '30', '119', '187', '2016-07-28 16:17:26'), ('117', null, null, '0', '30', '119', '187', '2016-07-28 16:18:38'), ('118', null, null, '0', '30', '119', '187', '2016-07-28 16:49:39'), ('119', null, null, '0', '30', '119', '186', '2016-07-28 16:50:15'), ('120', null, null, '0', '30', '119', '188', '2016-07-28 17:00:06'), ('121', null, null, '0', '30', '119', '188', '2016-07-28 17:00:15'), ('122', null, null, '0', '30', '119', '188', '2016-07-28 17:00:16'), ('123', null, null, '0', '30', '119', '189', '2016-07-28 17:00:21'), ('124', null, null, '0', '30', '119', '189', '2016-07-28 17:00:31'), ('125', null, null, '0', '30', '119', '189', '2016-07-28 17:00:33'), ('126', null, null, '0', '30', '119', '187', '2016-07-28 17:13:50'), ('127', null, null, '0', '30', '119', '186', '2016-07-28 17:15:08'), ('128', null, null, '0', '30', '119', '187', '2016-07-28 17:17:47'), ('129', null, null, '0', '30', '119', '189', '2016-07-28 17:22:16'), ('130', null, null, '0', '30', '119', '188', '2016-07-28 17:23:50'), ('131', null, null, '0', '30', '119', '188', '2016-07-28 17:36:11'), ('132', null, null, '0', '30', '119', '187', '2016-07-28 17:41:51'), ('133', null, null, '0', '30', '119', '188', '2016-07-28 17:46:42'), ('134', null, null, '0', '30', '119', '188', '2016-07-28 17:47:19'), ('135', null, null, '0', '30', '119', '186', '2016-07-28 17:59:18'), ('136', null, null, '0', '30', '119', '189', '2016-07-28 18:05:44'), ('137', null, null, '0', '30', '119', '189', '2016-07-28 18:22:55'), ('138', null, null, '0', '30', '119', '188', '2016-07-28 18:35:09'), ('139', null, null, '0', '30', '119', '189', '2016-07-28 18:45:49'), ('140', null, null, '0', '30', '119', '188', '2016-07-28 19:02:50'), ('141', null, null, '0', '30', '119', '188', '2016-07-28 19:06:19'), ('142', null, null, '0', '30', '119', '186', '2016-07-28 19:07:46'), ('143', null, null, '0', '30', '0', '15', '2016-07-28 19:11:40'), ('144', null, null, '0', '30', '119', '189', '2016-07-28 19:13:11'), ('145', null, null, '0', '30', '119', '189', '2016-07-28 19:13:19'), ('146', null, null, '0', '30', '0', '15', '2016-07-28 19:36:36'), ('147', null, null, '0', '30', '0', '15', '2016-07-28 19:38:52'), ('148', null, null, '0', '30', '0', '15', '2016-07-28 19:39:54'), ('149', null, null, '0', '30', '0', '15', '2016-07-28 19:41:52'), ('150', null, null, '0', '30', '0', '16', '2016-07-28 19:43:14'), ('151', null, null, '0', '30', '0', '16', '2016-07-28 19:43:15'), ('152', null, null, '0', '30', '0', '16', '2016-07-28 19:43:28'), ('153', null, null, '0', '30', '0', '16', '2016-07-28 19:44:26'), ('154', null, null, '0', '30', '0', '15', '2016-07-28 19:51:32'), ('155', null, null, '0', '30', '0', '15', '2016-07-28 19:55:17'), ('156', null, null, '0', '30', '119', '189', '2016-07-28 20:05:02'), ('157', null, null, '0', '30', '0', '15', '2016-07-28 20:05:56'), ('158', null, null, '0', '30', '119', '186', '2016-07-28 20:21:36'), ('159', null, null, '0', '30', '0', '16', '2016-07-28 20:22:22'), ('160', null, null, '0', '30', '0', '16', '2016-07-28 20:32:20'), ('161', null, null, '0', '30', '0', '15', '2016-07-28 20:33:20'), ('162', null, null, '0', '30', '0', '15', '2016-07-28 20:33:52'), ('163', null, null, '0', '30', '0', '15', '2016-07-28 20:36:07'), ('164', null, null, '0', '30', '119', '186', '2016-07-28 20:40:31'), ('165', null, null, '0', '30', '119', '189', '2016-07-28 21:03:26'), ('166', null, null, '0', '30', '119', '186', '2016-07-28 21:07:48'), ('167', null, null, '0', '30', '0', '15', '2016-07-28 21:23:23'), ('168', null, null, '0', '30', '119', '188', '2016-07-28 21:44:36'), ('169', null, null, '0', '30', '119', '189', '2016-07-28 21:45:59'), ('170', null, null, '0', '30', '119', '186', '2016-07-28 21:46:02'), ('171', null, null, '0', '30', '119', '189', '2016-07-28 21:51:49'), ('172', null, null, '0', '30', '119', '189', '2016-07-28 22:08:04'), ('173', null, null, '0', '30', '119', '189', '2016-07-28 22:09:14'), ('174', null, null, '0', '30', '0', '15', '2016-07-28 22:17:23'), ('175', null, null, '0', '30', '0', '15', '2016-07-28 22:39:53'), ('176', null, null, '0', '30', '0', '15', '2016-07-28 22:47:14'), ('177', null, null, '0', '30', '0', '15', '2016-07-28 22:59:15'), ('178', null, null, '0', '30', '119', '189', '2016-07-28 23:07:44'), ('179', null, null, '0', '30', '119', '188', '2016-07-28 23:42:30'), ('180', null, null, '0', '30', '119', '189', '2016-07-28 23:51:43'), ('181', null, null, '0', '30', '0', '15', '2016-07-28 23:56:08'), ('182', null, null, '0', '30', '119', '181', '2016-07-28 23:58:59'), ('183', null, null, '0', '30', '119', '181', '2016-07-29 00:13:49'), ('184', null, null, '0', '30', '0', '15', '2016-07-29 01:08:36'), ('185', null, null, '0', '30', '0', '16', '2016-07-29 01:31:05'), ('186', null, null, '0', '30', '0', '15', '2016-07-29 01:44:57'), ('187', null, null, '0', '30', '0', '15', '2016-07-29 01:55:58'), ('188', null, null, '0', '30', '0', '16', '2016-07-29 02:00:12'), ('189', null, null, '0', '30', '119', '188', '2016-07-29 02:01:34'), ('190', null, null, '0', '30', '119', '189', '2016-07-29 02:06:42'), ('191', null, null, '0', '30', '0', '15', '2016-07-29 02:09:29'), ('192', null, null, '0', '30', '0', '15', '2016-07-29 04:11:39'), ('193', null, null, '0', '30', '119', '188', '2016-07-29 07:42:57'), ('194', null, null, '0', '30', '0', '15', '2016-07-29 07:43:21'), ('195', null, null, '0', '30', '119', '186', '2016-07-29 07:52:30'), ('196', null, null, '0', '30', '0', '15', '2016-07-29 08:14:00'), ('197', null, null, '0', '30', '0', '15', '2016-07-29 08:27:37'), ('198', null, null, '0', '30', '0', '15', '2016-07-29 08:31:24'), ('199', null, null, '0', '30', '119', '188', '2016-07-29 08:51:25'), ('200', null, null, '0', '30', '0', '15', '2016-07-29 09:01:57'), ('201', null, null, '0', '30', '0', '15', '2016-07-29 09:53:09'), ('202', null, null, '0', '30', '119', '189', '2016-07-29 10:05:19'), ('203', null, null, '0', '30', '0', '15', '2016-07-29 10:43:58'), ('204', null, null, '0', '30', '119', '186', '2016-07-29 10:51:52'), ('205', null, null, '0', '30', '0', '15', '2016-07-29 10:53:47'), ('206', null, null, '0', '30', '0', '15', '2016-07-29 11:01:14'), ('207', null, null, '0', '30', '0', '15', '2016-07-29 11:05:06'), ('208', null, null, '0', '30', '119', '188', '2016-07-29 11:06:24');
INSERT INTO `point_system` VALUES ('209', null, null, '0', '30', '0', '15', '2016-07-29 11:24:23'), ('210', null, null, '0', '30', '119', '189', '2016-07-29 11:42:06'), ('211', null, null, '0', '30', '119', '186', '2016-07-29 11:43:24'), ('212', null, null, '0', '30', '0', '15', '2016-07-29 12:18:15'), ('213', null, null, '0', '30', '0', '15', '2016-07-29 12:18:15'), ('214', null, null, '0', '30', '0', '16', '2016-07-29 12:18:17'), ('215', null, null, '0', '30', '119', '189', '2016-07-29 12:31:23'), ('216', null, null, '0', '30', '119', '189', '2016-07-29 14:29:32'), ('217', null, null, '0', '30', '0', '15', '2016-07-29 16:45:46'), ('218', null, null, '0', '30', '0', '16', '2016-07-29 16:51:50'), ('219', null, null, '0', '30', '119', '189', '2016-07-29 16:52:56'), ('220', null, null, '0', '30', '119', '189', '2016-07-29 17:48:08'), ('221', null, null, '0', '30', '0', '15', '2016-07-29 18:39:56'), ('222', null, null, '0', '30', '0', '1', '2016-07-29 21:22:22'), ('223', null, null, '0', '30', '0', '15', '2016-07-30 00:28:12'), ('224', null, null, '0', '30', '0', '15', '2016-07-30 01:41:20'), ('225', null, null, '0', '30', '0', '15', '2016-07-30 11:14:51'), ('226', null, null, '42', '50', '0', '0', '2016-07-30 11:32:34'), ('227', null, null, '0', '30', '119', '186', '2016-07-30 11:41:48'), ('228', null, null, '0', '30', '0', '15', '2016-07-30 12:27:43'), ('229', null, null, '0', '30', '0', '15', '2016-07-30 21:08:19'), ('230', null, null, '0', '30', '119', '189', '2016-07-31 09:24:40'), ('231', null, null, '0', '30', '119', '188', '2016-07-31 09:24:47'), ('232', null, null, '0', '30', '119', '181', '2016-07-31 09:24:59'), ('233', null, null, '0', '30', '119', '120', '2016-07-31 09:25:06'), ('234', null, null, '0', '30', '119', '181', '2016-07-31 12:12:49'), ('235', null, null, '0', '30', '119', '181', '2016-07-31 12:12:49'), ('236', null, null, '0', '30', '119', '181', '2016-07-31 12:15:09'), ('237', null, null, '0', '30', '0', '15', '2016-07-31 12:52:45'), ('238', null, null, '0', '30', '119', '189', '2016-07-31 14:10:49'), ('239', null, null, '0', '30', '119', '186', '2016-07-31 14:13:35'), ('240', null, null, '0', '30', '0', '15', '2016-07-31 19:31:51'), ('241', null, null, '0', '30', '0', '15', '2016-07-31 22:21:26'), ('242', null, null, '0', '30', '0', '2', '2016-07-31 23:28:37'), ('243', null, null, '0', '30', '0', '2', '2016-07-31 23:28:44'), ('244', null, null, '0', '30', '0', '15', '2016-08-01 05:41:33'), ('245', null, null, '0', '30', '0', '19', '2016-08-01 10:58:34'), ('246', null, null, '0', '30', '0', '15', '2016-08-01 15:50:25'), ('247', null, null, '0', '30', '0', '16', '2016-08-01 19:58:32'), ('248', null, null, '0', '30', '0', '15', '2016-08-01 19:58:56'), ('249', null, null, '0', '30', '0', '16', '2016-08-02 11:09:26'), ('250', null, null, '0', '30', '0', '16', '2016-08-02 18:25:21'), ('251', null, null, '0', '30', '0', '1', '2016-08-02 21:12:31'), ('252', null, null, '0', '30', '0', '15', '2016-08-02 22:37:40'), ('253', null, null, '0', '30', '119', '147', '2016-08-03 03:04:43'), ('254', null, null, '0', '30', '0', '15', '2016-08-04 23:44:47'), ('255', null, null, '0', '30', '119', '181', '2016-08-06 17:22:03'), ('256', null, null, '0', '30', '119', '188', '2016-08-06 17:22:05'), ('257', null, null, '0', '30', '119', '189', '2016-08-06 17:22:07'), ('258', null, null, '0', '30', '0', '1', '2016-08-06 21:08:23'), ('259', null, null, '0', '30', '0', '2', '2016-08-08 12:53:44'), ('260', null, null, '0', '30', '0', '3', '2016-08-08 12:53:44'), ('261', null, null, '0', '30', '0', '1', '2016-08-08 21:17:38'), ('262', null, null, '0', '30', '119', '181', '2016-08-09 12:22:49'), ('263', null, null, '0', '30', '119', '189', '2016-08-09 12:50:13'), ('264', null, null, '0', '30', '119', '181', '2016-08-09 12:50:26'), ('265', null, null, '0', '30', '0', '15', '2016-08-09 21:14:34'), ('266', null, null, '0', '30', '119', '186', '2016-08-09 21:14:46'), ('267', null, null, '0', '30', '0', '15', '2016-08-10 09:39:22'), ('268', null, null, '0', '30', '119', '186', '2016-08-10 09:39:41'), ('269', null, null, '0', '30', '0', '16', '2016-08-10 09:39:57'), ('270', null, null, '0', '30', '0', '15', '2016-08-12 01:50:18'), ('271', null, null, '0', '30', '0', '15', '2016-08-12 02:10:12'), ('272', null, null, '0', '30', '0', '15', '2016-08-12 02:20:45'), ('273', null, null, '0', '30', '0', '15', '2016-08-12 03:34:41'), ('274', null, null, '0', '30', '0', '15', '2016-08-12 04:04:19'), ('275', null, null, '0', '30', '0', '15', '2016-08-12 07:45:47'), ('276', null, null, '0', '30', '0', '15', '2016-08-12 09:15:22'), ('277', null, null, '0', '30', '0', '15', '2016-08-12 09:36:04'), ('278', null, null, '0', '30', '0', '15', '2016-08-12 10:17:55'), ('279', null, null, '0', '30', '0', '15', '2016-08-12 10:49:56'), ('280', null, null, '0', '30', '0', '15', '2016-08-12 11:28:31'), ('281', null, null, '0', '30', '0', '15', '2016-08-12 11:34:23'), ('282', null, null, '0', '30', '0', '15', '2016-08-12 11:55:59'), ('283', null, null, '0', '30', '0', '15', '2016-08-12 13:00:56'), ('284', null, null, '0', '30', '0', '15', '2016-08-12 14:24:41'), ('285', null, null, '0', '30', '0', '15', '2016-08-12 14:47:29'), ('286', null, null, '0', '30', '0', '15', '2016-08-12 17:37:02'), ('287', null, null, '0', '30', '0', '15', '2016-08-12 18:18:42'), ('288', null, null, '0', '30', '0', '15', '2016-08-12 20:25:22'), ('289', null, null, '0', '30', '0', '15', '2016-08-12 21:20:01'), ('290', null, null, '0', '30', '0', '15', '2016-08-12 21:31:18'), ('291', null, null, '0', '30', '0', '15', '2016-08-13 07:50:30'), ('292', null, null, '0', '30', '0', '15', '2016-08-13 16:17:09'), ('293', null, null, '0', '30', '0', '15', '2016-08-13 16:23:56'), ('294', null, null, '0', '30', '0', '15', '2016-08-13 16:23:57'), ('295', null, null, '0', '30', '0', '15', '2016-08-13 16:23:57'), ('296', null, null, '0', '30', '0', '15', '2016-08-13 16:23:57'), ('297', null, null, '0', '30', '0', '15', '2016-08-13 16:24:00'), ('298', null, null, '0', '30', '0', '15', '2016-08-13 16:24:01'), ('299', null, null, '0', '30', '0', '15', '2016-08-13 16:24:03'), ('300', null, null, '0', '30', '0', '15', '2016-08-13 16:24:05'), ('301', null, null, '0', '30', '0', '15', '2016-08-13 16:24:06'), ('302', null, null, '0', '30', '0', '15', '2016-08-13 16:24:08'), ('303', null, null, '0', '30', '0', '16', '2016-08-13 16:24:59'), ('304', null, null, '0', '30', '0', '16', '2016-08-13 16:25:00'), ('305', null, null, '0', '30', '0', '16', '2016-08-13 16:25:01'), ('306', null, null, '0', '30', '0', '16', '2016-08-13 16:25:01'), ('307', null, null, '0', '30', '0', '16', '2016-08-13 16:25:05'), ('308', null, null, '0', '30', '0', '16', '2016-08-13 16:25:14');
INSERT INTO `point_system` VALUES ('309', null, null, '0', '30', '0', '15', '2016-08-13 16:25:15'), ('310', null, null, '0', '30', '0', '15', '2016-08-13 16:25:16'), ('311', null, null, '0', '30', '0', '15', '2016-08-13 16:25:17'), ('312', null, null, '0', '30', '0', '15', '2016-08-13 16:25:17'), ('313', null, null, '0', '30', '0', '15', '2016-08-13 16:25:17'), ('314', null, null, '0', '30', '0', '15', '2016-08-13 16:25:18'), ('315', null, null, '0', '30', '0', '15', '2016-08-13 16:25:18'), ('316', null, null, '0', '30', '0', '15', '2016-08-13 16:25:23'), ('317', null, null, '0', '30', '0', '15', '2016-08-13 16:25:29'), ('318', null, null, '0', '30', '0', '16', '2016-08-13 16:25:52'), ('319', null, null, '0', '30', '0', '16', '2016-08-13 16:25:53'), ('320', null, null, '0', '30', '119', '181', '2016-08-14 20:48:46'), ('321', null, null, '43', '50', '0', '0', '2016-08-17 11:46:54'), ('322', null, null, '0', '30', '119', '181', '2016-08-17 19:12:05'), ('323', null, null, '0', '30', '119', '181', '2016-08-17 19:12:06');
COMMIT;

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
`document_id`  int(11) NOT NULL ,
`name`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`department_id`  int(11) NOT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`parent_post_id`  int(11) NULL DEFAULT NULL ,
`in_time`  time NOT NULL ,
`out_time`  time NOT NULL ,
PRIMARY KEY (`id`),
INDEX `fk_post_department1_idx` (`department_id`) USING BTREE ,
INDEX `parent_post_id` (`parent_post_id`) USING BTREE ,
INDEX `document_id` (`document_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of post
-- ----------------------------
BEGIN;
INSERT INTO `post` VALUES ('2', 'CEO', '1', '1', null, '00:00:00', '00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for `post_email_association`
-- ----------------------------
DROP TABLE IF EXISTS `post_email_association`;
CREATE TABLE `post_email_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`post_id`  int(11) NULL DEFAULT NULL ,
`emailsetting_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `post_id` (`post_id`) USING BTREE ,
INDEX `email_settings_id` (`emailsetting_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of post_email_association
-- ----------------------------
BEGIN;
INSERT INTO `post_email_association` VALUES ('4', '2', '1'), ('5', '2', '2'), ('6', '2', '3');
COMMIT;

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
`starting_date`  date NULL DEFAULT NULL ,
`ending_date`  date NULL DEFAULT NULL ,
`actual_completion_date`  date NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `created_by_id` (`created_by_id`) USING BTREE ,
FULLTEXT INDEX `quick_search` (`name`, `description`, `type`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of project
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `projectcomment`
-- ----------------------------
DROP TABLE IF EXISTS `projectcomment`;
CREATE TABLE `projectcomment` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`task_id`  int(11) NULL DEFAULT NULL ,
`comment`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`employee_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `task_id` (`task_id`) USING BTREE ,
INDEX `employee_id` (`employee_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of projectcomment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `publish_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `publish_schedule`;
CREATE TABLE `publish_schedule` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`blog_post_id`  int(11) NULL DEFAULT NULL ,
`date`  datetime NULL DEFAULT NULL ,
`is_posted`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=62

;

-- ----------------------------
-- Records of publish_schedule
-- ----------------------------
BEGIN;
INSERT INTO `publish_schedule` VALUES ('61', '5', '2016-07-23 18:20:00', '1');
COMMIT;

-- ----------------------------
-- Table structure for `qsp_detail`
-- ----------------------------
DROP TABLE IF EXISTS `qsp_detail`;
CREATE TABLE `qsp_detail` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`qsp_master_id`  int(11) NOT NULL ,
`item_id`  int(11) NULL DEFAULT NULL ,
`price`  decimal(14,4) NOT NULL ,
`quantity`  decimal(14,2) NOT NULL ,
`tax_percentage`  decimal(14,4) NOT NULL ,
`narration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`extra_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`shipping_charge`  float NULL DEFAULT NULL ,
`taxation_id`  int(11) NULL DEFAULT NULL ,
`sale_amount`  decimal(14,4) NULL DEFAULT NULL ,
`original_amount`  decimal(14,4) NULL DEFAULT NULL ,
`shipping_duration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`express_shipping_charge`  decimal(14,4) NULL DEFAULT NULL ,
`express_shipping_duration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `qsp_master_id` (`qsp_master_id`) USING BTREE ,
INDEX `item_id` (`item_id`) USING BTREE ,
INDEX `taxation_id` (`taxation_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of qsp_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `qsp_detail_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `qsp_detail_attachment`;
CREATE TABLE `qsp_detail_attachment` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`contact_id`  int(11) NOT NULL ,
`qsp_detail_id`  int(11) NOT NULL ,
`file_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of qsp_detail_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `qsp_master`
-- ----------------------------
DROP TABLE IF EXISTS `qsp_master`;
CREATE TABLE `qsp_master` (
`document_id`  int(11) NOT NULL ,
`contact_id`  int(11) NOT NULL ,
`document_no`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`billing_address`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`billing_city`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`billing_state_id`  int(11) NOT NULL ,
`billing_country_id`  int(11) NOT NULL ,
`billing_pincode`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_shipping_inclusive_tax`  tinyint(4) NULL DEFAULT NULL ,
`is_express_shipping`  tinyint(4) NULL DEFAULT NULL ,
`shipping_address`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`shipping_city`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shipping_state_id`  int(11) NULL DEFAULT NULL ,
`shipping_country_id`  int(11) NULL DEFAULT NULL ,
`shipping_pincode`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`currency_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`discount_amount`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`transaction_reference`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`transaction_response_data`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`narration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`priority_id`  int(11) NULL DEFAULT NULL ,
`due_date`  datetime NULL DEFAULT NULL ,
`exchange_rate`  decimal(14,6) NULL DEFAULT NULL ,
`tnc_id`  int(11) NULL DEFAULT NULL ,
`tnc_text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`paymentgateway_id`  int(11) NULL DEFAULT NULL ,
`related_qsp_master_id`  int(11) NULL DEFAULT NULL ,
`nominal_id`  int(11) NULL DEFAULT NULL ,
`from`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`round_amount`  decimal(14,2) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `document` (`document_id`) USING BTREE ,
INDEX `contact_id` (`contact_id`) USING BTREE ,
INDEX `priority_id` (`priority_id`) USING BTREE ,
INDEX `tnc_id` (`tnc_id`) USING BTREE ,
INDEX `payment_gateway_id` (`paymentgateway_id`) USING BTREE ,
INDEX `related_qsp_master_id` (`related_qsp_master_id`) USING BTREE ,
INDEX `nominal_id` (`nominal_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of qsp_master
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `qualification`
-- ----------------------------
DROP TABLE IF EXISTS `qualification`;
CREATE TABLE `qualification` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`employee_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`qualificaton_level`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`remarks`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
INDEX `employee_id` (`employee_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of qualification
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `quantity_condition`
-- ----------------------------
DROP TABLE IF EXISTS `quantity_condition`;
CREATE TABLE `quantity_condition` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`quantity_set_id`  int(11) NOT NULL ,
`customfield_value_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `qty_set_id` (`quantity_set_id`) USING BTREE ,
INDEX `customfield_value_id` (`customfield_value_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of quantity_condition
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `quantity_set`
-- ----------------------------
DROP TABLE IF EXISTS `quantity_set`;
CREATE TABLE `quantity_set` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`item_id`  int(11) NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`qty`  float NOT NULL ,
`price`  double NULL DEFAULT NULL ,
`old_price`  double NULL DEFAULT NULL ,
`is_default`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `item_id` (`item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=43

;

-- ----------------------------
-- Records of quantity_set
-- ----------------------------
BEGIN;
INSERT INTO `quantity_set` VALUES ('1', '12', '1', '1', '10000', '0', '1'), ('3', '98', '1 Year', '12', '12000', '18000', '1'), ('4', '98', '2 Year', '24', '24000', '36000', '0'), ('5', '98', '3 Year', '36', '36000', '54000', '0'), ('6', '98', '4 Year', '48', '48000', '72000', '0'), ('7', '98', '5 Year', '60', '60000', '90000', '0'), ('8', '99', '1 Year', '12', '500', '600', '1'), ('13', '100', '1 Year', '12', '12000', '18000', '1'), ('14', '100', '2 Year', '24', '24000', '36000', '0'), ('15', '100', '3 Year', '36', '36000', '54000', '0'), ('16', '100', '4 Year', '48', '48000', '72000', '0'), ('17', '100', '5 Year', '60', '60000', '90000', '0'), ('18', '101', '1 Year', '12', '4999', '6666', '1'), ('23', '102', '1 Year', '12', '1000', '1500', '1'), ('24', '102', '2 Year', '24', '1000', '1500', '0'), ('25', '102', '3 Year', '36', '1000', '1500', '0'), ('26', '102', '4 Year', '48', '1000', '1500', '0'), ('27', '102', '5 Year', '60', '1000', '1500', '0'), ('28', '103', '1 Year', '12', '1000', '1500', '1'), ('29', '103', '2 Year', '24', '1000', '1500', '0'), ('30', '103', '3 Year', '36', '1000', '1500', '0'), ('31', '103', '4 Year', '48', '1000', '1500', '0'), ('32', '103', '5 Year', '60', '1000', '1500', '0'), ('33', '104', '1 Year', '12', '9999', '16999', '1'), ('38', '94', '1', '1', '2400', '2550', '1'), ('39', '50', '1', '1', '2000', '2100', '1'), ('40', '55', '1', '1', '2500', '2650', '1'), ('41', '72', '1', '1', '2450', '2450', '1'), ('42', '79', '1', '1', '2000', '2200', '1');
COMMIT;

-- ----------------------------
-- Table structure for `rule-options`
-- ----------------------------
DROP TABLE IF EXISTS `rule-options`;
CREATE TABLE `rule-options` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`rule_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of rule-options
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `rules`
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of rules
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
`id`  bigint(11) NOT NULL AUTO_INCREMENT ,
`campaign_id`  int(11) NOT NULL ,
`date`  datetime NOT NULL ,
`day`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`document_id`  int(11) NOT NULL ,
`client_event_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`posted_on`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `campaign_id` (`campaign_id`) USING BTREE ,
INDEX `document_id` (`document_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14

;

-- ----------------------------
-- Records of schedule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `shipping_association`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_association`;
CREATE TABLE `shipping_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`item_id`  int(11) NULL DEFAULT NULL ,
`shipping_rule_id`  int(11) NULL DEFAULT NULL ,
`priority`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of shipping_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `shipping_rule`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_rule`;
CREATE TABLE `shipping_rule` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`country_id`  int(11) NULL DEFAULT NULL ,
`state_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`based_on`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`priority`  int(11) NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of shipping_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `shipping_rule_row`
-- ----------------------------
DROP TABLE IF EXISTS `shipping_rule_row`;
CREATE TABLE `shipping_rule_row` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`shipping_rule_id`  int(11) NULL DEFAULT NULL ,
`from`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`to`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`shipping_charge`  decimal(10,0) NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`express_shipping_charge`  decimal(10,0) NULL DEFAULT NULL ,
`shipping_duration`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`express_shipping_duration`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ,
`shipping_duration_days`  tinyint(4) NULL DEFAULT NULL ,
`express_shipping_duration_days`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of shipping_rule_row
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `socialuser`
-- ----------------------------
DROP TABLE IF EXISTS `socialuser`;
CREATE TABLE `socialuser` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`configuration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of socialuser
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `state`
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`abbreviation`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`country_id`  int(11) NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of state
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `store_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `store_transaction`;
CREATE TABLE `store_transaction` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`related_document_id`  int(11) NULL DEFAULT NULL ,
`document_type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`from_warehouse_id`  int(11) NULL DEFAULT NULL ,
`to_warehouse_id`  int(11) NULL DEFAULT NULL ,
`created_at`  date NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`jobcard_id`  int(11) NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`delivery_via`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`delivery_reference`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`shipping_address`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`shipping_charge`  double(8,4) NULL DEFAULT NULL ,
`narration`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`tracking_code`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `related_doc_id` (`related_document_id`) USING BTREE ,
INDEX `from_warehouse_id` (`from_warehouse_id`) USING BTREE ,
INDEX `to_warehouse_id` (`to_warehouse_id`) USING BTREE ,
INDEX `jobcard_id` (`jobcard_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of store_transaction
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `store_transaction_row`
-- ----------------------------
DROP TABLE IF EXISTS `store_transaction_row`;
CREATE TABLE `store_transaction_row` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`store_transaction_id`  int(11) NULL DEFAULT NULL ,
`qsp_detail_id`  int(11) NULL DEFAULT NULL ,
`customfield_generic_id`  int(11) NULL DEFAULT NULL ,
`customfield_value_id`  int(11) NULL DEFAULT NULL ,
`quantity`  double(8,4) NULL DEFAULT NULL ,
`jobcard_detail_id`  int(11) NULL DEFAULT NULL ,
`status`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `epan_id` (`epan_id`) USING BTREE ,
INDEX `store_transaction_id` (`store_transaction_id`) USING BTREE ,
INDEX `qsp_detail_id` (`qsp_detail_id`) USING BTREE ,
INDEX `customfield_generic_id` (`customfield_generic_id`) USING BTREE ,
INDEX `customfield_value_id` (`customfield_value_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of store_transaction_row
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
`contact_id`  int(11) NOT NULL ,
`tin_no`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`pan_no`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`currency_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `contact_id` (`contact_id`) USING BTREE ,
INDEX `currency_id` (`currency_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `support_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `support_ticket`;
CREATE TABLE `support_ticket` (
`document_id`  int(11) NOT NULL ,
`contact_id`  int(11) NULL DEFAULT NULL ,
`communication_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`uid`  int(11) NULL DEFAULT NULL ,
`from_id`  int(11) NULL DEFAULT NULL ,
`from_raw`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`from_email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`from_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`to_id`  int(11) NULL DEFAULT NULL ,
`to_raw`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`cc_raw`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`bcc_raw`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`subject`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`message`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`priority`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`id`  int(11) NOT NULL AUTO_INCREMENT ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE ,
INDEX `contact_id` (`contact_id`) USING BTREE ,
INDEX `communication_id` (`communication_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of support_ticket
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`project_id`  int(11) NULL DEFAULT NULL ,
`task_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`deadline`  datetime NULL DEFAULT NULL ,
`employee_id`  int(11) NULL DEFAULT NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`starting_date`  datetime NULL DEFAULT NULL ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
`status`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_at`  datetime NULL DEFAULT NULL ,
`priority`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`estimate_time`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`set_reminder`  tinyint(4) NULL DEFAULT NULL ,
`remind_via`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`remind_value`  decimal(10,0) NULL DEFAULT NULL ,
`remind_unit`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_recurring`  tinyint(4) NULL DEFAULT NULL ,
`recurring_span`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`is_reminded`  tinyint(4) NULL DEFAULT NULL ,
`notify_to`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FULLTEXT INDEX `task_title_full_text` (`task_name`, `description`, `status`, `type`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `task_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `task_attachment`;
CREATE TABLE `task_attachment` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`task_id`  int(11) NULL DEFAULT NULL ,
`file_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `task_id` (`task_id`) USING BTREE ,
INDEX `file_id` (`file_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of task_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `taxation`
-- ----------------------------
DROP TABLE IF EXISTS `taxation`;
CREATE TABLE `taxation` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`percentage`  decimal(14,2) NOT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `created_by_id` (`created_by_id`) USING BTREE ,
FULLTEXT INDEX `search_string` (`name`, `type`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of taxation
-- ----------------------------
BEGIN;
INSERT INTO `taxation` VALUES ('1', 'vat 15%', '15.00', 'Taxation', '1');
COMMIT;

-- ----------------------------
-- Table structure for `taxation_association`
-- ----------------------------
DROP TABLE IF EXISTS `taxation_association`;
CREATE TABLE `taxation_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`item_id`  int(11) NOT NULL ,
`taxation_rule_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
INDEX `item_id` (`item_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of taxation_association
-- ----------------------------
BEGIN;
INSERT INTO `taxation_association` VALUES ('1', '50', '1'), ('2', '98', '1'), ('3', '99', '1'), ('4', '100', '1'), ('5', '101', '1'), ('6', '102', '1'), ('7', '103', '1'), ('8', '104', '1');
COMMIT;

-- ----------------------------
-- Table structure for `taxation_rule`
-- ----------------------------
DROP TABLE IF EXISTS `taxation_rule`;
CREATE TABLE `taxation_rule` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`priority`  int(11) NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of taxation_rule
-- ----------------------------
BEGIN;
INSERT INTO `taxation_rule` VALUES ('1', 'vat 15%', 'Taxation_Rule', '0', null), ('2', 'Epan Sales', 'TaxationRule', '0', '1');
COMMIT;

-- ----------------------------
-- Table structure for `taxation_rule_row`
-- ----------------------------
DROP TABLE IF EXISTS `taxation_rule_row`;
CREATE TABLE `taxation_rule_row` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`taxation_id`  int(11) NOT NULL ,
`taxation_rule_id`  int(11) NOT NULL ,
`country_id`  int(11) NULL DEFAULT NULL ,
`state_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`type`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`created_by_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of taxation_rule_row
-- ----------------------------
BEGIN;
INSERT INTO `taxation_rule_row` VALUES ('1', '1', '1', '100', '95', 'vat 15%', 'Taxation_Rule_Row', null);
COMMIT;

-- ----------------------------
-- Table structure for `team_project_association`
-- ----------------------------
DROP TABLE IF EXISTS `team_project_association`;
CREATE TABLE `team_project_association` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`employee_id`  int(11) NULL DEFAULT NULL ,
`project_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `employee_id` (`employee_id`) USING BTREE ,
INDEX `project_id` (`project_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of team_project_association
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `ticket_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_attachment`;
CREATE TABLE `ticket_attachment` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`ticket_id`  int(11) NULL DEFAULT NULL ,
`attachment_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of ticket_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `timesheet`
-- ----------------------------
DROP TABLE IF EXISTS `timesheet`;
CREATE TABLE `timesheet` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`task_id`  int(11) NULL DEFAULT NULL ,
`employee_id`  int(11) NULL DEFAULT NULL ,
`starttime`  datetime NULL DEFAULT NULL ,
`endtime`  datetime NULL DEFAULT NULL ,
`remark`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`id`),
INDEX `task_id` (`task_id`) USING BTREE ,
INDEX `employee_id` (`employee_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of timesheet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `tnc`
-- ----------------------------
DROP TABLE IF EXISTS `tnc`;
CREATE TABLE `tnc` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`content`  text CHARACTER SET latin1 COLLATE latin1_general_cs NULL ,
`name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`document_id`  int(11) NOT NULL ,
`is_default_for_quotation`  tinyint(4) NULL DEFAULT NULL ,
`is_default_for_sale_order`  tinyint(4) NULL DEFAULT NULL ,
`is_default_for_sale_invoice`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `document_id` (`document_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of tnc
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`username`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`password`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`scope`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`hash`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`last_login_date`  datetime NULL DEFAULT NULL ,
`created_by_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`epan_id`) REFERENCES `epan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
INDEX `fk_user_epan1_idx` (`epan_id`) USING BTREE ,
INDEX `created_by_id` (`created_by_id`) USING BTREE ,
FULLTEXT INDEX `search_string` (`username`, `type`, `scope`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=29

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'admin@epan.in', '21232f297a57a5a743894a0e4a801fc3', 'Active', '1', 'SuperUser', 'User', null, '2016-08-20 14:30:51', '0'), ('2', 'gowravvishwakarma@gmail.com', 'f0b446dafdccaa44c4c2fb563746de4a', 'Active', '1', 'WebsiteUser', 'User', '86135', null, '0'), ('28', 'abc@gmail.com', '202cb962ac59075b964b07152d234b70', 'InActive', '1', 'WebsiteUser', 'User', '18357', null, '0');
COMMIT;

-- ----------------------------
-- Table structure for `xepan_template`
-- ----------------------------
DROP TABLE IF EXISTS `xepan_template`;
CREATE TABLE `xepan_template` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`tags`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`description`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`is_active`  tinyint(4) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of xepan_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `xmarketingcampaign_googlebloggerconfig`
-- ----------------------------
DROP TABLE IF EXISTS `xmarketingcampaign_googlebloggerconfig`;
CREATE TABLE `xmarketingcampaign_googlebloggerconfig` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`epan_id`  int(11) NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`appId`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`secret`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`userid`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`userid_returned`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`blogid`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`access_token`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`access_token_secret`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`refresh_token`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`is_access_token_valid`  tinyint(1) NULL DEFAULT NULL ,
`is_active`  tinyint(1) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `fk_epan_id` (`epan_id`) USING BTREE 
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of xmarketingcampaign_googlebloggerconfig
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `xshop_item_images`
-- ----------------------------
DROP TABLE IF EXISTS `xshop_item_images`;
CREATE TABLE `xshop_item_images` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`item_id`  int(11) NULL DEFAULT NULL ,
`item_image_id`  int(10) UNSIGNED NULL DEFAULT NULL ,
`alt_text`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`title`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`customefieldvalue_id`  int(11) NULL DEFAULT NULL ,
`epan_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `fk_item_id` (`item_id`) USING BTREE ,
INDEX `fk_customefieldvalue_id` (`customefieldvalue_id`) USING BTREE ,
INDEX `fk_epan_id` (`epan_id`) USING BTREE ,
INDEX `fk_item_image_id` (`item_image_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of xshop_item_images
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `xshop_item_quantity_set_conditions`
-- ----------------------------
DROP TABLE IF EXISTS `xshop_item_quantity_set_conditions`;
CREATE TABLE `xshop_item_quantity_set_conditions` (
`id`  int(11) NOT NULL ,
`quantityset_id`  int(11) NULL DEFAULT NULL ,
`custom_field_value_id`  int(11) NULL DEFAULT NULL ,
`item_id`  int(11) NULL DEFAULT NULL ,
`customfield_id`  int(11) NULL DEFAULT NULL ,
`department_phase_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `fk_quantityset_id` (`quantityset_id`) USING BTREE ,
INDEX `fk_custom_field_value_id` (`custom_field_value_id`) USING BTREE ,
INDEX `fk_item_id` (`item_id`) USING BTREE ,
INDEX `fk_customfield_id` (`customfield_id`) USING BTREE ,
INDEX `fk_department_phase_id` (`department_phase_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of xshop_item_quantity_set_conditions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for `account_balance_sheet`
-- ----------------------------
ALTER TABLE `account_balance_sheet` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `account_group`
-- ----------------------------
ALTER TABLE `account_group` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `account_transaction`
-- ----------------------------
ALTER TABLE `account_transaction` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `account_transaction_row`
-- ----------------------------
ALTER TABLE `account_transaction_row` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `account_transaction_types`
-- ----------------------------
ALTER TABLE `account_transaction_types` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `acl`
-- ----------------------------
ALTER TABLE `acl` AUTO_INCREMENT=50;

-- ----------------------------
-- Auto increment value for `activity`
-- ----------------------------
ALTER TABLE `activity` AUTO_INCREMENT=122;

-- ----------------------------
-- Auto increment value for `affiliate`
-- ----------------------------
ALTER TABLE `affiliate` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `application`
-- ----------------------------
ALTER TABLE `application` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for `attachment`
-- ----------------------------
ALTER TABLE `attachment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `blog_comment`
-- ----------------------------
ALTER TABLE `blog_comment` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `blog_post`
-- ----------------------------
ALTER TABLE `blog_post` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `blog_post_category`
-- ----------------------------
ALTER TABLE `blog_post_category` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `blog_post_category_association`
-- ----------------------------
ALTER TABLE `blog_post_category_association` AUTO_INCREMENT=33;

-- ----------------------------
-- Auto increment value for `campaign`
-- ----------------------------
ALTER TABLE `campaign` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `campaign_category_association`
-- ----------------------------
ALTER TABLE `campaign_category_association` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for `campaign_socialuser_association`
-- ----------------------------
ALTER TABLE `campaign_socialuser_association` AUTO_INCREMENT=18;

-- ----------------------------
-- Auto increment value for `category`
-- ----------------------------
ALTER TABLE `category` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `category_item_association`
-- ----------------------------
ALTER TABLE `category_item_association` AUTO_INCREMENT=16;

-- ----------------------------
-- Auto increment value for `cms_editors`
-- ----------------------------
ALTER TABLE `cms_editors` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `comments`
-- ----------------------------
ALTER TABLE `comments` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `communication`
-- ----------------------------
ALTER TABLE `communication` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `communication_attachment`
-- ----------------------------
ALTER TABLE `communication_attachment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `communication_sms_setting`
-- ----------------------------
ALTER TABLE `communication_sms_setting` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `contact`
-- ----------------------------
ALTER TABLE `contact` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `contact_info`
-- ----------------------------
ALTER TABLE `contact_info` AUTO_INCREMENT=25;

-- ----------------------------
-- Auto increment value for `content`
-- ----------------------------
ALTER TABLE `content` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `country`
-- ----------------------------
ALTER TABLE `country` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `currency`
-- ----------------------------
ALTER TABLE `currency` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `custom_account_entries_templates`
-- ----------------------------
ALTER TABLE `custom_account_entries_templates` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `custom_account_entries_templates_transaction_row`
-- ----------------------------
ALTER TABLE `custom_account_entries_templates_transaction_row` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `custom_account_entries_templates_transactions`
-- ----------------------------
ALTER TABLE `custom_account_entries_templates_transactions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `custom_form`
-- ----------------------------
ALTER TABLE `custom_form` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `custom_form_field`
-- ----------------------------
ALTER TABLE `custom_form_field` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `custom_form_submission`
-- ----------------------------
ALTER TABLE `custom_form_submission` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `customer`
-- ----------------------------
ALTER TABLE `customer` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for `customfield_association`
-- ----------------------------
ALTER TABLE `customfield_association` AUTO_INCREMENT=93;

-- ----------------------------
-- Auto increment value for `customfield_generic`
-- ----------------------------
ALTER TABLE `customfield_generic` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for `customfield_value`
-- ----------------------------
ALTER TABLE `customfield_value` AUTO_INCREMENT=92;

-- ----------------------------
-- Auto increment value for `department`
-- ----------------------------
ALTER TABLE `department` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `designer_image_category`
-- ----------------------------
ALTER TABLE `designer_image_category` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `designer_images`
-- ----------------------------
ALTER TABLE `designer_images` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `discount_voucher`
-- ----------------------------
ALTER TABLE `discount_voucher` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `discount_voucher_condition`
-- ----------------------------
ALTER TABLE `discount_voucher_condition` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `discount_voucher_used`
-- ----------------------------
ALTER TABLE `discount_voucher_used` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `document`
-- ----------------------------
ALTER TABLE `document` AUTO_INCREMENT=225;

-- ----------------------------
-- Auto increment value for `emails`
-- ----------------------------
ALTER TABLE `emails` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `emailsetting`
-- ----------------------------
ALTER TABLE `emailsetting` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `employee`
-- ----------------------------
ALTER TABLE `employee` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `employee_documents`
-- ----------------------------
ALTER TABLE `employee_documents` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `employee_movement`
-- ----------------------------
ALTER TABLE `employee_movement` AUTO_INCREMENT=73;

-- ----------------------------
-- Auto increment value for `epan`
-- ----------------------------
ALTER TABLE `epan` AUTO_INCREMENT=47;

-- ----------------------------
-- Auto increment value for `epan_category`
-- ----------------------------
ALTER TABLE `epan_category` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `epan_config`
-- ----------------------------
ALTER TABLE `epan_config` AUTO_INCREMENT=25;

-- ----------------------------
-- Auto increment value for `experience`
-- ----------------------------
ALTER TABLE `experience` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `filestore_file`
-- ----------------------------
ALTER TABLE `filestore_file` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `filestore_image`
-- ----------------------------
ALTER TABLE `filestore_image` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `filestore_type`
-- ----------------------------
ALTER TABLE `filestore_type` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `filestore_volume`
-- ----------------------------
ALTER TABLE `filestore_volume` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `follower_task_association`
-- ----------------------------
ALTER TABLE `follower_task_association` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `installed_application`
-- ----------------------------
ALTER TABLE `installed_application` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for `item`
-- ----------------------------
ALTER TABLE `item` AUTO_INCREMENT=16;

-- ----------------------------
-- Auto increment value for `item_department_association`
-- ----------------------------
ALTER TABLE `item_department_association` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `item_department_consumption`
-- ----------------------------
ALTER TABLE `item_department_consumption` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `item_image`
-- ----------------------------
ALTER TABLE `item_image` AUTO_INCREMENT=35;

-- ----------------------------
-- Auto increment value for `item_template_design`
-- ----------------------------
ALTER TABLE `item_template_design` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `jobcard`
-- ----------------------------
ALTER TABLE `jobcard` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `jobcard_detail`
-- ----------------------------
ALTER TABLE `jobcard_detail` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `landingresponse`
-- ----------------------------
ALTER TABLE `landingresponse` AUTO_INCREMENT=803;

-- ----------------------------
-- Auto increment value for `lead`
-- ----------------------------
ALTER TABLE `lead` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `lead_category_association`
-- ----------------------------
ALTER TABLE `lead_category_association` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `ledger`
-- ----------------------------
ALTER TABLE `ledger` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `lodgement`
-- ----------------------------
ALTER TABLE `lodgement` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `marketingcampaign_socialconfig`
-- ----------------------------
ALTER TABLE `marketingcampaign_socialconfig` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `marketingcampaign_socialpostings`
-- ----------------------------
ALTER TABLE `marketingcampaign_socialpostings` AUTO_INCREMENT=26;

-- ----------------------------
-- Auto increment value for `marketingcampaign_socialpostings_activities`
-- ----------------------------
ALTER TABLE `marketingcampaign_socialpostings_activities` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `marketingcampaign_socialusers`
-- ----------------------------
ALTER TABLE `marketingcampaign_socialusers` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `marketingcategory`
-- ----------------------------
ALTER TABLE `marketingcategory` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `opportunity`
-- ----------------------------
ALTER TABLE `opportunity` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `order_item_departmental_status`
-- ----------------------------
ALTER TABLE `order_item_departmental_status` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `outsource_party`
-- ----------------------------
ALTER TABLE `outsource_party` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `payment_gateway`
-- ----------------------------
ALTER TABLE `payment_gateway` AUTO_INCREMENT=34;

-- ----------------------------
-- Auto increment value for `point_system`
-- ----------------------------
ALTER TABLE `point_system` AUTO_INCREMENT=324;

-- ----------------------------
-- Auto increment value for `post`
-- ----------------------------
ALTER TABLE `post` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `post_email_association`
-- ----------------------------
ALTER TABLE `post_email_association` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `project`
-- ----------------------------
ALTER TABLE `project` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `projectcomment`
-- ----------------------------
ALTER TABLE `projectcomment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `publish_schedule`
-- ----------------------------
ALTER TABLE `publish_schedule` AUTO_INCREMENT=62;

-- ----------------------------
-- Auto increment value for `qsp_detail`
-- ----------------------------
ALTER TABLE `qsp_detail` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `qsp_detail_attachment`
-- ----------------------------
ALTER TABLE `qsp_detail_attachment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `qsp_master`
-- ----------------------------
ALTER TABLE `qsp_master` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `qualification`
-- ----------------------------
ALTER TABLE `qualification` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `quantity_condition`
-- ----------------------------
ALTER TABLE `quantity_condition` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `quantity_set`
-- ----------------------------
ALTER TABLE `quantity_set` AUTO_INCREMENT=43;

-- ----------------------------
-- Auto increment value for `rule-options`
-- ----------------------------
ALTER TABLE `rule-options` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `rules`
-- ----------------------------
ALTER TABLE `rules` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `schedule`
-- ----------------------------
ALTER TABLE `schedule` AUTO_INCREMENT=14;

-- ----------------------------
-- Auto increment value for `shipping_association`
-- ----------------------------
ALTER TABLE `shipping_association` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `shipping_rule`
-- ----------------------------
ALTER TABLE `shipping_rule` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `shipping_rule_row`
-- ----------------------------
ALTER TABLE `shipping_rule_row` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `socialuser`
-- ----------------------------
ALTER TABLE `socialuser` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `state`
-- ----------------------------
ALTER TABLE `state` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `store_transaction`
-- ----------------------------
ALTER TABLE `store_transaction` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `store_transaction_row`
-- ----------------------------
ALTER TABLE `store_transaction_row` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `supplier`
-- ----------------------------
ALTER TABLE `supplier` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `support_ticket`
-- ----------------------------
ALTER TABLE `support_ticket` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `task`
-- ----------------------------
ALTER TABLE `task` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `task_attachment`
-- ----------------------------
ALTER TABLE `task_attachment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `taxation`
-- ----------------------------
ALTER TABLE `taxation` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `taxation_association`
-- ----------------------------
ALTER TABLE `taxation_association` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `taxation_rule`
-- ----------------------------
ALTER TABLE `taxation_rule` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `taxation_rule_row`
-- ----------------------------
ALTER TABLE `taxation_rule_row` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `team_project_association`
-- ----------------------------
ALTER TABLE `team_project_association` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `ticket_attachment`
-- ----------------------------
ALTER TABLE `ticket_attachment` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `timesheet`
-- ----------------------------
ALTER TABLE `timesheet` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `tnc`
-- ----------------------------
ALTER TABLE `tnc` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `user`
-- ----------------------------
ALTER TABLE `user` AUTO_INCREMENT=29;

-- ----------------------------
-- Auto increment value for `xepan_template`
-- ----------------------------
ALTER TABLE `xepan_template` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `xmarketingcampaign_googlebloggerconfig`
-- ----------------------------
ALTER TABLE `xmarketingcampaign_googlebloggerconfig` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `xshop_item_images`
-- ----------------------------
ALTER TABLE `xshop_item_images` AUTO_INCREMENT=1;
