CREATE DATABASE IF NOT EXISTS `core`;
 

#==============================================
# Use the schema before running the script
#==============================================
USE core;

#==============================================
# Table creation script starts from here 
#==============================================


select '=============================Tabl Creation Started=============================' AS '';


	
CREATE TABLE IF NOT EXISTS `core`.`USER_T` (
  `USR_CODE` VARCHAR(20) NOT NULL ,
  `USR_PASSWD` VARCHAR(50) NOT NULL ,
  `USR_PASSWD_EXPIR` DATETIME NOT NULL COMMENT 'When the password expire',
  `USR_BLOCKED` VARCHAR(2) NULL DEFAULT 'N' COMMENT 'Is the user locked',
  `USR_WRONG_HIT` INT NULL DEFAULT 0 COMMENT 'How many time the user hits the wrong password. clear after  successful login',
  `USR_F_NAME` VARCHAR(50) NULL ,
  `USR_L_NAME` VARCHAR(50) NULL ,
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
  PRIMARY KEY (`USR_CODE`)  );
  
SELECT (select '####### ERROR: Table Creation Failed for USER_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'USER_T' LIMIT 1);
  
 CREATE TABLE IF NOT EXISTS `core`.`TEXT_T` (
  `TXT_ID` INT NOT NULL COMMENT 'A sequesce generated number',
  `TXT_DESC` VARCHAR(50) NOT NULL COMMENT 'The Description/Lable  for the id',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
  `TXT_REASON` VARCHAR(50) NOT NULL COMMENT 'Reason behind this',
  PRIMARY KEY (`TXT_ID`)  );

SELECT (select '####### ERROR: Table Creation Failed for TEXT_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'TEXT_T' LIMIT 1);
  
CREATE TABLE IF NOT EXISTS `core`.`FUNCTION_T` (
  `FUN_CODE` VARCHAR(6) NOT NULL COMMENT 'This is the Function code which is related to a screen',
  `FUN_NAME` VARCHAR(20)   NOT NULL COMMENT 'This is the function name( the screen name)',
  `FUN_DESC` VARCHAR(50) NOT NULL COMMENT 'Function Desccription',
  `FUN_SEL` VARCHAR(1) NOT NULL COMMENT 'Is Select availavbe for this Function',
  `FUN_INS` VARCHAR(1) NOT NULL COMMENT 'Is Insert availavbe for this Function',
  `FUN_UPD` VARCHAR(1) NOT NULL COMMENT 'Is Update availavbe for this Function',
  `FUN_DEL` VARCHAR(1) NOT NULL COMMENT 'Is Delete availavbe for this Function',
  `FUN_ACTIVE` VARCHAR(10) NOT NULL COMMENT 'Is this function is Active or Inactive',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
   PRIMARY KEY (`FUN_CODE`)  );
   
SELECT (select '####### ERROR: Table Creation Failed for FUNCTION_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'FUNCTION_T' LIMIT 1);
  
  
  CREATE TABLE IF NOT EXISTS `core`.`GROUP_T` (
  `GRP_CODE` VARCHAR(20) NOT NULL COMMENT 'Group/Role Code',
  `GRP_NAME` VARCHAR(50)   NOT NULL COMMENT 'Group/Role  name',
  `GRP_DESC` VARCHAR(50) NOT NULL COMMENT 'Group/Role Description',
  `GRP_ACTIVE` VARCHAR(1) NOT NULL COMMENT 'Status Active="A" Passive="P"',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
   PRIMARY KEY (`GRP_CODE`)  );
 
 SELECT (select '####### ERROR: Table Creation Failed for GROUP_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'GROUP_T' LIMIT 1);


 CREATE TABLE IF NOT EXISTS `core`.`USER_DETAILS_T` (
  `UD_CODE` VARCHAR(20) NOT NULL COMMENT 'User Code',
  `UD_F_NAME` VARCHAR(20)   NOT NULL COMMENT 'First name',
  `UD_L_NAME` VARCHAR(20)   NOT NULL COMMENT 'Last Name',
  `UD_MOB` VARCHAR(10)   NOT NULL COMMENT 'Mobile',
  `UD_STATUS` VARCHAR(1)   NOT NULL COMMENT 'User is active or inactive',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
   PRIMARY KEY (`UD_CODE`)  ); 
  
  SELECT (select '####### ERROR: Table Creation Failed for USER_DETAILS_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'USER_DETAILS_T' LIMIT 1);


  CREATE TABLE IF NOT EXISTS `CORE`.`DBFIELD_T` (
  `DBF_ID` INT NOT NULL COMMENT 'A sequesce generated number',
  `DBF_FIELD_VALUE` VARCHAR(500) NOT NULL COMMENT 'The Table column  name or any function ',
  `DBF_FIELD_DESC` VARCHAR(100) NOT NULL COMMENT 'What is the purpose for this ',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
  PRIMARY KEY (`DBF_ID`)  );
  
  SELECT (select '####### ERROR: Table Creation Failed for DBFIELD_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'DBFIELD_T' LIMIT 1);

  
 CREATE TABLE IF NOT EXISTS `CORE`.`BASEQUERY_T` (
  `BASE_FUN_CODE` VARCHAR(10) NOT NULL COMMENT ' FUNCTION NAME',
  `BASE_QUERY` VARCHAR(2000) NOT NULL COMMENT ' THE BASE QUERY FOR THE FUNCTION',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
 PRIMARY KEY (`BASE_FUN_CODE`)  );
 
  SELECT (select '####### ERROR: Table Creation Failed for BASEQUERY_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'BASEQUERY_T' LIMIT 1);


CREATE  TABLE  IF NOT EXISTS  `CORE`.`LABLE_T` (
  `L_CODE` int NOT NULL  COMMENT 'This is the same is number from the TEXT_T  for the lable',
  `L_DESCRIPTION` VARCHAR(200) NOT NULL COMMENT 'LABLE TO SEE IN SCREEN',
  `L_TYPE` VARCHAR(10) NOT NULL COMMENT 'DIFFERENT TYPES like Field_Lable, Header, Button_Lable, Page_Name',
  `L_FUNC_CODE` VARCHAR(10) NOT NULL   COMMENT 'Which function is related to this lable',
  `CREATED` DATETIME NOT NULL COMMENT 'WHEN CREATED',
  `CREATEDBY` VARCHAR(10) NOT NULL COMMENT 'USER WHO CREATED',
  `UPDATED` DATETIME NULL COMMENT 'UPDATION TIME',
  `UPDATEDBY` VARCHAR(10) NULL COMMENT 'WHO UPDATED ',
  PRIMARY KEY (`L_CODE`,`L_FUNC_CODE`)  );
 
 SELECT (select '####### ERROR: Table Creation Failed for LABLE_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'LABLE_T' LIMIT 1);


  CREATE TABLE IF NOT EXISTS `core`.`PAGE_DISPLAY_T` (
  `PD_CODE` VARCHAR(6) NOT NULL COMMENT 'Page Function Name',
  `PD_ID` INT  NOT NULL COMMENT 'Field ID to show in the page',
  `PD_SHOW` VARCHAR(2) NOT NULL COMMENT 'Field will visible or Hidden . For Visible "S" and for Hidden "H"',
  `PD_DISPLAY` VARCHAR(2) NOT NULL COMMENT '',
  `PD_TYPE` VARCHAR(2) NOT NULL COMMENT '',
  `PD_CONT` VARCHAR(10) NOT NULL COMMENT '',
  `PD_POS` INT NOT NULL COMMENT '',
  `PD_POS_GRP` INT NOT NULL COMMENT '',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
  `TXT_REASON` VARCHAR(50) NOT NULL COMMENT 'Reason behind this',
  PRIMARY KEY (`PD_CODE`, `PD_ID`)  );
  
  SELECT (select '####### ERROR: Table Creation Failed for PAGE_DISPLAY_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'PAGE_DISPLAY_T' LIMIT 1);
  
  
   CREATE TABLE IF NOT EXISTS `core`.`PAGE_USER_DISPLAY_T` (
  `PUD_CODE` VARCHAR(6) NOT NULL COMMENT 'Page Function Name',
  `PUD_ID` INT  NOT NULL COMMENT 'Field ID to show in the page',
  `PUD_SHOW` VARCHAR(2) NOT NULL COMMENT 'Field will visible or Hidden . For Visible "S" and for Hidden "H"',
  `PUD_DISPLAY` VARCHAR(2) NOT NULL COMMENT '',
  `PUD_TYPE` VARCHAR(2) NOT NULL COMMENT '',
  `PUD_CONT` VARCHAR(10) NOT NULL COMMENT '',
  `PUD_POS` INT NOT NULL COMMENT '',
  `PUD_POS_GRP` INT NOT NULL COMMENT '',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
  `TXT_REASON` VARCHAR(50) NOT NULL COMMENT 'Reason behind this',
  PRIMARY KEY (`PUD_CODE`, `PUD_ID`)  );
  
  SELECT (select '####### ERROR: Table Creation Failed for PAGE_USER_DISPLAY_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'PAGE_USER_DISPLAY_T' LIMIT 1);
  
  
  CREATE TABLE IF NOT EXISTS `core`.`USER_GROUP_T` (
  `UG_CODE` VARCHAR(20) NOT NULL COMMENT 'User Group Code',
  `UG_USR` VARCHAR(20)   NOT NULL COMMENT 'User code related to Group',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
   PRIMARY KEY (`UG_CODE`,`UG_USR` )  );
  
  SELECT (select '####### ERROR: Table Creation Failed for USER_GROUP_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'USER_GROUP_T' LIMIT 1);
  
 CREATE TABLE IF NOT EXISTS `core`.`FUNC_GRP_PERM_T` (
  `FGP_FUN_CODE` VARCHAR(6) NOT NULL COMMENT 'This is the Function code which is related to a screen',
  `FGP_GRP_CODE` VARCHAR(20)   NOT NULL COMMENT 'This is the function name( the screen name)',
  `FGP_FUN_SEL` VARCHAR(1) NOT NULL COMMENT 'Is Select availavbe for this Function',
  `FGP_FUN_INS` VARCHAR(1) NOT NULL COMMENT 'Is Insert availavbe for this Function',
  `FGP_FUN_UPD` VARCHAR(1) NOT NULL COMMENT 'Is Update availavbe for this Function',
  `FGP_FUN_DEL` VARCHAR(1) NOT NULL COMMENT 'Is Delete availavbe for this Function',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
   PRIMARY KEY (`FGP_FUN_CODE`,`FGP_GRP_CODE`)  );
   
  SELECT (select '####### ERROR: Table Creation Failed for FUNC_GRP_PERM_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'FUNC_GRP_PERM_T' LIMIT 1);
 
CREATE TABLE IF NOT EXISTS `core`.`FUN_GRP_USR_PERM_T` (
  `FGUP_USER_CODE` VARCHAR(20) NOT NULL COMMENT 'User Code ',
  `FGUP_GRP_CODE` VARCHAR(20)   NOT NULL COMMENT 'Group Code ',
  `FGUP_FUN_CODE` VARCHAR(6)   NOT NULL COMMENT 'Function Code',
  `FGP_FUN_SEL` VARCHAR(1) NOT NULL COMMENT 'Is Select availavbe for this FunctionPermission for the user  for the  SELECT permission of the FUCTION if the Group have the permission',
  `FGP_FUN_INS` VARCHAR(1) NOT NULL COMMENT 'Permission for the user  for the  INSERT permission of the FUCTION  if the Group have the permission',
  `FGP_FUN_UPD` VARCHAR(1) NOT NULL COMMENT 'Permission for the user  for the  UPDATE permission of the FUCTION  if the Group have the permission',
  `FGP_FUN_DEL` VARCHAR(1) NOT NULL COMMENT 'Permission for the user  for the  DELETE permission of the FUCTION  if the Group have the permission',
  `CREATED_ON` DATETIME NOT NULL COMMENT 'when created',
  `CREATED_BY` VARCHAR(10) NOT NULL COMMENT 'user who created',
  `UPDATED_ON` DATETIME NULL COMMENT 'updation time',
  `UPDATED_BY` VARCHAR(10) NULL COMMENT 'who updated ',
   PRIMARY KEY (`FGUP_USER_CODE`,`FGUP_GRP_CODE`,`FGUP_FUN_CODE`));

SELECT (select '####### ERROR: Table Creation Failed for FUN_GRP_USR_PERM_T ' AS '') FROM dual 
WHERE NOT EXISTS (SELECT 1  FROM information_schema.tables WHERE table_schema = 'core' AND table_name = 'FUN_GRP_USR_PERM_T' LIMIT 1);		

	
 select '===========================Table Creation Completed===========================' AS ''; 
 #==============================================
 # Add  constraint to the tables
 #==============================================
select '============================Start Running Constraint Part============================' AS '';

ALTER TABLE `CORE`.`LABLE_T` ADD CONSTRAINT `L_FUNC_CODE`   FOREIGN KEY (`L_FUNC_CODE`)   REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`LABLE_T` ADD CONSTRAINT `L_CODE`   FOREIGN KEY (`L_CODE`)   REFERENCES `CORE`.`TEXT_T` (`TXT_ID`);
ALTER TABLE `CORE`.`PAGE_DISPLAY_T` ADD CONSTRAINT `PD_CODE`  FOREIGN KEY (`PD_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`PAGE_USER_DISPLAY_T` ADD CONSTRAINT `PUD_CODE`  FOREIGN KEY (`PUD_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`USER_GROUP_T` ADD CONSTRAINT `UG_USR`  FOREIGN KEY (`UG_USR`)  REFERENCES `CORE`.`USER_T` (`USR_CODE`);
ALTER TABLE `CORE`.`BASEQUERY_T` ADD CONSTRAINT `BASE_FUN_CODE`  FOREIGN KEY (`BASE_FUN_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
ALTER TABLE `CORE`.`FUN_GRP_USR_PERM_T` ADD CONSTRAINT `FGUP_USER_CODE`  FOREIGN KEY (`FGUP_USER_CODE`)  REFERENCES `CORE`.`USER_T` (`USR_CODE`);
ALTER TABLE `CORE`.`FUN_GRP_USR_PERM_T` ADD CONSTRAINT `FGUP_GRP_CODE`  FOREIGN KEY (`FGUP_GRP_CODE`)  REFERENCES `CORE`.`GROUP_T` (`GRP_CODE`);
ALTER TABLE `CORE`.`FUN_GRP_USR_PERM_T` ADD CONSTRAINT `FGUP_FUN_CODE`  FOREIGN KEY (`FGUP_FUN_CODE`)  REFERENCES `CORE`.`FUNCTION_T` (`FUN_CODE`);
select '============================End Running Constraint Part============================' AS '';
   

