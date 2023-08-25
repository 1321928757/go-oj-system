/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : chatweb

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 11/08/2023 20:43:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `person1Id` int NOT NULL COMMENT '人员1id',
  `person2Id` int NOT NULL COMMENT '人员2id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES (10, 10, 2);
INSERT INTO `friend` VALUES (11, 10, 3);
INSERT INTO `friend` VALUES (12, 11, 2);
INSERT INTO `friend` VALUES (13, 11, 3);
INSERT INTO `friend` VALUES (14, 12, 2);
INSERT INTO `friend` VALUES (15, 12, 3);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '信息内容',
  `senderId` int NOT NULL COMMENT '发送人id',
  `receiverId` int NULL DEFAULT NULL COMMENT '接收者id',
  `senderElevator` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发送者头像',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `senderName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发送者名称',
  `chatType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '聊天信息类型：0文字，1表情，2图片, 3文件',
  `receiverType` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '接受者类型：1普通用户， 2ChatGTP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (585, '11', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:46:57', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (586, '你好', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:47:09', 'kitie', '0', '1');
INSERT INTO `message` VALUES (587, '你好', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:48:20', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (588, '你好', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:51:53', 'kitie', '0', '1');
INSERT INTO `message` VALUES (589, '你好', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:52:33', 'kitie', '0', '1');
INSERT INTO `message` VALUES (590, '哈哈哈', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:55:50', 'kitie', '0', '1');
INSERT INTO `message` VALUES (591, '你好', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:56:23', 'kitie', '0', '1');
INSERT INTO `message` VALUES (592, '你好', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:56:39', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (593, '11', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:56:59', 'kitie', '0', '1');
INSERT INTO `message` VALUES (594, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 09:58:35', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (595, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:01:19', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (596, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:01:22', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (597, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:02:04', 'kitie', '0', '2');
INSERT INTO `message` VALUES (598, '你好！有什么我可以帮助您的吗？', 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:02:07', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (599, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:02:21', 'kitie', '0', '2');
INSERT INTO `message` VALUES (600, '你好！有什么我可以帮助你的吗？', 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:02:23', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (601, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:04:25', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (602, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:04:27', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (603, '111', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:05:34', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (604, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:06:11', 'kitie', '0', '2');
INSERT INTO `message` VALUES (605, '你好！有什么可以帮助你的吗？', 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:06:14', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (606, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:06:51', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (607, '请问有什么可以帮助您的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:06:55', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (608, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:06:57', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (609, '你好！有什么我可以帮助您的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:06:59', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (610, '老八蜜汁小憨包', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:07:13', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (611, '傻逼', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:07:17', 'kitie', '0', '1');
INSERT INTO `message` VALUES (612, '66', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:12:12', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (613, '123123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:14:34', 'kitie', '0', '1');
INSERT INTO `message` VALUES (614, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:14:42', 'kitie', '0', '1');
INSERT INTO `message` VALUES (615, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:15:50', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (616, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:16:40', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (617, '12312', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:16:42', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (618, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:16:43', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (619, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:16:47', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (620, '12312', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:16:57', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (621, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:16:59', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (622, '111', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:01', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (623, '222', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:03', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (624, '33', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:04', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (625, '444', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:05', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (626, '555', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:07', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (627, '666', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:08', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (628, '777', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:09', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (629, '888', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:09', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (630, '999', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:13', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (631, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:15', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (632, '12312', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:19:58', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (633, '123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:20:07', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (634, '11111', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:20:27', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (635, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:20:28', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (636, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:20:31', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (637, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:21:09', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (638, '213123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:22:44', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (639, '12312', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:22:45', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (640, '123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:22:46', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (641, '123123', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:25:57', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (642, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:26:11', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (643, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:26:56', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (644, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:27:01', 'kitie', '0', '2');
INSERT INTO `message` VALUES (645, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:28:06', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (646, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:28:59', 'kitie', '0', '2');
INSERT INTO `message` VALUES (647, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:31:06', 'kitie', '0', '2');
INSERT INTO `message` VALUES (648, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:33:12', 'kitie', '0', '2');
INSERT INTO `message` VALUES (649, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:34:28', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (650, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:37:42', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (651, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:37:45', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (652, '哈哈哈', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:39:46', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (653, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:39:48', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (654, '测试测试', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:40:02', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (655, '测试测试', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:40:05', 'kitie', '0', '1');
INSERT INTO `message` VALUES (656, '重连测试', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:40:28', 'kitie', '0', '1');
INSERT INTO `message` VALUES (657, '测试', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:41:13', 'kitie', '0', '1');
INSERT INTO `message` VALUES (658, '侧式2', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:41:52', 'kitie', '0', '1');
INSERT INTO `message` VALUES (659, '测试2', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:41:56', 'kitie', '0', '1');
INSERT INTO `message` VALUES (660, '测试1', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:43:00', 'kitie', '0', '1');
INSERT INTO `message` VALUES (661, '111', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:43:06', 'kitie', '0', '1');
INSERT INTO `message` VALUES (662, '测试11111', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:44:15', 'kitie', '0', '1');
INSERT INTO `message` VALUES (663, '会话测试11', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:44:30', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (664, '会话测试22', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:44:33', 'kitie', '0', '1');
INSERT INTO `message` VALUES (665, '会话测试3', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:44:37', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (666, '测试22222', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:44:55', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (667, '111', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:45:01', 'kitie', '0', '1');
INSERT INTO `message` VALUES (668, '23', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:45:04', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (669, '12312', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:04', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (670, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:05', 'kitie', '0', '1');
INSERT INTO `message` VALUES (671, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:07', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (672, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:08', 'kitie', '0', '1');
INSERT INTO `message` VALUES (673, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:11', 'kitie', '0', '1');
INSERT INTO `message` VALUES (674, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:11', 'kitie', '0', '1');
INSERT INTO `message` VALUES (675, '12312', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:13', 'kitie', '0', '1');
INSERT INTO `message` VALUES (676, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:13', 'kitie', '0', '1');
INSERT INTO `message` VALUES (677, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:13', 'kitie', '0', '1');
INSERT INTO `message` VALUES (678, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:14', 'kitie', '0', '1');
INSERT INTO `message` VALUES (679, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:14', 'kitie', '0', '1');
INSERT INTO `message` VALUES (680, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:14', 'kitie', '0', '1');
INSERT INTO `message` VALUES (681, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:14', 'kitie', '0', '1');
INSERT INTO `message` VALUES (682, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:14', 'kitie', '0', '1');
INSERT INTO `message` VALUES (683, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:15', 'kitie', '0', '1');
INSERT INTO `message` VALUES (684, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:15', 'kitie', '0', '1');
INSERT INTO `message` VALUES (685, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:15', 'kitie', '0', '1');
INSERT INTO `message` VALUES (686, '12312', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:31', 'kitie', '0', '1');
INSERT INTO `message` VALUES (687, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:33', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (688, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:35', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (689, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:36', 'kitie', '0', '1');
INSERT INTO `message` VALUES (690, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:37', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (691, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:38', 'kitie', '0', '1');
INSERT INTO `message` VALUES (692, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:45', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (693, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:46', 'kitie', '0', '1');
INSERT INTO `message` VALUES (694, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:48', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (695, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:50', 'kitie', '0', '1');
INSERT INTO `message` VALUES (696, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:52', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (697, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:46:54', 'kitie', '0', '1');
INSERT INTO `message` VALUES (698, '123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:47:44', 'kitie', '0', '1');
INSERT INTO `message` VALUES (699, '12312', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:47:45', 'kitie', '0', '1');
INSERT INTO `message` VALUES (700, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:47:46', 'kitie', '0', '1');
INSERT INTO `message` VALUES (701, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:47:47', 'kitie', '0', '1');
INSERT INTO `message` VALUES (702, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:37', 'kitie', '0', '1');
INSERT INTO `message` VALUES (703, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:38', 'kitie', '0', '1');
INSERT INTO `message` VALUES (704, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:39', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (705, '12312', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:40', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (706, '12312', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:41', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (707, '123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:42', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (708, '', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:44', 'kitie', '0', '1');
INSERT INTO `message` VALUES (709, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:45', 'kitie', '0', '1');
INSERT INTO `message` VALUES (710, '123213', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:48:47', 'kitie', '0', '1');
INSERT INTO `message` VALUES (711, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:49:16', 'kitie', '0', '1');
INSERT INTO `message` VALUES (712, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:49:17', 'kitie', '0', '1');
INSERT INTO `message` VALUES (713, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:49:18', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (714, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:49:30', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (715, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:49:34', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (716, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:50:33', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (717, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:50:35', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (718, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:50:44', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (719, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:50:48', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (720, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:50:54', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (721, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:50:56', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (722, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 10:58:59', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (723, '你好！请问有什么可以帮助你的？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 10:59:03', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (724, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:01:59', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (725, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:02:05', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (726, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:03:07', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (727, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:03:10', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (728, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:03:13', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (729, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:03:16', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (730, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:04:05', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (731, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:04:07', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (732, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:14:55', 'kitie', '0', '2');
INSERT INTO `message` VALUES (733, '你好！有什么我可以帮助你的吗？', 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:14:58', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (734, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:15:51', 'kitie', '0', '2');
INSERT INTO `message` VALUES (735, '你好！有什么我可以帮助你的吗？', 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:15:53', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (736, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:17:24', 'kitie', '0', '2');
INSERT INTO `message` VALUES (737, '你好！有什么我可以帮助你的吗？', 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:17:27', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (738, '你好', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:17:32', 'kitie', '0', '2');
INSERT INTO `message` VALUES (739, '你好！有什么我可以帮助你的吗？', 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:17:34', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (740, '请用java代码解释多态', 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 11:17:51', 'kitie', '0', '2');
INSERT INTO `message` VALUES (741, '多态是指同一个方法调用可以有不同的表现形式。在Java中，多态可以通过继承和接口实现。\n\n下面是一个例子，说明多态的概念：\n\n```java\n// 定义一个动物类\nclass Animal {\n  public void sound() {\n    System.out.println(\"动物发出声音\");\n  }\n}\n\n// 定义一个狗类，继承自动物类\nclass Dog extends Animal {\n  @Override\n  public void sound() {\n    System.out.println(\"狗发出汪汪声\");\n  }\n}\n\n// 定义一个猫类，继承自动物类\nclass Cat extends Animal {\n  @Override\n  public void sound() {\n    System.out.println(\"猫发出喵喵声\");\n  }\n}\n\npublic class Main {\n  public static void main(String[] args) {\n    Animal animal1 = new Animal();\n    Animal animal2 = new Dog();\n    Animal animal3 = new Cat();\n    \n    animal1.sound(); // 输出：动物发出声音\n    animal2.sound(); // 输出：狗发出汪汪声\n    animal3.sound(); // 输出：猫发出喵喵声\n  }\n}\n```\n\n通过上面的例子，可以看到animal1、animal2和animal3虽然都是Animal类型的对象，但在调用sound()方法时却有不同的行为表现。这就是多态的体现：通过父类引用指向子类对象，从而实现同一个方法具有不同的实现。', 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 11:18:15', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (742, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 14:20:56', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (743, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 14:20:58', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (744, '123123123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 14:20:59', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (745, '123123123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 14:21:08', 'kitie', '0', '1');
INSERT INTO `message` VALUES (746, '你好', 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 15:41:08', 'kitie22', '0', '2');
INSERT INTO `message` VALUES (747, '你好！有什么我可以帮助你的吗？', 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', '2023-07-13 15:41:11', 'chatGpt3.5', '0', '0');
INSERT INTO `message` VALUES (748, '11', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 15:42:05', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (749, 'hhh', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 15:48:38', 'kitie', '0', '1');
INSERT INTO `message` VALUES (750, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 15:48:57', 'kitie', '0', '1');
INSERT INTO `message` VALUES (751, '乌鱼子家人们', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 15:49:59', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (752, '？？？？', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 15:50:09', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (753, '沙贝', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 15:50:46', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (754, 'shab', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-13 15:59:05', 'kitie', '0', '1');
INSERT INTO `message` VALUES (755, 'dashanb', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:25:40', 'kitie', '0', '1');
INSERT INTO `message` VALUES (756, 'shabe', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:27:00', 'kitie', '0', '1');
INSERT INTO `message` VALUES (757, '你滴，嘶啦嘶啦地', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:32:27', 'kitie', '0', '1');
INSERT INTO `message` VALUES (758, '你滴，死拉斯蒂', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:37:39', 'kitie', '0', '1');
INSERT INTO `message` VALUES (759, '喵桑', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:38:06', 'kitie', '0', '1');
INSERT INTO `message` VALUES (760, '111', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:38:20', 'kitie', '0', '1');
INSERT INTO `message` VALUES (761, '111', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:38:47', 'kitie', '0', '1');
INSERT INTO `message` VALUES (762, '你好', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:40:15', 'kitie', '0', '1');
INSERT INTO `message` VALUES (763, '11', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:41:05', 'kitie', '0', '1');
INSERT INTO `message` VALUES (764, '11', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:41:14', 'kitie', '0', '1');
INSERT INTO `message` VALUES (765, '11', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:41:51', 'kitie', '0', '1');
INSERT INTO `message` VALUES (766, '11', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:42:12', 'kitie', '0', '1');
INSERT INTO `message` VALUES (767, '12312', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:42:36', 'kitie', '0', '1');
INSERT INTO `message` VALUES (768, '狡诈恶徒', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:43:11', 'kitie', '0', '1');
INSERT INTO `message` VALUES (769, 'gun', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 14:43:30', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (770, '111', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:06', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (771, '222', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:08', 'kitie', '0', '1');
INSERT INTO `message` VALUES (772, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:10', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (773, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:11', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (774, '123123', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:12', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (775, '12312312', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:21', 'kitie', '0', '1');
INSERT INTO `message` VALUES (776, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:27', 'kitie', '0', '1');
INSERT INTO `message` VALUES (777, '23123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:40', 'kitie', '0', '1');
INSERT INTO `message` VALUES (778, '傻逼', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:21:59', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (779, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:22:14', 'kitie', '0', '1');
INSERT INTO `message` VALUES (780, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:22:16', 'kitie', '0', '1');
INSERT INTO `message` VALUES (781, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:22:37', 'kitie', '0', '1');
INSERT INTO `message` VALUES (782, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:22:56', 'kitie', '0', '1');
INSERT INTO `message` VALUES (783, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:23:04', 'kitie', '0', '1');
INSERT INTO `message` VALUES (784, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:31:34', 'kitie', '1', '1');
INSERT INTO `message` VALUES (785, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:32:48', 'kitie', '1', '1');
INSERT INTO `message` VALUES (786, '/src/assets/img/emoji/tired-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:32:50', 'kitie', '1', '1');
INSERT INTO `message` VALUES (787, '/src/assets/img/emoji/smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:32:52', 'kitie', '1', '1');
INSERT INTO `message` VALUES (788, '/src/assets/img/emoji/slightly-smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:32:54', 'kitie', '1', '1');
INSERT INTO `message` VALUES (789, '/src/assets/img/emoji/face-without-mouth.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:32:56', 'kitie', '1', '1');
INSERT INTO `message` VALUES (790, '/src/assets/img/emoji/loudly-crying-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:34:04', 'kitie', '1', '1');
INSERT INTO `message` VALUES (791, '/src/assets/img/emoji/face-without-mouth.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:37:24', 'kitie', '1', '1');
INSERT INTO `message` VALUES (792, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:37:26', 'kitie', '1', '1');
INSERT INTO `message` VALUES (793, '/src/assets/img/emoji/smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:37:28', 'kitie', '1', '1');
INSERT INTO `message` VALUES (794, '/src/assets/img/emoji/thinking-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:37:30', 'kitie', '1', '1');
INSERT INTO `message` VALUES (795, '/src/assets/img/emoji/tired-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:37:32', 'kitie', '1', '1');
INSERT INTO `message` VALUES (796, '疯啦', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:38:18', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (797, '/src/assets/img/emoji/face-screaming-in-fear.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:38:26', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (798, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:53:19', 'kitie', '1', '1');
INSERT INTO `message` VALUES (799, '/src/assets/img/emoji/new-moon-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:57:51', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (800, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:27', 'kitie', '1', '1');
INSERT INTO `message` VALUES (801, '/src/assets/img/emoji/smiling-face-with-heart-eyes.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:28', 'kitie', '1', '1');
INSERT INTO `message` VALUES (802, '/src/assets/img/emoji/smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:28', 'kitie', '1', '1');
INSERT INTO `message` VALUES (803, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:29', 'kitie', '1', '1');
INSERT INTO `message` VALUES (804, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:29', 'kitie', '1', '1');
INSERT INTO `message` VALUES (805, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:30', 'kitie', '1', '1');
INSERT INTO `message` VALUES (806, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:30', 'kitie', '1', '1');
INSERT INTO `message` VALUES (807, '/src/assets/img/emoji/ghost.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:58:02', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (808, '/src/assets/img/emoji/clown-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:31', 'kitie', '1', '1');
INSERT INTO `message` VALUES (809, '/src/assets/img/emoji/jack-o-lantern.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:31', 'kitie', '1', '1');
INSERT INTO `message` VALUES (810, '/src/assets/img/emoji/money-bag.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:31', 'kitie', '1', '1');
INSERT INTO `message` VALUES (811, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:31', 'kitie', '1', '1');
INSERT INTO `message` VALUES (812, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:32', 'kitie', '1', '1');
INSERT INTO `message` VALUES (813, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:32', 'kitie', '1', '1');
INSERT INTO `message` VALUES (814, '/src/assets/img/emoji/clown-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:32', 'kitie', '1', '1');
INSERT INTO `message` VALUES (815, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:32', 'kitie', '1', '1');
INSERT INTO `message` VALUES (816, '/src/assets/img/emoji/sparkles.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:58:04', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (817, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:32', 'kitie', '1', '1');
INSERT INTO `message` VALUES (818, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:33', 'kitie', '1', '1');
INSERT INTO `message` VALUES (819, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:33', 'kitie', '1', '1');
INSERT INTO `message` VALUES (820, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:33', 'kitie', '1', '1');
INSERT INTO `message` VALUES (821, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:33', 'kitie', '1', '1');
INSERT INTO `message` VALUES (822, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:33', 'kitie', '1', '1');
INSERT INTO `message` VALUES (823, '/src/assets/img/emoji/face-without-mouth.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:34', 'kitie', '1', '1');
INSERT INTO `message` VALUES (824, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:34', 'kitie', '1', '1');
INSERT INTO `message` VALUES (825, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:34', 'kitie', '1', '1');
INSERT INTO `message` VALUES (826, '/src/assets/img/emoji/clown-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:34', 'kitie', '1', '1');
INSERT INTO `message` VALUES (827, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:35', 'kitie', '1', '1');
INSERT INTO `message` VALUES (828, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:35', 'kitie', '1', '1');
INSERT INTO `message` VALUES (829, '/src/assets/img/emoji/lips.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:35', 'kitie', '1', '1');
INSERT INTO `message` VALUES (830, '/src/assets/img/emoji/hibiscus.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:35', 'kitie', '1', '1');
INSERT INTO `message` VALUES (831, '/src/assets/img/emoji/hibiscus.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:35', 'kitie', '1', '1');
INSERT INTO `message` VALUES (832, '/src/assets/img/emoji/ghost.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:58:07', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (833, '/src/assets/img/emoji/hibiscus.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:35', 'kitie', '1', '1');
INSERT INTO `message` VALUES (834, '/src/assets/img/emoji/money-bag.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:58:07', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (835, '/src/assets/img/emoji/money-bag.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:58:08', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (836, '/src/assets/img/emoji/lips.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:36', 'kitie', '1', '1');
INSERT INTO `message` VALUES (837, '/src/assets/img/emoji/star.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:58:08', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (838, '/src/assets/img/emoji/sparkles.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:58:08', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (839, '/src/assets/img/emoji/hibiscus.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 15:58:08', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (840, '/src/assets/img/emoji/lips.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:38', 'kitie', '1', '1');
INSERT INTO `message` VALUES (841, '/src/assets/img/emoji/hibiscus.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:38', 'kitie', '1', '1');
INSERT INTO `message` VALUES (842, '/src/assets/img/emoji/hibiscus.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:38', 'kitie', '1', '1');
INSERT INTO `message` VALUES (843, '/src/assets/img/emoji/shamrock.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:38', 'kitie', '1', '1');
INSERT INTO `message` VALUES (844, '/src/assets/img/emoji/lips.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:39', 'kitie', '1', '1');
INSERT INTO `message` VALUES (845, '/src/assets/img/emoji/shamrock.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:39', 'kitie', '1', '1');
INSERT INTO `message` VALUES (846, '/src/assets/img/emoji/rainbow.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:40', 'kitie', '1', '1');
INSERT INTO `message` VALUES (847, '/src/assets/img/emoji/lips.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:00:40', 'kitie', '1', '1');
INSERT INTO `message` VALUES (848, '/src/assets/img/emoji/slightly-smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:01:41', 'kitie', '1', '1');
INSERT INTO `message` VALUES (849, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:07', 'kitie', '1', '1');
INSERT INTO `message` VALUES (850, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:08', 'kitie', '1', '1');
INSERT INTO `message` VALUES (851, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:09', 'kitie', '1', '1');
INSERT INTO `message` VALUES (852, '/src/assets/img/emoji/face-without-mouth.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:11', 'kitie', '1', '1');
INSERT INTO `message` VALUES (853, '/src/assets/img/emoji/jack-o-lantern.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:13', 'kitie', '1', '1');
INSERT INTO `message` VALUES (854, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:14', 'kitie', '1', '1');
INSERT INTO `message` VALUES (855, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:14', 'kitie', '1', '1');
INSERT INTO `message` VALUES (856, '/src/assets/img/emoji/money-bag.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:16', 'kitie', '1', '1');
INSERT INTO `message` VALUES (857, '/src/assets/img/emoji/clown-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:17', 'kitie', '1', '1');
INSERT INTO `message` VALUES (858, '/src/assets/img/emoji/face-with-tongue.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:17', 'kitie', '1', '1');
INSERT INTO `message` VALUES (859, '/src/assets/img/emoji/clown-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:31', 'kitie', '1', '1');
INSERT INTO `message` VALUES (860, '/src/assets/img/emoji/smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:34', 'kitie', '1', '1');
INSERT INTO `message` VALUES (861, '/src/assets/img/emoji/tired-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:36', 'kitie', '1', '1');
INSERT INTO `message` VALUES (862, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:37', 'kitie', '1', '1');
INSERT INTO `message` VALUES (863, '/src/assets/img/emoji/smiling-face-with-heart-eyes.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:40', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (864, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:41', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (865, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:42', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (866, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:57', 'kitie', '1', '1');
INSERT INTO `message` VALUES (867, '/src/assets/img/emoji/loudly-crying-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:11:58', 'kitie', '1', '1');
INSERT INTO `message` VALUES (868, '/src/assets/img/emoji/face-vomiting.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:00', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (869, '/src/assets/img/emoji/face-screaming-in-fear.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:00', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (870, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:33', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (871, '/src/assets/img/emoji/smiling-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:34', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (872, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:35', 'kitie', '1', '1');
INSERT INTO `message` VALUES (873, '/src/assets/img/emoji/thinking-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:36', 'kitie', '1', '1');
INSERT INTO `message` VALUES (874, '/src/assets/img/emoji/smiling-face-with-heart-eyes.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:41', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (875, '/src/assets/img/emoji/loudly-crying-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:43', 'kitie', '1', '1');
INSERT INTO `message` VALUES (876, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:44', 'kitie', '1', '1');
INSERT INTO `message` VALUES (877, '/src/assets/img/emoji/jack-o-lantern.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:44', 'kitie', '1', '1');
INSERT INTO `message` VALUES (878, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:45', 'kitie', '1', '1');
INSERT INTO `message` VALUES (879, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:46', 'kitie', '1', '1');
INSERT INTO `message` VALUES (880, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:53', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (881, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:12:54', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (882, '/src/assets/img/emoji/loudly-crying-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:04', 'kitie', '1', '1');
INSERT INTO `message` VALUES (883, '/src/assets/img/emoji/thinking-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:05', 'kitie', '1', '1');
INSERT INTO `message` VALUES (884, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:05', 'kitie', '1', '1');
INSERT INTO `message` VALUES (885, '/src/assets/img/emoji/smiling-face-with-heart-eyes.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:07', 'kitie', '1', '1');
INSERT INTO `message` VALUES (886, '/src/assets/img/emoji/smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:07', 'kitie', '1', '1');
INSERT INTO `message` VALUES (887, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:13', 'kitie', '1', '1');
INSERT INTO `message` VALUES (888, '/src/assets/img/emoji/face-without-mouth.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:23', 'kitie', '1', '1');
INSERT INTO `message` VALUES (889, '/src/assets/img/emoji/tired-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:24', 'kitie', '1', '1');
INSERT INTO `message` VALUES (890, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:24', 'kitie', '1', '1');
INSERT INTO `message` VALUES (891, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:25', 'kitie', '1', '1');
INSERT INTO `message` VALUES (892, '/src/assets/img/emoji/thinking-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:25', 'kitie', '1', '1');
INSERT INTO `message` VALUES (893, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:25', 'kitie', '1', '1');
INSERT INTO `message` VALUES (894, '/src/assets/img/emoji/loudly-crying-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:26', 'kitie', '1', '1');
INSERT INTO `message` VALUES (895, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:27', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (896, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:28', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (897, '/src/assets/img/emoji/thinking-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:28', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (898, '/src/assets/img/emoji/face-vomiting.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:29', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (899, '/src/assets/img/emoji/face-without-mouth.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:29', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (900, '/src/assets/img/emoji/jack-o-lantern.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:29', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (901, '/src/assets/img/emoji/money-mouth-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:31', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (902, '/src/assets/img/emoji/face-with-tongue.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:31', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (903, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:32', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (904, '/src/assets/img/emoji/face-vomiting.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:32', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (905, '/src/assets/img/emoji/face-screaming-in-fear.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:32', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (906, '/src/assets/img/emoji/new-moon-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:33', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (907, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:33', 'kitie', '1', '1');
INSERT INTO `message` VALUES (908, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:34', 'kitie', '1', '1');
INSERT INTO `message` VALUES (909, '/src/assets/img/emoji/loudly-crying-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:34', 'kitie', '1', '1');
INSERT INTO `message` VALUES (910, '/src/assets/img/emoji/slightly-smiling-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:35', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (911, '/src/assets/img/emoji/face-vomiting.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:35', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (912, '/src/assets/img/emoji/ghost.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:35', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (913, '/src/assets/img/emoji/face-without-mouth.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:36', 'kitie', '1', '1');
INSERT INTO `message` VALUES (914, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:36', 'kitie', '1', '1');
INSERT INTO `message` VALUES (915, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:37', 'kitie', '1', '1');
INSERT INTO `message` VALUES (916, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:37', 'kitie', '1', '1');
INSERT INTO `message` VALUES (917, '/src/assets/img/emoji/thinking-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:37', 'kitie', '1', '1');
INSERT INTO `message` VALUES (918, '/src/assets/img/emoji/money-bag.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:39', 'kitie', '1', '1');
INSERT INTO `message` VALUES (919, '/src/assets/img/emoji/jack-o-lantern.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:39', 'kitie', '1', '1');
INSERT INTO `message` VALUES (920, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:39', 'kitie', '1', '1');
INSERT INTO `message` VALUES (921, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:39', 'kitie', '1', '1');
INSERT INTO `message` VALUES (922, '/src/assets/img/emoji/face-with-tongue.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:40', 'kitie', '1', '1');
INSERT INTO `message` VALUES (923, '/src/assets/img/emoji/money-mouth-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:41', 'kitie', '1', '1');
INSERT INTO `message` VALUES (924, '/src/assets/img/emoji/loudly-crying-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:41', 'kitie', '1', '1');
INSERT INTO `message` VALUES (925, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:41', 'kitie', '1', '1');
INSERT INTO `message` VALUES (926, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:42', 'kitie', '1', '1');
INSERT INTO `message` VALUES (927, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:42', 'kitie', '1', '1');
INSERT INTO `message` VALUES (928, '/src/assets/img/emoji/thinking-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:43', 'kitie', '1', '1');
INSERT INTO `message` VALUES (929, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:43', 'kitie', '1', '1');
INSERT INTO `message` VALUES (930, '/src/assets/img/emoji/smiling-face-with-heart-eyes.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:44', 'kitie', '1', '1');
INSERT INTO `message` VALUES (931, '/src/assets/img/emoji/smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:44', 'kitie', '1', '1');
INSERT INTO `message` VALUES (932, '/src/assets/img/emoji/slightly-smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:44', 'kitie', '1', '1');
INSERT INTO `message` VALUES (933, '/src/assets/img/emoji/face-screaming-in-fear.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:46', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (934, '/src/assets/img/emoji/new-moon-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:46', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (935, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:47', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (936, '/src/assets/img/emoji/clown-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:47', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (937, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:47', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (938, '/src/assets/img/emoji/smiling-face-with-heart-eyes.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:48', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (939, '/src/assets/img/emoji/smiling-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:48', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (940, '/src/assets/img/emoji/face-without-mouth.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:49', 'kitie', '1', '1');
INSERT INTO `message` VALUES (941, '/src/assets/img/emoji/loudly-crying-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:50', 'kitie', '1', '1');
INSERT INTO `message` VALUES (942, '/src/assets/img/emoji/money-mouth-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:50', 'kitie', '1', '1');
INSERT INTO `message` VALUES (943, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:51', 'kitie', '1', '1');
INSERT INTO `message` VALUES (944, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:51', 'kitie', '1', '1');
INSERT INTO `message` VALUES (945, '/src/assets/img/emoji/face-screaming-in-fear.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:52', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (946, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:52', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (947, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:52', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (948, '/src/assets/img/emoji/new-moon-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:53', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (949, '/src/assets/img/emoji/face-vomiting.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:53', 'kitie', '1', '1');
INSERT INTO `message` VALUES (950, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:54', 'kitie', '1', '1');
INSERT INTO `message` VALUES (951, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:55', 'kitie', '1', '1');
INSERT INTO `message` VALUES (952, '/src/assets/img/emoji/smiling-face-with-heart-eyes.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:55', 'kitie', '1', '1');
INSERT INTO `message` VALUES (953, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:56', 'kitie', '1', '1');
INSERT INTO `message` VALUES (954, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:56', 'kitie', '1', '1');
INSERT INTO `message` VALUES (955, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:57', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (956, '/src/assets/img/emoji/new-moon-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:58', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (957, '/src/assets/img/emoji/clown-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:13:58', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (958, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:14:00', 'kitie', '1', '1');
INSERT INTO `message` VALUES (959, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:14:00', 'kitie', '1', '1');
INSERT INTO `message` VALUES (960, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:14:29', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (961, '/src/assets/img/emoji/face-screaming-in-fear.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:14:30', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (962, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:14:30', 'kitie', '1', '1');
INSERT INTO `message` VALUES (963, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:14:31', 'kitie', '1', '1');
INSERT INTO `message` VALUES (964, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:14:40', 'kitie', '1', '1');
INSERT INTO `message` VALUES (965, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:14:42', 'kitie', '1', '1');
INSERT INTO `message` VALUES (966, '/src/assets/img/emoji/ghost.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:15:03', 'kitie', '1', '1');
INSERT INTO `message` VALUES (967, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:15:03', 'kitie', '1', '1');
INSERT INTO `message` VALUES (968, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:15:05', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (969, '/src/assets/img/emoji/face-with-tongue.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:15:14', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (970, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:15:51', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (971, '/src/assets/img/emoji/money-mouth-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:15:52', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (972, '/src/assets/img/emoji/pouting-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:17:02', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (973, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:17:03', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (974, '/src/assets/img/emoji/smiling-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:17:03', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (975, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:17:04', 'kitie', '1', '1');
INSERT INTO `message` VALUES (976, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:17:05', 'kitie', '1', '1');
INSERT INTO `message` VALUES (977, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:45:21', 'kitie', '1', '1');
INSERT INTO `message` VALUES (978, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:45:23', 'kitie', '1', '1');
INSERT INTO `message` VALUES (979, '/src/assets/img/emoji/money-mouth-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:45:28', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (980, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:45:29', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (981, '/src/assets/img/emoji/smiling-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:45:30', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (982, '/src/assets/img/emoji/smiling-face-with-sunglasses.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:48:49', 'kitie', '1', '1');
INSERT INTO `message` VALUES (983, '/src/assets/img/emoji/pouting-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-14 16:51:45', 'kitie', '1', '1');
INSERT INTO `message` VALUES (984, '/src/assets/img/emoji/loudly-crying-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:13:06', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (985, '/src/assets/img/emoji/clown-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:13:14', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (986, '/src/assets/img/emoji/ghost.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:13:16', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (987, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:13:19', 'kitie', '1', '1');
INSERT INTO `message` VALUES (988, '/src/assets/img/emoji/slightly-smiling-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:13:23', 'kitie', '1', '1');
INSERT INTO `message` VALUES (989, '/src/assets/img/emoji/money-bag.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:13:44', 'kitie', '1', '1');
INSERT INTO `message` VALUES (990, '/src/assets/img/emoji/face-without-mouth.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:15:42', 'kitie', '1', '1');
INSERT INTO `message` VALUES (991, '/src/assets/img/emoji/smiling-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:15:56', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (992, '/src/assets/img/emoji/smiling-face-with-heart-eyes.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:16:02', 'kitie', '1', '1');
INSERT INTO `message` VALUES (993, '/src/assets/img/emoji/face-screaming-in-fear.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:19:08', 'kitie', '1', '1');
INSERT INTO `message` VALUES (994, '/src/assets/img/emoji/money-mouth-face.png', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:19:13', 'kitie22', '1', '1');
INSERT INTO `message` VALUES (995, '/src/assets/img/emoji/shamrock.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 09:25:49', 'kitie', '1', '1');
INSERT INTO `message` VALUES (996, '111', 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 10:19:06', 'kitie22', '0', '1');
INSERT INTO `message` VALUES (997, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 10:47:06', 'kitie', '0', '1');
INSERT INTO `message` VALUES (998, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 10:47:13', 'kitie', '0', '1');
INSERT INTO `message` VALUES (999, '123123', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 10:47:19', 'kitie', '0', '1');
INSERT INTO `message` VALUES (1000, '/src/assets/img/emoji/new-moon-face.png', 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', '2023-07-15 17:23:02', 'kitie', '1', '1');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL COMMENT '主键id',
  `title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `postUserId` int NOT NULL COMMENT '公告发布人的id',
  `postUserName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告发布人的姓名',
  `time` datetime NOT NULL COMMENT '公告发布时间',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '公告的内容',
  `userId` int NOT NULL COMMENT '对应的用户id',
  `isRead` int NOT NULL COMMENT '是否已读：0未读 1已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '公告测试1111111111111111111111111', 10, 'kitie', '2023-05-26 17:32:21', '公告测试', 10, 1);
INSERT INTO `notice` VALUES (2, '公告测试1111111111111111111111111', 10, 'kitie', '2023-05-26 17:32:21', '公告测试', 10, 1);
INSERT INTO `notice` VALUES (3, '公告测试1111111111111111111111111', 10, 'kitie', '2023-05-26 17:32:21', '公告测试', 10, 1);
INSERT INTO `notice` VALUES (4, '公告测试1111111111111111111111111', 10, 'kitie', '2023-05-26 17:32:21', '公告测试', 10, 1);
INSERT INTO `notice` VALUES (5, '公告测试1111111111111111111111111', 10, 'kitie', '2023-05-26 17:32:21', '公告测试', 10, 1);

-- ----------------------------
-- Table structure for noticeread
-- ----------------------------
DROP TABLE IF EXISTS `noticeread`;
CREATE TABLE `noticeread`  (
  `id` int NOT NULL COMMENT '主键id',
  `noticeId` int NOT NULL COMMENT '公告id',
  `userd` int NOT NULL COMMENT '用户id',
  `isRead` int NOT NULL COMMENT '是否已读：0未读，1已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of noticeread
-- ----------------------------

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `senderId` int NOT NULL COMMENT '会话发起者id',
  `receiverId` int NOT NULL COMMENT '会话接收者id',
  `receiverImg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '会话接收者头像url',
  `receiverName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '会话接收者姓名',
  `notRead` int NOT NULL DEFAULT 0 COMMENT '会话未读数',
  `beforeContent` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '会话最后一次聊天信息',
  `createTime` datetime NOT NULL COMMENT '会话创建时间',
  `type` int NOT NULL COMMENT '会话类型，1为正常会话，2为特殊对象会话（chatgpt等）',
  `isOnline` int NOT NULL COMMENT '会话接收者是否在线 ， 0离线，1在线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '当A向B发起信息时，会创建两个会话，A对B的会话，以及B对A的会话，如果没有发送那就只会创建一个A对B的会话。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES (1, 12, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'chatGpt3.5', 0, '你好！有什么我可以帮助你的吗？', '2023-07-08 20:29:22', 2, 1);
INSERT INTO `session` VALUES (2, 10, 2, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'chatGpt4', 0, '你好1111111111111111111', '2023-07-08 20:29:22', 2, 1);
INSERT INTO `session` VALUES (3, 10, 3, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'chatGpt3.5', 0, '多态是指同一个方法调用可以有不同的表现形式。在Java中，多态可以通过继承和接口实现。\n\n下面是一个例子，说明多态的概念：\n\n```java\n// 定义一个动物类\nclass Animal {\n  public void sound() {\n    System.out.println(\"动物发出声音\");\n  }\n}\n\n// 定义一个狗类，继承自动物类\nclass Dog extends Animal {\n  @Override\n  public void sound() {\n    System.out.println(\"狗发出汪汪声\");\n  }\n}\n\n// 定义一个猫类，继承自动物类\nclass Cat extends Animal {\n  @Override\n  public void sound() {\n    System.out.println(\"猫发出喵喵声\");\n  }\n}\n\npublic class Main {\n  public static void main(String[] args) {\n    Animal animal1 = new Animal();\n    Animal animal2 = new Dog();\n    Animal animal3 = new Cat();\n    \n    animal1.sound(); // 输出：动物发出声音\n    animal2.sound(); // 输出：狗发出汪汪声\n    animal3.sound(); // 输出：猫发出喵喵声\n  }\n}\n```\n\n通过上面的例子，可以看到animal1、animal2和animal3虽然都是Animal类型的对象，但在调用sound()方法时却有不同的行为表现。这就是多态的体现：通过父类引用指向子类对象，从而实现同一个方法具有不同的实现。', '2023-07-08 20:29:22', 2, 1);
INSERT INTO `session` VALUES (5, 12, 2, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'chatGpt4', 0, '你好1111111111111111111', '2023-07-08 20:29:22', 2, 1);
INSERT INTO `session` VALUES (7, 10, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', 'kitie22', 0, '[表情]', '2023-07-08 20:29:22', 1, 1);
INSERT INTO `session` VALUES (8, 2, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'chatGpt4', 0, '你好1111111111111111111', '2023-07-08 20:29:22', 2, 0);
INSERT INTO `session` VALUES (9, 3, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'chatGpt3.5', 12, '多态是指同一个方法调用可以有不同的表现形式。在Java中，多态可以通过继承和接口实现。\n\n下面是一个例子，说明多态的概念：\n\n```java\n// 定义一个动物类\nclass Animal {\n  public void sound() {\n    System.out.println(\"动物发出声音\");\n  }\n}\n\n// 定义一个狗类，继承自动物类\nclass Dog extends Animal {\n  @Override\n  public void sound() {\n    System.out.println(\"狗发出汪汪声\");\n  }\n}\n\n// 定义一个猫类，继承自动物类\nclass Cat extends Animal {\n  @Override\n  public void sound() {\n    System.out.println(\"猫发出喵喵声\");\n  }\n}\n\npublic class Main {\n  public static void main(String[] args) {\n    Animal animal1 = new Animal();\n    Animal animal2 = new Dog();\n    Animal animal3 = new Cat();\n    \n    animal1.sound(); // 输出：动物发出声音\n    animal2.sound(); // 输出：狗发出汪汪声\n    animal3.sound(); // 输出：猫发出喵喵声\n  }\n}\n```\n\n通过上面的例子，可以看到animal1、animal2和animal3虽然都是Animal类型的对象，但在调用sound()方法时却有不同的行为表现。这就是多态的体现：通过父类引用指向子类对象，从而实现同一个方法具有不同的实现。', '2023-07-08 20:29:22', 2, 0);
INSERT INTO `session` VALUES (10, 2, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'chatGpt3.5', 0, '你好1111111111111111111', '2023-07-08 20:29:22', 2, 1);
INSERT INTO `session` VALUES (11, 3, 12, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'chatGpt3.5', 19, '你好！有什么我可以帮助你的吗？', '2023-07-08 20:29:22', 2, 1);
INSERT INTO `session` VALUES (20, 12, 10, 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', 'kitie', 2, '[表情]', '2023-07-14 14:43:11', 1, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg' COMMENT '用户头像',
  `signature` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户签名',
  `isOnline` tinyint NOT NULL DEFAULT 0 COMMENT '是否在线：1在线，0离线',
  `type` tinyint NOT NULL DEFAULT 1 COMMENT '用户类型:0高级用户 1 普通用户 2ChatGPTAPI对象',
  `model` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'ChatGpt API对象使用的模型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'chatGpt4', '123123123123123', 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'gpt-4.0，能应对更加复杂的问题，响应速度慢', 1, 2, 'gpt-4');
INSERT INTO `user` VALUES (3, 'chatGpt3.5', '123123123123123', 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/247dea93-53c1-475e-9342-e60bbd7d9661.png', 'gpt-3.5-turbo，功能强大，稳定的聊天模型', 1, 2, 'gpt-3.5-turbo');
INSERT INTO `user` VALUES (10, 'kitie', 'ae8563c3137e3b754bd1fefd4a33f2c0', 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', NULL, 0, 1, NULL);
INSERT INTO `user` VALUES (11, 'kitie2', 'ae8563c3137e3b754bd1fefd4a33f2c0', 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', NULL, 0, 1, NULL);
INSERT INTO `user` VALUES (12, 'kitie22', 'ae8563c3137e3b754bd1fefd4a33f2c0', 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/yuncai.jpg', NULL, 1, 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
