/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50509
Source Host           : localhost:3306
Source Database       : alyx_sandbox

Target Server Type    : MYSQL
Target Server Version : 50509
File Encoding         : 65001

Date: 2011-03-01 20:44:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` char(35) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('87FA59D3-F3FC-2EA7-BAF991E9B324CE6E', 'test', '8DB4C11F2EAEAD8E1BCA28ECD41812ADC93DE278', 'Test User');
