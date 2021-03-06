-- MySQL Script generated by MySQL Workbench
-- Sun May  8 21:41:14 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Stadium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Stadium` (
  `Name` VARCHAR(45) NOT NULL,
  `Capacity` VARCHAR(10) NULL,
  `Address` VARCHAR(200) NULL,
  `League Attendence` VARCHAR(200) NULL default NULL,
  `Pitch Size` VARCHAR(45) NULL,
  `Building Date` VARCHAR(10) NULL default NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Club`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Club` (
  `Name` VARCHAR(45) NOT NULL,
  `Stadium_Home_Name` VARCHAR(45) NULL,
  `Website` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Name`),
  INDEX `fk_Club_Stadium1_idx` (`Stadium_Home_Name` ASC) VISIBLE,
  CONSTRAINT `fk_Club_Stadium1`
    FOREIGN KEY (`Stadium_Home_Name`)
    REFERENCES `mydb`.`Stadium` (`Name`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Player` (
  `Number` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Position` VARCHAR(45) NOT NULL,
  `Nationality` VARCHAR(45) NULL,
  `DOB` varchar(45) NULL,
  `Height` varchar(45) NULL,
  `Weight` varchar(45) NULL,
  `Club_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Number`, `Name`),
  INDEX `fk_Player_Club1_idx` (`Club_Name` ASC) VISIBLE,
  CONSTRAINT `fk_Player_Club1`
    FOREIGN KEY (`Club_Name`)
    REFERENCES `mydb`.`Club` (`Name`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Match` (
  `Date` VARCHAR(45) NOT NULL,
  `Season` VARCHAR(45) NULL,
  `Away_Club_Name` VARCHAR(45) NOT NULL,
  `Home_Club_Name` VARCHAR(45) NOT NULL,
  `Result T1` INT NULL DEFAULT 0,
  `Result T2` INT NULL DEFAULT 0,
  `Possession %` VARCHAR(45) NULL DEFAULT "0.0",
  `Yellow Cards` INT NULL DEFAULT 0,
  `Shots` INT NULL DEFAULT 0,
  `Fouls` INT NULL DEFAULT 0,
  `Stadium_Name` VARCHAR(45) NULL DEFAULT null,
  PRIMARY KEY (`Date`, `Away_Club_Name`, `Home_Club_Name`),
  INDEX `fk_Match_Stadium1_idx` (`Stadium_Name` ASC) VISIBLE,
  INDEX `fk_Match_Club1_idx` (`Away_Club_Name` ASC) VISIBLE,
  INDEX `fk_Match_Club2_idx` (`Home_Club_Name` ASC) VISIBLE,
  CONSTRAINT `fk_Match_Stadium1`
    FOREIGN KEY (`Stadium_Name`)
    REFERENCES `mydb`.`Stadium` (`Name`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_Match_Club1`
    FOREIGN KEY (`Away_Club_Name`)
    REFERENCES `mydb`.`Club` (`Name`)
    ON DELETE no action
    ON UPDATE no action,
  CONSTRAINT `fk_Match_Club2`
    FOREIGN KEY (`Home_Club_Name`)
    REFERENCES `mydb`.`Club` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fan` (
  `Username` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Gender` CHAR NULL,
  `Age` INT NULL,
  `DOB` VARCHAR(45) NULL,
  `Favorite Team` VARCHAR(45) NULL,
  PRIMARY KEY (`Username`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`History of Matches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`History of Matches` (
  `Club_Name` VARCHAR(45) NOT NULL,
  `League Position` INT NOT NULL,
  `Manager ID` VARCHAR(45) NULL,
  `Top Scorer` VARCHAR(45) NULL,
  `Most Appearences` VARCHAR(45) NULL,
  `Biggest Win` VARCHAR(45) NULL,
  `Heaviest Defeat` VARCHAR(45) NULL,
  `Match_Season` VARCHAR(45) NOT NULL,
  `Match_Date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Club_Name`, `Match_Season`, `Match_Date`),
  UNIQUE INDEX `Manager ID_UNIQUE` (`Manager ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fan_rates_Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fan_rates_Match` (
  `Fan_Username` VARCHAR(45) NOT NULL,
  `Match_Date` VARCHAR(45) NOT NULL,
  `Match_Away_Club_Name` VARCHAR(45) NOT NULL,
  `Match_Home_Club_Name` VARCHAR(45) NOT NULL,
  `Review` VARCHAR(250) NULL,
  `Rating` VARCHAR(10) NULL,
  PRIMARY KEY (`Fan_Username`, `Match_Date`, `Match_Away_Club_Name`, `Match_Home_Club_Name`),
  INDEX `fk_Fan_has_Match_Match1_idx` (`Match_Date` ASC, `Match_Away_Club_Name` ASC, `Match_Home_Club_Name` ASC) VISIBLE,
  INDEX `fk_Fan_has_Match_Fan1_idx` (`Fan_Username` ASC) VISIBLE,
  CONSTRAINT `fk_Fan_has_Match_Fan1`
    FOREIGN KEY (`Fan_Username`)
    REFERENCES `mydb`.`Fan` (`Username`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_Fan_has_Match_Match1`
    FOREIGN KEY (`Match_Date` , `Match_Away_Club_Name` , `Match_Home_Club_Name`)
    REFERENCES `mydb`.`Match` (`Date` , `Away_Club_Name` , `Home_Club_Name`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Seasons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Seasons` (
  `Player_Number` VARCHAR(45) NOT NULL,
  `Player_Name` VARCHAR(45) NOT NULL,
  `Season` VARCHAR(45) NOT NULL,
  `Club Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Player_Number`, `Player_Name`, `Season`, `Club Name`)
-- INDEX `fk_Seasons_Player1_idx` (`Player_Number` ASC, `Player_Name` ASC) VISIBLE,--  CONSTRAINT `fk_Seasons_Player1`
--     FOREIGN KEY (`Player_Number` , `Player_Name`)
--     REFERENCES `mydb`.`Player` (`Number`, `Name`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
