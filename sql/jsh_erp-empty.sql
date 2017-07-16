/*
MySQL Backup
Source Server Version: 5.0.22
Source Database: jsh_erp
Date: 2017-07-06 12:02:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `jsh_account`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_account`;
CREATE TABLE `jsh_account` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Name` varchar(50) default NULL COMMENT '名称',
  `SerialNo` varchar(50) default NULL COMMENT '编号',
  `InitialAmount` double default NULL COMMENT '期初金额',
  `CurrentAmount` double default NULL COMMENT '当前余额',
  `Remark` varchar(100) default NULL COMMENT '备注',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_accounthead`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_accounthead`;
CREATE TABLE `jsh_accounthead` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Type` varchar(50) default NULL COMMENT '类型(支出/收入/收款/付款/转账)',
  `OrganId` bigint(20) default NULL COMMENT '单位Id(收款/付款单位)',
  `HandsPersonId` bigint(20) default NULL COMMENT '经手人Id',
  `ChangeAmount` double default NULL COMMENT '变动金额(优惠/收款/付款/实付)',
  `TotalPrice` double default NULL COMMENT '合计金额',
  `AccountId` bigint(20) default NULL COMMENT '账户(收款/付款)',
  `BillNo` varchar(50) default NULL COMMENT '单据编号',
  `BillTime` datetime default NULL COMMENT '单据日期',
  `Remark` varchar(100) default NULL COMMENT '备注',
  PRIMARY KEY  (`Id`),
  KEY `FK9F4C0D8DB610FC06` (`OrganId`),
  KEY `FK9F4C0D8DAAE50527` (`AccountId`),
  KEY `FK9F4C0D8DC4170B37` (`HandsPersonId`),
  CONSTRAINT `FK9F4C0D8DAAE50527` FOREIGN KEY (`AccountId`) REFERENCES `jsh_account` (`Id`),
  CONSTRAINT `FK9F4C0D8DB610FC06` FOREIGN KEY (`OrganId`) REFERENCES `jsh_supplier` (`id`),
  CONSTRAINT `FK9F4C0D8DC4170B37` FOREIGN KEY (`HandsPersonId`) REFERENCES `jsh_person` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_accountitem`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_accountitem`;
CREATE TABLE `jsh_accountitem` (
  `Id` bigint(20) NOT NULL auto_increment,
  `HeaderId` bigint(20) NOT NULL COMMENT '表头Id',
  `AccountId` bigint(20) default NULL COMMENT '账户Id',
  `InOutItemId` bigint(20) default NULL COMMENT '收支项目Id',
  `EachAmount` double default NULL COMMENT '单项金额',
  `Remark` varchar(100) default NULL COMMENT '单据备注',
  PRIMARY KEY  (`Id`),
  KEY `FK9F4CBAC0AAE50527` (`AccountId`),
  KEY `FK9F4CBAC0C5FE6007` (`HeaderId`),
  KEY `FK9F4CBAC0D203EDC5` (`InOutItemId`),
  CONSTRAINT `FK9F4CBAC0AAE50527` FOREIGN KEY (`AccountId`) REFERENCES `jsh_account` (`Id`),
  CONSTRAINT `FK9F4CBAC0C5FE6007` FOREIGN KEY (`HeaderId`) REFERENCES `jsh_accounthead` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK9F4CBAC0D203EDC5` FOREIGN KEY (`InOutItemId`) REFERENCES `jsh_inoutitem` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_app`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_app`;
CREATE TABLE `jsh_app` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Number` varchar(50) default NULL,
  `Name` varchar(50) default NULL,
  `Type` varchar(50) default NULL,
  `Icon` varchar(50) default NULL,
  `URL` varchar(50) default NULL,
  `Width` varchar(50) default NULL,
  `Height` varchar(50) default NULL,
  `ReSize` bit(1) default NULL,
  `OpenMax` bit(1) default NULL,
  `Flash` bit(1) default NULL,
  `ZL` varchar(50) default NULL,
  `Sort` varchar(50) default NULL,
  `Remark` varchar(200) default NULL,
  `Enabled` bit(1) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_asset`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_asset`;
CREATE TABLE `jsh_asset` (
  `id` bigint(20) NOT NULL auto_increment,
  `assetnameID` bigint(20) NOT NULL,
  `location` varchar(255) default NULL COMMENT '位置',
  `labels` varchar(255) default NULL COMMENT '标签：以空格为分隔符',
  `status` smallint(6) default NULL COMMENT '资产的状态：0==在库，1==在用，2==消费',
  `userID` bigint(20) default NULL,
  `price` double default NULL COMMENT '购买价格',
  `purchasedate` datetime default NULL COMMENT '购买日期',
  `periodofvalidity` datetime default NULL COMMENT '有效日期',
  `warrantydate` datetime default NULL COMMENT '保修日期',
  `assetnum` varchar(255) default NULL COMMENT '资产编号',
  `serialnum` varchar(255) default NULL COMMENT '资产序列号',
  `supplier` bigint(20) NOT NULL,
  `description` longtext COMMENT '描述信息',
  `addMonth` longtext COMMENT '资产添加时间，统计报表使用',
  `createtime` datetime default NULL,
  `creator` bigint(20) default NULL,
  `updatetime` datetime default NULL,
  `updator` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_assetcategory`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_assetcategory`;
CREATE TABLE `jsh_assetcategory` (
  `id` bigint(20) NOT NULL auto_increment,
  `assetname` varchar(255) NOT NULL COMMENT '资产类型名称',
  `isystem` tinyint(4) NOT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `description` varchar(500) default NULL COMMENT '描述信息',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_assetname`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_assetname`;
CREATE TABLE `jsh_assetname` (
  `id` bigint(20) NOT NULL auto_increment,
  `assetname` varchar(255) NOT NULL COMMENT '资产名称',
  `assetcategoryID` bigint(20) NOT NULL,
  `isystem` smallint(6) NOT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `description` longtext COMMENT '描述信息',
  `isconsumables` smallint(6) default NULL COMMENT '是否为耗材 0==否 1==是 耗材状态只能是消费',
  PRIMARY KEY  (`id`),
  KEY `FKA4ADCCF866BC8AD3` (`assetcategoryID`),
  CONSTRAINT `FKA4ADCCF866BC8AD3` FOREIGN KEY (`assetcategoryID`) REFERENCES `jsh_assetcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_depot`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depot`;
CREATE TABLE `jsh_depot` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(20) default NULL COMMENT '仓库名称',
  `sort` varchar(10) default NULL COMMENT '排序',
  `remark` varchar(100) default NULL COMMENT '描述',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_depothead`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depothead`;
CREATE TABLE `jsh_depothead` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Type` varchar(50) default NULL COMMENT '类型(出库/入库)',
  `SubType` varchar(50) default NULL COMMENT '出入库分类',
  `ProjectId` bigint(20) NOT NULL COMMENT '项目Id',
  `Number` varchar(50) default NULL COMMENT '票据号',
  `OperPersonName` varchar(50) default NULL COMMENT '操作员名字',
  `CreateTime` datetime default NULL COMMENT '创建时间',
  `OperTime` datetime default NULL COMMENT '出入库时间',
  `OrganId` bigint(20) default NULL COMMENT '供应商Id',
  `HandsPersonId` bigint(20) default NULL COMMENT '采购/领料-经手人Id',
  `AccountId` bigint(20) default NULL COMMENT '账户Id',
  `ChangeAmount` double default NULL COMMENT '变动金额(收款/付款)',
  `AllocationProjectId` bigint(20) default NULL COMMENT '调拨时，对方项目Id',
  `TotalPrice` double default NULL COMMENT '合计金额',
  `PayType` varchar(50) default NULL,
  `Remark` varchar(1000) default NULL COMMENT '备注',
  PRIMARY KEY  (`Id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_depotitem`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depotitem`;
CREATE TABLE `jsh_depotitem` (
  `Id` bigint(20) NOT NULL auto_increment,
  `HeaderId` bigint(20) NOT NULL COMMENT '表头Id',
  `MaterialId` bigint(20) NOT NULL COMMENT '材料Id',
  `OperNumber` double default NULL COMMENT '数量',
  `UnitPrice` double default NULL COMMENT '单价',
  `AllPrice` double default NULL COMMENT '金额',
  `Remark` varchar(200) default NULL COMMENT '描述',
  `Img` varchar(50) default NULL COMMENT '图片',
  `Incidentals` double default NULL COMMENT '运杂费',
  PRIMARY KEY  (`Id`),
  KEY `FK2A819F475D61CCF7` (`MaterialId`),
  KEY `FK2A819F474BB6190E` (`HeaderId`),
  CONSTRAINT `jsh_depotitem_ibfk_1` FOREIGN KEY (`HeaderId`) REFERENCES `jsh_depothead` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `jsh_depotitem_ibfk_2` FOREIGN KEY (`MaterialId`) REFERENCES `jsh_material` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_functions`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_functions`;
CREATE TABLE `jsh_functions` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Number` varchar(50) default NULL,
  `Name` varchar(50) default NULL,
  `PNumber` varchar(50) default NULL,
  `URL` varchar(100) default NULL,
  `State` bit(1) default NULL,
  `Sort` varchar(50) default NULL,
  `Enabled` bit(1) default NULL,
  `Type` varchar(50) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_inoutitem`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_inoutitem`;
CREATE TABLE `jsh_inoutitem` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Name` varchar(50) default NULL COMMENT '名称',
  `Type` varchar(20) default NULL COMMENT '类型',
  `Remark` varchar(100) default NULL COMMENT '备注',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_log`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_log`;
CREATE TABLE `jsh_log` (
  `id` bigint(20) NOT NULL auto_increment,
  `userID` bigint(20) NOT NULL COMMENT '操作用户ID',
  `operation` varchar(500) default NULL COMMENT '操作模块名称',
  `clientIP` varchar(50) default NULL COMMENT '客户端IP',
  `createtime` datetime default NULL COMMENT '创建时间',
  `status` tinyint(4) default NULL COMMENT '操作状态 0==成功，1==失败',
  `contentdetails` varchar(1000) default NULL COMMENT '操作详情',
  `remark` varchar(500) default NULL COMMENT '备注信息',
  PRIMARY KEY  (`id`),
  KEY `FKF2696AA13E226853` (`userID`),
  CONSTRAINT `FKF2696AA13E226853` FOREIGN KEY (`userID`) REFERENCES `jsh_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_material`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material`;
CREATE TABLE `jsh_material` (
  `Id` bigint(20) NOT NULL auto_increment,
  `CategoryId` bigint(20) default NULL,
  `Name` varchar(50) default NULL COMMENT '名称',
  `Model` varchar(50) default NULL COMMENT '型号',
  `Standard` varchar(50) default NULL,
  `Color` varchar(50) default NULL COMMENT '颜色',
  `Unit` varchar(50) default NULL COMMENT '单位',
  `Remark` varchar(100) default NULL COMMENT '备注',
  `RetailPrice` double default NULL COMMENT '零售价',
  `LowPrice` double default NULL COMMENT '最低售价',
  `PresetPriceOne` double default NULL COMMENT '预设售价一',
  `PresetPriceTwo` double default NULL COMMENT '预设售价二',
  PRIMARY KEY  (`Id`),
  KEY `FK675951272AB6672C` (`CategoryId`),
  CONSTRAINT `FK675951272AB6672C` FOREIGN KEY (`CategoryId`) REFERENCES `jsh_materialcategory` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_materialcategory`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_materialcategory`;
CREATE TABLE `jsh_materialcategory` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Name` varchar(50) default NULL COMMENT '名称',
  `CategoryLevel` smallint(6) default NULL COMMENT '等级',
  `ParentId` bigint(20) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK3EE7F725237A77D8` (`ParentId`),
  CONSTRAINT `FK3EE7F725237A77D8` FOREIGN KEY (`ParentId`) REFERENCES `jsh_materialcategory` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_person`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_person`;
CREATE TABLE `jsh_person` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Type` varchar(20) default NULL COMMENT '类型',
  `Name` varchar(50) default NULL COMMENT '姓名',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_role`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_role`;
CREATE TABLE `jsh_role` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Name` varchar(50) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_supplier`;
CREATE TABLE `jsh_supplier` (
  `id` bigint(20) NOT NULL auto_increment,
  `supplier` varchar(255) NOT NULL COMMENT '供应商名称',
  `contacts` varchar(100) default NULL COMMENT '联系人',
  `phonenum` varchar(30) default NULL COMMENT '联系电话',
  `email` varchar(50) default NULL COMMENT '电子邮箱',
  `description` varchar(500) default NULL,
  `isystem` tinyint(4) default NULL,
  `type` varchar(20) default NULL COMMENT '类型',
  `enabled` bit(1) default NULL COMMENT '启用',
  `AdvanceIn` double default '0',
  `BeginNeedGet` double default NULL COMMENT '期初应收',
  `BeginNeedPay` double default NULL COMMENT '期初应付',
  `AllNeedGet` double default NULL COMMENT '累计应收',
  `AllNeedPay` double default NULL COMMENT '累计应付',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_user`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_user`;
CREATE TABLE `jsh_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL COMMENT '用户姓名--例如张三',
  `loginame` varchar(255) default NULL COMMENT '登录用户名--可能为空',
  `password` varchar(50) default NULL COMMENT '登陆密码',
  `position` varchar(200) default NULL COMMENT '职位',
  `department` varchar(255) default NULL COMMENT '所属部门',
  `email` varchar(100) default NULL COMMENT '电子邮箱',
  `phonenum` varchar(100) default NULL COMMENT '手机号码',
  `ismanager` tinyint(4) NOT NULL default '1' COMMENT '是否为管理者 0==管理者 1==员工',
  `isystem` tinyint(4) NOT NULL default '1' COMMENT '是否系统自带数据 ',
  `status` tinyint(4) default NULL COMMENT '用户状态',
  `description` varchar(500) default NULL COMMENT '用户描述信息',
  `remark` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_userbusiness`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_userbusiness`;
CREATE TABLE `jsh_userbusiness` (
  `Id` bigint(20) NOT NULL auto_increment,
  `Type` varchar(50) default NULL,
  `KeyId` varchar(50) default NULL,
  `Value` varchar(10000) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jsh_visitaccount`
-- ----------------------------
DROP TABLE IF EXISTS `jsh_visitaccount`;
CREATE TABLE `jsh_visitaccount` (
  `Id` bigint(20) NOT NULL auto_increment,
  `ProjectId` bigint(20) NOT NULL,
  `LouHao` varchar(50) default NULL,
  `HuHao` varchar(50) default NULL,
  `HuiFang` varchar(50) default NULL,
  `LuoShi` varchar(50) default NULL,
  `Name` varchar(50) default NULL,
  `Tel` varchar(50) default NULL,
  `AddTime` datetime default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FKFF4AAE822888F9A` (`ProjectId`),
  CONSTRAINT `FKFF4AAE822888F9A` FOREIGN KEY (`ProjectId`) REFERENCES `jsh_depot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
-- INSERT INTO `jsh_account` VALUES ('4','南通建行','652346523465234623','1200','215','建行账户'), ('9','流动总账','65234624523452364','2000','393','现在账户');
-- INSERT INTO `jsh_accounthead` VALUES ('57','收预付款','8','3',NULL,'1000',NULL,'2342134','2017-06-27 00:00:00',''), ('61','收预付款','9','3',NULL,'33',NULL,'SYF2017062901721','2017-06-29 00:00:00','aaaaaa'), ('67','收预付款','10','4',NULL,'2100',NULL,'SYF2017070222414','2017-07-02 00:00:00',''), ('68','收入','6','3','200','200','4','SR20170703233610','2017-07-03 00:00:00',''), ('70','支出','4','3','-60','-60','4','ZC20170703233735','2017-07-03 00:00:00',''), ('72','付款','4','3',NULL,'-200',NULL,'FK20170703233852','2017-07-03 00:00:00',''), ('74','转账',NULL,'3','-100','-100','4','ZZ2017070323489','2017-07-03 00:00:00',''), ('75','付款','4','3',NULL,'-300',NULL,'FK201707040746','2017-07-04 00:00:00',''), ('77','收入','2','3','40','40','4','SR20170704222634','2017-07-04 00:00:00',''), ('78','收预付款','9','3',NULL,'200',NULL,'SYF201707050257','2017-07-05 00:00:00',''), ('79','收预付款','9','3',NULL,'100',NULL,'SYF20170705076','2017-07-05 00:00:00',''), ('80','付款','1','3',NULL,'-200',NULL,'FK20170705088','2017-07-05 00:00:00',''), ('81','收款','2','4',NULL,'500',NULL,'SK201707050836','2017-07-05 00:00:00','');
-- INSERT INTO `jsh_accountitem` VALUES ('58','57','9',NULL,'1000',''), ('62','61','4',NULL,'33',''), ('68','67','4',NULL,'2100',''), ('69','68',NULL,'15','200',''), ('71','70',NULL,'11','60',''), ('73','72','9',NULL,'200',''), ('75','74','9',NULL,'100',''), ('76','75','9',NULL,'-300',''), ('78','77',NULL,'14','40',''), ('79','78','9',NULL,'200',''), ('80','79','9',NULL,'100',''), ('81','80','9',NULL,'-200',''), ('82','81','9',NULL,'500','');
INSERT INTO `jsh_app` VALUES ('1','','企业邮箱','app','0000000001.png','../EmailManage/Email','600','400','\0','\0','\0','desk','010','','\0'), ('3','00','系统管理','app','0000000004.png','','1024','600','','\0','\0','desk','198','',''), ('6','','个人信息','app','0000000005.png','../user/password.jsp','600','400','\0','\0','\0','dock','200','',''), ('7','01','基础数据','app','0000000006.png','','1024','600','','\0','\0','desk','120','',''), ('8','02','进销存','app','0000000007.png','','1024','600','','\0','\0','desk','030','',''), ('20','13','公告管理','app','0000000020.png',NULL,'1024','600','','\0','\0','desk','125',NULL,'\0'), ('21','','今日留言','app','0000000021.png','../phone/msg','1024','600','','\0','\0','dock','000','','\0'), ('22','03','报表查询','app','0000000022.png','','1024','600','','\0','\0','desk','115','','');
INSERT INTO `jsh_asset` VALUES ('1','27','weizhi','','0',NULL,'11','2016-10-22 00:00:00','2016-10-21 00:00:00','2016-11-03 00:00:00','1231241','123124123','2','','2016-10','2016-10-22 20:04:48','63','2016-10-22 20:04:48','63');
INSERT INTO `jsh_assetcategory` VALUES ('14','递延资产','1','递延资产'), ('15','无形资产','1','无形资产'), ('16','长期投资','1','长期投资'), ('17','固定资产','1','固定资产'), ('18','流动资产','1','流动资产');
INSERT INTO `jsh_assetname` VALUES ('1','联想Y450','17','1','','1'), ('2','惠普打印机','15','1','','0'), ('12','乐萌水杯','16','1','','1'), ('13','机顶盒','17','1','机顶盒','0'), ('14','TCL电视','17','1','','1'), ('15','手机','17','1','','1'), ('16','硬盘','16','1','','0'), ('17','毛笔','17','1','','0'), ('18','杯子','17','1','','0'), ('19','建造师证书','15','1','','0'), ('20','算量软件','14','1','','1'), ('21','cad软件','15','1','','0'), ('22','办公桌','17','1','','0'), ('23','笔记本','17','1','笔记本','1'), ('24','打印机','17','1','打印机','0'), ('25','电脑','17','1','电脑','0'), ('26','电动车','16','1','电动车','0'), ('27','电源线','17','1','电源线','0');
-- INSERT INTO `jsh_depot` VALUES ('1','上海花边店','2','上海'), ('2','公司总部','1','总部'), ('3','苏州花边店','3','苏州');
-- INSERT INTO `jsh_depothead` VALUES ('31','出库','销售','1','123A','陈鹏巍','2016-11-08 22:16:11','2016-11-08 00:00:00','2','1','4','33',NULL,'61','现付','444aaaa'), ('32','入库','采购','1','ww123','陈鹏巍','2016-11-25 22:14:46','2016-11-25 00:00:00','1','2','4','-1',NULL,'-0.9','现付',''), ('33','入库','其它','1','234234','陈鹏巍','2016-12-11 18:15:39','2016-12-11 00:00:00','1','2',NULL,NULL,NULL,NULL,'现付','12312'), ('38','入库','采购','3','123132','陈鹏巍','2016-12-24 23:14:22','2016-12-24 00:00:00','1','1','9','-44',NULL,'-24','现付','312'), ('39','入库','采购','3','222','陈鹏巍','2016-12-24 23:43:50','2016-12-24 00:00:00','4','2','9','-44',NULL,'-85.8','现付','3333'), ('41','入库','采购','1','555','陈鹏巍','2017-01-02 15:53:30','2017-01-02 00:00:00','1','2','9','-66',NULL,'-22','现付',''), ('46','入库','采购','1','555','陈鹏巍','2017-01-02 21:11:45','2017-01-02 00:00:00','1','2','9','-44',NULL,'-26.4','现付',''), ('47','入库','采购','1','66','陈鹏巍','2017-01-02 21:13:01','2017-01-02 00:00:00','1','2','9','-66',NULL,'-66','现付',''), ('48','入库','采购','1','344','陈鹏巍','2017-01-02 21:27:19','2017-01-02 00:00:00','1','1','4','-22',NULL,'-176','现付','3444'), ('49','入库','采购','1','333','陈鹏巍','2017-01-02 21:33:19','2017-01-02 00:00:00','1','2','9','-66',NULL,'-66','现付','333'), ('50','入库','采购','1','4444','陈鹏巍','2017-01-02 21:58:30','2017-01-02 00:00:00','1','1','9','-55',NULL,'-44','现付',''), ('51','入库','采购','1','aaa','陈鹏巍','2017-01-07 18:25:33','2017-01-07 00:00:00','1','1','9','-55',NULL,'-55','现付','bbb'), ('52','出库','销售','1','aaa','陈鹏巍','2017-01-08 10:49:21','2017-01-08 00:00:00','2','2','9','266',NULL,'266','现付','yayaya'), ('53','入库','销售退货','1','dddd','陈鹏巍','2017-01-08 10:50:58','2017-01-08 00:00:00','2','2','9','-2',NULL,'-2','现付',''), ('54','入库','其它','1','abcde22','陈鹏巍','2017-01-08 10:56:45','2017-01-08 00:00:00','4','2',NULL,NULL,NULL,'444','现付','aaaaa33'), ('56','入库','其它','1','AAF','陈鹏巍','2017-01-08 11:50:13','2017-01-08 00:00:00','1','1',NULL,NULL,NULL,'64','现付','234234aa'), ('57','出库','其它','1','666aaa','陈鹏巍','2017-01-08 11:53:00','2017-01-08 00:00:00','2','1',NULL,NULL,NULL,'66','现付','777bbb'), ('58','出库','采购退货','1','34234ww','陈鹏巍','2017-01-08 11:53:58','2017-01-08 00:00:00','1','2','9','44',NULL,'44','现付','3w3w'), ('59','入库','采购','1','22','陈鹏巍','2017-01-08 11:55:00','2017-01-08 00:00:00','1','1','9','-1324',NULL,'-1324','现付','33'), ('60','入库','销售退货','1','we','陈鹏巍','2017-01-08 11:55:53','2017-01-08 00:00:00','5','1','9','-122',NULL,'-122','现付','wewe'), ('61','出库','其它','1','rrrr','陈鹏巍','2017-01-08 11:58:58','2017-01-08 00:00:00','2','1',NULL,NULL,NULL,'66','现付','bbbb'), ('63','出库','调拨','1','aaaa','陈鹏巍','2017-01-08 12:22:19','2017-01-08 00:00:00',NULL,'1',NULL,NULL,'3','42','现付','bbbb'), ('64','出库','调拨','1','42342qqq','陈鹏巍','2017-01-08 12:33:19','2017-01-08 00:00:00',NULL,'2',NULL,NULL,'3','255','现付','wqer'), ('65','出库','调拨','3','42aa','陈鹏巍','2017-01-08 12:33:46','2017-01-08 00:00:00',NULL,'2',NULL,NULL,'1','121','现付','2323bbbbb'), ('67','入库','采购','1','abcdefg','陈鹏巍','2017-01-08 16:46:53','2017-01-08 00:00:00','4','1','9','-120',NULL,'-120','现付','aaawww'), ('68','出库','销售','1','asdfasdf','陈鹏巍','2017-01-08 18:58:35','2017-01-08 00:00:00','2','1','9','44',NULL,'44','现付','asdfasdf'), ('69','入库','采购','1','x123','陈鹏巍','2017-01-21 10:53:57','2017-01-21 00:00:00','1','1','9','-55',NULL,'-55','现付','aaaa1234'), ('70','出库','销售','3','aaa','陈鹏巍','2017-04-08 13:31:17','2017-04-08 00:00:00','5','2','9','100',NULL,'633','现付',''), ('71','出库','销售','1','aaa123','陈鹏巍','2017-04-09 16:19:22','2017-04-09 00:00:00','6','1','9','20',NULL,'333','现付',''), ('72','入库','采购','1','22aa','陈鹏巍','2017-06-03 22:25:59','2017-06-03 00:00:00','1','2','9','-18',NULL,'-18','现付',''), ('73','出库','销售','1','afds123','陈鹏巍','2017-06-03 22:29:35','2017-06-03 00:00:00','5','2','4','10',NULL,'10','现付',''), ('74','入库','销售退货','1','dsfs','陈鹏巍','2017-06-03 22:47:31','2017-06-03 00:00:00','5','2','4','-5',NULL,'-5','现付',''), ('76','入库','采购','1','asdf','陈鹏巍','2017-06-03 23:00:53','2017-06-03 00:00:00','1','2','4','-10',NULL,'-20','现付',''), ('77','出库','销售','3','22aa','陈鹏巍','2017-06-05 00:13:47','2017-06-05 00:00:00','2','1','4','22',NULL,'26.8','现付',''), ('80','出库','零售','1','sfsdf','陈鹏巍','2017-06-18 19:35:34','2017-06-18 00:00:00','2','2','4','24',NULL,'24','现付','sdf'), ('81','入库','零售退货','1','fsfsd','陈鹏巍','2017-06-18 19:36:33','2017-06-18 00:00:00','2','1','4','-33',NULL,'-33','现付','sfd'), ('82','出库','零售','1','fasdf','陈鹏巍','2017-06-18 19:53:49','2017-06-18 00:00:00','2','1','9','44',NULL,'44','现付',''), ('83','出库','零售','3','qwe3','陈鹏巍','2017-06-18 22:56:17','2017-06-18 00:00:00','2','1','4','4',NULL,'4','现付','123123'), ('85','出库','零售','1','1233','陈鹏巍','2017-06-20 00:34:45','2017-06-20 00:00:00','5','2','4','36',NULL,'36','现付','2314124'), ('86','出库','零售','1','hb3124312431','陈鹏巍','2017-06-20 21:56:51','2017-06-20 00:00:00','9','1','4','11',NULL,'11','现付','beizhubeizhu123123'), ('87','出库','零售','1','LSCK20170620225532','陈鹏巍','2017-06-20 22:03:32','2017-06-20 00:00:00','7','1','4','1',NULL,'1','现付','31312BEIZHU'), ('88','出库','零售','1','LSCK2017062023934','陈鹏巍','2017-06-20 23:09:53','2017-06-20 00:00:00','8','1','4','2',NULL,'2','现付','12单据备注单据备注单据备注单据备注单据备注'), ('89','出库','零售','1','LSCK20170620232023','陈鹏巍','2017-06-20 23:20:39','2017-06-20 00:00:00','7','2','4','1',NULL,'1','现付','beizhu11'), ('90','出库','零售','1','LSCK20170620234528','陈鹏巍','2017-06-20 23:47:15','2017-06-20 00:00:00','8','1','4','24.31',NULL,'24.31','现付',''), ('91','出库','销售','1','XSCK20170621215516','陈鹏巍','2017-06-21 21:55:50','2017-06-21 00:00:00','2','1','4','1.2',NULL,'1.2','现付',''), ('92','出库','零售','1','LSCK20170621232052','陈鹏巍','2017-06-21 23:21:37','2017-06-21 00:00:00','8','1','4','4.6',NULL,'4.6','现付',''), ('103','出库','零售','1','LSCK20170629029','陈鹏巍','2017-06-29 00:02:24','2017-06-29 00:00:00','8','1','9','12',NULL,'12','预付款','21341'), ('104','出库','零售','1','LSCK20170702213926','陈鹏巍','2017-07-02 21:39:50','2017-07-02 00:00:00','10','1','4','22',NULL,'22','现付',''), ('105','入库','零售退货','1','LSTH20170702221248','陈鹏巍','2017-07-02 22:13:05','2017-07-02 00:00:00','10','1','4','-12',NULL,'-12','现付',''), ('106','入库','采购','1','CGRK20170705232428','陈鹏巍','2017-07-05 23:26:46','2017-07-05 00:00:00','1','1','4','0',NULL,'-33','现付','');
-- INSERT INTO `jsh_depotitem` VALUES ('1017','31','485','100','0.61','61','','',NULL), ('1018','32','498','1','0.9','0.9','','',NULL), ('1019','33','487','1','2',NULL,'','',NULL), ('1025','38','485','12','2','24','',NULL,NULL), ('1026','39','498','22','2.1','46.2','',NULL,NULL), ('1027','39','487','33','1.2','39.6','',NULL,NULL), ('1029','41','487','11','2','22','',NULL,NULL), ('1032','46','498','22','1.2','26.4','',NULL,NULL), ('1033','47','487','66','1','66','',NULL,NULL), ('1034','48','485','44','4','176','',NULL,NULL), ('1035','49','498','33','2','66','',NULL,NULL), ('1036','50','485','44','1','44','',NULL,NULL), ('1037','51','487','11','3','33','',NULL,NULL), ('1038','51','498','22','1','22','',NULL,NULL), ('1039','52','487','2','2','4','',NULL,NULL), ('1040','53','487','1','2','2','',NULL,NULL), ('1041','54','485','222','2','444','',NULL,NULL), ('1042','56','498','33','1.94','64','',NULL,NULL), ('1043','57','498','22','3','66','',NULL,NULL), ('1044','58','498','44','1','44','',NULL,NULL), ('1045','59','498','2244','0.59','1324','',NULL,NULL), ('1046','60','485','61','2','122','aaaaaa',NULL,NULL), ('1047','52','487','31','2','62','',NULL,NULL), ('1048','61','498','33','2','66','',NULL,NULL), ('1050','63','498','21','2','42','',NULL,NULL), ('1051','64','498','233','1','233','',NULL,NULL), ('1052','65','498','33','1','33','',NULL,NULL), ('1053','65','485','44','2','88','',NULL,NULL), ('1054','64','485','22','1','22','',NULL,NULL), ('1056','67','487','60','2','120','',NULL,NULL), ('1057','52','485','100','2','200','',NULL,NULL), ('1058','68','498','22','2','44','',NULL,NULL), ('1059','69','487','22','2','44','',NULL,NULL), ('1060','69','498','11','1','11','',NULL,NULL), ('1061','70','487','211','3','633','',NULL,NULL), ('1062','71','498','333','1','333','',NULL,NULL), ('1063','72','499','20','0.9','18','',NULL,NULL), ('1064','73','499','10','1','10','',NULL,NULL), ('1065','74','499','5','1','5','',NULL,NULL), ('1067','76','499','20','1','20','',NULL,NULL), ('1068','77','499','11','2.2','24.2','',NULL,NULL), ('1069','77','498','2','1.3','2.6','',NULL,NULL), ('1072','80','485','12','2','24','sdfsd',NULL,NULL), ('1073','81','485','11','3','33','',NULL,NULL), ('1074','82','487','22','2','44','',NULL,NULL), ('1075','83','498','2','2','4','',NULL,NULL), ('1077','85','498','12','3','36','',NULL,NULL), ('1078','86','498','11','1','11','',NULL,NULL), ('1079','87','487','1','1','1','',NULL,NULL), ('1080','88','487','1','2','2','',NULL,NULL), ('1081','89','498','1','1','1','',NULL,NULL), ('1082','90','498','11','2.21','24.31','',NULL,NULL), ('1083','91','498','1','1.2','1.2','',NULL,NULL), ('1084','92','487','1','1','1','',NULL,NULL), ('1085','92','498','1','1.2','1.2','',NULL,NULL), ('1086','92','498','2','1.2','2.4','',NULL,NULL), ('1097','103','498','10','1.2','12','',NULL,NULL), ('1098','104','499','10','2.2','22','',NULL,NULL), ('1099','105','498','10','1.2','12','',NULL,NULL), ('1100','106','500','11','3','33','',NULL,NULL);
INSERT INTO `jsh_functions` VALUES ('1','00','系统管理','0','','','0010','','电脑版'), ('2','01','基础数据','0','','','0020','','电脑版'), ('3','02','进销存','0','','','0030','','电脑版'), ('11','0001','系统管理','00','','\0','0110','','电脑版'), ('12','000101','应用管理','0001','../manage/app.jsp','\0','0132','','电脑版'), ('13','000102','角色管理','0001','../manage/role.jsp','\0','0130','','电脑版'), ('14','000103','用户管理','0001','../manage/user.jsp','\0','0140','','电脑版'), ('15','000104','日志管理','0001','../manage/log.jsp','\0','0160','','电脑版'), ('16','000105','功能管理','0001','../manage/functions.jsp','\0','0135','','电脑版'), ('21','0101','商品管理','01','','\0','0220','','电脑版'), ('22','010101','商品类别管理','0101','../materials/materialcategory.jsp','\0','0230','','电脑版'), ('23','010102','商品信息管理','0101','../materials/material.jsp','\0','0240','','电脑版'), ('24','0102','基本资料','01','','\0','0250','','电脑版'), ('25','010201','单位信息','0102','../manage/vendor.jsp','\0','0260','','电脑版'), ('26','010202','仓库管理','0102','../manage/depot.jsp','\0','0270','','电脑版'), ('31','010206','经手人管理','0102','../materials/person.jsp','\0','0284','','电脑版'), ('32','0202','入库管理','02','','\0','0330','','电脑版'), ('33','020201','采购入库','0202','../materials/purchase_in_list.jsp','\0','0340','','电脑版'), ('38','0203','出库管理','02','','\0','0390','','电脑版'), ('40','020306','调拨出库','0203','../materials/allocation_out_list.jsp','\0','0420','','电脑版'), ('41','020303','销售出库','0203','../materials/sale_out_list.jsp','\0','0410','','电脑版'), ('44','0204','财务管理','02','','\0','0450','','电脑版'), ('59','030101','库存状况','0301','../reports/in_out_stock_report.jsp','\0','0600','','电脑版'), ('194','010204','收支项目','0102','../manage/inOutItem.jsp','\0','0282','','电脑版'), ('195','010205','结算账户','0102','../manage/account.jsp','\0','0283','','电脑版'), ('196','03','报表查询','0','','','0040','','电脑版'), ('197','020402','收入单','0204','../financial/item_in.jsp','\0','0465','','电脑版'), ('198','0301','报表查询','03','','\0','0570','','电脑版'), ('199','020304','采购退货','0203','../materials/purchase_back_list.jsp','\0','0415','','电脑版'), ('200','020203','销售退货','0202','../materials/sale_back_list.jsp','\0','0350','','电脑版'), ('201','020204','其它入库','0202','../materials/other_in_list.jsp','\0','0360','','电脑版'), ('202','020305','其它出库','0203','../materials/other_out_list.jsp','\0','0418','','电脑版'), ('203','020403','支出单','0204','../financial/item_out.jsp','\0','0470','','电脑版'), ('204','020404','收款单','0204','../financial/money_in.jsp','\0','0475','','电脑版'), ('205','020405','付款单','0204','../financial/money_out.jsp','\0','0480','','电脑版'), ('206','020406','转账单','0204','../financial/giro.jsp','\0','0490','','电脑版'), ('207','030102','结算账户','0301','../reports/account_report.jsp','\0','0610','','电脑版'), ('208','030103','进货统计','0301','../reports/buy_in_report.jsp','\0','0620','','电脑版'), ('209','030104','销售统计','0301','../reports/sale_out_report.jsp','\0','0630','','电脑版'), ('210','020302','零售出库','0203','../materials/retail_out_list.jsp','\0','0405','','电脑版'), ('211','020202','零售退货','0202','../materials/retail_back_list.jsp','\0','0345','','电脑版');
INSERT INTO `jsh_inoutitem` VALUES ('1','办公耗材','支出','办公耗材'), ('5','房租收入','收入','房租收入'), ('7','利息收入','收入','利息收入'), ('8','水电费','支出','水电费水电费'), ('9','快递费','支出','快递费'), ('10','交通报销费','支出','交通报销费'), ('11','差旅费','支出','差旅费'), ('12','全车贴膜-普通','收入',''), ('13','全车贴膜-高档','收入',''), ('14','洗车','收入',''), ('15','保养汽车','收入','');
-- INSERT INTO `jsh_material` VALUES ('485','1','棉线','A21-4321','5g','','码','','1','1','1','1'), ('487','2','网布','12343','','红色','码','','1','1','1','1'), ('498','1','蕾丝','B123','','蓝色','码','','1.2','1','1.3','1.4'), ('499','1','棉线','A21-1234','','米红色','码','','2.2','2','2.4','2.6'), ('500','1','纯棉线','AAA666','11g','白色','码','','1.1','1','1.2','1.3');
-- INSERT INTO `jsh_materialcategory` VALUES ('1','根目录','1','1'), ('2','花边分类','1','1'), ('3','其他','1','1'), ('4','其他','2','3'), ('5','其他','3','4');
-- INSERT INTO `jsh_supplier` VALUES ('1','上海某某花边工厂','乔治','','','','1','供应商','\0','0',NULL,'20',NULL,NULL), ('2','客户AAAA','佩琪','','','','1','客户','\0','0',NULL,'30',NULL,NULL), ('4','苏州新源布料厂','龙哥','13000000000','312341@qq.com','55','1','供应商','\0','0','44',NULL,NULL,NULL), ('5','客户BBBB','彪哥','13000000000','666@qq.com','','1','客户','\0','0','20',NULL,NULL,NULL), ('6','南通宝贝家纺','姗姗','','','','1','客户','\0','0','20',NULL,NULL,NULL), ('7','非会员','宋江','13000000000','123456@qq.com','','1','散户','\0','0',NULL,NULL,NULL,NULL), ('8','hy00001','宋江','13000000000','','','1','散户','\0','944',NULL,NULL,NULL,NULL), ('9','hy00002','吴用','13000000000','','','1','散户','\0','333',NULL,NULL,NULL,NULL), ('10','1268787965','李逵','13000000000','','','1','散户','\0','2100',NULL,NULL,NULL,NULL);
INSERT INTO `jsh_user` VALUES ('63','陈鹏巍','admin','e10adc3949ba59abbe56e057f20f883e','','','','','0','1','-1','',NULL);
INSERT INTO `jsh_userbusiness` VALUES ('1','RoleAPP','4','[21][1][8][11][10][19][16][15][12][7][17][20][18][3][6][22][23][24][25]'), ('2','RoleAPP','5','[8][7][6]'), ('3','RoleAPP','6','[21][1][8]'), ('4','RoleAPP','7','[21][1][8][11]'), ('5','RoleFunctions','4','[13][12][16][14][15][22][23][25][26][194][195][31][33][211][200][201][210][41][199][202][40][197][203][204][205][206][212][59][207][208][209]'), ('6','RoleFunctions','5','[22][23][25][26][194][195][31][33][200][201][41][199][202]'), ('7','RoleFunctions','6','[168][13][12][16][14][15][189][18][19]'), ('8','RoleAPP','8','[21][1][8][11][10]'), ('9','RoleFunctions','7','[168][13][12][16][14][15][189][18][19][132]'), ('10','RoleFunctions','8','[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187]'), ('11','RoleFunctions','9','[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187][188]'), ('12','UserRole','1','[5]'), ('13','UserRole','2','[6][7]'), ('14','UserDepot','2','[1][2][6][7]'), ('15','UserDepot','1','[1][2][5][6][7][10][12][14][15][17]'), ('16','UserRole','63','[4]'), ('17','RoleFunctions','13','[46][47][48][49]'), ('18','UserDepot','63','[1][3]'), ('19','UserDepot','5','[6][45][46][50]'), ('20','UserRole','5','[5]'), ('21','UserRole','64','[5]'), ('22','UserDepot','64','[1]'), ('23','UserRole','65','[5]'), ('24','UserDepot','65','[1]');
