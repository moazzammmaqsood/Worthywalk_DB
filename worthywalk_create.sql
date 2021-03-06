 CREATE TABLE `users` (
 `Id` int NOT NULL AUTO_INCREMENT,
 `Firstname` varchar(45) NOT NULL,
 `Lastname` varchar(45) NOT NULL,
 `Emailaddress` varchar(45) NOT NULL,
 `Password` varchar(100) NOT NULL,
 `Phoneno` varchar(45) NOT NULL,
 `Address` varchar(45) NOT NULL,
 `Refferalcode` varchar(45) NOT NULL,
`knubs` int NOT NULL,
  `Totalknubs` int NOT NULL,
  `Height` double NOT NULL,
  `Weight` double NOT NULL,
  `Createdon` datetime NOT NULL,
  `Deviceid` varchar(45) DEFAULT NULL,
  `Status` varchar(1) NOT NULL,
  `Authprovider` varchar(45) DEFAULT NULL,
  `Providerid` varchar(45) DEFAULT NULL,
  `Userrole` varchar(1) NOT NULL DEFAULT 'U',
  `Accounttype` varchar(1) NOT NULL DEFAULT 'P',
  PRIMARY KEY (`Id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `walk` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Userid` int NOT NULL,
  `Timestamp` datetime NOT NULL,
  `Knubs` int NOT NULL,
  `Distance` double NOT NULL,
  `Calorie` double NOT NULL,
  `Steps` int NOT NULL,
  `Mode` varchar(1) NOT NULL,
  `Boost` double NOT NULL,
  `Mapcoordinates` json NOT NULL,
  `Errordistance` double NOT NULL,
  `Timespent` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Userid_idx` (`Userid`),
  CONSTRAINT `allwalkuser` FOREIGN KEY (`Userid`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `brands` (
  `Brandid` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Logo` varchar(100) DEFAULT NULL,
  `Status` varchar(1) NOT NULL DEFAULT 'E',
  `Registeredon` datetime NOT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `Facebookpage` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Brandid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `branch` (
  `Branchid` int NOT NULL AUTO_INCREMENT,
  `Brandid` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Passcode` varchar(6) NOT NULL,
  `Manager` varchar(45) NOT NULL,
  `Contactno` varchar(45) DEFAULT NULL,
  `Status` varchar(1) NOT NULL DEFAULT 'E',
  `Createdon` datetime NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Branchid`),
  KEY `Branchbrandfk_idx` (`Brandid`),
  CONSTRAINT `Branchbrandfk` FOREIGN KEY (`Brandid`) REFERENCES `brands` (`Brandid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `deals` (
  `Dealid` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(45) NOT NULL,
  `Dealtype` varchar(1) NOT NULL,
  `KnubsRequired` int NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Rating` double DEFAULT NULL,
  `Branchid` int DEFAULT NULL,
  `Imageurl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Dealid`),
  KEY `branchId_idx` (`Branchid`),
  CONSTRAINT `branchId` FOREIGN KEY (`Branchid`) REFERENCES `branch` (`Branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `orders` (
  `Orderid` int NOT NULL AUTO_INCREMENT,
  `Dealid` int NOT NULL,
  `Userid` int NOT NULL,
  `Status` varchar(1) DEFAULT NULL,
  `Orderedon` date DEFAULT NULL,
  `Servedon` date DEFAULT NULL,
  PRIMARY KEY (`Orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `leaderboard` (
  `Detailid` int NOT NULL AUTO_INCREMENT,
  `Finishesat` date NOT NULL,
  `Note` varchar(1000) DEFAULT NULL,
  `Status` varchar(1) NOT NULL,
  `Brandid` int DEFAULT NULL,
  PRIMARY KEY (`Detailid`),
  KEY `brandfk_idx` (`Brandid`),
  CONSTRAINT `brandleaderfk` FOREIGN KEY (`Brandid`) REFERENCES `brands` (`Brandid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `winners` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Userid` int NOT NULL,
  `Date` date NOT NULL,
  `Position` int NOT NULL,
  `Prize` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `userwinnerfk_idx` (`Userid`),
  CONSTRAINT `userwinnerfk` FOREIGN KEY (`Userid`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `banners` (
  `BannerId` int NOT NULL AUTO_INCREMENT,
  `Imageurl` varchar(45) NOT NULL,
  `Dealid` int DEFAULT NULL,
  `BrandId` int DEFAULT NULL,
  `Datestart` date NOT NULL,
  `Dateend` date NOT NULL,
  `Placement` varchar(1) NOT NULL,
  `Status` varchar(1) NOT NULL,
  PRIMARY KEY (`BannerId`),
  KEY `brandfk_idx` (`BrandId`),
  CONSTRAINT `brandfk` FOREIGN KEY (`BrandId`) REFERENCES `brands` (`Brandid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
