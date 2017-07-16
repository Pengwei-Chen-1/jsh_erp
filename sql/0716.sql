-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: jsh_erp
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jsh_account`
--

DROP TABLE IF EXISTS `jsh_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_account` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `SerialNo` varchar(50) DEFAULT NULL COMMENT '编号',
  `InitialAmount` double DEFAULT NULL COMMENT '期初金额',
  `CurrentAmount` double DEFAULT NULL COMMENT '当前余额',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_account`
--

LOCK TABLES `jsh_account` WRITE;
/*!40000 ALTER TABLE `jsh_account` DISABLE KEYS */;
INSERT INTO `jsh_account` VALUES (1,'公司总账','652346523465234623',0,0,'公司总账');
/*!40000 ALTER TABLE `jsh_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_accounthead`
--

DROP TABLE IF EXISTS `jsh_accounthead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_accounthead` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL COMMENT '类型(支出/收入/收款/付款/转账)',
  `OrganId` bigint(20) DEFAULT NULL COMMENT '单位Id(收款/付款单位)',
  `HandsPersonId` bigint(20) DEFAULT NULL COMMENT '经手人Id',
  `ChangeAmount` double DEFAULT NULL COMMENT '变动金额(优惠/收款/付款/实付)',
  `TotalPrice` double DEFAULT NULL COMMENT '合计金额',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户(收款/付款)',
  `BillNo` varchar(50) DEFAULT NULL COMMENT '单据编号',
  `BillTime` datetime DEFAULT NULL COMMENT '单据日期',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`),
  KEY `FK9F4C0D8DB610FC06` (`OrganId`),
  KEY `FK9F4C0D8DAAE50527` (`AccountId`),
  KEY `FK9F4C0D8DC4170B37` (`HandsPersonId`),
  CONSTRAINT `FK9F4C0D8DAAE50527` FOREIGN KEY (`AccountId`) REFERENCES `jsh_account` (`Id`),
  CONSTRAINT `FK9F4C0D8DB610FC06` FOREIGN KEY (`OrganId`) REFERENCES `jsh_supplier` (`id`),
  CONSTRAINT `FK9F4C0D8DC4170B37` FOREIGN KEY (`HandsPersonId`) REFERENCES `jsh_person` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_accounthead`
--

LOCK TABLES `jsh_accounthead` WRITE;
/*!40000 ALTER TABLE `jsh_accounthead` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsh_accounthead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_accountitem`
--

DROP TABLE IF EXISTS `jsh_accountitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_accountitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `HeaderId` bigint(20) NOT NULL COMMENT '表头Id',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户Id',
  `InOutItemId` bigint(20) DEFAULT NULL COMMENT '收支项目Id',
  `EachAmount` double DEFAULT NULL COMMENT '单项金额',
  `Remark` varchar(100) DEFAULT NULL COMMENT '单据备注',
  PRIMARY KEY (`Id`),
  KEY `FK9F4CBAC0AAE50527` (`AccountId`),
  KEY `FK9F4CBAC0C5FE6007` (`HeaderId`),
  KEY `FK9F4CBAC0D203EDC5` (`InOutItemId`),
  CONSTRAINT `FK9F4CBAC0AAE50527` FOREIGN KEY (`AccountId`) REFERENCES `jsh_account` (`Id`),
  CONSTRAINT `FK9F4CBAC0C5FE6007` FOREIGN KEY (`HeaderId`) REFERENCES `jsh_accounthead` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK9F4CBAC0D203EDC5` FOREIGN KEY (`InOutItemId`) REFERENCES `jsh_inoutitem` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_accountitem`
--

LOCK TABLES `jsh_accountitem` WRITE;
/*!40000 ALTER TABLE `jsh_accountitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsh_accountitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_app`
--

DROP TABLE IF EXISTS `jsh_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_app` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Number` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Icon` varchar(50) DEFAULT NULL,
  `URL` varchar(50) DEFAULT NULL,
  `Width` varchar(50) DEFAULT NULL,
  `Height` varchar(50) DEFAULT NULL,
  `ReSize` bit(1) DEFAULT NULL,
  `OpenMax` bit(1) DEFAULT NULL,
  `Flash` bit(1) DEFAULT NULL,
  `ZL` varchar(50) DEFAULT NULL,
  `Sort` varchar(50) DEFAULT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `Enabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_app`
--

LOCK TABLES `jsh_app` WRITE;
/*!40000 ALTER TABLE `jsh_app` DISABLE KEYS */;
INSERT INTO `jsh_app` VALUES (1,'','企业邮箱','app','0000000001.png','../EmailManage/Email','600','400','\0','\0','\0','desk','010','','\0'),(3,'00','系统管理','app','0000000004.png','','1024','600','','\0','\0','desk','198','',''),(6,'','个人信息','app','0000000005.png','../user/password.jsp','600','400','\0','\0','\0','dock','200','',''),(7,'01','基础数据','app','0000000006.png','','1024','600','','\0','\0','desk','120','',''),(8,'02','进销存','app','0000000007.png','','1024','600','','\0','\0','desk','030','',''),(20,'13','公告管理','app','0000000020.png',NULL,'1024','600','','\0','\0','desk','125',NULL,'\0'),(21,'','今日留言','app','0000000021.png','../phone/msg','1024','600','','\0','\0','dock','000','','\0'),(22,'03','报表查询','app','0000000022.png','','1024','600','','\0','\0','desk','115','','');
/*!40000 ALTER TABLE `jsh_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_asset`
--

DROP TABLE IF EXISTS `jsh_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_asset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetnameID` bigint(20) NOT NULL,
  `location` varchar(255) DEFAULT NULL COMMENT '位置',
  `labels` varchar(255) DEFAULT NULL COMMENT '标签：以空格为分隔符',
  `status` smallint(6) DEFAULT NULL COMMENT '资产的状态：0==在库，1==在用，2==消费',
  `userID` bigint(20) DEFAULT NULL,
  `price` double DEFAULT NULL COMMENT '购买价格',
  `purchasedate` datetime DEFAULT NULL COMMENT '购买日期',
  `periodofvalidity` datetime DEFAULT NULL COMMENT '有效日期',
  `warrantydate` datetime DEFAULT NULL COMMENT '保修日期',
  `assetnum` varchar(255) DEFAULT NULL COMMENT '资产编号',
  `serialnum` varchar(255) DEFAULT NULL COMMENT '资产序列号',
  `supplier` bigint(20) NOT NULL,
  `description` longtext COMMENT '描述信息',
  `addMonth` longtext COMMENT '资产添加时间，统计报表使用',
  `createtime` datetime DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `updator` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK353690ED9B6CB285` (`assetnameID`),
  KEY `FK353690EDAD45B659` (`creator`),
  KEY `FK353690ED27D23FE4` (`supplier`),
  KEY `FK353690ED61FE182C` (`updator`),
  KEY `FK353690ED3E226853` (`userID`),
  CONSTRAINT `FK353690ED27D23FE4` FOREIGN KEY (`supplier`) REFERENCES `jsh_supplier` (`id`),
  CONSTRAINT `FK353690ED3E226853` FOREIGN KEY (`userID`) REFERENCES `jsh_user` (`id`),
  CONSTRAINT `FK353690ED61FE182C` FOREIGN KEY (`updator`) REFERENCES `jsh_user` (`id`),
  CONSTRAINT `FK353690ED9B6CB285` FOREIGN KEY (`assetnameID`) REFERENCES `jsh_assetname` (`id`),
  CONSTRAINT `FK353690EDAD45B659` FOREIGN KEY (`creator`) REFERENCES `jsh_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_asset`
--

LOCK TABLES `jsh_asset` WRITE;
/*!40000 ALTER TABLE `jsh_asset` DISABLE KEYS */;
INSERT INTO `jsh_asset` VALUES (1,27,'weizhi','',0,NULL,11,'2016-10-22 00:00:00','2016-10-21 00:00:00','2016-11-03 00:00:00','1231241','123124123',2,'','2016-10','2016-10-22 20:04:48',63,'2016-10-22 20:04:48',63);
/*!40000 ALTER TABLE `jsh_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_assetcategory`
--

DROP TABLE IF EXISTS `jsh_assetcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_assetcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetname` varchar(255) NOT NULL COMMENT '资产类型名称',
  `isystem` tinyint(4) NOT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `description` varchar(500) DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_assetcategory`
--

LOCK TABLES `jsh_assetcategory` WRITE;
/*!40000 ALTER TABLE `jsh_assetcategory` DISABLE KEYS */;
INSERT INTO `jsh_assetcategory` VALUES (14,'递延资产',1,'递延资产'),(15,'无形资产',1,'无形资产'),(16,'长期投资',1,'长期投资'),(17,'固定资产',1,'固定资产'),(18,'流动资产',1,'流动资产');
/*!40000 ALTER TABLE `jsh_assetcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_assetname`
--

DROP TABLE IF EXISTS `jsh_assetname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_assetname` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assetname` varchar(255) NOT NULL COMMENT '资产名称',
  `assetcategoryID` bigint(20) NOT NULL,
  `isystem` smallint(6) NOT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `description` longtext COMMENT '描述信息',
  `isconsumables` smallint(6) DEFAULT NULL COMMENT '是否为耗材 0==否 1==是 耗材状态只能是消费',
  PRIMARY KEY (`id`),
  KEY `FKA4ADCCF866BC8AD3` (`assetcategoryID`),
  CONSTRAINT `FKA4ADCCF866BC8AD3` FOREIGN KEY (`assetcategoryID`) REFERENCES `jsh_assetcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_assetname`
--

LOCK TABLES `jsh_assetname` WRITE;
/*!40000 ALTER TABLE `jsh_assetname` DISABLE KEYS */;
INSERT INTO `jsh_assetname` VALUES (1,'联想Y450',17,1,'',1),(2,'惠普打印机',15,1,'',0),(12,'乐萌水杯',16,1,'',1),(13,'机顶盒',17,1,'机顶盒',0),(14,'TCL电视',17,1,'',1),(15,'手机',17,1,'',1),(16,'硬盘',16,1,'',0),(17,'毛笔',17,1,'',0),(18,'杯子',17,1,'',0),(19,'建造师证书',15,1,'',0),(20,'算量软件',14,1,'',1),(21,'cad软件',15,1,'',0),(22,'办公桌',17,1,'',0),(23,'笔记本',17,1,'笔记本',1),(24,'打印机',17,1,'打印机',0),(25,'电脑',17,1,'电脑',0),(26,'电动车',16,1,'电动车',0),(27,'电源线',17,1,'电源线',0);
/*!40000 ALTER TABLE `jsh_assetname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_depot`
--

DROP TABLE IF EXISTS `jsh_depot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_depot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) DEFAULT NULL COMMENT '仓库名称',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `remark` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_depot`
--

LOCK TABLES `jsh_depot` WRITE;
/*!40000 ALTER TABLE `jsh_depot` DISABLE KEYS */;
INSERT INTO `jsh_depot` VALUES (1,'郑州总部仓库','1','郑州总部仓库');
/*!40000 ALTER TABLE `jsh_depot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_depothead`
--

DROP TABLE IF EXISTS `jsh_depothead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_depothead` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL COMMENT '类型(出库/入库)',
  `SubType` varchar(50) DEFAULT NULL COMMENT '出入库分类',
  `ProjectId` bigint(20) NOT NULL COMMENT '项目Id',
  `Number` varchar(50) DEFAULT NULL COMMENT '票据号',
  `OperPersonName` varchar(50) DEFAULT NULL COMMENT '操作员名字',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `OperTime` datetime DEFAULT NULL COMMENT '出入库时间',
  `OrganId` bigint(20) DEFAULT NULL COMMENT '供应商Id',
  `HandsPersonId` bigint(20) DEFAULT NULL COMMENT '采购/领料-经手人Id',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户Id',
  `ChangeAmount` double DEFAULT NULL COMMENT '变动金额(收款/付款)',
  `AllocationProjectId` bigint(20) DEFAULT NULL COMMENT '调拨时，对方项目Id',
  `TotalPrice` double DEFAULT NULL COMMENT '合计金额',
  `PayType` varchar(50) DEFAULT NULL,
  `Remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`),
  KEY `FK2A80F214CA633ABA` (`AllocationProjectId`),
  KEY `FK2A80F214C4170B37` (`HandsPersonId`),
  KEY `FK2A80F214B610FC06` (`OrganId`),
  KEY `FK2A80F2142888F9A` (`ProjectId`),
  KEY `FK2A80F214AAE50527` (`AccountId`),
  CONSTRAINT `FK2A80F214AAE50527` FOREIGN KEY (`AccountId`) REFERENCES `jsh_account` (`Id`),
  CONSTRAINT `jsh_depothead_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `jsh_depot` (`id`),
  CONSTRAINT `jsh_depothead_ibfk_3` FOREIGN KEY (`OrganId`) REFERENCES `jsh_supplier` (`id`),
  CONSTRAINT `jsh_depothead_ibfk_4` FOREIGN KEY (`HandsPersonId`) REFERENCES `jsh_person` (`Id`),
  CONSTRAINT `jsh_depothead_ibfk_5` FOREIGN KEY (`AllocationProjectId`) REFERENCES `jsh_depot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_depothead`
--

LOCK TABLES `jsh_depothead` WRITE;
/*!40000 ALTER TABLE `jsh_depothead` DISABLE KEYS */;
INSERT INTO `jsh_depothead` VALUES (1,'入库','采购',1,'CGRK2017071510236','陈鹏巍','2017-07-15 02:04:25','2017-07-15 00:00:00',1,2,1,-1000,NULL,-1022,'现付',''),(2,'入库','采购',1,'CGRK2017071510357','陈鹏巍','2017-07-15 02:05:03','2017-07-15 00:00:00',1,2,1,-300,NULL,-300,'现付',''),(3,'出库','销售',1,'XSCK2017071510435','陈鹏巍','2017-07-15 02:06:26','2017-07-15 00:00:00',2,2,1,1100,NULL,1100,'现付','方圆46676008-1'),(4,'出库','销售',1,'XSCK201707151075','陈鹏巍','2017-07-15 02:08:28','2017-07-15 00:00:00',3,2,1,850,NULL,850,'现付','东健1111-1'),(5,'出库','销售',1,'XSCK2017071510810','陈鹏巍','2017-07-15 02:10:36','2017-07-15 00:00:00',4,2,1,6490,NULL,6550,'现付','方圆46676007-7');
/*!40000 ALTER TABLE `jsh_depothead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_depotitem`
--

DROP TABLE IF EXISTS `jsh_depotitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_depotitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `HeaderId` bigint(20) NOT NULL COMMENT '表头Id',
  `MaterialId` bigint(20) NOT NULL COMMENT '材料Id',
  `OperNumber` double DEFAULT NULL COMMENT '数量',
  `UnitPrice` double DEFAULT NULL COMMENT '单价',
  `AllPrice` double DEFAULT NULL COMMENT '金额',
  `Remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `Img` varchar(50) DEFAULT NULL COMMENT '图片',
  `Incidentals` double DEFAULT NULL COMMENT '运杂费',
  PRIMARY KEY (`Id`),
  KEY `FK2A819F475D61CCF7` (`MaterialId`),
  KEY `FK2A819F474BB6190E` (`HeaderId`),
  CONSTRAINT `jsh_depotitem_ibfk_1` FOREIGN KEY (`HeaderId`) REFERENCES `jsh_depothead` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `jsh_depotitem_ibfk_2` FOREIGN KEY (`MaterialId`) REFERENCES `jsh_material` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_depotitem`
--

LOCK TABLES `jsh_depotitem` WRITE;
/*!40000 ALTER TABLE `jsh_depotitem` DISABLE KEYS */;
INSERT INTO `jsh_depotitem` VALUES (1,1,9,1,22,22,'',NULL,NULL),(2,1,1,20,50,1000,'',NULL,NULL),(3,2,2,10,30,300,'',NULL,NULL),(4,3,3,10,65,650,'',NULL,NULL),(5,3,4,5,90,450,'',NULL,NULL),(6,4,1,10,40,400,'',NULL,NULL),(7,4,2,10,45,450,'',NULL,NULL),(8,5,5,25,120,3000,'',NULL,NULL),(9,5,6,25,22,550,'',NULL,NULL),(10,5,10,125,24,3000,'',NULL,NULL);
/*!40000 ALTER TABLE `jsh_depotitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_functions`
--

DROP TABLE IF EXISTS `jsh_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_functions` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Number` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `PNumber` varchar(50) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `State` bit(1) DEFAULT NULL,
  `Sort` varchar(50) DEFAULT NULL,
  `Enabled` bit(1) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_functions`
--

LOCK TABLES `jsh_functions` WRITE;
/*!40000 ALTER TABLE `jsh_functions` DISABLE KEYS */;
INSERT INTO `jsh_functions` VALUES (1,'00','系统管理','0','','','0010','','电脑版'),(2,'01','基础数据','0','','','0020','','电脑版'),(3,'02','进销存','0','','','0030','','电脑版'),(11,'0001','系统管理','00','','\0','0110','','电脑版'),(12,'000101','应用管理','0001','../manage/app.jsp','\0','0132','','电脑版'),(13,'000102','角色管理','0001','../manage/role.jsp','\0','0130','','电脑版'),(14,'000103','用户管理','0001','../manage/user.jsp','\0','0140','','电脑版'),(15,'000104','日志管理','0001','../manage/log.jsp','\0','0160','','电脑版'),(16,'000105','功能管理','0001','../manage/functions.jsp','\0','0135','','电脑版'),(21,'0101','商品管理','01','','\0','0220','','电脑版'),(22,'010101','商品类别管理','0101','../materials/materialcategory.jsp','\0','0230','','电脑版'),(23,'010102','商品信息管理','0101','../materials/material.jsp','\0','0240','','电脑版'),(24,'0102','基本资料','01','','\0','0250','','电脑版'),(25,'010201','单位信息','0102','../manage/vendor.jsp','\0','0260','','电脑版'),(26,'010202','仓库管理','0102','../manage/depot.jsp','\0','0270','','电脑版'),(31,'010206','经手人管理','0102','../materials/person.jsp','\0','0284','','电脑版'),(32,'0202','入库管理','02','','\0','0330','','电脑版'),(33,'020201','采购入库','0202','../materials/purchase_in_list.jsp','\0','0340','','电脑版'),(38,'0203','出库管理','02','','\0','0390','','电脑版'),(40,'020306','调拨出库','0203','../materials/allocation_out_list.jsp','\0','0420','','电脑版'),(41,'020303','销售出库','0203','../materials/sale_out_list.jsp','\0','0405','','电脑版'),(44,'0204','财务管理','02','','\0','0450','','电脑版'),(59,'030101','库存状况','0301','../reports/in_out_stock_report.jsp','\0','0600','','电脑版'),(194,'010204','收支项目','0102','../manage/inOutItem.jsp','\0','0282','','电脑版'),(195,'010205','结算账户','0102','../manage/account.jsp','\0','0283','','电脑版'),(196,'03','报表查询','0','','','0040','','电脑版'),(197,'020402','收入单','0204','../financial/item_in.jsp','\0','0465','','电脑版'),(198,'0301','报表查询','03','','\0','0570','','电脑版'),(199,'020304','采购退货','0203','../materials/purchase_back_list.jsp','\0','0415','','电脑版'),(200,'020203','销售退货','0202','../materials/sale_back_list.jsp','\0','0350','','电脑版'),(201,'020204','其它入库','0202','../materials/other_in_list.jsp','\0','0360','','电脑版'),(202,'020305','其它出库','0203','../materials/other_out_list.jsp','\0','0418','','电脑版'),(203,'020403','支出单','0204','../financial/item_out.jsp','\0','0470','','电脑版'),(204,'020404','收款单','0204','../financial/money_in.jsp','\0','0475','','电脑版'),(205,'020405','付款单','0204','../financial/money_out.jsp','\0','0480','','电脑版'),(206,'020406','转账单','0204','../financial/giro.jsp','\0','0490','','电脑版'),(207,'030102','结算账户','0301','../reports/account_report.jsp','\0','0610','','电脑版'),(208,'030103','进货统计','0301','../reports/buy_in_report.jsp','\0','0620','','电脑版'),(209,'030104','销售统计','0301','../reports/sale_out_report.jsp','\0','0630','','电脑版'),(210,'020302','零售出库','0203','../materials/retail_out_list.jsp','\0','0410','','电脑版'),(211,'020202','零售退货','0202','../materials/retail_back_list.jsp','\0','0345','','电脑版');
/*!40000 ALTER TABLE `jsh_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_inoutitem`
--

DROP TABLE IF EXISTS `jsh_inoutitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_inoutitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `Type` varchar(20) DEFAULT NULL COMMENT '类型',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_inoutitem`
--

LOCK TABLES `jsh_inoutitem` WRITE;
/*!40000 ALTER TABLE `jsh_inoutitem` DISABLE KEYS */;
INSERT INTO `jsh_inoutitem` VALUES (1,'办公耗材','支出','办公耗材'),(5,'房租收入','收入','房租收入'),(7,'利息收入','收入','利息收入'),(8,'水电费','支出','水电费水电费'),(9,'快递费','支出','快递费'),(10,'交通报销费','支出','交通报销费'),(11,'差旅费','支出','差旅费'),(12,'全车贴膜-普通','收入',''),(13,'全车贴膜-高档','收入',''),(14,'洗车','收入',''),(15,'保养汽车','收入','');
/*!40000 ALTER TABLE `jsh_inoutitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_log`
--

DROP TABLE IF EXISTS `jsh_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL COMMENT '操作用户ID',
  `operation` varchar(500) DEFAULT NULL COMMENT '操作模块名称',
  `clientIP` varchar(50) DEFAULT NULL COMMENT '客户端IP',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '操作状态 0==成功，1==失败',
  `contentdetails` varchar(1000) DEFAULT NULL COMMENT '操作详情',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `FKF2696AA13E226853` (`userID`),
  CONSTRAINT `FKF2696AA13E226853` FOREIGN KEY (`userID`) REFERENCES `jsh_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_log`
--

LOCK TABLES `jsh_log` WRITE;
/*!40000 ALTER TABLE `jsh_log` DISABLE KEYS */;
INSERT INTO `jsh_log` VALUES (1,63,'登录系统','172.17.0.3','2017-07-15 01:12:33',0,'管理用户：admin 登录系统','admin 登录系统'),(2,63,'增加仓库','172.17.0.3','2017-07-15 01:19:17',0,'增加仓库名称为  郑州总部仓库 成功！','增加仓库成功'),(3,63,'增加结算账户','172.17.0.3','2017-07-15 01:19:47',0,'增加结算账户名称为  公司总账 成功！','增加结算账户成功'),(4,63,'更新结算账户','172.17.0.3','2017-07-15 01:20:22',0,'更新结算账户ID为  1 成功！','更新结算账户成功'),(5,63,'增加经手人','172.17.0.3','2017-07-15 01:21:11',0,'增加经手人名称为  财务总管 成功！','增加经手人成功'),(6,63,'增加供应商','172.17.0.3','2017-07-15 01:22:48',0,'增加供应商名称为  康师傅 成功！','增加供应商成功'),(7,63,'增加供应商','172.17.0.3','2017-07-15 01:23:40',0,'增加供应商名称为  兰考新 成功！','增加供应商成功'),(8,63,'增加供应商','172.17.0.3','2017-07-15 01:24:31',0,'增加供应商名称为  延津好来福 成功！','增加供应商成功'),(9,63,'增加供应商','172.17.0.3','2017-07-15 01:26:59',0,'增加供应商名称为  安阳净膳堂 成功！','增加供应商成功'),(10,63,'增加商品类别','172.17.0.3','2017-07-15 01:28:08',0,'增加商品类别名称为  色素 成功！','增加商品类别成功'),(11,63,'增加商品类别','172.17.0.3','2017-07-15 01:28:37',0,'增加商品类别名称为  色素 成功！','增加商品类别成功'),(12,63,'增加商品类别','172.17.0.3','2017-07-15 01:29:13',0,'增加商品类别名称为  汁剂 成功！','增加商品类别成功'),(13,63,'增加商品','172.17.0.3','2017-07-15 01:30:30',0,'增加商品名称为  柠檬黄 成功！','增加商品成功'),(14,63,'增加商品','172.17.0.3','2017-07-15 01:31:47',0,'增加商品名称为  日落黄 成功！','增加商品成功'),(15,63,'更新商品','172.17.0.3','2017-07-15 01:32:15',0,'更新商品ID为  1 成功！','更新商品成功'),(16,63,'增加商品','172.17.0.3','2017-07-15 01:33:15',0,'增加商品名称为  青苹果色素 成功！','增加商品成功'),(17,63,'增加商品','172.17.0.3','2017-07-15 01:34:20',0,'增加商品名称为  橙色素 成功！','增加商品成功'),(18,63,'增加商品','172.17.0.3','2017-07-15 01:37:02',0,'增加商品名称为  酸梅汤主剂 成功！','增加商品成功'),(19,63,'增加商品','172.17.0.3','2017-07-15 01:38:39',0,'增加商品名称为  山楂浓缩汁 成功！','增加商品成功'),(20,63,'增加商品','172.17.0.3','2017-07-15 01:39:18',0,'增加商品名称为  乌梅汁 成功！','增加商品成功'),(21,63,'更新商品','172.17.0.3','2017-07-15 01:39:40',0,'更新商品ID为  3 成功！','更新商品成功'),(22,63,'更新商品','172.17.0.3','2017-07-15 01:40:50',0,'更新商品ID为  5 成功！','更新商品成功'),(23,63,'更新商品','172.17.0.3','2017-07-15 01:41:06',0,'更新商品ID为  2 成功！','更新商品成功'),(24,63,'更新商品','172.17.0.3','2017-07-15 01:43:49',0,'更新商品ID为  1 成功！','更新商品成功'),(25,63,'增加商品','172.17.0.3','2017-07-15 01:47:02',0,'增加商品名称为  矿泉水 成功！','增加商品成功'),(26,63,'增加经手人','172.17.0.3','2017-07-15 01:47:42',0,'增加经手人名称为  仓库总管 成功！','增加经手人成功'),(27,63,'更新商品','172.17.0.3','2017-07-15 01:51:31',0,'更新商品ID为  8 成功！','更新商品成功'),(28,63,'删除商品','172.17.0.3','2017-07-15 01:55:48',0,'删除商品ID为  8 成功！','删除商品成功'),(29,63,'增加商品','172.17.0.3','2017-07-15 01:57:01',0,'增加商品名称为  纯净水 成功！','增加商品成功'),(30,63,'删除商品','172.17.0.3','2017-07-15 01:57:51',0,'删除商品ID为  7 成功！','删除商品成功'),(31,63,'退出系统','172.17.0.3','2017-07-15 01:58:31',0,'管理用户：admin 退出系统','admin 退出系统'),(32,63,'登录系统','172.17.0.3','2017-07-15 01:58:36',0,'管理用户：admin 登录系统','admin 登录系统'),(33,63,'登录系统','172.17.0.3','2017-07-15 02:00:15',0,'管理用户：admin 登录系统','admin 登录系统'),(34,63,'增加商品','172.17.0.3','2017-07-15 02:02:40',0,'增加商品名称为  乌梅汁 成功！','增加商品成功'),(35,63,'登录系统','172.17.0.3','2017-07-15 02:03:06',0,'管理用户：admin 登录系统','admin 登录系统'),(36,63,'增加仓管通','172.17.0.3','2017-07-15 02:04:25',0,'增加仓管通编号为  CGRK2017071510236 成功！','增加仓管通成功'),(37,63,'保存仓管通明细','172.17.0.3','2017-07-15 02:04:25',0,'保存仓管通明细对应主表编号为  1 成功！','保存仓管通明细成功'),(38,63,'增加仓管通','172.17.0.3','2017-07-15 02:05:03',0,'增加仓管通编号为  CGRK2017071510357 成功！','增加仓管通成功'),(39,63,'保存仓管通明细','172.17.0.3','2017-07-15 02:05:03',0,'保存仓管通明细对应主表编号为  2 成功！','保存仓管通明细成功'),(40,63,'增加仓管通','172.17.0.3','2017-07-15 02:06:26',0,'增加仓管通编号为  XSCK2017071510435 成功！','增加仓管通成功'),(41,63,'保存仓管通明细','172.17.0.3','2017-07-15 02:06:27',0,'保存仓管通明细对应主表编号为  3 成功！','保存仓管通明细成功'),(42,63,'增加仓管通','172.17.0.3','2017-07-15 02:08:28',0,'增加仓管通编号为  XSCK201707151075 成功！','增加仓管通成功'),(43,63,'保存仓管通明细','172.17.0.3','2017-07-15 02:08:28',0,'保存仓管通明细对应主表编号为  4 成功！','保存仓管通明细成功'),(44,63,'更新仓管通','172.17.0.3','2017-07-15 02:08:44',0,'更新仓管通ID为  4 成功！','更新仓管通成功'),(45,63,'增加仓管通','172.17.0.3','2017-07-15 02:10:36',0,'增加仓管通编号为  XSCK2017071510810 成功！','增加仓管通成功'),(46,63,'保存仓管通明细','172.17.0.3','2017-07-15 02:10:36',0,'保存仓管通明细对应主表编号为  5 成功！','保存仓管通明细成功'),(47,63,'登录系统','172.17.0.3','2017-07-15 09:15:36',0,'管理用户：admin 登录系统','admin 登录系统'),(48,63,'登录系统','172.17.0.3','2017-07-15 09:40:09',0,'管理用户：admin 登录系统','admin 登录系统'),(49,63,'登录系统','192.168.99.1','2017-07-15 18:45:41',0,'管理用户：admin 登录系统','admin 登录系统'),(50,63,'登录系统','192.168.99.1','2017-07-15 19:29:40',0,'管理用户：admin 登录系统','admin 登录系统'),(51,63,'登录系统','192.168.99.1','2017-07-15 19:57:39',0,'管理用户：admin 登录系统','admin 登录系统'),(52,63,'登录系统','192.168.99.1','2017-07-15 20:42:43',0,'管理用户：admin 登录系统','admin 登录系统'),(53,63,'登录系统','192.168.99.1','2017-07-15 22:28:27',0,'管理用户：admin 登录系统','admin 登录系统'),(54,63,'登录系统','192.168.99.1','2017-07-15 23:30:51',0,'管理用户：admin 登录系统','admin 登录系统'),(55,63,'登录系统','192.168.99.1','2017-07-16 07:56:44',0,'管理用户：admin 登录系统','admin 登录系统'),(56,63,'登录系统','192.168.99.1','2017-07-16 08:23:03',0,'管理用户：admin 登录系统','admin 登录系统'),(57,63,'登录系统','192.168.99.1','2017-07-16 08:32:31',0,'管理用户：admin 登录系统','admin 登录系统'),(58,63,'登录系统','192.168.99.1','2017-07-16 08:37:45',0,'管理用户：admin 登录系统','admin 登录系统'),(59,63,'登录系统','192.168.99.1','2017-07-16 08:42:23',0,'管理用户：admin 登录系统','admin 登录系统'),(60,63,'登录系统','192.168.99.1','2017-07-16 08:48:44',0,'管理用户：admin 登录系统','admin 登录系统'),(61,63,'登录系统','192.168.99.1','2017-07-16 09:11:53',0,'管理用户：admin 登录系统','admin 登录系统'),(62,63,'登录系统','192.168.99.1','2017-07-16 09:41:23',0,'管理用户：admin 登录系统','admin 登录系统'),(63,63,'登录系统','192.168.99.1','2017-07-16 09:56:55',0,'管理用户：admin 登录系统','admin 登录系统'),(64,63,'登录系统','192.168.99.1','2017-07-16 09:59:43',0,'管理用户：admin 登录系统','admin 登录系统'),(65,63,'登录系统','192.168.99.1','2017-07-16 10:12:01',0,'管理用户：admin 登录系统','admin 登录系统'),(66,63,'登录系统','192.168.99.1','2017-07-16 10:26:25',0,'管理用户：admin 登录系统','admin 登录系统'),(67,63,'登录系统','192.168.99.1','2017-07-16 10:54:42',0,'管理用户：admin 登录系统','admin 登录系统');
/*!40000 ALTER TABLE `jsh_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_material`
--

DROP TABLE IF EXISTS `jsh_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_material` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryId` bigint(20) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `Model` varchar(50) DEFAULT NULL COMMENT '型号',
  `Standard` varchar(50) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `Unit` varchar(50) DEFAULT NULL COMMENT '单位',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `RetailPrice` double DEFAULT NULL COMMENT '零售价',
  `LowPrice` double DEFAULT NULL COMMENT '最低售价',
  `PresetPriceOne` double DEFAULT NULL COMMENT '预设售价一',
  `PresetPriceTwo` double DEFAULT NULL COMMENT '预设售价二',
  PRIMARY KEY (`Id`),
  KEY `FK675951272AB6672C` (`CategoryId`),
  CONSTRAINT `FK675951272AB6672C` FOREIGN KEY (`CategoryId`) REFERENCES `jsh_materialcategory` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_material`
--

LOCK TABLES `jsh_material` WRITE;
/*!40000 ALTER TABLE `jsh_material` DISABLE KEYS */;
INSERT INTO `jsh_material` VALUES (1,2,'柠檬黄','nmh','100g','黄','kg','',40,30,41,41),(2,2,'日落黄','rlh','75g','黄','kg','',45,35,46,47),(3,2,'青苹果色素','7705','1kg','青','kg','',65,55,66,67),(4,2,'橙色素','30094','1kg','橙色','kg','',90,80,91,92),(5,3,'酸梅汤主剂','smt','1kg','黑','kg','',120,110,121,122),(6,2,'山楂浓缩汁','sznsz','1kg','','kg','',22,16,23,24),(9,3,'纯净水','ksf','1kg','','kg','',50,40,51,52),(10,3,'乌梅汁','wmz','1kg','','kg','',24,20,25,26);
/*!40000 ALTER TABLE `jsh_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_materialcategory`
--

DROP TABLE IF EXISTS `jsh_materialcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_materialcategory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `CategoryLevel` smallint(6) DEFAULT NULL COMMENT '等级',
  `ParentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK3EE7F725237A77D8` (`ParentId`),
  CONSTRAINT `FK3EE7F725237A77D8` FOREIGN KEY (`ParentId`) REFERENCES `jsh_materialcategory` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_materialcategory`
--

LOCK TABLES `jsh_materialcategory` WRITE;
/*!40000 ALTER TABLE `jsh_materialcategory` DISABLE KEYS */;
INSERT INTO `jsh_materialcategory` VALUES (1,'色素',1,1),(2,'色素',1,1),(3,'汁剂',1,1);
/*!40000 ALTER TABLE `jsh_materialcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_person`
--

DROP TABLE IF EXISTS `jsh_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_person` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) DEFAULT NULL COMMENT '类型',
  `Name` varchar(50) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_person`
--

LOCK TABLES `jsh_person` WRITE;
/*!40000 ALTER TABLE `jsh_person` DISABLE KEYS */;
INSERT INTO `jsh_person` VALUES (1,'财务员','财务总管'),(2,'仓管员','仓库总管');
/*!40000 ALTER TABLE `jsh_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_role`
--

DROP TABLE IF EXISTS `jsh_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_role` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_role`
--

LOCK TABLES `jsh_role` WRITE;
/*!40000 ALTER TABLE `jsh_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsh_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_supplier`
--

DROP TABLE IF EXISTS `jsh_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(255) NOT NULL COMMENT '供应商名称',
  `contacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `phonenum` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `description` varchar(500) DEFAULT NULL,
  `isystem` tinyint(4) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `AdvanceIn` double DEFAULT '0',
  `BeginNeedGet` double DEFAULT NULL COMMENT '期初应收',
  `BeginNeedPay` double DEFAULT NULL COMMENT '期初应付',
  `AllNeedGet` double DEFAULT NULL COMMENT '累计应收',
  `AllNeedPay` double DEFAULT NULL COMMENT '累计应付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_supplier`
--

LOCK TABLES `jsh_supplier` WRITE;
/*!40000 ALTER TABLE `jsh_supplier` DISABLE KEYS */;
INSERT INTO `jsh_supplier` VALUES (1,'康师傅','康小帅','12312312312','12312312312@qq.com','',1,'供应商','\0',0,0,NULL,NULL,NULL),(2,'兰考新','兰考小新','12345678901','12345678901@qq.com','',1,'客户','\0',0,0,NULL,NULL,NULL),(3,'延津好来福','福尔康','98765432101','98765432101@qq.com','',1,'客户','\0',0,0,NULL,NULL,NULL),(4,'安阳净膳堂','堂堂','11122233344','11122233344@qq.com','',1,'客户','\0',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jsh_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_user`
--

DROP TABLE IF EXISTS `jsh_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户姓名--例如张三',
  `loginame` varchar(255) DEFAULT NULL COMMENT '登录用户名--可能为空',
  `password` varchar(50) DEFAULT NULL COMMENT '登陆密码',
  `position` varchar(200) DEFAULT NULL COMMENT '职位',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `phonenum` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `ismanager` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为管理者 0==管理者 1==员工',
  `isystem` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否系统自带数据 ',
  `status` tinyint(4) DEFAULT NULL COMMENT '用户状态',
  `description` varchar(500) DEFAULT NULL COMMENT '用户描述信息',
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_user`
--

LOCK TABLES `jsh_user` WRITE;
/*!40000 ALTER TABLE `jsh_user` DISABLE KEYS */;
INSERT INTO `jsh_user` VALUES (63,'陈鹏巍','admin','e10adc3949ba59abbe56e057f20f883e','','','','',0,1,-1,'',NULL);
/*!40000 ALTER TABLE `jsh_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_userbusiness`
--

DROP TABLE IF EXISTS `jsh_userbusiness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_userbusiness` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL,
  `KeyId` varchar(50) DEFAULT NULL,
  `Value` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_userbusiness`
--

LOCK TABLES `jsh_userbusiness` WRITE;
/*!40000 ALTER TABLE `jsh_userbusiness` DISABLE KEYS */;
INSERT INTO `jsh_userbusiness` VALUES (1,'RoleAPP','4','[21][1][8][11][10][19][16][15][12][7][17][20][18][3][6][22][23][24][25]'),(2,'RoleAPP','5','[8][7][6]'),(3,'RoleAPP','6','[21][1][8]'),(4,'RoleAPP','7','[21][1][8][11]'),(5,'RoleFunctions','4','[13][12][16][14][15][22][23][25][26][194][195][31][33][211][200][201][210][41][199][202][40][197][203][204][205][206][212][59][207][208][209]'),(6,'RoleFunctions','5','[22][23][25][26][194][195][31][33][200][201][41][199][202]'),(7,'RoleFunctions','6','[168][13][12][16][14][15][189][18][19]'),(8,'RoleAPP','8','[21][1][8][11][10]'),(9,'RoleFunctions','7','[168][13][12][16][14][15][189][18][19][132]'),(10,'RoleFunctions','8','[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187]'),(11,'RoleFunctions','9','[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187][188]'),(12,'UserRole','1','[5]'),(13,'UserRole','2','[6][7]'),(14,'UserDepot','2','[1][2][6][7]'),(15,'UserDepot','1','[1][2][5][6][7][10][12][14][15][17]'),(16,'UserRole','63','[4]'),(17,'RoleFunctions','13','[46][47][48][49]'),(18,'UserDepot','63','[1][3]'),(19,'UserDepot','5','[6][45][46][50]'),(20,'UserRole','5','[5]'),(21,'UserRole','64','[5]'),(22,'UserDepot','64','[1]'),(23,'UserRole','65','[5]'),(24,'UserDepot','65','[1]');
/*!40000 ALTER TABLE `jsh_userbusiness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jsh_visitaccount`
--

DROP TABLE IF EXISTS `jsh_visitaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jsh_visitaccount` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProjectId` bigint(20) NOT NULL,
  `LouHao` varchar(50) DEFAULT NULL,
  `HuHao` varchar(50) DEFAULT NULL,
  `HuiFang` varchar(50) DEFAULT NULL,
  `LuoShi` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Tel` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKFF4AAE822888F9A` (`ProjectId`),
  CONSTRAINT `FKFF4AAE822888F9A` FOREIGN KEY (`ProjectId`) REFERENCES `jsh_depot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jsh_visitaccount`
--

LOCK TABLES `jsh_visitaccount` WRITE;
/*!40000 ALTER TABLE `jsh_visitaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsh_visitaccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-16 11:25:29
