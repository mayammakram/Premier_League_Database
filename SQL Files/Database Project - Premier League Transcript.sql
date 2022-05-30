-- MySQL Script generated by MySQL Workbench
-- Tue Mar  8 19:37:19 2022
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
-- Table `mydb`.`Club`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Club` (
  `Name` VARCHAR(45) NOT NULL,
  `Home Stadium` VARCHAR(45) NULL,
  `Website` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Player` (
  `Player ID` VARCHAR(14) NOT NULL,
  `First Name` VARCHAR(45) NULL,
  `Last Name` VARCHAR(45) NULL,
  `Nationality` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `Height` DECIMAL(2) NULL,
  `Weight` DECIMAL(2) NULL,
  `Position` VARCHAR(45) NULL,
  `Home Team` VARCHAR(45) NULL,
  `Club_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Player ID`),
  INDEX `fk_Player_Club1_idx` (`Club_Name` ASC) VISIBLE,
  CONSTRAINT `fk_Player_Club1`
    FOREIGN KEY (`Club_Name`)
    REFERENCES `mydb`.`Club` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Stadium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Stadium` (
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Capacity` INT NULL,
  `League Attendence` INT NULL,
  `Pitch Size` DECIMAL(2) NULL,
  `Building Date` YEAR NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Match` (
  `Season` YEAR NOT NULL,
  `Date` DATE NOT NULL,
  `Result` VARCHAR(45) NOT NULL,
  `Possession %` DECIMAL(2) NOT NULL,
  `Red Cards` INT NULL,
  `Yellow Cards` INT NULL,
  `Goals` INT NULL,
  `Shots` INT NULL,
  `Fouls` INT NULL,
  `Stadium_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Season`, `Date`),
  INDEX `fk_Match_Stadium1_idx` (`Stadium_Name` ASC) VISIBLE,
  CONSTRAINT `fk_Match_Stadium1`
    FOREIGN KEY (`Stadium_Name`)
    REFERENCES `mydb`.`Stadium` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fan` (
  `Username` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Gender` CHAR NULL,
  `Age` INT NULL,
  `DOB` DATE NULL,
  `Favorite Team` VARCHAR(45) NULL,
  PRIMARY KEY (`Username`))
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
  PRIMARY KEY (`Club_Name`),
  INDEX `fk_History of Matches_Club_idx` (`Club_Name` ASC) VISIBLE,
  UNIQUE INDEX `Manager ID_UNIQUE` (`Manager ID` ASC) VISIBLE,
  CONSTRAINT `fk_History of Matches_Club`
    FOREIGN KEY (`Club_Name`)
    REFERENCES `mydb`.`Club` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fan_has_Match (Rating)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fan_has_Match (Rating)` (
  `Fan_Username` VARCHAR(45) NOT NULL,
  `Match_Season` YEAR NOT NULL,
  `Match_Date` DATE NOT NULL,
  `Review` VARCHAR(250) NULL,
  `Rating` INT NULL,
  PRIMARY KEY (`Fan_Username`, `Match_Season`, `Match_Date`),
  INDEX `fk_Fan_has_Match_Match1_idx` (`Match_Season` ASC, `Match_Date` ASC) VISIBLE,
  INDEX `fk_Fan_has_Match_Fan1_idx` (`Fan_Username` ASC) VISIBLE,
  CONSTRAINT `fk_Fan_has_Match_Fan1`
    FOREIGN KEY (`Fan_Username`)
    REFERENCES `mydb`.`Fan` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fan_has_Match_Match1`
    FOREIGN KEY (`Match_Season` , `Match_Date`)
    REFERENCES `mydb`.`Match` (`Season` , `Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Club_has_Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Club_has_Match` (
  `Club_Name` VARCHAR(45) NOT NULL,
  `Match_Season` YEAR NOT NULL,
  `Match_Date` DATE NOT NULL,
  PRIMARY KEY (`Club_Name`, `Match_Season`, `Match_Date`),
  INDEX `fk_Club_has_Match_Match1_idx` (`Match_Season` ASC, `Match_Date` ASC) VISIBLE,
  INDEX `fk_Club_has_Match_Club1_idx` (`Club_Name` ASC) VISIBLE,
  CONSTRAINT `fk_Club_has_Match_Club1`
    FOREIGN KEY (`Club_Name`)
    REFERENCES `mydb`.`Club` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Club_has_Match_Match1`
    FOREIGN KEY (`Match_Season` , `Match_Date`)
    REFERENCES `mydb`.`Match` (`Season` , `Date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;