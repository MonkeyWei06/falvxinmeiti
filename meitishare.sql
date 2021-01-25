/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : meitishare

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-01-23 11:33:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_about
-- ----------------------------
DROP TABLE IF EXISTS `web_about`;
CREATE TABLE `web_about` (
  `AboutID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AboutTypeID` smallint(5) unsigned DEFAULT '0' COMMENT '分类ID',
  `AboutTypePath` varchar(30) DEFAULT '' COMMENT '分类路径',
  `AboutTitle` varchar(100) DEFAULT '' COMMENT '标题',
  `AboutEngTitle` varchar(100) DEFAULT '' COMMENT '英文名称',
  `AboutPicPath` varchar(100) DEFAULT '' COMMENT '图片路径',
  `AboutContent` text COMMENT '账户积分小计',
  `AboutAbstract` text COMMENT '摘要',
  `AboutSort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  `AboutRecommendState` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐',
  `AboutState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `AboutTime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`AboutID`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='帮助中心数据表';

-- ----------------------------
-- Records of web_about
-- ----------------------------
INSERT INTO `web_about` VALUES ('45', '1', '1,', '关于我们', 'ABOUT', '20180919/9667737f3f16e28c6006653e2d309d81.jpg', '关于我们', '关于我们', '6', '1', '1', '1530649507');
INSERT INTO `web_about` VALUES ('52', '1', '1,', '联系我们', '', '', '<p>\r\n	<br />\r\n</p>\r\n<hr />\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	万千集团\r\n</p>\r\n<p>\r\n	统一客服热线：400-010-0005、0371-66993333\r\n</p>\r\n<p>\r\n	办公地址：郑州市中原区陇海西路338号（陇海路与桐柏路交汇处东南侧）升龙金中环A座24楼\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	公交路线\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	自驾停车路线\r\n</p>\r\n<p>\r\n	自驾车停车位置：陇海路与文化宫路交汇处向南100米路西，地面停车。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"http://api.map.baidu.com/staticimage?center=113.621058%2C34.742024&zoom=16&width=558&height=360&markers=113.621058%2C34.742024&markerStyles=l%2CA\" alt=\"\" width=\"760\" height=\"490\" title=\"\" align=\"\" /> \r\n</p>', '', '7', '0', '1', '1531466317');

-- ----------------------------
-- Table structure for web_abouttype
-- ----------------------------
DROP TABLE IF EXISTS `web_abouttype`;
CREATE TABLE `web_abouttype` (
  `TypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `TypePID` smallint(6) unsigned DEFAULT '0',
  `TypePath` varchar(50) DEFAULT '' COMMENT '用来表示当前分类所属的层级完整路径如：1,2,3,4,',
  `TypeNode` tinyint(3) unsigned DEFAULT '0' COMMENT '用来表达当前分类所属的层级位置',
  `TypeName` varchar(30) DEFAULT '',
  `TypeSort` smallint(6) unsigned DEFAULT '0',
  `TypeState` tinyint(1) unsigned DEFAULT '0',
  `TypeTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`TypeID`),
  KEY `Column_PID` (`TypePID`) USING BTREE,
  KEY `Column_TypePath` (`TypePath`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='帮助中心分类表';

-- ----------------------------
-- Records of web_abouttype
-- ----------------------------
INSERT INTO `web_abouttype` VALUES ('1', '0', '1,', '1', '关于我们分类', '0', '0', '1501732942');
INSERT INTO `web_abouttype` VALUES ('16', '0', '16,', '1', '新闻资讯', '1', '1', '1531228284');

-- ----------------------------
-- Table structure for web_admin
-- ----------------------------
DROP TABLE IF EXISTS `web_admin`;
CREATE TABLE `web_admin` (
  `AdminID` smallint(6) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(30) DEFAULT '',
  `AdminRandPwd` char(32) DEFAULT '',
  `AdminPwd` char(32) DEFAULT '',
  `AdminTrueName` varchar(30) DEFAULT '',
  `AdminSort` smallint(6) unsigned DEFAULT '0',
  `AdminState` tinyint(1) unsigned DEFAULT '0' COMMENT '管理员登录状态0禁用1启用',
  `AdminLoginCheckTime` int(10) unsigned DEFAULT '0' COMMENT '登录验证时间',
  `AdminTime` int(10) unsigned DEFAULT '0' COMMENT '注册时间',
  `AdminRoleState` varchar(10) DEFAULT '' COMMENT '如为All为超级管理员',
  `age` smallint(6) unsigned DEFAULT '0',
  PRIMARY KEY (`AdminID`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='管理员数据表';

-- ----------------------------
-- Records of web_admin
-- ----------------------------
INSERT INTO `web_admin` VALUES ('36', 'admin', 'ff8dea0def5704f74373b2eb95f6a3ff', '67eb22f0cac32eded9f3fad68bc6912f', '2013', '0', '1', '1611367566', '1542162672', 'All', '0');

-- ----------------------------
-- Table structure for web_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `web_admin_log`;
CREATE TABLE `web_admin_log` (
  `LogID` int(10) NOT NULL AUTO_INCREMENT,
  `LogAdminID` smallint(6) unsigned DEFAULT '0' COMMENT '管理员ID',
  `LogOperateNode` varchar(64) DEFAULT '' COMMENT '日志操作节点',
  `LogOperateTitle` varchar(100) DEFAULT '' COMMENT '操作标题',
  `LogOperateContent` text COMMENT '具体描述',
  `LogOperateIP` varchar(15) DEFAULT '' COMMENT '操作IP',
  `LogOperateTime` int(10) unsigned DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`LogID`)
) ENGINE=MyISAM AUTO_INCREMENT=5751 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志数据表';

-- ----------------------------
-- Records of web_admin_log
-- ----------------------------
INSERT INTO `web_admin_log` VALUES ('5742', '36', 'admin/Media/updateprice', '媒体价格已批量更新', 'ID:34994,34995,34996,34997,34998,34999,35000,35001,35002,35003,35004,35005,35006,35007,35008,35009,35010,35011,35012,35013,35014,35015,35016,35017,35018,35019,35020,35021,35022,35023,35024,35025,35026,35027,35028,35029,35030,35031,35032,35033,35034,35035,35036,35037,35038,35039,35040,35041,35042,35043,35044,35045,35046,35047,35048,35049,35050,35051,35052,35053,35054,35055,35056,35057,35058,35059,35060,35061,35062,35063,35064,35065,35066,35067,35068,35069,35070,35071,35072,35073,35074,35075,35076,35077,35078,35079,35080,35081,35082,35083,35084,35085,35086,35087,35088,35089,35090,35091,35092,35093,35094,35095,35096,35097,35098,35099,35100,35101,35102,35103,35104,35105,35106,35107,35108,35109,35110,35111,35112,35113,35114,35115,35116,35117,35118,35119,35120,35121,35122,35123,35124,35125,35126,35127,35128,35129,35130,35131,35132,35133,35134,35135,35136,35137,35138,35139,35140,35141,35142,35143,35144,35145,35146,35147,35148,35149,35150,35151,35152,35153,35154,35155,35156,35157,35158,35159,35160,35161,35162,35163,35164,35165,35166,35167,35168,35169,35170,35171,35172,35173,35174,35175,35176,35177,35178,35179,35180,35181,35182,35183,35184,35185,35186,35187,35188,35189,35190,35191,35192,35193,35194,35195,35196,35197,35198,35199,35200,35201,35202,35203,35204,35205,35206,35207,35208,35209,35210,35211,35212,35213,35214,35215,35216,35217,35218,35219,35220,35221,35222,35223,35224,35225,35226,35227,35228,35229,35230,35231,35232,35233,35234,35235,35236,35237,35238,35239,35240,35241,35242,35243,35244,35245,35246,35247,35248,35249,35250,35251,35252,35253,35254,35255,35256,35257,35258,35259,35260,35261,35262,35263,35264,35265,35266,35267,35268,35269,35270,35271,35272,35273,35274,35275,35276,35277,35278,35279,35280,35281,35282,35283,35284,35285,35286,35287,35288,35289,35290,35291,35292,35293,35294,35295,35296,35297,35298,35299,35300,35301,35302,35303,35304,35305,35306,35307,35308,35309,35310,35311,35312,35313,35314,35315,35316,35317,35318,35319,35320,35321,35322,35323,35324,35325,35326,35327,35328,35329,35330,35331,35332,35333,35334,35335,35336,35337,35338', '127.0.0.1', '1611366502');
INSERT INTO `web_admin_log` VALUES ('5743', '36', 'admin/Rule/del', '栏目分类批量删除成功', 'ID:773,824', '127.0.0.1', '1611366594');
INSERT INTO `web_admin_log` VALUES ('5744', '36', 'admin/Member/edit', '会员修改成功', 'ID:756', '127.0.0.1', '1611366838');
INSERT INTO `web_admin_log` VALUES ('5745', '36', 'admin/Balance/del', '会员账户余额数据删除', 'ID:94,93,90,89,88,87,85,80,63,62,61,27,26,13,12,11,10,9,8,7', '127.0.0.1', '1611367007');
INSERT INTO `web_admin_log` VALUES ('5746', '36', 'admin/Balance/del', '会员账户余额数据删除', 'ID:6,5,4,3', '127.0.0.1', '1611367020');
INSERT INTO `web_admin_log` VALUES ('5747', '36', 'admin/Balance/del', '会员账户余额数据删除', 'ID:4753,4748,4747,4746,4745,4744,4743,4742,4741,4736,4734,4733,4732,4731,2473,2469', '127.0.0.1', '1611367047');
INSERT INTO `web_admin_log` VALUES ('5748', '36', 'admin/Balance/del', '会员账户余额数据删除', 'ID:589,588,587,531,523', '127.0.0.1', '1611367065');
INSERT INTO `web_admin_log` VALUES ('5749', '36', 'admin/Balance/del', '会员账户余额数据删除', 'ID:99,98,96,95', '127.0.0.1', '1611367080');
INSERT INTO `web_admin_log` VALUES ('5750', '36', 'admin/Login/check', '管理员：admin，登录成功', '', '127.0.0.1', '1611367566');

-- ----------------------------
-- Table structure for web_agencyorder
-- ----------------------------
DROP TABLE IF EXISTS `web_agencyorder`;
CREATE TABLE `web_agencyorder` (
  `agencyorder_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(30) DEFAULT '' COMMENT '订单编号',
  `media_id` int(10) unsigned DEFAULT NULL COMMENT '媒体id',
  `media_name` varchar(255) DEFAULT NULL,
  `member_id` int(10) DEFAULT '0' COMMENT '所属新闻媒体用户',
  `ycmemberid` int(10) DEFAULT '0',
  `RegDomain` varchar(64) DEFAULT '' COMMENT '注册域名平台域名为-1代理商域名为会员ID',
  `agency_id1` int(10) DEFAULT '0' COMMENT '一级代理',
  `agency_id` int(10) DEFAULT '0' COMMENT '二级代理',
  `article_id` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '会员发布文章id',
  `push_state` tinyint(1) DEFAULT '0' COMMENT '推送级别',
  `push_explain` varchar(20) DEFAULT NULL COMMENT '推送说明',
  `order_time` int(10) DEFAULT NULL COMMENT '订单提交时间',
  `release_time` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  `fabu_site` text CHARACTER SET utf8mb4 COMMENT '回链地址',
  `fabu_content` varchar(3000) DEFAULT '' COMMENT '回链备注',
  `Return_site` text CHARACTER SET utf8mb4 COMMENT '审核链接',
  `media_money` decimal(10,2) DEFAULT '0.00' COMMENT '媒体价格',
  `order_money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `order_money1` decimal(10,2) DEFAULT '0.00' COMMENT '一级代理金额',
  `order_money2` decimal(10,2) DEFAULT '0.00' COMMENT '二级代理金额',
  `pay_state` tinyint(1) unsigned DEFAULT '0' COMMENT '0未支付1已支付',
  `pay_time` int(10) unsigned DEFAULT '0' COMMENT '支付时间',
  `push_hezi` int(255) DEFAULT '0' COMMENT '推送成功 是1  否则默认为0',
  `need_update` int(3) unsigned DEFAULT '1' COMMENT '默认需要推送发布的是1    回调成功后为 0',
  `order_state` tinyint(1) DEFAULT '0' COMMENT '订单状态0待审核1发布中2已发布3已退稿4已取消,5定时发布\r\n以下只对视频媒体客户端\r\n6链接审核（媒体主提交链接状态为6）\r\n\r\n客户端收到链接 审核通过 退回修改状态\r\n\r\n7审核通过  8 退回修改\r\n\r\n最后媒体主 发布改变状态为2 并提交发布链接 和上传截图\r\n9退稿中\r\n\r\n',
  `media_type` int(3) DEFAULT '1' COMMENT '媒体类型 1软文 2自媒体3视频自媒体',
  `starttime` int(11) DEFAULT '0' COMMENT '定时创建订单时间',
  `Returndec` varchar(255) DEFAULT NULL COMMENT '客户审核链接 通过或退回备注原因',
  `Screenshot` varchar(255) DEFAULT NULL COMMENT '媒体主上传数据截图',
  `Screenstate` int(3) DEFAULT '0' COMMENT '是否需要数据截图0不需要 1需要',
  `Originalwho` int(3) DEFAULT '1' COMMENT '直发1 原创2',
  PRIMARY KEY (`agencyorder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3186 DEFAULT CHARSET=utf8 COMMENT='文章订单表';

-- ----------------------------
-- Records of web_agencyorder
-- ----------------------------

-- ----------------------------
-- Table structure for web_alipay
-- ----------------------------
DROP TABLE IF EXISTS `web_alipay`;
CREATE TABLE `web_alipay` (
  `AliPayID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AliPayMemberID` int(10) unsigned DEFAULT '0',
  `AliPayAPPID` varchar(100) DEFAULT '' COMMENT '留言内容',
  `AliPayPublicKey` text,
  `AliPayPrivateKey` text,
  `AliPayType` tinyint(1) DEFAULT '1' COMMENT '1APPID支付2银行卡/支付宝收款码/微信收款码',
  `AliPayState` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：0不显示1显示',
  `AliPayTime` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `AliPayPicture` varchar(255) DEFAULT '' COMMENT '支付宝二维码',
  `AliPayWXPicture` varchar(255) DEFAULT NULL COMMENT '微信收款码',
  `AliPayBankName` varchar(20) DEFAULT NULL COMMENT '开户银行',
  `AliPayBankWD` varchar(255) DEFAULT NULL COMMENT '开户网点',
  `AliPayBankNum` varchar(30) DEFAULT NULL COMMENT '银行卡号',
  `AliPayBankPeople` varchar(30) DEFAULT NULL COMMENT '持卡人',
  PRIMARY KEY (`AliPayID`),
  KEY `AliPayMemberID` (`AliPayMemberID`,`AliPayAPPID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='支付宝账户数据表';

-- ----------------------------
-- Records of web_alipay
-- ----------------------------
INSERT INTO `web_alipay` VALUES ('69', '796', '20191', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzN33dSUWpp0IHALI7WFC8rwnVPKBsCdYadu6eTgXdNndG+oRsmQ6kK4AxiwDwseQ4nIMDjbvnS6+V/BB1YRG8NSgzTTZuSH9fwWWPidfKfbic2mKoPq4czC0ZjPn7OwBYD5vZlMhvbKaQHDFRsY5VrqiumyBnPm5PVdWUqOI6kBT0N/o5lRozyABzB3T6MmhA3zFAtb3fKNPcwgp9RbGQz6JYfZqohNLuNzhwKI3RuOm9d6pUHHluR9c4Exgt5acy1jDiZ6Znvv/nlzC2Eo4TqdPF216GT0Kk9VF1dM6amyQqwPZl+2v8yG04g21ZK8t4lziBo0TQtRqEZ3CM6', 'MIIEogIBAAKCAQEAoT9Xlr6kEE0to38tZswVjCwePtOPDwyoP87k0gHPTJ6bNGst9C12tqOzye1i30VodUwR8/xGyJ2MN3qG+QOpHf87QZ+8uw5T5WFvkOoJA9IwqV9JP+a1Eo03YCVzJojIr5cyWmzekmzSZX+/fz16N6G+yZB/hxIS+cPCJ1Kzengf5v3MXvUMa8gF3EUEv1RvS50EnThis1l/HkpKMjmjzWur0J+nDHojMhM+1SdvNIfUScbph8jlqGrDuyffvJnnqHLZ5iW08CpqpAJXmS9WAaDk8w3yhlnPs8XePNs+piK5ynwgrYUrqNLmTipjhgleqJU8+VLA8aNLJ5mEiaXS+wIDAQABAoIBACRAZ2K+rYf0sgQF/aEU1OtUp+AcFBegEtt1mkAUpBRnvCEGz6gL6JqbJzqIoifsJNXqKkceOpOzx+hZJasqRYU28o2Iahfr2rTBOSHtW+V+Be6uO3ugVKk9EmwNP1w0eFnxtiJaQ5fL22lyVQ04Nxf2xzvtvp4RVC7O8gGBOFSZ/WhJsDfHBm/kBEtBX95LUE4c21Kpvwfk5dWAPQ5tOBZB19S9fOr51j9X1c+KwQ53tl+Gt7fhCId9Njajvbofo9JuQS1+SQ+gwSrOrFZCUMyGtMRo9fsx6gK1ImgD8tq0v4AYInOSgK03EEuGyjM0xIjKL9VVf0Ss78ZgB6QDBnECgYEA3kyqGTzRk+1PMCMti1l567XJORmgXjwjvRWO39RR8fJExgrtMxFN/RjYZOzxyV41+GBeuyvw5Tfo5qbcwMgEihph4zHSVaOR5cFtPn6SAOhXGYo+/ciJflzIlFC1ZGhM9b8lWxIaPcd2t2Wl2zS1FK9oW6NQrEeLOBhj5JZR3K0CgYEAubFHAeKYQp3GAqq2DTpuSyCP53YF3bnlSF51PxeRMbVzK9obXi9jT1NmMteOAWpxmwNGw+AxF62IMXQrE1EQIvdJXniQ1ahfYIKJk3nIQ7WZsjJTah9tVH3AAYTml9vHV1VB8osag7DI42wGo7wzu658aT/0K6GB4Qgxhipk+0cCgYAUSZDYfslto6GvdfZpGkBbN5rmoCUXlIt6bSY93SWhXAfUvxiIqZKhf4v4Ifuq8fMg', '1', '1', '1575881440', '20191209/77627c0f3f9384c08509bdd8a30e8a2a.jpg', '20191209/810e41493a6f8aed6e57165ceac3dd6c.jpg', '', '', '', '');

-- ----------------------------
-- Table structure for web_article
-- ----------------------------
DROP TABLE IF EXISTS `web_article`;
CREATE TABLE `web_article` (
  `article_id` int(10) NOT NULL AUTO_INCREMENT,
  `agency_member_id` int(10) DEFAULT '0' COMMENT '代理会员ID',
  `member_id` int(10) DEFAULT NULL COMMENT '会员id',
  `article_num` varchar(30) DEFAULT '' COMMENT '文章编号',
  `article_title` varchar(100) DEFAULT '' COMMENT '文章标题',
  `article_customer` varchar(10) DEFAULT NULL COMMENT '客户名称',
  `article_content` longblob COMMENT '文章内容',
  `article_remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `article_website` varchar(255) DEFAULT '' COMMENT '文章网址',
  `article_time` int(10) DEFAULT NULL COMMENT '提交时间',
  `article_doc` varchar(255) DEFAULT '' COMMENT '文章文件地址',
  `down_state` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1532 DEFAULT CHARSET=utf8mb4 COMMENT='会员文章表';

-- ----------------------------
-- Records of web_article
-- ----------------------------

-- ----------------------------
-- Table structure for web_articletype
-- ----------------------------
DROP TABLE IF EXISTS `web_articletype`;
CREATE TABLE `web_articletype` (
  `TypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `TypePID` smallint(6) unsigned DEFAULT '0',
  `TypePath` varchar(50) DEFAULT '' COMMENT '用来表示当前分类所属的层级完整路径如：1,2,3,4,',
  `TypeNode` tinyint(3) unsigned DEFAULT '0' COMMENT '用来表达当前分类所属的层级位置',
  `TypeName` varchar(30) DEFAULT '',
  `TypeSort` smallint(6) unsigned DEFAULT '0',
  `TypeState` tinyint(1) unsigned DEFAULT '0',
  `TypeTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`TypeID`),
  KEY `Column_PID` (`TypePID`) USING BTREE,
  KEY `Column_TypePath` (`TypePath`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='软文分类表';

-- ----------------------------
-- Records of web_articletype
-- ----------------------------
INSERT INTO `web_articletype` VALUES ('1', '0', '1,', '1', '门户类', '0', '1', '1537891517');

-- ----------------------------
-- Table structure for web_article_temp
-- ----------------------------
DROP TABLE IF EXISTS `web_article_temp`;
CREATE TABLE `web_article_temp` (
  `article_id` int(10) NOT NULL AUTO_INCREMENT,
  `TempArticleID` varchar(32) DEFAULT '' COMMENT '临时ID',
  `member_id` int(10) unsigned DEFAULT '0' COMMENT '会员id',
  `article_title` varchar(100) DEFAULT '' COMMENT '文章标题',
  `article_customer` varchar(10) NOT NULL COMMENT '客户名称',
  `article_content` longblob COMMENT '文章内容',
  `article_remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `article_doc` varchar(200) DEFAULT '',
  `article_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2240 DEFAULT CHARSET=utf8mb4 COMMENT='会员文章临时表';

-- ----------------------------
-- Records of web_article_temp
-- ----------------------------

-- ----------------------------
-- Table structure for web_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `web_auth_group`;
CREATE TABLE `web_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(2000) NOT NULL DEFAULT '',
  `sort` smallint(6) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of web_auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for web_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `web_auth_group_access`;
CREATE TABLE `web_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- ----------------------------
-- Records of web_auth_group_access
-- ----------------------------
INSERT INTO `web_auth_group_access` VALUES ('37', '41');

-- ----------------------------
-- Table structure for web_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `web_auth_rule`;
CREATE TABLE `web_auth_rule` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned DEFAULT '0' COMMENT '父级节点',
  `path` varchar(30) DEFAULT '' COMMENT '路径',
  `node` tinyint(3) unsigned DEFAULT '0' COMMENT '节点',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `type` char(80) NOT NULL,
  `isshow` tinyint(1) unsigned DEFAULT '0' COMMENT '栏目是否显示',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=845 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of web_auth_rule
-- ----------------------------
INSERT INTO `web_auth_rule` VALUES ('104', '102', '91,102,104,', '3', 'admin/role/add', '添加角色', '1', 'admin', '1', '0', '0', '1491184817');
INSERT INTO `web_auth_rule` VALUES ('92', '91', '91,92,', '2', 'admin/system/index', '站点配置', '1', 'admin', '1', '0', '1', '1491184187');
INSERT INTO `web_auth_rule` VALUES ('94', '91', '91,94,', '2', '', '管理员', '1', 'admin', '1', '0', '0', '1491184227');
INSERT INTO `web_auth_rule` VALUES ('95', '94', '91,94,95,', '3', 'admin/admin/index', '管理员列表', '1', 'admin', '1', '0', '0', '1491184244');
INSERT INTO `web_auth_rule` VALUES ('96', '94', '91,94,96,', '3', 'admin/admin/add', '添加管理员', '1', 'admin', '1', '0', '0', '1491184264');
INSERT INTO `web_auth_rule` VALUES ('98', '94', '91,94,98,', '3', 'admin/admin/edit', '修改管理员', '1', 'admin', '0', '0', '0', '1491184496');
INSERT INTO `web_auth_rule` VALUES ('100', '94', '91,94,100,', '3', 'admin/admin/del', '删除管理员', '1', 'admin', '0', '0', '0', '1491184536');
INSERT INTO `web_auth_rule` VALUES ('759', '363', '362,363,759,', '3', 'admin/ajax/memberinfocheck', '会员信息验证', '1', 'admin', '1', '0', '', '1511269744');
INSERT INTO `web_auth_rule` VALUES ('102', '91', '91,102,', '2', '', '账户角色', '1', 'admin', '1', '0', '0', '1491184784');
INSERT INTO `web_auth_rule` VALUES ('103', '102', '91,102,103,', '3', 'admin/role/index', '角色列表', '1', 'admin', '1', '0', '0', '1491184803');
INSERT INTO `web_auth_rule` VALUES ('91', '0', '91,', '1', '', '系统管理', '1', 'admin', '1', '8', '', '1491184152');
INSERT INTO `web_auth_rule` VALUES ('106', '102', '91,102,106,', '3', 'admin/role/edit', '修改角色', '1', 'admin', '0', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('108', '102', '91,102,108,', '3', 'admin/role/del', '删除角色', '1', 'admin', '0', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('109', '102', '91,102,109,', '3', 'admin/role/sort', '角色列表排序', '1', 'admin', '0', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('110', '91', '91,110,', '2', '', '系统栏目', '1', 'admin', '1', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('111', '110', '91,110,111,', '3', 'admin/rule/index', '栏目列表', '1', 'admin', '1', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('112', '110', '91,110,112,', '3', 'admin/rule/add', '添加栏目', '1', 'admin', '1', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('114', '110', '91,110,114,', '3', 'admin/rule/edit', '修改栏目', '1', 'admin', '0', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('116', '110', '91,110,116,', '3', 'admin/rule/del', '删除栏目', '1', 'admin', '0', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('117', '110', '91,110,117,', '3', 'admin/rule/sort', '栏目列表排序', '1', 'admin', '0', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('118', '91', '91,118,', '2', '', '操作日志', '1', 'admin', '1', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('119', '118', '91,118,119,', '3', 'admin/adminlog/index', '日志列表', '1', 'admin', '1', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('120', '118', '91,118,120,', '3', 'admin/adminlog/del', '日志删除', '1', 'admin', '0', '0', '0', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('1', '0', '1,', '1', 'admin/index/index', '系统首页', '1', 'admin', '1', '9', '', '1491184847');
INSERT INTO `web_auth_rule` VALUES ('152', '0', '152,', '1', 'admin/articletype/index', '分类管理', '1', 'admin', '1', '7', '', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('411', '393', '386,393,411,', '3', 'admin/about/index', '关于我们列表', '1', 'admin', '1', '0', '', '1530569155');
INSERT INTO `web_auth_rule` VALUES ('211', '152', '152,211,', '2', '', '广告位分类', '0', 'admin', '0', '35', '1', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('213', '152', '152,213,', '2', '', '城市地区', '1', 'admin', '1', '39', '1', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('228', '211', '152,211,228,', '3', 'admin/postertype/index', '广告位分类列表', '1', 'admin', '1', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('229', '211', '152,211,229,', '3', 'admin/postertype/add', '添加广告位分类', '1', 'admin', '1', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('231', '211', '152,211,231,', '3', 'admin/postertype/edit', '修改广告位分类', '1', 'admin', '0', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('233', '211', '152,211,233,', '3', 'admin/postertype/del', '删除广告位分类', '1', 'admin', '0', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('234', '211', '152,211,234,', '3', 'admin/postertype/sort', '广告位分类列表排序', '1', 'admin', '0', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('242', '213', '152,213,242,', '3', 'admin/citytype/index', '城市列表', '1', 'admin', '1', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('243', '213', '152,213,243,', '3', 'admin/citytype/add', '添加城市', '1', 'admin', '1', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('245', '213', '152,213,245,', '3', 'admin/citytype/edit', '修改城市', '1', 'admin', '0', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('247', '213', '152,213,247,', '3', 'admin/citytype/del', '删除城市', '1', 'admin', '0', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('248', '213', '152,213,248,', '3', 'admin/citytype/sort', '城市列表排序', '1', 'admin', '0', '0', '0', '1491297640');
INSERT INTO `web_auth_rule` VALUES ('363', '362', '362,363,', '2', '', 'Ajax调用方法', '1', 'admin', '0', '0', '', '1511269024');
INSERT INTO `web_auth_rule` VALUES ('263', '92', '91,92,263,', '3', 'admin/system/website', '站点参数配置', '1', 'admin', '1', '0', '0', '1492654221');
INSERT INTO `web_auth_rule` VALUES ('369', '363', '362,363,369,', '3', 'admin/ajax/getseatlistdata', '分类返回调用', '1', 'admin', '0', '0', '', '1511269744');
INSERT INTO `web_auth_rule` VALUES ('362', '0', '362,', '1', '', '系统内部调用方法', '1', 'admin', '0', '99', '', '1511269010');
INSERT INTO `web_auth_rule` VALUES ('386', '0', '386,', '1', '', '其他管理', '1', 'admin', '1', '6', '', '1530567756');
INSERT INTO `web_auth_rule` VALUES ('393', '386', '386,393,', '2', '', '关于我们', '0', 'admin', '0', '10', '', '1530568006');
INSERT INTO `web_auth_rule` VALUES ('412', '393', '386,393,412,', '3', 'admin/about/add', '添加关于我们', '1', 'admin', '1', '0', '', '1530569177');
INSERT INTO `web_auth_rule` VALUES ('515', '510', '386,510,515,', '3', 'admin/news/sort', '商学院排序', '1', 'admin', '0', '0', '', '1531850542');
INSERT INTO `web_auth_rule` VALUES ('514', '510', '386,510,514,', '3', 'admin/news/del', '删除商学院', '1', 'admin', '0', '0', '', '1531850515');
INSERT INTO `web_auth_rule` VALUES ('513', '510', '386,510,513,', '3', 'admin/news/edit', '修改商学院', '1', 'admin', '0', '0', '', '1531850482');
INSERT INTO `web_auth_rule` VALUES ('512', '510', '386,510,512,', '3', 'admin/news/add', '添加商学院', '1', 'admin', '1', '0', '', '1531850439');
INSERT INTO `web_auth_rule` VALUES ('510', '386', '386,510,', '2', '', '商学院管理', '1', 'admin', '1', '11', '', '1531850336');
INSERT INTO `web_auth_rule` VALUES ('511', '510', '386,510,511,', '3', 'admin/news/index', '商学院列表', '1', 'admin', '1', '0', '', '1531850387');
INSERT INTO `web_auth_rule` VALUES ('499', '386', '386,499,', '2', '', '广告位', '0', 'admin', '0', '20', '', '1531419219');
INSERT INTO `web_auth_rule` VALUES ('500', '499', '386,499,500,', '3', 'admin/poster/index', '广告位列表', '1', 'admin', '1', '0', '', '1531419254');
INSERT INTO `web_auth_rule` VALUES ('501', '499', '386,499,501,', '3', 'admin/poster/add', '添加广告位', '1', 'admin', '1', '0', '', '1531419304');
INSERT INTO `web_auth_rule` VALUES ('491', '152', '152,491,', '2', '', '全局分类', '1', 'admin', '1', '36', '', '1531044458');
INSERT INTO `web_auth_rule` VALUES ('492', '491', '152,491,492,', '3', 'admin/wholetype/index', '全局分类列表', '1', 'admin', '1', '0', '', '1531044673');
INSERT INTO `web_auth_rule` VALUES ('493', '491', '152,491,493,', '3', 'admin/wholetype/add', '添加全局分类', '1', 'admin', '1', '0', '', '1531044708');
INSERT INTO `web_auth_rule` VALUES ('642', '393', '386,393,642,', '3', 'admin/about/del', '删除关于我们', '1', 'admin', '0', '0', '', '1533846198');
INSERT INTO `web_auth_rule` VALUES ('643', '393', '386,393,643,', '3', 'admin/about/edit', '修改关于我们', '1', 'admin', '0', '0', '', '1533846253');
INSERT INTO `web_auth_rule` VALUES ('644', '393', '386,393,644,', '3', 'admin/about/sort', '关于我们排序', '1', 'admin', '0', '0', '', '1533846279');
INSERT INTO `web_auth_rule` VALUES ('645', '499', '386,499,645,', '3', 'admin/poster/del', '删除广告位', '1', 'admin', '0', '0', '', '1533846482');
INSERT INTO `web_auth_rule` VALUES ('646', '499', '386,499,646,', '3', 'admin/poster/edit', '修改广告位', '1', 'admin', '0', '0', '', '1533846512');
INSERT INTO `web_auth_rule` VALUES ('647', '499', '386,499,647,', '3', 'admin/poster/sort', '广告位排序', '1', 'admin', '0', '0', '', '1533846528');
INSERT INTO `web_auth_rule` VALUES ('648', '491', '152,491,648,', '3', 'admin/wholetype/del', '删除全局分类', '1', 'admin', '0', '0', '', '1533846844');
INSERT INTO `web_auth_rule` VALUES ('649', '491', '152,491,649,', '3', 'admin/wholetype/edit', '修改全局分类', '1', 'admin', '0', '0', '', '1533846868');
INSERT INTO `web_auth_rule` VALUES ('650', '491', '152,491,650,', '3', 'admin/wholetype/sort', '全局分类排序', '1', 'admin', '0', '0', '', '1533846893');
INSERT INTO `web_auth_rule` VALUES ('702', '0', '702,', '1', 'admin/index/main', '系统主页', '1', 'admin', '1', '10', '', '1534227250');
INSERT INTO `web_auth_rule` VALUES ('723', '0', '723,', '1', 'admin/member/index', '会员管理', '1', 'admin', '1', '5', '', '1537873009');
INSERT INTO `web_auth_rule` VALUES ('724', '723', '723,724,', '2', '', '站内会员', '1', 'admin', '1', '0', '', '1537873400');
INSERT INTO `web_auth_rule` VALUES ('725', '724', '723,724,725,', '3', 'admin/member/index', '会员列表', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('726', '724', '723,724,726,', '3', 'admin/member/add', '添加会员', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('727', '724', '723,724,727,', '3', 'admin/member/edit', '修改会员', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('728', '724', '723,724,728,', '3', 'admin/member/del', '删除会员', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('729', '723', '723,729,', '2', '', '会员充值', '1', 'admin', '1', '36', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('784', '724', '723,724,784,', '3', 'admin/member/finance', '财务报表', '1', 'admin', '0', '0', '', '1539523331');
INSERT INTO `web_auth_rule` VALUES ('730', '729', '723,729,730,', '3', 'admin/balance/index', '消费记录', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('731', '729', '723,729,731,', '3', 'admin/balance/add', '会员充值', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('732', '729', '723,729,732,', '3', 'admin/balance/del', '删除记录', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('734', '0', '734,', '1', '', '稿件管理', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('735', '734', '734,735,', '2', '', '客户稿件', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('736', '735', '734,735,736,', '3', 'admin/article/index', '稿件列表', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('738', '735', '734,735,738,', '3', 'admin/article/edit', '修改稿件', '0', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('739', '735', '734,735,739,', '3', 'admin/article/del', '删除稿件', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('740', '735', '734,735,740,', '3', 'admin/article/sort', '稿件排序', '0', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('741', '152', '152,741,', '2', '', '文章分类', '0', 'admin', '0', '5', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('742', '741', '152,741,742,', '3', 'admin/articletype/index', '文章分类列表', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('743', '741', '152,741,743,', '3', 'admin/articletype/add', '添加文章分类', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('744', '741', '152,741,744,', '3', 'admin/articletype/edit', '修改文章分类', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('745', '741', '152,741,745,', '3', 'admin/articletype/del', '删除文章分类', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('746', '741', '152,741,746,', '3', 'admin/articletype/sort', '文章分类排序', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('778', '386', '386,778,', '2', '', '代理支付宝', '1', 'admin', '1', '25', '', '1539097882');
INSERT INTO `web_auth_rule` VALUES ('747', '723', '723,747,', '2', '', '代理商', '1', 'admin', '1', '20', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('748', '747', '723,727,748,', '3', 'admin/agent/index', '代理商列表', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('749', '747', '723,727,749,', '3', 'admin/agent/auditlist', '审核列表', '0', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('750', '747', '723,727,750,', '3', 'admin/agent/edit', '审核/查看', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('752', '152', '152,752,', '2', '', '会员分类', '1', 'admin', '1', '10', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('753', '752', '152,752,753,', '3', 'admin/membertype/index', '会员分类列表', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('754', '752', '152,752,754,', '3', 'admin/membertype/add', '添加会员分类', '1', 'admin', '1', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('755', '752', '152,752,755,', '3', 'admin/membertype/edit', '修改会员分类', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('756', '752', '152,752,756,', '3', 'admin/membertype/del', '删除会员分类', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('757', '752', '152,752,757,', '3', 'admin/membertype/sort', '会员分类排序', '1', 'admin', '0', '0', '', '1537873505');
INSERT INTO `web_auth_rule` VALUES ('764', '723', '723,764,', '2', '', '问题反馈', '1', 'admin', '1', '81', '', '1538109108');
INSERT INTO `web_auth_rule` VALUES ('758', '92', '91,92,758,', '3', 'admin/system/clearing', '系统参数配置', '1', 'admin', '1', '0', '', '1492654221');
INSERT INTO `web_auth_rule` VALUES ('760', '363', '362,363,760,', '3', 'admin/ajax/liststatechange', '数据状态切换', '1', 'admin', '0', '0', '', '1511269744');
INSERT INTO `web_auth_rule` VALUES ('761', '363', '362,363,761,', '0', 'admin/ajax/listauditstatechange', '代理商审核', '1', 'admin', '0', '0', '', '1511269744');
INSERT INTO `web_auth_rule` VALUES ('765', '764', '734,762,763,', '3', 'admin/feedback/index', '反馈记录', '1', 'admin', '1', '0', '', '1538109108');
INSERT INTO `web_auth_rule` VALUES ('767', '723', '723,767,', '2', '', '发票管理', '1', 'admin', '1', '50', '', '1539096415');
INSERT INTO `web_auth_rule` VALUES ('768', '767', '723,767,768,', '3', 'admin/invoice/index', '发票记录', '1', 'admin', '1', '0', '', '1539096478');
INSERT INTO `web_auth_rule` VALUES ('769', '767', '723,767,769,', '3', 'admin/invoice/edit', '查看发票', '1', 'admin', '0', '0', '', '1539096478');
INSERT INTO `web_auth_rule` VALUES ('770', '767', '723,767,770,', '3', 'admin/invoice/del', '删除发票', '1', 'admin', '0', '0', '', '1539096478');
INSERT INTO `web_auth_rule` VALUES ('771', '734', '734,771,', '2', '', '媒体管理', '1', 'admin', '1', '0', '', '1539096970');
INSERT INTO `web_auth_rule` VALUES ('772', '771', '734,771,772,', '3', 'admin/media/index', '媒体记录', '1', 'admin', '1', '0', '', '1539097047');
INSERT INTO `web_auth_rule` VALUES ('774', '771', '734,771,774,', '3', 'admin/media/edit', '修改媒体', '1', 'admin', '0', '0', '', '1539097081');
INSERT INTO `web_auth_rule` VALUES ('776', '771', '734,771,776,', '3', 'admin/media/del', '删除媒体', '1', 'admin', '0', '0', '', '1539097081');
INSERT INTO `web_auth_rule` VALUES ('777', '771', '734,771,777,', '3', 'admin/media/batchedit', '价格批量修改', '1', 'admin', '1', '0', '', '1539097081');
INSERT INTO `web_auth_rule` VALUES ('779', '778', '386,778,779,', '3', 'admin/alipay/index', '支付宝账户', '1', 'admin', '1', '0', '', '1539097985');
INSERT INTO `web_auth_rule` VALUES ('780', '778', '386,778,780,', '3', 'admin/alipay/add', '添加账户', '1', 'admin', '1', '0', '', '1539097985');
INSERT INTO `web_auth_rule` VALUES ('781', '778', '386,778,781,', '3', 'admin/alipay/edit', '修改账户', '1', 'admin', '0', '0', '', '1539097985');
INSERT INTO `web_auth_rule` VALUES ('782', '778', '386,778,782,', '3', 'admin/alipay/del', '删除账户', '1', 'admin', '0', '0', '', '1539097985');
INSERT INTO `web_auth_rule` VALUES ('783', '735', '734,735,783,', '3', 'admin/article/sort', '稿件内容查看', '1', 'admin', '0', '0', '', '1539199035');
INSERT INTO `web_auth_rule` VALUES ('785', '724', '723,724,785,', '3', 'admin/member/topup', '充值', '1', 'admin', '0', '0', '', '1539523344');
INSERT INTO `web_auth_rule` VALUES ('786', '747', '723,747,786,', '3', 'admin/agent/finance', '财务报表', '1', 'admin', '0', '0', '', '1539531795');
INSERT INTO `web_auth_rule` VALUES ('787', '747', '723,747,787,', '3', 'admin/agent/topup', '充值', '1', 'admin', '0', '0', '', '1539531826');
INSERT INTO `web_auth_rule` VALUES ('788', '724', '723,724,788,', '3', 'admin/member/balancedel', '充值记录删除', '1', 'admin', '0', '0', '', '1539533295');
INSERT INTO `web_auth_rule` VALUES ('789', '747', '723,747,789,', '3', 'admin/agent/balancedel', '充值记录删除', '1', 'admin', '0', '0', '', '1539533320');
INSERT INTO `web_auth_rule` VALUES ('791', '723', '723,791,', '2', '', '邀请码', '1', 'admin', '1', '21', '', '1539534202');
INSERT INTO `web_auth_rule` VALUES ('792', '791', '723,791,792,', '3', 'admin/invite/index', '邀请码列表', '1', 'admin', '1', '0', '', '1539534268');
INSERT INTO `web_auth_rule` VALUES ('793', '791', '723,791,793,', '3', 'admin/invite/add', '添加邀请码', '1', 'admin', '1', '0', '', '1539534282');
INSERT INTO `web_auth_rule` VALUES ('794', '791', '723,791,794,', '3', 'admin/invite/del', '删除邀请码', '1', 'admin', '0', '0', '', '1539534299');
INSERT INTO `web_auth_rule` VALUES ('795', '363', '362,363,795,', '3', 'admin/article/invitecodecheck', '邀请码验证', '1', 'admin', '0', '0', '', '1539540344');
INSERT INTO `web_auth_rule` VALUES ('796', '747', '723,747,796,', '3', 'admin/agent/add', '添加代理商', '1', 'admin', '1', '0', '', '1539872669');
INSERT INTO `web_auth_rule` VALUES ('797', '386', '386,797,', '2', '', '平台支付信息', '0', 'admin', '0', '0', '', '1540518233');
INSERT INTO `web_auth_rule` VALUES ('798', '797', '386,797,798,', '3', 'admin/alipay/adminpay', '支付信息', '0', 'admin', '0', '0', '', '1540518383');
INSERT INTO `web_auth_rule` VALUES ('800', '386', '386,800,', '2', '', '优惠公告', '1', 'admin', '1', '12', '', '1542534227');
INSERT INTO `web_auth_rule` VALUES ('801', '800', '386,800,801,', '3', 'admin/newsdynamics/index', '公告列表', '1', 'admin', '1', '0', '', '1542534293');
INSERT INTO `web_auth_rule` VALUES ('802', '800', '386,800,802,', '3', 'admin/newsdynamics/add', '添加公告', '1', 'admin', '1', '0', '', '1542534439');
INSERT INTO `web_auth_rule` VALUES ('803', '800', '386,800,803,', '3', 'admin/newsdynamics/edit', '修改公告', '1', 'admin', '0', '0', '', '1542534456');
INSERT INTO `web_auth_rule` VALUES ('804', '800', '386,800,804,', '3', 'admin/newsdynamics/del', '删除公告', '1', 'admin', '0', '0', '', '1542535787');
INSERT INTO `web_auth_rule` VALUES ('805', '800', '386,800,805,', '3', 'admin/newsdynamics/sort', '公告排序', '1', 'admin', '0', '0', '', '1542535823');
INSERT INTO `web_auth_rule` VALUES ('806', '152', '152,806,', '2', '', '新闻动态分类', '1', 'admin', '1', '11', '', '1542536140');
INSERT INTO `web_auth_rule` VALUES ('807', '806', '152,806,807,', '3', 'admin/newsdynamicstype/index', '新闻动态列表', '1', 'admin', '1', '0', '', '1542536200');
INSERT INTO `web_auth_rule` VALUES ('808', '806', '152,806,808,', '3', 'admin/newsdynamicstype/add', '添加新闻动态', '1', 'admin', '1', '0', '', '1542536218');
INSERT INTO `web_auth_rule` VALUES ('809', '806', '152,806,809,', '3', 'admin/newsdynamicstype/edit', '修改新闻动态', '1', 'admin', '0', '0', '', '1542536257');
INSERT INTO `web_auth_rule` VALUES ('810', '806', '152,806,810,', '3', 'admin/newsdynamicstype/del', '删除新闻动态', '1', 'admin', '0', '0', '', '1542536270');
INSERT INTO `web_auth_rule` VALUES ('811', '806', '152,806,811,', '3', 'admin/newsdynamicstype/sort', '新闻动态排序', '1', 'admin', '0', '0', '', '1542536297');
INSERT INTO `web_auth_rule` VALUES ('812', '386', '386,812,', '2', '', '公告管理', '1', 'admin', '0', '0', '', '1542765942');
INSERT INTO `web_auth_rule` VALUES ('813', '812', '386,812,813,', '3', 'admin/notice/index', '公告列表', '1', 'admin', '0', '0', '', '1542765996');
INSERT INTO `web_auth_rule` VALUES ('814', '812', '386,812,814,', '3', 'admin/notice/add', '添加公告', '1', 'admin', '0', '0', '', '1542766009');
INSERT INTO `web_auth_rule` VALUES ('815', '812', '386,812,815,', '3', 'admin/notice/del', '删除公告', '1', 'admin', '0', '0', '', '1542766024');
INSERT INTO `web_auth_rule` VALUES ('816', '812', '386,812,816,', '3', 'admin/notice/edit', '修改公告', '1', 'admin', '0', '0', '', '1542766042');
INSERT INTO `web_auth_rule` VALUES ('817', '812', '386,812,817,', '3', 'admin/notice/sort', '公告排序', '1', 'admin', '0', '0', '', '1542766059');
INSERT INTO `web_auth_rule` VALUES ('820', '386', '386,820,', '2', '', '在线留言', '1', 'admin', '1', '0', '', '1557040419');
INSERT INTO `web_auth_rule` VALUES ('821', '820', '386,820,821,', '3', 'admin/freedbook/index', '留言管理', '1', 'admin', '1', '0', '', '1557040689');
INSERT INTO `web_auth_rule` VALUES ('822', '734', '734,822,', '2', '', '自媒体管理', '1', 'admin', '1', '0', '', '1539096970');
INSERT INTO `web_auth_rule` VALUES ('823', '822', '734,822,823,', '3', 'admin/wemedia/index', '媒体记录', '1', 'admin', '1', '0', '', '1539097047');
INSERT INTO `web_auth_rule` VALUES ('825', '822', '734,822,825,', '3', 'admin/wemedia/edit', '修改媒体', '1', 'admin', '0', '0', '', '1539097081');
INSERT INTO `web_auth_rule` VALUES ('827', '822', '734,822,827,', '3', 'admin/wemedia/del', '删除媒体', '1', 'admin', '0', '0', '', '1539097081');
INSERT INTO `web_auth_rule` VALUES ('828', '822', '734,822,827,', '3', 'admin/wemedia/batchedit', '价格批量修改', '1', 'admin', '1', '0', '', '1539097081');
INSERT INTO `web_auth_rule` VALUES ('830', '735', '734,735,830,', '3', 'admin/wearticle/index', '自媒体稿件', '1', 'admin', '1', '0', '', '1557993640');
INSERT INTO `web_auth_rule` VALUES ('831', '386', '386,831,', '2', '', '抽奖活动', '1', 'admin', '1', '0', '', '1557040419');
INSERT INTO `web_auth_rule` VALUES ('832', '831', '386,831,832,', '3', '/exchangedraw/listall/aid/3', '抽奖活动', '1', 'admin', '1', '0', '', '1557040689');
INSERT INTO `web_auth_rule` VALUES ('833', '831', '386,831,833,', '3', '/exchangedraw/orderlist', '中奖管理', '1', 'admin', '1', '0', '', '0');
INSERT INTO `web_auth_rule` VALUES ('834', '386', '386,834,', '2', '', '友情链接', '1', 'admin', '1', '0', '', '1542765942');
INSERT INTO `web_auth_rule` VALUES ('835', '834', '386,834,835,', '3', 'admin/links/index', '链接列表', '1', 'admin', '1', '0', '', '1542765996');
INSERT INTO `web_auth_rule` VALUES ('836', '834', '386,834,836,', '3', 'admin/links/add', '添加链接', '1', 'admin', '1', '0', '', '1542766009');
INSERT INTO `web_auth_rule` VALUES ('837', '834', '386,834,837,', '3', 'admin/links/del', '删除链接', '1', 'admin', '0', '0', '', '1542766024');
INSERT INTO `web_auth_rule` VALUES ('838', '834', '386,834,838,', '3', 'admin/links/edit', '修改链接', '1', 'admin', '0', '0', '', '1542766042');
INSERT INTO `web_auth_rule` VALUES ('839', '834', '386,834,839,', '3', 'admin/links/sort', '链接排序', '1', 'admin', '0', '0', '', '1542766059');

-- ----------------------------
-- Table structure for web_balance
-- ----------------------------
DROP TABLE IF EXISTS `web_balance`;
CREATE TABLE `web_balance` (
  `BalanceID` int(10) NOT NULL AUTO_INCREMENT,
  `BalanceMemberRecommendID` int(10) unsigned DEFAULT '0' COMMENT '推荐人ID',
  `BalanceMemberRecommendPath` varchar(1000) DEFAULT '' COMMENT '推荐关系的路径',
  `BalanceMemberID` int(10) DEFAULT '0' COMMENT '会员ID',
  `BalanceNumber` varchar(64) DEFAULT '' COMMENT '订单号',
  `BalanceTitle` varchar(200) DEFAULT '' COMMENT '余额标题',
  `BalanceType` tinyint(1) unsigned DEFAULT '0' COMMENT '充值消费类型1为充值2为消费5媒体主收稿6媒体主退稿',
  `BalanceGroup` tinyint(1) unsigned DEFAULT '0' COMMENT '充值类型：1手动充值2支付宝充值3系统返还4文章发布5收稿收入6收稿退费',
  `BalanceCount` decimal(10,2) DEFAULT '0.00' COMMENT '余额充值数量',
  `BalanceCurrentCount` decimal(10,2) DEFAULT '0.00' COMMENT '会员账户当前余额小计',
  `BalancePayState` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态0未支付1已支付',
  `BalancePayTime` int(10) unsigned DEFAULT '0' COMMENT '支付时间',
  `BalanceSort` smallint(5) unsigned DEFAULT '0',
  `BalanceState` tinyint(1) unsigned DEFAULT '0',
  `BalanceTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`BalanceID`),
  KEY `BalanceMemberID` (`BalanceMemberID`,`BalanceTitle`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4757 DEFAULT CHARSET=utf8 COMMENT='会员余额充值/消费数据表';

-- ----------------------------
-- Records of web_balance
-- ----------------------------
INSERT INTO `web_balance` VALUES ('205', '0', '756', '756', 'cz20191012987131', '支付宝充值', '1', '2', '0.01', '0.00', '1', '1570851610', '0', '1', '1570851424');
INSERT INTO `web_balance` VALUES ('315', '0', '756', '756', 'cz20191029724276', '代充值', '1', '2', '10.00', '10.07', '1', '0', '0', '1', '1572343475');
INSERT INTO `web_balance` VALUES ('316', '0', '', '756', 'dd2019102963038', '媒体发布', '2', '4', '10.00', '0.07', '0', '0', '0', '1', '1572343517');
INSERT INTO `web_balance` VALUES ('318', '0', '', '756', 'dd2019102963038', '订单退款', '1', '3', '10.00', '10.07', '1', '0', '0', '1', '1572349441');
INSERT INTO `web_balance` VALUES ('338', '0', '', '756', 'dd2019103165508', '媒体发布', '2', '4', '5.00', '5.07', '0', '0', '0', '1', '1572494598');
INSERT INTO `web_balance` VALUES ('339', '0', '', '756', 'dd2019103165508', '订单退款', '1', '3', '5.00', '10.07', '1', '0', '0', '1', '1572494620');
INSERT INTO `web_balance` VALUES ('461', '0', '756', '756', 'cz20191129041256', '代充值', '2', '2', '10.00', '0.07', '1', '0', '0', '1', '1575019105');
INSERT INTO `web_balance` VALUES ('522', '0', '756', '756', 'cz20191219733140', '支付宝充值', '1', '2', '0.01', '0.00', '1', '1576748871', '0', '1', '1576748859');
INSERT INTO `web_balance` VALUES ('2461', '0', '756', '756', 'cz20200304794882', '代充值', '1', '2', '20.00', '20.08', '1', '0', '0', '1', '1583288204');
INSERT INTO `web_balance` VALUES ('2462', '0', '', '756', 'dd2020030427715', '媒体发布', '2', '4', '7.00', '13.08', '0', '0', '0', '1', '1583288270');
INSERT INTO `web_balance` VALUES ('2463', '0', '', '756', 'dd20200304233753958', '媒体发布', '2', '4', '7.00', '6.08', '0', '0', '0', '1', '1583288618');
INSERT INTO `web_balance` VALUES ('2467', '0', '', '756', 'dd20200304233753958', '订单退款', '1', '3', '7.00', '13.08', '1', '0', '0', '1', '1583289210');
INSERT INTO `web_balance` VALUES ('2468', '0', '', '756', 'dd2020030427715', '订单退款', '1', '3', '7.00', '20.08', '1', '0', '0', '1', '1583289217');
INSERT INTO `web_balance` VALUES ('2470', '0', '', '756', 'dd20200304335611416', '订单退款', '1', '3', '7.00', '20.08', '1', '0', '0', '1', '1583289422');
INSERT INTO `web_balance` VALUES ('2471', '0', '', '756', 'dd20200304384176005', '媒体发布', '2', '4', '7.00', '13.08', '0', '0', '0', '1', '1583289521');

-- ----------------------------
-- Table structure for web_changedoc
-- ----------------------------
DROP TABLE IF EXISTS `web_changedoc`;
CREATE TABLE `web_changedoc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int(10) NOT NULL,
  `ordernum` varchar(32) NOT NULL,
  `changedc` text NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `articleid` int(10) NOT NULL,
  `articletitle` varchar(100) NOT NULL,
  `mediaid` int(10) NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '0未处理1处理中2完成3拒绝',
  `state_text` varchar(100) DEFAULT NULL,
  `memberid` int(10) NOT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_changedoc
-- ----------------------------
INSERT INTO `web_changedoc` VALUES ('3', '1658', 'dd20200304471534226', '<p>11111111</p>', '111111.00', '872', '疫情期间如何做好企业品牌宣传？', '25368', '3', '编辑不改', '756', '1604912933');
INSERT INTO `web_changedoc` VALUES ('4', '1658', 'dd20200304471534226', '<p>1111111</p>', '10.00', '873', '疫情期间如何做好企业品牌宣传？', '6421', '2', '', '756', '1605087575');
INSERT INTO `web_changedoc` VALUES ('5', '1657', 'dd20200304384176005', '<p>88888888</p>', '10.00', '872', '疫情期间如何做好企业品牌宣传？', '10896', '0', null, '756', '1605087826');

-- ----------------------------
-- Table structure for web_citytype
-- ----------------------------
DROP TABLE IF EXISTS `web_citytype`;
CREATE TABLE `web_citytype` (
  `TypeID` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `TypePID` smallint(6) unsigned DEFAULT '0',
  `TypePath` varchar(20) DEFAULT '',
  `TypeNode` tinyint(1) unsigned DEFAULT '0',
  `TypeName` varchar(20) DEFAULT '',
  `TypeMarked` varchar(30) DEFAULT '',
  `TypePicPath` varchar(30) DEFAULT '',
  `TypePostCode` varchar(10) DEFAULT '',
  `TypeAreaCode` varchar(5) DEFAULT '',
  `TypeCityAffiliationState` tinyint(1) unsigned DEFAULT '0' COMMENT '所属地区：0无1华东2华南3华中4华北5西南6西北7东北',
  `TypeSort` tinyint(3) unsigned DEFAULT '0',
  `TypeRecommend` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐状态',
  `TypeState` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TypeTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`TypeID`),
  KEY `TypePath` (`TypePath`) USING BTREE,
  KEY `TypePID` (`TypePID`) USING BTREE,
  KEY `TypeMarked` (`TypeMarked`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3294 DEFAULT CHARSET=utf8 COMMENT='城市类别表';

-- ----------------------------
-- Records of web_citytype
-- ----------------------------
INSERT INTO `web_citytype` VALUES ('1', '0', '1,', '1', '北京', 'beijing', '', '100000', '010', '1', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2', '0', '2,', '1', '上海', 'shanghai', '', '200000', '021', '2', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3', '0', '3,', '1', '天津', 'tianjin', '', '300000', '022', '1', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('4', '0', '4,', '1', '重庆', 'chongqing', '', '404000', '023', '2', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('5', '0', '5,', '1', '河北', 'hebei', '', '050000', '0311', '3', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('6', '0', '6,', '1', '山西', 'shanxi', '', '030000', '0351', '3', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('7', '0', '7,', '1', '内蒙古', 'neimenggu', '', '010000', '0471', '6', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('8', '0', '8,', '1', '辽宁', 'liaoning', '', '110000', '024', '7', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('9', '0', '9,', '1', '吉林', 'jls', '', '130000', '0431', '7', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('10', '0', '10,', '1', '黑龙江', 'heilongjiang', '', '150000', '0451', '7', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('11', '0', '11,', '1', '江苏', 'jiangsu', '', '210000', '025', '2', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('12', '0', '12,', '1', '浙江', 'zhejiang', '', '310000', '0571', '2', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('13', '0', '13,', '1', '安徽', 'anhui', '', '230000', '0551', '3', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('14', '0', '14,', '1', '福建', 'fujian', '', '350000', '0591', '4', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('15', '0', '15,', '1', '江西', 'jiangxi', '', '330000', '0791', '4', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('16', '0', '16,', '1', '山东', 'shandong', '', '250000', '0531', '4', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('17', '0', '17,', '1', '河南', 'henan', '', '450000', '0371', '3', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('18', '0', '18,', '1', '湖北', 'hubei', '', '430010', '027', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('19', '0', '19,', '1', '湖南', 'hunan', '', '410000', '0731', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('20', '0', '20,', '1', '广东', 'guangdong', '', '510100', '020', '0', '20', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('21', '0', '21,', '1', '广西', 'guangxi', '', '530000', '0771', '0', '21', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('22', '0', '22,', '1', '海南', 'hainan', '', '570100', '0898', '0', '22', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('23', '0', '23,', '1', '四川', 'sichuan', '', '610000', '028', '0', '23', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('24', '0', '24,', '1', '贵州', 'guizhou', '', '550000', '0851', '0', '24', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('25', '0', '25,', '1', '云南', 'yunnan', '', '650000', '0871', '0', '25', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('26', '0', '26,', '1', '西藏', 'xicang', '', '850000', '0891', '5', '26', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('27', '0', '27,', '1', '陕西', 'sx', '', '710000', '029', '0', '27', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('28', '0', '28,', '1', '甘肃', 'gansu', '', '730030', '0931', '0', '28', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('29', '0', '29,', '1', '青海', 'qinghai', '', '810000', '0971', '0', '29', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('30', '0', '30,', '1', '宁夏', 'ningxia', '', '750000', '0951', '0', '30', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('31', '0', '31,', '1', '新疆', 'xinjiang', '', '830000', '0991', '0', '31', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('32', '0', '32,', '1', '台湾', 'taiwan', '', '999079', '00886', '0', '32', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('33', '0', '33,', '1', '香港', 'xianggang', '', '999077', '00852', '0', '33', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('34', '0', '34,', '1', '澳门', 'aomen', '', '999078', '00853', '0', '34', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('35', '3283', '1,3283,35,', '3', '东城区', 'dongchengqu', '', '100000', '010', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('36', '3283', '1,3283,36,', '3', '西城区', 'xichengqu', '', '100000', '010', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('37', '3283', '1,3283,37,', '3', '崇文区', 'chongwenqu', '', '100000', '010', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('38', '3283', '1,3283,38,', '3', '宣武区', 'xuanwuqu', '', '100000', '010', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('39', '3283', '1,3283,39,', '3', '朝阳区', 'chaoyangqu', '', '100000', '010', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('40', '3283', '1,3283,40,', '3', '丰台区', 'fengtaiqu', '', '100000', '010', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('41', '3283', '1,3283,41,', '3', '石景山区', 'shijingshanqu', '', '100000', '010', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('42', '3283', '1,3283,42,', '3', '海淀区', 'haidianqu', '', '100000', '010', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('43', '3283', '1,3283,43,', '3', '门头沟区', 'mentougouqu', '', '102300', '010', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('44', '3283', '1,3283,44,', '3', '房山区', 'fangshanqu', '', '102400', '010', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('45', '3283', '1,3283,45,', '3', '通州区', 'tongzhouqu', '', '101100', '010', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('46', '3283', '1,3283,46,', '3', '顺义区', 'shunyiqu', '', '101300', '010', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('47', '3283', '1,3283,47,', '3', '昌平区', 'changpingqu', '', '102200', '010', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('48', '3283', '1,3283,48,', '3', '大兴区', 'daxingqu', '', '102600', '010', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('49', '3283', '1,3283,49,', '3', '怀柔区', 'huairouqu', '', '101400', '010', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('50', '3283', '1,3283,50,', '3', '平谷区', 'pingguqu', '', '101200', '010', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('51', '3283', '1,3283,51,', '3', '密云县', 'miyunxian', '', '101500', '010', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('52', '3283', '1,3283,52,', '3', '延庆县', 'yanqingxian', '', '102100', '010', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('53', '3284', '2,3284,53,', '3', '黄浦区', 'huangpuqu', '', '200000', '021', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('54', '3284', '2,3284,54,', '3', '卢湾区', 'luwanqu', '', '200000', '021', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('55', '3284', '2,3284,55,', '3', '徐汇区', 'xuhuiqu', '', '200000', '021', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('56', '3284', '2,3284,56,', '3', '长宁区', 'changningqu', '', '200000', '021', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('57', '3284', '2,3284,57,', '3', '静安区', 'jinganqu', '', '200000', '021', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('58', '3284', '2,3284,58,', '3', '普陀区', 'putuoqu', '', '200000', '021', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('59', '3284', '2,3284,59,', '3', '闸北区', 'zhabeiqu', '', '200000', '021', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('60', '3284', '2,3284,60,', '3', '虹口区', 'hongkouqu', '', '200000', '021', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('61', '3284', '2,3284,61,', '3', '杨浦区', 'yangpuqu', '', '200000', '021', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('62', '3284', '2,3284,62,', '3', '闵行区', 'xingqu', '', '201100', '021', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('63', '3284', '2,3284,63,', '3', '宝山区', 'baoshanqu', '', '201900', '021', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('64', '3284', '2,3284,64,', '3', '嘉定区', 'jiadingqu', '', '201800', '021', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('65', '3284', '2,3284,65,', '3', '浦东新区', 'pudongxinqu', '', '201200', '021', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('66', '3284', '2,3284,66,', '3', '金山区', 'jinshanqu', '', '201500', '021', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('67', '3284', '2,3284,67,', '3', '松江区', 'songjiangqu', '', '201600', '021', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('68', '3284', '2,3284,68,', '3', '青浦区', 'qingpuqu', '', '201700', '021', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('69', '3284', '2,3284,69,', '3', '南汇区', 'nanhuiqu', '', '201300', '021', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('70', '3284', '2,3284,70,', '3', '奉贤区', 'fengxianqu', '', '201400', '021', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('71', '3284', '2,3284,71,', '3', '崇明县', 'chongmingxian', '', '202150', '021', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('72', '3285', '3,3285,72,', '3', '和平区', 'hepingqu', '', '300000', '022', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('73', '3285', '3,3285,73,', '3', '河东区', 'hedongqu', '', '300000', '022', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('74', '3285', '3,3285,74,', '3', '河西区', 'hexiqu', '', '300000', '022', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('75', '3285', '3,3285,75,', '3', '南开区', 'nankaiqu', '', '300000', '022', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('76', '3285', '3,3285,76,', '3', '河北区', 'hebeiqu', '', '300000', '022', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('77', '3285', '3,3285,77,', '3', '红桥区', 'hongqiaoqu', '', '300000', '022', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('78', '3285', '3,3285,78,', '3', '塘沽区', 'tangguqu', '', '300450', '022', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('79', '3285', '3,3285,79,', '3', '汉沽区', 'hanguqu', '', '300480', '022', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('80', '3285', '3,3285,80,', '3', '大港区', 'dagangqu', '', '300200', '022', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('81', '3285', '3,3285,81,', '3', '东丽区', 'dongliqu', '', '300000', '022', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('82', '3285', '3,3285,82,', '3', '西青区', 'xiqingqu', '', '300000', '022', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('83', '3285', '3,3285,83,', '3', '津南区', 'jinnanqu', '', '300000', '022', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('84', '3285', '3,3285,84,', '3', '北辰区', 'beichenqu', '', '300000', '022', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('85', '3285', '3,3285,85,', '3', '武清区', 'wuqingqu', '', '301700', '022', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('86', '3285', '3,3285,86,', '3', '宝坻区', 'baoqu', '', '301800', '022', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('87', '3285', '3,3285,87,', '3', '宁河县', 'ninghexian', '', '301500', '022', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('88', '3285', '3,3285,88,', '3', '静海县', 'jinghaixian', '', '301600', '022', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('89', '3285', '3,3285,89,', '3', '蓟县', 'jixian', '', '301900', '022', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('90', '3286', '4,3286,90,', '3', '万州区', 'wanzhouqu', '', '404000', '023', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('91', '3286', '4,3286,91,', '3', '涪陵区', 'fulingqu', '', '408000', '023', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('92', '3286', '4,3286,92,', '3', '渝中区', 'yuzhongqu', '', '400010', '023', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('93', '3286', '4,3286,93,', '3', '大渡口区', 'dadukouqu', '', '400080', '023', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('94', '3286', '4,3286,94,', '3', '江北区', 'jiangbeiqu', '', '400020', '023', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('95', '3286', '4,3286,95,', '3', '沙坪坝区', 'shapingbaqu', '', '400030', '023', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('96', '3286', '4,3286,96,', '3', '九龙坡区', 'jiulongpoqu', '', '400050', '023', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('97', '3286', '4,3286,97,', '3', '南岸区', 'nananqu', '', '400060', '023', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('98', '3286', '4,3286,98,', '3', '北碚区', 'beibeiqu', '', '400700', '023', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('99', '3286', '4,3286,99,', '3', '万盛区', 'wanshengqu', '', '400800', '023', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('100', '3286', '4,3286,100,', '3', '双桥区', 'shuangqiaoqu', '', '400900', '023', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('101', '3286', '4,3286,101,', '3', '渝北区', 'yubeiqu', '', '401100', '023', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('102', '3286', '4,3286,102,', '3', '巴南区', 'bananqu', '', '401300', '023', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('103', '3286', '4,3286,103,', '3', '黔江区', 'qianjiangqu', '', '409000', '023', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('104', '3286', '4,3286,104,', '3', '长寿区', 'changshouqu', '', '401200', '023', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('105', '3286', '4,3286,105,', '3', '綦江县', 'jiangxian', '', '401400', '023', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('106', '3286', '4,3286,106,', '3', '潼南县', 'nanxian', '', '402600', '023', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('107', '3286', '4,3286,107,', '3', '铜梁县', 'tongliangxian', '', '402500', '023', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('108', '3286', '4,3286,108,', '3', '大足县', 'dazuxian', '', '402300', '023', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('109', '3286', '4,3286,109,', '3', '荣昌县', 'rongchangxian', '', '402400', '023', '0', '20', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('110', '3286', '4,3286,110,', '3', '璧山县', 'shanxian', '', '402700', '023', '0', '21', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('111', '3286', '4,3286,111,', '3', '梁平县', 'liangpingxian', '', '405200', '023', '0', '22', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('112', '3286', '4,3286,112,', '3', '城口县', 'chengkouxian', '', '405900', '023', '0', '23', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('113', '3286', '4,3286,113,', '3', '丰都县', 'fengduxian', '', '408200', '023', '0', '24', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('114', '3286', '4,3286,114,', '3', '垫江县', 'dianjiangxian', '', '408300', '023', '0', '25', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('115', '3286', '4,3286,115,', '3', '武隆县', 'wulongxian', '', '408500', '023', '0', '26', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('116', '3286', '4,3286,116,', '3', '忠县', 'zhongxian', '', '404300', '023', '0', '27', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('117', '3286', '4,3286,117,', '3', '开县', 'kaixian', '', '405400', '023', '0', '28', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('118', '3286', '4,3286,118,', '3', '云阳县', 'yunyangxian', '', '404500', '023', '0', '29', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('119', '3286', '4,3286,119,', '3', '奉节县', 'fengjiexian', '', '404600', '023', '0', '30', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('120', '3286', '4,3286,120,', '3', '巫山县', 'wushanxian', '', '404700', '023', '0', '31', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('121', '3286', '4,3286,121,', '3', '巫溪县', 'wuxixian', '', '405800', '023', '0', '32', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('122', '3286', '4,3286,122,', '3', '石柱土家族自治县', 'shizhutujiazuzizhixian', '', '409100', '023', '0', '33', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('123', '3286', '4,3286,123,', '3', '秀山土家族苗族自治县', 'xiushantujiazumiaozuzizhixian', '', '409900', '023', '0', '34', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('124', '3286', '4,3286,124,', '3', '酉阳土家族苗族自治县', 'youyangtujiazumiaozuzizhixian', '', '409800', '023', '0', '35', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('125', '3286', '4,3286,125,', '3', '彭水苗族土家族自治县', 'pengshuimiaozutujiazuzizhixian', '', '409600', '023', '0', '36', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('126', '3286', '4,3286,126,', '3', '江津', 'jiangjin', '', '402200', '023', '0', '37', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('127', '3286', '4,3286,127,', '3', '合川', 'hechuan', '', '401500', '023', '0', '38', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('128', '3286', '4,3286,128,', '3', '永川', 'yongchuan', '', '402100', '023', '0', '39', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('129', '3286', '4,3286,129,', '3', '南川', 'nanchuan', '', '408400', '023', '0', '40', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('130', '5', '5,130,', '2', '石家庄', 'shijiazhuang', '', '050000', '0311', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('131', '5', '5,131,', '2', '唐山', 'tangshan', '', '063000', '0315', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('132', '5', '5,132,', '2', '秦皇岛', 'qinhuangdao', '', '066000', '0335', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('133', '5', '5,133,', '2', '邯郸', 'handan', '', '056000', '0310', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('134', '5', '5,134,', '2', '邢台', 'xingtai', '', '054000', '0319', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('135', '5', '5,135,', '2', '保定', 'baoding', '', '071000', '0312', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('136', '5', '5,136,', '2', '张家口', 'zhangjiakou', '', '075000', '0313', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('137', '5', '5,137,', '2', '承德', 'chengde', '', '067000', '0314', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('138', '5', '5,138,', '2', '沧州', 'cangzhou', '', '061000', '0317', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('139', '5', '5,139,', '2', '廊坊', 'langfang', '', '065000', '0316', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('140', '5', '5,140,', '2', '衡水', 'hengshui', '', '053000', '0318', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('141', '6', '6,141,', '2', '太原', 'taiyuan', '', '030000', '0351', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('142', '6', '6,142,', '2', '大同', 'datong', '', '037000', '0352', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('143', '6', '6,143,', '2', '阳泉', 'yangquan', '', '045000', '0353', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('144', '6', '6,144,', '2', '长治', 'changzhi', '', '046000', '0355', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('145', '6', '6,145,', '2', '晋城', 'jincheng', '', '048000', '0356', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('146', '6', '6,146,', '2', '朔州', 'shuozhou', '', '038500', '0349', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('147', '6', '6,147,', '2', '晋中', 'jinzhong', '', '030600', '0354', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('148', '6', '6,148,', '2', '运城', 'yuncheng', '', '044000', '0359', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('149', '6', '6,149,', '2', '忻州', 'xinzhou', '', '034000', '0350', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('150', '6', '6,150,', '2', '临汾', 'linfen', '', '041000', '0357', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('151', '6', '6,151,', '2', '吕梁', 'lvliang', '', '033000', '0358', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('152', '7', '7,152,', '2', '呼和浩特', 'huhehaote', '', '010000', '0471', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('153', '7', '7,153,', '2', '包头', 'baotou', '', '014000', '0472', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('154', '7', '7,154,', '2', '乌海', 'wuhai', '', '016000', '0473', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('155', '7', '7,155,', '2', '赤峰', 'chifeng', '', '024000', '0476', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('156', '7', '7,156,', '2', '通辽', 'tongliao', '', '028000', '0475', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('157', '7', '7,157,', '2', '鄂尔多斯', 'eerduosi', '', '017000', '0477', '0', '6', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('158', '7', '7,158,', '2', '呼伦贝尔', 'hulunbeier', '', '021000', '0470', '0', '7', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('159', '7', '7,159,', '2', '巴彦淖尔', 'bayannaoer', '', '015000', '0478', '0', '8', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('160', '7', '7,160,', '2', '乌兰察布', 'wulanchabu', '', '012000', '0474', '0', '9', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('161', '7', '7,161,', '2', '兴安盟', 'xinganmeng', '', '137400', '0482', '0', '10', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('162', '7', '7,162,', '2', '锡林郭勒盟', 'xilinguolemeng', '', '012600', '0479', '0', '11', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('163', '7', '7,163,', '2', '阿拉善盟', 'alashanmeng', '', '750300', '0483', '0', '12', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('164', '8', '8,164,', '2', '沈阳', 'shenyang', '', '110000', '024', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('165', '8', '8,165,', '2', '大连', 'dalian', '', '116000', '0411', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('166', '8', '8,166,', '2', '鞍山', 'anshan', '', '114000', '0412', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('167', '8', '8,167,', '2', '抚顺', 'fushun', '', '113000', '0413', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('168', '8', '8,168,', '2', '本溪', 'benxi', '', '117000', '0414', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('169', '8', '8,169,', '2', '丹东', 'dandong', '', '118000', '0415', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('170', '8', '8,170,', '2', '锦州', 'jinzhou', '', '121000', '0416', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('171', '8', '8,171,', '2', '营口', 'yingkou', '', '115000', '0417', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('172', '8', '8,172,', '2', '阜新', 'fuxin', '', '123000', '0418', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('173', '8', '8,173,', '2', '辽阳', 'liaoyang', '', '111000', '0419', '0', '10', '1', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('174', '8', '8,174,', '2', '盘锦', 'panjin', '', '124000', '0427', '0', '11', '1', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('175', '8', '8,175,', '2', '铁岭', 'tieling', '', '112000', '0410', '0', '12', '1', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('176', '8', '8,176,', '2', '朝阳', 'chaoyang', '', '122000', '0421', '0', '13', '1', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('177', '8', '8,177,', '2', '葫芦岛', 'huludao', '', '125000', '0429', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('178', '9', '9,178,', '2', '长春', 'changchun', '', '130000', '0431', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('179', '9', '9,179,', '2', '吉林', 'jilin', '', '132000', '0432', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('180', '9', '9,180,', '2', '四平', 'siping', '', '136000', '0434', '0', '3', '1', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('181', '9', '9,181,', '2', '辽源', 'liaoyuan', '', '136200', '0437', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('182', '9', '9,182,', '2', '通化', 'tonghua', '', '134000', '0435', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('183', '9', '9,183,', '2', '白山', 'baishan', '', '134300', '0439', '0', '6', '1', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('184', '9', '9,184,', '2', '松原', 'songyuan', '', '138000', '0438', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('185', '9', '9,185,', '2', '白城', 'baicheng', '', '137000', '0436', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('186', '9', '9,186,', '2', '延边朝鲜族自治州', 'yanbianchaoxianzuzizhizhou', '', '133000', '0433', '0', '9', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('187', '10', '10,187,', '2', '哈尔滨', 'haerbin', '', '150000', '0451', '7', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('188', '10', '10,188,', '2', '齐齐哈尔', 'qiqihaer', '', '161000', '0452', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('189', '10', '10,189,', '2', '鸡西', 'jixi', '', '158100', '0467', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('190', '10', '10,190,', '2', '鹤岗', 'hegang', '', '154100', '0468', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('191', '10', '10,191,', '2', '双鸭山', 'shuangyashan', '', '155100', '0469', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('192', '10', '10,192,', '2', '大庆', 'daqing', '', '163000', '0459', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('193', '10', '10,193,', '2', '伊春', 'yc', '', '153000', '0458', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('194', '10', '10,194,', '2', '佳木斯', 'jiamusi', '', '154000', '0454', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('195', '10', '10,195,', '2', '七台河', 'qitaihe', '', '154600', '0464', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('196', '10', '10,196,', '2', '牡丹江', 'mudanjiang', '', '157000', '0453', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('197', '10', '10,197,', '2', '黑河', 'heihe', '', '164300', '0456', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('198', '10', '10,198,', '2', '绥化', 'suihua', '', '152000', '0455', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('199', '10', '10,199,', '2', '大兴安岭地区', 'daxinganlingdiqu', '', '165100', '0457', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('200', '11', '11,200,', '2', '南京', 'nanjing', '', '210000', '025', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('201', '11', '11,201,', '2', '无锡', 'wuxi', '', '214000', '0510', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('202', '11', '11,202,', '2', '徐州', 'xuzhou', '', '221000', '0516', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('203', '11', '11,203,', '2', '常州', 'changzhou', '', '213000', '0519', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('204', '11', '11,204,', '2', '苏州', 'sz', '', '215000', '0512', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('205', '11', '11,205,', '2', '南通', 'nantong', '', '226000', '0513', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('206', '11', '11,206,', '2', '连云港', 'lianyungang', '', '222000', '0518', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('207', '11', '11,207,', '2', '淮安', 'huaian', '', '223000', '0517', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('208', '11', '11,208,', '2', '盐城', 'yancheng', '', '224000', '0515', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('209', '11', '11,209,', '2', '扬州', 'yangzhou', '', '225000', '0514', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('210', '11', '11,210,', '2', '镇江', 'zhenjiang', '', '212000', '0511', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('211', '11', '11,211,', '2', '泰州', 'taizhou', '', '225300', '0523', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('212', '11', '11,212,', '2', '宿迁', 'suqian', '', '223800', '0527', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('213', '12', '12,213,', '2', '杭州', 'hangzhou', '', '310000', '0571', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('214', '12', '12,214,', '2', '宁波', 'ningbo', '', '315000', '0574', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('215', '12', '12,215,', '2', '温州', 'wenzhou', '', '325000', '0577', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('216', '12', '12,216,', '2', '嘉兴', 'jiaxing', '', '314000', '0573', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('217', '12', '12,217,', '2', '湖州', 'huzhou', '', '313000', '0572', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('218', '12', '12,218,', '2', '绍兴', 'shaoxing', '', '312000', '0575', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('219', '12', '12,219,', '2', '金华', 'jinhua', '', '321000', '0579', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('220', '12', '12,220,', '2', '衢州', 'quzhou', '', '324000', '0570', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('221', '12', '12,221,', '2', '舟山', 'zhoushan', '', '316000', '0580', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('222', '12', '12,222,', '2', '台州', 'tz', '', '317700', '0576', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('223', '12', '12,223,', '2', '丽水', 'lishui', '', '323000', '0578', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('224', '13', '13,224,', '2', '合肥', 'hefei', '', '230000', '0551', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('225', '13', '13,225,', '2', '芜湖', 'wuhu', '', '241000', '0553', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('226', '13', '13,226,', '2', '蚌埠', 'bangbu', '', '233000', '0552', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('227', '13', '13,227,', '2', '淮南', 'huainan', '', '232000', '0554', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('228', '13', '13,228,', '2', '马鞍山', 'maanshan', '', '243000', '0555', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('229', '13', '13,229,', '2', '淮北', 'huaibei', '', '235000', '0561', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('230', '13', '13,230,', '2', '铜陵', 'tongling', '', '244000', '0562', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('231', '13', '13,231,', '2', '安庆', 'anqing', '', '246000', '0556', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('232', '13', '13,232,', '2', '黄山', 'huangshan', '', '245000', '0559', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('233', '13', '13,233,', '2', '滁州', 'chuzhou', '', '239000', '0550', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('234', '13', '13,234,', '2', '阜阳', 'fuyang', '', '236000', '0558', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('235', '13', '13,235,', '2', '宿州', 'suzhou', '', '234000', '0557', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('236', '13', '13,236,', '2', '巢湖', 'chaohu', '', '238000', '0565', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('237', '13', '13,237,', '2', '六安', 'luan', '', '237000', '0564', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('238', '13', '13,238,', '2', '亳州', 'haozhou', '', '236800', '0558', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('239', '13', '13,239,', '2', '池州', 'chizhou', '', '247100', '0566', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('240', '13', '13,240,', '2', '宣城', 'xuancheng', '', '242000', '0563', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('241', '14', '14,241,', '2', '福州', 'fz', '', '350000', '0591', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('242', '14', '14,242,', '2', '厦门', 'xiamen', '', '361000', '0592', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('243', '14', '14,243,', '2', '莆田', 'putian', '', '351100', '0594', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('244', '14', '14,244,', '2', '三明', 'sanming', '', '365000', '0598', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('245', '14', '14,245,', '2', '泉州', 'quanzhou', '', '362000', '0595', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('246', '14', '14,246,', '2', '漳州', 'zhangzhou', '', '363000', '0596', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('247', '14', '14,247,', '2', '南平', 'nanping', '', '353000', '0599', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('248', '14', '14,248,', '2', '龙岩', 'longyan', '', '364000', '0597', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('249', '14', '14,249,', '2', '宁德', 'ningde', '', '352000', '0593', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('250', '15', '15,250,', '2', '南昌', 'nanchang', '', '330000', '0791', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('251', '15', '15,251,', '2', '景德镇', 'jingdezhen', '', '333000', '0798', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('252', '15', '15,252,', '2', '萍乡', 'pingxiang', '', '337000', '0799', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('253', '15', '15,253,', '2', '九江', 'jiujiang', '', '332900', '0792', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('254', '15', '15,254,', '2', '新余', 'xinyu', '', '336500', '0790', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('255', '15', '15,255,', '2', '鹰潭', 'yingtan', '', '335000', '0701', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('256', '15', '15,256,', '2', '赣州', 'ganzhou', '', '341000', '0797', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('257', '15', '15,257,', '2', '吉安', 'jian', '', '343000', '0796', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('258', '15', '15,258,', '2', '宜春', 'yichun', '', '336000', '0795', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('259', '15', '15,259,', '2', '抚州', 'fuzhou', '', '344100', '0794', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('260', '15', '15,260,', '2', '上饶', 'shangrao', '', '334000', '0793', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('261', '16', '16,261,', '2', '济南', 'jinan', '', '250000', '0531', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('262', '16', '16,262,', '2', '青岛', 'qingdao', '', '266000', '0532', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('263', '16', '16,263,', '2', '淄博', 'zibo', '', '255100', '0533', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('264', '16', '16,264,', '2', '枣庄', 'zaozhuang', '', '277000', '0632', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('265', '16', '16,265,', '2', '东营', 'dongying', '', '257100', '0546', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('266', '16', '16,266,', '2', '烟台', 'yantai', '', '264000', '0535', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('267', '16', '16,267,', '2', '潍坊', 'weifang', '', '261000', '0536', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('268', '16', '16,268,', '2', '济宁', 'jining', '', '272000', '0537', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('269', '16', '16,269,', '2', '泰安', 'taian', '', '271000', '0538', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('270', '16', '16,270,', '2', '威海', 'weihai', '', '264200', '0631', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('271', '16', '16,271,', '2', '日照', 'rizhao', '', '276800', '0633', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('272', '16', '16,272,', '2', '莱芜', 'laiwu', '', '271100', '0634', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('273', '16', '16,273,', '2', '临沂', 'linyi', '', '276000', '0539', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('274', '16', '16,274,', '2', '德州', 'dezhou', '', '253000', '0534', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('275', '16', '16,275,', '2', '聊城', 'liaocheng', '', '252000', '0635', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('276', '16', '16,276,', '2', '滨州', 'binzhou', '', '256600', '0543', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('277', '16', '16,277,', '2', '荷泽', 'heze', '', '274000', '0530', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('278', '17', '17,278,', '2', '郑州', 'zhengzhou', '', '450000', '0371', '3', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('279', '17', '17,279,', '2', '开封', 'kaifeng', '', '475000', '0378', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('280', '17', '17,280,', '2', '洛阳', 'luoyang', '', '471000', '0379', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('281', '17', '17,281,', '2', '平顶山', 'pingdingshan', '', '467000', '0375', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('282', '17', '17,282,', '2', '安阳', 'anyang', '', '455000', '0372', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('283', '17', '17,283,', '2', '鹤壁', 'hebi', '', '458000', '0392', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('284', '17', '17,284,', '2', '新乡', 'xinxiang', '', '453000', '0373', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('285', '17', '17,285,', '2', '焦作', 'jiaozuo', '', '454150', '0391', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('286', '17', '17,286,', '2', '濮阳', 'yang', '', '457000', '0393', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('287', '17', '17,287,', '2', '许昌', 'xuchang', '', '461000', '0374', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('288', '17', '17,288,', '2', '漯河', 'luohe', '', '462000', '0395', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('289', '17', '17,289,', '2', '三门峡', 'sanmenxia', '', '472000', '0398', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('290', '17', '17,290,', '2', '南阳', 'nanyang', '', '473000', '0377', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('291', '17', '17,291,', '2', '商丘', 'shangqiu', '', '476000', '0370', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('292', '17', '17,292,', '2', '信阳', 'xinyang', '', '464000', '0376', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('293', '17', '17,293,', '2', '周口', 'zhoukou', '', '466000', '0394', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('294', '17', '17,294,', '2', '驻马店', 'zhumadian', '', '463000', '0396', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('295', '18', '18,295,', '2', '武汉', 'wuhan', '', '430010', '027', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('296', '18', '18,296,', '2', '黄石', 'huangshi', '', '435000', '0714', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('297', '18', '18,297,', '2', '十堰', 'shiyan', '', '442000', '0719', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('298', '18', '18,298,', '2', '宜昌', 'yichang', '', '443000', '0717', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('299', '18', '18,299,', '2', '襄樊', 'xiangfan', '', '441000', '0710', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('300', '18', '18,300,', '2', '鄂州', 'ezhou', '', '436000', '0711', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('301', '18', '18,301,', '2', '荆门', 'jingmen', '', '448000', '0724', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('302', '18', '18,302,', '2', '孝感', 'xiaogan', '', '432100', '0712', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('303', '18', '18,303,', '2', '荆州', 'jingzhou', '', '434000', '0716', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('304', '18', '18,304,', '2', '黄冈', 'huanggang', '', '438000', '0713', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('305', '18', '18,305,', '2', '咸宁', 'xianning', '', '437000', '0715', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('306', '18', '18,306,', '2', '随州', 'suizhou', '', '441300', '0722', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('307', '18', '18,307,', '2', '恩施土家族苗族自治州', 'enshitujiazumiaozuzizhizhou', '', '445000', '0718', '0', '13', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('308', '18', '18,308,', '2', '仙桃', 'xiantao', '', '433000', '0728', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('309', '18', '18,309,', '2', '潜江', 'qianjiang', '', '433100', '0728', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('310', '18', '18,310,', '2', '天门', 'tianmen', '', '431700', '0728', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('311', '18', '18,311,', '2', '神农架林区', 'shennongjialinqu', '', '442400', '0719', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('312', '19', '19,312,', '2', '长沙', 'changsha', '', '410000', '0731', '0', '1', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('313', '19', '19,313,', '2', '株洲', 'zhuzhou', '', '412000', '0733', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('314', '19', '19,314,', '2', '湘潭', 'xiangtan', '', '411100', '0732', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('315', '19', '19,315,', '2', '衡阳', 'hengyang', '', '421000', '0734', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('316', '19', '19,316,', '2', '邵阳', 'shaoyang', '', '422000', '0739', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('317', '19', '19,317,', '2', '岳阳', 'yueyang', '', '414000', '0730', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('318', '19', '19,318,', '2', '常德', 'changde', '', '415000', '0736', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('319', '19', '19,319,', '2', '张家界', 'zhangjiajie', '', '427000', '0744', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('320', '19', '19,320,', '2', '益阳', 'yiyang', '', '413000', '0737', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('321', '19', '19,321,', '2', '郴州', 'chenzhou', '', '423000', '0735', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('322', '19', '19,322,', '2', '永州', 'yongzhou', '', '425000', '0746', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('323', '19', '19,323,', '2', '怀化', 'huaihua', '', '418000', '0745', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('324', '19', '19,324,', '2', '娄底', 'loudi', '', '417000', '0738', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('325', '19', '19,325,', '2', '湘西土家族苗族自治州', 'xiangxitujiazumiaozuzizhizhou', '', '416000', '0743', '0', '14', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('326', '20', '20,326,', '2', '广州', 'guangzhou', '', '510100', '020', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('327', '20', '20,327,', '2', '韶关', 'shaoguan', '', '512000', '0751', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('328', '20', '20,328,', '2', '深圳', 'shen', '', '518000', '0755', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('329', '20', '20,329,', '2', '珠海', 'zhuhai', '', '519000', '0756', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('330', '20', '20,330,', '2', '汕头', 'shantou', '', '515000', '0754', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('331', '20', '20,331,', '2', '佛山', 'foshan', '', '528000', '0757', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('332', '20', '20,332,', '2', '江门', 'jiangmen', '', '529000', '0750', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('333', '20', '20,333,', '2', '湛江', 'zhanjiang', '', '524000', '0759', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('334', '20', '20,334,', '2', '茂名', 'maoming', '', '525000', '0668', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('335', '20', '20,335,', '2', '肇庆', 'zhaoqing', '', '526000', '0758', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('336', '20', '20,336,', '2', '惠州', 'huizhou', '', '516000', '0752', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('337', '20', '20,337,', '2', '梅州', 'meizhou', '', '514000', '0753', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('338', '20', '20,338,', '2', '汕尾', 'shanwei', '', '516600', '0660', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('339', '20', '20,339,', '2', '河源', 'heyuan', '', '517000', '0762', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('340', '20', '20,340,', '2', '阳江', 'yangjiang', '', '529500', '0662', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('341', '20', '20,341,', '2', '清远', 'qingyuan', '', '511500', '0763', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('342', '20', '20,342,', '2', '东莞', 'dong', '', '523000', '0769', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('343', '20', '20,343,', '2', '中山', 'zhongshan', '', '528400', '0760', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('344', '20', '20,344,', '2', '潮州', 'chaozhou', '', '521000', '0768', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('345', '20', '20,345,', '2', '揭阳', 'jieyang', '', '522000', '0663', '0', '20', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('346', '20', '20,346,', '2', '云浮', 'yunfu', '', '527300', '0766', '0', '21', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('347', '21', '21,347,', '2', '南宁', 'nanning', '', '530000', '0771', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('348', '21', '21,348,', '2', '柳州', 'liuzhou', '', '545000', '0772', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('349', '21', '21,349,', '2', '桂林', 'guilin', '', '541000', '0773', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('350', '21', '21,350,', '2', '梧州', 'wuzhou', '', '543000', '0774', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('351', '21', '21,351,', '2', '北海', 'beihai', '', '536000', '0779', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('352', '21', '21,352,', '2', '防城港', 'fangchenggang', '', '538000', '0770', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('353', '21', '21,353,', '2', '钦州', 'qinzhou', '', '535000', '0777', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('354', '21', '21,354,', '2', '贵港', 'guigang', '', '537100', '0775', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('355', '21', '21,355,', '2', '玉林', 'yl', '', '537000', '0775', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('356', '21', '21,356,', '2', '百色', 'baise', '', '533000', '0776', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('357', '21', '21,357,', '2', '贺州', 'hezhou', '', '542800', '0774', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('358', '21', '21,358,', '2', '河池', 'hechi', '', '547000', '0778', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('359', '21', '21,359,', '2', '来宾', 'laibin', '', '546100', '0772', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('360', '21', '21,360,', '2', '崇左', 'chongzuo', '', '532200', '0771', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('361', '22', '22,361,', '2', '海口', 'haikou', '', '570100', '0898', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('362', '22', '22,362,', '2', '三亚', 'sanya', '', '572000', '0898', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('363', '22', '22,363,', '2', '五指山', 'wuzhishan', '', '572200', '0898', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('364', '22', '22,364,', '2', '琼海', 'qionghai', '', '571400', '0898', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('365', '22', '22,365,', '2', '儋州', 'danzhou', '', '571700', '0898', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('366', '22', '22,366,', '2', '文昌', 'wenchang', '', '571300', '0898', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('367', '22', '22,367,', '2', '万宁', 'wanning', '', '571500', '0898', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('368', '22', '22,368,', '2', '东方', 'dongfang', '', '572600', '0898', '0', '8', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('369', '22', '22,369,', '2', '定安县', 'dinganxian', '', '571200', '0898', '0', '9', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('370', '22', '22,370,', '2', '屯昌县', 'tunchangxian', '', '571600', '0898', '0', '10', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('371', '22', '22,371,', '2', '澄迈县', 'chengmaixian', '', '571900', '0898', '0', '11', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('372', '22', '22,372,', '2', '临高县', 'lingaoxian', '', '571800', '0898', '0', '12', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('373', '22', '22,373,', '2', '白沙黎族自治县', 'baishalizuzizhixian', '', '572800', '0898', '0', '13', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('374', '22', '22,374,', '2', '昌江黎族自治县', 'changjianglizuzizhixian', '', '572700', '0898', '0', '14', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('375', '22', '22,375,', '2', '乐东黎族自治县', 'ledonglizuzizhixian', '', '572500', '0898', '0', '15', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('376', '22', '22,376,', '2', '陵水黎族自治县', 'lingshuilizuzizhixian', '', '572400', '0898', '0', '16', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('377', '22', '22,377,', '2', '保亭黎族苗族自治县', 'baotinglizumiaozuzizhixian', '', '572300', '0898', '0', '17', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('378', '22', '22,378,', '2', '琼中黎族苗族自治县', 'qiongzhonglizumiaozuzizhixian', '', '572900', '0898', '0', '18', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('379', '22', '22,379,', '2', '西沙群岛', 'xishaqundao', '', '572000', '0898', '0', '19', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('380', '22', '22,380,', '2', '南沙群岛', 'nanshaqundao', '', '572000', '0898', '0', '20', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('381', '22', '22,381,', '2', '中沙群岛的岛礁及其海域', 'zhongshaqundaodedaojiaojiqihai', '', '572000', '0898', '0', '21', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('382', '23', '23,382,', '2', '成都', 'chengdu', '', '610000', '028', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('383', '23', '23,383,', '2', '自贡', 'zigong', '', '643000', '0813', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('384', '23', '23,384,', '2', '攀枝花', 'panzhihua', '', '617000', '0812', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('385', '23', '23,385,', '2', '泸州', 'luzhou', '', '646000', '0830', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('386', '23', '23,386,', '2', '德阳', 'deyang', '', '618000', '0838', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('387', '23', '23,387,', '2', '绵阳', 'mianyang', '', '621000', '0816', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('388', '23', '23,388,', '2', '广元', 'guangyuan', '', '628000', '0839', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('389', '23', '23,389,', '2', '遂宁', 'suining', '', '629000', '0825', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('390', '23', '23,390,', '2', '内江', 'neijiang', '', '641000', '0832', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('391', '23', '23,391,', '2', '乐山', 'leshan', '', '614000', '0833', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('392', '23', '23,392,', '2', '南充', 'nanchong', '', '637000', '0817', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('393', '23', '23,393,', '2', '眉山', 'meishan', '', '620000', '0833', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('394', '23', '23,394,', '2', '宜宾', 'yibin', '', '644000', '0831', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('395', '23', '23,395,', '2', '广安', 'guangan', '', '638500', '0826', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('396', '23', '23,396,', '2', '达州', 'dazhou', '', '635000', '0818', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('397', '23', '23,397,', '2', '雅安', 'yaan', '', '625000', '0835', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('398', '23', '23,398,', '2', '巴中', 'bazhong', '', '636600', '0827', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('399', '23', '23,399,', '2', '资阳', 'ziyang', '', '641300', '0832', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('400', '23', '23,400,', '2', '阿坝藏族羌族自治州', 'abacangzuqiangzu', '', '623000', '0837', '0', '19', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('401', '23', '23,401,', '2', '甘孜藏族自治州', 'ganzicangzu', '', '626000', '0836', '0', '20', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('402', '23', '23,402,', '2', '凉山彝族自治州', 'liangshanyizu', '', '615000', '0834', '0', '21', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('403', '24', '24,403,', '2', '贵阳', 'guiyang', '', '550000', '0851', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('404', '24', '24,404,', '2', '六盘水', 'liupanshui', '', '553000', '0858', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('405', '24', '24,405,', '2', '遵义', 'zunyi', '', '563000', '0852', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('406', '24', '24,406,', '2', '安顺', 'anshun', '', '561000', '0853', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('407', '24', '24,407,', '2', '铜仁地区', 'tongrendiqu', '', '554300', '0856', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('408', '24', '24,408,', '2', '黔西南布依族苗族自治州', 'qianxinanbuyizumiaozu', '', '562400', '0859', '0', '6', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('409', '24', '24,409,', '2', '毕节地区', 'bijiediqu', '', '551700', '0857', '0', '7', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('410', '24', '24,410,', '2', '黔东南苗族侗族自治州', 'qiandongnanmiaozudongzu', '', '556000', '0855', '0', '8', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('411', '24', '24,411,', '2', '黔南布依族苗族自治州', 'qiannanbuyizumiaozu', '', '558000', '0854', '0', '9', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('412', '25', '25,412,', '2', '昆明', 'kunming', '', '650000', '0871', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('413', '25', '25,413,', '2', '曲靖', 'qujing', '', '655000', '0874', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('414', '25', '25,414,', '2', '玉溪', 'yuxi', '', '653100', '0877', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('415', '25', '25,415,', '2', '保山', 'baoshan', '', '678000', '0875', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('416', '25', '25,416,', '2', '昭通', 'zhaotong', '', '657000', '0870', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('417', '25', '25,417,', '2', '丽江', 'lijiang', '', '674100', '0888', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('418', '25', '25,418,', '2', '思茅', 'simao', '', '665000', '0879', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('419', '25', '25,419,', '2', '临沧', 'lincang', '', '677000', '0883', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('420', '25', '25,420,', '2', '楚雄彝族自治州', 'chuxiongyizu', '', '677400', '0883', '0', '9', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('421', '25', '25,421,', '2', '红河哈尼族彝族自治州', 'honghehanizuyizu', '', '661000', '0873', '0', '10', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('422', '25', '25,422,', '2', '文山壮族苗族自治州', 'wenshanzhuangzumiaozu', '', '663000', '0876', '0', '11', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('423', '25', '25,423,', '2', '西双版纳傣族自治州', 'xishuangbannadaizu', '', '666100', '0691', '0', '12', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('424', '25', '25,424,', '2', '大理白族自治州', 'dalibaizu', '', '671000', '0872', '0', '13', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('425', '25', '25,425,', '2', '德宏傣族景颇族自治州', 'dehongdaizujingpozu', '', '678600', '0692', '0', '14', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('426', '25', '25,426,', '2', '怒江傈僳族自治州', 'nujianglisuzu', '', '673200', '0886', '0', '15', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('427', '25', '25,427,', '2', '迪庆藏族自治州', 'diqingcangzu', '', '674400', '0887', '0', '16', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('428', '26', '26,428,', '2', '拉萨', 'lasa', '', '850000', '0891', '0', '1', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('429', '26', '26,429,', '2', '昌都地区', 'changdudiqu', '', '854000', '0895', '0', '2', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('430', '26', '26,430,', '2', '山南地区', 'shannandiqu', '', '856100', '0893', '0', '3', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('431', '26', '26,431,', '2', '日喀则地区', 'rikazediqu', '', '857000', '0892', '0', '4', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('432', '26', '26,432,', '2', '那曲地区', 'naqudiqu', '', '852000', '0896', '0', '5', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('433', '26', '26,433,', '2', '阿里地区', 'alidiqu', '', '859500', '08060', '0', '6', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('434', '26', '26,434,', '2', '林芝地区', 'linzhidiqu', '', '860100', '0894', '0', '7', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('435', '27', '27,435,', '2', '西安', 'xian', '', '710000', '029', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('436', '27', '27,436,', '2', '铜川', 'tongchuan', '', '727000', '0919', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('437', '27', '27,437,', '2', '宝鸡', 'baoji', '', '721000', '0917', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('438', '27', '27,438,', '2', '咸阳', 'xianyang', '', '712000', '0910', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('439', '27', '27,439,', '2', '渭南', 'weinan', '', '714000', '0913', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('440', '27', '27,440,', '2', '延安', 'yanan', '', '716000', '0911', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('441', '27', '27,441,', '2', '汉中', 'hanzhong', '', '723000', '0916', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('442', '27', '27,442,', '2', '榆林', 'yulin', '', '719000', '0912', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('443', '27', '27,443,', '2', '安康', 'ankang', '', '725000', '0915', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('444', '27', '27,444,', '2', '商洛', 'shangluo', '', '726000', '0914', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('445', '28', '28,445,', '2', '兰州', 'lanzhou', '', '730030', '0931', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('446', '28', '28,446,', '2', '嘉峪关', 'jiayuguan', '', '735100', '0937', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('447', '28', '28,447,', '2', '金昌', 'jinchang', '', '737100', '0935', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('448', '28', '28,448,', '2', '白银', 'baiyin', '', '730900', '0943', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('449', '28', '28,449,', '2', '天水', 'tianshui', '', '741000', '0938', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('450', '28', '28,450,', '2', '武威', 'wuwei', '', '733000', '0935', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('451', '28', '28,451,', '2', '张掖', 'zhangye', '', '734000', '0936', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('452', '28', '28,452,', '2', '平凉', 'pingliang', '', '744000', '0933', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('453', '28', '28,453,', '2', '酒泉', 'jiuquan', '', '735000', '0937', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('454', '28', '28,454,', '2', '庆阳', 'qingyang', '', '745000', '0934', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('455', '28', '28,455,', '2', '定西', 'dingxi', '', '743000', '0932', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('456', '28', '28,456,', '2', '陇南', 'longnan', '', '746000', '0939', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('457', '28', '28,457,', '2', '临夏回族自治州', 'linxiahuizuzizhizhou', '', '731100', '0930', '0', '13', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('458', '28', '28,458,', '2', '甘南藏族自治州', 'gannancangzu', '', '747000', '0941', '0', '14', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('459', '29', '29,459,', '2', '西宁', 'xining', '', '810000', '0971', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('460', '29', '29,460,', '2', '海东地区', 'haidongdiqu', '', '810600', '0972', '0', '2', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('461', '29', '29,461,', '2', '海北藏族自治州', 'haibeicangzu', '', '810300', '0978', '0', '3', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('462', '29', '29,462,', '2', '黄南藏族自治州', 'huangnancangzu', '', '811300', '0973', '0', '4', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('463', '29', '29,463,', '2', '海南藏族自治州', 'hainancangzu', '', '813000', '0974', '0', '5', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('464', '29', '29,464,', '2', '果洛藏族自治州', 'guoluocangzu', '', '814000', '0975', '0', '6', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('465', '29', '29,465,', '2', '玉树藏族自治州', 'yushucangzu', '', '815000', '0976', '0', '7', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('466', '29', '29,466,', '2', '海西蒙古族藏族自治州', 'haiximengguzucangzu', '', '816000', '0977', '0', '8', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('467', '30', '30,467,', '2', '银川', 'yinchuan', '', '750000', '0951', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('468', '30', '30,468,', '2', '石嘴山', 'shizuishan', '', '753000', '0952', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('469', '30', '30,469,', '2', '吴忠', 'wuzhong', '', '751100', '0953', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('470', '30', '30,470,', '2', '固原', 'guyuan', '', '756000', '0954', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('471', '30', '30,471,', '2', '中卫', 'zhongwei', '', '755000', '0953', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('472', '31', '31,472,', '2', '乌鲁木齐', 'wulumuqi', '', '830000', '0991', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('473', '31', '31,473,', '2', '克拉玛依', 'kelamayi', '', '834000', '0990', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('474', '31', '31,474,', '2', '吐鲁番地区', 'tulufandiqu', '', '838000', '0995', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('475', '31', '31,475,', '2', '哈密地区', 'hamidiqu', '', '839000', '0902', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('476', '31', '31,476,', '2', '昌吉回族自治州', 'changjihuizu', '', '831100', '0994', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('477', '31', '31,477,', '2', '博尔塔拉蒙古自治州', 'boertalamenggu', '', '833400', '0909', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('478', '31', '31,478,', '2', '巴音郭楞蒙古自治州', 'bayinguolengmenggu', '', '841000', '0996', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('479', '31', '31,479,', '2', '阿克苏地区', 'akesudiqu', '', '843000', '0997', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('480', '31', '31,480,', '2', '克孜勒苏柯尔克孜自治州', 'kezilesukeerkezi', '', '845350', '0908', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('481', '31', '31,481,', '2', '喀什地区', 'kashidiqu', '', '844000', '0998', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('482', '31', '31,482,', '2', '和田地区', 'hetiandiqu', '', '848000', '0903', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('483', '31', '31,483,', '2', '伊犁哈萨克自治州', 'yilihasake', '', '835000', '0999', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('484', '31', '31,484,', '2', '塔城地区', 'tachengdiqu', '', '834300', '0901', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('485', '31', '31,485,', '2', '阿勒泰地区', 'aletaidiqu', '', '836500', '0906', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('486', '31', '31,486,', '2', '石河子', 'shihezi', '', '832000', '0993', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('487', '31', '31,487,', '2', '阿拉尔', 'alaer', '', '843300', '0997', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('488', '31', '31,488,', '2', '图木舒克', 'tumushuke', '', '844000', '0998', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('489', '31', '31,489,', '2', '五家渠', 'wujiaqu', '', '831300', '0994', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('490', '32', '32,490,', '2', '台北', 'taibei', '', '999079', '00886', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('491', '32', '32,491,', '2', '高雄', 'gaoxiong', '', '999079', '00886', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('492', '32', '32,492,', '2', '基隆', 'jilong', '', '999079', '00886', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('493', '32', '32,493,', '2', '新竹', 'xinzhu', '', '999079', '00886', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('494', '32', '32,494,', '2', '台中', 'taizhong', '', '999079', '00886', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('495', '32', '32,495,', '2', '嘉义', 'jiayi', '', '999079', '00886', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('496', '32', '32,496,', '2', '台南', 'tainan', '', '999079', '00886', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('497', '32', '32,497,', '2', '台北县', 'taibeixian', '', '999079', '00886', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('498', '32', '32,498,', '2', '桃园县', 'taoyuanxian', '', '999079', '00886', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('499', '32', '32,499,', '2', '新竹县', 'xinzhuxian', '', '999079', '00886', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('500', '32', '32,500,', '2', '苗栗县', 'miaolixian', '', '999079', '00886', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('501', '32', '32,501,', '2', '台中县', 'taizhongxian', '', '999079', '00886', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('502', '32', '32,502,', '2', '彰化县', 'zhanghuaxian', '', '999079', '00886', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('503', '32', '32,503,', '2', '南投县', 'nantouxian', '', '999079', '00886', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('504', '32', '32,504,', '2', '云林县', 'yunlinxian', '', '999079', '00886', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('505', '32', '32,505,', '2', '嘉义县', 'jiayixian', '', '999079', '00886', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('506', '32', '32,506,', '2', '台南县', 'tainanxian', '', '999079', '00886', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('507', '32', '32,507,', '2', '高雄县', 'gaoxiongxian', '', '999079', '00886', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('508', '32', '32,508,', '2', '屏东县', 'pingdongxian', '', '999079', '00886', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('509', '32', '32,509,', '2', '宜兰县', 'yilanxian', '', '999079', '00886', '0', '20', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('510', '32', '32,510,', '2', '花莲县', 'hualianxian', '', '999079', '00886', '0', '21', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('511', '32', '32,511,', '2', '台东县', 'taidongxian', '', '999079', '00886', '0', '22', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('512', '32', '32,512,', '2', '澎湖县', 'penghuxian', '', '999079', '00886', '0', '23', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('513', '32', '32,513,', '2', '金门县', 'jinmenxian', '', '999079', '00886', '0', '24', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('514', '32', '32,514,', '2', '连江县', 'lianjiangxian', '', '999079', '00886', '0', '25', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('515', '33', '33,515,', '2', '中西区', 'zhongxiqu', '', '999077', '00852', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('516', '33', '33,516,', '2', '东区', 'dongqu', '', '999077', '00852', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('517', '33', '33,517,', '2', '南区', 'nanqu', '', '999077', '00852', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('518', '33', '33,518,', '2', '湾仔区', 'wanziqu', '', '999077', '00852', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('519', '33', '33,519,', '2', '九龙城区', 'jiulongchengqu', '', '999077', '00852', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('520', '33', '33,520,', '2', '观塘区', 'guantangqu', '', '999077', '00852', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('521', '33', '33,521,', '2', '深水埗区', 'shenshui', '', '999077', '00852', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('522', '33', '33,522,', '2', '黄大仙区', 'huangdaxianqu', '', '999077', '00852', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('523', '33', '33,523,', '2', '油尖旺区', 'youjianwangqu', '', '999077', '00852', '0', '9', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('524', '33', '33,524,', '2', '离岛区', 'lidaoqu', '', '999077', '00852', '0', '10', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('525', '33', '33,525,', '2', '葵青区', 'kuiqingqu', '', '999077', '00852', '0', '11', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('526', '33', '33,526,', '2', '北区', 'xgbq', '', '999077', '00852', '0', '12', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('527', '33', '33,527,', '2', '西贡区', 'xigongqu', '', '999077', '00852', '0', '13', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('528', '33', '33,528,', '2', '沙田区', 'shatianqu', '', '999077', '00852', '0', '14', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('529', '33', '33,529,', '2', '大埔区', 'dapuqu', '', '999077', '00852', '0', '15', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('530', '33', '33,530,', '2', '荃湾区', 'wanqu', '', '999077', '00852', '0', '16', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('531', '33', '33,531,', '2', '屯门区', 'tunmenqu', '', '999077', '00852', '0', '17', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('532', '33', '33,532,', '2', '元朗区', 'yuanlangqu', '', '999077', '00852', '0', '18', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('533', '34', '34,533,', '2', '澳门花地玛堂区', 'aomenhuadimatangqu', '', '999078', '00853', '0', '1', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('534', '34', '34,534,', '2', '澳门圣安多尼堂区', 'aomenshenganduonitangqu', '', '999078', '00853', '0', '2', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('535', '34', '34,535,', '2', '澳门大堂区', 'aomendatangqu', '', '999078', '00853', '0', '3', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('536', '34', '34,536,', '2', '澳门望德堂区', 'aomenwangdetangqu', '', '999078', '00853', '0', '4', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('537', '34', '34,537,', '2', '澳门风顺堂区', 'aomenfengshuntangqu', '', '999078', '00853', '0', '5', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('538', '34', '34,538,', '2', '海岛嘉模堂区', 'haidaojiamotangqu', '', '999078', '00853', '0', '6', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('539', '34', '34,539,', '2', '海岛圣方济各堂区', 'haidaoshengfangjigetangqu', '', '999078', '00853', '0', '7', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('540', '130', '5,130,540,', '3', '长安区', 'changanqu', '', '050000', '0311', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('541', '130', '5,130,541,', '3', '桥东区', 'sjzqdq', '', '050000', '0311', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('542', '130', '5,130,542,', '3', '桥西区', 'sjzqxq', '', '050000', '0311', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('543', '130', '5,130,543,', '3', '新华区', 'xinhuaqu', '', '050000', '0311', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('544', '130', '5,130,544,', '3', '井陉矿区', 'jingkuangqu', '', '050100', '0311', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('545', '130', '5,130,545,', '3', '裕华区', 'yuhuaqu', '', '050000', '0311', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('546', '130', '5,130,546,', '3', '井陉县', 'jingxian', '', '050300', '0311', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('547', '130', '5,130,547,', '3', '正定县', 'zhengdingxian', '', '050800', '0311', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('548', '130', '5,130,548,', '3', '栾城县', 'chengxian', '', '051430', '0311', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('549', '130', '5,130,549,', '3', '行唐县', 'xingtangxian', '', '050600', '0311', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('550', '130', '5,130,550,', '3', '灵寿县', 'lingshouxian', '', '050500', '0311', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('551', '130', '5,130,551,', '3', '高邑县', 'gaoyixian', '', '051330', '0311', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('552', '130', '5,130,552,', '3', '深泽县', 'shenzexian', '', '052500', '0311', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('553', '130', '5,130,553,', '3', '赞皇县', 'zanhuangxian', '', '051230', '0311', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('554', '130', '5,130,554,', '3', '无极县', 'wujixian', '', '052400', '0311', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('555', '130', '5,130,555,', '3', '平山县', 'pingshanxian', '', '050400', '0311', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('556', '130', '5,130,556,', '3', '元氏县', 'yuanshixian', '', '051130', '0311', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('557', '130', '5,130,557,', '3', '赵县', 'zhaoxian', '', '051530', '0311', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('558', '130', '5,130,558,', '3', '辛集', 'xinji', '', '052300', '0311', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('559', '130', '5,130,559,', '3', '藁城', 'cheng', '', '052160', '0311', '0', '20', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('560', '130', '5,130,560,', '3', '晋州', 'jz', '', '052200', '0311', '0', '21', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('561', '130', '5,130,561,', '3', '新乐', 'xinle', '', '050700', '0311', '0', '22', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('562', '130', '5,130,562,', '3', '鹿泉', 'luquan', '', '050200', '0311', '0', '23', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('563', '131', '5,131,563,', '3', '路南区', 'lunanqu', '', '063000', '0315', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('564', '131', '5,131,564,', '3', '路北区', 'lubeiqu', '', '063000', '0315', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('565', '131', '5,131,565,', '3', '古冶区', 'guyequ', '', '063100', '0315', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('566', '131', '5,131,566,', '3', '开平区', 'kaipingqu', '', '063000', '0315', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('567', '131', '5,131,567,', '3', '丰南区', 'fengnanqu', '', '063300', '0315', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('568', '131', '5,131,568,', '3', '丰润区', 'fengrunqu', '', '063000', '0315', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('569', '131', '5,131,569,', '3', '滦县', 'luanxian', '', '063700', '0315', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('570', '131', '5,131,570,', '3', '滦南县', 'luannanxian', '', '063500', '0315', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('571', '131', '5,131,571,', '3', '乐亭县', 'letingxian', '', '063600', '0315', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('572', '131', '5,131,572,', '3', '迁西县', 'qianxixian', '', '064300', '0315', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('573', '131', '5,131,573,', '3', '玉田县', 'yutianxian', '', '064100', '0315', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('574', '131', '5,131,574,', '3', '唐海县', 'tanghaixian', '', '063200', '0315', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('575', '131', '5,131,575,', '3', '遵化', 'zunhua', '', '064200', '0315', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('576', '131', '5,131,576,', '3', '迁安', 'qianan', '', '064400', '0315', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('577', '132', '5,132,577,', '3', '海港区', 'haigangqu', '', '066000', '0335', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('578', '132', '5,132,578,', '3', '山海关区', 'shanhaiguanqu', '', '066200', '0335', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('579', '132', '5,132,579,', '3', '北戴河区', 'beidaihequ', '', '066300', '0335', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('580', '132', '5,132,580,', '3', '青龙满族自治县', 'qinglongmanzu', '', '066500', '0335', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('581', '132', '5,132,581,', '3', '昌黎县', 'changlixian', '', '066600', '0335', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('582', '132', '5,132,582,', '3', '抚宁县', 'funingxian', '', '066300', '0335', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('583', '132', '5,132,583,', '3', '卢龙县', 'lulongxian', '', '066400', '0335', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('584', '133', '5,133,584,', '3', '邯山区', 'hanshanqu', '', '056000', '0310', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('585', '133', '5,133,585,', '3', '丛台区', 'congtaiqu', '', '056000', '0310', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('586', '133', '5,133,586,', '3', '复兴区', 'fuxingqu', '', '056000', '0310', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('587', '133', '5,133,587,', '3', '峰峰矿区', 'fengfengkuangqu', '', '056200', '0310', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('588', '133', '5,133,588,', '3', '邯郸县', 'handanxian', '', '056000', '0310', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('589', '133', '5,133,589,', '3', '临漳县', 'linzhangxian', '', '056600', '0310', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('590', '133', '5,133,590,', '3', '成安县', 'chenganxian', '', '056700', '0310', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('591', '133', '5,133,591,', '3', '大名县', 'damingxian', '', '056900', '0310', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('592', '133', '5,133,592,', '3', '涉县', 'shexian', '', '056400', '0310', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('593', '133', '5,133,593,', '3', '磁县', 'cixian', '', '056500', '0310', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('594', '133', '5,133,594,', '3', '肥乡县', 'feixiangxian', '', '057550', '0310', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('595', '133', '5,133,595,', '3', '永年县', 'yongnianxian', '', '057150', '0310', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('596', '133', '5,133,596,', '3', '邱县', 'qiuxian', '', '057450', '0310', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('597', '133', '5,133,597,', '3', '鸡泽县', 'jizexian', '', '057350', '0310', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('598', '133', '5,133,598,', '3', '广平县', 'guangpingxian', '', '057650', '0310', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('599', '133', '5,133,599,', '3', '馆陶县', 'guantaoxian', '', '057750', '0310', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('600', '133', '5,133,600,', '3', '魏县', 'hdwx', '', '056800', '0310', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('601', '133', '5,133,601,', '3', '曲周县', 'quzhouxian', '', '057250', '0310', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('602', '133', '5,133,602,', '3', '武安', 'wuan', '', '056300', '0310', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('603', '134', '5,134,603,', '3', '桥东区', 'xtqdq', '', '054000', '0319', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('604', '134', '5,134,604,', '3', '桥西区', 'xtqxq', '', '054000', '0319', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('605', '134', '5,134,605,', '3', '邢台县', 'xingtaixian', '', '054000', '0319', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('606', '134', '5,134,606,', '3', '临城县', 'linchengxian', '', '054300', '0319', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('607', '134', '5,134,607,', '3', '内丘县', 'neiqiuxian', '', '054200', '0319', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('608', '134', '5,134,608,', '3', '柏乡县', 'baixiangxian', '', '055450', '0319', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('609', '134', '5,134,609,', '3', '隆尧县', 'longyaoxian', '', '055350', '0319', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('610', '134', '5,134,610,', '3', '任县', 'renxian', '', '055150', '0319', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('611', '134', '5,134,611,', '3', '南和县', 'nanhexian', '', '054400', '0319', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('612', '134', '5,134,612,', '3', '宁晋县', 'ningjinxian', '', '055550', '0319', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('613', '134', '5,134,613,', '3', '巨鹿县', 'juluxian', '', '055250', '0319', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('614', '134', '5,134,614,', '3', '新河县', 'xinhexian', '', '051730', '0319', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('615', '134', '5,134,615,', '3', '广宗县', 'guangzongxian', '', '054600', '0319', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('616', '134', '5,134,616,', '3', '平乡县', 'pingxiangxian', '', '054500', '0319', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('617', '134', '5,134,617,', '3', '威县', 'xtwx', '', '054700', '0319', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('618', '134', '5,134,618,', '3', '清河县', 'qinghexian', '', '054800', '0319', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('619', '134', '5,134,619,', '3', '临西县', 'linxixian', '', '054900', '0319', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('620', '134', '5,134,620,', '3', '南宫', 'nangong', '', '051800', '0319', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('621', '134', '5,134,621,', '3', '沙河', 'shahe', '', '054100', '0319', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('622', '135', '5,135,622,', '3', '新区', 'xinqu', '', '071000', '0312', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('623', '135', '5,135,623,', '3', '北区', 'bdbq', '', '071000', '0312', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('624', '135', '5,135,624,', '3', '南区', 'bdnq', '', '071000', '0312', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('625', '135', '5,135,625,', '3', '满城县', 'manchengxian', '', '072150', '0312', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('626', '135', '5,135,626,', '3', '清苑县', 'qingyuanxian', '', '071100', '0312', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('627', '135', '5,135,627,', '3', '涞水县', 'shuixian', '', '074100', '0312', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('628', '135', '5,135,628,', '3', '阜平县', 'fupingxian', '', '073200', '0312', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('629', '135', '5,135,629,', '3', '徐水县', 'xushuixian', '', '072550', '0312', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('630', '135', '5,135,630,', '3', '定兴县', 'dingxingxian', '', '072650', '0312', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('631', '135', '5,135,631,', '3', '唐县', 'tangxian', '', '072350', '0312', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('632', '135', '5,135,632,', '3', '高阳县', 'gaoyangxian', '', '071500', '0312', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('633', '135', '5,135,633,', '3', '容城县', 'rongchengxian', '', '071700', '0312', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('634', '135', '5,135,634,', '3', '涞源县', 'yuanxian', '', '102900', '0312', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('635', '135', '5,135,635,', '3', '望都县', 'wangduxian', '', '072450', '0312', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('636', '135', '5,135,636,', '3', '安新县', 'anxinxian', '', '071600', '0312', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('637', '135', '5,135,637,', '3', '易县', 'yixian', '', '074200', '0312', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('638', '135', '5,135,638,', '3', '曲阳县', 'quyangxian', '', '073100', '0312', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('639', '135', '5,135,639,', '3', '蠡县', 'lixian', '', '071400', '0312', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('640', '135', '5,135,640,', '3', '顺平县', 'shunpingxian', '', '072250', '0312', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('641', '135', '5,135,641,', '3', '博野县', 'boyexian', '', '071300', '0312', '0', '20', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('642', '135', '5,135,642,', '3', '雄县', 'xiongxian', '', '071800', '0312', '0', '21', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('643', '135', '5,135,643,', '3', '涿州', 'zhuozhou', '', '072750', '0312', '0', '22', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('644', '135', '5,135,644,', '3', '定州', 'dingzhou', '', '073000', '0312', '0', '23', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('645', '135', '5,135,645,', '3', '安国', 'anguo', '', '071200', '0312', '0', '24', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('646', '135', '5,135,646,', '3', '高碑店', 'gaobeidian', '', '074000', '0312', '0', '25', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('647', '136', '5,136,647,', '3', '桥东区', 'zjkqdq', '', '075000', '0313', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('648', '136', '5,136,648,', '3', '桥西区', 'zjkqxq', '', '075000', '0313', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('649', '136', '5,136,649,', '3', '宣化区', 'xuanhuaqu', '', '075000', '0313', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('650', '136', '5,136,650,', '3', '下花园区', 'xiahuayuanqu', '', '075300', '0313', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('651', '136', '5,136,651,', '3', '宣化县', 'xuanhuaxian', '', '075100', '0313', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('652', '136', '5,136,652,', '3', '张北县', 'zhangbeixian', '', '076450', '0313', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('653', '136', '5,136,653,', '3', '康保县', 'kangbaoxian', '', '076650', '0313', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('654', '136', '5,136,654,', '3', '沽源县', 'guyuanxian', '', '076550', '0313', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('655', '136', '5,136,655,', '3', '尚义县', 'shangyixian', '', '076750', '0313', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('656', '136', '5,136,656,', '3', '蔚县', 'zjkwx', '', '075700', '0313', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('657', '136', '5,136,657,', '3', '阳原县', 'yangyuanxian', '', '075800', '0313', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('658', '136', '5,136,658,', '3', '怀安县', 'huaianxian', '', '076150', '0313', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('659', '136', '5,136,659,', '3', '万全县', 'wanquanxian', '', '076250', '0313', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('660', '136', '5,136,660,', '3', '怀来县', 'huailaixian', '', '075400', '0313', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('661', '136', '5,136,661,', '3', '涿鹿县', 'luxian', '', '075600', '0313', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('662', '136', '5,136,662,', '3', '赤城县', 'chichengxian', '', '075500', '0313', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('663', '136', '5,136,663,', '3', '崇礼县', 'chonglixian', '', '076350', '0313', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('664', '137', '5,137,664,', '3', '双桥区', 'shuangqiaoqu', '', '067000', '0314', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('665', '137', '5,137,665,', '3', '双滦区', 'shuangluanqu', '', '067000', '0314', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('666', '137', '5,137,666,', '3', '鹰手营子矿区', 'yingshouyingzikuangqu', '', '067200', '0314', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('667', '137', '5,137,667,', '3', '承德县', 'chengdexian', '', '067400', '0314', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('668', '137', '5,137,668,', '3', '兴隆县', 'xinglongxian', '', '067300', '0314', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('669', '137', '5,137,669,', '3', '平泉县', 'pingquanxian', '', '067500', '0314', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('670', '137', '5,137,670,', '3', '滦平县', 'luanpingxian', '', '068250', '0314', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('671', '137', '5,137,671,', '3', '隆化县', 'longhuaxian', '', '068150', '0314', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('672', '137', '5,137,672,', '3', '丰宁满族自治县', 'fengningmanzu', '', '068350', '0314', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('673', '137', '5,137,673,', '3', '宽城满族自治县', 'kuanchengmanzu', '', '067600', '0314', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('674', '137', '5,137,674,', '3', '围场满族蒙古族自治县', 'weichangmanzumengguzu', '', '068450', '0314', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('675', '138', '5,138,675,', '3', '新华区', 'xinhuaqu', '', '061000', '0317', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('676', '138', '5,138,676,', '3', '运河区', 'yunhequ', '', '061000', '0317', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('677', '138', '5,138,677,', '3', '沧县', 'cangxian', '', '061000', '0317', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('678', '138', '5,138,678,', '3', '青县', 'qingxian', '', '062650', '0317', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('679', '138', '5,138,679,', '3', '东光县', 'dongguangxian', '', '061600', '0317', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('680', '138', '5,138,680,', '3', '海兴县', 'haixingxian', '', '061200', '0317', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('681', '138', '5,138,681,', '3', '盐山县', 'yanshanxian', '', '061300', '0317', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('682', '138', '5,138,682,', '3', '肃宁县', 'suningxian', '', '062350', '0317', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('683', '138', '5,138,683,', '3', '南皮县', 'nanpixian', '', '061500', '0317', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('684', '138', '5,138,684,', '3', '吴桥县', 'wuqiaoxian', '', '061800', '0317', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('685', '138', '5,138,685,', '3', '献县', 'xianxian', '', '062250', '0317', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('686', '138', '5,138,686,', '3', '孟村回族自治县', 'mengcunhuizu', '', '061400', '0317', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('687', '138', '5,138,687,', '3', '泊头', 'botou', '', '062150', '0317', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('688', '138', '5,138,688,', '3', '任丘', 'renqiu', '', '062550', '0317', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('689', '138', '5,138,689,', '3', '黄骅', 'huang', '', '061100', '0317', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('690', '138', '5,138,690,', '3', '河间', 'hejian', '', '062450', '0317', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('691', '139', '5,139,691,', '3', '安次区', 'anciqu', '', '065000', '0316', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('692', '139', '5,139,692,', '3', '广阳区', 'guangyangqu', '', '065000', '0316', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('693', '139', '5,139,693,', '3', '固安县', 'guanxian', '', '065500', '0316', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('694', '139', '5,139,694,', '3', '永清县', 'yongqingxian', '', '065600', '0316', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('695', '139', '5,139,695,', '3', '香河县', 'xianghexian', '', '065400', '0316', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('696', '139', '5,139,696,', '3', '大城县', 'dachengxian', '', '065900', '0316', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('697', '139', '5,139,697,', '3', '文安县', 'wenanxian', '', '065800', '0316', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('698', '139', '5,139,698,', '3', '大厂回族自治县', 'dachanghuizu', '', '065300', '0316', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('699', '139', '5,139,699,', '3', '霸州', 'bazhou', '', '065700', '0316', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('700', '139', '5,139,700,', '3', '三河', 'sanhe', '', '065200', '0316', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('701', '140', '5,140,701,', '3', '桃城区', 'taochengqu', '', '053000', '0318', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('702', '140', '5,140,702,', '3', '枣强县', 'zaoqiangxian', '', '053100', '0318', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('703', '140', '5,140,703,', '3', '武邑县', 'wuyixian', '', '053400', '0318', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('704', '140', '5,140,704,', '3', '武强县', 'wuqiangxian', '', '053300', '0318', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('705', '140', '5,140,705,', '3', '饶阳县', 'raoyangxian', '', '053900', '0318', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('706', '140', '5,140,706,', '3', '安平县', 'anpingxian', '', '053600', '0318', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('707', '140', '5,140,707,', '3', '故城县', 'guchengxian', '', '253800', '0318', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('708', '140', '5,140,708,', '3', '景县', 'jingxian', '', '053500', '0318', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('709', '140', '5,140,709,', '3', '阜城县', 'fuchengxian', '', '053700', '0318', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('710', '140', '5,140,710,', '3', '冀州', 'jizhou', '', '053200', '0318', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('711', '140', '5,140,711,', '3', '深州', 'shenzhou', '', '052800', '0318', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('712', '141', '6,141,712,', '3', '小店区', 'xiaodianqu', '', '030000', '0351', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('713', '141', '6,141,713,', '3', '迎泽区', 'yingzequ', '', '030000', '0351', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('714', '141', '6,141,714,', '3', '杏花岭区', 'xinghualingqu', '', '030000', '0351', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('715', '141', '6,141,715,', '3', '尖草坪区', 'jiancaopingqu', '', '030000', '0351', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('716', '141', '6,141,716,', '3', '万柏林区', 'wanbailinqu', '', '030000', '0351', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('717', '141', '6,141,717,', '3', '晋源区', 'jinyuanqu', '', '030000', '0351', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('718', '141', '6,141,718,', '3', '清徐县', 'qingxuxian', '', '030400', '0351', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('719', '141', '6,141,719,', '3', '阳曲县', 'yangquxian', '', '030100', '0351', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('720', '141', '6,141,720,', '3', '娄烦县', 'loufanxian', '', '030300', '0351', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('721', '141', '6,141,721,', '3', '古交', 'gujiao', '', '030200', '0351', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('722', '142', '6,142,722,', '3', '城区', 'chengqu', '', '037000', '0352', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('723', '142', '6,142,723,', '3', '矿区', 'kuangqu', '', '037000', '0352', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('724', '142', '6,142,724,', '3', '南郊区', 'nanjiaoqu', '', '037000', '0352', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('725', '142', '6,142,725,', '3', '新荣区', 'xinrongqu', '', '037000', '0352', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('726', '142', '6,142,726,', '3', '阳高县', 'yanggaoxian', '', '038100', '0352', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('727', '142', '6,142,727,', '3', '天镇县', 'tianzhenxian', '', '038200', '0352', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('728', '142', '6,142,728,', '3', '广灵县', 'guanglingxian', '', '037500', '0352', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('729', '142', '6,142,729,', '3', '灵丘县', 'lingqiuxian', '', '034400', '0352', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('730', '142', '6,142,730,', '3', '浑源县', 'hunyuanxian', '', '037400', '0352', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('731', '142', '6,142,731,', '3', '左云县', 'zuoyunxian', '', '037100', '0352', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('732', '142', '6,142,732,', '3', '大同县', 'datongxian', '', '037300', '0352', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('733', '143', '6,143,733,', '3', '城区', 'chengqu', '', '045000', '0353', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('734', '143', '6,143,734,', '3', '矿区', 'kuangqu', '', '045000', '0353', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('735', '143', '6,143,735,', '3', '郊区', 'jiaoqu', '', '045000', '0353', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('736', '143', '6,143,736,', '3', '平定县', 'pingdingxian', '', '045200', '0353', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('737', '143', '6,143,737,', '3', '盂县', 'yuxian', '', '045100', '0353', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('738', '144', '6,144,738,', '3', '城区', 'chengqu', '', '046000', '0355', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('739', '144', '6,144,739,', '3', '郊区', 'jiaoqu', '', '046000', '0355', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('740', '144', '6,144,740,', '3', '长治县', 'changzhixian', '', '047100', '0355', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('741', '144', '6,144,741,', '3', '襄垣县', 'xiangyuanxian', '', '046200', '0355', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('742', '144', '6,144,742,', '3', '屯留县', 'tunliuxian', '', '046100', '0355', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('743', '144', '6,144,743,', '3', '平顺县', 'pingshunxian', '', '047400', '0355', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('744', '144', '6,144,744,', '3', '黎城县', 'lichengxian', '', '047600', '0355', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('745', '144', '6,144,745,', '3', '壶关县', 'huguanxian', '', '047300', '0355', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('746', '144', '6,144,746,', '3', '长子县', 'changzixian', '', '046600', '0355', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('747', '144', '6,144,747,', '3', '武乡县', 'wuxiangxian', '', '046300', '0355', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('748', '144', '6,144,748,', '3', '沁县', 'qinxian', '', '046400', '0355', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('749', '144', '6,144,749,', '3', '沁源县', 'qinyuanxian', '', '046500', '0355', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('750', '144', '6,144,750,', '3', '潞城', 'lucheng', '', '047500', '0355', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('751', '145', '6,145,751,', '3', '城区', 'chengqu', '', '048000', '0356', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('752', '145', '6,145,752,', '3', '沁水县', 'qinshuixian', '', '048200', '0356', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('753', '145', '6,145,753,', '3', '阳城县', 'yangchengxian', '', '048100', '0356', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('754', '145', '6,145,754,', '3', '陵川县', 'lingchuanxian', '', '048300', '0356', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('755', '145', '6,145,755,', '3', '泽州县', 'zezhouxian', '', '048000', '0356', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('756', '145', '6,145,756,', '3', '高平', 'gaoping', '', '046700', '0356', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('757', '146', '6,146,757,', '3', '朔城区', 'shuochengqu', '', '038500', '0349', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('758', '146', '6,146,758,', '3', '平鲁区', 'pingluqu', '', '038500', '0349', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('759', '146', '6,146,759,', '3', '山阴县', 'shanyinxian', '', '038400', '0349', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('760', '146', '6,146,760,', '3', '应县', 'yingxian', '', '037600', '0349', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('761', '146', '6,146,761,', '3', '右玉县', 'youyuxian', '', '037200', '0349', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('762', '146', '6,146,762,', '3', '怀仁县', 'huairenxian', '', '038300', '0349', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('763', '147', '6,147,763,', '3', '榆次区', 'yuciqu', '', '030600', '0354', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('764', '147', '6,147,764,', '3', '榆社县', 'yushexian', '', '031800', '0354', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('765', '147', '6,147,765,', '3', '左权县', 'zuoquanxian', '', '032600', '0354', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('766', '147', '6,147,766,', '3', '和顺县', 'heshunxian', '', '032700', '0354', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('767', '147', '6,147,767,', '3', '昔阳县', 'xiyangxian', '', '045300', '0354', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('768', '147', '6,147,768,', '3', '寿阳县', 'shouyangxian', '', '031700', '0354', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('769', '147', '6,147,769,', '3', '太谷县', 'taiguxian', '', '030800', '0354', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('770', '147', '6,147,770,', '3', '祁县', 'qixian', '', '030900', '0354', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('771', '147', '6,147,771,', '3', '平遥县', 'pingyaoxian', '', '031100', '0354', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('772', '147', '6,147,772,', '3', '灵石县', 'lingshixian', '', '031300', '0354', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('773', '147', '6,147,773,', '3', '介休', 'jiexiu', '', '031200', '0354', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('774', '148', '6,148,774,', '3', '盐湖区', 'yanhuqu', '', '044000', '0359', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('775', '148', '6,148,775,', '3', '临猗县', 'linxian', '', '044100', '0359', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('776', '148', '6,148,776,', '3', '万荣县', 'wanrongxian', '', '044200', '0359', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('777', '148', '6,148,777,', '3', '闻喜县', 'wenxixian', '', '043800', '0359', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('778', '148', '6,148,778,', '3', '稷山县', 'shanxian', '', '043200', '0359', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('779', '148', '6,148,779,', '3', '新绛县', 'xinxian', '', '043100', '0359', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('780', '148', '6,148,780,', '3', '绛县', 'jiangxian', '', '043600', '0359', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('781', '148', '6,148,781,', '3', '垣曲县', 'yuanquxian', '', '043700', '0359', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('782', '148', '6,148,782,', '3', '夏县', 'xiaxian', '', '044400', '0359', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('783', '148', '6,148,783,', '3', '平陆县', 'pingluxian', '', '044300', '0359', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('784', '148', '6,148,784,', '3', '芮城县', 'chengxian', '', '044600', '0359', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('785', '148', '6,148,785,', '3', '永济', 'yongji', '', '044500', '0359', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('786', '148', '6,148,786,', '3', '河津', 'hejin', '', '043300', '0359', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('787', '149', '6,149,787,', '3', '忻府区', 'xinfuqu', '', '034000', '0350', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('788', '149', '6,149,788,', '3', '定襄县', 'dingxiangxian', '', '035400', '0350', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('789', '149', '6,149,789,', '3', '五台县', 'wutaixian', '', '035500', '0350', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('790', '149', '6,149,790,', '3', '代县', 'daixian', '', '034200', '0350', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('791', '149', '6,149,791,', '3', '繁峙县', 'fanzhixian', '', '034300', '0350', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('792', '149', '6,149,792,', '3', '宁武县', 'ningwuxian', '', '036000', '0350', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('793', '149', '6,149,793,', '3', '静乐县', 'jinglexian', '', '035100', '0350', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('794', '149', '6,149,794,', '3', '神池县', 'shenchixian', '', '036100', '0350', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('795', '149', '6,149,795,', '3', '五寨县', 'wuzhaixian', '', '036200', '0350', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('796', '149', '6,149,796,', '3', '岢岚县', 'kelanxian', '', '036300', '0350', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('797', '149', '6,149,797,', '3', '河曲县', 'hequxian', '', '036500', '0350', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('798', '149', '6,149,798,', '3', '保德县', 'baodexian', '', '036600', '0350', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('799', '149', '6,149,799,', '3', '偏关县', 'pianguanxian', '', '036400', '0350', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('800', '149', '6,149,800,', '3', '原平', 'yuanping', '', '034100', '0350', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('801', '150', '6,150,801,', '3', '尧都区', 'yaoduqu', '', '041000', '0357', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('802', '150', '6,150,802,', '3', '曲沃县', 'quwoxian', '', '043400', '0357', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('803', '150', '6,150,803,', '3', '翼城县', 'yichengxian', '', '043500', '0357', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('804', '150', '6,150,804,', '3', '襄汾县', 'xiangfenxian', '', '041500', '0357', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('805', '150', '6,150,805,', '3', '洪洞县', 'hongdongxian', '', '031600', '0357', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('806', '150', '6,150,806,', '3', '古县', 'guxian', '', '042400', '0357', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('807', '150', '6,150,807,', '3', '安泽县', 'anzexian', '', '042500', '0357', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('808', '150', '6,150,808,', '3', '浮山县', 'fushanxian', '', '042600', '0357', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('809', '150', '6,150,809,', '3', '吉县', 'jixian', '', '042200', '0357', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('810', '150', '6,150,810,', '3', '乡宁县', 'xiangningxian', '', '042100', '0357', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('811', '150', '6,150,811,', '3', '大宁县', 'daningxian', '', '042300', '0357', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('812', '150', '6,150,812,', '3', '隰县', 'xixian', '', '041300', '0357', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('813', '150', '6,150,813,', '3', '永和县', 'yonghexian', '', '041400', '0357', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('814', '150', '6,150,814,', '3', '蒲县', 'puxian', '', '041200', '0357', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('815', '150', '6,150,815,', '3', '汾西县', 'fenxixian', '', '031500', '0357', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('816', '150', '6,150,816,', '3', '侯马', 'houma', '', '043000', '0357', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('817', '150', '6,150,817,', '3', '霍州', 'huozhou', '', '031400', '0357', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('818', '151', '6,151,818,', '3', '离石区', 'lishiqu', '', '033000', '0358', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('819', '151', '6,151,819,', '3', '文水县', 'wenshuixian', '', '032100', '0358', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('820', '151', '6,151,820,', '3', '交城县', 'jiaochengxian', '', '030500', '0358', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('821', '151', '6,151,821,', '3', '兴县', 'xingxian', '', '035300', '0358', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('822', '151', '6,151,822,', '3', '临县', 'linxian', '', '033200', '0358', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('823', '151', '6,151,823,', '3', '柳林县', 'liulinxian', '', '033300', '0358', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('824', '151', '6,151,824,', '3', '石楼县', 'shilouxian', '', '032500', '0358', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('825', '151', '6,151,825,', '3', '岚县', 'lanxian', '', '035200', '0358', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('826', '151', '6,151,826,', '3', '方山县', 'fangshanxian', '', '033100', '0358', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('827', '151', '6,151,827,', '3', '中阳县', 'zhongyangxian', '', '033400', '0358', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('828', '151', '6,151,828,', '3', '交口县', 'jiaokouxian', '', '032400', '0358', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('829', '151', '6,151,829,', '3', '孝义', 'xiaoyi', '', '032300', '0358', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('830', '151', '6,151,830,', '3', '汾阳', 'fenyang', '', '032200', '0358', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('831', '152', '7,152,831,', '3', '新城区', 'xinchengqu', '', '010000', '0471', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('832', '152', '7,152,832,', '3', '回民区', 'huiminqu', '', '010000', '0471', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('833', '152', '7,152,833,', '3', '玉泉区', 'yuquanqu', '', '010000', '0471', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('834', '152', '7,152,834,', '3', '赛罕区', 'saihanqu', '', '010000', '0471', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('835', '152', '7,152,835,', '3', '土默特左旗', 'tumotezuoqi', '', '010100', '0471', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('836', '152', '7,152,836,', '3', '托克托县', 'tuoketuoxian', '', '010200', '0471', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('837', '152', '7,152,837,', '3', '和林格尔县', 'helingeerxian', '', '011500', '0471', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('838', '152', '7,152,838,', '3', '清水河县', 'qingshuihexian', '', '011600', '0471', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('839', '152', '7,152,839,', '3', '武川县', 'wuchuanxian', '', '011700', '0471', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('840', '153', '7,153,840,', '3', '东河区', 'donghequ', '', '014000', '0472', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('841', '153', '7,153,841,', '3', '昆都仑区', 'kundulunqu', '', '014000', '0472', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('842', '153', '7,153,842,', '3', '青山区', 'qingshanqu', '', '014000', '0472', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('843', '153', '7,153,843,', '3', '石拐区', 'shiguaiqu', '', '014000', '0472', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('844', '153', '7,153,844,', '3', '白云矿区', 'baiyunkuangqu', '', '014000', '0472', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('845', '153', '7,153,845,', '3', '九原区', 'jiuyuanqu', '', '014000', '0472', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('846', '153', '7,153,846,', '3', '土默特右旗', 'tumoteyouqi', '', '014100', '0472', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('847', '153', '7,153,847,', '3', '固阳县', 'guyangxian', '', '014200', '0472', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('848', '153', '7,153,848,', '3', '达尔罕茂明安联合旗', 'daerhanmaominganlianheqi', '', '014500', '0472', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('849', '154', '7,154,849,', '3', '海勃湾区', 'haibowanqu', '', '016000', '0473', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('850', '154', '7,154,850,', '3', '海南区', 'hainanqu', '', '016000', '0473', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('851', '154', '7,154,851,', '3', '乌达区', 'wudaqu', '', '016000', '0473', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('852', '155', '7,155,852,', '3', '红山区', 'hongshanqu', '', '024000', '0476', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('853', '155', '7,155,853,', '3', '元宝山区', 'yuanbaoshanqu', '', '024000', '0476', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('854', '155', '7,155,854,', '3', '松山区', 'songshanqu', '', '024000', '0476', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('855', '155', '7,155,855,', '3', '阿鲁科尔沁旗', 'alukeerqinqi', '', '025500', '0476', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('856', '155', '7,155,856,', '3', '巴林左旗', 'balinzuoqi', '', '025450', '0476', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('857', '155', '7,155,857,', '3', '巴林右旗', 'balinyouqi', '', '025150', '0476', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('858', '155', '7,155,858,', '3', '林西县', 'linxixian', '', '025250', '0476', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('859', '155', '7,155,859,', '3', '克什克腾旗', 'keshiketengqi', '', '025350', '0476', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('860', '155', '7,155,860,', '3', '翁牛特旗', 'wengniuteqi', '', '024500', '0476', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('861', '155', '7,155,861,', '3', '喀喇沁旗', 'kalaqinqi', '', '024400', '0476', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('862', '155', '7,155,862,', '3', '宁城县', 'ningchengxian', '', '024200', '0476', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('863', '155', '7,155,863,', '3', '敖汉旗', 'aohanqi', '', '024300', '0476', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('864', '156', '7,156,864,', '3', '科尔沁区', 'keerqinqu', '', '028000', '0475', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('865', '156', '7,156,865,', '3', '科尔沁左翼中旗', 'keerqinzuoyizhongqi', '', '029300', '0475', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('866', '156', '7,156,866,', '3', '科尔沁左翼后旗', 'keerqinzuoyihouqi', '', '028100', '0475', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('867', '156', '7,156,867,', '3', '开鲁县', 'kailuxian', '', '028400', '0475', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('868', '156', '7,156,868,', '3', '库伦旗', 'kulunqi', '', '028200', '0475', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('869', '156', '7,156,869,', '3', '奈曼旗', 'naimanqi', '', '028300', '0475', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('870', '156', '7,156,870,', '3', '扎鲁特旗', 'zhaluteqi', '', '029100', '0475', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('871', '156', '7,156,871,', '3', '霍林郭勒', 'huolinguole', '', '029200', '0475', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('872', '157', '7,157,872,', '3', '东胜区', 'dongshengqu', '', '017000', '0477', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('873', '157', '7,157,873,', '3', '达拉特旗', 'dalateqi', '', '014300', '0477', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('874', '157', '7,157,874,', '3', '准格尔旗', 'zhungeerqi', '', '017100', '0477', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('875', '157', '7,157,875,', '3', '鄂托克前旗', 'etuokeqianqi', '', '016200', '0477', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('876', '157', '7,157,876,', '3', '鄂托克旗', 'etuokeqi', '', '016100', '0477', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('877', '157', '7,157,877,', '3', '杭锦旗', 'hangjinqi', '', '017400', '0477', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('878', '157', '7,157,878,', '3', '乌审旗', 'wushenqi', '', '017300', '0477', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('879', '157', '7,157,879,', '3', '伊金霍洛旗', 'yijinhuoluoqi', '', '017200', '0477', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('880', '158', '7,158,880,', '3', '海拉尔区', 'hailaerqu', '', '021000', '0470', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('881', '158', '7,158,881,', '3', '阿荣旗', 'arongqi', '', '162750', '0470', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('882', '158', '7,158,882,', '3', '莫力达瓦达斡尔族自治旗', 'molidawadawoerzu', '', '162850', '0470', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('883', '158', '7,158,883,', '3', '鄂伦春自治旗', 'elunchunzizhiqi', '', '022450', '0470', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('884', '158', '7,158,884,', '3', '鄂温克族自治旗', 'ewenkezuzizhiqi', '', '021100', '0470', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('885', '158', '7,158,885,', '3', '陈巴尔虎旗', 'chenbaerhuqi', '', '021500', '0470', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('886', '158', '7,158,886,', '3', '新巴尔虎左旗', 'xinbaerhuzuoqi', '', '021200', '0470', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('887', '158', '7,158,887,', '3', '新巴尔虎右旗', 'xinbaerhuyouqi', '', '021300', '0470', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('888', '158', '7,158,888,', '3', '满洲里', 'manzhouli', '', '021400', '0470', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('889', '158', '7,158,889,', '3', '牙克石', 'yakeshi', '', '022150', '0470', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('890', '158', '7,158,890,', '3', '扎兰屯', 'zhalantun', '', '162650', '0470', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('891', '158', '7,158,891,', '3', '额尔古纳', 'eerguna', '', '022250', '0470', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('892', '158', '7,158,892,', '3', '根河', 'genhe', '', '022350', '0470', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('893', '159', '7,159,893,', '3', '临河区', 'linhequ', '', '015000', '0478', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('894', '159', '7,159,894,', '3', '五原县', 'wuyuanxian', '', '015100', '0478', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('895', '159', '7,159,895,', '3', '磴口县', 'kouxian', '', '015200', '0478', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('896', '159', '7,159,896,', '3', '乌拉特前旗', 'wulateqianqi', '', '014400', '0478', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('897', '159', '7,159,897,', '3', '乌拉特中旗', 'wulatezhongqi', '', '015300', '0478', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('898', '159', '7,159,898,', '3', '乌拉特后旗', 'wulatehouqi', '', '015500', '0478', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('899', '159', '7,159,899,', '3', '杭锦后旗', 'hangjinhouqi', '', '015400', '0478', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('900', '160', '7,160,900,', '3', '集宁区', 'jiningqu', '', '012000', '0474', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('901', '160', '7,160,901,', '3', '卓资县', 'zhuozixian', '', '012300', '0474', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('902', '160', '7,160,902,', '3', '化德县', 'huadexian', '', '013350', '0474', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('903', '160', '7,160,903,', '3', '商都县', 'shangduxian', '', '013400', '0474', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('904', '160', '7,160,904,', '3', '兴和县', 'xinghexian', '', '013650', '0474', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('905', '160', '7,160,905,', '3', '凉城县', 'liangchengxian', '', '013750', '0474', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('906', '160', '7,160,906,', '3', '察哈尔右翼前旗', 'chahaeryouyiqianqi', '', '012200', '0474', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('907', '160', '7,160,907,', '3', '察哈尔右翼中旗', 'chahaeryouyizhongqi', '', '013500', '0474', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('908', '160', '7,160,908,', '3', '察哈尔右翼后旗', 'chahaeryouyihouqi', '', '012400', '0474', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('909', '160', '7,160,909,', '3', '四子王旗', 'siziwangqi', '', '011800', '0474', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('910', '160', '7,160,910,', '3', '丰镇', 'fengzhen', '', '012100', '0474', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('911', '161', '7,161,911,', '3', '乌兰浩特', 'wulanhaote', '', '137400', '0482', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('912', '161', '7,161,912,', '3', '阿尔山', 'aershan', '', '137400', '0482', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('913', '161', '7,161,913,', '3', '科尔沁右翼前旗', 'keerqinyouyiqianqi', '', '137400', '0482', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('914', '161', '7,161,914,', '3', '科尔沁右翼中旗', 'keerqinyouyizhongqi', '', '029400', '0482', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('915', '161', '7,161,915,', '3', '扎赉特旗', 'zhateqi', '', '137600', '0482', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('916', '161', '7,161,916,', '3', '突泉县', 'tuquanxian', '', '137500', '0482', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('917', '162', '7,162,917,', '3', '二连浩特', 'erlianhaote', '', '012600', '0479', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('918', '162', '7,162,918,', '3', '锡林浩特', 'xilinhaote', '', '026000', '0479', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('919', '162', '7,162,919,', '3', '阿巴嘎旗', 'abagaqi', '', '011400', '0479', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('920', '162', '7,162,920,', '3', '苏尼特左旗', 'sunitezuoqi', '', '011300', '0479', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('921', '162', '7,162,921,', '3', '苏尼特右旗', 'suniteyouqi', '', '011200', '0479', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('922', '162', '7,162,922,', '3', '东乌珠穆沁旗', 'dongwuzhumuqinqi', '', '026300', '0479', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('923', '162', '7,162,923,', '3', '西乌珠穆沁旗', 'xiwuzhumuqinqi', '', '026200', '0479', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('924', '162', '7,162,924,', '3', '太仆寺旗', 'taipusiqi', '', '027000', '0479', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('925', '162', '7,162,925,', '3', '镶黄旗', 'xianghuangqi', '', '013250', '0479', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('926', '162', '7,162,926,', '3', '正镶白旗', 'zhengxiangbaiqi', '', '013800', '0479', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('927', '162', '7,162,927,', '3', '正蓝旗', 'zhenglanqi', '', '027200', '0479', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('928', '162', '7,162,928,', '3', '多伦县', 'duolunxian', '', '027300', '0479', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('929', '163', '7,163,929,', '3', '阿拉善左旗', 'alashanzuoqi', '', '750300', '0483', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('930', '163', '7,163,930,', '3', '阿拉善右旗', 'alashanyouqi', '', '737300', '0483', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('931', '163', '7,163,931,', '3', '额济纳旗', 'ejinaqi', '', '735400', '0483', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('932', '164', '8,164,932,', '3', '和平区', 'hepingqu', '', '110000', '024', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('933', '164', '8,164,933,', '3', '沈河区', 'shenhequ', '', '110000', '024', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('934', '164', '8,164,934,', '3', '大东区', 'dadongqu', '', '110000', '024', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('935', '164', '8,164,935,', '3', '皇姑区', 'huangguqu', '', '110000', '024', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('936', '164', '8,164,936,', '3', '铁西区', 'tiexiqu', '', '110000', '024', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('937', '164', '8,164,937,', '3', '苏家屯区', 'sujiatunqu', '', '110100', '024', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('938', '164', '8,164,938,', '3', '东陵区', 'donglingqu', '', '110000', '024', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('939', '164', '8,164,939,', '3', '新城子区', 'xinchengziqu', '', '110000', '024', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('940', '164', '8,164,940,', '3', '于洪区', 'yuhongqu', '', '110000', '024', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('941', '164', '8,164,941,', '3', '辽中县', 'liaozhongxian', '', '110200', '024', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('942', '164', '8,164,942,', '3', '康平县', 'kangpingxian', '', '110500', '024', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('943', '164', '8,164,943,', '3', '法库县', 'fakuxian', '', '110400', '024', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('944', '164', '8,164,944,', '3', '新民', 'xinmin', '', '110300', '024', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('945', '165', '8,165,945,', '3', '中山区', 'zhongshanqu', '', '116000', '0411', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('946', '165', '8,165,946,', '3', '西岗区', 'xigangqu', '', '116000', '0411', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('947', '165', '8,165,947,', '3', '沙河口区', 'shahekouqu', '', '116000', '0411', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('948', '165', '8,165,948,', '3', '甘井子区', 'ganjingziqu', '', '116000', '0411', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('949', '165', '8,165,949,', '3', '旅顺口区', 'lvshunkouqu', '', '116000', '0411', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('950', '165', '8,165,950,', '3', '金州区', 'jinzhouqu', '', '116000', '0411', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('951', '165', '8,165,951,', '3', '长海县', 'changhaixian', '', '116500', '0411', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('952', '165', '8,165,952,', '3', '瓦房店', 'wafangdian', '', '116300', '0411', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('953', '165', '8,165,953,', '3', '普兰店', 'pulandian', '', '116200', '0411', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('954', '165', '8,165,954,', '3', '庄河', 'zhuanghe', '', '116400', '0411', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('955', '166', '8,166,955,', '3', '铁东区', 'tiedongqu', '', '114000', '0412', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('956', '166', '8,166,956,', '3', '铁西区', 'tiexiqu', '', '114000', '0412', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('957', '166', '8,166,957,', '3', '立山区', 'lishanqu', '', '114000', '0412', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('958', '166', '8,166,958,', '3', '千山区', 'qianshanqu', '', '114000', '0412', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('959', '166', '8,166,959,', '3', '台安县', 'taianxian', '', '114100', '0412', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('960', '166', '8,166,960,', '3', '岫岩满族自治县', 'yanmanzu', '', '118400', '0412', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('961', '166', '8,166,961,', '3', '海城', 'haicheng', '', '114200', '0412', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('962', '167', '8,167,962,', '3', '新抚区', 'xinfuqu', '', '113000', '0413', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('963', '167', '8,167,963,', '3', '东洲区', 'dongzhouqu', '', '113000', '0413', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('964', '167', '8,167,964,', '3', '望花区', 'wanghuaqu', '', '113000', '0413', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('965', '167', '8,167,965,', '3', '顺城区', 'shunchengqu', '', '113000', '0413', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('966', '167', '8,167,966,', '3', '抚顺县', 'fushunxian', '', '113100', '0413', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('967', '167', '8,167,967,', '3', '新宾满族自治县', 'xinbinmanzuzizhixian', '', '113200', '0413', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('968', '167', '8,167,968,', '3', '清原满族自治县', 'qingyuanmanzu', '', '113300', '0413', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('969', '168', '8,168,969,', '3', '平山区', 'pingshanqu', '', '117000', '0414', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('970', '168', '8,168,970,', '3', '溪湖区', 'xihuqu', '', '117000', '0414', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('971', '168', '8,168,971,', '3', '明山区', 'mingshanqu', '', '117000', '0414', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('972', '168', '8,168,972,', '3', '南芬区', 'nanfenqu', '', '117000', '0414', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('973', '168', '8,168,973,', '3', '本溪满族自治县', 'benximanzu', '', '117100', '0414', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('974', '168', '8,168,974,', '3', '桓仁满族自治县', 'huanrenmanzu', '', '117200', '0414', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('975', '169', '8,169,975,', '3', '元宝区', 'yuanbaoqu', '', '118000', '0415', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('976', '169', '8,169,976,', '3', '振兴区', 'zhenxingqu', '', '118000', '0415', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('977', '169', '8,169,977,', '3', '振安区', 'zhenanqu', '', '118000', '0415', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('978', '169', '8,169,978,', '3', '宽甸满族自治县', 'kuandianmanzu', '', '118200', '0415', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('979', '169', '8,169,979,', '3', '东港', 'donggang', '', '118300', '0415', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('980', '169', '8,169,980,', '3', '凤城', 'fengcheng', '', '118100', '0415', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('981', '170', '8,170,981,', '3', '古塔区', 'gutaqu', '', '121000', '0416', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('982', '170', '8,170,982,', '3', '凌河区', 'linghequ', '', '121000', '0416', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('983', '170', '8,170,983,', '3', '太和区', 'taihequ', '', '121000', '0416', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('984', '170', '8,170,984,', '3', '黑山县', 'heishanxian', '', '121400', '0416', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('985', '170', '8,170,985,', '3', '义县', 'yixian', '', '121100', '0416', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('986', '170', '8,170,986,', '3', '凌海', 'linghai', '', '121200', '0416', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('987', '170', '8,170,987,', '3', '北镇', 'beizhen', '', '121300', '0416', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('988', '171', '8,171,988,', '3', '站前区', 'zhanqianqu', '', '115000', '0417', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('989', '171', '8,171,989,', '3', '西区', 'xiqu', '', '115000', '0417', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('990', '171', '8,171,990,', '3', '鲅鱼圈区', 'yuquanqu', '', '115000', '0417', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('991', '171', '8,171,991,', '3', '老边区', 'laobianqu', '', '115000', '0417', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('992', '171', '8,171,992,', '3', '盖州', 'gaizhou', '', '115200', '0417', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('993', '171', '8,171,993,', '3', '大石桥', 'dashiqiao', '', '115100', '0417', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('994', '172', '8,172,994,', '3', '海州区', 'haizhouqu', '', '123000', '0418', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('995', '172', '8,172,995,', '3', '新邱区', 'xinqiuqu', '', '123000', '0418', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('996', '172', '8,172,996,', '3', '太平区', 'taipingqu', '', '123000', '0418', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('997', '172', '8,172,997,', '3', '清河门区', 'qinghemenqu', '', '123000', '0418', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('998', '172', '8,172,998,', '3', '细河区', 'xihequ', '', '123000', '0418', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('999', '172', '8,172,999,', '3', '阜新蒙古族自治县', 'fuxinmengguzu', '', '123100', '0418', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1000', '172', '8,172,1000,', '3', '彰武县', 'zhangwuxian', '', '123200', '0418', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1001', '173', '8,173,1001,', '3', '白塔区', 'baitaqu', '', '111000', '0419', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1002', '173', '8,173,1002,', '3', '文圣区', 'wenshengqu', '', '111000', '0419', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1003', '173', '8,173,1003,', '3', '宏伟区', 'hongweiqu', '', '111000', '0419', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1004', '173', '8,173,1004,', '3', '弓长岭区', 'gongchanglingqu', '', '111000', '0419', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1005', '173', '8,173,1005,', '3', '太子河区', 'taizihequ', '', '111000', '0419', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1006', '173', '8,173,1006,', '3', '辽阳县', 'liaoyangxian', '', '111200', '0419', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1007', '173', '8,173,1007,', '3', '灯塔', 'dengta', '', '111300', '0419', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1008', '174', '8,174,1008,', '3', '双台子区', 'shuangtaiziqu', '', '124000', '0427', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1009', '174', '8,174,1009,', '3', '兴隆台区', 'xinglongtaiqu', '', '124000', '0427', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1010', '174', '8,174,1010,', '3', '大洼县', 'dawaxian', '', '124200', '0427', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1011', '174', '8,174,1011,', '3', '盘山县', 'panshanxian', '', '124100', '0427', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1012', '175', '8,175,1012,', '3', '银州区', 'yinzhouqu', '', '112000', '0410', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1013', '175', '8,175,1013,', '3', '清河区', 'qinghequ', '', '112000', '0410', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1014', '175', '8,175,1014,', '3', '铁岭县', 'tielingxian', '', '112600', '0410', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1015', '175', '8,175,1015,', '3', '西丰县', 'xifengxian', '', '112400', '0410', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1016', '175', '8,175,1016,', '3', '昌图县', 'changtuxian', '', '112500', '0410', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1017', '175', '8,175,1017,', '3', '调兵山', 'diaobingshan', '', '112700', '0410', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1018', '175', '8,175,1018,', '3', '开原', 'kaiyuan', '', '112300', '0410', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1019', '176', '8,176,1019,', '3', '双塔区', 'shuangtaqu', '', '122000', '0421', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1020', '176', '8,176,1020,', '3', '龙城区', 'longchengqu', '', '122000', '0421', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1021', '176', '8,176,1021,', '3', '朝阳县', 'chaoyangxian', '', '122000', '0421', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1022', '176', '8,176,1022,', '3', '建平县', 'jianpingxian', '', '122400', '0421', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1023', '176', '8,176,1023,', '3', '喀喇沁左翼蒙古族自治县', 'kalaqinzuoyimengguzu', '', '122300', '0421', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1024', '176', '8,176,1024,', '3', '北票', 'beipiao', '', '122100', '0421', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1025', '176', '8,176,1025,', '3', '凌源', 'lingyuan', '', '122500', '0421', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1026', '177', '8,177,1026,', '3', '连山区', 'lianshanqu', '', '125000', '0429', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1027', '177', '8,177,1027,', '3', '龙港区', 'longgangqu', '', '125000', '0429', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1028', '177', '8,177,1028,', '3', '南票区', 'nanpiaoqu', '', '125000', '0429', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1029', '177', '8,177,1029,', '3', '绥中县', 'suizhongxian', '', '125200', '0429', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1030', '177', '8,177,1030,', '3', '建昌县', 'jianchangxian', '', '125300', '0429', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1031', '177', '8,177,1031,', '3', '兴城', 'xingcheng', '', '125100', '0429', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1032', '178', '9,178,1032,', '3', '南关区', 'nanguanqu', '', '130000', '0431', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1033', '178', '9,178,1033,', '3', '宽城区', 'kuanchengqu', '', '130000', '0431', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1034', '178', '9,178,1034,', '3', '朝阳区', 'chaoyangqu', '', '130000', '0431', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1035', '178', '9,178,1035,', '3', '二道区', 'erdaoqu', '', '130000', '0431', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1036', '178', '9,178,1036,', '3', '绿园区', 'lvyuanqu', '', '130000', '0431', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1037', '178', '9,178,1037,', '3', '双阳区', 'shuangyangqu', '', '130600', '0431', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1038', '178', '9,178,1038,', '3', '农安县', 'nonganxian', '', '130200', '0431', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1039', '178', '9,178,1039,', '3', '九台', 'jiutai', '', '130500', '0431', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1040', '178', '9,178,1040,', '3', '榆树', 'yushu', '', '130400', '0431', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1041', '178', '9,178,1041,', '3', '德惠', 'dehui', '', '130300', '0431', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1042', '179', '9,179,1042,', '3', '昌邑区', 'changyiqu', '', '132000', '0432', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1043', '179', '9,179,1043,', '3', '龙潭区', 'longtanqu', '', '132000', '0432', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1044', '179', '9,179,1044,', '3', '船营区', 'chuanyingqu', '', '132000', '0432', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1045', '179', '9,179,1045,', '3', '丰满区', 'fengmanqu', '', '132000', '0432', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1046', '179', '9,179,1046,', '3', '永吉县', 'yongjixian', '', '132100', '0432', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1047', '179', '9,179,1047,', '3', '蛟河', 'he', '', '132500', '0432', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1048', '179', '9,179,1048,', '3', '桦甸', 'dian', '', '132400', '0432', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1049', '179', '9,179,1049,', '3', '舒兰', 'shulan', '', '132600', '0432', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1050', '179', '9,179,1050,', '3', '磐石', 'panshi', '', '132300', '0432', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1051', '180', '9,180,1051,', '3', '铁西区', 'tiexiqu', '', '136000', '0434', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1052', '180', '9,180,1052,', '3', '铁东区', 'tiedongqu', '', '136000', '0434', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1053', '180', '9,180,1053,', '3', '梨树县', 'lishuxian', '', '136500', '0434', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1054', '180', '9,180,1054,', '3', '伊通满族自治县', 'yitongmanzu', '', '130700', '0434', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1055', '180', '9,180,1055,', '3', '公主岭', 'gongzhuling', '', '136100', '0434', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1056', '180', '9,180,1056,', '3', '双辽', 'shuangliao', '', '136400', '0434', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1057', '181', '9,181,1057,', '3', '龙山区', 'longshanqu', '', '136200', '0437', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1058', '181', '9,181,1058,', '3', '西安区', 'xianqu', '', '136200', '0437', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1059', '181', '9,181,1059,', '3', '东丰县', 'dongfengxian', '', '136300', '0437', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1060', '181', '9,181,1060,', '3', '东辽县', 'dongliaoxian', '', '136600', '0437', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1061', '182', '9,182,1061,', '3', '东昌区', 'dongchangqu', '', '134000', '0435', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1062', '182', '9,182,1062,', '3', '二道江区', 'erdaojiangqu', '', '134000', '0435', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1063', '182', '9,182,1063,', '3', '通化县', 'tonghuaxian', '', '134100', '0435', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1064', '182', '9,182,1064,', '3', '辉南县', 'huinanxian', '', '135100', '0448', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1065', '182', '9,182,1065,', '3', '柳河县', 'liuhexian', '', '135300', '0448', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1066', '182', '9,182,1066,', '3', '梅河口', 'meihekou', '', '135000', '0448', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1067', '182', '9,182,1067,', '3', '集安', 'jian', '', '134200', '0435', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1068', '183', '9,183,1068,', '3', '八道江区', 'badaojiangqu', '', '134300', '0439', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1069', '183', '9,183,1069,', '3', '抚松县', 'fusongxian', '', '134500', '0439', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1070', '183', '9,183,1070,', '3', '靖宇县', 'jingyuxian', '', '135200', '0439', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1071', '183', '9,183,1071,', '3', '长白朝鲜族自治县', 'changbaichaoxianzu', '', '134400', '0439', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1072', '183', '9,183,1072,', '3', '江源县', 'jiangyuanxian', '', '134700', '0439', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1073', '183', '9,183,1073,', '3', '临江', 'linjiang', '', '134600', '0439', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1074', '184', '9,184,1074,', '3', '宁江区', 'ningjiangqu', '', '138000', '0438', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1075', '184', '9,184,1075,', '3', '前郭尔罗斯蒙古族自治县', 'qianguoerluosimengguzu', '', '131100', '0438', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1076', '184', '9,184,1076,', '3', '长岭县', 'changlingxian', '', '131500', '0438', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1077', '184', '9,184,1077,', '3', '乾安县', 'qiananxian', '', '131400', '0438', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1078', '184', '9,184,1078,', '3', '扶余县', 'fuyuxian', '', '131200', '0438', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1079', '185', '9,185,1079,', '3', '洮北区', 'jlbq', '', '137000', '0436', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1080', '185', '9,185,1080,', '3', '镇赉县', 'zhenxian', '', '137300', '0436', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1081', '185', '9,185,1081,', '3', '通榆县', 'tongyuxian', '', '137200', '0436', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1082', '185', '9,185,1082,', '3', '洮南', 'nan', '', '137100', '0436', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1083', '185', '9,185,1083,', '3', '大安', 'daan', '', '131300', '0436', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1084', '186', '9,186,1084,', '3', '延吉', 'yanji', '', '133000', '0433', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1085', '186', '9,186,1085,', '3', '图们', 'tumen', '', '133100', '0433', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1086', '186', '9,186,1086,', '3', '敦化', 'dunhua', '', '133700', '0433', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1087', '186', '9,186,1087,', '3', '珲春', 'chun', '', '133300', '0440', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1088', '186', '9,186,1088,', '3', '龙井', 'longjing', '', '133400', '0433', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1089', '186', '9,186,1089,', '3', '和龙', 'helong', '', '133500', '0433', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1090', '186', '9,186,1090,', '3', '汪清县', 'wangqingxian', '', '133200', '0433', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1091', '186', '9,186,1091,', '3', '安图县', 'antuxian', '', '133600', '0433', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1092', '187', '10,187,1092,', '3', '道里区', 'daoliqu', '', '150000', '0451', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1093', '187', '10,187,1093,', '3', '南岗区', 'nangangqu', '', '150000', '0451', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1094', '187', '10,187,1094,', '3', '道外区', 'daowaiqu', '', '150000', '0451', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1095', '187', '10,187,1095,', '3', '香坊区', 'xiangfangqu', '', '150000', '0451', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1096', '187', '10,187,1096,', '3', '动力区', 'dongliqu', '', '150000', '0451', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1097', '187', '10,187,1097,', '3', '平房区', 'pingfangqu', '', '150000', '0451', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1098', '187', '10,187,1098,', '3', '松北区', 'songbeiqu', '', '150000', '0451', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1099', '187', '10,187,1099,', '3', '呼兰区', 'hulanqu', '', '150500', '0451', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1100', '187', '10,187,1100,', '3', '依兰县', 'yilanxian', '', '154800', '0451', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1101', '187', '10,187,1101,', '3', '方正县', 'fangzhengxian', '', '150800', '0451', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1102', '187', '10,187,1102,', '3', '宾县', 'binxian', '', '150400', '0451', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1103', '187', '10,187,1103,', '3', '巴彦县', 'bayanxian', '', '151800', '0451', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1104', '187', '10,187,1104,', '3', '木兰县', 'mulanxian', '', '151900', '0451', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1105', '187', '10,187,1105,', '3', '通河县', 'tonghexian', '', '150900', '0451', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1106', '187', '10,187,1106,', '3', '延寿县', 'yanshouxian', '', '150700', '0451', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1107', '187', '10,187,1107,', '3', '阿城', 'acheng', '', '150300', '0451', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1108', '187', '10,187,1108,', '3', '双城', 'shuangcheng', '', '150100', '0451', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1109', '187', '10,187,1109,', '3', '尚志', 'shangzhi', '', '150600', '0451', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1110', '187', '10,187,1110,', '3', '五常', 'wuchang', '', '150200', '0451', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1111', '188', '10,188,1111,', '3', '龙沙区', 'longshaqu', '', '161000', '0452', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1112', '188', '10,188,1112,', '3', '建华区', 'jianhuaqu', '', '161000', '0452', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1113', '188', '10,188,1113,', '3', '铁锋区', 'tiefengqu', '', '161000', '0452', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1114', '188', '10,188,1114,', '3', '昂昂溪区', 'angangxiqu', '', '161000', '0452', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1115', '188', '10,188,1115,', '3', '富拉尔基区', 'fulaerjiqu', '', '161000', '0452', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1116', '188', '10,188,1116,', '3', '碾子山区', 'nianzishanqu', '', '161000', '0452', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1117', '188', '10,188,1117,', '3', '梅里斯达斡尔族区', 'meilisidawoerzuqu', '', '161000', '0452', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1118', '188', '10,188,1118,', '3', '龙江县', 'longjiangxian', '', '161100', '0452', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1119', '188', '10,188,1119,', '3', '依安县', 'yianxian', '', '161500', '0452', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1120', '188', '10,188,1120,', '3', '泰来县', 'tailaixian', '', '162400', '0452', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1121', '188', '10,188,1121,', '3', '甘南县', 'gannanxian', '', '162100', '0452', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1122', '188', '10,188,1122,', '3', '富裕县', 'fuyuxian', '', '161200', '0452', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1123', '188', '10,188,1123,', '3', '克山县', 'keshanxian', '', '161600', '0452', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1124', '188', '10,188,1124,', '3', '克东县', 'kedongxian', '', '164800', '0452', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1125', '188', '10,188,1125,', '3', '拜泉县', 'baiquanxian', '', '164700', '0452', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1126', '188', '10,188,1126,', '3', '讷河', 'he', '', '161300', '0452', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1127', '189', '10,189,1127,', '3', '鸡冠区', 'jiguanqu', '', '158100', '0467', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1128', '189', '10,189,1128,', '3', '恒山区', 'hengshanqu', '', '158100', '0467', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1129', '189', '10,189,1129,', '3', '滴道区', 'didaoqu', '', '158100', '0467', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1130', '189', '10,189,1130,', '3', '梨树区', 'lishuqu', '', '158100', '0467', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1131', '189', '10,189,1131,', '3', '城子河区', 'chengzihequ', '', '158100', '0467', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1132', '189', '10,189,1132,', '3', '麻山区', 'mashanqu', '', '158100', '0467', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1133', '189', '10,189,1133,', '3', '鸡东县', 'jidongxian', '', '158200', '0467', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1134', '189', '10,189,1134,', '3', '虎林', 'hulin', '', '158400', '0467', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1135', '189', '10,189,1135,', '3', '密山', 'mishan', '', '158300', '0467', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1136', '190', '10,190,1136,', '3', '向阳区', 'xiangyangqu', '', '154100', '0468', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1137', '190', '10,190,1137,', '3', '工农区', 'gongnongqu', '', '154100', '0468', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1138', '190', '10,190,1138,', '3', '南山区', 'nanshanqu', '', '154100', '0468', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1139', '190', '10,190,1139,', '3', '兴安区', 'xinganqu', '', '154100', '0468', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1140', '190', '10,190,1140,', '3', '东山区', 'dongshanqu', '', '154100', '0468', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1141', '190', '10,190,1141,', '3', '兴山区', 'xingshanqu', '', '154100', '0468', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1142', '190', '10,190,1142,', '3', '萝北县', 'luobeixian', '', '154200', '0468', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1143', '190', '10,190,1143,', '3', '绥滨县', 'suibinxian', '', '156200', '0468', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1144', '191', '10,191,1144,', '3', '尖山区', 'jianshanqu', '', '155100', '0469', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1145', '191', '10,191,1145,', '3', '岭东区', 'lingdongqu', '', '155100', '0469', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1146', '191', '10,191,1146,', '3', '四方台区', 'sifangtaiqu', '', '155100', '0469', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1147', '191', '10,191,1147,', '3', '宝山区', 'baoshanqu', '', '155100', '0469', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1148', '191', '10,191,1148,', '3', '集贤县', 'jixianxian', '', '155900', '0469', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1149', '191', '10,191,1149,', '3', '友谊县', 'youyixian', '', '155800', '0469', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1150', '191', '10,191,1150,', '3', '宝清县', 'baoqingxian', '', '155600', '0469', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1151', '191', '10,191,1151,', '3', '饶河县', 'raohexian', '', '155700', '0469', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1152', '192', '10,192,1152,', '3', '萨尔图区', 'saertuqu', '', '163000', '0459', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1153', '192', '10,192,1153,', '3', '龙凤区', 'longfengqu', '', '163000', '0459', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1154', '192', '10,192,1154,', '3', '让胡路区', 'ranghuluqu', '', '163000', '0459', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1155', '192', '10,192,1155,', '3', '红岗区', 'honggangqu', '', '163000', '0459', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1156', '192', '10,192,1156,', '3', '大同区', 'datongqu', '', '163000', '0459', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1157', '192', '10,192,1157,', '3', '肇州县', 'zhaozhouxian', '', '166400', '0459', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1158', '192', '10,192,1158,', '3', '肇源县', 'zhaoyuanxian', '', '166500', '0459', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1159', '192', '10,192,1159,', '3', '林甸县', 'lindianxian', '', '166300', '0459', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1160', '192', '10,192,1160,', '3', '杜尔伯特蒙古族自治县', 'duerbotemengguzu', '', '166200', '0459', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1161', '193', '10,193,1161,', '3', '伊春区', 'yichunqu', '', '153000', '0458', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1162', '193', '10,193,1162,', '3', '南岔区', 'nanchaqu', '', '153000', '0458', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1163', '193', '10,193,1163,', '3', '友好区', 'youhaoqu', '', '153000', '0458', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1164', '193', '10,193,1164,', '3', '西林区', 'xilinqu', '', '153000', '0458', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1165', '193', '10,193,1165,', '3', '翠峦区', 'cuiluanqu', '', '153000', '0458', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1166', '193', '10,193,1166,', '3', '新青区', 'xinqingqu', '', '153000', '0458', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1167', '193', '10,193,1167,', '3', '美溪区', 'meixiqu', '', '153000', '0458', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1168', '193', '10,193,1168,', '3', '金山屯区', 'jinshantunqu', '', '153000', '0458', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1169', '193', '10,193,1169,', '3', '五营区', 'wuyingqu', '', '153000', '0458', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1170', '193', '10,193,1170,', '3', '乌马河区', 'wumahequ', '', '153000', '0458', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1171', '193', '10,193,1171,', '3', '汤旺河区', 'tangwanghequ', '', '153000', '0458', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1172', '193', '10,193,1172,', '3', '带岭区', 'dailingqu', '', '153000', '0458', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1173', '193', '10,193,1173,', '3', '乌伊岭区', 'wuyilingqu', '', '153000', '0458', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1174', '193', '10,193,1174,', '3', '红星区', 'hongxingqu', '', '153000', '0458', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1175', '193', '10,193,1175,', '3', '上甘岭区', 'shangganlingqu', '', '153000', '0458', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1176', '193', '10,193,1176,', '3', '嘉荫县', 'jiayinxian', '', '153200', '0458', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1177', '193', '10,193,1177,', '3', '铁力', 'tieli', '', '152500', '0458', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1178', '194', '10,194,1178,', '3', '永红区', 'yonghongqu', '', '154000', '0454', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1179', '194', '10,194,1179,', '3', '向阳区', 'xiangyangqu', '', '154000', '0454', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1180', '194', '10,194,1180,', '3', '前进区', 'qianjinqu', '', '154000', '0454', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1181', '194', '10,194,1181,', '3', '东风区', 'dongfengqu', '', '154000', '0454', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1182', '194', '10,194,1182,', '3', '郊区', 'jiaoqu', '', '154000', '0454', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1183', '194', '10,194,1183,', '3', '桦南县', 'nanxian', '', '154400', '0454', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1184', '194', '10,194,1184,', '3', '桦川县', 'chuanxian', '', '154300', '0454', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1185', '194', '10,194,1185,', '3', '汤原县', 'tangyuanxian', '', '154700', '0454', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1186', '194', '10,194,1186,', '3', '抚远县', 'fuyuanxian', '', '156500', '0454', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1187', '194', '10,194,1187,', '3', '同江', 'tongjiang', '', '156400', '0454', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1188', '194', '10,194,1188,', '3', '富锦', 'fujin', '', '156100', '0454', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1189', '195', '10,195,1189,', '3', '新兴区', 'xinxingqu', '', '154600', '0464', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1190', '195', '10,195,1190,', '3', '桃山区', 'taoshanqu', '', '154600', '0464', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1191', '195', '10,195,1191,', '3', '茄子河区', 'qiezihequ', '', '154600', '0464', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1192', '195', '10,195,1192,', '3', '勃利县', 'bolixian', '', '154500', '0464', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1193', '196', '10,196,1193,', '3', '东安区', 'donganqu', '', '157000', '0453', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1194', '196', '10,196,1194,', '3', '阳明区', 'yangmingqu', '', '157000', '0453', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1195', '196', '10,196,1195,', '3', '爱民区', 'aiminqu', '', '157000', '0453', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1196', '196', '10,196,1196,', '3', '西安区', 'xianqu', '', '157000', '0453', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1197', '196', '10,196,1197,', '3', '东宁县', 'dongningxian', '', '157200', '0453', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1198', '196', '10,196,1198,', '3', '林口县', 'linkouxian', '', '157600', '0453', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1199', '196', '10,196,1199,', '3', '绥芬河', 'suifenhe', '', '157300', '0453', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1200', '196', '10,196,1200,', '3', '海林', 'hailin', '', '157100', '0453', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1201', '196', '10,196,1201,', '3', '宁安', 'ningan', '', '157400', '0453', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1202', '196', '10,196,1202,', '3', '穆棱', 'muleng', '', '157500', '0453', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1203', '197', '10,197,1203,', '3', '爱辉区', 'aihuiqu', '', '164300', '0456', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1204', '197', '10,197,1204,', '3', '嫩江县', 'nenjiangxian', '', '161400', '0456', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1205', '197', '10,197,1205,', '3', '逊克县', 'xunkexian', '', '164400', '0456', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1206', '197', '10,197,1206,', '3', '孙吴县', 'sunwuxian', '', '164200', '0456', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1207', '197', '10,197,1207,', '3', '北安', 'beian', '', '164000', '0456', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1208', '197', '10,197,1208,', '3', '五大连池', 'wudalianchi', '', '164100', '0456', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1209', '198', '10,198,1209,', '3', '北林区', 'beilinqu', '', '152000', '0455', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1210', '198', '10,198,1210,', '3', '望奎县', 'wangkuixian', '', '152100', '0455', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1211', '198', '10,198,1211,', '3', '兰西县', 'lanxixian', '', '151500', '0455', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1212', '198', '10,198,1212,', '3', '青冈县', 'qinggangxian', '', '151600', '0455', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1213', '198', '10,198,1213,', '3', '庆安县', 'qinganxian', '', '152400', '0455', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1214', '198', '10,198,1214,', '3', '明水县', 'mingshuixian', '', '151700', '0455', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1215', '198', '10,198,1215,', '3', '绥棱县', 'suilengxian', '', '152200', '0455', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1216', '198', '10,198,1216,', '3', '安达', 'anda', '', '151400', '0455', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1217', '198', '10,198,1217,', '3', '肇东', 'zhaodong', '', '151100', '0455', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1218', '198', '10,198,1218,', '3', '海伦', 'hailun', '', '152300', '0455', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1219', '199', '10,199,1219,', '3', '呼玛县', 'humaxian', '', '165100', '0457', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1220', '199', '10,199,1220,', '3', '塔河县', 'tahexian', '', '165200', '0457', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1221', '199', '10,199,1221,', '3', '漠河县', 'mohexian', '', '165300', '0457', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1222', '200', '11,200,1222,', '3', '玄武区', 'xuanwuqu', '', '210000', '025', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1223', '200', '11,200,1223,', '3', '白下区', 'baixiaqu', '', '210000', '025', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1224', '200', '11,200,1224,', '3', '秦淮区', 'qinhuaiqu', '', '210000', '025', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1225', '200', '11,200,1225,', '3', '建邺区', 'jianqu', '', '210000', '025', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1226', '200', '11,200,1226,', '3', '鼓楼区', 'gulouqu', '', '210000', '025', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1227', '200', '11,200,1227,', '3', '下关区', 'xiaguanqu', '', '210000', '025', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1228', '200', '11,200,1228,', '3', '浦口区', 'pukouqu', '', '210000', '025', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1229', '200', '11,200,1229,', '3', '栖霞区', 'qixiaqu', '', '210000', '025', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1230', '200', '11,200,1230,', '3', '雨花台区', 'yuhuataiqu', '', '210000', '025', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1231', '200', '11,200,1231,', '3', '江宁区', 'jiangningqu', '', '211100', '025', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1232', '200', '11,200,1232,', '3', '六合区', 'liuhequ', '', '211500', '025', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1233', '200', '11,200,1233,', '3', '溧水县', 'shuixian', '', '211200', '025', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1234', '200', '11,200,1234,', '3', '高淳县', 'gaochunxian', '', '211300', '025', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1235', '201', '11,201,1235,', '3', '崇安区', 'chonganqu', '', '214000', '0510', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1236', '201', '11,201,1236,', '3', '南长区', 'nanchangqu', '', '214000', '0510', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1237', '201', '11,201,1237,', '3', '北塘区', 'beitangqu', '', '214000', '0510', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1238', '201', '11,201,1238,', '3', '锡山区', 'xishanqu', '', '214000', '0510', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1239', '201', '11,201,1239,', '3', '惠山区', 'huishanqu', '', '214000', '0510', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1240', '201', '11,201,1240,', '3', '滨湖区', 'binhuqu', '', '214000', '0510', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1241', '201', '11,201,1241,', '3', '江阴', 'jiangyin', '', '214400', '0510', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1242', '201', '11,201,1242,', '3', '宜兴', 'yixing', '', '214200', '0510', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1243', '202', '11,202,1243,', '3', '鼓楼区', 'gulouqu', '', '221000', '0516', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1244', '202', '11,202,1244,', '3', '云龙区', 'yunlongqu', '', '221000', '0516', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1245', '202', '11,202,1245,', '3', '九里区', 'jiuliqu', '', '221000', '0516', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1246', '202', '11,202,1246,', '3', '贾汪区', 'jiawangqu', '', '221000', '0516', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1247', '202', '11,202,1247,', '3', '泉山区', 'quanshanqu', '', '221000', '0516', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1248', '202', '11,202,1248,', '3', '丰县', 'fengxian', '', '221700', '0516', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1249', '202', '11,202,1249,', '3', '沛县', 'peixian', '', '221600', '0516', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1250', '202', '11,202,1250,', '3', '铜山县', 'tongshanxian', '', '221100', '0516', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1251', '202', '11,202,1251,', '3', '睢宁县', 'ningxian', '', '221200', '0516', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1252', '202', '11,202,1252,', '3', '新沂', 'xinyi', '', '221400', '0516', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1253', '202', '11,202,1253,', '3', '邳州', 'pizhou', '', '221300', '0516', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1254', '203', '11,203,1254,', '3', '天宁区', 'tianningqu', '', '213000', '0519', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1255', '203', '11,203,1255,', '3', '钟楼区', 'zhonglouqu', '', '213000', '0519', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1256', '203', '11,203,1256,', '3', '戚墅堰区', 'qishuyanqu', '', '213000', '0519', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1257', '203', '11,203,1257,', '3', '新北区', 'xinbeiqu', '', '213000', '0519', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1258', '203', '11,203,1258,', '3', '武进区', 'wujinqu', '', '213000', '0519', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1259', '203', '11,203,1259,', '3', '溧阳', 'yang', '', '213300', '0519', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1260', '203', '11,203,1260,', '3', '金坛', 'jintan', '', '213200', '0519', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1261', '204', '11,204,1261,', '3', '沧浪区', 'canglangqu', '', '215000', '0512', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1262', '204', '11,204,1262,', '3', '平江区', 'pingjiangqu', '', '215000', '0512', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1263', '204', '11,204,1263,', '3', '金阊区', 'jinqu', '', '215000', '0512', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1264', '204', '11,204,1264,', '3', '虎丘区', 'huqiuqu', '', '215000', '0512', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1265', '204', '11,204,1265,', '3', '吴中区', 'wuzhongqu', '', '215100', '0512', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1266', '204', '11,204,1266,', '3', '相城区', 'xiangchengqu', '', '215100', '0512', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1267', '204', '11,204,1267,', '3', '常熟', 'changshu', '', '215500', '0512', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1268', '204', '11,204,1268,', '3', '张家港', 'zhangjiagang', '', '215600', '0512', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1269', '204', '11,204,1269,', '3', '昆山', 'kunshan', '', '215300', '0512', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1270', '204', '11,204,1270,', '3', '吴江', 'wujiang', '', '215200', '0512', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1271', '204', '11,204,1271,', '3', '太仓', 'taicang', '', '215400', '0512', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1272', '205', '11,205,1272,', '3', '崇川区', 'chongchuanqu', '', '226000', '0513', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1273', '205', '11,205,1273,', '3', '港闸区', 'gangzhaqu', '', '226000', '0513', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1274', '205', '11,205,1274,', '3', '海安县', 'haianxian', '', '226600', '0513', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1275', '205', '11,205,1275,', '3', '如东县', 'rudongxian', '', '226400', '0513', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1276', '205', '11,205,1276,', '3', '启东', 'qidong', '', '226200', '0513', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1277', '205', '11,205,1277,', '3', '如皋', 'rugao', '', '226500', '0513', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1278', '205', '11,205,1278,', '3', '通州', 'tongzhou', '', '226300', '0513', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1279', '205', '11,205,1279,', '3', '海门', 'haimen', '', '226100', '0513', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1280', '206', '11,206,1280,', '3', '连云区', 'lianyunqu', '', '222000', '0518', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1281', '206', '11,206,1281,', '3', '新浦区', 'xinpuqu', '', '222000', '0518', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1282', '206', '11,206,1282,', '3', '海州区', 'haizhouqu', '', '222000', '0518', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1283', '206', '11,206,1283,', '3', '赣榆县', 'ganyuxian', '', '222100', '0518', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1284', '206', '11,206,1284,', '3', '东海县', 'donghaixian', '', '222300', '0518', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1285', '206', '11,206,1285,', '3', '灌云县', 'guanyunxian', '', '222200', '0518', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1286', '206', '11,206,1286,', '3', '灌南县', 'guannanxian', '', '223500', '0518', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1287', '207', '11,207,1287,', '3', '清河区', 'qinghequ', '', '223000', '0517', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1288', '207', '11,207,1288,', '3', '楚州区', 'chuzhouqu', '', '223200', '0517', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1289', '207', '11,207,1289,', '3', '淮阴区', 'huaiyinqu', '', '223300', '0517', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1290', '207', '11,207,1290,', '3', '清浦区', 'qingpuqu', '', '223000', '0517', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1291', '207', '11,207,1291,', '3', '涟水县', 'lianshuixian', '', '223400', '0517', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1292', '207', '11,207,1292,', '3', '洪泽县', 'hongzexian', '', '223100', '0517', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1293', '207', '11,207,1293,', '3', '盱眙县', 'xuyixian', '', '211700', '0517', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1294', '207', '11,207,1294,', '3', '金湖县', 'jinhuxian', '', '211600', '0517', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1295', '208', '11,208,1295,', '3', '亭湖区', 'tinghuqu', '', '224000', '0515', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1296', '208', '11,208,1296,', '3', '盐都区', 'yanduqu', '', '224000', '0515', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1297', '208', '11,208,1297,', '3', '响水县', 'xiangshuixian', '', '224600', '0515', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1298', '208', '11,208,1298,', '3', '滨海县', 'binhaixian', '', '224000', '0515', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1299', '208', '11,208,1299,', '3', '阜宁县', 'funingxian', '', '224400', '0515', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1300', '208', '11,208,1300,', '3', '射阳县', 'sheyangxian', '', '224300', '0515', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1301', '208', '11,208,1301,', '3', '建湖县', 'jianhuxian', '', '224700', '0515', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1302', '208', '11,208,1302,', '3', '东台', 'dongtai', '', '224200', '0515', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1303', '208', '11,208,1303,', '3', '大丰', 'dafeng', '', '224100', '0515', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1304', '209', '11,209,1304,', '3', '广陵区', 'guanglingqu', '', '225000', '0514', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1305', '209', '11,209,1305,', '3', '邗江区', 'jiangqu', '', '225000', '0514', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1306', '209', '11,209,1306,', '3', '维扬区', 'weiyangqu', '', '225000', '0514', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1307', '209', '11,209,1307,', '3', '宝应县', 'baoyingxian', '', '225800', '0514', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1308', '209', '11,209,1308,', '3', '仪征', 'yizheng', '', '211400', '0514', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1309', '209', '11,209,1309,', '3', '高邮', 'gaoyou', '', '225600', '0514', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1310', '209', '11,209,1310,', '3', '江都', 'jiangdu', '', '225200', '0514', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1311', '210', '11,210,1311,', '3', '京口区', 'jingkouqu', '', '212000', '0511', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1312', '210', '11,210,1312,', '3', '润州区', 'runzhouqu', '', '212000', '0511', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1313', '210', '11,210,1313,', '3', '丹徒区', 'dantuqu', '', '212100', '0511', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1314', '210', '11,210,1314,', '3', '丹阳', 'danyang', '', '212300', '0511', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1315', '210', '11,210,1315,', '3', '扬中', 'yangzhong', '', '212200', '0511', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1316', '210', '11,210,1316,', '3', '句容', 'jurong', '', '212400', '0511', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1317', '211', '11,211,1317,', '3', '海陵区', 'hailingqu', '', '225300', '0523', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1318', '211', '11,211,1318,', '3', '高港区', 'gaogangqu', '', '225300', '0523', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1319', '211', '11,211,1319,', '3', '兴化', 'xinghua', '', '225700', '0523', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1320', '211', '11,211,1320,', '3', '靖江', 'jingjiang', '', '214500', '0523', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1321', '211', '11,211,1321,', '3', '泰兴', 'taixing', '', '225400', '0523', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1322', '211', '11,211,1322,', '3', '姜堰', 'jiangyan', '', '225500', '0523', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1323', '212', '11,212,1323,', '3', '宿城区', 'suchengqu', '', '223800', '0527', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1324', '212', '11,212,1324,', '3', '宿豫区', 'suyuqu', '', '223800', '0527', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1325', '212', '11,212,1325,', '3', '沭阳县', 'yangxian', '', '223600', '0527', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1326', '212', '11,212,1326,', '3', '泗阳县', 'yangxian', '', '223700', '0527', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1327', '212', '11,212,1327,', '3', '泗洪县', 'hongxian', '', '223900', '0527', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1328', '213', '12,213,1328,', '3', '上城区', 'shangchengqu', '', '310000', '0571', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1329', '213', '12,213,1329,', '3', '下城区', 'xiachengqu', '', '310000', '0571', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1330', '213', '12,213,1330,', '3', '江干区', 'jiangganqu', '', '310000', '0571', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1331', '213', '12,213,1331,', '3', '拱墅区', 'gongshuqu', '', '310000', '0571', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1332', '213', '12,213,1332,', '3', '西湖区', 'xihuqu', '', '310000', '0571', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1333', '213', '12,213,1333,', '3', '滨江区', 'binjiangqu', '', '310000', '0571', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1334', '213', '12,213,1334,', '3', '萧山区', 'xiaoshanqu', '', '311200', '0571', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1335', '213', '12,213,1335,', '3', '余杭区', 'yuhangqu', '', '311100', '0571', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1336', '213', '12,213,1336,', '3', '桐庐县', 'tongluxian', '', '311500', '0571', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1337', '213', '12,213,1337,', '3', '淳安县', 'chunanxian', '', '311700', '0571', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1338', '213', '12,213,1338,', '3', '建德', 'jiande', '', '311600', '0571', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1339', '213', '12,213,1339,', '3', '富阳', 'fuyang', '', '311400', '0571', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1340', '213', '12,213,1340,', '3', '临安', 'linan', '', '311300', '0571', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1341', '214', '12,214,1341,', '3', '海曙区', 'haishuqu', '', '315000', '0574', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1342', '214', '12,214,1342,', '3', '江东区', 'jiangdongqu', '', '315000', '0574', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1343', '214', '12,214,1343,', '3', '江北区', 'jiangbeiqu', '', '315000', '0574', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1344', '214', '12,214,1344,', '3', '北仑区', 'beilunqu', '', '315800', '0574', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1345', '214', '12,214,1345,', '3', '镇海区', 'zhenhaiqu', '', '315200', '0574', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1346', '214', '12,214,1346,', '3', '鄞州区', 'zhouqu', '', '315100', '0574', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1347', '214', '12,214,1347,', '3', '象山县', 'xiangshanxian', '', '315700', '0574', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1348', '214', '12,214,1348,', '3', '宁海县', 'ninghaixian', '', '315600', '0574', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1349', '214', '12,214,1349,', '3', '余姚', 'yuyao', '', '315400', '0574', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1350', '214', '12,214,1350,', '3', '慈溪', 'cixi', '', '315300', '0574', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1351', '214', '12,214,1351,', '3', '奉化', 'fenghua', '', '315500', '0574', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1352', '215', '12,215,1352,', '3', '鹿城区', 'luchengqu', '', '325000', '0577', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1353', '215', '12,215,1353,', '3', '龙湾区', 'longwanqu', '', '325000', '0577', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1354', '215', '12,215,1354,', '3', '瓯海区', 'haiqu', '', '325000', '0577', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1355', '215', '12,215,1355,', '3', '洞头县', 'dongtouxian', '', '325700', '0577', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1356', '215', '12,215,1356,', '3', '永嘉县', 'yongjiaxian', '', '325100', '0577', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1357', '215', '12,215,1357,', '3', '平阳县', 'pingyangxian', '', '325400', '0577', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1358', '215', '12,215,1358,', '3', '苍南县', 'cangnanxian', '', '325800', '0577', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1359', '215', '12,215,1359,', '3', '文成县', 'wenchengxian', '', '325300', '0577', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1360', '215', '12,215,1360,', '3', '泰顺县', 'taishunxian', '', '325500', '0577', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1361', '215', '12,215,1361,', '3', '瑞安', 'ruian', '', '325200', '0577', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1362', '215', '12,215,1362,', '3', '乐清', 'leqing', '', '325600', '0577', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1363', '216', '12,216,1363,', '3', '秀城区', 'xiuchengqu', '', '314000', '0573', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1364', '216', '12,216,1364,', '3', '秀洲区', 'xiuzhouqu', '', '314000', '0573', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1365', '216', '12,216,1365,', '3', '嘉善县', 'jiashanxian', '', '314100', '0573', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1366', '216', '12,216,1366,', '3', '海盐县', 'haiyanxian', '', '314300', '0573', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1367', '216', '12,216,1367,', '3', '海宁', 'haining', '', '314400', '0573', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1368', '216', '12,216,1368,', '3', '平湖', 'pinghu', '', '314200', '0573', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1369', '216', '12,216,1369,', '3', '桐乡', 'tongxiang', '', '314500', '0573', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1370', '217', '12,217,1370,', '3', '吴兴区', 'wuxingqu', '', '313000', '0572', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1371', '217', '12,217,1371,', '3', '南浔区', 'nanxunqu', '', '313000', '0572', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1372', '217', '12,217,1372,', '3', '德清县', 'deqingxian', '', '313200', '0572', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1373', '217', '12,217,1373,', '3', '长兴县', 'changxingxian', '', '313100', '0572', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1374', '217', '12,217,1374,', '3', '安吉县', 'anjixian', '', '313300', '0572', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1375', '218', '12,218,1375,', '3', '越城区', 'yuechengqu', '', '312000', '0575', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1376', '218', '12,218,1376,', '3', '绍兴县', 'shaoxingxian', '', '312000', '0575', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1377', '218', '12,218,1377,', '3', '新昌县', 'xinchangxian', '', '312500', '0575', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1378', '218', '12,218,1378,', '3', '诸暨', 'zhu', '', '311800', '0575', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1379', '218', '12,218,1379,', '3', '上虞', 'shangyu', '', '312300', '0575', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1380', '218', '12,218,1380,', '3', '嵊州', 'shengzhou', '', '312400', '0575', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1381', '219', '12,219,1381,', '3', '婺城区', 'chengqu', '', '321000', '0579', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1382', '219', '12,219,1382,', '3', '金东区', 'jindongqu', '', '321000', '0579', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1383', '219', '12,219,1383,', '3', '武义县', 'wuyixian', '', '321200', '0579', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1384', '219', '12,219,1384,', '3', '浦江县', 'pujiangxian', '', '322200', '0579', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1385', '219', '12,219,1385,', '3', '磐安县', 'pananxian', '', '322300', '0579', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1386', '219', '12,219,1386,', '3', '兰溪', 'lanxi', '', '321100', '0579', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1387', '219', '12,219,1387,', '3', '义乌', 'yiwu', '', '322000', '0579', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1388', '219', '12,219,1388,', '3', '东阳', 'dongyang', '', '322100', '0579', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1389', '219', '12,219,1389,', '3', '永康', 'yongkang', '', '321300', '0579', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1390', '220', '12,220,1390,', '3', '柯城区', 'kechengqu', '', '324000', '0570', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1391', '220', '12,220,1391,', '3', '衢江区', 'jiangqu', '', '324000', '0570', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1392', '220', '12,220,1392,', '3', '常山县', 'changshanxian', '', '324200', '0570', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1393', '220', '12,220,1393,', '3', '开化县', 'kaihuaxian', '', '324300', '0570', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1394', '220', '12,220,1394,', '3', '龙游县', 'longyouxian', '', '324400', '0570', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1395', '220', '12,220,1395,', '3', '江山', 'jiangshan', '', '324100', '0570', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1396', '221', '12,221,1396,', '3', '定海区', 'dinghaiqu', '', '316000', '0580', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1397', '221', '12,221,1397,', '3', '普陀区', 'putuoqu', '', '316100', '0580', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1398', '221', '12,221,1398,', '3', '岱山县', 'shanxian', '', '316200', '0580', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1399', '221', '12,221,1399,', '3', '嵊泗县', 'shengsixian', '', '202450', '0580', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1400', '222', '12,222,1400,', '3', '椒江区', 'jiaojiangqu', '', '317700', '0576', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1401', '222', '12,222,1401,', '3', '黄岩区', 'huangyanqu', '', '318020', '0576', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1402', '222', '12,222,1402,', '3', '路桥区', 'luqiaoqu', '', '318000', '0576', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1403', '222', '12,222,1403,', '3', '玉环县', 'yuhuanxian', '', '317600', '0576', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1404', '222', '12,222,1404,', '3', '三门县', 'sanmenxian', '', '317100', '0576', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1405', '222', '12,222,1405,', '3', '天台县', 'tiantaixian', '', '317200', '0576', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1406', '222', '12,222,1406,', '3', '仙居县', 'xianjuxian', '', '317300', '0576', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1407', '222', '12,222,1407,', '3', '温岭', 'wenling', '', '317500', '0576', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1408', '222', '12,222,1408,', '3', '临海', 'linhai', '', '317000', '0576', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1409', '223', '12,223,1409,', '3', '莲都区', 'lianduqu', '', '323000', '0578', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1410', '223', '12,223,1410,', '3', '青田县', 'qingtianxian', '', '323900', '0578', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1411', '223', '12,223,1411,', '3', '缙云县', 'yunxian', '', '321400', '0578', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1412', '223', '12,223,1412,', '3', '遂昌县', 'suichangxian', '', '323300', '0578', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1413', '223', '12,223,1413,', '3', '松阳县', 'songyangxian', '', '323400', '0578', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1414', '223', '12,223,1414,', '3', '云和县', 'yunhexian', '', '323600', '0578', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1415', '223', '12,223,1415,', '3', '庆元县', 'qingyuanxian', '', '323800', '0578', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1416', '223', '12,223,1416,', '3', '景宁畲族自治县', 'jingningzuzizhixian', '', '323500', '0578', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1417', '223', '12,223,1417,', '3', '龙泉', 'longquan', '', '323700', '0578', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1418', '224', '13,224,1418,', '3', '瑶海区', 'yaohaiqu', '', '230000', '0551', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1419', '224', '13,224,1419,', '3', '庐阳区', 'luyangqu', '', '230000', '0551', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1420', '224', '13,224,1420,', '3', '蜀山区', 'shushanqu', '', '230000', '0551', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1421', '224', '13,224,1421,', '3', '包河区', 'baohequ', '', '230000', '0551', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1422', '224', '13,224,1422,', '3', '长丰县', 'changfengxian', '', '231100', '0551', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1423', '224', '13,224,1423,', '3', '肥东县', 'feidongxian', '', '230000', '0551', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1424', '224', '13,224,1424,', '3', '肥西县', 'feixixian', '', '231200', '0551', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1425', '225', '13,225,1425,', '3', '镜湖区', 'jinghuqu', '', '241000', '0553', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1426', '225', '13,225,1426,', '3', '弋江区', 'jiangqu', '', '241000', '0553', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1427', '225', '13,225,1427,', '3', '鸠江区', 'jiangqu', '', '241000', '0553', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1428', '225', '13,225,1428,', '3', '三山区', 'sanshanqu', '', '241000', '0553', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1429', '225', '13,225,1429,', '3', '芜湖县', 'wuhuxian', '', '241100', '0553', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1430', '225', '13,225,1430,', '3', '繁昌县', 'fanchangxian', '', '241200', '0553', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1431', '225', '13,225,1431,', '3', '南陵县', 'nanlingxian', '', '242400', '0553', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1432', '226', '13,226,1432,', '3', '龙子湖区', 'longzihuqu', '', '233000', '0552', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1433', '226', '13,226,1433,', '3', '蚌山区', 'bangshanqu', '', '233000', '0552', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1434', '226', '13,226,1434,', '3', '禹会区', 'yuhuiqu', '', '233000', '0552', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1435', '226', '13,226,1435,', '3', '淮上区', 'huaishangqu', '', '233000', '0552', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1436', '226', '13,226,1436,', '3', '怀远县', 'huaiyuanxian', '', '233400', '0552', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1437', '226', '13,226,1437,', '3', '五河县', 'wuhexian', '', '233300', '0552', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1438', '226', '13,226,1438,', '3', '固镇县', 'guzhenxian', '', '233700', '0552', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1439', '227', '13,227,1439,', '3', '大通区', 'datongqu', '', '232000', '0554', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1440', '227', '13,227,1440,', '3', '田家庵区', 'tianjiaqu', '', '232000', '0554', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1441', '227', '13,227,1441,', '3', '谢家集区', 'xiejiajiqu', '', '232000', '0554', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1442', '227', '13,227,1442,', '3', '八公山区', 'bagongshanqu', '', '232000', '0554', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1443', '227', '13,227,1443,', '3', '潘集区', 'panjiqu', '', '232000', '0554', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1444', '227', '13,227,1444,', '3', '凤台县', 'fengtaixian', '', '232100', '0554', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1445', '228', '13,228,1445,', '3', '金家庄区', 'jinjiazhuangqu', '', '243000', '0555', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1446', '228', '13,228,1446,', '3', '花山区', 'huashanqu', '', '243000', '0555', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1447', '228', '13,228,1447,', '3', '雨山区', 'yushanqu', '', '243000', '0555', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1448', '228', '13,228,1448,', '3', '当涂县', 'dangtuxian', '', '243100', '0555', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1449', '229', '13,229,1449,', '3', '杜集区', 'dujiqu', '', '235000', '0561', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1450', '229', '13,229,1450,', '3', '相山区', 'xiangshanqu', '', '235000', '0561', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1451', '229', '13,229,1451,', '3', '烈山区', 'lieshanqu', '', '235000', '0561', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1452', '229', '13,229,1452,', '3', '濉溪县', 'xixian', '', '235100', '0561', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1453', '230', '13,230,1453,', '3', '铜官山区', 'tongguanshanqu', '', '244000', '0562', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1454', '230', '13,230,1454,', '3', '狮子山区', 'shizishanqu', '', '244000', '0562', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1455', '230', '13,230,1455,', '3', '郊区', 'jiaoqu', '', '244000', '0562', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1456', '230', '13,230,1456,', '3', '铜陵县', 'tonglingxian', '', '244100', '0562', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1457', '231', '13,231,1457,', '3', '迎江区', 'yingjiangqu', '', '246000', '0556', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1458', '231', '13,231,1458,', '3', '大观区', 'daguanqu', '', '246000', '0556', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1459', '231', '13,231,1459,', '3', '宜秀区', 'yixiuqu', '', '246000', '0556', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1460', '231', '13,231,1460,', '3', '怀宁县', 'huainingxian', '', '246100', '0556', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1461', '231', '13,231,1461,', '3', '枞阳县', 'yangxian', '', '246700', '0556', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1462', '231', '13,231,1462,', '3', '潜山县', 'qianshanxian', '', '246300', '0556', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1463', '231', '13,231,1463,', '3', '太湖县', 'taihuxian', '', '246400', '0556', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1464', '231', '13,231,1464,', '3', '宿松县', 'susongxian', '', '246500', '0556', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1465', '231', '13,231,1465,', '3', '望江县', 'wangjiangxian', '', '246200', '0556', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1466', '231', '13,231,1466,', '3', '岳西县', 'yuexixian', '', '246600', '0556', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1467', '231', '13,231,1467,', '3', '桐城', 'tongcheng', '', '231400', '0556', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1468', '232', '13,232,1468,', '3', '屯溪区', 'tunxiqu', '', '245000', '0559', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1469', '232', '13,232,1469,', '3', '黄山区', 'huangshanqu', '', '242700', '0559', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1470', '232', '13,232,1470,', '3', '徽州区', 'huizhouqu', '', '245060', '0559', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1471', '232', '13,232,1471,', '3', '歙县', 'shexian', '', '245200', '0559', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1472', '232', '13,232,1472,', '3', '休宁县', 'xiuningxian', '', '245400', '0559', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1473', '232', '13,232,1473,', '3', '黟县', 'yixian', '', '245500', '0559', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1474', '232', '13,232,1474,', '3', '祁门县', 'qimenxian', '', '245600', '0559', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1475', '233', '13,233,1475,', '3', '琅琊区', 'langqu', '', '239000', '0550', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1476', '233', '13,233,1476,', '3', '南谯区', 'nanqiaoqu', '', '239000', '0550', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1477', '233', '13,233,1477,', '3', '来安县', 'laianxian', '', '239200', '0550', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1478', '233', '13,233,1478,', '3', '全椒县', 'quanjiaoxian', '', '239500', '0550', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1479', '233', '13,233,1479,', '3', '定远县', 'dingyuanxian', '', '233200', '0550', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1480', '233', '13,233,1480,', '3', '凤阳县', 'fengyangxian', '', '233100', '0550', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1481', '233', '13,233,1481,', '3', '天长', 'tianchang', '', '239300', '0550', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1482', '233', '13,233,1482,', '3', '明光', 'mingguang', '', '239400', '0550', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1483', '234', '13,234,1483,', '3', '颍州区', 'zhouqu', '', '236000', '0558', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1484', '234', '13,234,1484,', '3', '颍东区', 'dongqu', '', '236000', '0558', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1485', '234', '13,234,1485,', '3', '颍泉区', 'quanqu', '', '236000', '0558', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1486', '234', '13,234,1486,', '3', '临泉县', 'linquanxian', '', '236400', '0558', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1487', '234', '13,234,1487,', '3', '太和县', 'taihexian', '', '236600', '0558', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1488', '234', '13,234,1488,', '3', '阜南县', 'funanxian', '', '236300', '0558', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1489', '234', '13,234,1489,', '3', '颍上县', 'shangxian', '', '236200', '0558', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1490', '234', '13,234,1490,', '3', '界首', 'jieshou', '', '236500', '0558', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1491', '235', '13,235,1491,', '3', '埇桥区', 'yongqiaoqu', '', '234000', '0557', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1492', '235', '13,235,1492,', '3', '砀山县', 'shanxian', '', '235300', '0557', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1493', '235', '13,235,1493,', '3', '萧县', 'xiaoxian', '', '235200', '0557', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1494', '235', '13,235,1494,', '3', '灵璧县', 'lingxian', '', '234200', '0557', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1495', '235', '13,235,1495,', '3', '泗县', 'sixian', '', '234300', '0557', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1496', '236', '13,236,1496,', '3', '居巢区', 'juchaoqu', '', '238000', '0565', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1497', '236', '13,236,1497,', '3', '庐江县', 'lujiangxian', '', '231500', '0565', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1498', '236', '13,236,1498,', '3', '无为县', 'wuweixian', '', '238300', '0565', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1499', '236', '13,236,1499,', '3', '含山县', 'hanshanxian', '', '238100', '0565', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1500', '236', '13,236,1500,', '3', '和县', 'hexian', '', '238200', '0565', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1501', '237', '13,237,1501,', '3', '金安区', 'jinanqu', '', '237000', '0564', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1502', '237', '13,237,1502,', '3', '裕安区', 'yuanqu', '', '237000', '0564', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1503', '237', '13,237,1503,', '3', '寿县', 'shouxian', '', '232200', '0564', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1504', '237', '13,237,1504,', '3', '霍邱县', 'huoqiuxian', '', '237400', '0564', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1505', '237', '13,237,1505,', '3', '舒城县', 'shuchengxian', '', '231300', '0564', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1506', '237', '13,237,1506,', '3', '金寨县', 'jinzhaixian', '', '237300', '0564', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1507', '237', '13,237,1507,', '3', '霍山县', 'huoshanxian', '', '237200', '0564', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1508', '238', '13,238,1508,', '3', '谯城区', 'chengqu', '', '236800', '0558', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1509', '238', '13,238,1509,', '3', '涡阳县', 'woyangxian', '', '233600', '0558', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1510', '238', '13,238,1510,', '3', '蒙城县', 'mengchengxian', '', '233500', '0558', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1511', '238', '13,238,1511,', '3', '利辛县', 'lixinxian', '', '236700', '0558', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1512', '239', '13,239,1512,', '3', '贵池区', 'guichiqu', '', '247100', '0566', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1513', '239', '13,239,1513,', '3', '东至县', 'dongzhixian', '', '247200', '0566', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1514', '239', '13,239,1514,', '3', '石台县', 'shitaixian', '', '245100', '0566', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1515', '239', '13,239,1515,', '3', '青阳县', 'qingyangxian', '', '242800', '0566', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1516', '240', '13,240,1516,', '3', '宣州区', 'xuanzhouqu', '', '242000', '0563', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1517', '240', '13,240,1517,', '3', '郎溪县', 'langxixian', '', '242100', '0563', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1518', '240', '13,240,1518,', '3', '广德县', 'guangdexian', '', '242200', '0563', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1519', '240', '13,240,1519,', '3', '泾县', 'jingxian', '', '242500', '0563', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1520', '240', '13,240,1520,', '3', '绩溪县', 'jixixian', '', '245300', '0563', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1521', '240', '13,240,1521,', '3', '旌德县', 'dexian', '', '242600', '0563', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1522', '240', '13,240,1522,', '3', '宁国', 'ningguo', '', '242300', '0563', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1523', '241', '14,241,1523,', '3', '鼓楼区', 'gulouqu', '', '350000', '0591', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1524', '241', '14,241,1524,', '3', '台江区', 'taijiangqu', '', '350000', '0591', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1525', '241', '14,241,1525,', '3', '仓山区', 'cangshanqu', '', '350000', '0591', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1526', '241', '14,241,1526,', '3', '马尾区', 'maweiqu', '', '350000', '0591', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1527', '241', '14,241,1527,', '3', '晋安区', 'jinanqu', '', '350000', '0591', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1528', '241', '14,241,1528,', '3', '闽侯县', 'minhouxian', '', '350100', '0591', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1529', '241', '14,241,1529,', '3', '连江县', 'lianjiangxian', '', '350500', '0591', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1530', '241', '14,241,1530,', '3', '罗源县', 'luoyuanxian', '', '350600', '0591', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1531', '241', '14,241,1531,', '3', '闽清县', 'minqingxian', '', '350800', '0591', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1532', '241', '14,241,1532,', '3', '永泰县', 'yongtaixian', '', '350700', '0591', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1533', '241', '14,241,1533,', '3', '平潭县', 'pingtanxian', '', '350400', '0591', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1534', '241', '14,241,1534,', '3', '福清', 'fuqing', '', '350300', '0591', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1535', '241', '14,241,1535,', '3', '长乐', 'changle', '', '350200', '0591', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1536', '242', '14,242,1536,', '3', '思明区', 'simingqu', '', '361000', '0592', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1537', '242', '14,242,1537,', '3', '海沧区', 'haicangqu', '', '361000', '0592', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1538', '242', '14,242,1538,', '3', '湖里区', 'huliqu', '', '361000', '0592', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1539', '242', '14,242,1539,', '3', '集美区', 'jimeiqu', '', '361000', '0592', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1540', '242', '14,242,1540,', '3', '同安区', 'tonganqu', '', '361100', '0592', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1541', '242', '14,242,1541,', '3', '翔安区', 'xianganqu', '', '361100', '0592', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1542', '243', '14,243,1542,', '3', '城厢区', 'chengxiangqu', '', '351100', '0594', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1543', '243', '14,243,1543,', '3', '涵江区', 'hanjiangqu', '', '351100', '0594', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1544', '243', '14,243,1544,', '3', '荔城区', 'lichengqu', '', '351100', '0594', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1545', '243', '14,243,1545,', '3', '秀屿区', 'xiuyuqu', '', '351100', '0594', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1546', '243', '14,243,1546,', '3', '仙游县', 'xianyouxian', '', '351200', '0594', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1547', '244', '14,244,1547,', '3', '梅列区', 'meiliequ', '', '365000', '0598', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1548', '244', '14,244,1548,', '3', '三元区', 'sanyuanqu', '', '365000', '0598', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1549', '244', '14,244,1549,', '3', '明溪县', 'mingxixian', '', '365300', '0598', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1550', '244', '14,244,1550,', '3', '清流县', 'qingliuxian', '', '365300', '0598', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1551', '244', '14,244,1551,', '3', '宁化县', 'ninghuaxian', '', '365400', '0598', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1552', '244', '14,244,1552,', '3', '大田县', 'datianxian', '', '366100', '0598', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1553', '244', '14,244,1553,', '3', '尤溪县', 'youxixian', '', '365100', '0598', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1554', '244', '14,244,1554,', '3', '沙县', 'shaxian', '', '365500', '0598', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1555', '244', '14,244,1555,', '3', '将乐县', 'jianglexian', '', '353300', '0598', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1556', '244', '14,244,1556,', '3', '泰宁县', 'tainingxian', '', '354400', '0598', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1557', '244', '14,244,1557,', '3', '建宁县', 'jianningxian', '', '354500', '0598', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1558', '244', '14,244,1558,', '3', '永安', 'yongan', '', '366000', '0598', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1559', '245', '14,245,1559,', '3', '鲤城区', 'lichengqu', '', '362000', '0595', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1560', '245', '14,245,1560,', '3', '丰泽区', 'fengzequ', '', '362000', '0595', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1561', '245', '14,245,1561,', '3', '洛江区', 'luojiangqu', '', '362000', '0595', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1562', '245', '14,245,1562,', '3', '泉港区', 'quangangqu', '', '362100', '0595', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1563', '245', '14,245,1563,', '3', '惠安县', 'huianxian', '', '362100', '0595', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1564', '245', '14,245,1564,', '3', '安溪县', 'anxixian', '', '362400', '0595', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1565', '245', '14,245,1565,', '3', '永春县', 'yongchunxian', '', '362600', '0595', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1566', '245', '14,245,1566,', '3', '德化县', 'dehuaxian', '', '362500', '0595', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1567', '245', '14,245,1567,', '3', '金门县', 'jinmenxian', '', '362000', '0595', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1568', '245', '14,245,1568,', '3', '石狮', 'shishi', '', '362700', '0595', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1569', '245', '14,245,1569,', '3', '晋江', 'jinjiang', '', '362200', '0595', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1570', '245', '14,245,1570,', '3', '南安', 'nanan', '', '362300', '0595', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1571', '246', '14,246,1571,', '3', '芗城区', 'chengqu', '', '363000', '0596', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1572', '246', '14,246,1572,', '3', '龙文区', 'longwenqu', '', '363000', '0596', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1573', '246', '14,246,1573,', '3', '云霄县', 'yunxiaoxian', '', '363300', '0596', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1574', '246', '14,246,1574,', '3', '漳浦县', 'zhangpuxian', '', '363200', '0596', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1575', '246', '14,246,1575,', '3', '诏安县', 'anxian', '', '363500', '0596', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1576', '246', '14,246,1576,', '3', '长泰县', 'changtaixian', '', '363900', '0596', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1577', '246', '14,246,1577,', '3', '东山县', 'dongshanxian', '', '363400', '0596', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1578', '246', '14,246,1578,', '3', '南靖县', 'nanjingxian', '', '363600', '0596', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1579', '246', '14,246,1579,', '3', '平和县', 'pinghexian', '', '363700', '0596', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1580', '246', '14,246,1580,', '3', '华安县', 'huaanxian', '', '363800', '0596', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1581', '246', '14,246,1581,', '3', '龙海', 'longhai', '', '363100', '0596', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1582', '247', '14,247,1582,', '3', '延平区', 'yanpingqu', '', '353000', '0599', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1583', '247', '14,247,1583,', '3', '顺昌县', 'shunchangxian', '', '353200', '0599', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1584', '247', '14,247,1584,', '3', '浦城县', 'puchengxian', '', '353400', '0599', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1585', '247', '14,247,1585,', '3', '光泽县', 'guangzexian', '', '354100', '0599', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1586', '247', '14,247,1586,', '3', '松溪县', 'songxixian', '', '353500', '0599', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1587', '247', '14,247,1587,', '3', '政和县', 'zhenghexian', '', '353600', '0599', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1588', '247', '14,247,1588,', '3', '邵武', 'shaowu', '', '354000', '0599', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1589', '247', '14,247,1589,', '3', '武夷山', 'wuyishan', '', '354300', '0599', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1590', '247', '14,247,1590,', '3', '建瓯', 'jian', '', '353100', '0599', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1591', '247', '14,247,1591,', '3', '建阳', 'jianyang', '', '354200', '0599', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1592', '248', '14,248,1592,', '3', '新罗区', 'xinluoqu', '', '364000', '0597', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1593', '248', '14,248,1593,', '3', '长汀县', 'changtingxian', '', '366300', '0597', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1594', '248', '14,248,1594,', '3', '永定县', 'yongdingxian', '', '364100', '0597', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1595', '248', '14,248,1595,', '3', '上杭县', 'shanghangxian', '', '364200', '0597', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1596', '248', '14,248,1596,', '3', '武平县', 'wupingxian', '', '364300', '0597', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1597', '248', '14,248,1597,', '3', '连城县', 'lianchengxian', '', '366200', '0597', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1598', '248', '14,248,1598,', '3', '漳平', 'zhangping', '', '364400', '0597', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1599', '249', '14,249,1599,', '3', '蕉城区', 'jiaochengqu', '', '352000', '0593', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1600', '249', '14,249,1600,', '3', '霞浦县', 'xiapuxian', '', '355100', '0593', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1601', '249', '14,249,1601,', '3', '古田县', 'gutianxian', '', '352200', '0593', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1602', '249', '14,249,1602,', '3', '屏南县', 'pingnanxian', '', '352300', '0593', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1603', '249', '14,249,1603,', '3', '寿宁县', 'shouningxian', '', '355500', '0593', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1604', '249', '14,249,1604,', '3', '周宁县', 'zhouningxian', '', '355400', '0593', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1605', '249', '14,249,1605,', '3', '柘荣县', 'rongxian', '', '355300', '0593', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1606', '249', '14,249,1606,', '3', '福安', 'fuan', '', '355000', '0593', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1607', '249', '14,249,1607,', '3', '福鼎', 'fuding', '', '355200', '0593', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1608', '250', '15,250,1608,', '3', '东湖区', 'donghuqu', '', '330000', '0791', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1609', '250', '15,250,1609,', '3', '西湖区', 'xihuqu', '', '330000', '0791', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1610', '250', '15,250,1610,', '3', '青云谱区', 'qingyunpuqu', '', '330000', '0791', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1611', '250', '15,250,1611,', '3', '湾里区', 'wanliqu', '', '330000', '0791', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1612', '250', '15,250,1612,', '3', '青山湖区', 'qingshanhuqu', '', '330000', '0791', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1613', '250', '15,250,1613,', '3', '南昌县', 'nanchangxian', '', '330200', '0791', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1614', '250', '15,250,1614,', '3', '新建县', 'xinjianxian', '', '330100', '0791', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1615', '250', '15,250,1615,', '3', '安义县', 'anyixian', '', '330500', '0791', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1616', '250', '15,250,1616,', '3', '进贤县', 'jinxianxian', '', '331700', '0791', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1617', '251', '15,251,1617,', '3', '昌江区', 'changjiangqu', '', '333000', '0798', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1618', '251', '15,251,1618,', '3', '珠山区', 'zhushanqu', '', '333000', '0798', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1619', '251', '15,251,1619,', '3', '浮梁县', 'fuliangxian', '', '333400', '0798', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1620', '251', '15,251,1620,', '3', '乐平', 'leping', '', '333300', '0798', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1621', '252', '15,252,1621,', '3', '安源区', 'anyuanqu', '', '337000', '0799', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1622', '252', '15,252,1622,', '3', '湘东区', 'xiangdongqu', '', '337000', '0799', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1623', '252', '15,252,1623,', '3', '莲花县', 'lianhuaxian', '', '337100', '0799', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1624', '252', '15,252,1624,', '3', '上栗县', 'shanglixian', '', '337000', '0799', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1625', '252', '15,252,1625,', '3', '芦溪县', 'luxixian', '', '337000', '0799', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1626', '253', '15,253,1626,', '3', '庐山区', 'lushanqu', '', '332900', '0792', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1627', '253', '15,253,1627,', '3', '浔阳区', 'yangqu', '', '332000', '0792', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1628', '253', '15,253,1628,', '3', '九江县', 'jiujiangxian', '', '332100', '0792', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1629', '253', '15,253,1629,', '3', '武宁县', 'wuningxian', '', '332300', '0792', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1630', '253', '15,253,1630,', '3', '修水县', 'xiushuixian', '', '332400', '0792', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1631', '253', '15,253,1631,', '3', '永修县', 'yongxiuxian', '', '330300', '0792', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1632', '253', '15,253,1632,', '3', '德安县', 'deanxian', '', '330400', '0792', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1633', '253', '15,253,1633,', '3', '星子县', 'xingzixian', '', '332800', '0792', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1634', '253', '15,253,1634,', '3', '都昌县', 'duchangxian', '', '332600', '0792', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1635', '253', '15,253,1635,', '3', '湖口县', 'hukouxian', '', '332500', '0792', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1636', '253', '15,253,1636,', '3', '彭泽县', 'pengzexian', '', '332700', '0792', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1637', '253', '15,253,1637,', '3', '瑞昌', 'ruichang', '', '332200', '0792', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1638', '254', '15,254,1638,', '3', '渝水区', 'yushuiqu', '', '336500', '0790', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1639', '254', '15,254,1639,', '3', '分宜县', 'fenyixian', '', '336600', '0790', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1640', '255', '15,255,1640,', '3', '月湖区', 'yuehuqu', '', '335000', '0701', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1641', '255', '15,255,1641,', '3', '余江县', 'yujiangxian', '', '335200', '0701', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1642', '255', '15,255,1642,', '3', '贵溪', 'guixi', '', '335400', '0701', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1643', '256', '15,256,1643,', '3', '章贡区', 'zhanggongqu', '', '341000', '0797', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1644', '256', '15,256,1644,', '3', '赣县', 'ganxian', '', '341100', '0797', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1645', '256', '15,256,1645,', '3', '信丰县', 'xinfengxian', '', '341600', '0797', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1646', '256', '15,256,1646,', '3', '大余县', 'dayuxian', '', '341500', '0797', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1647', '256', '15,256,1647,', '3', '上犹县', 'shangyouxian', '', '341200', '0797', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1648', '256', '15,256,1648,', '3', '崇义县', 'chongyixian', '', '341300', '0797', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1649', '256', '15,256,1649,', '3', '安远县', 'anyuanxian', '', '342100', '0797', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1650', '256', '15,256,1650,', '3', '龙南县', 'longnanxian', '', '341700', '0797', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1651', '256', '15,256,1651,', '3', '定南县', 'dingnanxian', '', '341900', '0797', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1652', '256', '15,256,1652,', '3', '全南县', 'quannanxian', '', '341800', '0797', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1653', '256', '15,256,1653,', '3', '宁都县', 'ningduxian', '', '342800', '0797', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1654', '256', '15,256,1654,', '3', '于都县', 'yuduxian', '', '342300', '0797', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1655', '256', '15,256,1655,', '3', '兴国县', 'xingguoxian', '', '342400', '0797', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1656', '256', '15,256,1656,', '3', '会昌县', 'huichangxian', '', '342600', '0797', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1657', '256', '15,256,1657,', '3', '寻乌县', 'xunwuxian', '', '342200', '0797', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1658', '256', '15,256,1658,', '3', '石城县', 'shichengxian', '', '342700', '0797', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1659', '256', '15,256,1659,', '3', '瑞金', 'ruijin', '', '342500', '0797', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1660', '256', '15,256,1660,', '3', '南康', 'nankang', '', '341400', '0797', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1661', '257', '15,257,1661,', '3', '吉州区', 'jizhouqu', '', '343000', '0796', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1662', '257', '15,257,1662,', '3', '青原区', 'qingyuanqu', '', '343000', '0796', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1663', '257', '15,257,1663,', '3', '吉安县', 'jianxian', '', '343100', '0796', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1664', '257', '15,257,1664,', '3', '吉水县', 'jishuixian', '', '331600', '0796', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1665', '257', '15,257,1665,', '3', '峡江县', 'xiajiangxian', '', '331400', '0796', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1666', '257', '15,257,1666,', '3', '新干县', 'xinganxian', '', '331300', '0796', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1667', '257', '15,257,1667,', '3', '永丰县', 'yongfengxian', '', '331500', '0796', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1668', '257', '15,257,1668,', '3', '泰和县', 'taihexian', '', '343700', '0796', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1669', '257', '15,257,1669,', '3', '遂川县', 'suichuanxian', '', '343900', '0796', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1670', '257', '15,257,1670,', '3', '万安县', 'wananxian', '', '343800', '0796', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1671', '257', '15,257,1671,', '3', '安福县', 'anfuxian', '', '343200', '0796', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1672', '257', '15,257,1672,', '3', '永新县', 'yongxinxian', '', '343400', '0796', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1673', '257', '15,257,1673,', '3', '井冈山', 'jinggangshan', '', '343600', '0796', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1674', '258', '15,258,1674,', '3', '袁州区', 'yuanzhouqu', '', '336000', '0795', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1675', '258', '15,258,1675,', '3', '奉新县', 'fengxinxian', '', '330700', '0795', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1676', '258', '15,258,1676,', '3', '万载县', 'wanzaixian', '', '336100', '0795', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1677', '258', '15,258,1677,', '3', '上高县', 'shanggaoxian', '', '336400', '0795', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1678', '258', '15,258,1678,', '3', '宜丰县', 'yifengxian', '', '336300', '0795', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1679', '258', '15,258,1679,', '3', '靖安县', 'jinganxian', '', '330600', '0795', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1680', '258', '15,258,1680,', '3', '铜鼓县', 'tongguxian', '', '336200', '0795', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1681', '258', '15,258,1681,', '3', '丰城', 'fengcheng', '', '331100', '0795', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1682', '258', '15,258,1682,', '3', '樟树', 'zhangshu', '', '331200', '0795', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1683', '258', '15,258,1683,', '3', '高安', 'gaoan', '', '330800', '0795', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1684', '259', '15,259,1684,', '3', '临川区', 'linchuanqu', '', '344100', '0794', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1685', '259', '15,259,1685,', '3', '南城县', 'nanchengxian', '', '344700', '0794', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1686', '259', '15,259,1686,', '3', '黎川县', 'lichuanxian', '', '344600', '0794', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1687', '259', '15,259,1687,', '3', '南丰县', 'nanfengxian', '', '344500', '0794', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1688', '259', '15,259,1688,', '3', '崇仁县', 'chongrenxian', '', '344200', '0794', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1689', '259', '15,259,1689,', '3', '乐安县', 'leanxian', '', '344300', '0794', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1690', '259', '15,259,1690,', '3', '宜黄县', 'yihuangxian', '', '344400', '0794', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1691', '259', '15,259,1691,', '3', '金溪县', 'jinxixian', '', '344800', '0794', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1692', '259', '15,259,1692,', '3', '资溪县', 'zixixian', '', '335300', '0794', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1693', '259', '15,259,1693,', '3', '东乡县', 'dongxiangxian', '', '331800', '0794', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1694', '259', '15,259,1694,', '3', '广昌县', 'guangchangxian', '', '344900', '0794', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1695', '260', '15,260,1695,', '3', '信州区', 'xinzhouqu', '', '334000', '0793', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1696', '260', '15,260,1696,', '3', '上饶县', 'shangraoxian', '', '334100', '0793', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1697', '260', '15,260,1697,', '3', '广丰县', 'guangfengxian', '', '334600', '0793', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1698', '260', '15,260,1698,', '3', '玉山县', 'yushanxian', '', '334700', '0793', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1699', '260', '15,260,1699,', '3', '铅山县', 'qianshanxian', '', '334500', '0793', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1700', '260', '15,260,1700,', '3', '横峰县', 'hengfengxian', '', '334300', '0793', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1701', '260', '15,260,1701,', '3', '弋阳县', 'yangxian', '', '334400', '0793', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1702', '260', '15,260,1702,', '3', '余干县', 'yuganxian', '', '335100', '0793', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1703', '260', '15,260,1703,', '3', '鄱阳县', 'yangxian', '', '333100', '0793', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1704', '260', '15,260,1704,', '3', '万年县', 'wannianxian', '', '335500', '0793', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1705', '260', '15,260,1705,', '3', '婺源县', 'yuanxian', '', '333200', '0793', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1706', '260', '15,260,1706,', '3', '德兴', 'dexing', '', '334200', '0793', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1707', '261', '16,261,1707,', '3', '历下区', 'lixiaqu', '', '250000', '0531', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1708', '261', '16,261,1708,', '3', '中区', 'zhongqu', '', '250000', '0531', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1709', '261', '16,261,1709,', '3', '槐荫区', 'huaiyinqu', '', '250000', '0531', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1710', '261', '16,261,1710,', '3', '天桥区', 'tianqiaoqu', '', '250000', '0531', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1711', '261', '16,261,1711,', '3', '历城区', 'lichengqu', '', '250100', '0531', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1712', '261', '16,261,1712,', '3', '长清区', 'changqingqu', '', '250300', '0531', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1713', '261', '16,261,1713,', '3', '平阴县', 'pingyinxian', '', '250400', '0531', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1714', '261', '16,261,1714,', '3', '济阳县', 'jiyangxian', '', '251400', '0531', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1715', '261', '16,261,1715,', '3', '商河县', 'shanghexian', '', '251600', '0531', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1716', '261', '16,261,1716,', '3', '章丘', 'zhangqiu', '', '250200', '0531', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1717', '262', '16,262,1717,', '3', '南区', 'qdnq', '', '266000', '0532', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1718', '262', '16,262,1718,', '3', '北区', 'sdbq', '', '266000', '0532', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1719', '262', '16,262,1719,', '3', '四方区', 'sifangqu', '', '266000', '0532', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1720', '262', '16,262,1720,', '3', '黄岛区', 'huangdaoqu', '', '266000', '0532', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1721', '262', '16,262,1721,', '3', '崂山区', 'shanqu', '', '266100', '0532', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1722', '262', '16,262,1722,', '3', '李沧区', 'licangqu', '', '266000', '0532', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1723', '262', '16,262,1723,', '3', '城阳区', 'chengyangqu', '', '266000', '0532', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1724', '262', '16,262,1724,', '3', '胶州', 'jiaozhou', '', '266300', '0532', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1725', '262', '16,262,1725,', '3', '即墨', 'jimo', '', '266200', '0532', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1726', '262', '16,262,1726,', '3', '平度', 'pingdu', '', '266700', '0532', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1727', '262', '16,262,1727,', '3', '胶南', 'jiaonan', '', '266400', '0532', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1728', '262', '16,262,1728,', '3', '莱西', 'laixi', '', '266600', '0532', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1729', '263', '16,263,1729,', '3', '淄川区', 'zichuanqu', '', '255100', '0533', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1730', '263', '16,263,1730,', '3', '张店区', 'zhangdianqu', '', '255000', '0533', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1731', '263', '16,263,1731,', '3', '博山区', 'boshanqu', '', '255200', '0533', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1732', '263', '16,263,1732,', '3', '临淄区', 'linziqu', '', '255400', '0533', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1733', '263', '16,263,1733,', '3', '周村区', 'zhoucunqu', '', '255300', '0533', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1734', '263', '16,263,1734,', '3', '桓台县', 'huantaixian', '', '256400', '0533', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1735', '263', '16,263,1735,', '3', '高青县', 'gaoqingxian', '', '256300', '0533', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1736', '263', '16,263,1736,', '3', '沂源县', 'yiyuanxian', '', '256100', '0533', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1737', '264', '16,264,1737,', '3', '中区', 'zhongqu', '', '277000', '0632', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1738', '264', '16,264,1738,', '3', '薛城区', 'xuechengqu', '', '277000', '0632', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1739', '264', '16,264,1739,', '3', '峄城区', 'chengqu', '', '277300', '0632', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1740', '264', '16,264,1740,', '3', '台儿庄区', 'taierzhuangqu', '', '277400', '0632', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1741', '264', '16,264,1741,', '3', '山亭区', 'shantingqu', '', '277200', '0632', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1742', '264', '16,264,1742,', '3', '滕州', 'tengzhou', '', '277500', '0632', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1743', '265', '16,265,1743,', '3', '东营区', 'dongyingqu', '', '257100', '0546', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1744', '265', '16,265,1744,', '3', '河口区', 'hekouqu', '', '257200', '0546', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1745', '265', '16,265,1745,', '3', '垦利县', 'kenlixian', '', '257500', '0546', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1746', '265', '16,265,1746,', '3', '利津县', 'lijinxian', '', '257400', '0546', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1747', '265', '16,265,1747,', '3', '广饶县', 'guangraoxian', '', '257300', '0546', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1748', '266', '16,266,1748,', '3', '芝罘区', 'zhiqu', '', '264000', '0535', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1749', '266', '16,266,1749,', '3', '福山区', 'fushanqu', '', '265500', '0535', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1750', '266', '16,266,1750,', '3', '牟平区', 'moupingqu', '', '264100', '0535', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1751', '266', '16,266,1751,', '3', '莱山区', 'laishanqu', '', '264000', '0535', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1752', '266', '16,266,1752,', '3', '长岛县', 'changdaoxian', '', '265800', '0535', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1753', '266', '16,266,1753,', '3', '龙口', 'longkou', '', '265700', '0535', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1754', '266', '16,266,1754,', '3', '莱阳', 'laiyang', '', '265200', '0535', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1755', '266', '16,266,1755,', '3', '莱州', 'laizhou', '', '261400', '0535', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1756', '266', '16,266,1756,', '3', '蓬莱', 'penglai', '', '265600', '0535', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1757', '266', '16,266,1757,', '3', '招远', 'zhaoyuan', '', '265400', '0535', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1758', '266', '16,266,1758,', '3', '栖霞', 'qixia', '', '265300', '0535', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1759', '266', '16,266,1759,', '3', '海阳', 'haiyang', '', '265100', '0535', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1760', '267', '16,267,1760,', '3', '潍城区', 'weichengqu', '', '261000', '0536', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1761', '267', '16,267,1761,', '3', '寒亭区', 'hantingqu', '', '261100', '0536', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1762', '267', '16,267,1762,', '3', '坊子区', 'fangziqu', '', '261200', '0536', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1763', '267', '16,267,1763,', '3', '奎文区', 'kuiwenqu', '', '261000', '0536', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1764', '267', '16,267,1764,', '3', '临朐县', 'linxian', '', '262600', '0536', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1765', '267', '16,267,1765,', '3', '昌乐县', 'changlexian', '', '262400', '0536', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1766', '267', '16,267,1766,', '3', '青州', 'qingzhou', '', '262500', '0536', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1767', '267', '16,267,1767,', '3', '诸城', 'zhucheng', '', '262200', '0536', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1768', '267', '16,267,1768,', '3', '寿光', 'shouguang', '', '262700', '0536', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1769', '267', '16,267,1769,', '3', '安丘', 'anqiu', '', '262100', '0536', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1770', '267', '16,267,1770,', '3', '高密', 'gaomi', '', '261500', '0536', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1771', '267', '16,267,1771,', '3', '昌邑', 'changyi', '', '261300', '0536', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1772', '268', '16,268,1772,', '3', '中区', 'zhongqu', '', '272000', '0537', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1773', '268', '16,268,1773,', '3', '任城区', 'renchengqu', '', '272000', '0537', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1774', '268', '16,268,1774,', '3', '微山县', 'weishanxian', '', '277600', '0537', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1775', '268', '16,268,1775,', '3', '鱼台县', 'yutaixian', '', '272300', '0537', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1776', '268', '16,268,1776,', '3', '金乡县', 'jinxiangxian', '', '272200', '0537', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1777', '268', '16,268,1777,', '3', '嘉祥县', 'jiaxiangxian', '', '272400', '0537', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1778', '268', '16,268,1778,', '3', '汶上县', 'shangxian', '', '272500', '0537', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1779', '268', '16,268,1779,', '3', '泗水县', 'shuixian', '', '273200', '0537', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1780', '268', '16,268,1780,', '3', '梁山县', 'liangshanxian', '', '272600', '0537', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1781', '268', '16,268,1781,', '3', '曲阜', 'qufu', '', '273100', '0537', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1782', '268', '16,268,1782,', '3', '兖州', 'yanzhou', '', '272000', '0537', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1783', '268', '16,268,1783,', '3', '邹城', 'zoucheng', '', '273500', '0537', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1784', '269', '16,269,1784,', '3', '泰山区', 'taishanqu', '', '271000', '0538', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1785', '269', '16,269,1785,', '3', '岱岳区', 'yuequ', '', '271000', '0538', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1786', '269', '16,269,1786,', '3', '宁阳县', 'ningyangxian', '', '271400', '0538', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1787', '269', '16,269,1787,', '3', '东平县', 'dongpingxian', '', '271500', '0538', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1788', '269', '16,269,1788,', '3', '新泰', 'xintai', '', '271200', '0538', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1789', '269', '16,269,1789,', '3', '肥城', 'feicheng', '', '271600', '0538', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1790', '270', '16,270,1790,', '3', '环翠区', 'huancuiqu', '', '264200', '0631', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1791', '270', '16,270,1791,', '3', '文登', 'wendeng', '', '264400', '0631', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1792', '270', '16,270,1792,', '3', '荣成', 'rongcheng', '', '264300', '0631', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1793', '270', '16,270,1793,', '3', '乳山', 'rushan', '', '264500', '0631', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1794', '271', '16,271,1794,', '3', '东港区', 'donggangqu', '', '276800', '0633', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1795', '271', '16,271,1795,', '3', '岚山区', 'shanqu', '', '276800', '0633', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1796', '271', '16,271,1796,', '3', '五莲县', 'wulianxian', '', '262300', '0633', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1797', '271', '16,271,1797,', '3', '莒县', 'juxian', '', '276500', '0633', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1798', '272', '16,272,1798,', '3', '莱城区', 'laichengqu', '', '271100', '0634', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1799', '272', '16,272,1799,', '3', '钢城区', 'gangchengqu', '', '271100', '0634', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1800', '273', '16,273,1800,', '3', '兰山区', 'lanshanqu', '', '276000', '0539', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1801', '273', '16,273,1801,', '3', '罗庄区', 'luozhuangqu', '', '276000', '0539', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1802', '273', '16,273,1802,', '3', '河东区', 'hedongqu', '', '276000', '0539', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1803', '273', '16,273,1803,', '3', '沂南县', 'yinanxian', '', '276300', '0539', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1804', '273', '16,273,1804,', '3', '郯城县', 'chengxian', '', '276100', '0539', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1805', '273', '16,273,1805,', '3', '沂水县', 'yishuixian', '', '276400', '0539', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1806', '273', '16,273,1806,', '3', '苍山县', 'cangshanxian', '', '277700', '0539', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1807', '273', '16,273,1807,', '3', '费县', 'feixian', '', '273400', '0539', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1808', '273', '16,273,1808,', '3', '平邑县', 'pingyixian', '', '273300', '0539', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1809', '273', '16,273,1809,', '3', '莒南县', 'nanxian', '', '276600', '0539', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1810', '273', '16,273,1810,', '3', '蒙阴县', 'mengyinxian', '', '276200', '0539', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1811', '273', '16,273,1811,', '3', '临沭县', 'linxian', '', '276700', '0539', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1812', '274', '16,274,1812,', '3', '德城区', 'dechengqu', '', '253000', '0534', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1813', '274', '16,274,1813,', '3', '陵县', 'lingxian', '', '253500', '0534', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1814', '274', '16,274,1814,', '3', '宁津县', 'ningjinxian', '', '253400', '0534', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1815', '274', '16,274,1815,', '3', '庆云县', 'qingyunxian', '', '253700', '0534', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1816', '274', '16,274,1816,', '3', '临邑县', 'linyixian', '', '251500', '0534', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1817', '274', '16,274,1817,', '3', '齐河县', 'qihexian', '', '251100', '0534', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1818', '274', '16,274,1818,', '3', '平原县', 'pingyuanxian', '', '253100', '0534', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1819', '274', '16,274,1819,', '3', '夏津县', 'xiajinxian', '', '253200', '0534', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1820', '274', '16,274,1820,', '3', '武城县', 'wuchengxian', '', '253300', '0534', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1821', '274', '16,274,1821,', '3', '乐陵', 'leling', '', '253600', '0534', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1822', '274', '16,274,1822,', '3', '禹城', 'yucheng', '', '251200', '0534', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1823', '275', '16,275,1823,', '3', '东昌府区', 'dongchangfuqu', '', '252000', '0635', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1824', '275', '16,275,1824,', '3', '阳谷县', 'yangguxian', '', '252300', '0635', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1825', '275', '16,275,1825,', '3', '莘县', 'shenxian', '', '252400', '0635', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1826', '275', '16,275,1826,', '3', '茌平县', 'pingxian', '', '252100', '0635', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1827', '275', '16,275,1827,', '3', '东阿县', 'dongaxian', '', '252200', '0635', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1828', '275', '16,275,1828,', '3', '冠县', 'guanxian', '', '252500', '0635', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1829', '275', '16,275,1829,', '3', '高唐县', 'gaotangxian', '', '252800', '0635', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1830', '275', '16,275,1830,', '3', '临清', 'linqing', '', '252600', '0635', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1831', '276', '16,276,1831,', '3', '滨城区', 'binchengqu', '', '256600', '0543', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1832', '276', '16,276,1832,', '3', '惠民县', 'huiminxian', '', '251700', '0543', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1833', '276', '16,276,1833,', '3', '阳信县', 'yangxinxian', '', '251800', '0543', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1834', '276', '16,276,1834,', '3', '无棣县', 'wuxian', '', '251900', '0543', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1835', '276', '16,276,1835,', '3', '沾化县', 'zhanhuaxian', '', '256800', '0543', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1836', '276', '16,276,1836,', '3', '博兴县', 'boxingxian', '', '256500', '0543', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1837', '276', '16,276,1837,', '3', '邹平县', 'zoupingxian', '', '256200', '0543', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1838', '277', '16,277,1838,', '3', '牡丹区', 'mudanqu', '', '274000', '0530', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1839', '277', '16,277,1839,', '3', '曹县', 'caoxian', '', '274400', '0530', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1840', '277', '16,277,1840,', '3', '单县', 'danxian', '', '274300', '0530', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1841', '277', '16,277,1841,', '3', '成武县', 'chengwuxian', '', '274200', '0530', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1842', '277', '16,277,1842,', '3', '巨野县', 'juyexian', '', '274900', '0530', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1843', '277', '16,277,1843,', '3', '郓城县', 'chengxian', '', '274700', '0530', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1844', '277', '16,277,1844,', '3', '鄄城县', 'chengxian', '', '274600', '0530', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1845', '277', '16,277,1845,', '3', '定陶县', 'dingtaoxian', '', '274100', '0530', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1846', '277', '16,277,1846,', '3', '东明县', 'dongmingxian', '', '274500', '0530', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1847', '278', '17,278,1847,', '3', '中原区', 'zhongyuanqu', '', '450000', '0371', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1848', '278', '17,278,1848,', '3', '二七区', 'erqiqu', '', '450000', '0371', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1849', '278', '17,278,1849,', '3', '管城回族区', 'guanchenghuizuqu', '', '450000', '0371', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1850', '278', '17,278,1850,', '3', '金水区', 'jinshuiqu', '', '450000', '0371', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1851', '278', '17,278,1851,', '3', '上街区', 'shangjiequ', '', '450000', '0371', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1852', '278', '17,278,1852,', '3', '惠济区', 'huijiqu', '', '450000', '0371', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1853', '278', '17,278,1853,', '3', '中牟', 'zhongmouxian', '', '451450', '0371', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1854', '278', '17,278,1854,', '3', '巩义', 'gongyi', '', '452100', '0371', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1855', '278', '17,278,1855,', '3', '荥阳', 'yang', '', '450100', '0371', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1856', '278', '17,278,1856,', '3', '新密', 'xinmi', '', '452370', '0371', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1857', '278', '17,278,1857,', '3', '新郑', 'xinzheng', '', '451100', '0371', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1858', '278', '17,278,1858,', '3', '登封', 'dengfeng', '', '452470', '0371', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1859', '279', '17,279,1859,', '3', '龙亭区', 'longtingqu', '', '475000', '0378', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1860', '279', '17,279,1860,', '3', '顺河回族区', 'shunhehuizuqu', '', '475000', '0378', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1861', '279', '17,279,1861,', '3', '鼓楼区', 'gulouqu', '', '475000', '0378', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1862', '279', '17,279,1862,', '3', '禹王台区', 'yuwangtaiqu', '', '475000', '0378', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1863', '279', '17,279,1863,', '3', '金明区', 'jinmingqu', '', '475000', '0378', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1864', '279', '17,279,1864,', '3', '杞县', 'kfqx', '', '475200', '0378', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1865', '279', '17,279,1865,', '3', '通许县', 'tongxuxian', '', '452200', '0378', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1866', '279', '17,279,1866,', '3', '尉氏县', 'weishixian', '', '452100', '0378', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1867', '279', '17,279,1867,', '3', '开封县', 'kaifengxian', '', '475100', '0378', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1868', '279', '17,279,1868,', '3', '兰考县', 'lankaoxian', '', '475300', '0378', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1869', '280', '17,280,1869,', '3', '老城区', 'laochengqu', '', '471000', '0379', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1870', '280', '17,280,1870,', '3', '西工区', 'xigongqu', '', '471000', '0379', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1871', '280', '17,280,1871,', '3', '廛河回族区', 'hehuizuqu', '', '471000', '0379', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1872', '280', '17,280,1872,', '3', '涧西区', 'jianxiqu', '', '471000', '0379', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1873', '280', '17,280,1873,', '3', '吉利区', 'jiliqu', '', '471000', '0379', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1874', '280', '17,280,1874,', '3', '洛龙区', 'luolongqu', '', '471000', '0379', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1875', '280', '17,280,1875,', '3', '孟津县', 'mengjinxian', '', '471100', '0379', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1876', '280', '17,280,1876,', '3', '新安县', 'xinanxian', '', '471800', '0379', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1877', '280', '17,280,1877,', '3', '栾川县', 'chuanxian', '', '471500', '0379', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1878', '280', '17,280,1878,', '3', '嵩县', 'songxian', '', '471400', '0379', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1879', '280', '17,280,1879,', '3', '汝阳县', 'ruyangxian', '', '471200', '0379', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1880', '280', '17,280,1880,', '3', '宜阳县', 'yiyangxian', '', '471600', '0379', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1881', '280', '17,280,1881,', '3', '洛宁县', 'luoningxian', '', '471700', '0379', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1882', '280', '17,280,1882,', '3', '伊川县', 'yichuanxian', '', '471300', '0379', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1883', '280', '17,280,1883,', '3', '偃师', 'shi', '', '471900', '0379', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1884', '281', '17,281,1884,', '3', '新华区', 'xinhuaqu', '', '467000', '0375', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1885', '281', '17,281,1885,', '3', '卫东区', 'weidongqu', '', '467000', '0375', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1886', '281', '17,281,1886,', '3', '石龙区', 'shilongqu', '', '467000', '0375', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1887', '281', '17,281,1887,', '3', '湛河区', 'zhanhequ', '', '467000', '0375', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1888', '281', '17,281,1888,', '3', '宝丰县', 'baofengxian', '', '467400', '0375', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1889', '281', '17,281,1889,', '3', '叶县', 'yexian', '', '467200', '0375', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1890', '281', '17,281,1890,', '3', '鲁山县', 'lushanxian', '', '467300', '0375', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1891', '281', '17,281,1891,', '3', '郏县', 'jiaxian', '', '467100', '0375', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1892', '281', '17,281,1892,', '3', '舞钢', 'wugang', '', '462500', '0375', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1893', '281', '17,281,1893,', '3', '汝州', 'ruzhou', '', '467500', '0375', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1894', '282', '17,282,1894,', '3', '文峰区', 'wenfengqu', '', '455000', '0372', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1895', '282', '17,282,1895,', '3', '北关区', 'beiguanqu', '', '455000', '0372', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1896', '282', '17,282,1896,', '3', '殷都区', 'yinduqu', '', '455000', '0372', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1897', '282', '17,282,1897,', '3', '龙安区', 'longanqu', '', '455000', '0372', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1898', '282', '17,282,1898,', '3', '安阳县', 'anyangxian', '', '455100', '0372', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1899', '282', '17,282,1899,', '3', '汤阴县', 'tangyinxian', '', '456150', '0372', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1900', '282', '17,282,1900,', '3', '滑县', 'huaxian', '', '456400', '0372', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1901', '282', '17,282,1901,', '3', '内黄县', 'neihuangxian', '', '456300', '0372', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1902', '282', '17,282,1902,', '3', '林州', 'linzhou', '', '456500', '0372', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1903', '283', '17,283,1903,', '3', '鹤山区', 'heshanqu', '', '458000', '0392', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1904', '283', '17,283,1904,', '3', '山城区', 'shanchengqu', '', '458000', '0392', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1905', '283', '17,283,1905,', '3', '淇滨区', 'binqu', '', '458000', '0392', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1906', '283', '17,283,1906,', '3', '浚县', 'junxian', '', '456250', '0392', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1907', '283', '17,283,1907,', '3', '淇县', 'qixian', '', '456750', '0392', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1908', '284', '17,284,1908,', '3', '红旗区', 'hongqiqu', '', '453000', '0373', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1909', '284', '17,284,1909,', '3', '卫滨区', 'weibinqu', '', '453000', '0373', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1910', '284', '17,284,1910,', '3', '凤泉区', 'fengquanqu', '', '453000', '0373', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1911', '284', '17,284,1911,', '3', '牧野区', 'muyequ', '', '453000', '0373', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1912', '284', '17,284,1912,', '3', '新乡县', 'xinxiangxian', '', '453700', '0373', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1913', '284', '17,284,1913,', '3', '获嘉县', 'huojiaxian', '', '453800', '0373', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1914', '284', '17,284,1914,', '3', '原阳县', 'yuanyangxian', '', '453500', '0373', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1915', '284', '17,284,1915,', '3', '延津县', 'yanjinxian', '', '453200', '0373', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1916', '284', '17,284,1916,', '3', '封丘县', 'fengqiuxian', '', '453300', '0373', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1917', '284', '17,284,1917,', '3', '长垣县', 'changyuanxian', '', '453400', '0373', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1918', '284', '17,284,1918,', '3', '卫辉', 'weihui', '', '453100', '0373', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1919', '284', '17,284,1919,', '3', '辉县', 'huixian', '', '453600', '0373', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1920', '285', '17,285,1920,', '3', '解放区', 'jiefangqu', '', '454150', '0391', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1921', '285', '17,285,1921,', '3', '中站区', 'zhongzhanqu', '', '454150', '0391', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1922', '285', '17,285,1922,', '3', '马村区', 'macunqu', '', '454150', '0391', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1923', '285', '17,285,1923,', '3', '山阳区', 'shanyangqu', '', '454150', '0391', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1924', '285', '17,285,1924,', '3', '修武县', 'xiuwuxian', '', '454350', '0391', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1925', '285', '17,285,1925,', '3', '博爱县', 'boaixian', '', '454450', '0391', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1926', '285', '17,285,1926,', '3', '武陟县', 'wuxian', '', '454950', '0391', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1927', '285', '17,285,1927,', '3', '温县', 'wenxian', '', '454850', '0391', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1928', '285', '17,285,1928,', '3', '济源', 'jiyuan', '', '454650', '0391', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1929', '285', '17,285,1929,', '3', '沁阳', 'qinyang', '', '454550', '0391', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1930', '285', '17,285,1930,', '3', '孟州', 'mengzhou', '', '454750', '0391', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1931', '286', '17,286,1931,', '3', '华龙区', 'hualongqu', '', '457000', '0393', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1932', '286', '17,286,1932,', '3', '清丰县', 'qingfengxian', '', '457300', '0393', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1933', '286', '17,286,1933,', '3', '南乐县', 'nanlexian', '', '457400', '0393', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1934', '286', '17,286,1934,', '3', '范县', 'fanxian', '', '457500', '0393', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1935', '286', '17,286,1935,', '3', '台前县', 'taiqianxian', '', '457600', '0393', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1936', '286', '17,286,1936,', '3', '濮阳县', 'yangxian', '', '457100', '0393', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1937', '287', '17,287,1937,', '3', '魏都区', 'weiduqu', '', '461000', '0374', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1938', '287', '17,287,1938,', '3', '许昌县', 'xuchangxian', '', '461100', '0374', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1939', '287', '17,287,1939,', '3', '鄢陵县', 'lingxian', '', '461200', '0374', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1940', '287', '17,287,1940,', '3', '襄城县', 'xiangchengxian', '', '452670', '0374', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1941', '287', '17,287,1941,', '3', '禹州', 'yuzhou', '', '452570', '0374', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1942', '287', '17,287,1942,', '3', '长葛', 'changge', '', '461500', '0374', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1943', '288', '17,288,1943,', '3', '源汇区', 'yuanhuiqu', '', '462000', '0395', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1944', '288', '17,288,1944,', '3', '郾城区', 'chengqu', '', '462300', '0395', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1945', '288', '17,288,1945,', '3', '召陵区', 'zhaolingqu', '', '462300', '0395', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1946', '288', '17,288,1946,', '3', '舞阳县', 'wuyangxian', '', '462400', '0395', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1947', '288', '17,288,1947,', '3', '临颍县', 'linxian', '', '462600', '0395', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1948', '289', '17,289,1948,', '3', '湖滨区', 'hubinqu', '', '472000', '0398', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1949', '289', '17,289,1949,', '3', '渑池县', 'chixian', '', '472400', '0398', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1950', '289', '17,289,1950,', '3', '陕县', 'shanxian', '', '472100', '0398', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1951', '289', '17,289,1951,', '3', '卢氏县', 'lushixian', '', '472200', '0398', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1952', '289', '17,289,1952,', '3', '义马', 'yima', '', '472300', '0398', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1953', '289', '17,289,1953,', '3', '灵宝', 'lingbao', '', '472500', '0398', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1954', '290', '17,290,1954,', '3', '宛城区', 'wanchengqu', '', '473000', '0377', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1955', '290', '17,290,1955,', '3', '卧龙区', 'wolongqu', '', '473000', '0377', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1956', '290', '17,290,1956,', '3', '南召县', 'nanzhaoxian', '', '474650', '0377', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1957', '290', '17,290,1957,', '3', '方城县', 'fangchengxian', '', '473200', '0377', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1958', '290', '17,290,1958,', '3', '西峡县', 'xixiaxian', '', '474550', '0377', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1959', '290', '17,290,1959,', '3', '镇平县', 'zhenpingxian', '', '474250', '0377', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1960', '290', '17,290,1960,', '3', '内乡县', 'neixiangxian', '', '474350', '0377', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1961', '290', '17,290,1961,', '3', '淅川县', 'chuanxian', '', '474450', '0377', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1962', '290', '17,290,1962,', '3', '社旗县', 'sheqixian', '', '473300', '0377', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1963', '290', '17,290,1963,', '3', '唐河县', 'tanghexian', '', '473400', '0377', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1964', '290', '17,290,1964,', '3', '新野县', 'xinyexian', '', '473500', '0377', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1965', '290', '17,290,1965,', '3', '桐柏县', 'tongbaixian', '', '474750', '0377', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1966', '290', '17,290,1966,', '3', '邓州', 'dengzhou', '', '474150', '0377', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1967', '291', '17,291,1967,', '3', '梁园区', 'liangyuanqu', '', '476000', '0370', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1968', '291', '17,291,1968,', '3', '睢阳区', 'yangqu', '', '476000', '0370', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1969', '291', '17,291,1969,', '3', '民权县', 'minquanxian', '', '476800', '0370', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1970', '291', '17,291,1970,', '3', '睢县', 'suixian', '', '476900', '0370', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1971', '291', '17,291,1971,', '3', '宁陵县', 'ninglingxian', '', '476700', '0370', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1972', '291', '17,291,1972,', '3', '柘城县', 'chengxian', '', '476200', '0370', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1973', '291', '17,291,1973,', '3', '虞城县', 'yuchengxian', '', '476300', '0370', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1974', '291', '17,291,1974,', '3', '夏邑县', 'xiayixian', '', '476400', '0370', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1975', '291', '17,291,1975,', '3', '永城', 'yongcheng', '', '476600', '0370', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1976', '292', '17,292,1976,', '3', '浉河区', 'shihequ', '', '464000', '0376', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1977', '292', '17,292,1977,', '3', '平桥区', 'pingqiaoqu', '', '464000', '0376', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1978', '292', '17,292,1978,', '3', '罗山县', 'luoshanxian', '', '464200', '0376', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1979', '292', '17,292,1979,', '3', '光山县', 'guangshanxian', '', '465450', '0397', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1980', '292', '17,292,1980,', '3', '新县', 'xinxian', '', '465500', '0397', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1981', '292', '17,292,1981,', '3', '商城县', 'shangchengxian', '', '465350', '0397', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1982', '292', '17,292,1982,', '3', '固始县', 'gushixian', '', '465200', '0397', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1983', '292', '17,292,1983,', '3', '潢川县', 'chuanxian', '', '465150', '0397', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1984', '292', '17,292,1984,', '3', '淮滨县', 'huaibinxian', '', '464400', '0397', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1985', '292', '17,292,1985,', '3', '息县', 'xixian', '', '464300', '0397', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1986', '293', '17,293,1986,', '3', '川汇区', 'chuanhuiqu', '', '466000', '0394', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1987', '293', '17,293,1987,', '3', '扶沟县', 'fugouxian', '', '461300', '0394', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1988', '293', '17,293,1988,', '3', '西华县', 'xihuaxian', '', '466600', '0394', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1989', '293', '17,293,1989,', '3', '商水县', 'shangshuixian', '', '466100', '0394', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1990', '293', '17,293,1990,', '3', '沈丘县', 'shenqiuxian', '', '466300', '0394', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1991', '293', '17,293,1991,', '3', '郸城县', 'danchengxian', '', '477150', '0394', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1992', '293', '17,293,1992,', '3', '淮阳县', 'huaiyangxian', '', '466700', '0394', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1993', '293', '17,293,1993,', '3', '太康县', 'taikangxian', '', '475400', '0394', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1994', '293', '17,293,1994,', '3', '鹿邑县', 'luyixian', '', '477200', '0394', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1995', '293', '17,293,1995,', '3', '项城', 'xiangcheng', '', '466200', '0394', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1996', '294', '17,294,1996,', '3', '驿城区', 'chengqu', '', '463000', '0396', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1997', '294', '17,294,1997,', '3', '西平县', 'xipingxian', '', '463900', '0396', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1998', '294', '17,294,1998,', '3', '上蔡县', 'shangcaixian', '', '463800', '0396', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('1999', '294', '17,294,1999,', '3', '平舆县', 'pingyuxian', '', '463400', '0396', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2000', '294', '17,294,2000,', '3', '正阳县', 'zhengyangxian', '', '463600', '0396', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2001', '294', '17,294,2001,', '3', '确山县', 'queshanxian', '', '463200', '0396', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2002', '294', '17,294,2002,', '3', '泌阳县', 'miyangxian', '', '463700', '0396', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2003', '294', '17,294,2003,', '3', '汝南县', 'runanxian', '', '463300', '0396', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2004', '294', '17,294,2004,', '3', '遂平县', 'suipingxian', '', '463100', '0396', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2005', '294', '17,294,2005,', '3', '新蔡县', 'xincaixian', '', '463500', '0396', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2006', '295', '18,295,2006,', '3', '江岸区', 'jianganqu', '', '430010', '027', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2007', '295', '18,295,2007,', '3', '江汉区', 'jianghanqu', '', '430000', '027', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2008', '295', '18,295,2008,', '3', '硚口区', 'changkouqu', '', '430000', '027', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2009', '295', '18,295,2009,', '3', '汉阳区', 'hanyangqu', '', '430050', '027', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2010', '295', '18,295,2010,', '3', '武昌区', 'wuchangqu', '', '430000', '027', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2011', '295', '18,295,2011,', '3', '青山区', 'qingshanqu', '', '430080', '027', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2012', '295', '18,295,2012,', '3', '洪山区', 'hongshanqu', '', '430070', '027', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2013', '295', '18,295,2013,', '3', '东西湖区', 'dongxihuqu', '', '430040', '027', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2014', '295', '18,295,2014,', '3', '汉南区', 'hannanqu', '', '430090', '027', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2015', '295', '18,295,2015,', '3', '蔡甸区', 'caidianqu', '', '430100', '027', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2016', '295', '18,295,2016,', '3', '江夏区', 'jiangxiaqu', '', '430200', '027', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2017', '295', '18,295,2017,', '3', '黄陂区', 'huangqu', '', '432200', '027', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2018', '295', '18,295,2018,', '3', '新洲区', 'xinzhouqu', '', '431400', '027', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2019', '296', '18,296,2019,', '3', '黄石港区', 'huangshigangqu', '', '435000', '0714', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2020', '296', '18,296,2020,', '3', '西塞山区', 'xisaishanqu', '', '435000', '0714', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2021', '296', '18,296,2021,', '3', '下陆区', 'xialuqu', '', '435000', '0714', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2022', '296', '18,296,2022,', '3', '铁山区', 'tieshanqu', '', '435000', '0714', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2023', '296', '18,296,2023,', '3', '阳新县', 'yangxinxian', '', '435200', '0714', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2024', '296', '18,296,2024,', '3', '大冶', 'daye', '', '435100', '0714', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2025', '297', '18,297,2025,', '3', '茅箭区', 'maojianqu', '', '442000', '0719', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2026', '297', '18,297,2026,', '3', '张湾区', 'zhangwanqu', '', '442000', '0719', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2027', '297', '18,297,2027,', '3', '郧县', 'yunxian', '', '442500', '0719', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2028', '297', '18,297,2028,', '3', '郧西县', 'yunxixian', '', '442600', '0719', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2029', '297', '18,297,2029,', '3', '竹山县', 'zhushanxian', '', '442200', '0719', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2030', '297', '18,297,2030,', '3', '竹溪县', 'zhuxixian', '', '442300', '0719', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2031', '297', '18,297,2031,', '3', '房县', 'fangxian', '', '442100', '0719', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2032', '297', '18,297,2032,', '3', '丹江口', 'danjiangkou', '', '442700', '0719', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2033', '298', '18,298,2033,', '3', '西陵区', 'xilingqu', '', '443000', '0717', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2034', '298', '18,298,2034,', '3', '伍家岗区', 'wujiagangqu', '', '443000', '0717', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2035', '298', '18,298,2035,', '3', '点军区', 'dianjunqu', '', '443000', '0717', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2036', '298', '18,298,2036,', '3', '猇亭区', 'tingqu', '', '443000', '0717', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2037', '298', '18,298,2037,', '3', '夷陵区', 'yilingqu', '', '443100', '0717', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2038', '298', '18,298,2038,', '3', '远安县', 'yuananxian', '', '444200', '0717', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2039', '298', '18,298,2039,', '3', '兴山县', 'xingshanxian', '', '443700', '0717', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2040', '298', '18,298,2040,', '3', '秭归县', 'guixian', '', '443600', '0717', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2041', '298', '18,298,2041,', '3', '长阳土家族自治县', 'changyangtujiazu', '', '443500', '0717', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2042', '298', '18,298,2042,', '3', '五峰土家族自治县', 'wufengtujiazu', '', '443400', '0717', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2043', '298', '18,298,2043,', '3', '宜都', 'yidu', '', '443000', '0717', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2044', '298', '18,298,2044,', '3', '当阳', 'dangyang', '', '444100', '0717', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2045', '298', '18,298,2045,', '3', '枝江', 'zhijiang', '', '443200', '0717', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2046', '299', '18,299,2046,', '3', '襄城区', 'xiangchengqu', '', '441000', '0710', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2047', '299', '18,299,2047,', '3', '樊城区', 'fanchengqu', '', '441000', '0710', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2048', '299', '18,299,2048,', '3', '襄阳区', 'xiangyangqu', '', '441100', '0710', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2049', '299', '18,299,2049,', '3', '南漳县', 'nanzhangxian', '', '441500', '0710', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2050', '299', '18,299,2050,', '3', '谷城县', 'guchengxian', '', '441700', '0710', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2051', '299', '18,299,2051,', '3', '保康县', 'baokangxian', '', '441600', '0710', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2052', '299', '18,299,2052,', '3', '老河口', 'laohekou', '', '441800', '0710', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2053', '299', '18,299,2053,', '3', '枣阳', 'zaoyang', '', '441200', '0710', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2054', '299', '18,299,2054,', '3', '宜城', 'yicheng', '', '441400', '0710', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2055', '300', '18,300,2055,', '3', '梁子湖区', 'liangzihuqu', '', '436000', '0711', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2056', '300', '18,300,2056,', '3', '华容区', 'huarongqu', '', '436000', '0711', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2057', '300', '18,300,2057,', '3', '鄂城区', 'echengqu', '', '436000', '0711', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2058', '301', '18,301,2058,', '3', '东宝区', 'dongbaoqu', '', '448000', '0724', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2059', '301', '18,301,2059,', '3', '掇刀区', 'duodaoqu', '', '448000', '0724', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2060', '301', '18,301,2060,', '3', '京山县', 'jingshanxian', '', '431800', '0724', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2061', '301', '18,301,2061,', '3', '沙洋县', 'shayangxian', '', '448200', '0724', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2062', '301', '18,301,2062,', '3', '钟祥', 'zhongxiang', '', '431900', '0724', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2063', '302', '18,302,2063,', '3', '孝南区', 'xiaonanqu', '', '432100', '0712', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2064', '302', '18,302,2064,', '3', '孝昌县', 'xiaochangxian', '', '432900', '0712', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2065', '302', '18,302,2065,', '3', '大悟县', 'dawuxian', '', '432800', '0712', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2066', '302', '18,302,2066,', '3', '云梦县', 'yunmengxian', '', '432500', '0712', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2067', '302', '18,302,2067,', '3', '应城', 'yingcheng', '', '432400', '0712', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2068', '302', '18,302,2068,', '3', '安陆', 'anlu', '', '432600', '0712', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2069', '302', '18,302,2069,', '3', '汉川', 'hanchuan', '', '432300', '0712', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2070', '303', '18,303,2070,', '3', '沙区', 'shaqu', '', '434000', '0716', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2071', '303', '18,303,2071,', '3', '荆州区', 'jingzhouqu', '', '434020', '0716', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2072', '303', '18,303,2072,', '3', '公安县', 'gonganxian', '', '434300', '0716', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2073', '303', '18,303,2073,', '3', '监利县', 'jianlixian', '', '433300', '0716', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2074', '303', '18,303,2074,', '3', '江陵县', 'jianglingxian', '', '434100', '0716', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2075', '303', '18,303,2075,', '3', '石首', 'shishou', '', '434400', '0716', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2076', '303', '18,303,2076,', '3', '洪湖', 'honghu', '', '433200', '0716', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2077', '303', '18,303,2077,', '3', '松滋', 'songzi', '', '434200', '0716', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2078', '304', '18,304,2078,', '3', '黄州区', 'huangzhouqu', '', '438000', '0713', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2079', '304', '18,304,2079,', '3', '团风县', 'tuanfengxian', '', '438000', '0713', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2080', '304', '18,304,2080,', '3', '红安县', 'honganxian', '', '438400', '0713', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2081', '304', '18,304,2081,', '3', '罗田县', 'luotianxian', '', '438600', '0713', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2082', '304', '18,304,2082,', '3', '英山县', 'yingshanxian', '', '438700', '0713', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2083', '304', '18,304,2083,', '3', '浠水县', 'shuixian', '', '438200', '0713', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2084', '304', '18,304,2084,', '3', '蕲春县', 'chunxian', '', '435300', '0713', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2085', '304', '18,304,2085,', '3', '黄梅县', 'huangmeixian', '', '435500', '0713', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2086', '304', '18,304,2086,', '3', '麻城', 'macheng', '', '438300', '0713', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2087', '304', '18,304,2087,', '3', '武穴', 'wuxue', '', '435400', '0713', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2088', '305', '18,305,2088,', '3', '咸安区', 'xiananqu', '', '437000', '0715', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2089', '305', '18,305,2089,', '3', '嘉鱼县', 'jiayuxian', '', '437200', '0715', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2090', '305', '18,305,2090,', '3', '通城县', 'tongchengxian', '', '437400', '0715', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2091', '305', '18,305,2091,', '3', '崇阳县', 'chongyangxian', '', '437500', '0715', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2092', '305', '18,305,2092,', '3', '通山县', 'tongshanxian', '', '437600', '0715', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2093', '305', '18,305,2093,', '3', '赤壁', 'chibi', '', '437300', '0715', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2094', '306', '18,306,2094,', '3', '曾都区', 'zengduqu', '', '441300', '0722', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2095', '306', '18,306,2095,', '3', '广水', 'guangshui', '', '432700', '0722', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2096', '307', '18,307,2096,', '3', '恩施', 'enshi', '', '445000', '0718', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2097', '307', '18,307,2097,', '3', '利川', 'lichuan', '', '445400', '0718', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2098', '307', '18,307,2098,', '3', '建始县', 'jianshixian', '', '445300', '0718', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2099', '307', '18,307,2099,', '3', '巴东县', 'badongxian', '', '444300', '0718', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2100', '307', '18,307,2100,', '3', '宣恩县', 'xuanenxian', '', '445500', '0718', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2101', '307', '18,307,2101,', '3', '咸丰县', 'xianfengxian', '', '445600', '0718', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2102', '307', '18,307,2102,', '3', '来凤县', 'laifengxian', '', '445700', '0718', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2103', '307', '18,307,2103,', '3', '鹤峰县', 'hefengxian', '', '445800', '0718', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2104', '312', '19,312,2104,', '3', '芙蓉区', 'rongqu', '', '410000', '0731', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2105', '312', '19,312,2105,', '3', '天心区', 'tianxinqu', '', '410000', '0731', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2106', '312', '19,312,2106,', '3', '岳麓区', 'yueluqu', '', '410000', '0731', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2107', '312', '19,312,2107,', '3', '开福区', 'kaifuqu', '', '410000', '0731', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2108', '312', '19,312,2108,', '3', '雨花区', 'yuhuaqu', '', '410000', '0731', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2109', '312', '19,312,2109,', '3', '长沙县', 'changshaxian', '', '410100', '0731', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2110', '312', '19,312,2110,', '3', '望城县', 'wangchengxian', '', '410200', '0731', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2111', '312', '19,312,2111,', '3', '宁乡县', 'ningxiangxian', '', '410600', '0731', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2112', '312', '19,312,2112,', '3', '浏阳', 'yang', '', '410300', '0731', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2113', '313', '19,313,2113,', '3', '荷塘区', 'hetangqu', '', '412000', '0733', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2114', '313', '19,313,2114,', '3', '芦淞区', 'luqu', '', '412000', '0733', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2115', '313', '19,313,2115,', '3', '石峰区', 'shifengqu', '', '412000', '0733', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2116', '313', '19,313,2116,', '3', '天元区', 'tianyuanqu', '', '412000', '0733', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2117', '313', '19,313,2117,', '3', '株洲县', 'zhuzhouxian', '', '412000', '0733', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2118', '313', '19,313,2118,', '3', '攸县', 'youxian', '', '412300', '0733', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2119', '313', '19,313,2119,', '3', '茶陵县', 'chalingxian', '', '412400', '0733', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2120', '313', '19,313,2120,', '3', '炎陵县', 'yanlingxian', '', '412500', '0733', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2121', '313', '19,313,2121,', '3', '醴陵', 'ling', '', '412200', '0733', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2122', '314', '19,314,2122,', '3', '雨湖区', 'yuhuqu', '', '411100', '0732', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2123', '314', '19,314,2123,', '3', '岳塘区', 'yuetangqu', '', '411100', '0732', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2124', '314', '19,314,2124,', '3', '湘潭县', 'xiangtanxian', '', '411200', '0732', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2125', '314', '19,314,2125,', '3', '湘乡', 'xiangxiang', '', '411400', '0732', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2126', '314', '19,314,2126,', '3', '韶山', 'shaoshan', '', '411300', '0732', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2127', '315', '19,315,2127,', '3', '珠晖区', 'zhuqu', '', '421000', '0734', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2128', '315', '19,315,2128,', '3', '雁峰区', 'yanfengqu', '', '421000', '0734', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2129', '315', '19,315,2129,', '3', '石鼓区', 'shiguqu', '', '421000', '0734', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2130', '315', '19,315,2130,', '3', '蒸湘区', 'zhengxiangqu', '', '421000', '0734', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2131', '315', '19,315,2131,', '3', '南岳区', 'nanyuequ', '', '421000', '0734', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2132', '315', '19,315,2132,', '3', '衡阳县', 'hengyangxian', '', '421200', '0734', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2133', '315', '19,315,2133,', '3', '衡南县', 'hengnanxian', '', '421100', '0734', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2134', '315', '19,315,2134,', '3', '衡山县', 'hengshanxian', '', '421300', '0734', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2135', '315', '19,315,2135,', '3', '衡东县', 'hengdongxian', '', '421400', '0734', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2136', '315', '19,315,2136,', '3', '祁东县', 'qidongxian', '', '421600', '0734', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2137', '315', '19,315,2137,', '3', '耒阳', 'yang', '', '421800', '0734', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2138', '315', '19,315,2138,', '3', '常宁', 'changning', '', '421500', '0734', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2139', '316', '19,316,2139,', '3', '双清区', 'shuangqingqu', '', '422000', '0739', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2140', '316', '19,316,2140,', '3', '大祥区', 'daxiangqu', '', '422000', '0739', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2141', '316', '19,316,2141,', '3', '北塔区', 'beitaqu', '', '422000', '0739', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2142', '316', '19,316,2142,', '3', '邵东县', 'shaodongxian', '', '422800', '0739', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2143', '316', '19,316,2143,', '3', '新邵县', 'xinshaoxian', '', '422900', '0739', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2144', '316', '19,316,2144,', '3', '邵阳县', 'shaoyangxian', '', '422100', '0739', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2145', '316', '19,316,2145,', '3', '隆回县', 'longhuixian', '', '422200', '0739', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2146', '316', '19,316,2146,', '3', '洞口县', 'dongkouxian', '', '422300', '0739', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2147', '316', '19,316,2147,', '3', '绥宁县', 'suiningxian', '', '422600', '0739', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2148', '316', '19,316,2148,', '3', '新宁县', 'xinningxian', '', '422700', '0739', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2149', '316', '19,316,2149,', '3', '城步苗族自治县', 'chengbumiaozu', '', '422500', '0739', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2150', '316', '19,316,2150,', '3', '武冈', 'wugang', '', '422400', '0739', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2151', '317', '19,317,2151,', '3', '岳阳楼区', 'yueyanglouqu', '', '414000', '0730', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2152', '317', '19,317,2152,', '3', '云溪区', 'yunxiqu', '', '414000', '0730', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2153', '317', '19,317,2153,', '3', '君山区', 'junshanqu', '', '414000', '0730', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2154', '317', '19,317,2154,', '3', '岳阳县', 'yueyangxian', '', '414100', '0730', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2155', '317', '19,317,2155,', '3', '华容县', 'huarongxian', '', '414200', '0730', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2156', '317', '19,317,2156,', '3', '湘阴县', 'xiangyinxian', '', '410500', '0730', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2157', '317', '19,317,2157,', '3', '平江县', 'pingjiangxian', '', '410400', '0730', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2158', '317', '19,317,2158,', '3', '汨罗', 'luo', '', '414400', '0730', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2159', '317', '19,317,2159,', '3', '临湘', 'linxiang', '', '414300', '0730', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2160', '318', '19,318,2160,', '3', '武陵区', 'wulingqu', '', '415000', '0736', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2161', '318', '19,318,2161,', '3', '鼎城区', 'dingchengqu', '', '415100', '0736', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2162', '318', '19,318,2162,', '3', '安乡县', 'anxiangxian', '', '415600', '0736', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2163', '318', '19,318,2163,', '3', '汉寿县', 'hanshouxian', '', '415900', '0736', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2164', '318', '19,318,2164,', '3', '澧县', 'lixian', '', '415500', '0736', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2165', '318', '19,318,2165,', '3', '临澧县', 'linxian', '', '415200', '0736', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2166', '318', '19,318,2166,', '3', '桃源县', 'taoyuanxian', '', '415700', '0736', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2167', '318', '19,318,2167,', '3', '石门县', 'shimenxian', '', '415300', '0736', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2168', '318', '19,318,2168,', '3', '津', 'jin', '', '415400', '0736', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2169', '319', '19,319,2169,', '3', '永定区', 'yongdingqu', '', '427000', '0744', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2170', '319', '19,319,2170,', '3', '武陵源区', 'wulingyuanqu', '', '427400', '0744', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2171', '319', '19,319,2171,', '3', '慈利县', 'cilixian', '', '427200', '0744', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2172', '319', '19,319,2172,', '3', '桑植县', 'sangzhixian', '', '427100', '0744', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2173', '320', '19,320,2173,', '3', '资阳区', 'ziyangqu', '', '413000', '0737', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2174', '320', '19,320,2174,', '3', '赫山区', 'heshanqu', '', '413000', '0737', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2175', '320', '19,320,2175,', '3', '南县', 'nanxian', '', '413200', '0737', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2176', '320', '19,320,2176,', '3', '桃江县', 'taojiangxian', '', '413400', '0737', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2177', '320', '19,320,2177,', '3', '安化县', 'anhuaxian', '', '413500', '0737', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2178', '320', '19,320,2178,', '3', '沅江', 'jiang', '', '413100', '0737', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2179', '321', '19,321,2179,', '3', '北湖区', 'beihuqu', '', '423000', '0735', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2180', '321', '19,321,2180,', '3', '苏仙区', 'suxianqu', '', '423000', '0735', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2181', '321', '19,321,2181,', '3', '桂阳县', 'guiyangxian', '', '424400', '0735', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2182', '321', '19,321,2182,', '3', '宜章县', 'yizhangxian', '', '424200', '0735', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2183', '321', '19,321,2183,', '3', '永兴县', 'yongxingxian', '', '423300', '0735', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2184', '321', '19,321,2184,', '3', '嘉禾县', 'jiahexian', '', '424500', '0735', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2185', '321', '19,321,2185,', '3', '临武县', 'linwuxian', '', '424300', '0735', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2186', '321', '19,321,2186,', '3', '汝城县', 'ruchengxian', '', '424100', '0735', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2187', '321', '19,321,2187,', '3', '桂东县', 'guidongxian', '', '423500', '0735', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2188', '321', '19,321,2188,', '3', '安仁县', 'anrenxian', '', '423600', '0735', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2189', '321', '19,321,2189,', '3', '资兴', 'zixing', '', '423400', '0735', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2190', '322', '19,322,2190,', '3', '零陵区', 'linglingqu', '', '425000', '0746', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2191', '322', '19,322,2191,', '3', '冷水滩区', 'lengshuitanqu', '', '425000', '0746', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2192', '322', '19,322,2192,', '3', '祁阳县', 'qiyangxian', '', '426100', '0746', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2193', '322', '19,322,2193,', '3', '东安县', 'donganxian', '', '425900', '0746', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2194', '322', '19,322,2194,', '3', '双牌县', 'shuangpaixian', '', '425200', '0746', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2195', '322', '19,322,2195,', '3', '道县', 'daoxian', '', '425300', '0746', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2196', '322', '19,322,2196,', '3', '江永县', 'jiangyongxian', '', '425400', '0746', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2197', '322', '19,322,2197,', '3', '宁远县', 'ningyuanxian', '', '425600', '0746', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2198', '322', '19,322,2198,', '3', '蓝山县', 'lanshanxian', '', '425800', '0746', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2199', '322', '19,322,2199,', '3', '新田县', 'xintianxian', '', '425700', '0746', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2200', '322', '19,322,2200,', '3', '江华瑶族自治县', 'jianghuayaozu', '', '425500', '0746', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2201', '323', '19,323,2201,', '3', '鹤城区', 'hechengqu', '', '418000', '0745', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2202', '323', '19,323,2202,', '3', '中方县', 'zhongfangxian', '', '418000', '0745', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2203', '323', '19,323,2203,', '3', '沅陵县', 'lingxian', '', '419600', '0745', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2204', '323', '19,323,2204,', '3', '辰溪县', 'chenxixian', '', '419500', '0745', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2205', '323', '19,323,2205,', '3', '溆浦县', 'puxian', '', '419300', '0745', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2206', '323', '19,323,2206,', '3', '会同县', 'huitongxian', '', '418300', '0745', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2207', '323', '19,323,2207,', '3', '麻阳苗族自治县', 'mayangmiaozu', '', '419400', '0745', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2208', '323', '19,323,2208,', '3', '新晃侗族自治县', 'xinhuangdongzu', '', '419200', '0745', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2209', '323', '19,323,2209,', '3', '芷江侗族自治县', 'jiangdongzu', '', '419100', '0745', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2210', '323', '19,323,2210,', '3', '靖州苗族侗族自治县', 'jingzhoumiaozudongzu', '', '418400', '0745', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2211', '323', '19,323,2211,', '3', '通道侗族自治县', 'tongdaodongzu', '', '418500', '0745', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2212', '323', '19,323,2212,', '3', '洪江', 'hongjiang', '', '418200', '0745', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2213', '324', '19,324,2213,', '3', '娄星区', 'louxingqu', '', '417000', '0738', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2214', '324', '19,324,2214,', '3', '双峰县', 'shuangfengxian', '', '417700', '0738', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2215', '324', '19,324,2215,', '3', '新化县', 'xinhuaxian', '', '417600', '0738', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2216', '324', '19,324,2216,', '3', '冷水江', 'lengshuijiang', '', '417500', '0738', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2217', '324', '19,324,2217,', '3', '涟源', 'lianyuan', '', '417100', '0738', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2218', '325', '19,325,2218,', '3', '吉首', 'jishou', '', '416000', '0743', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2219', '325', '19,325,2219,', '3', '泸溪县', 'xixian', '', '416100', '0743', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2220', '325', '19,325,2220,', '3', '凤凰县', 'fenghuangxian', '', '416200', '0743', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2221', '325', '19,325,2221,', '3', '花垣县', 'huayuanxian', '', '416400', '0743', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2222', '325', '19,325,2222,', '3', '保靖县', 'baojingxian', '', '416500', '0743', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2223', '325', '19,325,2223,', '3', '古丈县', 'guzhangxian', '', '416300', '0743', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2224', '325', '19,325,2224,', '3', '永顺县', 'yongshunxian', '', '416700', '0743', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2225', '325', '19,325,2225,', '3', '龙山县', 'longshanxian', '', '416800', '0743', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2226', '326', '20,326,2226,', '3', '荔湾区', 'liwanqu', '', '510100', '020', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2227', '326', '20,326,2227,', '3', '越秀区', 'yuexiuqu', '', '510000', '020', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2228', '326', '20,326,2228,', '3', '海珠区', 'haizhuqu', '', '510200', '020', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2229', '326', '20,326,2229,', '3', '天河区', 'tianhequ', '', '510600', '020', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2230', '326', '20,326,2230,', '3', '白云区', 'baiyunqu', '', '510400', '020', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2231', '326', '20,326,2231,', '3', '黄埔区', 'huangpuqu', '', '510700', '020', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2232', '326', '20,326,2232,', '3', '番禺区', 'fanqu', '', '511400', '020', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2233', '326', '20,326,2233,', '3', '花都区', 'huaduqu', '', '510800', '020', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2234', '326', '20,326,2234,', '3', '南沙区', 'nanshaqu', '', '511400', '020', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2235', '326', '20,326,2235,', '3', '萝岗区', 'luogangqu', '', '510700', '020', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2236', '326', '20,326,2236,', '3', '增城', 'zengcheng', '', '511300', '020', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2237', '326', '20,326,2237,', '3', '从化', 'conghua', '', '510900', '020', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2238', '327', '20,327,2238,', '3', '武江区', 'wujiangqu', '', '512000', '0751', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2239', '327', '20,327,2239,', '3', '浈江区', 'jiangqu', '', '512000', '0751', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2240', '327', '20,327,2240,', '3', '曲江区', 'qujiangqu', '', '512100', '0751', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2241', '327', '20,327,2241,', '3', '始兴县', 'shixingxian', '', '512500', '0751', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2242', '327', '20,327,2242,', '3', '仁化县', 'renhuaxian', '', '512300', '0751', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2243', '327', '20,327,2243,', '3', '翁源县', 'wengyuanxian', '', '512600', '0751', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2244', '327', '20,327,2244,', '3', '乳源瑶族自治县', 'ruyuanyaozu', '', '512600', '0751', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2245', '327', '20,327,2245,', '3', '新丰县', 'xinfengxian', '', '511100', '0751', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2246', '327', '20,327,2246,', '3', '乐昌', 'lechang', '', '512200', '0751', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2247', '327', '20,327,2247,', '3', '南雄', 'nanxiong', '', '512400', '0751', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2248', '328', '20,328,2248,', '3', '罗湖区', 'luohuqu', '', '518000', '0755', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2249', '328', '20,328,2249,', '3', '福田区', 'futianqu', '', '518000', '0755', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2250', '328', '20,328,2250,', '3', '南山区', 'nanshanqu', '', '518000', '0755', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2251', '328', '20,328,2251,', '3', '宝安区', 'baoanqu', '', '518100', '0755', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2252', '328', '20,328,2252,', '3', '龙岗区', 'longgangqu', '', '518100', '0755', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2253', '328', '20,328,2253,', '3', '盐田区', 'yantianqu', '', '518000', '0755', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2254', '329', '20,329,2254,', '3', '香洲区', 'xiangzhouqu', '', '519000', '0756', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2255', '329', '20,329,2255,', '3', '斗门区', 'doumenqu', '', '519100', '0756', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2256', '329', '20,329,2256,', '3', '金湾区', 'jinwanqu', '', '519090', '0756', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2257', '330', '20,330,2257,', '3', '龙湖区', 'longhuqu', '', '515000', '0754', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2258', '330', '20,330,2258,', '3', '金平区', 'jinpingqu', '', '515000', '0754', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2259', '330', '20,330,2259,', '3', '濠江区', 'jiangqu', '', '515000', '0754', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2260', '330', '20,330,2260,', '3', '潮阳区', 'chaoyangqu', '', '515100', '0754', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2261', '330', '20,330,2261,', '3', '潮南区', 'chaonanqu', '', '515000', '0754', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2262', '330', '20,330,2262,', '3', '澄海区', 'chenghaiqu', '', '515800', '0754', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2263', '330', '20,330,2263,', '3', '南澳县', 'nanaoxian', '', '515900', '0754', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2264', '331', '20,331,2264,', '3', '禅城区', 'chengqu', '', '528000', '0757', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2265', '331', '20,331,2265,', '3', '南海区', 'nanhaiqu', '', '528200', '0757', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2266', '331', '20,331,2266,', '3', '顺德区', 'shundequ', '', '528300', '0757', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2267', '331', '20,331,2267,', '3', '三水区', 'sanshuiqu', '', '528100', '0757', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2268', '331', '20,331,2268,', '3', '高明区', 'gaomingqu', '', '528500', '0757', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2269', '332', '20,332,2269,', '3', '蓬江区', 'pengjiangqu', '', '529000', '0750', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2270', '332', '20,332,2270,', '3', '江海区', 'jianghaiqu', '', '529000', '0750', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2271', '332', '20,332,2271,', '3', '新会区', 'xinhuiqu', '', '529100', '0750', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2272', '332', '20,332,2272,', '3', '台山', 'taishan', '', '529200', '0750', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2273', '332', '20,332,2273,', '3', '开平', 'kaiping', '', '529300', '0750', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2274', '332', '20,332,2274,', '3', '鹤山', 'heshan', '', '529700', '0750', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2275', '332', '20,332,2275,', '3', '恩平', 'enping', '', '529400', '0750', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2276', '333', '20,333,2276,', '3', '赤坎区', 'chikanqu', '', '524000', '0759', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2277', '333', '20,333,2277,', '3', '霞山区', 'xiashanqu', '', '524000', '0759', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2278', '333', '20,333,2278,', '3', '坡头区', 'potouqu', '', '524000', '0759', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2279', '333', '20,333,2279,', '3', '麻章区', 'mazhangqu', '', '524000', '0759', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2280', '333', '20,333,2280,', '3', '遂溪县', 'suixixian', '', '524300', '0759', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2281', '333', '20,333,2281,', '3', '徐闻县', 'xuwenxian', '', '524100', '0759', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2282', '333', '20,333,2282,', '3', '廉江', 'lianjiang', '', '524400', '0759', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2283', '333', '20,333,2283,', '3', '雷州', 'leizhou', '', '524200', '0759', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2284', '333', '20,333,2284,', '3', '吴川', 'wuchuan', '', '524500', '0759', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2285', '334', '20,334,2285,', '3', '茂南区', 'maonanqu', '', '525000', '0668', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2286', '334', '20,334,2286,', '3', '茂港区', 'maogangqu', '', '525000', '0668', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2287', '334', '20,334,2287,', '3', '电白县', 'dianbaixian', '', '525400', '0668', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2288', '334', '20,334,2288,', '3', '高州', 'gaozhou', '', '525200', '0668', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2289', '334', '20,334,2289,', '3', '化州', 'huazhou', '', '525100', '0668', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2290', '334', '20,334,2290,', '3', '信宜', 'xinyi', '', '525300', '0668', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2291', '335', '20,335,2291,', '3', '端州区', 'duanzhouqu', '', '526000', '0758', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2292', '335', '20,335,2292,', '3', '鼎湖区', 'dinghuqu', '', '526000', '0758', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2293', '335', '20,335,2293,', '3', '广宁县', 'guangningxian', '', '526300', '0758', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2294', '335', '20,335,2294,', '3', '怀集县', 'huaijixian', '', '526400', '0758', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2295', '335', '20,335,2295,', '3', '封开县', 'fengkaixian', '', '526500', '0758', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2296', '335', '20,335,2296,', '3', '德庆县', 'deqingxian', '', '526600', '0758', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2297', '335', '20,335,2297,', '3', '高要', 'gaoyao', '', '526100', '0758', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2298', '335', '20,335,2298,', '3', '四会', 'sihui', '', '526200', '0758', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2299', '336', '20,336,2299,', '3', '惠城区', 'huichengqu', '', '516000', '0752', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2300', '336', '20,336,2300,', '3', '惠阳区', 'huiyangqu', '', '516200', '0752', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2301', '336', '20,336,2301,', '3', '博罗县', 'boluoxian', '', '516100', '0752', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2302', '336', '20,336,2302,', '3', '惠东县', 'huidongxian', '', '516300', '0752', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2303', '336', '20,336,2303,', '3', '龙门县', 'longmenxian', '', '516800', '0752', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2304', '337', '20,337,2304,', '3', '梅江区', 'meijiangqu', '', '514000', '0753', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2305', '337', '20,337,2305,', '3', '梅县', 'meixian', '', '514700', '0753', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2306', '337', '20,337,2306,', '3', '大埔县', 'dapuxian', '', '514200', '0753', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2307', '337', '20,337,2307,', '3', '丰顺县', 'fengshunxian', '', '514300', '0753', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2308', '337', '20,337,2308,', '3', '五华县', 'wuhuaxian', '', '514400', '0753', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2309', '337', '20,337,2309,', '3', '平远县', 'pingyuanxian', '', '514600', '0753', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2310', '337', '20,337,2310,', '3', '蕉岭县', 'jiaolingxian', '', '514100', '0753', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2311', '337', '20,337,2311,', '3', '兴宁', 'xingning', '', '514500', '0753', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2312', '338', '20,338,2312,', '3', '城区', 'chengqu', '', '516600', '0660', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2313', '338', '20,338,2313,', '3', '海丰县', 'haifengxian', '', '516400', '0660', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2314', '338', '20,338,2314,', '3', '陆河县', 'luhexian', '', '516700', '0660', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2315', '338', '20,338,2315,', '3', '陆丰', 'lufeng', '', '516500', '0660', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2316', '339', '20,339,2316,', '3', '源城区', 'yuanchengqu', '', '517000', '0762', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2317', '339', '20,339,2317,', '3', '紫金县', 'zijinxian', '', '517400', '0762', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2318', '339', '20,339,2318,', '3', '龙川县', 'longchuanxian', '', '517300', '0762', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2319', '339', '20,339,2319,', '3', '连平县', 'lianpingxian', '', '517100', '0762', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2320', '339', '20,339,2320,', '3', '和平县', 'hepingxian', '', '517200', '0762', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2321', '339', '20,339,2321,', '3', '东源县', 'dongyuanxian', '', '517500', '0762', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2322', '340', '20,340,2322,', '3', '江城区', 'jiangchengqu', '', '529500', '0662', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2323', '340', '20,340,2323,', '3', '阳西县', 'yangxixian', '', '529800', '0662', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2324', '340', '20,340,2324,', '3', '阳东县', 'yangdongxian', '', '529900', '0662', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2325', '340', '20,340,2325,', '3', '阳春', 'yangchun', '', '529600', '0662', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2326', '341', '20,341,2326,', '3', '清城区', 'qingchengqu', '', '511500', '0763', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2327', '341', '20,341,2327,', '3', '佛冈县', 'fogangxian', '', '511600', '0763', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2328', '341', '20,341,2328,', '3', '阳山县', 'yangshanxian', '', '513100', '0763', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2329', '341', '20,341,2329,', '3', '连山壮族瑶族自治县', 'lianshanzhuangzuyaozu', '', '513200', '0763', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2330', '341', '20,341,2330,', '3', '连南瑶族自治县', 'liannanyaozu', '', '513300', '0763', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2331', '341', '20,341,2331,', '3', '清新县', 'qingxinxian', '', '511800', '0763', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2332', '341', '20,341,2332,', '3', '英德', 'yingde', '', '513000', '0763', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2333', '341', '20,341,2333,', '3', '连州', 'lianzhou', '', '513400', '0763', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2334', '344', '20,344,2334,', '3', '湘桥区', 'xiangqiaoqu', '', '521000', '0768', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2335', '344', '20,344,2335,', '3', '潮安县', 'chaoanxian', '', '515600', '0768', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2336', '344', '20,344,2336,', '3', '饶平县', 'raopingxian', '', '515700', '0768', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2337', '345', '20,345,2337,', '3', '榕城区', 'chengqu', '', '522000', '0663', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2338', '345', '20,345,2338,', '3', '揭东县', 'jiedongxian', '', '515500', '0663', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2339', '345', '20,345,2339,', '3', '揭西县', 'jiexixian', '', '515400', '0663', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2340', '345', '20,345,2340,', '3', '惠来县', 'huilaixian', '', '515200', '0663', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2341', '345', '20,345,2341,', '3', '普宁', 'puning', '', '515300', '0663', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2342', '346', '20,346,2342,', '3', '云城区', 'yunchengqu', '', '527300', '0766', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2343', '346', '20,346,2343,', '3', '新兴县', 'xinxingxian', '', '527400', '0766', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2344', '346', '20,346,2344,', '3', '郁南县', 'yunanxian', '', '527100', '0766', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2345', '346', '20,346,2345,', '3', '云安县', 'yunanxian', '', '527500', '0766', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2346', '346', '20,346,2346,', '3', '罗定', 'luoding', '', '527200', '0766', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2347', '347', '21,347,2347,', '3', '兴宁区', 'xingningqu', '', '530000', '0771', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2348', '347', '21,347,2348,', '3', '青秀区', 'qingxiuqu', '', '530000', '0771', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2349', '347', '21,347,2349,', '3', '江南区', 'jiangnanqu', '', '530000', '0771', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2350', '347', '21,347,2350,', '3', '西乡塘区', 'xixiangtangqu', '', '530000', '0771', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2351', '347', '21,347,2351,', '3', '良庆区', 'liangqingqu', '', '530200', '0771', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2352', '347', '21,347,2352,', '3', '邕宁区', 'ningqu', '', '530200', '0771', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2353', '347', '21,347,2353,', '3', '武鸣县', 'wumingxian', '', '530100', '0771', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2354', '347', '21,347,2354,', '3', '隆安县', 'longanxian', '', '532700', '0771', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2355', '347', '21,347,2355,', '3', '马山县', 'mashanxian', '', '530600', '0771', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2356', '347', '21,347,2356,', '3', '上林县', 'shanglinxian', '', '530500', '0771', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2357', '347', '21,347,2357,', '3', '宾阳县', 'binyangxian', '', '530400', '0771', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2358', '347', '21,347,2358,', '3', '横县', 'hengxian', '', '530300', '0771', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2359', '348', '21,348,2359,', '3', '城中区', 'chengzhongqu', '', '545000', '0772', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2360', '348', '21,348,2360,', '3', '鱼峰区', 'yufengqu', '', '545000', '0772', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2361', '348', '21,348,2361,', '3', '柳南区', 'liunanqu', '', '545000', '0772', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2362', '348', '21,348,2362,', '3', '柳北区', 'liubeiqu', '', '545000', '0772', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2363', '348', '21,348,2363,', '3', '柳江县', 'liujiangxian', '', '545100', '0772', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2364', '348', '21,348,2364,', '3', '柳城县', 'liuchengxian', '', '545200', '0772', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2365', '348', '21,348,2365,', '3', '鹿寨县', 'luzhaixian', '', '545600', '0772', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2366', '348', '21,348,2366,', '3', '融安县', 'ronganxian', '', '545400', '0772', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2367', '348', '21,348,2367,', '3', '融水苗族自治县', 'rongshuimiaozu', '', '545300', '0772', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2368', '348', '21,348,2368,', '3', '三江侗族自治县', 'sanjiangdongzu', '', '545500', '0772', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2369', '349', '21,349,2369,', '3', '秀峰区', 'xiufengqu', '', '541000', '0773', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2370', '349', '21,349,2370,', '3', '叠彩区', 'diecaiqu', '', '541000', '0773', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2371', '349', '21,349,2371,', '3', '象山区', 'xiangshanqu', '', '541000', '0773', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2372', '349', '21,349,2372,', '3', '七星区', 'qixingqu', '', '541000', '0773', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2373', '349', '21,349,2373,', '3', '雁山区', 'yanshanqu', '', '541000', '0773', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2374', '349', '21,349,2374,', '3', '阳朔县', 'yangshuoxian', '', '541900', '0773', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2375', '349', '21,349,2375,', '3', '临桂县', 'linguixian', '', '541100', '0773', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2376', '349', '21,349,2376,', '3', '灵川县', 'lingchuanxian', '', '541200', '0773', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2377', '349', '21,349,2377,', '3', '全州县', 'quanzhouxian', '', '541500', '0773', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2378', '349', '21,349,2378,', '3', '兴安县', 'xinganxian', '', '541300', '0773', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2379', '349', '21,349,2379,', '3', '永福县', 'yongfuxian', '', '541800', '0773', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2380', '349', '21,349,2380,', '3', '灌阳县', 'guanyangxian', '', '541600', '0773', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2381', '349', '21,349,2381,', '3', '龙胜各族自治县', 'longshenggezu', '', '541700', '0773', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2382', '349', '21,349,2382,', '3', '资源县', 'ziyuanxian', '', '541400', '0773', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2383', '349', '21,349,2383,', '3', '平乐县', 'pinglexian', '', '542400', '0773', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2384', '349', '21,349,2384,', '3', '荔蒲县', 'lipuxian', '', '546600', '0773', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2385', '349', '21,349,2385,', '3', '恭城瑶族自治县', 'gongchengyaozu', '', '542500', '0773', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2386', '350', '21,350,2386,', '3', '万秀区', 'wanxiuqu', '', '543000', '0774', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2387', '350', '21,350,2387,', '3', '蝶山区', 'dieshanqu', '', '543000', '0774', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2388', '350', '21,350,2388,', '3', '长洲区', 'changzhouqu', '', '543000', '0774', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2389', '350', '21,350,2389,', '3', '苍梧县', 'cangwuxian', '', '543100', '0774', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2390', '350', '21,350,2390,', '3', '藤县', 'tengxian', '', '543300', '0774', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2391', '350', '21,350,2391,', '3', '蒙山县', 'mengshanxian', '', '546700', '0774', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2392', '350', '21,350,2392,', '3', '岑溪', 'xi', '', '543200', '0774', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2393', '351', '21,351,2393,', '3', '海城区', 'haichengqu', '', '536000', '0779', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2394', '351', '21,351,2394,', '3', '银海区', 'yinhaiqu', '', '536000', '0779', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2395', '351', '21,351,2395,', '3', '铁山港区', 'tieshangangqu', '', '536000', '0779', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2396', '351', '21,351,2396,', '3', '合浦县', 'hepuxian', '', '536100', '0779', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2397', '352', '21,352,2397,', '3', '港口区', 'gangkouqu', '', '538000', '0770', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2398', '352', '21,352,2398,', '3', '防城区', 'fangchengqu', '', '538000', '0770', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2399', '352', '21,352,2399,', '3', '上思县', 'shangsixian', '', '535500', '0770', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2400', '352', '21,352,2400,', '3', '东兴', 'dongxing', '', '538100', '0770', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2401', '353', '21,353,2401,', '3', '钦南区', 'qinnanqu', '', '535000', '0777', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2402', '353', '21,353,2402,', '3', '钦北区', 'qinbeiqu', '', '535000', '0777', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2403', '353', '21,353,2403,', '3', '灵山县', 'lingshanxian', '', '535400', '0777', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2404', '353', '21,353,2404,', '3', '浦北县', 'pubeixian', '', '535300', '0777', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2405', '354', '21,354,2405,', '3', '港北区', 'gangbeiqu', '', '537100', '0775', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2406', '354', '21,354,2406,', '3', '港南区', 'gangnanqu', '', '537100', '0775', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2407', '354', '21,354,2407,', '3', '覃塘区', 'tangqu', '', '537100', '0775', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2408', '354', '21,354,2408,', '3', '平南县', 'pingnanxian', '', '537300', '0775', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2409', '354', '21,354,2409,', '3', '桂平', 'guiping', '', '537200', '0775', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2410', '355', '21,355,2410,', '3', '玉州区', 'yuzhouqu', '', '537000', '0775', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2411', '355', '21,355,2411,', '3', '容县', 'rongxian', '', '537500', '0775', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2412', '355', '21,355,2412,', '3', '陆川县', 'luchuanxian', '', '537700', '0775', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2413', '355', '21,355,2413,', '3', '博白县', 'bobaixian', '', '537600', '0775', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2414', '355', '21,355,2414,', '3', '兴业县', 'xingyexian', '', '537800', '0775', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2415', '355', '21,355,2415,', '3', '北流', 'beiliu', '', '537400', '0775', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2416', '356', '21,356,2416,', '3', '右江区', 'youjiangqu', '', '533000', '0776', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2417', '356', '21,356,2417,', '3', '田阳县', 'tianyangxian', '', '533600', '0776', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2418', '356', '21,356,2418,', '3', '田东县', 'tiandongxian', '', '531500', '0776', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2419', '356', '21,356,2419,', '3', '平果县', 'pingguoxian', '', '531400', '0776', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2420', '356', '21,356,2420,', '3', '德保县', 'debaoxian', '', '533700', '0776', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2421', '356', '21,356,2421,', '3', '靖西县', 'jingxixian', '', '533800', '0776', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2422', '356', '21,356,2422,', '3', '那坡县', 'napoxian', '', '533900', '0776', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2423', '356', '21,356,2423,', '3', '凌云县', 'lingyunxian', '', '533100', '0776', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2424', '356', '21,356,2424,', '3', '乐业县', 'leyexian', '', '533200', '0776', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2425', '356', '21,356,2425,', '3', '田林县', 'tianlinxian', '', '533300', '0776', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2426', '356', '21,356,2426,', '3', '西林县', 'xilinxian', '', '533500', '0776', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2427', '356', '21,356,2427,', '3', '隆林各族自治县', 'longlingezu', '', '533500', '0776', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2428', '357', '21,357,2428,', '3', '八步区', 'babuqu', '', '542800', '0774', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2429', '357', '21,357,2429,', '3', '昭平县', 'zhaopingxian', '', '546800', '0774', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2430', '357', '21,357,2430,', '3', '钟山县', 'zhongshanxian', '', '542600', '0774', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2431', '357', '21,357,2431,', '3', '富川瑶族自治县', 'fuchuanyaozuzizhixian', '', '542700', '0774', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2432', '358', '21,358,2432,', '3', '金城江区', 'jinchengjiangqu', '', '547000', '0778', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2433', '358', '21,358,2433,', '3', '南丹县', 'nandanxian', '', '547200', '0778', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2434', '358', '21,358,2434,', '3', '天峨县', 'tianexian', '', '547300', '0778', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2435', '358', '21,358,2435,', '3', '凤山县', 'fengshanxian', '', '547600', '0778', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2436', '358', '21,358,2436,', '3', '东兰县', 'donglanxian', '', '547400', '0778', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2437', '358', '21,358,2437,', '3', '罗城仫佬族自治县', 'luochenglaozuzizhixian', '', '546400', '0778', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2438', '358', '21,358,2438,', '3', '环江毛南族自治县', 'huanjiangmaonanzu', '', '547100', '0778', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2439', '358', '21,358,2439,', '3', '巴马瑶族自治县', 'bamayaozu', '', '547500', '0778', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2440', '358', '21,358,2440,', '3', '都安瑶族自治县', 'duanyaozu', '', '530700', '0778', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2441', '358', '21,358,2441,', '3', '大化瑶族自治县', 'dahuayaozu', '', '530800', '0778', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2442', '358', '21,358,2442,', '3', '宜州', 'yizhou', '', '546300', '0778', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2443', '359', '21,359,2443,', '3', '兴宾区', 'xingbinqu', '', '546100', '0772', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2444', '359', '21,359,2444,', '3', '忻城县', 'xinchengxian', '', '546200', '0772', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2445', '359', '21,359,2445,', '3', '象州县', 'xiangzhouxian', '', '545800', '0772', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2446', '359', '21,359,2446,', '3', '武宣县', 'wuxuanxian', '', '545900', '0772', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2447', '359', '21,359,2447,', '3', '金秀瑶族自治县', 'jinxiuyaozu', '', '545700', '0772', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2448', '359', '21,359,2448,', '3', '合山', 'heshan', '', '546500', '0772', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2449', '360', '21,360,2449,', '3', '江洲区', 'jiangzhouqu', '', '532200', '0771', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2450', '360', '21,360,2450,', '3', '扶绥县', 'fusuixian', '', '532100', '0771', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2451', '360', '21,360,2451,', '3', '宁明县', 'ningmingxian', '', '532500', '0771', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2452', '360', '21,360,2452,', '3', '龙州县', 'longzhouxian', '', '532400', '0771', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2453', '360', '21,360,2453,', '3', '大新县', 'daxinxian', '', '532300', '0771', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2454', '360', '21,360,2454,', '3', '天等县', 'tiandengxian', '', '532800', '0771', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2455', '360', '21,360,2455,', '3', '凭祥', 'pingxiang', '', '532600', '0771', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2456', '361', '22,361,2456,', '3', '秀英区', 'xiuyingqu', '', '570100', '0898', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2457', '361', '22,361,2457,', '3', '龙华区', 'longhuaqu', '', '570100', '0898', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2458', '361', '22,361,2458,', '3', '琼山区', 'qiongshanqu', '', '571100', '0898', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2459', '361', '22,361,2459,', '3', '美兰区', 'meilanqu', '', '570100', '0898', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2460', '382', '23,382,2460,', '3', '锦江区', 'jinjiangqu', '', '610000', '028', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2461', '382', '23,382,2461,', '3', '青羊区', 'qingyangqu', '', '610000', '028', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2462', '382', '23,382,2462,', '3', '金牛区', 'jinniuqu', '', '610000', '028', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2463', '382', '23,382,2463,', '3', '武侯区', 'wuhouqu', '', '610000', '028', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2464', '382', '23,382,2464,', '3', '成华区', 'chenghuaqu', '', '610000', '028', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2465', '382', '23,382,2465,', '3', '龙泉驿区', 'longquanqu', '', '610100', '028', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2466', '382', '23,382,2466,', '3', '青白江区', 'qingbaijiangqu', '', '610300', '028', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2467', '382', '23,382,2467,', '3', '新都区', 'xinduqu', '', '610500', '028', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2468', '382', '23,382,2468,', '3', '温江区', 'wenjiangqu', '', '611100', '028', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2469', '382', '23,382,2469,', '3', '金堂县', 'jintangxian', '', '610400', '028', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2470', '382', '23,382,2470,', '3', '双流县', 'shuangliuxian', '', '610200', '028', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2471', '382', '23,382,2471,', '3', '郫县', 'pixian', '', '611700', '028', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2472', '382', '23,382,2472,', '3', '大邑县', 'dayixian', '', '611300', '028', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2473', '382', '23,382,2473,', '3', '蒲江县', 'pujiangxian', '', '611600', '028', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2474', '382', '23,382,2474,', '3', '新津县', 'xinjinxian', '', '611400', '028', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2475', '382', '23,382,2475,', '3', '都江堰', 'dujiangyan', '', '611800', '028', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2476', '382', '23,382,2476,', '3', '彭州', 'pengzhou', '', '610000', '028', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2477', '382', '23,382,2477,', '3', '邛崃', '', '', '611500', '028', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2478', '382', '23,382,2478,', '3', '崇州', 'chongzhou', '', '611200', '028', '0', '19', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2479', '383', '23,383,2479,', '3', '自流井区', 'ziliujingqu', '', '643000', '0813', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2480', '383', '23,383,2480,', '3', '贡井区', 'gongjingqu', '', '643020', '0813', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2481', '383', '23,383,2481,', '3', '大安区', 'daanqu', '', '643010', '0813', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2482', '383', '23,383,2482,', '3', '沿滩区', 'yantanqu', '', '643030', '0813', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2483', '383', '23,383,2483,', '3', '荣县', 'rongxian', '', '643100', '0813', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2484', '383', '23,383,2484,', '3', '富顺县', 'fushunxian', '', '643200', '0813', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2485', '384', '23,384,2485,', '3', '东区', 'dongqu', '', '617000', '0812', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2486', '384', '23,384,2486,', '3', '西区', 'xiqu', '', '617000', '0812', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2487', '384', '23,384,2487,', '3', '仁和区', 'renhequ', '', '617000', '0812', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2488', '384', '23,384,2488,', '3', '米易县', 'miyixian', '', '617200', '0812', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2489', '384', '23,384,2489,', '3', '盐边县', 'yanbianxian', '', '617100', '0812', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2490', '385', '23,385,2490,', '3', '江阳区', 'jiangyangqu', '', '646000', '0830', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2491', '385', '23,385,2491,', '3', '纳溪区', 'naxiqu', '', '646000', '0830', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2492', '385', '23,385,2492,', '3', '龙马潭区', 'longmatanqu', '', '646000', '0830', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2493', '385', '23,385,2493,', '3', '泸县', 'luxian', '', '646100', '0830', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2494', '385', '23,385,2494,', '3', '合江县', 'hejiangxian', '', '646200', '0830', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2495', '385', '23,385,2495,', '3', '叙永县', 'xuyongxian', '', '646400', '0830', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2496', '385', '23,385,2496,', '3', '古蔺县', 'guxian', '', '646500', '0830', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2497', '386', '23,386,2497,', '3', '旌阳区', 'yangqu', '', '618000', '0838', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2498', '386', '23,386,2498,', '3', '中江县', 'zhongjiangxian', '', '618300', '0838', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2499', '386', '23,386,2499,', '3', '罗江县', 'luojiangxian', '', '618500', '0838', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2500', '386', '23,386,2500,', '3', '广汉', 'guanghan', '', '618300', '0838', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2501', '386', '23,386,2501,', '3', '什邡', 'shi', '', '618400', '0838', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2502', '386', '23,386,2502,', '3', '绵竹', 'mianzhu', '', '618200', '0838', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2503', '387', '23,387,2503,', '3', '涪城区', 'fuchengqu', '', '621000', '0816', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2504', '387', '23,387,2504,', '3', '游仙区', 'youxianqu', '', '621000', '0816', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2505', '387', '23,387,2505,', '3', '三台县', 'santaixian', '', '621100', '0816', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2506', '387', '23,387,2506,', '3', '盐亭县', 'yantingxian', '', '621600', '0816', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2507', '387', '23,387,2507,', '3', '安县', 'anxian', '', '622650', '0816', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2508', '387', '23,387,2508,', '3', '梓潼县', 'zitongxian', '', '622150', '0816', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2509', '387', '23,387,2509,', '3', '北川羌族自治县', 'beichuanqiangzu', '', '622700', '0816', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2510', '387', '23,387,2510,', '3', '平武县', 'pingwuxian', '', '622550', '0816', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2511', '387', '23,387,2511,', '3', '江油', 'jiangyou', '', '621700', '0816', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2512', '388', '23,388,2512,', '3', '中区', 'zhongqu', '', '628000', '0839', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2513', '388', '23,388,2513,', '3', '元坝区', 'yuanbaqu', '', '628000', '0839', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2514', '388', '23,388,2514,', '3', '朝天区', 'chaotianqu', '', '628000', '0839', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2515', '388', '23,388,2515,', '3', '旺苍县', 'wangcangxian', '', '628200', '0839', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2516', '388', '23,388,2516,', '3', '青川县', 'qingchuanxian', '', '628100', '0839', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2517', '388', '23,388,2517,', '3', '剑阁县', 'jiangexian', '', '628300', '0839', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2518', '388', '23,388,2518,', '3', '苍溪县', 'cangxixian', '', '628400', '0839', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2519', '389', '23,389,2519,', '3', '船山区', 'chuanshanqu', '', '629000', '0825', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2520', '389', '23,389,2520,', '3', '安居区', 'anjuqu', '', '629000', '0825', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2521', '389', '23,389,2521,', '3', '蓬溪县', 'pengxixian', '', '629100', '0825', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2522', '389', '23,389,2522,', '3', '射洪县', 'shehongxian', '', '629200', '0825', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2523', '389', '23,389,2523,', '3', '大英县', 'dayingxian', '', '629300', '0825', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2524', '390', '23,390,2524,', '3', '中区', 'zhongqu', '', '641000', '0832', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2525', '390', '23,390,2525,', '3', '东兴区', 'dongxingqu', '', '641100', '0832', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2526', '390', '23,390,2526,', '3', '威远县', 'weiyuanxian', '', '642450', '0832', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2527', '390', '23,390,2527,', '3', '资中县', 'zizhongxian', '', '641200', '0832', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2528', '390', '23,390,2528,', '3', '隆昌县', 'longchangxian', '', '642150', '0832', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2529', '391', '23,391,2529,', '3', '中区', 'zhongqu', '', '614000', '0833', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2530', '391', '23,391,2530,', '3', '沙湾区', 'shawanqu', '', '614900', '0833', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2531', '391', '23,391,2531,', '3', '五通桥区', 'wutongqiaoqu', '', '614800', '0833', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2532', '391', '23,391,2532,', '3', '金口河区', 'jinkouhequ', '', '614700', '0833', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2533', '391', '23,391,2533,', '3', '犍为县', 'qianweixian', '', '614400', '0833', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2534', '391', '23,391,2534,', '3', '井研县', 'jingyanxian', '', '613100', '0833', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2535', '391', '23,391,2535,', '3', '夹江县', 'jiajiangxian', '', '614100', '0833', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2536', '391', '23,391,2536,', '3', '沐川县', 'chuanxian', '', '614500', '0833', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2537', '391', '23,391,2537,', '3', '峨边彝族自治县', 'ebianyizu', '', '614300', '0833', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2538', '391', '23,391,2538,', '3', '马边彝族自治县', 'mabianyizu', '', '614600', '0833', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2539', '391', '23,391,2539,', '3', '峨眉山', 'emeishan', '', '614200', '0833', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2540', '392', '23,392,2540,', '3', '顺庆区', 'shunqingqu', '', '637000', '0817', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2541', '392', '23,392,2541,', '3', '高坪区', 'gaopingqu', '', '637100', '0817', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2542', '392', '23,392,2542,', '3', '嘉陵区', 'jialingqu', '', '637500', '0817', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2543', '392', '23,392,2543,', '3', '南部县', 'nanbuxian', '', '637300', '0817', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2544', '392', '23,392,2544,', '3', '营山县', 'yingshanxian', '', '637700', '0817', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2545', '392', '23,392,2545,', '3', '蓬安县', 'penganxian', '', '637800', '0817', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2546', '392', '23,392,2546,', '3', '仪陇县', 'yilongxian', '', '637600', '0817', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2547', '392', '23,392,2547,', '3', '西充县', 'xichongxian', '', '637200', '0817', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2548', '392', '23,392,2548,', '3', '阆中', 'zhong', '', '637400', '0817', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2549', '393', '23,393,2549,', '3', '东坡区', 'dongpoqu', '', '620000', '0833', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2550', '393', '23,393,2550,', '3', '仁寿县', 'renshouxian', '', '620500', '0833', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2551', '393', '23,393,2551,', '3', '彭山县', 'pengshanxian', '', '620800', '0833', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2552', '393', '23,393,2552,', '3', '洪雅县', 'hongyaxian', '', '620300', '0833', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2553', '393', '23,393,2553,', '3', '丹棱县', 'danlengxian', '', '620200', '0833', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2554', '393', '23,393,2554,', '3', '青神县', 'qingshenxian', '', '620400', '0833', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2555', '394', '23,394,2555,', '3', '翠屏区', 'cuipingqu', '', '644000', '0831', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2556', '394', '23,394,2556,', '3', '宜宾县', 'yibinxian', '', '644600', '0831', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2557', '394', '23,394,2557,', '3', '南溪县', 'nanxixian', '', '644100', '0831', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2558', '394', '23,394,2558,', '3', '江安县', 'jianganxian', '', '644200', '0831', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2559', '394', '23,394,2559,', '3', '长宁县', 'changningxian', '', '644300', '0831', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2560', '394', '23,394,2560,', '3', '高县', 'gaoxian', '', '645150', '0831', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2561', '394', '23,394,2561,', '3', '珙县', 'gongxian', '', '644500', '0831', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2562', '394', '23,394,2562,', '3', '筠连县', 'lianxian', '', '645250', '0831', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2563', '394', '23,394,2563,', '3', '兴文县', 'xingwenxian', '', '644400', '0831', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2564', '394', '23,394,2564,', '3', '屏山县', 'pingshanxian', '', '645350', '0831', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2565', '395', '23,395,2565,', '3', '广安区', 'guanganqu', '', '638500', '0826', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2566', '395', '23,395,2566,', '3', '岳池县', 'yuechixian', '', '638300', '0826', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2567', '395', '23,395,2567,', '3', '武胜县', 'wushengxian', '', '638400', '0826', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2568', '395', '23,395,2568,', '3', '邻水县', 'linshuixian', '', '638500', '0826', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2569', '395', '23,395,2569,', '3', '华蓥', 'hua', '', '638600', '0826', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2570', '396', '23,396,2570,', '3', '通川区', 'tongchuanqu', '', '635000', '0818', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2571', '396', '23,396,2571,', '3', '达县', 'daxian', '', '635000', '0818', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2572', '396', '23,396,2572,', '3', '宣汉县', 'xuanhanxian', '', '636150', '0818', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2573', '396', '23,396,2573,', '3', '开江县', 'kaijiangxian', '', '636250', '0818', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2574', '396', '23,396,2574,', '3', '大竹县', 'dazhuxian', '', '635100', '0818', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2575', '396', '23,396,2575,', '3', '渠县', 'quxian', '', '635200', '0818', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2576', '396', '23,396,2576,', '3', '万源', 'wanyuan', '', '636350', '0818', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2577', '397', '23,397,2577,', '3', '雨城区', 'yuchengqu', '', '625000', '0835', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2578', '397', '23,397,2578,', '3', '名山县', 'mingshanxian', '', '625100', '0835', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2579', '397', '23,397,2579,', '3', '荥经县', 'jingxian', '', '625200', '0835', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2580', '397', '23,397,2580,', '3', '汉源县', 'hanyuanxian', '', '625300', '0835', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2581', '397', '23,397,2581,', '3', '石棉县', 'shimianxian', '', '625400', '0835', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2582', '397', '23,397,2582,', '3', '天全县', 'tianquanxian', '', '625500', '0835', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2583', '397', '23,397,2583,', '3', '芦山县', 'lushanxian', '', '625600', '0835', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2584', '397', '23,397,2584,', '3', '宝兴县', 'baoxingxian', '', '625700', '0835', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2585', '398', '23,398,2585,', '3', '巴州区', 'bazhouqu', '', '636600', '0827', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2586', '398', '23,398,2586,', '3', '通江县', 'tongjiangxian', '', '636700', '0827', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2587', '398', '23,398,2587,', '3', '南江县', 'nanjiangxian', '', '635600', '0827', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2588', '398', '23,398,2588,', '3', '平昌县', 'pingchangxian', '', '636400', '0827', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2589', '399', '23,399,2589,', '3', '雁江区', 'yanjiangqu', '', '641300', '0832', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2590', '399', '23,399,2590,', '3', '安岳县', 'anyuexian', '', '642350', '0832', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2591', '399', '23,399,2591,', '3', '乐至县', 'lezhixian', '', '641500', '0832', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2592', '399', '23,399,2592,', '3', '简阳', 'jianyang', '', '641400', '0832', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2593', '400', '23,400,2593,', '3', '汶川县', 'chuanxian', '', '623000', '0837', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2594', '400', '23,400,2594,', '3', '理县', 'lixian', '', '623100', '0837', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2595', '400', '23,400,2595,', '3', '茂县', 'maoxian', '', '623200', '0837', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2596', '400', '23,400,2596,', '3', '松潘县', 'songpanxian', '', '623300', '0837', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2597', '400', '23,400,2597,', '3', '九寨沟县', 'jiuzhaigouxian', '', '623400', '0837', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2598', '400', '23,400,2598,', '3', '金川县', 'jinchuanxian', '', '624100', '0837', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2599', '400', '23,400,2599,', '3', '小金县', 'xiaojinxian', '', '624200', '0837', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2600', '400', '23,400,2600,', '3', '黑水县', 'heishuixian', '', '623500', '0837', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2601', '400', '23,400,2601,', '3', '马尔康县', 'maerkangxian', '', '624000', '0837', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2602', '400', '23,400,2602,', '3', '壤塘县', 'rangtangxian', '', '624300', '0837', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2603', '400', '23,400,2603,', '3', '阿坝县', 'abaxian', '', '624600', '0837', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2604', '400', '23,400,2604,', '3', '若尔盖县', 'ruoergaixian', '', '624500', '0837', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2605', '400', '23,400,2605,', '3', '红原县', 'hongyuanxian', '', '624400', '0837', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2606', '401', '23,401,2606,', '3', '康定县', 'kangdingxian', '', '626000', '0836', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2607', '401', '23,401,2607,', '3', '泸定县', 'dingxian', '', '626100', '0836', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2608', '401', '23,401,2608,', '3', '丹巴县', 'danbaxian', '', '626300', '0836', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2609', '401', '23,401,2609,', '3', '九龙县', 'jiulongxian', '', '616200', '0836', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2610', '401', '23,401,2610,', '3', '雅江县', 'yajiangxian', '', '627450', '0836', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2611', '401', '23,401,2611,', '3', '道孚县', 'daoxian', '', '626400', '0836', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2612', '401', '23,401,2612,', '3', '炉霍县', 'luhuoxian', '', '626500', '0836', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2613', '401', '23,401,2613,', '3', '甘孜县', 'ganzixian', '', '626700', '0836', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2614', '401', '23,401,2614,', '3', '新龙县', 'xinlongxian', '', '626800', '0836', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2615', '401', '23,401,2615,', '3', '德格县', 'degexian', '', '627250', '0836', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2616', '401', '23,401,2616,', '3', '白玉县', 'baiyuxian', '', '627150', '0836', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2617', '401', '23,401,2617,', '3', '石渠县', 'shiquxian', '', '627350', '0836', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2618', '401', '23,401,2618,', '3', '色达县', 'sedaxian', '', '626600', '0836', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2619', '401', '23,401,2619,', '3', '理塘县', 'litangxian', '', '624300', '0836', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2620', '401', '23,401,2620,', '3', '巴塘县', 'batangxian', '', '627650', '0836', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2621', '401', '23,401,2621,', '3', '乡城县', 'xiangchengxian', '', '627850', '0836', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2622', '401', '23,401,2622,', '3', '稻城县', 'daochengxian', '', '627750', '0836', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2623', '401', '23,401,2623,', '3', '得荣县', 'derongxian', '', '627950', '0836', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2624', '402', '23,402,2624,', '3', '西昌', 'xichang', '', '615000', '0834', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2625', '402', '23,402,2625,', '3', '木里藏族自治县', 'mulicangzu', '', '615800', '0834', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2626', '402', '23,402,2626,', '3', '盐源县', 'yanyuanxian', '', '615700', '0834', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2627', '402', '23,402,2627,', '3', '德昌县', 'dechangxian', '', '615500', '0834', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2628', '402', '23,402,2628,', '3', '会理县', 'huilixian', '', '615100', '0834', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2629', '402', '23,402,2629,', '3', '会东县', 'huidongxian', '', '615200', '0834', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2630', '402', '23,402,2630,', '3', '宁南县', 'ningnanxian', '', '615400', '0834', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2631', '402', '23,402,2631,', '3', '普格县', 'pugexian', '', '615300', '0834', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2632', '402', '23,402,2632,', '3', '布拖县', 'butuoxian', '', '615350', '0834', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2633', '402', '23,402,2633,', '3', '金阳县', 'jinyangxian', '', '616250', '0834', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2634', '402', '23,402,2634,', '3', '昭觉县', 'zhaojuexian', '', '616150', '0834', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2635', '402', '23,402,2635,', '3', '喜德县', 'xidexian', '', '616750', '0834', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2636', '402', '23,402,2636,', '3', '冕宁县', 'mianningxian', '', '615600', '0834', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2637', '402', '23,402,2637,', '3', '越西县', 'yuexixian', '', '616650', '0834', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2638', '402', '23,402,2638,', '3', '甘洛县', 'ganluoxian', '', '616850', '0834', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2639', '402', '23,402,2639,', '3', '美姑县', 'meiguxian', '', '616450', '0834', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2640', '402', '23,402,2640,', '3', '雷波县', 'leiboxian', '', '616550', '0834', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2641', '403', '24,403,2641,', '3', '南明区', 'nanmingqu', '', '550000', '0851', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2642', '403', '24,403,2642,', '3', '云岩区', 'yunyanqu', '', '550000', '0851', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2643', '403', '24,403,2643,', '3', '花溪区', 'huaxiqu', '', '550000', '0851', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2644', '403', '24,403,2644,', '3', '乌当区', 'wudangqu', '', '550000', '0851', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2645', '403', '24,403,2645,', '3', '白云区', 'baiyunqu', '', '550000', '0851', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2646', '403', '24,403,2646,', '3', '小河区', 'xiaohequ', '', '550000', '0851', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2647', '403', '24,403,2647,', '3', '开阳县', 'kaiyangxian', '', '550300', '0851', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2648', '403', '24,403,2648,', '3', '息烽县', 'xifengxian', '', '551100', '0851', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2649', '403', '24,403,2649,', '3', '修文县', 'xiuwenxian', '', '550200', '0851', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2650', '403', '24,403,2650,', '3', '清镇', 'qingzhen', '', '551400', '0851', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2651', '404', '24,404,2651,', '3', '钟山区', 'zhongshanqu', '', '553000', '0858', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2652', '404', '24,404,2652,', '3', '六枝特区', 'liuzhitequ', '', '553400', '0858', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2653', '404', '24,404,2653,', '3', '水城县', 'shuichengxian', '', '553000', '0858', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2654', '404', '24,404,2654,', '3', '盘县', 'panxian', '', '561600', '0858', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2655', '405', '24,405,2655,', '3', '红花岗区', 'honghuagangqu', '', '563000', '0852', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2656', '405', '24,405,2656,', '3', '汇川区', 'huichuanqu', '', '563000', '0852', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2657', '405', '24,405,2657,', '3', '遵义县', 'zunyixian', '', '563100', '0852', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2658', '405', '24,405,2658,', '3', '桐梓县', 'tongxian', '', '563200', '0852', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2659', '405', '24,405,2659,', '3', '绥阳县', 'suiyangxian', '', '563300', '0852', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2660', '405', '24,405,2660,', '3', '正安县', 'zhenganxian', '', '563400', '0852', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2661', '405', '24,405,2661,', '3', '道真仡佬族苗族自治县', 'daozhenlaozumiaozu', '', '563500', '0852', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2662', '405', '24,405,2662,', '3', '务川仡佬族苗族自治县', 'wuchuanlaozumiaozu', '', '564300', '0852', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2663', '405', '24,405,2663,', '3', '凤冈县', 'fenggangxian', '', '564200', '0852', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2664', '405', '24,405,2664,', '3', '湄潭县', 'tanxian', '', '564100', '0852', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2665', '405', '24,405,2665,', '3', '余庆县', 'yuqingxian', '', '564400', '0852', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2666', '405', '24,405,2666,', '3', '习水县', 'xishuixian', '', '564600', '0852', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2667', '405', '24,405,2667,', '3', '赤水', 'chishui', '', '564700', '0852', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2668', '405', '24,405,2668,', '3', '仁怀', 'renhuai', '', '564500', '0852', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2669', '406', '24,406,2669,', '3', '西秀区', 'xixiuqu', '', '561000', '0853', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2670', '406', '24,406,2670,', '3', '平坝县', 'pingbaxian', '', '561100', '0853', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2671', '406', '24,406,2671,', '3', '普定县', 'pudingxian', '', '562100', '0853', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2672', '406', '24,406,2672,', '3', '镇宁布依族苗族自治县', 'zhenningbuyizumiaozu', '', '561200', '0853', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2673', '406', '24,406,2673,', '3', '关岭布依族苗族自治县', 'guanlingbuyizumiaozu', '', '561300', '0853', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2674', '406', '24,406,2674,', '3', '紫云苗族布依族自治县', 'ziyunmiaozubuyizu', '', '550800', '0853', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2675', '407', '24,407,2675,', '3', '铜仁', 'tongren', '', '554300', '0856', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2676', '407', '24,407,2676,', '3', '江口县', 'jiangkouxian', '', '554400', '0856', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2677', '407', '24,407,2677,', '3', '玉屏侗族自治县', 'yupingdongzu', '', '554000', '0856', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2678', '407', '24,407,2678,', '3', '石阡县', 'shixian', '', '555100', '0856', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2679', '407', '24,407,2679,', '3', '思南县', 'sinanxian', '', '565100', '0856', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2680', '407', '24,407,2680,', '3', '印江土家族苗族自治县', 'yinjiangtujiazumiaozu', '', '555200', '0856', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2681', '407', '24,407,2681,', '3', '德江县', 'dejiangxian', '', '565200', '0856', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2682', '407', '24,407,2682,', '3', '沿河土家族自治县', 'yanhetujiazu', '', '565300', '0856', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2683', '407', '24,407,2683,', '3', '松桃苗族自治县', 'songtaomiaozu', '', '554100', '0856', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2684', '407', '24,407,2684,', '3', '万山特区', 'wanshantequ', '', '554200', '0856', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2685', '408', '24,408,2685,', '3', '兴义', 'xingyi', '', '562400', '0859', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2686', '408', '24,408,2686,', '3', '兴仁县', 'xingrenxian', '', '562300', '0859', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2687', '408', '24,408,2687,', '3', '普安县', 'puanxian', '', '561500', '0859', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2688', '408', '24,408,2688,', '3', '晴隆县', 'qinglongxian', '', '561400', '0859', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2689', '408', '24,408,2689,', '3', '贞丰县', 'zhenfengxian', '', '562200', '0859', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2690', '408', '24,408,2690,', '3', '望谟县', 'wangxian', '', '552300', '0859', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2691', '408', '24,408,2691,', '3', '册亨县', 'cehengxian', '', '552200', '0859', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2692', '408', '24,408,2692,', '3', '安龙县', 'anlongxian', '', '552400', '0859', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2693', '409', '24,409,2693,', '3', '毕节', 'bijie', '', '551700', '0857', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2694', '409', '24,409,2694,', '3', '大方县', 'dafangxian', '', '551600', '0857', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2695', '409', '24,409,2695,', '3', '黔西县', 'qianxixian', '', '551500', '0857', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2696', '409', '24,409,2696,', '3', '金沙县', 'jinshaxian', '', '551800', '0857', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2697', '409', '24,409,2697,', '3', '织金县', 'zhijinxian', '', '552100', '0857', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2698', '409', '24,409,2698,', '3', '纳雍县', 'nayongxian', '', '553300', '0857', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2699', '409', '24,409,2699,', '3', '威宁彝族回族苗族自治县', 'weiningyizuhuizumiaozu', '', '553100', '0857', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2700', '409', '24,409,2700,', '3', '赫章县', 'hezhangxian', '', '553200', '0857', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2701', '410', '24,410,2701,', '3', '凯里', 'kaili', '', '556000', '0855', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2702', '410', '24,410,2702,', '3', '黄平县', 'huangpingxian', '', '556100', '0855', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2703', '410', '24,410,2703,', '3', '施秉县', 'shibingxian', '', '556200', '0855', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2704', '410', '24,410,2704,', '3', '三穗县', 'sansuixian', '', '556500', '0855', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2705', '410', '24,410,2705,', '3', '镇远县', 'zhenyuanxian', '', '557700', '0855', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2706', '410', '24,410,2706,', '3', '岑巩县', 'gongxian', '', '557800', '0855', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2707', '410', '24,410,2707,', '3', '天柱县', 'tianzhuxian', '', '556600', '0855', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2708', '410', '24,410,2708,', '3', '锦屏县', 'jinpingxian', '', '556700', '0855', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2709', '410', '24,410,2709,', '3', '剑河县', 'jianhexian', '', '556400', '0855', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2710', '410', '24,410,2710,', '3', '台江县', 'taijiangxian', '', '556300', '0855', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2711', '410', '24,410,2711,', '3', '黎平县', 'lipingxian', '', '557300', '0855', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2712', '410', '24,410,2712,', '3', '榕江县', 'jiangxian', '', '557200', '0855', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2713', '410', '24,410,2713,', '3', '从江县', 'congjiangxian', '', '557400', '0855', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2714', '410', '24,410,2714,', '3', '雷山县', 'leishanxian', '', '557100', '0855', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2715', '410', '24,410,2715,', '3', '麻江县', 'majiangxian', '', '557600', '0855', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2716', '410', '24,410,2716,', '3', '丹寨县', 'danzhaixian', '', '557500', '0855', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2717', '411', '24,411,2717,', '3', '都匀', 'duyun', '', '558000', '0854', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2718', '411', '24,411,2718,', '3', '福泉', 'fuquan', '', '550500', '0854', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2719', '411', '24,411,2719,', '3', '荔波县', 'liboxian', '', '558400', '0854', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2720', '411', '24,411,2720,', '3', '贵定县', 'guidingxian', '', '551300', '0854', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2721', '411', '24,411,2721,', '3', '瓮安县', 'wenganxian', '', '550400', '0854', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2722', '411', '24,411,2722,', '3', '独山县', 'dushanxian', '', '558200', '0854', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2723', '411', '24,411,2723,', '3', '平塘县', 'pingtangxian', '', '558300', '0854', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2724', '411', '24,411,2724,', '3', '罗甸县', 'luodianxian', '', '550100', '0854', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2725', '411', '24,411,2725,', '3', '长顺县', 'changshunxian', '', '550700', '0854', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2726', '411', '24,411,2726,', '3', '龙里县', 'longlixian', '', '551200', '0854', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2727', '411', '24,411,2727,', '3', '惠水县', 'huishuixian', '', '550600', '0854', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2728', '411', '24,411,2728,', '3', '三都水族自治县', 'sandushuizu', '', '558100', '0854', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2729', '412', '25,412,2729,', '3', '五华区', 'wuhuaqu', '', '650000', '0871', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2730', '412', '25,412,2730,', '3', '盘龙区', 'panlongqu', '', '650000', '0871', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2731', '412', '25,412,2731,', '3', '官渡区', 'guanduqu', '', '650200', '0871', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2732', '412', '25,412,2732,', '3', '西山区', 'xishanqu', '', '650100', '0871', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2733', '412', '25,412,2733,', '3', '东川区', 'dongchuanqu', '', '654100', '0871', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2734', '412', '25,412,2734,', '3', '呈贡县', 'chenggongxian', '', '650500', '0871', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2735', '412', '25,412,2735,', '3', '晋宁县', 'jinningxian', '', '650600', '0871', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2736', '412', '25,412,2736,', '3', '富民县', 'fuminxian', '', '650400', '0871', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2737', '412', '25,412,2737,', '3', '宜良县', 'yiliangxian', '', '652100', '0871', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2738', '412', '25,412,2738,', '3', '石林彝族自治县', 'shilinyizu', '', '652200', '0871', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2739', '412', '25,412,2739,', '3', '嵩明县', 'mingxian', '', '651700', '0871', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2740', '412', '25,412,2740,', '3', '禄劝彝族苗族自治县', 'luquanyizumiaozu', '', '651500', '0871', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2741', '412', '25,412,2741,', '3', '寻甸回族彝族自治县', 'xundianhuizuyizu', '', '655200', '0871', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2742', '412', '25,412,2742,', '3', '安宁', 'anning', '', '650300', '0871', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2743', '413', '25,413,2743,', '3', '麒麟区', 'qu', '', '655000', '0874', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2744', '413', '25,413,2744,', '3', '马龙县', 'malongxian', '', '655100', '0874', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2745', '413', '25,413,2745,', '3', '陆良县', 'luliangxian', '', '655600', '0874', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2746', '413', '25,413,2746,', '3', '师宗县', 'shizongxian', '', '655700', '0874', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2747', '413', '25,413,2747,', '3', '罗平县', 'luopingxian', '', '655800', '0874', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2748', '413', '25,413,2748,', '3', '富源县', 'fuyuanxian', '', '655500', '0874', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2749', '413', '25,413,2749,', '3', '会泽县', 'huizexian', '', '654200', '0874', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2750', '413', '25,413,2750,', '3', '沾益县', 'zhanyixian', '', '655500', '0874', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2751', '413', '25,413,2751,', '3', '宣威', 'xuanwei', '', '655400', '0874', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2752', '414', '25,414,2752,', '3', '红塔区', 'hongtaqu', '', '653100', '0877', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2753', '414', '25,414,2753,', '3', '江川县', 'jiangchuanxian', '', '652600', '0877', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2754', '414', '25,414,2754,', '3', '澄江县', 'chengjiangxian', '', '652500', '0877', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2755', '414', '25,414,2755,', '3', '通海县', 'tonghaixian', '', '652700', '0877', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2756', '414', '25,414,2756,', '3', '华宁县', 'huaningxian', '', '652800', '0877', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2757', '414', '25,414,2757,', '3', '易门县', 'yimenxian', '', '651100', '0877', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2758', '414', '25,414,2758,', '3', '峨山彝族自治县', 'eshanyizu', '', '653200', '0877', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2759', '414', '25,414,2759,', '3', '新平彝族傣族自治县', 'xinpingyizudaizu', '', '653400', '0877', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2760', '414', '25,414,2760,', '3', '元江哈尼族彝族傣族自治县', 'yuanjianghanizuyizudaizu', '', '653300', '0877', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2761', '415', '25,415,2761,', '3', '隆阳区', 'longyangqu', '', '678000', '0875', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2762', '415', '25,415,2762,', '3', '施甸县', 'shidianxian', '', '678200', '0875', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2763', '415', '25,415,2763,', '3', '腾冲县', 'tengchongxian', '', '679100', '0875', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2764', '415', '25,415,2764,', '3', '龙陵县', 'longlingxian', '', '678300', '0875', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2765', '415', '25,415,2765,', '3', '昌宁县', 'changningxian', '', '678100', '0875', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2766', '416', '25,416,2766,', '3', '昭阳区', 'zhaoyangqu', '', '657000', '0870', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2767', '416', '25,416,2767,', '3', '鲁甸县', 'ludianxian', '', '657100', '0870', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2768', '416', '25,416,2768,', '3', '巧家县', 'qiaojiaxian', '', '654600', '0870', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2769', '416', '25,416,2769,', '3', '盐津县', 'yanjinxian', '', '657500', '0870', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2770', '416', '25,416,2770,', '3', '大关县', 'daguanxian', '', '657400', '0870', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2771', '416', '25,416,2771,', '3', '永善县', 'yongshanxian', '', '657300', '0870', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2772', '416', '25,416,2772,', '3', '绥江县', 'suijiangxian', '', '657700', '0870', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2773', '416', '25,416,2773,', '3', '镇雄县', 'zhenxiongxian', '', '657200', '0870', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2774', '416', '25,416,2774,', '3', '彝良县', 'yiliangxian', '', '657600', '0870', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2775', '416', '25,416,2775,', '3', '威信县', 'weixinxian', '', '657900', '0870', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2776', '416', '25,416,2776,', '3', '水富县', 'shuifuxian', '', '657800', '0870', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2777', '417', '25,417,2777,', '3', '古城区', 'guchengqu', '', '674100', '0888', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2778', '417', '25,417,2778,', '3', '玉龙纳西族自治县', 'yulongnaxizu', '', '674100', '0888', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2779', '417', '25,417,2779,', '3', '永胜县', 'yongshengxian', '', '674200', '0888', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2780', '417', '25,417,2780,', '3', '华坪县', 'huapingxian', '', '674800', '0888', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2781', '417', '25,417,2781,', '3', '宁蒗彝族自治县', 'ningyizuzizhixian', '', '674300', '0888', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2782', '418', '25,418,2782,', '3', '翠云区', 'cuiyunqu', '', '665000', '0879', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2783', '418', '25,418,2783,', '3', '普洱哈尼族彝族自治县', 'puerhanizuyizu', '', '665100', '0879', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2784', '418', '25,418,2784,', '3', '墨江哈尼族自治县', 'mojianghanizu', '', '654800', '0879', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2785', '418', '25,418,2785,', '3', '景东彝族自治县', 'jingdongyizu', '', '676200', '0879', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2786', '418', '25,418,2786,', '3', '景谷傣族彝族自治县', 'jinggudaizuyizu', '', '666400', '0879', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2787', '418', '25,418,2787,', '3', '镇沅彝族哈尼族拉祜族自治县', 'zhenyizuhanizulazu', '', '666500', '0879', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2788', '418', '25,418,2788,', '3', '江城哈尼族彝族自治县', 'jiangchenghanizuyizu', '', '665900', '0879', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2789', '418', '25,418,2789,', '3', '孟连傣族拉祜族佤族自治县', 'mengliandaizulazuzu', '', '665800', '0879', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2790', '418', '25,418,2790,', '3', '澜沧拉祜族自治县', 'lancanglazuzizhixian', '', '665600', '0879', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2791', '418', '25,418,2791,', '3', '西盟佤族自治县', 'ximengzuzizhixian', '', '665700', '0879', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2792', '419', '25,419,2792,', '3', '临翔区', 'linxiangqu', '', '677000', '0883', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2793', '419', '25,419,2793,', '3', '凤庆县', 'fengqingxian', '', '675900', '0883', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2794', '419', '25,419,2794,', '3', '云县', 'yunxian', '', '675800', '0883', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2795', '419', '25,419,2795,', '3', '永德县', 'yongdexian', '', '677600', '0883', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2796', '419', '25,419,2796,', '3', '镇康县', 'zhenkangxian', '', '677700', '0883', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2797', '419', '25,419,2797,', '3', '双江拉祜族佤族布朗族傣族自治县', 'shuangjianglazuzubulangzudaizu', '', '677300', '0883', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2798', '419', '25,419,2798,', '3', '耿马傣族佤族自治县', 'gengmadaizuzu', '', '677500', '0883', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2799', '420', '25,420,2799,', '3', '沧源佤族自治县', 'cangyuanzu', '', '677400', '0883', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2800', '420', '25,420,2800,', '3', '楚雄', 'chuxiong', '', '675000', '0878', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2801', '420', '25,420,2801,', '3', '双柏县', 'shuangbaixian', '', '675100', '0878', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2802', '420', '25,420,2802,', '3', '牟定县', 'moudingxian', '', '675500', '0878', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2803', '420', '25,420,2803,', '3', '南华县', 'nanhuaxian', '', '675200', '0878', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2804', '420', '25,420,2804,', '3', '姚安县', 'yaoanxian', '', '675300', '0878', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2805', '420', '25,420,2805,', '3', '大姚县', 'dayaoxian', '', '675400', '0878', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2806', '420', '25,420,2806,', '3', '永仁县', 'yongrenxian', '', '651400', '0878', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2807', '420', '25,420,2807,', '3', '元谋县', 'yuanmouxian', '', '651300', '0878', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2808', '420', '25,420,2808,', '3', '武定县', 'wudingxian', '', '651600', '0878', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2809', '420', '25,420,2809,', '3', '禄丰县', 'lufengxian', '', '651200', '0878', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2810', '421', '25,421,2810,', '3', '个旧', 'gejiu', '', '661000', '0873', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2811', '421', '25,421,2811,', '3', '开远', 'kaiyuan', '', '661600', '0873', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2812', '421', '25,421,2812,', '3', '蒙自县', 'mengzixian', '', '661100', '0873', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2813', '421', '25,421,2813,', '3', '屏边苗族自治县', 'pingbianmiaozu', '', '661200', '0873', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2814', '421', '25,421,2814,', '3', '建水县', 'jianshuixian', '', '654300', '0873', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2815', '421', '25,421,2815,', '3', '石屏县', 'shipingxian', '', '662200', '0873', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2816', '421', '25,421,2816,', '3', '弥勒县', 'milexian', '', '652300', '0873', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2817', '421', '25,421,2817,', '3', '泸西县', 'xixian', '', '652400', '0873', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2818', '421', '25,421,2818,', '3', '元阳县', 'yuanyangxian', '', '662400', '0873', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2819', '421', '25,421,2819,', '3', '红河县', 'honghexian', '', '654400', '0873', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2820', '421', '25,421,2820,', '3', '金平苗族瑶族傣族自治县', 'jinpingmiaozuyaozudaizu', '', '661500', '0873', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2821', '421', '25,421,2821,', '3', '绿春县', 'lvchunxian', '', '662500', '0873', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2822', '421', '25,421,2822,', '3', '河口瑶族自治县', 'hekouyaozu', '', '661300', '0873', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2823', '422', '25,422,2823,', '3', '文山县', 'wenshanxian', '', '663000', '0876', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2824', '422', '25,422,2824,', '3', '砚山县', 'yanshanxian', '', '663100', '0876', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2825', '422', '25,422,2825,', '3', '西畴县', 'xichouxian', '', '663500', '0876', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2826', '422', '25,422,2826,', '3', '麻栗坡县', 'malipoxian', '', '663600', '0876', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2827', '422', '25,422,2827,', '3', '马关县', 'maguanxian', '', '663700', '0876', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2828', '422', '25,422,2828,', '3', '丘北县', 'qiubeixian', '', '663200', '0876', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2829', '422', '25,422,2829,', '3', '广南县', 'guangnanxian', '', '663300', '0876', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2830', '422', '25,422,2830,', '3', '富宁县', 'funingxian', '', '663400', '0876', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2831', '423', '25,423,2831,', '3', '景洪', 'jinghong', '', '666100', '0691', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2832', '423', '25,423,2832,', '3', '勐海县', 'haixian', '', '666200', '0691', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2833', '423', '25,423,2833,', '3', '勐腊县', 'laxian', '', '666300', '0691', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2834', '424', '25,424,2834,', '3', '大理', 'dali', '', '671000', '0872', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2835', '424', '25,424,2835,', '3', '漾濞彝族自治县', 'yangyizu', '', '672500', '0872', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2836', '424', '25,424,2836,', '3', '祥云县', 'xiangyunxian', '', '672100', '0872', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2837', '424', '25,424,2837,', '3', '宾川县', 'binchuanxian', '', '671600', '0872', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2838', '424', '25,424,2838,', '3', '弥渡县', 'miduxian', '', '675600', '0872', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2839', '424', '25,424,2839,', '3', '南涧彝族自治县', 'nanjianyizu', '', '675700', '0872', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2840', '424', '25,424,2840,', '3', '巍山彝族回族自治县', 'weishanyizuhuizu', '', '672400', '0872', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2841', '424', '25,424,2841,', '3', '永平县', 'yongpingxian', '', '672600', '0872', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2842', '424', '25,424,2842,', '3', '云龙县', 'yunlongxian', '', '672700', '0872', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2843', '424', '25,424,2843,', '3', '洱源县', 'eryuanxian', '', '671200', '0872', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2844', '424', '25,424,2844,', '3', '剑川县', 'jianchuanxian', '', '671300', '0872', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2845', '424', '25,424,2845,', '3', '鹤庆县', 'heqingxian', '', '671500', '0872', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2846', '425', '25,425,2846,', '3', '瑞丽', 'ruili', '', '678600', '0692', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2847', '425', '25,425,2847,', '3', '潞西', 'luxi', '', '678400', '0692', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2848', '425', '25,425,2848,', '3', '梁河县', 'lianghexian', '', '679200', '0692', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2849', '425', '25,425,2849,', '3', '盈江县', 'yingjiangxian', '', '679300', '0692', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2850', '425', '25,425,2850,', '3', '陇川县', 'longchuanxian', '', '678700', '0692', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2851', '426', '25,426,2851,', '3', '泸水县', 'shuixian', '', '673200', '0886', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2852', '426', '25,426,2852,', '3', '福贡县', 'fugongxian', '', '673400', '0886', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2853', '426', '25,426,2853,', '3', '贡山独龙族怒族自治县', 'gongshandulongzunuzu', '', '673500', '0886', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2854', '426', '25,426,2854,', '3', '兰坪白族普米族自治县', 'lanpingbaizupumizu', '', '671400', '0886', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2855', '427', '25,427,2855,', '3', '香格里拉县', 'xianggelilaxian', '', '674400', '0887', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2856', '427', '25,427,2856,', '3', '德钦县', 'deqinxian', '', '674500', '0887', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2857', '427', '25,427,2857,', '3', '维西傈僳族自治县', 'weixilisuzu', '', '674600', '0887', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2858', '428', '26,428,2858,', '3', '城关区', 'chengguanqu', '', '850000', '0891', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2859', '428', '26,428,2859,', '3', '林周县', 'linzhouxian', '', '851600', '0891', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2860', '428', '26,428,2860,', '3', '当雄县', 'dangxiongxian', '', '851500', '0891', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2861', '428', '26,428,2861,', '3', '尼木县', 'nimuxian', '', '851600', '0891', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2862', '428', '26,428,2862,', '3', '曲水县', 'qushuixian', '', '850600', '0891', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2863', '428', '26,428,2863,', '3', '堆龙德庆县', 'duilongdeqingxian', '', '851400', '0891', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2864', '428', '26,428,2864,', '3', '达孜县', 'dazixian', '', '850100', '0891', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2865', '428', '26,428,2865,', '3', '墨竹工卡县', 'mozhugongkaxian', '', '850200', '0891', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2866', '429', '26,429,2866,', '3', '昌都县', 'changduxian', '', '854000', '0895', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2867', '429', '26,429,2867,', '3', '江达县', 'jiangdaxian', '', '854100', '0895', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2868', '429', '26,429,2868,', '3', '贡觉县', 'gongjuexian', '', '854200', '08053', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2869', '429', '26,429,2869,', '3', '类乌齐县', 'leiwuqixian', '', '855600', '08050', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2870', '429', '26,429,2870,', '3', '丁青县', 'dingqingxian', '', '855700', '08059', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2871', '429', '26,429,2871,', '3', '察雅县', 'chayaxian', '', '854300', '0895', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2872', '429', '26,429,2872,', '3', '八宿县', 'basuxian', '', '854600', '08056', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2873', '429', '26,429,2873,', '3', '左贡县', 'zuogongxian', '', '854400', '08055', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2874', '429', '26,429,2874,', '3', '芒康县', 'mangkangxian', '', '854500', '08054', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2875', '429', '26,429,2875,', '3', '洛隆县', 'luolongxian', '', '855400', '08057', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2876', '429', '26,429,2876,', '3', '边坝县', 'bianbaxian', '', '855500', '08058', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2877', '430', '26,430,2877,', '3', '乃东县', 'naidongxian', '', '856100', '0893', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2878', '430', '26,430,2878,', '3', '扎囊县', 'zhanangxian', '', '850800', '08040', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2879', '430', '26,430,2879,', '3', '贡嘎县', 'gonggaxian', '', '850700', '0893', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2880', '430', '26,430,2880,', '3', '桑日县', 'sangrixian', '', '856200', '0893', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2881', '430', '26,430,2881,', '3', '琼结县', 'qiongjiexian', '', '856800', '08039', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2882', '430', '26,430,2882,', '3', '曲松县', 'qusongxian', '', '856300', '08037', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2883', '430', '26,430,2883,', '3', '措美县', 'cuomeixian', '', '856900', '08077', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2884', '430', '26,430,2884,', '3', '洛扎县', 'luozhaxian', '', '851200', '08047', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2885', '430', '26,430,2885,', '3', '加查县', 'jiachaxian', '', '856400', '08036', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2886', '430', '26,430,2886,', '3', '隆子县', 'longzixian', '', '856600', '08038', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2887', '430', '26,430,2887,', '3', '错那县', 'cuonaxian', '', '856700', '08030', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2888', '430', '26,430,2888,', '3', '浪卡子县', 'langkazixian', '', '851100', '08048', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2889', '431', '26,431,2889,', '3', '日喀则', 'rikaze', '', '857000', '0892', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2890', '431', '26,431,2890,', '3', '南木林县', 'nanmulinxian', '', '857100', '08034', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2891', '431', '26,431,2891,', '3', '江孜县', 'jiangzixian', '', '857400', '0892', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2892', '431', '26,431,2892,', '3', '定日县', 'dingrixian', '', '858200', '08026', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2893', '431', '26,431,2893,', '3', '萨迦县', 'saxian', '', '857800', '08024', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2894', '431', '26,431,2894,', '3', '拉孜县', 'lazixian', '', '858100', '08032', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2895', '431', '26,431,2895,', '3', '昂仁县', 'angrenxian', '', '858500', '08031', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2896', '431', '26,431,2896,', '3', '谢通门县', 'xietongmenxian', '', '858900', '08033', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2897', '431', '26,431,2897,', '3', '白朗县', 'bailangxian', '', '857300', '0892', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2898', '431', '26,431,2898,', '3', '仁布县', 'renbuxian', '', '857200', '0892', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2899', '431', '26,431,2899,', '3', '康马县', 'kangmaxian', '', '857500', '08021', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2900', '431', '26,431,2900,', '3', '定结县', 'dingjiexian', '', '857900', '08025', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2901', '431', '26,431,2901,', '3', '仲巴县', 'zhongbaxian', '', '858800', '08029', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2902', '431', '26,431,2902,', '3', '亚东县', 'yadongxian', '', '857600', '08022', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2903', '431', '26,431,2903,', '3', '吉隆县', 'jilongxian', '', '858700', '08028', '0', '15', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2904', '431', '26,431,2904,', '3', '聂拉木县', 'nielamuxian', '', '858300', '08027', '0', '16', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2905', '431', '26,431,2905,', '3', '萨嘎县', 'sagaxian', '', '858600', '08020', '0', '17', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2906', '431', '26,431,2906,', '3', '岗巴县', 'gangbaxian', '', '857700', '08023', '0', '18', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2907', '432', '26,432,2907,', '3', '那曲县', 'naquxian', '', '852000', '0896', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2908', '432', '26,432,2908,', '3', '嘉黎县', 'jialixian', '', '852400', '08063', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2909', '432', '26,432,2909,', '3', '比如县', 'biruxian', '', '852300', '08062', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2910', '432', '26,432,2910,', '3', '聂荣县', 'nierongxian', '', '853500', '08065', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2911', '432', '26,432,2911,', '3', '安多县', 'anduoxian', '', '853400', '0896', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2912', '432', '26,432,2912,', '3', '申扎县', 'shenzhaxian', '', '853100', '08068', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2913', '432', '26,432,2913,', '3', '索县', 'suoxian', '', '852200', '08078', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2914', '432', '26,432,2914,', '3', '班戈县', 'bangexian', '', '852500', '08067', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2915', '432', '26,432,2915,', '3', '巴青县', 'baqingxian', '', '852100', '08061', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2916', '432', '26,432,2916,', '3', '尼玛县', 'nimaxian', '', '853200', '08081', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2917', '433', '26,433,2917,', '3', '普兰县', 'pulanxian', '', '859500', '08060', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2918', '433', '26,433,2918,', '3', '札达县', 'zhadaxian', '', '859600', '08071', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2919', '433', '26,433,2919,', '3', '噶尔县', 'gaerxian', '', '859000', '0897', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2920', '433', '26,433,2920,', '3', '日土县', 'rituxian', '', '859700', '08075', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2921', '433', '26,433,2921,', '3', '革吉县', 'gejixian', '', '859100', '08072', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2922', '433', '26,433,2922,', '3', '改则县', 'gaizexian', '', '859200', '08076', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2923', '433', '26,433,2923,', '3', '措勤县', 'cuoqinxian', '', '859300', '08069', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2924', '434', '26,434,2924,', '3', '林芝县', 'linzhixian', '', '860100', '0894', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2925', '434', '26,434,2925,', '3', '工布江达县', 'gongbujiangdaxian', '', '860200', '0894', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2926', '434', '26,434,2926,', '3', '米林县', 'milinxian', '', '860500', '0894', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2927', '434', '26,434,2927,', '3', '墨脱县', 'motuoxian', '', '860700', '0894', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2928', '434', '26,434,2928,', '3', '波密县', 'bomixian', '', '860300', '0894', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2929', '434', '26,434,2929,', '3', '察隅县', 'chayuxian', '', '860600', '0894', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2930', '434', '26,434,2930,', '3', '朗县', 'langxian', '', '860400', '0894', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2931', '435', '27,435,2931,', '3', '新城区', 'xinchengqu', '', '710000', '029', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2932', '435', '27,435,2932,', '3', '碑林区', 'beilinqu', '', '710000', '029', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2933', '435', '27,435,2933,', '3', '莲湖区', 'lianhuqu', '', '710000', '029', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2934', '435', '27,435,2934,', '3', '灞桥区', 'qiaoqu', '', '710000', '029', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2935', '435', '27,435,2935,', '3', '未央区', 'weiyangqu', '', '710000', '029', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2936', '435', '27,435,2936,', '3', '雁塔区', 'yantaqu', '', '710000', '029', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2937', '435', '27,435,2937,', '3', '阎良区', 'yanliangqu', '', '710000', '029', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2938', '435', '27,435,2938,', '3', '临潼区', 'linqu', '', '710600', '029', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2939', '435', '27,435,2939,', '3', '长安区', 'changanqu', '', '710100', '029', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2940', '435', '27,435,2940,', '3', '蓝田县', 'lantianxian', '', '710500', '029', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2941', '435', '27,435,2941,', '3', '周至县', 'zhouzhixian', '', '710400', '029', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2942', '435', '27,435,2942,', '3', '户县', 'huxian', '', '710300', '029', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2943', '435', '27,435,2943,', '3', '高陵县', 'gaolingxian', '', '710200', '029', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2944', '436', '27,436,2944,', '3', '王益区', 'wangyiqu', '', '727000', '0919', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2945', '436', '27,436,2945,', '3', '印台区', 'yintaiqu', '', '727000', '0919', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2946', '436', '27,436,2946,', '3', '耀州区', 'yaozhouqu', '', '727100', '0919', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2947', '436', '27,436,2947,', '3', '宜君县', 'yijunxian', '', '727200', '0919', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2948', '437', '27,437,2948,', '3', '渭滨区', 'weibinqu', '', '721000', '0917', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2949', '437', '27,437,2949,', '3', '金台区', 'jintaiqu', '', '721000', '0917', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2950', '437', '27,437,2950,', '3', '陈仓区', 'chencangqu', '', '721300', '0917', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2951', '437', '27,437,2951,', '3', '凤翔县', 'fengxiangxian', '', '721400', '0917', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2952', '437', '27,437,2952,', '3', '岐山县', 'shanxian', '', '722400', '0917', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2953', '437', '27,437,2953,', '3', '扶风县', 'fufengxian', '', '722200', '0917', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2954', '437', '27,437,2954,', '3', '眉县', 'meixian', '', '722300', '0917', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2955', '437', '27,437,2955,', '3', '陇县', 'longxian', '', '721200', '0917', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2956', '437', '27,437,2956,', '3', '千阳县', 'qianyangxian', '', '721100', '0917', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2957', '437', '27,437,2957,', '3', '麟游县', 'youxian', '', '721500', '0917', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2958', '437', '27,437,2958,', '3', '凤县', 'fengxian', '', '721700', '0917', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2959', '437', '27,437,2959,', '3', '太白县', 'taibaixian', '', '721600', '0917', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2960', '438', '27,438,2960,', '3', '秦都区', 'qinduqu', '', '712000', '0910', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2961', '438', '27,438,2961,', '3', '杨凌区', 'yanglingqu', '', '712100', '0910', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2962', '438', '27,438,2962,', '3', '渭城区', 'weichengqu', '', '712000', '0910', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2963', '438', '27,438,2963,', '3', '三原县', 'sanyuanxian', '', '713800', '0910', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2964', '438', '27,438,2964,', '3', '泾阳县', 'yangxian', '', '713700', '0910', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2965', '438', '27,438,2965,', '3', '乾县', 'qianxian', '', '713300', '0910', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2966', '438', '27,438,2966,', '3', '礼泉县', 'liquanxian', '', '713200', '0910', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2967', '438', '27,438,2967,', '3', '永寿县', 'yongshouxian', '', '713400', '0910', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2968', '438', '27,438,2968,', '3', '彬县', 'binxian', '', '713500', '0910', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2969', '438', '27,438,2969,', '3', '长武县', 'changwuxian', '', '713600', '0910', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2970', '438', '27,438,2970,', '3', '旬邑县', 'xunyixian', '', '711300', '0910', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2971', '438', '27,438,2971,', '3', '淳化县', 'chunhuaxian', '', '711200', '0910', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2972', '438', '27,438,2972,', '3', '武功县', 'wugongxian', '', '712200', '0910', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2973', '438', '27,438,2973,', '3', '兴平', 'xingping', '', '713100', '0910', '0', '14', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2974', '439', '27,439,2974,', '3', '临渭区', 'linweiqu', '', '714000', '0913', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2975', '439', '27,439,2975,', '3', '华县', 'huaxian', '', '714100', '0913', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2976', '439', '27,439,2976,', '3', '潼关县', 'guanxian', '', '714300', '0913', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2977', '439', '27,439,2977,', '3', '大荔县', 'dalixian', '', '715100', '0913', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2978', '439', '27,439,2978,', '3', '合阳县', 'heyangxian', '', '715300', '0913', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2979', '439', '27,439,2979,', '3', '澄城县', 'chengchengxian', '', '715200', '0913', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2980', '439', '27,439,2980,', '3', '蒲城县', 'puchengxian', '', '715500', '0913', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2981', '439', '27,439,2981,', '3', '白水县', 'baishuixian', '', '715600', '0913', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2982', '439', '27,439,2982,', '3', '富平县', 'fupingxian', '', '711700', '0913', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2983', '439', '27,439,2983,', '3', '韩城', 'hancheng', '', '715400', '0913', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2984', '439', '27,439,2984,', '3', '华阴', 'huayin', '', '714200', '0913', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2985', '440', '27,440,2985,', '3', '宝塔区', 'baotaqu', '', '716000', '0911', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2986', '440', '27,440,2986,', '3', '延长县', 'yanchangxian', '', '717100', '0911', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2987', '440', '27,440,2987,', '3', '延川县', 'yanchuanxian', '', '717200', '0911', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2988', '440', '27,440,2988,', '3', '子长县', 'zichangxian', '', '717300', '0911', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2989', '440', '27,440,2989,', '3', '安塞县', 'ansaixian', '', '717400', '0911', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2990', '440', '27,440,2990,', '3', '志丹县', 'zhidanxian', '', '717500', '0911', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2991', '440', '27,440,2991,', '3', '吴起县', 'wuqixian', '', '717600', '0911', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2992', '440', '27,440,2992,', '3', '甘泉县', 'ganquanxian', '', '716100', '0911', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2993', '440', '27,440,2993,', '3', '富县', 'fuxian', '', '727500', '0911', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2994', '440', '27,440,2994,', '3', '洛川县', 'luochuanxian', '', '727400', '0911', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2995', '440', '27,440,2995,', '3', '宜川县', 'yichuanxian', '', '716200', '0911', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2996', '440', '27,440,2996,', '3', '黄龙县', 'huanglongxian', '', '715700', '0911', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2997', '440', '27,440,2997,', '3', '黄陵县', 'huanglingxian', '', '727300', '0911', '0', '13', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2998', '441', '27,441,2998,', '3', '汉台区', 'hantaiqu', '', '723000', '0916', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('2999', '441', '27,441,2999,', '3', '南郑县', 'nanzhengxian', '', '723100', '0916', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3000', '441', '27,441,3000,', '3', '城固县', 'chengguxian', '', '723200', '0916', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3001', '441', '27,441,3001,', '3', '洋县', 'yangxian', '', '723300', '0916', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3002', '441', '27,441,3002,', '3', '西乡县', 'xixiangxian', '', '723500', '0916', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3003', '441', '27,441,3003,', '3', '勉县', 'mianxian', '', '724200', '0916', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3004', '441', '27,441,3004,', '3', '宁强县', 'ningqiangxian', '', '724400', '0916', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3005', '441', '27,441,3005,', '3', '略阳县', 'lueyangxian', '', '724300', '0916', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3006', '441', '27,441,3006,', '3', '镇巴县', 'zhenbaxian', '', '723600', '0916', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3007', '441', '27,441,3007,', '3', '留坝县', 'liubaxian', '', '724100', '0916', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3008', '441', '27,441,3008,', '3', '佛坪县', 'fopingxian', '', '723400', '0916', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3009', '442', '27,442,3009,', '3', '榆阳区', 'yuyangqu', '', '719000', '0912', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3010', '442', '27,442,3010,', '3', '神木县', 'shenmuxian', '', '719300', '0912', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3011', '442', '27,442,3011,', '3', '府谷县', 'fuguxian', '', '719400', '0912', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3012', '442', '27,442,3012,', '3', '横山县', 'hengshanxian', '', '719200', '0912', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3013', '442', '27,442,3013,', '3', '靖边县', 'jingbianxian', '', '718500', '0912', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3014', '442', '27,442,3014,', '3', '定边县', 'dingbianxian', '', '718600', '0912', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3015', '442', '27,442,3015,', '3', '绥德县', 'suidexian', '', '718000', '0912', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3016', '442', '27,442,3016,', '3', '米脂县', 'mizhixian', '', '718100', '0912', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3017', '442', '27,442,3017,', '3', '佳县', 'jiaxian', '', '719200', '0912', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3018', '442', '27,442,3018,', '3', '吴堡县', 'wubaoxian', '', '718200', '0912', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3019', '442', '27,442,3019,', '3', '清涧县', 'qingjianxian', '', '718300', '0912', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3020', '442', '27,442,3020,', '3', '子洲县', 'zizhouxian', '', '718400', '0912', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3021', '443', '27,443,3021,', '3', '汉滨区', 'hanbinqu', '', '725000', '0915', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3022', '443', '27,443,3022,', '3', '汉阴县', 'hanyinxian', '', '725100', '0915', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3023', '443', '27,443,3023,', '3', '石泉县', 'shiquanxian', '', '725200', '0915', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3024', '443', '27,443,3024,', '3', '宁陕县', 'ningshanxian', '', '711600', '0915', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3025', '443', '27,443,3025,', '3', '紫阳县', 'ziyangxian', '', '725300', '0915', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3026', '443', '27,443,3026,', '3', '岚皋县', 'gaoxian', '', '725400', '0915', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3027', '443', '27,443,3027,', '3', '平利县', 'pinglixian', '', '725500', '0915', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3028', '443', '27,443,3028,', '3', '镇坪县', 'zhenpingxian', '', '725600', '0915', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3029', '443', '27,443,3029,', '3', '旬阳县', 'xunyangxian', '', '725700', '0915', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3030', '443', '27,443,3030,', '3', '白河县', 'baihexian', '', '725800', '0915', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3031', '444', '27,444,3031,', '3', '商州区', 'shangzhouqu', '', '726000', '0914', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3032', '444', '27,444,3032,', '3', '洛南县', 'luonanxian', '', '726100', '0914', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3033', '444', '27,444,3033,', '3', '丹凤县', 'danfengxian', '', '726200', '0914', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3034', '444', '27,444,3034,', '3', '商南县', 'shangnanxian', '', '726300', '0914', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3035', '444', '27,444,3035,', '3', '山阳县', 'shanyangxian', '', '726400', '0914', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3036', '444', '27,444,3036,', '3', '镇安县', 'zhenanxian', '', '711500', '0914', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3037', '444', '27,444,3037,', '3', '柞水县', 'zuoshuixian', '', '711400', '0914', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3038', '445', '28,445,3038,', '3', '城关区', 'chengguanqu', '', '730030', '0931', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3039', '445', '28,445,3039,', '3', '七里河区', 'qilihequ', '', '730050', '0931', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3040', '445', '28,445,3040,', '3', '西固区', 'xiguqu', '', '730060', '0931', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3041', '445', '28,445,3041,', '3', '安宁区', 'anningqu', '', '730070', '0931', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3042', '445', '28,445,3042,', '3', '红古区', 'hongguqu', '', '730080', '0931', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3043', '445', '28,445,3043,', '3', '永登县', 'yongdengxian', '', '730300', '0931', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3044', '445', '28,445,3044,', '3', '皋兰县', 'gaolanxian', '', '730200', '0931', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3045', '445', '28,445,3045,', '3', '榆中县', 'yuzhongxian', '', '730100', '0931', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3046', '447', '28,447,3046,', '3', '金川区', 'jinchuanqu', '', '737100', '0935', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3047', '447', '28,447,3047,', '3', '永昌县', 'yongchangxian', '', '737200', '0935', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3048', '448', '28,448,3048,', '3', '白银区', 'baiyinqu', '', '730900', '0943', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3049', '448', '28,448,3049,', '3', '平川区', 'pingchuanqu', '', '730900', '0943', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3050', '448', '28,448,3050,', '3', '靖远县', 'jingyuanxian', '', '730600', '0943', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3051', '448', '28,448,3051,', '3', '会宁县', 'huiningxian', '', '730700', '0943', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3052', '448', '28,448,3052,', '3', '景泰县', 'jingtaixian', '', '730400', '0943', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3053', '449', '28,449,3053,', '3', '秦城区', 'qinchengqu', '', '741000', '0938', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3054', '449', '28,449,3054,', '3', '北道区', 'beidaoqu', '', '741000', '0938', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3055', '449', '28,449,3055,', '3', '清水县', 'qingshuixian', '', '741400', '0938', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3056', '449', '28,449,3056,', '3', '秦安县', 'qinanxian', '', '741600', '0938', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3057', '449', '28,449,3057,', '3', '甘谷县', 'ganguxian', '', '741200', '0938', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3058', '449', '28,449,3058,', '3', '武山县', 'wushanxian', '', '741300', '0938', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3059', '449', '28,449,3059,', '3', '张家川回族自治县', 'zhangjiachuanhuizu', '', '741500', '0938', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3060', '450', '28,450,3060,', '3', '凉州区', 'liangzhouqu', '', '733000', '0935', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3061', '450', '28,450,3061,', '3', '民勤县', 'minqinxian', '', '733300', '0935', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3062', '450', '28,450,3062,', '3', '古浪县', 'gulangxian', '', '733100', '0935', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3063', '450', '28,450,3063,', '3', '天祝藏族自治县', 'tianzhucangzu', '', '733200', '0935', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3064', '451', '28,451,3064,', '3', '甘州区', 'ganzhouqu', '', '734000', '0936', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3065', '451', '28,451,3065,', '3', '肃南裕固族自治县', 'sunanyuguzu', '', '734400', '0936', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3066', '451', '28,451,3066,', '3', '民乐县', 'minlexian', '', '734500', '0936', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3067', '451', '28,451,3067,', '3', '临泽县', 'linzexian', '', '734200', '0936', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3068', '451', '28,451,3068,', '3', '高台县', 'gaotaixian', '', '734300', '0936', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3069', '451', '28,451,3069,', '3', '山丹县', 'shandanxian', '', '734100', '0936', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3070', '452', '28,452,3070,', '3', '崆峒区', 'qu', '', '744000', '0933', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3071', '452', '28,452,3071,', '3', '泾川县', 'chuanxian', '', '744300', '0933', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3072', '452', '28,452,3072,', '3', '灵台县', 'lingtaixian', '', '744400', '0933', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3073', '452', '28,452,3073,', '3', '崇信县', 'chongxinxian', '', '744200', '0933', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3074', '452', '28,452,3074,', '3', '华亭县', 'huatingxian', '', '744100', '0933', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3075', '452', '28,452,3075,', '3', '庄浪县', 'zhuanglangxian', '', '744600', '0933', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3076', '452', '28,452,3076,', '3', '静宁县', 'jingningxian', '', '743400', '0933', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3077', '453', '28,453,3077,', '3', '肃州区', 'suzhouqu', '', '735000', '0937', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3078', '453', '28,453,3078,', '3', '金塔县', 'jintaxian', '', '735300', '0937', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3079', '453', '28,453,3079,', '3', '瓜州县', 'guazhouxian', '', '736100', '0937', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3080', '453', '28,453,3080,', '3', '肃北蒙古族自治县', 'subeimengguzu', '', '736300', '0937', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3081', '453', '28,453,3081,', '3', '阿克塞哈萨克族自治县', 'akesaihasakezu', '', '736400', '0937', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3082', '453', '28,453,3082,', '3', '玉门', 'yumen', '', '735200', '0937', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3083', '453', '28,453,3083,', '3', '敦煌', 'dunhuang', '', '736200', '0937', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3084', '454', '28,454,3084,', '3', '西峰区', 'xifengqu', '', '745000', '0934', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3085', '454', '28,454,3085,', '3', '庆城县', 'qingchengxian', '', '745100', '0934', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3086', '454', '28,454,3086,', '3', '环县', 'huanxian', '', '745700', '0934', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3087', '454', '28,454,3087,', '3', '华池县', 'huachixian', '', '745600', '0934', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3088', '454', '28,454,3088,', '3', '合水县', 'heshuixian', '', '745400', '0934', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3089', '454', '28,454,3089,', '3', '正宁县', 'zhengningxian', '', '745300', '0934', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3090', '454', '28,454,3090,', '3', '宁县', 'ningxian', '', '745200', '0934', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3091', '454', '28,454,3091,', '3', '镇原县', 'zhenyuanxian', '', '744500', '0934', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3092', '455', '28,455,3092,', '3', '安定区', 'andingqu', '', '743000', '0932', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3093', '455', '28,455,3093,', '3', '通渭县', 'tongweixian', '', '743300', '0932', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3094', '455', '28,455,3094,', '3', '陇西县', 'longxixian', '', '748100', '0932', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3095', '455', '28,455,3095,', '3', '渭源县', 'weiyuanxian', '', '748200', '0932', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3096', '455', '28,455,3096,', '3', '临洮县', 'linxian', '', '730500', '0932', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3097', '455', '28,455,3097,', '3', '漳县', 'zhangxian', '', '748300', '0932', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3098', '455', '28,455,3098,', '3', '岷县', 'minxian', '', '748400', '0932', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3099', '456', '28,456,3099,', '3', '武都区', 'wuduqu', '', '746000', '0939', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3100', '456', '28,456,3100,', '3', '成县', 'chengxian', '', '742500', '0939', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3101', '456', '28,456,3101,', '3', '文县', 'wenxian', '', '746400', '0939', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3102', '456', '28,456,3102,', '3', '宕昌县', 'changxian', '', '748500', '0939', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3103', '456', '28,456,3103,', '3', '康县', 'kangxian', '', '746500', '0939', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3104', '456', '28,456,3104,', '3', '西和县', 'xihexian', '', '742100', '0939', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3105', '456', '28,456,3105,', '3', '礼县', 'lixian', '', '742200', '0939', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3106', '456', '28,456,3106,', '3', '徽县', 'huixian', '', '742300', '0939', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3107', '456', '28,456,3107,', '3', '两当县', 'liangdangxian', '', '742400', '0939', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3108', '457', '28,457,3108,', '3', '临夏', 'linxia', '', '731100', '0930', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3109', '457', '28,457,3109,', '3', '临夏县', 'linxiaxian', '', '731800', '0930', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3110', '457', '28,457,3110,', '3', '康乐县', 'kanglexian', '', '731500', '0930', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3111', '457', '28,457,3111,', '3', '永靖县', 'yongjingxian', '', '731600', '0930', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3112', '457', '28,457,3112,', '3', '广河县', 'guanghexian', '', '731300', '0930', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3113', '457', '28,457,3113,', '3', '和政县', 'hezhengxian', '', '731200', '0930', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3114', '457', '28,457,3114,', '3', '东乡族自治县', 'dongxiangzuzizhixian', '', '731400', '0930', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3115', '457', '28,457,3115,', '3', '积石山保安族东乡族撒拉族自治县', 'jishishanbaoanzudongxiangzu', '', '731700', '0930', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3116', '458', '28,458,3116,', '3', '合作', 'hezuo', '', '747000', '0941', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3117', '458', '28,458,3117,', '3', '临潭县', 'lintanxian', '', '747500', '0941', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3118', '458', '28,458,3118,', '3', '卓尼县', 'zhuonixian', '', '747600', '0941', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3119', '458', '28,458,3119,', '3', '舟曲县', 'zhouquxian', '', '746300', '0941', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3120', '458', '28,458,3120,', '3', '迭部县', 'diebuxian', '', '747400', '0941', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3121', '458', '28,458,3121,', '3', '玛曲县', 'maquxian', '', '747300', '0941', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3122', '458', '28,458,3122,', '3', '碌曲县', 'luquxian', '', '747200', '0941', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3123', '458', '28,458,3123,', '3', '夏河县', 'xiahexian', '', '747100', '0941', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3124', '459', '29,459,3124,', '3', '城东区', 'chengdongqu', '', '810000', '0971', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3125', '459', '29,459,3125,', '3', '城中区', 'chengzhongqu', '', '810000', '0971', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3126', '459', '29,459,3126,', '3', '城西区', 'chengxiqu', '', '810000', '0971', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3127', '459', '29,459,3127,', '3', '城北区', 'chengbeiqu', '', '810000', '0971', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3128', '459', '29,459,3128,', '3', '大通回族土族自治县', 'datonghuizutuzu', '', '810100', '0971', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3129', '459', '29,459,3129,', '3', '湟中县', 'zhongxian', '', '811600', '0972', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3130', '459', '29,459,3130,', '3', '湟源县', 'yuanxian', '', '812100', '0972', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3131', '460', '29,460,3131,', '3', '平安县', 'pinganxian', '', '810600', '0972', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3132', '460', '29,460,3132,', '3', '民和回族土族自治县', 'minhehuizutuzuzizhixian', '', '810800', '0972', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3133', '460', '29,460,3133,', '3', '乐都县', 'leduxian', '', '810700', '0972', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3134', '460', '29,460,3134,', '3', '互助土族自治县', 'huzhutuzuzizhixian', '', '810500', '0972', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3135', '460', '29,460,3135,', '3', '化隆回族自治县', 'hualonghuizuzizhixian', '', '810900', '0972', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3136', '460', '29,460,3136,', '3', '循化撒拉族自治县', 'xunhuasalazu', '', '811100', '0972', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3137', '461', '29,461,3137,', '3', '门源回族自治县', 'menyuanhuizu', '', '810300', '0978', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3138', '461', '29,461,3138,', '3', '祁连县', 'qilianxian', '', '810400', '0970', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3139', '461', '29,461,3139,', '3', '海晏县', 'haixian', '', '812200', '0970', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3140', '461', '29,461,3140,', '3', '刚察县', 'gangchaxian', '', '812300', '0970', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3141', '462', '29,462,3141,', '3', '同仁县', 'tongrenxian', '', '811300', '0973', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3142', '462', '29,462,3142,', '3', '尖扎县', 'jianzhaxian', '', '811200', '0973', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3143', '462', '29,462,3143,', '3', '泽库县', 'zekuxian', '', '811400', '0973', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3144', '462', '29,462,3144,', '3', '河南蒙古族自治县', 'henanmengguzu', '', '811500', '0973', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3145', '463', '29,463,3145,', '3', '共和县', 'gonghexian', '', '813000', '0974', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3146', '463', '29,463,3146,', '3', '同德县', 'tongdexian', '', '813200', '0974', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3147', '463', '29,463,3147,', '3', '贵德县', 'guidexian', '', '811700', '0974', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3148', '463', '29,463,3148,', '3', '兴海县', 'xinghaixian', '', '813300', '0974', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3149', '463', '29,463,3149,', '3', '贵南县', 'guinanxian', '', '813100', '0974', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3150', '464', '29,464,3150,', '3', '玛沁县', 'maqinxian', '', '814000', '0975', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3151', '464', '29,464,3151,', '3', '班玛县', 'banmaxian', '', '814300', '0975', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3152', '464', '29,464,3152,', '3', '甘德县', 'gandexian', '', '814100', '0975', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3153', '464', '29,464,3153,', '3', '达日县', 'darixian', '', '814200', '0975', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3154', '464', '29,464,3154,', '3', '久治县', 'jiuzhixian', '', '624700', '0975', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3155', '464', '29,464,3155,', '3', '玛多县', 'maduoxian', '', '813500', '0975', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3156', '465', '29,465,3156,', '3', '玉树县', 'yushuxian', '', '815000', '0976', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3157', '465', '29,465,3157,', '3', '杂多县', 'zaduoxian', '', '815300', '0976', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3158', '465', '29,465,3158,', '3', '称多县', 'chengduoxian', '', '815100', '0976', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3159', '465', '29,465,3159,', '3', '治多县', 'zhiduoxian', '', '815400', '0976', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3160', '465', '29,465,3160,', '3', '囊谦县', 'nangqianxian', '', '815200', '0976', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3161', '465', '29,465,3161,', '3', '曲麻莱县', 'qumalaixian', '', '815500', '0976', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3162', '466', '29,466,3162,', '3', '格尔木', 'geermu', '', '816000', '0977', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3163', '466', '29,466,3163,', '3', '德令哈', 'delingha', '', '817000', '0977', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3164', '466', '29,466,3164,', '3', '乌兰县', 'wulanxian', '', '817100', '0977', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3165', '466', '29,466,3165,', '3', '都兰县', 'dulanxian', '', '816100', '0977', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3166', '466', '29,466,3166,', '3', '天峻县', 'tianjunxian', '', '817200', '0977', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3167', '467', '30,467,3167,', '3', '兴庆区', 'xingqingqu', '', '750000', '0951', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3168', '467', '30,467,3168,', '3', '西夏区', 'xixiaqu', '', '750000', '0951', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3169', '467', '30,467,3169,', '3', '金凤区', 'jinfengqu', '', '750000', '0951', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3170', '467', '30,467,3170,', '3', '永宁县', 'yongningxian', '', '750100', '0951', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3171', '467', '30,467,3171,', '3', '贺兰县', 'helanxian', '', '750200', '0951', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3172', '467', '30,467,3172,', '3', '灵武', 'lingwu', '', '751400', '0951', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3173', '468', '30,468,3173,', '3', '大武口区', 'dawukouqu', '', '753000', '0952', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3174', '468', '30,468,3174,', '3', '惠农区', 'huinongqu', '', '753000', '0952', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3175', '468', '30,468,3175,', '3', '平罗县', 'pingluoxian', '', '753400', '0952', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3176', '469', '30,469,3176,', '3', '利通区', 'litongqu', '', '751100', '0953', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3177', '469', '30,469,3177,', '3', '盐池县', 'yanchixian', '', '751500', '0953', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3178', '469', '30,469,3178,', '3', '同心县', 'tongxinxian', '', '751300', '0953', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3179', '469', '30,469,3179,', '3', '青铜峡', 'qingtongxia', '', '751600', '0953', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3180', '470', '30,470,3180,', '3', '原州区', 'yuanzhouqu', '', '756000', '0954', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3181', '470', '30,470,3181,', '3', '西吉县', 'xijixian', '', '756200', '0954', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3182', '470', '30,470,3182,', '3', '隆德县', 'longdexian', '', '756300', '0954', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3183', '470', '30,470,3183,', '3', '泾源县', 'yuanxian', '', '756400', '0954', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3184', '470', '30,470,3184,', '3', '彭阳县', 'pengyangxian', '', '756500', '0954', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3185', '471', '30,471,3185,', '3', '沙坡头区', 'shapotouqu', '', '755000', '0953', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3186', '471', '30,471,3186,', '3', '中宁县', 'zhongningxian', '', '755100', '0953', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3187', '471', '30,471,3187,', '3', '海原县', 'haiyuanxian', '', '755200', '0954', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3188', '472', '31,472,3188,', '3', '天山区', 'tianshanqu', '', '830000', '0991', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3189', '472', '31,472,3189,', '3', '沙依巴克区', 'shayibakequ', '', '830000', '0991', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3190', '472', '31,472,3190,', '3', '新区', 'xinqu', '', '830000', '0991', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3191', '472', '31,472,3191,', '3', '水磨沟区', 'shuimogouqu', '', '830000', '0991', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3192', '472', '31,472,3192,', '3', '头屯河区', 'toutunhequ', '', '830000', '0991', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3193', '472', '31,472,3193,', '3', '达坂城区', 'dachengqu', '', '830000', '0991', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3194', '472', '31,472,3194,', '3', '东山区', 'dongshanqu', '', '830000', '0991', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3195', '472', '31,472,3195,', '3', '乌鲁木齐县', 'wulumuqixian', '', '830000', '0991', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3196', '473', '31,473,3196,', '3', '独山子区', 'dushanziqu', '', '834000', '0990', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3197', '473', '31,473,3197,', '3', '克拉玛依区', 'kelamayiqu', '', '834000', '0990', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3198', '473', '31,473,3198,', '3', '白碱滩区', 'baijiantanqu', '', '834000', '0990', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3199', '473', '31,473,3199,', '3', '乌尔禾区', 'wuerhequ', '', '834000', '0990', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3200', '474', '31,474,3200,', '3', '吐鲁番', 'tulufan', '', '838000', '0995', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3201', '474', '31,474,3201,', '3', '鄯善县', 'shanxian', '', '838200', '0995', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3202', '474', '31,474,3202,', '3', '托克逊县', 'tuokexunxian', '', '838100', '0995', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3203', '475', '31,475,3203,', '3', '哈密', 'hami', '', '839000', '0902', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3204', '475', '31,475,3204,', '3', '巴里坤哈萨克自治县', 'balikunhasake', '', '839200', '0902', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3205', '475', '31,475,3205,', '3', '伊吾县', 'yiwuxian', '', '839300', '0902', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3206', '476', '31,476,3206,', '3', '昌吉', 'changji', '', '831100', '0994', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3207', '476', '31,476,3207,', '3', '阜康', 'fukang', '', '831500', '0994', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3208', '476', '31,476,3208,', '3', '米泉', 'miquan', '', '831400', '0994', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3209', '476', '31,476,3209,', '3', '呼图壁县', 'hutubixian', '', '831200', '0994', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3210', '476', '31,476,3210,', '3', '玛纳斯县', 'manasixian', '', '832200', '0994', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3211', '476', '31,476,3211,', '3', '奇台县', 'qitaixian', '', '831800', '0994', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3212', '476', '31,476,3212,', '3', '吉木萨尔县', 'jimusaerxian', '', '831700', '0994', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3213', '476', '31,476,3213,', '3', '木垒哈萨克自治县', 'muleihasake', '', '831900', '0994', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3214', '477', '31,477,3214,', '3', '博乐', 'bole', '', '833400', '0909', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3215', '477', '31,477,3215,', '3', '精河县', 'jinghexian', '', '833300', '0909', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3216', '477', '31,477,3216,', '3', '温泉县', 'wenquanxian', '', '833500', '0909', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3217', '478', '31,478,3217,', '3', '库尔勒', 'kuerle', '', '841000', '0996', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3218', '478', '31,478,3218,', '3', '轮台县', 'luntaixian', '', '841600', '0996', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3219', '478', '31,478,3219,', '3', '尉犁县', 'weilixian', '', '841500', '0996', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3220', '478', '31,478,3220,', '3', '若羌县', 'ruoqiangxian', '', '841800', '0996', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3221', '478', '31,478,3221,', '3', '且末县', 'qiemoxian', '', '841900', '0996', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3222', '478', '31,478,3222,', '3', '焉耆回族自治县', 'yanhuizu', '', '841100', '0996', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3223', '478', '31,478,3223,', '3', '和静县', 'hejingxian', '', '841300', '0996', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3224', '478', '31,478,3224,', '3', '和硕县', 'heshuoxian', '', '841200', '0996', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3225', '478', '31,478,3225,', '3', '博湖县', 'bohuxian', '', '841400', '0996', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3226', '479', '31,479,3226,', '3', '阿克苏', 'akesu', '', '843000', '0997', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3227', '479', '31,479,3227,', '3', '温宿县', 'wensuxian', '', '843100', '0997', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3228', '479', '31,479,3228,', '3', '库车县', 'kuchexian', '', '842000', '0997', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3229', '479', '31,479,3229,', '3', '沙雅县', 'shayaxian', '', '842200', '0997', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3230', '479', '31,479,3230,', '3', '新和县', 'xinhexian', '', '842100', '0997', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3231', '479', '31,479,3231,', '3', '拜城县', 'baichengxian', '', '842300', '0997', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3232', '479', '31,479,3232,', '3', '乌什县', 'wushixian', '', '843400', '0997', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3233', '479', '31,479,3233,', '3', '阿瓦提县', 'awatixian', '', '843200', '0997', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3234', '479', '31,479,3234,', '3', '柯坪县', 'kepingxian', '', '843600', '0997', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3235', '480', '31,480,3235,', '3', '阿图什', 'atushi', '', '845350', '0908', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3236', '480', '31,480,3236,', '3', '阿克陶县', 'aketaoxian', '', '845550', '0908', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3237', '480', '31,480,3237,', '3', '阿合奇县', 'aheqixian', '', '843500', '0997', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3238', '480', '31,480,3238,', '3', '乌恰县', 'wuqiaxian', '', '845450', '0908', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3239', '481', '31,481,3239,', '3', '喀什', 'kashi', '', '844000', '0998', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3240', '481', '31,481,3240,', '3', '疏附县', 'shufuxian', '', '844100', '0998', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3241', '481', '31,481,3241,', '3', '疏勒县', 'shulexian', '', '844200', '0998', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3242', '481', '31,481,3242,', '3', '英吉沙县', 'yingjishaxian', '', '844500', '0998', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3243', '481', '31,481,3243,', '3', '泽普县', 'zepuxian', '', '844800', '0998', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3244', '481', '31,481,3244,', '3', '莎车县', 'shachexian', '', '844700', '0998', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3245', '481', '31,481,3245,', '3', '叶城县', 'yechengxian', '', '844900', '0998', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3246', '481', '31,481,3246,', '3', '麦盖提县', 'maigaitixian', '', '844600', '0998', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3247', '481', '31,481,3247,', '3', '岳普湖县', 'yuepuhuxian', '', '844400', '0998', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3248', '481', '31,481,3248,', '3', '伽师县', 'shixian', '', '844300', '0998', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3249', '481', '31,481,3249,', '3', '巴楚县', 'bachuxian', '', '843800', '0998', '0', '11', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3250', '481', '31,481,3250,', '3', '塔什库尔干塔吉克自治县', 'tashikuergantajike', '', '845250', '0998', '0', '12', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3251', '482', '31,482,3251,', '3', '和田', 'hetian', '', '848000', '0903', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3252', '482', '31,482,3252,', '3', '和田县', 'hetianxian', '', '848000', '0903', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3253', '482', '31,482,3253,', '3', '墨玉县', 'moyuxian', '', '848100', '0903', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3254', '482', '31,482,3254,', '3', '皮山县', 'pishanxian', '', '845150', '0903', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3255', '482', '31,482,3255,', '3', '洛浦县', 'luopuxian', '', '848200', '0903', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3256', '482', '31,482,3256,', '3', '策勒县', 'celexian', '', '848300', '0903', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3257', '482', '31,482,3257,', '3', '于田县', 'yutianxian', '', '848400', '0903', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3258', '482', '31,482,3258,', '3', '民丰县', 'minfengxian', '', '848500', '0903', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3259', '483', '31,483,3259,', '3', '伊宁', 'yining', '', '835000', '0999', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3260', '483', '31,483,3260,', '3', '奎屯', 'kuitun', '', '833200', '0992', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3261', '483', '31,483,3261,', '3', '伊宁县', 'yiningxian', '', '835100', '0999', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3262', '483', '31,483,3262,', '3', '察布查尔锡伯自治县', 'chabuchaerxibo', '', '835300', '0999', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3263', '483', '31,483,3263,', '3', '霍城县', 'huochengxian', '', '835200', '0999', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3264', '483', '31,483,3264,', '3', '巩留县', 'gongliuxian', '', '835400', '0999', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3265', '483', '31,483,3265,', '3', '新源县', 'xinyuanxian', '', '835800', '0999', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3266', '483', '31,483,3266,', '3', '昭苏县', 'zhaosuxian', '', '835600', '0999', '0', '8', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3267', '483', '31,483,3267,', '3', '特克斯县', 'tekesixian', '', '835500', '0999', '0', '9', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3268', '483', '31,483,3268,', '3', '尼勒克县', 'nilekexian', '', '835700', '0999', '0', '10', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3269', '484', '31,484,3269,', '3', '塔城', 'tacheng', '', '834300', '0901', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3270', '484', '31,484,3270,', '3', '乌苏', 'wusu', '', '833300', '0992', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3271', '484', '31,484,3271,', '3', '额敏县', 'eminxian', '', '834600', '0901', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3272', '484', '31,484,3272,', '3', '沙湾县', 'shawanxian', '', '832100', '0993', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3273', '484', '31,484,3273,', '3', '托里县', 'tuolixian', '', '834500', '0901', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3274', '484', '31,484,3274,', '3', '裕民县', 'yuminxian', '', '834800', '0901', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3275', '484', '31,484,3275,', '3', '和布克赛尔蒙古自治县', 'hebukesaier', '', '834400', '0990', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3276', '485', '31,485,3276,', '3', '阿勒泰', 'aletai', '', '836500', '0906', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3277', '485', '31,485,3277,', '3', '布尔津县', 'buerjinxian', '', '836600', '0906', '0', '2', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3278', '485', '31,485,3278,', '3', '富蕴县', 'fuyunxian', '', '836100', '0906', '0', '3', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3279', '485', '31,485,3279,', '3', '福海县', 'fuhaixian', '', '836400', '0906', '0', '4', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3280', '485', '31,485,3280,', '3', '哈巴河县', 'habahexian', '', '836700', '0906', '0', '5', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3281', '485', '31,485,3281,', '3', '青河县', 'qinghexian', '', '836200', '0906', '0', '6', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3282', '485', '31,485,3282,', '3', '吉木乃县', 'jimunaixian', '', '836800', '0906', '0', '7', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3283', '1', '1,3283,', '2', '北京', 'beijing', '', '100000', '010', '1', '1', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('3284', '2', '2,3284,', '2', '上海', 'shanghai', '', '200000', '021', '2', '1', '0', '0', '1461817930');
INSERT INTO `web_citytype` VALUES ('3285', '3', '3,3285,', '2', '天津', 'tianjin', '', '300000', '022', '1', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3286', '4', '4,3286,', '2', '重庆', 'chongqing', '', '404000', '023', '0', '1', '0', '1', '1461817930');
INSERT INTO `web_citytype` VALUES ('3287', '278', '17,278,3287,', '3', '郑东新区', '', '', '', '', '0', '6', '0', '1', '1534240761');
INSERT INTO `web_citytype` VALUES ('3288', '278', '17,278,3288,', '3', '航空港区', '', '', '', '', '0', '7', '0', '1', '1534240777');
INSERT INTO `web_citytype` VALUES ('3289', '278', '17,278,3289,', '3', '高新区', '', '', '', '', '0', '9', '0', '1', '1534240795');
INSERT INTO `web_citytype` VALUES ('3290', '278', '17,278,3290,', '3', '经开区', '', '', '', '', '0', '8', '0', '1', '1534240817');
INSERT INTO `web_citytype` VALUES ('3293', '0', '0', '0', '覆盖全国', 'quanguo', '', '100000', '01', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for web_collect
-- ----------------------------
DROP TABLE IF EXISTS `web_collect`;
CREATE TABLE `web_collect` (
  `CollectID` int(10) NOT NULL AUTO_INCREMENT,
  `CollectMemberID` int(10) unsigned DEFAULT '0',
  `CollectGoodsID` int(10) unsigned DEFAULT '0',
  `CollectTime` int(10) unsigned DEFAULT '0',
  `CollectAgencyDomainID` varchar(30) DEFAULT '',
  `ctype` int(2) DEFAULT '1' COMMENT '收藏类型 1软文 2 媒体3视频',
  PRIMARY KEY (`CollectID`)
) ENGINE=MyISAM AUTO_INCREMENT=2981 DEFAULT CHARSET=utf8 COMMENT='商品收藏表';

-- ----------------------------
-- Records of web_collect
-- ----------------------------

-- ----------------------------
-- Table structure for web_config
-- ----------------------------
DROP TABLE IF EXISTS `web_config`;
CREATE TABLE `web_config` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `MemberID` int(10) DEFAULT '0' COMMENT '会员ID：-1为平台大于0为代理商',
  `WebSiteName` varchar(100) DEFAULT '' COMMENT '站点名称',
  `WebSiteTitle` varchar(100) DEFAULT '' COMMENT '站点标题',
  `WebSiteKeyword` varchar(100) DEFAULT '' COMMENT '站点关键字',
  `WebSiteDescription` varchar(255) DEFAULT '' COMMENT '站点描述',
  `WebSiteCompanyName` varchar(100) DEFAULT '' COMMENT '公司名称',
  `WebSitePhone` varchar(100) DEFAULT '' COMMENT '电话咨询',
  `WebSiteAfterSalePhone` varchar(100) DEFAULT '' COMMENT '售后电话',
  `WebSiteAddress` varchar(100) DEFAULT '' COMMENT '公司地址',
  `WebSiteQQ` varchar(100) DEFAULT '' COMMENT '服务QQ',
  `WebSiteEmail` varchar(100) DEFAULT '' COMMENT '公司邮箱',
  `WebSiteWXWBContent` text COMMENT '微信微博售后',
  `WebSiteLogo` varchar(100) DEFAULT '' COMMENT '头部LOGO',
  `WebSiteCopyright` varchar(255) DEFAULT '' COMMENT '站点版权信息',
  `WebSiteCooperation` text COMMENT '合作加盟',
  `WebSiteNotes` text COMMENT '发稿注意事项',
  `WebSitemmedia` text COMMENT '自媒体注意事项',
  `WebSitevido` text COMMENT '短视频媒体注意事项',
  `WebSiteUserAgreement` text COMMENT '用户协议',
  `WebSiteAbout` text COMMENT '关于我们',
  `WebSiteCoordinate` varchar(32) DEFAULT '' COMMENT '站点地图坐标',
  `WebSiteMusic` varchar(100) DEFAULT '' COMMENT '音乐路径',
  `autopush` int(5) DEFAULT NULL,
  `is_draw` int(2) DEFAULT '1' COMMENT '抽奖活动开关',
  `secret_id` varchar(80) DEFAULT NULL,
  `secret_key` varchar(80) DEFAULT NULL,
  `web_site` varchar(100) DEFAULT NULL COMMENT '网址域名带http://',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='站点配置信息数据表';

-- ----------------------------
-- Records of web_config
-- ----------------------------
INSERT INTO `web_config` VALUES ('29', '1790', '测试代理商', '代理商', '代理商', '代理商', '代理商', '13899880000', '13899880000', '1111111', '1111111', '1111', '100,150,200,249,301', '', '1111111', null, null, null, null, null, '<p>1111111</p>', '', '', null, '1', null, null, null);

-- ----------------------------
-- Table structure for web_draw_act
-- ----------------------------
DROP TABLE IF EXISTS `web_draw_act`;
CREATE TABLE `web_draw_act` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `isopen` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 每日 2合计',
  `num` int(11) NOT NULL,
  `tpl` tinyint(4) NOT NULL,
  `overymd` date NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_draw_act
-- ----------------------------
INSERT INTO `web_draw_act` VALUES ('3', '大转盘', '亲爱的顾客', '1', '0', '0', '3', '2020-04-01');

-- ----------------------------
-- Table structure for web_draw_actlist
-- ----------------------------
DROP TABLE IF EXISTS `web_draw_actlist`;
CREATE TABLE `web_draw_actlist` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `awardname` varchar(200) NOT NULL,
  `randnum` int(3) NOT NULL DEFAULT '0',
  `num` int(4) NOT NULL DEFAULT '0' COMMENT '红包值',
  PRIMARY KEY (`lid`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_draw_actlist
-- ----------------------------
INSERT INTO `web_draw_actlist` VALUES ('1', '3', '888元充值红包', '', '0', '0');
INSERT INTO `web_draw_actlist` VALUES ('2', '3', '2元充值红包', '', '40', '2');
INSERT INTO `web_draw_actlist` VALUES ('3', '3', '5元充值红包', '', '37', '5');
INSERT INTO `web_draw_actlist` VALUES ('4', '3', '8元充值红包', '', '16', '8');
INSERT INTO `web_draw_actlist` VALUES ('5', '3', '10元充值红包', '', '6', '10');
INSERT INTO `web_draw_actlist` VALUES ('6', '3', '66元充值红包', '', '1', '66');
INSERT INTO `web_draw_actlist` VALUES ('7', '3', '188元充值红包', '', '0', '188');
INSERT INTO `web_draw_actlist` VALUES ('8', '3', '苹果笔记本', '', '0', '0');

-- ----------------------------
-- Table structure for web_draw_actlog
-- ----------------------------
DROP TABLE IF EXISTS `web_draw_actlog`;
CREATE TABLE `web_draw_actlog` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `class_name` varchar(200) NOT NULL,
  `createtime` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `issend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否中奖0 未 1 中  2 未开',
  `order_sn` varchar(100) NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_draw_actlog
-- ----------------------------
INSERT INTO `web_draw_actlog` VALUES ('48', '813', '2元充值红包', '1579239903', '2.00', '1', 'cj20200117908344');
INSERT INTO `web_draw_actlog` VALUES ('49', '813', '2元充值红包', '1579239913', '2.00', '1', 'cj20200117270282');
INSERT INTO `web_draw_actlog` VALUES ('50', '813', '5元充值红包', '1579665953', '5.00', '1', 'cj20200122830639');
INSERT INTO `web_draw_actlog` VALUES ('51', '813', '2元充值红包', '1579665962', '2.00', '1', 'cj20200122757371');
INSERT INTO `web_draw_actlog` VALUES ('52', '813', '2元充值红包', '1579665975', '2.00', '1', 'cj20200122524515');
INSERT INTO `web_draw_actlog` VALUES ('53', '813', '2元充值红包', '1579665982', '2.00', '1', 'cj20200122011876');
INSERT INTO `web_draw_actlog` VALUES ('54', '813', '2元充值红包', '1579665988', '2.00', '1', 'cj20200122461344');
INSERT INTO `web_draw_actlog` VALUES ('55', '813', '5元充值红包', '1579666102', '5.00', '1', 'cj20200122578502');
INSERT INTO `web_draw_actlog` VALUES ('56', '813', '2元充值红包', '1579666187', '2.00', '1', 'cj20200122119182');
INSERT INTO `web_draw_actlog` VALUES ('57', '813', '8元充值红包', '1579666194', '8.00', '1', 'cj20200122578835');
INSERT INTO `web_draw_actlog` VALUES ('58', '813', '2元充值红包', '1579666202', '2.00', '1', 'cj20200122388833');
INSERT INTO `web_draw_actlog` VALUES ('59', '813', '5元充值红包', '1579666207', '5.00', '1', 'cj20200122804268');
INSERT INTO `web_draw_actlog` VALUES ('60', '813', '2元充值红包', '1579666214', '2.00', '1', 'cj20200122213018');
INSERT INTO `web_draw_actlog` VALUES ('61', '813', '2元充值红包', '1579666220', '2.00', '1', 'cj20200122650363');
INSERT INTO `web_draw_actlog` VALUES ('62', '813', '8元充值红包', '1579666226', '8.00', '1', 'cj20200122751303');
INSERT INTO `web_draw_actlog` VALUES ('63', '813', '2元充值红包', '1579666234', '2.00', '1', 'cj20200122768469');
INSERT INTO `web_draw_actlog` VALUES ('64', '813', '2元充值红包', '1579666240', '2.00', '1', 'cj20200122440416');
INSERT INTO `web_draw_actlog` VALUES ('65', '813', '8元充值红包', '1580091227', '8.00', '1', 'cj20200127066992');
INSERT INTO `web_draw_actlog` VALUES ('66', '813', '5元充值红包', '1580091232', '5.00', '1', 'cj20200127809756');
INSERT INTO `web_draw_actlog` VALUES ('67', '813', '8元充值红包', '1581317811', '8.00', '1', 'cj20200210777958');
INSERT INTO `web_draw_actlog` VALUES ('68', '813', '5元充值红包', '1581317861', '5.00', '1', 'cj20200210157709');
INSERT INTO `web_draw_actlog` VALUES ('69', '813', '5元充值红包', '1581484562', '5.00', '1', 'cj20200212657942');
INSERT INTO `web_draw_actlog` VALUES ('70', '813', '5元充值红包', '1581484570', '5.00', '1', 'cj20200212774142');
INSERT INTO `web_draw_actlog` VALUES ('71', '813', '10元充值红包', '1582173498', '10.00', '1', 'cj20200220002154');
INSERT INTO `web_draw_actlog` VALUES ('72', '813', '5元充值红包', '1582173506', '5.00', '1', 'cj20200220221231');
INSERT INTO `web_draw_actlog` VALUES ('73', '813', '2元充值红包', '1582173514', '2.00', '1', 'cj20200220591308');
INSERT INTO `web_draw_actlog` VALUES ('74', '813', '5元充值红包', '1582173520', '5.00', '1', 'cj20200220479081');
INSERT INTO `web_draw_actlog` VALUES ('75', '813', '5元充值红包', '1582173527', '5.00', '1', 'cj20200220204810');
INSERT INTO `web_draw_actlog` VALUES ('76', '813', '2元充值红包', '1582173533', '2.00', '1', 'cj20200220429718');
INSERT INTO `web_draw_actlog` VALUES ('77', '813', '2元充值红包', '1582184553', '2.00', '1', 'cj20200220639973');
INSERT INTO `web_draw_actlog` VALUES ('78', '813', '2元充值红包', '1582184560', '2.00', '1', 'cj20200220384084');
INSERT INTO `web_draw_actlog` VALUES ('79', '813', '5元充值红包', '1582184566', '5.00', '1', 'cj20200220554130');
INSERT INTO `web_draw_actlog` VALUES ('80', '813', '5元充值红包', '1582604059', '5.00', '1', 'cj20200225319991');
INSERT INTO `web_draw_actlog` VALUES ('81', '813', '2元充值红包', '1582604066', '2.00', '1', 'cj20200225917792');
INSERT INTO `web_draw_actlog` VALUES ('82', '813', '5元充值红包', '1583828290', '5.00', '1', 'cj20200310930502');
INSERT INTO `web_draw_actlog` VALUES ('83', '813', '2元充值红包', '1583828298', '2.00', '1', 'cj20200310891486');
INSERT INTO `web_draw_actlog` VALUES ('84', '813', '2元充值红包', '1583828952', '2.00', '1', 'cj20200310440139');
INSERT INTO `web_draw_actlog` VALUES ('85', '813', '5元充值红包', '1583828959', '5.00', '1', 'cj20200310335832');
INSERT INTO `web_draw_actlog` VALUES ('86', '813', '2元充值红包', '1583828965', '2.00', '1', 'cj20200310118609');
INSERT INTO `web_draw_actlog` VALUES ('87', '813', '2元充值红包', '1583828971', '2.00', '1', 'cj20200310533201');
INSERT INTO `web_draw_actlog` VALUES ('88', '813', '8元充值红包', '1583828977', '8.00', '1', 'cj20200310593237');
INSERT INTO `web_draw_actlog` VALUES ('89', '813', '2元充值红包', '1583829041', '2.00', '1', 'cj20200310789355');
INSERT INTO `web_draw_actlog` VALUES ('90', '813', '2元充值红包', '1583829048', '2.00', '1', 'cj20200310524880');
INSERT INTO `web_draw_actlog` VALUES ('91', '813', '2元充值红包', '1583829056', '2.00', '1', 'cj20200310105604');
INSERT INTO `web_draw_actlog` VALUES ('92', '813', '8元充值红包', '1583829062', '8.00', '1', 'cj20200310998201');
INSERT INTO `web_draw_actlog` VALUES ('93', '813', '5元充值红包', '1583829269', '5.00', '1', 'cj20200310109585');
INSERT INTO `web_draw_actlog` VALUES ('94', '813', '5元充值红包', '1583829277', '5.00', '1', 'cj20200310329497');
INSERT INTO `web_draw_actlog` VALUES ('95', '813', '8元充值红包', '1583829284', '8.00', '1', 'cj20200310714136');
INSERT INTO `web_draw_actlog` VALUES ('96', '813', '2元充值红包', '1583912376', '2.00', '1', 'cj20200311883622');
INSERT INTO `web_draw_actlog` VALUES ('97', '813', '2元充值红包', '1583912383', '2.00', '1', 'cj20200311511905');
INSERT INTO `web_draw_actlog` VALUES ('98', '813', '5元充值红包', '1583912389', '5.00', '1', 'cj20200311463015');
INSERT INTO `web_draw_actlog` VALUES ('99', '813', '5元充值红包', '1583912397', '5.00', '1', 'cj20200311264035');
INSERT INTO `web_draw_actlog` VALUES ('100', '813', '8元充值红包', '1583912403', '8.00', '1', 'cj20200311867375');
INSERT INTO `web_draw_actlog` VALUES ('101', '813', '10元充值红包', '1583912410', '10.00', '1', 'cj20200311538093');
INSERT INTO `web_draw_actlog` VALUES ('102', '813', '5元充值红包', '1583912418', '5.00', '1', 'cj20200311789983');
INSERT INTO `web_draw_actlog` VALUES ('103', '813', '2元充值红包', '1583912424', '2.00', '1', 'cj20200311970869');
INSERT INTO `web_draw_actlog` VALUES ('104', '813', '5元充值红包', '1586741470', '5.00', '1', 'cj20200413331769');
INSERT INTO `web_draw_actlog` VALUES ('105', '813', '5元充值红包', '1586741477', '5.00', '1', 'cj20200413193919');
INSERT INTO `web_draw_actlog` VALUES ('106', '813', '2元充值红包', '1586741484', '2.00', '1', 'cj20200413340071');
INSERT INTO `web_draw_actlog` VALUES ('107', '813', '5元充值红包', '1586741489', '5.00', '1', 'cj20200413707131');
INSERT INTO `web_draw_actlog` VALUES ('108', '813', '2元充值红包', '1586745577', '2.00', '1', 'cj20200413337768');
INSERT INTO `web_draw_actlog` VALUES ('109', '813', '8元充值红包', '1586745585', '8.00', '1', 'cj20200413443290');
INSERT INTO `web_draw_actlog` VALUES ('110', '813', '2元充值红包', '1586746351', '2.00', '1', 'cj20200413447002');
INSERT INTO `web_draw_actlog` VALUES ('111', '813', '2元充值红包', '1586746357', '2.00', '1', 'cj20200413868906');
INSERT INTO `web_draw_actlog` VALUES ('112', '813', '2元充值红包', '1588560656', '2.00', '1', 'cj20200504589674');
INSERT INTO `web_draw_actlog` VALUES ('113', '813', '8元充值红包', '1588649569', '8.00', '1', 'cj20200505063806');
INSERT INTO `web_draw_actlog` VALUES ('114', '813', '8元充值红包', '1588649574', '8.00', '1', 'cj20200505721594');
INSERT INTO `web_draw_actlog` VALUES ('115', '813', '2元充值红包', '1588649580', '2.00', '1', 'cj20200505351869');
INSERT INTO `web_draw_actlog` VALUES ('116', '813', '5元充值红包', '1588649586', '5.00', '1', 'cj20200505863780');
INSERT INTO `web_draw_actlog` VALUES ('117', '813', '5元充值红包', '1588649593', '5.00', '1', 'cj20200505631755');
INSERT INTO `web_draw_actlog` VALUES ('118', '813', '2元充值红包', '1588649599', '2.00', '1', 'cj20200505885084');
INSERT INTO `web_draw_actlog` VALUES ('119', '813', '2元充值红包', '1588649605', '2.00', '1', 'cj20200505357510');
INSERT INTO `web_draw_actlog` VALUES ('120', '813', '5元充值红包', '1588649611', '5.00', '1', 'cj20200505374686');
INSERT INTO `web_draw_actlog` VALUES ('121', '813', '2元充值红包', '1588649642', '2.00', '1', 'cj20200505742984');
INSERT INTO `web_draw_actlog` VALUES ('122', '1790', '5元充值红包', '1611121564', '5.00', '1', 'cj20210120097002');
INSERT INTO `web_draw_actlog` VALUES ('123', '1790', '2元充值红包', '1611121587', '2.00', '1', 'cj20210120185330');
INSERT INTO `web_draw_actlog` VALUES ('124', '1790', '8元充值红包', '1611121604', '8.00', '1', 'cj20210120443679');

-- ----------------------------
-- Table structure for web_envelopes
-- ----------------------------
DROP TABLE IF EXISTS `web_envelopes`;
CREATE TABLE `web_envelopes` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `MemberID` int(10) DEFAULT '0' COMMENT '会员ID',
  `parent_memberID` int(10) DEFAULT NULL,
  `OrderNumber` varchar(64) DEFAULT '' COMMENT '订单号',
  `Money` decimal(10,2) DEFAULT '0.00',
  `Remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `Time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_envelopes
-- ----------------------------

-- ----------------------------
-- Table structure for web_file
-- ----------------------------
DROP TABLE IF EXISTS `web_file`;
CREATE TABLE `web_file` (
  `FileID` int(10) NOT NULL AUTO_INCREMENT,
  `FileMarkID` tinyint(3) unsigned DEFAULT '0' COMMENT '每张图片数据来源的标示ID:1商品2评价图片3商家',
  `FileListID` int(10) unsigned DEFAULT '0' COMMENT '记录ID',
  `FilePicPath1` varchar(100) DEFAULT '',
  `FilePicPath2` varchar(100) DEFAULT '',
  `FilePicPath3` varchar(100) DEFAULT '',
  `FilePicPath4` varchar(100) DEFAULT '',
  `FilePicPath5` varchar(100) DEFAULT '',
  `FilePicPathMain` varchar(100) DEFAULT '',
  `DefaultState` tinyint(1) unsigned DEFAULT '0' COMMENT '默认图片',
  PRIMARY KEY (`FileID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片相册集数据表';

-- ----------------------------
-- Records of web_file
-- ----------------------------

-- ----------------------------
-- Table structure for web_freedbook
-- ----------------------------
DROP TABLE IF EXISTS `web_freedbook`;
CREATE TABLE `web_freedbook` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_freedbook
-- ----------------------------

-- ----------------------------
-- Table structure for web_help
-- ----------------------------
DROP TABLE IF EXISTS `web_help`;
CREATE TABLE `web_help` (
  `HelpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HelpTypeID` smallint(5) unsigned DEFAULT '0' COMMENT '分类ID',
  `HelpTypePath` varchar(30) DEFAULT '' COMMENT '分类路径',
  `HelpTitle` varchar(100) DEFAULT '' COMMENT '标题',
  `HelpPicPath` varchar(100) DEFAULT '' COMMENT '图片路径',
  `HelpContent` text COMMENT '账户积分小计',
  `HelpAbstract` text COMMENT '摘要',
  `HelpSort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  `HelpRecommendState` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐',
  `HelpState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `HelpTime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`HelpID`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='帮助中心数据表';

-- ----------------------------
-- Records of web_help
-- ----------------------------
INSERT INTO `web_help` VALUES ('15', '1', '1,', '售后服务', '20180102/d177aca0835fe6c5a274f1e3c1f647b5.png', '<pre>\r\n<p>\r\n	1． 化妆品及个人护理用品除质量问题外不予退货，商品过期或离过期不到3个月的情况除外(活动及清仓商品除外，例如：因商品保质期将到和外包装有损包括在内的所有活动清仓商品，不予退换货。请顾客对此类商品谨慎购买!)。\r\n</p>\r\n\r\n<p>\r\n	2． 购买化妆品请当场验收，若商品有破损，渗漏，缺少，配送有误等问题，请当即与京东客服人员联系，在您签收验货后发现上述现象我们将不负责退换。\r\n</p>\r\n\r\n<p>\r\n	3． 我们保证商品的进货渠道和质量，如果客户在使用时对商品质量表示置疑，请出具书面鉴定，我们会按照国家法律规定予以处理。因个人喜好(气味，色泽、型号，外观)和个人肤质不同要求的退货将无法受理。\r\n服务承诺：京东商城向您保证所售商品均为正品行货，京东自营商品自带机打发票，与商品一起寄送。凭质保证书及京东商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由京东联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。\r\n</p>\r\n\r\n<p>\r\n	<br />\r\n\r\n</p>\r\n\r\n<p>\r\n	京东商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！\r\n注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！\r\n京东商城上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东商城重要的经营资源，未经许可，禁止非法转载使用。\r\n注：本站商品信息均来自于厂商，其真实性、准确性和合法性由信息拥有者（厂商）负责。本站不提供任何保证，并不承担任何法律责任。\r\n</p>\r\n</pre>', '体验馆专业施工安装团队智和家验收标准交付', '0', '1', '1', '1508819185');
INSERT INTO `web_help` VALUES ('16', '7', '7,', '服务到家', '20171214/bf093f69933b8da59334dbded37e0340.png', '服务到家', '物流、送货、安装，\r\n一步到位', '0', '0', '1', '1513260583');
INSERT INTO `web_help` VALUES ('20', '12', '12,', '注册新用户', '', '<p class=\"p\">\r\n	<strong class=\"red\">TO</strong>：尊敬的客户您好！如果您需要购买本站家具，可先注册为会员，操作方法如下所示：\r\n</p>\r\n<b class=\"h1\"><i><span></span></i></b>', '', '0', '0', '1', '1513696037');
INSERT INTO `web_help` VALUES ('26', '12', '12,', '付款方式', '', '付款方式付款方式付款方式付款方式付款方式付款方式付款方式付款方式付款方式付款方式付款方式付款方式', '', '0', '0', '1', '1513696510');
INSERT INTO `web_help` VALUES ('27', '0', '', '常见问题解答', '', '常见问题解答常见问题解答常见问题解答常见问题解答常见问题解答常见问题解答常见问题解答常见问题解答', '', '0', '0', '1', '1513696540');

-- ----------------------------
-- Table structure for web_helptype
-- ----------------------------
DROP TABLE IF EXISTS `web_helptype`;
CREATE TABLE `web_helptype` (
  `TypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `TypePID` smallint(6) unsigned DEFAULT '0',
  `TypePath` varchar(50) DEFAULT '' COMMENT '用来表示当前分类所属的层级完整路径如：1,2,3,4,',
  `TypeNode` tinyint(3) unsigned DEFAULT '0' COMMENT '用来表达当前分类所属的层级位置',
  `TypeName` varchar(30) DEFAULT '',
  `TypeSort` smallint(6) unsigned DEFAULT '0',
  `TypeState` tinyint(1) unsigned DEFAULT '0',
  `TypeTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`TypeID`),
  KEY `Column_PID` (`TypePID`) USING BTREE,
  KEY `Column_TypePath` (`TypePath`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='帮助中心分类表';

-- ----------------------------
-- Records of web_helptype
-- ----------------------------
INSERT INTO `web_helptype` VALUES ('1', '0', '1,', '1', '帮助中心1', '0', '1', '1501732942');

-- ----------------------------
-- Table structure for web_home_price
-- ----------------------------
DROP TABLE IF EXISTS `web_home_price`;
CREATE TABLE `web_home_price` (
  `price_id` int(255) NOT NULL AUTO_INCREMENT,
  `member_id` int(255) DEFAULT '0' COMMENT '会员ID',
  `price_start` decimal(10,2) DEFAULT '0.00' COMMENT '开始价',
  `price_end` decimal(10,2) DEFAULT '0.00' COMMENT '结束价',
  `price_one` decimal(10,2) DEFAULT '0.00' COMMENT '铜',
  `price_two` decimal(10,2) DEFAULT '0.00' COMMENT '银',
  `price_three` decimal(10,2) DEFAULT '0.00' COMMENT '金',
  `price_four` decimal(10,2) DEFAULT '0.00' COMMENT '钻石',
  `price_five` decimal(10,2) DEFAULT '0.00' COMMENT '白金',
  `price_state` tinyint(1) DEFAULT '0' COMMENT '1可用',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8469 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_home_price
-- ----------------------------
INSERT INTO `web_home_price` VALUES ('171', '35', '0.00', '50.00', '1.00', '1.00', '2.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('170', '35', '51.00', '101.00', '10.00', '5.00', '6.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('169', '35', '102.00', '152.00', '24.00', '33.00', '10.00', '30.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('168', '35', '153.00', '203.00', '10.00', '20.00', '30.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('167', '35', '153.00', '203.00', '10.00', '20.00', '30.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8468', '-1', '30001.00', '50000.00', '1000.00', '900.00', '800.00', '700.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8467', '-1', '15001.00', '30000.00', '900.00', '800.00', '700.00', '600.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8466', '-1', '8001.00', '15000.00', '800.00', '700.00', '600.00', '500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8465', '-1', '5001.00', '8000.00', '700.00', '600.00', '500.00', '400.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8464', '-1', '3001.00', '5000.00', '600.00', '500.00', '400.00', '300.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8463', '-1', '2001.00', '3000.00', '500.00', '400.00', '300.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('166', '35', '102.00', '152.00', '24.00', '33.00', '10.00', '30.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('165', '35', '51.00', '101.00', '10.00', '5.00', '6.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('164', '35', '0.00', '50.00', '1.00', '1.00', '2.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('117', '33', '0.00', '200.00', '100.00', '50.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('116', '33', '0.00', '200.00', '100.00', '50.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4625', '90', '30001.00', '50000.00', '12000.00', '8000.00', '5000.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('112', '3', '1.00', '200.00', '70.00', '50.00', '40.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('113', '3', '1.00', '200.00', '70.00', '50.00', '40.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('264', '32', '201.00', '251.00', '30.00', '40.00', '50.00', '60.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('266', '32', '0.00', '200.00', '40.00', '30.00', '20.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('265', '32', '201.00', '251.00', '30.00', '40.00', '50.00', '60.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('198', '39', '0.00', '50.00', '30.00', '20.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('196', '39', '51.00', '101.00', '20.00', '11.00', '10.00', '9.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('195', '39', '0.00', '50.00', '30.00', '20.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('197', '39', '51.00', '101.00', '20.00', '11.00', '10.00', '9.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('263', '32', '0.00', '200.00', '40.00', '30.00', '20.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4624', '90', '15001.00', '30000.00', '8000.00', '5000.00', '3000.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4623', '90', '8001.00', '15000.00', '5000.00', '3000.00', '1500.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4622', '90', '5001.00', '8000.00', '3000.00', '2000.00', '800.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4621', '90', '3001.00', '5000.00', '3000.00', '800.00', '500.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4620', '90', '2001.00', '3000.00', '1000.00', '600.00', '300.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4619', '90', '1601.00', '2000.00', '2000.00', '250.00', '200.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4618', '90', '1001.00', '1600.00', '1000.00', '100.00', '160.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4617', '90', '601.00', '1000.00', '800.00', '100.00', '100.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4616', '90', '401.00', '600.00', '500.00', '50.00', '60.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4645', '90', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4644', '90', '2.00', '5.00', '5.00', '1.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4643', '90', '6.00', '15.00', '10.00', '1.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4642', '90', '16.00', '50.00', '20.00', '1.00', '1.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4641', '90', '51.00', '80.00', '40.00', '5.00', '10.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4640', '90', '81.00', '100.00', '60.00', '5.00', '10.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4639', '90', '101.00', '150.00', '100.00', '5.00', '15.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4638', '90', '151.00', '200.00', '200.00', '5.00', '20.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4637', '90', '201.00', '300.00', '3000.00', '10.00', '30.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4636', '90', '301.00', '400.00', '400.00', '5.00', '40.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('8462', '-1', '1601.00', '2000.00', '400.00', '300.00', '200.00', '100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8461', '-1', '1001.00', '1600.00', '300.00', '250.00', '160.00', '80.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8460', '-1', '601.00', '1000.00', '180.00', '120.00', '100.00', '50.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8459', '-1', '401.00', '600.00', '100.00', '80.00', '60.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8458', '-1', '301.00', '400.00', '90.00', '60.00', '40.00', '30.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8457', '-1', '201.00', '300.00', '90.00', '40.00', '30.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8456', '-1', '151.00', '200.00', '90.00', '30.00', '20.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8455', '-1', '101.00', '150.00', '80.00', '20.00', '15.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('384', '92', '3001.00', '50000.00', '1000.00', '600.00', '400.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('383', '92', '801.00', '3000.00', '500.00', '400.00', '300.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('382', '92', '401.00', '800.00', '400.00', '300.00', '200.00', '100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('381', '92', '201.00', '400.00', '300.00', '200.00', '100.00', '50.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('380', '92', '101.00', '200.00', '200.00', '100.00', '50.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('379', '92', '0.00', '100.00', '100.00', '50.00', '30.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('373', '92', '0.00', '100.00', '100.00', '50.00', '30.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('374', '92', '101.00', '200.00', '200.00', '100.00', '50.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('375', '92', '201.00', '400.00', '300.00', '200.00', '100.00', '50.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('376', '92', '401.00', '800.00', '400.00', '300.00', '200.00', '100.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('377', '92', '801.00', '3000.00', '500.00', '400.00', '300.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('378', '92', '3001.00', '50000.00', '1000.00', '600.00', '400.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3197', '98', '50001.00', '70000.00', '7000.00', '5500.00', '4500.00', '3500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('1242', '132', '6001.00', '50000.00', '6000.00', '5000.00', '3000.00', '1000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('1241', '132', '3001.00', '6000.00', '1000.00', '600.00', '400.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('639', '117', '20001.00', '50000.00', '20000.00', '18000.00', '16000.00', '13000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('650', '117', '0.00', '50.00', '30.00', '20.00', '15.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('638', '117', '10001.00', '20000.00', '10000.00', '8000.00', '7000.00', '6000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('649', '117', '51.00', '100.00', '50.00', '40.00', '30.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('1240', '132', '801.00', '3000.00', '500.00', '400.00', '300.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('1239', '132', '401.00', '800.00', '400.00', '300.00', '200.00', '100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('1238', '132', '201.00', '400.00', '240.00', '180.00', '100.00', '50.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('1237', '132', '101.00', '200.00', '140.00', '90.00', '50.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('1249', '132', '0.00', '100.00', '100.00', '80.00', '30.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('1248', '132', '101.00', '200.00', '140.00', '90.00', '50.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('1247', '132', '201.00', '400.00', '240.00', '180.00', '100.00', '50.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('1246', '132', '401.00', '800.00', '400.00', '300.00', '200.00', '100.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('1245', '132', '801.00', '3000.00', '500.00', '400.00', '300.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('1244', '132', '3001.00', '6000.00', '1000.00', '600.00', '400.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4066', '124', '0.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4067', '124', '0.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5262', '135', '20001.00', '50000.00', '20000.00', '16000.00', '12000.00', '10000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5261', '135', '10001.00', '20000.00', '10000.00', '8000.00', '6000.00', '5000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5260', '135', '5001.00', '10000.00', '5000.00', '4000.00', '3000.00', '2000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5259', '135', '2001.00', '5000.00', '2000.00', '1800.00', '1600.00', '1200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5258', '135', '1001.00', '2000.00', '800.00', '680.00', '580.00', '480.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5257', '135', '601.00', '1000.00', '500.00', '400.00', '300.00', '260.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5256', '135', '401.00', '600.00', '300.00', '260.00', '220.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5255', '135', '201.00', '400.00', '200.00', '160.00', '120.00', '100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5254', '135', '101.00', '200.00', '100.00', '80.00', '70.00', '60.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5253', '135', '51.00', '100.00', '50.00', '40.00', '30.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5252', '135', '0.00', '50.00', '30.00', '20.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5273', '135', '0.00', '50.00', '30.00', '20.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5272', '135', '51.00', '100.00', '50.00', '40.00', '30.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5271', '135', '101.00', '200.00', '100.00', '80.00', '70.00', '60.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5270', '135', '201.00', '400.00', '200.00', '160.00', '120.00', '100.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5269', '135', '401.00', '600.00', '300.00', '260.00', '220.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5268', '135', '601.00', '1000.00', '500.00', '400.00', '300.00', '260.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5267', '135', '1001.00', '2000.00', '800.00', '680.00', '580.00', '480.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5266', '135', '2001.00', '5000.00', '2000.00', '1800.00', '1600.00', '1200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5265', '135', '5001.00', '10000.00', '5000.00', '4000.00', '3000.00', '2000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5264', '135', '10001.00', '20000.00', '10000.00', '8000.00', '6000.00', '5000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5263', '135', '20001.00', '50000.00', '20000.00', '16000.00', '12000.00', '10000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3196', '98', '10001.00', '50000.00', '7000.00', '5000.00', '4000.00', '3000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3195', '98', '5001.00', '10000.00', '5000.00', '4300.00', '3500.00', '2500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3194', '98', '3001.00', '5000.00', '3500.00', '3000.00', '2400.00', '1500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3193', '98', '2001.00', '3000.00', '2000.00', '1600.00', '1200.00', '1000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3192', '98', '1501.00', '2000.00', '1500.00', '1200.00', '950.00', '800.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3213', '98', '281.00', '320.00', '280.00', '220.00', '170.00', '140.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3212', '98', '321.00', '360.00', '320.00', '270.00', '200.00', '160.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3211', '98', '361.00', '400.00', '360.00', '300.00', '220.00', '180.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3210', '98', '401.00', '500.00', '400.00', '330.00', '250.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3209', '98', '501.00', '600.00', '450.00', '380.00', '300.00', '250.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3208', '98', '601.00', '700.00', '500.00', '430.00', '350.00', '300.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3191', '98', '1001.00', '1500.00', '1200.00', '900.00', '750.00', '600.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3207', '98', '701.00', '800.00', '600.00', '500.00', '400.00', '350.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3190', '98', '901.00', '1000.00', '800.00', '700.00', '550.00', '460.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3206', '98', '801.00', '900.00', '700.00', '600.00', '480.00', '400.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3189', '98', '801.00', '900.00', '700.00', '600.00', '480.00', '400.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3205', '98', '901.00', '1000.00', '800.00', '700.00', '550.00', '460.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3188', '98', '701.00', '800.00', '600.00', '500.00', '400.00', '350.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3204', '98', '1001.00', '1500.00', '1200.00', '900.00', '750.00', '600.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('637', '117', '5001.00', '10000.00', '5000.00', '4000.00', '3500.00', '3000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('636', '117', '2001.00', '5000.00', '2000.00', '1800.00', '1600.00', '1200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('635', '117', '1001.00', '2000.00', '800.00', '680.00', '580.00', '480.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('634', '117', '601.00', '1000.00', '500.00', '400.00', '300.00', '260.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('633', '117', '401.00', '600.00', '300.00', '260.00', '220.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('632', '117', '201.00', '400.00', '200.00', '160.00', '120.00', '100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('631', '117', '101.00', '200.00', '100.00', '80.00', '70.00', '60.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('630', '117', '51.00', '100.00', '50.00', '40.00', '30.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('629', '117', '0.00', '50.00', '30.00', '20.00', '15.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('648', '117', '101.00', '200.00', '100.00', '80.00', '70.00', '60.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('647', '117', '201.00', '400.00', '200.00', '160.00', '120.00', '100.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('646', '117', '401.00', '600.00', '300.00', '260.00', '220.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('645', '117', '601.00', '1000.00', '500.00', '400.00', '300.00', '260.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('644', '117', '1001.00', '2000.00', '800.00', '680.00', '580.00', '480.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('643', '117', '2001.00', '5000.00', '2000.00', '1800.00', '1600.00', '1200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('642', '117', '5001.00', '10000.00', '5000.00', '4000.00', '3500.00', '3000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('641', '117', '10001.00', '20000.00', '10000.00', '8000.00', '7000.00', '6000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('640', '117', '20001.00', '50000.00', '20000.00', '18000.00', '16000.00', '13000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3187', '98', '601.00', '700.00', '500.00', '430.00', '350.00', '300.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3203', '98', '1501.00', '2000.00', '1500.00', '1200.00', '950.00', '800.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3186', '98', '501.00', '600.00', '450.00', '380.00', '300.00', '250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3202', '98', '2001.00', '3000.00', '2000.00', '1600.00', '1200.00', '1000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3185', '98', '401.00', '500.00', '400.00', '330.00', '250.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3201', '98', '3001.00', '5000.00', '3500.00', '3000.00', '2400.00', '1500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3184', '98', '361.00', '400.00', '360.00', '300.00', '220.00', '180.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3183', '98', '321.00', '360.00', '320.00', '270.00', '200.00', '160.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3200', '98', '5001.00', '10000.00', '5000.00', '4300.00', '3500.00', '2500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3199', '98', '10001.00', '50000.00', '7000.00', '5000.00', '4000.00', '3000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('846', '139', '30001.00', '60000.00', '10000.00', '8000.00', '6000.00', '4000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('845', '139', '10001.00', '30000.00', '5000.00', '4000.00', '3000.00', '2000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('844', '139', '5001.00', '10000.00', '3000.00', '2000.00', '1500.00', '1000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('843', '139', '3001.00', '5000.00', '1500.00', '1000.00', '800.00', '500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('842', '139', '1501.00', '3000.00', '800.00', '600.00', '500.00', '300.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('841', '139', '801.00', '1500.00', '500.00', '400.00', '300.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('840', '139', '501.00', '800.00', '350.00', '300.00', '200.00', '150.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('839', '139', '301.00', '500.00', '200.00', '150.00', '100.00', '80.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('838', '139', '201.00', '300.00', '120.00', '80.00', '70.00', '60.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('837', '139', '161.00', '200.00', '80.00', '60.00', '50.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('836', '139', '121.00', '160.00', '60.00', '50.00', '40.00', '30.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('835', '139', '81.00', '120.00', '50.00', '40.00', '30.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('834', '139', '51.00', '80.00', '40.00', '30.00', '20.00', '15.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('833', '139', '31.00', '50.00', '30.00', '20.00', '15.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('832', '139', '21.00', '30.00', '20.00', '15.00', '10.00', '8.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('831', '139', '11.00', '20.00', '15.00', '10.00', '8.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('830', '139', '0.00', '10.00', '10.00', '5.00', '3.00', '2.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('847', '139', '30001.00', '60000.00', '10000.00', '8000.00', '6000.00', '4000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('848', '139', '10001.00', '30000.00', '5000.00', '4000.00', '3000.00', '2000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('849', '139', '5001.00', '10000.00', '3000.00', '2000.00', '1500.00', '1000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('850', '139', '3001.00', '5000.00', '1500.00', '1000.00', '800.00', '500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('851', '139', '1501.00', '3000.00', '800.00', '600.00', '500.00', '300.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('852', '139', '801.00', '1500.00', '500.00', '400.00', '300.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('853', '139', '501.00', '800.00', '350.00', '300.00', '200.00', '150.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('854', '139', '301.00', '500.00', '200.00', '150.00', '100.00', '80.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('855', '139', '201.00', '300.00', '120.00', '80.00', '70.00', '60.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('856', '139', '161.00', '200.00', '80.00', '60.00', '50.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('857', '139', '121.00', '160.00', '60.00', '50.00', '40.00', '30.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('858', '139', '81.00', '120.00', '50.00', '40.00', '30.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('859', '139', '51.00', '80.00', '40.00', '30.00', '20.00', '15.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('860', '139', '31.00', '50.00', '30.00', '20.00', '15.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('861', '139', '21.00', '30.00', '20.00', '15.00', '10.00', '8.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('862', '139', '11.00', '20.00', '15.00', '10.00', '8.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('863', '139', '0.00', '10.00', '10.00', '5.00', '3.00', '2.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('8454', '-1', '81.00', '100.00', '50.00', '12.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8453', '-1', '51.00', '80.00', '40.00', '12.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8452', '-1', '16.00', '50.00', '30.00', '6.00', '5.00', '2.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8451', '-1', '6.00', '15.00', '10.00', '5.00', '5.00', '1.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8450', '-1', '1.50', '5.00', '5.00', '2.00', '1.00', '1.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('8449', '-1', '0.00', '1.00', '4.00', '1.00', '1.00', '1.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('951', '150', '201.00', '400.00', '200.00', '160.00', '120.00', '80.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('950', '150', '101.00', '200.00', '100.00', '80.00', '60.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('949', '150', '51.00', '100.00', '50.00', '40.00', '30.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('948', '150', '0.00', '50.00', '20.00', '15.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('952', '150', '201.00', '400.00', '200.00', '160.00', '120.00', '80.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('953', '150', '101.00', '200.00', '100.00', '80.00', '60.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('954', '150', '51.00', '100.00', '50.00', '40.00', '30.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('955', '150', '0.00', '50.00', '20.00', '15.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('1236', '132', '0.00', '100.00', '100.00', '80.00', '30.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('1243', '132', '6001.00', '50000.00', '6000.00', '5000.00', '3000.00', '1000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4057', '110', '1001.00', '10000.00', '1000.00', '800.00', '600.00', '400.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4065', '110', '0.00', '30.00', '30.00', '20.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3182', '98', '281.00', '320.00', '280.00', '220.00', '170.00', '140.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3198', '98', '50001.00', '70000.00', '7000.00', '5500.00', '4500.00', '3500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4615', '90', '301.00', '400.00', '400.00', '5.00', '40.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4614', '90', '201.00', '300.00', '3000.00', '10.00', '30.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4613', '90', '151.00', '200.00', '200.00', '5.00', '20.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4612', '90', '101.00', '150.00', '100.00', '5.00', '15.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4611', '90', '81.00', '100.00', '60.00', '5.00', '10.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4610', '90', '51.00', '80.00', '40.00', '5.00', '10.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4609', '90', '16.00', '50.00', '20.00', '1.00', '1.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4608', '90', '6.00', '15.00', '10.00', '1.00', '0.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4607', '90', '2.00', '5.00', '5.00', '1.00', '0.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4606', '90', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4635', '90', '401.00', '600.00', '500.00', '50.00', '60.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4634', '90', '601.00', '1000.00', '800.00', '100.00', '100.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4633', '90', '1001.00', '1600.00', '1000.00', '100.00', '160.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4632', '90', '1601.00', '2000.00', '2000.00', '250.00', '200.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4631', '90', '2001.00', '3000.00', '1000.00', '600.00', '300.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4630', '90', '3001.00', '5000.00', '3000.00', '800.00', '500.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4629', '90', '5001.00', '8000.00', '3000.00', '2000.00', '800.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4628', '90', '8001.00', '15000.00', '5000.00', '3000.00', '1500.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4627', '90', '15001.00', '30000.00', '8000.00', '5000.00', '3000.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4626', '90', '30001.00', '50000.00', '12000.00', '8000.00', '5000.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('2126', '271', '301.00', '10000.00', '200.00', '160.00', '150.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3973', '270', '0.00', '5.00', '30.00', '20.00', '5.00', '2.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3958', '270', '2001.00', '5000.00', '100.00', '50.00', '25.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3972', '270', '6.00', '10.00', '30.00', '20.00', '5.00', '2.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3957', '270', '1001.00', '2000.00', '100.00', '50.00', '25.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3971', '270', '11.00', '15.00', '30.00', '20.00', '5.00', '2.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3956', '270', '201.00', '1000.00', '50.00', '40.00', '30.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('2131', '271', '0.00', '15.00', '15.00', '10.00', '6.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('2125', '271', '121.00', '300.00', '70.00', '60.00', '50.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('2130', '271', '16.00', '30.00', '20.00', '16.00', '14.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('2124', '271', '31.00', '120.00', '40.00', '35.00', '30.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('2129', '271', '31.00', '120.00', '40.00', '35.00', '30.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('2123', '271', '16.00', '30.00', '20.00', '16.00', '14.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('2128', '271', '121.00', '300.00', '70.00', '60.00', '50.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('2122', '271', '0.00', '15.00', '15.00', '10.00', '6.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('2127', '271', '301.00', '10000.00', '200.00', '160.00', '150.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3955', '270', '151.00', '200.00', '50.00', '40.00', '30.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3970', '270', '16.00', '20.00', '30.00', '20.00', '10.00', '2.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3954', '270', '101.00', '150.00', '50.00', '40.00', '30.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3953', '270', '51.00', '100.00', '50.00', '40.00', '25.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3952', '270', '41.00', '50.00', '50.00', '35.00', '20.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3951', '270', '36.00', '40.00', '50.00', '35.00', '20.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3950', '270', '31.00', '35.00', '50.00', '35.00', '20.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3949', '270', '26.00', '30.00', '30.00', '20.00', '20.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3969', '270', '21.00', '25.00', '30.00', '20.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3968', '270', '26.00', '30.00', '30.00', '20.00', '20.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3967', '270', '31.00', '35.00', '50.00', '35.00', '20.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3966', '270', '36.00', '40.00', '50.00', '35.00', '20.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3965', '270', '41.00', '50.00', '50.00', '35.00', '20.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3964', '270', '51.00', '100.00', '50.00', '40.00', '25.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3948', '270', '21.00', '25.00', '30.00', '20.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3947', '270', '16.00', '20.00', '30.00', '20.00', '10.00', '2.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3946', '270', '11.00', '15.00', '30.00', '20.00', '5.00', '2.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3963', '270', '101.00', '150.00', '50.00', '40.00', '30.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3962', '270', '151.00', '200.00', '50.00', '40.00', '30.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3961', '270', '201.00', '1000.00', '50.00', '40.00', '30.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3945', '270', '6.00', '10.00', '30.00', '20.00', '5.00', '2.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3944', '270', '0.00', '5.00', '30.00', '20.00', '5.00', '2.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3960', '270', '1001.00', '2000.00', '100.00', '50.00', '25.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3959', '270', '2001.00', '5000.00', '100.00', '50.00', '25.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3181', '98', '241.00', '280.00', '240.00', '190.00', '145.00', '120.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3180', '98', '201.00', '240.00', '200.00', '160.00', '120.00', '100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3179', '98', '181.00', '200.00', '180.00', '150.00', '115.00', '90.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3178', '98', '161.00', '180.00', '160.00', '130.00', '105.00', '80.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3177', '98', '141.00', '160.00', '140.00', '110.00', '90.00', '70.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3176', '98', '121.00', '140.00', '120.00', '95.00', '75.00', '60.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3175', '98', '100.10', '120.00', '100.00', '80.00', '60.00', '50.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3174', '98', '90.10', '100.00', '90.00', '70.00', '55.00', '45.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3173', '98', '80.10', '90.00', '80.00', '65.00', '50.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3172', '98', '70.10', '80.00', '70.00', '50.00', '40.00', '35.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3171', '98', '60.10', '70.00', '60.00', '50.00', '35.00', '30.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3170', '98', '50.10', '60.00', '45.00', '38.00', '32.00', '25.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3169', '98', '40.10', '50.00', '38.00', '31.00', '25.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3168', '98', '30.10', '40.00', '32.00', '25.00', '20.00', '16.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3167', '98', '20.10', '30.00', '28.00', '23.00', '18.00', '13.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3166', '98', '10.10', '20.00', '23.00', '20.00', '16.00', '12.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3165', '98', '0.00', '10.00', '12.00', '10.00', '8.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3214', '98', '241.00', '280.00', '240.00', '190.00', '145.00', '120.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3215', '98', '201.00', '240.00', '200.00', '160.00', '120.00', '100.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3216', '98', '181.00', '200.00', '180.00', '150.00', '115.00', '90.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3217', '98', '161.00', '180.00', '160.00', '130.00', '105.00', '80.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3218', '98', '141.00', '160.00', '140.00', '110.00', '90.00', '70.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3219', '98', '121.00', '140.00', '120.00', '95.00', '75.00', '60.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3220', '98', '100.10', '120.00', '100.00', '80.00', '60.00', '50.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3221', '98', '90.10', '100.00', '90.00', '70.00', '55.00', '45.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3222', '98', '80.10', '90.00', '80.00', '65.00', '50.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3223', '98', '70.10', '80.00', '70.00', '50.00', '40.00', '35.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3224', '98', '60.10', '70.00', '60.00', '50.00', '35.00', '30.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3225', '98', '50.10', '60.00', '45.00', '38.00', '32.00', '25.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3226', '98', '40.10', '50.00', '38.00', '31.00', '25.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3227', '98', '30.10', '40.00', '32.00', '25.00', '20.00', '16.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3228', '98', '20.10', '30.00', '28.00', '23.00', '18.00', '13.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3229', '98', '10.10', '20.00', '23.00', '20.00', '16.00', '12.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3230', '98', '0.00', '10.00', '12.00', '10.00', '8.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3534', '281', '30001.00', '50000.00', '7000.00', '6000.00', '5000.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3533', '281', '15001.00', '30000.00', '7000.00', '6000.00', '5000.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3532', '281', '5001.00', '15000.00', '7000.00', '6000.00', '5000.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3531', '281', '2001.00', '5000.00', '3000.00', '2000.00', '1000.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3530', '281', '1001.00', '2000.00', '1000.00', '700.00', '500.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3529', '281', '601.00', '1000.00', '300.00', '200.00', '100.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3528', '281', '401.00', '600.00', '100.00', '70.00', '50.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3527', '281', '301.00', '400.00', '40.00', '30.00', '20.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3526', '281', '201.00', '300.00', '30.00', '25.00', '20.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3525', '281', '151.00', '200.00', '20.00', '17.00', '15.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3524', '281', '101.00', '150.00', '13.00', '12.00', '10.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3523', '281', '81.00', '100.00', '15.00', '12.00', '10.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3522', '281', '51.00', '80.00', '8.00', '7.00', '5.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3521', '281', '16.00', '50.00', '7.00', '6.00', '5.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3520', '281', '6.00', '15.00', '6.00', '5.00', '4.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3519', '281', '2.00', '5.00', '3.00', '2.00', '1.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3518', '281', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3535', '281', '30001.00', '50000.00', '7000.00', '6000.00', '5000.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3536', '281', '15001.00', '30000.00', '7000.00', '6000.00', '5000.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3537', '281', '5001.00', '15000.00', '7000.00', '6000.00', '5000.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3538', '281', '2001.00', '5000.00', '3000.00', '2000.00', '1000.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3539', '281', '1001.00', '2000.00', '1000.00', '700.00', '500.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3540', '281', '601.00', '1000.00', '300.00', '200.00', '100.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3541', '281', '401.00', '600.00', '100.00', '70.00', '50.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3542', '281', '301.00', '400.00', '40.00', '30.00', '20.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3543', '281', '201.00', '300.00', '30.00', '25.00', '20.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3544', '281', '151.00', '200.00', '20.00', '17.00', '15.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3545', '281', '101.00', '150.00', '13.00', '12.00', '10.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3546', '281', '81.00', '100.00', '15.00', '12.00', '10.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3547', '281', '51.00', '80.00', '8.00', '7.00', '5.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3548', '281', '16.00', '50.00', '7.00', '6.00', '5.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3549', '281', '6.00', '15.00', '6.00', '5.00', '4.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3550', '281', '2.00', '5.00', '3.00', '2.00', '1.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3551', '281', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3721', '312', '81.00', '90.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3720', '312', '10.00', '80.00', '20.00', '15.00', '0.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('3723', '312', '10.00', '80.00', '20.00', '15.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('3722', '312', '81.00', '90.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4056', '110', '501.00', '1000.00', '150.00', '110.00', '70.00', '50.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4055', '110', '201.00', '500.00', '100.00', '80.00', '60.00', '30.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4054', '110', '121.00', '200.00', '70.00', '60.00', '50.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4053', '110', '91.00', '120.00', '60.00', '50.00', '40.00', '30.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4052', '110', '61.00', '90.00', '50.00', '40.00', '30.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4051', '110', '31.00', '60.00', '40.00', '30.00', '20.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4050', '110', '0.00', '30.00', '30.00', '20.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4064', '110', '31.00', '60.00', '40.00', '30.00', '20.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4063', '110', '61.00', '90.00', '50.00', '40.00', '30.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4062', '110', '91.00', '120.00', '60.00', '50.00', '40.00', '30.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4061', '110', '121.00', '200.00', '70.00', '60.00', '50.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4060', '110', '201.00', '500.00', '100.00', '80.00', '60.00', '30.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4059', '110', '501.00', '1000.00', '150.00', '110.00', '70.00', '50.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4058', '110', '1001.00', '10000.00', '1000.00', '800.00', '600.00', '400.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5138', '402', '29501.00', '30000.00', '24500.00', '26460.00', '26440.00', '26420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4469', '402', '1.00', '10.00', '4.50', '4.50', '4.50', '0.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5137', '402', '29001.00', '29500.00', '24000.00', '25960.00', '25940.00', '25920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4468', '402', '11.00', '50.00', '40.00', '30.00', '20.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5136', '402', '28501.00', '29000.00', '23500.00', '25460.00', '25440.00', '25420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4467', '402', '51.00', '100.00', '45.00', '30.00', '20.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5135', '402', '28001.00', '28500.00', '23000.00', '24960.00', '24940.00', '24920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4466', '402', '101.00', '200.00', '60.00', '30.00', '20.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5134', '402', '27501.00', '28000.00', '22500.00', '22460.00', '22440.00', '22420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4465', '402', '201.00', '300.00', '140.00', '100.00', '90.00', '80.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5133', '402', '27001.00', '27500.00', '22000.00', '21960.00', '21940.00', '21920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4464', '402', '301.00', '400.00', '180.00', '140.00', '100.00', '80.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5132', '402', '26501.00', '27000.00', '21500.00', '21460.00', '21440.00', '21420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4463', '402', '401.00', '500.00', '230.00', '190.00', '170.00', '150.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5131', '402', '26001.00', '26500.00', '21000.00', '20960.00', '20940.00', '20920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5130', '402', '25501.00', '26000.00', '20500.00', '20460.00', '20440.00', '20420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5129', '402', '25001.00', '25500.00', '20000.00', '19960.00', '19940.00', '19920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5128', '402', '24501.00', '25000.00', '19500.00', '19460.00', '19440.00', '19420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5127', '402', '24001.00', '24500.00', '19000.00', '18960.00', '18940.00', '18920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4462', '402', '501.00', '600.00', '280.00', '240.00', '220.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4461', '402', '601.00', '700.00', '330.00', '290.00', '270.00', '250.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4460', '402', '701.00', '800.00', '380.00', '340.00', '320.00', '300.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4459', '402', '801.00', '900.00', '430.00', '390.00', '370.00', '350.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4458', '402', '901.00', '1000.00', '480.00', '440.00', '420.00', '400.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5126', '402', '23501.00', '24000.00', '18500.00', '18460.00', '18440.00', '18420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5125', '402', '23001.00', '23500.00', '18000.00', '17960.00', '17940.00', '17920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5124', '402', '22501.00', '23000.00', '17500.00', '17460.00', '17440.00', '17420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5123', '402', '22001.00', '22500.00', '17000.00', '16960.00', '16940.00', '16920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5122', '402', '21501.00', '22000.00', '16500.00', '16460.00', '16440.00', '16420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5121', '402', '21001.00', '21500.00', '16000.00', '15960.00', '15940.00', '15920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4457', '402', '1001.00', '1100.00', '530.00', '490.00', '470.00', '450.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4456', '402', '1101.00', '1200.00', '580.00', '540.00', '520.00', '500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4455', '402', '1201.00', '1300.00', '630.00', '590.00', '570.00', '550.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4454', '402', '1301.00', '1400.00', '680.00', '640.00', '620.00', '600.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4453', '402', '1401.00', '1500.00', '730.00', '690.00', '670.00', '650.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4452', '402', '1501.00', '1600.00', '780.00', '740.00', '720.00', '700.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5120', '402', '20501.00', '21000.00', '15500.00', '15460.00', '15440.00', '15420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5119', '402', '20001.00', '20500.00', '15000.00', '14960.00', '14940.00', '14920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5118', '402', '19501.00', '20000.00', '14500.00', '14460.00', '14440.00', '14420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5117', '402', '19001.00', '19500.00', '14000.00', '13960.00', '13940.00', '13420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5116', '402', '18501.00', '19000.00', '13500.00', '13460.00', '13440.00', '13420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5115', '402', '18001.00', '18500.00', '13000.00', '12960.00', '12940.00', '12920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5114', '402', '17501.00', '18000.00', '12500.00', '12460.00', '12440.00', '12420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5113', '402', '17001.00', '17500.00', '12000.00', '11960.00', '11940.00', '11920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5112', '402', '16501.00', '17000.00', '11500.00', '11460.00', '11440.00', '11420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5111', '402', '16501.00', '16500.00', '11000.00', '10960.00', '10940.00', '10920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5110', '402', '16001.00', '16500.00', '10500.00', '10460.00', '10440.00', '10420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5109', '402', '15501.00', '16000.00', '10000.00', '9960.00', '9940.00', '9920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5108', '402', '15001.00', '15500.00', '9500.00', '9460.00', '9440.00', '9420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5107', '402', '14501.00', '15000.00', '9000.00', '8960.00', '8940.00', '8920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5106', '402', '14001.00', '14500.00', '8500.00', '8460.00', '8440.00', '8420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5105', '402', '13501.00', '14000.00', '8000.00', '7960.00', '7940.00', '7920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5104', '402', '13001.00', '13500.00', '7500.00', '7460.00', '7440.00', '7420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4451', '402', '1601.00', '1700.00', '830.00', '790.00', '770.00', '750.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4450', '402', '1701.00', '1800.00', '880.00', '840.00', '820.00', '800.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4449', '402', '1801.00', '1900.00', '930.00', '890.00', '870.00', '850.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4448', '402', '1901.00', '2000.00', '980.00', '940.00', '920.00', '900.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4447', '402', '2001.00', '2100.00', '1030.00', '990.00', '970.00', '950.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4446', '402', '2101.00', '2200.00', '1080.00', '1040.00', '1020.00', '1000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4445', '402', '2201.00', '2300.00', '1130.00', '1090.00', '1070.00', '1050.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4444', '402', '2301.00', '2400.00', '1180.00', '1140.00', '1120.00', '1100.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4443', '402', '2401.00', '2500.00', '1230.00', '1190.00', '1170.00', '1150.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4442', '402', '2501.00', '2600.00', '1280.00', '1240.00', '1220.00', '1200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4441', '402', '2601.00', '2700.00', '1330.00', '1290.00', '1270.00', '1250.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4440', '402', '2701.00', '2800.00', '1380.00', '1340.00', '1320.00', '1300.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4439', '402', '2801.00', '2900.00', '1430.00', '1390.00', '1370.00', '1350.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4438', '402', '2901.00', '3000.00', '1480.00', '1440.00', '1420.00', '1400.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4437', '402', '3001.00', '4000.00', '1530.00', '1490.00', '1470.00', '1450.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4436', '402', '4001.00', '5000.00', '1580.00', '1540.00', '1520.00', '1500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4435', '402', '5001.00', '6000.00', '1630.00', '1590.00', '1570.00', '1550.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5103', '402', '12501.00', '13000.00', '7000.00', '6960.00', '6940.00', '6920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4434', '402', '6001.00', '7000.00', '1680.00', '1640.00', '1620.00', '1600.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5102', '402', '12001.00', '12500.00', '6500.00', '6460.00', '6440.00', '6420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5101', '402', '11501.00', '12000.00', '6000.00', '5960.00', '5940.00', '5920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5100', '402', '11001.00', '11500.00', '5500.00', '5460.00', '5440.00', '5420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4470', '402', '7001.00', '8000.00', '1730.00', '1690.00', '1670.00', '1650.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4471', '402', '8001.00', '9000.00', '1780.00', '1740.00', '1720.00', '1700.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4472', '402', '9001.00', '10000.00', '1830.00', '1810.00', '1790.00', '1770.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7272', '450', '301.00', '500.00', '15.00', '12.00', '10.00', '1.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7271', '450', '101.00', '300.00', '15.00', '12.00', '10.00', '1.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7270', '450', '21.00', '100.00', '8.00', '8.00', '3.00', '1.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7277', '450', '0.00', '10.00', '2.50', '2.00', '1.50', '1.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7276', '450', '11.00', '20.00', '2.50', '2.00', '1.50', '1.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7275', '450', '21.00', '100.00', '8.00', '8.00', '3.00', '1.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7269', '450', '11.00', '20.00', '2.50', '2.00', '1.50', '1.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7268', '450', '0.00', '10.00', '2.50', '2.00', '1.50', '1.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7274', '450', '101.00', '300.00', '15.00', '12.00', '10.00', '1.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7273', '450', '301.00', '500.00', '15.00', '12.00', '10.00', '1.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4552', '439', '1001.00', '2000.00', '226.00', '159.00', '99.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4551', '439', '601.00', '1000.00', '188.00', '126.00', '88.00', '30.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4557', '439', '5.00', '50.00', '18.00', '12.00', '7.00', '3.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4556', '439', '51.00', '300.00', '45.00', '28.00', '20.00', '8.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4550', '439', '301.00', '600.00', '88.00', '56.00', '39.00', '12.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4549', '439', '51.00', '300.00', '45.00', '28.00', '20.00', '8.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4548', '439', '5.00', '50.00', '18.00', '12.00', '7.00', '3.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4555', '439', '301.00', '600.00', '88.00', '56.00', '39.00', '12.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4554', '439', '601.00', '1000.00', '188.00', '126.00', '88.00', '30.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4553', '439', '1001.00', '2000.00', '226.00', '159.00', '99.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4569', '449', '401.00', '1000.00', '400.00', '200.00', '100.00', '80.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4568', '449', '301.00', '400.00', '200.00', '150.00', '120.00', '80.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4567', '449', '201.00', '300.00', '150.00', '120.00', '80.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4566', '449', '101.00', '200.00', '100.00', '60.00', '40.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4565', '449', '51.00', '100.00', '50.00', '30.00', '20.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4564', '449', '0.00', '50.00', '20.00', '15.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4570', '449', '401.00', '1000.00', '400.00', '200.00', '100.00', '80.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4571', '449', '301.00', '400.00', '200.00', '150.00', '120.00', '80.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4572', '449', '201.00', '300.00', '150.00', '120.00', '80.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4573', '449', '101.00', '200.00', '100.00', '60.00', '40.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4574', '449', '51.00', '100.00', '50.00', '30.00', '20.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4575', '449', '0.00', '50.00', '20.00', '15.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4576', '501', '0.00', '15.00', '20.00', '15.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4577', '501', '16.00', '30.00', '25.00', '20.00', '18.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4578', '501', '31.00', '100.00', '45.00', '40.00', '35.00', '30.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4579', '501', '101.00', '300.00', '80.00', '65.00', '55.00', '50.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4580', '501', '301.00', '10000.00', '400.00', '350.00', '300.00', '300.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4581', '501', '0.00', '15.00', '20.00', '15.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4582', '501', '16.00', '30.00', '25.00', '20.00', '18.00', '10.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4583', '501', '31.00', '100.00', '45.00', '40.00', '35.00', '30.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4584', '501', '101.00', '300.00', '80.00', '65.00', '55.00', '50.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4585', '501', '301.00', '10000.00', '400.00', '350.00', '300.00', '300.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4705', '458', '50001.00', '500000.00', '10000.00', '8000.00', '5000.00', '3000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4704', '458', '10001.00', '50000.00', '5000.00', '4000.00', '3000.00', '1500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4703', '458', '5001.00', '10000.00', '2000.00', '1500.00', '1100.00', '600.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4713', '458', '0.00', '100.00', '60.00', '40.00', '25.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4712', '458', '101.00', '500.00', '150.00', '110.00', '80.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4711', '458', '501.00', '1000.00', '320.00', '240.00', '180.00', '100.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4702', '458', '2001.00', '5000.00', '1000.00', '600.00', '500.00', '300.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4701', '458', '1001.00', '2000.00', '500.00', '400.00', '300.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4700', '458', '501.00', '1000.00', '320.00', '240.00', '180.00', '100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4699', '458', '101.00', '500.00', '150.00', '110.00', '80.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4698', '458', '0.00', '100.00', '60.00', '40.00', '25.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('4710', '458', '1001.00', '2000.00', '500.00', '400.00', '300.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4709', '458', '2001.00', '5000.00', '1000.00', '600.00', '500.00', '300.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4708', '458', '5001.00', '10000.00', '2000.00', '1500.00', '1100.00', '600.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4707', '458', '10001.00', '50000.00', '5000.00', '4000.00', '3000.00', '1500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('4706', '458', '50001.00', '500000.00', '10000.00', '8000.00', '5000.00', '3000.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5099', '402', '10001.00', '11000.00', '5000.00', '4960.00', '4940.00', '4920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5098', '402', '9001.00', '10000.00', '4500.00', '4460.00', '4440.00', '4420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5097', '402', '8001.00', '9000.00', '4000.00', '3960.00', '3940.00', '3920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5096', '402', '7001.00', '8000.00', '3500.00', '3460.00', '3440.00', '3420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5095', '402', '6001.00', '7000.00', '3000.00', '2960.00', '2940.00', '2920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5094', '402', '5001.00', '6000.00', '2500.00', '2460.00', '2440.00', '2420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5093', '402', '4001.00', '5000.00', '2000.00', '1960.00', '1940.00', '1920.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5092', '402', '3001.00', '4000.00', '1500.00', '1460.00', '1440.00', '1420.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5091', '402', '2901.00', '3000.00', '1480.00', '1440.00', '1420.00', '1400.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5090', '402', '2801.00', '2900.00', '1430.00', '1390.00', '1370.00', '1350.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5089', '402', '2701.00', '2800.00', '1380.00', '1340.00', '1320.00', '1300.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5088', '402', '2601.00', '2700.00', '1330.00', '1290.00', '1270.00', '1250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5087', '402', '2501.00', '2600.00', '1280.00', '1240.00', '1220.00', '1200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5086', '402', '2401.00', '2500.00', '1230.00', '1190.00', '1170.00', '1150.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5085', '402', '2301.00', '2400.00', '1180.00', '1100.00', '1120.00', '1100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5084', '402', '2201.00', '2300.00', '1130.00', '1050.00', '1070.00', '1050.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5083', '402', '2101.00', '2200.00', '1080.00', '1000.00', '1020.00', '1000.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5082', '402', '2001.00', '2100.00', '1030.00', '950.00', '970.00', '950.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5081', '402', '1901.00', '2000.00', '980.00', '900.00', '920.00', '900.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5080', '402', '1801.00', '1900.00', '930.00', '850.00', '870.00', '850.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5079', '402', '1701.00', '1800.00', '880.00', '800.00', '820.00', '800.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5078', '402', '1601.00', '1700.00', '830.00', '750.00', '770.00', '750.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5077', '402', '1501.00', '1600.00', '780.00', '700.00', '720.00', '700.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5076', '402', '1401.00', '1500.00', '730.00', '650.00', '670.00', '650.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5075', '402', '1301.00', '1400.00', '680.00', '600.00', '620.00', '600.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5074', '402', '1201.00', '1300.00', '630.00', '550.00', '570.00', '550.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5073', '402', '1101.00', '1200.00', '580.00', '500.00', '520.00', '500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5072', '402', '1001.00', '1100.00', '530.00', '450.00', '470.00', '450.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5071', '402', '901.00', '1000.00', '480.00', '400.00', '420.00', '400.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5070', '402', '801.00', '900.00', '430.00', '350.00', '370.00', '350.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5069', '402', '701.00', '800.00', '380.00', '300.00', '320.00', '300.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5068', '402', '601.00', '700.00', '330.00', '200.00', '270.00', '250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5067', '402', '501.00', '600.00', '280.00', '210.00', '220.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5066', '402', '401.00', '500.00', '230.00', '170.00', '170.00', '150.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5065', '402', '301.00', '400.00', '180.00', '130.00', '100.00', '80.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5064', '402', '201.00', '300.00', '140.00', '100.00', '90.00', '80.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5063', '402', '101.00', '200.00', '60.00', '30.00', '20.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5062', '402', '51.00', '100.00', '45.00', '30.00', '20.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5061', '402', '11.00', '50.00', '40.00', '30.00', '20.00', '10.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5060', '402', '1.00', '10.00', '4.50', '4.50', '4.50', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5194', '552', '601.00', '1000.00', '500.00', '400.00', '300.00', '260.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5193', '552', '401.00', '600.00', '300.00', '260.00', '220.00', '200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5192', '552', '201.00', '400.00', '200.00', '160.00', '120.00', '120.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5191', '552', '101.00', '200.00', '100.00', '80.00', '70.00', '60.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5190', '552', '51.00', '100.00', '50.00', '40.00', '30.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5189', '552', '0.00', '50.00', '30.00', '20.00', '10.00', '5.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('5195', '552', '601.00', '1000.00', '500.00', '400.00', '300.00', '260.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5196', '552', '401.00', '600.00', '300.00', '260.00', '220.00', '200.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5197', '552', '201.00', '400.00', '200.00', '160.00', '120.00', '120.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5198', '552', '101.00', '200.00', '100.00', '80.00', '70.00', '60.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5199', '552', '51.00', '100.00', '50.00', '40.00', '30.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('5200', '552', '0.00', '50.00', '30.00', '20.00', '10.00', '5.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7944', '560', '40001.00', '50000.00', '77000.00', '31000.00', '26200.00', '17500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7974', '560', '0.00', '10.00', '29.00', '17.00', '13.00', '3.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7943', '560', '30001.00', '40000.00', '51000.00', '23000.00', '14600.00', '12500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7973', '560', '11.00', '20.00', '39.00', '20.00', '15.00', '13.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7942', '560', '20001.00', '30000.00', '35000.00', '15000.00', '9000.00', '7500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7972', '560', '21.00', '30.00', '55.00', '28.00', '21.00', '18.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7941', '560', '10001.00', '20000.00', '25500.00', '11500.00', '7300.00', '6250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7971', '560', '31.00', '40.00', '64.00', '32.00', '22.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7940', '560', '9001.00', '10000.00', '14700.00', '7100.00', '4820.00', '4250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7939', '560', '8001.00', '9000.00', '13100.00', '6300.00', '4260.00', '3750.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7970', '560', '41.00', '50.00', '80.00', '40.00', '28.00', '25.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7969', '560', '51.00', '80.00', '128.00', '64.00', '44.00', '40.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7938', '560', '7001.00', '8000.00', '11500.00', '5500.00', '3700.00', '3250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7968', '560', '81.00', '100.00', '160.00', '80.00', '56.00', '50.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7937', '560', '6001.00', '7000.00', '9900.00', '4700.00', '3140.00', '2750.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7967', '560', '101.00', '150.00', '240.00', '120.00', '84.00', '75.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7936', '560', '5001.00', '6000.00', '8300.00', '3900.00', '2580.00', '2250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7966', '560', '151.00', '200.00', '320.00', '160.00', '112.00', '100.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7935', '560', '4001.00', '5000.00', '6700.00', '3100.00', '2020.00', '1750.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7965', '560', '201.00', '300.00', '415.00', '195.00', '129.00', '112.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7934', '560', '3001.00', '4000.00', '5100.00', '2300.00', '1460.00', '1250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7964', '560', '301.00', '400.00', '510.00', '230.00', '146.00', '125.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7933', '560', '2001.00', '3000.00', '3500.00', '1500.00', '900.00', '750.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7963', '560', '401.00', '500.00', '670.00', '310.00', '202.00', '175.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7932', '560', '1001.00', '2000.00', '2550.00', '1150.00', '730.00', '625.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7962', '560', '501.00', '600.00', '830.00', '390.00', '258.00', '225.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7931', '560', '901.00', '1000.00', '1470.00', '710.00', '482.00', '425.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7961', '560', '601.00', '700.00', '990.00', '470.00', '314.00', '275.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7930', '560', '801.00', '900.00', '1310.00', '630.00', '426.00', '375.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7960', '560', '701.00', '800.00', '1150.00', '550.00', '370.00', '325.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7929', '560', '701.00', '800.00', '1150.00', '550.00', '370.00', '325.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7959', '560', '801.00', '900.00', '1310.00', '630.00', '426.00', '375.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7928', '560', '601.00', '700.00', '990.00', '470.00', '314.00', '275.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7958', '560', '901.00', '1000.00', '1470.00', '710.00', '482.00', '425.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7927', '560', '501.00', '600.00', '830.00', '390.00', '258.00', '225.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7957', '560', '1001.00', '2000.00', '2550.00', '1150.00', '730.00', '625.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7926', '560', '401.00', '500.00', '670.00', '310.00', '202.00', '175.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7956', '560', '2001.00', '3000.00', '3500.00', '1500.00', '900.00', '750.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7925', '560', '301.00', '400.00', '510.00', '230.00', '146.00', '125.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7955', '560', '3001.00', '4000.00', '5100.00', '2300.00', '1460.00', '1250.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7924', '560', '201.00', '300.00', '415.00', '195.00', '129.00', '112.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7954', '560', '4001.00', '5000.00', '6700.00', '3100.00', '2020.00', '1750.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7923', '560', '151.00', '200.00', '320.00', '160.00', '112.00', '100.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7953', '560', '5001.00', '6000.00', '8300.00', '3900.00', '2580.00', '2250.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7922', '560', '101.00', '150.00', '240.00', '120.00', '84.00', '75.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7952', '560', '6001.00', '7000.00', '9900.00', '4700.00', '3140.00', '2750.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7921', '560', '81.00', '100.00', '160.00', '80.00', '56.00', '50.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7951', '560', '7001.00', '8000.00', '11500.00', '5500.00', '3700.00', '3250.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7920', '560', '51.00', '80.00', '128.00', '64.00', '44.00', '40.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7950', '560', '8001.00', '9000.00', '13100.00', '6300.00', '4260.00', '3750.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7919', '560', '41.00', '50.00', '80.00', '40.00', '28.00', '25.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7949', '560', '9001.00', '10000.00', '14700.00', '7100.00', '4820.00', '4250.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7918', '560', '31.00', '40.00', '64.00', '32.00', '22.00', '20.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7948', '560', '10001.00', '20000.00', '25500.00', '11500.00', '7300.00', '6250.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7917', '560', '21.00', '30.00', '55.00', '28.00', '21.00', '18.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7947', '560', '20001.00', '30000.00', '35000.00', '15000.00', '9000.00', '7500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7916', '560', '11.00', '20.00', '39.00', '20.00', '15.00', '13.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7946', '560', '30001.00', '40000.00', '51000.00', '23000.00', '14600.00', '12500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7915', '560', '0.00', '10.00', '29.00', '17.00', '13.00', '3.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7945', '560', '40001.00', '50000.00', '77000.00', '31000.00', '26200.00', '17500.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7418', '546', '20001.00', '50000.00', '105000.00', '87500.00', '70000.00', '52500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7417', '546', '10001.00', '20000.00', '45000.00', '37500.00', '30000.00', '22500.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7416', '546', '5001.00', '10000.00', '22500.00', '18750.00', '15000.00', '11250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7415', '546', '2001.00', '5000.00', '10500.00', '8750.00', '7000.00', '5250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7414', '546', '1001.00', '2000.00', '4500.00', '3750.00', '3000.00', '2250.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7413', '546', '601.00', '1000.00', '2400.00', '2000.00', '1600.00', '1200.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7412', '546', '401.00', '600.00', '1500.00', '1250.00', '1000.00', '750.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7411', '546', '201.00', '400.00', '900.00', '750.00', '600.00', '450.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7410', '546', '101.00', '200.00', '450.00', '375.00', '300.00', '225.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7409', '546', '51.00', '100.00', '225.00', '188.00', '150.00', '112.50', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7408', '546', '0.00', '50.00', '75.00', '62.00', '50.00', '38.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7429', '546', '0.00', '50.00', '75.00', '62.00', '50.00', '38.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7428', '546', '51.00', '100.00', '225.00', '188.00', '150.00', '112.50', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7427', '546', '101.00', '200.00', '450.00', '375.00', '300.00', '225.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7426', '546', '201.00', '400.00', '900.00', '750.00', '600.00', '450.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7902', '639', '400.10', '600.00', '50.00', '40.00', '30.00', '20.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7901', '639', '600.10', '800.00', '80.00', '65.00', '45.00', '35.00', '0.00', '1');
INSERT INTO `web_home_price` VALUES ('7717', '706', '2001.00', '15000.00', '600.00', '350.00', '200.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7716', '706', '501.00', '2000.00', '250.00', '180.00', '100.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7715', '706', '301.00', '500.00', '110.00', '60.00', '40.00', '0.00', '0.00', '0');
INSERT INTO `web_home_price` VALUES ('7714', '706', '101.00', '300.00', '60.00', '30.00', '20.00', '0.00', '0.00', '0');

-- ----------------------------
-- Table structure for web_invite
-- ----------------------------
DROP TABLE IF EXISTS `web_invite`;
CREATE TABLE `web_invite` (
  `InviteID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `InviteMemberID` int(10) DEFAULT '0',
  `Invitehost` varchar(150) NOT NULL,
  `InviteCode` varchar(64) DEFAULT '' COMMENT '邀请码',
  `InviteName` varchar(64) DEFAULT '' COMMENT '推广者',
  `InviteState` tinyint(1) unsigned DEFAULT '0' COMMENT '登录状态0为禁用1为正常',
  `InviteTime` int(10) unsigned DEFAULT '0' COMMENT '留言时间',
  PRIMARY KEY (`InviteID`),
  KEY `InvoiceMemberID` (`InviteMemberID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='会员邀请码数据表';

-- ----------------------------
-- Records of web_invite
-- ----------------------------

-- ----------------------------
-- Table structure for web_invoice
-- ----------------------------
DROP TABLE IF EXISTS `web_invoice`;
CREATE TABLE `web_invoice` (
  `InvoiceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `InvoiceMemberID` int(10) unsigned DEFAULT '0',
  `InvoiceType` smallint(6) unsigned DEFAULT '0' COMMENT '13发票14收据',
  `InvoiceDetail` smallint(6) unsigned DEFAULT '0' COMMENT '发票明细15服务费16网络服务费17技术服务费',
  `InvoiceOtherContent` varchar(100) DEFAULT '' COMMENT '其他内容',
  `InvoiceMoney` decimal(10,2) DEFAULT '0.00' COMMENT '发票金额',
  `InvoiceTitle` varchar(100) DEFAULT '' COMMENT '抬头',
  `InvoiceCode` varchar(64) DEFAULT '' COMMENT '纳税人识别码',
  `InvoiceName` varchar(64) DEFAULT '' COMMENT '收货人姓名',
  `InvoiceMobile` varchar(20) DEFAULT '' COMMENT '收货人手机',
  `InvoiceAddress` varchar(100) DEFAULT '' COMMENT '收货人地址',
  `InvoiceContent` varchar(1000) DEFAULT '' COMMENT '补充说明',
  `InvoiceExpress` smallint(6) unsigned DEFAULT '0' COMMENT '快递名称',
  `InvoiceNumber` varchar(64) DEFAULT '' COMMENT '快递单号',
  `InvoiceState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态：0申请中1申请失败2已寄出',
  `InvoiceTime` int(10) unsigned DEFAULT '0' COMMENT '留言时间',
  PRIMARY KEY (`InvoiceID`),
  KEY `InvoiceMemberID` (`InvoiceMemberID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='会员发票数据表';

-- ----------------------------
-- Records of web_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for web_links
-- ----------------------------
DROP TABLE IF EXISTS `web_links`;
CREATE TABLE `web_links` (
  `NewsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NewsTypeID` smallint(5) unsigned DEFAULT '0' COMMENT '分类ID',
  `NewsTypePath` varchar(30) DEFAULT '' COMMENT '分类路径',
  `NewsTitle` varchar(100) DEFAULT '' COMMENT '标题',
  `NewsEngTitle` varchar(100) DEFAULT '' COMMENT '英文名称',
  `NewsPicPath` varchar(100) DEFAULT '' COMMENT '图片路径',
  `NewsContent` text COMMENT '账户积分小计',
  `NewsAbstract` text COMMENT '摘要',
  `NewsSort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  `NewsRecommendState` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐',
  `NewsState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `NewsTime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`NewsID`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='新闻资讯数据表';

-- ----------------------------
-- Records of web_links
-- ----------------------------
INSERT INTO `web_links` VALUES ('16', '0', '', '百度', '', '', 'http://www.baidu.com', null, '1', '0', '1', '1559202134');
INSERT INTO `web_links` VALUES ('19', '0', '', '法旅网', '', '', 'http://www.falv.com', null, '0', '0', '1', '1559210099');

-- ----------------------------
-- Table structure for web_media
-- ----------------------------
DROP TABLE IF EXISTS `web_media`;
CREATE TABLE `web_media` (
  `MediaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MediaMemberID` int(10) unsigned DEFAULT '0',
  `MediaWebNameID` smallint(6) unsigned DEFAULT '0' COMMENT '媒体平台选择//频道类型',
  `MediaIndustryID` smallint(6) unsigned DEFAULT '0' COMMENT '行业分类选择',
  `MediaCityID` smallint(6) unsigned DEFAULT '0' COMMENT '所在地区',
  `MediaInLevelID` smallint(6) unsigned DEFAULT '0' COMMENT '入口级别',
  `MediaUrlTypeID` smallint(6) unsigned DEFAULT '0' COMMENT '链接类型',
  `MediaSpeedID` smallint(6) unsigned DEFAULT '0' COMMENT '发稿速度',
  `MediaNewsSourceID` smallint(6) unsigned DEFAULT '0' COMMENT '新闻源',
  `MediaCanSendID` smallint(6) unsigned DEFAULT '0' COMMENT '周末可发',
  `MediaSpecialIndustryID` varchar(50) DEFAULT '0' COMMENT '特别行业',
  `MediaSituationID` smallint(6) unsigned DEFAULT '0' COMMENT '收录情况',
  `MediaComputerWeightID` smallint(6) unsigned DEFAULT '0' COMMENT '电脑权重',
  `MediaMobileWeightID` smallint(6) unsigned DEFAULT '0' COMMENT '移动权重',
  `MediaWebPrice` decimal(10,2) DEFAULT '0.00' COMMENT '平台价格',
  `MediaMemberPrice1` decimal(10,2) DEFAULT '0.00' COMMENT '铜牌会员价格',
  `MediaMemberPrice2` decimal(10,2) DEFAULT '0.00' COMMENT '银牌会员价格',
  `MediaMemberPrice3` decimal(10,2) DEFAULT '0.00' COMMENT '金牌会员价格',
  `MediaMemberPrice4` decimal(10,2) DEFAULT '0.00' COMMENT '钻石',
  `MediaMemberPrice5` decimal(10,2) DEFAULT '0.00' COMMENT '白金',
  `MediaTitle` varchar(100) DEFAULT '' COMMENT '媒体名称',
  `MediaInUrl` varchar(500) DEFAULT '' COMMENT '入口链接',
  `MediaCaseUrl` varchar(500) DEFAULT '' COMMENT '案例链接',
  `MediaContent` varchar(1000) DEFAULT '' COMMENT '备注说明',
  `MediaState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态：0已删除1已通过2待审核3未通过4已下架5已暂停',
  `MediaTime` int(10) unsigned DEFAULT '0' COMMENT '保存时间',
  `UserType` tinyint(2) unsigned DEFAULT '0' COMMENT '1平台上传2商家上传3媒介盒子4大咖',
  `MediaPlatformID` int(10) DEFAULT NULL COMMENT '其他平台ID',
  `MediaPlatformCGL` varchar(8) DEFAULT NULL COMMENT '出稿率',
  `Recommend` int(3) DEFAULT '0' COMMENT '推荐1',
  `MediaStatedec` varchar(100) DEFAULT NULL COMMENT '审核备注',
  `yearstate` int(2) DEFAULT '0' COMMENT '春节可发',
  `duibitime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '对比时间',
  PRIMARY KEY (`MediaID`),
  KEY `MediaMemberID` (`MediaMemberID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35340 DEFAULT CHARSET=utf8 COMMENT='媒体记录数据表';

-- ----------------------------
-- Records of web_media
-- ----------------------------
INSERT INTO `web_media` VALUES ('34994', '756', '28', '36', '2', '0', '65', '70', '75', '78', '0', '152', '89', '100', '20.00', '50.00', '26.00', '25.00', '22.00', '0.00', '上海新闻网1', '111111', '222222', '是大法官水电费', '1', '1605600128', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('34999', null, '30', null, '1', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '北京青年网', 'https://bjqnw.cs-xw.com', 'https://bjqnw.cs-xw.com/archives/10', '北京地区新闻媒体，权威性高', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35000', null, '30', null, '1', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '京华新闻网', 'https://jhxww.daily-cn.com', 'https://jhxww.daily-cn.com/archives/24', '北京地区新闻媒体，权威性高', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35001', null, '30', null, '1', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '北京广播网', 'https://bjgbw.nbobao.com', 'https://bjgbw.nbobao.com/archives/15', '北京地区新闻媒体，权威性高', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35002', null, '30', null, '1', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '北京快报', 'https://bjkb.peopleicn.com', 'https://bjkb.peopleicn.com/archives/18', '北京地区新闻媒体，权威性高', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35003', null, '30', null, '1', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '首都播报网', 'https://sdbbw.netxinhua.com', 'https://sdbbw.netxinhua.com/archives/21', '北京地区新闻媒体，权威性高', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35004', null, '30', null, '1', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '北京参考', 'https://bj.speeken.com', 'https://bj.speeken.com/archives/6', '北京地区新闻媒体，权威性高', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35005', null, '30', null, '1', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '北京新闻网', 'https://beijing2.shixian-2.com', 'https://beijing2.shixian-2.com/archives/30179', '北京地区新闻媒体，权威性高', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35006', null, '30', null, '3', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '北方新闻网', 'https://bfxww.cs-xw.com', 'https://bfxww.cs-xw.com/archives/10', '天津主流地方媒体', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35007', null, '30', null, '3', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '滨海新闻网', 'https://bhxww.daily-cn.com', 'https://bhxww.daily-cn.com/archives/15', '天津主流地方媒体', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35008', null, '30', null, '3', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '今日天津', 'https://jrtj.nbobao.com', 'https://jrtj.nbobao.com/archives/18', '天津主流地方媒体', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35009', null, '30', null, '3', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '天津焦点', 'https://tjjd.peopleicn.com', 'https://tjjd.peopleicn.com/archives/21', '天津主流地方媒体', '1', '1605665796', '2', null, null, '0', null, '0', '0');
INSERT INTO `web_media` VALUES ('35010', null, '30', null, '3', '0', '65', '67', '75', '78', '0', '152', '91', '102', '30.00', '60.00', '36.00', '35.00', '32.00', '0.00', '天津播报网', 'https://tjbbw.netxinhua.com', 'https://tjbbw.netxinhua.com/archives/24', '天津主流地方媒体', '1', '1605665796', '2', null, null, '0', null, '0', '0');

-- ----------------------------
-- Table structure for web_member
-- ----------------------------
DROP TABLE IF EXISTS `web_member`;
CREATE TABLE `web_member` (
  `MemberID` smallint(5) NOT NULL AUTO_INCREMENT,
  `type` int(3) DEFAULT '1' COMMENT '用户类型 1广告主 2 媒体主 3写手',
  `MemberTypeID` smallint(5) unsigned DEFAULT '0' COMMENT '会员类型ID',
  `drawcount` int(3) DEFAULT '0' COMMENT '抽奖次数',
  `MemberInviteCode` varchar(32) DEFAULT '' COMMENT '会员邀请码',
  `MemberRecommendID` varchar(10) DEFAULT '0' COMMENT '推荐人ID',
  `MemberRecommendPath` varchar(1000) DEFAULT '' COMMENT '推荐关系的路径',
  `RegDomain` varchar(64) DEFAULT '' COMMENT '注册域名平台域名为-1代理商域名为会员ID',
  `MemberCompanyName` varchar(100) DEFAULT '' COMMENT '公司名称',
  `MemberName` varchar(20) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '会员名称',
  `MemberPwd` char(32) DEFAULT '' COMMENT '密码',
  `MemberRandPwd` char(32) DEFAULT '' COMMENT '随机密码用来防止二次登录',
  `MemberPriceType` smallint(6) unsigned DEFAULT '0' COMMENT '会员价格类型',
  `MemberTrueName` varchar(30) DEFAULT '' COMMENT '真实姓名',
  `MemberMobile` varchar(20) DEFAULT '' COMMENT '联系电话',
  `MemberEmail` varchar(50) DEFAULT '' COMMENT '电子邮箱',
  `MemberBalanceCount` decimal(10,2) DEFAULT '0.00' COMMENT '会员账户余额',
  `MemberAgentBalanceCount` decimal(10,2) DEFAULT '0.00' COMMENT '代理商账户余额',
  `MemberProfit` decimal(10,2) DEFAULT '0.00' COMMENT '收稿账户',
  `MemberAddress` varchar(100) DEFAULT '' COMMENT '联系地址',
  `MemberQQ` varchar(20) DEFAULT '' COMMENT '在线QQ',
  `Membersex` int(2) DEFAULT '3' COMMENT '性别1女2男3未知',
  `MemberWeiXin` varchar(30) DEFAULT '' COMMENT '微信号',
  `MemberPicPath` varchar(255) DEFAULT '' COMMENT '头像路径',
  `MemberSort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  `MemberState` tinyint(1) unsigned DEFAULT '0' COMMENT '登录状态0为禁用1为正常',
  `MemberLastTime` int(10) unsigned DEFAULT '0' COMMENT '上一次登录时间',
  `MemberLoginTime` int(10) unsigned DEFAULT '0' COMMENT '本次登录时间',
  `MemberTime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `AgentIdentityFront` varchar(100) DEFAULT '' COMMENT '身份证正面',
  `AgentIdentityBack` varchar(100) DEFAULT '' COMMENT '身份证背面',
  `AgentIdentityCode` varchar(20) DEFAULT '' COMMENT '身份证号',
  `AgentApplyTime` int(10) unsigned DEFAULT '0' COMMENT '代理商申请时间',
  `AgentAuditState` tinyint(1) unsigned DEFAULT '1' COMMENT '代理商审核状态0失败1成功2审核中',
  `AgentAuditTime` int(10) unsigned DEFAULT '0' COMMENT '代理商审核时间',
  `GroupID` tinyint(1) unsigned DEFAULT '1' COMMENT '1会员2代理商',
  `Domain` varchar(64) DEFAULT '' COMMENT '代理商域名',
  `IsSite` tinyint(1) unsigned DEFAULT '0' COMMENT '是否开设站点',
  `oneDomain` varchar(255) DEFAULT NULL COMMENT '一级域名',
  `IP` varchar(32) DEFAULT NULL,
  `Openid` varchar(40) DEFAULT NULL COMMENT '小程序openid',
  `Tokenrand` varchar(50) DEFAULT NULL COMMENT 'wxtoken',
  `access_token` varchar(50) DEFAULT NULL,
  `token_time` int(11) DEFAULT NULL COMMENT 'token时间更新',
  `superacc` int(2) DEFAULT '0' COMMENT '是否资源用户 否 0  是1',
  PRIMARY KEY (`MemberID`),
  UNIQUE KEY `Openid` (`Openid`) USING BTREE,
  UNIQUE KEY `Tokenrand` (`Tokenrand`) USING BTREE,
  KEY `MemberName` (`MemberName`,`MemberPwd`) USING BTREE,
  KEY `MemberInviteCode` (`MemberInviteCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1798 DEFAULT CHARSET=utf8 COMMENT='会员记录数据表';

-- ----------------------------
-- Records of web_member
-- ----------------------------
INSERT INTO `web_member` VALUES ('756', '1', '1', '0', '', '0', '756', '-1', '', '13696884534', 'ec6e8bb11fdc5db25017dfd1f2a35655', '4eff9ccaa69edc473d36a149f8b9e8fe', '116', '狼', '13696884534', '', '1008.00', '0.00', '10.00', '', '123123', '3', '', '', '0', '1', '0', '1611305408', '1566956905', '', '', '', '0', '1', '0', '1', '', '0', null, '127.0.0.1', null, null, null, null, '0');

-- ----------------------------
-- Table structure for web_memberset
-- ----------------------------
DROP TABLE IF EXISTS `web_memberset`;
CREATE TABLE `web_memberset` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `MState` tinyint(1) unsigned DEFAULT '0' COMMENT '0关闭 1开启',
  `addTime` int(10) unsigned DEFAULT '0',
  `RState` tinyint(1) DEFAULT '0' COMMENT '0关闭 1开启',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员分类表';

-- ----------------------------
-- Records of web_memberset
-- ----------------------------
INSERT INTO `web_memberset` VALUES ('8', '809', '1', '1577171456', '1');
INSERT INTO `web_memberset` VALUES ('9', '812', '1', '1577871498', '1');
INSERT INTO `web_memberset` VALUES ('10', '796', '1', '1579249085', '1');
INSERT INTO `web_memberset` VALUES ('11', '1771', '0', '1585794319', '1');

-- ----------------------------
-- Table structure for web_membertype
-- ----------------------------
DROP TABLE IF EXISTS `web_membertype`;
CREATE TABLE `web_membertype` (
  `TypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `TypePID` smallint(6) unsigned DEFAULT '0',
  `TypePath` varchar(50) DEFAULT '' COMMENT '用来表示当前分类所属的层级完整路径如：1,2,3,4,',
  `TypeNode` tinyint(3) unsigned DEFAULT '0' COMMENT '用来表达当前分类所属的层级位置',
  `TypeName` varchar(30) DEFAULT '',
  `TypeSort` smallint(6) unsigned DEFAULT '0',
  `TypeState` tinyint(1) unsigned DEFAULT '0',
  `TypeTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`TypeID`),
  KEY `Column_PID` (`TypePID`) USING BTREE,
  KEY `Column_TypePath` (`TypePath`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员分类表';

-- ----------------------------
-- Records of web_membertype
-- ----------------------------
INSERT INTO `web_membertype` VALUES ('1', '0', '1,', '1', '注册会员', '0', '1', '1537893729');
INSERT INTO `web_membertype` VALUES ('2', '0', '2,', '1', '一级代理商', '2', '1', '1537893889');
INSERT INTO `web_membertype` VALUES ('3', '0', '3,', '1', '二级代理商', '1', '1', '1537893900');

-- ----------------------------
-- Table structure for web_message
-- ----------------------------
DROP TABLE IF EXISTS `web_message`;
CREATE TABLE `web_message` (
  `MessageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MessageMemberID` int(10) unsigned DEFAULT '0',
  `MessageContent` varchar(1000) DEFAULT '' COMMENT '留言内容',
  `MessageMobile` varchar(20) DEFAULT '',
  `MessageState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态：0不显示1显示',
  `MessageTime` int(10) unsigned DEFAULT '0' COMMENT '留言时间',
  `MessageReplyContent` varchar(500) DEFAULT NULL,
  `MessageReplyTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`MessageID`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='留言反馈数据表';

-- ----------------------------
-- Records of web_message
-- ----------------------------

-- ----------------------------
-- Table structure for web_mobilerand
-- ----------------------------
DROP TABLE IF EXISTS `web_mobilerand`;
CREATE TABLE `web_mobilerand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_rand` varchar(8) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_mobilerand
-- ----------------------------

-- ----------------------------
-- Table structure for web_msg
-- ----------------------------
DROP TABLE IF EXISTS `web_msg`;
CREATE TABLE `web_msg` (
  `msgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msgMemberID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgname` varchar(20) NOT NULL DEFAULT '' COMMENT 'msg名称',
  `msgpass` varchar(20) NOT NULL DEFAULT '',
  `msgSignature` varchar(20) NOT NULL DEFAULT '' COMMENT '签名',
  `msgState` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：0不显示1显示',
  `msgTime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`msgID`),
  KEY `AliPayMemberID` (`msgMemberID`,`msgname`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='支付宝账户数据表';

-- ----------------------------
-- Records of web_msg
-- ----------------------------
INSERT INTO `web_msg` VALUES ('1', '1790', '13645381263', '982709', '软文平台', '1', '1607393129');

-- ----------------------------
-- Table structure for web_news
-- ----------------------------
DROP TABLE IF EXISTS `web_news`;
CREATE TABLE `web_news` (
  `NewsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NewsTypeID` smallint(5) unsigned DEFAULT '0' COMMENT '分类ID',
  `NewsTypePath` varchar(30) DEFAULT '' COMMENT '分类路径',
  `NewsTitle` varchar(100) DEFAULT '' COMMENT '标题',
  `NewsEngTitle` varchar(100) DEFAULT '' COMMENT '英文名称',
  `NewsPicPath` varchar(100) DEFAULT '' COMMENT '图片路径',
  `NewsContent` text COMMENT '账户积分小计',
  `NewsAbstract` text COMMENT '摘要',
  `NewsSort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  `NewsRecommendState` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐',
  `NewsState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `NewsTime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`NewsID`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='新闻资讯数据表';

-- ----------------------------
-- Records of web_news
-- ----------------------------
INSERT INTO `web_news` VALUES ('31', '0', '', '小红书怎么找人推广？快传播挖掘小红书推广秘籍！', '', '20181219/6113b724b12576e0293d89fc6773df1c.jpg', '<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">小红书精准推广引流该怎么做?</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">我们以小红书官方的数据来算,美妆和运动来说,这个类目下的用户数最多,这就代表美妆在小红书上面是一个超精准的类目,而且年龄都是非常年轻化,都是在20岁到40岁左右,这正好符合我们的消费能力。今天我们主要讲这几个逻辑,分为:注册帐号、养号、发布笔记、如何做好小红书推广引流排名。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">一、注册小红书帐号</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">首先我来说下在小红书吧,小红书是对广告的监控非常抵触的,所以账号刚注册以后,不建议发广告,第一步要完善你的个人资料,把自己包装成一个完整的人,有亮点的人,注册的时候要选择4个感兴趣的内容,那么你可以根据你的产品和行业领域去进行选择。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">二、如何在小红书上进行养号</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">大家注意下,之前我提到过小红薯,小红薯是在小红书上起到了一个亮点和核心指标。</p><p><img src=\"http://p1.pstatp.com/large/pgc-image/RCAnIcA56rZdk9\" alt=\"小红书怎么找人推广？快传播挖掘小红书推广秘籍！\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在任何的平台上对于刚注册的小号都是观察期,没有权重的帐号,想立马开始做小红书推广内容的发布是万万不可的，这个毫无疑问了,这也是人家平台防止大量垃圾营销帐号存在的机制,所以新号注册后,不要着急发布内容,先互动,先养号,先升级做任务哈,多去看,多去刷内容。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">过了这个观察期后,就可以发布内容了,每天坚持1到2次的发文频率,总会有用户看到你的产品和内容,如果有用户需求那就一定要引导评论转私信,凡是市面上教小红书推广引流的都是转私信再引导到微信的方法。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而在小红书上笔记内容最好一定要原创去写,无论是视频还是图片还是文字,通过自己发布的笔记内容给自己打造一个个性标签,也是通过这个方法输出优质的小红书推广内容让别人对你印象加深。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">三、写笔记精选方法</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">我们在小红书平台上要具备生产优质内容的能力,这样才能获取更精准的自然流量,可以将自己真实的一些经验心得写成200-600字的内容,内容中要搭配图片,配上自己真实使用的图片,植入感情和经历,分享使用过程,这样优质的小红书推广内容才可以得到系统的大力推荐,别带有侥幸心理,你会侥幸,系统就能整死你,让你根本无热门机会。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如果你没有写作能力,没关系,那么你就做伪原创,伪原创并不是代表直接搬运哈,例如我们可以去美柚,美丽说,蘑菇街这些时尚的女性圈子平台上搜集一些产品文章,然后拼凑到你的小红书推广笔记里,将别人的话用相关词语讲一遍,不要直接抄,要做修改。</p><p><img src=\"http://p9.pstatp.com/large/pgc-image/RCa4J7J838L3ei\" alt=\"小红书怎么找人推广？快传播挖掘小红书推广秘籍！\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在自媒体平台上伪原创是非常多的,所以只要不直接搬运那就没事,如果你要搬运那就完了,不光得不到推荐,还更没流量,降低你的帐号质量度。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">四、小红书上热门技巧</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">小红书热门引流有一个大禁忌就是,人家平台为了保证平台的用户体验,你分享的笔记时是不允许在上面直接留下你的联系方式哈,这里也在提醒一下,资料里如果被检测到了,直接禁言3、7、甚至30天,到时候别哭了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">小红书-以社区为基础的新兴跨境电商平台</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在今年后就鲜有宣传出街。多数品牌做小红书推广纷纷想抢占流量,快传播通过大量小红书推广案例分析,得到的品牌曝光转化效果远比其它平台好,可能这也是品牌为什么想做好小红书推广了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">那么对于商家来说,如果自己来做小红书营销推广,速度相对较慢,所以今天给大家列举了4项小红书产品投放的方法,大致分为明星、优质达人、铺量达人、素人这么些档次来投放,下面就一起来看看具体投放的操作方法吧。</p><p><img src=\"http://p3.pstatp.com/large/pgc-image/RCAnIbl87fstdz\" alt=\"小红书怎么找人推广？快传播挖掘小红书推广秘籍！\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">小红书推广之(一)：明星投放</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">明星的力量确实是不容小觑的,范冰冰和林允在小红书推广产品销量可谓是一路飙升,范冰冰同款断货也是常有的事儿。从环境营造角度来看,小红书的确在客观上存在着吸引明星的地方。这个平台一直致力于打造社区,建立一个生活方式分享平台。而其他大量无关的负面情绪或者是内容则可以得到有效“折叠”。随着长期的内容折叠,形成了一种独特的文化基因,而这也正是“范冰冰们”看重的地方。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">明星在这里不用是“高大全”的。他们无需表明政治观点,也没有许多上纲上线的用户前来要求你“关心家国天下”,晒个包包不会有人摸过来骂你炫富,简而言之,这是一个没什么“杠精”的世界。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">演员林允的“口碑逆转”便是上佳案例。这个小红书上最爱记录画妆和卸妆的女星从去年4月入驻小红书,在2017年底成功改变了“在微博被负面传闻包围”的局面,转型成为了“美妆博主”,如今小红书粉丝数已经超过了670万。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">小红书推广之(二)：优质达人</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">优质达人,就是kol,粉丝数、颜值、穿搭、化妆上都具有前卫美感。经常有话题说小红书上的女生为什么看起来都这么有钱?小红书上的女生生活怎么都这么美好?小红书上的女生也太幸福了吧!</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">确实,这些优质达人都在晒优质生活,晒奢侈品,秀恩爱,秀颜值。这些达人的文章质量也是蛮高的,毕竟写了这么多文,idea也很多。</p><p><img src=\"http://p99.pstatp.com/large/pgc-image/RCAnIbwAKK7tHh\" alt=\"小红书怎么找人推广？快传播挖掘小红书推广秘籍！\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">小红书推广之(三)：铺量达人</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">铺量达人,也是C级达人,也可以说营销号,没什么人格背景的,粉丝数从几千到两三万。这群达人主要以宝妈、三四线城市妇女、小部分学生党组成。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">她们的价值,就是为优质达人做烘托,也为一个品牌的文章做量,毕竟一个优质达人的价格就是5个铺量达人。在他们之中也会出现好文章,出现小爆文也是常有的事。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">小红书推广之(四)：素人投放</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">素人,就是真实存在的一个普通账号。可以说是水军、也可以说是买家秀。这么多达人去推一款产品,一看就是广告,这时候就需要一些真实性的东西为品牌做支撑,最好的办法就是投放素人。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">出现的效果就是,你看!不只是达人,很多普通人用了也说好呢!素人除了增加真实性,还可以抢占关键词,毕竟素人投放的量可以很多,因为价格低。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">以上就是小红书推广中四种投放方式,商家可以根据产品的特性和宣传预算来选择最为匹配的方式。快传播一直致力于整合多方资源,拥有可靠的新媒体推广传播能力,已为上百个国内外知名品牌带来有效的传播和销量增长。在小红书推广、抖音推广、短视频推广、微博推广、微信推广等提供多样化投放策略,帮助广告主快速准确匹配到合适的推广资源,解决品牌与人群的搭配,实现找准市场、拓展市场目的。</p><p><br/></p>', '小红书越来越受商家们的青睐,也愁不知道小红书怎么找人推广,选择优质的小红书红人+Kol大号才能发挥小红书推广的效果。快传播将挖掘小红书推广秘籍,向商家们分享如何做好小红书推广!\r\n\r\n要想把小红书推广做好,首先我们要理解小红书平台特点。小红书平台是社交式跨境购物平台,运用自媒体推荐机制+电商运营模式。很多人说小红书是微博和电商的综合体。我的观点是小红书结合了微博的社交模式,运用媒体推荐机制,根据互联网分享时代特点,加上新零售运营思维,通过电商完成封闭式社区生态链。', '0', '0', '1', '1545187480');
INSERT INTO `web_news` VALUES ('60', '0', '', '软文有哪些重要性', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;软文有哪些重要性呢?下面我们我们一起看一下:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;(1)可以降低企业的广告本钱</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;往往通常的网络广告的本钱是相当高的,譬如百度竞价尽管对照精准,可是同行点击占据一部分广告费用,加大广告费用的损失,硬性广告通常而言取得较好的流量,可是针对的用户群体不可以精准,而且广告的费用很高。一篇或许一系列的软文的价值远远比竞价或许说硬性广告的费用低得多,而且一篇好的软文他人会无尝协助转载,放大软文的散播界线,一篇好的软文会制造很多话题来引导他人商议和对他人发生共鸣,让用户积极采纳企业的信息。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;(2)可以辅助seo</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;假如把软文发布到新闻源或许是权重对照高的网站上面,如此会有契机在上面留下链接来指向目的网站,如此不妨升高网址的曝光率又不妨升高高品质外链的数目,而且不妨引导权重的转达。假如在文章中正确的嵌入关联的主要词,不妨增添被他人搜到的契机。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190605/1559729974595820.jpg\" title=\"1559729974595820.jpg\" alt=\"u=473246178,3901678955&amp;fm=26&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;(3)可以升高和打造产物、品牌著名度</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;企业品牌,需求运用软文升高著名度,是需求细心打造一篇好软文的强力打造,好的软文可以让读者不知不觉发生好的印象,让宽广读者信任产物的著名度,著名度有了,产物品牌功效也就体现走出了。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;(4)升高网站流量</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;一篇优质的好软文,不妨为网站带来的流量是惊人的,而且软文所带来的流量的转化率往往都是对照高的,不妨委婉升高网站产物的出售量。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;上述就是软文有哪些重要性,希望对你有所帮助。</p><p><br/></p>', '', '0', '0', '1', '1559729978');
INSERT INTO `web_news` VALUES ('61', '0', '', '软文营销写作有哪几点技巧', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;软文营销写作有哪几点技巧,我来带大家看一下:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;一、题目学习题目党</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;题目党,曾在网络中红极一时,曾为很多网站获得了流量,带来了收益。这就注脚题目党是由其发展空间的,之所以之后覆灭了,是因为跟着搜寻的不停改善,用户体验逐步被人们所看重,而题目党正是背叛了用户体验,有个好的起始(题目),却没有一个好的结果(内容)。让人有一种上圈套被骗的觉得。也即是说题目党是靠着题目成功的,但其失败却和题目没有任何关系,而是因为内容跟不上。由此可见软文的题目是多么的重要呀!写软文要仔细的商榷、商榷三思,把软文题目写的活跃、乖巧、悬疑、浮夸、不可思议,总之一句话,要迷惑人,让人看了忘不了,让人看了有推测,有疑问,有看下去的想法。假如题目能抵达如此的功效,那就为软文的成功奠基了一个优良的基本,加上一篇好的内容,就可以更好的迷惑人。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190605/1559730119288080.jpg\" title=\"1559730119288080.jpg\" alt=\"timg.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;二、内容模拟小刊小报</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;写作中寻求日常的生存素材。对于这一点,小刊小报做的很好。原本并不是他的文风多么的精彩,主若是他们总有很多迷惑人的小故事,生存怪事,伦理失常的事情迷惑着人们去看、去骂、去爱、去评论,多半是他们杜撰的,根据人们的爱好杜撰的。这一点站长们要好好学习,写软文的时辰也应当根据自身的目的人群杜撰一些观众喜好的器材,让自身的观众去骂、去恨、去爱、去评论,真若是把观众的情感调整起来了,那么,你的软文就成功了一半。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;三、软硬适中,方能功效显赫</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;人们都很痛恨广告这两个字,无论你做得多么好,只要让人么发现是广告,所有都等于零。但也不能太软,假如软的没了转播的迹象,读者真的拿他当做一篇优美的范文去赏识,那你的技艺也就徒劳了,这就要求咱们写出的软文软硬适中,既不能让读者一眼就看透是广告,又要让读者可以记下你要转播推行的信息,起到推行作用。详细的做法有两步。首先应当是把推行的内容放在后边,让读者发现是广告时,依然把内容看完了,同时由于前面的内容着实精彩可用,因此不会发生抵触情绪,可是依然记下了你的推行信息,岂不是兼顾其美。其次是广告信息的嵌入,要奇妙化、天然化,可以和内容完全的融入,抵达美满的融合。最忌生拉硬扯,胡乱相关,让读者抵触。一篇软文假如能按上面的三点写走出,不用你文华飞扬,肯定能起到很好的转播推行作用,使你的软文功效倍增。</p><p><br/></p>', '题目党,曾在网络中红极一时,曾为很多网站获得了流量,带来了收益。这就注脚题目党是由其发展空间的,之所以之后覆灭了,是因为跟着搜寻的不停改善,用户体验逐步被人们所看重,而题目党正是背叛了用户体验,有个好的起始(题目),却没有一个好的结果(内容)。让人有一种上圈套被骗的觉得。也即是说题目党是靠着题目成功的,但其失败却和题目没有任何关系,而是因为内容跟不上。由此可见软文的题目是多么的重要呀!写软文要仔细的商榷、商榷三思,把软文题目写的活跃、乖巧、悬疑、浮夸、不可思议,总之一句话,要迷惑人,让人看了忘不了,让人看了有推测,有疑问,有看下去的想法。假如题目能抵达如此的功效,那就为软文的成功奠基了一个优良的基本,加上一篇好的内容,就可以更好的迷惑人。', '0', '0', '1', '1559730133');
INSERT INTO `web_news` VALUES ('62', '0', '', '新闻源的特点有哪些', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;新闻源是指符合搜寻引擎新闻收录准则,站内信息被搜寻引擎优先收录,且被网络媒体转载成为网络新闻的源流媒体。新闻源拥有网络新闻的“种子源”、收录快、转载广和肯定公信力与威望性等特点。那么新闻源的特点有哪些呢?我们一起了解一下:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;搜狗、360等新闻源都有自身新闻源收录准则,2017年3月21日,百度公告称对时效性内容识别技艺升级,原独立新闻源数据库的模式已不再合适运用,撤销新闻源数据库。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;网络新闻的“种子源”——中华网络新闻的源流,新闻源拥有媒体影响力,提供原创有价值的新闻内容。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190605/1559730255944685.jpg\" title=\"1559730255944685.jpg\" alt=\"u=2503726562,4200561256&amp;fm=11&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;收录快——新闻源偏好的网站,资讯信息优先被搜寻引擎收录。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;转载广——无数新闻源正途、正当,中华网络媒体转载源流,转载界线广。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;公信力和威望性——新闻源收录法则使被收录的新闻具备肯定的公信力与威望性。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;今天文章就介绍到这,希望对你有帮助。</p><p><br/></p>', '新闻源是指符合搜寻引擎新闻收录准则,站内信息被搜寻引擎优先收录,且被网络媒体转载成为网络新闻的源流媒体。新闻源拥有网络新闻的“种子源”、收录快、转载广和肯定公信力与威望性等特点。', '0', '0', '1', '1559730284');
INSERT INTO `web_news` VALUES ('63', '0', '', '新媒体营销有哪几点好处', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;新媒体作为新世纪以来科技发展的产物,改变了以往大众单向传播的方式,将信息的发布权、传播权等拓展至每一位用户,社会消费方式与消费需求随之改变,企业传统的市场营销模式受到冲击,已无法满足现代消费者的个性需求,难以形成有效的吸引力和竞争力。那么新媒体营销有哪几点好处呢?下面我们简单的了解一下:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;精准营销,降低企业的宣传成本</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;在企业的产品推广中,以前传统的媒介推广基本上都是采用电视推广,报纸推广,这些价格对于现在的新媒体推广来说都特别的昂贵。您认为做一件相同的事:一个花10块钱一个花1块钱,而且说不定花1块钱的效果会更好。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;促进宣传,提升企业的品牌知名度</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190617/1560755835757395.jpg\" title=\"1560755835757395.jpg\" alt=\"u=124454785,2232642418&amp;fm=26&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;随着智能手机的普及,网络已经深入到人们日常生活的每一个角落,新媒体营销将所有有利于品牌宣传和推广的方式整合到一起,可以更全面的帮助企业宣传和推广,对提升品牌知名度,促进品牌的口碑传播有着重要作用。以前我们买东西可能去商场去超市,现在我们可能更多的是选择淘宝天猫京东,对比价格选择下单。而且企业的官方网站只能针对电脑用户,而对于手机用户却无法将自己的页面全面展示出来。微信用户多在手机端使用微信,这样,消费者通过企业的微信公共号就能得知企业相关信息,方便且不受限制。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;加强与客户的互动,增强粘性</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;大量社交网络平台的兴起,不仅为企业和消费者搭建了一个合作交流平台,而且还转变了品牌与客户之间单向被动的信息发出与接受模式,加强了双方间的互动。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;以上就是新媒体营销的好处,希望对你有所帮助。</p><p><br/></p>', '新媒体作为新世纪以来科技发展的产物,改变了以往大众单向传播的方式,将信息的发布权、传播权等拓展至每一位用户,社会消费方式与消费需求随之改变,企业传统的市场营销模式受到冲击,已无法满足现代消费者的个性需求,难以形成有效的吸引力和竞争力。', '0', '0', '1', '1560755852');
INSERT INTO `web_news` VALUES ('64', '0', '', '新媒体营销有哪几点优势', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;说起新媒体营销,相信大多数企业都有所感触,新媒体已经逐步演变成为了每个企业不可或缺的一部分了。随着互联网技术的高速发展,越来越多的新媒体平台出现在大众的眼里,有新媒体平台在的地方就有流量,有流量的地方就有用户,有用户的地方,品牌就需要做新媒体营销。那么新媒体营销有哪几点优势呢?我总结出了以下几点:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;1、覆盖面广,跨地域性强。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;2、网络推广的内容,高质量的,保留时间长。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;3、信息传播速度快,具有扩展性、信息透明化。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;4、具有针对性,全面性,受众关注度高,交互性沟通性强。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190617/1560756071623437.jpg\" title=\"1560756071623437.jpg\" alt=\"u=1306474899,1659757398&amp;fm=26&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;5、投资少,效益高,时效高。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;6、多维营销,互联网营销可以把各种东西结合在一起之后再进行营销宣传</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;7、提升品牌形象、促进产品知名度提升、提高产品整体销量、解决线下销售瓶颈、完善网络运营体系。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;8、网络宣传的可重复性和可检索性。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;上述就是新媒体营销的优势,欢迎大家前来咨询。</p><p><br/></p>', '说起新媒体营销,相信大多数企业都有所感触,新媒体已经逐步演变成为了每个企业不可或缺的一部分了。随着互联网技术的高速发展,越来越多的新媒体平台出现在大众的眼里,有新媒体平台在的地方就有流量,有流量的地方就有用户,有用户的地方,品牌就需要做新媒体营销。', '0', '0', '1', '1560756089');
INSERT INTO `web_news` VALUES ('65', '0', '', '发布软文有哪几点小技巧', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;通常软文发布之后,软文是否被百度收录、有无上最新相关、软文的点击量是多少,这些都是验证软文营销是否有效的直接标准。实际上,软文营销有无效果都是以软文的收录为前提,软文有收录才有机会上最新相关,继而企业相关信息才能辐射更多的受众、获得最大的效果展现与品牌信息曝光。那么发布软文有哪几点小技巧呢?我总结出了一下几点:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;发布软文时,稿件的质量直接决定收录情况</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;不知道你们有没有发现,伪原创的文章如今已经越来越难被收录了,相反纯原创的文章、观点犀利的文章,就像坐了火箭一样,一发布被能火速被百度收录。事实上,这就是百度对原创文章的一种保护手段。众所周知的是,百度历来对原创软文是非常“偏爱”的,因此,企业在编写软文时,应尽量减少伪原创的痕迹,好是能够纯原创、有观点的。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190617/1560756269296448.jpg\" title=\"1560756269296448.jpg\" alt=\"u=2291891078,4066686330&amp;fm=26&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;发布软文时,优先选择权威性媒体</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;不少用户在发布稿件时,总是优先挑选价格贵的媒体,可能潜意识里觉得价格越贵越好。其实,软文收录的效果与媒体的价格并不存在必然联系,要想软文快速被收录,在挑选媒体时务必要根据行业类别、软文性质来挑选,其中以权威媒体优先。软文在权威媒体上发布之后,大媒体自身的权威性会让用户对展现的品牌产生信赖感。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;根据媒体的具体情况,了解当前媒体的具体出稿时间</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;有不少企业的软文发布的负责人在发布稿件后,会立马去百度上搜索,或者隔两三分钟就去搜索。其实,这种做法是不可取的,在稿件发布过程中,需要有审核的过程,一般情况下会有初审和复审两个环节,这是需要时间的,建议大家在发布稿件之后,稍微等待一会,或者向服务商询问的具体出稿时间。其实有些媒体平台收录慢,隔夜收录也是很正常的。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;上述就是发布软文的小技巧,感谢阅读本篇文章。</p><p><br/></p>', '通常软文发布之后,软文是否被百度收录、有无上最新相关、软文的点击量是多少,这些都是验证软文营销是否有效的直接标准。实际上,软文营销有无效果都是以软文的收录为前提,软文有收录才有机会上最新相关,继而企业相关信息才能辐射更多的受众、获得最大的效果展现与品牌信息曝光。', '0', '0', '1', '1560756288');
INSERT INTO `web_news` VALUES ('69', '0', '', '软文发布的没有效果要注意哪几个方面', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;软文发布的没有效果要注意哪几个方面呢?下面我们简单的了解一下:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;1、首先,要关注的即是根据咱们自身产物的特性选择发布平台,选择与产物行业关联的网络平台。重点研究目的客户在哪处,再融合软文风格和内容,在估算界线内选择相对应的平面媒体、网络媒体或许其余无尝平台。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;2、要关注网络平台在搜寻引擎中的权重,一些权重较高、有新闻源的网站往往是发布软文的第一选择。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190701/1561961443982949.jpg\" title=\"1561961443982949.jpg\" alt=\"timg.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;3、滴水穿石,没有任何事情是能一步登天的。软文推行要做的即是进行持续性的软文发布,要关注发布软文的时光间隙和界线,不能发布了一次或许几次就算作依然完毕功了软文营销了,应当选择一个合适的平台维持营销的连续性,防止出现一曝十寒的状况。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;4、跟着软文营销的普及,这几年软文发布平台也越来越多。同时,也出现了不少行业的“老鼠屎”,转播职员在寻觅发稿平台时肯定要谨慎,要检验平台的关联资质和网站备案信息,从各方面研究,选择一个价位和功效都能采纳的,防止踩坑。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;上述就是软文发布的没有效果需要注意的几点,希望对你有所帮助。</p><p><br/></p>', '1、首先,要关注的即是根据咱们自身产物的特性选择发布平台,选择与产物行业关联的网络平台。重点研究目的客户在哪处,再融合软文风格和内容,在估算界线内选择相对应的平面媒体、网络媒体或许其余无尝平台。', '0', '0', '1', '1561961457');
INSERT INTO `web_news` VALUES ('70', '0', '', '软文发布的渠道有哪些', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;软文发布的渠道有哪些呢?我总结出了以下几点:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;1、平面媒体,重点指国度新闻出版总署批准的占有发行刊号的报纸,期刊和占有国际期刊的、有肯定影响力的媒体也算在内。平面媒体上的软文通常威望性都对照高,读者更简易佩服。但这些媒介上的软文需求各个媒体的审核,所以软文营销选择这些媒体,撰写方面要下足技艺,一定提前研讨所投放媒体的选题偏好、媒体风格、媒体的读者群及费用估算。除此以外,尚有一个最重要的问题即是出版周期与发行日期,这些直接影响到软文营销中发布平台的整合。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;2、网络论坛,重点指全国和地方门户网站,如贴吧、网易有道、百姓网论坛、海角社区等。论坛的收录功效是对照梦想的,因为论坛占有收录速度对照快的特点,通常发布的内容品质对照好的话,基本上很快就可以够被收录。需关注的是发在论坛中的软文不能太像广告,不然会随时面临被删贴的危险。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190701/1561961566868536.jpg\" title=\"1561961566868536.jpg\" alt=\"u=424461140,3579888729&amp;fm=15&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;3、问答平台,重点有百度晓得、知乎、搜狗问答、百度文库等等。通常而言,百度晓得和知乎如此的平台权重都是对照高的。这个软文平台假如做好的话,不妨直接带来用户的点击和成交的。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;4、网络媒体平台,重点分为全国门户、地方门户和行业门户等。网络软文践诺中,主若是为了引流和展示搜寻的功效,其次是处理品牌的笃信度问题,假如可以将网络媒体营销与百度竞价相融合,运作得当的话不妨带来事半功倍的功效。可是,通常状况下大站审稿都对照严格,像新浪、网易、百姓网等媒体,发布软文时是不能带链接的,且有敏感词限制。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;5、自媒体平台,重点有微信公众号、百家号、搜狐、今天头条、一点资讯、凤凰新闻客户端等等。从互联网时代发展的趋向来看,自媒体平台依然成为获得流量一定看重的重要渠道。关于品牌花费者而言,企业自媒体是经过企业的资质申请下来的,笃信度较高;而且自媒体用户群体巨大,活跃度高,经过平台软文的推送更简易把企业的业务推送到潜在客户手中,抵达潜移默化的转播作用。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;以上就是软文发布的渠道,希望对你有所帮助。</p><p><br/></p>', '平面媒体,重点指国度新闻出版总署批准的占有发行刊号的报纸,期刊和占有国际期刊的、有肯定影响力的媒体也算在内。平面媒体上的软文通常威望性都对照高,读者更简易佩服。但这些媒介上的软文需求各个媒体的审核,所以软文营销选择这些媒体,撰写方面要下足技艺,一定提前研讨所投放媒体的选题偏好、媒体风格、媒体的读者群及费用估算。除此以外,尚有一个最重要的问题即是出版周期与发行日期,这些直接影响到软文营销中发布平台的整合。', '0', '0', '1', '1561961578');
INSERT INTO `web_news` VALUES ('67', '0', '', '软文发布要注意哪些事项', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;软文推广相对于 硬性广告 而言,由 企业 的市场策划人员或广告公司的文案人员来负责撰写的“ 文字广告 ”。与硬广告相比,软文之所以叫做 软文 \r\n,精妙之处就在于“软”字,好似绵里藏针,收而不露,克敌于无形。这是百度百科对于软文的解释,而在现实语境中软文是网络营销的一种方式。那么软文发布要注意哪些事项呢?</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;1.软文发布:内容的布局</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;一篇好的软文,内容是非常重要的。文字及链接均不得含负面、违法、政治敏感内容!在选择软文发布之前,我们需要根据企业的产品或服务,设计特定的软文内容,可以从以下几点入手:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;A.根据时下热点事件,设计故事</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;借势营销是我们软文中一个常用的策略,可以根据产品和服务的特点,结合热点,创建一个比较有创意又新鲜好玩的内容来吸引人。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;B.利用SEO优化内容,加快网页收录。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;在软文的标题和内容中,嵌入我们需要推广的长尾关键词,在结合搜索营销的关键词排名,在自然搜索结果中占取一定的流量,方便用户更好的找到我们。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;C.设计不同版本,多内部测试</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;一个成熟的软文发布案例,正式推广之前,先内部测试看下,针对内容架构的反馈,选出数据相对比较好的版本再进行调整。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190617/1560756487831855.jpg\" title=\"1560756487831855.jpg\" alt=\"u=2825477168,1140343077&amp;fm=26&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;2.软文发布的注意事项:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;A.文章标题:不宜超过20个汉字;可嵌入关键词;文章只能有1个主标题,别写副标题!</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;B.选择合适的平台</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;依据可信度、相关性、权威性,在高质量平台发布文章。文章不要太广告,了解特定平台的用户偏好,有策略的修改内容,尽量“软”一些,增强可读性。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;C.提交搜索引擎</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;以上就是软文发布需要注意的事项,欢迎大家前来咨询。</p><p><br/></p>', '软文推广相对于 硬性广告 而言,由 企业 的市场策划人员或广告公司的文案人员来负责撰写的“ 文字广告 ”。与硬广告相比,软文之所以叫做 软文 ,精妙之处就在于“软”字,好似绵里藏针,收而不露,克敌于无形。这是百度百科对于软文的解释,而在现实语境中软文是网络营销的一种方式。', '0', '0', '1', '1560756504');
INSERT INTO `web_news` VALUES ('68', '0', '', '为什么媒体发稿的市场比较好', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;网络媒体发稿就是讲广告以隐蔽的方式插入新闻稿中,相较于直白的硬广,这种方式更容易被用户接受,容易进行二次传播,传播成本低。那么为什么媒体发稿的市场比较好呢?我们简单的来看一下:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;一,向口碑产型产品进化。软文营销不可能在短期内引到巨大的流量,只能是“涓涓细流”,所以,要依靠软文营销来打造爆款,实现率较低,但通过软文的不断积累,继而可让企业品牌获得越多的沉淀。所以,软文营销应该为更多口碑型的产品和服务所选用。例如,家电产品就比快消类产品,更适合选用软文营销。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190617/1560756654620064.jpg\" title=\"1560756654620064.jpg\" alt=\"u=3179968639,1226890359&amp;fm=26&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;二,向低成本营销进化。软文营销具有成本递增的劣势,因为更新、更好的内容创造是递减的,所以,软文营销需要采用大数据、智能等技术,乃至设备,降低软文营销的成本。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;三,向协作工作进化。软文营销是完全可以与“文案营销”“内容营销”等配合使用的,他们之间不冲突、不矛盾,只要这些营销手段协作和配合工作,不仅软文营销的难度会降低,软文营销的效果反而也会更好。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;以上就是媒体发稿的市场比较好的原因,希望对你有所帮助。</p><p><br/></p>', '网络媒体发稿就是讲广告以隐蔽的方式插入新闻稿中,相较于直白的硬广,这种方式更容易被用户接受,容易进行二次传播,传播成本低。', '0', '0', '1', '1560756665');
INSERT INTO `web_news` VALUES ('71', '0', '', '新闻源软文的作用有哪些', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;新闻源软文的作用有哪些呢?跟我来看一下吧:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;1.新闻源收录不妨辅助百度竞价,关于某些单价高的竞价词语,不妨经过新闻源软文发布,在特按时段让主要词在搜寻引擎关联网页出现。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;2.新闻源收录不妨辅助替代网站主要词排名,某些主要词在排名未抵达梦想的优化位置,不妨经过新闻源软文发布,使某些主要词出现在搜寻引擎首页的关联网页中。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190701/1561961710228224.jpg\" title=\"1561961710228224.jpg\" alt=\"u=3256833186,4149422771&amp;fm=15&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;3 新闻收录的软文外链,软文外链是一个很好的外链,锚文本的外链最好,非常链的外链也很好,网址的外链也不错。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;4.长尾主要词的新闻优化,通常而言一个网站不可能优化全部的行业主要词,而要有用推行自身的网站,咱们通常在第三方的论坛或许博客或许分类信息网站发布信息,而后天天反复的发布信息,却不 \r\n能 让长尾主要词的信息出现在首页,而经过在高权重的网站发布新闻软文,不妨让带长尾主要词的软文出现在首页。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;以上就是新闻源软文的作用,欢迎大家致电咨询。</p><p><br/></p>', '1.新闻源收录不妨辅助百度竞价,关于某些单价高的竞价词语,不妨经过新闻源软文发布,在特按时段让主要词在搜寻引擎关联网页出现。', '0', '0', '1', '1561961721');
INSERT INTO `web_news` VALUES ('72', '0', '', '新闻源指什么东西', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;新闻源指什么东西呢?下面简单的给大家分析一下:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;新闻源是指符合百度、google等搜寻引擎种子新闻站的准则,站内信息第一时光被搜寻引擎优先收录,且被网络媒体转载成为网络海量新闻的源流媒体。新闻源在网络界限内身份举足轻重,拥有公信力与威望性,也是辐射散播至中华媒体网络的原点。 \r\n发布新闻源通常需求肯定的费用,咱们是发不了的,价值根据新闻源平台的威望性而定,有高有低。几十到上百不等。</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190701/1561961825988253.jpg\" title=\"1561961825988253.jpg\" alt=\"u=3901105537,2937901554&amp;fm=26&amp;gp=0.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;百度搜寻引擎是全球最大的中文搜寻引擎,也是中国网民运用频率最高的搜寻引擎,所以称为百度搜寻的新闻源,其重要性就一目了然了,不仅可以直接提醒企业的著名度和形象,也能委婉为SEO优化提供相当大的协助。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;以上就是新闻的概念,感谢你阅读本篇文章。</p><p><br/></p>', '新闻源是指符合百度、google等搜寻引擎种子新闻站的准则,站内信息第一时光被搜寻引擎优先收录,且被网络媒体转载成为网络海量新闻的源流媒体。新闻源在网络界限内身份举足轻重,拥有公信力与威望性,也是辐射散播至中华媒体网络的原点。 发布新闻源通常需求肯定的费用,咱们是发不了的,价值根据新闻源平台的威望性而定,有高有低。几十到上百不等。', '0', '0', '1', '1561961837');
INSERT INTO `web_news` VALUES ('73', '0', '', '媒体发稿需要注意哪些事项', '', '', '<p style=\"text-indent: 2em; text-align: left;\">&nbsp;媒体发稿需要注意哪些事项呢?下面简单的给大家分析一下:</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;1.媒体发稿的频率</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;媒体发稿的频率问题,是大无数企业都研究不了解的问题,我到底该投放多少篇新闻稿。就我的经验来看,新闻稿不用独特多,主要要有品质,一篇好稿子超过十篇垃圾稿。通常而言,在日常推行傍边,维持一周一篇新闻稿的投放量就不妨,碰到新品推行、促销推行、市场运动等事情可增添1-3篇,不用独特多。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;2.媒体发稿的数目</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://www.meijiehome.com//uploads/image/20190701/1561961998698708.jpg\" title=\"1561961998698708.jpg\" alt=\"下载.jpg\"/></p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;媒体发稿到多少媒体合适?也是企业品牌推行经理疑惑较多的问题,见其余企业有的投10家,有的投100家,甚而更多,为何有这么大的差别呢?根据这么多年客户在酷推客软文发布平台发布的经验来看,原本,媒体发稿的频率和数目,都是看企业的推行需求,品牌日常公关,一周一篇新闻稿,一篇新闻稿投放10-30家网站都不妨,媒体投放的越多,肯定媒体可见度就越高,估算充沛不妨多投放些媒体,10家以上都是不妨的,也有客户问投放5家行不行,原理上肯定是不妨的,可是谋划一篇稿件耗费的心力和财力也很多,我提议10家媒体以上,如此新闻媒体的稿件创意才不妨得到充分发扬。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;3.媒体发稿的时光</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;媒体发稿的时光点也是一个值得思考的问题,有的行业人士以为新闻稿发布的时光点都差不多,原本是有肯定的手艺可循的。例如,周五下午更新的文章,会在页面上逗留到下周一;早上10点以前发布的文章被媒体记者采编的可能性对照大;做频首或许首页举荐的文章最幸亏上午举荐上去,因为很多网站都是天天更新,假如是下午快下班的时辰举荐上去,明天一上班就撤下来的话,实在是不太划算啊!关于媒体发稿的时光点,根据行业和目的人群的差异也有差别。</p><p style=\"text-indent: 2em; text-align: left;\">&nbsp;上述就是媒体发稿需要注意的事项,感谢大家阅读本篇文章。</p><p><br/></p>', '媒体发稿的频率问题,是大无数企业都研究不了解的问题,我到底该投放多少篇新闻稿。就我的经验来看,新闻稿不用独特多,主要要有品质,一篇好稿子超过十篇垃圾稿。通常而言,在日常推行傍边,维持一周一篇新闻稿的投放量就不妨,碰到新品推行、促销推行、市场运动等事情可增添1-3篇,不用独特多。', '0', '0', '1', '1561962009');
INSERT INTO `web_news` VALUES ('74', '0', '', '互联网新闻信息', '', '', '<h1 style=\"text-indent: 2em; text-align: left;\">互联网新闻信息源单位名单</h1><h2 style=\"text-indent: 2em; text-align: left;\">1.中央级媒体 部委网站 刊物</h2><table width=\"903\"><thead><tr class=\"firstRow\"><th style=\"border-color: rgb(221, 221, 221);\" width=\"49\">类别</th><th style=\"border-color: rgb(221, 221, 221);\" width=\"853\">媒体\\网站\\刊物</th></tr></thead><tbody><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"49\">中央级新闻网站</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"853\">人民网 新华网 中国网 央视网 国际在线 中国日报网 中国青年网 中国经济网 中国新闻网 光明网 央广网 中国台湾网 中国西藏网 中工网\r\n 党建网 中青在线 环球网 中国军网 法制网 海外网 中国搜索 参考消息网 中国警察网 消费日报网 中国侨网 未来网 中国发展网 正义网 \r\n中国消费网 中国安全生产网 中国煤炭网 中国海洋在线 求是网 中国共产党历史网 中华人民共和国国史网 中国社会科学网 理论网 马克思主义研究网 \r\n理论中国网 人民论坛网</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"49\">中央级新闻单位</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"853\">人民日报 人民日报海外版 新华社 新华每日电讯 瞭望 中国新闻社 中国新闻周刊 解放军报 求是 光明日报 经济日报 中央人民广播电台 \r\n中央电视台 中国国际广播电台 中国日报 北京周报 半月谈 经济参考报 中国证券报 环球时报 科技日报 工人日报 中国青年报 中国妇女报 农民日报\r\n 法制日报 人民政协报 人民中国 人民画报 今日中国 健康报 中国劳动保障报 中国教育报 中国工商报 中国电力报 中国民航报 人民铁道报 \r\n人民邮电报 中国交通报 中国医药报 中国质量报 中国税务报 中国体育报 中国财经报 检察日报 人民法院报 中国建设报 中国环境报 中国文化报 \r\n人民公安报 中国水利报 中华工商时报 中国纪检监察报 中国审计报 金融时报 国际商报 中国商报 中国经济周刊 中华儿女 中国青年 中国妇女 \r\n瞭望东方周刊 《网络传播》杂志 《党建》杂志 中国经济时报 《紫光阁》杂志 中国组织人事报 中国气象报 中国绿色时报 中国经济导报 中国消费者报\r\n 中国安全生产报 中国煤炭报 当代世界 中国海洋报 环球人物 《人民论坛》杂志 中国报道杂志 三联生活周刊</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"49\">部委网站</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"853\">外交部网站 卫生计生委网站 商务部网站 财政部网站 国家发改委网站 中国网信网 中国文明网 中国记协网 中国政府网 中央纪委监察部网站 国务院发展研究中心网站 紫光阁网 国家宗教事务局网站 教育部网站 中国气象网</td></tr></tbody></table><h2 style=\"text-indent: 2em; text-align: left;\">2.省级新闻单位</h2><table width=\"903\"><thead><tr class=\"firstRow\"><th style=\"border-color: rgb(221, 221, 221);\" width=\"53\">地方</th><th style=\"border-color: rgb(221, 221, 221);\" width=\"220\">网络</th><th style=\"border-color: rgb(221, 221, 221);\" width=\"233\">报刊</th><th style=\"border-color: rgb(221, 221, 221);\" width=\"396\">广电</th></tr></thead><tbody><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">北京</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">千龙新闻网 财新网 宣讲家网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">北京日报 北京晚报 北京晨报 京华时报 新京报 北京青年报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">北京人民广播电台 北京电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">天津</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">北方网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">天津日报 今晚报 滨海时报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">天津人民广播电台 天津电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">河北</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">长城网 河北新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">河北日报 石家庄日报 燕赵晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">河北人民广播电台 河北电视台 石家庄人民广播电台 石家庄电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">山西</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">黄河新闻网 山西新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">山西日报 太原日报 山西晚报 太原晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">山西人民广播电台 山西电视台 太原人民广播电台 太原电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">内蒙古</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">内蒙古新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">内蒙古日报 呼和浩特市日报 呼和浩特晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">内蒙古人民广播电台 内蒙古电视台 呼和浩特市人民广播电台 呼和浩特市电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">辽宁</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">东北新闻网 北国网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">辽宁日报 沈阳晚报 大连日报 沈阳日报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">辽宁人民广播电台 辽宁电视台 大连人民广播电台 大连电视台 沈阳人民广播电台 沈阳电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">吉林</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">中国吉林网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">吉林日报 长春晚报 长春日报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">吉林人民广播电台 吉林电视台 长春人民广播电台 长春电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">黑龙江</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">东北网 哈尔滨新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">黑龙江日报 哈尔滨日报 黑龙江晨报 生活报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">黑龙江人民广播电台 黑龙江电视台 哈尔滨人民广播电台 哈尔滨电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">上海</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">东方网 新民网 一财网 解放网 看看新闻网 澎湃新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">解放日报 文汇报 新民晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">上海人民广播电台 上海电视台 东方电视台 东方广播电台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">江苏</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">中国江苏网 新华报业网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">新华日报 南京日报 扬子晚报 金陵晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">江苏省广播电视总台 南京人民广播电台 南京电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">浙江</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">浙江在线 中国宁波网 杭州网 新蓝网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">浙江日报 钱江晚报 杭州日报 宁波日报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">浙江人民广播电台 浙江电视台 杭州人民广播电台 杭州电视台 宁波人民广播电台 宁波电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">安徽</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">中国安徽在线</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">安徽日报 合肥日报 合肥晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">安徽人民广播电台 安徽电视台 合肥人民广播电台 合肥电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">福建</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">东南新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">福建日报 福州日报 福州晚报 厦门日报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">福建人民广播电台 福建电视台 福州人民广播电台 福州电视台 厦门人民广播电台 厦门电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">江西</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">中国江西网 大江网 今视网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">江西日报 南昌日报 南昌晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">江西人民广播电台 江西电视台 南昌人民广播电台 南昌电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">山东</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">大众网 齐鲁网 胶东在线 鲁网 中国山东网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">大众日报 齐鲁晚报 济南日报 青岛日报 山东商报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">山东人民广播电台 山东电视台 济南人民广播电台 济南电视台 青岛人民广播电台 青岛电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">河南</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">大河网 映象网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">河南日报 郑州日报 郑州晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">河南人民广播电台 河南电视台 郑州人民广播电台 郑州电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">湖北</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">荆楚网 长江网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">湖北日报 武汉晚报 长江日报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">湖北人民广播电台 湖北电视台 武汉人民广播电台 武汉电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">湖南</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">红网 华声在线 金鹰网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">湖南日报 长沙晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">湖南人民广播电台 湖南电视台 长沙人民广播电台 长沙电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">广东</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">南方新闻网 大洋网 深圳新闻网 金羊网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">南方日报 广州日报 羊城晚报 深圳特区报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">广东人民广播电台 广东电视台 南方电视台 广州人民广播电台 广州电视台 深圳人民广播电台 深圳电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">广西</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">广西新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">广西日报 南宁日报 南宁晚报 南方科技报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">广西人民广播电台 广西电视台 南宁人民广播电台 南宁电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">海南</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">南海网(海南新闻网)</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">海南日报 海口晚报 海南特区报 国际旅游岛商报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">海南广播电视台 海口广播电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">重庆</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">华龙网 视界网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">重庆日报 重庆晚报 重庆晨报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">重庆人民广播电台 重庆电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">四川</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">四川新闻网 四川在线 成都全搜索新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">四川日报 成都日报 成都晚报 华西都市报 成都商报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">四川人民广播电台 四川电视台 成都人民广播电台 成都电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">贵州</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">多彩贵州网(金黔在线) 当代先锋网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">贵州日报 贵阳日报 贵阳晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">贵州人民广播电台 贵州电视台 贵阳人民广播电台 贵阳电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">云南</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">云南网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">云南日报 昆明日报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">云南人民广播电台 云南电视台 昆明人民广播电台 昆明电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">西藏</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">中国西藏新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">西藏日报 拉萨晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">西藏人民广播电台 西藏电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">陕西</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">西部网 陕西传媒网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">陕西日报 西安日报 西安晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">陕西人民广播电台 陕西电视台 西安人民广播电台 西安电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">甘肃</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">中国甘肃网 每日甘肃网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">甘肃日报 兰州日报 兰州晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">甘肃广播电影电视总台 兰州人民广播电台 兰州电视</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">青海</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">青海新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">青海日报 西宁晚报 西海都市报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">青海人民广播电台 青海电视台 西宁人民广播电台 西宁电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">宁夏</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">宁夏新闻网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">宁夏日报 银川晚报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">宁夏广播电视总台 银川人民广播电台 银川电视台</td></tr><tr><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"53\">新疆</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"220\">天山网</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"233\">新疆日报 乌鲁木齐晚报 兵团日报</td><td style=\"border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221);\" width=\"396\">新疆人民广播电台 新疆电视台 乌鲁木齐人民广播电台 乌鲁木齐电视台 兵团广播电视台</td></tr></tbody></table><p><br/></p>', '', '0', '0', '1', '1567047709');
INSERT INTO `web_news` VALUES ('75', '0', '', '企业和品牌商为什么要做软文营销推广其作用是什么？', '', '', '&nbsp;&nbsp;&nbsp;&nbsp;对各大品牌商和中小企业来说,却是为企业宣传软文营销推广的黄金周。如果企业或品牌商不想在黄金周过得很惨,就应该懂得如何提前在国庆黄金周做好节日营销宣传的准备。毕竟国庆节对于广大企业和品牌商来说,不只是单纯的节日,而是一个可以再次加工、营销推广的热点。<p style=\"margin: 11px 0px; line-height: 200%; text-indent: 2em; text-align: left;\">因此媒介联为您整理了更多实惠优质品牌营销资源,希望对各大品牌商有用。</p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><strong><span style=\"line-height: 200%;\">首先介绍下媒介联盟是做什么的?</span></strong></p><p style=\"text-indent: 2em; line-height: 200%; text-align: left;\"><span style=\"line-height: 200%;\">我们是一家聚合网络媒体平台。集写手与媒体资源于一体的互联网媒体网站及媒体人互动合作交流的网络平台,为企事业提供新闻营销、业务、报道以及形象推广宣传服务,整合网络媒体资源,为用户提供一站式服务。</span></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><strong><span style=\"line-height: 200%;\">平台涵盖行业范围(</span></strong><span style=\"line-height: 200%;\">IT</span><span style=\"line-height: 200%;\">科技</span><span style=\"line-height: 200%;\">生活消费</span><span style=\"line-height: 200%;\">女性时尚</span><span style=\"line-height: 200%;\">娱乐休闲</span><span style=\"line-height: 200%;\">游戏网站</span><span style=\"line-height: 200%;\">汽车网站</span><span style=\"line-height: 200%;\">教育培训</span><span style=\"line-height: 200%;\">酒店旅游</span><span style=\"line-height: 200%;\">健康医疗</span><span style=\"line-height: 200%;\">房产家居</span><span style=\"line-height: 200%;\">财经商业</span><span style=\"line-height: 200%;\">新闻资讯</span><span style=\"line-height: 200%;\">文化艺术</span><span style=\"line-height: 200%;\">体育运动</span><span style=\"line-height: 200%;\">食品餐饮</span><span style=\"line-height: 200%;\">工业贸易</span><span style=\"line-height: 200%;\">亲子母婴<strong>)</strong>等。</span></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><strong><span style=\"line-height: 200%;\">媒介联盟服务对象和服务?</span></strong></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><span style=\"line-height: 200%;\">企事业单位,创业团队,明星,艺人等提供网络营销、品牌宣传、营销、业务、报道以及形象推广宣传。</span></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><strong><span style=\"line-height: 200%;\">媒介联盟服务目标</span></strong><span style=\"line-height: 200%;\">:整合更多的网络媒体资源实现线上互动推广宣传,</span><span style=\"line-height: 200%;\">运用媒介联盟的强大网络媒体平台,为企事业单位提供网络营销、宣传报道、业务及形象推广综合服务,帮助企事业单位整合更多新闻媒体资源推广宣传服务。</span></p><p style=\"text-align: left; line-height: 200%; text-indent: 2em;\"><strong><span style=\"line-height: 200%;\">什么叫软文营销推广?</span></strong></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\">软文营销是指利用媒体报道为企业、品牌等做宣传推广的一种营销方式。软文推广模式非常有利于引导市场消费,在较短时间内快速提升产品的知名度,塑造品牌的美誉度和公信力。软文推广成为很多企业打造品牌,扩 大品牌影响力,提高品牌公信力的重要手段之一。</p><p style=\"text-align: left; line-height: 200%; text-indent: 2em;\"><strong><span style=\"line-height: 200%;\">企业和品牌商为什么要做软文营销推广?</span></strong></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\">1、互联网已成为消费者了解完整品牌新的的主要通道</p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\">2、互联网已成为品牌传播的台风口</p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\">3、消费者依赖搜索引擎辅助决策,提升消费决策的精准度</p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\">4、网络媒体的特性让企业快速提升品牌曝光度,知名度,信赖度,促进销售。</p><p style=\"text-align: left; line-height: 200%; text-indent: 2em;\"><strong><span style=\"line-height: 200%;\">软文营销推广有什么用?</span></strong></p><p style=\"margin-left: 24px; line-height: 200%; text-indent: 2em; text-align: left;\">1、让您企业的产品、活动、新闻信息分秒之间高效传播出去,24小时立竿见影</p><p style=\"margin-left: 24px; line-height: 200%; text-indent: 2em; text-align: left;\">2、百度、360、搜狗搜索第一页立即找到大量的企业正面新闻与产品活动信息</p><p style=\"margin-left: 24px; line-height: 200%; text-indent: 2em; text-align: left;\">3、新浪、腾讯、网易、搜狐等的各大媒体争相报道,提升品牌知名度,增强客户信任感</p><p style=\"margin-left: 24px; line-height: 200%; text-indent: 2em; text-align: left;\">4、各大门户媒体、行业网站报道轻松获得高质量,高权威外链快速提升网站SEO效果</p><p style=\"margin-left: 24px; line-height: 200%; text-indent: 2em; text-align: left;\">5、企业危机公关:快速、精准、高效、有效地传播正面信息,击破压制污蔑谣言,化解企业危机</p><p style=\"margin-left: 24px; line-height: 200%; text-indent: 2em; text-align: left;\">6、低成本大曝光:但相对于传统媒体新闻软文营销推广非常低廉且有效</p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><strong>如果想更进一步里了解平台操作流程</strong></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><strong><span style=\"line-height: 200%;\">会员注册</span></strong></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><span style=\"line-height: 200%;\">自由选择媒体发稿</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">提交稿件并生成订单</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">发稿完成等待媒体方审核</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">审核通过即完成发稿</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">媒体方返回发布地址</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">会员查看稿件效果<strong>(如:稿件在某网上的链接地址)</strong></span></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><strong><span style=\"line-height: 200%;\">代理入驻</span></strong></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><span style=\"line-height: 200%;\">代理入驻</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">拥有代理站点</span><span style=\"line-height: 200%;\">-<strong>---&gt;</strong></span><span style=\"line-height: 200%;\">绑定一级域名</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">拥有独立管理后台</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">会员管理</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">订单管理</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">站点</span><span style=\"line-height: 200%;\">LOGO</span><span style=\"line-height: 200%;\">设置</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">Banner</span><span style=\"line-height: 200%;\">设置</span></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"></p><p style=\"text-align: center;\"><span style=\"line-height: 200%;\"><br/></span></p><p></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><strong><span style=\"line-height: 200%;\">独立运营:</span></strong></p><p style=\"line-height: 200%; text-indent: 2em; text-align: left;\"><span style=\"line-height: 200%;\">独立运营平台</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">提供技术支持</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">资源共享</span><strong><span style=\"line-height: 200%;\">----&gt;</span></strong><span style=\"line-height: 200%;\">免费系统升级</span></p><p><br/></p>', '对各大品牌商和中小企业来说,却是为企业宣传软文营销推广的黄金周。如果企业或品牌商不想在黄金周过得很惨,就应该懂得如何提前在国庆黄金周做好节日营销宣传的准备。', '0', '0', '1', '1570507097');

-- ----------------------------
-- Table structure for web_newsdynamics
-- ----------------------------
DROP TABLE IF EXISTS `web_newsdynamics`;
CREATE TABLE `web_newsdynamics` (
  `NewsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NewsTypeID` smallint(5) unsigned DEFAULT '0' COMMENT '分类ID',
  `NewsTypePath` varchar(30) DEFAULT '' COMMENT '分类路径',
  `NewsTitle` varchar(100) DEFAULT '' COMMENT '标题',
  `NewsEngTitle` varchar(100) DEFAULT '' COMMENT '英文名称',
  `NewsPicPath` varchar(100) DEFAULT '' COMMENT '图片路径',
  `NewsContent` text COMMENT '账户积分小计',
  `NewsAbstract` text COMMENT '摘要',
  `NewsSort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  `NewsRecommendState` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐',
  `NewsState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `NewsTime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`NewsID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='新闻资讯数据表';

-- ----------------------------
-- Records of web_newsdynamics
-- ----------------------------
INSERT INTO `web_newsdynamics` VALUES ('11', '1', '1,', '北方新闻网可带网址', '', '', null, '北方新闻网可带网址出稿迅速，补量首选', '0', '1', '1', '1568959833');
INSERT INTO `web_newsdynamics` VALUES ('12', '2', '2,', '聚焦商业财经', '', '', null, '聚焦商业财经周末可发，晚上可发，出稿快', '0', '1', '1', '1568960036');
INSERT INTO `web_newsdynamics` VALUES ('13', '2', '2,', '迈丽资讯', '', '', null, '迈丽资讯 权重高，收录好，秒发', '0', '0', '1', '1568960080');
INSERT INTO `web_newsdynamics` VALUES ('14', '1', '1,', '北京财经网', '', '', null, '北京财经网包收录，非百度新闻源,秒出，不限行业，可带网址', '0', '0', '1', '1568960191');
INSERT INTO `web_newsdynamics` VALUES ('15', '1', '1,', '热门推荐健康养生网', '', '', null, '平台新增健康养生网首页入口，广告位', '0', '1', '1', '1572400683');

-- ----------------------------
-- Table structure for web_newsdynamicstype
-- ----------------------------
DROP TABLE IF EXISTS `web_newsdynamicstype`;
CREATE TABLE `web_newsdynamicstype` (
  `TypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `TypePID` smallint(6) unsigned DEFAULT '0',
  `TypePath` varchar(50) DEFAULT '' COMMENT '用来表示当前分类所属的层级完整路径如：1,2,3,4,',
  `TypeNode` tinyint(3) unsigned DEFAULT '0' COMMENT '用来表达当前分类所属的层级位置',
  `TypeName` varchar(30) DEFAULT '',
  `TypeSort` smallint(6) unsigned DEFAULT '0',
  `TypeState` tinyint(1) unsigned DEFAULT '0',
  `TypeTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`TypeID`),
  KEY `Column_PID` (`TypePID`) USING BTREE,
  KEY `Column_TypePath` (`TypePath`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='帮助中心分类表';

-- ----------------------------
-- Records of web_newsdynamicstype
-- ----------------------------
INSERT INTO `web_newsdynamicstype` VALUES ('1', '0', '1,', '1', '媒体公告', '0', '1', '1542536909');
INSERT INTO `web_newsdynamicstype` VALUES ('2', '0', '2,', '1', '自媒体公告', '0', '1', '1542536918');

-- ----------------------------
-- Table structure for web_notice
-- ----------------------------
DROP TABLE IF EXISTS `web_notice`;
CREATE TABLE `web_notice` (
  `NewsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NewsTypeID` smallint(5) unsigned DEFAULT '0' COMMENT '分类ID',
  `NewsTypePath` varchar(30) DEFAULT '' COMMENT '分类路径',
  `NewsTitle` varchar(100) DEFAULT '' COMMENT '标题',
  `NewsEngTitle` varchar(100) DEFAULT '' COMMENT '英文名称',
  `NewsPicPath` varchar(100) DEFAULT '' COMMENT '图片路径',
  `NewsContent` text COMMENT '账户积分小计',
  `NewsAbstract` text COMMENT '摘要',
  `NewsSort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  `NewsRecommendState` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐',
  `NewsState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `NewsTime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`NewsID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='新闻资讯数据表';

-- ----------------------------
-- Records of web_notice
-- ----------------------------
INSERT INTO `web_notice` VALUES ('11', '0', '', '互联网新闻信息源单位名单--白名单媒体列表', '', '', '<table width=\"890\"><thead style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\" class=\"firstRow\"><th style=\"box-sizing: border-box; padding: 6px 13px; border-top-color: rgb(221, 221, 221);\">类别</th><th style=\"box-sizing: border-box; padding: 6px 13px; border-top-color: rgb(221, 221, 221);\">媒体\\网站\\刊物</th></tr></thead><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">中央级新闻网站</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">人民网 新华网 中国网 央视网 国际在线 中国日报网 中国青年网 中国经济网 中国新闻网 光明网 央广网 中国台湾网 中国西藏网 中工网 党建网 中青在线 环球网 中国军网 法制网 海外网 中国搜索 参考消息网 中国警察网 消费日报网 中国侨网 未来网 中国发展网 正义网 中国消费网 中国安全生产网 中国煤炭网 中国海洋在线 求是网 中国共产党历史网 中华人民共和国国史网 中国社会科学网 理论网 马克思主义研究网 理论中国网 人民论坛网</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">中央级新闻单位</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">人民日报 人民日报海外版 新华社 新华每日电讯 瞭望 中国新闻社 中国新闻周刊 解放军报 求是 光明日报 经济日报 中央人民广播电台 中央电视台 中国国际广播电台 中国日报 北京周报 半月谈 经济参考报 中国证券报 环球时报 科技日报 工人日报 中国青年报 中国妇女报 农民日报 法制日报 人民政协报 人民中国 人民画报 今日中国 健康报 中国劳动保障报 中国教育报 中国工商报 中国电力报 中国民航报 人民铁道报 人民邮电报 中国交通报 中国医药报 中国质量报 中国税务报 中国体育报 中国财经报 检察日报 人民法院报 中国建设报 中国环境报 中国文化报 人民公安报 中国水利报 中华工商时报 中国纪检监察报 中国审计报 金融时报 国际商报 中国商报 中国经济周刊 中华儿女 中国青年 中国妇女 瞭望东方周刊 《网络传播》杂志 《党建》杂志 中国经济时报 《紫光阁》杂志 中国组织人事报 中国气象报 中国绿色时报 中国经济导报 中国消费者报 中国安全生产报 中国煤炭报 当代世界 中国海洋报 环球人物 《人民论坛》杂志 中国报道杂志 三联生活周刊</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">部委网站</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">外交部网站 卫生计生委网站 商务部网站 财政部网站 国家发改委网站 中国网信网 中国文明网 中国记协网 中国政府网 中央纪委监察部网站 国务院发展研究中心网站 紫光阁网 国家宗教事务局网站 教育部网站 中国气象网</td></tr></tbody></table><h2 style=\"box-sizing: border-box; margin-top: 15px; margin-bottom: 15px; line-height: 1.225; font-size: 1.75em; padding-bottom: 0.3em; border-bottom: 1px solid rgb(238, 238, 238); color: rgb(51, 51, 51); font-family: \"Helvetica Neue\", Helvetica, \"Segoe UI\", Arial, freesans, sans-serif; white-space: normal;\">2.省级新闻单位<a class=\"headerlink\" href=\"https://www.meijiehezi.com/white_list.html#2\" title=\"Permanent link\" style=\"box-sizing: border-box; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(51, 51, 51); text-decoration-line: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; font-size: 16px; line-height: normal; font-family: fontawesome-mini; vertical-align: middle; margin-left: -16px; float: left; display: inline-block; opacity: 0; margin-top: 0.6rem;\"></a></h2><table width=\"890\"><thead style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\" class=\"firstRow\"><th style=\"box-sizing: border-box; padding: 6px 13px; border-top-color: rgb(221, 221, 221);\">地方</th><th style=\"box-sizing: border-box; padding: 6px 13px; border-top-color: rgb(221, 221, 221);\">网络</th><th style=\"box-sizing: border-box; padding: 6px 13px; border-top-color: rgb(221, 221, 221);\">报刊</th><th style=\"box-sizing: border-box; padding: 6px 13px; border-top-color: rgb(221, 221, 221);\">广电</th></tr></thead><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">北京</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">千龙新闻网 财新网 宣讲家网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">北京日报 北京晚报 北京晨报 京华时报 新京报 北京青年报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">北京人民广播电台 北京电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">天津</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">北方网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">天津日报 今晚报 滨海时报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">天津人民广播电台 天津电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">河北</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">长城网 河北新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">河北日报 石家庄日报 燕赵晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">河北人民广播电台 河北电视台 石家庄人民广播电台 石家庄电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">山西</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">黄河新闻网 山西新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">山西日报 太原日报 山西晚报 太原晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">山西人民广播电台 山西电视台 太原人民广播电台 太原电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">内蒙古</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">内蒙古新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">内蒙古日报 呼和浩特市日报 呼和浩特晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">内蒙古人民广播电台 内蒙古电视台 呼和浩特市人民广播电台 呼和浩特市电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">辽宁</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">东北新闻网 北国网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">辽宁日报 沈阳晚报 大连日报 沈阳日报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">辽宁人民广播电台 辽宁电视台 大连人民广播电台 大连电视台 沈阳人民广播电台 沈阳电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">吉林</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">中国吉林网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">吉林日报 长春晚报 长春日报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">吉林人民广播电台 吉林电视台 长春人民广播电台 长春电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">黑龙江</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">东北网 哈尔滨新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">黑龙江日报 哈尔滨日报 黑龙江晨报 生活报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">黑龙江人民广播电台 黑龙江电视台 哈尔滨人民广播电台 哈尔滨电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">上海</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">东方网 新民网 一财网 解放网 看看新闻网 澎湃新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">解放日报 文汇报 新民晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">上海人民广播电台 上海电视台 东方电视台 东方广播电台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">江苏</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">中国江苏网 新华报业网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">新华日报 南京日报 扬子晚报 金陵晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">江苏省广播电视总台 南京人民广播电台 南京电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">浙江</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">浙江在线 中国宁波网 杭州网 新蓝网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">浙江日报 钱江晚报 杭州日报 宁波日报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">浙江人民广播电台 浙江电视台 杭州人民广播电台 杭州电视台 宁波人民广播电台 宁波电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">安徽</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">中国安徽在线</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">安徽日报 合肥日报 合肥晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">安徽人民广播电台 安徽电视台 合肥人民广播电台 合肥电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">福建</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">东南新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">福建日报 福州日报 福州晚报 厦门日报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">福建人民广播电台 福建电视台 福州人民广播电台 福州电视台 厦门人民广播电台 厦门电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">江西</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">中国江西网 大江网 今视网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">江西日报 南昌日报 南昌晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">江西人民广播电台 江西电视台 南昌人民广播电台 南昌电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">山东</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">大众网 齐鲁网 胶东在线 鲁网 中国山东网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">大众日报 齐鲁晚报 济南日报 青岛日报 山东商报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">山东人民广播电台 山东电视台 济南人民广播电台 济南电视台 青岛人民广播电台 青岛电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">河南</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">大河网 映象网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">河南日报 郑州日报 郑州晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">河南人民广播电台 河南电视台 郑州人民广播电台 郑州电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">湖北</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">荆楚网 长江网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">湖北日报 武汉晚报 长江日报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">湖北人民广播电台 湖北电视台 武汉人民广播电台 武汉电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">湖南</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">红网 华声在线 金鹰网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">湖南日报 长沙晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">湖南人民广播电台 湖南电视台 长沙人民广播电台 长沙电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">广东</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">南方新闻网 大洋网 深圳新闻网 金羊网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">南方日报 广州日报 羊城晚报 深圳特区报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">广东人民广播电台 广东电视台 南方电视台 广州人民广播电台 广州电视台 深圳人民广播电台 深圳电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">广西</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">广西新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">广西日报 南宁日报 南宁晚报 南方科技报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">广西人民广播电台 广西电视台 南宁人民广播电台 南宁电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">海南</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">南海网（海南新闻网）</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">海南日报 海口晚报 海南特区报 国际旅游岛商报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">海南广播电视台 海口广播电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">重庆</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">华龙网 视界网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">重庆日报 重庆晚报 重庆晨报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">重庆人民广播电台 重庆电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">四川</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">四川新闻网 四川在线 成都全搜索新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">四川日报 成都日报 成都晚报 华西都市报 成都商报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">四川人民广播电台 四川电视台 成都人民广播电台 成都电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">贵州</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">多彩贵州网（金黔在线） 当代先锋网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">贵州日报 贵阳日报 贵阳晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">贵州人民广播电台 贵州电视台 贵阳人民广播电台 贵阳电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">云南</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">云南网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">云南日报 昆明日报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">云南人民广播电台 云南电视台 昆明人民广播电台 昆明电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">西藏</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">中国西藏新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">西藏日报 拉萨晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">西藏人民广播电台 西藏电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">陕西</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">西部网 陕西传媒网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">陕西日报 西安日报 西安晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">陕西人民广播电台 陕西电视台 西安人民广播电台 西安电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">甘肃</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">中国甘肃网 每日甘肃网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">甘肃日报 兰州日报 兰州晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">甘肃广播电影电视总台 兰州人民广播电台 兰州电视</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">青海</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">青海新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">青海日报 西宁晚报 西海都市报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">青海人民广播电台 青海电视台 西宁人民广播电台 西宁电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(248, 248, 248); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">宁夏</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">宁夏新闻网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">宁夏日报 银川晚报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">宁夏广播电视总台 银川人民广播电台 银川电视台</td></tr><tr style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); border-top: 1px solid rgb(204, 204, 204);\"><td style=\"box-sizing: border-box; padding: 6px 13px;\">新疆</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">天山网</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">新疆日报 乌鲁木齐晚报 兵团日报</td><td style=\"box-sizing: border-box; padding: 6px 13px;\">新疆人民广播电台 新疆电视台 乌鲁木齐人民广播电台 乌鲁木齐电视台 兵团广播电视台</td></tr></tbody></table><p><br/></p>', '1.中央级媒体 部委网站 刊物', '0', '0', '1', '1544496527');
INSERT INTO `web_notice` VALUES ('13', '0', '', '公告 | 关于打击“黑公关”文章内容的公告', '', '', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(51, 51, 51); font-family: \">尊敬的平台用户：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(51, 51, 51); font-family: \">近日网络不断涌现“黑公关”文章内容，致使有些企业形象受到损害。“黑公关”是指利用一些网络谣言进行拼凑，通过恶意侮辱、攻击企业主等方式进行有偿文章发布，其典型行为如下：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(51, 51, 51); font-family: \">1、组织黑公关账号短时间内进行大量恶意信息攻击相关企业；</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(51, 51, 51); font-family: \">2、凭空捏造或拼接组接相关企业的负面新闻；</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(51, 51, 51); font-family: \">3、通过编造的负面信息对企业以删稿等理由进行勒索；</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(51, 51, 51); font-family: \">4、直接收费杜撰公告稿件，抹黑、攻击竞争对手。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(51, 51, 51); font-family: \">以上但不仅限于这些“黑公关”行为严重破坏了网络环境。平台将严厉打击“黑公关”行为信息，如遇相关信息欢迎到<b><u>平台</u></b>进行举报，一经核实将对账号进行永久封禁处理。</p><p><br/></p>', '公告 | 关于打击“黑公关”文章内容的公告', '0', '0', '1', '1544679965');
INSERT INTO `web_notice` VALUES ('16', '0', '', '软文发布不懂这些就是“外行人”', '', '', '\r\n您的企业是不是有这样的问题？\r\n1. 在网络上找不到企业或品牌相关信息，属于信息空 白状态，严重错失互联网商机，影响公司对外形象\r\n2.百度，360，搜狗等各大搜索上找不到公司相 关信息，或者百度搜索第一页没有公司相关信息。\r\n3.您的产品不够知名度，缺乏客户的信任和认可。\r\n4.好产品无人知，做不到广而告知，电视，户外， 广播任何广告都非常昂贵，而且效果不可控。\r\n5.有新产品宣传，企业日常公关宣传，企业新闻事件， 活动宣传、危机公关等没法及时有效地传播出去的。\r\n6.尝试各种推广方式，要么成本昂贵，要么效果不理想。\r\n如果您有以上6大问题请找一个专业的软文营销策划公司，做一下企业的媒体宣传和推广！\r\n软文发布的方法很多，要选择合适的媒体和频道才能达到事半功倍的效果！\r\n1.如果您是企业日常新闻宣传可以发一些门户媒体+行业媒体+地方媒体\r\n2.产品宣传或公司活动宣传建议您发行业媒体为主，门户媒体为辅\r\n3.如果您的企业面临危机公关应该多写一些企业正面宣传稿件，在权威门户媒体以及大量发布收录好的地方媒体\r\n4.如果您想做一件事件营销，那就需要大量的门户媒体发布\r\n', '', '0', '0', '1', '1557906400');
INSERT INTO `web_notice` VALUES ('17', '0', '', '关于平台媒体包收录情况说明', '', '', '包收录的媒体，若稿件未收录，请在第二个工作日下班前提交反馈！有特殊要求的媒体，请按照媒体备注操作！\r\n（例：周五出的稿件，在周六日非正常工作日的情况下，最晚周一下班前反馈未收录）\r\n推荐:金评媒，证券之星，中国财经时报，腾讯大豫网，中国广播网河南，和讯网，全景网，凤凰网城市，榜信网，凤凰网河北', '', '0', '0', '1', '1559292084');
INSERT INTO `web_notice` VALUES ('18', '0', '', '收录好的小媒体推荐', '', '', '收录好的小媒体推荐：巴西华人网 聊城新闻网 永州新闻网 今视网 极客网 北纬网 人民交通网 新农村商报 中国张掖网 燕赵晚报 中国常州网（包新） 中国金银理财网', '', '0', '0', '1', '1561013199');

-- ----------------------------
-- Table structure for web_pictures
-- ----------------------------
DROP TABLE IF EXISTS `web_pictures`;
CREATE TABLE `web_pictures` (
  `pictures_id` int(10) NOT NULL AUTO_INCREMENT,
  `picmember_id` int(10) unsigned DEFAULT '0',
  `pictures_url` varchar(255) DEFAULT '',
  `pictures_name` varchar(255) DEFAULT '',
  `pictures_sort` int(10) unsigned DEFAULT '0',
  `pictures_state` tinyint(1) unsigned DEFAULT '1' COMMENT '图片状态',
  `pictures_path` varchar(255) DEFAULT '' COMMENT '图片路径',
  PRIMARY KEY (`pictures_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='代理商轮播图';

-- ----------------------------
-- Records of web_pictures
-- ----------------------------
INSERT INTO `web_pictures` VALUES ('4', '32', '', '滚动图片二', '0', '1', '20181104/e4c635032c4343d21ebb5ebf2ee3a7f3.jpg');
INSERT INTO `web_pictures` VALUES ('2', '32', '', '滚动图片一', '0', '1', '20181104/4af9263814822927f18b73dd096a4f6b.jpg');
INSERT INTO `web_pictures` VALUES ('5', '32', '', '滚动图片三', '0', '1', '20181104/8f4c7ec453038c553c16dc817dc07338.jpg');
INSERT INTO `web_pictures` VALUES ('8', '98', '', '首页', '0', '1', '20181115/0e48152ade472090ce219f79aa26f265.jpg');
INSERT INTO `web_pictures` VALUES ('20', '639', '', '媒体库', '0', '1', '20190616/a8b996b9fbd945f6369b4ac492b59c6c.jpg');
INSERT INTO `web_pictures` VALUES ('19', '639', '', '一站式全网自主营销', '0', '1', '20190616/48fd591fb9e97d3500fbb54e56221752.jpg');
INSERT INTO `web_pictures` VALUES ('14', '402', '', '绘梦者', '1', '0', '20190416/b5891bf7dec9f6ad8a02aa8093aa343c.png');
INSERT INTO `web_pictures` VALUES ('15', '402', '', '2', '2', '0', '20190416/77d751217250886119719e640c2aa888.png');
INSERT INTO `web_pictures` VALUES ('16', '402', '', '3', '3', '0', '20190416/8221a650561b9d44f73bc55374214574.png');
INSERT INTO `web_pictures` VALUES ('21', '639', '', '引爆全网', '0', '1', '20190616/c40593e9ed94e060bfb9bceb1bca0528.jpg');
INSERT INTO `web_pictures` VALUES ('22', '639', '', '发文流程', '0', '1', '20190619/39ce36c3a41b2d414189de84b48b90dc.jpg');

-- ----------------------------
-- Table structure for web_poster
-- ----------------------------
DROP TABLE IF EXISTS `web_poster`;
CREATE TABLE `web_poster` (
  `PosterID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PosterTypeID` smallint(5) unsigned DEFAULT '0' COMMENT '分类ID',
  `PosterTypePath` varchar(30) DEFAULT '' COMMENT '分类路径',
  `PosterTitle` varchar(100) DEFAULT '' COMMENT '标题',
  `PosterUrl` varchar(100) DEFAULT '' COMMENT '连接',
  `PosterPicPath` varchar(100) DEFAULT '' COMMENT '图片路径',
  `PosterClass` tinyint(1) unsigned DEFAULT '0' COMMENT '类型1图片2文本',
  `PosterSort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  `PosterState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态',
  `PosterTime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`PosterID`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='广告中心数据表';

-- ----------------------------
-- Records of web_poster
-- ----------------------------
INSERT INTO `web_poster` VALUES ('195', '4', '1,4,', '1', '2', '', '1', '0', '1', '1537888755');
INSERT INTO `web_poster` VALUES ('196', '1', '1,', '111', '222', '20180925/13272645825b6fb46172c97be8402285.jpg', '1', '0', '1', '1537888782');

-- ----------------------------
-- Table structure for web_postertype
-- ----------------------------
DROP TABLE IF EXISTS `web_postertype`;
CREATE TABLE `web_postertype` (
  `TypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `TypePID` smallint(6) unsigned DEFAULT '0',
  `TypePath` varchar(50) DEFAULT '' COMMENT '用来表示当前分类所属的层级完整路径如：1,2,3,4,',
  `TypeNode` tinyint(3) unsigned DEFAULT '0' COMMENT '用来表达当前分类所属的层级位置',
  `TypeName` varchar(30) DEFAULT '',
  `TypeSort` smallint(6) unsigned DEFAULT '0',
  `TypeState` tinyint(1) unsigned DEFAULT '0',
  `TypeTime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`TypeID`),
  KEY `Column_PID` (`TypePID`) USING BTREE,
  KEY `Column_TypePath` (`TypePath`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='广告位分类表';

-- ----------------------------
-- Records of web_postertype
-- ----------------------------
INSERT INTO `web_postertype` VALUES ('1', '0', '1,', '1', '电脑端位置广告', '0', '1', '1501810687');
INSERT INTO `web_postertype` VALUES ('4', '1', '1,4,', '2', '首页头部轮播广告位置1920*826像素', '0', '1', '1501810725');

-- ----------------------------
-- Table structure for web_role
-- ----------------------------
DROP TABLE IF EXISTS `web_role`;
CREATE TABLE `web_role` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(2000) NOT NULL DEFAULT '',
  `sort` smallint(6) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of web_role
-- ----------------------------

-- ----------------------------
-- Table structure for web_wearticle
-- ----------------------------
DROP TABLE IF EXISTS `web_wearticle`;
CREATE TABLE `web_wearticle` (
  `article_id` int(10) NOT NULL AUTO_INCREMENT,
  `agency_member_id` int(10) DEFAULT '0' COMMENT '代理会员ID',
  `member_id` int(10) DEFAULT NULL COMMENT '会员id',
  `article_num` varchar(30) DEFAULT '' COMMENT '文章编号',
  `article_title` varchar(100) DEFAULT '' COMMENT '文章标题',
  `article_customer` varchar(10) NOT NULL COMMENT '客户名称',
  `article_content` longblob COMMENT '文章内容',
  `article_remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `article_website` varchar(255) DEFAULT '' COMMENT '文章网址',
  `article_time` int(10) DEFAULT NULL COMMENT '提交时间',
  `article_doc` varchar(255) DEFAULT '' COMMENT '文章文件地址',
  `down_state` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_wearticle
-- ----------------------------

-- ----------------------------
-- Table structure for web_wemedia
-- ----------------------------
DROP TABLE IF EXISTS `web_wemedia`;
CREATE TABLE `web_wemedia` (
  `MediaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MediaMemberID` int(10) unsigned DEFAULT '0',
  `MediaWebNameID` smallint(6) unsigned DEFAULT '0' COMMENT '媒体平台选择//频道类型',
  `MediaIndustryID` smallint(6) unsigned DEFAULT '0' COMMENT '行业分类选择',
  `MediaCityID` smallint(6) unsigned DEFAULT '0' COMMENT '所在地区',
  `MediaUrlTypeID` smallint(6) unsigned DEFAULT '0' COMMENT '链接类型',
  `MediaWebPrice` decimal(10,2) DEFAULT '0.00' COMMENT '平台价格',
  `MediaMemberPrice1` decimal(10,2) DEFAULT '0.00' COMMENT '铜牌会员价格',
  `MediaMemberPrice2` decimal(10,2) DEFAULT '0.00' COMMENT '银牌会员价格',
  `MediaMemberPrice3` decimal(10,2) DEFAULT '0.00' COMMENT '金牌会员价格',
  `MediaMemberPrice4` decimal(10,2) DEFAULT '0.00' COMMENT '钻石',
  `MediaMemberPrice5` decimal(10,2) DEFAULT '0.00' COMMENT '白金',
  `MediaTitle` varchar(100) DEFAULT '' COMMENT '媒体名称',
  `MediaAuthority` int(2) DEFAULT '0' COMMENT '0非官方自媒体1官方自媒体',
  `Medialog` varchar(255) DEFAULT NULL COMMENT '媒体logo',
  `MediaAuthImg` varchar(255) DEFAULT NULL COMMENT '认证图片',
  `MediaInUrl` varchar(500) DEFAULT '' COMMENT '入口链接',
  `MediaCaseUrl` varchar(500) DEFAULT '' COMMENT '案例链接',
  `MediaContent` varchar(1000) DEFAULT '' COMMENT '备注说明',
  `MediaState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态：0已删除1已通过2待审核3未通过4已下架5已暂停',
  `MediaTime` int(10) unsigned DEFAULT '0' COMMENT '保存时间',
  `UserType` tinyint(2) unsigned DEFAULT '0' COMMENT '1平台上传2商家上传3媒介盒子',
  `MediaPlatformID` int(10) DEFAULT NULL COMMENT '其他平台ID',
  `MediaPlatformCGL` varchar(8) DEFAULT NULL,
  `fans_num` int(3) DEFAULT '0' COMMENT '粉丝数',
  `read_num` int(3) DEFAULT '0' COMMENT '阅读数',
  `account_auth` int(3) DEFAULT '0' COMMENT '账号认证 0未认证 1已认证',
  `account_video` int(3) DEFAULT '0' COMMENT '0视频不可发 1可发',
  `account_publish` int(3) DEFAULT '0' COMMENT '周末不可发 0 1可发',
  `full_quota` int(3) DEFAULT '0' COMMENT '每日可发篇数',
  `Recommend` int(3) DEFAULT '0' COMMENT '推荐1',
  `MediaStatedec` varchar(100) DEFAULT NULL COMMENT '审核备注',
  `yearstate` int(2) DEFAULT '0' COMMENT '春节可发',
  `activity` int(2) DEFAULT '0' COMMENT '活动媒体11极速发稿 22 首页推荐33黄标V',
  `duibitime` int(10) DEFAULT NULL,
  PRIMARY KEY (`MediaID`),
  KEY `MediaID` (`MediaID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_wemedia
-- ----------------------------
INSERT INTO `web_wemedia` VALUES ('1', '0', '0', '0', '0', '0', '3.00', '1.00', '2.00', '0.00', '0.00', '0.00', '网易号（互联网全知晓）', '0', null, null, '', '', '', '1', '0', '3', null, null, '0', '0', '0', '0', '0', '0', '0', null, '0', '0', null);
INSERT INTO `web_wemedia` VALUES ('5', '756', '158', '207', '1', '0', '5.00', '10.00', '7.00', '6.00', '6.00', '0.00', '网易号1123123', '0', null, null, '1111', '2222', 'asdf', '1', '1605516698', '2', null, null, '1', '1', '89', '0', '0', '0', '0', null, '0', '0', null);

-- ----------------------------
-- Table structure for web_wholetype
-- ----------------------------
DROP TABLE IF EXISTS `web_wholetype`;
CREATE TABLE `web_wholetype` (
  `TypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `TypePID` smallint(6) unsigned DEFAULT '0',
  `TypePath` varchar(50) DEFAULT '' COMMENT '用来表示当前分类所属的层级完整路径如：1,2,3,4,',
  `TypeNode` tinyint(3) unsigned DEFAULT '0' COMMENT '用来表达当前分类所属的层级位置',
  `TypeName` varchar(30) DEFAULT '',
  `TypeViceName` varchar(64) DEFAULT '' COMMENT '副标题',
  `TypePicPath1` varchar(100) DEFAULT '',
  `TypePicPath2` varchar(100) DEFAULT '',
  `TypeUnit` varchar(20) DEFAULT '',
  `TypeSort` smallint(6) unsigned DEFAULT '0',
  `TypeState` tinyint(1) unsigned DEFAULT '1',
  `TypeTime` int(10) unsigned DEFAULT '0',
  `TypeHomeTop` tinyint(4) DEFAULT '0' COMMENT '首页置顶（1是 0否）',
  `TypeField` varchar(50) DEFAULT NULL COMMENT '对应媒体字段名称',
  PRIMARY KEY (`TypeID`),
  KEY `Column_PID` (`TypePID`) USING BTREE,
  KEY `Column_TypePath` (`TypePath`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='全局分类表';

-- ----------------------------
-- Records of web_wholetype
-- ----------------------------
INSERT INTO `web_wholetype` VALUES ('1', '0', '1,', '1', '快递名称', '', '', '', '', '0', '1', '1539138305', '0', null);
INSERT INTO `web_wholetype` VALUES ('2', '0', '2,', '1', '发票类型', '', '', '', '', '0', '1', '1539141551', '0', null);
INSERT INTO `web_wholetype` VALUES ('3', '0', '3,', '1', '发票明细', '', '', '', '', '0', '1', '1539141557', '0', null);
INSERT INTO `web_wholetype` VALUES ('4', '1', '1,4,', '2', '申通快递', '', '', '', '', '0', '1', '1539142055', '0', null);
INSERT INTO `web_wholetype` VALUES ('5', '1', '1,5,', '2', '韵达快递', '', '', '', '', '0', '1', '1539142066', '0', null);
INSERT INTO `web_wholetype` VALUES ('6', '1', '1,6,', '2', '圆通快递', '', '', '', '', '0', '1', '1539142071', '0', null);
INSERT INTO `web_wholetype` VALUES ('7', '1', '1,7,', '2', '百世汇通', '', '', '', '', '0', '1', '1539142076', '0', null);
INSERT INTO `web_wholetype` VALUES ('8', '1', '1,8,', '2', '邮政包裹', '', '', '', '', '0', '1', '1539142080', '0', null);
INSERT INTO `web_wholetype` VALUES ('9', '1', '1,9,', '2', '天天快递', '', '', '', '', '0', '1', '1539142084', '0', null);
INSERT INTO `web_wholetype` VALUES ('10', '1', '1,10,', '2', 'EMS', '', '', '', '', '0', '1', '1539142089', '0', null);
INSERT INTO `web_wholetype` VALUES ('11', '1', '1,11,', '2', '宅急送', '', '', '', '', '0', '1', '1539142094', '0', null);
INSERT INTO `web_wholetype` VALUES ('12', '1', '1,12,', '2', '网点自提', '', '', '', '', '0', '1', '1539142104', '0', null);
INSERT INTO `web_wholetype` VALUES ('13', '2', '2,13,', '2', '发票', '', '', '', '', '0', '1', '1539142162', '0', null);
INSERT INTO `web_wholetype` VALUES ('14', '2', '2,14,', '2', '收据', '', '', '', '', '0', '1', '1539142173', '0', null);
INSERT INTO `web_wholetype` VALUES ('15', '3', '3,15,', '2', '服务费', '', '', '', '', '0', '1', '1539142204', '0', null);
INSERT INTO `web_wholetype` VALUES ('16', '3', '3,16,', '2', '网络服务费', '', '', '', '', '0', '1', '1539142210', '0', null);
INSERT INTO `web_wholetype` VALUES ('17', '3', '3,17,', '2', '技术服务费', '', '', '', '', '0', '1', '1539142216', '0', null);
INSERT INTO `web_wholetype` VALUES ('18', '0', '18,', '1', '频道类型', '', '', '', '', '0', '1', '1539162483', '0', 'MediaWebNameID');
INSERT INTO `web_wholetype` VALUES ('19', '18', '18,19,', '2', 'IT科技', '', '', '', '', '0', '1', '1539162498', '0', null);
INSERT INTO `web_wholetype` VALUES ('20', '18', '18,20,', '2', '生活消费', '', '', '', '', '0', '1', '1539162509', '0', null);
INSERT INTO `web_wholetype` VALUES ('21', '18', '18,21,', '2', '女性时尚', '', '', '', '', '0', '1', '1539162517', '0', null);
INSERT INTO `web_wholetype` VALUES ('22', '18', '18,22,', '2', '娱乐休闲', '', '', '', '', '0', '1', '1539162523', '0', null);
INSERT INTO `web_wholetype` VALUES ('23', '18', '18,23,', '2', '游戏网站', '', '', '', '', '0', '1', '1539162528', '0', null);
INSERT INTO `web_wholetype` VALUES ('24', '18', '18,24,', '2', '汽车网站', '', '', '', '', '0', '1', '1539162534', '0', null);
INSERT INTO `web_wholetype` VALUES ('25', '18', '18,25,', '2', '教育培训', '', '', '', '', '0', '1', '1539162539', '0', null);
INSERT INTO `web_wholetype` VALUES ('26', '18', '18,26,', '2', '酒店旅游', '', '', '', '', '0', '1', '1539162545', '0', null);
INSERT INTO `web_wholetype` VALUES ('27', '18', '18,27,', '2', '健康医疗', '', '', '', '', '0', '1', '1539162552', '0', null);
INSERT INTO `web_wholetype` VALUES ('28', '18', '18,28,', '2', '房产家居', '', '', '', '', '0', '1', '1539162557', '0', null);
INSERT INTO `web_wholetype` VALUES ('29', '18', '18,29,', '2', '财经商业', '', '', '', '', '0', '1', '1539162563', '0', null);
INSERT INTO `web_wholetype` VALUES ('30', '18', '18,30,', '2', '新闻资讯', '', '', '', '', '0', '1', '1539162568', '0', null);
INSERT INTO `web_wholetype` VALUES ('31', '18', '18,31,', '2', '套餐系列', '', '', '', '', '0', '1', '1539162573', '0', null);
INSERT INTO `web_wholetype` VALUES ('32', '18', '18,32,', '2', '最新秒杀', '', '', '', '', '0', '1', '1539162580', '0', null);
INSERT INTO `web_wholetype` VALUES ('33', '18', '18,33,', '2', '十元专区', '', '', '', '', '0', '1', '1539162586', '0', null);
INSERT INTO `web_wholetype` VALUES ('34', '18', '18,34,', '2', '文化艺术', '', '', '', '', '0', '1', '1539162592', '0', null);
INSERT INTO `web_wholetype` VALUES ('61', '18', '18,61,', '2', '体育运动', '', '', '', '', '0', '1', '1539401684', '0', null);
INSERT INTO `web_wholetype` VALUES ('35', '0', '35,', '1', '综合门户媒体', '', '', '', '', '0', '1', '1539162616', '0', 'MediaIndustryID');
INSERT INTO `web_wholetype` VALUES ('36', '35', '35,36,', '2', '新浪网', '', '', '', '', '0', '1', '1539162643', '0', null);
INSERT INTO `web_wholetype` VALUES ('37', '35', '35,37,', '2', '搜狐网', '', '', '', '', '0', '1', '1539163174', '0', null);
INSERT INTO `web_wholetype` VALUES ('38', '35', '35,38,', '2', '腾讯网', '', '', '', '', '0', '1', '1539163182', '0', null);
INSERT INTO `web_wholetype` VALUES ('39', '35', '35,39,', '2', '网易网', '', '', '', '', '0', '1', '1539163188', '0', null);
INSERT INTO `web_wholetype` VALUES ('40', '35', '35,40,', '2', '凤凰网', '', '', '', '', '0', '1', '1539163195', '0', null);
INSERT INTO `web_wholetype` VALUES ('41', '35', '35,41,', '2', '中华网', '', '', '', '', '0', '1', '1539163203', '0', null);
INSERT INTO `web_wholetype` VALUES ('42', '35', '35,42,', '2', '人民网', '', '', '', '', '0', '1', '1539163209', '0', null);
INSERT INTO `web_wholetype` VALUES ('43', '35', '35,43,', '2', '央视网', '', '', '', '', '0', '1', '1539163215', '0', null);
INSERT INTO `web_wholetype` VALUES ('44', '35', '35,44,', '2', '千龙网', '', '', '', '', '0', '1', '1539163220', '0', null);
INSERT INTO `web_wholetype` VALUES ('45', '35', '35,45,', '2', '新华网', '', '', '', '', '0', '1', '1539163226', '0', null);
INSERT INTO `web_wholetype` VALUES ('46', '35', '35,46,', '2', '中国网', '', '', '', '', '0', '1', '1539163231', '0', null);
INSERT INTO `web_wholetype` VALUES ('47', '35', '35,47,', '2', '慧聪网', '', '', '', '', '0', '1', '1539163237', '0', null);
INSERT INTO `web_wholetype` VALUES ('48', '35', '35,48,', '2', 'TOM网', '', '', '', '', '0', '1', '1539163243', '0', null);
INSERT INTO `web_wholetype` VALUES ('49', '35', '35,49,', '2', '21CN网', '', '', '', '', '0', '1', '1539163250', '0', null);
INSERT INTO `web_wholetype` VALUES ('50', '35', '35,50,', '2', '中国日报网', '', '', '', '', '0', '1', '1539163255', '0', null);
INSERT INTO `web_wholetype` VALUES ('51', '35', '35,51,', '2', '中国经济网', '', '', '', '', '0', '1', '1539163261', '0', null);
INSERT INTO `web_wholetype` VALUES ('52', '35', '35,52,', '2', '中国新闻网', '', '', '', '', '0', '1', '1539163267', '0', null);
INSERT INTO `web_wholetype` VALUES ('53', '35', '35,53,', '2', '中国广播网', '', '', '', '', '0', '1', '1539163272', '0', null);
INSERT INTO `web_wholetype` VALUES ('54', '35', '35,54,', '2', '垂直媒体', '', '', '', '', '0', '1', '1539163278', '0', null);
INSERT INTO `web_wholetype` VALUES ('55', '35', '35,55,', '2', '其他门户', '', '', '', '', '0', '1', '1539163283', '0', null);
INSERT INTO `web_wholetype` VALUES ('56', '35', '35,56,', '2', '光明网', '', '', '', '', '0', '1', '1539163288', '0', null);
INSERT INTO `web_wholetype` VALUES ('57', '35', '35,57,', '2', '环球网', '', '', '', '', '0', '1', '1539163294', '0', null);
INSERT INTO `web_wholetype` VALUES ('58', '35', '35,58,', '2', '国际在线', '', '', '', '', '0', '1', '1539163298', '0', null);
INSERT INTO `web_wholetype` VALUES ('59', '0', '59,', '1', '链接类型', '', '', '', '', '0', '1', '1539163303', '0', 'MediaUrlTypeID');
INSERT INTO `web_wholetype` VALUES ('60', '59', '59,60,', '2', '不带联系方式', '', '', '', '', '0', '1', '1539163309', '0', null);
INSERT INTO `web_wholetype` VALUES ('62', '18', '18,62,', '2', '食品餐饮', '', '', '', '', '0', '1', '1539401691', '0', null);
INSERT INTO `web_wholetype` VALUES ('63', '18', '18,63,', '2', '工业贸易', '', '', '', '', '0', '1', '1539401697', '0', null);
INSERT INTO `web_wholetype` VALUES ('64', '18', '18,64,', '2', '亲子母婴', '', '', '', '', '0', '1', '1539401712', '0', null);
INSERT INTO `web_wholetype` VALUES ('65', '59', '59,65,', '2', '可带网址', '', '', '', '', '0', '1', '1539454130', '0', null);
INSERT INTO `web_wholetype` VALUES ('66', '0', '66,', '1', '发稿速度', '', '', '', '', '0', '1', '1539454147', '0', 'MediaSpeedID');
INSERT INTO `web_wholetype` VALUES ('67', '66', '66,67,', '2', '一小时内', '', '', '', '', '0', '1', '1539454160', '0', null);
INSERT INTO `web_wholetype` VALUES ('68', '66', '66,68,', '2', '两小时内', '', '', '', '', '0', '1', '1539454166', '0', null);
INSERT INTO `web_wholetype` VALUES ('69', '66', '66,69,', '2', '半天 ', '', '', '', '', '0', '1', '1539454172', '0', null);
INSERT INTO `web_wholetype` VALUES ('70', '66', '66,70,', '2', '当天', '', '', '', '', '0', '1', '1539454178', '0', null);
INSERT INTO `web_wholetype` VALUES ('71', '66', '66,71,', '2', '2天', '', '', '', '', '0', '1', '1539454184', '0', null);
INSERT INTO `web_wholetype` VALUES ('72', '66', '66,72,', '2', '2天以上', '', '', '', '', '0', '0', '1539454189', '0', null);
INSERT INTO `web_wholetype` VALUES ('73', '0', '73,', '1', '新闻源', '', '', '', '', '0', '1', '1539454204', '0', 'MediaNewsSourceID');
INSERT INTO `web_wholetype` VALUES ('74', '73', '73,74,', '2', '百度新闻源', '', '', '', '', '0', '1', '1539454217', '0', null);
INSERT INTO `web_wholetype` VALUES ('75', '73', '73,75,', '2', '非百度新闻源', '', '', '', '', '0', '1', '1539454223', '0', null);
INSERT INTO `web_wholetype` VALUES ('76', '0', '76,', '1', '周末可发', '', '', '', '', '0', '1', '1539454239', '0', 'MediaCanSendID');
INSERT INTO `web_wholetype` VALUES ('134', '79', '79,134,', '2', '东方头条', '', '', '', '', '8', '0', '1544578772', '0', null);
INSERT INTO `web_wholetype` VALUES ('78', '76', '76,78,', '2', '可发', '', '', '', '', '0', '1', '1539454275', '0', null);
INSERT INTO `web_wholetype` VALUES ('79', '0', '79,', '1', '特别行业', '', '', '', '', '0', '1', '1539454288', '0', 'MediaSpecialIndustryID');
INSERT INTO `web_wholetype` VALUES ('80', '79', '79,80,', '2', 'p2p', '', '', '', '', '0', '1', '1539454304', '0', null);
INSERT INTO `web_wholetype` VALUES ('81', '79', '79,81,', '2', '微商', '', '', '', '', '0', '1', '1539454310', '0', null);
INSERT INTO `web_wholetype` VALUES ('82', '79', '79,82,', '2', '留学', '', '', '', '', '0', '1', '1539454319', '0', null);
INSERT INTO `web_wholetype` VALUES ('83', '79', '79,83,', '2', '健康', '', '', '', '', '0', '1', '1539454325', '0', null);
INSERT INTO `web_wholetype` VALUES ('84', '79', '79,84,', '2', '加盟', '', '', '', '', '0', '1', '1539454331', '0', null);
INSERT INTO `web_wholetype` VALUES ('85', '0', '85,', '1', '收录情况', '', '', '', '', '0', '1', '1539454345', '0', 'MediaSituationID');
INSERT INTO `web_wholetype` VALUES ('86', '85', '85,86,', '2', '包收录', '', '', '', '', '0', '1', '1539454354', '0', null);
INSERT INTO `web_wholetype` VALUES ('133', '79', '79,133,', '2', '百家号', '', '', '', '', '7', '0', '1544578762', '0', null);
INSERT INTO `web_wholetype` VALUES ('88', '0', '88,', '1', '电脑权重', '', '', '', '', '0', '1', '1539454392', '0', 'MediaComputerWeightID');
INSERT INTO `web_wholetype` VALUES ('89', '88', '88,89,', '2', '0', '', '', '', '', '0', '1', '1539454414', '0', null);
INSERT INTO `web_wholetype` VALUES ('90', '88', '88,90,', '2', '1', '', '', '', '', '0', '1', '1539454426', '0', null);
INSERT INTO `web_wholetype` VALUES ('91', '88', '88,91,', '2', '2', '', '', '', '', '0', '1', '1539454431', '0', null);
INSERT INTO `web_wholetype` VALUES ('92', '88', '88,92,', '2', '3', '', '', '', '', '0', '1', '1539454434', '0', null);
INSERT INTO `web_wholetype` VALUES ('93', '88', '88,93,', '2', '4', '', '', '', '', '0', '1', '1539454437', '0', null);
INSERT INTO `web_wholetype` VALUES ('94', '88', '88,94,', '2', '5', '', '', '', '', '0', '1', '1539454439', '0', null);
INSERT INTO `web_wholetype` VALUES ('95', '88', '88,95,', '2', '6', '', '', '', '', '0', '1', '1539454442', '0', null);
INSERT INTO `web_wholetype` VALUES ('96', '88', '88,96,', '2', '7', '', '', '', '', '0', '1', '1539454446', '0', null);
INSERT INTO `web_wholetype` VALUES ('97', '88', '88,97,', '2', '8', '', '', '', '', '0', '1', '1539454449', '0', null);
INSERT INTO `web_wholetype` VALUES ('98', '88', '88,98,', '2', '9', '', '', '', '', '0', '1', '1539454458', '0', null);
INSERT INTO `web_wholetype` VALUES ('99', '0', '99,', '1', '移动权重', '', '', '', '', '0', '1', '1539454478', '0', 'MediaMobileWeightID');
INSERT INTO `web_wholetype` VALUES ('100', '99', '99,100,', '2', '0', '', '', '', '', '0', '1', '1539454492', '0', null);
INSERT INTO `web_wholetype` VALUES ('101', '99', '99,101,', '2', '1', '', '', '', '', '0', '1', '1539454498', '0', null);
INSERT INTO `web_wholetype` VALUES ('102', '99', '99,102,', '2', '2', '', '', '', '', '0', '1', '1539454503', '0', null);
INSERT INTO `web_wholetype` VALUES ('103', '99', '99,103,', '2', '3', '', '', '', '', '0', '1', '1539454506', '0', null);
INSERT INTO `web_wholetype` VALUES ('104', '99', '99,104,', '2', '4', '', '', '', '', '0', '1', '1539454509', '0', null);
INSERT INTO `web_wholetype` VALUES ('105', '99', '99,105,', '2', '5', '', '', '', '', '0', '1', '1539454513', '0', null);
INSERT INTO `web_wholetype` VALUES ('106', '99', '99,106,', '2', '6', '', '', '', '', '0', '1', '1539454516', '0', null);
INSERT INTO `web_wholetype` VALUES ('107', '99', '99,107,', '2', '7', '', '', '', '', '0', '1', '1539454520', '0', null);
INSERT INTO `web_wholetype` VALUES ('108', '99', '99,108,', '2', '8', '', '', '', '', '0', '1', '1539454524', '0', null);
INSERT INTO `web_wholetype` VALUES ('109', '99', '99,109,', '2', '9', '', '', '', '', '0', '1', '1539454528', '0', null);
INSERT INTO `web_wholetype` VALUES ('110', '0', '110,', '1', '入口级别', '', '', '', '', '0', '1', '1539457503', '0', 'MediaInLevelID');
INSERT INTO `web_wholetype` VALUES ('111', '110', '110,111,', '2', '没有入口', '', '', '', '', '0', '1', '1539457517', '0', null);
INSERT INTO `web_wholetype` VALUES ('112', '110', '110,112,', '2', '首页入口', '', '', '', '', '0', '1', '1539457525', '0', null);
INSERT INTO `web_wholetype` VALUES ('113', '110', '110,113,', '2', '频道入口', '', '', '', '', '0', '1', '1539457534', '0', null);
INSERT INTO `web_wholetype` VALUES ('114', '110', '110,114,', '2', '上级入口', '', '', '', '', '0', '1', '1539457540', '0', null);
INSERT INTO `web_wholetype` VALUES ('115', '0', '115,', '1', '会员价格', '', '', '', '', '0', '1', '1539959489', '0', null);
INSERT INTO `web_wholetype` VALUES ('116', '115', '115,116,', '2', '游客价格', '', '', '', '', '0', '1', '1539959517', '0', null);
INSERT INTO `web_wholetype` VALUES ('117', '115', '115,117,', '2', '大侠价格', '', '', '', '', '0', '1', '1539959525', '0', null);
INSERT INTO `web_wholetype` VALUES ('118', '115', '115,118,', '2', '掌门价格', '', '', '', '', '0', '1', '1539959532', '0', null);
INSERT INTO `web_wholetype` VALUES ('119', '115', '115,119,', '2', '盟主价格', '', '', '', '', '0', '1', '1539959548', '0', null);
INSERT INTO `web_wholetype` VALUES ('120', '0', '120,', '1', '开户银行', '', '', '', '', '0', '1', '1541695684', '0', null);
INSERT INTO `web_wholetype` VALUES ('121', '120', '120,121,', '2', '工商银行', '', '', '', '', '0', '1', '1541695832', '0', null);
INSERT INTO `web_wholetype` VALUES ('122', '120', '120,122,', '2', '农业银行', '', '', '', '', '0', '1', '1541695849', '0', null);
INSERT INTO `web_wholetype` VALUES ('123', '120', '120,123,', '2', '建设银行', '', '', '', '', '0', '1', '1541695858', '0', null);
INSERT INTO `web_wholetype` VALUES ('124', '120', '120,124,', '2', '中国银行', '', '', '', '', '0', '1', '1541695866', '0', null);
INSERT INTO `web_wholetype` VALUES ('125', '120', '120,125,', '2', '招商银行', '', '', '', '', '0', '1', '1541695877', '0', null);
INSERT INTO `web_wholetype` VALUES ('126', '120', '120,126,', '2', '交通银行', '', '', '', '', '0', '1', '1541695885', '0', null);
INSERT INTO `web_wholetype` VALUES ('127', '120', '120,127,', '2', '民生银行', '', '', '', '', '0', '1', '1541695897', '0', null);
INSERT INTO `web_wholetype` VALUES ('128', '120', '120,128,', '2', '光大银行', '', '', '', '', '0', '1', '1541695905', '0', null);
INSERT INTO `web_wholetype` VALUES ('129', '120', '120,129,', '2', '中信银行', '', '', '', '', '0', '1', '1541695911', '0', null);
INSERT INTO `web_wholetype` VALUES ('130', '120', '120,130,', '2', ' 兴业银行', '', '', '', '', '0', '1', '1541695921', '0', null);
INSERT INTO `web_wholetype` VALUES ('131', '120', '120,131,', '2', '邮政储蓄', '', '', '', '', '0', '1', '1541695985', '0', null);
INSERT INTO `web_wholetype` VALUES ('132', '120', '120,132,', '2', '华夏银行', '', '', '', '', '0', '1', '1541695994', '0', null);
INSERT INTO `web_wholetype` VALUES ('135', '79', '79,135,', '2', '一点资讯', '', '', '', '', '9', '0', '1544578783', '0', null);
INSERT INTO `web_wholetype` VALUES ('136', '79', '79,136,', '2', 'UC头条', '', '', '', '', '10', '0', '1544578789', '0', null);
INSERT INTO `web_wholetype` VALUES ('137', '79', '79,137,', '2', '凤凰自媒体', '', '', '', '', '6', '0', '1544578819', '0', null);
INSERT INTO `web_wholetype` VALUES ('138', '79', '79,138,', '2', '知乎', '', '', '', '', '11', '0', '1544578830', '0', null);
INSERT INTO `web_wholetype` VALUES ('139', '79', '79,139,', '2', '豆瓣', '', '', '', '', '12', '0', '1544578837', '0', null);
INSERT INTO `web_wholetype` VALUES ('140', '79', '79,140,', '2', '北京时间', '', '', '', '', '13', '0', '1544578845', '0', null);
INSERT INTO `web_wholetype` VALUES ('141', '79', '79,141,', '2', '简书', '', '', '', '', '14', '0', '1544578854', '0', null);
INSERT INTO `web_wholetype` VALUES ('142', '79', '79,142,', '2', '东方财富', '', '', '', '', '15', '0', '1544578861', '0', null);
INSERT INTO `web_wholetype` VALUES ('143', '79', '79,143,', '2', '中金在线', '', '', '', '', '16', '0', '1544578872', '0', null);
INSERT INTO `web_wholetype` VALUES ('144', '79', '79,144,', '2', '其他', '', '', '', '', '36', '0', '1544578877', '0', null);
INSERT INTO `web_wholetype` VALUES ('145', '79', '79,145,', '2', '雪球', '', '', '', '', '17', '0', '1545118960', '0', null);
INSERT INTO `web_wholetype` VALUES ('146', '79', '79,146,', '2', '易车号', '', '', '', '', '18', '0', '1545118968', '0', null);
INSERT INTO `web_wholetype` VALUES ('147', '79', '79,147,', '2', '小红书', '', '', '', '', '19', '0', '1545118973', '0', null);
INSERT INTO `web_wholetype` VALUES ('148', '76', '76,148,', '2', '不可发', '', '', '', '', '1', '1', '1547025127', '0', null);
INSERT INTO `web_wholetype` VALUES ('149', '88', '88,149,', '2', '10', '', '', '', '', '0', '1', '1547048832', '0', null);
INSERT INTO `web_wholetype` VALUES ('150', '99', '99,150,', '2', '10', '', '', '', '', '0', '1', '1547049080', '0', null);
INSERT INTO `web_wholetype` VALUES ('151', '35', '35,151,', '2', '中国青年网', '', '', '', '', '0', '1', '1547101523', '0', null);
INSERT INTO `web_wholetype` VALUES ('152', '85', '85,152,', '2', '不包收录', '', '', '', '', '0', '1', '1547103606', '0', null);
INSERT INTO `web_wholetype` VALUES ('153', '79', '79,153,', '2', '白名单来源', '', '', '', '', '0', '1', '1547546993', '0', null);
INSERT INTO `web_wholetype` VALUES ('154', '35', '35,154,', '2', '海外媒体', '', '', '', '', '0', '1', '1547547156', '0', null);
INSERT INTO `web_wholetype` VALUES ('155', '35', '35,155,', '2', '东方网', '', '', '', '', '0', '1', '1553051359', '0', null);
INSERT INTO `web_wholetype` VALUES ('156', '35', '35,156,', '2', '大众网', '', '', '', '', '0', '1', '1553051428', '0', null);
INSERT INTO `web_wholetype` VALUES ('180', '35', '35,180,', '2', '北青网', '', '', '', '', '0', '1', '1555930287', '0', null);
INSERT INTO `web_wholetype` VALUES ('181', '35', '35,181,', '2', '和讯网', '', '', '', '', '0', '1', '1555930369', '0', null);
INSERT INTO `web_wholetype` VALUES ('182', '79', '79,182,', '2', '移动端媒体', '', '', '', '', '0', '1', '1557310607', '0', null);
INSERT INTO `web_wholetype` VALUES ('183', '79', '79,183,', '2', '需要来源媒体', '', '', '', '', '0', '1', '1557310627', '0', null);
INSERT INTO `web_wholetype` VALUES ('160', '0', '160,', '1', '行业分类', '', '', '', '', '0', '1', '1555653268', '0', null);
INSERT INTO `web_wholetype` VALUES ('161', '160', '160,161,', '2', '文化', '', '', '', '', '0', '1', '1555653287', '0', null);
INSERT INTO `web_wholetype` VALUES ('162', '160', '160,162,', '2', '历史', '', '', '', '', '0', '1', '1555653299', '0', null);
INSERT INTO `web_wholetype` VALUES ('163', '160', '160,163,', '2', '三农', '', '', '', '', '0', '1', '1555653309', '0', null);
INSERT INTO `web_wholetype` VALUES ('188', '160', '160,188,', '2', '财经', '', '', '', '', '0', '1', '1557307412', '0', null);
INSERT INTO `web_wholetype` VALUES ('189', '160', '160,189,', '2', '科技', '', '', '', '', '0', '1', '1557307423', '0', null);
INSERT INTO `web_wholetype` VALUES ('190', '160', '160,190,', '2', '体育', '', '', '', '', '0', '1', '1557307437', '0', null);
INSERT INTO `web_wholetype` VALUES ('191', '160', '160,191,', '2', '汽车', '', '', '', '', '0', '1', '1557307453', '0', null);
INSERT INTO `web_wholetype` VALUES ('192', '160', '160,192,', '2', '娱乐', '', '', '', '', '0', '1', '1557307472', '0', null);
INSERT INTO `web_wholetype` VALUES ('193', '160', '160,193,', '2', '时尚', '', '', '', '', '0', '1', '1557307487', '0', null);
INSERT INTO `web_wholetype` VALUES ('194', '160', '160,194,', '2', '健康', '', '', '', '', '0', '1', '1557307501', '0', null);
INSERT INTO `web_wholetype` VALUES ('195', '160', '160,195,', '2', '教育', '', '', '', '', '0', '1', '1557307514', '0', null);
INSERT INTO `web_wholetype` VALUES ('196', '160', '160,196,', '2', '母婴', '', '', '', '', '0', '1', '1557307529', '0', null);
INSERT INTO `web_wholetype` VALUES ('197', '160', '160,197,', '2', '美食', '', '', '', '', '0', '1', '1557307542', '0', null);
INSERT INTO `web_wholetype` VALUES ('198', '160', '160,198,', '2', '旅游', '', '', '', '', '0', '1', '1557307556', '0', null);
INSERT INTO `web_wholetype` VALUES ('199', '160', '160,199,', '2', '公益', '', '', '', '', '0', '1', '1557307567', '0', null);
INSERT INTO `web_wholetype` VALUES ('200', '160', '160,200,', '2', '游戏', '', '', '', '', '0', '1', '1557307580', '0', null);
INSERT INTO `web_wholetype` VALUES ('201', '160', '160,201,', '2', '动漫', '', '', '', '', '0', '1', '1557307591', '0', null);
INSERT INTO `web_wholetype` VALUES ('202', '160', '160,202,', '2', '社会', '', '', '', '', '0', '1', '1557307602', '0', null);
INSERT INTO `web_wholetype` VALUES ('203', '160', '160,203,', '2', '房产', '', '', '', '', '0', '1', '1557307614', '0', null);
INSERT INTO `web_wholetype` VALUES ('204', '160', '160,204,', '2', '职场', '', '', '', '', '0', '1', '1557307623', '0', null);
INSERT INTO `web_wholetype` VALUES ('205', '160', '160,205,', '2', '情感', '', '', '', '', '0', '1', '1557307635', '0', null);
INSERT INTO `web_wholetype` VALUES ('206', '160', '160,206,', '2', '搞笑', '', '', '', '', '0', '1', '1557307648', '0', null);
INSERT INTO `web_wholetype` VALUES ('207', '160', '160,207,', '2', '新闻', '', '', '', '', '0', '1', '1557307657', '0', null);
INSERT INTO `web_wholetype` VALUES ('208', '160', '160,208,', '2', '家居', '', '', '', '', '0', '1', '1557307669', '0', null);
INSERT INTO `web_wholetype` VALUES ('209', '160', '160,209,', '2', '生活', '', '', '', '', '0', '1', '1557307680', '0', null);
INSERT INTO `web_wholetype` VALUES ('157', '0', '157,', '1', '平台', '自媒体', '', '', '', '0', '1', '1555644889', '0', null);
INSERT INTO `web_wholetype` VALUES ('158', '157', '157,158,', '2', '今日头条', '', '', '', '', '0', '1', '1555653242', '0', null);
INSERT INTO `web_wholetype` VALUES ('159', '157', '157,159,', '1', '百家号', '', '', '', '', '0', '1', '1555653254', '0', null);
INSERT INTO `web_wholetype` VALUES ('173', '157', '157,173,', '2', '东方头条', '', '', '', '', '0', '1', '1557307187', '0', null);
INSERT INTO `web_wholetype` VALUES ('174', '157', '157,174,', '2', '搜狐网', '', '', '', '', '0', '1', '1557307203', '0', null);
INSERT INTO `web_wholetype` VALUES ('175', '157', '157,175,', '2', '新浪号', '', '', '', '', '0', '1', '1557307219', '0', null);
INSERT INTO `web_wholetype` VALUES ('176', '157', '157,176,', '2', '网易号', '', '', '', '', '0', '1', '1557307234', '0', null);
INSERT INTO `web_wholetype` VALUES ('177', '157', '157,177,', '2', '一点资讯', '', '', '', '', '0', '1', '1557307248', '0', null);
INSERT INTO `web_wholetype` VALUES ('178', '157', '157,178,', '2', 'UC头条', '', '', '', '', '0', '1', '1557307261', '0', null);
INSERT INTO `web_wholetype` VALUES ('179', '157', '157,179,', '2', '腾讯号', '', '', '', '', '0', '1', '1557307275', '0', null);
INSERT INTO `web_wholetype` VALUES ('184', '157', '157,184,', '2', '简书', '', '', '', '', '0', '1', '1557307343', '0', null);
INSERT INTO `web_wholetype` VALUES ('185', '157', '157,185,', '2', '东方财富号', '', '', '', '', '0', '1', '1557307356', '0', null);
INSERT INTO `web_wholetype` VALUES ('186', '157', '157,186,', '2', '中金在线号', '', '', '', '', '0', '1', '1557307372', '0', null);
INSERT INTO `web_wholetype` VALUES ('187', '157', '157,187,', '2', '其他', '', '', '', '', '0', '1', '1557307384', '0', null);
INSERT INTO `web_wholetype` VALUES ('211', '157', '157,211,', '2', '小红书', '', '', '', '', '0', '1', '1557384919', '0', null);
INSERT INTO `web_wholetype` VALUES ('212', '157', '157,212,', '2', '趣头条', '', '', '', '', '0', '1', '1557385030', '0', null);
INSERT INTO `web_wholetype` VALUES ('213', '157', '157,213,', '2', '凤凰号', '', '', '', '', '0', '1', '1557307289', '0', null);
INSERT INTO `web_wholetype` VALUES ('214', '157', '157,214,', '2', '知乎号', '', '', '', '', '0', '1', '1557307303', '0', null);
INSERT INTO `web_wholetype` VALUES ('215', '157', '157,215,', '2', '豆瓣', '', '', '', '', '0', '1', '1557307316', '0', null);
INSERT INTO `web_wholetype` VALUES ('216', '157', '157,216,', '2', '北京时间', '', '', '', '', '0', '1', '1557307330', '0', null);
INSERT INTO `web_wholetype` VALUES ('217', '79', '79,217,', '2', '首页焦点图', '', '', '', '', '0', '1', '1560926160', '0', null);
INSERT INTO `web_wholetype` VALUES ('218', '160', '160,218,', '2', '旅行', '', '', '', '', '0', '1', '1577151403', '0', null);
INSERT INTO `web_wholetype` VALUES ('219', '59', '59,219,', '2', '不限', '', '', '', '', '0', '1', '1578295360', '0', null);
INSERT INTO `web_wholetype` VALUES ('220', '66', '66,220,', '2', '不限', '', '', '', '', '0', '1', '1578296928', '0', null);
INSERT INTO `web_wholetype` VALUES ('221', '0', '221,', '1', '视频自媒体平台类型', '', '', '', '', '0', '1', '1574933145', '0', null);
INSERT INTO `web_wholetype` VALUES ('222', '221', '221,222,', '2', '抖音', '', '', '', '', '1', '1', '1574933162', '0', null);
INSERT INTO `web_wholetype` VALUES ('223', '221', '221,223,', '2', '小红书', '', '', '', '', '2', '1', '1574933176', '0', null);
INSERT INTO `web_wholetype` VALUES ('224', '221', '221,224,', '2', '快手', '', '', '', '', '3', '1', '1574933193', '0', null);
INSERT INTO `web_wholetype` VALUES ('225', '221', '221,225,', '2', '微博', '', '', '', '', '4', '1', '1574933211', '0', null);
INSERT INTO `web_wholetype` VALUES ('226', '221', '221,226,', '2', '绿洲', '', '', '', '', '5', '1', '1574933224', '0', null);
INSERT INTO `web_wholetype` VALUES ('227', '221', '221,227,', '2', '火山', '', '', '', '', '6', '1', '1574933237', '0', null);
INSERT INTO `web_wholetype` VALUES ('228', '221', '221,228,', '2', '微视', '', '', '', '', '7', '1', '1574933249', '0', null);
INSERT INTO `web_wholetype` VALUES ('229', '221', '221,229,', '2', '大众点评网', '', '', '', '', '8', '1', '1574933265', '0', null);
INSERT INTO `web_wholetype` VALUES ('230', '221', '221,230,', '2', '其它', '', '', '', '', '10', '1', '1574933279', '0', null);
INSERT INTO `web_wholetype` VALUES ('231', '0', '231,', '1', '视频自媒体行业分类', '', '', '', '', '0', '1', '1574933312', '0', null);
INSERT INTO `web_wholetype` VALUES ('232', '231', '231,232,', '2', '开箱种草', '', '', '', '', '2', '1', '1574933345', '0', null);
INSERT INTO `web_wholetype` VALUES ('233', '231', '231,233,', '2', '美妆时尚', '', '', '', '', '3', '1', '1574933357', '0', null);
INSERT INTO `web_wholetype` VALUES ('234', '231', '231,234,', '2', '生活居家', '', '', '', '', '4', '1', '1574933366', '0', null);
INSERT INTO `web_wholetype` VALUES ('235', '231', '231,235,', '2', '音乐舞蹈', '', '', '', '', '5', '1', '1574933377', '0', null);
INSERT INTO `web_wholetype` VALUES ('236', '231', '231,236,', '2', '母婴', '', '', '', '', '6', '1', '1574933387', '0', null);
INSERT INTO `web_wholetype` VALUES ('237', '231', '231,237,', '2', '美食', '', '', '', '', '7', '1', '1574933396', '0', null);
INSERT INTO `web_wholetype` VALUES ('238', '231', '231,238,', '2', '旅游', '', '', '', '', '8', '1', '1574933406', '0', null);
INSERT INTO `web_wholetype` VALUES ('239', '231', '231,239,', '2', '搞笑', '', '', '', '', '9', '1', '1574933418', '0', null);
INSERT INTO `web_wholetype` VALUES ('240', '231', '231,240,', '2', '科技汽车', '', '', '', '', '10', '1', '1574933430', '0', null);
INSERT INTO `web_wholetype` VALUES ('241', '231', '231,241,', '2', '综合', '', '', '', '', '1', '1', '1583378535', '0', null);
INSERT INTO `web_wholetype` VALUES ('242', '231', '231,242,', '2', '套餐系列', '', '', '', '', '12', '1', '1583378559', '0', null);
INSERT INTO `web_wholetype` VALUES ('243', '18', '18,243,', '2', '法律频道', '', '', '', '', '0', '1', '1605768812', '0', null);

-- ----------------------------
-- Table structure for web_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `web_withdrawal`;
CREATE TABLE `web_withdrawal` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `MemberID` int(10) DEFAULT '0' COMMENT '会员ID',
  `Realname` varchar(20) DEFAULT NULL,
  `OrderNumber` varchar(64) DEFAULT '' COMMENT '订单号',
  `Paycard` varchar(200) DEFAULT '' COMMENT '收款账户',
  `Money` decimal(10,2) DEFAULT '0.00',
  `CurrentCount` decimal(10,2) DEFAULT '0.00' COMMENT '会员账户当前余额小计',
  `PayState` tinyint(1) unsigned DEFAULT '0' COMMENT '状态0代审核1已支付2拒绝',
  `Remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `PayTime` int(10) unsigned DEFAULT '0' COMMENT '支付时间',
  `Time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`,`Paycard`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现记录表';

-- ----------------------------
-- Records of web_withdrawal
-- ----------------------------
