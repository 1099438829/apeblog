/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : paiadmin

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 29/06/2020 13:19:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lea_admin
-- ----------------------------
DROP TABLE IF EXISTS `lea_admin`;
CREATE TABLE `lea_admin`  (
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
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台人员列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lea_admin
-- ----------------------------
INSERT INTO `lea_admin` VALUES (1, 1, 'admin', 'admin', '14e1b600b1fd579f47433b88e8d85291', '张三', 'http://file.cos.leapy.cn/image/20200509/29a4a202005092052147675.jpg', 1, '17896852019', 'cfn@leapy.cn', '这家伙很懒，什么也没留下。', 1, NULL, '1', '1580031132', '1', '1590409452');

-- ----------------------------
-- Table structure for lea_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `lea_admin_auth`;
CREATE TABLE `lea_admin_auth`  (
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
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lea_admin_auth
-- ----------------------------
INSERT INTO `lea_admin_auth` VALUES (1, '查看日志', '', 8, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin.admin_log/index', 0, 1, NULL, NULL, NULL, '1581664102');
INSERT INTO `lea_admin_auth` VALUES (2, '控制台', 'mdi mdi-home', 0, 'admin', 'index', 'main', '', 'ok-icon', 0, 1, 1, '/admin/index/main', 99, 1, NULL, NULL, '1', '1590466572');
INSERT INTO `lea_admin_auth` VALUES (4, '账号管理', 'mdi mdi-account', 0, 'admin', 'admin.admin', 'index', '', 'ok-icon', 0, 0, 1, '/admin/admin.admin/index', 0, 1, NULL, NULL, NULL, NULL);
INSERT INTO `lea_admin_auth` VALUES (5, '用户管理', '', 4, 'admin', 'admin.admin', 'index', '', NULL, 0, 0, 1, '/admin/admin.admin/index', 0, 1, NULL, NULL, NULL, NULL);
INSERT INTO `lea_admin_auth` VALUES (6, '权限管理', '', 4, 'admin', 'admin.admin_auth', 'index', '', NULL, 0, 0, 1, '/admin/admin.admin_auth/index', 0, 1, NULL, NULL, '1', '1582263685');
INSERT INTO `lea_admin_auth` VALUES (7, '角色管理', '', 4, 'admin', 'admin.admin_role', 'index', '', NULL, 0, 0, 1, '/admin/admin.admin_role/index', 0, 1, NULL, NULL, '1', '1582263652');
INSERT INTO `lea_admin_auth` VALUES (8, '系统管理', 'mdi mdi-settings', 0, 'admin', 'admin.admin_log', 'index', '', 'ok-icon', 1, 1, 1, '/admin/admin.admin_log/index', 0, 1, NULL, NULL, NULL, NULL);
INSERT INTO `lea_admin_auth` VALUES (9, '修改密码', '', 8, 'admin', 'admin.admin', 'pwd', '', NULL, 0, 0, 0, '/admin/admin.admin/pwd', 0, 1, '1', '1582093161', NULL, NULL);
INSERT INTO `lea_admin_auth` VALUES (10, '清理缓存', '', 8, 'admin', 'system.system_config', 'clearCache', '', NULL, 0, 0, 1, '/admin/system.system_config/clearCache', 0, 1, '1', '1582093658', '1', '1593407914');
INSERT INTO `lea_admin_auth` VALUES (11, '网站配置', '', 8, 'admin', 'system.system_config', 'base', '', NULL, 0, 0, 1, '/admin/system.system_config/base', 0, 1, '1', '1582266348', '1', '1582781624');
INSERT INTO `lea_admin_auth` VALUES (12, '开发者配置', '', 8, 'admin', 'system.system_config_tab', 'index', '', NULL, 0, 0, 1, '/admin/system.system_config_tab/index', 0, 1, '1', '1582266439', '1', '1590149680');
INSERT INTO `lea_admin_auth` VALUES (13, '后台登录', '', 8, 'admin', 'login', 'login', '', NULL, 0, 0, 0, '/admin/login/login', 0, 1, '1', '1582707133', NULL, NULL);
INSERT INTO `lea_admin_auth` VALUES (14, '上传配置', '', 8, 'admin', 'system.system_config', 'upload', '', NULL, 0, 0, 0, '/admin/system.system_config/upload', 0, 1, '1', '1582781658', NULL, '1582781667');
INSERT INTO `lea_admin_auth` VALUES (15, '短信配置', '', 8, 'admin', 'system.system_config', 'sms', '', NULL, 0, 0, 0, '/admin/system.system_config/sms', 0, 1, '1', '1582781757', NULL, '1582781796');
INSERT INTO `lea_admin_auth` VALUES (16, '邮件配置', '', 8, 'admin', 'system.system_config', 'email', '', NULL, 0, 0, 0, '/admin/system.system_config/email', 0, 1, '1', '1582781787', NULL, NULL);

-- ----------------------------
-- Table structure for lea_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `lea_admin_log`;
CREATE TABLE `lea_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `admin_id` int(10) NOT NULL COMMENT '操作人id',
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人名字',
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名',
  `controller` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器名',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'User-Agent',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lea_admin_notify
-- ----------------------------
DROP TABLE IF EXISTS `lea_admin_notify`;
CREATE TABLE `lea_admin_notify`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `aid` int(10) NOT NULL COMMENT '管理员ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `from` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息来源 谁发的',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型 timer:定时器 system:系统',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转路径 不填写时自动判断',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读',
  `add_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lea_admin_notify
-- ----------------------------
INSERT INTO `lea_admin_notify` VALUES (1, 1, 'xxxxxx', 'swwqeqwe131231sdadaadaewqeq', NULL, 'system', NULL, 1, '1590472225');
INSERT INTO `lea_admin_notify` VALUES (2, 1, 'xxxxxx', 'swwqeqwe131231sdadaadaewqeq', NULL, 'system', NULL, 1, '1590472226');
INSERT INTO `lea_admin_notify` VALUES (3, 1, 'xxxxxx', 'swwqeqwe131231sdadaadaewqeq', NULL, 'system', NULL, 1, '1590472227');

-- ----------------------------
-- Table structure for lea_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `lea_admin_role`;
CREATE TABLE `lea_admin_role`  (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '角色状态',
  `pid` int(4) NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `auth` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `tree_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'treedata',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lea_admin_role
-- ----------------------------
INSERT INTO `lea_admin_role` VALUES (1, 0, '超级管理员', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16', '2,4,5,6,7,8,1,9,10,11,12,13,14,15,16', 0, 1, '1', '1580031132', '1', '1593358987');
INSERT INTO `lea_admin_role` VALUES (8, 6, '拼多多用户', '2,19,17,18,15', '2,19,17,18', 0, 1, '1', '1582548411', '1', '1582700075');

-- ----------------------------
-- Table structure for lea_attachment
-- ----------------------------
DROP TABLE IF EXISTS `lea_attachment`;
CREATE TABLE `lea_attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `cid` int(2) NOT NULL COMMENT '所属目录',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件地址',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `mime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mime',
  `size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小',
  `storage` int(2) NULL DEFAULT NULL COMMENT '存储方式1本地2腾讯云',
  `upload_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lea_attachment
-- ----------------------------
INSERT INTO `lea_attachment` VALUES (1, 17, 'image/20200411/a9850746e62062f8410d7570792c1f68.ico', '/upload/image/20200411/a9850746e62062f8410d7570792c1f68.ico', 'image', 'image/x-icon', '16958.00', 1, '1586581793');
INSERT INTO `lea_attachment` VALUES (2, 17, 'image/20200411/040d6cbe55937baad059d03a9c347eb7.ico', '/upload/image/20200411/040d6cbe55937baad059d03a9c347eb7.ico', 'image', 'image/x-icon', '16958.00', 1, '1586581918');
INSERT INTO `lea_attachment` VALUES (3, 17, 'image/20200411/5c5bd019a5ae55b8ff0fda16821a4536.ico', '/upload/image/20200411/5c5bd019a5ae55b8ff0fda16821a4536.ico', 'image', 'image/x-icon', '16958.00', 1, '1586581935');
INSERT INTO `lea_attachment` VALUES (4, 17, 'image/20200411/11add18dc504d69591a546d5841dc714.ico', '/upload/image/20200411/11add18dc504d69591a546d5841dc714.ico', 'image', 'image/x-icon', '16958.00', 1, '1586581949');
INSERT INTO `lea_attachment` VALUES (5, 17, 'image/20200411/cad1ea4cdb68a8179820d6edd30bfdae.ico', '/upload/image/20200411/cad1ea4cdb68a8179820d6edd30bfdae.ico', 'image', 'image/x-icon', '16958.00', 1, '1586581971');
INSERT INTO `lea_attachment` VALUES (6, 17, 'image/20200411/3e2fbc218579032d8d0fa86fdc314c23.ico', '/upload/image/20200411/3e2fbc218579032d8d0fa86fdc314c23.ico', 'image', 'image/x-icon', '16958.00', 1, '1586582963');
INSERT INTO `lea_attachment` VALUES (7, 17, 'image/20200411/067efc72117d79156b80138939b5b856.ico', '/upload/image/20200411/067efc72117d79156b80138939b5b856.ico', 'image', 'image/x-icon', '16958.00', 1, '1586582996');
INSERT INTO `lea_attachment` VALUES (8, 17, 'image/20200411/985701b102640a0a079f5cd04a682aca.ico', '/upload/image/20200411/985701b102640a0a079f5cd04a682aca.ico', 'image', 'image/x-icon', '16958.00', 1, '1586583067');
INSERT INTO `lea_attachment` VALUES (11, 17, 'image/20200411/21bed8072a2a6e217ce6e7ea586d05ce.ico', '/upload/image/20200411/21bed8072a2a6e217ce6e7ea586d05ce.ico', 'image', 'image/x-icon', '16958.00', 1, '1586583470');
INSERT INTO `lea_attachment` VALUES (16, 19, 'image/20200411/3bb49fbc10645eb3e4a14e5d06fff13b.ico', '/upload/image/20200411/3bb49fbc10645eb3e4a14e5d06fff13b.ico', 'image', 'image/x-icon', '16958.00', 1, '1586598559');
INSERT INTO `lea_attachment` VALUES (23, 19, 'image/20200412/ab05c1954154081b6a06d9ba1e4ce26c.png', '/upload/image/20200412/ab05c1954154081b6a06d9ba1e4ce26c.png', 'image', 'image/png', '120799.00', 1, '1586665629');
INSERT INTO `lea_attachment` VALUES (24, 19, 'image/20200412/feb596998fd1e15d0ca624c47802dce5.png', '/upload/image/20200412/feb596998fd1e15d0ca624c47802dce5.png', 'image', 'image/png', '21842.00', 1, '1586665631');
INSERT INTO `lea_attachment` VALUES (25, 19, 'image/20200412/095d263abec3597b5cd303600977ba0f.png', '/upload/image/20200412/095d263abec3597b5cd303600977ba0f.png', 'image', 'image/png', '120799.00', 1, '1586665634');
INSERT INTO `lea_attachment` VALUES (26, 19, 'image/20200412/d5fbac35e077a654a26a149a1227c5e2.png', '/upload/image/20200412/d5fbac35e077a654a26a149a1227c5e2.png', 'image', 'image/png', '21842.00', 1, '1586665636');
INSERT INTO `lea_attachment` VALUES (27, 19, 'image/20200412/86c4542863146362acf038e1b3a59d27.png', '/upload/image/20200412/86c4542863146362acf038e1b3a59d27.png', 'image', 'image/png', '120799.00', 1, '1586665638');
INSERT INTO `lea_attachment` VALUES (28, 19, 'image/20200412/427a43adca442a787a08de77820236ad.png', '/upload/image/20200412/427a43adca442a787a08de77820236ad.png', 'image', 'image/png', '21842.00', 1, '1586665640');
INSERT INTO `lea_attachment` VALUES (29, 19, 'image/20200412/14aa8b4d6c36e54324c87a14599d8a31.png', '/upload/image/20200412/14aa8b4d6c36e54324c87a14599d8a31.png', 'image', 'image/png', '120799.00', 1, '1586665642');
INSERT INTO `lea_attachment` VALUES (30, 19, 'image/20200412/ed46e6b1a7f2dbd38e0e14a6e4080512.png', '/upload/image/20200412/ed46e6b1a7f2dbd38e0e14a6e4080512.png', 'image', 'image/png', '21842.00', 1, '1586665644');
INSERT INTO `lea_attachment` VALUES (31, 19, 'image/20200412/9690d4821af7630c01cd0eee1d86cad6.png', '/upload/image/20200412/9690d4821af7630c01cd0eee1d86cad6.png', 'image', 'image/png', '120799.00', 1, '1586665646');
INSERT INTO `lea_attachment` VALUES (32, 17, 'image/20200412/1f7fa36c58e24daeff4248aa205cc0d7.png', '/upload/image/20200412/1f7fa36c58e24daeff4248aa205cc0d7.png', 'image', 'image/png', '21842.00', 1, '1586665653');
INSERT INTO `lea_attachment` VALUES (33, 17, 'image/20200412/42f96f5d16243abf35bed2ea08eddcce.png', '/upload/image/20200412/42f96f5d16243abf35bed2ea08eddcce.png', 'image', 'image/png', '120799.00', 1, '1586665657');
INSERT INTO `lea_attachment` VALUES (34, 17, 'image/20200412/c195e92c3e0cb710428f61ebec6cad22.png', '/upload/image/20200412/c195e92c3e0cb710428f61ebec6cad22.png', 'image', 'image/png', '21842.00', 1, '1586665659');
INSERT INTO `lea_attachment` VALUES (35, 17, 'image/20200412/f0ed2a75a1f15d1434e3a968e471ea6e.png', '/upload/image/20200412/f0ed2a75a1f15d1434e3a968e471ea6e.png', 'image', 'image/png', '120799.00', 1, '1586665666');
INSERT INTO `lea_attachment` VALUES (36, 17, 'image/20200412/7261c6744a990fd47dbfeca402f1cb79.png', '/upload/image/20200412/7261c6744a990fd47dbfeca402f1cb79.png', 'image', 'image/png', '21842.00', 1, '1586665668');
INSERT INTO `lea_attachment` VALUES (37, 17, 'image/20200412/6c1273e403bbbae0d94e7e86e978b4b5.png', '/upload/image/20200412/6c1273e403bbbae0d94e7e86e978b4b5.png', 'image', 'image/png', '120799.00', 1, '1586665669');
INSERT INTO `lea_attachment` VALUES (38, 17, 'image/20200416/28297852ea8064edbbd554c0d3ac0bc6.png', '/upload/image/20200416/28297852ea8064edbbd554c0d3ac0bc6.png', 'image', 'image/png', '3704.00', 1, '1587046182');
INSERT INTO `lea_attachment` VALUES (39, 0, 'image/20200417/7ffdacc8789967cd2d32c9ade8e2d74c.jpeg', '/upload/image/20200417/7ffdacc8789967cd2d32c9ade8e2d74c.jpeg', 'image', 'image/jpeg', '33448.00', 1, '1587088282');
INSERT INTO `lea_attachment` VALUES (40, 0, 'image/20200417/45f71819c29a85151806a57609fdade0.jpeg', '/upload/image/20200417/45f71819c29a85151806a57609fdade0.jpeg', 'image', 'image/jpeg', '33448.00', 1, '1587091769');
INSERT INTO `lea_attachment` VALUES (41, 0, 'image/20200417/cc296f7b1de659794f9cffcba7405424.mp4', '/upload/image/20200417/cc296f7b1de659794f9cffcba7405424.mp4', 'video', 'video/mp4', '3360938', 1, '1587092695');
INSERT INTO `lea_attachment` VALUES (42, 0, 'image/20200417/1b7aa91153dcca6efff5e8f96ed367e1.mp4', '/upload/image/20200417/1b7aa91153dcca6efff5e8f96ed367e1.mp4', 'video', 'video/mp4', '3360938', 1, '1587092932');
INSERT INTO `lea_attachment` VALUES (43, 0, 'image/20200417/38565364c3ea5044bbfdf16d98a4ea8e.mp4', '/upload/image/20200417/38565364c3ea5044bbfdf16d98a4ea8e.mp4', 'video', 'video/mp4', '3360938', 1, '1587093077');
INSERT INTO `lea_attachment` VALUES (44, 0, 'image/20200417/70ef6312ba905c5ff817faa20c85a8a4.mp4', '/upload/image/20200417/70ef6312ba905c5ff817faa20c85a8a4.mp4', 'video', 'video/mp4', '3360938', 1, '1587093770');
INSERT INTO `lea_attachment` VALUES (45, 0, 'image/20200417/d0f8c8fced44f3ae0173ad8a37a5a296.mp4', '/upload/image/20200417/d0f8c8fced44f3ae0173ad8a37a5a296.mp4', 'video', 'video/mp4', '3360938', 1, '1587093833');
INSERT INTO `lea_attachment` VALUES (46, 0, 'image/20200417/63952c7cdd196a96363f27ac829bd5cc.mp4', '/upload/image/20200417/63952c7cdd196a96363f27ac829bd5cc.mp4', 'video', 'video/mp4', '3360938', 1, '1587093860');
INSERT INTO `lea_attachment` VALUES (47, 0, 'video/20200417/fd06f33e51b3ec4edfaafa74a6024f35.mp4', '/upload/video/20200417/fd06f33e51b3ec4edfaafa74a6024f35.mp4', 'video', 'video/mp4', '3360938', 1, '1587093890');
INSERT INTO `lea_attachment` VALUES (48, 0, 'video/20200417/70145b0c1b28156b0556251a600b0f75.mp4', '/upload/video/20200417/70145b0c1b28156b0556251a600b0f75.mp4', 'video', 'video/mp4', '3360938', 1, '1587094445');
INSERT INTO `lea_attachment` VALUES (49, 0, 'image/20200417/2330960e20c046ceed820ce1918aaacd.jpeg', '/upload/image/20200417/2330960e20c046ceed820ce1918aaacd.jpeg', 'image', 'image/jpeg', '33448', 1, '1587094599');
INSERT INTO `lea_attachment` VALUES (50, 0, 'image/20200417/5993cdc77e78fce98ea3a296d29b2b63.jpeg', '/upload/image/20200417/5993cdc77e78fce98ea3a296d29b2b63.jpeg', 'image', 'image/jpeg', '33448', 1, '1587094718');
INSERT INTO `lea_attachment` VALUES (51, 0, 'video/20200417/1ba1f7ac5d53c874166a056c7bcab21c.mp4', '/upload/video/20200417/1ba1f7ac5d53c874166a056c7bcab21c.mp4', 'video', 'video/mp4', '3360938', 1, '1587094928');
INSERT INTO `lea_attachment` VALUES (52, 0, 'audio/20200417/b0a071f528d423ccffe1f3227450bb8b.mp3', '/upload/audio/20200417/b0a071f528d423ccffe1f3227450bb8b.mp3', 'audio', 'audio/mpeg', '21141', 1, '1587096167');
INSERT INTO `lea_attachment` VALUES (53, 21, 'image/20200424/57cd3a1e9a38289f42207dd69c5b6650.png', '/upload/image/20200424/57cd3a1e9a38289f42207dd69c5b6650.png', 'image', 'image/png', '20134', 1, '1587705666');
INSERT INTO `lea_attachment` VALUES (54, 22, 'image/20200428/b57276202fc3bc914b72ec3e87c46abe.jpg', '/upload/image/20200428/b57276202fc3bc914b72ec3e87c46abe.jpg', 'image', 'image/jpeg', '170914', 1, '1588077711');
INSERT INTO `lea_attachment` VALUES (55, 22, 'image/20200428/c746a78c781e090189a6e93010990b7a.jpg', '/upload/image/20200428/c746a78c781e090189a6e93010990b7a.jpg', 'image', 'image/jpeg', '128124', 1, '1588077714');
INSERT INTO `lea_attachment` VALUES (56, 22, 'image/20200428/da9442b96330999d98364e80f2e0439e.jpg', '/upload/image/20200428/da9442b96330999d98364e80f2e0439e.jpg', 'image', 'image/jpeg', '162265', 1, '1588077717');
INSERT INTO `lea_attachment` VALUES (57, 0, 'image/20200430/b7572ec7b53fdb476cb74978b74aee6e.jpg', '/upload/image/20200430/b7572ec7b53fdb476cb74978b74aee6e.jpg', 'image', 'image/jpeg', '7900', 1, '1588201885');
INSERT INTO `lea_attachment` VALUES (66, 22, 'image/20200507/f1a93c39b0cf13584aad9abc493c6b90.jpg', 'http://file.cos.leapy.cn/image/20200507/716f3202005071331055658.jpg', 'image', 'image/jpeg', '54544', 2, '1588829465');
INSERT INTO `lea_attachment` VALUES (67, 0, 'image/20200509/4e1f2a7c179e4084a93032323db7f8b5.jpg', 'http://file.cos.leapy.cn/image/20200509/898b720200509204528197.jpg', 'image', 'image/jpeg', '7900', 2, '1589028329');
INSERT INTO `lea_attachment` VALUES (68, 0, 'image/20200509/24d3e04cfe50a75eb75e6dd84b9d3fe3.jpg', 'http://file.cos.leapy.cn/image/20200509/a316c202005092050169966.jpg', 'image', 'image/jpeg', '7900', 2, '1589028616');
INSERT INTO `lea_attachment` VALUES (69, 0, 'image/20200509/9799fcb46f1ffc97ae00a067b8fefb8f.jpg', 'http://file.cos.leapy.cn/image/20200509/1af11202005092050505325.jpg', 'image', 'image/jpeg', '7900', 2, '1589028650');
INSERT INTO `lea_attachment` VALUES (70, 0, 'image/20200509/8d0c463bb282d6a26df536b63ff2facc.jpg', 'http://file.cos.leapy.cn/image/20200509/29a4a202005092052147675.jpg', 'image', 'image/jpeg', '7900', 2, '1589028734');
INSERT INTO `lea_attachment` VALUES (71, 22, 'image/20200510/8821d850e19c1866834118e2571aa34a.jpg', 'http://file.cos.leapy.cn/image/20200510/fd9dd202005100903276547.jpg', 'image', 'image/jpeg', '33920', 2, '1589072607');
INSERT INTO `lea_attachment` VALUES (72, 22, 'image/20200510/8465549335452e3bfba0a4b8a6ba4c63.jpg', 'http://file.cos.leapy.cn/image/20200510/50d49202005100906567976.jpg', 'image', 'image/jpeg', '133290', 2, '1589072817');
INSERT INTO `lea_attachment` VALUES (73, 22, 'image/20200510/d32531112e58b1f90f9ae0c97a1963b7.jpg', 'http://file.cos.leapy.cn/image/20200510/166fb202005100910134099.jpg', 'image', 'image/jpeg', '53917', 2, '1589073013');
INSERT INTO `lea_attachment` VALUES (74, 22, 'image/20200510/6dbf5f9e65d0e60303a10ca2566dd9fe.jpg', 'http://file.cos.leapy.cn/image/20200510/c7141202005100913026950.jpg', 'image', 'image/jpeg', '62293', 2, '1589073182');
INSERT INTO `lea_attachment` VALUES (75, 22, 'image/20200510/66d5c51e0222d17575a413fb6425e841.jpg', 'http://file.cos.leapy.cn/image/20200510/53d6c202005102117106983.jpg', 'image', 'image/jpeg', '139312', 2, '1589116630');
INSERT INTO `lea_attachment` VALUES (76, 22, 'image/20200510/9e55370369746ea10396ab9a9ccf493a.jpg', 'http://file.cos.leapy.cn/image/20200510/6b8a4202005102119246531.jpg', 'image', 'image/jpeg', '44962', 2, '1589116765');
INSERT INTO `lea_attachment` VALUES (77, 22, 'image/20200510/2047baa9ab89a29e96f8aa5dcc12a894.jpg', 'http://file.cos.leapy.cn/image/20200510/e570d202005102121265003.jpg', 'image', 'image/jpeg', '109314', 2, '1589116887');
INSERT INTO `lea_attachment` VALUES (78, 22, 'image/20200510/76b9c072f43aa3d7fb3e35a4ce1b6eca.jpg', 'http://file.cos.leapy.cn/image/20200510/bed2b202005102126232634.jpg', 'image', 'image/jpeg', '44678', 2, '1589117183');
INSERT INTO `lea_attachment` VALUES (79, 0, 'image/20200513/dfdf8ecd1e4bfa1d24ea992515441461.jpg', 'http://file.cos.leapy.cn/image/20200513/7c007202005130755013790.jpg', 'image', 'image/jpeg', '47518', 2, '1589327701');
INSERT INTO `lea_attachment` VALUES (80, 0, 'image/20200513/6d8cadd18fb811556e2ae7617262d047.jpg', 'http://file.cos.leapy.cn/image/20200513/8795c202005130757437787.jpg', 'image', 'image/jpeg', '27760', 2, '1589327863');
INSERT INTO `lea_attachment` VALUES (81, 23, 'image/20200516/884685416140006033cdd9e8c516dcd6.jpg', 'http://file.cos.leapy.cn/image/20200516/91f08202005161354061360.jpg', 'image', 'image/jpeg', '65369', 2, '1589608446');
INSERT INTO `lea_attachment` VALUES (82, 0, 'image/20200520/5bf5fa4ed43e553c2f1a30312dc41d40.png', 'http://file.cos.leapy.cn/image/20200520/320b1202005201016139883.png', 'image', 'image/png', '32414', 2, '1589940973');
INSERT INTO `lea_attachment` VALUES (83, 0, 'image/20200520/a30dc27edb97c450bb63c6acf166b290.png', 'http://file.cos.leapy.cn/image/20200520/4870e202005201017078544.png', 'image', 'image/png', '101389', 2, '1589941027');
INSERT INTO `lea_attachment` VALUES (84, 0, 'image/20200520/858b3d63ae65a2842281cecc829642b4.png', 'http://file.cos.leapy.cn/image/20200520/28395202005201017322794.png', 'image', 'image/png', '58868', 2, '1589941052');
INSERT INTO `lea_attachment` VALUES (85, 0, 'image/20200520/a9b8ab59bd31442bb6dfb9ab73ceac6b.png', 'http://file.cos.leapy.cn/image/20200520/99214202005201017522849.png', 'image', 'image/png', '62207', 2, '1589941072');
INSERT INTO `lea_attachment` VALUES (86, 0, 'image/20200520/9ee9fa9dcd8098b649091115d70a5ca8.png', 'http://file.cos.leapy.cn/image/20200520/ebd6420200520101809963.png', 'image', 'image/png', '80940', 2, '1589941089');
INSERT INTO `lea_attachment` VALUES (87, 0, 'image/20200520/3b34d82cc9a5dddd68101df696af2f5d.png', 'http://file.cos.leapy.cn/image/20200520/99c2d202005201018228828.png', 'image', 'image/png', '455887', 2, '1589941105');
INSERT INTO `lea_attachment` VALUES (88, 0, 'image/20200520/d27c2f2b35878b8ce23e7f1a07023cc8.png', 'http://file.cos.leapy.cn/image/20200520/1125e20200520101908339.png', 'image', 'image/png', '55833', 2, '1589941148');
INSERT INTO `lea_attachment` VALUES (89, 0, 'image/20200520/1041685cd361274313b3e05cc2884a7f.png', 'http://file.cos.leapy.cn/image/20200520/befdd202005201019221055.png', 'image', 'image/png', '72239', 2, '1589941163');

-- ----------------------------
-- Table structure for lea_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `lea_attachment_category`;
CREATE TABLE `lea_attachment_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目录名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属附件类型',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lea_attachment_category
-- ----------------------------
INSERT INTO `lea_attachment_category` VALUES (17, 0, '账号管理图片', 'image', '1', '1585490276', '1', '1585490299');
INSERT INTO `lea_attachment_category` VALUES (19, 17, '测试', 'image', '1', '1586160784', NULL, NULL);
INSERT INTO `lea_attachment_category` VALUES (20, 0, 'CMS管理', 'image', '1', '1587705636', NULL, NULL);
INSERT INTO `lea_attachment_category` VALUES (21, 20, '轮播', 'image', '1', '1587705653', NULL, NULL);
INSERT INTO `lea_attachment_category` VALUES (22, 0, '小程序视频', 'image', '1', '1588077700', NULL, NULL);
INSERT INTO `lea_attachment_category` VALUES (23, 0, '博客', 'image', '1', '1589608434', NULL, NULL);
INSERT INTO `lea_attachment_category` VALUES (24, 0, '阿斯顿发生的', 'image', '1', '1589966625', NULL, NULL);
INSERT INTO `lea_attachment_category` VALUES (25, 24, '23423', 'image', '1', '1589966632', NULL, NULL);

-- - ----------------------------
-- Table structure for lea_system_config
-- ----------------------------
DROP TABLE IF EXISTS `lea_system_config`;
CREATE TABLE `lea_system_config`  (
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
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lea_system_config
-- ----------------------------
INSERT INTO `lea_system_config` VALUES (1, 1, '网站标题', 'title', 'text', 'input', 0, '', '派后台管理系统', 'systemConfig(\"title\")', 90, 1, 1, '1', '1582792265', '1', '1583855342');
INSERT INTO `lea_system_config` VALUES (2, 1, '网站图标', 'favicon', 'file', 'input', 0, '', 'http://file.cos.leapy.cn/image/20200509/898b720200509204528197.jpg', '', 89, 1, 1, '1', '1582793160', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (3, 1, '站点关键词', 'keywords', 'text', 'input', 0, '', '派后台管理系统', '', 88, 1, 1, '1', '1582793221', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (4, 1, '站点描述', 'description', 'text', 'input', 0, '', '派后台管理系统', '', 87, 1, 1, '1', '1582793248', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (5, 1, '网站作者', 'author', 'text', 'input', 0, '', 'cfn', '', 86, 1, 1, '1', '1582793305', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (6, 1, '后台LOGO', 'admin_logo', 'file', 'input', 0, '', '/upload/image/20200228/c42005f7fafb58106c33e58279b2f396.png', '', 85, 1, 1, '1', '1582793393', '1', '1582793700');
INSERT INTO `lea_system_config` VALUES (7, 1, '版权信息', 'copyright', 'text', 'textarea', 0, '', 'Power by LEARY.', '', 84, 1, 1, '1', '1582793470', '1', '1582793495');
INSERT INTO `lea_system_config` VALUES (8, 1, '备案信息', 'icp', 'text', 'textarea', 0, '', 'xxx', '', 83, 1, 1, '1', '1582793563', '1', '1583375542');
INSERT INTO `lea_system_config` VALUES (9, 3, '短信平台', 'sms_type', 'radio', 'input', 0, '1=>腾讯云\n2=>阿里云', '1', '', 99, 1, 1, '1', '1583126643', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (10, 3, 'AppID', 'sms_appid', 'text', 'input', 0, '', '1400323535', '', 98, 1, 1, '1', '1583126757', '1', '1583126769');
INSERT INTO `lea_system_config` VALUES (11, 3, 'App Key', 'sms_appkey', 'text', 'input', 0, '', '0777dd251be53632c95da276738b9fd0', '', 97, 1, 1, '1', '1583126826', '1', '1583131539');
INSERT INTO `lea_system_config` VALUES (12, 3, '短信登录模板ID', 'sms_login', 'number', 'input', 0, '', '545149', '', 0, 0, 1, '1', '1583137085', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (13, 3, '短信签名', 'sms_sign', 'text', 'input', 0, '', '里派LEAPY', '', 0, 1, 1, '1', '1583137174', '1', '1583140447');
INSERT INTO `lea_system_config` VALUES (14, 3, '找回密码', 'sms_retrieve', 'number', 'input', 0, '', ' 545151', '', 0, 0, 1, '1', '1583138408', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (15, 3, '注册', 'sms_register', 'number', 'input', 0, '', '545150', '', 0, 0, 1, '1', '1583138507', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (17, 13, '公众号名称', 'wechat_app_name', 'text', 'input', 0, '', '里派社区', '', 99, 1, 1, '1', '1583221905', '1', '1583222192');
INSERT INTO `lea_system_config` VALUES (18, 13, '微信号', 'wechat_app_number', 'text', 'input', 0, '', 'LEAPY_CN', '', 98, 1, 1, '1', '1583221970', '1', '1583222198');
INSERT INTO `lea_system_config` VALUES (19, 13, '原始ID', 'wechat_app_origin_id', 'text', 'input', 0, '', 'gh_f9e2116bdc11', '', 97, 1, 1, '1', '1583222185', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (20, 13, 'AppID', 'wechat_appid', 'text', 'input', 0, '', 'wxcf8c233220bbf42f', '', 96, 1, 1, '1', '1583222266', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (21, 13, 'AppSecret', 'wechat_appsecret', 'text', 'input', 0, '', '2575cab179dff5b22f3c9285d4c565b7', '', 95, 1, 1, '1', '1583222345', '1', '1583222356');
INSERT INTO `lea_system_config` VALUES (22, 13, '微信验证TOKEN', 'wechat_token', 'text', 'input', 0, '', 'learn', '', 94, 1, 1, '1', '1583222439', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (23, 13, '消息加解密方式', 'wechat_encry', 'radio', 'input', 0, '1=>明文模式\n2=>兼容模式\n3=>安全模式', '1', '', 93, 1, 1, '1', '1583222535', '1', '1583223241');
INSERT INTO `lea_system_config` VALUES (24, 13, 'EncodingAESKey', 'wechat_aeskey', 'text', 'input', 0, '', 'EnRXjvDAHlqKbxaaSeQE3pnNBkNHMLmqL5QuB4KsNYt', '', 92, 1, 1, '1', '1583223110', '1', '1583223252');
INSERT INTO `lea_system_config` VALUES (25, 13, '公众号类型', 'wechat_type', 'radio', 'input', 0, '1=>服务号\n2=>订阅号', '2', '', 91, 1, 1, '1', '1583223219', '1', '1583223257');
INSERT INTO `lea_system_config` VALUES (26, 13, '接口地址', 'wechat_url', 'text', 'input', 0, '', 'https://learn.leapy.cn/api/wechat/serve', '', 90, 1, 1, '1', '1583223343', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (29, 14, '小程序APPID', 'miniprogram_appid', 'text', 'input', 0, '', 'wxe37eb9fc00f03a58', '', 99, 1, 1, '1', '1587732068', '1', '1587967147');
INSERT INTO `lea_system_config` VALUES (30, 14, '小程序密钥', 'miniprogram_appsecret', 'text', 'input', 0, '', '144ddbf99b8cf58b644410c36666865d', '', 98, 1, 1, '1', '1587732178', '1', '1587967175');
INSERT INTO `lea_system_config` VALUES (31, 14, '小程序LOGO', 'miniprogram_logo', 'file', 'input', 0, '', 'http://file.cos.leapy.cn/image/20200509/29a4a202005092052147675.jpg', '', 0, 1, 1, '1', '1588201532', '1', '1589028469');
INSERT INTO `lea_system_config` VALUES (32, 14, '小程序名称', 'miniprogram_name', 'text', 'input', 0, '', '里派社区', '', 0, 1, 1, '1', '1588202282', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (33, 2, '存储方式', 'storage_type', 'radio', 'input', 0, '1=>本地储存\n2=>腾讯云COS', '2', '', 0, 1, 1, '1', '1588819285', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (34, 2, 'CDN域名', 'storage_domain', 'text', 'input', 0, '', 'http://file.cos.leapy.cn', '', 0, 1, 1, '1', '1588819651', '1', '1588828871');
INSERT INTO `lea_system_config` VALUES (35, 2, 'SecretId', 'storage_secretid', 'text', 'input', 0, '', 'AKIDBFBzd7aUNEvVv9F7sphOwKWuAuY3qVwI', '', 0, 1, 1, '1', '1588820386', '1', '1588828877');
INSERT INTO `lea_system_config` VALUES (36, 2, 'SecretKey', 'storage_secretkey', 'text', 'input', 0, '', 'fGgw0sY4TiyfFdoqhQyKUTFqJcYM2YxE', '', 0, 1, 1, '1', '1588820426', '1', '1588828883');
INSERT INTO `lea_system_config` VALUES (37, 2, '存储位置', 'storage_region', 'text', 'input', 0, '', 'ap-chengdu', '腾讯云COS填写', 0, 1, 1, '1', '1588821134', '1', '1588828897');
INSERT INTO `lea_system_config` VALUES (38, 2, '存储桶名称', 'storage_bucket', 'text', 'input', 0, '', 'pipasheng-1252563008', '', 0, 1, 1, '1', '1588821538', '1', '1588828889');
INSERT INTO `lea_system_config` VALUES (39, 4, 'SMTP服务器', 'mail_host', 'text', 'input', 0, '', 'http://bt.leapy.cn:618/mail_sys/send_mail_http.json', '', 0, 1, 1, '1', '1588835717', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (40, 4, '邮箱用户名', 'mail_username', 'text', 'input', 0, '', 'mail@leapy.cn', '', 0, 1, 1, '1', '1588835775', '1', '1588836096');
INSERT INTO `lea_system_config` VALUES (41, 4, '授权码', 'mail_password', 'text', 'input', 0, '', '52Xia666', '', 0, 1, 1, '1', '1588835807', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (42, 4, '服务器端口', 'mail_port', 'text', 'input', 0, '', '25', '', 0, 1, 1, '1', '1588836004', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (43, 4, '发件人', 'mail_from', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', '1588836080', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (44, 4, '发件人签名', 'mail_from_name', 'text', 'input', 0, '', '里派', '', 0, 1, 1, '1', '1588844572', '1', '1588845488');
INSERT INTO `lea_system_config` VALUES (45, 38, 'APP支付APPID', 'pay_wechat_appid', 'text', 'input', 0, '', '', '', 0, 1, 1, '1', '1588854973', '1', '1588855071');
INSERT INTO `lea_system_config` VALUES (46, 38, '公众号APPID', 'pay_wechat_app_id', 'text', 'input', 0, '', 'wxcf8c233220bbf42f', '', 0, 1, 1, '1', '1588855050', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (47, 38, '小程序APPID', 'pay_wechat_miniapp_id', 'text', 'input', 0, '', 'wxe37eb9fc00f03a58', '', 0, 1, 1, '1', '1588855120', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (48, 38, '商户号', 'pay_wechat_mch_id', 'text', 'input', 0, '', '1588549971', '', 0, 1, 1, '1', '1588855177', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (49, 38, 'API密钥', 'pay_wechat_key', 'text', 'input', 0, '', 'wsCQDTupznzYfH8oKH89PVvbUC5h4tb0', '', 0, 1, 1, '1', '1588855400', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (50, 38, '支付证书', 'pay_wechat_apiclient_cert', 'file', 'input', 0, '', '/upload/file/20200507/c0b5fc54d03d194078899202059e41a1.pem', '', 0, 1, 1, '1', '1588855742', '1', '1588856093');
INSERT INTO `lea_system_config` VALUES (51, 38, '支付密钥', 'pay_wechat_apiclient_key', 'file', 'input', 0, '', '/upload/file/20200507/53315d3c81bd5e7d6626410cc81f6d45.pem', '', 0, 1, 1, '1', '1588855797', '1', '1588856105');
INSERT INTO `lea_system_config` VALUES (52, 1, '网站域名', 'domain', 'text', 'input', 0, '', 'https://learn.leapy.cn', '', 0, 1, 1, '1', '1588858018', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (53, 39, '支付宝APPID', 'pay_alipay_app_id', 'text', 'input', 0, '', '2018071160550945', '', 0, 1, 1, '1', '1588894650', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (54, 39, '支付宝公钥', 'pay_alipay_ali_public_key', 'text', 'input', 0, '', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqdwBWnAd0DT973SyIGheDBWFpbRhEowyQwo5K/ryDLl5jQcBnhufgtvxYu7OIP365maGnEjb1VokNFi+9jWLogl9cgHKVOCTpmEwtAfjC6LT2+8bCp/xTQyFtvL5rvQBt5vDiM6n1t3NACPOBKEo5dJoPHv0Frdvmmqs8pWbw1gJDKmVdAxh8YYP5/b4mtG+JruPYOjTzuYms5UPbW3N3/JnMCeoQcJHVOpyZsvztJFqaASMA0OY9N5u8Wr6wJiifN+PWUa8eKFVJ2wc7fDKeNIqUpIP+YiQjzz69h0//3inLeshLsYlEQCjXJUDveXTY/PKBLm3vmSrY0zF2cAt2QIDAQAB', '', 0, 1, 1, '1', '1588894847', '1', '1588895236');
INSERT INTO `lea_system_config` VALUES (55, 39, '支付宝私钥', 'pay_alipay_private_key', 'text', 'input', 0, '', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCp3AFacB3QNP3vdLIgaF4MFYWltGESjDJDCjkr+vIMuXmNBwGeG5+C2/Fi7s4g/frmZoacSNvVWiQ0WL72NYuiCX1yAcpU4JOmYTC0B+MLotPb7xsKn/FNDIW28vmu9AG3m8OIzqfW3c0AI84EoSjl0mg8e/QWt2+aaqzylZvDWAkMqZV0DGHxhg/n9via0b4mu49g6NPO5iazlQ9tbc3f8mcwJ6hBwkdU6nJmy/O0kWpoBIwDQ5j03m7xavrAmKJ8349ZRrx4oVUnbBzt8Mp40ipSkg/5iJCPPPr2HT//eKct6yEuxiURAKNclQO95dNj88oEube+ZKtjTMXZwC3ZAgMBAAECggEAPjS9JiLDOFn/2W8SQP4X2zMSk+HgXwuK6LRYxbuMY46VbklvlTimjSUBXOr6AGkjNre7eobQQ21UrvsFTGPFtFznXRY8xCLOz/LuBDCTPNKv5e7GJ3j1xPLeEWcge6sO6fAYhwSvwOfPyMpUC6v9r1UEKYp3lM4vCA0jM2AJAFum+XrGz0zLyKyaSb88GdxTU8FsbM/EbJn6ReQmzNF5O0P+mrBBhb5JQ0a8ixsOB6DIc48tJGMWFf+AVb4QG93qmUP9vyErJCEj6/Cz8gF7SxOE88YtS/baiJGedLayS0Kzxr5Fy2ch/+7q5CLg5n/oN//gJcxIFcGvY/kwp0d4pQKBgQDjpxxIDPSR/FRpgqZXQwK+eZ5aW1GgILZeGH/iF1vsqY3eDqwxD3+fQARHUTYTy86pRTgbEhHAFItKe9cwd2CztDkiz/Avw3DCNmVE6H14deqb89h3fxMeVwuBzsidvvQB0nFbtCDaiG+YGDndh3gVrPY8Bz18dTDBDnrHHh44KwKBgQC/Ap1fjkjwp8j42kO3DvQoaN/Pd1rA/kZoc4GqofUEM1GE6Qx98rPQgCicMMycvJrGzoSg8d/6l19JplmFrn52qKqdnEg+TBTv8H9XY8cqEjDzOggkE4ypRidZypjKdtHmprQ6K8fICs1SGc+aSgDUzuR3U/Om4C+E8R3ujtVMCwKBgQDKwO4WWbuFPcfshNkjhOIvxN+9N/HV/OyPl6BmPEm52TUqHcVMmLIgooJtBi50qSMxbR3QNmKqwWFhgDSizN/KjWwJzkrsL1QBFTNSkQIWxGakaSRVIU9kyT/NZ98TZ5uo98XQV/ieyb8iJgl7fQj9vSM9SXGApFs8xmmhZ/igKwKBgCqei7zJg67m0SntkZRj6sildeLVz9MmKVGfDDylfIUeaj8MvPPRVpvcLLOFE/KZBrP7Wo6KyZ4hbmqBipIQeDlDsyYNu/Tihv1unQtDwSm6+18aAL0D+6u9coRPdz4duwILCkW8hQw2lM+P4MmdX4gcTc/uVHxUo2W3YyVai283AoGAB4+/SHoXFkN+Wez0mxOcQ68o+5SiVDVi19nH1zRY8rxjoxIZ7OkQYyBNMIaT7dwchlLSevUyRI8q56m2vFsYI5LSBnm6ZKfTZhT1DrcpRdk7UFZCi+MQ8PXxDlsXilZOUNvTyBqCsBzRjPehHrzMiv9RSB61uncQnJy0+d1D3OU=', '', 0, 1, 1, '1', '1588894902', '1', '1588895266');
INSERT INTO `lea_system_config` VALUES (56, 39, '应用公钥证书路径', 'pay_alipay_app_cert_public_key', 'file', 'input', 0, '', '', '公钥证书模式使用', 0, 1, 1, '1', '1588895349', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (57, 39, '支付宝根证书路径', 'pay_alipay_alipay_root_cert', 'file', 'input', 0, '', '', '公钥证书模式使用', 0, 1, 1, '1', '1588895390', '1', '1588895402');
INSERT INTO `lea_system_config` VALUES (58, 14, '小程序Token', 'miniprogram_token', 'text', 'input', 0, '', 'learn.leapy.cn', '', 0, 1, 1, '1', '1589007729', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (59, 14, 'EncodingAESKey', 'miniprogram_aeskey', 'text', 'input', 0, '', '4aFLNbclHer8Qhx4PdmBUhohsMR7Ngm0lsQwgllwk4H', '', 0, 1, 1, '1', '1589007789', '1', '1589007836');
INSERT INTO `lea_system_config` VALUES (60, 14, '加密方式', 'miniprogram_encry', 'radio', 'input', 0, '1=>明文模式\n2=> 兼容模式\n3=> 安全模式（推荐）', '1', '', 0, 1, 1, '1', '1589007953', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (61, 14, '接口地址', 'miniprogram_url', 'text', 'input', 0, '', 'https://learn.leapy.cn/api/mini_program/serve', '', 0, 1, 1, '1', '1589008013', '1', '1589008053');
INSERT INTO `lea_system_config` VALUES (62, 14, '审核模式', 'miniprogram_audit', 'radio', 'input', 0, '0=>关闭\n1=>开启', '0', '', 0, 1, 1, '1', '1589177436', '1', '1589326389');
INSERT INTO `lea_system_config` VALUES (63, 14, '搜索提示', 'miniprogram_search', 'text', 'input', 0, '', '里派社区', '', 0, 1, 1, '1', '1589178363', NULL, NULL);
INSERT INTO `lea_system_config` VALUES (64, 4, '邮件类型', 'mail_type', 'radio', 'input', 0, '0=>其它\n1=>宝塔邮件', '1', '0::其它,1宝塔', 0, 1, 1, '1', '1589507116', NULL, NULL);

-- ----------------------------
-- Table structure for lea_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `lea_system_config_tab`;
CREATE TABLE `lea_system_config_tab`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `rank` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态1可用0不用',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lea_system_config_tab
-- ----------------------------
INSERT INTO `lea_system_config_tab` VALUES (1, '基础配置', 99, 1, '1', '1582784937', '1', '1583385482');
INSERT INTO `lea_system_config_tab` VALUES (2, '上传配置', 98, 1, '1', '1582785701', '1', '1583385489');
INSERT INTO `lea_system_config_tab` VALUES (3, '短信配置', 97, 1, '1', '1582785710', '1', '1583385498');
INSERT INTO `lea_system_config_tab` VALUES (4, '邮件配置', 96, 1, '1', '1582785719', '1', '1583385506');
INSERT INTO `lea_system_config_tab` VALUES (13, '公众号配置', 95, 1, '1', '1583221840', '1', '1583385525');
INSERT INTO `lea_system_config_tab` VALUES (14, '小程序配置', 94, 1, '1', '1583221850', '1', '1583385532');
INSERT INTO `lea_system_config_tab` VALUES (38, '微信支付', 0, 1, '1', '1588854047', '1', '1588854054');
INSERT INTO `lea_system_config_tab` VALUES (39, '支付宝支付', 0, 1, '1', '1588854063', NULL, NULL);
