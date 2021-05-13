-- MySQL Script generated by MySQL Workbench
-- Thu May 13 09:58:55 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Branch_And_Checks
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Branch_And_Checks
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Branch_And_Checks` DEFAULT CHARACTER SET utf8 ;
USE `Branch_And_Checks` ;

-- -----------------------------------------------------
-- Table `Branch_And_Checks`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Branch_And_Checks`.`City` (
  `id_City` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(45) NULL,
  PRIMARY KEY (`id_City`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Branch_And_Checks`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Branch_And_Checks`.`Branch` (
  `id_Branch` INT NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(45) NOT NULL,
  `house` VARCHAR(45) NOT NULL,
  `City_id_City` INT NOT NULL,
  `Tel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Branch`, `City_id_City`),
  INDEX `fk_Branch_City_idx` (`City_id_City` ASC) VISIBLE,
  CONSTRAINT `fk_Branch_City`
    FOREIGN KEY (`City_id_City`)
    REFERENCES `Branch_And_Checks`.`City` (`id_City`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Branch_And_Checks`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Branch_And_Checks`.`Products` (
  `id_Products` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`id_Products`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Branch_And_Checks`.`Checks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Branch_And_Checks`.`Checks` (
  `idChecks` INT NOT NULL AUTO_INCREMENT,
  `Products_id_Products` INT NOT NULL,
  `Count` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Branch_id_Branch` INT NOT NULL,
  PRIMARY KEY (`idChecks`, `Products_id_Products`, `Branch_id_Branch`),
  INDEX `fk_Checks_Products1_idx` (`Products_id_Products` ASC) VISIBLE,
  INDEX `fk_Checks_Branch1_idx` (`Branch_id_Branch` ASC) VISIBLE,
  CONSTRAINT `fk_Checks_Products1`
    FOREIGN KEY (`Products_id_Products`)
    REFERENCES `Branch_And_Checks`.`Products` (`id_Products`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Checks_Branch1`
    FOREIGN KEY (`Branch_id_Branch`)
    REFERENCES `Branch_And_Checks`.`Branch` (`id_Branch`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
