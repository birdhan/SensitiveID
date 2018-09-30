/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-09-18 13:22:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('a1', 'liuBei', '123');
INSERT INTO `t_admin` VALUES ('a2', 'yh1234', '1234');
INSERT INTO `t_admin` VALUES ('a3', 'zhangSan', '123');

-- ----------------------------
-- Table structure for `t_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `bid` char(32) NOT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `discount` decimal(3,1) DEFAULT NULL,
  `press` varchar(100) DEFAULT NULL,
  `publishtime` char(10) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `pageNum` int(11) DEFAULT NULL,
  `wordNum` int(11) DEFAULT NULL,
  `printtime` char(10) DEFAULT NULL,
  `booksize` int(11) DEFAULT NULL,
  `paper` varchar(50) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `image_w` varchar(100) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bid`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_book_t_category` (`cid`),
  CONSTRAINT `FK_t_book_t_category` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('000A18FDB38F470DBE9CD0972BADB23F', 'Java Web整合开发实战--基于Struts 2+Hibernate+Spring（99个应用实例，4个项目开发案例，15.5小时配套教学视频，超值DVD光盘含大量开发资源。一本书搞定SSH框架整合开发！）', '贾蓓', '79.80', '55.10', '6.9', '清华大学出版社', '2013-7-1', '1', '640', '1030000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23268958-1_w.jpg', 'book_img/23268958-1_b.jpg', '16');
INSERT INTO `t_book` VALUES ('0BE0707984014E66BD9F34F534FCE0F7', 'OSGi实战【OSGi规范制定者亲自撰写 汇集Apache项目技术实战经验】', 'Richard', '99.00', '68.30', '6.9', '人民邮电出版社', '2013-1-1', '1', '468', '721000', '2013-1-1', '16', '胶版纸', '458795C27E7346A8A5F1B942319297E0', 'book_img/22938396-1_w.jpg', 'book_img/22938396-1_b.jpg', '58');
INSERT INTO `t_book` VALUES ('0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '昊斯特曼', '98.00', '67.60', '6.9', '机械工业出版社', '2008-6-1', '1', '694', '0', '2008-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20285763-1_w.jpg', 'book_img/20285763-1_b.jpg', '12');
INSERT INTO `t_book` VALUES ('113D0D1BB9174DD19A7DE7E2B37F677F', 'Java7入门经典（跟编程导师Ivor Horton学Java 预计到货日期9月初）', '霍尔顿', '118.00', '81.40', '6.9', '清华大学出版社', '2012-8-1', '1', '1124', '1918000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22813026-1_w.jpg', 'book_img/22813026-1_b.jpg', '94');
INSERT INTO `t_book` VALUES ('1286B13F0EA54E4CB75434762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', '霍斯特曼', '109.00', '75.20', '6.9', '人民邮电出版社', '2013-7-1', '1', '0', '1197000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23280479-1_w.jpg', 'book_img/23280479-1_b.jpg', '65');
INSERT INTO `t_book` VALUES ('13EBF9B1FDE346A683A1C45BD6773ECB', 'Java开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '无', '99.00', '68.30', '6.9', '清华大学出版社', '0', '1', '0', '1754000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21110930-1_w_1.jpg', 'book_img/21110930-1_b.jpg', '83');
INSERT INTO `t_book` VALUES ('1A15DC5E8A014A58862ED741D579B530', 'Java深入解析——透析Java本质的36个话题', '梁勇', '49.00', '33.80', '6.9', '电子工业出版社', '2013-11-1', '1', '298', '424000', '2013-11-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23363997-1_w_1.jpg', 'book_img/23363997-1_b.jpg', '86');
INSERT INTO `t_book` VALUES ('210A3DCA429049C78B623C3986BEB136', 'JavaScript经典教程套装：JavaScript高级程序设计(第3版)+JavaScript DOM编程艺术(第2版)(套装共2册)(超值附赠《码农》光盘1张)', 'Nicholas C. Zakas', '148.00', '88.80', '6.0', '人民邮电出版社', '2013-4-1', '1', '1048', '0', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23224089-1_w.jpg', 'book_img/23224089-1_b.jpg', '93');
INSERT INTO `t_book` VALUES ('22234CECF15F4ECB813F0B433DDA5365', 'JavaScript从入门到精通（附光盘1张）（连续8月JavaScript类全国零售排行前2名，13小时视频，400个经典实例、369项面试真题、138项测试史上最全资源库）', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2012-9-1', '1', '532', '939000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862057-1_w.jpg', 'book_img/22862057-1_b.jpg', '20');
INSERT INTO `t_book` VALUES ('230A00EC22BF4A1DBA87C64800B54C8D', 'Struts2技术内幕：深入解析Struts架构设计与实现原理', '陆舟', '69.00', '47.60', '6.9', '机械工业出版社', '2012-1-1', '1', '379', '0', '2012-1-1', '16', '胶版纸', 'C8E274EE5C99499080A98E24F0BD2E03', 'book_img/22577578-1_w.jpg', 'book_img/22577578-1_b.jpg', '56');
INSERT INTO `t_book` VALUES ('260F8A3594F741C1B0EB69616F65045B', 'Tomcat与Java Web开发技术详解（第2版）(含光盘1张)', '孙卫琴', '79.50', '54.90', '6.9', '电子工业出版社', '2009-1-1', '1', '734', '1216000', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20420983-1_w.jpg', 'book_img/20420983-1_b.jpg', '74');
INSERT INTO `t_book` VALUES ('28A03D28BAD449659A77330BE35FCD65', 'JAVA核心技术卷II：高级特性（原书第8版）', '霍斯特曼', '118.00', '81.40', '6.9', '机械工业出版社', '2008-12-1', '1', '852', '0', '2008-12-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20446562-1_w.jpg', 'book_img/20446562-1_b.jpg', '18');
INSERT INTO `t_book` VALUES ('2EE1A20A6AF742E387E18619D7E3BB94', 'Java虚拟机并发编程(Java并发编程领域的里程碑之作，资深Java技术专家、并发编程专家、敏捷开发专家和Jolt大奖得主撰写，Amazon五星畅销书)', 'Venkat Subramaniam', '59.00', '40.70', '6.9', '机械工业出版社', '2013-5-1', '1', '215', '0', '2013-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23239786-1_w.jpg', 'book_img/23239786-1_b.jpg', '54');
INSERT INTO `t_book` VALUES ('33ACF97A9A374352AE9F5E89BB791262', '基于MVC的JavaScript Web富应用开发', '麦卡劳', '59.00', '40.70', '6.9', '电子工业出版社', '2012-5-1', '1', '282', '462000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22757564-1_w.jpg', 'book_img/22757564-1_b.jpg', '34');
INSERT INTO `t_book` VALUES ('37F75BEAE1FE46F2B14674923F1E7987', '数据结构与算法分析Java语言描述 第2版', '韦斯', '55.00', '38.00', '6.9', '机械工业出版社', '2009-1-1', '2', '440', '0', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20417467-1_w.jpg', 'book_img/20417467-1_b.jpg', '32');
INSERT INTO `t_book` VALUES ('39F1D0803E8F4592AE1245CACE683214', 'Java程序员修炼之道', '埃文斯', '89.00', '61.40', '6.9', '人民邮电出版社', '2013-8-1', '1', '395', '658000', '2013-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23301847-1_w_1.jpg', 'book_img/23301847-1_b.jpg', '36');
INSERT INTO `t_book` VALUES ('3AE5C8B976B6448A9D3A155C1BDE12BC', '深入理解Java虚拟机:JVM高级特性与最佳实践（超级畅销书，6个月5次印刷，从实践角度解析JVM工作原理，Java程序员必备）', '周志明', '69.00', '47.60', '6.9', '机械工业出版社', '0', '1', '0', '0', '2011-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21108671-1_w_1.jpg', 'book_img/21108671-1_b.jpg', '66');
INSERT INTO `t_book` VALUES ('3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '霍斯特曼，科内尔', '119.00', '82.10', '6.9', '机械工业出版社', '2014-1-1', '1', '704', '0', '2014-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23362142-1_w_1.jpg', 'book_img/23362142-1_b.jpg', '9');
INSERT INTO `t_book` VALUES ('3E1990E19989422E9DA735978CB1E4CE', 'Effective Java中文版(第2版)', '布洛克', '52.00', '35.90', '6.9', '机械工业出版社', '2009-1-1', '2', '287', '0', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20459091-1_w.jpg', 'book_img/20459091-1_b.jpg', '25');
INSERT INTO `t_book` VALUES ('400D94DE5A0742B3A618FC76DF107183', 'JavaScript宝典（第7版）（配光盘）', '古德曼', '128.00', '88.30', '6.9', '清华大学出版社', '2013-1-1', '1', '1012', '1657000', '2013-1-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23169892-1_w.jpg', 'book_img/23169892-1_b.jpg', '88');
INSERT INTO `t_book` VALUES ('4491EA4832E04B8B94F334B71E871983', 'Java语言程序设计：进阶篇（原书第8版）', '梁勇', '79.00', '54.50', '6.9', '机械工业出版社', '2011-6-1', '1', '507', '0', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21117631-1_w_1.jpg', 'book_img/21117631-1_b.jpg', '48');
INSERT INTO `t_book` VALUES ('48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '弗兰纳根', '139.00', '95.30', '6.9', '机械工业出版社', '2012-4-1', '1', '1004', '0', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22722790-1_w.jpg', 'book_img/22722790-1_b.jpg', '4');
INSERT INTO `t_book` VALUES ('49D98E7916B94232862F7DCD1B0BAB66', 'HTML5+JavaScript动画基础', '兰贝塔', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-6-1', '1', '393', '553000', '2013-6-1', '16', '胶版纸', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/23266633-1_w.jpg', 'book_img/23266633-1_b.jpg', '51');
INSERT INTO `t_book` VALUES ('4A9574F03A6B40C1B2A437237C17DEEC', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', 'Craig Walls', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-6-1', '1', '374', '487000', '2013-6-1', '16', '胶版纸', 'C8E274EE5C99499080A98E24F0BD2E03', 'book_img/23254532-1_w.jpg', 'book_img/23254532-1_b.jpg', '11');
INSERT INTO `t_book` VALUES ('4BF6D97DD18A4B77B8DED9B057577F8F', 'Java Web从入门到精通（附光盘1张）（连续8月Java类全国零售排行前2名，27小时视频，951个经典实例、369项面试真题、596项测试史上最全资源库）', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2012-9-1', '1', '547', '979000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862056-1_w.jpg', 'book_img/22862056-1_b.jpg', '23');
INSERT INTO `t_book` VALUES ('4C3331CAD5A5453787A94B8D7CCEAA29', 'Java Web整合开发王者归来（JSP+Servlet+Struts+Hibernate+Spring）（配光盘', '刘京华', '99.80', '68.90', '6.9', '清华大学出版社', '2010-1-1', '1', '1010', '1368000', '2010-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20756351-1_w_1.jpg', 'book_img/20756351-1_b_1.jpg', '17');
INSERT INTO `t_book` VALUES ('4D20D2450B084113A331D909FF4975EB', 'jQuery实战(第2版)(畅销书升级版，掌握Web开发利器必修宝典)', 'Bear Bibeault　Yehuda Katz ', '69.00', '47.60', '6.9', '人民邮电出版社', '2012-3-1', '1', '394', '617000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22638286-1_w.jpg', 'book_img/22638286-1_b.jpg', '79');
INSERT INTO `t_book` VALUES ('4E44405DAFB7413E8A13BBFFBEE73AC7', 'JavaScript经典实例', '鲍尔斯', '78.00', '53.80', '6.9', '中国电力出版社', '2012-3-1', '1', '512', '625000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22692811-1_w.jpg', 'book_img/22692811-1_b.jpg', '68');
INSERT INTO `t_book` VALUES ('504FB999B0444B339907090927FDBE8A', '深入浅出Ext JS(第3版)', '徐会生', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-10-1', '3', '413', '642000', '2013-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23351049-1_w_1.jpg', 'book_img/23351049-1_b.jpg', '71');
INSERT INTO `t_book` VALUES ('52077C8423B645A9BADA96A5E0B14422', 'Spring源码深度解析', '郝佳', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-9-1', '1', '386', '545000', '2013-8-30', '16', '胶版纸', 'C8E274EE5C99499080A98E24F0BD2E03', 'book_img/23329703-1_w_1.jpg', 'book_img/23329703-1_b.jpg', '52');
INSERT INTO `t_book` VALUES ('52B0EDFF966E4A058BDA5B18EEC698C4', '亮剑Java Web项目开发案例导航(含DVD光盘1张)', '朱雪琴', '69.00', '41.40', '6.0', '电子工业出版社', '2012-3-1', '1', '526', '875000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22623766-1_w.jpg', 'book_img/22623766-1_b.jpg', '81');
INSERT INTO `t_book` VALUES ('5315DA60D24042889400AD4C93A37501', 'Spring 3.x企业应用开发实战(含CD光盘1张)', '陈雄华', '90.00', '62.10', '6.9', '电子工业出版社', '2012-2-1', '1', '710', '1158000', '2012-2-1', '16', '胶版纸', 'C8E274EE5C99499080A98E24F0BD2E03', 'book_img/22605701-1_w.jpg', 'book_img/22605701-1_b.jpg', '24');
INSERT INTO `t_book` VALUES ('56B1B7D8CD8740B098677C7216A673C4', '疯狂 Java 程序员的基本修养（《疯狂Java讲义》最佳拍档，扫清知识死角，夯实基本功）', '李刚', '59.00', '40.70', '6.9', '电子工业出版社', '2013-1-1', '1', '484', '7710000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23042420-1_w.jpg', 'book_img/23042420-1_b.jpg', '89');
INSERT INTO `t_book` VALUES ('57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', 'Guillermo Rauch', '79.00', '54.50', '6.9', '电子工业出版社', '2014-1-1', '1', '292', '436000', '2014-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23368351-1_w_2.jpg', 'book_img/23368351-1_b.jpg', '8');
INSERT INTO `t_book` VALUES ('5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '明日科技', '59.80', '41.30', '6.9', '清华大学出版社', '2012-9-1', '3', '564', '1013000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862060-1_w.jpg', 'book_img/22862060-1_b.jpg', '1');
INSERT INTO `t_book` VALUES ('5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', 'Nicholas C. Zakas', '99.00', '68.30', '6.9', '人民邮电出版社', '2012-3-1', '1', '730', '1092000', '2012-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22628333-1_w.jpg', 'book_img/22628333-1_b.jpg', '5');
INSERT INTO `t_book` VALUES ('5EDB981339C342ED8DB17D5A198D50DC', 'Java程序性能优化', '葛一鸣', '59.00', '40.70', '6.9', '清华大学出版社', '2012-10-1', '1', '400', '649000', '2012-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22881618-1_w.jpg', 'book_img/22881618-1_b.jpg', '27');
INSERT INTO `t_book` VALUES ('6398A7BA400D40258796BCBB2B256068', 'JavaScript设计模式', 'Addy Osmani', '49.00', '33.80', '6.9', '人民邮电出版社', '2013-6-1', '1', '241', '301000', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23266635-1_w.jpg', 'book_img/23266635-1_b.jpg', '40');
INSERT INTO `t_book` VALUES ('676B56A612AF4E968CF0F6FFE289269D', 'JavaScript和jQuery实战手册（原书第2版）', '麦克法兰', '99.00', '68.30', '6.9', '机械工业出版社', '2013-3-11', '1', '504', '0', '2013-3-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23201813-1_w.jpg', 'book_img/23201813-1_b.jpg', '42');
INSERT INTO `t_book` VALUES ('7917F5B19A0948FD9551932909328E4E', 'Java项目开发案例全程实录（第2版）（配光盘）（软件项目开发全程实录丛书）', '明日科技', '69.80', '48.20', '6.9', '清华大学出版社', '2011-1-1', '2', '605', '1037000', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20991549-1_w_1.jpg', 'book_img/20991549-1_b.jpg', '64');
INSERT INTO `t_book` VALUES ('7C0C785FFBEC4DEC802FA36E8B0BC87E', '深入分析Java Web技术内幕', '许令波', '69.00', '47.60', '6.9', '电子工业出版社', '2012-9-1', '1', '442', '746000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22881803-1_w.jpg', 'book_img/22881803-1_b.jpg', '50');
INSERT INTO `t_book` VALUES ('7CD79C20258F477AB841518D9312E843', 'Java程序员面试宝典（第三版）', '欧立奇', '49.00', '33.80', '6.9', '电子工业出版社', '2013-9-1', '1', '359', '446400', '2013-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23348683-1_w_1.jpg', 'book_img/23348683-1_b.jpg', '44');
INSERT INTO `t_book` VALUES ('7D7FE81293124793BDB2C6FF1F1C943D', '21天学通Java(第6版)（中文版累计销量超30000册）', 'Rogers Cadenhead', '55.00', '38.00', '6.9', '人民邮电出版社', '2013-4-1', '1', '410', '781000', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23219731-1_w.jpg', 'book_img/23219731-1_b.jpg', '46');
INSERT INTO `t_book` VALUES ('7FD7F50B15F74248AA769798909F8653', 'Java网络编程（第3版）——O’Reilly Java系列', '哈诺德', '85.00', '51.00', '6.0', '中国电力出版社', '2005-11-1', '1', '718', '668000', '2005-11-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9062293-1_w.jpg', 'book_img/9062293-1_b.jpg', '35');
INSERT INTO `t_book` VALUES ('819FF56E4423462394E6F83882F78975', '学通Java Web的24堂课（配光盘）（软件开发羊皮卷）', '陈丹丹', '79.80', '55.10', '6.9', '清华大学出版社', '2011-6-1', '1', '718', '1488000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21118835-1_w_1.jpg', 'book_img/21118835-1_b.jpg', '91');
INSERT INTO `t_book` VALUES ('81FADA99309342F4978D5C680B0C6E8C', 'Java入门很简单（配光盘）（入门很简单丛书）（打开Java编程之门 Java技术网推荐）', '李世民', '59.80', '41.30', '6.9', '清华大学出版社', '2012-8-1', '1', '459', '745000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22839309-1_w.jpg', 'book_img/22839309-1_b.jpg', '85');
INSERT INTO `t_book` VALUES ('89A57D099EA14026A5C3D10CFC10C22C', 'Java 2实用教程（第4版）（21世纪高等学校计算机基础实用规划教材）', '耿祥义', '39.50', '31.60', '8.0', '清华大学出版社', '2012-8-1', '4', '479', '782000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22844118-1_w.jpg', 'book_img/22844118-1_b.jpg', '73');
INSERT INTO `t_book` VALUES ('8A5B4042D5B14D6B87A34DABF327387F', 'Java核心技术 卷II：高级特性(第9版·英文版)(上、下册)', '霍斯特曼', '119.00', '82.10', '6.9', '人民邮电出版社', '2013-7-1', '1', '1118', '1370000', '2013-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23280478-1_w.jpg', 'book_img/23280478-1_b.jpg', '57');
INSERT INTO `t_book` VALUES ('8DD0ADF2665B40899E09ED2983DC3F7B', 'jQuery权威指南（被公认的权威的、易学的jQuery实战教程，多次重印，热销中）', '陶国荣', '59.00', '40.70', '6.9', '机械工业出版社', '2011-1-1', '1', '385', '0', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21006995-1_w_1.jpg', 'book_img/21006995-1_b.jpg', '75');
INSERT INTO `t_book` VALUES ('8E16D59BA4C34374A68029AE877613C4', '轻量级Java EE企业应用实战（第3版）：Struts 2＋Spring 3＋Hibernate整合开发(含CD光盘1张)', '李刚', '99.00', '68.30', '6.9', '电子工业出版社', '2012-4-1', '1', '816', '1440000', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22685703-1_w.jpg', 'book_img/22685703-1_b.jpg', '6');
INSERT INTO `t_book` VALUES ('8F1520F2CED94C679433B9C109E791CB', 'Java从入门到精通（实例版）（附光盘1张）（连续8月Java类全国零售排行前2名，14小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '明日科技', '69.80', '47.60', '6.9', '清华大学出版社', '2012-9-1', '1', '548', '986000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22862061-1_w.jpg', 'book_img/22862061-1_b.jpg', '49');
INSERT INTO `t_book` VALUES ('90E423DBE56042838806673DB3E86BD3', '《Spring技术内幕（第2版）》（畅销书全新升级，Spring类图书销量桂冠，从宏观和微观两个角度解析Spring架构设计和实现原理）', '计文柯', '69.00', '47.60', '6.9', '机械工业出版社', '2012-2-1', '2', '399', '0', '2012-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22606836-1_w.jpg', 'book_img/22606836-1_b.jpg', '45');
INSERT INTO `t_book` VALUES ('926B8F31C5D04F61A72F66679A0CCFFD', 'JavaScript编程精解（华章程序员书库）（JavaScript之父高度评价并强力推荐，系统学习JS首选！）', '哈弗贝克', '49.00', '33.80', '6.9', '械工业出版社', '2012-9-1', '1', '162', '0', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22873894-1_w.jpg', 'book_img/22873894-1_b.jpg', '70');
INSERT INTO `t_book` VALUES ('95AACC68D64D4D67B1E33E9EAC22B885', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', '塞若', '79.00', '47.40', '6.0', '中国电力出版社', '2007-2-1', '1', '689', '983000', '2001-7-2', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9265169-1_w.jpg', 'book_img/9265169-1_b.jpg', '13');
INSERT INTO `t_book` VALUES ('97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '刘西杰', '49.00', '32.90', '6.7', '人民邮电出版社', '2012-12-24', '1', '450', '705000', '2012-12-24', '16', '胶版纸', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/22928649-1_w.jpg', 'book_img/22928649-1_b.jpg', '3');
INSERT INTO `t_book` VALUES ('9923901FBF124623BC707920D8936BC8', 'JavaScript DOM编程艺术(第2版)', '基思', '49.00', '33.80', '6.9', '人民邮电出版社', '2011-4-1', '1', '286', '443000', '2011-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21049601-1_w_1.jpg', 'book_img/21049601-1_b.jpg', '28');
INSERT INTO `t_book` VALUES ('99BF63AC12AD48FCB673F1820888964E', 'Java Web开发实战1200例（第Ⅱ卷）（史上最全的“编程实例”类图书，代码分析、实例速查、练习巩固的绝好帮手）', '无', '99.00', '67.40', '6.8', '清华大学出版社', '0', '0', '0', '1746000', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21110929-1_w_1.jpg', 'book_img/21110929-1_b.jpg', '78');
INSERT INTO `t_book` VALUES ('9D257176A6934CB79427CEC37E69249F', '疯狂Ajax讲义（第3版）--jQuery/Ext JS/Prototype/DWR企业应用前端开发实战(含CD光盘1张)（畅销书升级版，企业应用前端开发实战指南）', '李刚', '79.00', '54.50', '6.9', '电子工业出版社', '2013-2-1', '1', '624', '997000', '2013-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23184673-1_w.jpg', 'book_img/23184673-1_b.jpg', '53');
INSERT INTO `t_book` VALUES ('9FBD51A7C02D4F5B9862CD2EBBF5CA04', 'Flash ActionScript 3.0全站互动设计', '刘欢 ', '69.80', '48.20', '6.9', '人民邮电出版社', '2012-10-1', '1', '488', '760000', '2012-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22886581-1_w.jpg', 'book_img/22886581-1_b.jpg', '96');
INSERT INTO `t_book` VALUES ('9FF423101836438F874035A48498CF45', 'Java编程思想（英文版·第4版）', '埃克尔 ', '79.00', '54.50', '6.9', '机械工业出版社', '2007-4-1', '1', '1482', '0', '2007-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9288920-1_w.jpg', 'book_img/9288920-1_b.jpg', '31');
INSERT INTO `t_book` VALUES ('A3D464D1D1344ED5983920B472826730', 'Java Web开发详解：XML+DTD+XML Schema+XSLT+Servlet 3 0+JSP 2 2深入剖析与实例应用(含CD光盘1张)', '孙鑫', '119.00', '61.30', '5.2', '电子工业出版社', '2012-5-1', '1', '889', '1760000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22788412-1_w.jpg', 'book_img/22788412-1_b.jpg', '60');
INSERT INTO `t_book` VALUES ('A46A0F48A4F649AE9008B38EA48FAEBA', 'Java编程全能词典(含DVD光盘2张)', '明日科技', '98.00', '65.70', '6.7', '电子工业出版社', '2010-3-1', '1', '486', '496000', '2010-3-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20813806-1_w_1.jpg', 'book_img/20813806-1_b.jpg', '90');
INSERT INTO `t_book` VALUES ('A5A6F27DCD174614850B26633A0B4605', 'JavaScript模式', '斯特凡洛夫', '38.00', '22.80', '6.0', '中国电力出版社', '2012-7-1', '1', '208', '253000', '2012-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22819430-1_w.jpg', 'book_img/22819430-1_b.jpg', '61');
INSERT INTO `t_book` VALUES ('A7220EF174704012830E066FDFAAD4AD', 'Spring 3.0就这么简单（国内原创的Java敏捷开发图书，展现作者Spring原创开源项目ROP开发的全过程，所有项目工程均以Maven组织）', '陈雄华', '59.00', '40.70', '6.9', '人民邮电出版社', '2013-1-1', '1', '380', '530000', '2013-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22938474-1_w.jpg', 'book_img/22938474-1_b.jpg', '77');
INSERT INTO `t_book` VALUES ('A7EFD99367C9434682A790635D3C5FDF', 'Java Web技术整合应用与项目实战（JSP+Servlet+Struts2+Hibernate+Spring3）', '张志锋', '98.00', '67.60', '6.9', '清华大学出版社', '2013-6-1', '1', '878', '0', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23266270-1_w.jpg', 'book_img/23266270-1_b.jpg', '92');
INSERT INTO `t_book` VALUES ('A8EF76FD21A645109538614DEA85F3F7', 'Java语言程序设计：基础篇（原书第8版）', '梁勇', '75.00', '51.80', '6.9', '机械工业出版社', '2011-6-1', '1', '586', '0', '2011-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/21122188-1_w_1.jpg', 'book_img/21122188-1_b.jpg', '30');
INSERT INTO `t_book` VALUES ('AD6EA79CCB8240AAAF5B292AD7E5DCAA', 'jQuery Mobile权威指南（根据jQuery Mobile最新版本撰写的权威参考书！全面讲解jQuery Mobile的所有功能、特性、使用方法和开发技巧）', '陶国荣', '59.00', '40.70', '6.9', '机械工业出版社', '2012-8-1', '1', '249', '0', '2012-8-1', '16', '胶版纸', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/22847009-1_w.jpg', 'book_img/22847009-1_b.jpg', '38');
INSERT INTO `t_book` VALUES ('AE0935F13A214436B8599DE285A86220', 'JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)', 'Tom Negrino　Dori Smith', '69.00', '47.60', '6.9', '人民邮电出版社', '2012-4-1', '1', '392', '694000', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22717349-1_w.jpg', 'book_img/22717349-1_b.jpg', '37');
INSERT INTO `t_book` VALUES ('AF28ED8F692C4288B32CF411CBDBFC23', '经典Java EE企业应用实战——基于WebLogic/JBoss的JSF+EJB 3+JPA整合开发(含CD光盘1张)', '无', '79.00', '54.50', '6.9', '电子工业出版社', '2010-8-1', '1', '0', '0', '2010-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20928547-1_w_1.jpg', 'book_img/20928547-1_b.jpg', '55');
INSERT INTO `t_book` VALUES ('B329A14DDEF8455F82B3FDF25821D2BB', '名师讲坛——Java Web开发实战经典基础篇（JSP、Servlet、Struts、Ajax）（32小时全真课堂培训，视频超级给力！390项实例及分析，北京魔乐科技培训中心Java Web全部精华）', '李兴华', '69.80', '48.20', '6.9', '清华大学出版社', '2010-8-1', '1', '554', '819000', '2010-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20915948-1_w_3.jpg', 'book_img/20915948-1_b.jpg', '22');
INSERT INTO `t_book` VALUES ('B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '单东林', '49.00', '33.80', '6.9', '人民邮电出版社', '2012-7-1', '2', '380', '598000', '2012-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22786088-1_w.jpg', 'book_img/22786088-1_b.jpg', '10');
INSERT INTO `t_book` VALUES ('BD1CB005E4A04DCA881DA8689E21D4D0', 'jQuery UI开发指南', 'Eric Sarrion', '39.00', '26.90', '6.9', '人民邮电出版社', '2012-12-1', '1', '212', '286000', '2012-12-1', '16', '胶版纸', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/22910975-1_w.jpg', 'book_img/22910975-1_b.jpg', '63');
INSERT INTO `t_book` VALUES ('C23E6E8A6DB94E27B6E2ABD39DC21AF5', 'JavaScript:The Good Parts(影印版）', '克罗克福特', '28.00', '19.30', '6.9', '东南大学出版社', '2009-1-1', '1', '153', '181000', '2009-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20412979-1_w.jpg', 'book_img/20412979-1_b.jpg', '95');
INSERT INTO `t_book` VALUES ('C3CF52B3ED2D4187A16754551488D733', 'Java从入门到精通（附光盘）', '魔乐科技', '59.00', '35.40', '6.0', '人民邮电出版社', '2010-4-1', '1', '519', '884000', '2010-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20810282-1_w_1.jpg', 'book_img/20810282-1_b.jpg', '29');
INSERT INTO `t_book` VALUES ('C86D3F6FACB449BEBD940D9307ED4A47', '编写高质量代码：改善Java程序的151个建议(从语法、程序设计和架构、工具和框架、编码风格、编程思想5个方面探讨编写高质量Java代码的技巧、禁忌和最佳实践)', '秦小波', '59.00', '40.70', '6.9', '机械工业出版社', '2012-1-1', '1', '303', '0', '2012-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22579686-1_w.jpg', 'book_img/22579686-1_b.jpg', '84');
INSERT INTO `t_book` VALUES ('CB0AB3654945411EA69F368D0EA91A00', 'JavaScript语言精粹（修订版）', '道格拉斯·克罗克福德', '49.00', '39.20', '8.0', '电子工业出版社', '2012-9-1', '1', '155', '258000', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22872884-1_w.jpg', 'book_img/22872884-1_b.jpg', '33');
INSERT INTO `t_book` VALUES ('CD913617EE964D0DBAF20C60076D32FB', '名师讲坛——Java开发实战经典（配光盘）（60小时全真课堂培训，视频超级给力！790项实例及分析，北京魔乐科技培训中心Java全部精华）', '李兴华', '79.80', '55.10', '6.9', '清华大学出版社', '2009-8-1', '1', '831', '1222000', '2012-8-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20637368-1_w_2.jpg', 'book_img/20637368-1_b_2.jpg', '19');
INSERT INTO `t_book` VALUES ('CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '布鲁斯.艾克尔', '108.00', '74.50', '6.9', '机械工业出版社', '2007-6-1', '1', '880', '0', '2007-6-1', '0', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9317290-1_w.jpg', 'book_img/9317290-1_b.jpg', '2');
INSERT INTO `t_book` VALUES ('CF5546769F2842DABB2EF7A00D51F255', 'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）', '袁江', '79.80', '55.10', '6.9', '清华大学出版社', '2013-6-1', '1', '619', '1109000', '2013-6-1', '16', '胶版纸', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/23263012-1_w.jpg', 'book_img/23263012-1_b.jpg', '43');
INSERT INTO `t_book` VALUES ('D0DA36CEE42549FFB299B7C7129761D5', 'Java应用架构设计：模块化模式与OSGi(全球资深Java技术专家的力作，系统、全面地讲解如何将模块化设计思想引入开发中，涵盖18个有助于实现模块化软件架构的模式)', '克内恩席尔德', '69.00', '47.60', '6.9', '机械工业出版社', '2013-9-1', '1', '251', '0', '2013-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23339643-1_w.jpg', 'book_img/23339643-1_b.jpg', '26');
INSERT INTO `t_book` VALUES ('D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', 'Brian Goetz', '69.00', '47.60', '6.9', '机械工业出版社', '2012-2-1', '1', '290', '0', '2012-2-1', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22606835-1_w.jpg', 'book_img/22606835-1_b.jpg', '15');
INSERT INTO `t_book` VALUES ('D2ABA8B06C524632846F27C34568F3CE', 'Java 经典实例', '达尔文', '98.00', '67.60', '6.9', '中国电力出版社', '2009-2-1', '1', '784', '805000', '2009-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20500255-1_w.jpg', 'book_img/20500255-1_b.jpg', '62');
INSERT INTO `t_book` VALUES ('D8723405BA054C13B52357B8F6AEEC24', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '周志明', '79.00', '54.50', '6.9', '机械工业出版社', '2013-6-1', '2', '433', '0', '2013-6-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23259731-1_w.jpg', 'book_img/23259731-1_b.jpg', '14');
INSERT INTO `t_book` VALUES ('DC36FD53A1514312A0A9ADD53A583886', 'JavaScript异步编程：设计快速响应的网络应用【掌握JavaScript异步编程必杀技，让代码更具响应度！ 】', 'Trevor Burnham ', '32.00', '22.10', '6.9', '人民邮电出版社', '2013-6-1', '1', '118', '98000', '2013-5-23', '32', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23252196-1_w.jpg', 'book_img/23252196-1_b.jpg', '72');
INSERT INTO `t_book` VALUES ('DCB64DF0084E486EBF173F729A3A630A', 'Java设计模式(第2版)', 'Steven John Metsker', '75.00', '51.80', '6.9', '电子工业出版社', '2012-9-1', '1', '0', '0', '2012-9-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22868759-1_w.jpg', 'book_img/22868759-1_b.jpg', '76');
INSERT INTO `t_book` VALUES ('DEE7BDC7E0E343149E3C3601D2658171', '疯狂HTML 5/CSS 3/JavaScript讲义(含CD光盘1张)', '李刚', '69.00', '47.60', '6.9', '电子工业出版社', '2012-5-1', '1', '500', '819000', '2012-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22783904-1_w.jpg', 'book_img/22783904-1_b.jpg', '21');
INSERT INTO `t_book` VALUES ('DF4E74EEE89B43229BB8212F0B858C38', '精通Hibernate：Java对象持久化技术详解（第2版）(含光盘1张)', '孙卫琴', '75.00', '51.80', '6.9', '电子工业出版社', '2010-2-1', '1', '695', '1148800', '2010-2-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20773347-1_w_1.jpg', 'book_img/20773347-1_b.jpg', '39');
INSERT INTO `t_book` VALUES ('E4F184188C8B4C7BB32D4E76603426AC', '疯狂Java讲义（第2版，附光盘）', '李刚', '109.00', '75.20', '6.9', '电子工业出版社', '2012-1-1', '1', '844', '1747000', '2012-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22588603-1_w.jpg', 'book_img/22588603-1_b.jpg', '7');
INSERT INTO `t_book` VALUES ('EA695342393C4BE48B831FA5E6B0E5C4', '编写可维护的JavaScript《JavaScript高级程序设计》作者Nicholas Zakas最新力作，构建编码风格手册，帮助开发团队从“游击队”走向“正规军”）', 'Nicholas C. Zakas', '55.00', '38.00', '6.9', '人民邮电出版社', '2013-4-1', '1', '227', '400000', '2013-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23200995-1_w.jpg', 'book_img/23200995-1_b.jpg', '59');
INSERT INTO `t_book` VALUES ('F0E34313BF304CCEBF198BD4E05307B8', 'jQuery Cookbook中文版（jQuery之父鼎力推荐，社区数十位专家倾情力作', 'jQuery社区专家组', '69.00', '47.60', '6.9', '人民邮电出版社', '2013-5-1', '1', '425', '573000', '2013-5-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/23219358-1_w.jpg', 'book_img/23219358-1_b.jpg', '87');
INSERT INTO `t_book` VALUES ('F6162799E913423EA5CB57BEC65AB1E9', 'JUnit实战(第2版)', '塔凯文', '79.00', '54.50', '6.9', '人民邮电出版社', '2012-4-1', '1', '442', '640000', '2012-4-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/22633574-1_w.jpg', 'book_img/22633574-1_b.jpg', '80');
INSERT INTO `t_book` VALUES ('F693239BC3B3444C8538ABE7411BB38E', 'Java Web典型模块与项目实战大全（配光盘）', '常建功', '99.50', '68.70', '6.9', '清华大学出版社', '2011-1-1', '1', '922', '1473000', '2011-1-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/20988080-1_w_1.jpg', 'book_img/20988080-1_b.jpg', '41');
INSERT INTO `t_book` VALUES ('F78C94641DB4475BBA1E72A07DF9B3AE', 'JAVA面向对象编程', '孙卫琴 ', '65.80', '45.40', '6.9', '电子工业出版社', '2006-7-1', '1', '625', '1030400', '2006-7-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/9186890-1_w.jpg', 'book_img/9186890-1_b.jpg', '69');
INSERT INTO `t_book` VALUES ('FC232CD9B6E6411BBBB1A5B781D2C3C9', 'Java与模式(含盘)（超多实例和习题，详解设计原则与设计模式）', '阎宏', '88.00', '60.70', '6.9', '电子工业出版社', '2002-10-1', '1', '1024', '16704000', '2002-10-1', '16', '胶版纸', '5F79D0D246AD4216AC04E9C5FAB3199E', 'book_img/696673-1_w.jpg', 'book_img/696673-1_b.jpg', '67');
INSERT INTO `t_book` VALUES ('FEC3740CF30E442A94021911A25EF0D7', 'Spring攻略(第2版)(Spring攻略(第2版))', 'Gary Mak　Josh Long　Daniel Rubio', '128.00', '88.30', '6.9', '人民邮电出版社', '2012-3-1', '1', '938', '1322000', '2012-3-1', '16', '胶版纸', 'C8E274EE5C99499080A98E24F0BD2E03', 'book_img/22623020-1_w.jpg', 'book_img/22623020-1_b.jpg', '82');
INSERT INTO `t_book` VALUES ('FFABBED1E5254BC0B2726EC4ED8ACCDA', '深入理解OSGi：Equinox原理、应用与最佳实践（《深入理解Java虚拟机》作者新作！全面解读最新OSGi R5.0规范，深入讲解OSGi原理和服务，以及Equinox框架的用法和原理）', '周志明', '79.00', '54.50', '6.9', '机械工业出版社', '2013-2-1', '1', '414', '0', '2013-2-1', '16', '胶版纸', '84ECE401C2904DBEA560D04A581A66D9', 'book_img/23179003-1_w.jpg', 'book_img/23179003-1_b.jpg', '47');

-- ----------------------------
-- Table structure for `t_cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_cartitem`;
CREATE TABLE `t_cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_cartitem_t_user` (`uid`),
  KEY `FK_t_cartitem_t_book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_book` FOREIGN KEY (`bid`) REFERENCES `t_book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cartitem
-- ----------------------------
INSERT INTO `t_cartitem` VALUES ('26105F0766274317B74AEAAA82037EAE', '1', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', '32DB3700D2564254982BC58B0E4D95BC', '27');
INSERT INTO `t_cartitem` VALUES ('8108ACFBB16C488C90E533B4EF37273C', '6', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', '4DE7E4D829A54D4FAB150B7451407198', '21');
INSERT INTO `t_cartitem` VALUES ('A0EAE9076DEE45989249C49DAA4F2FFA', '1', '48BBFBFC07074ADE8CC906A45BE5D9A6', '4DE7E4D829A54D4FAB150B7451407198', '23');
INSERT INTO `t_cartitem` VALUES ('A8EDA8DF61074FFDA1B847F3D7B1DBC5', '1', '57B6FF1B89C843C38BA39C717FA557D6', '32DB3700D2564254982BC58B0E4D95BC', '26');
INSERT INTO `t_cartitem` VALUES ('B8939FC55131469CAB11E3924D40185F', '1', '37F75BEAE1FE46F2B14674923F1E7987', '531D8A16D524478D86F8A115FE95D93F', '13');
INSERT INTO `t_cartitem` VALUES ('E022FB6B4EA945219DC369E30530178A', '1', '5C68141786B84A4CB8929A2415040739', '4DE7E4D829A54D4FAB150B7451407198', '24');
INSERT INTO `t_cartitem` VALUES ('E87FF57FA922463EBF16F3E6F6E75706', '1', '57B6FF1B89C843C38BA39C717FA557D6', '4DE7E4D829A54D4FAB150B7451407198', '25');
INSERT INTO `t_cartitem` VALUES ('F9B679A6103C453E905F371EBBC2AA81', '1', 'CF5546769F2842DABB2EF7A00D51F255', '32DB3700D2564254982BC58B0E4D95BC', '28');

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`),
  KEY `FK_t_category_t_category` (`pid`),
  KEY `orderBy` (`orderBy`),
  CONSTRAINT `FK_t_category_t_category` FOREIGN KEY (`pid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '程序设计', null, '程序设计分类', '1');
INSERT INTO `t_category` VALUES ('2', '办公室用书', null, '办公室用书', '2');
INSERT INTO `t_category` VALUES ('3', '图形 图像 多媒体', '1', '图形图像多媒体', '3');
INSERT INTO `t_category` VALUES ('4', '操作系统/系统开发', null, '操作系统/系统开发', '4');
INSERT INTO `t_category` VALUES ('458795C27E7346A8A5F1B942319297E0', '系统开发', '4', '系统开发分类', '29');
INSERT INTO `t_category` VALUES ('4D01FFF0CB94468EA907EF42780668AB', '购买指南 组装指南 维修', '2', '购买指南 组装指南 维修分类', '18');
INSERT INTO `t_category` VALUES ('5', '数据库', null, '数据库', '5');
INSERT INTO `t_category` VALUES ('56AD72718C524147A2485E5F4A95A062', '3DS MAX', '3', '3DS MAX分类', '21');
INSERT INTO `t_category` VALUES ('57DE3C2DDA784B81844029A28217698C', 'Dreamweaver', '3', 'Dreamweaver分类', '24');
INSERT INTO `t_category` VALUES ('5F79D0D246AD4216AC04E9C5FAB3199E', 'Java语言', '1', 'Java 基础语言分类', '10');
INSERT INTO `t_category` VALUES ('6', '网络与数据通讯', null, '网络与数据通讯!', '6');
INSERT INTO `t_category` VALUES ('65640549B80E40B1981CDEC269BFFCAD', 'Photoshop', '3', 'Photoshop分类', '20');
INSERT INTO `t_category` VALUES ('65830AB237EF428BAE9B7ADC78A8D1F6', 'Unix', '4', 'Unix分类', '28');
INSERT INTO `t_category` VALUES ('757BDAB506A445EC8DEDA4CE04303B9F', '网页设计', '3', '网页设计分类', '22');
INSERT INTO `t_category` VALUES ('84ECE401C2904DBEA560D04A581A66D9', '前端', '1', 'HTML XML Jquery分类', '13');
INSERT INTO `t_category` VALUES ('922E6E2DB04143D39C9DDB26365B3EE8', 'C C++ ', '1', 'C C++ VC VC++分类', '12');
INSERT INTO `t_category` VALUES ('96F209F79DB242E9B99CC1B98FAB01DB', '数据库理论', '458795C27E7346A8A5F1B942319297E0', '数据库理论分类', '33');
INSERT INTO `t_category` VALUES ('A9CFBED0F77746C5BD751F2502FAB2CD', '电子商务 电子政务', '6', '电子商务 电子政务分类', '35');
INSERT INTO `t_category` VALUES ('B92ED191DBE647BE8F75721FB231E207', '因特网 电子邮件', '2', '因特网 电子邮件分类', '19');
INSERT INTO `t_category` VALUES ('C3F9FAAF4EA64857ACFAB0D9C8D0E446', 'PHP', '1', 'PHP分类', '14');
INSERT INTO `t_category` VALUES ('C4DD8CA232864B31A367EE135D86382C', '计算机初级入门', '2', '计算机初级入门分类', '17');
INSERT INTO `t_category` VALUES ('C8E274EE5C99499080A98E24F0BD2E03', 'java框架开发', '1', 'java框架开发分类', '15');
INSERT INTO `t_category` VALUES ('D45D96DA359A4FEAB3AB4DCF2157FC06', 'JSP', '1', 'JSP分类', '11');
INSERT INTO `t_category` VALUES ('DCAD0384A6444C048951C7B36C5D96EE', 'Flash', '3', 'Flash分类', '25');
INSERT INTO `t_category` VALUES ('F4FBD087EB054CA1896093F172AC33D9', '数据仓库与数据挖掘', '5', '数据仓库与数据挖掘分类', '30');
INSERT INTO `t_category` VALUES ('F5C091B3967442A2B35EFEFC4EF8746F', '微软Office', '2', '微软Office分类', '16');
INSERT INTO `t_category` VALUES ('FAB7B7F7084F4D57A0808ADC61117683', 'Windows', '4', 'Windows分类', '26');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_t_order_t_user` (`uid`),
  CONSTRAINT `FK_t_order_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('058F48DA33694C6D8F5C2C13F3D26CEA', '2013-12-26 21:47:04', '95.30', '1', '李女士 广东省 揭阳市 揭东县  xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('065056EFA3914273B6B266A2414A38FA', '2014-01-01 17:04:19', '74.50', '3', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0A1F4C5BDE754277B984D1E7E763051D', '2014-01-16 15:18:47', '41.30', '5', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0ADCEE0510844D2697E7A5C0903A8D3B', '2014-01-16 15:13:03', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0B657B624D8D4B919B7E5F175AA90530', '2014-01-16 15:06:20', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0CA1A9B0287C43B2AA9435F11F237E9B', '2014-02-06 15:21:27', '41.30', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('0CD9939DC9AE4DA2A12F772293F55A4B', '2014-01-16 15:12:04', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0FBC5F415EF94161AF2937A07EFD8DE8', '2014-01-01 14:18:14', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('0FD72F77655D43E2B7989892E965864D', '2013-12-30 20:05:53', '88.70', '1', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('148668BE43754CE2B64A0AC999C5A2D5', '2014-01-16 14:51:08', '148.70', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('159B58B3BBCB4069A550BF1A358B4905', '2014-02-07 01:17:28', '41.30', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('15A89AB272394F359EA26A2E15F13405', '2013-12-30 20:06:20', '74.50', '5', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('161A05BEBBAA468199131EAD175CCFEA', '2014-01-16 14:58:34', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('1AFEC52D72C74266A6E36F83F9910B4F', '2014-01-16 15:12:20', '74.50', '5', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('1D640078E4A64AC987FEA7299B57A2F6', '2014-01-01 13:57:41', '74.50', '4', '关羽 云南省 曲靖市 宣威市 11 11 11 11 xx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('2AFD7DC9619548BA8727464D77AFB9C2', '2014-01-16 14:59:33', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('2D9FF0BFB82842CFAA4B623D5997BF1F', '2014-01-01 14:17:47', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('303E12F4821A4B3F9DB97B23947220C7', '2013-12-26 22:00:41', '82.10', '2', '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('3143492834294128ADCFD1DAC3530396', '2014-01-01 14:16:54', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('32739173C1E247558358B1A8FE9FE012', '2014-01-16 15:04:11', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('33D163070CE74936966AE177F3E09B20', '2014-01-01 17:04:02', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('410CAC9D165244BA93174A31A302C640', '2018-09-18 10:52:31', '150.90', '1', '', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('4536B09E46D24FE3BD4A8CBAB42FC413', '2018-08-23 13:34:40', '347.70', '1', '请填写地址', '4DE7E4D829A54D4FAB150B7451407198');
INSERT INTO `t_order` VALUES ('49127E9642C5474FA8F2139204DE571C', '2014-01-01 14:17:58', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('4B49D55D2CD34DB480A2CDF1A78858E8', '2014-01-01 14:18:34', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('553AFF48D76A48AD89ED3FE8F7E2F587', '2013-12-26 21:54:43', '109.00', '4', '张小姐 上海市 上海市 浦东新区 xxx xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('5668668DAB1F4406819D37881BC5D5B1', '2014-01-02 10:23:14', '95.30', '4', '李四 西藏 昌都地区 八宿县 xx xx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('57197A448F9A4F15B76B1ED1EB3A15E6', '2014-01-16 14:56:58', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('574A31876CA246D4A10C0600EF5CF8A5', '2014-02-06 15:08:23', '74.50', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('57856B1A295B437CA0F7991540897B47', '2014-01-16 15:11:26', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('59A15DD3A0704508B1C2BC9B682A329F', '2014-02-07 16:55:40', '68.30', '3', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('5D39377E88E049F8BA19173BAFF295CB', '2014-01-01 14:18:39', '74.50', '4', '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('5FB1E131DD294CBBA34FE93228DF2F02', '2014-01-16 14:48:48', '279.10', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('605B9D163C1345B6A636D80720794CE8', '2014-01-01 14:17:02', '74.50', '4', '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('6504C742FE65413494E028E714D4D609', '2014-01-16 14:54:43', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('673170D78D9D4EE6AE083167CFB81C1A', '2014-02-06 15:34:44', '68.30', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('674878FE6CAB48918DB4A9688262FBD5', '2014-01-16 15:10:23', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('6C921E50C3E54EA0AFD8CC4B661963AD', '2014-02-07 00:40:36', '41.30', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('7237A47B1B5B4A78822D662AE01671B6', '2014-02-08 10:10:21', '115.80', '5', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('75B7D65D4F5A43CD83605FDE38D7E10C', '2014-01-01 14:17:33', '149.00', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('7858221EA1DF4B318A632A9C1CD3E1F7', '2014-01-16 15:02:13', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('7B3FA2910C9149829AB1EF3A39C4785F', '2013-12-31 23:37:41', '74.50', '1', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('8BB662E4C0444BC88F1DBE82584595BC', '2013-12-31 23:35:44', '33.80', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('8E3A3A303AC14D8EA9E998EC7D748478', '2018-09-17 14:24:35', '96.40', '1', 'ewtrt', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('93576BB2F43C47F89B4DD7B91F5DF5E3', '2014-01-01 14:18:21', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('96C6D91D916E472681EEC37B1770DE87', '2013-12-31 23:37:06', '67.60', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('9721A3FBC37D490588AEE02F761744E2', '2014-01-01 14:17:21', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('984468779C164A6098A7FE7EECE9E273', '2014-01-16 15:16:15', '41.30', '5', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('9A26EE71C83B41DDA3F80423548473B1', '2018-09-17 14:25:12', '109.60', '1', 'fdgfdgdfghdhgsdghg', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('9E1C0A9FDF1F49B18FA0BFA33E132BDD', '2014-01-16 15:05:33', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('A2DB4A7B4EA640ADA63F22A7E8311F4B', '2014-01-16 14:51:51', '148.70', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('B62C7C1BA61C47C4BCEC4BE96897A72C', '2014-01-16 15:16:07', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('B69C6849120D4B28A6CCF99351B88575', '2014-02-05 18:56:02', '366.00', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('BB7789E41C524030832B7E5E426633E7', '2014-02-05 18:55:39', '115.80', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('BD1BD9AB58B1413FA0BDC0AACCC8C65F', '2013-12-26 21:40:48', '81.40', '1', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('BDB995AF80D34716ABB9D10CB6962F87', '2013-12-27 11:58:17', '32.90', '4', '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('BE24BB4187B1472AA08E206BF8B0ABF7', '2013-12-30 20:08:10', '47.60', '3', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('C0841F4DFE7A43BFB183E4E82AE7914C', '2014-01-01 13:48:07', '74.50', '4', '刘备 西藏 那曲地区 巴青县 xxx xxx xxx xxx x', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('C34F025EF6BB4B88A8409B00A0ABC891', '2014-01-16 15:02:45', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('C4A1E40F2F514684BCD97F9EE76A701F', '2014-01-01 14:16:38', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('C6F8379F9E3E4F8381763B54E5BF986C', '2014-02-07 11:02:37', '41.30', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('CBB735CB5F084C1BB80FF5998F811E63', '2014-01-01 14:18:45', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('CE537015382640E1AE15B9A8FD08B9EE', '2013-12-26 21:53:34', '41.30', '5', '李女士 广东省 揭阳市 揭东县 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('D929BD17AB374B49B61B93AF9A194D1A', '2013-12-31 23:39:19', '82.10', '5', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('DD5135AEDA2E464BAF52DEC4727E2A3D', '2014-01-16 15:03:26', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('E106BFE7029C485D95A124C733BCC539', '2014-01-16 15:17:50', '41.30', '5', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('E3A1EB6D0543489F9729B2B5BC5DB365', '2014-01-02 10:30:30', '115.50', '1', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('E6EEEB39CECC4089BC65142BADCC4FC3', '2013-12-26 21:40:10', '73.60', '5', '张小姐 上海市 上海市 浦东新区 xxx xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('E891D2A05DA6485EB7E12436E8FB3107', '2014-02-06 10:52:56', '162.90', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('E8AE477323214E99AB48BA38052BE974', '2014-01-01 14:17:39', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('EA4DC50E547149E3A48B14E6711DF1BD', '2014-01-01 17:03:48', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('EC3696A4C443494A9B8DD6E8A9B82072', '2014-01-16 15:09:19', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('ECB47FBA81F64751B7AC89CCB8DDFD09', '2014-02-06 15:23:14', '41.30', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('EDC9F39D490E424BA799E7BD4BED9D09', '2014-01-01 17:04:09', '74.50', '4', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('EE1F00D88FDC44BD966AF05C1F7FABE0', '2013-12-26 21:48:17', '68.30', '1', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('F64FD5E198BB4114AB091034C5C6D8B7', '2014-01-16 15:09:56', '41.30', '1', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('F7E603F5179348B9BC3417B9BFB8558D', '2014-02-07 00:12:40', '41.30', '2', '黑龙江 哈尔滨市 呼兰区 黑龙江工商学院 2号寝室 301 张三', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `t_order` VALUES ('FAC08EE0DF2C4487A6FA2B11B343307E', '2013-12-26 21:30:19', '340.70', '5', '王先生 北京市 北京市 宣武区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_t_orderitem_t_order` (`oid`),
  CONSTRAINT `FK_t_orderitem_t_order` FOREIGN KEY (`oid`) REFERENCES `t_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('01D2DF3E5BB34E9F9D2477180C8D94D3', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'C0841F4DFE7A43BFB183E4E82AE7914C');
INSERT INTO `t_orderitem` VALUES ('01E58D4FB7964805A1557A5EF2677586', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '7B3FA2910C9149829AB1EF3A39C4785F');
INSERT INTO `t_orderitem` VALUES ('06AD3253E7EA415B828D1299462DE812', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '159B58B3BBCB4069A550BF1A358B4905');
INSERT INTO `t_orderitem` VALUES ('0844DB419E91407FAE223E3ED6B63707', '1', '82.10', '3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '82.10', 'book_img/23362142-1_b.jpg', 'D929BD17AB374B49B61B93AF9A194D1A');
INSERT INTO `t_orderitem` VALUES ('0AD49A1C760E4EA2B29ADC32E306C2D5', '1', '47.60', 'D0E69F85ACAB4C15BB40966E5AA545F1', 'Java并发编程实战（第16届Jolt大奖提名图书，Java并发编程必读佳作', '47.60', 'book_img/22606835-1_b.jpg', 'BD1BD9AB58B1413FA0BDC0AACCC8C65F');
INSERT INTO `t_orderitem` VALUES ('0F8620EDA20642D1B6CF6D2768086B0A', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'F7E603F5179348B9BC3417B9BFB8558D');
INSERT INTO `t_orderitem` VALUES ('0F8FCF81AE4D402892AD73C11477B971', '3', '204.90', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '68.30', 'book_img/22628333-1_b.jpg', '5FB1E131DD294CBBA34FE93228DF2F02');
INSERT INTO `t_orderitem` VALUES ('0FDE8F9F0C1D4B65AE470BC63783FBF5', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '984468779C164A6098A7FE7EECE9E273');
INSERT INTO `t_orderitem` VALUES ('10C2D433E7704AC6A0CB74EBDB1B0AEC', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'FAC08EE0DF2C4487A6FA2B11B343307E');
INSERT INTO `t_orderitem` VALUES ('14128D56EBDE44A2935F0D12EA5DBB03', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '574A31876CA246D4A10C0600EF5CF8A5');
INSERT INTO `t_orderitem` VALUES ('184399EAED9B421C899BB1789CB80D51', '1', '62.10', '5315DA60D24042889400AD4C93A37501', 'Spring 3.x企业应用开发实战(含CD光盘1张)', '62.10', 'book_img/22605701-1_b.jpg', '4536B09E46D24FE3BD4A8CBAB42FC413');
INSERT INTO `t_orderitem` VALUES ('1B48E8AA75BC4F569306702A33A7CCD5', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'E8AE477323214E99AB48BA38052BE974');
INSERT INTO `t_orderitem` VALUES ('1B6B185D53AB44798EE74AE33439BB1A', '2', '67.60', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', '96C6D91D916E472681EEC37B1770DE87');
INSERT INTO `t_orderitem` VALUES ('1BF158F7D2E24DC3AE8AD4748A125F7F', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'E106BFE7029C485D95A124C733BCC539');
INSERT INTO `t_orderitem` VALUES ('1D529CD78B34458D96D03F9FB9E8DDC5', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'EC3696A4C443494A9B8DD6E8A9B82072');
INSERT INTO `t_orderitem` VALUES ('1D5352893B8F421CAD3DCCA2623671CA', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '0ADCEE0510844D2697E7A5C0903A8D3B');
INSERT INTO `t_orderitem` VALUES ('2659227EFA5C4FF49B4C9E0E5FF3CDAD', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '1D640078E4A64AC987FEA7299B57A2F6');
INSERT INTO `t_orderitem` VALUES ('26D125337FB146FD923620A8E7C87556', '1', '32.90', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '32.90', 'book_img/22928649-1_b.jpg', 'E6EEEB39CECC4089BC65142BADCC4FC3');
INSERT INTO `t_orderitem` VALUES ('26FFD473E4654C27B59BDB404E3982C5', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '605B9D163C1345B6A636D80720794CE8');
INSERT INTO `t_orderitem` VALUES ('2754A72B64774B03A6FF5E08233D5445', '1', '95.30', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '95.30', 'book_img/22722790-1_b.jpg', 'E891D2A05DA6485EB7E12436E8FB3107');
INSERT INTO `t_orderitem` VALUES ('285F32EA770A4F9593537FEAC1B8705A', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'CBB735CB5F084C1BB80FF5998F811E63');
INSERT INTO `t_orderitem` VALUES ('2953F9C5BC6F4475AE3AD52B921B6875', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '0FD72F77655D43E2B7989892E965864D');
INSERT INTO `t_orderitem` VALUES ('29E8A4EEA3914F16BE2287DC95AC14CD', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '15A89AB272394F359EA26A2E15F13405');
INSERT INTO `t_orderitem` VALUES ('2E3E86265EC34D8F9907F52044AE2DD2', '1', '47.40', '95AACC68D64D4D67B1E33E9EAC22B885', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', '47.40', 'book_img/9265169-1_b.jpg', '0FD72F77655D43E2B7989892E965864D');
INSERT INTO `t_orderitem` VALUES ('2EC79387485D42F699DFAC6CF2CFF26A', '2', '82.60', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'E3A1EB6D0543489F9729B2B5BC5DB365');
INSERT INTO `t_orderitem` VALUES ('346BFB39E1524650A695DEAD8397F811', '2', '150.40', '1286B13F0EA54E4CB75434762121486A', 'Java核心技术 卷I：基础知识(第9版·英文版)(上、下册)', '75.20', 'book_img/23280479-1_b.jpg', 'FAC08EE0DF2C4487A6FA2B11B343307E');
INSERT INTO `t_orderitem` VALUES ('35B0B801D25845D8B76B61DD3CD5759A', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'B62C7C1BA61C47C4BCEC4BE96897A72C');
INSERT INTO `t_orderitem` VALUES ('37D26DB2F215411E8BFB761D61769021', '1', '47.60', 'AE0935F13A214436B8599DE285A86220', 'JavaScript基础教程(第8版)(经典JavaScript入门书 涵盖Ajax和jQuery)', '47.60', 'book_img/22717349-1_b.jpg', 'BE24BB4187B1472AA08E206BF8B0ABF7');
INSERT INTO `t_orderitem` VALUES ('38132C2B0A8E4A7499A4A00A2C68D342', '1', '32.90', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '32.90', 'book_img/22928649-1_b.jpg', '148668BE43754CE2B64A0AC999C5A2D5');
INSERT INTO `t_orderitem` VALUES ('3C585F544A494041AE75375D1CE8F086', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'A2DB4A7B4EA640ADA63F22A7E8311F4B');
INSERT INTO `t_orderitem` VALUES ('3DA0F5E8A5F34755A7254783B2A2C002', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '0FBC5F415EF94161AF2937A07EFD8DE8');
INSERT INTO `t_orderitem` VALUES ('44AF075EF3BD4DBEB55C23C1930CB3B7', '1', '32.90', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '32.90', 'book_img/22928649-1_b.jpg', '5FB1E131DD294CBBA34FE93228DF2F02');
INSERT INTO `t_orderitem` VALUES ('4A53FDF198474C16A0D4028CC9C1532B', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '674878FE6CAB48918DB4A9688262FBD5');
INSERT INTO `t_orderitem` VALUES ('4ABE8B2691F84258AE4B79EF14068920', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'C4A1E40F2F514684BCD97F9EE76A701F');
INSERT INTO `t_orderitem` VALUES ('4AD70581ED09443DBE176C341D7B51BA', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '93576BB2F43C47F89B4DD7B91F5DF5E3');
INSERT INTO `t_orderitem` VALUES ('4F8776C84CF241AF9C4FB5BF8282E870', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '5D39377E88E049F8BA19173BAFF295CB');
INSERT INTO `t_orderitem` VALUES ('50C4D3F0F28A4648BF89BD18C7931B60', '1', '95.30', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '95.30', 'book_img/22722790-1_b.jpg', '058F48DA33694C6D8F5C2C13F3D26CEA');
INSERT INTO `t_orderitem` VALUES ('59C13A2A03C448098F20E5DC07B6D1D9', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '6504C742FE65413494E028E714D4D609');
INSERT INTO `t_orderitem` VALUES ('5AD3850D25D143C6B54FBD84890A15EB', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '148668BE43754CE2B64A0AC999C5A2D5');
INSERT INTO `t_orderitem` VALUES ('5B17BD28CDAA4E4F98C5AAC48BCEB7BB', '1', '82.10', '3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '82.10', 'book_img/23362142-1_b.jpg', '303E12F4821A4B3F9DB97B23947220C7');
INSERT INTO `t_orderitem` VALUES ('5DADDF8045D7408DA4C9AAD9694AF5BF', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '2D9FF0BFB82842CFAA4B623D5997BF1F');
INSERT INTO `t_orderitem` VALUES ('5DF78D39DA9947048EED4F38DE027CEB', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '9721A3FBC37D490588AEE02F761744E2');
INSERT INTO `t_orderitem` VALUES ('5E8D8F83F4874467B3BED4F3FE35FE02', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '410CAC9D165244BA93174A31A302C640');
INSERT INTO `t_orderitem` VALUES ('5F6DAEB9C7E64DAB890320C0255B0242', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '0CA1A9B0287C43B2AA9435F11F237E9B');
INSERT INTO `t_orderitem` VALUES ('65CFB83DF1CC4052B0D6657D2B444188', '1', '95.30', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '95.30', 'book_img/22722790-1_b.jpg', 'B69C6849120D4B28A6CCF99351B88575');
INSERT INTO `t_orderitem` VALUES ('6F4239EBB3D84A29911AEF08B16C4B78', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '0A1F4C5BDE754277B984D1E7E763051D');
INSERT INTO `t_orderitem` VALUES ('72EA834FBF6F4FD3B43D4586B7E5B2E4', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'BB7789E41C524030832B7E5E426633E7');
INSERT INTO `t_orderitem` VALUES ('79A5CCB6ED5E4ABBA2ADCD9E93103302', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '32739173C1E247558358B1A8FE9FE012');
INSERT INTO `t_orderitem` VALUES ('83C053FBB2B0479F86F8194AD9BB5411', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '7237A47B1B5B4A78822D662AE01671B6');
INSERT INTO `t_orderitem` VALUES ('85DA1674B58C450291901E923B13B53C', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'DD5135AEDA2E464BAF52DEC4727E2A3D');
INSERT INTO `t_orderitem` VALUES ('87BE2F926AF5401595CECDF656752E96', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '0CD9939DC9AE4DA2A12F772293F55A4B');
INSERT INTO `t_orderitem` VALUES ('882D2D4A06B645AC9DE56B60622EC4E8', '1', '82.10', '3DD187217BF44A99B86DD18A4DC628BA', 'Java核心技术 卷1 基础知识（原书第9版）', '82.10', 'book_img/23362142-1_b.jpg', '553AFF48D76A48AD89ED3FE8F7E2F587');
INSERT INTO `t_orderitem` VALUES ('8BEA49FAE0924D05BD5903325BFB4E0A', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'CE537015382640E1AE15B9A8FD08B9EE');
INSERT INTO `t_orderitem` VALUES ('8C75EAC8C39845FE8D7540F208D31F86', '1', '32.90', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '32.90', 'book_img/22928649-1_b.jpg', 'A2DB4A7B4EA640ADA63F22A7E8311F4B');
INSERT INTO `t_orderitem` VALUES ('914175F8FB55422BB407DD0AC9DB3D63', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'F64FD5E198BB4114AB091034C5C6D8B7');
INSERT INTO `t_orderitem` VALUES ('93069308B4C04E16A9D1EE7B8EFEEBA6', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '57856B1A295B437CA0F7991540897B47');
INSERT INTO `t_orderitem` VALUES ('9360FD27161549F9B343E780090DE3AE', '1', '55.10', 'CF5546769F2842DABB2EF7A00D51F255', 'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）', '55.10', 'book_img/23263012-1_b.jpg', '410CAC9D165244BA93174A31A302C640');
INSERT INTO `t_orderitem` VALUES ('942BE069B7B345BAA5D4FE19E2D87C12', '2', '65.80', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '32.90', 'book_img/22928649-1_b.jpg', 'B69C6849120D4B28A6CCF99351B88575');
INSERT INTO `t_orderitem` VALUES ('9979731BC91D43B690E8ECD51DCC0F77', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '7237A47B1B5B4A78822D662AE01671B6');
INSERT INTO `t_orderitem` VALUES ('9C6DE8585579400B8F91311FE472FF30', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '4B49D55D2CD34DB480A2CDF1A78858E8');
INSERT INTO `t_orderitem` VALUES ('9CC5C541D4DF4C209EED96F8D62233EF', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '33D163070CE74936966AE177F3E09B20');
INSERT INTO `t_orderitem` VALUES ('9E1D7EF000E440608281DE20DADB2AD9', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '1AFEC52D72C74266A6E36F83F9910B4F');
INSERT INTO `t_orderitem` VALUES ('A00770D667394EAD9DC8599FA025046C', '1', '68.30', '8E16D59BA4C34374A68029AE877613C4', '轻量级Java EE企业应用实战（第3版）：Struts 2＋Spring 3＋Hibernate整合开发(含CD光盘1张)', '68.30', 'book_img/22685703-1_b.jpg', 'EE1F00D88FDC44BD966AF05C1F7FABE0');
INSERT INTO `t_orderitem` VALUES ('A12B5835A2AA416491E59A1F470B03DF', '1', '95.30', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '95.30', 'book_img/22722790-1_b.jpg', '5668668DAB1F4406819D37881BC5D5B1');
INSERT INTO `t_orderitem` VALUES ('A4938F10E31243FCBEDDBF762F887F12', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'C6F8379F9E3E4F8381763B54E5BF986C');
INSERT INTO `t_orderitem` VALUES ('A5CA013362854C7FBF1267670DDA659A', '3', '204.90', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '68.30', 'book_img/22628333-1_b.jpg', 'B69C6849120D4B28A6CCF99351B88575');
INSERT INTO `t_orderitem` VALUES ('A997875748344933AA3371BA5F280B95', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '148668BE43754CE2B64A0AC999C5A2D5');
INSERT INTO `t_orderitem` VALUES ('AA10E8BEFD744C2DBCDC7E85C11044C4', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'EA4DC50E547149E3A48B14E6711DF1BD');
INSERT INTO `t_orderitem` VALUES ('AA2BC081EBFE40D889671C95A8B63A66', '1', '40.70', '4A9574F03A6B40C1B2A437237C17DEEC', 'Spring实战(第3版)（In Action系列中最畅销的Spring图书，近十万读者学习Spring的共同选择）', '40.70', 'book_img/23254532-1_b.jpg', 'E6EEEB39CECC4089BC65142BADCC4FC3');
INSERT INTO `t_orderitem` VALUES ('B57029A4B38C48619E951EA3AAA62B5D', '1', '67.60', '0EE8A0AE69154287A378FB110FF2C780', 'Java核心技术：卷Ⅰ基础知识（原书第8版）', '67.60', 'book_img/20285763-1_b.jpg', 'E891D2A05DA6485EB7E12436E8FB3107');
INSERT INTO `t_orderitem` VALUES ('B5852D575CCD43238D7D49AECB073332', '2', '149.00', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '4536B09E46D24FE3BD4A8CBAB42FC413');
INSERT INTO `t_orderitem` VALUES ('B93CD7AC6B3C4044AE8186279C33803B', '1', '26.90', 'BD1CB005E4A04DCA881DA8689E21D4D0', 'jQuery UI开发指南', '26.90', 'book_img/22910975-1_b.jpg', '553AFF48D76A48AD89ED3FE8F7E2F587');
INSERT INTO `t_orderitem` VALUES ('C01A7D87FC924BAD8D3A4255BE415D14', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '7858221EA1DF4B318A632A9C1CD3E1F7');
INSERT INTO `t_orderitem` VALUES ('C08547828C9445648F049ABC6127768D', '1', '32.90', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '32.90', 'book_img/22928649-1_b.jpg', 'E3A1EB6D0543489F9729B2B5BC5DB365');
INSERT INTO `t_orderitem` VALUES ('C2DC9CDECD724065A6ABE92C693B4F75', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'ECB47FBA81F64751B7AC89CCB8DDFD09');
INSERT INTO `t_orderitem` VALUES ('C3575A8B7DED44B3937237DD6795FD46', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '6C921E50C3E54EA0AFD8CC4B661963AD');
INSERT INTO `t_orderitem` VALUES ('C3BDE3E9E6CD48F6B0DDDB4720106689', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '3143492834294128ADCFD1DAC3530396');
INSERT INTO `t_orderitem` VALUES ('C4B479673E0E454580A3B47747B954E7', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '5FB1E131DD294CBBA34FE93228DF2F02');
INSERT INTO `t_orderitem` VALUES ('C588A712ADFD4D8282A328E49CBD01FB', '1', '32.90', '97437DAD03FA456AA7D6154614A43B55', 'HTML、CSS、JavaScript网页制作从入门到精通（两万读者的选择，经久不衰的超级畅销书最新升级版！网页制作学习者入门必读经典！）', '32.90', 'book_img/22928649-1_b.jpg', 'BDB995AF80D34716ABB9D10CB6962F87');
INSERT INTO `t_orderitem` VALUES ('C9D639304CBF41A485568FCECD82197F', '1', '55.10', 'CF5546769F2842DABB2EF7A00D51F255', 'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）', '55.10', 'book_img/23263012-1_b.jpg', '9A26EE71C83B41DDA3F80423548473B1');
INSERT INTO `t_orderitem` VALUES ('CA8CEF8D4C5647748A96A3684663B70E', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '065056EFA3914273B6B266A2414A38FA');
INSERT INTO `t_orderitem` VALUES ('CD3FEE226CFA4704823448194F7D3E89', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '8E3A3A303AC14D8EA9E998EC7D748478');
INSERT INTO `t_orderitem` VALUES ('D544F15EEE69445B9BD10FF04253896E', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '9E1C0A9FDF1F49B18FA0BFA33E132BDD');
INSERT INTO `t_orderitem` VALUES ('D72778E0F375463399765EF9EF831308', '1', '95.30', '48BBFBFC07074ADE8CC906A45BE5D9A6', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！）（经典巨著，当当独家首发）', '95.30', 'book_img/22722790-1_b.jpg', '4536B09E46D24FE3BD4A8CBAB42FC413');
INSERT INTO `t_orderitem` VALUES ('D7D546DB926B4FA9805524752279F923', '1', '33.80', '9923901FBF124623BC707920D8936BC8', 'JavaScript DOM编程艺术(第2版)', '33.80', 'book_img/21049601-1_b.jpg', '8BB662E4C0444BC88F1DBE82584595BC');
INSERT INTO `t_orderitem` VALUES ('DF8001D723D442C1A525061611DB3950', '1', '54.50', '57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', '54.50', 'book_img/23368351-1_b.jpg', '9A26EE71C83B41DDA3F80423548473B1');
INSERT INTO `t_orderitem` VALUES ('DF8B900308B9406F81FDBF86FFF7ECA8', '1', '55.10', 'CF5546769F2842DABB2EF7A00D51F255', 'jQuery开发从入门到精通（配套视频327节，中小实例232个，实战案例7个商品详情手册11部，网页模版83类）（附1DVD）', '55.10', 'book_img/23263012-1_b.jpg', '8E3A3A303AC14D8EA9E998EC7D748478');
INSERT INTO `t_orderitem` VALUES ('E1FDF0B54C4741639C5A9E33A0923177', '1', '33.80', 'B7A7DA7A94E54054841EED1F70C3027C', '锋利的jQuery(第2版)(畅销书升级版，增加jQuery Mobile和性能优化)', '33.80', 'book_img/22786088-1_b.jpg', 'BD1BD9AB58B1413FA0BDC0AACCC8C65F');
INSERT INTO `t_orderitem` VALUES ('E35724F886094E5AB2076A690EC28917', '1', '68.30', '8E16D59BA4C34374A68029AE877613C4', '轻量级Java EE企业应用实战（第3版）：Struts 2＋Spring 3＋Hibernate整合开发(含CD光盘1张)', '68.30', 'book_img/22685703-1_b.jpg', '59A15DD3A0704508B1C2BC9B682A329F');
INSERT INTO `t_orderitem` VALUES ('E3EF277FBBEB4AB4B5FB0AB187C9E635', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'EDC9F39D490E424BA799E7BD4BED9D09');
INSERT INTO `t_orderitem` VALUES ('E8C9FDEC06874AADB3512BC95C95A555', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '4536B09E46D24FE3BD4A8CBAB42FC413');
INSERT INTO `t_orderitem` VALUES ('ED5722353C0A4F15A11B28A5A9B2745A', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '57197A448F9A4F15B76B1ED1EB3A15E6');
INSERT INTO `t_orderitem` VALUES ('EE61A6CCC02148F68DF99293F2EEE88F', '1', '68.30', '5C68141786B84A4CB8929A2415040739', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，国内JavasScript第一书，销量超过8万册)', '68.30', 'book_img/22628333-1_b.jpg', '673170D78D9D4EE6AE083167CFB81C1A');
INSERT INTO `t_orderitem` VALUES ('EFCAF77235D94975A095027562F643C5', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'BB7789E41C524030832B7E5E426633E7');
INSERT INTO `t_orderitem` VALUES ('F1C3FC9D6AAE406ABA251689B8ACC291', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', 'C34F025EF6BB4B88A8409B00A0ABC891');
INSERT INTO `t_orderitem` VALUES ('F49964DAE525431C94ED66D96E053301', '2', '149.00', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'FAC08EE0DF2C4487A6FA2B11B343307E');
INSERT INTO `t_orderitem` VALUES ('F7074572D71A454097B9019B7D5897FA', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '161A05BEBBAA468199131EAD175CCFEA');
INSERT INTO `t_orderitem` VALUES ('F84DB5D9AD0441FE81A52DCCCAC0EEA1', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '2AFD7DC9619548BA8727464D77AFB9C2');
INSERT INTO `t_orderitem` VALUES ('F9AD99717BDF4DD481FF35CC2A11B2D3', '1', '41.30', '5C4A6F0F4A3B4672AD8C5F89BF5D37D2', 'Java从入门到精通（第3版）（附光盘1张）（连续8月Java类全国零售排行前2名，32小时视频，732个经典实例、369项面试真题、616项测试史上最全资源库）', '41.30', 'book_img/22862060-1_b.jpg', '0B657B624D8D4B919B7E5F175AA90530');
INSERT INTO `t_orderitem` VALUES ('FBA39DB6CA63434B988D5329F029B2BB', '2', '149.00', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '75B7D65D4F5A43CD83605FDE38D7E10C');
INSERT INTO `t_orderitem` VALUES ('FBC88A01EE934A92BB83F8865CF44457', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', '49127E9642C5474FA8F2139204DE571C');
INSERT INTO `t_orderitem` VALUES ('FE29872D6E564F08B06E4EBD66DE6599', '1', '54.50', '57B6FF1B89C843C38BA39C717FA557D6', '了不起的Node.js: 将JavaScript进行到底（Web开发首选实时 跨多服务器 高并发）', '54.50', 'book_img/23368351-1_b.jpg', '410CAC9D165244BA93174A31A302C640');
INSERT INTO `t_orderitem` VALUES ('FFB980C9F3844E9085A134EC339F0979', '1', '74.50', 'CE01F15D435A4C51B0AD8202A318DCA7', 'Java编程思想（第4版）', '74.50', 'book_img/9317290-1_b.jpg', 'A2DB4A7B4EA640ADA63F22A7E8311F4B');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('32DB3700D2564254982BC58B0E4D95BC', 'yh5678', '123', 'yh@126.com', '1', '15682E9C4D2849E2AB5D8AFF55D2F7BA87126B0EF55A45C6A136E3CAA90D60F2');
INSERT INTO `t_user` VALUES ('4DE7E4D829A54D4FAB150B7451407198', 'yh1234', '456', 'yh@soh.com', '1', 'D00FAA82457748FF8C1B912042E615B39F3602053E154181B98CDD48D9ECFC96');
INSERT INTO `t_user` VALUES ('531D8A16D524478D86F8A115FE95D93F', 'yh789', '123', 'yh@163.com', '1', 'FCF142D04C4A420992FF4E7BAC92C1E58AF905F1A46B4818BB455BD925E52DDD');
INSERT INTO `t_user` VALUES ('55790D9C1A1845738E6D93866A148C7E', 'yh456', '123', 'yh@sina.com', '1', '659903B3D5FF4576B82425A593962DFE64B6137EBE934AE5AE19F614E71F4549');
INSERT INTO `t_user` VALUES ('9CC972DFA2D4481F89841A46FD1B3E7B', 'yh123', '1234', 'yh@qq.com', '1', 'D7CEB3DE44364749A4807D98F8B2F63017FDFED9FFC842B6BBC64E20698FED5F');
INSERT INTO `t_user` VALUES ('B50ADE921BF14F6EB5331777B1874763', 'aabb', 'aaa', 'abc@abc.cn', '0', '10032D0DFD2B49DC98CA9739F929656B6819FA1C10EC44F8A95206D0C3D62094');
INSERT INTO `t_user` VALUES ('BDFCF17A292B40AEBF51A56E28D53935', 'TTT', '123', 'hxciyuhong@126.com', '1', '6F3811CFF305424A8EA5F713612CD54D09F788A5F4344CAFA5C0028582FB45DA');
INSERT INTO `t_user` VALUES ('xxx', '张三四', null, 'zhangFei@163.com', '1', 'xxx');
