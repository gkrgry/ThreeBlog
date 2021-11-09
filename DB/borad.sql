CREATE TABLE `blogdb`.`board` (
  `bId` INT NOT NULL , 
  `bTitle` VARCHAR(50) NULL,
  `loginid` VARCHAR(20) NULL,
  `bDate` DATETIME NULL,
  `bContent` VARCHAR(2048) NULL,
  `bAvailable` INT NULL,
  PRIMARY KEY (`bId`));
