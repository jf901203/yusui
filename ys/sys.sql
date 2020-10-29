/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.80
 Source Server Type    : MySQL
 Source Server Version : 100000
 Source Host           : 192.168.1.80:4006
 Source Schema         : safety

 Target Server Type    : MySQL
 Target Server Version : 100000
 File Encoding         : 65001

 Date: 13/11/2019 10:04:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_chat_group
-- ----------------------------
DROP TABLE IF EXISTS `t_chat_group`;
CREATE TABLE `t_chat_group`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` int(11) NULL DEFAULT NULL COMMENT '是否删除',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `group_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群组编号',
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群组名称',
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sessionid',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_on_line` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chat_group
-- ----------------------------
INSERT INTO `t_chat_group` VALUES ('1', '', '2019-02-05 11:12:38', NULL, NULL, '2019-02-12 11:12:44', '001', '群组一', '4363087427670016', 'test', NULL, NULL, NULL);
INSERT INTO `t_chat_group` VALUES ('110873176354852864', NULL, '2019-02-21 13:03:29', 0, NULL, '2019-02-21 13:03:29', '66611', 'ces', 'test', NULL, NULL, NULL, NULL);
INSERT INTO `t_chat_group` VALUES ('110874001642885120', NULL, '2019-02-21 13:07:25', 0, NULL, '2019-02-21 13:07:25', '002', '群组二', '4363087427670016', 'test12', NULL, NULL, NULL);
INSERT INTO `t_chat_group` VALUES ('110893180475412480', NULL, '2019-02-21 14:22:15', 0, NULL, '2019-02-21 14:22:15', '002', '群组二', '4363087427670016', 'test', NULL, NULL, NULL);
INSERT INTO `t_chat_group` VALUES ('110912130294747136', NULL, '2019-02-21 15:37:43', 0, NULL, '2019-02-21 15:37:43', '003', '群组三', '4363087427670016', 'test', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_contractor
-- ----------------------------
DROP TABLE IF EXISTS `t_contractor`;
CREATE TABLE `t_contractor`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `con_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `con_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contractor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_parent` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('40327253309001728', '', '2018-08-10 20:58:27', 0, '', '2018-08-11 17:26:38', '40322811096469504', 3.00, -1, '人工智障', NULL);
INSERT INTO `t_department` VALUES ('40322777781112832', '', '2018-08-10 20:40:40', 0, '', '2018-08-11 00:03:06', '0', 1.00, 0, '总部', b'1');
INSERT INTO `t_department` VALUES ('40322811096469504', '', '2018-08-10 20:40:48', 0, '', '2018-08-11 00:27:05', '40322777781112832', 1.00, 0, '技术部', b'1');
INSERT INTO `t_department` VALUES ('40322852833988608', '', '2018-08-10 20:40:58', 0, '', '2018-08-11 01:29:42', '40322811096469504', 1.00, 0, '研发中心', NULL);
INSERT INTO `t_department` VALUES ('40327204755738624', '', '2018-08-10 20:58:15', 0, '', '2018-08-10 22:02:15', '40322811096469504', 2.00, 0, '大数据', NULL);

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('75135930788220928', 'admin', '2018-11-14 22:15:43', 0, 'admin', '2018-11-14 23:34:01', '', '性别', 'sex');
INSERT INTO `t_dict` VALUES ('75383353938808832', 'admin', '2018-11-15 14:38:53', 0, 'admin', '2018-11-15 17:49:24', '', '消息类型', 'message_type');
INSERT INTO `t_dict` VALUES ('75388696739713024', 'admin', '2018-11-15 15:00:07', 0, 'admin', '2018-11-15 15:00:07', '', '按钮权限类型', 'permission_type');
INSERT INTO `t_dict` VALUES ('75392985935646720', 'admin', '2018-11-15 15:17:10', 0, 'admin', '2018-11-15 15:17:10', '', '腾讯云对象存储区域', 'tencent_bucket_region');
INSERT INTO `t_dict` VALUES ('206564628702957568', 'admin', '2018-11-15 15:00:07', 0, 'admin', '2018-11-15 15:00:07', '工单类型', '工单类型', 'order_type');
INSERT INTO `t_dict` VALUES ('206571378650910720', NULL, NULL, 0, NULL, NULL, '', '服务级别', 'service_level');
INSERT INTO `t_dict` VALUES ('206571571790221312', '', NULL, 0, '', NULL, '', '工单状态', 'order_status');
INSERT INTO `t_dict` VALUES ('206573260467343360', '', NULL, 0, '', NULL, '', '单位类型', 'unit_type');
INSERT INTO `t_dict` VALUES ('206574509023563776', NULL, NULL, 0, NULL, NULL, '', '来源', 'source');
INSERT INTO `t_dict` VALUES ('206574969725915136', '', NULL, 0, '', NULL, '', '事件分类', 'event_type');
INSERT INTO `t_dict` VALUES ('206578284979294208', NULL, NULL, 0, NULL, NULL, '', '投诉级别', 'complaint_level');
INSERT INTO `t_dict` VALUES ('206613259137060864', NULL, NULL, 0, NULL, NULL, '', '项目名称', 'project_name');
INSERT INTO `t_dict` VALUES ('206857128927825920', NULL, NULL, 0, NULL, NULL, '', '厂商', 'vendor');
INSERT INTO `t_dict` VALUES ('206858147967537152', '', NULL, 0, '', NULL, '', '服务状态', 'service_status');

-- ----------------------------
-- Table structure for t_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE `t_dict_data`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` decimal(10, 2) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict_data
-- ----------------------------
INSERT INTO `t_dict_data` VALUES ('75158227712479232', 'admin', '2018-11-14 23:44:19', 0, 'admin', '2018-11-14 23:50:23', '', '75135930788220928', 0.00, 0, '男', '1');
INSERT INTO `t_dict_data` VALUES ('75159254272577536', 'admin', '2018-11-14 23:48:24', 0, 'admin', '2018-11-14 23:50:14', '', '75135930788220928', 1.00, 0, '女', '0');
INSERT INTO `t_dict_data` VALUES ('75159898425397248', 'admin', '2018-11-14 23:50:57', 0, 'admin', '2018-11-15 17:27:15', '', '75135930788220928', 2.00, -1, '保密', '2');
INSERT INTO `t_dict_data` VALUES ('75385648017575936', 'admin', '2018-11-15 14:48:00', 0, 'admin', '2018-11-15 14:48:41', '', '75383353938808832', 0.00, 0, '系统公告', '0');
INSERT INTO `t_dict_data` VALUES ('75385706913992704', 'admin', '2018-11-15 14:48:14', 0, 'admin', '2018-11-15 14:48:44', '', '75383353938808832', 1.00, 0, '提醒', '1');
INSERT INTO `t_dict_data` VALUES ('75385774274514944', 'admin', '2018-11-15 14:48:30', 0, 'admin', '2018-11-15 14:48:48', '', '75383353938808832', 2.00, 0, '私信', '2');
INSERT INTO `t_dict_data` VALUES ('75390787835138048', 'admin', '2018-11-15 15:08:26', 0, 'admin', '2018-11-15 15:08:26', '', '75388696739713024', 0.00, 0, '查看操作(view)', 'view');
INSERT INTO `t_dict_data` VALUES ('75390886501945344', 'admin', '2018-11-15 15:08:49', 0, 'admin', '2018-11-15 15:08:57', '', '75388696739713024', 1.00, 0, '添加操作(add)', 'add');
INSERT INTO `t_dict_data` VALUES ('75390993939042304', 'admin', '2018-11-15 15:09:15', 0, 'admin', '2018-11-15 15:09:15', '', '75388696739713024', 2.00, 0, '编辑操作(edit)', 'edit');
INSERT INTO `t_dict_data` VALUES ('75391067532300288', 'admin', '2018-11-15 15:09:32', 0, 'admin', '2018-11-15 15:09:32', '', '75388696739713024', 3.00, 0, '删除操作(delete)', 'delete');
INSERT INTO `t_dict_data` VALUES ('75391126902673408', 'admin', '2018-11-15 15:09:46', 0, 'admin', '2018-11-15 15:09:46', '', '75388696739713024', 4.00, 0, '清空操作(clear)', 'clear');
INSERT INTO `t_dict_data` VALUES ('75391192883269632', 'admin', '2018-11-15 15:10:02', 0, 'admin', '2018-11-15 15:10:02', '', '75388696739713024', 5.00, 0, '启用操作(enable)', 'enable');
INSERT INTO `t_dict_data` VALUES ('75391251024711680', 'admin', '2018-11-15 15:10:16', 0, 'admin', '2018-11-15 15:10:16', '', '75388696739713024', 6.00, 0, '禁用操作(disable)', 'disable');
INSERT INTO `t_dict_data` VALUES ('75391297124306944', 'admin', '2018-11-15 15:10:27', 0, 'admin', '2018-11-15 15:10:27', '', '75388696739713024', 7.00, 0, '搜索操作(search)', 'search');
INSERT INTO `t_dict_data` VALUES ('75391343379091456', 'admin', '2018-11-15 15:10:38', 0, 'admin', '2018-11-15 15:10:38', '', '75388696739713024', 8.00, 0, '上传文件(upload)', 'upload');
INSERT INTO `t_dict_data` VALUES ('75391407526776832', 'admin', '2018-11-15 15:10:53', 0, 'admin', '2018-11-15 15:10:53', '', '75388696739713024', 9.00, 0, '导出操作(output)', 'output');
INSERT INTO `t_dict_data` VALUES ('75391475042488320', 'admin', '2018-11-15 15:11:09', 0, 'admin', '2018-11-15 15:11:09', '', '75388696739713024', 10.00, 0, '导入操作(input)', 'input');
INSERT INTO `t_dict_data` VALUES ('75391522182270976', 'admin', '2018-11-15 15:11:21', 0, 'admin', '2018-11-15 15:11:21', '', '75388696739713024', 11.00, 0, '分配权限(editPerm)', 'editPerm');
INSERT INTO `t_dict_data` VALUES ('75391576364290048', 'admin', '2018-11-15 15:11:34', 0, 'admin', '2018-11-15 15:11:34', '', '75388696739713024', 12.00, 0, '设为默认(setDefault)', 'setDefault');
INSERT INTO `t_dict_data` VALUES ('75391798033256448', 'admin', '2018-11-15 15:12:26', 0, 'admin', '2018-11-15 15:12:26', '', '75388696739713024', 13.00, 0, '其他操作(other)', 'other');
INSERT INTO `t_dict_data` VALUES ('75393605291741184', 'admin', '2018-11-15 15:19:37', 0, 'admin', '2018-11-15 15:19:37', '', '75392985935646720', 0.00, 0, '北京一区（华北）', 'ap-beijing-1');
INSERT INTO `t_dict_data` VALUES ('75393681254780928', 'admin', '2018-11-15 15:19:55', 0, 'admin', '2018-11-15 15:19:55', '', '75392985935646720', 1.00, 0, '北京', 'ap-beijing');
INSERT INTO `t_dict_data` VALUES ('75393767619694592', 'admin', '2018-11-15 15:20:16', 0, 'admin', '2018-11-15 15:20:16', '', '75392985935646720', 2.00, 0, '上海（华东）', 'ap-shanghai');
INSERT INTO `t_dict_data` VALUES ('75393851484803072', 'admin', '2018-11-15 15:20:36', 0, 'admin', '2018-11-15 15:20:36', '', '75392985935646720', 3.00, 0, '广州（华南）', 'ap-guangzhou');
INSERT INTO `t_dict_data` VALUES ('75393961887272960', 'admin', '2018-11-15 15:21:02', 0, 'admin', '2018-11-15 15:21:02', '', '75392985935646720', 4.00, 0, '成都（西南）', 'ap-chengdu');
INSERT INTO `t_dict_data` VALUES ('75394053969022976', 'admin', '2018-11-15 15:21:24', 0, 'admin', '2018-11-15 15:21:24', '', '75392985935646720', 5.00, 0, '重庆', 'ap-chongqing');
INSERT INTO `t_dict_data` VALUES ('75394122474590208', 'admin', '2018-11-15 15:21:41', 0, 'admin', '2018-11-15 15:21:41', '', '75392985935646720', 6.00, 0, '新加坡', 'ap-singapore');
INSERT INTO `t_dict_data` VALUES ('75394186202845184', 'admin', '2018-11-15 15:21:56', 0, 'admin', '2018-11-15 15:21:56', '', '75392985935646720', 7.00, 0, '香港', 'ap-hongkong');
INSERT INTO `t_dict_data` VALUES ('75394254255427584', 'admin', '2018-11-15 15:22:12', 0, 'admin', '2018-11-15 15:22:12', '', '75392985935646720', 8.00, 0, '多伦多', 'na-toronto');
INSERT INTO `t_dict_data` VALUES ('75394309125312512', 'admin', '2018-11-15 15:22:25', 0, 'admin', '2018-11-15 15:22:25', '', '75392985935646720', 9.00, 0, '法兰克福', 'eu-frankfurt');
INSERT INTO `t_dict_data` VALUES ('75394367044456448', 'admin', '2018-11-15 15:22:39', 0, 'admin', '2018-11-15 15:22:39', '', '75392985935646720', 10.00, 0, '孟买', 'ap-mumbai');
INSERT INTO `t_dict_data` VALUES ('75394448523005952', 'admin', '2018-11-15 15:22:58', 0, 'admin', '2018-11-15 15:22:58', '', '75392985935646720', 11.00, 0, '首尔', 'ap-seoul');
INSERT INTO `t_dict_data` VALUES ('75394604765024256', 'admin', '2018-11-15 15:23:36', 0, 'admin', '2018-11-15 15:23:36', '', '75392985935646720', 12.00, 0, '硅谷', 'na-siliconvalley');
INSERT INTO `t_dict_data` VALUES ('75394659299364864', 'admin', '2018-11-15 15:23:49', 0, 'admin', '2018-11-15 15:23:49', '', '75392985935646720', 13.00, 0, '弗吉尼亚', 'na-ashburn');
INSERT INTO `t_dict_data` VALUES ('75394705700950016', 'admin', '2018-11-15 15:24:00', 0, 'admin', '2018-11-15 15:24:00', '', '75392985935646720', 14.00, 0, '曼谷', 'ap-bangkok');
INSERT INTO `t_dict_data` VALUES ('75394759287377920', 'admin', '2018-11-15 15:24:12', 0, 'admin', '2018-11-15 15:24:12', '', '75392985935646720', 15.00, 0, '莫斯科', 'eu-moscow');
INSERT INTO `t_dict_data` VALUES ('206564953933484032', '', NULL, 0, '', NULL, '', '206564628702957568', 1.00, 0, '故障处理流程', '1');
INSERT INTO `t_dict_data` VALUES ('206564975387348992', '', NULL, 0, '', NULL, '', '206564628702957568', 2.00, 0, '调研流转单', '2');
INSERT INTO `t_dict_data` VALUES ('206564997541662720', '', NULL, 0, '', NULL, '', '206564628702957568', 3.00, 0, '用户投诉', '3');
INSERT INTO `t_dict_data` VALUES ('206571422858874880', '', NULL, 0, '', NULL, '', '206571378650910720', 1.00, 0, '1', '1');
INSERT INTO `t_dict_data` VALUES ('206571434099609600', '', NULL, 0, '', NULL, '', '206571378650910720', 2.00, 0, '2', '2');
INSERT INTO `t_dict_data` VALUES ('206571443289329664', '', NULL, 0, '', NULL, '', '206571378650910720', 3.00, 0, '3', '3');
INSERT INTO `t_dict_data` VALUES ('206571452177059840', '', NULL, 0, '', NULL, '', '206571378650910720', 4.00, 0, '4', '4');
INSERT INTO `t_dict_data` VALUES ('206571463593955328', '', NULL, 0, '', NULL, '', '206571378650910720', 5.00, 0, '5', '5');
INSERT INTO `t_dict_data` VALUES ('206571615201267712', '', NULL, 0, '', NULL, '', '206571571790221312', 1.00, 0, '提交', '1');
INSERT INTO `t_dict_data` VALUES ('206571640090267648', '', NULL, 0, '', NULL, '', '206571571790221312', 2.00, 0, '分配', '2');
INSERT INTO `t_dict_data` VALUES ('206571679353147392', '', NULL, 0, '', NULL, '', '206571571790221312', 3.00, 0, '处理', '3');
INSERT INTO `t_dict_data` VALUES ('206571710319693824', '', NULL, 0, '', NULL, '', '206571571790221312', 4.00, 0, '完成', '4');
INSERT INTO `t_dict_data` VALUES ('206571739038093312', '', NULL, 0, '', NULL, '', '206571571790221312', 5.00, 0, '回访', '5');
INSERT INTO `t_dict_data` VALUES ('206571758000541696', '', NULL, 0, '', NULL, '', '206571571790221312', 6.00, 0, '关闭', '6');
INSERT INTO `t_dict_data` VALUES ('206573369552801792', NULL, NULL, 0, NULL, NULL, '', '206573260467343360', 3.00, 0, '学校', '3');
INSERT INTO `t_dict_data` VALUES ('206573335474081792', NULL, NULL, 0, NULL, NULL, '', '206573260467343360', 2.00, 0, '企业', '2');
INSERT INTO `t_dict_data` VALUES ('206573300585861120', NULL, NULL, 0, NULL, NULL, '', '206573260467343360', 1.00, 0, '政府', '1');
INSERT INTO `t_dict_data` VALUES ('206574552124231680', NULL, NULL, 0, NULL, NULL, '', '206574509023563776', 1.00, 0, '报警', '1');
INSERT INTO `t_dict_data` VALUES ('206574576514109440', NULL, NULL, 0, NULL, NULL, '', '206574509023563776', 2.00, 0, '邮件', '2');
INSERT INTO `t_dict_data` VALUES ('206574603663839232', NULL, NULL, 0, NULL, NULL, '', '206574509023563776', 3.00, 0, '自助', '3');
INSERT INTO `t_dict_data` VALUES ('206574640875704320', NULL, NULL, 0, NULL, NULL, '', '206574509023563776', 4.00, 0, '电话', '4');
INSERT INTO `t_dict_data` VALUES ('206574667052355584', NULL, NULL, 0, NULL, NULL, '', '206574509023563776', 5.00, 0, 'QQ接入', '5');
INSERT INTO `t_dict_data` VALUES ('206575004198899712', NULL, NULL, 0, NULL, NULL, '', '206574969725915136', 1.00, 0, '应用系统', '1');
INSERT INTO `t_dict_data` VALUES ('206575030241333248', NULL, NULL, 0, NULL, NULL, '', '206574969725915136', 2.00, 0, '网络问题', '2');
INSERT INTO `t_dict_data` VALUES ('206575051615506432', NULL, NULL, 0, NULL, NULL, '', '206574969725915136', 3.00, 0, '安防监控', '3');
INSERT INTO `t_dict_data` VALUES ('206575073971146752', NULL, NULL, 0, NULL, NULL, '', '206574969725915136', 4.00, 0, '校园网', '4');
INSERT INTO `t_dict_data` VALUES ('206578329489248256', NULL, NULL, 0, NULL, NULL, '', '206578284979294208', 1.00, 0, '轻微', '1');
INSERT INTO `t_dict_data` VALUES ('206578362297094144', NULL, NULL, 0, NULL, NULL, '', '206578284979294208', 2.00, 0, '一般', '2');
INSERT INTO `t_dict_data` VALUES ('206578383675461632', NULL, NULL, 0, NULL, NULL, '', '206578284979294208', 3.00, 0, '严重', '3');
INSERT INTO `t_dict_data` VALUES ('206857217545080832', NULL, NULL, 0, NULL, NULL, '', '206857128927825920', 2.00, 0, '中兴', '2');
INSERT INTO `t_dict_data` VALUES ('206857190940610560', NULL, NULL, 0, NULL, NULL, '', '206857128927825920', 1.00, 0, '华为', '1');
INSERT INTO `t_dict_data` VALUES ('206857357731303424', NULL, NULL, 0, NULL, NULL, '', '206613259137060864', 1.00, 0, '光纤网维护项目', '1');
INSERT INTO `t_dict_data` VALUES ('206857379348746240', NULL, NULL, 0, NULL, NULL, '', '206613259137060864', 2.00, 0, '射频优化', '2');
INSERT INTO `t_dict_data` VALUES ('206857410403373056', NULL, NULL, 0, NULL, NULL, '', '206613259137060864', 3.00, 0, '运维管理', '3');
INSERT INTO `t_dict_data` VALUES ('206858178506264576', NULL, NULL, 0, NULL, NULL, '', '206858147967537152', 1.00, 0, '启用', '1');
INSERT INTO `t_dict_data` VALUES ('206858198932525056', NULL, NULL, 0, NULL, NULL, '', '206858147967537152', 2.00, 0, '未启用', '2');
INSERT INTO `t_dict_data` VALUES ('206858244407169024', NULL, NULL, 0, NULL, NULL, '', '206858147967537152', 3.00, 0, '审批', '3');
INSERT INTO `t_dict_data` VALUES ('206858269229060096', NULL, NULL, 0, NULL, NULL, '', '206858147967537152', 4.00, 0, '过期', '4');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` bigint(20) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `f_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_httpcookie
-- ----------------------------
DROP TABLE IF EXISTS `t_httpcookie`;
CREATE TABLE `t_httpcookie`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isdelete` int(11) NULL DEFAULT NULL,
  `session_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `session_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `cost_time` int(11) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('94523220270518272', NULL, '2019-01-07 10:13:55', 0, NULL, '2019-01-07 10:13:55', 2311, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('94541330293723136', NULL, '2019-01-07 11:25:51', 0, NULL, '2019-01-07 11:25:51', 486, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 0);
INSERT INTO `t_log` VALUES ('94633744354250752', NULL, '2019-01-07 17:33:04', 0, NULL, '2019-01-07 17:33:04', 262, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('94902744938188800', NULL, '2019-01-08 11:22:01', 0, NULL, '2019-01-08 11:22:01', 2323, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('94905423705935872', NULL, '2019-01-08 11:32:37', 0, NULL, '2019-01-08 11:32:37', 193, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('94950729818574848', NULL, '2019-01-08 14:32:39', 0, NULL, '2019-01-08 14:32:39', 520, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95239032920870912', NULL, '2019-01-09 09:38:18', 0, NULL, '2019-01-09 09:38:18', 2458, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95239842375405568', NULL, '2019-01-09 09:41:29', 0, NULL, '2019-01-09 09:41:29', 497, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95250875043287040', NULL, '2019-01-09 10:25:19', 0, NULL, '2019-01-09 10:25:19', 298, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"132\"}', 'POST', '/xboot/login', '132', 1);
INSERT INTO `t_log` VALUES ('95251272814301184', NULL, '2019-01-09 10:26:54', 0, NULL, '2019-01-09 10:26:54', 263, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"888\"}', 'POST', '/xboot/login', '888', 1);
INSERT INTO `t_log` VALUES ('95252057262395392', NULL, '2019-01-09 10:30:01', 0, NULL, '2019-01-09 10:30:01', 300, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95261922244431872', NULL, '2019-01-09 11:09:13', 0, NULL, '2019-01-09 11:09:13', 210, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95262635724902400', NULL, '2019-01-09 11:12:03', 0, NULL, '2019-01-09 11:12:03', 279, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95297701373022208', NULL, '2019-01-09 13:31:23', 0, NULL, '2019-01-09 13:31:23', 290, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95305957784948736', NULL, '2019-01-09 14:04:12', 0, NULL, '2019-01-09 14:04:12', 385, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95308173782552576', NULL, '2019-01-09 14:13:00', 0, NULL, '2019-01-09 14:13:00', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95310943797383168', NULL, '2019-01-09 14:24:01', 0, NULL, '2019-01-09 14:24:01', 547, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95311833031774208', NULL, '2019-01-09 14:27:33', 0, NULL, '2019-01-09 14:27:33', 216, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95313461071843328', NULL, '2019-01-09 14:34:01', 0, NULL, '2019-01-09 14:34:01', 206, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95315683503509504', NULL, '2019-01-09 14:42:51', 0, NULL, '2019-01-09 14:42:51', 229, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95321910484668416', NULL, '2019-01-09 15:07:35', 0, NULL, '2019-01-09 15:07:35', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95322203884621824', NULL, '2019-01-09 15:08:45', 0, NULL, '2019-01-09 15:08:45', 255, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95322475373531136', NULL, '2019-01-09 15:09:50', 0, NULL, '2019-01-09 15:09:50', 164, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95332933417570304', NULL, '2019-01-09 15:51:23', 0, NULL, '2019-01-09 15:51:23', 273, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95666961450536960', NULL, '2019-01-10 13:58:42', 0, NULL, '2019-01-10 13:58:42', 336, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95667080103202816', NULL, '2019-01-10 13:59:10', 0, NULL, '2019-01-10 13:59:10', 263, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95667701644529664', NULL, '2019-01-10 14:01:38', 0, NULL, '2019-01-10 14:01:38', 197, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95667776319918080', NULL, '2019-01-10 14:01:56', 0, NULL, '2019-01-10 14:01:56', 235, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95699792084078592', NULL, '2019-01-10 16:09:09', 0, NULL, '2019-01-10 16:09:09', 379, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95717617544728576', NULL, '2019-01-10 17:19:59', 0, NULL, '2019-01-10 17:19:59', 319, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95971902002040832', NULL, '2019-01-11 10:10:26', 0, NULL, '2019-01-11 10:10:26', 309, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('95999039295721472', NULL, '2019-01-11 11:58:16', 0, NULL, '2019-01-11 11:58:16', 556, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('96073237703692288', NULL, '2019-01-11 16:53:06', 0, NULL, '2019-01-11 16:53:06', 288, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('96082334075326464', NULL, '2019-01-11 17:29:15', 0, NULL, '2019-01-11 17:29:15', 754, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('96083363202338816', NULL, '2019-01-11 17:33:20', 0, NULL, '2019-01-11 17:33:20', 648, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('96084967158714368', NULL, '2019-01-11 17:39:43', 0, NULL, '2019-01-11 17:39:43', 520, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('96085380213772288', NULL, '2019-01-11 17:41:21', 0, NULL, '2019-01-11 17:41:21', 271, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('96086056822116352', NULL, '2019-01-11 17:44:02', 0, NULL, '2019-01-11 17:44:02', 260, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"ces\"}', 'POST', '/xboot/login', 'ces', 1);
INSERT INTO `t_log` VALUES ('96086329103749120', NULL, '2019-01-11 17:45:07', 0, NULL, '2019-01-11 17:45:07', 269, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"ces\"}', 'POST', '/xboot/login', 'ces', 1);
INSERT INTO `t_log` VALUES ('96086433432866816', NULL, '2019-01-11 17:45:32', 0, NULL, '2019-01-11 17:45:32', 246, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('96086656754388992', NULL, '2019-01-11 17:46:25', 0, NULL, '2019-01-11 17:46:25', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"ces\"}', 'POST', '/xboot/login', 'ces', 1);
INSERT INTO `t_log` VALUES ('96091347726897152', NULL, '2019-01-11 18:05:03', 0, NULL, '2019-01-11 18:05:03', 296, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('97054640184496128', NULL, '2019-01-14 09:52:50', 0, NULL, '2019-01-14 09:52:50', 188, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('97872132318433280', NULL, '2019-01-16 16:01:16', 0, NULL, '2019-01-16 16:01:16', 534, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('97877265714515968', NULL, '2019-01-16 16:21:40', 0, NULL, '2019-01-16 16:21:40', 231, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('102559728697085952', NULL, '2019-01-29 14:28:06', 0, NULL, '2019-01-29 14:28:06', 865, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('107567911555567616', NULL, '2019-02-12 10:08:50', 0, NULL, '2019-02-12 10:08:50', 549, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('107681318640291840', NULL, '2019-02-12 17:39:29', 0, NULL, '2019-02-12 17:39:29', 1121, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('107685284736405504', NULL, '2019-02-12 17:55:13', 0, NULL, '2019-02-12 17:55:13', 301, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('107686681179590656', NULL, '2019-02-12 18:00:46', 0, NULL, '2019-02-12 18:00:46', 261, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('107935547497910272', NULL, '2019-02-13 10:29:41', 0, NULL, '2019-02-13 10:29:41', 302, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('110473181969518592', NULL, '2019-02-20 10:33:21', 0, NULL, '2019-02-20 10:33:21', 517, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('112643442051387392', NULL, '2019-02-26 10:17:11', 0, NULL, '2019-02-26 10:17:11', 508, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('115270056245465088', NULL, '2019-03-05 16:14:26', 0, NULL, '2019-03-05 16:14:26', 1098, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('115287705411129344', NULL, '2019-03-05 17:24:50', 0, NULL, '2019-03-05 17:24:50', 222, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('115288995612594176', NULL, '2019-03-05 17:29:46', 0, NULL, '2019-03-05 17:29:46', 22204, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161722671464189952', NULL, '2019-07-11 20:40:34', 0, NULL, '2019-07-11 20:40:34', 3157, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161729212430946304', NULL, '2019-07-11 21:06:31', 0, NULL, '2019-07-11 21:06:31', 689, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161939810397720576', NULL, '2019-07-12 11:03:21', 0, NULL, '2019-07-12 11:03:21', 670, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162005334620114944', NULL, '2019-07-12 15:23:43', 0, NULL, '2019-07-12 15:23:43', 708, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162010191150190592', NULL, '2019-07-12 15:43:01', 0, NULL, '2019-07-12 15:43:01', 230, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162010418485661696', NULL, '2019-07-12 15:43:55', 0, NULL, '2019-07-12 15:43:55', 256, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('162010838620704768', NULL, '2019-07-12 15:45:56', 0, NULL, '2019-07-12 15:45:56', 21189, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162010916878028800', NULL, '2019-07-12 15:46:12', 0, NULL, '2019-07-12 15:46:12', 21149, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162011113779630080', NULL, '2019-07-12 15:46:50', 0, NULL, '2019-07-12 15:46:50', 11369, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162011411529076736', NULL, '2019-07-12 15:47:52', 0, NULL, '2019-07-12 15:47:52', 481, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('162018813133459456', NULL, '2019-07-12 16:17:21', 0, NULL, '2019-07-12 16:17:21', 2122, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('162022468070936576', NULL, '2019-07-12 16:31:48', 0, NULL, '2019-07-12 16:31:48', 136, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('162022571351478272', NULL, '2019-07-12 16:32:21', 0, NULL, '2019-07-12 16:32:21', 8224, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('162030051557117952', NULL, '2019-07-12 17:02:04', 0, NULL, '2019-07-12 17:02:04', 11587, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162407545296654336', NULL, '2019-07-13 18:01:59', 0, NULL, '2019-07-13 18:01:59', 1803, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162407729871196160', NULL, '2019-07-13 18:02:41', 0, NULL, '2019-07-13 18:02:41', 156, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('162996953557241856', NULL, '2019-07-15 09:04:03', 0, NULL, '2019-07-15 09:04:03', 123, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('162997258999042048', NULL, '2019-07-15 09:05:16', 0, NULL, '2019-07-15 09:05:16', 143, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('162997596502102016', NULL, '2019-07-15 09:06:39', 0, NULL, '2019-07-15 09:06:39', 5142, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163001399410429952', NULL, '2019-07-15 09:21:43', 0, NULL, '2019-07-15 09:21:43', 142, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('163003113769275392', NULL, '2019-07-15 09:28:32', 0, NULL, '2019-07-15 09:28:32', 338, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163011185149480960', NULL, '2019-07-15 10:00:54', 0, NULL, '2019-07-15 10:00:54', 21289, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163012586130903040', NULL, '2019-07-15 10:06:14', 0, NULL, '2019-07-15 10:06:14', 6574, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163013325360205825', NULL, '2019-07-15 10:09:07', 0, NULL, '2019-07-15 10:09:07', 538, '127.0.0.1', '未知', '获取全部用户数据', '{}', 'GET', '/xboot/user/getAll', 'admin1', 0);
INSERT INTO `t_log` VALUES ('163025098494709760', NULL, '2019-07-15 10:55:54', 0, NULL, '2019-07-15 10:55:54', 279, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163070971102629888', NULL, '2019-07-15 13:58:10', 0, NULL, '2019-07-15 13:58:10', 228, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163071954918576128', NULL, '2019-07-15 14:02:05', 0, NULL, '2019-07-15 14:02:05', 191, '192.168.1.6', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163080355320958977', NULL, '2019-07-15 14:35:28', 0, NULL, '2019-07-15 14:35:28', 190, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163071697690300416\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163081198032130048', NULL, '2019-07-15 14:38:49', 0, NULL, '2019-07-15 14:38:49', 205, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163071697690300416\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163081273420550144', NULL, '2019-07-15 14:39:07', 0, NULL, '2019-07-15 14:39:07', 163, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163081007430373376\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163081371592429568', NULL, '2019-07-15 14:39:30', 0, NULL, '2019-07-15 14:39:30', 171, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163030784259657728\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163081831766298624', NULL, '2019-07-15 14:41:20', 0, NULL, '2019-07-15 14:41:20', 272, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163026456031531008\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163082431421747200', NULL, '2019-07-15 14:43:43', 0, NULL, '2019-07-15 14:43:43', 4833, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163026456031531008\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163082494210478080', NULL, '2019-07-15 14:43:58', 0, NULL, '2019-07-15 14:43:58', 186, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163030784259657728\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163085534887940096', NULL, '2019-07-15 14:56:03', 0, NULL, '2019-07-15 14:56:03', 225, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163085062860967936\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163087011924676608', NULL, '2019-07-15 15:01:55', 0, NULL, '2019-07-15 15:01:55', 154, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('163094283857956864', NULL, '2019-07-15 15:31:10', 0, NULL, '2019-07-15 15:31:10', 21297, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163094363981746176', NULL, '2019-07-15 15:31:18', 0, NULL, '2019-07-15 15:31:18', 21213, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163094673106145280', NULL, '2019-07-15 15:32:22', 0, NULL, '2019-07-15 15:32:22', 629, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163095306932588544', NULL, '2019-07-15 15:34:53', 0, NULL, '2019-07-15 15:34:53', 516, '192.168.56.1', '未知', '根据id批量删除文件数据', '{\"ids\":\"163089871328514048\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163105098443001856', NULL, '2019-07-15 16:13:47', 0, NULL, '2019-07-15 16:13:47', 545, '192.168.1.6', '未知', '根据id批量删除文件数据', '{\"ids\":\"163089889867337728\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163214533182099456', NULL, '2019-07-15 23:28:39', 0, NULL, '2019-07-15 23:28:39', 1136, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('163366281389543424', NULL, '2019-07-16 09:31:41', 0, NULL, '2019-07-16 09:31:41', 6998, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163366433907019776', NULL, '2019-07-16 09:32:14', 0, NULL, '2019-07-16 09:32:14', 360, '127.0.0.1', '未知', '添加用户', '{\"password\":\"已被隐藏\",\"departmentTitle\":\"\",\"sex\":\"1\",\"roles\":\"496138616573952\",\"departmentId\":\"\",\"mobile\":\"18588679473\",\"avatar\":\"\",\"type\":\"1\",\"email\":\"519052532@qq.com\",\"username\":\"Lyoko\"}', 'POST', '/xboot/user/admin/add', 'admin', 0);
INSERT INTO `t_log` VALUES ('163366503851233280', NULL, '2019-07-16 09:32:31', 0, NULL, '2019-07-16 09:32:31', 228, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163366547753013248', NULL, '2019-07-16 09:32:41', 0, NULL, '2019-07-16 09:32:41', 253, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lyoko\"}', 'POST', '/xboot/login', 'Lyoko', 1);
INSERT INTO `t_log` VALUES ('163367371707256832', NULL, '2019-07-16 09:36:04', 0, NULL, '2019-07-16 09:36:04', 21206, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163390115886927872', NULL, '2019-07-16 11:06:24', 0, NULL, '2019-07-16 11:06:24', 9583, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163390155506323456', NULL, '2019-07-16 11:06:33', 0, NULL, '2019-07-16 11:06:33', 3342, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lyoko\"}', 'POST', '/xboot/login', 'Lyoko', 1);
INSERT INTO `t_log` VALUES ('163433732835905536', NULL, '2019-07-16 13:59:40', 0, NULL, '2019-07-16 13:59:40', 291, '192.168.1.13', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163442841375215616', NULL, '2019-07-16 14:35:51', 0, NULL, '2019-07-16 14:35:51', 136, '192.168.1.6', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163485328781348864', NULL, '2019-07-16 17:24:41', 0, NULL, '2019-07-16 17:24:41', 292, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163485748551487488', NULL, '2019-07-16 17:26:24', 0, NULL, '2019-07-16 17:26:24', 7385, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163486074985779200', NULL, '2019-07-16 17:27:39', 0, NULL, '2019-07-16 17:27:39', 385, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163486354297065472', NULL, '2019-07-16 17:28:46', 0, NULL, '2019-07-16 17:28:46', 311, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163486571310354432', NULL, '2019-07-16 17:29:37', 0, NULL, '2019-07-16 17:29:37', 233, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163486838009368576', NULL, '2019-07-16 17:31:02', 0, NULL, '2019-07-16 17:31:02', 21145, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163486971111411712', NULL, '2019-07-16 17:31:19', 0, NULL, '2019-07-16 17:31:19', 21233, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163728606332194816', NULL, '2019-07-17 09:31:26', 0, NULL, '2019-07-17 09:31:26', 7069, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163728919399239680', NULL, '2019-07-17 09:32:38', 0, NULL, '2019-07-17 09:32:38', 304, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163729013452312576', NULL, '2019-07-17 09:33:00', 0, NULL, '2019-07-17 09:33:00', 299, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lyoko\"}', 'POST', '/xboot/login', 'Lyoko', 1);
INSERT INTO `t_log` VALUES ('163729134046941184', NULL, '2019-07-17 09:33:29', 0, NULL, '2019-07-17 09:33:29', 219, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163731309649203200', NULL, '2019-07-17 09:42:07', 0, NULL, '2019-07-17 09:42:07', 323, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163731333812588544', NULL, '2019-07-17 09:42:13', 0, NULL, '2019-07-17 09:42:13', 215, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163733527437774848', NULL, '2019-07-17 09:50:59', 0, NULL, '2019-07-17 09:50:59', 15710, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163734308157132800', NULL, '2019-07-17 09:54:02', 0, NULL, '2019-07-17 09:54:02', 252, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163746244563308544', NULL, '2019-07-17 10:41:31', 0, NULL, '2019-07-17 10:41:31', 6887, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163746810735628288', NULL, '2019-07-17 10:43:43', 0, NULL, '2019-07-17 10:43:43', 144, '192.168.1.6', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163825584793718784', NULL, '2019-07-17 15:56:45', 0, NULL, '2019-07-17 15:56:45', 1008, '192.168.1.6', '未知', '根据id批量删除文件数据', '{\"ids\":\"163824086793850880,163823673457774592,163816145302851584,163814542223085568,163807657977712640,163800913981476864,163800869739958272,163747477982285824,163486762079883264,163485266424631296\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163825599599611904', NULL, '2019-07-17 15:56:48', 0, NULL, '2019-07-17 15:56:48', 415, '192.168.1.6', '未知', '根据id批量删除文件数据', '{\"ids\":\"163484800294850560,163481718005698560,163398408848019456,163367151976058880,163116815004733440,163116534749728768,163089807512178688,163087226983419904,163087208599785472,163087191688351744\"}', 'DELETE', '/xboot/file/removeByIds', 'admin', 0);
INSERT INTO `t_log` VALUES ('163843284576243712', NULL, '2019-07-17 17:07:05', 0, NULL, '2019-07-17 17:07:05', 1003, '192.168.1.6', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163843675695091712', NULL, '2019-07-17 17:08:38', 0, NULL, '2019-07-17 17:08:38', 257, '192.168.1.6', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163844231079661568', NULL, '2019-07-17 17:11:08', 0, NULL, '2019-07-17 17:11:08', 21139, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163844261249290240', NULL, '2019-07-17 17:11:10', 0, NULL, '2019-07-17 17:11:10', 21143, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163844331063480320', NULL, '2019-07-17 17:11:17', 0, NULL, '2019-07-17 17:11:17', 3187, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163844990248685568', NULL, '2019-07-17 17:13:52', 0, NULL, '2019-07-17 17:13:52', 383, '192.168.1.6', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163845045911293952', NULL, '2019-07-17 17:14:04', 0, NULL, '2019-07-17 17:14:04', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('163845294188924929', NULL, '2019-07-17 17:15:51', 0, NULL, '2019-07-17 17:15:51', 296, '192.168.1.6', '未知', '获取全部用户数据', '{}', 'GET', '/xboot/user/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('164089781838417920', NULL, '2019-07-18 09:26:36', 0, NULL, '2019-07-18 09:26:36', 5533, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164090835502108672', NULL, '2019-07-18 09:30:54', 0, NULL, '2019-07-18 09:30:54', 21167, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164090843337068544', NULL, '2019-07-18 09:30:54', 0, NULL, '2019-07-18 09:30:54', 21133, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lyoko\"}', 'POST', '/xboot/login', 'Lyoko', 1);
INSERT INTO `t_log` VALUES ('164090871136915456', NULL, '2019-07-18 09:30:56', 0, NULL, '2019-07-18 09:30:56', 11034, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164090968306356224', NULL, '2019-07-18 09:31:20', 0, NULL, '2019-07-18 09:31:20', 9140, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164090977332498432', NULL, '2019-07-18 09:31:22', 0, NULL, '2019-07-18 09:31:22', 8987, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lyoko\"}', 'POST', '/xboot/login', 'Lyoko', 1);
INSERT INTO `t_log` VALUES ('164091005123956736', NULL, '2019-07-18 09:31:28', 0, NULL, '2019-07-18 09:31:28', 2675, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164091034530222080', NULL, '2019-07-18 09:31:35', 0, NULL, '2019-07-18 09:31:35', 5570, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164091039789879296', NULL, '2019-07-18 09:31:36', 0, NULL, '2019-07-18 09:31:36', 2327, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lyoko\"}', 'POST', '/xboot/login', 'Lyoko', 1);
INSERT INTO `t_log` VALUES ('164102307938570240', NULL, '2019-07-18 10:16:27', 0, NULL, '2019-07-18 10:16:27', 592, '192.168.1.9', '未知', '根据id批量删除文件数据', '{\"ids\":\"163825883566575616,163825820102561792,163825767334023168,163825717463748608,163825654574354432,163825635624488960\"}', 'DELETE', '/xboot/file/removeByIds', 'lecken', 0);
INSERT INTO `t_log` VALUES ('164104276564512768', NULL, '2019-07-18 10:24:10', 0, NULL, '2019-07-18 10:24:10', 494, '192.168.1.9', '未知', '根据id批量删除文件数据', '{\"ids\":\"164102886727356416,164102735325564928,164102480429322240,164102447625670656,164102365991931904\"}', 'DELETE', '/xboot/file/removeByIds', 'lecken', 0);
INSERT INTO `t_log` VALUES ('164104847132463104', NULL, '2019-07-18 10:26:28', 0, NULL, '2019-07-18 10:26:28', 4886, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('164127099504824320', NULL, '2019-07-18 11:54:51', 0, NULL, '2019-07-18 11:54:51', 366, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164127535448199168', NULL, '2019-07-18 11:56:37', 0, NULL, '2019-07-18 11:56:37', 4485, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164127554125434880', NULL, '2019-07-18 11:56:41', 0, NULL, '2019-07-18 11:56:41', 3606, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('164173415295488001', NULL, '2019-07-18 14:58:54', 0, NULL, '2019-07-18 14:58:54', 432, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164173415295488000', NULL, '2019-07-18 14:58:54', 0, NULL, '2019-07-18 14:58:54', 416, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164175097786011648', NULL, '2019-07-18 15:05:56', 0, NULL, '2019-07-18 15:05:56', 21159, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164175097957978112', NULL, '2019-07-18 15:05:56', 0, NULL, '2019-07-18 15:05:56', 21221, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164175359682547712', NULL, '2019-07-18 15:06:39', 0, NULL, '2019-07-18 15:06:39', 4315, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164176471223439360', NULL, '2019-07-18 15:11:06', 0, NULL, '2019-07-18 15:11:06', 12649, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164176471223439361', NULL, '2019-07-18 15:11:06', 0, NULL, '2019-07-18 15:11:06', 12718, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164178224908079104', NULL, '2019-07-18 15:18:00', 0, NULL, '2019-07-18 15:18:00', 922, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164178224950022144', NULL, '2019-07-18 15:18:00', 0, NULL, '2019-07-18 15:18:00', 1023, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164178667168075776', NULL, '2019-07-18 15:19:46', 0, NULL, '2019-07-18 15:19:46', 226, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164178667201630208', NULL, '2019-07-18 15:19:46', 0, NULL, '2019-07-18 15:19:46', 336, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('164451422346153984', NULL, '2019-07-19 09:23:36', 0, NULL, '2019-07-19 09:23:36', 399, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('164451476930826240', NULL, '2019-07-19 09:23:49', 0, NULL, '2019-07-19 09:23:49', 410, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165542002501357568', NULL, '2019-07-22 09:37:10', 0, NULL, '2019-07-22 09:37:10', 523, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"false\",\"username\":\"Lyoko\"}', 'POST', '/xboot/login', 'Lyoko', 1);
INSERT INTO `t_log` VALUES ('165544776601440256', NULL, '2019-07-22 09:48:12', 0, NULL, '2019-07-22 09:48:12', 8941, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"false\",\"username\":\"Lyoko\"}', 'POST', '/xboot/login', 'Lyoko', 1);
INSERT INTO `t_log` VALUES ('165549242843140096', NULL, '2019-07-22 10:06:00', 0, NULL, '2019-07-22 10:06:00', 15545, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('165549226221113345', NULL, '2019-07-22 10:06:01', 0, NULL, '2019-07-22 10:06:01', 31085, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165549226221113344', NULL, '2019-07-22 10:06:01', 0, NULL, '2019-07-22 10:06:01', 29874, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('165549226221113346', NULL, '2019-07-22 10:06:01', 0, NULL, '2019-07-22 10:06:01', 29964, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165549336116072448', NULL, '2019-07-22 10:06:22', 0, NULL, '2019-07-22 10:06:22', 6824, '192.168.1.9', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'lecken', 1);
INSERT INTO `t_log` VALUES ('204764021499367424', NULL, '2019-11-07 15:11:29', 0, NULL, '2019-11-07 15:11:29', 1009, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('204767390905405440', NULL, '2019-11-07 15:24:55', 0, NULL, '2019-11-07 15:24:55', 4487, '127.0.0.1', '未知', '批量通过ids删除', '{}', 'DELETE', '/xboot/user/delByIds/162010383144456192', 'admin', 0);
INSERT INTO `t_log` VALUES ('204767638323204096', NULL, '2019-11-07 15:25:51', 0, NULL, '2019-11-07 15:25:51', 322, '127.0.0.1', '未知', '添加用户', '{\"password\":\"已被隐藏\",\"departmentTitle\":\"\",\"sex\":\"1\",\"roles\":\"\",\"departmentId\":\"\",\"mobile\":\"18727005674\",\"avatar\":\"\",\"type\":\"0\",\"email\":\"1364.32@qq.com\",\"username\":\"Lecken\"}', 'POST', '/xboot/user/admin/add', 'admin', 0);
INSERT INTO `t_log` VALUES ('205052763804012544', NULL, '2019-11-08 10:18:50', 0, NULL, '2019-11-08 10:18:50', 79, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('205053772383129600', NULL, '2019-11-08 10:22:50', 0, NULL, '2019-11-08 10:22:50', 224, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('205054194288168960', NULL, '2019-11-08 10:24:31', 0, NULL, '2019-11-08 10:24:31', 130, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('205054601710276608', NULL, '2019-11-08 10:26:08', 0, NULL, '2019-11-08 10:26:08', 110, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"Lecken\"}', 'POST', '/xboot/login', 'Lecken', 1);
INSERT INTO `t_log` VALUES ('205054640314650624', NULL, '2019-11-08 10:26:18', 0, NULL, '2019-11-08 10:26:18', 695, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('205054820715859968', NULL, '2019-11-08 10:27:03', 0, NULL, '2019-11-08 10:27:03', 3093, '127.0.0.1', '未知', '添加用户', '{\"password\":\"已被隐藏\",\"departmentTitle\":\"\",\"sex\":\"1\",\"roles\":\"496138616573952,496138616573953,16457350655250432\",\"departmentId\":\"40322777781112832\",\"mobile\":\"18745678945\",\"avatar\":\"\",\"type\":\"1\",\"email\":\"215@qq.com\",\"username\":\"admin\"}', 'POST', '/xboot/user/admin/add', 'admin1', 0);
INSERT INTO `t_log` VALUES ('205054853989273600', NULL, '2019-11-08 10:27:08', 0, NULL, '2019-11-08 10:27:08', 118, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('205079618670039040', NULL, '2019-11-08 12:05:34', 0, NULL, '2019-11-08 12:05:34', 1119, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205079732637667328', NULL, '2019-11-08 12:06:02', 0, NULL, '2019-11-08 12:06:02', 2942, '192.168.56.1', '未知', '添加资产类型', '{}', 'PUT', '/xboot/manageType/saveManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('205079738220285952', NULL, '2019-11-08 12:06:03', 0, NULL, '2019-11-08 12:06:03', 1864, '192.168.56.1', '未知', '添加资产类型', '{}', 'PUT', '/xboot/manageType/saveManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('205079767987261440', NULL, '2019-11-08 12:06:08', 0, NULL, '2019-11-08 12:06:08', 147, '192.168.56.1', '未知', '添加资产类型', '{\"typeName\":\"其他\"}', 'PUT', '/xboot/manageType/saveManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('205079824299986944', NULL, '2019-11-08 12:06:21', 0, NULL, '2019-11-08 12:06:21', 117, '192.168.56.1', '未知', '添加资产类型', '{\"typeName\":\"其他\"}', 'PUT', '/xboot/manageType/saveManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('205079994110578688', NULL, '2019-11-08 12:07:02', 0, NULL, '2019-11-08 12:07:02', 689, '192.168.56.1', '未知', '修改资产类型', '{\"typeName\":\"测试其他\",\"id\":\"205079824270626816\"}', 'PUT', '/xboot/manageType/updateManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('205080071822643200', NULL, '2019-11-08 12:07:20', 0, NULL, '2019-11-08 12:07:20', 116, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205080179746279424', NULL, '2019-11-08 12:07:46', 0, NULL, '2019-11-08 12:07:46', 234, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205080247001944064', NULL, '2019-11-08 12:08:02', 0, NULL, '2019-11-08 12:08:02', 120, '192.168.56.1', '未知', '修改资产类型', '{\"typeName\":\"测试其他\",\"id\":\"205079824270626816\"}', 'PUT', '/xboot/manageType/updateManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('205080378703089664', NULL, '2019-11-08 12:08:37', 0, NULL, '2019-11-08 12:08:37', 3033, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079732574752768,205079738195120128\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('205106553907318786', NULL, '2019-11-08 13:52:37', 0, NULL, '2019-11-08 13:52:37', 3051, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205107049355284480', NULL, '2019-11-08 13:54:33', 0, NULL, '2019-11-08 13:54:33', 984, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205107238006689792', NULL, '2019-11-08 13:55:20', 0, NULL, '2019-11-08 13:55:20', 3030, '192.168.56.1', '未知', '修改资产类型', '{\"typeName\":\"测试其他1\",\"id\":\"205079824270626816\"}', 'PUT', '/xboot/manageType/updateManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('205107276036444161', NULL, '2019-11-08 13:55:26', 0, NULL, '2019-11-08 13:55:26', 131, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205107649136562176', NULL, '2019-11-08 13:56:58', 0, NULL, '2019-11-08 13:56:58', 3037, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205109204078301184', NULL, '2019-11-08 14:03:06', 0, NULL, '2019-11-08 14:03:06', 154, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205113401163124736', NULL, '2019-11-08 14:19:47', 0, NULL, '2019-11-08 14:19:47', 202, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205138725452124164', NULL, '2019-11-08 16:00:25', 0, NULL, '2019-11-08 16:00:25', 632, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('205159192212803584', NULL, '2019-11-08 17:21:48', 0, NULL, '2019-11-08 17:21:48', 3692, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"564654596465465\"}', 'PUT', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('205159389823242240', NULL, '2019-11-08 17:22:31', 0, NULL, '2019-11-08 17:22:31', 17992, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"564654596465465\"}', 'PUT', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('205159756015341568', NULL, '2019-11-08 17:24:02', 0, NULL, '2019-11-08 17:24:02', 26792, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"564654596465465\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206130870426275840', NULL, '2019-11-11 09:42:51', 0, NULL, '2019-11-11 09:42:51', 192, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"softwareAssetsId\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206131019772858368', NULL, '2019-11-11 09:43:26', 0, NULL, '2019-11-11 09:43:26', 17716, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"softwareAssetsId\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206131035778322432', NULL, '2019-11-11 09:43:30', 0, NULL, '2019-11-11 09:43:30', 50, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206133885354905603', NULL, '2019-11-11 09:54:49', 0, NULL, '2019-11-11 09:54:49', 122, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206134080562008065', NULL, '2019-11-11 09:55:36', 0, NULL, '2019-11-11 09:55:36', 69, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206134173138685954', NULL, '2019-11-11 09:55:58', 0, NULL, '2019-11-11 09:55:58', 81, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206136862039871488', NULL, '2019-11-11 10:06:39', 0, NULL, '2019-11-11 10:06:39', 109, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206139460046295040', NULL, '2019-11-11 10:16:58', 0, NULL, '2019-11-11 10:16:58', 113, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206139571266654208', NULL, '2019-11-11 10:17:25', 0, NULL, '2019-11-11 10:17:25', 69, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206139730968973314', NULL, '2019-11-11 10:18:03', 0, NULL, '2019-11-11 10:18:03', 62, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206139770370265090', NULL, '2019-11-11 10:18:12', 0, NULL, '2019-11-11 10:18:12', 110, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206156172049256448', NULL, '2019-11-11 11:23:23', 0, NULL, '2019-11-11 11:23:23', 12875, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"1\"}', 'POST', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206156267444506624', NULL, '2019-11-11 11:23:45', 0, NULL, '2019-11-11 11:23:45', 3480, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"1\"}', 'POST', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206156692793069568', NULL, '2019-11-11 11:25:27', 0, NULL, '2019-11-11 11:25:27', 25196, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"1\"}', 'POST', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206158264293920768', NULL, '2019-11-11 11:31:42', 0, NULL, '2019-11-11 11:31:42', 126, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"1\"}', 'POST', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206160520892387328', NULL, '2019-11-11 11:40:40', 0, NULL, '2019-11-11 11:40:40', 113, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206160760793993216', NULL, '2019-11-11 11:41:37', 0, NULL, '2019-11-11 11:41:37', 142, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"2\"}', 'POST', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206161166576128003', NULL, '2019-11-11 11:43:14', 0, NULL, '2019-11-11 11:43:14', 108, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('206161419933061120', NULL, '2019-11-11 11:44:14', 0, NULL, '2019-11-11 11:44:14', 351, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206162266591072257', NULL, '2019-11-11 11:47:36', 0, NULL, '2019-11-11 11:47:36', 90, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('206162400674582528', NULL, '2019-11-11 11:48:08', 0, NULL, '2019-11-11 11:48:08', 79, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079824270626816\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206162595328036864', NULL, '2019-11-11 11:48:55', 0, NULL, '2019-11-11 11:48:55', 471, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206162747606437888', NULL, '2019-11-11 11:49:30', 0, NULL, '2019-11-11 11:49:30', 110, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206162836928335872', NULL, '2019-11-11 11:49:52', 0, NULL, '2019-11-11 11:49:52', 124, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"2\"}', 'DELETE', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206163584189730816', NULL, '2019-11-11 11:52:50', 0, NULL, '2019-11-11 11:52:50', 113, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206163684769140736', NULL, '2019-11-11 11:53:14', 0, NULL, '2019-11-11 11:53:14', 77, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"1\"}', 'DELETE', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206164556710416384', NULL, '2019-11-11 11:56:42', 0, NULL, '2019-11-11 11:56:42', 102, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('206164691259494404', NULL, '2019-11-11 11:57:14', 0, NULL, '2019-11-11 11:57:14', 109, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('206164794674253824', NULL, '2019-11-11 11:57:39', 0, NULL, '2019-11-11 11:57:39', 96, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206165174493646848', NULL, '2019-11-11 11:59:09', 0, NULL, '2019-11-11 11:59:09', 124, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206165467893600256', NULL, '2019-11-11 12:00:19', 0, NULL, '2019-11-11 12:00:19', 121, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206165895368675328', NULL, '2019-11-11 12:02:01', 0, NULL, '2019-11-11 12:02:01', 114, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206166208884510720', NULL, '2019-11-11 12:03:16', 0, NULL, '2019-11-11 12:03:16', 143, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206166350006063104', NULL, '2019-11-11 12:03:49', 0, NULL, '2019-11-11 12:03:49', 139, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206166839355510784', NULL, '2019-11-11 12:05:46', 0, NULL, '2019-11-11 12:05:46', 113, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206167276964024320', NULL, '2019-11-11 12:07:30', 0, NULL, '2019-11-11 12:07:30', 122, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079767962095616\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206167290129944578', NULL, '2019-11-11 12:07:33', 0, NULL, '2019-11-11 12:07:33', 48, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('206167332307865600', NULL, '2019-11-11 12:07:44', 0, NULL, '2019-11-11 12:07:44', 114, '192.168.56.1', '未知', '删除资产类型', '{\"ids\":\"205079824270626816\"}', 'DELETE', '/xboot/manageType/delManage', 'admin', 0);
INSERT INTO `t_log` VALUES ('206167339543040000', NULL, '2019-11-11 12:07:45', 0, NULL, '2019-11-11 12:07:45', 52, '192.168.56.1', '未知', '获取所有资产类型', '{}', 'GET', '/xboot/manageType/getAll', 'admin', 0);
INSERT INTO `t_log` VALUES ('206176980431802368', NULL, '2019-11-11 12:46:04', 0, NULL, '2019-11-11 12:46:04', 296, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"1\"}', 'DELETE', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206177048652156928', NULL, '2019-11-11 12:46:20', 0, NULL, '2019-11-11 12:46:20', 77, '192.168.56.1', '未知', '删除资产主要功能 包括子功能', '{\"id\":\"1\"}', 'DELETE', '/xboot/mainFeatures/removeMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206177060140355584', NULL, '2019-11-11 12:46:23', 0, NULL, '2019-11-11 12:46:23', 42, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206207399378292736', NULL, '2019-11-11 14:46:57', 0, NULL, '2019-11-11 14:46:57', 190, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206207719189778432', NULL, '2019-11-11 14:48:12', 0, NULL, '2019-11-11 14:48:12', 74, '192.168.56.1', '未知', '查询资产功能', '{\"softwareAssetsId\":\"0\"}', 'GET', '/xboot/mainFeatures/findMainFeatures', 'admin', 0);
INSERT INTO `t_log` VALUES ('206207813154770944', NULL, '2019-11-11 14:48:35', 0, NULL, '2019-11-11 14:48:35', 205, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206208648282640384', NULL, '2019-11-11 14:51:54', 0, NULL, '2019-11-11 14:51:54', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin1\"}', 'POST', '/xboot/login', 'admin1', 1);
INSERT INTO `t_log` VALUES ('206209225884438528', NULL, '2019-11-11 14:54:12', 0, NULL, '2019-11-11 14:54:12', 161, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"toby\"}', 'POST', '/xboot/login', 'toby', 1);
INSERT INTO `t_log` VALUES ('206218134678409216', NULL, '2019-11-11 15:29:36', 0, NULL, '2019-11-11 15:29:36', 275, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206218574723813376', NULL, '2019-11-11 15:31:22', 0, NULL, '2019-11-11 15:31:22', 2943, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206224948279119872', NULL, '2019-11-11 15:56:40', 0, NULL, '2019-11-11 15:56:40', 144, '192.168.56.1', '未知', '硬件资产统计', '{}', 'GET', '/xboot/statistics/assetNumber', 'toby', 0);
INSERT INTO `t_log` VALUES ('206224977710551040', NULL, '2019-11-11 15:56:47', 0, NULL, '2019-11-11 15:56:47', 92, '192.168.56.1', '未知', '硬件资产统计', '{}', 'GET', '/xboot/statistics/assetNumber', 'toby', 0);
INSERT INTO `t_log` VALUES ('206225054998990848', NULL, '2019-11-11 15:57:06', 0, NULL, '2019-11-11 15:57:06', 298, '192.168.56.1', '未知', '硬件资产统计', '{}', 'GET', '/xboot/statistics/assetNumber', 'toby', 0);
INSERT INTO `t_log` VALUES ('206225148037042176', NULL, '2019-11-11 15:57:28', 0, NULL, '2019-11-11 15:57:28', 65, '192.168.56.1', '未知', '硬件资产统计', '{}', 'GET', '/xboot/statistics/assetNumber', 'toby', 0);
INSERT INTO `t_log` VALUES ('206225546869215232', NULL, '2019-11-11 15:59:03', 0, NULL, '2019-11-11 15:59:03', 195, '192.168.56.1', '未知', '硬件资产统计', '{}', 'GET', '/xboot/statistics/assetNumber', 'toby', 0);
INSERT INTO `t_log` VALUES ('206225634127515648', NULL, '2019-11-11 15:59:24', 0, NULL, '2019-11-11 15:59:24', 218, '192.168.56.1', '未知', '硬件资产统计', '{}', 'GET', '/xboot/statistics/assetNumber', 'toby', 0);
INSERT INTO `t_log` VALUES ('206247995040075776', NULL, '2019-11-11 17:28:15', 0, NULL, '2019-11-11 17:28:15', 319, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206499817826816000', NULL, '2019-11-12 10:08:54', 0, NULL, '2019-11-12 10:08:54', 432, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206506384013922304', NULL, '2019-11-12 10:35:00', 0, NULL, '2019-11-12 10:35:00', 449, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206557371005145088', NULL, NULL, 0, NULL, NULL, 411, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"toby\"}', 'POST', '/xboot/login', 'toby', 1);
INSERT INTO `t_log` VALUES ('206560240215265280', NULL, NULL, 0, NULL, NULL, 235, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206561484942086144', NULL, NULL, 0, NULL, NULL, 217, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206564959981670400', NULL, NULL, 0, NULL, NULL, 319, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206570240920784896', NULL, NULL, 0, NULL, NULL, 152, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206572361309229056', NULL, NULL, 0, NULL, NULL, 146, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206573730300694528', NULL, NULL, 0, NULL, NULL, 145, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206575255395766272', NULL, NULL, 0, NULL, NULL, 135, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206576147515838464', NULL, NULL, 0, NULL, NULL, 267, '127.0.0.1', '未知', '添加硬件资产数据', '{\"ipAddr\":\"12\"}', 'PUT', '/xboot/hardwareAsset/save', 'toby', 0);
INSERT INTO `t_log` VALUES ('206576148715409408', NULL, NULL, 0, NULL, NULL, 66, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206576216537305088', NULL, NULL, 0, NULL, NULL, 117, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206576290973618176', NULL, NULL, 0, NULL, NULL, 120, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206576330790146048', NULL, NULL, 0, NULL, NULL, 108, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206577185081790464', NULL, NULL, 0, NULL, NULL, 125, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206578803231690752', NULL, NULL, 0, NULL, NULL, 120, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206578809732861952', NULL, NULL, 0, NULL, NULL, 65, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206578957653381120', NULL, NULL, 0, NULL, NULL, 120, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206579899194937344', NULL, NULL, 0, NULL, NULL, 186, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206579927095447552', NULL, NULL, 0, NULL, NULL, 113, '127.0.0.1', '未知', '添加硬件资产数据', '{\"codeing\":\"12\"}', 'PUT', '/xboot/hardwareAsset/save', 'toby', 0);
INSERT INTO `t_log` VALUES ('206579928232103936', NULL, NULL, 0, NULL, NULL, 60, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206580226681999360', NULL, NULL, 0, NULL, NULL, 182, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206580267542908928', NULL, NULL, 0, NULL, NULL, 114, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206580728836657152', NULL, NULL, 0, NULL, NULL, 241, '127.0.0.1', '未知', '添加硬件资产数据', '{\"codeing\":\"we\"}', 'PUT', '/xboot/hardwareAsset/save', 'toby', 0);
INSERT INTO `t_log` VALUES ('206580759132114944', NULL, NULL, 0, NULL, NULL, 21202, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206580832205279232', NULL, NULL, 0, NULL, NULL, 21120, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206580965315710976', NULL, NULL, 0, NULL, NULL, 211, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206581173009256448', NULL, NULL, 0, NULL, NULL, 118, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206581276298186752', NULL, NULL, 0, NULL, NULL, 161, '127.0.0.1', '未知', '添加硬件资产数据', '{\"codeing\":\"12\"}', 'PUT', '/xboot/hardwareAsset/save', 'toby', 0);
INSERT INTO `t_log` VALUES ('206581277808136192', NULL, NULL, 0, NULL, NULL, 65, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206581974431698944', NULL, NULL, 0, NULL, NULL, 225, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206582405522264064', NULL, NULL, 0, NULL, NULL, 328, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206582780501430272', NULL, NULL, 0, NULL, NULL, 178, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206582811849658368', NULL, NULL, 0, NULL, NULL, 135, '127.0.0.1', '未知', '添加硬件资产数据', '{\"codeing\":\"12\"}', 'POST', '/xboot/hardwareAsset/save', 'toby', 0);
INSERT INTO `t_log` VALUES ('206582813447688192', NULL, NULL, 0, NULL, NULL, 63, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206589951972741120', NULL, NULL, 0, NULL, NULL, 177, '192.168.56.1', '未知', '分页 查询ip数据', '{}', 'GET', '/xboot/iPManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206595086102827008', NULL, NULL, 0, NULL, NULL, 373, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206602863709786112', NULL, NULL, 0, NULL, NULL, 223, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('206605916148076544', NULL, NULL, 0, NULL, NULL, 244, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206613086394650624', NULL, NULL, 0, NULL, NULL, 350, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206613101921964032', NULL, NULL, 0, NULL, NULL, 75, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616275776966656', NULL, NULL, 0, NULL, NULL, 254, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616623853867008', NULL, NULL, 0, NULL, NULL, 117, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616632573825024', NULL, NULL, 0, NULL, NULL, 114, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616655013351424', NULL, NULL, 0, NULL, NULL, 120, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616675481554944', NULL, NULL, 0, NULL, NULL, 66, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616679004770304', NULL, NULL, 0, NULL, NULL, 570, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616716111777792', NULL, NULL, 0, NULL, NULL, 144, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616867169636352', NULL, NULL, 0, NULL, NULL, 115, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616892847165440', NULL, NULL, 0, NULL, NULL, 244, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206616999030165504', NULL, NULL, 0, NULL, NULL, 144, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206618374715740160', NULL, NULL, 0, NULL, NULL, 126, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206618409289388032', NULL, NULL, 0, NULL, NULL, 113, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206618412787437568', NULL, NULL, 0, NULL, NULL, 63, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206618499416592384', NULL, NULL, 0, NULL, NULL, 120, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206618510606995456', NULL, NULL, 0, NULL, NULL, 64, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206618573571887104', NULL, NULL, 0, NULL, NULL, 116, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206618828824645632', NULL, NULL, 0, NULL, NULL, 144, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619051051454464', NULL, NULL, 0, NULL, NULL, 115, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619101987082240', NULL, NULL, 0, NULL, NULL, 134, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619247516848128', NULL, NULL, 0, NULL, NULL, 117, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619615286005760', NULL, NULL, 0, NULL, NULL, 144, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619797222330368', NULL, NULL, 0, NULL, NULL, 131, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619846924832768', NULL, NULL, 0, NULL, NULL, 110, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619860237553664', NULL, NULL, 0, NULL, NULL, 63, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619887123042304', NULL, NULL, 0, NULL, NULL, 115, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/hardwareAsset/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206619890566565888', NULL, NULL, 0, NULL, NULL, 65, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206620222008856576', NULL, NULL, 0, NULL, NULL, 113, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206620346139283456', NULL, NULL, 0, NULL, NULL, 120, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206844686663421952', NULL, NULL, 0, NULL, NULL, 201, '127.0.0.1', '未知', '分页 查询数据', '{\"current\":\"1\",\"size\":\"10\",\"sort\":\"createTime\",\"order\":\"desc\"}', 'GET', '/xboot/assetManage/findAll', 'toby', 0);
INSERT INTO `t_log` VALUES ('206850624510234624', NULL, NULL, 0, NULL, NULL, 492, '127.0.0.1', '未知', '登录系统', '{\"password\":\"已被隐藏\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `sort_order` decimal(10, 2) NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `button_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', 0, '', '2019-02-12 17:56:20', '', 'sys', '', 0, 1.00, 'Main', '/sys', '系统管理', 'ios-settings', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('5129710648430593', '', '2018-06-04 19:02:32', 0, '', '2018-08-13 15:15:33', '', 'user-manage', '5129710648430592', 0, 1.10, 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('5129710648430594', '', '2018-06-04 19:02:35', 0, '', '2018-10-13 13:51:36', '', 'role-manage', '5129710648430592', 0, 1.60, 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('5129710648430595', '', '2018-06-04 19:02:37', 0, '', '2018-09-23 23:32:02', '', 'menu-manage', '5129710648430592', 0, 1.70, 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('41375330996326400', '', '2018-08-13 18:23:08', 0, 'admin', '2018-10-20 22:47:07', '', 'simple-table', '41373430515240960', 0, 3.10, 'xboot-vue-template/simple-table/simpleTable', 'simple-table', '简单表格', 'ios-grid-outline', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', 0, '', '2018-09-19 22:16:44', '', '', '5129710648430593', 1, 1.11, '', '/xboot/user/admin/add*', '添加用户', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', 0, '', '2018-06-06 14:46:51', '', '', '5129710648430593', 1, 1.13, '', '/xboot/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0, NULL);
INSERT INTO `t_permission` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', 0, '', '2018-06-28 16:44:48', '', '', '5129710648430593', 1, 1.14, '', '/xboot/user/admin/enable/**', '启用用户', '', 3, 'enable', 0, NULL);
INSERT INTO `t_permission` VALUES ('16392452747300864', '', '2018-06-05 19:50:06', 0, 'admin', '2018-10-23 12:34:21', '', 'access', '', 0, 5.00, 'Main', '/access', '权限按钮测试页', 'md-lock', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('16392767785668608', '', '2018-06-05 19:51:21', 0, 'admin', '2018-10-23 12:34:38', '', 'access_index', '16392452747300864', 0, 5.10, 'access/access', 'index', '权限按钮测试页', 'md-lock', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('16438800255291392', '', '2018-06-05 22:54:18', 0, 'admin', '2018-10-23 12:34:51', '', '', '16392767785668608', 1, 5.11, '', 'test-add', '添加按钮测试', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('16438962738434048', '', '2018-06-05 22:54:55', 0, 'admin', '2018-10-23 12:35:05', '', '', '16392767785668608', 1, 5.12, '', 'test-edit', '编辑按钮测试', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('16439068543946752', '', '2018-06-05 22:55:20', 0, 'admin', '2018-10-23 12:34:54', '', '', '16392767785668608', 1, 5.13, '', 'test-delete', '删除按钮测试', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', 0, '', '2018-09-19 22:16:48', '', '', '5129710648430593', 1, 1.12, '', '/xboot/user/admin/edit*', '编辑用户', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', 0, '', '2018-08-10 21:41:16', '', '', '5129710648430593', 1, 1.15, '', '/xboot/user/delByIds/**', '删除用户', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('16687383932047360', '', '2018-06-06 15:22:03', 0, '', '2018-09-19 22:07:34', '', '', '5129710648430594', 1, 1.21, '', '/xboot/role/save*', '添加角色', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('16689632049631232', '', '2018-06-06 15:30:59', 0, '', '2018-09-19 22:07:37', '', '', '5129710648430594', 1, 1.22, '', '/xboot/role/edit*', '编辑角色', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', 0, '', '2018-08-10 21:41:23', '', '', '5129710648430594', 1, 1.23, '', '/xboot/role/delAllByIds/**', '删除角色', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('16689883993083904', NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, '5129710648430594', 1, 1.24, NULL, '/xboot/role/editRolePerm**', '分配权限', NULL, 3, 'editPerm', 0, NULL);
INSERT INTO `t_permission` VALUES ('16690313745666048', '', '2018-06-06 15:33:41', 0, '', '2018-09-19 22:07:46', '', '', '5129710648430594', 1, 1.25, '', '/xboot/role/setDefault*', '设为默认角色', '', 3, 'setDefault', 0, '');
INSERT INTO `t_permission` VALUES ('16694861252005888', '', '2018-06-06 15:51:46', 0, '', '2018-09-19 22:07:52', '', '', '5129710648430595', 1, 1.31, '', '/xboot/permission/add*', '添加菜单', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('16695107491205120', '', '2018-06-06 15:52:44', 0, '', '2018-09-19 22:07:57', '', '', '5129710648430595', 1, 1.32, '', '/xboot/permission/edit*', '编辑菜单', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', 0, '', '2018-08-10 21:41:33', '', '', '5129710648430595', 1, 1.33, '', '/xboot/permission/delByIds/**', '删除菜单', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('41370251991977984', NULL, '2018-08-13 18:02:57', 0, NULL, '2018-08-13 18:02:57', NULL, 'quartz-job', '39915540965232640', 0, 2.10, 'sys/quartz-manage/quartzManage', 'quartz-job', '定时任务', 'md-time', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('25014528525733888', '', '2018-06-29 14:51:09', 0, '', '2018-10-08 11:13:27', '', '', '5129710648430593', 1, 1.16, '', '无', '上传图片', '', 3, 'upload', 0, '');
INSERT INTO `t_permission` VALUES ('39915540965232640', NULL, '2018-08-09 17:42:28', 0, NULL, '2018-08-09 17:42:28', NULL, 'monitor', NULL, 0, 2.00, 'Main', '/monitor', '系统监控', 'ios-analytics', 1, NULL, 0, NULL);
INSERT INTO `t_permission` VALUES ('39916171171991552', '', '2018-08-09 17:44:57', 0, 'admin', '2019-01-20 00:37:29', '', 'druid', '39915540965232640', 0, 2.40, 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', 2, '', 0, 'http://127.0.0.1:8888/druid/login.html');
INSERT INTO `t_permission` VALUES ('39918482854252544', '', '2018-08-09 17:54:08', 0, 'admin', '2019-01-20 00:37:41', '', 'swagger', '39915540965232640', 0, 2.50, 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', 2, '', 0, 'http://127.0.0.1:8888/swagger-ui.html');
INSERT INTO `t_permission` VALUES ('40238597734928384', NULL, '2018-08-10 15:06:10', 0, NULL, '2018-08-10 15:06:10', NULL, 'department-manage', '5129710648430592', 0, 1.20, 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('42082442672082944', '', '2018-08-15 17:12:57', 0, 'admin', '2019-02-10 12:40:59', '', 'new-window', '41373430515240960', 0, 3.30, 'xboot-vue-template/new-window/newWindow', 'new-window', '新窗口操作', 'ios-browsers', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('41373430515240960', '', '2018-08-13 18:15:35', 0, 'admin', '2018-11-17 11:41:44', '', 'vue-template', '', 0, 3.00, 'Main', '/vue-template', '后台Vue模版', 'ios-albums', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('41363147411427328', '', '2018-08-13 17:34:43', 0, '', '2018-08-20 20:05:21', '', 'log-manage', '39915540965232640', 0, 2.20, 'sys/log-manage/logManage', 'log-manage', '操作日志管理', 'md-list-box', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('41363537456533504', '', '2018-08-13 17:36:16', 0, '', '2018-08-13 17:56:11', '', '', '41363147411427328', 1, 2.11, '', '/xboot/log/delByIds/**', '删除日志', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('41364927394353152', '', '2018-08-13 17:41:48', 0, '', '2018-09-19 22:08:57', '', '', '41363147411427328', 1, 2.12, '', '/xboot/log/delAll*', '清空日志', '', 3, 'undefined', 0, '');
INSERT INTO `t_permission` VALUES ('41377034236071936', '', '2018-08-13 18:29:54', 0, 'admin', '2019-02-10 21:14:14', '', 'complex-table', '41373430515240960', 0, 3.50, 'xboot-vue-template/complex-table/complexTable', 'complex-table', '复杂表格', 'ios-grid', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('41378916912336896', '', '2018-08-13 18:37:23', 0, 'admin', '2019-02-04 17:04:04', '', 'tree', '41373430515240960', 0, 3.21, 'xboot-vue-template/tree/tree', 'tree', '树形结构', 'ios-git-network', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('42087054753927168', '', '2018-08-15 17:31:16', 0, 'admin', '2019-02-10 21:14:24', '', 'html-edit', '41373430515240960', 0, 3.92, 'xboot-vue-template/html-edit/htmlEdit', 'html-edit', '富文本编辑', 'ios-create', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('43117268627886080', '', '2018-08-18 13:44:58', 0, '', '2019-02-10 22:37:06', '', 'message-manage', '5129710648430592', 0, 1.30, 'sys/message-manage/messageManage', 'message-manage', '消息管理', 'md-mail', 2, '', -1, '');
INSERT INTO `t_permission` VALUES ('45235621697949696', '', '2018-08-24 10:02:33', 0, '', '2018-09-19 22:06:57', '', '', '40238597734928384', 1, 1.21, '', '/xboot/department/add*', '添加部门', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('45235787867885568', '', '2018-08-24 10:03:13', 0, '', '2018-09-19 22:07:02', '', '', '40238597734928384', 1, 1.22, '', '/xboot/department/edit*', '编辑部门', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('45235939278065664', NULL, '2018-08-24 10:03:49', 0, NULL, '2018-08-24 10:03:49', NULL, '', '40238597734928384', 1, 1.23, '', '/xboot/department/delByIds/*', '删除部门', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('45236734832676864', '', '2018-08-24 10:06:59', 0, '', '2018-09-19 22:07:07', '', '', '43117268627886080', 1, 1.31, '', '/xboot/message/add*', '添加消息', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('45237010692050944', '', '2018-08-24 10:08:04', 0, '', '2018-09-19 22:07:12', '', '', '43117268627886080', 1, 1.32, '', '/xboot/message/edit*', '编辑消息', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('45237170029465600', NULL, '2018-08-24 10:08:42', 0, NULL, '2018-08-24 10:08:42', NULL, '', '43117268627886080', 1, 1.33, '', '/xboot/message/delByIds/*', '删除消息', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('45264987354042368', '', '2018-08-24 11:59:14', 0, '', '2018-09-19 22:08:11', '', '', '41370251991977984', 1, 2.11, '', '/xboot/quartzJob/add*', '添加定时任务', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('45265487029866496', '', '2018-08-24 12:01:14', 0, '', '2018-09-19 22:08:17', '', '', '41370251991977984', 1, 2.12, '', '/xboot/quartzJob/edit*', '编辑定时任务', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('45265762415284224', '', '2018-08-24 12:02:19', 0, '', '2018-09-19 22:08:24', '', '', '41370251991977984', 1, 2.13, '', '/xboot/quartzJob/pause*', '暂停定时任务', '', 3, 'disable', 0, '');
INSERT INTO `t_permission` VALUES ('45265886315024384', '', '2018-08-24 12:02:49', 0, '', '2018-09-19 22:09:13', '', '', '41370251991977984', 1, 2.14, '', '/xboot/quartzJob/resume*', '恢复定时任务', '', 3, 'enable', 0, '');
INSERT INTO `t_permission` VALUES ('45266070000373760', NULL, '2018-08-24 12:03:33', 0, NULL, '2018-08-24 12:03:33', NULL, '', '41370251991977984', 1, 2.15, '', '/xboot/quartzJob/delByIds/*', '删除定时任务', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('56898976661639168', '', '2018-09-25 14:28:34', 0, '', '2018-09-25 15:12:46', '', '', '5129710648430593', 1, 1.17, '', '/xboot/user/importData*', '导入用户', '', 3, 'input', 0, '');
INSERT INTO `t_permission` VALUES ('56911328312299520', '', '2018-09-25 15:17:39', 0, 'admin', '2019-02-10 21:14:03', '', 'excel', '41373430515240960', 0, 3.60, 'xboot-vue-template/excel/excel', 'excel', 'Excel导入导出', 'md-exit', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('57009544286441472', NULL, '2018-09-25 21:47:55', 0, NULL, '2018-09-25 21:47:55', NULL, '', '43117268627886080', 1, 1.40, '', '/xboot/messageSend/save*', '添加已发送消息', '', 3, 'add', 0, NULL);
INSERT INTO `t_permission` VALUES ('57009744761589760', NULL, '2018-09-25 21:48:43', 0, NULL, '2018-09-25 21:48:43', NULL, '', '43117268627886080', 1, 1.50, '', '/xboot/messageSend/update*', '编辑已发送消息', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('57009981228060672', NULL, '2018-09-25 21:49:39', 0, NULL, '2018-09-25 21:49:39', NULL, '', '43117268627886080', 1, 1.60, '', '/xboot/messageSend/delByIds/*', '删除已发送消息', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('107658518470856704', NULL, '2019-02-12 16:08:52', 0, NULL, '2019-02-12 16:08:52', NULL, 'dashboard', '5129710648430592', 0, 1.90, 'sys/dashboard/dashboard', 'dashboard', 'Dashboard', 'md-analytics', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('75002207560273920', 'admin', '2018-11-14 13:24:21', 0, 'admin', '2018-11-20 20:06:22', '', 'dict', '5129710648430592', 0, 1.80, 'sys/dict-manage/dictManage', 'dict', '数据字典管理', 'md-bookmarks', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('76215889006956544', 'admin', '2018-11-17 21:47:05', 0, 'admin', '2018-11-17 21:47:53', '', '', '75002207560273920', 1, 1.81, '', '/xboot/dict/add*', '添加字典', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('76216071333351424', 'admin', '2018-11-17 21:47:48', 0, 'admin', '2018-11-17 21:47:48', NULL, '', '75002207560273920', 1, 1.82, '', '/xboot/dict/edit*', '编辑字典', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('76216264070008832', 'admin', '2018-11-17 21:48:34', 0, 'admin', '2018-11-17 21:48:34', NULL, '', '75002207560273920', 1, 1.83, '', '/xboot/dict/delByIds/**', '删除字典', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('76216459709124608', 'admin', '2018-11-17 21:49:21', 0, 'admin', '2018-11-17 21:49:21', NULL, '', '75002207560273920', 1, 1.84, '', '/xboot/dictData/add*', '添加字典数据', '', 3, 'add', 0, NULL);
INSERT INTO `t_permission` VALUES ('76216594207870976', 'admin', '2018-11-17 21:49:53', 0, 'admin', '2018-11-17 21:49:53', NULL, '', '75002207560273920', 1, 1.85, '', '/xboot/dictData/edit*', '编辑字典数据', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('76216702639017984', 'admin', '2018-11-17 21:50:18', 0, 'admin', '2018-11-17 21:50:18', NULL, '', '75002207560273920', 1, 1.86, '', '/xboot/dictData/delByIds/**', '删除字典数据', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('97428860643053568', 'admin', '2019-01-15 10:39:52', 0, 'admin', '2019-07-15 15:54:21', '', 'components', '41373430515240960', 0, 1.00, 'xboot-vue-template/components/components', 'components', '业务组件', 'md-cube', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('84082369492946944', 'admin', '2018-12-09 14:45:40', 0, 'admin', '2019-02-10 21:43:38', '', '', '81558529864896512', 1, 0.00, '', '/xboot/leave/add*', '添加请假申请', '', 3, 'undefined', 0, '');
INSERT INTO `t_permission` VALUES ('84082920431554560', 'admin', '2018-12-09 14:47:51', 0, 'admin', '2018-12-09 14:47:51', NULL, '', '81558529864896512', 1, 1.00, '', '/xboot/actBusiness/delByIds/**', '删除草稿申请', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('84083562503999488', 'admin', '2018-12-09 14:50:25', 0, 'admin', '2018-12-09 14:50:25', NULL, '', '81716172680073216', 1, 0.00, '', '/xboot/actTask/pass**', '审批通过', '', 3, 'enable', 0, NULL);
INSERT INTO `t_permission` VALUES ('84083641302388736', 'admin', '2018-12-09 14:50:43', 0, 'admin', '2018-12-09 14:50:43', NULL, '', '81716172680073216', 1, 1.00, '', '/xboot/actTask/back**', '审批驳回', '', 3, 'disable', 0, NULL);
INSERT INTO `t_permission` VALUES ('84084404707659776', 'admin', '2018-12-09 14:53:45', 0, 'admin', '2018-12-09 14:53:45', NULL, '', '81716172680073216', 1, 3.00, '', '/xboot/actTask/delegate**', '委托代办', '', 3, 'other', 0, NULL);
INSERT INTO `t_permission` VALUES ('84084724590448640', 'admin', '2018-12-09 14:55:02', 0, 'admin', '2018-12-09 14:55:02', NULL, '', '82269650301227008', 1, 0.00, '', '/xboot/actTask/deleteHistoric/**', '删除已办任务', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('84084965817454592', 'admin', '2018-12-09 14:55:59', 0, 'admin', '2018-12-09 14:55:59', NULL, '', '81319435670917120', 1, 0.00, '', '/xboot/actProcess/delInsByIds/**', '删除运行流程', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('84085542324539392', 'admin', '2018-12-09 14:58:17', 0, 'admin', '2018-12-09 14:58:17', NULL, '', '76914082455752704', 1, 0.00, '', '/xboot/actProcess/updateInfo/**', '编辑流程信息', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('84085810797744128', 'admin', '2018-12-09 14:59:21', 0, 'admin', '2018-12-09 14:59:21', NULL, '', '76914082455752704', 1, 1.00, '', '/xboot/actProcess/editNodeUser**', '流程节点设置', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('84085980943880192', 'admin', '2018-12-09 15:00:01', 0, 'admin', '2018-12-09 15:00:01', NULL, '', '76914082455752704', 1, 2.00, '', '/xboot/actProcess/convertToModel/**', '流程转模型', '', 3, 'other', 0, NULL);
INSERT INTO `t_permission` VALUES ('84086163001839616', 'admin', '2018-12-09 15:00:45', 0, 'admin', '2018-12-09 15:01:37', '', '', '76914082455752704', 1, 3.00, '', '/xboot/actProcess/delByIds/**', '删除流程定义', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('84086362248056832', 'admin', '2018-12-09 15:01:32', 0, 'admin', '2018-12-09 15:01:32', NULL, '', '76914082455752704', 1, 4.00, '', '/xboot/actModel/deployByFile**', '文件部署流程', '', 3, 'other', 0, NULL);
INSERT INTO `t_permission` VALUES ('84086882907983872', 'admin', '2018-12-09 15:03:36', 0, 'admin', '2018-12-09 15:03:36', NULL, '', '76607201262702592', 1, 0.00, '', '/xboot/actModel/add**', '添加模型', '', 3, 'add', 0, NULL);
INSERT INTO `t_permission` VALUES ('84087009940869120', 'admin', '2018-12-09 15:04:06', 0, 'admin', '2018-12-09 15:04:06', NULL, '', '76607201262702592', 1, 1.00, '', '/xboot/actModel/delByIds/**', '删除模型', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('84087154040377344', 'admin', '2018-12-09 15:04:41', 0, 'admin', '2018-12-09 15:04:41', NULL, '', '76607201262702592', 1, 2.00, '', '/xboot/actModel/deploy/**', '部署模型', '', 3, 'other', 0, NULL);
INSERT INTO `t_permission` VALUES ('84087344352727040', 'admin', '2018-12-09 15:05:26', 0, 'admin', '2018-12-09 15:05:33', '', '', '80539147005071360', 1, 0.00, '', '/xboot/actCategory/add**', '添加流程分类', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('84087480852156416', 'admin', '2018-12-09 15:05:59', 0, 'admin', '2018-12-09 15:05:59', NULL, '', '80539147005071360', 1, 1.00, '', '/xboot/actCategory/edit**', '编辑流程分类', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('84087593041399808', 'admin', '2018-12-09 15:06:25', 0, 'admin', '2018-12-09 15:06:25', NULL, '', '80539147005071360', 1, 2.00, '', '/xboot/actCategory/delByIds/**', '删除流程分类', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('163100175097663488', NULL, '2019-07-15 15:54:13', 0, NULL, '2019-07-15 15:54:13', NULL, 'generate-vue', '41373430515240960', 0, 0.00, 'xboot-vue-template/generate/generate', 'generate', '生成表格代码', 'ios-create', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('163104186118967296', '', '2019-07-15 16:10:09', 0, '', '2019-07-15 16:10:19', '', 'fileManag', '', 0, 4.00, 'Main', '/fileManag', '文件储存管理', 'ios-folder', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('163104343682191360', '', '2019-07-15 16:10:47', 0, '', '2019-07-15 16:39:30', '', 'file-list', '163104186118967296', 0, 0.00, 'file/list', 'file-list', '文件存储列表', 'md-folder', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('163378341196337152', '', '2019-07-16 10:19:33', 0, '', '2019-07-16 10:23:25', '', 'menu-test', '', 0, 0.00, 'Main', '/menu-test', '顶部菜单', 'md-menu', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('163378497320914944', '', '2019-07-16 10:20:10', 0, '', '2019-07-16 10:23:41', '', 'normal', '163378341196337152', 0, 0.00, 'RouteView', 'normal', '左侧一级菜单', 'md-menu', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('163379651287191552', '', '2019-07-16 10:24:45', 0, '', '2019-07-16 10:25:03', '', 'normal-table', '163378497320914944', 0, 0.00, 'menu-test/normal/normalTable', 'normal-table', '左侧二级菜单', 'md-menu', 3, '', 0, '');
INSERT INTO `t_permission` VALUES ('163390230676639744', NULL, '2019-07-16 11:06:48', 0, NULL, '2019-07-16 11:06:48', NULL, '', '163379651287191552', 1, 0.00, '', '无', 'add', '', 4, 'add', 0, NULL);

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `alarm_date` datetime(0) NULL DEFAULT NULL,
  `approval_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approval_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `build_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `build_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complete` int(11) NULL DEFAULT NULL,
  `complete_date` datetime(0) NULL DEFAULT NULL,
  `contractor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contractor_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `describ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `licence_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `projetc_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_job`;
CREATE TABLE `t_quartz_job`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `default_role` bit(1) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('496138616573952', '', '2018-04-22 23:03:49', 'admin', '2019-01-11 17:42:54', 'ROLE_ADMIN', 0, NULL, '超级管理员 拥有所有权限', 0);
INSERT INTO `t_role` VALUES ('496138616573953', '', '2018-05-02 21:40:03', 'admin', '2019-01-11 16:35:38', 'ROLE_USER', 0, b'0', '普通注册用户 路过看看', 0);
INSERT INTO `t_role` VALUES ('16457350655250432', '', '2018-06-06 00:08:00', 'admin', '2019-01-11 17:05:23', 'ROLE_TEST', 0, b'0', '测试权限按钮显示', 0);

-- ----------------------------
-- Table structure for t_role_department
-- ----------------------------
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE `t_role_department`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `permission_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('96068577743867904', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '5129710648430592', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577752256512', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '5129710648430593', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577760645120', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '15701400130424832', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577773228032', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '16678126574637056', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577785810944', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '15701915807518720', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577798393856', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '15708892205944832', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577806782464', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '16678447719911424', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577819365376', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '25014528525733888', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577827753984', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '56898976661639168', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577836142592', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '40238597734928384', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577848725504', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '41370251991977984', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577857114112', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '45264987354042368', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577865502720', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '45265487029866496', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577873891328', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '45265762415284224', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577882279936', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '45265886315024384', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577890668544', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '16392452747300864', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577899057152', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '16392767785668608', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('96068577911640064', NULL, '2019-01-11 16:34:34', 0, NULL, '2019-01-11 16:34:34', '16439068543946752', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('95308765217165312', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '16439068543946752', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765200388096', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '16438962738434048', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765187805184', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '16438800255291392', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765175222272', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '16392767785668608', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765162639360', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '16392452747300864', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765150056448', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '41375330996326400', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765137473536', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '41373430515240960', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765129084928', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '39918482854252544', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765116502016', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '39916171171991552', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765103919104', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '41363147411427328', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765095530496', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '41370251991977984', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765087141888', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '39915540965232640', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765074558976', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '75002207560273920', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765066170368', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '5129710648430595', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765057781760', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '5129710648430594', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765049393152', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '40238597734928384', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765036810240', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '5129710648430593', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('95308765028421632', NULL, '2019-01-09 14:15:21', 0, NULL, '2019-01-09 14:15:21', '5129710648430592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('206854363413483523', NULL, NULL, 0, NULL, NULL, '206527234779910144', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363413483521', NULL, NULL, 0, NULL, NULL, '206526948589965312', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363409289219', NULL, NULL, 0, NULL, NULL, '206221303584133120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363409289217', NULL, NULL, 0, NULL, NULL, '206220845381586944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363405094915', NULL, NULL, 0, NULL, NULL, '206220094026551296', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363405094913', NULL, NULL, 0, NULL, NULL, '206210881548193792', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363400900612', NULL, NULL, 0, NULL, NULL, '206210324771115008', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363400900610', NULL, NULL, 0, NULL, NULL, '16439068543946752', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363400900608', NULL, NULL, 0, NULL, NULL, '16438962738434048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363396706307', NULL, NULL, 0, NULL, NULL, '16438800255291392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363396706305', NULL, NULL, 0, NULL, NULL, '16392767785668608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363392512003', NULL, NULL, 0, NULL, NULL, '16392452747300864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363392512001', NULL, NULL, 0, NULL, NULL, '163104343682191360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363388317700', NULL, NULL, 0, NULL, NULL, '163104186118967296', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363388317698', NULL, NULL, 0, NULL, NULL, '42087054753927168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363388317696', NULL, NULL, 0, NULL, NULL, '56911328312299520', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363384123395', NULL, NULL, 0, NULL, NULL, '41377034236071936', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363384123393', NULL, NULL, 0, NULL, NULL, '42082442672082944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363379929091', NULL, NULL, 0, NULL, NULL, '41378916912336896', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363379929089', NULL, NULL, 0, NULL, NULL, '41375330996326400', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363375734789', NULL, NULL, 0, NULL, NULL, '97428860643053568', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363375734787', NULL, NULL, 0, NULL, NULL, '163100175097663488', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363375734785', NULL, NULL, 0, NULL, NULL, '41373430515240960', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363371540483', NULL, NULL, 0, NULL, NULL, '39918482854252544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363371540481', NULL, NULL, 0, NULL, NULL, '39916171171991552', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363367346179', NULL, NULL, 0, NULL, NULL, '41364927394353152', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363367346177', NULL, NULL, 0, NULL, NULL, '41363537456533504', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363363151875', NULL, NULL, 0, NULL, NULL, '41363147411427328', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363363151873', NULL, NULL, 0, NULL, NULL, '45266070000373760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363358957571', NULL, NULL, 0, NULL, NULL, '45265886315024384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363358957569', NULL, NULL, 0, NULL, NULL, '45265762415284224', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363354763267', NULL, NULL, 0, NULL, NULL, '45265487029866496', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363354763265', NULL, NULL, 0, NULL, NULL, '45264987354042368', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363350568963', NULL, NULL, 0, NULL, NULL, '41370251991977984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363350568961', NULL, NULL, 0, NULL, NULL, '39915540965232640', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363346374659', NULL, NULL, 0, NULL, NULL, '76216702639017984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363346374657', NULL, NULL, 0, NULL, NULL, '76216594207870976', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363342180355', NULL, NULL, 0, NULL, NULL, '76216459709124608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363342180353', NULL, NULL, 0, NULL, NULL, '76216264070008832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363337986051', NULL, NULL, 0, NULL, NULL, '76216071333351424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363337986049', NULL, NULL, 0, NULL, NULL, '76215889006956544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363333791747', NULL, NULL, 0, NULL, NULL, '75002207560273920', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363333791745', NULL, NULL, 0, NULL, NULL, '16695243126607872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363329597443', NULL, NULL, 0, NULL, NULL, '16695107491205120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363329597441', NULL, NULL, 0, NULL, NULL, '16694861252005888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363325403139', NULL, NULL, 0, NULL, NULL, '5129710648430595', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363325403137', NULL, NULL, 0, NULL, NULL, '16690313745666048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363321208835', NULL, NULL, 0, NULL, NULL, '16689883993083904', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363321208833', NULL, NULL, 0, NULL, NULL, '16689745006432256', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363317014533', NULL, NULL, 0, NULL, NULL, '16689632049631232', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363317014531', NULL, NULL, 0, NULL, NULL, '16687383932047360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363317014529', NULL, NULL, 0, NULL, NULL, '5129710648430594', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363312820227', NULL, NULL, 0, NULL, NULL, '45235939278065664', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363312820225', NULL, NULL, 0, NULL, NULL, '45235787867885568', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363308625923', NULL, NULL, 0, NULL, NULL, '45235621697949696', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363308625921', NULL, NULL, 0, NULL, NULL, '40238597734928384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363304431617', NULL, NULL, 0, NULL, NULL, '56898976661639168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363300237315', NULL, NULL, 0, NULL, NULL, '25014528525733888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363300237313', NULL, NULL, 0, NULL, NULL, '16678447719911424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363296043011', NULL, NULL, 0, NULL, NULL, '15708892205944832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363296043009', NULL, NULL, 0, NULL, NULL, '15701915807518720', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363291848707', NULL, NULL, 0, NULL, NULL, '16678126574637056', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363291848705', NULL, NULL, 0, NULL, NULL, '15701400130424832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363287654402', NULL, NULL, 0, NULL, NULL, '5129710648430593', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363287654400', NULL, NULL, 0, NULL, NULL, '5129710648430592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363283460099', NULL, NULL, 0, NULL, NULL, '206235267319730176', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363283460097', NULL, NULL, 0, NULL, NULL, '206602423542747136', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363279265793', NULL, NULL, 0, NULL, NULL, '206501604944252928', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363275071491', NULL, NULL, 0, NULL, NULL, '206223228211826688', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363275071489', NULL, NULL, 0, NULL, NULL, '163379651287191552', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363270877184', NULL, NULL, 0, NULL, NULL, '163378497320914944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('206854363254099968', NULL, NULL, 0, NULL, NULL, '163378341196337152', '496138616573952');

-- ----------------------------
-- Table structure for t_test
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pass_strength` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_on_line` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('163366432954912768', '', '2019-07-16 09:32:14', '', '2019-07-16 09:32:27', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '519052532@qq.com', '18588679473', '', '$2a$10$9MCMAsaXweu7tbWDz2t3U.8QApm2bFIrZ6EKkZvensAEh9Bh5vE8u', 1, 0, 1, 'Lyoko', 0, '40322777781112832', '', '', NULL, NULL);
INSERT INTO `t_user` VALUES ('204767637295599616', '', '2019-11-07 15:25:50', '', '2019-11-07 15:26:05', '', 'http://localhost:8888/images/eccd61b96ca340a094921253aaf7a0e6.jpg', '', '1364.32@qq.com', '18727005674', '', '$2a$10$lgA98VElnYzbV84ntn7VAOXR3.Xr.61KqgBKIWhRtgkFU70uMXapS', 1, 0, 0, 'Lecken', 0, '40322777781112832', '', '', NULL, NULL);
INSERT INTO `t_user` VALUES ('162011331367538688', NULL, '2019-07-12 15:47:33', NULL, '2019-07-12 15:47:33', NULL, 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '123456@qq.com', '13435655555', NULL, '$2a$10$5fy2pXeBic7jhWadlrj6wOAbW37nsD/qS9oN6dNM08AglL65ngw96', 1, 0, 0, 'admin1', 0, '40322852833988608', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES ('205054820199960576', NULL, '2019-11-08 10:27:00', NULL, '2019-11-08 10:27:00', NULL, '', NULL, '215@qq.com', '18745678945', NULL, '$2a$10$66LEBfenp2k9SUIv76/SSuNf0cpk3y59wZXkyj5ZmNgTfxV.S/4wa', 1, 0, 1, 'admin', 0, '40322777781112832', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES ('206209127620284416', '', '2019-11-11 14:53:48', '', '2019-11-11 14:54:02', '', 'http://localhost:8888/images/618e8a4b61154c00b2ab18850a78c6af.jpg', '', '1122334455@126.com', '13456789874', '', '$2a$10$s.ZgwSszhW6HBzZdzokHre0wVrVXsNGJAMUcDn2MN93nCn8c00JbO', 1, 0, 1, 'toby', 0, '40322777781112832', '', '', NULL, NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('70669807116095488', NULL, '2018-11-02 14:28:56', 0, NULL, '2018-11-02 14:28:56', '496138616573952', '682265633886208');
INSERT INTO `t_user_role` VALUES ('61392579396112384', NULL, '2018-10-08 00:04:32', 0, NULL, '2018-10-08 00:04:32', '16457350655250432', '16739222421508096');
INSERT INTO `t_user_role` VALUES ('108020818868441088', NULL, '2019-02-13 16:08:31', 0, NULL, '2019-02-13 16:08:31', '496138616573953', '4363087427670016');
INSERT INTO `t_user_role` VALUES ('162011332680355840', NULL, '2019-07-12 15:47:33', 0, NULL, '2019-07-12 15:47:33', '496138616573952', '162011331367538688');
INSERT INTO `t_user_role` VALUES ('205054820652945408', NULL, '2019-11-08 10:27:00', 0, NULL, '2019-11-08 10:27:00', '496138616573952', '205054820199960576');
INSERT INTO `t_user_role` VALUES ('95250250557558784', NULL, NULL, 0, NULL, NULL, '496138616573953', '95250249236353024');
INSERT INTO `t_user_role` VALUES ('95251236747481089', NULL, NULL, 0, NULL, NULL, '496138616573953', '95251236210610176');
INSERT INTO `t_user_role` VALUES ('96086514575872000', NULL, '2019-01-11 17:45:51', 0, NULL, '2019-01-11 17:45:51', '496138616573952', '96085336240689152');
INSERT INTO `t_user_role` VALUES ('162011332730687488', NULL, '2019-07-12 15:47:33', 0, NULL, '2019-07-12 15:47:33', '496138616573953', '162011331367538688');
INSERT INTO `t_user_role` VALUES ('162011332785213440', NULL, '2019-07-12 15:47:33', 0, NULL, '2019-07-12 15:47:33', '16457350655250432', '162011331367538688');
INSERT INTO `t_user_role` VALUES ('163366487623471104', NULL, '2019-07-16 09:32:27', 0, NULL, '2019-07-16 09:32:27', '496138616573952', '163366432954912768');
INSERT INTO `t_user_role` VALUES ('205054820690694144', NULL, '2019-11-08 10:27:00', 0, NULL, '2019-11-08 10:27:00', '496138616573953', '205054820199960576');
INSERT INTO `t_user_role` VALUES ('205054820703277056', NULL, '2019-11-08 10:27:00', 0, NULL, '2019-11-08 10:27:00', '16457350655250432', '205054820199960576');
INSERT INTO `t_user_role` VALUES ('206209186164379648', NULL, '2019-11-11 14:54:02', 0, NULL, '2019-11-11 14:54:02', '496138616573952', '206209127620284416');

-- ----------------------------
-- Table structure for t_xboot
-- ----------------------------
DROP TABLE IF EXISTS `t_xboot`;
CREATE TABLE `t_xboot`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_xmant
-- ----------------------------
DROP TABLE IF EXISTS `t_xmant`;
CREATE TABLE `t_xmant`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `del_flag` int(11) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NOT NULL,
  `clazz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_xmant
-- ----------------------------
INSERT INTO `t_xmant` VALUES (1, '1', '2019-02-27 10:55:24', 1, '2', '2019-02-13 10:55:32', '23', 4, '2', '2019-02-12 10:55:41');
INSERT INTO `t_xmant` VALUES (2, NULL, NULL, NULL, NULL, NULL, '', 5, NULL, NULL);
INSERT INTO `t_xmant` VALUES (3, NULL, NULL, NULL, NULL, NULL, '23', 6, NULL, NULL);
INSERT INTO `t_xmant` VALUES (4, NULL, NULL, NULL, NULL, NULL, '2', 7, NULL, NULL);
INSERT INTO `t_xmant` VALUES (5, NULL, NULL, NULL, NULL, NULL, '233', 8, NULL, NULL);
INSERT INTO `t_xmant` VALUES (6, NULL, NULL, NULL, NULL, NULL, '123', 9, NULL, NULL);
INSERT INTO `t_xmant` VALUES (7, NULL, NULL, NULL, NULL, NULL, '4', 10, NULL, NULL);
INSERT INTO `t_xmant` VALUES (8, NULL, NULL, NULL, NULL, NULL, '21', 11, NULL, NULL);
INSERT INTO `t_xmant` VALUES (9, NULL, NULL, NULL, NULL, NULL, '3', 12, NULL, NULL);
INSERT INTO `t_xmant` VALUES (10, NULL, NULL, NULL, NULL, NULL, '24', 13, NULL, NULL);
INSERT INTO `t_xmant` VALUES (11, NULL, NULL, NULL, NULL, NULL, '14', 14, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
