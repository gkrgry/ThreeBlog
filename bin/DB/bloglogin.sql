CREATE TABLE `blogdb`.`bloglogin` (
  `blogid` VARCHAR(40) NOT NULL,
  `blogpw` VARCHAR(40) NULL,
  `blogname` VARCHAR(50) NULL,
  `blogemail` VARCHAR(45) NULL,
  `blogsex` VARCHAR(1) NULL,
  PRIMARY KEY (`blogid`));