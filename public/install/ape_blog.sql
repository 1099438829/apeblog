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

 Date: 14/07/2022 00:12:43
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
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `realname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `role_id` int(4) NOT NULL DEFAULT 0 COMMENT '角色id',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态1:正常0冻结',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册ip',
  `create_user` int(32) NOT NULL DEFAULT 0 COMMENT '添加人',
  `update_user` int(32) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_email_tel`(`username`, `tel`, `email`) USING BTREE COMMENT '用户名'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台人员列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin
-- ----------------------------
INSERT INTO `ape_admin` VALUES (1, 1, 'admin', '超级管理员', '4760f3fbfe9e42ace8bea27edfb85d65', '超级管理员', '/upload/image/20220228/ca46bd04e1d32911de549862f6db1b8e.png', 1, '13500000000', '123@qq.com', '这家伙很懒，什么也没留下', 1, '', 1, 1, 1642090317, 1646028509);

-- ----------------------------
-- Table structure for ape_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_auth`;
CREATE TABLE `ape_admin_auth`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '父id',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法名名称',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `font_family` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字体',
  `spreed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'spreed',
  `is_check` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否选中',
  `is_menu` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否菜单',
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `rank` int(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1可用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_auth
-- ----------------------------
INSERT INTO `ape_admin_auth` VALUES (1, '查看日志', '', 8, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin_log/index', 0, 1, '', '', 1582093161, 1581664102);
INSERT INTO `ape_admin_auth` VALUES (2, '控制台', 'mdi mdi-home', 0, 'admin', 'index', 'main', '', 'ok-icon', 0, 1, 1, '/admin/index/main', 99, 1, '', '1', 1582093161, 1624692439);
INSERT INTO `ape_admin_auth` VALUES (4, '账号管理', 'mdi mdi-account', 0, 'admin', 'admin', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin/index', 0, 1, '', '2', 1582093161, 1613627431);
INSERT INTO `ape_admin_auth` VALUES (5, '用户管理', '', 4, 'admin', 'admin', 'index', '', '', 0, 0, 1, '/admin/admin/index', 0, 1, '', '2', 1582093161, 1613627443);
INSERT INTO `ape_admin_auth` VALUES (6, '权限管理', '', 4, 'admin', 'admin_auth', 'index', '', '', 0, 0, 1, '/admin/admin_auth/index', 0, 1, '', '2', 1582093161, 1613627454);
INSERT INTO `ape_admin_auth` VALUES (7, '角色管理', '', 4, 'admin', 'admin_role', 'index', '', '', 0, 0, 1, '/admin/admin_role/index', 0, 1, '', '1', 1582093161, 1582263652);
INSERT INTO `ape_admin_auth` VALUES (8, '系统管理', 'mdi mdi-settings', 0, 'admin', 'admin_log', 'index', '', 'ok-icon', 1, 1, 1, '/admin/admin_log/index', 0, 1, '', '', 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (9, '修改密码', '', 8, 'admin', 'admin', 'pwd', '', '', 0, 0, 0, '/admin/admin/pwd', 0, 1, '1', '', 1582093161, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (10, '清理缓存', '', 8, 'admin', 'system_config', 'clearCache', '', '', 0, 0, 1, '/admin/system_config/clearCache', 0, 1, '1', '1', 1582093658, 1593407914);
INSERT INTO `ape_admin_auth` VALUES (11, '网站配置', '', 8, 'admin', 'system_config', 'base', '', '', 0, 0, 1, '/admin/system_config/base', 0, 1, '1', '1', 1582266348, 1582781624);
INSERT INTO `ape_admin_auth` VALUES (12, '开发者配置', '', 8, 'admin', 'system_config_tab', 'index', '', '', 0, 0, 1, '/admin/system_config_tab/index', 0, 1, '1', '1', 1582266439, 1590149680);
INSERT INTO `ape_admin_auth` VALUES (13, '后台登录', '', 8, 'admin', 'login', 'login', '', '', 0, 0, 0, '/admin/login/login', 0, 1, '1', '', 1582707133, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (14, '上传配置', '', 8, 'admin', 'system_config', 'upload', '', '', 0, 0, 0, '/admin/system_config/upload', 0, 1, '1', '', 1582781658, 1582781667);
INSERT INTO `ape_admin_auth` VALUES (15, '短信配置', '', 8, 'admin', 'system_config', 'sms', '', '', 0, 0, 0, '/admin/system_config/sms', 0, 1, '1', '', 1582781757, 1582781796);
INSERT INTO `ape_admin_auth` VALUES (16, '邮件配置', '', 8, 'admin', 'system_config', 'email', '', '', 0, 0, 0, '/admin/system_config/email', 0, 1, '1', '', 1582781787, 1655998398);
INSERT INTO `ape_admin_auth` VALUES (17, '内容管理', 'mdi mdi-file-document-box', 0, 'admin', 'content', 'index', '', '', 0, 0, 1, '/admin/content/index', 0, 1, '1', '1', 1612973864, 1613400986);
INSERT INTO `ape_admin_auth` VALUES (18, '文章管理', '', 17, 'admin', 'article', 'index', '', '', 0, 0, 1, '/admin/article/index', 0, 1, '1', '1', 1612973911, 1613401778);
INSERT INTO `ape_admin_auth` VALUES (19, '栏目分类', '', 17, 'admin', 'category', 'index', '', '', 0, 0, 1, '/admin/category/index', 0, 1, '1', '1', 1612973967, 1613401827);
INSERT INTO `ape_admin_auth` VALUES (20, '运营管理', 'mdi mdi-image-multiple', 0, 'admin', 'operate', 'index', '', '', 0, 0, 1, '/admin/operate/index', 0, 1, '1', '1', 1613391146, 1656866297);
INSERT INTO `ape_admin_auth` VALUES (21, '留言管理', '', 20, 'admin', 'message', 'index', '', '', 0, 0, 1, '/admin/message/index', 0, 1, '1', '1', 1612974123, 1613449203);
INSERT INTO `ape_admin_auth` VALUES (22, '邀请码管理', '', 20, 'admin', 'invitation', 'index', '', '', 0, 0, 1, '/admin/invitation/index', 0, 1, '1', '1', 1613400778, 1613449225);
INSERT INTO `ape_admin_auth` VALUES (23, '轮播广告', 'mdi mdi-bulletin-board', 20, 'admin', 'advert', 'index', '', '', 0, 0, 1, '/admin/advert/index', 0, 1, '1', '1', 1627293150, 1655827431);
INSERT INTO `ape_admin_auth` VALUES (24, '会员管理', 'mdi mdi-account-multiple', 0, 'admin', 'user', 'index', '', '', 0, 0, 1, '/admin/user/index', 0, 1, '1', '', 1613400082, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (25, '会员管理', '', 24, 'admin', 'user', 'index', '', '', 0, 0, 1, '/admin/user/index', 0, 1, '1', '', 1613400129, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (26, '主题管理', 'mdi mdi-store', 0, 'admin', 'theme', 'index', '', '', 0, 0, 1, '/admin/theme/index', 0, 1, '1', '', 1613400314, 1620610846);
INSERT INTO `ape_admin_auth` VALUES (27, '主题管理', '', 26, 'admin', 'theme', 'index', '', '', 0, 0, 1, '/admin/theme/index', 0, 1, '1', '', 1613400349, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (28, '主题商店', '', 26, 'admin', 'theme', 'store', '', '', 0, 0, 0, '/admin/theme/store', 0, 1, '1', '1', 1613400389, 1642946978);
INSERT INTO `ape_admin_auth` VALUES (29, '友链管理', 'mdi mdi-account-card-details', 0, 'admin', 'friend_link', 'index', '', '', 0, 0, 1, '/admin/friend_link/index', 0, 1, '1', '1', 1613400510, 1642947636);
INSERT INTO `ape_admin_auth` VALUES (30, '友链列表', '', 34, 'admin', 'friendlink', 'index', '', '', 0, 0, 1, '/admin/friendlink/index', 0, 1, '1', '', 1613400539, 1582093161);
INSERT INTO `ape_admin_auth` VALUES (31, '数据库管理', '', 8, 'admin', 'databases', 'index', '', '', 0, 0, 1, '/admin/databases/index', 0, 1, '1', '', 1635572569, 1635572671);
INSERT INTO `ape_admin_auth` VALUES (32, '友链管理', '', 29, 'admin', 'friend_link', 'index', '', '', 0, 0, 1, '/admin/friend_link/index', 0, 1, '1', '1', 1642089882, 1642947643);
INSERT INTO `ape_admin_auth` VALUES (33, '导航管理', '', 20, 'admin', 'nav', 'index', '', '', 0, 0, 1, '/admin/nav/index', 0, 1, '1', '1', 1655827396, 1656866278);
INSERT INTO `ape_admin_auth` VALUES (35, '单页面', '', 17, 'admin', 'page', 'index', '', '', 0, 0, 1, '/admin/page/index', 0, 1, '1', '', 1656866463, 0);

-- ----------------------------
-- Table structure for ape_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_admin_log`;
CREATE TABLE `ape_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '操作人id',
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人名字',
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ip',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '操作时间',
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
  `aid` int(10) NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `from` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息来源 谁发的',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '消息类型 timer:定时器 system:系统',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '跳转路径 不填写时自动判断',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
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
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `auth` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `tree_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'treedata',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_admin_role
-- ----------------------------
INSERT INTO `ape_admin_role` VALUES (1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,31,17,18,19,35,20,21,22,23,33,24,25,26,27,28,29,32', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16,31,17,18,19,35,20,21,22,23,33,24,25,26,27,28,29,32', 0, 1, '1', '1', 1580031132, 1656866470);
INSERT INTO `ape_admin_role` VALUES (2, 0, '普通用户', '17,18,19,20,21,22,23,26,27,28,29,32', '17,18,19,20,21,22,23,26,27,28,29,32', 0, 1, '1', '1', 1641393643, 1642089936);

-- ----------------------------
-- Table structure for ape_advert
-- ----------------------------
DROP TABLE IF EXISTS `ape_advert`;
CREATE TABLE `ape_advert`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用-1禁用',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '幻灯片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ape_advert
-- ----------------------------
INSERT INTO `ape_advert` VALUES (1, '主页banner', 'INDEX_SLIDE', 1, '主页banner', 0, 1657446234);
INSERT INTO `ape_advert` VALUES (2, '主页推荐位', 'INDEX_RECOMMEND', 1, '主页推荐位', 1657446292, 0);
INSERT INTO `ape_advert` VALUES (3, '主页右侧广告位', 'INDEX_RIGHT_AD', 1, '主页右侧广告位', 1657446330, 0);
INSERT INTO `ape_advert` VALUES (4, '文章banner', 'DOCUMENT_BANNER', 1, '文章banner', 1657446359, 0);
INSERT INTO `ape_advert` VALUES (5, '文章右侧广告位', 'DOCUMENT_RIGHT_AD', 1, '文章右侧广告位', 1657446390, 0);

-- ----------------------------
-- Table structure for ape_advert_info
-- ----------------------------
DROP TABLE IF EXISTS `ape_advert_info`;
CREATE TABLE `ape_advert_info`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `cover_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'banner图',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'banner跳转url',
  `advert_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '轮播组id',
  `user_id` int(19) NOT NULL DEFAULT 0 COMMENT '操作人id',
  `sort` int(2) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否启用 0不启用 1启用',
  `create_time` int(10) NOT NULL DEFAULT 0,
  `update_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告专区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_advert_info
-- ----------------------------

-- ----------------------------
-- Table structure for ape_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment`;
CREATE TABLE `ape_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `cid` int(2) NOT NULL COMMENT '所属目录',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件地址',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `mime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime',
  `size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '大小',
  `storage` int(2) NOT NULL DEFAULT 1 COMMENT '存储方式1本地2腾讯云',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '上传时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for ape_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_attachment_category`;
CREATE TABLE `ape_attachment_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '目录名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属附件类型',
  `create_user` int(10) NOT NULL DEFAULT 0 COMMENT '添加人',
  `update_user` int(10) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_attachment_category
-- ----------------------------

-- ----------------------------
-- Table structure for ape_comment
-- ----------------------------
DROP TABLE IF EXISTS `ape_comment`;
CREATE TABLE `ape_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论者姓名',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `url` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论者网站',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论者内容',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '评论者ID',
  `cover_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论头像地址',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '评论谁',
  `document_id` int(11) NOT NULL DEFAULT 0 COMMENT '文章ID',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0不显示 1显示',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '评论时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ape_document
-- ----------------------------
DROP TABLE IF EXISTS `ape_document`;
CREATE TABLE `ape_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属分类',
  `cover_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'article' COMMENT '内容类型',
  `theme` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主题模板',
  `is_recommend` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_top` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `is_hot` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否热门',
  `link_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '外链',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `view` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览量',
  `tags` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标识',
  `abstract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '摘要',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_date` date NOT NULL COMMENT '创建日期',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE,
  INDEX `idx_category_status`(`category_id`, `status`) USING BTREE,
  INDEX `idx_status_type_pid`(`status`, `uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_document
-- ----------------------------
INSERT INTO `ape_document` VALUES (1, 'about', 1, '超级管理员', '关于', 0, '/storage/image/20220710/4f392482c34a194fe8e7fb9b6da95ae9.png', 'page', 'article.html', 0, 0, 0, '', 1, 0, '', '源码云BLOG源码云博客是一款基于ThinkPHP6 + bootstrap+ MySql打造的，简单实用的开源免费的博客系统。各管理模块，操作简单，具有简约，易用，访问统计，内存占用低等特点，系统易', '', '', 99, '2022-07-10', 1657464554, 1657464554, 1, '');

-- ----------------------------
-- Table structure for ape_document_article
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_article`;
CREATE TABLE `ape_document_article`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_document_article
-- ----------------------------

-- ----------------------------
-- Table structure for ape_document_category
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_category`;
CREATE TABLE `ape_document_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `alias` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标志',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类图标',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `meta_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类模板',
  `view` int(10) NOT NULL DEFAULT 0 COMMENT '访问数',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE COMMENT '别名URl',
  INDEX `t_p_s`(`title`, `pid`, `status`) USING BTREE COMMENT '标题'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_document_category
-- ----------------------------

-- ----------------------------
-- Table structure for ape_document_page
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_page`;
CREATE TABLE `ape_document_page`  (
  `id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类内容表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_document_page
-- ----------------------------
INSERT INTO `ape_document_page` VALUES (1, '<h4 id=\"h4--blog\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; color: rgb(51, 51, 51); margin: 10px 0px 0px; font-size: 14px; letter-spacing: normal; padding: 0px;\">源码云BLOG</h4><h4 id=\"h4--blog\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; color: rgb(51, 51, 51); margin: 10px 0px 0px; font-size: 14px; letter-spacing: normal; padding: 0px;\">源码云博客是一款基于ThinkPHP6 + bootstrap+ MySql打造的，简单实用的开源免费的博客系统。各管理模块，操作简单，具有简约，易用，访问统计，内存占用低等特点，系统易于功能扩展，代码维护，方便二次开发。可以用来做个人博客，工作室官网，自媒体官网等网站，二次开发之后也可以作为资讯、展品展示等门户网站。</h4><h4 id=\"h4--blog-\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; color: rgb(51, 51, 51); margin: 10px 0px 0px; font-size: 14px; letter-spacing: normal; padding: 0px;\"><a name=\"勾股BLOG链接\" class=\"reference-link\" style=\"color: rgb(24, 106, 242); transition-property: all; font-style: italic;\"></a><span class=\"header-link octicon octicon-link\"></span>勾股BLOG链接</h4><ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 16px;\"><li style=\"padding: 0px; margin: 0px 0px 0px 20px; list-style: initial;\">博客：<a href=\"https://blog.apecloud.cn/\" target=\"_blank\" style=\"transition-property: all;\">https://blog.apecloud.cn</a></li><li style=\"padding: 0px; margin: 0px 0px 0px 20px; list-style: initial;\">gitee：<a href=\"https://gitee.com/muziys/apeblog\" target=\"_blank\" style=\"transition-property: all;\">https://gitee.com/muziys/apeblog</a></li></ul><h4 id=\"h4-u529Fu80FDu77E9u9635\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; color: rgb(51, 51, 51); margin: 10px 0px 0px; font-size: 14px; letter-spacing: normal; padding: 0px;\"><a name=\"功能矩阵\" class=\"reference-link\" style=\"color: rgb(24, 106, 242); transition-property: all; font-style: italic;\"></a><span class=\"header-link octicon octicon-link\"></span>功能矩阵</h4><p style=\"margin-bottom: 0px; padding: 8px 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 16px;\">系统后台集成了主流的通用功能，如：<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">登录验证</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">系统配置</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">操作日志管理</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">用户（组）管理</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">用户（组）权限</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">功能管理（后台菜单管理）</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">导航设置</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">网站地图</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">轮播广告</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">TAG关键字管理</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">友情链接</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">文件上传</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">数据备份/还原</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">博客文章功能</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">用户管理</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">用户操作日志</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">用户注册/登录</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">博客归档</code>、<code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">访问统计</code></p><p style=\"margin-bottom: 0px; padding: 8px 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 16px;\"><code style=\"font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;Liberation Mono&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; background: rgb(246, 246, 246); border-radius: 2px; margin: 0px 3px; border: 1px solid rgb(238, 238, 238);\">支持模板机制</code>等。更多的个性化功能可以基于当前博客系统便捷做二次开发。</p>');

-- ----------------------------
-- Table structure for ape_document_product
-- ----------------------------
DROP TABLE IF EXISTS `ape_document_product`;
CREATE TABLE `ape_document_product`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID',
  `piclist` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品图片集',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '产品价格',
  `market_price` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档模型文章表' ROW_FORMAT = DYNAMIC;

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
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` int(10) NOT NULL DEFAULT 1 COMMENT '状态 0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友链表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_friend_link
-- ----------------------------
INSERT INTO `ape_friend_link` VALUES (1, 1, '源码云', 'https://www.apecloud.cn/', '/upload/image/20220228/ca46bd04e1d32911de549862f6db1b8e.png', '源码云', 0, 1642946872, 1646030344, 1);
INSERT INTO `ape_friend_link` VALUES (2, 1, '源码云博客', 'https://blog.apecloud.cn/', '/upload/image/20220228/ca46bd04e1d32911de549862f6db1b8e.png', '源码云博客', 0, 1642946909, 1646030354, 1);

-- ----------------------------
-- Table structure for ape_invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `ape_invitation_code`;
CREATE TABLE `ape_invitation_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邀请码',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0未使用 1 使用',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '使用用户',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请码' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ape_invitation_code
-- ----------------------------

-- ----------------------------
-- Table structure for ape_message_form
-- ----------------------------
DROP TABLE IF EXISTS `ape_message_form`;
CREATE TABLE `ape_message_form`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `is_reply` int(10) NOT NULL DEFAULT 0 COMMENT '回复状态 0未回复',
  `reply_uid` int(10) NOT NULL DEFAULT 0 COMMENT '回复人',
  `reply_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `status` int(10) NOT NULL DEFAULT 1,
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈意见表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_message_form
-- ----------------------------

-- ----------------------------
-- Table structure for ape_nav
-- ----------------------------
DROP TABLE IF EXISTS `ape_nav`;
CREATE TABLE `ape_nav`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '父id',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `target` int(1) NOT NULL DEFAULT 0 COMMENT '是否新窗口打开,默认0,1新窗口打开',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1可用',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_nav
-- ----------------------------
INSERT INTO `ape_nav` VALUES (1, '首页', '', 0, '/', '', 0, 1, 0, 1657369165, 0);
INSERT INTO `ape_nav` VALUES (2, '关于', '', 0, '/index/index/about', '', 0, 1, 1, 1657369200, 1657451133);

-- ----------------------------
-- Table structure for ape_pv_log
-- ----------------------------
DROP TABLE IF EXISTS `ape_pv_log`;
CREATE TABLE `ape_pv_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `time` int(10) NOT NULL DEFAULT 0 COMMENT '时间段',
  `view` int(10) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'pv记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_pv_log
-- ----------------------------
INSERT INTO `ape_pv_log` VALUES (1, 23, 30, '2022-07-13', 1657727003, 1657727003);
INSERT INTO `ape_pv_log` VALUES (2, 0, 22, '2022-07-14', 1657728013, 1657728013);

-- ----------------------------
-- Table structure for ape_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config`;
CREATE TABLE `ape_system_config`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tab_id` int(8) NOT NULL DEFAULT 0 COMMENT '分组id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题名称',
  `form_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表单名称',
  `form_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表单类型',
  `tag_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签类型',
  `upload_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '上传配置',
  `param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加人',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config
-- ----------------------------
INSERT INTO `ape_system_config` VALUES (1, 1, '网站标题', 'title', 'text', 'input', 0, '', '源码云博客', '', 99, 1, 1, '1', '1', 1582792265, 1583855342);
INSERT INTO `ape_system_config` VALUES (2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', '/static/admin/img/logo.ico', '', 98, 1, 1, '1', '1', 1582793160, 1582792265);
INSERT INTO `ape_system_config` VALUES (3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '源码云博客', '', 97, 1, 1, '1', '1', 1582793221, 1582792265);
INSERT INTO `ape_system_config` VALUES (4, 1, '站点描述', 'description', 'text', 'input', 0, '', '源码云博客', '', 96, 1, 1, '1', '1', 1582793248, 1582792265);
INSERT INTO `ape_system_config` VALUES (5, 1, '网站作者', 'author', 'text', 'input', 0, '', '木子的忧伤', '', 95, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (6, 1, '站点logo', 'logo', 'file', 'input', 0, '', '/static/admin/img/logo.png', '', 94, 1, 1, '1', '1', 1582793393, 1582793700);
INSERT INTO `ape_system_config` VALUES (7, 1, '版权信息', 'copyright', 'text', 'input', 0, '', 'Copyright © 2022 apeBlog Powered by 源码云博客', '', 93, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (8, 1, '备案信息', 'icp', 'text', 'textarea', 0, '', '<a href=\"http://beian.miit.gov.cn\">京ICP备19038953号</a> | <a target=\"_blank\" href=\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=62062102000138\">甘公网安备62062102000138号</a>', '', 92, 1, 1, '1', '1', 1582793563, 1583375542);
INSERT INTO `ape_system_config` VALUES (10, 1, '网站域名', 'domain', 'text', 'input', 0, '', 'http://apeblog.io', '', 90, 1, 1, '1', '1', 1588858018, 1582792265);
INSERT INTO `ape_system_config` VALUES (11, 1, '网站统计代码', 'statistics', 'text', 'textarea', 0, '', '', '', 89, 1, 1, '1', '1', 1582793470, 1582793495);
INSERT INTO `ape_system_config` VALUES (12, 1, '主题信息', 'web_template', 'select', 'input', 0, 'default=>默认\nnew=>新bolg', 'default', '', 88, 1, 1, '1', '1', 1582793563, 1620610858);
INSERT INTO `ape_system_config` VALUES (13, 1, '关闭网站', 'web_close', 'radio', 'input', 0, '1=>是\n0=>否', '0', '', 87, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (14, 1, '网站统计', 'web_statistics', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '', 86, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (15, 1, '开始伪静态', 'web_rewrite', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '', 85, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (16, 2, '联系地址', 'web_contact_add', 'text', 'input', 0, '', '北京市昌平区', '', 84, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (17, 2, '联系电话', 'web_contact_tel', 'text', 'input', 0, '', '13500000000', '', 83, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (18, 2, '联系QQ', 'web_contact_qq', 'text', 'input', 0, '', '11222', '', 82, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (19, 2, '微信收款码', 'web_weixin_pay', 'file', 'input', 0, '', '/upload/pay/weixin.jpg', '微信收款码捐赠使用', 77, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (20, 2, '支付宝收款码', 'web_zhifubao_pay', 'file', 'input', 0, '', '/upload/pay/zfb.jpg', '支付宝收款码捐赠使用', 76, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (25, 3, '数据库备份根路径', 'data_backup_path', 'text', 'input', 0, '', './databack/', '路径必须以 / 结尾', 81, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (26, 3, '数据库备份卷大小', 'data_backup_part_size', 'text', 'input', 0, '', '20971520', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 80, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (27, 3, '数据库备份文件是否启用压缩', 'data_backup_compress', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 79, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (28, 3, '数据库备份文件压缩级别', 'data_backup_compress_level', 'text', 'input', 0, '', '4', '数据库备份文件的压缩级别，该配置在开启压缩时生效1:普通\n4:一般\n9:最高', 78, 1, 1, '1', '1', 1582793305, 1582792265);
INSERT INTO `ape_system_config` VALUES (29, 4, '注册开关', 'is_register', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '默认开启，如不需要可关闭。', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (30, 4, '注册方式', 'register_type', 'radio', 'input', 0, '0=>普通\n1=>手机\n2=>邀请码', '0', '邀请码注册默认状态为已审核！', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (31, 4, '禁止注册', 'register_black_list', 'text', 'input', 0, '', 'www,bbs,ftp,mail,user,users,admin,administrator', '禁止注册的用户名!', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (32, 4, '评论开关', 'comment_close', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '默认开启，如不需要可关闭。', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (33, 4, '游客评论', 'comment_visitor', 'radio', 'input', 0, '1=>是\n0=>否', '1', '开启后需要登录才能评论。', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (34, 4, '评论审核', 'comment_review', 'radio', 'input', 0, '1=>开启\n0=>关闭', '1', '开启后需要审核评论才会展示。', 91, 1, 1, '1', '1', 1583126643, 1582792265);
INSERT INTO `ape_system_config` VALUES (35, 4, '脏话过滤', 'comment_sensitive_word', 'text', 'input', 0, '', '新疆,华为,她妈,它妈,他妈,你妈,去死,贱人', '多个逗号隔开', 81, 1, 1, '1', '1', 1582793305, 1582792265);

-- ----------------------------
-- Table structure for ape_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `ape_system_config_tab`;
CREATE TABLE `ape_system_config_tab`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` int(10) NOT NULL DEFAULT 0 COMMENT '添加人',
  `update_user` int(10) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_system_config_tab
-- ----------------------------
INSERT INTO `ape_system_config_tab` VALUES (1, '基础配置', 99, 1, 1, 1, 1582784937, 1583385482);
INSERT INTO `ape_system_config_tab` VALUES (2, '社交配置', 98, 1, 1, 1, 1582785701, 1583385489);
INSERT INTO `ape_system_config_tab` VALUES (3, '数据库配置', 98, 1, 1, 1, 1582785701, 1583385489);
INSERT INTO `ape_system_config_tab` VALUES (4, '用户中心', 99, 1, 1, 1, 1582784937, 1583385482);
INSERT INTO `ape_system_config_tab` VALUES (5, '接口配置', 0, 1, 1, 0, 1657457516, 0);

-- ----------------------------
-- Table structure for ape_tag
-- ----------------------------
DROP TABLE IF EXISTS `ape_tag`;
CREATE TABLE `ape_tag`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '专区名称',
  `document_id` int(10) NOT NULL DEFAULT 0 COMMENT '文章id',
  `user_id` int(19) NOT NULL DEFAULT 0 COMMENT '操作人id',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_tag
-- ----------------------------
INSERT INTO `ape_tag` VALUES (1, '源码云', 1, 1, 1649561233, 1649561233);
INSERT INTO `ape_tag` VALUES (2, '源码', 1, 1, 1649561233, 1649561233);
INSERT INTO `ape_tag` VALUES (3, '源码云', 1, 1, 1649561233, 1649561233);

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
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'pv记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_url_log
-- ----------------------------
INSERT INTO `ape_url_log` VALUES (1, 'http://apeblog.io/', 2, '网站首页', '2022-07-13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `ape_url_log` VALUES (2, 'http://apeblog.io/', 4, '网站首页', '2022-07-14', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for ape_user
-- ----------------------------
DROP TABLE IF EXISTS `ape_user`;
CREATE TABLE `ape_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册IP地址',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0启用 1禁用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `is_admin` int(11) NOT NULL DEFAULT 0 COMMENT '是否是管理员 1是 0 否',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_email_tel`(`username`, `tel`, `email`) USING BTREE COMMENT '用户名'
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
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问ip',
  `time` int(10) NOT NULL DEFAULT 0 COMMENT '时间',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Uv记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ape_uv_log
-- ----------------------------
INSERT INTO `ape_uv_log` VALUES (1, '127.0.0.1', 23, '2022-07-13', 1657727003, 1657727003);
INSERT INTO `ape_uv_log` VALUES (2, '127.0.0.1', 0, '2022-07-14', 1657728013, 1657728013);

SET FOREIGN_KEY_CHECKS = 1;
