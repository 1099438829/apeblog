/*
 Navicat Premium Data Transfer

 Source Server         : 本地链接
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ape_blog

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 17/10/2021 23:15:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ape_admin
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin`;
CREATE TABLE `ape_admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) NOT NULL DEFAULT 0 COMMENT '前台用户ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `pwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `role_id` int(4) NOT NULL DEFAULT 0 COMMENT '角色id',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `status` tinyint(1) NOT NULL COMMENT '状态1:正常0冻结',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册ip',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台人员列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin
-- ----------------------------
INSERT INTO `ape_admin` VALUES (1, 1, 'admin', '超级管理员', '14e1b600b1fd579f47433b88e8d85291', '', '/uploads/image/20210215/bc6445679240d4795e279860a6ab34e9.jpeg', 1, '17896852019', 'cfn@leapy.cn', '这家伙很懒，什么也没留下。', 1, NULL, '1', NULL, 1580031132, 1613389670);

-- ----------------------------
-- Table structure for ape_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_auth`;
CREATE TABLE `ape_admin_auth`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '父id',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名',
  `controller` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器名称',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名名称',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `font_family` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字体',
  `spreed` tinyint(1) NULL DEFAULT 0 COMMENT 'spreed',
  `is_check` tinyint(1) NULL DEFAULT 0 COMMENT '是否选中',
  `is_menu` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否菜单',
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `rank` int(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1可用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_auth
-- ----------------------------
INSERT INTO `ape_admin_auth` VALUES (1, '查看日志', '', 8, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin_log/index', 0, 1, NULL, NULL, 1582093161, 1581664102);
INSERT INTO `ape_admin_auth` VALUES (2, '控制台', 'mdi mdi-home', 0, 'admin', 'index', 'main', '', 'ok-icon', 0, 1, 1, '/admin/index/main', 99, 1, NULL, '1', 1582093161, 1624692439);
INSERT INTO `ape_admin_auth` VALUES (4, '账号管理', 'mdi mdi-account', 0, 'admin', 'admin', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin/index', 0, 1, NULL, '2', 1582093161, 1613627431);
INSERT INTO `ape_admin_auth` VALUES (5, '用户管理', '', 4, 'admin', 'admin', 'index', '', NULL, 0, 0, 1, '/admin/admin/index', 0, 1, NULL, '2', 1582093161, 1613627443);
INSERT INTO `ape_admin_auth` VALUES (6, '权限管理', '', 4, 'admin', 'admin_auth', 'index', '', NULL, 0, 0, 1, '/admin/admin_auth/index', 0, 1, NULL, '2', 1582093161, 1613627454);
INSERT INTO `ape_admin_auth` VALUES (7, '角色管理', '', 4, 'admin', 'admin_role', 'index', '', NULL, 0, 0, 1, '/admin/admin_role/index', 0, 1, NULL, '1', 1582093161, 1582263652);
INSERT INTO `ape_admin_auth` VALUES (8, '系统管理', 'mdi mdi-settings', 0, 'admin', 'admin_log', 'index', '', 'ok-icon', 1, 1, 1, '/admin/admin_log/index', 0, 1, NULL, NULL, 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (9, '修改密码', '', 8, 'admin', 'admin', 'pwd', '', NULL, 0, 0, 0, '/admin/admin/pwd', 0, 1, '1', NULL, 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (10, '清理缓存', '', 8, 'admin', 'system_config', 'clearCache', '', NULL, 0, 0, 1, '/admin/system_config/clearCache', 0, 1, '1', '1', 1582093658, 1593407914);
INSERT INTO `ape_admin_auth` VALUES (11, '网站配置', '', 8, 'admin', 'system_config', 'base', '', NULL, 0, 0, 1, '/admin/system_config/base', 0, 1, '1', '1', 1582266348, 1582781624);
INSERT INTO `ape_admin_auth` VALUES (12, '开发者配置', '', 8, 'admin', 'system_config_tab', 'index', '', NULL, 0, 0, 1, '/admin/system_config_tab/index', 0, 1, '1', '1', 1582266439, 1590149680);
INSERT INTO `ape_admin_auth` VALUES (13, '后台登录', '', 8, 'admin', 'login', 'login', '', NULL, 0, 0, 0, '/admin/login/login', 0, 1, '1', NULL, 1582707133, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (14, '上传配置', '', 8, 'admin', 'system_config', 'upload', '', NULL, 0, 0, 0, '/admin/system_config/upload', 0, 1, '1', NULL, 1582781658, 1582781667);
INSERT INTO `ape_admin_auth` VALUES (15, '短信配置', '', 8, 'admin', 'system_config', 'sms', '', NULL, 0, 0, 0, '/admin/system_config/sms', 0, 1, '1', NULL, 1582781757, 1582781796);
INSERT INTO `ape_admin_auth` VALUES (16, '邮件配置', '', 8, 'admin', 'system_config', 'email', '', NULL, 0, 0, 0, '/admin/system_config/email', 0, 1, '1', NULL, 1582781787, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (17, '内容管理', 'mdi mdi-file-document-box', 0, 'admin', 'content', 'index', '', NULL, 0, 0, 1, '/admin/content/index', 0, 1, '1', '1', 1612973864, 1613400986);
INSERT INTO `ape_admin_auth` VALUES (18, '文章列表', '', 17, 'admin', 'article', 'index', '', NULL, 0, 0, 1, '/admin/article/index', 0, 1, '1', '1', 1612973911, 1613401778);
INSERT INTO `ape_admin_auth` VALUES (19, '栏目分类', '', 17, 'admin', 'category', 'index', '', NULL, 0, 0, 1, '/admin/category/index', 0, 1, '1', '1', 1612973967, 1613401827);
INSERT INTO `ape_admin_auth` VALUES (21, '留言管理', '', 27, 'admin', 'message', 'index', '', NULL, 0, 0, 1, '/admin/message/index', 0, 1, '1', '1', 1612974123, 1613449203);
INSERT INTO `ape_admin_auth` VALUES (23, '分类管理', '', 22, 'admin', 'category', 'index', '', NULL, 0, 0, 1, '/admin/category/index', 0, 1, '1', NULL, 1613390173, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (24, '幻灯片管理', '', 27, 'admin', 'slides', 'index', '', NULL, 0, 0, 1, '/admin/slides/index', 0, 1, '1', '1', 1613390220, 1613449217);
INSERT INTO `ape_admin_auth` VALUES (25, '文章管理', '', 22, 'admin', 'article', 'index', '', NULL, 0, 0, 1, '/admin/article/index', 0, 1, '1', NULL, 1613390289, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (26, '文章回收站', '', 22, 'admin', 'article', 'recovery', '', NULL, 0, 0, 1, '/admin/article/recovery', 0, 1, '1', NULL, 1613390366, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (27, '活动管理', 'mdi mdi-image-multiple', 0, 'admin', 'operate', 'index', '', NULL, 0, 0, 1, '/admin/operate/index', 0, 1, '1', '1', 1613391146, 1613449194);
INSERT INTO `ape_admin_auth` VALUES (28, '会员管理', 'mdi mdi-account-multiple', 0, 'admin', 'user', 'index', '', NULL, 0, 0, 1, '/admin/user/index', 0, 1, '1', NULL, 1613400082, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (29, '会员管理', '', 28, 'admin', 'user', 'index', '', NULL, 0, 0, 1, '/admin/user/index', 0, 1, '1', NULL, 1613400129, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (31, '主题管理', 'mdi mdi-store', 0, 'admin', 'theme', 'index', '', NULL, 0, 0, 1, '/admin/theme/index', 0, 1, '1', NULL, 1613400314, 1620610846);
INSERT INTO `ape_admin_auth` VALUES (32, '主题管理', '', 31, 'admin', 'theme', 'index', '', NULL, 0, 0, 1, '/admin/theme/index', 0, 1, '1', NULL, 1613400349, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (33, '主题商店', '', 31, 'admin', 'theme', 'store', '', NULL, 0, 0, 1, '/admin/theme/store', 0, 1, '1', '1', 1613400389, 1613400404);
INSERT INTO `ape_admin_auth` VALUES (34, '友链管理', 'mdi mdi-account-card-details', 0, 'admin', 'friendlink', 'index', '', NULL, 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', NULL, 1613400510, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (35, '友链列表', '', 34, 'admin', 'friendlink', 'index', '', NULL, 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', NULL, 1613400539, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (37, '邀请码管理', '', 27, 'admin', 'invitation', 'index', '', NULL, 0, 0, 1, '/admin/invitation/index', 0, 1, '1', '1', 1613400778, 1613449225);
INSERT INTO `ape_admin_auth` VALUES (38, '广告管理', 'mdi mdi-bulletin-board', 27, 'admin', 'poster', 'index', '', NULL, 0, 0, 1, '/admin/poster/index', 0, 1, '1', '1', 1627293150, 1627293165);

-- ----------------------------
-- Table structure for ape_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_log`;
CREATE TABLE `ape_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `admin_id` int(10) NOT NULL COMMENT '操作人id',
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人名字',
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名',
  `controller` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器名',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'User-Agent',
  `create_time` int(10) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for ape_admin_notify
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_notify`;
CREATE TABLE `ape_admin_notify`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `aid` int(10) NOT NULL COMMENT '管理员ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `from` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息来源 谁发的',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型 timer:定时器 system:系统',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转路径 不填写时自动判断',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_notify
-- ----------------------------

-- ----------------------------
-- Table structure for ape_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_role`;
CREATE TABLE `ape_admin_role`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '角色状态',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `auth` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `tree_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'treedata',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_role
-- ----------------------------
INSERT INTO `ape_admin_role` VALUES (1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,17,18,19,27,21,24,37,38,28,29,31,32,33,34,35', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,17,18,19,27,21,24,37,38,28,29,31,32,33,34,35', 0, 1, '1', '1', 1580031132, 1627296049);

-- ----------------------------
-- Table structure for ape_advert
-- ----------------------------
DROP TABLE IF EXISTS `ape_advert`;
CREATE TABLE `ape_advert`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '专区名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '专区banner图',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '专区banner跳转url',
  `position` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '专区位置  默认 1 1 顶部页签  2 右侧边栏',
  `user_id` int(19) NULL DEFAULT NULL COMMENT '操作人id',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `sort` int(2) NULL DEFAULT 0 COMMENT '权重',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '是否启用 0不启用 1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '职位专区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_advert
-- ----------------------------
INSERT INTO `ape_advert` VALUES (17, '粽情端午', '/uploads/images/20210726\\14c25515c377028f274c93f79b7d11bd.jpg', 'https://hewa.cn/mainSwiperContent.html?swiperId=s014#/', 1, 32, '2021-05-31 11:01:58', '2021-07-26 20:12:19', 0, 1);
INSERT INTO `ape_advert` VALUES (18, '用友专区', '/uploads/images/20210607\\e7f65d07dda7d50d3464349ead6a5eb1.png', 'https://hewa.cn/recommend.html?codes=40d701c08594baf68833ae14f28f00e0', 2, 61, '2021-06-03 10:54:13', '2021-08-13 00:52:10', 0, 1);
INSERT INTO `ape_advert` VALUES (19, '胖达', '/uploads/images/20210606\\1254252dcceb7a92a18dbe71e8a51ee8.jpg', 'https://hewa.cn/recommend.html?codes=4295911b01a686aafb717f0ea4abab9b', 2, 61, '2021-07-05 15:19:18', '2021-08-13 00:52:15', 0, 1);

-- ----------------------------
-- Table structure for ape_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment`;
CREATE TABLE `ape_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `cid` int(2) NOT NULL COMMENT '所属目录',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件地址',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `mime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mime',
  `size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小',
  `storage` int(2) NULL DEFAULT NULL COMMENT '存储方式1本地2腾讯云',
  `create_time` int(10) NOT NULL COMMENT '上传时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment
-- ----------------------------
INSERT INTO `ape_attachment` VALUES (1, 2, '816417fae9785c2efa62bdb96327dc79.jpg', '/uploads/images/20210606\\816417fae9785c2efa62bdb96327dc79.jpg', 'images', 'image/jpeg', '1919593', 1, 1622992555, 1622992555);
INSERT INTO `ape_attachment` VALUES (2, 2, '045f1d01edbd194f80f0b9fb28e35844.jpg', '/uploads/images/20210606\\045f1d01edbd194f80f0b9fb28e35844.jpg', 'images', 'image/jpeg', '4766893', 1, 1622992566, 1622992566);
INSERT INTO `ape_attachment` VALUES (3, 0, '1254252dcceb7a92a18dbe71e8a51ee8.jpg', '/uploads/images/20210606\\1254252dcceb7a92a18dbe71e8a51ee8.jpg', 'images', 'image/jpeg', '560215', 1, 1622994431, 1622994431);
INSERT INTO `ape_attachment` VALUES (4, 0, 'e7f65d07dda7d50d3464349ead6a5eb1.png', '/uploads/images/20210607\\e7f65d07dda7d50d3464349ead6a5eb1.png', 'images', 'image/png', '387019', 1, 1622995792, 1622995792);
INSERT INTO `ape_attachment` VALUES (5, 3, '96125961627bc5768065fdb4ed7cded1.jpg', '/uploads/images/20210726\\96125961627bc5768065fdb4ed7cded1.jpg', 'images', 'image/jpeg', '21029', 1, 1627301501, 1627301501);
INSERT INTO `ape_attachment` VALUES (6, 3, '14c25515c377028f274c93f79b7d11bd.jpg', '/uploads/images/20210726\\14c25515c377028f274c93f79b7d11bd.jpg', 'images', 'image/jpeg', '1602752', 1, 1627301511, 1627301511);

-- ----------------------------
-- Table structure for ape_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment_category`;
CREATE TABLE `ape_attachment_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目录名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属附件类型',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment_category
-- ----------------------------
INSERT INTO `ape_attachment_category` VALUES (1, 0, '用户头像', 'images', '1', NULL, 1613799617, 1613799617);
INSERT INTO `ape_attachment_category` VALUES (2, 0, 'banner', 'images', '1', NULL, 1622992546, 1622992546);
INSERT INTO `ape_attachment_category` VALUES (3, 0, '广告', 'images', '1', NULL, 1627301484, 1627301484);

-- ----------------------------
-- Table structure for ape_comment
-- ----------------------------
DROP TABLE IF EXISTS `ape_comment`;
CREATE TABLE `ape_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论者姓名',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论者邮箱',
  `url` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论者网站',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论者内容',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '评论者ID',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '评论谁',
  `create_time` int(11) NOT NULL COMMENT '评论时间',
  `document_id` int(11) NOT NULL COMMENT '文章ID',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0显示 1不显示',
  `update_time` int(11) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_comment
-- ----------------------------
INSERT INTO `ape_comment` VALUES (1, 'k', '1221245565@qq.com', '', 'jhklh', 0, 0, 1585573775, 1, 0, 0);
INSERT INTO `ape_comment` VALUES (2, '1', '22222@qq.com', '', '1', 0, 0, 1597918464, 1, 0, 0);
INSERT INTO `ape_comment` VALUES (3, '1', 'fds@qq.com', '', 'ew', 0, 0, 1597918488, 1, 0, 0);
INSERT INTO `ape_comment` VALUES (4, '驱蚊', '我去饿', '我去饿', '请问企鹅   驱蚊', 0, 0, 1634483307, 2, 0, 1634483307);
INSERT INTO `ape_comment` VALUES (5, '看看', '1099438829@qq.com', 'www.baidu.com', '啊实打实', 0, 0, 1634483642, 1, 0, 1634483642);

-- ----------------------------
-- Table structure for ape_document
-- ----------------------------
DROP TABLE IF EXISTS `ape_document`;
CREATE TABLE `ape_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT '所属分类',
  `cover_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '封面',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'article' COMMENT '内容类型',
  `theme` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主题模板',
  `is_recommend` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_top` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `is_hot` tinyint(4) NULL DEFAULT 0 COMMENT '是否热门',
  `link_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '外链',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `view` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览量',
  `tags` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `abstract` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '摘要',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章密码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_status`(`category_id`, `status`) USING BTREE,
  INDEX `idx_status_type_pid`(`status`, `uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document
-- ----------------------------
INSERT INTO `ape_document` VALUES (1, 1, '超级管理员', '特种兵之霹雳火', 3, '/uploads/images/20210606\\1254252dcceb7a92a18dbe71e8a51ee8.jpg', 'article', '', 1, 1, 1, '', 1, 105, '111', '11', '', '', 99, 1622994445, 1624693478, 1, NULL);
INSERT INTO `ape_document` VALUES (2, 1, '超级管理员', '111111111111111', 3, '/uploads/images/20210607\\e7f65d07dda7d50d3464349ead6a5eb1.png', 'article', '', 1, 1, 1, '', 1, 232, '', '', '', '', 99, 1622995800, 1624693479, 1, NULL);

-- ----------------------------
-- Table structure for ape_document_article
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_article`;
CREATE TABLE `ape_document_article`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_article
-- ----------------------------
INSERT INTO `ape_document_article` VALUES (2, '<p>啊水水顶顶顶顶顶大师的帆帆帆帆帆帆帆帆 对方灌灌灌灌灌灌灌灌灌灌灌灌</p>');
INSERT INTO `ape_document_article` VALUES (1, '<ul style=\"list-style-type: square;\">\r\n<li style=\"text-align: left;\"><sub><span style=\"text-decoration: line-through;\">2131312</span></sub></li>\r\n</ul>\r\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n<td style=\"width: 12.5%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>');

-- ----------------------------
-- Table structure for ape_document_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_category`;
CREATE TABLE `ape_document_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `en_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类图标',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '分类类别：0列表，1单篇，2链接',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `meta_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分类模板',
  `link_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外链',
  `view` int(10) NOT NULL DEFAULT 0 COMMENT '访问数',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_category
-- ----------------------------
INSERT INTO `ape_document_category` VALUES (3, '编程资料', '', '', 1, 0, 0, '', '', '', 'list_default.html', '', 92, 1, 1617634005, 1617634005, 1);

-- ----------------------------
-- Table structure for ape_document_category_content
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_category_content`;
CREATE TABLE `ape_document_category_content`  (
  `id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_category_content
-- ----------------------------
INSERT INTO `ape_document_category_content` VALUES (3, '');

-- ----------------------------
-- Table structure for ape_document_product
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_product`;
CREATE TABLE `ape_document_product`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `piclist` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品图片集',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '产品价格',
  `market_price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_document_product
-- ----------------------------

-- ----------------------------
-- Table structure for ape_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `ape_friend_link`;
CREATE TABLE `ape_friend_link`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) NOT NULL DEFAULT 1 COMMENT '添加者',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接网站名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片连接的图片',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` int(10) NOT NULL DEFAULT 1 COMMENT '状态 0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_friend_link
-- ----------------------------
INSERT INTO `ape_friend_link` VALUES (1, 1, '源码云', 'www.apecloud.cn', '/uploads/images/20210606\\816417fae9785c2efa62bdb96327dc79.jpg', '猿码云', 99, 1626661946, 1626661957, 1);
INSERT INTO `ape_friend_link` VALUES (2, 1, '百度', 'www.baidu.com', '', '', 0, 1634460306, 1634460306, 0);

-- ----------------------------
-- Table structure for ape_invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `ape_invitation_code`;
CREATE TABLE `ape_invitation_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请码',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0未使用 1 使用',
  `user` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用用户',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请码' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_invitation_code
-- ----------------------------
INSERT INTO `ape_invitation_code` VALUES (14, 'demo8038224376', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (15, 'demo8038227462', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (16, 'demo8038226823', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (17, 'demo8038229091', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (18, 'demo8038224412', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (19, 'demo8038226410', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (20, 'demo8038225806', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (21, 'demo8038224342', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (22, 'demo8038227448', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (23, 'demo8038223733', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (24, 'demo8038227281', 0, '1', 1613803822, 1613803822);
INSERT INTO `ape_invitation_code` VALUES (25, 'demo8038227782', 0, '1', 1613803822, 1613803822);

-- ----------------------------
-- Table structure for ape_message_form
-- ----------------------------
DROP TABLE IF EXISTS `ape_message_form`;
CREATE TABLE `ape_message_form`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `is_reply` int(10) NULL DEFAULT 0 COMMENT '回复状态 0未回复',
  `reply_uid` int(10) NULL DEFAULT NULL COMMENT '回复人',
  `reply_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `status` int(10) NOT NULL DEFAULT 1,
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_message_form
-- ----------------------------

-- ----------------------------
-- Table structure for ape_pv_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_pv_log`;
CREATE TABLE `ape_pv_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `time` int(10) NOT NULL DEFAULT 0 COMMENT '时间段',
  `view` int(10) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_pv_log
-- ----------------------------

-- ----------------------------
-- Table structure for ape_slides
-- ----------------------------
DROP TABLE IF EXISTS `ape_slides`;
CREATE TABLE `ape_slides`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动url',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT 'banner类型',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '幻灯片' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_slides
-- ----------------------------
INSERT INTO `ape_slides` VALUES (1, 'ceshi', '/uploads/images/20210606\\816417fae9785c2efa62bdb96327dc79.jpg', 'http://apeblog.io/', NULL, 1622992131, 1622992572, 1, 0);
INSERT INTO `ape_slides` VALUES (2, 'ceshi2', '/uploads/images/20210606\\045f1d01edbd194f80f0b9fb28e35844.jpg', '/', NULL, 1622992586, 1622992586, 1, 0);

-- ----------------------------
-- Table structure for ape_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config`;
CREATE TABLE `ape_system_config`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tab_id` int(8) NULL DEFAULT NULL COMMENT '分组id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题名称',
  `form_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单名称',
  `form_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单类型',
  `tag_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签类型',
  `upload_type` tinyint(1) NULL DEFAULT NULL COMMENT '上传配置',
  `param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config
-- ----------------------------
INSERT INTO `ape_system_config` VALUES (1, 1, '网站标题', 'title', 'text', 'input', 0, '', '猿博', '', 90, 1, 1, '1', '1', 1582792265, 1583855342);
INSERT INTO `ape_system_config` VALUES (2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', '/uploads/images/20210815\\d5972f3f67ce074f73150eebce6fb0d1.jpg', '', 89, 1, 1, '1', NULL, 1582793160, 1582792265);
INSERT INTO `ape_system_config` VALUES (3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '猿博系统', '', 88, 1, 1, '1', NULL, 1582793221, 1582792265);
INSERT INTO `ape_system_config` VALUES (4, 1, '站点描述', 'description', 'text', 'input', 0, '', '猿博系统', '', 87, 1, 1, '1', NULL, 1582793248, 1582792265);
INSERT INTO `ape_system_config` VALUES (5, 1, '网站作者', 'author', 'text', 'input', 0, '', '木子的忧伤', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (6, 1, '站点logo', 'logo', 'file', 'input', 0, '', '/uploads/files/20210405\\60b557b38a20dc46b4ae1514e7a38fb4.jpeg', '', 85, 1, 1, '1', '1', 1582793393, 1582793700);
INSERT INTO `ape_system_config` VALUES (7, 1, '版权信息', 'copyright', 'text', 'input', 0, '', 'Power by LEARY.', '', 84, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (8, 1, '备案信息', 'icp', 'text', 'textarea', 0, '', '蜀ICP备16029882号-1蜀ICP备16029882号', '', 83, 1, 1, '1', '1', 1582793563, 1583375542);
INSERT INTO `ape_system_config` VALUES (52, 1, '网站域名', 'domain', 'text', 'input', 0, '', 'http://apeblog.io', '', 0, 1, 1, '1', NULL, 1588858018, 1582792265);
INSERT INTO `ape_system_config` VALUES (65, 1, '网站统计代码', 'statistics', 'text', 'textarea', 0, '', '', '', 84, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (66, 1, '主题信息', 'web_template', 'select', 'input', 0, 'default=>默认\nnew=>新bolg', 'default', '', 83, 1, 1, '1', '1', 1582793563, 1620610858);
INSERT INTO `ape_system_config` VALUES (67, 1, '关闭网站', 'web_close', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (68, 1, '网站统计', 'web_statistics', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (69, 1, '开始伪静态', 'web_rewrite', 'radio', 'input', 0, '1=>开启\n2=>关闭', '1', '', 83, 1, 1, '1', NULL, 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (70, 1, '联系地址', 'web_contact_add', 'text', 'input', 0, '', '北京市昌平区', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (71, 1, '联系电话', 'web_contact_tel', 'text', 'input', 0, '', '13500000000', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (72, 1, '联系QQ', 'web_contact_qq', 'text', 'input', 0, '', '11222', '', 86, 1, 1, '1', NULL, 1582793305, 1582792265);

-- ----------------------------
-- Table structure for ape_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config_tab`;
CREATE TABLE `ape_system_config_tab`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config_tab
-- ----------------------------
INSERT INTO `ape_system_config_tab` VALUES (1, '基础配置', 99, 1, '1', '1', 1582784937, 1583385482);
INSERT INTO `ape_system_config_tab` VALUES (2, '上传配置', 98, 1, '1', '1', 1582785701, 1583385489);

-- ----------------------------
-- Table structure for ape_url_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_url_log`;
CREATE TABLE `ape_url_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url 受访的页面url',
  `pv` int(10) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_url_log
-- ----------------------------

-- ----------------------------
-- Table structure for ape_user
-- ----------------------------
DROP TABLE IF EXISTS `ape_user`;
CREATE TABLE `ape_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '里程密' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册IP地址',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0启用 1禁用',
  `is_admin` int(11) NOT NULL DEFAULT 0 COMMENT '是否是管理员',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_user
-- ----------------------------

-- ----------------------------
-- Table structure for ape_uv_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_uv_log`;
CREATE TABLE `ape_uv_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '访问ip',
  `time` int(10) NOT NULL DEFAULT 0 COMMENT '时间',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_uv_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
