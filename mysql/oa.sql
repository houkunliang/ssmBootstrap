/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50612
Source Host           : 192.168.0.116:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2017-12-22 13:40:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for leaving_message
-- ----------------------------
DROP TABLE IF EXISTS `leaving_message`;
CREATE TABLE `leaving_message` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `RESOURCES_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of leaving_message
-- ----------------------------

-- ----------------------------
-- Table structure for stbl_menu
-- ----------------------------
DROP TABLE IF EXISTS `stbl_menu`;
CREATE TABLE `stbl_menu` (
  `MENU_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `PARENT_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MENU_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `MENU_LINK` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应链接',
  `ICON` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图标',
  `REMARK` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT '是否删除',
  `MENU_ORDER` int(8) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stbl_menu
-- ----------------------------
INSERT INTO `stbl_menu` VALUES ('05b4eb34e2ae4a97a757a275849efb0a', '60913f8447be4a3e96e2fa09cdfaddd8', '组织机构', 'function/region/box', '', '', null, null, '1484723204', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '2');
INSERT INTO `stbl_menu` VALUES ('394efdff9b60492592151e013bfa3a0e', 'e6b2c3bab61f49388155a682d97e10d9', '模板管理', 'function/template/box', '', '', null, null, '1490841479', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '0');
INSERT INTO `stbl_menu` VALUES ('3bd684f5ca5d48099815c7c942509757', '0', '公告管理', '1', 'fa fa-wifi', null, null, null, '1513675751', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '20');
INSERT INTO `stbl_menu` VALUES ('40f43140b7da40c7b7dddfb1c581bb8a', '60913f8447be4a3e96e2fa09cdfaddd8', '角色权限', 'function/role/box', '', '', '1484723204', 'a5585ca87f00000122d555b2272b0fb7', '1484723204', 'a5585ca87f00000122d555b2272b0fb7', 'N', '5');
INSERT INTO `stbl_menu` VALUES ('50fbf586ad09481b9398fb981dab0476', '60913f8447be4a3e96e2fa09cdfaddd8', '测试菜单', 'function/test/box', '', '111', null, null, '1513588530', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '0');
INSERT INTO `stbl_menu` VALUES ('51a1232ae9bd45b9a608cd5513aa10b8', '60913f8447be4a3e96e2fa09cdfaddd8', '菜单设置', 'function/menu/box', '', '', null, null, '1484723204', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '1');
INSERT INTO `stbl_menu` VALUES ('60913f8447be4a3e96e2fa09cdfaddd8', '0', '系统设置', '1', 'fa fa-cogs', '', '1484723204', 'a5585ca87f00000122d555b2272b0fb7', '1484723204', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '2');
INSERT INTO `stbl_menu` VALUES ('6836694dee9443dea422bcd85db4b753', '0', '资源管理', '0', 'fa fa-folder-o', '1', null, null, '1491045740', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '4');
INSERT INTO `stbl_menu` VALUES ('6dab502e08a6442289963f7b4d1f9ddb', 'e6b2c3bab61f49388155a682d97e10d9', '导入用户数据', 'function/resume/import', '', '', null, null, '1508140370', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '0');
INSERT INTO `stbl_menu` VALUES ('775c6d8410c74a01b7078e119f37fa7a', 'cce0eabd1cbc4b82883e7c1698fffd23', '首页四大模块管理', 'function/forDiv/box', '', '', null, null, '1509437956', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '4');
INSERT INTO `stbl_menu` VALUES ('7f4d5d1b245b4593bb052ea0db5ff927', '0', '预备党员管理', '11111', 'fa fa-drivers-license-o', '', null, null, '1508227306', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '11');
INSERT INTO `stbl_menu` VALUES ('a21ccdc1ba4947909ce80821175a6d2b', '60913f8447be4a3e96e2fa09cdfaddd8', '用户设置', 'function/account/box', '', '', '1484723204', 'a5585ca87f00000122d555b2272b0fb7', '1484723204', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '5');
INSERT INTO `stbl_menu` VALUES ('aa82529500ba4ea4857764a48c96350f', '0', '工作统计', 'HOME', 'fa fa-bar-chart-o', '1', null, null, '1489734964', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '0');
INSERT INTO `stbl_menu` VALUES ('ad3d2439753f4c6f863e8478b910660c', '7f4d5d1b245b4593bb052ea0db5ff927', '入党流程管理', 'function/processNode/box', '', '', null, null, '1508227410', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '0');
INSERT INTO `stbl_menu` VALUES ('b2749d3a31a24689b674f9d16eaef86b', 'cce0eabd1cbc4b82883e7c1698fffd23', 'banner图设置', 'function/msg_banner/box', '', '', null, null, '1509086564', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '2');
INSERT INTO `stbl_menu` VALUES ('cce0eabd1cbc4b82883e7c1698fffd23', '0', '信息发布', ' ', 'fa fa-internet-explorer', '', null, null, '1489397683', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '3');
INSERT INTO `stbl_menu` VALUES ('d2677b23fcae4db3a858925eb520ff01', '3bd684f5ca5d48099815c7c942509757', '公告发布', 'function/bulletin/box', null, null, null, null, '1513675983', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '0');
INSERT INTO `stbl_menu` VALUES ('d3faf19b9a074e33aa8725a3174b1e65', '60913f8447be4a3e96e2fa09cdfaddd8', '数据字典', 'function/dictionary/box', '', '', null, null, '1488965988', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '10');
INSERT INTO `stbl_menu` VALUES ('e436579050bb40cc9d4b3f3921d7ba0a', 'cce0eabd1cbc4b82883e7c1698fffd23', '信息管理', 'function/msg/box', '', '', null, null, '1489397776', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '0');
INSERT INTO `stbl_menu` VALUES ('e6b2c3bab61f49388155a682d97e10d9', '0', '题库模板', '1', 'fa fa-clipboard', '啊', null, null, '1491045529', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '5');
INSERT INTO `stbl_menu` VALUES ('e74f0ff44fae496e94c7ecbe3e92c893', 'e6b2c3bab61f49388155a682d97e10d9', '题库管理', 'function/question/box', '', '4', null, null, '1492674604', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '2');
INSERT INTO `stbl_menu` VALUES ('ee7c30a32f324b3dbbbc8ce33229f2c1', '6836694dee9443dea422bcd85db4b753', '资源列表', 'function/resources/box', '', '', '1484723204', 'a5585ca87f00000122d555b2272b0fb7', '1489730255', '3c376bb33b1d43128f3785c5d214cd5e', 'Y', '6');
INSERT INTO `stbl_menu` VALUES ('f23f7f6d060b4889b0f26d3de7742723', '3bd684f5ca5d48099815c7c942509757', '通知', 'function/notice/box', null, null, null, null, '1513676108', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '2');
INSERT INTO `stbl_menu` VALUES ('f4bf84cef7bf465096aae50130a9f3de', '3bd684f5ca5d48099815c7c942509757', '内部刊物', 'function/publication/box', null, null, null, null, '1513676054', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '1');

-- ----------------------------
-- Table structure for stbl_pri_manger
-- ----------------------------
DROP TABLE IF EXISTS `stbl_pri_manger`;
CREATE TABLE `stbl_pri_manger` (
  `MGR_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `MGR_NAME` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `MGR_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ORG_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `END_DATE` int(16) DEFAULT '0',
  `START_DATE` int(16) DEFAULT '0',
  `STOP` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `LOGIN_TIMES` decimal(20,0) DEFAULT NULL,
  `LAST_LOGIN_DATE` int(16) DEFAULT '0',
  `LOGIN_DATE` int(16) DEFAULT '0',
  `GRANT_TYPE` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '01',
  `IS_SUPER` decimal(8,0) DEFAULT '0',
  `STATUS` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `REMARK` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_DT` int(16) DEFAULT '0',
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT '0',
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VERSION` decimal(8,0) NOT NULL DEFAULT '1',
  `MAIL` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MOBILE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEX` varchar(4) COLLATE utf8_unicode_ci DEFAULT '0',
  `FPHONE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDRESS` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BIRTH` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MARRIAGE` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDIN_IMG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MGR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stbl_pri_manger
-- ----------------------------
INSERT INTO `stbl_pri_manger` VALUES ('a5585ca87f00000122d555b2272b0fb7', 'admin', '超级管理员', '0', null, '354F34B87BFB4282FDF9F0EA5B35E3A7', null, null, '1', null, '1484723504', '1484723204', '01', '1', '1', null, '1484723704', 'admin', '1484723420', '0', 'N', '14', null, null, '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for stb_button_role
-- ----------------------------
DROP TABLE IF EXISTS `stb_button_role`;
CREATE TABLE `stb_button_role` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_button_role
-- ----------------------------
INSERT INTO `stb_button_role` VALUES ('03580d69bae54bf6a801bac42b663ecc', '123', '99811');
INSERT INTO `stb_button_role` VALUES ('0f4cfd9182fb4f078b7a5b7dc2b965af', '94e19355971e4a45b9660008627e4304', '99811');
INSERT INTO `stb_button_role` VALUES ('0ff45d2d8f7d45bdb78dd99e9c8c8674', '122', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_button_role` VALUES ('2c898321e50842358745b5a464772d85', '3dd7803769854d69b69fc59899ebafe9', '22b19b4e9f704c4c82d430bf0a9e535b');
INSERT INTO `stb_button_role` VALUES ('2d8df64271754ed689b3d99294561fa5', 'f94625177c574bd0863acedfa01cd404', '94de8aab0c624f47af5460f261201a3b');
INSERT INTO `stb_button_role` VALUES ('2fbd463f237d4bdb9473fc7831611fa4', '121', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_button_role` VALUES ('3745d085d8b94cfe8bc60fa00e0ad1b4', '94e19355971e4a45b9660008627e4304', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_button_role` VALUES ('43fc7640cb5744c9820ac3f61110c85c', '121', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_button_role` VALUES ('520c957495254b09a4acf5047670cd42', '122', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_button_role` VALUES ('537834dacb674d5c8fea3706ad496c03', '3ec106bfdf0f488aab864e05ff30d045', '22b19b4e9f704c4c82d430bf0a9e535b');
INSERT INTO `stb_button_role` VALUES ('5ca5a2d883284d2d83004a9982622104', '94e19355971e4a45b9660008627e4304', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_button_role` VALUES ('6172ead6dc0e4e52a6a44e07062545dd', 'f94625177c574bd0863acedfa01cd404', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_button_role` VALUES ('6202177a26a241ebbb9820e78a05d077', '94e19355971e4a45b9660008627e4304', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_button_role` VALUES ('7738c7c7bea3497ea4991289fe68761a', '121', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_button_role` VALUES ('8882443aa1fe4153878ba25c58b68433', '123', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_button_role` VALUES ('9455fc789c9f44499bea82c074c491ee', '122', '99811');
INSERT INTO `stb_button_role` VALUES ('9999731a56ac4a919f18d76f30018ff4', '121', '99811');
INSERT INTO `stb_button_role` VALUES ('a57bf9cc000b43679e81cc373b6db8ee', '3ec106bfdf0f488aab864e05ff30d045', 'c6fb84b3914b44cdbb3219b1be2fd839');
INSERT INTO `stb_button_role` VALUES ('ace54c71573e4f44816a33ea2778cb7c', '3dd7803769854d69b69fc59899ebafe9', 'c6fb84b3914b44cdbb3219b1be2fd839');
INSERT INTO `stb_button_role` VALUES ('b044467e96bc4e91ab6fccdce1927147', '121', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_button_role` VALUES ('b6cad707539a4d7eaa78733ebf2473d8', 'c174f06615e6473980a82a06997ede76', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_button_role` VALUES ('bd29b4da7d3f4f4094dd696b561376f9', '123', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_button_role` VALUES ('c029073ce40d4f8ba0631ac39eaf2305', '123', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_button_role` VALUES ('c4b729052d0b4704948860bf15fd1780', '122', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_button_role` VALUES ('c62d10d276884bf98c58876ad951649b', 'b222bcdf6126478a9a515a66329be131', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_button_role` VALUES ('cd12d08c90c048b7a816d4471f77db97', '122', '517567038d654fc5bc4d32b8ab9cc6c6');
INSERT INTO `stb_button_role` VALUES ('cdf2260a92104f73a8db55c9b5e45049', 'b222bcdf6126478a9a515a66329be131', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_button_role` VALUES ('d1c1b0723ed24cbe85f7a0e713f58249', 'f94625177c574bd0863acedfa01cd404', '747a271b604d49419394f060c0260030');
INSERT INTO `stb_button_role` VALUES ('d25379ef238f44a1bb4e7073a7be5bb0', 'f94625177c574bd0863acedfa01cd404', 'c0e7c887f354479fa6150cbc9e7cb02f');
INSERT INTO `stb_button_role` VALUES ('e27bd0e64e124a57bef407ab42d2c7ed', '123', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_button_role` VALUES ('e90757729f5c43889d683583eae82dfd', 'c174f06615e6473980a82a06997ede76', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_button_role` VALUES ('ec39e7d47d034afa9af76bc13a8a2733', 'f94625177c574bd0863acedfa01cd404', '7f9b2e8b64014adf91c3f00312e8f74b');
INSERT INTO `stb_button_role` VALUES ('ef03e3fc82844b0b8461c41d6a037aa7', 'b222bcdf6126478a9a515a66329be131', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_button_role` VALUES ('effcf7a5999548519e8ac073eb0f355f', 'c174f06615e6473980a82a06997ede76', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_button_role` VALUES ('fd34b8a9232b42768ee399e08b48f38b', '122', '4d5ef2e72b66484785d7a6a83a81a570');

-- ----------------------------
-- Table structure for stb_department
-- ----------------------------
DROP TABLE IF EXISTS `stb_department`;
CREATE TABLE `stb_department` (
  `DP_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARENT_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT '0',
  `DP_NAME` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REMARK` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`DP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_department
-- ----------------------------
INSERT INTO `stb_department` VALUES ('1', '121312312', '软件一部', 'sf', null, null, '1488445550', '1', 'N');
INSERT INTO `stb_department` VALUES ('12', '121312312', '软件二部', 'sf', null, null, '1488445550', '1', 'N');
INSERT INTO `stb_department` VALUES ('121312312', '0', '软件部', 'sf', null, null, '1488445550', '1', 'N');
INSERT INTO `stb_department` VALUES ('2', '0', '销售部门', 'sa', null, null, '1488445550', '1', 'N');
INSERT INTO `stb_department` VALUES ('3', '2', '销售一部', 'w', null, null, '1488445550', '1', 'N');
INSERT INTO `stb_department` VALUES ('4', '2', '销售2部', 'fa', null, null, '1488445550', '1', 'N');

-- ----------------------------
-- Table structure for stb_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `stb_dictionary`;
CREATE TABLE `stb_dictionary` (
  `SD_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键 ',
  `TYPE_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '数据类型代码',
  `TYPE_NAME` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '数据类型名称',
  `CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '数据代码',
  `NAME` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '数据名称',
  `DESCRIPTION` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据描述',
  `ORD_NO` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `UPDATED_DT` int(16) DEFAULT NULL COMMENT '修改时间',
  `UPDATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT '是否删除',
  `REMARK` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `VERSION` int(11) NOT NULL DEFAULT '1' COMMENT '版本',
  `ISEXPIRED` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT '是否失效',
  PRIMARY KEY (`SD_ID`),
  KEY `TYPE_CODE` (`TYPE_CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_dictionary
-- ----------------------------
INSERT INTO `stb_dictionary` VALUES ('05c04083b0824c1fa393338b8c908c7b', 'SALARYEXP', '期望薪资', '2000以下', '2000以下', '2000以下', '3', '1492779994', null, '1492760430', null, 'N', '3', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('0e8b36c758dc4956935b1fd4d4974b88', 'ROLE_LEVEL', '职位等级', '3', '副总经理', '3', '3', '1492001528', null, '1492001483', null, 'N', '3', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('0fa461273e1645598c62b84dab328f20', 'STATS_TYPE', '统计类型', 'column', '条形统计图', '2', '2', '1489976137', null, '1489587254', null, 'N', '2', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('11109d9ca3744a8ba583e9ddd361d2b3', 'JOIN_THE_PRETY', '入党流程', '2', '入党积极分子，预备党员考察登记表', '2', '2', null, null, '1508220919', null, 'N', '2', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('146868bdff904ec99b56070a4d487bb2', 'POLITICAL', '政治面貌', '党员', '党员', '党员', '6', '1492779957', null, '1492758004', null, 'N', '06', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('158dd5dbc9ea467cb3e70aecb33ad035', 'INSTALLMENT_TYPE', '分期付款类型', '6_12', '6_12', '6 12', '1', '1494325236', '', '1494325066', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('248ff0e4e82149dea8d609b6a9340991', 'JOIN_THE_PRETY', '入党流程', '1', '入党积极分子呈报表', '1', '1', null, null, '1508220824', null, 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('2733d9a5556846c4a7d74350c7e6a979', 'DIRECTION', '方向', 'UI设计', 'UI设计', '1', '3', null, '', '1494400184', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('2a18b2a05846417680eee75157db02f0', 'ROLE_LEVEL', '职位等级', '2', '主管', '2', '2', '1492001439', null, '1492001420', null, 'N', '描述', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('2ac7095295124c639e30cf9216a99d95', 'POLITICAL', '政治面貌', '群众', '群众', '群众', '3', '1492779940', null, '1492757826', null, 'N', '03', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('3168d4081b56437fb0aab36b25cd8f07', 'RESUME_SOURCE', '简历来源', '05', '赶集网', '123', '5', null, null, '1492123940', null, 'N', '123', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('331c41a6ff6a48a499136429a4ca7222', 'APP_DATA', '应用代码', 'APP03', 'TEST11', 'TEST', '3', '1490346853', null, '1489391110', null, 'N', 'TEST', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('34b0d194521d4e82a0c2704da1b8188c', 'JOIN_THE_PRETY', '入党流程', '9', '上级党委关于发展对象的预审意见', '9', '9', null, null, '1508222437', null, 'N', '9', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('34c27ebe65f84038ac462106c0492582', 'ROLE_LEVEL', '职位等级', '1', '组长', '1', '1', '1492001346', null, '1492001194', null, 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('35bd33322cfe4d61a805bd0c7282b7f4', 'SALARYEXP', '期望薪资', '5001-6000', '5001-6000', '5001-6000', '6', '1492780013', null, '1492760593', null, 'N', '6', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('35d7a9ec57bc4eb3a8504fe7cb0d7cb4', 'SALARYEXP', '期望薪资', '8001-10000', '8001-10000', '8001-10000', '9', '1492780023', null, '1492760687', null, 'N', '9', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('36aefbe88e2d4eb29b5367166656f4ce', 'EDUCATION', '学历', '高中', '高中', '高中', '8', '1492779898', null, '1492757328', null, 'N', '8', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('378089b668074503a274326ebf161542', 'JOIN_THE_PRETY', '入党流程', '15', '关于审批中共正式党员的请示', '15', '15', null, null, '1508222857', null, 'N', '15', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('44b42dc37d9e4c828e86756640d3f1bb', 'POLITICAL', '政治面貌', '预备党员', '预备党员', '预备党员', '5', '1492779951', null, '1492757930', null, 'N', '05', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('453450839e964b979ba834a83bcb6030', 'SALARYEXP', '期望薪资', '2001-3000', '2001-3000', '2001-3000', '4', '1492780003', null, '1492760505', null, 'N', '4', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('47b93f804ee044fd8eff3387f12fe3fe', 'RESUME_SOURCE', '简历来源', '04', '百姓网', '1212', '4', null, null, '1492123815', null, 'N', '12', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('4d3651e2612a4d27afc53bdada5f5106', 'TEST_UPDATE', '测试修改', '01', '测试修改时间', '测试咯', '2', '1489389029', null, '1489142070', null, 'N', '测试备注', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('5204bfd596c24875bd063bda6af5dd71', 'RESUMETYPE', '简历类型', '兼职', '兼职', '兼职', '4', '1492780050', null, '1492765093', null, 'N', '4', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('5c7bba18819143dba27eaf7ff555dd69', 'EDUCATION', '学历', '本科', '本科', '本科', '4', '1492779871', null, '1492756732', null, 'N', '4', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('649fbabb216d4161b9ce254fcc1fb06f', 'INSTALLMENT_TYPE', '分期付款类型', '6_18', '6_18', '6 18', '2', '1494326097', '', '1494325095', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('65dd2b61808e47088a959e7095c07d8f', 'RESIDENCE', '户籍', '农村', '农村', '农村', '5', '1492779962', null, '1492757656', null, 'N', '5', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('6a1d2b13272442f8ad6fc7706697f3fe', 'APP_DATA', '应用代码', 'APP05', '测试重复数据', '测试添加重复111', '3', '1490346315', null, '1489390614', null, 'N', '测试添加重复数据', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('6b47e19b64dc4d5aa248b66321e7fab2', 'JOIN_THE_PRETY', '入党流程', '16', '上级党委关于审批中共正式党员的批复意见', '16', '16', null, null, '1508222929', null, 'N', '16', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('6c139c784fe541d1babd22d168ea2dfb', 'JOIN_THE_PRETY', '入党流程', '13', '转正申请', '13', '13', null, null, '1508222742', null, 'N', '13', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('6d4a7e11ecb941b8af71b02a46f13b81', 'RESUME_SOURCE', '简历来源', '01', '智联招聘', '智联招聘', '0', '1490346338', null, '1490346092', null, 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('7243e110fce749b88b15b2b93e1a36d6', 'RESUME_SOURCE', '简历来源', '00', '未知来源', '简历来源', '0', '1492042982', null, '1492042944', null, 'N', '简历来源', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('76780c17ee674e3995a6af5ace510ba0', 'EDUCATION', '学历', '研究生', '研究生', '研究生', '3', '1492779864', null, '1492756670', null, 'N', '5', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('7844fc7639cb4eaebad64d53f7fcf09a', 'DIRECTION', '方向', '次世代', '次世代', '游戏', '1', null, '', '1494400109', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('79980738c3454e69a0b3086b2d2a90f4', 'RESIDENCE', '户籍', '城镇', '城镇', '城镇', '6', '1492779974', null, '1492757691', null, 'N', '06', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('79cf7bdbd9d34cc78780dce49538a404', 'APP_DATA', '应用代码', 'APP04', '测试数据咯', '测试数据重复添加', '4', '1489394710', null, '1489390811', null, 'N', '测试数据重复添加', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('7f5244bc2e444c789d2edcd31b65a563', 'JOIN_THE_PRETY', '入党流程', '8', '关于发展情况的预审请示', '8', '8', null, null, '1508222374', null, 'N', '8', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('83019233bb0c48ad813216ec0ea3a906', 'APP_DATA', '应用代码', 'APP02', 'test的测试咯', '飞洒解放路', '3', '1491808143', null, '1489391355', null, 'N', '就放了撒酒疯连锁店', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('83e5e9af559e4e3e83e74c288f41fc8e', 'INSTALLMENT_COM', '签约公司', '分期乐', '分期乐', '1', '2', null, '', '1494401335', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('8cdf69016ca84741b6f06d67c260ae83', 'DIRECTION', '方向', 'PHP', 'PHP', '25', '4', null, '', '1494400214', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('8f2e105c52d04a9a9239eb233ef5d18c', 'JOIN_THE_PRETY', '入党流程', '4', '发展对象申报表', '4', '4', null, null, '1508221188', null, 'N', '4', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('91568494e45a49bb802e22d94248c493', 'JOIN_THE_PRETY', '入党流程', '5', '政治审查情况报表', '5', '5', null, null, '1508221231', null, 'N', '5', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('9537ebd48c674e15b30f531f53117d8b', 'JOIN_THE_PRETY', '入党流程', '0', '入党申请书', '1', '0', '1508219907', null, '1508219878', null, 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('959ced4281d74174bea933038b10ade1', 'STATS_TYPE', '统计类型', 'cake', '扇形统计图', '1', '1', '1489975750', null, '1489587216', null, 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('96ffd1a99ed9443a8003034a735d787b', 'SALARYEXP', '期望薪资', '3001-5000', '3001-5000', '3001-5000', '5', '1492780009', null, '1492760545', null, 'N', '5', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('9779aeb8e18842ad87b3ed799417cbc5', 'ROLE_LEVEL', '职位等级', '4', '总经理', '4', '4', '1492001532', null, '1492001508', null, 'N', '4', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('98b3903c55d5445e9609de8ce1c12944', 'EDUCATION', '学历', '中专', '中专', '中专', '7', '1492779886', null, '1492757207', null, 'N', '7', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('9f4531cbf9124670b3ca0f4f444e3a8e', 'JOIN_THE_PRETY', '入党流程', '11', '关于发展预备党员的请示', '11', '11', null, null, '1508222554', null, 'N', '11', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('a15f30d46a4b4d0db7f79d32648692ec', 'JOIN_THE_PRETY', '入党流程', '3', '思想汇报工作', '3', '3', null, null, '1508220954', null, 'N', '3', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('a82bede5a87b4593a0f3d7753acc072b', 'RESUME_SOURCE', '简历来源', '03', '中华英才网', '中华英才网', '2', null, null, '1490346488', null, 'N', '0', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('aec687e37657443286a2ab57f3910ebf', 'GENDER', '性别', '01', '男', '男', '3', null, null, '1492757495', null, 'N', '3', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('b1701234abb54be7b29351724c7727b9', 'GENDER', '性别', '02', '女', '女', '4', null, null, '1492757527', null, 'N', '4', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('b5dcfc03b4914fb3b2b767361db8af6b', 'TEST-TYPE', '测试类型', '01', '测试', '测试', '0', null, null, '1491808386', null, 'N', '备注', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('b7830ae8504b4792ac456e945049c57a', 'JOIN_THE_PRETY', '入党流程', '14', '预备党员转正公示情况登记表', '14', '14', null, null, '1508222792', null, 'N', '14', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('bc6e0df80e8444e184979518deeefa74', 'STATS_TYPE', '统计类型', 'leftCharts', '左边栏目统计功能区域', '1', '6', '1489976409', null, '1489976287', null, 'N', '..', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('bfc3ef2160ba484ebc0866d4455460c6', 'RESUME_SOURCE', '简历来源', '02', '58同城', '58同城', '1', '1490346814', null, '1490346305', null, 'N', '0', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('bfd230e6f4514f44a6133b2a68a8df32', 'RESUMETYPE', '简历类型', '全职', '全职', '全职', '3', '1492780045', null, '1492765073', null, 'N', '3', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('c2c5c098e17c4fc4a9b7daa70d67422a', 'DIRECTION', '方向', 'WEB', 'WEB', '12', '5', null, '', '1494400250', '', 'N', '0', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('c30f75e7cc64457e9c888586cf05ca3c', 'JOIN_THE_PRETY', '入党流程', '6', '发展对象情况登记表', '6', '6', null, null, '1508222247', null, 'N', '6', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('c8ebf16bd62c475292e930cb8c3beb6a', 'EDUCATION', '学历', '大专', '大专', '大专', '5', '1492779879', null, '1492757049', null, 'N', '5', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('cb9d59e566194cff89bc06a513359330', 'INSTALLMENT_COM', '签约公司', '百度钱包', '百度钱包', '1', '2', null, '', '1494401362', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('cdd35d607a404b4db6076837d4052a93', 'APP_DATA', '应用代码', 'APP07', 'TESS', '嘿嘿', '4', '1489400514', null, '1489392222', null, 'N', 'TEST', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('d0f548881b76482f8cbce9b9403785ee', 'POLITICAL', '政治面貌', '团员', '团员', '团员', '4', '1492779946', null, '1492757880', null, 'N', '4', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('d69f834a4e24455ebd40137ffb826698', 'MARITAL', '婚姻状况', '已婚', '已婚', '已婚', '4', '1492779930', null, '1492758264', null, 'N', '04', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('dad78bdfeb824e959b8e5dcbc9eaac73', 'JOIN_THE_PRETY', '入党流程', '10', '入党志愿书', '10', '10', null, null, '1508222511', null, 'N', '10', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('de38c0927be34e98bac6801c0980e40c', 'INSTALLMENT_COM', '签约公司', '宜信', '宜信', '1', '1', null, '', '1494401295', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('e39d4f3218c14cfca562f2dd7b2d0ce9', 'ROLE_LEVEL', '职位等级', '0', '普通员工', '0', '0', '1492004523', null, '1492001147', null, 'N', '0', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('e5bad2f4f22742f69c56ab3cd1ce49e9', 'MARITAL', '婚姻状况', '未婚', '未婚', '未婚', '3', '1492779923', null, '1492758220', null, 'N', '03', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('ec4c2cf81a1e469b869747556e5869c6', 'SALARYEXP', '期望薪资', '6001-8000', '6001-8000', '6001-8000', '7', '1492780018', null, '1492760639', null, 'N', '7', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('f0e3fc3a9ecb420d81ac65ceeef0423f', 'STATS_TYPE', '统计类型', 'line', '线形统计图', '0', '0', '1489976145', null, '1489587071', null, 'N', '0', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('f402a34ede0f401c9ba514ee2fd764be', 'JOIN_THE_PRETY', '入党流程', '7', '发展对象公示情况登记表', '7', '7', null, null, '1508222294', null, 'N', '7', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('fc26246b6f464b0eaef95247503245b0', 'DICTIONARY', '数据字典', '04', '写错符号咯', '呵呵', '4', '1489389211', null, null, null, 'N', '11111', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('fd9efaebd98d41d592772e4a49f6f242', 'DIRECTION', '方向', '3D建模', '3D建模', '1', '1', null, '', '1494400151', '', 'N', '1', '1', 'N');
INSERT INTO `stb_dictionary` VALUES ('ff9b9cbba6bf464b8a562f0f462d679d', 'JOIN_THE_PRETY', '入党流程', '12', '上级党委关于发展预备党员的批复意见', '12', '12', null, null, '1508222710', null, 'N', '12', '1', 'N');

-- ----------------------------
-- Table structure for stb_message_notify
-- ----------------------------
DROP TABLE IF EXISTS `stb_message_notify`;
CREATE TABLE `stb_message_notify` (
  `MSG_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `MSG_BODY` text COLLATE utf8_unicode_ci COMMENT '内容',
  `MSG_TYPE` varchar(4) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '消息类型0：系统 1.通知 2.公告',
  `MSG_TITLE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消息标题',
  `MSG_STATUS` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消息状态',
  `UPDATED_DT` int(16) DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人ID',
  `CREATED_DT` int(16) DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发送人ID',
  `REMARK` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `IS_DELETED` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'N',
  `VERSION` int(8) DEFAULT '0' COMMENT '版本',
  `IS_COMPLETE` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '是否完成',
  PRIMARY KEY (`MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_message_notify
-- ----------------------------

-- ----------------------------
-- Table structure for stb_message_user
-- ----------------------------
DROP TABLE IF EXISTS `stb_message_user`;
CREATE TABLE `stb_message_user` (
  `MSG_USER_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `FK_MSG_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联消息通知表ID',
  `FK_USER_ID` text COLLATE utf8_unicode_ci COMMENT '关联被发送人ID',
  `UPDATED_DT` int(16) DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人ID',
  `CREATED_DT` int(16) DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发送人ID',
  `REMARK` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `IS_DELETED` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'N',
  `VERSION` int(8) DEFAULT '0' COMMENT '版本',
  PRIMARY KEY (`MSG_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_message_user
-- ----------------------------

-- ----------------------------
-- Table structure for stb_ord_user
-- ----------------------------
DROP TABLE IF EXISTS `stb_ord_user`;
CREATE TABLE `stb_ord_user` (
  `ORD_USER_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `FK_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联咨询师USER_ID',
  `ORD_ID` int(8) NOT NULL AUTO_INCREMENT COMMENT '排序序号',
  `UPDATED_DT` int(16) DEFAULT NULL COMMENT '更新时间',
  `UPDATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人ID',
  `CREATED_DT` int(16) DEFAULT NULL COMMENT '创建时间',
  `CREATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发送人ID',
  `REMARK` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `IS_DELETED` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'N',
  `VERSION` int(8) DEFAULT '0' COMMENT '版本',
  PRIMARY KEY (`ORD_USER_ID`),
  KEY `ORD_ID` (`ORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_ord_user
-- ----------------------------

-- ----------------------------
-- Table structure for stb_pri_menu_button
-- ----------------------------
DROP TABLE IF EXISTS `stb_pri_menu_button`;
CREATE TABLE `stb_pri_menu_button` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MENU_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_pri_menu_button
-- ----------------------------
INSERT INTO `stb_pri_menu_button` VALUES ('121', '删除权限', '40f43140b7da40c7b7dddfb1c581bb8a', 'deleted', null, null, '11111', '1', 'N');
INSERT INTO `stb_pri_menu_button` VALUES ('122', '新增权限', '40f43140b7da40c7b7dddfb1c581bb8a', 'add', null, null, '11111', '1', 'N');
INSERT INTO `stb_pri_menu_button` VALUES ('123', '修改权限', '40f43140b7da40c7b7dddfb1c581bb8a', 'update', null, null, '11111', '1', 'N');
INSERT INTO `stb_pri_menu_button` VALUES ('94e19355971e4a45b9660008627e4304', '修改权限', 'a21ccdc1ba4947909ce80821175a6d2b', 'update', null, null, '1489571107', '67db5d9043bb4e758b6081696e84418a', 'N');
INSERT INTO `stb_pri_menu_button` VALUES ('b222bcdf6126478a9a515a66329be131', '新增权限', 'a21ccdc1ba4947909ce80821175a6d2b', 'add', '1489492844', '3c376bb33b1d43128f3785c5d214cd5e', '1489474062', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_pri_menu_button` VALUES ('c174f06615e6473980a82a06997ede76', '删除权限', 'a21ccdc1ba4947909ce80821175a6d2b', 'deleted', '1489572115', '67db5d9043bb4e758b6081696e84418a', '1489492748', '3c376bb33b1d43128f3785c5d214cd5e', 'N');

-- ----------------------------
-- Table structure for stb_region
-- ----------------------------
DROP TABLE IF EXISTS `stb_region`;
CREATE TABLE `stb_region` (
  `REGION_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '部门ID',
  `PARENT_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT '0',
  `ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `REMARK` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `REGION_HEADIMG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TELEPHONE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门电话',
  `TYPE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REGION_ORDER` int(8) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_region
-- ----------------------------
INSERT INTO `stb_region` VALUES ('02c7ed42e8dc48df9c5753b8c0c56848', 'fa6d590676394d8cab005e680121e631', '', '国内出港项目党支部', '', null, null, null, '1508122944', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '3');
INSERT INTO `stb_region` VALUES ('05ddef7a606b4d89939cf7e73b0c95f9', 'b7a40cd982274ed88870075b09641282', '', '机关党支部', '', null, null, null, '1508122638', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '0');
INSERT INTO `stb_region` VALUES ('208493a162144ffb9aba86944e85c524', '3d09d818bcf1453b9b80213186597f20', '', '货舱清洁项目支部', '', null, null, null, '1508123141', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '4');
INSERT INTO `stb_region` VALUES ('29d53ee9509c4046a00078f168ef0582', 'b7ee9a72d5f440dcbf60d0c0a618231a', '', '桥载项目党支部', '', null, null, null, '1508123273', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '3');
INSERT INTO `stb_region` VALUES ('3b0ad2c7a09b4f38a6c5e8823a86dd63', 'b7ee9a72d5f440dcbf60d0c0a618231a', '', '维修项目党支部', '', null, null, null, '1508123207', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '1');
INSERT INTO `stb_region` VALUES ('3d09d818bcf1453b9b80213186597f20', 'b7a40cd982274ed88870075b09641282', '', '机坪服务部党总支', '机坪服务部', null, '1508123031', '3c376bb33b1d43128f3785c5d214cd5e', '1491457482', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '17780663384', '1', '3');
INSERT INTO `stb_region` VALUES ('3e0267583e5a49b1828fdf22648cbfb5', 'b7a40cd982274ed88870075b09641282', '', '客运服务部党总支', '客运服务部', null, '1508122766', '3c376bb33b1d43128f3785c5d214cd5e', '1491473397', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '18224470429', '1', '1');
INSERT INTO `stb_region` VALUES ('49c8dd67fffb47b780caf27d1b043610', '3e0267583e5a49b1828fdf22648cbfb5', '', '接登机项目党支部', '', null, null, null, '1508122414', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '2');
INSERT INTO `stb_region` VALUES ('4ac1993a69804e068baf268522bf5d84', 'fa6d590676394d8cab005e680121e631', '', '国际货运党支部', '', null, null, null, '1508122960', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '4');
INSERT INTO `stb_region` VALUES ('55413d2911dc47a389e5c5c9fd8c3f53', 'b7a40cd982274ed88870075b09641282', '', '航班控制中心党支部', '航班控制中心', null, '1508123323', '3c376bb33b1d43128f3785c5d214cd5e', '1493697223', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13987741145', '1', '4');
INSERT INTO `stb_region` VALUES ('62c1384a4119430fa5eb11d71baf681c', '3d09d818bcf1453b9b80213186597f20', '', '特种设备二项目支部', '', null, null, null, '1508123097', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '1');
INSERT INTO `stb_region` VALUES ('63f2724b4a10465eb1225ee6d9abdfeb', '3d09d818bcf1453b9b80213186597f20', '', '特种设备三项目支部', '', null, null, null, '1508123111', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '3');
INSERT INTO `stb_region` VALUES ('7e380ed67024471b8594cfb04998349e', 'fa6d590676394d8cab005e680121e631', '', '装卸党支部', '', null, null, null, '1508122975', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '5');
INSERT INTO `stb_region` VALUES ('87837354556c4c3b9ea61fe0399b7eb0', 'fa6d590676394d8cab005e680121e631', '', '综保项目党支部', '', null, null, null, '1508122825', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '0');
INSERT INTO `stb_region` VALUES ('87c9508180f24dadb9ac2be7690871ec', '3e0267583e5a49b1828fdf22648cbfb5', '', '行李项目党支部', '', null, null, null, '1508122526', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '6');
INSERT INTO `stb_region` VALUES ('8a4f47ad2357499083020120844b602c', '3e0267583e5a49b1828fdf22648cbfb5', '', '结载项目党支部', '', null, null, null, '1508122447', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '3');
INSERT INTO `stb_region` VALUES ('8b2a8a186ffe4848b0659de54781d32b', 'b7ee9a72d5f440dcbf60d0c0a618231a', '', '综合管理项目党支部', '', null, null, null, '1508123182', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '0');
INSERT INTO `stb_region` VALUES ('8bccd011356b4828a04d99ba00a66850', '3e0267583e5a49b1828fdf22648cbfb5', '', '国际客运项目党支部', '', null, null, null, '1508122504', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '5');
INSERT INTO `stb_region` VALUES ('90d6266393ad49f7999092aa66301e6c', '3d09d818bcf1453b9b80213186597f20', '', '特种设备一项目支部', '', null, null, null, '1508123077', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '0');
INSERT INTO `stb_region` VALUES ('9d7e9cb28a9e469b8af55a32612211b9', '3e0267583e5a49b1828fdf22648cbfb5', '', '离岗控制项目党支部', '', null, null, null, '1508122471', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '4');
INSERT INTO `stb_region` VALUES ('a4bb69ee53cc44388ceb745815209ffe', '3e0267583e5a49b1828fdf22648cbfb5', '', '国内值机项目党支部', '', null, null, null, '1508122377', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699658472', '1', '1');
INSERT INTO `stb_region` VALUES ('b7a40cd982274ed88870075b09641282', '0', '双流县', '成都双流国际机场航空服务地面有限公司党委', '16556', '', '1508297850', '3c376bb33b1d43128f3785c5d214cd5e', '1491457400', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '15265486351', '0', '15616');
INSERT INTO `stb_region` VALUES ('b7ee9a72d5f440dcbf60d0c0a618231a', 'b7a40cd982274ed88870075b09641282', '', '机务维修部党总支', '机务维修部', null, '1508122903', '3c376bb33b1d43128f3785c5d214cd5e', '1491533767', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '15464154616', '1', '4');
INSERT INTO `stb_region` VALUES ('be380134c0404de69d887f260edf4db8', 'b7ee9a72d5f440dcbf60d0c0a618231a', '', '勤务项目党支部', '', null, '1508123242', '3c376bb33b1d43128f3785c5d214cd5e', '1508123224', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '2');
INSERT INTO `stb_region` VALUES ('c8d92d15f3da4f66aab56ed4cb38056f', 'b7a40cd982274ed88870075b09641282', '', '车辆维修部党支部', '车辆维修部', null, '1508123297', '3c376bb33b1d43128f3785c5d214cd5e', '1491553224', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '15986556633', '1', '5');
INSERT INTO `stb_region` VALUES ('d9d5021588794e3f9f8ccb6a1eeac45a', 'fa6d590676394d8cab005e680121e631', '', '国内进港项目党支部', '', null, null, null, '1508122853', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '13699574123', '1', '1');
INSERT INTO `stb_region` VALUES ('fa6d590676394d8cab005e680121e631', 'b7a40cd982274ed88870075b09641282', '', '货运服务部党总支', '货运服务部', null, '1508122877', '3c376bb33b1d43128f3785c5d214cd5e', '1491457514', '3c376bb33b1d43128f3785c5d214cd5e', 'N', '15208432356', '1', '2');

-- ----------------------------
-- Table structure for stb_role
-- ----------------------------
DROP TABLE IF EXISTS `stb_role`;
CREATE TABLE `stb_role` (
  `ROLE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色ID',
  `DP_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属部门ID',
  `ROLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `STATUS` varchar(3) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '状态',
  `LEVE` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '的职位等级 具体情况根据数据字典来',
  `REMARK` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_role
-- ----------------------------
INSERT INTO `stb_role` VALUES ('02e43255fb85404d9a488ac9e5159cbf', '49c8dd67fffb47b780caf27d1b043610', '接登机项目部党员', '1', '0', '\n', null, null, '1508142822', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('1215c6b3ab8240e496f2efc9a610ce28', '8b2a8a186ffe4848b0659de54781d32b', '综合管理项目党员', '1', '0', '\n', null, null, '1508142390', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('1e52771429a4498e85f78357da4818a1', 'a4bb69ee53cc44388ceb745815209ffe', '国内值机党员', '1', '0', '\n', null, null, '1508148625', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('29060750a87c4d478d337b6f82392363', '87837354556c4c3b9ea61fe0399b7eb0', '综合项目党员', '1', '0', '\n', null, null, '1508142717', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('31844838c48043d4838cf79fac211c7c', 'b7a40cd982274ed88870075b09641282', '测试oa', '1', '0', '\n', null, null, '1513571772', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('3a48721d840e4f8fad665137448427a2', 'fa6d590676394d8cab005e680121e631', '货运服务部党员', '1', '0', '\n', null, null, '1508144966', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('4d5ef2e72b66484785d7a6a83a81a570', 'b7ee9a72d5f440dcbf60d0c0a618231a', '测试人员', '1', '2', '111', null, null, '1491901972', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('4e9ecd122144441abb436227d5b1f4a8', 'b7ee9a72d5f440dcbf60d0c0a618231a', '机务维修部党员', '1', '0', '\n', null, null, '1508144940', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('5dc8b4c4a6c047fdb0a81ac64f01beb7', '3e0267583e5a49b1828fdf22648cbfb5', '客运服务部党员', '1', '0', '\n', null, null, '1508144976', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('62361d5c487a4940b87b85f4ad09aa27', 'b7a40cd982274ed88870075b09641282', '员工', '1', '0', '\n', null, null, '1513573166', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('6de82d0ad8bb41b98d203d5fc1f42761', '3b0ad2c7a09b4f38a6c5e8823a86dd63', '维修项目党员', '1', '0', '\n', null, null, '1508142372', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('7122b002a88743808b0721dad21ec870', '208493a162144ffb9aba86944e85c524', '客舱清洁项目党员', '1', '0', '\n', null, null, '1508142411', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('826fa71fd0014705a97835bfe77295ee', '8bccd011356b4828a04d99ba00a66850', '国际客运部党员', '1', '0', '\n', null, null, '1508142747', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('880ce8e5f5614d959a6ca0b9463556cb', '62c1384a4119430fa5eb11d71baf681c', '特种设备二项目党员', '1', '0', '\n', null, null, '1508142569', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('8f3ceee92c13429e899533aa767b6b24', '87c9508180f24dadb9ac2be7690871ec', '行李项目部党员', '1', '0', '\n', null, null, '1508142732', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('9f88b04e5240473a9d639f19b59be45f', '02c7ed42e8dc48df9c5753b8c0c56848', '国内出港项目党员', '1', '0', '\n', null, null, '1508142622', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('a4740752f3564ff39aa41b409277e6eb', '63f2724b4a10465eb1225ee6d9abdfeb', '特种设备三项目党员', '1', '0', '\n', null, null, '1508142443', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('aa1eab8bb18241558b1cd3ff5ccd2871', '29d53ee9509c4046a00078f168ef0582', '桥载项目部党员', '1', '0', '\n', null, null, '1508142309', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('ac185509ce8e40048976d92eca9f5241', '3d09d818bcf1453b9b80213186597f20', '机坪维修部党员', '1', '0', '\n', null, null, '1508144952', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('b706395637624747912642e8f0e70b66', 'c8d92d15f3da4f66aab56ed4cb38056f', '车辆维修部党员', '1', '0', '\n', null, null, '1508142887', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('bec6152808724bafa6e55eacdf873a98', '4ac1993a69804e068baf268522bf5d84', '国际货运党员', '1', '0', '\n', null, null, '1508142607', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('c398fd1ae5ca4edabfcf5c67870f0e56', '7e380ed67024471b8594cfb04998349e', '装卸部党员', '1', '0', '\n', null, null, '1508142595', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('c45a2fa90e2f451ba751dd922e0d25e1', '9d7e9cb28a9e469b8af55a32612211b9', '离岗控制项目党员', '1', '0', '\n', null, null, '1508142765', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('c5fd6d1549fe4a3d905a6cdec95c2836', 'be380134c0404de69d887f260edf4db8', '勤务项目党员', '1', '0', '\n', null, null, '1508142337', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('d1d69bd942c041e4a42a422c85917ace', '90d6266393ad49f7999092aa66301e6c', '特种设备一项目党员', '1', '0', '\n', null, null, '1508142579', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('e626902b31ac4cd7a667cd25ede18b3b', '55413d2911dc47a389e5c5c9fd8c3f53', '航班控制中心党员', '1', '0', '\n', null, null, '1508142899', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('f05785a101374348a71f70ca627a6801', '8a4f47ad2357499083020120844b602c', '结载项目部党员', '1', '0', '\n', null, null, '1508142784', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('f4d94d5ab87a4efb9d47278396709c4a', 'd9d5021588794e3f9f8ccb6a1eeac45a', '国内进港项目党员', '1', '0', '\n', null, null, '1508142704', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `stb_role` VALUES ('f95a76ff9d0e43c0827c1c43583977b4', '05ddef7a606b4d89939cf7e73b0c95f9', '机关党支部党员', '1', '0', '\n', null, null, '1508142941', '3c376bb33b1d43128f3785c5d214cd5e', 'N');

-- ----------------------------
-- Table structure for stb_role_opt
-- ----------------------------
DROP TABLE IF EXISTS `stb_role_opt`;
CREATE TABLE `stb_role_opt` (
  `ROLE_OPT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ROLE_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_OPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_role_opt
-- ----------------------------
INSERT INTO `stb_role_opt` VALUES ('00d5181abedf49259798fc968277db8a', '6fd7bd56eade44c283ff4784309be8ef', '55626523');
INSERT INTO `stb_role_opt` VALUES ('00e467d84b764160af18e0276517a460', '05b4eb34e2ae4a97a757a275849efb0a', '62361d5c487a4940b87b85f4ad09aa27');
INSERT INTO `stb_role_opt` VALUES ('0220698d688543759536e7498ded7494', 'aa82529500ba4ea4857764a48c96350f', '44db0306e0544723b3598178504d4407');
INSERT INTO `stb_role_opt` VALUES ('04d7dad3a0d64c0f8ccfcd56b225da52', '06ce1401c6004e00813050de8f4aa682', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('0568283211074923a4288fbd90f84690', '3862cf7599a1408ab7c74ff6a13f4a49', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_opt` VALUES ('07437cc8ce3b4d4587051fdbe7fc5bfd', '394efdff9b60492592151e013bfa3a0e', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_opt` VALUES ('0a07b169c7da49b987ec7182658ee663', 'ad3d2439753f4c6f863e8478b910660c', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('0a0d3bf81a8048f2bcf6dd6042a72dd9', '60913f8447be4a3e96e2fa09cdfaddd8', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('0a63ece7e2694762905074f6d7eac154', 'aa82529500ba4ea4857764a48c96350f', 'd80bffe971bb4016a902610b8a6fa113');
INSERT INTO `stb_role_opt` VALUES ('0b4937a99f534fd49d5d3d1013344a9e', 'c3cd5afa29b447c29a1564b17a856ad3', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_role_opt` VALUES ('0ca27b40acfa410c97e2ddbbdcf245b8', '58a5f47bec7845a4ad3c9f006fe76ee1', '6c5cf85175a143d2bc1a6c5264115d09');
INSERT INTO `stb_role_opt` VALUES ('0cccc909117d44069ac6ceb59c813b9b', '6c88c1dd6a0d4c15b9d2a8a174fb0297', 'b4e381329d734d218c0a445c23ec0344');
INSERT INTO `stb_role_opt` VALUES ('0d5f1f4d220443d2aac20035b5a7c480', 'e6b2c3bab61f49388155a682d97e10d9', '8dc439bdc3de455ab7a0bbe2578c7efc');
INSERT INTO `stb_role_opt` VALUES ('0e013ffaddaa42bbb2fe94a578314f5e', 'e8f61132bf3a46a4bb90aa5873584c41', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('1113812beff34f2ebe862231312935c1', 'd3faf19b9a074e33aa8725a3174b1e65', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_opt` VALUES ('15806f8e93234bbebefbe4b4d2ea0350', '6836694dee9443dea422bcd85db4b753', '4d3be319e3544a768242efc37c1f0441');
INSERT INTO `stb_role_opt` VALUES ('15dc6e7d708c4a1d9e95e4f1572e0182', 'dca353ab897e43af893bb3343f1752d3', '11c90672c7654297b361a29e66ae7c78');
INSERT INTO `stb_role_opt` VALUES ('171a52e1cf8943fd85bfce82f51af139', '05b4eb34e2ae4a97a757a275849efb0a', 'dedd147032f743998cff1586816dd457');
INSERT INTO `stb_role_opt` VALUES ('182fd3b5dddb4e87be3f4896ed7f50ef', '6836694dee9443dea422bcd85db4b753', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_opt` VALUES ('19350fa00bf34fc395c235c15e90f636', 'a21ccdc1ba4947909ce80821175a6d2b', '62361d5c487a4940b87b85f4ad09aa27');
INSERT INTO `stb_role_opt` VALUES ('1aa3c80fe39f442c85d7e14a7ea5db22', 'aa82529500ba4ea4857764a48c96350f', '0533379ee7cb4eb2bcf23b739c09eaec');
INSERT INTO `stb_role_opt` VALUES ('1b69117a626244f1b2cf316ab7a1419a', 'f84c28d3530e4e5ca380c37cbed2b527', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('1dac4875aba845b994e7eeacb496cc16', '115cec14d0c743e0adc052d49e4bc03b', '0533379ee7cb4eb2bcf23b739c09eaec');
INSERT INTO `stb_role_opt` VALUES ('212563a11cd143b2b997f70d51ae5229', '6836694dee9443dea422bcd85db4b753', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('22b1b1ede4f34d3c948fd72a2dc9da53', '51a1232ae9bd45b9a608cd5513aa10b8', '62361d5c487a4940b87b85f4ad09aa27');
INSERT INTO `stb_role_opt` VALUES ('23230afb9bda4f969483ad5b8c9d5c8b', 'e6b2c3bab61f49388155a682d97e10d9', '0533379ee7cb4eb2bcf23b739c09eaec');
INSERT INTO `stb_role_opt` VALUES ('24cb5416642b429abe6844ff5a20e712', 'aa82529500ba4ea4857764a48c96350f', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_opt` VALUES ('25cb1e704591404c996b8308546389d5', '60913f8447be4a3e96e2fa09cdfaddd8', '517567038d654fc5bc4d32b8ab9cc6c6');
INSERT INTO `stb_role_opt` VALUES ('282df569f44642f2a8bfaf41fac089c8', '05b4eb34e2ae4a97a757a275849efb0a', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_role_opt` VALUES ('2995bcda0c3b4feab17b6ba4ca4d346e', '6836694dee9443dea422bcd85db4b753', '94de8aab0c624f47af5460f261201a3b');
INSERT INTO `stb_role_opt` VALUES ('2bd292abbf1f432da5a22f8147df9163', '08ed73d21ec94b3fb312cfeda980d45a', 'aa3c8a01135b4b16871d9a74940edd22');
INSERT INTO `stb_role_opt` VALUES ('2f75479ac5e54f029483b28ef607f273', 'e8f61132bf3a46a4bb90aa5873584c41', 'b4409dab4f8f4a10a33f1496441d52aa');
INSERT INTO `stb_role_opt` VALUES ('30e9999188ee47a4a5d0f6add2eeff2d', '40f43140b7da40c7b7dddfb1c581bb8a', '62361d5c487a4940b87b85f4ad09aa27');
INSERT INTO `stb_role_opt` VALUES ('3177430a01624c84ba0928227bdd088a', '40f43140b7da40c7b7dddfb1c581bb8a', '517567038d654fc5bc4d32b8ab9cc6c6');
INSERT INTO `stb_role_opt` VALUES ('31897dd5b7aa458c9e777cc2b8b50ce8', '6fd7bd56eade44c283ff4784309be8ef', '99811');
INSERT INTO `stb_role_opt` VALUES ('32b8b7a12d7e4b70ae645c88022cc66a', 'cce0eabd1cbc4b82883e7c1698fffd23', '0533379ee7cb4eb2bcf23b739c09eaec');
INSERT INTO `stb_role_opt` VALUES ('3334a6aa5e7d4db7936db51d15929762', 'd3faf19b9a074e33aa8725a3174b1e65', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('33529d832a2f485ca3ad92e6d721f772', 'e74f0ff44fae496e94c7ecbe3e92c893', '44db0306e0544723b3598178504d4407');
INSERT INTO `stb_role_opt` VALUES ('336676331dc9454cbf6db4e917ca285a', '60913f8447be4a3e96e2fa09cdfaddd8', 'b4e381329d734d218c0a445c23ec0344');
INSERT INTO `stb_role_opt` VALUES ('339be44bbd62482c8b94d8c5d79b2aa4', 'aa82529500ba4ea4857764a48c96350f', 'bd5ac400400546a1b0981f0a90123d0b');
INSERT INTO `stb_role_opt` VALUES ('33ea705fd7a1449ba54d209a3c98003d', 'e6b2c3bab61f49388155a682d97e10d9', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_opt` VALUES ('3433a98b4b9944d382707ec74bdc0e85', 'e74f0ff44fae496e94c7ecbe3e92c893', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_opt` VALUES ('34d0948e3b894a92a6c1be18615fbb4b', '115cec14d0c743e0adc052d49e4bc03b', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_opt` VALUES ('3832ff5ed9ae400e977976764c57022f', '6c88c1dd6a0d4c15b9d2a8a174fb0297', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('38f41d085e7e4ac8a563e68e4b0906cd', '394efdff9b60492592151e013bfa3a0e', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('396cd2b863d74028bab45d82bd65531c', 'e6b2c3bab61f49388155a682d97e10d9', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('399354949c404dca968adc16e7063c08', '06ce1401c6004e00813050de8f4aa682', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_role_opt` VALUES ('3af3c3b022f44faaa1e3e208f5fd4811', 'e6b2c3bab61f49388155a682d97e10d9', 'beacc58c7ad2412eaf72e9ea7ae89d0c');
INSERT INTO `stb_role_opt` VALUES ('3b42a6c4a9fc4a35a3de777a8de2f432', 'ee7c30a32f324b3dbbbc8ce33229f2c1', '94de8aab0c624f47af5460f261201a3b');
INSERT INTO `stb_role_opt` VALUES ('3cfa41729ecf443fb2906e514e36b2cd', 'ee7c30a32f324b3dbbbc8ce33229f2c1', '99811');
INSERT INTO `stb_role_opt` VALUES ('3d8983396b3a40a9bac8873bf3753041', '6836694dee9443dea422bcd85db4b753', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('3dc5e25685814e63b041470b8d2c4d1f', 'cce0eabd1cbc4b82883e7c1698fffd23', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_opt` VALUES ('4184e00e26fc4beaa99676c5591b90de', '10df54428f8740b9a1c33e74e2b6f0e7', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('44b89f1cedb54e679151f3e88bc750ec', 'ee7c30a32f324b3dbbbc8ce33229f2c1', '4d3be319e3544a768242efc37c1f0441');
INSERT INTO `stb_role_opt` VALUES ('4538f7c003084f7482cba093ee6ecbd6', 'aa82529500ba4ea4857764a48c96350f', 'b652cfe1bfdc4d849b76ddf33a282bfc');
INSERT INTO `stb_role_opt` VALUES ('457f7e44e49f464b9937c090c642177a', 'ee7c30a32f324b3dbbbc8ce33229f2c1', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_opt` VALUES ('461653ad750a4c5bbf7ae8f180dcdb65', 'cce0eabd1cbc4b82883e7c1698fffd23', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('46ce44e1a4c34c28a773b605b9fa413a', '6fd7bd56eade44c283ff4784309be8ef', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('49ee8f2178c048d6823106d6e87efad5', '6836694dee9443dea422bcd85db4b753', 'c0e7c887f354479fa6150cbc9e7cb02f');
INSERT INTO `stb_role_opt` VALUES ('4cd6ecba96ac46feb6af8c8ee34ba037', 'a21ccdc1ba4947909ce80821175a6d2b', '99811');
INSERT INTO `stb_role_opt` VALUES ('4fa16f8686b04f998e63a1a1f1df9c07', 'aa82529500ba4ea4857764a48c96350f', 'dedd147032f743998cff1586816dd457');
INSERT INTO `stb_role_opt` VALUES ('505fc5f337ca41828d673136b94ec280', '394efdff9b60492592151e013bfa3a0e', 'bd5ac400400546a1b0981f0a90123d0b');
INSERT INTO `stb_role_opt` VALUES ('520050fc030f4113a389160ed31af86d', '06ce1401c6004e00813050de8f4aa682', 'b652cfe1bfdc4d849b76ddf33a282bfc');
INSERT INTO `stb_role_opt` VALUES ('52339236930d4a2b9b3f556329eb31d4', '10df54428f8740b9a1c33e74e2b6f0e7', 'b4e381329d734d218c0a445c23ec0344');
INSERT INTO `stb_role_opt` VALUES ('53a6f4bc9c5d4d0b91b717df3217e40d', 'e6b2c3bab61f49388155a682d97e10d9', 'aef09db8092b452aa06ef414e77adac0');
INSERT INTO `stb_role_opt` VALUES ('5935b30986b04acba5cbf98aa4b9420c', '6836694dee9443dea422bcd85db4b753', '7f9b2e8b64014adf91c3f00312e8f74b');
INSERT INTO `stb_role_opt` VALUES ('5b48f4f0120e447ab46f49d29565bb2a', '6fd7bd56eade44c283ff4784309be8ef', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('5c2288199c824465b8b3429b6df111f9', 'ee7c30a32f324b3dbbbc8ce33229f2c1', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_opt` VALUES ('5c57f671f34749cdb5ec29b9fa7a2570', 'e74f0ff44fae496e94c7ecbe3e92c893', '8dc439bdc3de455ab7a0bbe2578c7efc');
INSERT INTO `stb_role_opt` VALUES ('5c8d245272d542eaab102200ed115a11', '115cec14d0c743e0adc052d49e4bc03b', '6d0a952f56b348f4a4a2ff3cc43570c4');
INSERT INTO `stb_role_opt` VALUES ('63d107b5d77649e29cb143206a0bbb55', 'aa82529500ba4ea4857764a48c96350f', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_opt` VALUES ('641761eb8a3c4913ab45330df04fdb3b', '8e94d2171669411fb46375edf162c0ec', '6d0a952f56b348f4a4a2ff3cc43570c4');
INSERT INTO `stb_role_opt` VALUES ('6483899633114285bf6611ec4f1c5d39', 'd3faf19b9a074e33aa8725a3174b1e65', '62361d5c487a4940b87b85f4ad09aa27');
INSERT INTO `stb_role_opt` VALUES ('67d52caaf577439498bc52e8af20c47b', '51a1232ae9bd45b9a608cd5513aa10b8', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('695fcc58075d4143afe53e9aee93d2d3', '58a5f47bec7845a4ad3c9f006fe76ee1', '11c90672c7654297b361a29e66ae7c78');
INSERT INTO `stb_role_opt` VALUES ('6b635375929c4c049fa0b28655ef0c3d', 'aa82529500ba4ea4857764a48c96350f', '6c5cf85175a143d2bc1a6c5264115d09');
INSERT INTO `stb_role_opt` VALUES ('6b89f5d2a57e43b7b7152497c3ae86bb', '60913f8447be4a3e96e2fa09cdfaddd8', '99811');
INSERT INTO `stb_role_opt` VALUES ('6b97978d0bab41d3a3f88ad045f59599', 'ee7c30a32f324b3dbbbc8ce33229f2c1', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('6c4145d926d8496987a741623f770747', 'cce0eabd1cbc4b82883e7c1698fffd23', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('70d6b666d4a744febcf1675bbf5bed12', 'e74f0ff44fae496e94c7ecbe3e92c893', 'd80bffe971bb4016a902610b8a6fa113');
INSERT INTO `stb_role_opt` VALUES ('7533b2c7c13b4c6fba967fa9abdca43b', '60913f8447be4a3e96e2fa09cdfaddd8', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('785fbab389ad4054b6ad56aa896834da', 'ee7c30a32f324b3dbbbc8ce33229f2c1', '7f9b2e8b64014adf91c3f00312e8f74b');
INSERT INTO `stb_role_opt` VALUES ('78e134f6aa334e3c905d90bed0768dae', '3862cf7599a1408ab7c74ff6a13f4a49', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('798ebb80411f4c91b6165e2d528a63d1', 'e436579050bb40cc9d4b3f3921d7ba0a', '99811');
INSERT INTO `stb_role_opt` VALUES ('7a39e04810354716af1a982ffe3e7202', '6836694dee9443dea422bcd85db4b753', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('7af652dccd934030b1156d8b53e83a8f', 'aa82529500ba4ea4857764a48c96350f', '11c90672c7654297b361a29e66ae7c78');
INSERT INTO `stb_role_opt` VALUES ('7bbc4bcd1ca04c7da3f3f3b4e9808070', 'e6b2c3bab61f49388155a682d97e10d9', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('7c70b020173347fba50cce317562fc43', '40f43140b7da40c7b7dddfb1c581bb8a', '31844838c48043d4838cf79fac211c7c');
INSERT INTO `stb_role_opt` VALUES ('7c721f06e5e149f4af516173ef0f9190', 'cce0eabd1cbc4b82883e7c1698fffd23', '517567038d654fc5bc4d32b8ab9cc6c6');
INSERT INTO `stb_role_opt` VALUES ('7c9363fd7a79465d98195fee3b45cb0e', '115cec14d0c743e0adc052d49e4bc03b', 'b652cfe1bfdc4d849b76ddf33a282bfc');
INSERT INTO `stb_role_opt` VALUES ('7d665f45b20c4566842e9ccf0726ed6b', 'ee7c30a32f324b3dbbbc8ce33229f2c1', '747a271b604d49419394f060c0260030');
INSERT INTO `stb_role_opt` VALUES ('82c799e2b7a545a187b64f561a460979', 'a21ccdc1ba4947909ce80821175a6d2b', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('86ce8673518447888596e59eacbf3033', '05b4eb34e2ae4a97a757a275849efb0a', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('8af7c76728a7400193ec78b4485b1218', '60913f8447be4a3e96e2fa09cdfaddd8', 'dedd147032f743998cff1586816dd457');
INSERT INTO `stb_role_opt` VALUES ('8e5eff8b78fe4fd2baff83cb34198222', 'e436579050bb40cc9d4b3f3921d7ba0a', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('90008ad6912843e7a780db8adda6c1cf', 'ee7c30a32f324b3dbbbc8ce33229f2c1', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('90995d252a4d4909863d3920f42a1cf3', '40f43140b7da40c7b7dddfb1c581bb8a', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('9112e76549174ec9b6c61bfd4d1eae46', 'aa82529500ba4ea4857764a48c96350f', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_opt` VALUES ('91afbcba84b44da8a31e9a5107a8b110', 'a7a9ea3c568440b6b64c8aec0791f33f', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('920d909e4bc24b0589e91f73cdfc2833', 'e6b2c3bab61f49388155a682d97e10d9', 'aa3c8a01135b4b16871d9a74940edd22');
INSERT INTO `stb_role_opt` VALUES ('956d0a0fcd3d4144b4f6162a7df45d9c', 'aa82529500ba4ea4857764a48c96350f', '99811');
INSERT INTO `stb_role_opt` VALUES ('9772c4b168a14b5fb26c12e44634e4fa', 'e6b2c3bab61f49388155a682d97e10d9', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('9d03f17d48124c1b93330ed94fd7b0c0', '3862cf7599a1408ab7c74ff6a13f4a49', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('9de212b2dd884d3f973464a08fa96ebc', '394efdff9b60492592151e013bfa3a0e', '44db0306e0544723b3598178504d4407');
INSERT INTO `stb_role_opt` VALUES ('9eb05308bc7846f9af45213848a6d6ae', 'e7aab6252e524872b0f4ea6b7d3a9a9a', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('9f372daf2979459a978fd569265bd768', 'e74f0ff44fae496e94c7ecbe3e92c893', 'd7a30c025fe440579f426ec4f37a81e8');
INSERT INTO `stb_role_opt` VALUES ('a1ffdea47d064bb6b8110b508e111bce', 'aa82529500ba4ea4857764a48c96350f', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('a422274714c149cab38c2121fb2cd2d2', 'e8f61132bf3a46a4bb90aa5873584c41', 'b4e381329d734d218c0a445c23ec0344');
INSERT INTO `stb_role_opt` VALUES ('a42f94f7a76b4c81b4a84787c1490bb6', '115cec14d0c743e0adc052d49e4bc03b', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('a47425ff484240f78a9df783cff96111', '115cec14d0c743e0adc052d49e4bc03b', 'beacc58c7ad2412eaf72e9ea7ae89d0c');
INSERT INTO `stb_role_opt` VALUES ('a7bb8d19bbd14d80ba88b1d70cc422fa', 'c3cd5afa29b447c29a1564b17a856ad3', 'aef09db8092b452aa06ef414e77adac0');
INSERT INTO `stb_role_opt` VALUES ('aac45cb3af5847989855fe390c37e442', '6fd7bd56eade44c283ff4784309be8ef', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('adb479c019024136995b1089a020a87a', 'dca353ab897e43af893bb3343f1752d3', '6c5cf85175a143d2bc1a6c5264115d09');
INSERT INTO `stb_role_opt` VALUES ('ae6c474925304037a65e821772994b50', '394efdff9b60492592151e013bfa3a0e', 'd80bffe971bb4016a902610b8a6fa113');
INSERT INTO `stb_role_opt` VALUES ('aeae200c07c44f119ed63420115d3530', 'e6b2c3bab61f49388155a682d97e10d9', '22b19b4e9f704c4c82d430bf0a9e535b');
INSERT INTO `stb_role_opt` VALUES ('b25caf09cc074efc980f00c1d2bdc240', 'cce0eabd1cbc4b82883e7c1698fffd23', '99811');
INSERT INTO `stb_role_opt` VALUES ('b2d7f21b914a48f8a821cf3256056d53', '60913f8447be4a3e96e2fa09cdfaddd8', '31844838c48043d4838cf79fac211c7c');
INSERT INTO `stb_role_opt` VALUES ('b50a5efc545f47d29c9dbc830e64db11', '6836694dee9443dea422bcd85db4b753', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_opt` VALUES ('b76f9dd4b560435c929889a5d5f0febb', 'e74f0ff44fae496e94c7ecbe3e92c893', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('ba114f94c93240789d0cd6093f7e740f', 'e436579050bb40cc9d4b3f3921d7ba0a', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_opt` VALUES ('bb79629aeb574916a4c0a5d8878435be', '394efdff9b60492592151e013bfa3a0e', 'd7a30c025fe440579f426ec4f37a81e8');
INSERT INTO `stb_role_opt` VALUES ('bce930b0f1bb4d4c8f6bdc027cbc5b8e', '394efdff9b60492592151e013bfa3a0e', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_opt` VALUES ('bd4f7a8fb4824474bfcfd2ceaec3e4cc', '8e94d2171669411fb46375edf162c0ec', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_role_opt` VALUES ('bdcf7502ce354259890e1b0f2e1568f2', '40f43140b7da40c7b7dddfb1c581bb8a', '99811');
INSERT INTO `stb_role_opt` VALUES ('bde1567a26e1434597f0cabb0581036f', '40f43140b7da40c7b7dddfb1c581bb8a', 'b4e381329d734d218c0a445c23ec0344');
INSERT INTO `stb_role_opt` VALUES ('be3885261227419e99e4ebb53363da77', 'aa82529500ba4ea4857764a48c96350f', 'd7a30c025fe440579f426ec4f37a81e8');
INSERT INTO `stb_role_opt` VALUES ('bf6a37e00b0342dfba9687b29b35e48b', 'e7aab6252e524872b0f4ea6b7d3a9a9a', 'b4e381329d734d218c0a445c23ec0344');
INSERT INTO `stb_role_opt` VALUES ('c0205cd343a3450691ae0ac58b42fdb0', '08ed73d21ec94b3fb312cfeda980d45a', 'd80bffe971bb4016a902610b8a6fa113');
INSERT INTO `stb_role_opt` VALUES ('c3dcf45741fc402096f570211192a714', 'ee7c30a32f324b3dbbbc8ce33229f2c1', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_opt` VALUES ('c44fb067ee31403a9ecc0ad2dc3c5196', 'e6b2c3bab61f49388155a682d97e10d9', 'bd5ac400400546a1b0981f0a90123d0b');
INSERT INTO `stb_role_opt` VALUES ('c4b286f3f3e1421398d27fc9cbf93ef0', '05b4eb34e2ae4a97a757a275849efb0a', '99811');
INSERT INTO `stb_role_opt` VALUES ('c57f2aecad6f4d72a696b744e0026c65', 'e6b2c3bab61f49388155a682d97e10d9', 'c6fb84b3914b44cdbb3219b1be2fd839');
INSERT INTO `stb_role_opt` VALUES ('c5c0b7416b33431c8cc69b877022fbf5', '08ed73d21ec94b3fb312cfeda980d45a', 'c6fb84b3914b44cdbb3219b1be2fd839');
INSERT INTO `stb_role_opt` VALUES ('c792ad3abffc49d0b5bd036ff4b21abd', 'aa82529500ba4ea4857764a48c96350f', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('c82f99dec30347ed9643289c861aa997', '003be2e5f60c46138f38174d6cfda665', '99811');
INSERT INTO `stb_role_opt` VALUES ('c935e688eca64770b90a8c664840bd7c', 'a0df55cb3cd04ba0b726cb5b7e4220a7', '99811');
INSERT INTO `stb_role_opt` VALUES ('cd01256d8b754b7e84cf2392b396a948', '06ce1401c6004e00813050de8f4aa682', '6d0a952f56b348f4a4a2ff3cc43570c4');
INSERT INTO `stb_role_opt` VALUES ('cd1497bf0065413e8b41110cbb11a274', 'cce0eabd1cbc4b82883e7c1698fffd23', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('cde20e05599549f7b8fde2b9fcaa5fd7', 'e436579050bb40cc9d4b3f3921d7ba0a', '059f8c7dc4064bb3b18d62e07c11b13b');
INSERT INTO `stb_role_opt` VALUES ('cea14abec7ca4c89a3c2ff85965f496f', '394efdff9b60492592151e013bfa3a0e', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('d2b03baa3af94d95a159363857d4666f', 'a21ccdc1ba4947909ce80821175a6d2b', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_role_opt` VALUES ('d2dd6a918240492d9dcd45eaf26a6e7a', '60913f8447be4a3e96e2fa09cdfaddd8', 'b4409dab4f8f4a10a33f1496441d52aa');
INSERT INTO `stb_role_opt` VALUES ('d36703b578d84c90acaa2fcbc49803bd', '8d7389b32ffe41f48781ebe329a3e0c6', '8dc439bdc3de455ab7a0bbe2578c7efc');
INSERT INTO `stb_role_opt` VALUES ('d3a0b93995534e408ae4b4215c6c8cda', 'e6b2c3bab61f49388155a682d97e10d9', 'd80bffe971bb4016a902610b8a6fa113');
INSERT INTO `stb_role_opt` VALUES ('d41109890aea4381a61bccdf16d7cc96', '40f43140b7da40c7b7dddfb1c581bb8a', '0264b365c78c499bacbde7750b3d61fa');
INSERT INTO `stb_role_opt` VALUES ('d79100951cc3454d855d7391eee62931', '08ed73d21ec94b3fb312cfeda980d45a', '22b19b4e9f704c4c82d430bf0a9e535b');
INSERT INTO `stb_role_opt` VALUES ('d80bcb8f63ac4dceb211a679a182576a', 'aa82529500ba4ea4857764a48c96350f', '8dc439bdc3de455ab7a0bbe2578c7efc');
INSERT INTO `stb_role_opt` VALUES ('dcc21914af994a5e9fe5298a9cabeeaf', '7f4d5d1b245b4593bb052ea0db5ff927', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('dcd18faf559847c1b84f06c15c7154ea', '115cec14d0c743e0adc052d49e4bc03b', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_role_opt` VALUES ('dd0e83dfb9c14a6e86487fc73c807942', 'e436579050bb40cc9d4b3f3921d7ba0a', '517567038d654fc5bc4d32b8ab9cc6c6');
INSERT INTO `stb_role_opt` VALUES ('dfe85e90687f463bb48bfaad4f38fd0b', 'ee7c30a32f324b3dbbbc8ce33229f2c1', 'f95a76ff9d0e43c0827c1c43583977b4');
INSERT INTO `stb_role_opt` VALUES ('e2e5cdb17db54cf982409ac029591dea', '115cec14d0c743e0adc052d49e4bc03b', 'd2debb61bcc2487082631276b9f2f6b6');
INSERT INTO `stb_role_opt` VALUES ('e42f2332e41c4d05b335b683c8caf523', '6c88c1dd6a0d4c15b9d2a8a174fb0297', 'b4409dab4f8f4a10a33f1496441d52aa');
INSERT INTO `stb_role_opt` VALUES ('e5d884d27caf42faba3276510ed46ff7', '115cec14d0c743e0adc052d49e4bc03b', '072ca5e10b60486a8cad5d28f9c5169b');
INSERT INTO `stb_role_opt` VALUES ('e9d0d9a08e4a4f40aeaeb0dbc4d350be', 'e6b2c3bab61f49388155a682d97e10d9', '44db0306e0544723b3598178504d4407');
INSERT INTO `stb_role_opt` VALUES ('ea5f7de79bf24fe2aaf21e8a50d9ee06', '60913f8447be4a3e96e2fa09cdfaddd8', '62361d5c487a4940b87b85f4ad09aa27');
INSERT INTO `stb_role_opt` VALUES ('eabe36aee2604dd68ce06418d4450517', 'cce0eabd1cbc4b82883e7c1698fffd23', '55626523');
INSERT INTO `stb_role_opt` VALUES ('eaed072c3140478490a661c369598365', '394efdff9b60492592151e013bfa3a0e', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('ec505e38967644e1b3f0800c51aa0c5a', '60913f8447be4a3e96e2fa09cdfaddd8', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_opt` VALUES ('eef182ee2a77402c910c61ede7fdd391', '40f43140b7da40c7b7dddfb1c581bb8a', 'b4409dab4f8f4a10a33f1496441d52aa');
INSERT INTO `stb_role_opt` VALUES ('f0d7473609c047e4b0034292271970a5', 'e6b2c3bab61f49388155a682d97e10d9', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_opt` VALUES ('f15555329cba405a9f7414b727dfdf1e', 'cce0eabd1cbc4b82883e7c1698fffd23', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('f293d7091bab4fb3b9425a651bd3108b', 'e74f0ff44fae496e94c7ecbe3e92c893', 'bd5ac400400546a1b0981f0a90123d0b');
INSERT INTO `stb_role_opt` VALUES ('f33e92926fa641bfaa0787b84cbb9e90', 'ee7c30a32f324b3dbbbc8ce33229f2c1', 'c0e7c887f354479fa6150cbc9e7cb02f');
INSERT INTO `stb_role_opt` VALUES ('f404df0b0ddc41a98c89603643742df0', 'e7aab6252e524872b0f4ea6b7d3a9a9a', 'b4409dab4f8f4a10a33f1496441d52aa');
INSERT INTO `stb_role_opt` VALUES ('f42aba76b439462fab5c2f03d3d8f391', '10df54428f8740b9a1c33e74e2b6f0e7', 'b4409dab4f8f4a10a33f1496441d52aa');
INSERT INTO `stb_role_opt` VALUES ('f589e13acea249d097ee6cc1ae854a03', '6836694dee9443dea422bcd85db4b753', '747a271b604d49419394f060c0260030');
INSERT INTO `stb_role_opt` VALUES ('f78246c08361453f830ef88ddb0ee359', '8e94d2171669411fb46375edf162c0ec', 'aef09db8092b452aa06ef414e77adac0');
INSERT INTO `stb_role_opt` VALUES ('f8f308425d9a46b0815ffcaed51ad59c', '394efdff9b60492592151e013bfa3a0e', '8dc439bdc3de455ab7a0bbe2578c7efc');
INSERT INTO `stb_role_opt` VALUES ('f98e94e8e1134484b781ceaefe702b15', 'e6b2c3bab61f49388155a682d97e10d9', 'd2debb61bcc2487082631276b9f2f6b6');
INSERT INTO `stb_role_opt` VALUES ('fa127148ad984e2ba18fd80aa86bb178', 'aa82529500ba4ea4857764a48c96350f', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_opt` VALUES ('fc0ae419a3e34e5aa73815a326e9c2d9', 'e6b2c3bab61f49388155a682d97e10d9', 'd7a30c025fe440579f426ec4f37a81e8');
INSERT INTO `stb_role_opt` VALUES ('fcfd87f4af274aaa8d8ea501affee5fc', '60913f8447be4a3e96e2fa09cdfaddd8', '0264b365c78c499bacbde7750b3d61fa');

-- ----------------------------
-- Table structure for stb_role_stats
-- ----------------------------
DROP TABLE IF EXISTS `stb_role_stats`;
CREATE TABLE `stb_role_stats` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `STATS_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '统计ID',
  `ROLE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_role_stats
-- ----------------------------
INSERT INTO `stb_role_stats` VALUES ('00c7f81e9b3745d0879fe84dc4496b7b', '0b4f6663fcc445fab1aeee45ab57d009', '06897a855f174e54b18485700cb14735');
INSERT INTO `stb_role_stats` VALUES ('0142d467b389476eb486ff052abccdf8', '17deec6c7bac488bb6b4f5fe34dd6ea6', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_stats` VALUES ('075a08b707074506bea518626073d81a', 'f86673347e734c0680ff346b95a43c68', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('08ae15e9640c44feb50a6a757bb04640', 'f69655d339dd434bb7618220dceeb910', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_stats` VALUES ('0ba8ac830d8b43eb9b5c8905359c2023', 'e533c785ad804327b5f982d8c9adfeca', 'b652cfe1bfdc4d849b76ddf33a282bfc');
INSERT INTO `stb_role_stats` VALUES ('19f1bdc896ab48b38af3d565320e1fb8', '17deec6c7bac488bb6b4f5fe34dd6ea6', '51eebab4a73e4780b87c8c9a40ac5e6f');
INSERT INTO `stb_role_stats` VALUES ('1fa684866c14487a83e4d7eb6bff9660', 'e533c785ad804327b5f982d8c9adfeca', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_role_stats` VALUES ('24d61aad21f54fa4aa2b38efde88b5f0', '52bd485702f04b90a4c29cb27a50a6bb', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('25815c3fcb954190bfaea362617bd753', '1e0a8183e67b45b8b9b54cc8665ea341', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_stats` VALUES ('258e5a14f1e04a94b91c7fb785b3b42f', 'f86673347e734c0680ff346b95a43c68', 'd7a30c025fe440579f426ec4f37a81e8');
INSERT INTO `stb_role_stats` VALUES ('26e6b8a202974db6b1da1c4c3e1056b0', '0b4f6663fcc445fab1aeee45ab57d009', '51eebab4a73e4780b87c8c9a40ac5e6f');
INSERT INTO `stb_role_stats` VALUES ('2f242970e99841e49e63cec21af25b6c', '52bd485702f04b90a4c29cb27a50a6bb', 'b652cfe1bfdc4d849b76ddf33a282bfc');
INSERT INTO `stb_role_stats` VALUES ('31176babebcc496fbea7011e1c4962af', '0b4f6663fcc445fab1aeee45ab57d009', 'dedd147032f743998cff1586816dd457');
INSERT INTO `stb_role_stats` VALUES ('3485664dc67246c2bde08754a66f187f', '17deec6c7bac488bb6b4f5fe34dd6ea6', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('38dfc64c30e4425b8631529263405ced', 'df2ab20fb75a44e39b3038488984551e', 'b652cfe1bfdc4d849b76ddf33a282bfc');
INSERT INTO `stb_role_stats` VALUES ('53fd8af26084473fa1a0eb6f2836b82d', 'ba03b71673734fd6b84029710bfd66a4', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('55917b30a1f345c591a2b9cf8bc115e5', 'ba03b71673734fd6b84029710bfd66a4', '51eebab4a73e4780b87c8c9a40ac5e6f');
INSERT INTO `stb_role_stats` VALUES ('5bacbbdf8d78430fbf0c8cd1b6298144', 'f86673347e734c0680ff346b95a43c68', '44db0306e0544723b3598178504d4407');
INSERT INTO `stb_role_stats` VALUES ('5bb0bd0e7de14a7696f443fb90acb312', 'ba03b71673734fd6b84029710bfd66a4', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_stats` VALUES ('60438271d29a40df87639b4ceb24db92', 'e533c785ad804327b5f982d8c9adfeca', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_stats` VALUES ('667c958e9d004891bfdfeb2ed21d1d27', 'f69655d339dd434bb7618220dceeb910', 'd80bffe971bb4016a902610b8a6fa113');
INSERT INTO `stb_role_stats` VALUES ('68929ef8abb64b1f8cab42c6e75407c3', 'e533c785ad804327b5f982d8c9adfeca', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('6c8bb6c1dddf4830a40af39400bacd01', '52bd485702f04b90a4c29cb27a50a6bb', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_role_stats` VALUES ('6d7b279b3ad34c468de4ea88703de942', 'f86673347e734c0680ff346b95a43c68', 'd80bffe971bb4016a902610b8a6fa113');
INSERT INTO `stb_role_stats` VALUES ('6e460c74ebbe422a86c2b41b62190876', '1e0a8183e67b45b8b9b54cc8665ea341', '44db0306e0544723b3598178504d4407');
INSERT INTO `stb_role_stats` VALUES ('8075e2c64cf643c0968c117f659320bc', 'f86673347e734c0680ff346b95a43c68', 'c0a3b523f4184726ac21bd6e7c55aabb');
INSERT INTO `stb_role_stats` VALUES ('94e5f27d95394302ae568e26ae45f002', 'ba03b71673734fd6b84029710bfd66a4', '4d3be319e3544a768242efc37c1f0441');
INSERT INTO `stb_role_stats` VALUES ('991726a3258a4a438540efe97f65441f', 'f86673347e734c0680ff346b95a43c68', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_stats` VALUES ('a821909ce1c34abc936d05113da13f7e', '0b4f6663fcc445fab1aeee45ab57d009', '4d3be319e3544a768242efc37c1f0441');
INSERT INTO `stb_role_stats` VALUES ('ac1d661cff864f51884d8f658dd5bb43', 'df2ab20fb75a44e39b3038488984551e', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_stats` VALUES ('b0d285d177c6431d9875a02d3724b373', 'f69655d339dd434bb7618220dceeb910', 'd7a30c025fe440579f426ec4f37a81e8');
INSERT INTO `stb_role_stats` VALUES ('b7d236545d7b4f8aaf9ec460d91e3824', '1e0a8183e67b45b8b9b54cc8665ea341', 'd7a30c025fe440579f426ec4f37a81e8');
INSERT INTO `stb_role_stats` VALUES ('be42202cee504e99bb6892652e1aa497', '1e0a8183e67b45b8b9b54cc8665ea341', '4d5ef2e72b66484785d7a6a83a81a570');
INSERT INTO `stb_role_stats` VALUES ('c0a152b5c5fb4b2fb0c54238a71dedae', 'f69655d339dd434bb7618220dceeb910', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('c11c4848b9b64f5da4c19f716ae8de24', 'df2ab20fb75a44e39b3038488984551e', '48466fcc547048de9294461cd6723251');
INSERT INTO `stb_role_stats` VALUES ('c782575272f34f549193e2630927bafc', '1e0a8183e67b45b8b9b54cc8665ea341', 'd80bffe971bb4016a902610b8a6fa113');
INSERT INTO `stb_role_stats` VALUES ('c9176484603c492fb92dc92336751c2e', '1e0a8183e67b45b8b9b54cc8665ea341', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('d3596f5cb80f4c308f6b3d10a6eae6a0', '17deec6c7bac488bb6b4f5fe34dd6ea6', 'dedd147032f743998cff1586816dd457');
INSERT INTO `stb_role_stats` VALUES ('d6205333026e4a6e86402818aeab3468', '17deec6c7bac488bb6b4f5fe34dd6ea6', '4d3be319e3544a768242efc37c1f0441');
INSERT INTO `stb_role_stats` VALUES ('d9119dfa4fd444f9ba56d744def3780e', 'ba03b71673734fd6b84029710bfd66a4', 'dedd147032f743998cff1586816dd457');
INSERT INTO `stb_role_stats` VALUES ('e64ec80986024eafbed8ecbdcb5de151', '0b4f6663fcc445fab1aeee45ab57d009', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('ec30ad3dcf5a4ceca6de08f896b8295d', 'df2ab20fb75a44e39b3038488984551e', 'b04e5351371c46f6916db875c3f4168d');
INSERT INTO `stb_role_stats` VALUES ('f9971dd03e5a43468b99b8c6f076f111', 'f69655d339dd434bb7618220dceeb910', '44db0306e0544723b3598178504d4407');
INSERT INTO `stb_role_stats` VALUES ('feb5d28d1203435da3dcd2e0c7db5f1f', 'ef66138750d64c3d8f811b099afa84bd', 'dedd147032f743998cff1586816dd457');
INSERT INTO `stb_role_stats` VALUES ('ff1a29798c254bc7892f5e9d6663f7dd', 'ef66138750d64c3d8f811b099afa84bd', 'b04e5351371c46f6916db875c3f4168d');

-- ----------------------------
-- Table structure for stb_role_stats_relation
-- ----------------------------
DROP TABLE IF EXISTS `stb_role_stats_relation`;
CREATE TABLE `stb_role_stats_relation` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `RELATION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '关联ID',
  `ROLE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色ID',
  `REMARK` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `IS_DELETED` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'N',
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(8) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_role_stats_relation
-- ----------------------------

-- ----------------------------
-- Table structure for stb_role_user
-- ----------------------------
DROP TABLE IF EXISTS `stb_role_user`;
CREATE TABLE `stb_role_user` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色ID',
  `USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_role_user
-- ----------------------------
INSERT INTO `stb_role_user` VALUES ('00578b4c1bd44d8097093728da3b500d', '3a48721d840e4f8fad665137448427a2', 'fb153119ee29462dbfd5165d46eeb7dd', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('01911fd622164cf2987d9efc85581f03', 'f95a76ff9d0e43c0827c1c43583977b4', 'a1440a9a51734da2a0ffd745573780b2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('019973a8529a4eaaa4901ee2a1afcadc', 'f95a76ff9d0e43c0827c1c43583977b4', '078a724e810e452d933d1811701ebce4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('024d774ec7f54a92b21824855231d52c', '3a48721d840e4f8fad665137448427a2', '9eb67256702442439de7c14240b60fe6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0263badc13d34421a7c0683f34eb6af2', '3a48721d840e4f8fad665137448427a2', '7c049b1657c54922bc66f2871326664c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0299bd2247d547e28944c751a567b92a', '1e52771429a4498e85f78357da4818a1', 'b8a91a8559004bf5a4e15c8d97ccc9ce', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('02b26dd2f0224a7aab2fee2a93e6d103', 'bd5ac400400546a1b0981f0a90123d0b', '6a830a1a01ef4e8f9fa84fe76e57d627', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('037e510d99234373b8d2b9978a4352cf', '3a48721d840e4f8fad665137448427a2', 'd7bc0a2fe97f4608ace072a7e1a948f9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('03acb758932d423985617bd8635bf81b', '3a48721d840e4f8fad665137448427a2', 'a1fb7d34bbb744718cf5b2bbeb0b1f9a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('044cda0259a64fecab6ff210601f9874', '1e52771429a4498e85f78357da4818a1', 'c90146f42b55468dae0f56559ce641e8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('055f9af27edb4e798468713e6bd6f899', 'e626902b31ac4cd7a667cd25ede18b3b', '244135a3cc80447a979efb94a9822be8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('05eba3952fb04b25833d6892813b4e3b', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '70cad7df27a3413d954b8a30cc6fb6fc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('05ed0838504c4886bf5e84557222dbc2', 'e626902b31ac4cd7a667cd25ede18b3b', '4560e010715c499fb32800a740e877fd', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0638cd8488c241aeb59becdfd7ac185d', '880ce8e5f5614d959a6ca0b9463556cb', '53f06d5c36cb43c7ad1d16d179e64421', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('063b17fcaa834ee7b3bc9bfeaa98639f', 'beacc58c7ad2412eaf72e9ea7ae89d0c', 'ce030252d22b4729af4ce28ccfa16cdc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('06401c2148c744469574d07e5ca0f0b9', 'a4740752f3564ff39aa41b409277e6eb', '0058704fe0ff4ef784b81b731f4b77fc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('06ea91c08ad5461cb42ce4f399f8e284', 'f05785a101374348a71f70ca627a6801', '7b52eeb6e58347209f97fc7a36e9997c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('07338cf8309340b1b2cbc03a5b1f5d02', 'c5fd6d1549fe4a3d905a6cdec95c2836', '941ace53311d413688533d92f762b1da', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('075460a9e4384441a2fd62860ddd54ff', '3a48721d840e4f8fad665137448427a2', '882968748af74626bec9c4f259d08511', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('07d4b1c47a554f9b8cd35e32f9e7a308', 'd1d69bd942c041e4a42a422c85917ace', '5737a8bb64c34397877219976da7c9b7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('08172dd7994a46b0b473e82ff8a54072', '1e52771429a4498e85f78357da4818a1', '1bca0b6fe7e745f1bbbc551304d01e79', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('084e2489bd0f46d99a820725c4c6aa1b', 'a4740752f3564ff39aa41b409277e6eb', '40973c7a607645b2ae193e8d0adf7c4e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('089e26197bfd439292b3767db7d6fc25', '3a48721d840e4f8fad665137448427a2', 'cb2bf5fd078146969f8aa2bac240d4d8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0974491662a14c47878ad53bd3c9b649', '4e9ecd122144441abb436227d5b1f4a8', 'b259deb04edb425694cc53b048d117b3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('098717931f854c09a09e79eaa6137d10', '3a48721d840e4f8fad665137448427a2', '1b5ed178e9564301938b9aa4f6bd047f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('09883cfd75d24f6c867ec95254e7601c', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '72105e568de8428a8222eecfd2539183', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('09cbccd4184c4c42ad7b117ab6f29eb6', 'c5fd6d1549fe4a3d905a6cdec95c2836', 'a10671d0ccca42928a102af0f9ffab82', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0a18eaf706814343b7b88839c41eacb6', 'e626902b31ac4cd7a667cd25ede18b3b', 'c9c1a71d6dd64556b3ff1186338c18f5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0a8ea11151af419aa135ded1970191dd', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '44957bda8d984756830241c277de9019', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0b3ef086f63c4b49bfe6bffe9cc5469d', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'a177546b38b44e15a232b8cfe536ab75', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0b86ea0ea1e84231b33f50cd2d2ed798', 'aa1eab8bb18241558b1cd3ff5ccd2871', '286cc7dbe5264598ae26d81e36b41273', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0ba5f88df9cf42f7bc51fa66b114d513', '3a48721d840e4f8fad665137448427a2', '1337d6300f0e43a8880e36d6bc3e9b70', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0be7ccabfdb349a1bc414e7751e27b4b', '3a48721d840e4f8fad665137448427a2', 'be89db34b05b4c7a91c458ce69161761', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0c254fd4b4e445bdb7670a65ace66b59', '3a48721d840e4f8fad665137448427a2', 'e5ae4caa288448598cd3bbe309a4276c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0c34b1e40e4c48a0b66d9e074edc4269', '4e9ecd122144441abb436227d5b1f4a8', '89804495cc5a4590a01131a60ca35554', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0d7a79b0a21b4979a3ecdf2db4c8ad7f', '3a48721d840e4f8fad665137448427a2', '8b8c79661181463e80de3914fa949250', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0dc268a3014640ee82a5f384c6b4637d', '3a48721d840e4f8fad665137448427a2', 'd09b798e2ba341bbaabeba6b44bb6cb1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0df9a381608242bf9aed8166e341f177', '3a48721d840e4f8fad665137448427a2', 'a070d56212cd4091a302277fb2df53e4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0e233cd7102b48b08e5c138470df1b6f', '1215c6b3ab8240e496f2efc9a610ce28', '5a0fa1141c1f40ad86b70328191b4c66', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0e7bd1c7e17c4ff6b56de036ff0fba40', '3a48721d840e4f8fad665137448427a2', '4def3085b9ad437c8d0a8344845f5a24', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0ecbaa3abcc042aaac387161a9d63301', '1e52771429a4498e85f78357da4818a1', '3e01af867b8244fe96595985e847fba9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0ee03cfc8d7b4f399e91c590bda5a4e2', 'f95a76ff9d0e43c0827c1c43583977b4', '9bab39cf9c00402d8ab9bd4720276cc1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0f1852f982e44407aa5aae8b0358de78', 'e626902b31ac4cd7a667cd25ede18b3b', '129192f91d5949cbbab83e4b5da43df4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0f2c08a1aac24943afda2d248093e6ce', '3a48721d840e4f8fad665137448427a2', '8ee60d24df494f2c8ec75cc272fc162e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0f4f409c31724abea2f43b1586f17749', '1215c6b3ab8240e496f2efc9a610ce28', '34179ecafb5349b0ab6ea312c86b25b7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('0f8b19a9119249d186dd8bf3af50978c', 'e626902b31ac4cd7a667cd25ede18b3b', 'ea095e8c3f4643d4ab05e18a78456c4f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1103217112ab413a88ee077656cc3bb9', 'b652cfe1bfdc4d849b76ddf33a282bfc', 'cdf8e9debc734222b518778208230bed', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1107e92e1027428a85b2d88dbd136023', '880ce8e5f5614d959a6ca0b9463556cb', 'cd620358d74d4877b5ef18da1b4e83d8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('11d207b0c49f44ba9e28fb2b0371a7e4', 'c6fb84b3914b44cdbb3219b1be2fd839', 'e1b56fea35e84fd4891fbb2b3bf5aaa9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1222abdf73034360b0ea0a8c621ff07b', 'e626902b31ac4cd7a667cd25ede18b3b', 'da0f65508f854695a51f70631f3cf72f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('126ddb879e4743198e633a0e6491ec31', '1215c6b3ab8240e496f2efc9a610ce28', '10f30281cdd64c7fafcc3d505730592e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('12947856f21244d887727be2fe5bb80e', '880ce8e5f5614d959a6ca0b9463556cb', 'e3130943c16a4a728174851dbb39a850', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('12c3cf9aadec4a8496507bc757b71fe5', 'f95a76ff9d0e43c0827c1c43583977b4', '74cf03d6dc75412c94db8bc043cc8386', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('12e33ab9bda742bd8c2763db48ce33ca', 'f05785a101374348a71f70ca627a6801', '8c33e27cc1f7458d9e4e0de71f193314', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('13abdd27ee6a44e188df65747303daed', '3a48721d840e4f8fad665137448427a2', '8db077e26e19468db726b8df2c4861c1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('14270c57a38d4c8aa75fa418c790c5f5', '02e43255fb85404d9a488ac9e5159cbf', 'ec2a50d774964f3783710eec6a82d1c1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('143056ad8d6a4095af586b973c5af237', '11c90672c7654297b361a29e66ae7c78', 'ddb1fcd566b34e0d9c344b4917452df7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1443aa832612426cbedcc0da7d9a5377', 'f95a76ff9d0e43c0827c1c43583977b4', '6724f3b891fc408aa5b7edb2dfa5b816', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('14bb6f8f429c438cafc2fc016da472d4', 'f95a76ff9d0e43c0827c1c43583977b4', 'e0cef3bc24154cbba9df52068ea8a671', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1558c64d2cc5423e80e67d46aed769e6', 'd1d69bd942c041e4a42a422c85917ace', '98afb00d18ca48a9be90dcc093fdf656', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('156ec10ef17e4b2ea292a4312a314fd8', '4e9ecd122144441abb436227d5b1f4a8', '6a1a2836dac84a7ba3ed27c342001019', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('15ffe26feae4483585fabf3c83b525c1', 'f95a76ff9d0e43c0827c1c43583977b4', '398fb2b7bf884e28b642a611aec5b131', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1691bde404a34024b83b52259347db17', 'c5fd6d1549fe4a3d905a6cdec95c2836', '4b0f9c7613f04046b932cceb6d3a438d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('16deff08d14642b49918c9ba69f3445b', '02e43255fb85404d9a488ac9e5159cbf', 'b255261393c94c4c94ff3da59c8568ff', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('177d4c73f22144f9b1d40c6f80d27aab', '3a48721d840e4f8fad665137448427a2', '49a1af4221ba440591e3967bbd942886', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1782061028a64c28a80ba69770cd505e', 'e626902b31ac4cd7a667cd25ede18b3b', '55e544f33bcf41f982db03588738e958', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('17c1b4953d7146eda07ad350dcb106be', '1215c6b3ab8240e496f2efc9a610ce28', '4edfd62567424b8ca7134698b05c3a71', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('187b7f3594fa4b0f9f04a3668d8d3d42', '3a48721d840e4f8fad665137448427a2', '6bfea9748043496695e8dc2ad31ad3ec', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('191b93949fa64b8994c4199a45c3b6cf', '1e52771429a4498e85f78357da4818a1', 'af272c677c0b49fd848bd80037806084', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('19824bdf1e914f009437ae2afacbca92', '3a48721d840e4f8fad665137448427a2', 'c79bc8ec4efe46ba8895376b477126ed', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('19b1838b43304389815519442e1ab74a', '3a48721d840e4f8fad665137448427a2', '818e1bdbf6f842958830c55ab8f14b57', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('19f72a553ade41a4aaebb9723ecb99ab', 'f95a76ff9d0e43c0827c1c43583977b4', '8129086205f7491995d0be175a0cb144', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1bcfd8293cef481b9e219c59c44e0e89', '0264b365c78c499bacbde7750b3d61fa', 'e283f0c444604d6887eba34dd4c8de32', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1c167486eaec4e2d9b7519f5fb7b5f6d', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '0a9a8f8f967948f7bd9e2697106b05b5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1cbdc73e3e4143569091e5b15f81aede', 'b706395637624747912642e8f0e70b66', '7434652e802142f5b5b7c0dd8e648251', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1d2a9554c90e428498516c5b4037ab35', '3a48721d840e4f8fad665137448427a2', 'a2e42edd92d44adb8b519e35c2d13526', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1d4c61ea95a24857a32611a956f8a30c', '3a48721d840e4f8fad665137448427a2', '683f1d8cff0b414eb9b94bdcbc5c0b6c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1e18ce93121b459f85b77f7e19bce473', '1e52771429a4498e85f78357da4818a1', 'a460fae2674a462abb4e89ba0381c27e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1e652fb9106d4873bcc839ee541f4c8b', '3a48721d840e4f8fad665137448427a2', 'ba7a0971edd34a66bd5b4eba78709336', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1f610121f18b43bdb11d035b5772fe8a', '44db0306e0544723b3598178504d4407', 'edfecffefd0141fea29b9a3d3d13b94a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1f6ae07d28b04fc2810d16a3ccb4705b', '02e43255fb85404d9a488ac9e5159cbf', '4c50db0e0fec49b4a31131048cdaa2d8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('1ff5f56da7434d28adf06db8b57b95bf', '3a48721d840e4f8fad665137448427a2', 'f709e77bbe4542728f9de9a99c320eec', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('201f9e58440b455f92102a6112200df1', '02e43255fb85404d9a488ac9e5159cbf', 'c93915a6adbe428189f0a58b483b0dc5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('20354bb34492479890dc59c805a33eb4', '02e43255fb85404d9a488ac9e5159cbf', '5b787eea384b47e98a1bf20f06943e0b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2066539805104b33b7b0b7954915bb0f', '1215c6b3ab8240e496f2efc9a610ce28', 'e4486db9f31a42d28e10d34f7083f6e9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2085becc6cf341e596049fe0c54b0993', '3a48721d840e4f8fad665137448427a2', '9fa3a6cb25774a64b18af4b062ece66e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('20a091acdd464dfebed80e863dade5f4', '7122b002a88743808b0721dad21ec870', '5320a10775ff4a5382ef0603e2ec7db1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('20f92158fc2c4126af1388db947fa364', '3a48721d840e4f8fad665137448427a2', '6949b67ef05e47ec9ff33ba96850d65d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('210a4ca90b384455ad6867a149979afc', 'f95a76ff9d0e43c0827c1c43583977b4', '7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('21a8de236b8f413c95be9bb05b8a6cce', '3a48721d840e4f8fad665137448427a2', '6237616898f64d299e26969cb204ffb7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('223e08fca7444b75b7302fc42e598d67', '1e52771429a4498e85f78357da4818a1', '6cbec2647a834760b1f7a7eb3d6a68ef', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('23cb0ed6ef1e4bed85afc4e62647a24f', '3a48721d840e4f8fad665137448427a2', '929bd58d1eff4e8f9500c3c45c52a167', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('23ff980483a14454b838b01e529d9240', '3a48721d840e4f8fad665137448427a2', '616108ab5ede46d58109d62279c74192', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('240ed46617124eaebe3942e163d3a745', '3a48721d840e4f8fad665137448427a2', '4ed898d3215842209caf274cfaa6db8b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('24e3ce96acba4f1a9957fe3958dc13f9', 'c5fd6d1549fe4a3d905a6cdec95c2836', '639f92a0a94a4f2e9698437934ca42f6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('25b7e553c81540219e4952503e5dea5d', '3a48721d840e4f8fad665137448427a2', '489cb3eb77714de98b77b521457163e9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('25fedc0d02d142248ee0a427e7e88ef2', '880ce8e5f5614d959a6ca0b9463556cb', '9316bda3d1034d5e87af5b144c07ebc1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2682858cb6bc4dbcb79ba1ff5126fd9f', 'f95a76ff9d0e43c0827c1c43583977b4', '419f27ac943e4b4a98bcd1587041f429', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('26e6caf3fc9448df9abaad3ac2dfd166', '3a48721d840e4f8fad665137448427a2', '3f8ac42549564281977c344cd24119dd', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('270e9031da0540c6989bc7da47ea25cb', 'b4409dab4f8f4a10a33f1496441d52aa', '0df0d4cb1a354b0facacf959564c49dc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('271cf2f73b114f3ebed3b8e14cb3aaad', '3a48721d840e4f8fad665137448427a2', 'd2d47a21c7484b4d9e52b2d2d32d6e35', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2771148a1e4b4f8398ee6a25126805aa', '02e43255fb85404d9a488ac9e5159cbf', '6028fefbede34171b87bd15a387588e2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('28029c7f43e84d39bcbc5445791b4c7c', '3a48721d840e4f8fad665137448427a2', '42142ce1cc534d97b9f71cefee6f5612', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2822a382d9a145669f2a4a2cc0b228b2', 'd1d69bd942c041e4a42a422c85917ace', '50b5828a246a49329f4f6484f6884d61', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('28748577ecb143ba93ee280910256b75', '880ce8e5f5614d959a6ca0b9463556cb', '324591a36d514a6e90b91c47a1730337', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('28f600380e274c9587745f448815480f', '3a48721d840e4f8fad665137448427a2', 'ffcaa48030914689a33d7ac38436e230', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('28f7037d1b63446f9c729a0a404301e6', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '84b9a4bd3d82400d915dd849bd838133', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('29673096d3b849acbd95c2c066516544', '3a48721d840e4f8fad665137448427a2', '7b57243f43c04313b3b9728fd85fb3ae', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('29de2d3e8f214f4592bf501094c8fdb2', 'bd5ac400400546a1b0981f0a90123d0b', '966ebc38424047af986affa3f974bb93', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2a23e53a5877413e89b6abbe31aa7da3', 'f95a76ff9d0e43c0827c1c43583977b4', '2f1f21dc4f3c454a8ba8024bc1e8b71d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2a3f9c20954e49619c7d47bd3bc34583', '3a48721d840e4f8fad665137448427a2', 'ec2b3486c741458f8e377878e2908c7b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2a5f36b5b4584ac6a278c0e22487d894', 'b04e5351371c46f6916db875c3f4168d', 'b2354b1c596d4ed4969cd9fd4d3d6ee3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2b21035727154353a77602a6c3677497', '3a48721d840e4f8fad665137448427a2', '0c1701e2d55d4b63a8f549b197ba10f7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2b3c8f06684d4dea91f579960d7f611a', '3a48721d840e4f8fad665137448427a2', '2c19ad9392e44105bd5d98d0f9b5b1ce', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2b640835cf484c9180e175c29d28f230', '3a48721d840e4f8fad665137448427a2', '6e66508356794e098b26408f3f364d2e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2b6d1d746e3d41cfbf50fb57fc646c47', '3a48721d840e4f8fad665137448427a2', '4e086d622187423490ed5a43e8828767', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2c4cf780bc6146e5996efd6dad72fe41', 'd1d69bd942c041e4a42a422c85917ace', '6f10aa99f74343058baaf087f1c8856c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2cda03d95cde45abab060a5321995715', '3a48721d840e4f8fad665137448427a2', '357f0d77cede4e92a08ff36c84c269f5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2de279b9899b40aaad82a9fe33f390d6', '02e43255fb85404d9a488ac9e5159cbf', '988fdcdc631f4edbaf2dac1e5a0da3f2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2e2262ed3114431eb1b51fd595938fe9', '880ce8e5f5614d959a6ca0b9463556cb', 'cc80fab1c56b4e4aa124048d355e9ccb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2ed161a90958406187b6bfa5c3317bc1', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'b0c349bb114a42bda2b1f5b2ecb85f48', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('2fc5f1915f604e9db368b6ebd6226872', 'bec6152808724bafa6e55eacdf873a98', 'c3f3cc6ecc4f4633b8cc27ac99ad9a42', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('30141c106bec4b2abaeea294691bd5b4', '3a48721d840e4f8fad665137448427a2', '8ce86f908f3a4982929198292c9163a6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3060bc8fa2b745ffa7c827d46ceff379', '3a48721d840e4f8fad665137448427a2', '12f5d885c91e41d79cbc5541f06bdd29', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('30cc45ed94d44a9e8cbc1d839e174930', '4d5ef2e72b66484785d7a6a83a81a570', '1138bc688210449b8b48cef9c5664583', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('30da5b369bab41618a409a2ec5c1e550', 'beacc58c7ad2412eaf72e9ea7ae89d0c', '15090d7423e3416886225e35697547d5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('311c0402c6c6495688b93da9cfed21c2', '3a48721d840e4f8fad665137448427a2', '0cc99da00df24b869151d05cc33bc34f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3201faa6bc2e44038bce5b09eb9525e9', 'd1d69bd942c041e4a42a422c85917ace', '4e179f6685584f80a1c00520a63e8568', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3210400bc1374587bd8c3c4cb9639d88', '4e9ecd122144441abb436227d5b1f4a8', '4616344787ec43c69fa3e55e339096f3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('328012c9d73647c381b07b2e795c2960', '3a48721d840e4f8fad665137448427a2', '9da3514d9a7345d185a1446cec0dbcf2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('32ee84ed650b4b07bae3993b56be5403', 'f95a76ff9d0e43c0827c1c43583977b4', '786e2409026b4cefb0c154a8a72019d6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3360c3f459be4684aa64b5c3350f60f8', 'b04e5351371c46f6916db875c3f4168d', 'e9f8aee135df4c08a1c845e0f5e0f0a0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('336dc91e31ca441ebca291ad3ce40f2e', '3a48721d840e4f8fad665137448427a2', '40bb43d2e0424e0db7e4de7440efafdc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('33fa330ca3884f3a9c3874c2e98d438d', '3a48721d840e4f8fad665137448427a2', '37bef82b02fd498aaca8cb2fbe0ebb39', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3459ca01ebca409fb2075ce24be6ee5f', 'd1d69bd942c041e4a42a422c85917ace', 'da81e06a87ca496ea09734bf817707a6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('34d6833b2a474e769580ff30454140e5', 'd7a30c025fe440579f426ec4f37a81e8', '39ba959b9b0d4509b5e7f185c3370bda', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('34e78dcef90344c48c4b2b597bd59aad', 'c5fd6d1549fe4a3d905a6cdec95c2836', '68b3878b4dc14643bed1c2be4ebeb458', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('35423447987d4a548980db0ce4baf9dc', 'f95a76ff9d0e43c0827c1c43583977b4', '9a16c168ff6348b0804124e152df9d15', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('35d012cbb36947ef86a3fdd30ec67094', '3a48721d840e4f8fad665137448427a2', '7b9ae07d90e14a8f93b31229e3d0c4e9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('35da585e589f4d5a95d45aa2de4d14dc', 'd1d69bd942c041e4a42a422c85917ace', 'b5c521fa8b5a42a8ad4f1f46125892e2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('380c230ccf774cdf97eb8192a74edef0', '62361d5c487a4940b87b85f4ad09aa27', 'd3ac36180223467fa13a1e69cab71545', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3899382fb69b465fba544c4b5719b26b', '4e9ecd122144441abb436227d5b1f4a8', 'a27b8b5c9185445bb34e21f171949838', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('38d64a1e542242a2a18ee83523571527', 'aa1eab8bb18241558b1cd3ff5ccd2871', '93303b35c7c540c99fc17f270cf788f5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('391598cd5d534287b683194ef925f103', 'b706395637624747912642e8f0e70b66', 'cc5de259ccdc486b9134ac4b330e756f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('392a43e4d88f4f13ab47a7834f2a8e0b', 'f95a76ff9d0e43c0827c1c43583977b4', 'f6891dba98c04fc69faff0dd0b814bd1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3a062410d182437a94966cfc7c6b1278', '3a48721d840e4f8fad665137448427a2', 'ed4a51d66dce477c9fd52c4693da1238', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3a415b0c509b49479c4c58fdd54260c0', '880ce8e5f5614d959a6ca0b9463556cb', '9dd713da993545c1930c1b9487e85b09', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3a7127e5b7bd4df199db58abcca406fc', '1215c6b3ab8240e496f2efc9a610ce28', 'ecad08fab9a14f9c93a27ede9df9d9aa', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3abdd62ec26b44cb9372f09d97a1bec7', '22b19b4e9f704c4c82d430bf0a9e535b', 'e377639fff384710994fd58b7f26c5ab', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3b25700d44ba4ccb9d674e78d11ec6ac', 'e626902b31ac4cd7a667cd25ede18b3b', 'e12ffd939ee24aa987e1281e49fdf4e5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3b884630ca0a44a7ac3faf93ca75db84', 'e626902b31ac4cd7a667cd25ede18b3b', 'a6dfc92afff74abe86cfb7805bbb43f6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3bbfd4d282f44a37a7cf8f678926e0aa', '3a48721d840e4f8fad665137448427a2', 'c3a4fed868f046c9a8409e45f74be409', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3c071ee94160488e9f9d451230ae8edf', '7122b002a88743808b0721dad21ec870', '3f65d3fadbdb4940ad3d60f712c4b647', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3c166c12bea64c5d8ac927a66862cbbc', '4d5ef2e72b66484785d7a6a83a81a570', '808b982b20c54008823933855ss23436', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3c491db7742f4758ab7352645f506e3d', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'ba94ad352adc4acba02aa63c3cee7784', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3c7ec685bd724abcaea64c5ef032c593', '48466fcc547048de9294461cd6723251', '4865159354f84b8199da03e1ab86a649', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3dd95d3894ee45899ded76f85ecf38c6', '4d5ef2e72b66484785d7a6a83a81a570', '808b982b20c54008811933855ss23436', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3ddeca49892046bcb61539ec87a8c3f8', '1e52771429a4498e85f78357da4818a1', '3e2eb66ab13344f09cf2cec9f9e6a2c7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3e2587ea121b4166a50b6da40d113925', '4d5ef2e72b66484785d7a6a83a81a570', '808b982b20c540088239338557223436', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3e2ecf305d5b474ba84577d0f758311b', '1e52771429a4498e85f78357da4818a1', '79a29144f3c94cf197440a5c28ea9487', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3e71368f18e142848c7e50a479f1c07f', 'f95a76ff9d0e43c0827c1c43583977b4', '268d9d136f3a4969af7489d5d83a9eb7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3e7be49628694acbb33fecb89f18f6ed', '7122b002a88743808b0721dad21ec870', '7dd0266915504d67a13d93d20f9f361d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3f1e8403e0f64d4b8402a8404860d206', '3a48721d840e4f8fad665137448427a2', 'c6649978fa6044b7b4c2acbaebaa8208', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3f7644567fdd4e00af72577fabdee6df', '02e43255fb85404d9a488ac9e5159cbf', '06e95b89f5fd474ba94b956039405d8e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3fbf8cae342242b5862f8694fe30483f', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'f58e3070db784880811e838880a69fa3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('3fd04acaaf3b48f5a2d5ec0c29c7d3dc', '1e52771429a4498e85f78357da4818a1', 'db17aafc366a4d8a8e4397b5b426a787', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('40170bdf4ae7437aae00ee222ef0c24b', '1215c6b3ab8240e496f2efc9a610ce28', 'cde8dad25d5749c09ea495fb2db0319e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4051839b1d03481d802e5dc29373f352', '3a48721d840e4f8fad665137448427a2', '148fec5e14514090bc7ed86db8d60b7c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('40700d95f2bb4f139ace0f3903876f9a', 'a4740752f3564ff39aa41b409277e6eb', '95e7607845d94b4e9c149304d76b19e6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('407f440996d241d8ac652092f0011f1d', '1e52771429a4498e85f78357da4818a1', 'b8d7e81f7d7b46ba9a5a33ac82dc4346', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('40bbfbfa3cfd4465b37bf339be693bfb', 'a4740752f3564ff39aa41b409277e6eb', '41cb5774db2549fcb7bc2ad6eb319148', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('40c8c71b1ce04951a8e8b58e0f0d5405', '3a48721d840e4f8fad665137448427a2', '7985291af5114d5594979f50bc402fed', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('40e864148d654115a95226eb5d73b99e', '880ce8e5f5614d959a6ca0b9463556cb', 'ab7a708eab8a40efb411d7a7c12e033e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('40f450a2ef0048748d85192e42b474fe', '8f3ceee92c13429e899533aa767b6b24', 'cf6cb1a44a6142568ae7202282fe5635', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('413d5093d00c4b6ab31d815ba4cb9fd8', 'c5fd6d1549fe4a3d905a6cdec95c2836', '3135d0ead51b4732a77270df4ebad6ed', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('41593966638b4644b726495548908d61', '880ce8e5f5614d959a6ca0b9463556cb', '6260fd322ca640a7a949f47161789e00', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('41e0a243afee43efa2d4f0efbc57b7f6', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'd16bce1b516a472891105cef1449b067', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('424752802cbc452a89dbbd26eb5a053c', 'f95a76ff9d0e43c0827c1c43583977b4', 'f3125702cc204e97a9921fa523f7b3a0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('433f8396d5244192ba9ffe98ba3f7d41', '3a48721d840e4f8fad665137448427a2', '62c14e7217c44a8d8cd2601c41aa0cd8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('44197eca01f0469f8a16ea63748c8d9d', '02e43255fb85404d9a488ac9e5159cbf', '357761f71877422393e305243e96dd43', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4431165a10644b43bc1b1dd09cc83eef', '4e9ecd122144441abb436227d5b1f4a8', 'cd6349ebac564b8b89cbf5f9a67221fe', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4473c26d514948e8a3eb64045b411cfb', 'b04e5351371c46f6916db875c3f4168d', 'f1d2565e421e4d77a327f9c864fea5f3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('447e3ed7be99455ca4394487dd774e26', '1e52771429a4498e85f78357da4818a1', '46701986a36042ccaa7e308e89c19a16', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('448ce0deb5304ae1943f16ffe12caf45', 'b652cfe1bfdc4d849b76ddf33a282bfc', '661afca06d2448d29d120973dff78a6a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('44df5e8b72f9454381b016876a8c9829', 'd1d69bd942c041e4a42a422c85917ace', '613056eb5e284db8867f88fc6b1aaf0d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('45da4cbc06964b9caab920e9d07da570', 'f05785a101374348a71f70ca627a6801', '6be042b95fc540949aec45ff078e2d79', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('45fbc8a99dab43f89884f9e92e75e4e7', 'c5fd6d1549fe4a3d905a6cdec95c2836', 'a60943d36fae4b1589f5202ad18878fa', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4657d8b6d6c8415e80d690adc07487c9', 'f95a76ff9d0e43c0827c1c43583977b4', '5b3fe4d6732d4b5683cf603ff21f4c63', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('46e6dbf36ec54210954a130eb72774e0', '3a48721d840e4f8fad665137448427a2', 'fb439f611aca4c30bfadc73178595547', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('46ea6d5aae0543eb9455338b9c808913', '3a48721d840e4f8fad665137448427a2', '3ee6d0695c824000a9dcae4fdb912415', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('474411b33c6d4363848926b6247e9f9d', '7122b002a88743808b0721dad21ec870', '8bcfe25f840d4b8b9e47a8652c7bf8bc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('47c1daf0ecea4791b1392b87c7b19401', '3a48721d840e4f8fad665137448427a2', '8fd75d0784cb47c89963a38ef8431448', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4832f67094a04b04ad8b057c8d86508a', 'f95a76ff9d0e43c0827c1c43583977b4', 'f5578f6c07a048079a5dc6943ff06ca9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4898e3cd604b417fbd568b128edd83d6', 'f05785a101374348a71f70ca627a6801', '9f234daf998b4d18bec904e2f13907bd', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4969ca463d524fac89ab64a30b1f71ff', 'c5fd6d1549fe4a3d905a6cdec95c2836', 'ef390b9077e34b77845ed8cb4f7d6241', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('49cbd54140f749ee9a4878856dbabe25', '44db0306e0544723b3598178504d4407', 'e92173fc74744dd5acfd2eedc6e00901', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4a1134c70337400faab40eaced09a97d', '4e9ecd122144441abb436227d5b1f4a8', '07c54a67962745e6bb535975dd4cf342', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4a3247f3e7b344dd95d51a512f797d2c', 'c5fd6d1549fe4a3d905a6cdec95c2836', 'b93a2320ecae49748f00ac87d87dfcc1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4a8897c34f40428db30acb8fb07e6e12', 'e626902b31ac4cd7a667cd25ede18b3b', '3455fd25f16648b3bc66bc3335e9a798', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4b1122b530ca44bfa683f7098b04a983', 'e626902b31ac4cd7a667cd25ede18b3b', '9304ae4f148d4b8ebbef8836c38d5dd8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4b4ad6754d8343b39bfe025698c019d5', '3a48721d840e4f8fad665137448427a2', '6da7d0b550d8438788292803f597a42e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4b5a1086152a42beae877b9786641bd8', '3a48721d840e4f8fad665137448427a2', '39aba92caf3a4a90b6592e0ef8cf7756', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4be20aed0b4b48d2b7476ecdaeb1c198', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'db86c652a1404a91bbd27366aa69af1c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4cfdfcc8bca84c998cabc237c7986605', 'f95a76ff9d0e43c0827c1c43583977b4', '52f3360b1ead4440a038de37c8684a6a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4d0b033e832e4525b43ae2b59a663d5f', '8f3ceee92c13429e899533aa767b6b24', '4cb32b2a4b1049189bcc4361b63385e1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4d89a69455d841d4ae896cdd89514a5c', '3a48721d840e4f8fad665137448427a2', 'a5e7889c42214f5a94bd3d59f478181e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4db94bebffae4a69987ff1e15f8440f5', 'f95a76ff9d0e43c0827c1c43583977b4', '943a4703691a47e6a906b9b4859f2ccb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4e38022194174dc889bc85edce7c7f8f', 'f95a76ff9d0e43c0827c1c43583977b4', '8042ecdc3de140f9bcb0432f6d0de0cc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4edba4eb767b405392b5b67a950f84a5', '3a48721d840e4f8fad665137448427a2', '53558da61eb44124af099d0db08d9e77', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4f7e34dea7f64f1f8e7884711e56d3c4', 'f95a76ff9d0e43c0827c1c43583977b4', '6a5c05cd0d5b4345b6a41f5f68dbc1ab', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('4fa96959c40f465aa5a927d13c998dba', '059f8c7dc4064bb3b18d62e07c11b13b', 'e3fccec6ab894289841aecf79d55e36f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('50adbe9ec6764582b24cff9a78117865', 'b04e5351371c46f6916db875c3f4168d', '3734f993e6b04f80a344a61ab12d72a6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('512f3949d0d04b69b326eb9054888134', '44db0306e0544723b3598178504d4407', 'a48e3422c7554fe7acda0447acde3130', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5186cdf5f233431fae36ee6e4a9212fd', '880ce8e5f5614d959a6ca0b9463556cb', '46d7d573865346e1837c2f9871a8ecc6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('51c77c9b0345452a8928765de9d721ea', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'b59821d3a82e4fa4ba3cb27ceea979e9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('522e980c049748cab40a8c517e1f203d', '3a48721d840e4f8fad665137448427a2', '91849db8ae95408eaaeb8c5e832d7d89', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('52df86bb41df4db0941b7636da4b982a', '3a48721d840e4f8fad665137448427a2', '1578fd7ce0f446d990eccb34c0736715', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5324477d875b4eeebda54ed97f029ee7', '3a48721d840e4f8fad665137448427a2', '9b7deadef3f646d9bff1d23e4078e2b1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('535866aa954143cb9478c4100c6f63dd', '22b19b4e9f704c4c82d430bf0a9e535b', '40539f75d95c4fec98d18abde8cb1fd5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('53a9775245174e2dbdb3fb5df54d5af8', 'f95a76ff9d0e43c0827c1c43583977b4', '4a3ad5112b44462caf003bcd1743aba7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('54ac38c30a9b4d058c78d130e75a39cf', '1e52771429a4498e85f78357da4818a1', '122291516e0b4e9dbd82986a80965e07', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5585525711624ae0bfccb8646475a7d6', 'd7a30c025fe440579f426ec4f37a81e8', '5c8f5135e52e498b904ceaf3a0151f3a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('558c26b07d0c45499cae5b9befdba66f', '02e43255fb85404d9a488ac9e5159cbf', '0628195b81cc4c51b21162991555f24b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('55aa953fb2a64e67b502c40458caa62b', 'c5fd6d1549fe4a3d905a6cdec95c2836', '268a3895257d44bbb3886edee49cdff1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('561b95b9d87f4b3881f9772e223538a9', '3a48721d840e4f8fad665137448427a2', '9ae5973d22bd4646bd8492fcaed995b5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('58042cbaf5174e3d84647c3f16257dbc', 'e626902b31ac4cd7a667cd25ede18b3b', 'd68ed3cc05f743029d437dc59192c6d3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('59b5df8868204b0ea77a25c8b8011331', '3a48721d840e4f8fad665137448427a2', 'e8a31332d4ad472c9ee265383ee58597', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5a0e6d0136334bce9695965848026fb0', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'bafc6cbcd86343f7b471824962d0d8af', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5b36ce8b7b654a30b862d826dc87516c', '3a48721d840e4f8fad665137448427a2', '3a4614938e2445cda90c26175fc9620a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5b4a0658036449a189641cba5a5563f3', '3a48721d840e4f8fad665137448427a2', 'e66ea30cdbba47508d074b5f76f8f2b1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5b8c5a33edfd4176932aba0dbb2782fb', 'f95a76ff9d0e43c0827c1c43583977b4', '78a6e480464e4c14a78bfe2bf3ccbf98', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5c6503ff74f1458d93b34f01d665a821', '3a48721d840e4f8fad665137448427a2', '7b4cf91275d946b9ad25e23d3faebef7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5d19f680820d4b1fad2a0d8d2009fd20', '4e9ecd122144441abb436227d5b1f4a8', 'ffa4ad83b4a947188257943a12910a73', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5e1d8e43e04c4a788605f4541008840a', '3a48721d840e4f8fad665137448427a2', '227f0c89c6894699a796589225f43344', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5f0f0712218544d5bfb720c4862a269b', 'b706395637624747912642e8f0e70b66', '193c2fa8a1234bc2b189c46d18990578', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5feff910f039463e93324ec99651de1a', 'a4740752f3564ff39aa41b409277e6eb', 'b56174ad32ab41e9835c904a207dfcc3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('5ffe7a39a0244a579586488c09c69e84', '3a48721d840e4f8fad665137448427a2', '36f632fccaaf484894469553fdcf8ebe', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6116af28e3694536a007823cae2fb278', '1215c6b3ab8240e496f2efc9a610ce28', '4ac6a78516584a91982c5e1ebd1ae187', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('61abbd178ddb49d5bcd6758724d7186c', '3a48721d840e4f8fad665137448427a2', '7ef3b93866b1432691175627a0c7d15f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('623e47516a764a7abd16295d512af049', '880ce8e5f5614d959a6ca0b9463556cb', '14c8cb4353f849f2a2eeee787ce9a529', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('62550ba7799346b6a668abf676d6028a', '3a48721d840e4f8fad665137448427a2', '24da47d5bc004eb0b98bd0aee23ed475', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('63a5289310aa441698eedc130eca1cf6', '02e43255fb85404d9a488ac9e5159cbf', '1434e92d619742c1adc05e4847c100ac', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6442140a495f4c0598cecd0f2ae32b38', '3a48721d840e4f8fad665137448427a2', 'dc300f7c0eb348a1b6549ae3709b82ef', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('649d6bf6a3704e6ba43e71311b31d29a', 'b04e5351371c46f6916db875c3f4168d', '2750c38da5b9466db5c09c4f4763126d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('64c9d465bbc949d9b920fa478e2516dc', '3a48721d840e4f8fad665137448427a2', 'e79dd44e7a154834a028c02219573c1d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6570c37e2e4943c982a3b93fed10b058', 'a4740752f3564ff39aa41b409277e6eb', '01c009d5c57b406194e457920c242406', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('659a9c6662964ff79986d190e77c9726', '44db0306e0544723b3598178504d4407', '47168107e95c49b783ed3221f053df79', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('661900a53298402bac62c3fb69c1d7c0', 'a4740752f3564ff39aa41b409277e6eb', 'fbb91ca664be487eb5a449f008942362', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('661bdfdc66a04e4b9f91cb1afe221c0a', '3a48721d840e4f8fad665137448427a2', '314b918d4a00485d823a33ca71cb529a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6660b171dac84756ac69b3c20a5fc8d3', 'd1d69bd942c041e4a42a422c85917ace', '3b052179e4c84448ace99e6cf963f246', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('668536d6d0db4587a01ca30be4cce4ba', 'f95a76ff9d0e43c0827c1c43583977b4', '09969d64476d45669d60908d744315cb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('66dbe0548c92429ab8e47ce80f2e2243', '3a48721d840e4f8fad665137448427a2', '8c5c8f94b59a44a683b4da3bf9038b03', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('66e76c1e06a44e7eb1dabdb32fa06e83', '44db0306e0544723b3598178504d4407', '4bd1ec85ea3446b69727a1663bc24411', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('673bf00ba9af47b2a99271f860520a80', 'b652cfe1bfdc4d849b76ddf33a282bfc', 'f391f61c989a4e6ab2d521c8f1d71315', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('675c3f7e78b448b6a54ed144d457d317', '3a48721d840e4f8fad665137448427a2', '6622c47d178e4916979c63c033913ff0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6760e5c2b1674ddabf65760b6cf62f63', 'd1d69bd942c041e4a42a422c85917ace', '6c2efa0a71ad4b03956926b51d08d514', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6765adc95bc147149870b7329397a5c8', 'b652cfe1bfdc4d849b76ddf33a282bfc', '7c724c806b8b44b5b7be7f4418a3f3c0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('67b6199e23994106ae9286b1f60108ba', '02e43255fb85404d9a488ac9e5159cbf', '3cf6dd825ae7402e83ae0634b409ecf4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('67bf5973043f4b4aa34a0740ea3ecb44', '3a48721d840e4f8fad665137448427a2', '56411df5964b452fade0f0b0577f047f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('68d25254fa5e401ea57be1a599f16acd', '3a48721d840e4f8fad665137448427a2', '63eaf3a5a941498dbe996590ae44c66e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('69c166fd45ff428180cab3b28783a430', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '0a8f36e9cd4f48eabb643bc9a344618a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('69cf5c19eb4e4b2d8705197f707c7da2', 'f4d94d5ab87a4efb9d47278396709c4a', '7f47fc9a8f734c71908431e7ed98afe8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6a8104d7abbe4a21bc366d468cabb275', '3a48721d840e4f8fad665137448427a2', '5a3412c5f40c4b24893e2977817bea8f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6ae3f4b406ba480bbb25bb00aadbcb65', '1e52771429a4498e85f78357da4818a1', 'fe662e646a52406eb283cb997952333c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6b58463361404c2095acb6a6a8190b2d', '3a48721d840e4f8fad665137448427a2', '30e030d9f66641c09ae0fe985305ee1e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6b82064fb5a44592a89ac2e6c27018c3', 'f95a76ff9d0e43c0827c1c43583977b4', '0a28a9353e1c4947bb8c813d0db1f0f2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6baf55f676dd43ddaa3547295eb2e9c5', '3a48721d840e4f8fad665137448427a2', '57b17a4c9f484f6f9b0fd961f7bf7d4b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6c10001fecc7499bae9603a5ac5e8c61', 'f95a76ff9d0e43c0827c1c43583977b4', '491a5dbc8c484e5587099435816f9dfd', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6ccdec19d6994c3da365dbd1fbc0a3bf', '3a48721d840e4f8fad665137448427a2', '0129dea17e6f44b2825b32b088aae90e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6dac1e76562b413382e07f0e4cf62a63', '4e9ecd122144441abb436227d5b1f4a8', 'b0ea45836ba04ffc89806693e5e5d38e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6de85f7464cb41349bd761637422e388', 'f95a76ff9d0e43c0827c1c43583977b4', '89896caaa53e4255aa0d644571755039', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6e193866864f4023ba738ae4945f4ab2', 'a4740752f3564ff39aa41b409277e6eb', '4f2dbc3fe9b9420d92a747e698f1b979', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6ecd124991dc47e7b354a5569b4d2da4', 'b652cfe1bfdc4d849b76ddf33a282bfc', 'c944cbdb26ee4cb098e93fa9391b0959', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('6f9a0a9849e441a796f4f82bfa7a5da9', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'ef88e3aa640c471bb1a178854cf57246', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('70698d8c2ac847a2a4c9f4fdc341175e', '02e43255fb85404d9a488ac9e5159cbf', 'f0c54f6b2edb4ee9aeca680413033bf5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('709d320809db4e32ad37191b37d529f5', '3a48721d840e4f8fad665137448427a2', 'd5dbbfa42c314bc48d7299c7ee932797', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('71fda00806f84c8c81317bbfcfd4a867', 'f95a76ff9d0e43c0827c1c43583977b4', '58750ab74f3643a2b5e67478fb362ff2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('725404fa62a845538fd788323a1d80d1', 'e626902b31ac4cd7a667cd25ede18b3b', '662e5ea3b10e43b99c58a6dbd63c9efc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('725bd9fb52a644d49584a4af47706849', 'a4740752f3564ff39aa41b409277e6eb', '5ac53cb628ea4b79960d73244726e31e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('73560544c27d4d61b3ec70cf16e62265', 'f95a76ff9d0e43c0827c1c43583977b4', 'e62ce0a22d794d82b113a3f4d2ee2f25', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7358f3c8068742e78f4acc7f41221047', '4d3be319e3544a768242efc37c1f0441', 'd5d416ccde024344a222555b55a659ae', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('73b29317aa284e2f86ff6dfdfd31f351', 'e626902b31ac4cd7a667cd25ede18b3b', '645a027caa1c47b6b63b2ad2aad0205f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('742d06227899490db78406bd6dfb5de6', '8f3ceee92c13429e899533aa767b6b24', '763eea07a33646aeb5307a45b59596a5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('74544143a38f4056a62c4b0c0f617c5b', 'c5fd6d1549fe4a3d905a6cdec95c2836', '466656296f5d46149d7426403f4ad70b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('74abd1a1771549efad9e7ebc3a7a470e', '3a48721d840e4f8fad665137448427a2', '8c8291323829448f83423be83f17142d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('74bd12807ae74a3ba2a91ee6eb408be0', '880ce8e5f5614d959a6ca0b9463556cb', '0c5380f9c3bb424bb463b0e2e8ba3033', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('771437c43ed44499afdcdb091ebe85fa', '48466fcc547048de9294461cd6723251', '895ff113a3704e188f6af9853381ca09', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('773260127cdc449fa01271a00ca75d8b', '3a48721d840e4f8fad665137448427a2', '70066b4b5d864664b2352557cb35b040', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7791b39e811c4160890a345e62e7e324', '1e52771429a4498e85f78357da4818a1', '8c7951372d94414eb18ec7d8f6a6b521', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('78962bc7097d4057b5361b99f5595551', 'e626902b31ac4cd7a667cd25ede18b3b', 'dedb3603215e45648e260e6e7fa43a98', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7959da1c701d4be7835dd9380c03e51b', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '146549f01447412093dba533cb637223', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('795d15e6701647ff97dde5fc556ac05a', '3a48721d840e4f8fad665137448427a2', '4bd8ac40c6d648c8b68e6db0958c3286', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7972284ebd234ae4817a70e6ddd7ffaa', '3a48721d840e4f8fad665137448427a2', '86f83e2a1da1498a81a3ef359e967e7b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('79e56b79a7a24d96819da404bb429338', '3a48721d840e4f8fad665137448427a2', '6511adb61c9946b286a55986f3589f7f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7a48558ce7fa422e94db7a55df5cc64f', '3a48721d840e4f8fad665137448427a2', 'ef193b07ef414ba0a73cd8e013e3334b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7b19e2c2f5df46a2a1d0b9e27c3699aa', 'f95a76ff9d0e43c0827c1c43583977b4', '974da438f6fc493c95ddb72f09dc14f6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7d0fa457e805482baf12233bcaecde88', '44db0306e0544723b3598178504d4407', 'caf1a9c9af0949df821870f556f35d8b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7d2e679838e145feb7ee59245d7fe266', '3a48721d840e4f8fad665137448427a2', '8b03eda612934c71937b4d694ae1b530', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7e406ac5d0d949b5bcaf2fba72711df7', '3a48721d840e4f8fad665137448427a2', 'b64238da9b744f69a80cb584204cd083', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7e545ae49aa542bf953d08090a48d4cd', 'c45a2fa90e2f451ba751dd922e0d25e1', 'ec885e74e7ad4da18cda6d39ee495dbf', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7eba33c4d8d54db9b94da728983ef5be', 'a4740752f3564ff39aa41b409277e6eb', '25b115a4a5724608a7d297e16d16c988', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7ebdcdae0d4d4be9a2a4cca99fc156a7', '3a48721d840e4f8fad665137448427a2', 'f696dbf457a347a48a4fb4310746d00f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('7ff49ed19a8e480cab226b008a68b0d5', 'f4d94d5ab87a4efb9d47278396709c4a', '6a5d9de5229f491cbca97eed39a4e03a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8018ee479ddc487481ebf58f140c8d32', 'f95a76ff9d0e43c0827c1c43583977b4', '80cad330a5784a5182f2fba75f7430ed', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('803a9e9fd1db4d799046d08640a419d3', '7122b002a88743808b0721dad21ec870', '43c5ce2e72754ac89c00e241afe48d5b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8061cf53062f4569ba65ef56064c06ce', 'f95a76ff9d0e43c0827c1c43583977b4', '211968db7add4a27acfa2206b0caac76', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('818fe9de64954ef3a56a68c6c7908af7', '1e52771429a4498e85f78357da4818a1', '12584b6f979143418a6d06b968f710fb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('81b6ceb4ff8641ec8fa06944286d01c3', '3a48721d840e4f8fad665137448427a2', '1f1361e9a87a49bd9165531ab4e2516f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8356ac5ef649485aa6827470bdac1e9e', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '73cd7a1dfebf43b8bbd47dd46ad73c13', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('83a2716162fc4d4bafc27dd33dbbc14e', '1e52771429a4498e85f78357da4818a1', '3aa3e879f440415e9161aa453e408d65', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('83da2470d775485b9c2b59d5a42530f1', '3a48721d840e4f8fad665137448427a2', 'a958928d5e6b4f60aa1f05bb84aee542', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8426a073ab3a4a16a7b471b41bb31134', '4e9ecd122144441abb436227d5b1f4a8', 'a68d0a3024f74d59a121f212479f8ff0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('84ccb7b580ed46f4813d9271d890a794', '1e52771429a4498e85f78357da4818a1', '2d5df45347a140b3bb804c39ba49e91a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('854c5aeb43e34964b6dc851384143f7a', 'a4740752f3564ff39aa41b409277e6eb', 'b1ce6ba4039346bfabc504cb13b47448', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('85e57de5618c4916a381da2d1b349f24', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'abf1f95dd1ec440fb3e1fb8b0e8604d8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('87b10ce3ca964ef392abee2c88aa0f7f', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'ce8cf6ef43184b87864d7faee691465a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('87fa95f79c4d44d7a4ce67da5030e23a', 'f95a76ff9d0e43c0827c1c43583977b4', 'aecb10b21e5a4263a46352b55f9310db', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('881f28da07d8442cbd56aeaa6bb8c0d0', 'e626902b31ac4cd7a667cd25ede18b3b', 'c2aadc2437d34c0ca8674e66d1cf6ca0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8863c3a4be5b433699831924abb4e334', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'ff7f9e9682d5449b8baa8baa8f406f21', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('88cb01167f50467fb30ba9d713313838', 'd1d69bd942c041e4a42a422c85917ace', '803f5200b7e640469248002204679e23', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('88ce9f330aed4c2c80d4420183662f35', 'b706395637624747912642e8f0e70b66', '376c05c51eb94d34b2a0dda7be74cc72', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('895b039986014aca9f5ddf03ad955319', '8f3ceee92c13429e899533aa767b6b24', '77543219532446d7b167302b05fd5138', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8aa206de5c17456c8dc647b03c9b1850', '3a48721d840e4f8fad665137448427a2', 'e2de5e89f7ff46bca9456a5f11e19a4c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8ac2514c3c1f4219b080f238a7dd79b5', '3a48721d840e4f8fad665137448427a2', 'ab027ebefcc6425c9a6ba1962cf96467', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8b11ac8259ee4ff3bee9580a5ad442f5', '1e52771429a4498e85f78357da4818a1', 'c588f59628244b08960d18b7b5dfd918', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8b2ea9ad93f940f6a9f8c07842e7e5ed', 'f95a76ff9d0e43c0827c1c43583977b4', '3a358216d7a143ebbc22b72e7efad439', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8ba72982fbe04252a599f5b33e8e40ed', '3a48721d840e4f8fad665137448427a2', '50f1822101484503a6141d1baa28f6e2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8bcbd8f6a1b8499a84d63d44a67fba5c', 'a4740752f3564ff39aa41b409277e6eb', 'a935ac37f6c14b81bc661b6b9b57bccb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8bdb89920b3341518bd489aad8722d71', 'f95a76ff9d0e43c0827c1c43583977b4', '987d1fb2ff414d18b76b979c8bd87c2e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8c63a177198c40a08984cdc22256abfd', '9f88b04e5240473a9d639f19b59be45f', '7527b86588ac44fcbec46e5cdca4e06e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8cb16e26ea33452c939fb22a67c80ea1', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '7d8eca821a2245678c6035359ee3e8ff', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8cb7ccddda7146cdae494e9601cd50e2', '1e52771429a4498e85f78357da4818a1', 'bfa038d04b9a4a8daa1c11e51e7bfda3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8d92a30e3fec4863babcc7c211eb2d62', '4e9ecd122144441abb436227d5b1f4a8', '20334d0c575f4bd6b2572f8c110029dd', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8dbab10e3aa24946979ad7b4bf01e841', '7122b002a88743808b0721dad21ec870', '91d64e833a4642a3ae7e607989bf91d3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8eea3ca038684fc3b21d6ec83a8e874a', 'b4e381329d734d218c0a445c23ec0344', '39fcd76f5b1744d08113d355a13799a3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8fd216db19ee496ab9e4726cacba13ff', 'a4740752f3564ff39aa41b409277e6eb', '5f139dbb98264e63a5608bfc4493af92', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('8ff4caef8d8345a9b40da81a2d0cc3d4', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '0a32e04a04dc4bb9b73372c78b8ee071', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('913de0c15e634110add26716ab71478c', '880ce8e5f5614d959a6ca0b9463556cb', 'bead62b908334c24a6590f297dcfed3f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('914e8b29673c4b1d8d3bbfc13cdb7afc', '880ce8e5f5614d959a6ca0b9463556cb', '7ce457d859df4a888496a5eaa2873d4f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9150a06e989f4211a12cd33775cf7572', 'e626902b31ac4cd7a667cd25ede18b3b', 'ad6ef7059a994198b35d598908a747c6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9167134f8c484794bada8773bd33142f', 'f05785a101374348a71f70ca627a6801', '2c2ee110c2f94d2e9fff0818ac3cd39a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('91eda856d4c54928a871ddfd9a0a7434', 'd80bffe971bb4016a902610b8a6fa113', '07f7130c1cf74b499f788d9068bf0db8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('92a7d9503b244ba5b71f729c1f0d15e1', 'f95a76ff9d0e43c0827c1c43583977b4', 'c9fafe8771a847ac9947e19b00c4e2bc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('92f9aab9a38940ad8e3b2e83e74283c3', '3a48721d840e4f8fad665137448427a2', 'd5b63f2bfb86404f97b5785f382fdd92', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('93097614228b46078b26b04a004617d4', '880ce8e5f5614d959a6ca0b9463556cb', 'd747ce86f9d54c3fa03a33ab4a281e3d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9334bad05c9741f99e1a876ba2aca284', '3a48721d840e4f8fad665137448427a2', '25f739de4d394b738fd10e72c186a342', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('93415bb0d1ef4ac7aba1bec5003fe342', 'd1d69bd942c041e4a42a422c85917ace', '9a39eed03f5f4493958482f4a2513228', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('936532fd18824f858b8cba062f6cdc11', 'b706395637624747912642e8f0e70b66', '295f29d81a6844b1bb9d363f23d3a118', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('93bff81da2cd4baeb2504fb4932b28e3', '880ce8e5f5614d959a6ca0b9463556cb', 'b47826dd6b8540dab3a59db6dc5223d3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('93f3dac063474302964b8d1f06a02aac', 'f95a76ff9d0e43c0827c1c43583977b4', '45b783dfdae14084a01f598ed53b37a3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('940680f843fb4e33b560547094a4e791', 'f95a76ff9d0e43c0827c1c43583977b4', '1d629e3998a24a629de11e699e5daed4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9411e2bf8d7f4458ad2a9b35510ea8ca', '4e9ecd122144441abb436227d5b1f4a8', '648da551a3214cecab54078feb3a8ebc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9494db8ac2314cc3884019183438b155', 'd1d69bd942c041e4a42a422c85917ace', '0fdf9ee7c7e8445b9160966d5592907d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('94bae87ffe1643e09ed914c9ecdccad5', 'd1d69bd942c041e4a42a422c85917ace', 'd52d5c579080471ba288beced043e510', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('94c2d9e770074198b6aa2a630555a153', 'c5fd6d1549fe4a3d905a6cdec95c2836', 'cc4d642e38144d5f98837bb202ab93ac', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('94d3bcb2e14c4ae597e673cc3fb29c3b', '3a48721d840e4f8fad665137448427a2', '6c091cdb869b4072b42b9145fbf7f03d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('94f1832bced34fffa048e58af77bc91c', 'd1d69bd942c041e4a42a422c85917ace', 'ff90d961dd904316b8c2e125b2c1e901', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('95182eba92794e2485fddc78e400c306', '3a48721d840e4f8fad665137448427a2', '595786edf10445dba577f1e6f13b1c1a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('95c7510e10a843b685bfdf7703dd4d97', '3a48721d840e4f8fad665137448427a2', 'db652e6c182b42ef86bf00cefd10d8cc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('95ca590a45df4ff3888da361996650c7', 'c45a2fa90e2f451ba751dd922e0d25e1', 'b921dd59d4eb48aea6ab5a5480aa7f11', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('969bd6294f9b41958e2ef70acf24fc36', '3a48721d840e4f8fad665137448427a2', 'ab325d265fa14c5bb9e402797df615d2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('971bd3c748b14056b84973742be9ed5d', 'd1d69bd942c041e4a42a422c85917ace', 'e5a6c547e6fb48baa6287c3590bb155e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('97dd73f125ec4af1bca88e80ea50d460', '3a48721d840e4f8fad665137448427a2', '6295e6c863b341cba147fb19beee10b2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('98003be34bd244ce9b84920427d187f7', '3a48721d840e4f8fad665137448427a2', '33fda7cf43ec4eda90ff9b774bb687a0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('985b87ec44d449fca4c5c031a680c744', 'e626902b31ac4cd7a667cd25ede18b3b', 'a63f0fe4137c4ae38fd2f34bf6327f3a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9895dcf4da494d729d12d60b0a35fb72', '8f3ceee92c13429e899533aa767b6b24', '3b957da2392a4140853cfc373b3c57cc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('98ccba9e111e46f8a89131b53b80bde5', '02e43255fb85404d9a488ac9e5159cbf', '26e072db1f8d4984a734a38ec36ae61e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('99018fd69d794f25baba163d7ba7c5da', 'f95a76ff9d0e43c0827c1c43583977b4', 'a1a0739a07574415aa97638378e5f908', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9938f99b2c3d429781ea05a44a6ee6d9', 'f95a76ff9d0e43c0827c1c43583977b4', 'f41734232ff4422db30aa9248aefc9b8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9979fcb9029149ff842d3e546276d9c6', '3a48721d840e4f8fad665137448427a2', '223793c42c87440da1ba3773fb06e21c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('99db11e514d440c09f5f5298c195216b', '3a48721d840e4f8fad665137448427a2', '6b4dd3f9c8c24da2863a0adbc4d42d74', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9a6dee40d40b4c999c2665ebc5e7674c', '3a48721d840e4f8fad665137448427a2', '0c4818255d1e48a788d6c5a8c80b333c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9a978769cb76442d8652b917d5a855e8', '3a48721d840e4f8fad665137448427a2', 'd24d0bda6e584684b0db82a2e6e084a9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9a9dc7ab37ab49258d625da2a6a285d9', 'f95a76ff9d0e43c0827c1c43583977b4', 'b976a59b88084ccea193bafee276e97e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9aad170130804fd4be9889e46cde7d3a', 'c5fd6d1549fe4a3d905a6cdec95c2836', '77d938aebc0142bf8f372f692ad85563', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9c0344e11b474323ac4b38f21aaef9d7', '880ce8e5f5614d959a6ca0b9463556cb', '663cc22238ed4110829a0c3d2b13664b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9cfe8f2bcff34e4587683250d8dd2707', 'c398fd1ae5ca4edabfcf5c67870f0e56', 'e6ac60a76a2c46f08b550b4e9a03937a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9d182a05c57c4c2797d5838b326c7d54', '1e52771429a4498e85f78357da4818a1', '20dfe68d8c50402eb0139689432d35f5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9d382d5037f64eaf9ba3ddcf8c1c7c18', '3a48721d840e4f8fad665137448427a2', 'b945c8a8759c462f9ae36115e6497a9f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9d694805a7914ab0bdab6dd214321d62', '7f9b2e8b64014adf91c3f00312e8f74b', '4c358e992a0c4090b1e189040e740116', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9dcb6a1f60f24b448332e45abe2e3150', 'd1d69bd942c041e4a42a422c85917ace', '793453663af04e8ca51b570ed8e1d694', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9e76b51097994b3d830fc29708211c82', '02e43255fb85404d9a488ac9e5159cbf', '53cc836005884da39811051de2a8df9c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9ea22db4667d4bdda90e64f88f662c10', '4e9ecd122144441abb436227d5b1f4a8', '88ae648feebe4c4c8da1addefd2b8096', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9f1aaa1cd14f4a1592766ed684b09fd1', 'f05785a101374348a71f70ca627a6801', '63d2d9b7c9124418ae1b8d0b8d66c4d8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9f40a81a455d4a288b8d88b5d9800980', 'b706395637624747912642e8f0e70b66', 'a24d857a14b04abf9dd54161a22e68f5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('9ffbd40daadb49fe87fa2fe9fa7192e6', '4e9ecd122144441abb436227d5b1f4a8', '495717c360fa4c079ceae9807a03817a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a043822775804579a9d9f814a6ed2b7f', '3a48721d840e4f8fad665137448427a2', '3962d9a7675b425499a1ae8f8e49dd59', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a0762206a1b745ddb74ce893db8ef192', '4e9ecd122144441abb436227d5b1f4a8', '5644f8d9358a439db8a6df83844d4542', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a080afb68b9d4c04899d7a6874b586a8', 'c5fd6d1549fe4a3d905a6cdec95c2836', 'eb65b80c4eb240ce97e700dbc8bd519f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a09ed8497d33417a8d5ece0eea72ed94', '3a48721d840e4f8fad665137448427a2', '5111a9e3573f4480869b874da05dabbb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a1d8f42dd6614f0dbf60441c5c892d91', 'f4d94d5ab87a4efb9d47278396709c4a', 'd692952a20884eb9a3e020a72f627c30', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a2a32394c72d4dffa9271b018f3d5c1f', '7122b002a88743808b0721dad21ec870', '79535ba4f65041d1bdb868c305dc5207', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a32b6bb794164f98a570fcc7fc05bd1e', 'f95a76ff9d0e43c0827c1c43583977b4', 'a4b0f0c169204c5e83fcb1e117948f9f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a44d83095ba24b00aae3c72b4a0a8c43', '0264b365c78c499bacbde7750b3d61fa', '67db5d9043bb4e758b6081696e84418a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a4992c133d62453ca9eaec995cb5a0e9', '1e52771429a4498e85f78357da4818a1', '4ab1150c0c6146bc9d4ed6073e3f31bc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a5a7a92a8708480496dce83c72bf95f4', '3a48721d840e4f8fad665137448427a2', 'd7cf62b5fdff4d1f8373cf1168ab4315', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a5a82e70f0e0429886a2512ee96daf36', '3a48721d840e4f8fad665137448427a2', '1bce0bfe2e2c4befbfc4e595d2e4c03d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a5bbdc6f4ff8417286fac5a7f2e67568', '3a48721d840e4f8fad665137448427a2', '1499545389e24d84808351090dfa8483', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a68c8fbdf4e9490098dff95567355382', '880ce8e5f5614d959a6ca0b9463556cb', 'a487a04cb0df44bd8594f5a89ebe13da', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a7135247ac8342cda57178295b381451', '3a48721d840e4f8fad665137448427a2', '6171dbb9940e404fbe73a4998c006856', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a788776178644cd8965427b298178a47', '880ce8e5f5614d959a6ca0b9463556cb', '606c7a0b392842d6877150e1a65e5f22', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a893af473b7746e083f42596dcdfc8cb', '22b19b4e9f704c4c82d430bf0a9e535b', '662d18e5e04c4e0789c574e4f0283ce9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a95863ee6d1049279077e60bc5780cc2', '3a48721d840e4f8fad665137448427a2', '17d12b65c3934b1b924feb5b22bcee86', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a962260c383d46f8af1681952b9cfaea', '1e52771429a4498e85f78357da4818a1', 'f2525c269414423b8d291e3f114a67b3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('a97cf5f0569d464a92a87e4f7df9589a', 'f95a76ff9d0e43c0827c1c43583977b4', '309263d9881841a8bbfb9ab45dc0f9b9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('aa5f4b516f804a2cb454a4c4d230e458', '3a48721d840e4f8fad665137448427a2', '01b64fd2aae44f42803eae0abda21272', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('aa86193c2b794a5bbbf22036dae7c088', 'b652cfe1bfdc4d849b76ddf33a282bfc', 'd347ca7d28a145078e112bdae42817f8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('aa8c49a9e3f344309f05a7fdaf28f81d', '3a48721d840e4f8fad665137448427a2', 'd2ed0fa181544d19a15387f411fe7b06', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ab0203179045486695e7d7f106e0b45b', '3a48721d840e4f8fad665137448427a2', '35340d4c95eb469d9e52f164ea80e20b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ab28675bb34a4c22938c9865aa6aeb62', '1e52771429a4498e85f78357da4818a1', 'ad091efb022048d8b4746f1fe46dfd2e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('abf690502cea44fdb78ea96fb977263d', '3a48721d840e4f8fad665137448427a2', '3b34769a7c184f37afc3e85844f809b9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ac15ccd7300b468382d20f0156a89a4f', '3a48721d840e4f8fad665137448427a2', '3bfa5fd1516948cb9cb8fa8430744774', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ac7fdd850074459ead85c5a9cf69cd39', 'f95a76ff9d0e43c0827c1c43583977b4', 'fd5c51d3ae5f445693ca28aafca111ca', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ac8ea6cb3f1b45f08d57274bf0dec6b3', '3a48721d840e4f8fad665137448427a2', '4382c2df8b93463db2227c9896d02037', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('acb918a299fc4701892a66638295f494', '3a48721d840e4f8fad665137448427a2', 'e1c1b93ee2c24100940e95e1bf325a16', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ae745b2311bd4ec7801a03cc13189cb9', 'a4740752f3564ff39aa41b409277e6eb', 'ace8fbe9092742479f93fae1f2ff0333', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('aeacf268b8064a95a8c5405a54ad4e72', 'f05785a101374348a71f70ca627a6801', '38db6793f97646dc9eee25e809b1c538', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('aeadb83970b643a9b168496fc05934a4', '3a48721d840e4f8fad665137448427a2', 'dd60b389ae2541b0a1bdd932f6045f27', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('aeed92cd4cc64ff9bcd860e1e2dff122', 'd1d69bd942c041e4a42a422c85917ace', '828c1675dcf94368896efeb91f26b75c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b34466ee4173459abcf34e643d843a64', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '01dbbf64efa74e9fa5eb394224f57bb1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b3d0f7380ca741ab85db2871fbc48894', '6d0a952f56b348f4a4a2ff3cc43570c4', '0df0d4cb1a354b0facacf959564c49dc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b417de7317b1422f9072936a475ee7a6', '8f3ceee92c13429e899533aa767b6b24', '7ba75f8652b64af590862235251f9316', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b448780d3c7a45b6bdf39ce2f205bb62', 'c5fd6d1549fe4a3d905a6cdec95c2836', '0b310b26659b4491b3ff1420c13196b1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b61a300851fc4f8e84b36349c7c198f7', '3385adbb93f64623956200120f4f6987', '22b9c4ed882d408fb954353d443af370', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b70b6d2d40c3401aa7fbcd0d297e3297', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'a86d99d775c847528cd59455038e2061', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b7a6db91d6724bd48860e4be8331487f', '880ce8e5f5614d959a6ca0b9463556cb', 'e708ee053c6345adafba978190944228', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b7ccb795103c416fac12115e629eac10', 'f95a76ff9d0e43c0827c1c43583977b4', 'de00b16caff94586bafde33643c9117b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b85f929f1a9e4f42bdf7244cefcf2bda', '3a48721d840e4f8fad665137448427a2', 'd6943095f050472dbb20ed7e48ac1deb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b8f5d77ea6424d389ae702d80aaa308c', '3a48721d840e4f8fad665137448427a2', '629b19ece3de4468a5e4744729cffa4a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b910bddb56884b32943ffb160ecf8123', 'b706395637624747912642e8f0e70b66', '821485cd72fd400687bb6c3e1d9418b5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('b933d51174184a5aa0b83f6a54c757fc', '4e9ecd122144441abb436227d5b1f4a8', '5e774728a3754558bca7deaa3cffccc3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ba63d80d9a5a412abea175b9ce47f950', 'b706395637624747912642e8f0e70b66', '5a63c6a0ccde4657972d3e6231791778', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bab3d09da4b44201a87661b7f01ffe6b', '3a48721d840e4f8fad665137448427a2', '3bad6ddb11ce4a87abac9d2d2f911219', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bacfd30489e04ed78859a82964062c1e', '3a48721d840e4f8fad665137448427a2', 'dc96da0d48fc4b6d9391077ef8170e33', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bb2001b144ad45dc97f421705a76ca83', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'ed4e67ecd71a40159967ece89569ee05', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bb31b68a0d584b038a0a63bf83ec0d4b', '3a48721d840e4f8fad665137448427a2', 'a79f55e6fb2441b685f27f17a0f984df', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bbec153d3ee04d04b4cf6294ff395e0c', '3a48721d840e4f8fad665137448427a2', '0179770f8a384e5bbb98021d57896798', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bc1d7e8560b54a77866c6ce3c549227a', '3a48721d840e4f8fad665137448427a2', '806cf10c5fbd496c86718f8c0e2d9e0a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bc3e0d4420654655bff4e386228d9f9b', '3a48721d840e4f8fad665137448427a2', 'f806b2729ac74686bd232b888120c83b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bc945c10a06241fdb12ac1af7618613d', '1e52771429a4498e85f78357da4818a1', '9044ef2ddb384e6d978b80371af19d79', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bdb11489ab5647b690ad0cb972eff4ac', 'd1d69bd942c041e4a42a422c85917ace', 'c04d4bf2da1b46da88486a9506d15850', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('be1daf55e591420d86fe7d2023e390c7', '3a48721d840e4f8fad665137448427a2', '8c3d712f455a4963a934b0e2c9fd3c94', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bf715728328a41f8a308e115e588bd49', 'f95a76ff9d0e43c0827c1c43583977b4', 'edfb6a1de7344bf989878454db5ce6ca', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bf85072d5c1045e0a2ffb8e1ef52f016', '1215c6b3ab8240e496f2efc9a610ce28', '5c707e95bb494bbb8c348d5708edaed0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('bfc44eb8f0584848bcff3ea6fea460f1', '3a48721d840e4f8fad665137448427a2', '9f18ee0cdbb04996b9ecc774a785c82a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c01d4796a1e34becac1b37b52d07b0dd', 'f95a76ff9d0e43c0827c1c43583977b4', '295019311267468d9998998aeb5f5ddb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c0371246d64a4006a1aca446476b2760', '44db0306e0544723b3598178504d4407', 'e8e86d4e931740a1a853ca6d1c957220', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c03d62ab245b46feb36c1d3f010ec3db', 'f95a76ff9d0e43c0827c1c43583977b4', '175dd8facd294f6ebaf745fc3d3c957e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c060b026e4914b1891accb364a377c4d', '3a48721d840e4f8fad665137448427a2', 'cc622d75850c435e907d3f943e294f67', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c09005e52db74183867d9ba200161eca', '3a48721d840e4f8fad665137448427a2', 'caa31cb5b9ea4c458126971f0e342c82', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c0cff40e62a24530bb7fa1e5424a6123', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '7393e7ec07554f778c159fa4ae1ef0b2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c0d691d8fbab4fb0992ae72b8fb0629d', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '58236042c9c44415a9cfc7ad57e98450', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c1028f69b45748e7ac96ff1cfc4058e4', 'c5fd6d1549fe4a3d905a6cdec95c2836', '6c58aae4fdee47288366e294455f67b6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c191111bafaf4ae69eae9ce311016d34', 'c6fb84b3914b44cdbb3219b1be2fd839', '12aa28b4402f4c2cb9c5b6834ab4285c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c1b384912cf8433b83136f719d471117', 'e626902b31ac4cd7a667cd25ede18b3b', 'f5acab169f3243eeafd536f0cc8a0890', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c1d36468b2dc4162a7deb266370f0263', '3a48721d840e4f8fad665137448427a2', '9bebdda57bbb403f95e73164716a2e05', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c216f84903264777bff122ca68cf9d6a', '3a48721d840e4f8fad665137448427a2', '0cca50bf4fc2486196693d784cb3c923', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c292990979b14fc5b6767a09234211ff', 'b652cfe1bfdc4d849b76ddf33a282bfc', 'b9ed3203a44b4e93a20fea858cc1eee0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c3027b92a64547bbb8795c6c5a89e6fb', 'e626902b31ac4cd7a667cd25ede18b3b', '9c35d94261984984933747670353eed5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c449ef4b81fd4db4a38bb627faf8f543', '3a48721d840e4f8fad665137448427a2', '2fd63e44d348493783e9e10430badb62', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c49d7c6d812a4b5b9d0b325b917d4d1e', '3a48721d840e4f8fad665137448427a2', '7f11d7ef3dd84a1495819dd3a205ee77', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c4b9bea1551d43588a3794d9d588ce55', '3a48721d840e4f8fad665137448427a2', '1a3a30488efe4aa09272e00d861208fc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c4d97cb64b7e466ab6699a10123fa624', '3a48721d840e4f8fad665137448427a2', 'a9c845db3edc49e3b341a24f51d2c197', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c4f74977437f424eb29d78ef2fc4aa9c', 'b652cfe1bfdc4d849b76ddf33a282bfc', '1db3f66b615f4548bdc272820fc42fbb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c53590464ed046e98161d8a78b383d45', '3a48721d840e4f8fad665137448427a2', 'fe12d36414424b04833165553fbb8f6f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c57ce0ae01ba4dfb9c7530687bd76d3f', '1e52771429a4498e85f78357da4818a1', '43001b18ecde44a69b7998e16fbcaa4f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c5ad1a9c8da44398948bd4c1a41052b5', '3a48721d840e4f8fad665137448427a2', '25df4bf4409f489f9927660214f1e7d7', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c619f55c72e2400f824f9e6de7d35404', '1215c6b3ab8240e496f2efc9a610ce28', '6116f47fe06e45de9c71a470b3763769', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c658f76fef3f4898aeedca92351fd324', 'b706395637624747912642e8f0e70b66', '6fde6533b1c447deb97ff021ed30cda1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c66165d6dd5a4bfd9e976df03759f414', '3a48721d840e4f8fad665137448427a2', 'dc33efdea7d04c2f98b389c9527d2c41', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c664c72cf00e4f508fccf3046a5cbe2a', '1e52771429a4498e85f78357da4818a1', 'c0625dc7928a422a9f614ddc7a330602', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c6d2d2c14cae432f84f49239c522df22', 'a4740752f3564ff39aa41b409277e6eb', 'b1c300f23e4944aca6e8acbfc875d864', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c75ddfe90f594b4285a66e3814eb2f04', '880ce8e5f5614d959a6ca0b9463556cb', '916c1c9e9b2a4d8ab97dc71461a9510f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c7bf3743f3df48d6bfb6deba81311638', '44db0306e0544723b3598178504d4407', 'c2e7fd2fe24244a2b82b2f023fd82991', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('c81f9c471e7f41c3be835bfc6e0f17e3', '8f3ceee92c13429e899533aa767b6b24', '12bf3fa6fdc94c3c9fee12b7a40f69be', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ca59db614c8a4fca9812ec0292856da3', 'a4740752f3564ff39aa41b409277e6eb', '9f04263132c34dc7b0d08f3a237cc755', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cacb99bdc03f42cd89dd0d6e7a9b75a0', 'f95a76ff9d0e43c0827c1c43583977b4', '3c5edd59df2b49b8a28c9a202d981d98', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cadc503a68f4456ab3e25172dbc33fef', '0264b365c78c499bacbde7750b3d61fa', '50fb32186d7140249e18b392408d96ce', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('caf1163869fb4249aa3ef7ecf8a35b83', '3a48721d840e4f8fad665137448427a2', 'b30cabf386074f84ae01a592e4b46621', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cb08906fec3a496397440d6c28b92b2a', '1e52771429a4498e85f78357da4818a1', '64d5d16188cd4499a25b31c1caa8be11', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cb098f1ac6eb4021b81557957cb9623b', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '48b6177233b5479682a6fb5019042086', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cbd74e4f336848989b86e1c9cb6ab50a', '880ce8e5f5614d959a6ca0b9463556cb', 'f5546b2cabdf4aa7ac733226cbe7fb98', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cbdd4f48394740098f51411578301652', '4d5ef2e72b66484785d7a6a83a81a570', '760ceae65f8e4ae592f535d8538c783d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cc5b88d38717422aa77d121946990d3b', '3a48721d840e4f8fad665137448427a2', 'b2a2f08c10e54c759b9a7faced3a3999', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cc9f4a323b3640ca8cb21ebfe3722f4e', '1e52771429a4498e85f78357da4818a1', 'd10663411b494580b610a4f0f4d93cb2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cda5b1cfee8341a595e653685915c1b7', '3a48721d840e4f8fad665137448427a2', 'fd42ad6087ed44a0ae3eb26048522419', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ce47cdc0575340a8812090a07525fdae', 'd1d69bd942c041e4a42a422c85917ace', '1f522a49a0c644db9f46ecd2b4e7e030', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cf729639fb9e4724ae3e2731e98740e3', '3a48721d840e4f8fad665137448427a2', '45c065dfe40349e5b5a18bbf433e72d0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('cfa24fe703d744c6ab11fd2ad8856659', '4e9ecd122144441abb436227d5b1f4a8', '9a0dda260d4e4fbdb5fc648fe2651c9d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d067e36e66b94bfdbbcad40558c477e7', 'f95a76ff9d0e43c0827c1c43583977b4', 'f6e425165c3446c89e4d96c9356a6aca', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d079052d5e8b4369925ce3f82d9c4c07', 'f95a76ff9d0e43c0827c1c43583977b4', '2a106fa359bf4bba8f177b0f75911d20', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d0f01e45fa1c4897b9a907da397ac73e', 'c5fd6d1549fe4a3d905a6cdec95c2836', 'c1036d6560fa49a4a0290a4e30bab61f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d1395aba4c454237b57361fc3d2b2061', '7122b002a88743808b0721dad21ec870', '4817f40e53b34959b6c40e70c716dc20', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d198209e49e3454eb9dfbbbf78681c70', 'c5fd6d1549fe4a3d905a6cdec95c2836', '3b6d48ceedc14235873fb8991d5013a3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d1c6b289a2c649e3a137cc3ca2605fbf', 'b706395637624747912642e8f0e70b66', '781e9d60eb4947d199b473d576308081', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d210ec71cafc4acfb2e7b78a6a76912b', '1e52771429a4498e85f78357da4818a1', '70f931c258e84323a780a05b7e679dc5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d24f15a6dd4640f8bdc89d8079496ef3', '1e52771429a4498e85f78357da4818a1', '333a0edf235a47ed88d2bc5106afe217', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d2d341030217405aa26642abdfba3c45', '3a48721d840e4f8fad665137448427a2', '92913a4e41dd42b58d3b1e66b7226a5f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d2e1931de139451282b652c5de9248d9', 'a4740752f3564ff39aa41b409277e6eb', 'f5fb11f8fd2f49a9b890e4e4dce38f28', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d3e577146fcd4b6ebc1a021f1fce767a', 'f95a76ff9d0e43c0827c1c43583977b4', 'd5e931e4fbd343059184ab469c0aa231', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d3f8ad8a607746e39f462cd6be87ae90', '3a48721d840e4f8fad665137448427a2', 'dbb4acfcfbf44497a779e5ea3dd2a981', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d404154bf50941a182b427c32a9b8931', 'f95a76ff9d0e43c0827c1c43583977b4', '24e35483e37c4e57914bdfb97bdf3ba2', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d521924bb5f649e9b89f9277fede8386', '3a48721d840e4f8fad665137448427a2', '9958e1d6137449ed8e3419e896fc8b35', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d547b0fff7a949b0a66603a8aa55cbe5', '3a48721d840e4f8fad665137448427a2', 'efc13a47e17f41f18bc84102733a388e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d59eb3a3bafd4bbe85eabcf4174ceb25', 'f95a76ff9d0e43c0827c1c43583977b4', '50b732673b78417fb9217945b1a6b063', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d59eeadf2ab54542bdf8e0d09dff1995', 'a4740752f3564ff39aa41b409277e6eb', '3243f3e4c8434f51867ca1cf7c3994a4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d5c99fad1e214f15a8085144f7805ffa', 'f95a76ff9d0e43c0827c1c43583977b4', 'a132fe4c16f24cdf8b9cf9b2b3cd5826', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d6286f5b2d0d42e3a4b859ec67756235', '4d5ef2e72b66484785d7a6a83a81a570', '6ba221da58df4a99aa64515b588df307', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d6a50af25722417db58bb6750f22e3c1', '880ce8e5f5614d959a6ca0b9463556cb', '627cb188214943f18eeb968e221597c3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d6ee3f57bc644e7e9a35243f838ecdd4', 'c5fd6d1549fe4a3d905a6cdec95c2836', '71e00fbf3c224b4cb87c3d12f9ce8aaa', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d81dc5aeb4dd456f8f2cb4448b86e83f', 'f95a76ff9d0e43c0827c1c43583977b4', 'ee258fbc2dc64b51b088f7ba607f215d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d871d1fe715e46d3ae07c28de3db94e2', 'f95a76ff9d0e43c0827c1c43583977b4', '4be576585e9a4c15af4e4eb03f58fae0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d8acb05ece4e4631b86b37f21049d0ac', 'a4740752f3564ff39aa41b409277e6eb', 'b96df12253c14d94ad30110ab4be5551', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d8e3d95326734925a7e7ef6c1e091c86', 'e626902b31ac4cd7a667cd25ede18b3b', 'ae4db19bc8d848d19326604d1853c0ed', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d8f220a01d94487881423507df182e5a', '1215c6b3ab8240e496f2efc9a610ce28', '1a6dc9cd3f464568b63602079e56cab6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d920bfd165cb4f1f991e573d1f529e33', '3a48721d840e4f8fad665137448427a2', '802cd536405347afbd312f6e4bb3109f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d96f0b26aec7465383e4ec1552a26f3f', '8f3ceee92c13429e899533aa767b6b24', 'cd9711afad5c4b07ab795b496b974e61', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('d983cb2d42ee4731b5240af28d65a1ce', '3a48721d840e4f8fad665137448427a2', 'd26bbc25509b46478bf1360e77630f89', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('da6d6c61dce2436186e66787e061fdac', 'f95a76ff9d0e43c0827c1c43583977b4', '2eb627a0abe7445ea156d9cfd9ae20d3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('daf3c187d9d54a9c9e8e88a1a1ab88d4', '3a48721d840e4f8fad665137448427a2', '951fc86418884fe782f872b53aa343c3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dafbb878065249919b20a1234293ed7e', 'f95a76ff9d0e43c0827c1c43583977b4', 'd7eb9239ec384c80980e85d0fb3d80bc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('db95837fe050492e8271819106854dc3', '8f3ceee92c13429e899533aa767b6b24', 'ba95ddb2cccf4e7b813e42d45373cecf', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dbafb57432864ff4aef9a44141aca050', '3a48721d840e4f8fad665137448427a2', '61c91172681d435e841c96f00c99803e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dbb1c60d4d194cd890fa981e75c45109', 'f05785a101374348a71f70ca627a6801', 'cad232bfa6fe431e81032483f90647f8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dc8c46c78f364d10bd9801576c7eecb9', 'b706395637624747912642e8f0e70b66', '1bff37ddd44740dfaa4996a55fab1bb0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dcd8c45090ed42c1b034d1be426f251f', '3a48721d840e4f8fad665137448427a2', '0b85c54bfb97455886bfb450881df8f3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dd0c94413bc4459dbdb1705571e3bfa9', '5dc8b4c4a6c047fdb0a81ac64f01beb7', 'd9ed0ee3618a4704942b99d030c74d5e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dd20b86a9bd643a090e2572da81478fe', 'f95a76ff9d0e43c0827c1c43583977b4', '5fe4275ead7e431cad1d77410dcaec0a', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dd6fa25602854e5fbf14e950c2a1a524', 'f95a76ff9d0e43c0827c1c43583977b4', '0b68cd92a27a49d39a943e179d56737b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dde9823ebe7b44ebabfcdc95f1825de0', 'f95a76ff9d0e43c0827c1c43583977b4', 'd6b36f6ee46f4bbda1b102789135ad71', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('de0166a46826403ebe9c5e14a08792a8', '3a48721d840e4f8fad665137448427a2', '4ae81f559268478e9eea4d3e550b86ce', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('de595db1ee8e48cd81c4204c1a032912', 'd80bffe971bb4016a902610b8a6fa113', '170a2a04c94e4b08b31110db4fde726e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('de68f016b373452dbc9f5db5c100a252', 'b652cfe1bfdc4d849b76ddf33a282bfc', '59164f1b3a6e4cf6b95241e3d896a829', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('de82727c7c684f9c99cb46cccc55607c', '3a48721d840e4f8fad665137448427a2', '483578c2ffa04801bb0a5b29950bd592', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('de979d53c3e44a4795125e01f1dea08d', '3a48721d840e4f8fad665137448427a2', '5677e77164d7468084bee5d69e4a480e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('de97c897b12a4b9b8d30ca169106a454', '3a48721d840e4f8fad665137448427a2', '130ce37ec2b3492f8044feec663969cf', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('deab4ef99c0c47a384c0e142c694a525', '1e52771429a4498e85f78357da4818a1', '789827b5963e4d4bbfedf7dc050e37b4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dee21f718c9945d58e3710bd9fc52a48', 'e626902b31ac4cd7a667cd25ede18b3b', '0f5adac46ef64818962beff2ffd0d60f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('df3982d567e64e0daa74a11173216b15', '3a48721d840e4f8fad665137448427a2', '50ba0c1fa7b74bcfb3d899ca608a86aa', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('df659e8b6f9a41b5b8e21055345e3de1', '3a48721d840e4f8fad665137448427a2', '16f9d4d17ec043ab89a17895e6c0795d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('dfb380253ecb4f84b97aac8d353b5b7e', '3a48721d840e4f8fad665137448427a2', 'ff4e2a26c2c9473cafee373bf21c3c9f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e0286f6473324b82a35fc23ee5d6411b', 'f95a76ff9d0e43c0827c1c43583977b4', 'af10fa46ba9d43eaaf7fc4a381a79445', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e0eb29f8261d4e1198cd00a5b63f8e50', '3a48721d840e4f8fad665137448427a2', 'b71ff25d0eca40609eba4b291d4bb8a8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e10f41c87e5d405cbfb93588b4ba5400', '3a48721d840e4f8fad665137448427a2', '361c22df77ce48ef996c248338c618b6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e18f79fc051b4febb42755cc2553362c', '3a48721d840e4f8fad665137448427a2', 'cd30ec42f4a6498b897731a98d05b07c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e1a68d4fd8a4444fbd7e3fc71df06a40', 'e626902b31ac4cd7a667cd25ede18b3b', '77caa8798544456f8594c707539fd7be', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e1c8c45e53da4c42899c263c69a130e3', '4d3be319e3544a768242efc37c1f0441', '1d3637fec8194ec1bb8785bcc512e3a4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e2095df8df684872ab05143f2ad706ee', '3a48721d840e4f8fad665137448427a2', 'eb358c0d0f3e4068994ef3e26acd1419', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e25b361084e04acda8bc2515c48967bd', 'c0e7c887f354479fa6150cbc9e7cb02f', 'ca78b6acc35c411e9a3920995faac7bb', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e423877c5306464fa36c509dd48da5fe', '3a48721d840e4f8fad665137448427a2', '5f00f3f43d394114a55926c6b95f60e5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e4caf1878e794ffabeb25a0236a7188f', 'b706395637624747912642e8f0e70b66', '38a807a0fa0d44a99abe6d02ccf901d5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e50901bc24e842548b3a249d58a46a4a', '3a48721d840e4f8fad665137448427a2', '564bd049d2b440589ae690eb029148c8', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e5288fddc3e347538f942cf99212f4af', '3a48721d840e4f8fad665137448427a2', '69af06b680da46f7a3f355173b78f59f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e62d154e4b5d4eb38a415bf687bf043d', '1e52771429a4498e85f78357da4818a1', '0026211fd5764fe7b6cd46608bc5e2a3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e647005be3d7441db429ea04398d6b9b', '1e52771429a4498e85f78357da4818a1', '587a30467a114654b596eb54f2acc5c6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e64982b3bc004831a23a9086d890056c', '4d5ef2e72b66484785d7a6a83a81a570', '09e54b794d8647239f82aeac095105e1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e7392eae4c964797aa748b659c665a01', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '99611fb909b048c8b9d4d25634893c3c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e7aa81aa54a94057a8e8c2af455fb950', '3a48721d840e4f8fad665137448427a2', '9d95ed89090b4bcb91b822cbb551bb99', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e82a3aac0d13421492c000648078245b', 'f95a76ff9d0e43c0827c1c43583977b4', '6a4ee1ce8b104f14bd8dfadee76706fe', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e88c8765dc084ab4a3d5faf516705d94', 'a4740752f3564ff39aa41b409277e6eb', '9027bbaf0a6140339c7150b88018ed93', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('e900dd5f72bc4c789f5a4f01a8b3f019', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '7d14d51b636045a290a3f4224c9cc116', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ebbc585ebd534377957247b07cf763dc', '1215c6b3ab8240e496f2efc9a610ce28', '2d6e83b3ad814a4492925c1981f796e1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ebed3e451836430d91b6a367a2ea7098', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '17afe4e996bb4a648fd6f05275053fe5', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ecb510e86bb74c7da5bb2dd1222d0630', '02e43255fb85404d9a488ac9e5159cbf', '2d33a4c794bd4fabb4408c371b71a772', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ed9b9228400d4307b29c3896e8527e4b', '3a48721d840e4f8fad665137448427a2', '96c3e442b70b456a98018c47cf7bd64c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ed9d2f96848143d98e3799d22b749ccd', '3a48721d840e4f8fad665137448427a2', 'bfbee48c1a2244ada2337e6b21d9c3ed', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('edb5d5dbe197417c9cb82fb775b4f54f', 'a4740752f3564ff39aa41b409277e6eb', 'c8e295b020714f3397999d8fa2c10045', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('eed95998b1f04f029d8d0e68bc399b17', '3a48721d840e4f8fad665137448427a2', '84148e8cd429489cbd2610f69982b219', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ef4c988354ec42cbb8de4cfcc0348ac2', 'f95a76ff9d0e43c0827c1c43583977b4', '654fda415dcd46caaf2408d29314aef4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('efac7d1ba5104d7684170533ca70a572', '3a48721d840e4f8fad665137448427a2', '4d71f3181e7f407cbbb814f2457339c0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f091f5e3d4494a8e8e0010134e07d196', 'b706395637624747912642e8f0e70b66', '452ba51abdc3477aa0d123eeaf644879', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f0be3be522e94d289aa1b87bd3bf9623', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '97b0486edc3f4386987bb90c026e8ce4', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f0f0855a7d3849a29c638a3606b9dd0c', 'c45a2fa90e2f451ba751dd922e0d25e1', 'f478dddf562646cbb9e517799f4cbfba', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f31c88fc260c45be990657022de5d6d8', '4e9ecd122144441abb436227d5b1f4a8', '94824770c97a4b40884bd95c87c3e0ba', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f46081aed5d34901a486670b0c2dab5e', '1e52771429a4498e85f78357da4818a1', 'c2e3cbbad8ce4a41b765d7f8552e644e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f4a597a849c841e2939e45b62ab4c46f', '3a48721d840e4f8fad665137448427a2', 'b48c71b8939a4ce68deb7f4085952e25', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f507d3e2b3524531858d0cdc454ea3c0', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '2e05554482174ff9880ae0ab7dd5410b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f51d952ed5014c4d859c6eaa83fa032c', '3a48721d840e4f8fad665137448427a2', 'fa95561b0a094fe5972a6ff947a70e7c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f5229df8de1948a9892ae734833e01c0', '22b19b4e9f704c4c82d430bf0a9e535b', 'ef3ba0605a1f44b1981dcc5affb5c2c6', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f5db2a32dd744a16b47d5e518515d666', '3a48721d840e4f8fad665137448427a2', '180d9f4a5ca742e6a9706453a0b940f0', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f5eb882692ba4b0e86c97ba3c7608e37', '3a48721d840e4f8fad665137448427a2', '73849793539b435198c617fe6c81d4c3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f648d7bdd4fb4315b52bc7ec0c13db85', 'f95a76ff9d0e43c0827c1c43583977b4', 'ab1d47fe3f6e482d8d6d59b51a0ee04d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f69c98726d8b4693878be6fcfed2cde2', '7122b002a88743808b0721dad21ec870', 'bbcd126834e6401390b5fa3b270025bc', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f6dff4e646954b59a952c26c548db8d5', '3a48721d840e4f8fad665137448427a2', '8f9cf9669d574b6e852a4d71a79dd69e', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f7ae46bc53364cffa558027b893bd8cb', '3a48721d840e4f8fad665137448427a2', 'f2b62545d02a4e91bc76b236a479fda1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f7d7e25bb6c942eeab39b9daaa5d8635', 'f95a76ff9d0e43c0827c1c43583977b4', '257852fafb3b44839ce967df6f3ac884', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f925e35eb7634b35a263a98218662e7f', 'f95a76ff9d0e43c0827c1c43583977b4', 'd236112d5c5a478f8769ddd5ecf07099', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('f97c343c698546cdb279cd37b7f61f75', '02e43255fb85404d9a488ac9e5159cbf', '2fcd67f205ba4616b5eac05d85a52169', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fa52d272e09147ca9a50b5b95a9b8002', '4d5ef2e72b66484785d7a6a83a81a570', '6d83a3998ac4431386c7d494393ce60f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fa6fccbed82f4644bb5636cba6ba5a00', '5dc8b4c4a6c047fdb0a81ac64f01beb7', '98ae3da0c6a14fbfb59c2a734876720f', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fac4b0048a2845368ec8476aac45e447', 'e626902b31ac4cd7a667cd25ede18b3b', 'fb99c854841b491594dd2e6e3765aefe', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fb3d0db05e324d74811449d8cbd99f89', 'b706395637624747912642e8f0e70b66', '3710de2c25b74db5be92ab26287734b9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fbc4f6b55fb948fe95cef7f9e9683355', 'c5fd6d1549fe4a3d905a6cdec95c2836', '185d0b07d5414629b883f7a314e354e9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fc59d112810d44b8b5c70dc52c2ef02a', '44db0306e0544723b3598178504d4407', '8101a64427c84c63a3e2c3d333acebe9', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fc8d5a8f02c8492b852009eb7f2a3c49', '3a48721d840e4f8fad665137448427a2', 'bc4a363bf1f8455c875263edd96edd74', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fca1f6b0815d414099ec144e462ac17b', '3a48721d840e4f8fad665137448427a2', 'c30cec1238c84e83bce43e475a3ea26d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fce5ce3389404d5aaf0026ccfe359dd1', '3a48721d840e4f8fad665137448427a2', '5878b3369e97425293929de4185ed45d', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fce607c0edfc431ba677134afcfab4ac', 'd1d69bd942c041e4a42a422c85917ace', 'db6ac33a50a749b0b99466c45ac60fae', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fd5717db6e6640b88de504e4f8f06da0', '880ce8e5f5614d959a6ca0b9463556cb', 'af59b4ea1f7a4272bc0dcae4bf3662a3', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fd5afe768add4a42841a651a6c48b7a5', '3a48721d840e4f8fad665137448427a2', '66fd2083a74247d197f436d99add6be1', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fd85cd5ec1d74051a40c04368c0802d1', 'f05785a101374348a71f70ca627a6801', 'a398e58e889d49639cb8ed964029df1c', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fda9aec7a2904b82b6f39344db2bdcf9', '1e52771429a4498e85f78357da4818a1', '9d12c237352a40eca7835445b6c62d32', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fde22309053f45f8b078993ec02295af', '3a48721d840e4f8fad665137448427a2', '2b50960d416248e58c9c8cef2af5c39b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fdf7fbd7b3c54251af44a23df37cf3ad', '3a48721d840e4f8fad665137448427a2', '1ba0fcb81306424db034a3271d332925', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fe6f732ccbf947869fb8a1d988903dda', 'c45a2fa90e2f451ba751dd922e0d25e1', '1f7d7aedea204e0f812ca81f86700edd', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('fefa30d1f1844cd1965c80099ca57186', '880ce8e5f5614d959a6ca0b9463556cb', 'd66f4289734542438e89fcdcfdc0a39b', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ff17c68376a94aa389e4e9b26205dbe5', '3a48721d840e4f8fad665137448427a2', '82f2cce54f7344bc86098150dd92f9fd', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ff47d998d38049fabb717cd05d8dd39f', '1215c6b3ab8240e496f2efc9a610ce28', 'ed743b1932fb452ea5fa2a79b8122993', null, null, null, null, 'N');
INSERT INTO `stb_role_user` VALUES ('ff8c3e36b5ce48adac02457272e23b85', 'a4740752f3564ff39aa41b409277e6eb', 'a24de71d0ede40a08d0d4118a194ae20', null, null, null, null, 'N');

-- ----------------------------
-- Table structure for stb_stats
-- ----------------------------
DROP TABLE IF EXISTS `stb_stats`;
CREATE TABLE `stb_stats` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `NAME` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '统计名称',
  `CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '统计编码',
  `TYPE` varchar(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '统计类型',
  `SQL_CON` text COLLATE utf8_unicode_ci COMMENT '查询语句',
  `ORD_NO` varchar(8) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '排序号',
  `REMARK` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `IS_DELETED` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'N',
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(8) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_stats
-- ----------------------------
INSERT INTO `stb_stats` VALUES ('0b4f6663fcc445fab1aeee45ab57d009', '网咨左侧功能区', 'WZ_DEPARTMENT', 'leftCharts', 'SELECT\n	sd.NAME,COUNT(RESUMESOURCE) as counts,tbcount.nuber\nFROM\n	tbl_jobseeker tjb,\n	tbl_resume_jobseeker trj,\n	tbl_resume tr,\n	stb_dictionary sd,\n	(\n			SELECT\n				COUNT(tr.ID) AS nuber\n			FROM\n			 tbl_resume tr,\n			 tbl_resume_allot tra,\n			 stb_user su\n			WHERE\n				tr.IS_DELETED = \'N\'\n			AND	tra.IS_DELETED = \'N\'\n			AND tr.ID = tra.RESUME_ID\n			AND tra.USER_ID = su.ID\n			AND tra.CREATED_BY = #USER_ID#\n		) AS tbcount\nWHERE\n	tjb.IS_DELETED = \'N\'\nAND trj.IS_DELETED =\'N\'\nAND tr.IS_DELETED = \'N\'\nAND tjb.ID=trj.JOB_SEEKER_ID\nAND trj.RESUME_ID=tr.ID\nAND tjb.CREATED_BY=trj.CREATED_BY\nAND trj.CREATED_BY=tr.CREATED_BY\nAND	sd.TYPE_CODE=\'RESUME_SOURCE\'\nAND sd.CODE = TR.RESUMESOURCE \nAND tr.RESUMESOURCE is not null\nAND tr.CREATED_DT is not null\n AND TR.CREATED_BY =#USER_ID# \nGROUP BY TR.RESUMESOURCE', '3', null, 'N', '1490856643', null, '1489979919', null, '0');
INSERT INTO `stb_stats` VALUES ('17deec6c7bac488bb6b4f5fe34dd6ea6', '网咨条形统计', 'WZ_DEPARTMENT', 'column', 'SELECT\r\n	ST.date,sum(ST.statics1) AS contetNumber,sum(ST.statics2) AS distNumber,sum(ST.statics3) AS optionNumber\r\nFROM\r\n	(\r\n		SELECT\r\n			FROM_UNIXTIME(tr.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			COUNT(tr.CREATED_DT) AS statics1,\r\n			\'\' AS statics2,\r\n			\'\' AS statics3\r\n		FROM\r\n			tbl_jobseeker tjb,\r\n			tbl_resume_jobseeker trj,\r\n			tbl_resume tr\r\n		WHERE\r\n			tjb.IS_DELETED = \'N\'\r\n		AND trj.IS_DELETED = \'N\'\r\n		AND tr.IS_DELETED = \'N\'\r\n		AND tjb.ID = trj.JOB_SEEKER_ID\r\n		AND trj.RESUME_ID = tr.ID\r\n		AND tjb.CREATED_BY = trj.CREATED_BY\r\n		AND trj.CREATED_BY = tr.CREATED_BY\r\n		AND tr.RESUMESOURCE IS NOT NULL\r\n		AND tr.CREATED_DT IS NOT NULL\r\n		AND tr.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n		AND TR.CREATED_BY = #USER_ID#\r\n		GROUP BY\r\n			FROM_UNIXTIME(tr.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n			(\r\n				SELECT\r\n					FROM_UNIXTIME(tra.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n					\'\' AS statics1,\r\n					COUNT(tra.CREATED_DT) AS statics2,\r\n					\'\' AS statics3\r\n				FROM\r\n					tbl_resume tr,\r\n					tbl_resume_allot tra\r\n				WHERE\r\n					tra.IS_DELETED = \'N\'\r\n				AND tr.IS_DELETED = \'N\'\r\n				AND tr.ID = tra.RESUME_ID\r\n				AND tr.RESUMESOURCE IS NOT NULL\r\n				AND tra.CREATED_DT IS NOT NULL\r\n				AND tra.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n				AND tra.CREATED_BY = #USER_ID#\r\n				GROUP BY\r\n					FROM_UNIXTIME(tra.CREATED_DT, \'%Y-%m-%d\')\r\n			)\r\n		UNION ALL\r\n			(\r\n					SELECT\r\n						FROM_UNIXTIME(SIR.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n						\'\' AS statics1,\r\n						\'\' AS statics2,\r\n						COUNT(SIR.CREATED_DT) AS statics3\r\n					FROM\r\n						tbl_invitation_record SIR,\r\n						tbl_resume_invitation tri\r\n					WHERE\r\n							tri.IS_DELETED = \'N\'\r\n					AND SIR.IS_DELETED = \'N\'\r\n					AND tri.FK_INVITATION_ID = SIR.IR_ID\r\n					AND SIR.CREATED_BY = #USER_ID#\r\n					AND SIR.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n				GROUP BY\r\n					FROM_UNIXTIME(SIR.CREATED_DT, \'%Y-%m-%d\')\r\n			)\r\n	) ST\r\nGROUP BY ST.DATE ', '1', null, 'N', '1490871423', null, '1489978223', null, '0');
INSERT INTO `stb_stats` VALUES ('1e0a8183e67b45b8b9b54cc8665ea341', '运营条形统计', 'YY_DEPARTMENT', 'column', 'SELECT\r\n	ST.date,sum(ST.statics1) AS contetNumber,sum(ST.statics2) AS phoneNumber,sum(ST.statics3) AS backNumber\r\nFROM\r\n	(\r\n		SELECT\r\n			FROM_UNIXTIME(tra.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			COUNT(tra.ID) AS statics1,\r\n			\'\' AS statics2,\r\n			\'\' AS statics3\r\n		FROM\r\n			tbl_resume tr,\r\n			tbl_resume_allot tra\r\n		WHERE\r\n			tr.IS_DELETED = \'N\'\r\n		AND tra.IS_DELETED = \'N\'\r\n		AND tr.ID = tra.RESUME_ID\r\n		AND tra.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n		AND tra.USER_ID = #USER_ID#\r\n		GROUP BY FROM_UNIXTIME(tra.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n				SELECT\r\n					FROM_UNIXTIME(tir.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n					\'\' AS statics1,\r\n					COUNT(tir.IR_ID) AS statics2,\r\n					\'\' AS statics3\r\n				FROM\r\n					tbl_jobseeker tj,\r\n					tbl_resume_invitation tri,\r\n					tbl_invitation_record tir\r\n				WHERE\r\n						tj.IS_DELETED = \'N\'\r\n				AND tri.IS_DELETED = \'N\'\r\n				AND tir.IS_DELETED = \'N\'\r\n				AND tj.ID = tri.FK_JOBSEEKER_ID\r\n				AND tri.FK_INVITATION_ID = tir.IR_ID\r\n				AND tir.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n				AND tir.CREATED_BY = #USER_ID#\r\n				GROUP BY FROM_UNIXTIME(tir.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n				SELECT\r\n					FROM_UNIXTIME(tir.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n					\'\' AS statics1,\r\n					\'\' AS statics2,\r\n					COUNT(tir.IR_ID) AS statics3\r\n				FROM\r\n					tbl_jobseeker tj,\r\n					tbl_resume_invitation tri,\r\n					tbl_invitation_record tir\r\n				WHERE\r\n						tj.IS_DELETED = \'N\'\r\n				AND tri.IS_DELETED = \'N\'\r\n				AND tir.IS_DELETED = \'N\'\r\n				AND tj.ID = tri.FK_JOBSEEKER_ID\r\n				AND tri.FK_INVITATION_ID = tir.IR_ID\r\n				AND (tir.INVITATION_TIME <> \'\' OR tir.INVITATION_TIME IS NOT NULL)\r\n				AND tir.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n				AND tir.CREATED_BY = #USER_ID#\r\n				GROUP BY FROM_UNIXTIME(tir.CREATED_DT, \'%Y-%m-%d\')\r\n	) ST\r\nGROUP BY ST.DATE ', '1', null, 'N', '1491018019', null, '1491017963', null, '0');
INSERT INTO `stb_stats` VALUES ('52bd485702f04b90a4c29cb27a50a6bb', '咨询线性', 'ZX_DEPARTMENT', 'line', 'SELECT\r\n	ST.date,sum(ST.statics1) AS A,sum(ST.statics2) AS B,sum(ST.statics3) AS C,sum(ST.statics4) AS D\r\nFROM\r\n	(\r\n		SELECT\r\n			FROM_UNIXTIME(t1.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			COUNT(t1.VISIT_INTENTION) AS statics1,\r\n			\'\' AS statics2,\r\n			\'\' AS statics3,\r\n			\'\' AS statics4\r\n		FROM\r\n		(SELECT\r\n			tvr.VISIT_INTENTION,\r\n			tvr.CREATED_DT\r\n		FROM\r\n			tbl_distri_consult tbc,\r\n			tbl_visit_jobseeker tvj,\r\n			tbl_visit_record tvr\r\n		WHERE\r\n			tvr.IS_DELETED = \'N\'\r\n		AND	tbc.IS_DELETED=\'N\'\r\n		AND	tvj.IS_DELETED=\'N\'\r\n		AND	tbc.FK_USER_ID = #USER_ID#\r\n		AND tbc.FK_USER_ID = tvj.CREATED_BY\r\n		AND	tbc.FK_JOBSEEKER_ID = tvj.FK_JOBSEEKER_ID\r\n		AND tvj.FK_VISIT_ID = tvr.VISIT_ID\r\n		AND tvr.CREATED_DT = (select MAX(tvrn.CREATED_DT) from tbl_visit_record tvrn ,tbl_visit_jobseeker tvjn where tvrn.VISIT_ID = tvjn.FK_VISIT_ID AND tbc.FK_JOBSEEKER_ID = tvjn.FK_JOBSEEKER_ID)) t1\r\n		WHERE \r\n			t1.VISIT_INTENTION = \'0\'\r\n		AND t1.CREATED_DT > UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n		GROUP BY\r\n				FROM_UNIXTIME(t1.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n		SELECT\r\n			FROM_UNIXTIME(t1.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			\'\' AS statics1,\r\n			COUNT(t1.VISIT_INTENTION) AS statics2,\r\n			\'\' AS statics3,\r\n			\'\' AS statics4\r\n		FROM\r\n		(SELECT\r\n			tvr.VISIT_INTENTION,\r\n			tvr.CREATED_DT\r\n		FROM\r\n			tbl_distri_consult tbc,\r\n			tbl_visit_jobseeker tvj,\r\n			tbl_visit_record tvr\r\n		WHERE\r\n			tvr.IS_DELETED = \'N\'\r\n		AND	tbc.IS_DELETED=\'N\'\r\n		AND	tvj.IS_DELETED=\'N\'\r\n		AND	tbc.FK_USER_ID = #USER_ID#\r\n		AND tbc.FK_USER_ID = tvj.CREATED_BY\r\n		AND	tbc.FK_JOBSEEKER_ID = tvj.FK_JOBSEEKER_ID\r\n		AND tvj.FK_VISIT_ID = tvr.VISIT_ID\r\n		AND tvr.CREATED_DT = (select MAX(tvrn.CREATED_DT) from tbl_visit_record tvrn ,tbl_visit_jobseeker tvjn where tvrn.VISIT_ID = tvjn.FK_VISIT_ID AND tbc.FK_JOBSEEKER_ID = tvjn.FK_JOBSEEKER_ID)) t1\r\n		WHERE \r\n			t1.VISIT_INTENTION = \'1\'\r\n		AND t1.CREATED_DT > UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n		GROUP BY\r\n				FROM_UNIXTIME(t1.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n		SELECT\r\n			FROM_UNIXTIME(t1.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			\'\' AS statics1,\r\n			\'\' AS statics2,\r\n			COUNT(t1.VISIT_INTENTION) AS statics3,\r\n			\'\' AS statics4\r\n		FROM\r\n		(SELECT\r\n			tvr.VISIT_INTENTION,\r\n			tvr.CREATED_DT\r\n		FROM\r\n			tbl_distri_consult tbc,\r\n			tbl_visit_jobseeker tvj,\r\n			tbl_visit_record tvr\r\n		WHERE\r\n			tvr.IS_DELETED = \'N\'\r\n		AND	tbc.IS_DELETED=\'N\'\r\n		AND	tvj.IS_DELETED=\'N\'\r\n		AND	tbc.FK_USER_ID = #USER_ID#\r\n		AND tbc.FK_USER_ID = tvj.CREATED_BY\r\n		AND	tbc.FK_JOBSEEKER_ID = tvj.FK_JOBSEEKER_ID\r\n		AND tvj.FK_VISIT_ID = tvr.VISIT_ID\r\n		AND tvr.CREATED_DT = (select MAX(tvrn.CREATED_DT) from tbl_visit_record tvrn ,tbl_visit_jobseeker tvjn where tvrn.VISIT_ID = tvjn.FK_VISIT_ID AND tbc.FK_JOBSEEKER_ID = tvjn.FK_JOBSEEKER_ID)) t1\r\n		WHERE \r\n			t1.VISIT_INTENTION = \'2\'\r\n		AND t1.CREATED_DT > UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n		GROUP BY\r\n				FROM_UNIXTIME(t1.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n		SELECT\r\n			FROM_UNIXTIME(t1.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			\'\' AS statics1,\r\n			\'\' AS statics2,\r\n			\'\' AS statics3,\r\n			COUNT(t1.VISIT_INTENTION) AS statics4\r\n		FROM\r\n		(SELECT\r\n			tvr.VISIT_INTENTION,\r\n			tvr.CREATED_DT\r\n		FROM\r\n			tbl_distri_consult tbc,\r\n			tbl_visit_jobseeker tvj,\r\n			tbl_visit_record tvr\r\n		WHERE\r\n			tvr.IS_DELETED = \'N\'\r\n		AND	tbc.IS_DELETED=\'N\'\r\n		AND	tvj.IS_DELETED=\'N\'\r\n		AND	tbc.FK_USER_ID = #USER_ID#\r\n		AND tbc.FK_USER_ID = tvj.CREATED_BY\r\n		AND	tbc.FK_JOBSEEKER_ID = tvj.FK_JOBSEEKER_ID\r\n		AND tvj.FK_VISIT_ID = tvr.VISIT_ID\r\n		AND tvr.CREATED_DT = (select MAX(tvrn.CREATED_DT) from tbl_visit_record tvrn ,tbl_visit_jobseeker tvjn where tvrn.VISIT_ID = tvjn.FK_VISIT_ID AND tbc.FK_JOBSEEKER_ID = tvjn.FK_JOBSEEKER_ID)) t1\r\n		WHERE \r\n			t1.VISIT_INTENTION = \'3\'\r\n		AND t1.CREATED_DT > UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n		GROUP BY\r\n				FROM_UNIXTIME(t1.CREATED_DT, \'%Y-%m-%d\')\r\n	) ST\r\nGROUP BY ST.DATE ', '2', null, 'N', null, null, '1492584814', null, '0');
INSERT INTO `stb_stats` VALUES ('ba03b71673734fd6b84029710bfd66a4', '网咨线性统计', 'WZ_DEPARTMENT', 'line', 'SELECT\r\n	ST.date,sum(ST.statics1) AS contetNumber,sum(ST.statics2) AS distNumber,sum(ST.statics3) AS optionNumber\r\nFROM\r\n	(\r\n		SELECT\r\n			FROM_UNIXTIME(tr.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			COUNT(tr.CREATED_DT) AS statics1,\r\n			\'\' AS statics2,\r\n			\'\' AS statics3\r\n		FROM\r\n			tbl_jobseeker tjb,\r\n			tbl_resume_jobseeker trj,\r\n			tbl_resume tr\r\n		WHERE\r\n			tjb.IS_DELETED = \'N\'\r\n		AND trj.IS_DELETED = \'N\'\r\n		AND tr.IS_DELETED = \'N\'\r\n		AND tjb.ID = trj.JOB_SEEKER_ID\r\n		AND trj.RESUME_ID = tr.ID\r\n		AND tjb.CREATED_BY = trj.CREATED_BY\r\n		AND trj.CREATED_BY = tr.CREATED_BY\r\n		AND tr.RESUMESOURCE IS NOT NULL\r\n		AND tr.CREATED_DT IS NOT NULL\r\n		AND tr.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n		AND TR.CREATED_BY = #USER_ID#\r\n		GROUP BY\r\n			FROM_UNIXTIME(tr.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n			(\r\n				SELECT\r\n					FROM_UNIXTIME(tra.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n					\'\' AS statics1,\r\n					COUNT(tra.CREATED_DT) AS statics2,\r\n					\'\' AS statics3\r\n				FROM\r\n					tbl_resume tr,\r\n					tbl_resume_allot tra\r\n				WHERE\r\n					tra.IS_DELETED = \'N\'\r\n				AND tr.IS_DELETED = \'N\'\r\n				AND tr.ID = tra.RESUME_ID\r\n				AND tr.RESUMESOURCE IS NOT NULL\r\n				AND tra.CREATED_DT IS NOT NULL\r\n				AND tra.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n				AND tra.CREATED_BY = #USER_ID#\r\n				GROUP BY\r\n					FROM_UNIXTIME(tra.CREATED_DT, \'%Y-%m-%d\')\r\n			)\r\n		UNION ALL\r\n			(\r\n					SELECT\r\n						FROM_UNIXTIME(SIR.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n						\'\' AS statics1,\r\n						\'\' AS statics2,\r\n						COUNT(SIR.CREATED_DT) AS statics3\r\n					FROM\r\n						tbl_invitation_record SIR,\r\n						tbl_resume_invitation tri\r\n					WHERE\r\n							tri.IS_DELETED = \'N\'\r\n					AND SIR.IS_DELETED = \'N\'\r\n					AND tri.FK_INVITATION_ID = SIR.IR_ID\r\n					AND SIR.CREATED_BY = #USER_ID#\r\n					AND SIR.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n				GROUP BY\r\n					FROM_UNIXTIME(SIR.CREATED_DT, \'%Y-%m-%d\')\r\n			)\r\n	) ST\r\nGROUP BY ST.DATE ', '0', null, 'N', '1490840433', null, '1489978189', null, '0');
INSERT INTO `stb_stats` VALUES ('df2ab20fb75a44e39b3038488984551e', '咨询条形', 'ZX_DEPARTMENT', 'column', 'SELECT\r\n	ST.date,sum(ST.statics1) AS contetNumber,sum(ST.statics2) AS distNumber\r\nFROM\r\n	(\r\n		SELECT\r\n			FROM_UNIXTIME(tbc.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			COUNT(tbc.ID) AS statics1,\r\n			\'\' AS statics2,\r\n			\'\' AS statics3\r\n		FROM\r\n			tbl_distri_consult tbc\r\n		WHERE\r\n			tbc.IS_DELETED = \'N\'\r\n		AND tbc.FK_USER_ID = #USER_ID#\r\n		AND tbc.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n		GROUP BY\r\n			FROM_UNIXTIME(tbc.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n				SELECT\r\n					FROM_UNIXTIME(tvr.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n					\'\' AS statics1,\r\n					COUNT(tvr.VISIT_ID) AS statics2,\r\n					\'\' AS statics3\r\n				FROM\r\n					tbl_visit_record tvr\r\n				WHERE\r\n						tvr.IS_DELETED = \'N\'\r\n				AND tvr.CREATED_BY = #USER_ID#\r\n				AND tvr.CREATED_DT > UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 WEEK))\r\n				GROUP BY\r\n					FROM_UNIXTIME(tvr.CREATED_DT, \'%Y-%m-%d\')\r\n	) ST\r\nGROUP BY ST.DATE ', '1', null, 'N', '1492584823', null, '1492584792', null, '0');
INSERT INTO `stb_stats` VALUES ('e533c785ad804327b5f982d8c9adfeca', '咨询左侧统计', 'ZX_DEPARTMENT', 'leftCharts', 'SELECT\r\n \'咨询人数\' AS NAME,COUNT(tbc.ID) AS number\r\nFROM\r\n	tbl_distri_consult tbc\r\nWHERE\r\n	tbc.IS_DELETED = \'N\'\r\nAND tbc.FK_USER_ID = #USER_ID#\r\nUNION ALL\r\nSELECT\r\n \'咨询次数\' AS NAME,COUNT(tvr.VISIT_ID) AS number\r\nFROM\r\n	tbl_visit_record tvr\r\nWHERE\r\n	tvr.IS_DELETED = \'N\'\r\nAND tvr.CREATED_BY = #USER_ID#\r\nUNION ALL\r\nSELECT\r\n	\'已签约\' AS NAME,COUNT(t1.VISIT_INTENTION) AS number\r\nFROM\r\n(SELECT\r\n	tvr.VISIT_INTENTION\r\nFROM\r\n	tbl_distri_consult tbc,\r\n	tbl_visit_jobseeker tvj,\r\n	tbl_visit_record tvr\r\nWHERE\r\n	tvr.IS_DELETED = \'N\'\r\nAND	tbc.IS_DELETED=\'N\'\r\nAND	tvj.IS_DELETED=\'N\'\r\nAND	tbc.FK_USER_ID = #USER_ID#\r\nAND tbc.FK_USER_ID = tvj.CREATED_BY\r\nAND	tbc.FK_JOBSEEKER_ID = tvj.FK_JOBSEEKER_ID\r\nAND tvj.FK_VISIT_ID = tvr.VISIT_ID\r\nAND tvr.CREATED_DT = (select MAX(tvrn.CREATED_DT) from tbl_visit_record tvrn ,tbl_visit_jobseeker tvjn where tvrn.VISIT_ID = tvjn.FK_VISIT_ID AND tbc.FK_JOBSEEKER_ID = tvjn.FK_JOBSEEKER_ID)) t1\r\nWHERE \r\n	t1.VISIT_INTENTION = \'0\'\r\nUNION ALL\r\nSELECT\r\n	\'待签约\' AS NAME,COUNT(t1.VISIT_INTENTION) AS number\r\nFROM\r\n(SELECT\r\n	tvr.VISIT_INTENTION\r\nFROM\r\n	tbl_distri_consult tbc,\r\n	tbl_visit_jobseeker tvj,\r\n	tbl_visit_record tvr\r\nWHERE\r\n	tvr.IS_DELETED = \'N\'\r\nAND	tbc.IS_DELETED=\'N\'\r\nAND	tvj.IS_DELETED=\'N\'\r\nAND	tbc.FK_USER_ID = #USER_ID#\r\nAND tbc.FK_USER_ID = tvj.CREATED_BY\r\nAND	tbc.FK_JOBSEEKER_ID = tvj.FK_JOBSEEKER_ID\r\nAND tvj.FK_VISIT_ID = tvr.VISIT_ID\r\nAND tvr.CREATED_DT = (select MAX(tvrn.CREATED_DT) from tbl_visit_record tvrn ,tbl_visit_jobseeker tvjn where tvrn.VISIT_ID = tvjn.FK_VISIT_ID AND tbc.FK_JOBSEEKER_ID = tvjn.FK_JOBSEEKER_ID)) t1\r\nWHERE \r\n	t1.VISIT_INTENTION = \'1\'\r\nUNION ALL\r\nSELECT\r\n	\'有意向\' AS NAME,COUNT(t1.VISIT_INTENTION) AS number\r\nFROM\r\n(SELECT\r\n	tvr.VISIT_INTENTION\r\nFROM\r\n	tbl_distri_consult tbc,\r\n	tbl_visit_jobseeker tvj,\r\n	tbl_visit_record tvr\r\nWHERE\r\n	tvr.IS_DELETED = \'N\'\r\nAND	tbc.IS_DELETED=\'N\'\r\nAND	tvj.IS_DELETED=\'N\'\r\nAND	tbc.FK_USER_ID = #USER_ID#\r\nAND tbc.FK_USER_ID = tvj.CREATED_BY\r\nAND	tbc.FK_JOBSEEKER_ID = tvj.FK_JOBSEEKER_ID\r\nAND tvj.FK_VISIT_ID = tvr.VISIT_ID\r\nAND tvr.CREATED_DT = (select MAX(tvrn.CREATED_DT) from tbl_visit_record tvrn ,tbl_visit_jobseeker tvjn where tvrn.VISIT_ID = tvjn.FK_VISIT_ID AND tbc.FK_JOBSEEKER_ID = tvjn.FK_JOBSEEKER_ID)) t1\r\nWHERE \r\n	t1.VISIT_INTENTION = \'2\'\r\nUNION ALL\r\nSELECT\r\n	\'无意向\' AS NAME,COUNT(t1.VISIT_INTENTION) AS number\r\nFROM\r\n(SELECT\r\n	tvr.VISIT_INTENTION\r\nFROM\r\n	tbl_distri_consult tbc,\r\n	tbl_visit_jobseeker tvj,\r\n	tbl_visit_record tvr\r\nWHERE\r\n	tvr.IS_DELETED = \'N\'\r\nAND	tbc.IS_DELETED=\'N\'\r\nAND	tvj.IS_DELETED=\'N\'\r\nAND	tbc.FK_USER_ID = #USER_ID#\r\nAND tbc.FK_USER_ID = tvj.CREATED_BY\r\nAND	tbc.FK_JOBSEEKER_ID = tvj.FK_JOBSEEKER_ID\r\nAND tvj.FK_VISIT_ID = tvr.VISIT_ID\r\nAND tvr.CREATED_DT = (select MAX(tvrn.CREATED_DT) from tbl_visit_record tvrn ,tbl_visit_jobseeker tvjn where tvrn.VISIT_ID = tvjn.FK_VISIT_ID AND tbc.FK_JOBSEEKER_ID = tvjn.FK_JOBSEEKER_ID)) t1\r\nWHERE \r\n	t1.VISIT_INTENTION = \'3\'\r\n', '0', null, 'N', null, null, '1492584758', null, '0');
INSERT INTO `stb_stats` VALUES ('ef66138750d64c3d8f811b099afa84bd', '待定区域', 'E2FF', 'cake', 'WEES', '4', null, 'N', null, null, '1489989965', null, '0');
INSERT INTO `stb_stats` VALUES ('f69655d339dd434bb7618220dceeb910', '运营线性统计', 'YY_DEPARTMENT', 'line', 'SELECT\r\n	ST.date,sum(ST.statics1) AS contetNumber,sum(ST.statics2) AS phoneNumber,sum(ST.statics3) AS backNumber\r\nFROM\r\n	(\r\n		SELECT\r\n			FROM_UNIXTIME(tra.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n			COUNT(tra.ID) AS statics1,\r\n			\'\' AS statics2,\r\n			\'\' AS statics3\r\n		FROM\r\n			tbl_resume tr,\r\n			tbl_resume_allot tra\r\n		WHERE\r\n			tr.IS_DELETED = \'N\'\r\n		AND tra.IS_DELETED = \'N\'\r\n		AND tr.ID = tra.RESUME_ID\r\n		AND tra.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 MONTH))\r\n		AND tra.USER_ID = #USER_ID#\r\n		GROUP BY FROM_UNIXTIME(tra.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n				SELECT\r\n					FROM_UNIXTIME(tir.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n					\'\' AS statics1,\r\n					COUNT(tir.IR_ID) AS statics2,\r\n					\'\' AS statics3\r\n				FROM\r\n					tbl_jobseeker tj,\r\n					tbl_resume_invitation tri,\r\n					tbl_invitation_record tir\r\n				WHERE\r\n						tj.IS_DELETED = \'N\'\r\n				AND tri.IS_DELETED = \'N\'\r\n				AND tir.IS_DELETED = \'N\'\r\n				AND tj.ID = tri.FK_JOBSEEKER_ID\r\n				AND tri.FK_INVITATION_ID = tir.IR_ID\r\n				AND tir.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 MONTH))\r\n				AND tir.CREATED_BY = #USER_ID#\r\n				GROUP BY FROM_UNIXTIME(tir.CREATED_DT, \'%Y-%m-%d\')\r\n		UNION ALL\r\n				SELECT\r\n					FROM_UNIXTIME(tir.CREATED_DT, \'%Y-%m-%d\') AS date,\r\n					\'\' AS statics1,\r\n					\'\' AS statics2,\r\n					COUNT(tir.IR_ID) AS statics3\r\n				FROM\r\n					tbl_jobseeker tj,\r\n					tbl_resume_invitation tri,\r\n					tbl_invitation_record tir\r\n				WHERE\r\n						tj.IS_DELETED = \'N\'\r\n				AND tri.IS_DELETED = \'N\'\r\n				AND tir.IS_DELETED = \'N\'\r\n				AND tj.ID = tri.FK_JOBSEEKER_ID\r\n				AND tri.FK_INVITATION_ID = tir.IR_ID\r\n				AND (tir.INVITATION_TIME <> \'\' OR tir.INVITATION_TIME IS NOT NULL)\r\n				AND tir.CREATED_DT>UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 1 MONTH))\r\n				AND tir.CREATED_BY = #USER_ID#\r\n				GROUP BY FROM_UNIXTIME(tir.CREATED_DT, \'%Y-%m-%d\')\r\n	) ST\r\nGROUP BY ST.DATE ', '2', null, 'N', null, null, '1491017993', null, '0');
INSERT INTO `stb_stats` VALUES ('f86673347e734c0680ff346b95a43c68', '运营左侧功能区', 'YY_DEPARTMENT', 'leftCharts', 'SELECT\r\n	\'收到的简历\' AS NAME,\r\n	COUNT(tr.ID) AS number\r\nFROM\r\n	tbl_resume tr,\r\n	tbl_resume_allot tra\r\nWHERE\r\n	tr.IS_DELETED = \'N\'\r\nAND tra.IS_DELETED = \'N\'\r\nAND tr.ID = tra.RESUME_ID\r\nAND tra.USER_ID = #USER_ID#\r\nUNION ALL\r\n	SELECT\r\n		\'邀约比例\' AS NAME,\r\n		COUNT(tb_tj.ID) AS number\r\n	FROM\r\n		(\r\n			SELECT DISTINCT\r\n				tj.ID\r\n			FROM\r\n				tbl_jobseeker tj,\r\n				tbl_resume_invitation tri,\r\n				tbl_invitation_record tir\r\n			WHERE\r\n				tj.IS_DELETED = \'N\'\r\n			AND tri.IS_DELETED = \'N\'\r\n			AND tir.IS_DELETED = \'N\'\r\n			AND tj.ID = tri.FK_JOBSEEKER_ID\r\n			AND tri.FK_INVITATION_ID = tir.IR_ID\r\n			AND tir.CREATED_BY = #USER_ID#\r\n		) tb_tj\r\n	UNION ALL\r\n		SELECT\r\n			\'预约上门数\' AS NAME,\r\n			COUNT(tb_tj.ID) AS number\r\n		FROM\r\n			(\r\n				SELECT DISTINCT\r\n					tj.ID\r\n				FROM\r\n					tbl_jobseeker tj,\r\n					tbl_resume_invitation tri,\r\n					tbl_invitation_record tir\r\n				WHERE\r\n					tj.IS_DELETED = \'N\'\r\n				AND tri.IS_DELETED = \'N\'\r\n				AND tir.IS_DELETED = \'N\'\r\n				AND tj.ID = tri.FK_JOBSEEKER_ID\r\n				AND (\r\n					tir.INVITATION_TIME <> \'\'\r\n					OR tir.INVITATION_TIME IS NOT NULL\r\n				)\r\n				AND tri.FK_INVITATION_ID = tir.IR_ID\r\n				AND tir.CREATED_BY = #USER_ID#\r\n			) tb_tj\r\n		UNION ALL\r\n			SELECT\r\n				\'实际上门人数\' AS NAME,\r\n				COUNT(tb.ID) AS number\r\n			FROM\r\n				tbl_jobseeker tb,\r\n				tbl_resume_jobseeker trj,\r\n				tbl_resume tr,\r\n				tbl_resume_allot tra,\r\n				tbl_distri_consult tdc\r\n			WHERE\r\n				tr.IS_DELETED = \'N\'\r\n			AND tdc.IS_DELETED = \'N\'\r\n			AND tb.IS_DELETED = \'N\'\r\n			AND trj.IS_DELETED = \'N\'\r\n			AND tra.IS_DELETED = \'N\'\r\n			AND tb.ID = trj.JOB_SEEKER_ID\r\n			AND trj.RESUME_ID = tr.ID\r\n			AND tr.ID = tra.RESUME_ID\r\n			AND tb.ID = tdc.FK_JOBSEEKER_ID\r\n			AND tra.USER_ID = #USER_ID#\r\n		UNION ALL\r\n			SELECT\r\n				\'已签约\' AS NAME,\r\n				COUNT(tb_tj.ID) AS number\r\n			FROM\r\n				tbl_contract tc,\r\n				(\r\n					SELECT DISTINCT\r\n						tj.ID\r\n					FROM\r\n						tbl_jobseeker tj,\r\n						tbl_resume_invitation tri,\r\n						tbl_invitation_record tir\r\n					WHERE\r\n						tj.IS_DELETED = \'N\'\r\n					AND tri.IS_DELETED = \'N\'\r\n					AND tir.IS_DELETED = \'N\'\r\n					AND tj.ID = tri.FK_JOBSEEKER_ID\r\n					AND tri.FK_INVITATION_ID = tir.IR_ID\r\n					AND tir.CREATED_BY = #USER_ID#\r\n				) tb_tj\r\n			WHERE\r\n				tc.IS_DELETED = \'N\'\r\n			AND tb_tj.ID = tc.JOB_SEEKER_ID\r\n				', '0', null, 'N', '1491037364', null, '1491017866', null, '0');

-- ----------------------------
-- Table structure for stb_stats_relation
-- ----------------------------
DROP TABLE IF EXISTS `stb_stats_relation`;
CREATE TABLE `stb_stats_relation` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `STATS_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '统计ID',
  `RELATION_TYPE` varchar(32) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '关联类型',
  `RELATION_CON` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '关联内容',
  `COMPARISON` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '比较',
  `REMARK` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `IS_DELETED` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'N',
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(8) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_stats_relation
-- ----------------------------

-- ----------------------------
-- Table structure for stb_user
-- ----------------------------
DROP TABLE IF EXISTS `stb_user`;
CREATE TABLE `stb_user` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `USER_NAME` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名称',
  `USER_ACCOUNT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `USER_PASS` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `USER_SEX` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '性别 0 女 1 男',
  `USER_PHONE` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `USER_ADDRESS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '住址',
  `USER_EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `USER_HEADIMG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `USER_EXPLAIN` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_NATION` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '民族',
  `USER_BIRTHDAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生日',
  `JOIN_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入党日期',
  `REFULAR_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '成为正式党员日期',
  `CREATE_DATE` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATE_DATE` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '党纪状态',
  `REGION` text COLLATE utf8_unicode_ci COMMENT '冗余字段',
  `IS_SUPER` varchar(4) COLLATE utf8_unicode_ci DEFAULT '2' COMMENT '1/超级管理员 2/党员，普通管理员 3/党员，普通用户 4/预备党员，普通用户',
  `WX_NUMBER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_ONLINE` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `MEET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `WX_NUMBER` (`WX_NUMBER`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_user
-- ----------------------------
INSERT INTO `stb_user` VALUES ('0026211fd5764fe7b6cd46608bc5e2a3', '刘烁', 'liushuo', '111111', '0', null, null, null, null, null, '汉族', '1981-06-26', '2013-05-04', '2014-05-04', '2017-10-16 18:11:12', null, '1', null, '3', null, '1', null);
INSERT INTO `stb_user` VALUES ('0058704fe0ff4ef784b81b731f4b77fc', '李铭', 'liming', '111111', '0', null, null, null, null, null, '汉族', '1984-02-15', '2005-09-11', '2006-09-11', '2017-10-16 17:55:13', null, '1', null, '3', null, '1', null);
INSERT INTO `stb_user` VALUES ('01c009d5c57b406194e457920c242406', '周翔', 'zhouxiang', '111111', '0', null, null, null, null, null, '汉族', '1978-12-17', '2003-08-01', '2004-08-01', '2017-10-16 17:55:13', null, '1', null, '3', null, '1', null);
INSERT INTO `stb_user` VALUES ('01dbbf64efa74e9fa5eb394224f57bb1', '郝国强', 'haoguoqiang', '111111', '0', null, null, null, null, null, '汉族', '1987-01-03', '2009-11-12', '2010-11-12', '2017-10-16 18:05:25', null, '1', null, '3', null, '1', null);
INSERT INTO `stb_user` VALUES ('2d5df45347a140b3bb804c39ba49e91a', '陈艳芬', 'chenyanfen', '111111', '1', null, null, null, null, null, '汉族', '1983-10-04', '2005-04-03', '2006-04-03', '2017-10-16 18:11:13', null, '1', null, '3', null, '1', null);
INSERT INTO `stb_user` VALUES ('3c376bb33b1d43128f3785c5d214cd5e', 'admin', 'admin', '111111', '0', '13981172274', null, null, '/pictureResources/photos/20170914172919_530.jpg', null, '', null, null, null, null, '2017-09-14 17:29:21', '1', null, '1', '3aa', '1', null);

-- ----------------------------
-- Table structure for stb_validate
-- ----------------------------
DROP TABLE IF EXISTS `stb_validate`;
CREATE TABLE `stb_validate` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_VALIDATE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CHARE_DT` int(16) NOT NULL,
  `TOKEN` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stb_validate
-- ----------------------------
INSERT INTO `stb_validate` VALUES ('003583c749994bdba2a6e84ef7de2640', 'e283f0c444604d6887eba34dd4c8de32', '5f72abcce56f4d59878b86850a6cb54f', '1492049857', '{\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170412190008_100.png\",\"USER_PHONE\":\"13885233258\",\"UPDATE_DATE\":\"2017-04-13 07:04:39\",\"USER_ACCOUNT\":\"ceshi\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"ceshi\",\"ID\":\"e283f0c444604d6887eba34dd4c8de32\",\"CREATE_DATE\":\"2017-04-12 18:59:26\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('095ef293c00946ae9646be2e880c7df2', '39ba959b9b0d4509b5e7f185c3370bda', '73a646c9a94945f89ebe9b7ae9841533', '1492610621', '{\"USER_EMAIL\":\"4646496@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13541456789\",\"UPDATE_DATE\":\"2017-04-18 16:08:17\",\"ROLE_NAME\":\"运营二组电话专员\",\"USER_ACCOUNT\":\"zhengwei\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都\",\"USER_PASS\":\"123456\",\"USER_NAME\":\"郑威\",\"ID\":\"39ba959b9b0d4509b5e7f185c3370bda\",\"CREATE_DATE\":\"2017-04-17 14:54:31\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('0bd744c592e14469bac9fbd96e2cf314', '67db5d9043bb4e758b6081696e84418a', '4e0bf79cc64f4edfaadcaa34f55e15b0', '1491803683', '{\"USER_SEX\":\"1\",\"UPDATE_DATE\":\"2017-04-07 10:03:30\",\"USER_EMAIL\":\"1728996139@qq.com\",\"STATE\":\"1\",\"USER_NAME\":\"侯帅\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_PHONE\":\"13981173374\",\"CREATE_DATE\":\"2017-03-06 16:18:40\",\"USER_HEADIMG\":\"/pictureResources/photos/20170405195657_522.jpg\",\"IS_SUPER\":\"2\",\"IS_ONLINE\":\"1\",\"ID\":\"67db5d9043bb4e758b6081696e84418a\",\"USER_ACCOUNT\":\"hkl111\"}');
INSERT INTO `stb_validate` VALUES ('0d103239351d4b8a9dc7cc2230608eb0', '22b9c4ed882d408fb954353d443af370', 'fccea0bfdd9d4441b435bef2eee4d30e', '1493351522', '{\"USER_EMAIL\":\"1225@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"18381699080\",\"UPDATE_DATE\":\"2017-04-21 16:01:13\",\"ROLE_NAME\":\"行政助理\",\"ROLE_ID\":\"3385adbb93f64623956200120f4f6987\",\"USER_ACCOUNT\":\"zhupanpan\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"USER_PASS\":\"123456\",\"USER_NAME\":\"朱盼盼\",\"ID\":\"22b9c4ed882d408fb954353d443af370\",\"CREATE_DATE\":\"2017-04-17 14:35:58\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('0fb2099857cd44faaae26e0ecce862a3', '12aa28b4402f4c2cb9c5b6834ab4285c', '9b25413dc622463bba4485c914a8fea9', '1493862710', '{\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"15966993366\",\"ROLE_NAME\":\"公司前台\",\"ROLE_ID\":\"c6fb84b3914b44cdbb3219b1be2fd839\",\"USER_ACCOUNT\":\"testQt\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都武侯\",\"USER_PASS\":\"123456\",\"USER_NAME\":\"testQt\",\"ID\":\"12aa28b4402f4c2cb9c5b6834ab4285c\",\"CREATE_DATE\":\"2017-05-04 09:50:42\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('12169e51718f45ac8f7c4bb792882027', 'e3fccec6ab894289841aecf79d55e36f', 'b58c7d84a00a496ca6ea12be0fd6c4d5', '1496887194', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"zhangz@qq.com\",\"DP_ID\":\"b7a40cd982274ed88870075b09641282\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170509102548_545.jpg\",\"USER_PHONE\":\"13856465656\",\"UPDATE_DATE\":\"2017-05-09 10:38:11\",\"ROLE_NAME\":\"副总经理\",\"ROLE_ID\":\"059f8c7dc4064bb3b18d62e07c11b13b\",\"USER_ACCOUNT\":\"zhangzong\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"二师兄\",\"ID\":\"e3fccec6ab894289841aecf79d55e36f\",\"CREATE_DATE\":\"2017-05-09 10:04:59\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('167411da83af43878782bdc712895a64', '1', '8bb363093ea348f294b5bd8fe4d7d12d', '1488526057', '{\"USER_PASS\":\"111111\",\"USER_PHONE\":\"13981172274\",\"USER_HEADIMG\":\"/pictureResources/photos/20170302180908_589.jpg\",\"USER_SEX\":\"1\",\"UPDATE_DATE\":\"2017-03-02 18:09:11\",\"IS_SUPER\":\"1\",\"ID\":\"1\",\"USER_NAME\":\"admin\",\"USER_ACCOUNT\":\"admin\"}');
INSERT INTO `stb_validate` VALUES ('17f55e04c77b424c8dacd6b21d76fe41', '661afca06d2448d29d120973dff78a6a', 'ece476509fae416d95dc39218625d9f3', '1497056860', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"1746573672@qq.com\",\"DP_ID\":\"c8d92d15f3da4f66aab56ed4cb38056f\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170427102834_435.jpg\",\"USER_PHONE\":\"13678096467\",\"UPDATE_DATE\":\"2017-05-31 14:22:47\",\"ROLE_NAME\":\"人事部咨询师\",\"ROLE_ID\":\"b652cfe1bfdc4d849b76ddf33a282bfc\",\"USER_ACCOUNT\":\"liping\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"金牛区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"919818\",\"USER_NAME\":\"李萍\",\"ID\":\"661afca06d2448d29d120973dff78a6a\",\"CREATE_DATE\":\"2017-04-17 11:51:42\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('1aaed6e9a3974f7bbdc274a341a3c2c6', 'f1d2565e421e4d77a327f9c864fea5f3', 'd5270a55138e41a39bcfd25e2a6ac32f', '1491536558', '{\"USER_EMAIL\":\"16539564@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170405195301_611.gif\",\"USER_PHONE\":\"15969693232\",\"UPDATE_DATE\":\"2017-04-07 11:15:09\",\"USER_ACCOUNT\":\"l5y9\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都市武侯区海椒市街\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"l5y9散了\",\"ID\":\"f1d2565e421e4d77a327f9c864fea5f3\",\"CREATE_DATE\":\"2017-03-22 16:12:19\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('1acb4c47095f4b4d8d5423ba068512ea', '2750c38da5b9466db5c09c4f4763126d', '0987fcb6bc75483c9823ca4c649a6723', '1491803430', '{\"USER_SEX\":\"0\",\"UPDATE_DATE\":\"2017-04-07 14:45:33\",\"USER_EMAIL\":\"123@qq.com\",\"STATE\":\"1\",\"USER_NAME\":\"网资专员\",\"USER_ADDRESS\":\"成都\",\"USER_PASS\":\"111111\",\"USER_PHONE\":\"15615161511\",\"CREATE_DATE\":\"2017-04-05 18:08:01\",\"USER_HEADIMG\":\"\",\"IS_SUPER\":\"2\",\"IS_ONLINE\":\"1\",\"ID\":\"2750c38da5b9466db5c09c4f4763126d\",\"USER_ACCOUNT\":\"wzzy\"}');
INSERT INTO `stb_validate` VALUES ('1d51cf2a098843c3b98514949c530624', '3734f993e6b04f80a344a61ab12d72a6', 'dcd3f6f13d244b8c9087cde146ac8a20', '1492159188', '{\"USER_SEX\":\"0\",\"USER_EMAIL\":\"99874@qq.com\",\"STATE\":\"1\",\"USER_NAME\":\"测试网址\",\"USER_ADDRESS\":\"\",\"ROLE_NAME\":\"网咨人员\",\"USER_PASS\":\"111111\",\"USER_PHONE\":\"13984472214\",\"CREATE_DATE\":\"2017-04-14 15:39:13\",\"USER_HEADIMG\":\"/pictureResources/photos/20170414153912_990.jpg\",\"IS_SUPER\":\"2\",\"IS_ONLINE\":\"0\",\"ID\":\"3734f993e6b04f80a344a61ab12d72a6\",\"USER_ACCOUNT\":\"csyhwz\"}');
INSERT INTO `stb_validate` VALUES ('25151fd9dea8497a97659193bad43402', '7879977fce894f1494d5776f010183ff', 'f9f3d59dc72c4a1da7df26ba1844fdf2', '1491826549', '{\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170410194037_666.png\",\"USER_PHONE\":\"13881279999\",\"UPDATE_DATE\":\"2017-04-10 19:40:44\",\"USER_ACCOUNT\":\"qwer\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"qwer\",\"ID\":\"7879977fce894f1494d5776f010183ff\",\"CREATE_DATE\":\"2017-04-10 19:36:05\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('2557f2e713b1496b9d9b920dc7151ee3', 'caf1a9c9af0949df821870f556f35d8b', '5abc3727fb7d4007b28da34a8b062e0c', '1496997706', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"554464@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13456789514\",\"ROLE_NAME\":\"运营一组电话专员\",\"ROLE_ID\":\"44db0306e0544723b3598178504d4407\",\"USER_ACCOUNT\":\"zhuxiaoyan\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"锦江区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"朱晓艳\",\"ID\":\"caf1a9c9af0949df821870f556f35d8b\",\"CREATE_DATE\":\"2017-04-17 14:51:25\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('2be7917d1b294c3cb8e5a06d91823909', 'ef3ba0605a1f44b1981dcc5affb5c2c6', '8b6dc41d3d644ee59463b7d54efeda26', '1492054791', '{\"USER_EMAIL\":\"154@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170411150501_156.jpg\",\"USER_PHONE\":\"13987741145\",\"UPDATE_DATE\":\"2017-04-13 11:39:32\",\"USER_ACCOUNT\":\"qiantai\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"懂林\",\"ID\":\"ef3ba0605a1f44b1981dcc5affb5c2c6\",\"CREATE_DATE\":\"2017-04-11 15:05:02\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('2d558fa35bde41d3b058c29ce569c0b5', 'e1b56fea35e84fd4891fbb2b3bf5aaa9', '7470dac2ffd84c6a89248f5d25db56a8', '1491803753', '{\"USER_SEX\":\"1\",\"UPDATE_DATE\":\"2017-04-07 10:02:40\",\"USER_EMAIL\":\"78033@qq.com\",\"STATE\":\"1\",\"USER_NAME\":\"前台妹子\",\"USER_ADDRESS\":\"成都\",\"USER_PASS\":\"111111\",\"USER_PHONE\":\"15121115342\",\"CREATE_DATE\":\"2017-04-01 19:24:18\",\"USER_HEADIMG\":\"\",\"IS_SUPER\":\"2\",\"IS_ONLINE\":\"1\",\"ID\":\"e1b56fea35e84fd4891fbb2b3bf5aaa9\",\"USER_ACCOUNT\":\"qiantai\"}');
INSERT INTO `stb_validate` VALUES ('329cbe1c457944a4918936057b9e9bf4', '39fcd76f5b1744d08113d355a13799a3', 'ae8b3a091d744f31ae2e28c77ad461ce', '1493294588', '{\"USER_EMAIL\":\"552440111@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13984471142\",\"ROLE_NAME\":\"董事长\",\"ROLE_ID\":\"b4e381329d734d218c0a445c23ec0344\",\"USER_ACCOUNT\":\"gaofengyi\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"保密\",\"USER_PASS\":\"940817\",\"USER_NAME\":\"高枫熠\",\"ID\":\"39fcd76f5b1744d08113d355a13799a3\",\"CREATE_DATE\":\"2017-04-24 14:14:25\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('336c1c9a8ed24d8587d171552098e0a7', '966ebc38424047af986affa3f974bb93', '2e501a2b2d7649d1b7f426d6c7f40acc', '1492679270', '{\"USER_EMAIL\":\"1745468@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170414154329_997.jpg\",\"USER_PHONE\":\"18383455788\",\"ROLE_NAME\":\"运营组长\",\"USER_ACCOUNT\":\"csyhyy\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"测试运营\",\"ID\":\"966ebc38424047af986affa3f974bb93\",\"CREATE_DATE\":\"2017-04-14 15:43:31\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('3a753c1ce0ce431da6c456a3a92f0e80', '4bd1ec85ea3446b69727a1663bc24411', 'cd13844cc4964a76a1f64bd877532554', '1494829994', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"555554@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13564214587\",\"ROLE_NAME\":\"运营一组电话专员\",\"ROLE_ID\":\"44db0306e0544723b3598178504d4407\",\"USER_ACCOUNT\":\"lizongda\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"李宗达\",\"ID\":\"4bd1ec85ea3446b69727a1663bc24411\",\"CREATE_DATE\":\"2017-05-09 10:39:40\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('43e03e6358234db5990bd122865539ac', 'd3ac36180223467fa13a1e69cab71545', '15ee62ac2c374e678be2ad7cf80c6cf0', '1513573073', '{\"REFULAR_DAY\":\"2016-06-17\",\"REGION_HEADIMG\":\"\",\"USER_SEX\":\"null\",\"UPDATE_DATE\":\"2017-12-18 12:37:03\",\"STATE\":\"1\",\"DP_ID\":\"b7a40cd982274ed88870075b09641282\",\"USER_NAME\":\"李帆\",\"JOIN_DAY\":\"2015-06-18\",\"ROLE_NAME\":\"测试oa\",\"USER_NATION\":\"汉族\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"CREATE_DATE\":\"2017-10-16 18:43:36\",\"IS_SUPER\":\"3\",\"ROLE_ID\":\"31844838c48043d4838cf79fac211c7c\",\"IS_ONLINE\":\"0\",\"ID\":\"d3ac36180223467fa13a1e69cab71545\",\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_BIRTHDAY\":\"1994-08-25\",\"USER_ACCOUNT\":\"lifan\"}');
INSERT INTO `stb_validate` VALUES ('4af43eb496de4eaab4407bd052146258', 'ce030252d22b4729af4ce28ccfa16cdc', 'e9ddfe090ca843b8a675cad97bb25838', '1491803275', '{\"USER_SEX\":\"0\",\"UPDATE_DATE\":\"2017-04-07 16:22:20\",\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_NAME\":\"测试咨询1\",\"USER_ADDRESS\":\"\",\"REGION\":\"\",\"USER_PASS\":\"111111\",\"USER_PHONE\":\"15708489940\",\"CREATE_DATE\":\"2017-03-20 14:17:45\",\"USER_HEADIMG\":\"\",\"IS_SUPER\":\"2\",\"IS_ONLINE\":\"1\",\"ID\":\"ce030252d22b4729af4ce28ccfa16cdc\",\"USER_ACCOUNT\":\"zixun1\"}');
INSERT INTO `stb_validate` VALUES ('4ba4ec34bb0e4cba99cb3cde38c7f8ee', 'cdf8e9debc734222b518778208230bed', '8569379a800045efac6a31b2ebe78b1f', '1494466285', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"4556@qq.com\",\"DP_ID\":\"c8d92d15f3da4f66aab56ed4cb38056f\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"15487963254\",\"ROLE_NAME\":\"人事部咨询师\",\"ROLE_ID\":\"b652cfe1bfdc4d849b76ddf33a282bfc\",\"USER_ACCOUNT\":\"shenhuan\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"谌欢\",\"ID\":\"cdf8e9debc734222b518778208230bed\",\"CREATE_DATE\":\"2017-04-17 11:34:36\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('4e4ba2e0888d48f89ba37e0a6dc04657', 'c2e7fd2fe24244a2b82b2f023fd82991', '4d8e9b5253744321af494dee3ed29992', '1494853498', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"555@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13546739412\",\"ROLE_NAME\":\"运营一组电话专员\",\"ROLE_ID\":\"44db0306e0544723b3598178504d4407\",\"USER_ACCOUNT\":\"luodan\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"罗丹\",\"ID\":\"c2e7fd2fe24244a2b82b2f023fd82991\",\"CREATE_DATE\":\"2017-05-11 10:04:55\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('4f7d4c64624f42968cf43670bdeee74b', 'd347ca7d28a145078e112bdae42817f8', '02abfba70f17440086f732d8cda199ab', '1494811104', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"625721030@qq.com\",\"DP_ID\":\"c8d92d15f3da4f66aab56ed4cb38056f\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"18090011189\",\"UPDATE_DATE\":\"2017-04-27 13:42:20\",\"ROLE_NAME\":\"人事部咨询师\",\"ROLE_ID\":\"b652cfe1bfdc4d849b76ddf33a282bfc\",\"USER_ACCOUNT\":\"zhangpeng\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"张鹏\",\"ID\":\"d347ca7d28a145078e112bdae42817f8\",\"CREATE_DATE\":\"2017-04-27 10:35:21\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('578fa02f39c245e0859a310ba54497e3', '760ceae65f8e4ae592f535d8538c783d', 'd965cd287b0b4730b7916c14834ea893', '1492763867', '{\"USER_EMAIL\":\"34436632@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170421163709_957.png\",\"USER_PHONE\":\"15708489948\",\"UPDATE_DATE\":\"2017-04-21 16:37:10\",\"ROLE_NAME\":\"测试人员\",\"USER_ACCOUNT\":\"jincheng\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"南湖\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"金城\",\"ID\":\"760ceae65f8e4ae592f535d8538c783d\",\"CREATE_DATE\":\"2017-04-13 11:42:36\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('5b31c06cf07042419e0c6df056dc5e13', 'e8e86d4e931740a1a853ca6d1c957220', '13009808338e4ec58067b107bad62ced', '1497059560', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"54546@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13546789412\",\"ROLE_NAME\":\"运营一组电话专员\",\"ROLE_ID\":\"44db0306e0544723b3598178504d4407\",\"USER_ACCOUNT\":\"liuzhontin\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"刘钟婷\",\"ID\":\"e8e86d4e931740a1a853ca6d1c957220\",\"CREATE_DATE\":\"2017-05-10 10:04:05\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('5b433da455b644f6816f5c81da863d69', '808b982b20c540088239338557223436', '5015ad8e036841cd8ba5d8c2ff2d8ad5', '1507542936', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"REGION_HEADIMG\":\"\",\"USER_EMAIL\":\"1728996139@qq.com\",\"DP_ID\":\"b7ee9a72d5f440dcbf60d0c0a618231a\",\"WX_NUMBER\":\"xiaoguaiguai\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170420161334_565.jpg\",\"USER_PHONE\":\"13699624875\",\"UPDATE_DATE\":\"2017-09-19 11:39:02\",\"ROLE_NAME\":\"测试人员\",\"ROLE_ID\":\"4d5ef2e72b66484785d7a6a83a81a570\",\"USER_ACCOUNT\":\"dhzy\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"111\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"测试用户\",\"ID\":\"808b982b20c540088239338557223436\",\"CREATE_DATE\":\"2017-04-11 14:59:48\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('5e4e90d8116449caad95d423445e1722', '40539f75d95c4fec98d18abde8cb1fd5', '88cc027f04f7408d908da71f622dec5d', '1492157247', '{\"USER_EMAIL\":\"987654@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170414154040_610.jpg\",\"USER_PHONE\":\"13984475585\",\"ROLE_NAME\":\"行政前台\",\"USER_ACCOUNT\":\"csyhqt\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"0\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"测试前台\",\"ID\":\"40539f75d95c4fec98d18abde8cb1fd5\",\"CREATE_DATE\":\"2017-04-14 15:40:51\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('5f62e416880740a3b9df59f61a7bbf2c', '170a2a04c94e4b08b31110db4fde726e', '109909898193440c97075f31e2cc0e65', '1496801838', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"123@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170411165025_867.jpg\",\"USER_PHONE\":\"13974475512\",\"UPDATE_DATE\":\"2017-04-18 11:31:11\",\"ROLE_NAME\":\"运营一组主管\",\"ROLE_ID\":\"d80bffe971bb4016a902610b8a6fa113\",\"USER_ACCOUNT\":\"liaohao\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"rsr0108...\",\"USER_NAME\":\"廖浩\",\"ID\":\"170a2a04c94e4b08b31110db4fde726e\",\"CREATE_DATE\":\"2017-04-11 16:50:27\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('5fb15cae85b14b919a15cc1072379e69', 'd9d7711680ed4ba4a7708e48b3ffc5a5', '94166d6d47f049839b1736e926624ee0', '1491458406', '{\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"15708489941\",\"USER_ACCOUNT\":\"zixun2\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"测试咨询2\",\"ID\":\"d9d7711680ed4ba4a7708e48b3ffc5a5\",\"CREATE_DATE\":\"2017-03-20 14:18:14\",\"REGION\":\"\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('608139a1628b429ea719f6d8d7ae9e0e', 'e377639fff384710994fd58b7f26c5ab', '3846c2ad33014f8b9b496d2893cc0db1', '1494813403', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"qiantai@qq.com\",\"DP_ID\":\"3e0267583e5a49b1828fdf22648cbfb5\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13986465282\",\"UPDATE_DATE\":\"2017-04-26 15:24:09\",\"ROLE_NAME\":\"行政前台\",\"ROLE_ID\":\"22b19b4e9f704c4c82d430bf0a9e535b\",\"USER_ACCOUNT\":\"qiantai\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"董琳\",\"ID\":\"e377639fff384710994fd58b7f26c5ab\",\"CREATE_DATE\":\"2017-04-14 07:32:01\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('61e1b8c5dfbb4b949b05737395a48ad6', 'a419f403d808409f977a7107a1e16271', 'e7d653685dfc479d85c01867107d0084', '1491363121', '{\"USER_EMAIL\":\"123@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170322160711_399.jpg\",\"USER_PHONE\":\"18378944722\",\"UPDATE_DATE\":\"2017-04-01 15:27:37\",\"USER_ACCOUNT\":\"huanghelou\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都市区左右\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"黄鹤\",\"ID\":\"a419f403d808409f977a7107a1e16271\",\"CREATE_DATE\":\"2017-03-22 16:07:25\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('6344d3af0cea47098f815497d6b61e3f', 'b9ed3203a44b4e93a20fea858cc1eee0', '7e52d67ba68a4f62b18c6fb9da932e23', '1493706883', '{\"USER_EMAIL\":\"47585@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170427135116_262.jpg\",\"USER_PHONE\":\"18280345435\",\"UPDATE_DATE\":\"2017-04-28 09:14:03\",\"ROLE_NAME\":\"人事部咨询师\",\"ROLE_ID\":\"b652cfe1bfdc4d849b76ddf33a282bfc\",\"USER_ACCOUNT\":\"lilinmiao\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"USER_PASS\":\"123456\",\"USER_NAME\":\"李琳淼\",\"ID\":\"b9ed3203a44b4e93a20fea858cc1eee0\",\"CREATE_DATE\":\"2017-04-17 11:54:19\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('6658bbd46f3f4d78bccaba5114f6f3e9', 'edfecffefd0141fea29b9a3d3d13b94a', '2aa665984d684bc0b93700cadebcd041', '1491803377', '{\"USER_SEX\":\"0\",\"UPDATE_DATE\":\"2017-04-07 17:37:08\",\"USER_EMAIL\":\"123@qq.com\",\"STATE\":\"1\",\"USER_NAME\":\"杨帆\",\"USER_ADDRESS\":\"111\",\"USER_PASS\":\"111111\",\"USER_PHONE\":\"18378847752\",\"CREATE_DATE\":\"2017-03-10 15:31:05\",\"USER_HEADIMG\":\"/pictureResources/photos/20170401230450_14.png\",\"IS_SUPER\":\"2\",\"IS_ONLINE\":\"1\",\"ID\":\"edfecffefd0141fea29b9a3d3d13b94a\",\"USER_ACCOUNT\":\"yangfan1\"}');
INSERT INTO `stb_validate` VALUES ('68b8ac6a9a7b411caf943e24930eb9d2', '07f7130c1cf74b499f788d9068bf0db8', '57a89b9e0d3e4b0f97f12a8572468ea7', '1494914805', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"5646465@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"15933669988\",\"ROLE_NAME\":\"运营一组主管\",\"ROLE_ID\":\"d80bffe971bb4016a902610b8a6fa113\",\"USER_ACCOUNT\":\"cszg\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"四川成都\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"测试运营组长\",\"ID\":\"07f7130c1cf74b499f788d9068bf0db8\",\"CREATE_DATE\":\"2017-05-15 18:23:37\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('6d75cae2eff74612a389c4ba41c0a8dd', '15090d7423e3416886225e35697547d5', '8bdbafe59e894f9299efd70956601467', '1491734218', '{\"USER_EMAIL\":\"1561@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170406095419_408.jpg\",\"USER_PHONE\":\"15654634615\",\"UPDATE_DATE\":\"2017-04-09 17:34:12\",\"USER_ACCOUNT\":\"cxcs\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"创新测试\",\"ID\":\"15090d7423e3416886225e35697547d5\",\"CREATE_DATE\":\"2017-04-06 09:55:59\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('6fa289a40922486abc2979d2bd93d3d8', '0df0d4cb1a354b0facacf959564c49dc', 'c762223ff1ca45809d97b7d288f90bb0', '1497258254', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"1815065537@qq.com\",\"DP_ID\":\"b7a40cd982274ed88870075b09641282\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13699401418\",\"UPDATE_DATE\":\"2017-05-03 11:52:51\",\"ROLE_NAME\":\"总经理\",\"ROLE_ID\":\"b4409dab4f8f4a10a33f1496441d52aa\",\"USER_ACCOUNT\":\"heyang\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"保密\",\"REGION_ORDER\":15616,\"USER_PASS\":\"940817\",\"USER_NAME\":\"何洋\",\"ID\":\"0df0d4cb1a354b0facacf959564c49dc\",\"CREATE_DATE\":\"2017-04-24 14:15:52\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('713223302f8b4601a277942f557fc755', 'd5d416ccde024344a222555b55a659ae', '39699753655a436689cd630046b4ced4', '1492070023', '{\"USER_EMAIL\":\"44565@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"18745632145\",\"USER_ACCOUNT\":\"wenxi\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"USER_PASS\":\"123456\",\"USER_NAME\":\"文稀\",\"ID\":\"d5d416ccde024344a222555b55a659ae\",\"CREATE_DATE\":\"2017-04-13 15:33:59\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('7b58dbc69c5f4421b4b56619c8bfa882', '2bf48d6f299945e283cbc24c0d0c2f0e', 'ad9b90e156ad421a8b8bfac5fd73ee33', '1490251095', '{\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"15986362546\",\"USER_ACCOUNT\":\"Helen\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"Helen大胖子\",\"ID\":\"2bf48d6f299945e283cbc24c0d0c2f0e\",\"CREATE_DATE\":\"2017-03-22 10:38:00\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('7ba154b15ba5488c8bf8bc7a93f25fa7', '1138bc688210449b8b48cef9c5664583', 'f8cbf21a1569431bbd3f208717c050fd', '1494846737', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"78954@qq.com\",\"DP_ID\":\"b7ee9a72d5f440dcbf60d0c0a618231a\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170411171458_254.jpg\",\"USER_PHONE\":\"13874465224\",\"UPDATE_DATE\":\"2017-05-03 16:00:31\",\"ROLE_NAME\":\"测试人员\",\"ROLE_ID\":\"4d5ef2e72b66484785d7a6a83a81a570\",\"USER_ACCOUNT\":\"zhangqiang\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都青羊区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"张强\",\"ID\":\"1138bc688210449b8b48cef9c5664583\",\"CREATE_DATE\":\"2017-04-11 17:15:03\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('7d2030f2534043a9a6dbca731f72ae42', '1db3f66b615f4548bdc272820fc42fbb', '9284d7b17d3a4dd48c7e7621f5f90c6f', '1492819798', '{\"USER_EMAIL\":\"65647896@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170420161615_119.jpg\",\"USER_PHONE\":\"18383477411\",\"UPDATE_DATE\":\"2017-04-20 18:07:18\",\"ROLE_NAME\":\"人事部咨询师\",\"USER_ACCOUNT\":\"csyhzx\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"测试咨询师\",\"ID\":\"1db3f66b615f4548bdc272820fc42fbb\",\"CREATE_DATE\":\"2017-04-14 15:42:01\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('82e6c47ee0d04ddc80d3924cbcea8927', '0026211fd5764fe7b6cd46608bc5e2a3', '80ce2dcc043b487880f8a9b91b62c01f', '1513918282', '{\"REFULAR_DAY\":\"2014-05-04\",\"REGION_HEADIMG\":\"\",\"USER_SEX\":\"0\",\"STATE\":\"1\",\"DP_ID\":\"a4bb69ee53cc44388ceb745815209ffe\",\"USER_NAME\":\"刘烁\",\"JOIN_DAY\":\"2013-05-04\",\"ROLE_NAME\":\"国内值机党员\",\"USER_NATION\":\"汉族\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"CREATE_DATE\":\"2017-10-16 18:11:12\",\"IS_SUPER\":\"3\",\"ROLE_ID\":\"1e52771429a4498e85f78357da4818a1\",\"IS_ONLINE\":\"0\",\"ID\":\"0026211fd5764fe7b6cd46608bc5e2a3\",\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_BIRTHDAY\":\"1981-06-26\",\"USER_ACCOUNT\":\"liushuo\"}');
INSERT INTO `stb_validate` VALUES ('85e6b7709385450cbd31c26d7bcc1f33', '1d3637fec8194ec1bb8785bcc512e3a4', '92cfc55781564ac3a57a0cc4442b2cd2', '1494832529', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"1570765803@qq.com\",\"DP_ID\":\"3d09d818bcf1453b9b80213186597f20\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170506112458_148.jpg\",\"USER_PHONE\":\"18428384580\",\"UPDATE_DATE\":\"2017-05-06 11:25:00\",\"ROLE_NAME\":\"网咨组长\",\"ROLE_ID\":\"4d3be319e3544a768242efc37c1f0441\",\"USER_ACCOUNT\":\"dingmi\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"0\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"丁秘\",\"ID\":\"1d3637fec8194ec1bb8785bcc512e3a4\",\"CREATE_DATE\":\"2017-04-13 15:30:24\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('860d134bb7894858ba298522934c94af', 'b2354b1c596d4ed4969cd9fd4d3d6ee3', '021ac5f7264b470a885b412c4153e8bb', '1492043006', '{\"USER_EMAIL\":\"889@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170413081143_499.jpg\",\"USER_PHONE\":\"13574412234\",\"UPDATE_DATE\":\"2017-04-13 08:11:44\",\"USER_ACCOUNT\":\"wangzi\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"郫县\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"某某人\",\"ID\":\"b2354b1c596d4ed4969cd9fd4d3d6ee3\",\"CREATE_DATE\":\"2017-04-11 15:06:53\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('8a6576629264401f8c7c3bdc98e8ea12', '59164f1b3a6e4cf6b95241e3d896a829', '47db32021da44d0fbd412490dec07f38', '1494812878', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"123@qq.com\",\"DP_ID\":\"c8d92d15f3da4f66aab56ed4cb38056f\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170503100755_577.jpg\",\"USER_PHONE\":\"13699874574\",\"UPDATE_DATE\":\"2017-05-03 10:07:58\",\"ROLE_NAME\":\"人事部咨询师\",\"ROLE_ID\":\"b652cfe1bfdc4d849b76ddf33a282bfc\",\"USER_ACCOUNT\":\"yangfan\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"杨帆\",\"ID\":\"59164f1b3a6e4cf6b95241e3d896a829\",\"CREATE_DATE\":\"2017-04-11 15:02:50\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('8fe9eac1f9f6460eba86e618b9b93f32', '50fb32186d7140249e18b392408d96ce', '39c1624d3c214815a488bd0ed21e95a0', '1497254215', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"791548893@qq.com\",\"DP_ID\":\"3e0267583e5a49b1828fdf22648cbfb5\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170411170633_260.jpg\",\"USER_PHONE\":\"18224470429\",\"UPDATE_DATE\":\"2017-04-26 16:12:36\",\"ROLE_NAME\":\"行政部主管\",\"ROLE_ID\":\"0264b365c78c499bacbde7750b3d61fa\",\"USER_ACCOUNT\":\"chenxue\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都市武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"20160823\",\"USER_NAME\":\"陈雪\",\"ID\":\"50fb32186d7140249e18b392408d96ce\",\"CREATE_DATE\":\"2017-04-11 17:06:40\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('90edb8d5935c407e943c355278758b56', 'ca78b6acc35c411e9a3920995faac7bb', 'c0d9b45345904122bc3a22f8df62cbb1', '1496655266', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"576869690@qq.com\",\"DP_ID\":\"55413d2911dc47a389e5c5c9fd8c3f53\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"18080478597\",\"UPDATE_DATE\":\"2017-05-10 17:07:26\",\"ROLE_NAME\":\"商务部主管\",\"ROLE_ID\":\"c0e7c887f354479fa6150cbc9e7cb02f\",\"USER_ACCOUNT\":\"lixing\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"李星\",\"ID\":\"ca78b6acc35c411e9a3920995faac7bb\",\"CREATE_DATE\":\"2017-05-02 11:57:41\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('996187f2372c40288545064959cecb29', '6a4ee1ce8b104f14bd8dfadee76706fe', '883962262ad141fcb43f8a711d6e072f', '1508752346', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"REGION_HEADIMG\":\"\",\"DP_ID\":\"05ddef7a606b4d89939cf7e73b0c95f9\",\"STATE\":\"1\",\"USER_PHONE\":\"13958874472\",\"UPDATE_DATE\":\"2017-10-23 17:50:50\",\"ROLE_NAME\":\"机关党支部党员\",\"ROLE_ID\":\"f95a76ff9d0e43c0827c1c43583977b4\",\"USER_ACCOUNT\":\"jiangzhizhong\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"REGION_ORDER\":15616,\"USER_NATION\":\"汉族\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"蒋治中\",\"ID\":\"6a4ee1ce8b104f14bd8dfadee76706fe\",\"REFULAR_DAY\":\"2012-03-22\",\"JOIN_DAY\":\"2011-03-22\",\"CREATE_DATE\":\"2017-10-16 17:45:02\",\"USER_BIRTHDAY\":\"1989-08-24\",\"IS_SUPER\":\"3\"}');
INSERT INTO `stb_validate` VALUES ('9fb578e8f07d4daa9893903871acbae5', 'ddb1fcd566b34e0d9c344b4917452df7', 'd46a4928264945c8a7ae5255fddcddd5', '1494848176', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"123@qq.com\",\"DP_ID\":\"5a9555504ce249b9ab74ca5f46878e74\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170515103908_312.jpg\",\"USER_PHONE\":\"13265615125\",\"ROLE_NAME\":\"信办专员\",\"ROLE_ID\":\"11c90672c7654297b361a29e66ae7c78\",\"USER_ACCOUNT\":\"csxb\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"cd \",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"测试信办\",\"ID\":\"ddb1fcd566b34e0d9c344b4917452df7\",\"CREATE_DATE\":\"2017-05-15 10:39:16\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('ace5acab847d4fd4aec4b1d5b1ead2c0', '6ba221da58df4a99aa64515b588df307', '367bc66066ab4e1895c266dbb524a59b', '1493293814', '{\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"15708589948\",\"ROLE_NAME\":\"测试人员\",\"ROLE_ID\":\"4d5ef2e72b66484785d7a6a83a81a570\",\"USER_ACCOUNT\":\"jincheng1\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"123456\",\"USER_NAME\":\"金城\",\"ID\":\"6ba221da58df4a99aa64515b588df307\",\"CREATE_DATE\":\"2017-04-27 19:49:42\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c02364bc4e204bacb9d198dd84e54e57', '4c358e992a0c4090b1e189040e740116', 'de869f4f6f33479199cc0794999d6ccf', '1495180766', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"3333@qq.com\",\"DP_ID\":\"55413d2911dc47a389e5c5c9fd8c3f53\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13987742245\",\"UPDATE_DATE\":\"2017-05-04 10:04:02\",\"ROLE_NAME\":\"商务部职员\",\"ROLE_ID\":\"7f9b2e8b64014adf91c3f00312e8f74b\",\"USER_ACCOUNT\":\"liumaoping\",\"USER_SEX\":\"null\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"刘茂萍\",\"ID\":\"4c358e992a0c4090b1e189040e740116\",\"CREATE_DATE\":\"2017-05-02 11:59:04\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c0333f57b19548fdbd0bad15bc1e5492', '3c376bb33b1d43128f3785c5d214cd5e', '94d6d6bd7e2646ff90562e53fa0df689', '1513918576', '{\"WX_NUMBER\":\"3aa\",\"USER_SEX\":\"0\",\"UPDATE_DATE\":\"2017-09-14 17:29:21\",\"STATE\":\"1\",\"USER_NAME\":\"admin\",\"USER_NATION\":\"\",\"USER_PASS\":\"111111\",\"USER_PHONE\":\"13981172274\",\"USER_HEADIMG\":\"/pictureResources/photos/20170914172919_530.jpg\",\"IS_SUPER\":\"1\",\"IS_ONLINE\":\"0\",\"ID\":\"3c376bb33b1d43128f3785c5d214cd5e\",\"USER_ACCOUNT\":\"admin\"}');
INSERT INTO `stb_validate` VALUES ('c13702795c3845809cfa9166ae71db89', '8101a64427c84c63a3e2c3d333acebe9', 'bdbfbc4a5af94b789afef7ad4dce569f', '1496193076', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"233323@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170421161232_393.jpg\",\"USER_PHONE\":\"13564875124\",\"UPDATE_DATE\":\"2017-04-21 16:12:35\",\"ROLE_NAME\":\"运营一组电话专员\",\"ROLE_ID\":\"44db0306e0544723b3598178504d4407\",\"USER_ACCOUNT\":\"qiuxue\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"邱雪\",\"ID\":\"8101a64427c84c63a3e2c3d333acebe9\",\"CREATE_DATE\":\"2017-04-17 12:07:37\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c3144f27163c42b8a8ca37b231a5ddf0', 'a48e3422c7554fe7acda0447acde3130', 'c743a44a7b4a457f9a5c6f64ed073ba3', '1497230217', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"45555@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170421151818_185.jpg\",\"USER_PHONE\":\"13645789514\",\"UPDATE_DATE\":\"2017-05-09 14:26:42\",\"ROLE_NAME\":\"运营一组电话专员\",\"ROLE_ID\":\"44db0306e0544723b3598178504d4407\",\"USER_ACCOUNT\":\"heqianying\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"1234556\",\"USER_NAME\":\"何乾英\",\"ID\":\"a48e3422c7554fe7acda0447acde3130\",\"CREATE_DATE\":\"2017-04-17 14:49:07\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c3c3d1b37f2d427bae10f52989391b1f', 'c944cbdb26ee4cb098e93fa9391b0959', '2fc66f085b0a4ac18a1bd86a21bdd1cd', '1494469902', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"5544@qq.com\",\"DP_ID\":\"c8d92d15f3da4f66aab56ed4cb38056f\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13645879541\",\"UPDATE_DATE\":\"2017-04-25 10:30:36\",\"ROLE_NAME\":\"人事部咨询师\",\"ROLE_ID\":\"b652cfe1bfdc4d849b76ddf33a282bfc\",\"USER_ACCOUNT\":\"xiaxiaohan\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"194928\",\"USER_NAME\":\"夏小寒\",\"ID\":\"c944cbdb26ee4cb098e93fa9391b0959\",\"CREATE_DATE\":\"2017-04-17 11:29:19\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c539a2ce7061454e893232c91f57a184', '6d83a3998ac4431386c7d494393ce60f', 'dda70f14b74444968bbc484b630d7a18', '1493372042', '{\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170428171846_44.jpg\",\"USER_PHONE\":\"18190543323\",\"ROLE_NAME\":\"测试人员\",\"ROLE_ID\":\"4d5ef2e72b66484785d7a6a83a81a570\",\"USER_ACCOUNT\":\"xiangzhi\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"向志\",\"ID\":\"6d83a3998ac4431386c7d494393ce60f\",\"CREATE_DATE\":\"2017-04-28 17:18:55\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c7f5568feee1426ca26414dcadbd4588', '5c8f5135e52e498b904ceaf3a0151f3a', '4c744be005cd447289f5805b561fae9b', '1491789920', '{\"USER_EMAIL\":\"365984@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170407172255_100.jpg\",\"USER_PHONE\":\"15933669988\",\"UPDATE_DATE\":\"2017-04-07 23:49:38\",\"USER_ACCOUNT\":\"yangfan2\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都市武侯区\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"杨帆2号\",\"ID\":\"5c8f5135e52e498b904ceaf3a0151f3a\",\"CREATE_DATE\":\"2017-04-06 10:48:19\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c871f61540c449fc9ec72facfb5e52c5', 'e92173fc74744dd5acfd2eedc6e00901', '7f2b88ddeb4c4fab83b391ee9a7818c6', '1493343350', '{\"USER_EMAIL\":\"123123@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170411165919_685.jpg\",\"USER_PHONE\":\"13547789954\",\"UPDATE_DATE\":\"2017-04-21 15:54:22\",\"ROLE_NAME\":\"运营一组电话专员\",\"ROLE_ID\":\"44db0306e0544723b3598178504d4407\",\"USER_ACCOUNT\":\"wanghj\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都市武侯区\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"王红娇\",\"ID\":\"e92173fc74744dd5acfd2eedc6e00901\",\"CREATE_DATE\":\"2017-04-11 16:59:29\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c8b589c7c3354e9db58c5b262348931f', '47168107e95c49b783ed3221f053df79', '5d85b2c9340f44e0b1375484236d45c3', '1496986926', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"4422@qq.com\",\"DP_ID\":\"2550a4e66c204aacb1d793b9dd97544e\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170511100625_151.jpg\",\"USER_PHONE\":\"15892415422\",\"UPDATE_DATE\":\"2017-05-11 10:06:27\",\"ROLE_NAME\":\"运营一组电话专员\",\"ROLE_ID\":\"44db0306e0544723b3598178504d4407\",\"USER_ACCOUNT\":\"qinqinghe\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"0\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"覃清河\",\"ID\":\"47168107e95c49b783ed3221f053df79\",\"CREATE_DATE\":\"2017-04-17 12:04:45\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('c931e53ed7174c36b30908fadb6b1b79', '4865159354f84b8199da03e1ab86a649', 'b84d74df7c824051803ada09da340d5a', '1494829551', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"1509128494@qq.com\",\"DP_ID\":\"c8d92d15f3da4f66aab56ed4cb38056f\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170411164503_477.jpg\",\"USER_PHONE\":\"13628011144\",\"UPDATE_DATE\":\"2017-04-20 17:39:56\",\"ROLE_NAME\":\"人事部咨询主管\",\"ROLE_ID\":\"48466fcc547048de9294461cd6723251\",\"USER_ACCOUNT\":\"yejing\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"0\",\"USER_ADDRESS\":\"成都市武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"USER_NAME\":\"叶静\",\"ID\":\"4865159354f84b8199da03e1ab86a649\",\"CREATE_DATE\":\"2017-04-11 16:45:04\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('ce2bbd1bb2a14226930e6c8c74c3cd32', '1308fa3442e24b9397f27f819ddb53d9', '9b09a552d124483082d2025a4d641386', '1490153082', '{\"USER_SEX\":\"0\",\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_NAME\":\"bgeteam\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_PHONE\":\"13755662233\",\"CREATE_DATE\":\"2017-03-22 10:36:31\",\"USER_HEADIMG\":\"\",\"IS_SUPER\":\"2\",\"IS_ONLINE\":\"1\",\"ID\":\"1308fa3442e24b9397f27f819ddb53d9\",\"USER_ACCOUNT\":\"bgeteam\"}');
INSERT INTO `stb_validate` VALUES ('e20d6ace204a4e79b21de7304640cd6a', 'e9f8aee135df4c08a1c845e0f5e0f0a0', 'f25d3dc65e204cbca2cb373b5ea6bec4', '1497257652', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"17289961@qq.com\",\"DP_ID\":\"3d09d818bcf1453b9b80213186597f20\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170414173238_317.jpg\",\"USER_PHONE\":\"13981172273\",\"UPDATE_DATE\":\"2017-04-17 11:35:27\",\"ROLE_NAME\":\"网咨人员\",\"ROLE_ID\":\"b04e5351371c46f6916db875c3f4168d\",\"USER_ACCOUNT\":\"wenxi\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"0\",\"USER_ADDRESS\":\"\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"文稀\",\"ID\":\"e9f8aee135df4c08a1c845e0f5e0f0a0\",\"CREATE_DATE\":\"2017-04-14 17:32:47\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('e2aee89d63b14c47b76f1ef9e7e0985d', '0058704fe0ff4ef784b81b731f4b77fc', '2d2fed4ac7124a28be772296bb720d9d', '1513918187', '{\"REFULAR_DAY\":\"2006-09-11\",\"REGION_HEADIMG\":\"\",\"USER_SEX\":\"0\",\"STATE\":\"1\",\"DP_ID\":\"63f2724b4a10465eb1225ee6d9abdfeb\",\"USER_NAME\":\"李铭\",\"JOIN_DAY\":\"2005-09-11\",\"ROLE_NAME\":\"特种设备三项目党员\",\"USER_NATION\":\"汉族\",\"REGION_ORDER\":15616,\"USER_PASS\":\"111111\",\"CREATE_DATE\":\"2017-10-16 17:55:13\",\"IS_SUPER\":\"3\",\"ROLE_ID\":\"a4740752f3564ff39aa41b409277e6eb\",\"IS_ONLINE\":\"1\",\"ID\":\"0058704fe0ff4ef784b81b731f4b77fc\",\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_BIRTHDAY\":\"1984-02-15\",\"USER_ACCOUNT\":\"liming\"}');
INSERT INTO `stb_validate` VALUES ('ea555b3d81ba4589a03e74c3702a1d4f', '895ff113a3704e188f6af9853381ca09', 'fcfa35801f5d48d68a9756ff2ec9b690', '1492743979', '{\"USER_EMAIL\":\"5566@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13587923641\",\"ROLE_NAME\":\"人事部主管\",\"USER_ACCOUNT\":\"zhangying\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"金牛区\",\"USER_PASS\":\"123456\",\"USER_NAME\":\"张颖\",\"ID\":\"895ff113a3704e188f6af9853381ca09\",\"CREATE_DATE\":\"2017-04-17 11:45:09\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('eca8217bd51443108d2137c906fc1894', '7c724c806b8b44b5b7be7f4418a3f3c0', 'f662cc0c656f4c339ee3356937ef25b8', '1494552890', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"2463945686@qq.com\",\"DP_ID\":\"c8d92d15f3da4f66aab56ed4cb38056f\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"18980677775\",\"UPDATE_DATE\":\"2017-04-27 10:58:57\",\"ROLE_NAME\":\"人事部咨询师\",\"ROLE_ID\":\"b652cfe1bfdc4d849b76ddf33a282bfc\",\"USER_ACCOUNT\":\"hounanping\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"654321\",\"USER_NAME\":\"侯楠平\",\"ID\":\"7c724c806b8b44b5b7be7f4418a3f3c0\",\"CREATE_DATE\":\"2017-04-27 10:43:38\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('ecf2d64b10c7407c9a5fc185d3c0c5c8', 'f391f61c989a4e6ab2d521c8f1d71315', '74cf2428c8714fe0b6a0a9cf91047245', '1496988648', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"16666@qq.com\",\"DP_ID\":\"c8d92d15f3da4f66aab56ed4cb38056f\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"13546897451\",\"ROLE_NAME\":\"人事部咨询师\",\"ROLE_ID\":\"b652cfe1bfdc4d849b76ddf33a282bfc\",\"USER_ACCOUNT\":\"zhuqin\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"朱勤\",\"ID\":\"f391f61c989a4e6ab2d521c8f1d71315\",\"CREATE_DATE\":\"2017-05-31 09:56:59\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('ef9d4999ddbf47e1906edf96bd331ec8', '09e54b794d8647239f82aeac095105e1', '3345da3928a746deac5f70cb2f6ef0f7', '1497180666', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"1096432931@qq.com\",\"DP_ID\":\"b7ee9a72d5f440dcbf60d0c0a618231a\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170420161221_271.jpg\",\"USER_PHONE\":\"18190540023\",\"UPDATE_DATE\":\"2017-04-27 17:39:09\",\"ROLE_NAME\":\"测试人员\",\"ROLE_ID\":\"4d5ef2e72b66484785d7a6a83a81a570\",\"USER_ACCOUNT\":\"superadmin\",\"USER_SEX\":\"0\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"磨子桥\",\"REGION_ORDER\":15616,\"USER_PASS\":\"lyxs123\",\"USER_NAME\":\"宇先生\",\"ID\":\"09e54b794d8647239f82aeac095105e1\",\"CREATE_DATE\":\"2017-04-13 09:14:56\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('fa1b77d8a5cc4d87bf7bd72e2d9c4f8a', '662d18e5e04c4e0789c574e4f0283ce9', '97b78b7ece904cdd8b8c4e9dcc7968cb', '1497233224', '{\"imgRegionId\":\"b7a40cd982274ed88870075b09641282\",\"USER_EMAIL\":\"545423514@qq.com\",\"DP_ID\":\"3e0267583e5a49b1828fdf22648cbfb5\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"15663488552\",\"ROLE_NAME\":\"行政前台\",\"ROLE_ID\":\"22b19b4e9f704c4c82d430bf0a9e535b\",\"USER_ACCOUNT\":\"mengying\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"武侯区\",\"REGION_ORDER\":15616,\"USER_PASS\":\"123456\",\"USER_NAME\":\"陈梦颖\",\"ID\":\"662d18e5e04c4e0789c574e4f0283ce9\",\"CREATE_DATE\":\"2017-04-28 09:43:34\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('ff595f2d76324bf8bb75b2e3878a3a23', '6a830a1a01ef4e8f9fa84fe76e57d627', '8481b589e3e94f8294d02eaebbea3c52', '1491528331', '{\"USER_EMAIL\":\"656456123@qq.com\",\"STATE\":\"1\",\"USER_HEADIMG\":\"/pictureResources/photos/20170406155158_628.jpg\",\"USER_PHONE\":\"15933694569\",\"UPDATE_DATE\":\"2017-04-06 15:51:59\",\"USER_ACCOUNT\":\"y4sk\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"成都金牛\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"y4sk\",\"ID\":\"6a830a1a01ef4e8f9fa84fe76e57d627\",\"CREATE_DATE\":\"2017-03-22 16:10:04\",\"IS_SUPER\":\"2\"}');
INSERT INTO `stb_validate` VALUES ('fffa6051247f4f5d9c791d54e698c071', 'cf386eb10c9946079e1ce4878c358aa0', 'a029762a0c5d48bfada074f3110ed1b5', '1490267871', '{\"USER_EMAIL\":\"\",\"STATE\":\"1\",\"USER_HEADIMG\":\"\",\"USER_PHONE\":\"15881860635\",\"USER_ACCOUNT\":\"y3cs\",\"USER_SEX\":\"1\",\"IS_ONLINE\":\"1\",\"USER_ADDRESS\":\"\",\"USER_PASS\":\"111111\",\"USER_NAME\":\"amous\",\"ID\":\"cf386eb10c9946079e1ce4878c358aa0\",\"CREATE_DATE\":\"2017-03-21 10:41:21\",\"IS_SUPER\":\"2\"}');

-- ----------------------------
-- Table structure for t_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `t_bulletin`;
CREATE TABLE `t_bulletin` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(4) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '通知类型  0消息/1通知/2表彰/3批评/4其他',
  `CONTENT` text COLLATE utf8_unicode_ci COMMENT '内容',
  `SUB_DATE` int(16) DEFAULT NULL COMMENT '发布时间',
  `STATE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '状态 0 拟稿 1 发布',
  `RG_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT '-1' COMMENT '对部门发起的公告 -1情况下查所有',
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT '是否删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_bulletin
-- ----------------------------
INSERT INTO `t_bulletin` VALUES ('8c6947d08b444f9297b3d2dd873dcbd0', '寻人启事', '1', '<p style=\"text-align: center;\"><img alt=\"\" src=\"/OA_ONE/pictureResources/photos/20171221184945_263.jpg\" style=\"float:left; height:208px; width:200px\" />&nbsp;此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.此男子于今日下午凌晨时分走丢。见到或者提供此人信息必有重赏.</p>\n', '1513681903', '0', '87c9508180f24dadb9ac2be7690871ec', null, null, '1513682075', '3c376bb33b1d43128f3785c5d214cd5e', 'N');

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SERIAL_NUM` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `EQUIPMENT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `EQUIPMENT_MODEL_NUM` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `UIPMENT_FUNCTION` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UIPMENT_INTRO` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MEETROOM_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------
INSERT INTO `t_equipment` VALUES ('0ccbb15138754128987f340b8d1bdd5d', '1', '话筒', 'MB-123', '消除沙音，声音大', '精密设备，请小心使用', null);
INSERT INTO `t_equipment` VALUES ('3865bc93a8b64ae1a64f9d5644cfe5c0', '2', '投影仪', 'hp-888', '将数据投射出来', '精密设备，请小心使用，如有损坏，照价赔偿！', null);
INSERT INTO `t_equipment` VALUES ('4ee97d204477403ca5f2d42207e02cdc', '3', '计算机', 'dell-325', '扩音', '高端机器，请谨慎使用！', null);

-- ----------------------------
-- Table structure for t_meet
-- ----------------------------
DROP TABLE IF EXISTS `t_meet`;
CREATE TABLE `t_meet` (
  `ID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MEET_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MEET_TYPE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `MEET_INTRO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MEET_STATE` int(50) DEFAULT NULL,
  `MEET_RECORD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MEETROOM_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_meet
-- ----------------------------
INSERT INTO `t_meet` VALUES ('117ca6b885344cb4a619590b2768b8c3', '选举大会', null, '2017-12-22 09:51:30', '2017-12-21 20:00:00', '选举人民代表', '1', null, '71e73ee4d1ae45e5b0042019c04ec8bf');
INSERT INTO `t_meet` VALUES ('8acae5d979e143cfa75c0680f3d8c4cf', '销售会议', null, '2017-12-21 19:29:34', '2017-12-21 20:00:00', '提高销售质量', '1', null, '71e73ee4d1ae45e5b0042019c04ec8bf');
INSERT INTO `t_meet` VALUES ('b41c24b11fde47808c116ea660f2c9c2', '销售会议', null, '2017-12-03 00:00:00', null, '提高销售质量', '1', null, '71e73ee4d1ae45e5b0042019c04ec8bf');

-- ----------------------------
-- Table structure for t_meetroom
-- ----------------------------
DROP TABLE IF EXISTS `t_meetroom`;
CREATE TABLE `t_meetroom` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MEETROOM_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_NUM` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MEETROOM_INTRO` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Equipment_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_meetroom
-- ----------------------------
INSERT INTO `t_meetroom` VALUES ('057bdf9f36e0475d8fe8232edb292afe', '3楼会议室', '20', '重要会议，请不要迟到', null);
INSERT INTO `t_meetroom` VALUES ('54158d642cd94cb3829d62dc35477af8', '8楼2号会议室', '50', '面积200㎡，适合开展大型会议', null);
INSERT INTO `t_meetroom` VALUES ('597bd19617764c479be71fc7d53fc6c9', '5楼3号会议室', '11', 'woasljkd', null);
INSERT INTO `t_meetroom` VALUES ('6487f63594ea4dd385b437b7d156b865', '5楼2号会议室', '50', '面积200㎡，适合开展大型会议', '0ccbb15138754128987f340b8d1bdd5d');
INSERT INTO `t_meetroom` VALUES ('71e73ee4d1ae45e5b0042019c04ec8bf', '4楼2号会议室', '50', '面积100㎡，适合开展大型会议', null);
INSERT INTO `t_meetroom` VALUES ('85474167aad648c7bab3b4bbef73c6d5', '3楼会议室', '20', '重要会议，请不要迟到', null);

-- ----------------------------
-- Table structure for t_msg
-- ----------------------------
DROP TABLE IF EXISTS `t_msg`;
CREATE TABLE `t_msg` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `CONTENT` text COLLATE utf8_unicode_ci COMMENT '内容',
  `VIDEO_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频链接',
  `COVER_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面链接',
  `SUB_DATE` int(16) NOT NULL,
  `DP_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '外键部门ID',
  `BANNER` int(11) DEFAULT '0' COMMENT 'banner排序',
  `REMARK` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_msg
-- ----------------------------

-- ----------------------------
-- Table structure for t_publication
-- ----------------------------
DROP TABLE IF EXISTS `t_publication`;
CREATE TABLE `t_publication` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `COVER_IMG` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `NAME` varchar(55) COLLATE utf8_unicode_ci NOT NULL COMMENT '刊物名称',
  `TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '通知类型  0文章/1咨询/2书/3报/4杂志',
  `CONTENT` text COLLATE utf8_unicode_ci COMMENT '发布附件转换的html预览格式',
  `CYCLE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '刊物周期 0日刊/1周刊/2月刊/3年刊',
  `DESCRIPTION` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  `ATTACHMENT_URL` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原附件地址',
  `FILE_TYPE` varchar(4) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '文件类型 ''0''word ‘1’excel ‘2’pdf',
  `UPDATED_DT` int(16) DEFAULT NULL,
  `UPDATED_BY` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DELETED` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N' COMMENT '是否删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_publication
-- ----------------------------
INSERT INTO `t_publication` VALUES ('5b66f38e4f6a40cb98f97859ef349f77', '/pictureResources/photos/20171221190249_485.png', '最新数据', '0', null, '0', null, '/pictureResources/word/20171221190254_224.xlsx', '1', null, null, '1513854178', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `t_publication` VALUES ('7baf30a6708b4adba6cc23938f9902b4', '/pictureResources/photos/20171221191829_461.png', '从开发入门到放弃', '0', '<p><img alt=\"\" src=\"http://localhost:8080/OA_ONE/pictureResources/PDF/20171220201807_732.files/image001.jpg\" style=\"height:391px; width:376px\" /></p>\n\n<h1>&nbsp;</h1>\n', '1', '<p>没有说明</p>\n', '/pictureResources/word/20171221190156_931.pdf', '2', null, null, '1513771038', '3c376bb33b1d43128f3785c5d214cd5e', 'N');
INSERT INTO `t_publication` VALUES ('b257b45725c041ffaf54f37bf6d95583', '/pictureResources/photos/20171221101807_774.jpg', '我日', '0', '<p><img alt=\"\" src=\"http://192.168.0.199:8080/OA_ONE/pictureResources/PDF/20171221193424_368.files/image001.jpg\" style=\"height:391px; width:376px\" /></p>\n\n<h1>阿斯达卡是考虑到今后卡登仕</h1>\n\n<p>Ask的距离喀什了点卡的</p>\n', '0', '<p>啊实打实大苏打啊实打实的</p>\n', '/pictureResources/word/20171221193424_368.doc', '0', null, null, '1513822714', '3c376bb33b1d43128f3785c5d214cd5e', 'N');

-- ----------------------------
-- Table structure for t_user_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_log`;
CREATE TABLE `t_user_log` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作类型 0/登录 1/学习园地 2/问卷调查',
  `OPTION_NAME` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PK_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRACTION` int(11) DEFAULT '1' COMMENT '分数',
  `CREATED_DT` int(16) DEFAULT NULL,
  `CREATED_BY` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_log
-- ----------------------------
INSERT INTO `t_user_log` VALUES ('38e47e66c4864b68b203a11900baa7bb', '0', '当前时间点用户进行了登录', null, '1', '1508121575', '808b982b20c54008823933855ss23436');
INSERT INTO `t_user_log` VALUES ('3c314f945ca4414681dc39e5a0546a34', '0', '当前时间点用户进行了登录', null, '1', '1508121584', '808b982b20c54008811933855ss23436');
INSERT INTO `t_user_log` VALUES ('57cd4fca34fa4c7ab5c6e59338a7fed4', '0', '当前时间点用户进行了登录', null, '1', '1507964125', '808b982b20c540088239338557223436');
INSERT INTO `t_user_log` VALUES ('691faa7def6143c782036db630d0c7eb', '0', '当前时间点用户进行了登录', null, '1', '1507884660', '808b982b20c540088239338557223436');
INSERT INTO `t_user_log` VALUES ('ad7e55b03d8a4dee9b639cf3be4efcde', '0', '当前时间点用户进行了登录', null, '1', '1508121389', '808b982b20c540088239338557223436');

-- ----------------------------
-- Function structure for getParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getParentList`(rootId CHAR(50)) RETURNS varchar(1000) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
	DECLARE sParentList varchar(1000);
	DECLARE sParentTemp varchar(1000);
	SET sParentTemp =cast(rootId as CHAR);
	WHILE sParentTemp is not null DO
IF (sParentList is not null) THEN
		 SET sParentList = concat(sParentTemp,',',sParentList);
ELSE
 SET sParentList = concat(sParentTemp);
END IF;
		SELECT group_concat(PARENT_ID) INTO sParentTemp FROM stb_region where FIND_IN_SET(REGION_ID,sParentTemp)>0;
	END WHILE;
	RETURN sParentList;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for queryChildrenAreaInfo
-- ----------------------------
DROP FUNCTION IF EXISTS `queryChildrenAreaInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `queryChildrenAreaInfo`(areaId VARCHAR(32)) RETURNS varchar(4000) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);
SET sTemp='$';
SET sTempChd = CAST(areaId AS CHAR);
WHILE sTempChd IS NOT NULL DO
SET sTemp= CONCAT(sTemp,',',sTempChd);
SELECT GROUP_CONCAT(REGION_ID) INTO sTempChd FROM stb_region WHERE FIND_IN_SET(PARENT_ID,sTempChd)>0;
END WHILE;
RETURN sTemp;
END
;;
DELIMITER ;
