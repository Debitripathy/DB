CREATE DATABASE IF NOT EXISTS `CORE`;
 

#==============================================
# USE THE SCHEMA BEFORE RUNNING THE SCRIPT
#==============================================
USE CORE;

#==============================================
# TABLE CREATION SCRIPT STARTS FROM HERE 
#==============================================


SELECT '=============================TABL CREATION STARTED=============================' AS '';

CREATE TABLE IF NOT EXISTS `CORE`.`FUNCTION_T` (
  `FUN_CODE` VARCHAR(6) NOT NULL COMMENT 'THIS IS THE FUNCTION CODE WHICH IS RELATED TO A SCREEN',
  `FUN_NAME` VARCHAR(20)   NOT NULL COMMENT 'THIS IS THE FUNCTION NAME( THE SCREEN NAME)',
  `FUN_DESC` VARCHAR(50) NOT NULL COMMENT 'FUNCTION DESCCRIPTION',
  `FUN_SEL` VARCHAR(1) NOT NULL COMMENT 'IS SELECT AVAILAVBE FOR THIS FUNCTION',
  `FUN_INS` VARCHAR(1) NOT NULL COMMENT 'IS INSERT AVAILAVBE FOR THIS FUNCTION',
  `FUN_UPD` VARCHAR(1) NOT NULL COMMENT 'IS UPDATE AVAILAVBE FOR THIS FUNCTION',
  `FUN_DEL` VARCHAR(1) NOT NULL COMMENT 'IS DELETE AVAILAVBE FOR THIS FUNCTION',
  `FUN_TYPE` VARCHAR(2) NOT NULL COMMENT 'THIS HOLDS THE TYPE OF SCREEN',
  `FUN_ACTIVE` VARCHAR(2) NOT NULL DEFAULT 'A' COMMENT 'IS THIS FUNCTION IS ACTIVE OR INACTIVE',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
   PRIMARY KEY (`FUN_CODE`)  );
   
SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR FUNCTION_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'FUNCTION_T' LIMIT 1);
  
  

 CREATE TABLE IF NOT EXISTS `CORE`.`ALL_TEXT_T` (
  `TXT_ID` INT NOT NULL COMMENT 'A SEQUESCE GENERATED NUMBER',
  `TXT_LABEL` VARCHAR(50) NOT NULL COMMENT 'THE DESCRIPTION/LABLE  FOR THE ID',
  `TXT_LANG` VARCHAR(6) NOT NULL COMMENT 'THE LANGUAGE SUPPORTED',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
  `TXT_REASON` VARCHAR(200) NOT NULL COMMENT 'REASON BEHIND THIS',
  PRIMARY KEY (`TXT_ID`)  );

SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR ALL_TEXT_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'ALL_TEXT_T' LIMIT 1);


CREATE  TABLE  IF NOT EXISTS  `CORE`.`LABLE_T` (
  `L_ID` INT NOT NULL  COMMENT 'THIS IS THE SAME IS NUMBER FROM THE ALL_TEXT_T  FOR THE LABLE',
  `L_JSP_CODE` VARCHAR(20) NOT NULL COMMENT 'jsp field name',
  #`L_DESCRIPTION` VARCHAR(200) NOT NULL COMMENT 'LABLE TO SEE IN SCREEN',
  `L_TYPE` VARCHAR(10) NOT NULL COMMENT 'DIFFERENT TYPES LIKE FIELD_LABLE(FL), HEADER(HL), BUTTON_LABLE(BL), PAGE_NAME(PL)',
  `L_FUNC_CODE` VARCHAR(10) NOT NULL   COMMENT 'WHICH FUNCTION IS RELATED TO THIS LABLE',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
  PRIMARY KEY (`L_ID`,`L_JSP_CODE`,`L_FUNC_CODE`)  );
 
 SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR LABLE_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'LABLE_T' LIMIT 1);



  CREATE TABLE IF NOT EXISTS `CORE`.`DBFIELD_T` (
  `DBF_ID` INT NOT NULL COMMENT 'A SEQUESCE GENERATED NUMBER',
  `DBF_FIELD_VALUE` VARCHAR(2000) NOT NULL COMMENT 'THE TABLE COLUMN  NAME OR ANY FUNCTION ',
  `DBF_FIELD_DESC` VARCHAR(100) NOT NULL COMMENT 'WHAT IS THE PURPOSE FOR THIS ',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
  PRIMARY KEY (`DBF_ID`)  );
  
  SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR DBFIELD_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'DBFIELD_T' LIMIT 1);

  
 CREATE TABLE IF NOT EXISTS `CORE`.`GRID_T` (
  `GRID_FUN_CODE` VARCHAR(10) NOT NULL COMMENT ' FUNCTION NAME',
  `GRID_QUERY` VARCHAR(2000) NOT NULL COMMENT ' THE BASE QUERY FOR THE FUNCTION',
  `GRID_KEY` VARCHAR(500) NOT NULL COMMENT ' KEY FIELDS  USED FOR FETCHING QUERY, E.G. PRIMARY KEY',
  `GRID_ALL_FIELDS` VARCHAR(1000) NOT NULL COMMENT ' ALL THE FIELDS A GRID NEED TO USE FOR QUERY',
  `GRID_FIELDS` VARCHAR(1000) NOT NULL COMMENT ' THOSE FIELDS SHOWING IN THE GRID IN THE SCREEN',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
 PRIMARY KEY (`GRID_FUN_CODE`)  );
 
  SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR GRID_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'GRID_T' LIMIT 1);


 CREATE TABLE IF NOT EXISTS `CORE`.`USER_GRID` (
  `UGRID_FUN_CODE` VARCHAR(10) NOT NULL COMMENT ' FUNCTION NAME',
  `UGRID_USER` VARCHAR(20) NOT NULL COMMENT ' user code ',
  `UGRID_FIELDS` VARCHAR(1000) NOT NULL COMMENT ' THOSE FIELDS SHOWING IN THE GRID IN THE SCREEN',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
 PRIMARY KEY (`UGRID_FUN_CODE`,`UGRID_USER`)  );

  SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR USER_GRID ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'USER_GRID' LIMIT 1);



   CREATE TABLE IF NOT EXISTS `CORE`.`DBFIELD_MAPPING_T` (
  `DBFM_FUN` VARCHAR(6) NOT NULL COMMENT 'THE SCREEN CODE ',
  `DBFM_FIELD_ID` INT  NOT NULL COMMENT 'THE DB COLUMN ID',
  `DBFM_JSP_CODE` VARCHAR(20)  NOT NULL COMMENT 'THE LABEL_ID DISPLAYED IN THE GRID ON THE SCREEN',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
   PRIMARY KEY (`DBFM_FUN`,`DBFM_FIELD_ID`,`DBFM_JSP_CODE`)  );
   
 SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR DBFIELD_MAPPING_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'DBFIELD_MAPPING_T' LIMIT 1);


  CREATE TABLE IF NOT EXISTS `CORE`.`PAGE_DISPLAY_T` (
  `PD_FUN_CODE` VARCHAR(6) NOT NULL COMMENT 'PAGE FUNCTION NAME',
  `PD_JSP_CODE` VARCHAR(20)  NOT NULL COMMENT 'The JSP field name',
  `PD_SHOW` VARCHAR(2) NOT NULL COMMENT 'FIELD WILL VISIBLE OR HIDDEN . FOR VISIBLE "V" AND FOR HIDDEN "H"',
  `PD_DISPLAY` VARCHAR(2) NOT NULL COMMENT '',
  `PD_TYPE` VARCHAR(2) NOT NULL COMMENT 'Which type of field this is . i.e. text/textarea/button/checkbox/dropdown',
  `PD_BLOCK` INT NOT NULL COMMENT ' BLOCK NUMBER FOR THE CONTAINER',
  `PD_CONT` VARCHAR(10) NOT NULL COMMENT ' CONTAINER OR SECTION  INSIDE THE BLOCK  WHICH HOLD FIELDS',
  `PD_GRP` INT NOT NULL COMMENT 'GROUP NUMBER INSIDE  THE CONTAINER',
  `PD_POS` INT NOT NULL COMMENT 'FIELD POSITION IN A GROUP',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
  #`TXT_REASON` VARCHAR(50) NOT NULL COMMENT 'REASON BEHIND THIS',
  PRIMARY KEY (`PD_FUN_CODE`, `PD_JSP_CODE`)  );
  
  SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR PAGE_DISPLAY_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'PAGE_DISPLAY_T' LIMIT 1);

	
CREATE TABLE IF NOT EXISTS `CORE`.`USER_T` (
  `USR_CODE` VARCHAR(20) NOT NULL ,
  `USR_PASSWD` VARCHAR(50) NOT NULL ,
  `USR_PASSWD_EXPIR` DATETIME NOT NULL COMMENT 'WHEN THE PASSWORD EXPIRE',
  `USR_BLOCKED` VARCHAR(2) NULL DEFAULT 'N' COMMENT 'IS THE USER LOCKED',
  `USR_WRONG_HIT` INT NULL DEFAULT 0 COMMENT 'HOW MANY TIME THE USER HITS THE WRONG PASSWORD. CLEAR AFTER  SUCCESSFUL LOGIN',
  `USR_F_NAME` VARCHAR(50) NULL ,
  `USR_L_NAME` VARCHAR(50) NULL ,
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
  PRIMARY KEY (`USR_CODE`)  );
  
SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR USER_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'USER_T' LIMIT 1);
  

  

  
  CREATE TABLE IF NOT EXISTS `CORE`.`GROUP_T` (
  `GRP_CODE` VARCHAR(20) NOT NULL COMMENT 'GROUP/ROLE CODE',
  `GRP_NAME` VARCHAR(50)   NOT NULL COMMENT 'GROUP/ROLE  NAME',
  `GRP_DESC` VARCHAR(50) NOT NULL COMMENT 'GROUP/ROLE DESCRIPTION',
  `GRP_ACTIVE` VARCHAR(1) NOT NULL COMMENT 'STATUS ACTIVE="A" PASSIVE="P"',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
   PRIMARY KEY (`GRP_CODE`)  );
 
 SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR GROUP_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'GROUP_T' LIMIT 1);


 CREATE TABLE IF NOT EXISTS `CORE`.`USER_DETAILS_T` (
  `UD_CODE` VARCHAR(20) NOT NULL COMMENT 'USER CODE',
  `UD_F_NAME` VARCHAR(20)   NOT NULL COMMENT 'FIRST NAME',
  `UD_L_NAME` VARCHAR(20)   NOT NULL COMMENT 'LAST NAME',
  `UD_MOB` VARCHAR(10)   NOT NULL COMMENT 'MOBILE',
  `UD_STATUS` VARCHAR(1)   NOT NULL COMMENT 'USER IS ACTIVE OR INACTIVE',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
   PRIMARY KEY (`UD_CODE`)  ); 
  
  SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR USER_DETAILS_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'USER_DETAILS_T' LIMIT 1);



  
 CREATE TABLE IF NOT EXISTS `CORE`.`USER_PAGE_DISPLAY_T` (
  `UPD_FUN_CODE` VARCHAR(6) NOT NULL COMMENT 'PAGE FUNCTION NAME',
  `UPD_USR_CODE` VARCHAR(20)  NOT NULL COMMENT 'User name who modified the Default label',
  `UPD_JSP_CODE` VARCHAR(20)  NOT NULL COMMENT 'jsp field name',
  `UPD_MOD_LABEL` VARCHAR(50)  NOT NULL COMMENT 'Modified label by the User',
  `UPD_SHOW` VARCHAR(2) NOT NULL COMMENT 'FIELD WILL VISIBLE OR HIDDEN . FOR VISIBLE "V" AND FOR HIDDEN "H"',
  `UPD_DISPLAY` VARCHAR(2) NOT NULL COMMENT 'FIELD IS REQUIRED OR OPTIONAL .',
  `UPD_TYPE` VARCHAR(2) NOT NULL COMMENT 'Which type of field this is . i.e. text/textarea/button/checkbox/dropdown',
  `UPD_BLOCK` INT NOT NULL COMMENT ' BLOCK NUMBER FOR THE CONTAINER',
  `UPD_CONT` VARCHAR(10) NOT NULL COMMENT ' CONTAINER OR SECTION  INSIDE THE BLOCK  WHICH HOLD FIELDS',
  `UPD_GRP` INT NOT NULL COMMENT 'GROUP NUMBER INSIDE  THE CONTAINER',
  `UPD_POS` INT NOT NULL COMMENT 'FIELD POSITION IN A GROUP',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
  `TXT_REASON` VARCHAR(50) NOT NULL COMMENT 'REASON BEHIND THIS',
  PRIMARY KEY (`UPD_FUN_CODE`, `UPD_JSP_CODE`, `UPD_USR_CODE`)  );
  
  SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR USER_PAGE_DISPLAY_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'USER_PAGE_DISPLAY_T' LIMIT 1);
  
  
  CREATE TABLE IF NOT EXISTS `CORE`.`USER_GROUP_T` (
  `UG_CODE` VARCHAR(20) NOT NULL COMMENT 'USER GROUP CODE',
  `UG_USR` VARCHAR(20)   NOT NULL COMMENT 'USER CODE RELATED TO GROUP',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
   PRIMARY KEY (`UG_CODE`,`UG_USR` )  );
  
  SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR USER_GROUP_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'USER_GROUP_T' LIMIT 1);
  
 CREATE TABLE IF NOT EXISTS `CORE`.`FUNC_GRP_PERM_T` (
  `FGP_FUN_CODE` VARCHAR(6) NOT NULL COMMENT 'THIS IS THE FUNCTION CODE WHICH IS RELATED TO A SCREEN',
  `FGP_GRP_CODE` VARCHAR(20)   NOT NULL COMMENT 'THIS IS THE FUNCTION NAME( THE SCREEN NAME)',
  `FGP_FUN_SEL` VARCHAR(1) NOT NULL COMMENT 'IS SELECT AVAILAVBE FOR THIS FUNCTION',
  `FGP_FUN_INS` VARCHAR(1) NOT NULL COMMENT 'IS INSERT AVAILAVBE FOR THIS FUNCTION',
  `FGP_FUN_UPD` VARCHAR(1) NOT NULL COMMENT 'IS UPDATE AVAILAVBE FOR THIS FUNCTION',
  `FGP_FUN_DEL` VARCHAR(1) NOT NULL COMMENT 'IS DELETE AVAILAVBE FOR THIS FUNCTION',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
   PRIMARY KEY (`FGP_FUN_CODE`,`FGP_GRP_CODE`)  );
   
  SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR FUNC_GRP_PERM_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'FUNC_GRP_PERM_T' LIMIT 1);
 
CREATE TABLE IF NOT EXISTS `CORE`.`FUN_GRP_USR_PERM_T` (
  `FGUP_USER_CODE` VARCHAR(20) NOT NULL COMMENT 'USER CODE ',
  `FGUP_GRP_CODE` VARCHAR(20)   NOT NULL COMMENT 'GROUP CODE ',
  `FGUP_FUN_CODE` VARCHAR(6)   NOT NULL COMMENT 'FUNCTION CODE',
  `FGP_FUN_SEL` VARCHAR(1) NOT NULL COMMENT 'IS SELECT AVAILAVBE FOR THIS FUNCTIONPERMISSION FOR THE USER  FOR THE  SELECT PERMISSION OF THE FUCTION IF THE GROUP HAVE THE PERMISSION',
  `FGP_FUN_INS` VARCHAR(1) NOT NULL COMMENT 'PERMISSION FOR THE USER  FOR THE  INSERT PERMISSION OF THE FUCTION  IF THE GROUP HAVE THE PERMISSION',
  `FGP_FUN_UPD` VARCHAR(1) NOT NULL COMMENT 'PERMISSION FOR THE USER  FOR THE  UPDATE PERMISSION OF THE FUCTION  IF THE GROUP HAVE THE PERMISSION',
  `FGP_FUN_DEL` VARCHAR(1) NOT NULL COMMENT 'PERMISSION FOR THE USER  FOR THE  DELETE PERMISSION OF THE FUCTION  IF THE GROUP HAVE THE PERMISSION',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED_ON` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
   PRIMARY KEY (`FGUP_USER_CODE`,`FGUP_GRP_CODE`,`FGUP_FUN_CODE`));

SELECT (SELECT '####### ERROR: TABLE CREATION FAILED FOR FUN_GRP_USR_PERM_T ' AS '') FROM DUAL 
WHERE NOT EXISTS (SELECT 1  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'CORE' AND TABLE_NAME = 'FUN_GRP_USR_PERM_T' LIMIT 1);		

	
 SELECT '===========================TABLE CREATION COMPLETED===========================' AS ''; 
 #==============================================
 # ADD  CONSTRAINT TO THE TABLES
 #==============================================
SELECT '============================START RUNNING CONSTRAINT PART============================' AS '';

ALTER TABLE `core`.`lable_t` ADD INDEX `L_JSP_CODE` (`L_JSP_CODE` ASC);
ALTER TABLE `CORE`.`LABLE_T` ADD CONSTRAINT `L_FUNC_CODE`   FOREIGN KEY (`L_FUNC_CODE`)   REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`LABLE_T` ADD CONSTRAINT `L_ID`   FOREIGN KEY (`L_ID`)   REFERENCES `CORE`.`ALL_TEXT_T` (`TXT_ID`);
ALTER TABLE `CORE`.`PAGE_DISPLAY_T` ADD CONSTRAINT `PD_FUN_CODE`  FOREIGN KEY (`PD_FUN_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`PAGE_DISPLAY_T` ADD CONSTRAINT `PD_JSP_CODE`  FOREIGN KEY (`PD_JSP_CODE`) REFERENCES `CORE`.`LABLE_T` (`L_JSP_CODE`);
ALTER TABLE `CORE`.`GRID_T` ADD CONSTRAINT `GRID_FUN_CODE`  FOREIGN KEY (`GRID_FUN_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`USER_GRID` ADD CONSTRAINT `UGRID_FUN_CODE`  FOREIGN KEY (`UGRID_FUN_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`USER_GRID` ADD CONSTRAINT `UGRID_USER`  FOREIGN KEY (`UGRID_USER`)  REFERENCES `CORE`.`USER_T` (`USR_CODE`);
ALTER TABLE `CORE`.`DBFIELD_MAPPING_T` ADD CONSTRAINT `DBFM_FUN`  FOREIGN KEY (`DBFM_FUN`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`DBFIELD_MAPPING_T` ADD CONSTRAINT `DBFM_FIELD_ID`  FOREIGN KEY (`DBFM_FIELD_ID`)  REFERENCES `CORE`.`DBFIELD_T` (`DBF_ID`);
ALTER TABLE `CORE`.`DBFIELD_MAPPING_T` ADD CONSTRAINT `DBFM_JSP_CODE`  FOREIGN KEY (`DBFM_JSP_CODE`)  REFERENCES `CORE`.`LABLE_T` (`L_JSP_CODE`);
ALTER TABLE `CORE`.`USER_PAGE_DISPLAY_T` ADD CONSTRAINT `UPD_FUN_CODE`  FOREIGN KEY (`UPD_FUN_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`USER_PAGE_DISPLAY_T` ADD CONSTRAINT `UPD_JSP_CODE`  FOREIGN KEY (`UPD_JSP_CODE`)  REFERENCES `CORE`.`LABLE_T` (`L_JSP_CODE`);
ALTER TABLE `CORE`.`USER_PAGE_DISPLAY_T` ADD CONSTRAINT `UPD_USR_CODE` FOREIGN KEY (`UPD_USR_CODE`)  REFERENCES `CORE`.`USER_T` (`USR_CODE`);
ALTER TABLE `CORE`.`USER_GROUP_T` ADD CONSTRAINT `UG_USR`  FOREIGN KEY (`UG_USR`)  REFERENCES `CORE`.`USER_T` (`USR_CODE`);
ALTER TABLE `CORE`.`FUN_GRP_USR_PERM_T` ADD CONSTRAINT `FGUP_USER_CODE`  FOREIGN KEY (`FGUP_USER_CODE`)  REFERENCES `CORE`.`USER_T` (`USR_CODE`);
ALTER TABLE `CORE`.`FUN_GRP_USR_PERM_T` ADD CONSTRAINT `FGUP_GRP_CODE`  FOREIGN KEY (`FGUP_GRP_CODE`)  REFERENCES `CORE`.`GROUP_T` (`GRP_CODE`);
ALTER TABLE `CORE`.`FUN_GRP_USR_PERM_T` ADD CONSTRAINT `FGUP_FUN_CODE`  FOREIGN KEY (`FGUP_FUN_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);


SELECT '============================END RUNNING CONSTRAINT PART============================' AS '';
   

