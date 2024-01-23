-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zmx
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (4,'user_fill_info','用户填报信息表',NULL,NULL,'UserFillInfo','crud','element-ui','com.autumn.project.vaccines','vaccines','userFillInfo','用户填报信息','autumn','0','/','{\"parentMenuId\":\"1061\"}','admin','2024-01-23 06:15:33','','2024-01-23 07:06:13',NULL),(5,'vaccination_method_info','接种方法信息表',NULL,NULL,'VaccinationMethodInfo','crud','element-ui','com.autumn.project.vaccines','vaccines','vaccinationMethodInfo','接种方法信息','autumn','0','/','{\"parentMenuId\":1061}','admin','2024-01-23 06:15:33','','2024-01-23 06:26:09',NULL),(6,'vaccines_info','疫苗信息表',NULL,NULL,'VaccinesInfo','crud','element-ui','com.autumn.project.vaccines','vaccines','vaccinesInfo','疫苗信息','autumn','0','/','{\"parentMenuId\":\"1061\"}','admin','2024-01-23 06:15:33','','2024-01-23 06:49:03',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (69,4,'id','ID','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(70,4,'user_id','用户ID','bigint(20)','Long','userId','0','0','1','1','0','0','0','EQ','input','',2,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(71,4,'user_name','家长姓名','varchar(50)','String','userName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(72,4,'user_sex','家长性别','varchar(5)','String','userSex','0','0','1','1','1','1','1','EQ','radio','sys_user_sex',4,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(73,4,'children_name','孩子姓名','varchar(50)','String','childrenName','0','0','1','1','1','1','1','LIKE','input','',5,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(74,4,'children_sex','孩子性别','varchar(5)','String','childrenSex','0','0','1','1','1','1','1','EQ','radio','sys_user_sex',6,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(75,4,'children_birthday','孩子出生日期','date','Date','childrenBirthday','0','0','1','1','1','1','1','EQ','datetime','',7,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(76,4,'today','填报日期','date','Date','today','0','0','1','1','1','1','1','EQ','datetime','',8,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(77,4,'children_allergy','孩子过敏事项','text','String','childrenAllergy','0','0','1','1','1','1','1','EQ','textarea','',9,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(78,4,'user_phone','家长手机号码','varchar(11)','String','userPhone','0','0','1','1','1','1','1','EQ','input','',10,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(79,4,'address','家庭住址','text','String','address','0','0','1','1','1','1','1','EQ','textarea','',11,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(80,4,'take_care','注意事项','text','String','takeCare','0','0','1','1','1','1','1','EQ','editor','',12,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(81,4,'score','评分','char(5)','String','score','0','0','1','1','1','1','1','EQ','input','',13,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(82,4,'opinions','意见建议','text','String','opinions','0','0','1','1','1','1','1','EQ','editor','',14,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(83,4,'state','状态(1用户草稿，2用户推送，3系统选择，4管理员审核，5用户已读)','char(5)','String','state','0','0','1','1','1','1','1','EQ','input','',15,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(84,4,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,'1','1','EQ','input','',16,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(85,4,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,'1','1','EQ','datetime','',17,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(86,4,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',18,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(87,4,'ext1','扩展字段1','varchar(255)','String','ext1','0','0','0','1','1','1','1','EQ','input','',19,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(88,4,'ext2','扩展字段2','varchar(255)','String','ext2','0','0','0','1','1','1','1','EQ','input','',20,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(89,4,'ext3','扩展字段3','varchar(255)','String','ext3','0','0','0','1','1','1','1','EQ','input','',21,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(90,4,'ext4','扩展字段4','varchar(255)','String','ext4','0','0','0','1','1','1','1','EQ','input','',22,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(91,4,'ext5','扩展字段5','varchar(255)','String','ext5','0','0','0','1','1','1','1','EQ','input','',23,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(92,4,'ext6','扩展字段6','varchar(255)','String','ext6','0','0','0','1','1','1','1','EQ','input','',24,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(93,4,'ext7','扩展字段7','varchar(255)','String','ext7','0','0','0','1','1','1','1','EQ','input','',25,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(94,4,'ext8','扩展字段8','varchar(255)','String','ext8','0','0','0','1','1','1','1','EQ','input','',26,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(95,4,'ext9','扩展字段9','varchar(255)','String','ext9','0','0','0','1','1','1','1','EQ','input','',27,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(96,4,'ext10','扩展字段10','varchar(255)','String','ext10','0','0','0','1','1','1','1','EQ','input','',28,'admin','2024-01-23 06:15:33','','2024-01-23 07:06:13'),(97,5,'id','ID','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(98,5,'vaccination_method_name','接种方式名称','varchar(50)','String','vaccinationMethodName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(99,5,'vaccination_method_code','接种方式标识','varchar(50)','String','vaccinationMethodCode','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(100,5,'state','状态','char(5)','String','state','0','0','0','1','1','1','1','EQ','radio','sys_normal_disable',4,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(101,5,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,'1','1','EQ','input','',5,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(102,5,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,'1','1','EQ','datetime','',6,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(103,5,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',7,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(104,5,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',8,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(105,5,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',9,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(106,5,'ext1','扩展字段1','varchar(255)','String','ext1','0','0','0','1','1','1','1','EQ','input','',10,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(107,5,'ext2','扩展字段2','varchar(255)','String','ext2','0','0','0','1','1','1','1','EQ','input','',11,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(108,5,'ext3','扩展字段3','varchar(255)','String','ext3','0','0','0','1','1','1','1','EQ','input','',12,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(109,5,'ext4','扩展字段4','varchar(255)','String','ext4','0','0','0','1','1','1','1','EQ','input','',13,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(110,5,'ext5','扩展字段5','varchar(255)','String','ext5','0','0','0','1','1','1','1','EQ','input','',14,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(111,5,'ext6','扩展字段6','varchar(255)','String','ext6','0','0','0','1','1','1','1','EQ','input','',15,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(112,5,'ext7','扩展字段7','varchar(255)','String','ext7','0','0','0','1','1','1','1','EQ','input','',16,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(113,5,'ext8','扩展字段8','varchar(255)','String','ext8','0','0','0','1','1','1','1','EQ','input','',17,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(114,5,'ext9','扩展字段9','varchar(255)','String','ext9','0','0','0','1','1','1','1','EQ','input','',18,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(115,5,'ext10','扩展字段10','varchar(255)','String','ext10','0','0','0','1','1','1','1','EQ','input','',19,'admin','2024-01-23 06:15:33','','2024-01-23 06:26:09'),(116,6,'id','ID','bigint(20)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(117,6,'vaccines_name','疫苗名称','varchar(50)','String','vaccinesName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(118,6,'vaccines_code','疫苗标识','varchar(50)','String','vaccinesCode','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(119,6,'vaccination_method_code','接种方式标识','varchar(50)','String','vaccinationMethodCode','0','0','1','1','1','1','1','EQ','select','sys_normal_disable',4,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(120,6,'age_min','最小年龄(天)','int(11)','Long','ageMin','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(121,6,'age_max','最大年龄(天)','int(11)','Long','ageMax','0','0','1','1','1','1','1','EQ','input','',6,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(122,6,'state','状态','char(5)','String','state','0','0','1','1','1','1','1','EQ','radio','sys_normal_disable',7,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(123,6,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,'1','1','EQ','input','',8,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(124,6,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,'1','1','EQ','datetime','',9,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(125,6,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',10,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(126,6,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',11,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(127,6,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',12,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(128,6,'ext1','扩展字段1','varchar(255)','String','ext1','0','0','0','1','1','1','1','EQ','input','',13,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(129,6,'ext2','扩展字段2','varchar(255)','String','ext2','0','0','0','1','1','1','1','EQ','input','',14,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(130,6,'ext3','扩展字段3','varchar(255)','String','ext3','0','0','0','1','1','1','1','EQ','input','',15,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(131,6,'ext4','扩展字段4','varchar(255)','String','ext4','0','0','0','1','1','1','1','EQ','input','',16,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(132,6,'ext5','扩展字段5','varchar(255)','String','ext5','0','0','0','1','1','1','1','EQ','input','',17,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(133,6,'ext6','扩展字段6','varchar(255)','String','ext6','0','0','0','1','1','1','1','EQ','input','',18,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(134,6,'ext7','扩展字段7','varchar(255)','String','ext7','0','0','0','1','1','1','1','EQ','input','',19,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(135,6,'ext8','扩展字段8','varchar(255)','String','ext8','0','0','0','1','1','1','1','EQ','input','',20,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(136,6,'ext9','扩展字段9','varchar(255)','String','ext9','0','0','0','1','1','1','1','EQ','input','',21,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03'),(137,6,'ext10','扩展字段10','varchar(255)','String','ext10','0','0','0','1','1','1','1','EQ','input','',22,'admin','2024-01-23 06:15:33','','2024-01-23 06:49:03');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-01-15 05:14:52','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-01-15 05:14:52','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-01-15 05:14:52','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-01-15 05:14:52','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2024-01-15 05:14:52','admin','2024-01-22 05:21:01','是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-01-15 05:14:52','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','AUTUMN',0,'','','','0','0','admin','2024-01-15 05:14:46','admin','2024-01-15 05:43:01'),(101,100,'0,100','总公司',1,'','','','0','0','admin','2024-01-15 05:14:46','admin','2024-01-15 05:42:43'),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-01-15 05:14:46','',NULL),(103,101,'0,100,101','研发部门',1,'','','','0','0','admin','2024-01-15 05:14:46','admin','2024-01-15 05:42:36'),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-01-15 05:14:46','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','2','admin','2024-01-15 05:14:46','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2024-01-15 05:14:46','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2024-01-15 05:14:46','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2024-01-15 05:14:46','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-01-15 05:14:46','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-01-15 05:14:51','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-01-15 05:14:51','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-01-15 05:14:51','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-01-15 05:14:51','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-01-15 05:14:51','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-01-15 05:14:51','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-01-15 05:14:51','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-01-15 05:14:51','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-01-15 05:14:51','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-01-15 05:14:51','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-01-15 05:14:51','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-01-15 05:14:51','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-01-15 05:14:51','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-01-15 05:14:51','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-01-15 05:14:51','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-01-15 05:14:51','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-01-15 05:14:51','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-01-15 05:14:51','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-01-15 05:14:51','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-01-15 05:14:51','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-01-15 05:14:52','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-01-15 05:14:52','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-01-15 05:14:52','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-01-15 05:14:52','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-01-15 05:14:52','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-01-15 05:14:52','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-01-15 05:14:52','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-01-15 05:14:52','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-01-15 05:14:52','',NULL,'停用状态'),(30,1,'用户草稿','1','user_fill_state',NULL,'default','N','0','admin','2024-01-23 07:33:38','',NULL,NULL),(31,2,'用户推送','2','user_fill_state',NULL,'default','N','0','admin','2024-01-23 07:33:50','',NULL,NULL),(32,3,'系统选择','3','user_fill_state',NULL,'default','N','0','admin','2024-01-23 07:34:09','',NULL,NULL),(33,4,'管理员审核','4','user_fill_state',NULL,'default','N','0','admin','2024-01-23 07:34:23','',NULL,NULL),(34,5,'用户已读','5','user_fill_state',NULL,'default','N','0','admin','2024-01-23 07:34:32','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-01-15 05:14:51','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-01-15 05:14:51','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-01-15 05:14:51','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-01-15 05:14:51','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-01-15 05:14:51','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-01-15 05:14:51','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-01-15 05:14:51','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-01-15 05:14:51','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-01-15 05:14:51','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-01-15 05:14:51','',NULL,'登录状态列表'),(11,'用户填报信息状态','user_fill_state','0','admin','2024-01-23 07:33:18','',NULL,'用户填报信息表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-01-15 05:14:52','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-01-15 05:14:52','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-01-15 05:14:52','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-15 05:31:05'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-15 05:31:18'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-15 05:31:23'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:31:29'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-15 05:33:55'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:34:07'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:34:57'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:36:11'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:36:32'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:37:52'),(110,'admin','192.168.31.70','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-01-15 05:38:02'),(111,'admin','192.168.31.70','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-01-15 05:38:05'),(112,'admin','192.168.31.70','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-01-15 05:38:10'),(113,'admin','192.168.31.70','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:38:17'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:40:48'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-15 05:45:05'),(116,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-15 05:46:53'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-17 03:41:13'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-19 05:28:17'),(119,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-19 05:28:30'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-19 07:05:37'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-19 07:49:25'),(122,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-19 07:54:35'),(123,'admin1','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:16:30'),(124,'admin1','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-01-22 05:16:37'),(125,'admin1','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:16:47'),(126,'admin1','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:16:57'),(127,'admin1','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:17:05'),(128,'admin1','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:17:10'),(129,'admin1','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:17:16'),(130,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-01-22 05:17:31'),(131,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 05:17:36'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-22 05:18:10'),(133,'user','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:18:24'),(134,'user','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:18:31'),(135,'user','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:18:37'),(136,'user','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:18:42'),(137,'user','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-22 05:18:47'),(138,'user','127.0.0.1','内网IP','Chrome 12','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2024-01-22 05:18:52'),(139,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 05:20:35'),(140,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-22 05:21:07'),(141,'user1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-01-22 05:23:00'),(142,'user1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 05:23:13'),(143,'user1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-22 05:23:19'),(144,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 05:23:26'),(145,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-22 05:35:16'),(146,'user2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-01-22 05:35:35'),(147,'user2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 05:35:45'),(148,'user2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-22 05:36:17'),(149,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 05:36:40'),(150,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-22 05:37:29'),(151,'user2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 05:37:42'),(152,'user2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-22 05:42:24'),(153,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 05:42:33'),(154,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-23 06:10:43'),(155,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-23 08:32:55'),(156,'user1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-01-23 08:33:20'),(157,'user1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-23 08:33:36'),(158,'user1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-23 08:34:06'),(159,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-01-23 08:34:12'),(160,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-01-23 08:34:19'),(161,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-23 08:34:24');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-01-15 05:14:46','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-01-15 05:14:47','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-01-15 05:14:47','',NULL,'系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-01-15 05:14:47','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-01-15 05:14:47','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-01-15 05:14:47','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-01-15 05:14:47','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-01-15 05:14:47','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-01-15 05:14:47','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-01-15 05:14:47','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-01-15 05:14:47','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-01-15 05:14:47','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-01-15 05:14:47','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-01-15 05:14:47','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-01-15 05:14:47','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-01-15 05:14:47','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-01-15 05:14:47','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-01-15 05:14:47','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-01-15 05:14:47','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-01-15 05:14:47','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-01-15 05:14:47','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-01-15 05:14:47','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-01-15 05:14:47','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-01-15 05:14:47','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-01-15 05:14:47','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-01-15 05:14:47','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-01-15 05:14:47','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-01-15 05:14:47','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-01-15 05:14:47','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-01-15 05:14:47','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-01-15 05:14:47','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-01-15 05:14:47','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-01-15 05:14:47','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-01-15 05:14:47','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-01-15 05:14:47','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-01-15 05:14:47','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-01-15 05:14:47','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-01-15 05:14:47','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-01-15 05:14:47','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-01-15 05:14:47','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-01-15 05:14:47','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-01-15 05:14:48','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-01-15 05:14:48','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-01-15 05:14:48','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-01-15 05:14:48','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-01-15 05:14:48','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-01-15 05:14:48','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-01-15 05:14:48','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-01-15 05:14:48','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-01-15 05:14:48','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-01-15 05:14:48','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-01-15 05:14:48','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-01-15 05:14:48','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-01-15 05:14:48','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-01-15 05:14:48','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-01-15 05:14:48','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-01-15 05:14:48','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-01-15 05:14:48','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-01-15 05:14:48','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-01-15 05:14:48','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-01-15 05:14:48','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-01-15 05:14:48','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-01-15 05:14:48','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-01-15 05:14:48','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-01-15 05:14:48','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-01-15 05:14:48','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-01-15 05:14:48','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-01-15 05:14:48','',NULL,''),(1061,'疫苗接种管理',0,4,'vaccines',NULL,NULL,1,0,'M','0','0',NULL,'list','admin','2024-01-23 06:23:21','',NULL,''),(1062,'接种方法信息',1061,1,'vaccinationMethodInfo','vaccines/vaccinationMethodInfo/index',NULL,1,0,'C','0','0','vaccines:vaccinationMethodInfo:list','list','admin','2024-01-23 06:28:32','admin','2024-01-23 06:47:48','接种方法信息菜单'),(1063,'接种方法信息查询',1062,1,'#','',NULL,1,0,'F','0','0','vaccines:vaccinationMethodInfo:query','#','admin','2024-01-23 06:28:32','',NULL,''),(1064,'接种方法信息新增',1062,2,'#','',NULL,1,0,'F','0','0','vaccines:vaccinationMethodInfo:add','#','admin','2024-01-23 06:28:32','',NULL,''),(1065,'接种方法信息修改',1062,3,'#','',NULL,1,0,'F','0','0','vaccines:vaccinationMethodInfo:edit','#','admin','2024-01-23 06:28:32','',NULL,''),(1066,'接种方法信息删除',1062,4,'#','',NULL,1,0,'F','0','0','vaccines:vaccinationMethodInfo:remove','#','admin','2024-01-23 06:28:32','',NULL,''),(1067,'接种方法信息导出',1062,5,'#','',NULL,1,0,'F','0','0','vaccines:vaccinationMethodInfo:export','#','admin','2024-01-23 06:28:32','',NULL,''),(1068,'疫苗信息',1061,1,'vaccinesInfo','vaccines/vaccinesInfo/index',NULL,1,0,'C','0','0','vaccines:vaccinesInfo:list','list','admin','2024-01-23 06:49:42','admin','2024-01-23 06:56:28','疫苗信息菜单'),(1069,'疫苗信息查询',1068,1,'#','',NULL,1,0,'F','0','0','vaccines:vaccinesInfo:query','#','admin','2024-01-23 06:49:42','',NULL,''),(1070,'疫苗信息新增',1068,2,'#','',NULL,1,0,'F','0','0','vaccines:vaccinesInfo:add','#','admin','2024-01-23 06:49:42','',NULL,''),(1071,'疫苗信息修改',1068,3,'#','',NULL,1,0,'F','0','0','vaccines:vaccinesInfo:edit','#','admin','2024-01-23 06:49:42','',NULL,''),(1072,'疫苗信息删除',1068,4,'#','',NULL,1,0,'F','0','0','vaccines:vaccinesInfo:remove','#','admin','2024-01-23 06:49:42','',NULL,''),(1073,'疫苗信息导出',1068,5,'#','',NULL,1,0,'F','0','0','vaccines:vaccinesInfo:export','#','admin','2024-01-23 06:49:42','',NULL,''),(1074,'用户填报信息',1061,1,'userFillInfo','vaccines/userFillInfo/index',NULL,1,0,'C','0','0','vaccines:userFillInfo:list','list','admin','2024-01-23 07:06:53','admin','2024-01-23 07:09:20','用户填报信息菜单'),(1075,'用户填报信息查询',1074,1,'#','',NULL,1,0,'F','0','0','vaccines:userFillInfo:query','#','admin','2024-01-23 07:06:53','',NULL,''),(1076,'用户填报信息新增',1074,2,'#','',NULL,1,0,'F','0','0','vaccines:userFillInfo:add','#','admin','2024-01-23 07:06:53','',NULL,''),(1077,'用户填报信息修改',1074,3,'#','',NULL,1,0,'F','0','0','vaccines:userFillInfo:edit','#','admin','2024-01-23 07:06:53','',NULL,''),(1078,'用户填报信息删除',1074,4,'#','',NULL,1,0,'F','0','0','vaccines:userFillInfo:remove','#','admin','2024-01-23 07:06:53','',NULL,''),(1079,'用户填报信息导出',1074,5,'#','',NULL,1,0,'F','0','0','vaccines:userFillInfo:export','#','admin','2024-01-23 07:06:53','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'用户头像',2,'com.autumn.project.system.controller.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/15/111_20240115133222A001.jpg\",\"code\":200}',0,NULL,'2024-01-15 05:32:22',78),(101,'用户管理',3,'com.autumn.project.system.controller.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:35:03',37),(102,'部门管理',3,'com.autumn.project.system.controller.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/102','127.0.0.1','内网IP','{}','{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}',0,NULL,'2024-01-15 05:41:52',4),(103,'部门管理',3,'com.autumn.project.system.controller.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/109','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:41:54',10),(104,'部门管理',3,'com.autumn.project.system.controller.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/108','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:41:56',11),(105,'部门管理',3,'com.autumn.project.system.controller.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:41:58',12),(106,'部门管理',3,'com.autumn.project.system.controller.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:42:00',10),(107,'部门管理',3,'com.autumn.project.system.controller.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:42:02',12),(108,'部门管理',3,'com.autumn.project.system.controller.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/105','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:42:04',9),(109,'部门管理',3,'com.autumn.project.system.controller.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:42:06',10),(110,'部门管理',2,'com.autumn.project.system.controller.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:42:36',24),(111,'部门管理',2,'com.autumn.project.system.controller.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"总公司\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"若依科技\",\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:42:43',25),(112,'部门管理',2,'com.autumn.project.system.controller.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"AUTUMN\",\"email\":\"\",\"leader\":\"\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:43:01',13),(113,'岗位管理',3,'com.autumn.project.system.controller.SysPostController.remove()','DELETE',1,'admin','研发部门','/system/post/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:44:16',10),(114,'岗位管理',3,'com.autumn.project.system.controller.SysPostController.remove()','DELETE',1,'admin','研发部门','/system/post/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:44:19',10),(115,'通知公告',3,'com.autumn.project.system.controller.SysNoticeController.remove()','DELETE',1,'admin','研发部门','/system/notice/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:44:29',4),(116,'通知公告',3,'com.autumn.project.system.controller.SysNoticeController.remove()','DELETE',1,'admin','研发部门','/system/notice/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-15 05:44:30',5),(117,'用户头像',2,'com.autumn.project.system.controller.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/17/111_20240117114150A001.jpg\",\"code\":200}',0,NULL,'2024-01-17 03:41:50',69),(118,'用户管理',1,'com.autumn.project.system.controller.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"1\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":2,\"userName\":\"user\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 05:17:59',94),(119,'用户管理',4,'com.autumn.project.system.controller.SysUserController.insertAuthRole()','PUT',1,'admin','研发部门','/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"2\",\"userId\":\"2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 05:18:08',17),(120,'参数管理',2,'com.autumn.project.system.controller.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-01-15 05:14:52\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 05:21:01',16),(121,'用户管理',3,'com.autumn.project.system.controller.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 05:35:13',62),(122,'角色管理',2,'com.autumn.project.system.controller.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-15 05:14:46\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1035],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 05:37:22',29),(123,'用户管理',3,'com.autumn.project.system.controller.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 06:48:24',42),(124,'用户管理',3,'com.autumn.project.system.controller.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 06:48:26',13),(125,'代码生成',6,'com.autumn.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"user_fill_info,vaccines_info,vaccination_method_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:11:11',372),(126,'代码生成',3,'com.autumn.project.tool.gen.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:15:21',16),(127,'代码生成',3,'com.autumn.project.tool.gen.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:15:22',11),(128,'代码生成',3,'com.autumn.project.tool.gen.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:15:25',13),(129,'代码生成',6,'com.autumn.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"user_fill_info,vaccines_info,vaccination_method_info\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:15:33',246),(130,'代码生成',2,'com.autumn.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"userFillInfo\",\"className\":\"UserFillInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":69,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":70,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"家长姓名\",\"columnId\":71,\"columnName\":\"user_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserSex\",\"columnComment\":\"家长性别\",\"columnId\":72,\"columnName\":\"user_sex\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequire','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:21:23',121),(131,'菜单管理',1,'com.autumn.project.system.controller.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"疫苗接种管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"vaccines\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:23:21',20),(132,'代码生成',2,'com.autumn.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vaccinationMethodInfo\",\"className\":\"VaccinationMethodInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":97,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VaccinationMethodName\",\"columnComment\":\"接种方式名称\",\"columnId\":98,\"columnName\":\"vaccination_method_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vaccinationMethodName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VaccinationMethodCode\",\"columnComment\":\"接种方式标识\",\"columnId\":99,\"columnName\":\"vaccination_method_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vaccinationMethodCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"State\",\"columnComment\":\"状态\",\"columnId\":100,\"columnName\":\"state\",\"columnType\":\"char(5)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"sys_normal_disable\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"in','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:26:09',70),(133,'代码生成',2,'com.autumn.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"userFillInfo\",\"className\":\"UserFillInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":69,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:21:23\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":70,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:21:23\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"家长姓名\",\"columnId\":71,\"columnName\":\"user_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:21:23\",\"usableColumn\":false},{\"capJavaField\":\"UserSex\",\"columnComment\":\"家长性别\",\"columnId\":72,\"columnName\":\"user_sex\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"in','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:26:17',85),(134,'代码生成',2,'com.autumn.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vaccinesInfo\",\"className\":\"VaccinesInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":116,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VaccinesName\",\"columnComment\":\"疫苗名称\",\"columnId\":117,\"columnName\":\"vaccines_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vaccinesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VaccinesCode\",\"columnComment\":\"疫苗标识\",\"columnId\":118,\"columnName\":\"vaccines_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vaccinesCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VaccinationMethodCode\",\"columnComment\":\"接种方式标识\",\"columnId\":119,\"columnName\":\"vaccination_method_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"sys_normal_disable\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncre','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:27:46',73),(135,'代码生成',8,'com.autumn.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vaccination_method_info\"}',NULL,0,NULL,'2024-01-23 06:27:52',333),(136,'接种方法信息',1,'com.autumn.project.vaccines.controller.VaccinationMethodInfoController.add()','POST',1,'admin','研发部门','/vaccines/vaccinationMethodInfo','127.0.0.1','内网IP','{\"createTime\":\"2024-01-23 14:41:12\",\"id\":1,\"params\":{},\"remark\":\"11\",\"state\":\"0\",\"vaccinationMethodCode\":\"injection\",\"vaccinationMethodName\":\"注射\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:41:12',48),(137,'接种方法信息',2,'com.autumn.project.vaccines.controller.VaccinationMethodInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/vaccinationMethodInfo','127.0.0.1','内网IP','{\"createBy\":\"\",\"createTime\":\"2024-01-23 14:41:13\",\"id\":1,\"params\":{},\"remark\":\"11\",\"state\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-23 14:43:59\",\"vaccinationMethodCode\":\"injection\",\"vaccinationMethodName\":\"注射\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:43:59',15),(138,'接种方法信息',1,'com.autumn.project.vaccines.controller.VaccinationMethodInfoController.add()','POST',1,'admin','研发部门','/vaccines/vaccinationMethodInfo','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 14:44:49\",\"id\":2,\"params\":{},\"remark\":\"22\",\"state\":\"0\",\"vaccinationMethodCode\":\"oral_administration\",\"vaccinationMethodName\":\"口服\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:44:49',10),(139,'接种方法信息',5,'com.autumn.project.vaccines.controller.VaccinationMethodInfoController.export()','POST',1,'admin','研发部门','/vaccines/vaccinationMethodInfo/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-01-23 06:45:13',825),(140,'接种方法信息',5,'com.autumn.project.vaccines.controller.VaccinationMethodInfoController.export()','POST',1,'admin','研发部门','/vaccines/vaccinationMethodInfo/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-01-23 06:46:55',45),(141,'菜单管理',2,'com.autumn.project.system.controller.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"vaccines/vaccinationMethodInfo/index\",\"createTime\":\"2024-01-23 06:28:32\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"接种方法信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"vaccinationMethodInfo\",\"perms\":\"vaccines:vaccinationMethodInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:47:48',30),(142,'代码生成',2,'com.autumn.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vaccinesInfo\",\"className\":\"VaccinesInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":116,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:27:45\",\"usableColumn\":false},{\"capJavaField\":\"VaccinesName\",\"columnComment\":\"疫苗名称\",\"columnId\":117,\"columnName\":\"vaccines_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vaccinesName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:27:45\",\"usableColumn\":false},{\"capJavaField\":\"VaccinesCode\",\"columnComment\":\"疫苗标识\",\"columnId\":118,\"columnName\":\"vaccines_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vaccinesCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:27:45\",\"usableColumn\":false},{\"capJavaField\":\"VaccinationMethodCode\",\"columnComment\":\"接种方式标识\",\"columnId\":119,\"columnName\":\"vaccination_method_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:49:04',136),(143,'代码生成',8,'com.autumn.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vaccines_info\"}',NULL,0,NULL,'2024-01-23 06:49:08',255),(144,'菜单管理',2,'com.autumn.project.system.controller.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"vaccines/vaccinesInfo/index\",\"createTime\":\"2024-01-23 06:49:42\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1068,\"menuName\":\"疫苗信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"vaccinesInfo\",\"perms\":\"vaccines:vaccinesInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 06:56:28',32),(145,'疫苗信息',1,'com.autumn.project.vaccines.controller.VaccinesInfoController.add()','POST',1,'admin','研发部门','/vaccines/vaccinesInfo','127.0.0.1','内网IP','{\"ageMax\":20,\"ageMin\":1,\"createTime\":\"2024-01-23 15:00:25\",\"id\":1,\"params\":{},\"remark\":\"1\",\"state\":\"0\",\"vaccinationMethodCode\":\"0\",\"vaccinesCode\":\"yg1\",\"vaccinesName\":\"乙肝疫苗（第一挤）\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:00:25',27),(146,'疫苗信息',2,'com.autumn.project.vaccines.controller.VaccinesInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/vaccinesInfo','127.0.0.1','内网IP','{\"ageMax\":20,\"ageMin\":1,\"createBy\":\"\",\"createTime\":\"2024-01-23 15:00:25\",\"id\":1,\"params\":{},\"remark\":\"1\",\"state\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2024-01-23 15:02:56\",\"vaccinationMethodCode\":\"0\",\"vaccinesCode\":\"yg1\",\"vaccinesName\":\"乙肝疫苗（第一剂）\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:02:56',12),(147,'疫苗信息',1,'com.autumn.project.vaccines.controller.VaccinesInfoController.add()','POST',1,'admin','研发部门','/vaccines/vaccinesInfo','127.0.0.1','内网IP','{\"ageMax\":50,\"ageMin\":30,\"createBy\":\"admin\",\"createTime\":\"2024-01-23 15:03:12\",\"id\":2,\"params\":{},\"remark\":\"2\",\"state\":\"0\",\"vaccinationMethodCode\":\"0\",\"vaccinesCode\":\"yg2\",\"vaccinesName\":\"乙肝疫苗（第二剂）\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:03:12',10),(148,'代码生成',2,'com.autumn.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"userFillInfo\",\"className\":\"UserFillInfo\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":69,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:26:17\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":70,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:26:17\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"家长姓名\",\"columnId\":71,\"columnName\":\"user_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-01-23 06:26:17\",\"usableColumn\":false},{\"capJavaField\":\"UserSex\",\"columnComment\":\"家长性别\",\"columnId\":72,\"columnName\":\"user_sex\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-23 06:15:33\",\"dictType\":\"sys_user_sex\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"in','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:06:13',155),(149,'代码生成',8,'com.autumn.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"user_fill_info\"}',NULL,0,NULL,'2024-01-23 07:06:16',315),(150,'菜单管理',2,'com.autumn.project.system.controller.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"vaccines/userFillInfo/index\",\"createTime\":\"2024-01-23 07:06:53\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1074,\"menuName\":\"用户填报信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"userFillInfo\",\"perms\":\"vaccines:userFillInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:09:20',29),(151,'字典类型',1,'com.autumn.project.system.controller.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"用户填报信息状态\",\"dictType\":\"user_fill_state\",\"params\":{},\"remark\":\"用户填报信息表\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:33:18',20),(152,'字典数据',1,'com.autumn.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"用户草稿\",\"dictSort\":1,\"dictType\":\"user_fill_state\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:33:38',15),(153,'字典数据',1,'com.autumn.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"用户推送\",\"dictSort\":2,\"dictType\":\"user_fill_state\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:33:50',11),(154,'字典数据',1,'com.autumn.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"系统选择\",\"dictSort\":3,\"dictType\":\"user_fill_state\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:34:09',12),(155,'字典数据',1,'com.autumn.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"管理员审核\",\"dictSort\":4,\"dictType\":\"user_fill_state\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:34:23',11),(156,'字典数据',1,'com.autumn.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"用户已读\",\"dictSort\":5,\"dictType\":\"user_fill_state\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:34:32',12),(157,'用户填报信息',1,'com.autumn.project.vaccines.controller.UserFillInfoController.add()','POST',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createTime\":\"2024-01-23 15:47:43\",\"params\":{},\"score\":\"0\",\"takeCare\":\"<p>1</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\autumn\\Documents\\GitHub\\zmx_system\\target\\classes\\mybatis\\vaccines\\UserFillInfoMapper.xml]\r\n### The error may involve com.autumn.project.vaccines.mapper.UserFillInfoMapper.insertUserFillInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_fill_info          ( user_name,             user_sex,             children_name,             children_sex,             children_birthday,             today,             children_allergy,             user_phone,             address,             take_care,             score,                                                    create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2024-01-23 07:47:43',138),(158,'用户填报信息',1,'com.autumn.project.vaccines.controller.UserFillInfoController.add()','POST',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createTime\":\"2024-01-23 15:47:51\",\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"3\",\"takeCare\":\"<p>1</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\autumn\\Documents\\GitHub\\zmx_system\\target\\classes\\mybatis\\vaccines\\UserFillInfoMapper.xml]\r\n### The error may involve com.autumn.project.vaccines.mapper.UserFillInfoMapper.insertUserFillInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_fill_info          ( user_name,             user_sex,             children_name,             children_sex,             children_birthday,             today,             children_allergy,             user_phone,             address,             take_care,             score,             opinions,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value','2024-01-23 07:47:51',9),(159,'用户填报信息',1,'com.autumn.project.vaccines.controller.UserFillInfoController.add()','POST',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createTime\":\"2024-01-23 15:49:05\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"3\",\"takeCare\":\"<p>1</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:49:05',15),(160,'用户填报信息',2,'com.autumn.project.vaccines.controller.UserFillInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-23 15:49:06\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"2\",\"takeCare\":\"<p>1</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 07:49:16',6),(161,'用户填报信息',2,'com.autumn.project.vaccines.controller.UserFillInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-23 15:49:06\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"3\",\"takeCare\":\"<p>1</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:18:20',7),(162,'用户填报信息',2,'com.autumn.project.vaccines.controller.UserFillInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-23 15:49:06\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"5\",\"takeCare\":\"<p>1</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:18:27',6),(163,'用户填报信息',2,'com.autumn.project.vaccines.controller.UserFillInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-23 15:49:06\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"5\",\"takeCare\":\"<p><img src=\\\"/dev-api/profile/upload/2024/01/23/111_20240123162605A001.jpg\\\">1</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:26:07',7),(164,'用户填报信息',2,'com.autumn.project.vaccines.controller.UserFillInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-23 15:49:06\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"5\",\"takeCare\":\"<p><img src=\\\"/dev-api/profile/upload/2024/01/23/111_20240123162605A001.jpg\\\"></p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:26:36',8),(165,'角色管理',2,'com.autumn.project.system.controller.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-15 05:14:46\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1061,1035,1074,1075,1076,1077,1078,1079],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:32:47',55),(166,'用户填报信息',2,'com.autumn.project.vaccines.controller.UserFillInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-23 15:49:06\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"2\",\"takeCare\":\"<p><img src=\\\"/dev-api/profile/upload/2024/01/23/111_20240123162605A001.jpg\\\"></p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:35:16',6),(167,'用户填报信息',2,'com.autumn.project.vaccines.controller.UserFillInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-23 15:49:06\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"2\",\"takeCare\":\"<p>123</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:41:04',6),(168,'用户填报信息',2,'com.autumn.project.vaccines.controller.UserFillInfoController.edit()','PUT',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"1\",\"childrenAllergy\":\"1\",\"childrenBirthday\":\"2024-01-03\",\"childrenName\":\"1\",\"childrenSex\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-23 15:49:06\",\"id\":1,\"opinions\":\"<p>1</p>\",\"params\":{},\"score\":\"3\",\"takeCare\":\"<p>123</p>\",\"today\":\"2024-01-23\",\"userName\":\"1\",\"userPhone\":\"1\",\"userSex\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:44:22',31),(169,'用户填报信息',5,'com.autumn.project.vaccines.controller.UserFillInfoController.export()','POST',1,'admin','研发部门','/vaccines/userFillInfo/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-01-23 08:45:00',512),(170,'用户填报信息',1,'com.autumn.project.vaccines.controller.UserFillInfoController.add()','POST',1,'admin','研发部门','/vaccines/userFillInfo','127.0.0.1','内网IP','{\"address\":\"2\",\"childrenAllergy\":\"2\",\"childrenBirthday\":\"2024-01-09\",\"childrenName\":\"2\",\"childrenSex\":\"1\",\"createTime\":\"2024-01-23 16:45:59\",\"id\":2,\"params\":{},\"score\":\"0\",\"takeCare\":\"<p>2</p>\",\"today\":\"2024-01-23\",\"userName\":\"2\",\"userPhone\":\"2\",\"userSex\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-23 08:45:59',28),(171,'用户填报信息',5,'com.autumn.project.vaccines.controller.UserFillInfoController.export()','POST',1,'admin','研发部门','/vaccines/userFillInfo/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-01-23 08:46:10',73),(172,'疫苗信息',5,'com.autumn.project.vaccines.controller.VaccinesInfoController.export()','POST',1,'admin','研发部门','/vaccines/vaccinesInfo/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-01-23 08:47:10',44),(173,'接种方法信息',5,'com.autumn.project.vaccines.controller.VaccinationMethodInfoController.export()','POST',1,'admin','研发部门','/vaccines/vaccinationMethodInfo/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-01-23 08:47:24',39);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-01-15 05:14:46','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-01-15 05:14:46','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-01-15 05:14:46','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-01-15 05:14:46','admin','2024-01-23 08:32:47','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,107),(2,1035),(2,1061),(2,1074),(2,1075),(2,1076),(2,1077),(2,1078),(2,1079);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','autumn','00','','','1','/profile/avatar/2024/01/17/111_20240117114150A001.jpg','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-01-23 16:34:24','admin','2024-01-15 05:14:46','','2024-01-23 08:34:24','管理员'),(2,NULL,'user1','user1','00','','','0','','$2a$10$/WVMHh6iIdu1bDtlGtajV.8kGDrj/xuUzvF4XWxwT59F3PLbb2s96','0','0','127.0.0.1','2024-01-23 16:33:36','','2024-01-23 08:33:20','','2024-01-23 08:33:36',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fill_info`
--

DROP TABLE IF EXISTS `user_fill_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_fill_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家长姓名',
  `user_sex` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家长性别',
  `children_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '孩子姓名',
  `children_sex` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '孩子性别',
  `children_birthday` date DEFAULT NULL COMMENT '孩子出生日期',
  `today` date DEFAULT NULL COMMENT '填报日期',
  `children_allergy` text COLLATE utf8mb4_unicode_ci COMMENT '孩子过敏事项',
  `user_phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '家长手机号码',
  `address` text COLLATE utf8mb4_unicode_ci COMMENT '家庭住址',
  `take_care` text COLLATE utf8mb4_unicode_ci COMMENT '注意事项',
  `score` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评分',
  `opinions` text COLLATE utf8mb4_unicode_ci COMMENT '意见建议',
  `state` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态(1用户草稿，2用户推送，3系统选择，4管理员审核，5用户已读)',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ext1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段1',
  `ext2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段2',
  `ext3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段3',
  `ext4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段4',
  `ext5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段5',
  `ext6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段6',
  `ext7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段7',
  `ext8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段8',
  `ext9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段9',
  `ext10` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户填报信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fill_info`
--

LOCK TABLES `user_fill_info` WRITE;
/*!40000 ALTER TABLE `user_fill_info` DISABLE KEYS */;
INSERT INTO `user_fill_info` VALUES (1,NULL,'1','0','1','0','2024-01-03','2024-01-23','1','1','1','<p>123</p>','3','<p>1</p>',NULL,'','2024-01-23 15:49:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,'2','1','2','1','2024-01-09','2024-01-23','2','2','2','<p>2</p>','0',NULL,NULL,'','2024-01-23 16:46:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_fill_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccination_method_info`
--

DROP TABLE IF EXISTS `vaccination_method_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaccination_method_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vaccination_method_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接种方式名称',
  `vaccination_method_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接种方式标识',
  `state` char(5) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ext1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段1',
  `ext2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段2',
  `ext3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段3',
  `ext4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段4',
  `ext5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段5',
  `ext6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段6',
  `ext7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段7',
  `ext8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段8',
  `ext9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段9',
  `ext10` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='接种方法信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccination_method_info`
--

LOCK TABLES `vaccination_method_info` WRITE;
/*!40000 ALTER TABLE `vaccination_method_info` DISABLE KEYS */;
INSERT INTO `vaccination_method_info` VALUES (1,'注射','injection','0','admin','2024-01-23 14:41:13','admin','2024-01-23 14:44:00','11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'口服','oral_administration','0','admin','2024-01-23 14:44:49','',NULL,'22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vaccination_method_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccines_info`
--

DROP TABLE IF EXISTS `vaccines_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vaccines_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vaccines_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '疫苗名称',
  `vaccines_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '疫苗标识',
  `vaccination_method_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接种方式标识',
  `age_min` int(11) DEFAULT NULL COMMENT '最小年龄(天)',
  `age_max` int(11) DEFAULT NULL COMMENT '最大年龄(天)',
  `state` char(5) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ext1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段1',
  `ext2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段2',
  `ext3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段3',
  `ext4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段4',
  `ext5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段5',
  `ext6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段6',
  `ext7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段7',
  `ext8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段8',
  `ext9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段9',
  `ext10` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='疫苗信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccines_info`
--

LOCK TABLES `vaccines_info` WRITE;
/*!40000 ALTER TABLE `vaccines_info` DISABLE KEYS */;
INSERT INTO `vaccines_info` VALUES (1,'乙肝疫苗（第一剂）','yg1','0',1,20,'0','admin','2024-01-23 15:00:25','admin','2024-01-23 15:02:57','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'乙肝疫苗（第二剂）','yg2','0',30,50,'0','admin','2024-01-23 15:03:13','',NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vaccines_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-23 16:48:58
