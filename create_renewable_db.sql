-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema renewables
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema renewables
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS renewables;
CREATE DATABASE IF NOT EXISTS `renewables`;
CREATE SCHEMA IF NOT EXISTS `renewables` DEFAULT CHARACTER SET utf8 ;
USE `renewables` ;

-- -----------------------------------------------------
-- Table `renewables`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `renewables`.`countries` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `country_name_UNIQUE` (`country_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `renewables`.`sources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `renewables`.`sources` (
  `source_id` INT NOT NULL AUTO_INCREMENT,
  `source_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`source_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `renewables`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `renewables`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name_UNIQUE` (`category_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `renewables`.`renewable_investments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `renewables`.`renewable_investments` (
  `country_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `year` YEAR NOT NULL,
  `percentage` DOUBLE NOT NULL,
  `source_id` INT NOT NULL,
  PRIMARY KEY (`country_id`, `category_id`, `year`),
  INDEX `fk_renewable_investments_countries_idx` (`country_id` ASC) VISIBLE,
  INDEX `fk_renewable_investments_sources1_idx` (`source_id` ASC) VISIBLE,
  INDEX `fk_renewable_investments_categories1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_renewable_investments_countries`
    FOREIGN KEY (`country_id`)
    REFERENCES `renewables`.`countries` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_renewable_investments_sources1`
    FOREIGN KEY (`source_id`)
    REFERENCES `renewables`.`sources` (`source_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_renewable_investments_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `renewables`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `renewables`.`energy_consumption`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `renewables`.`energy_consumption` (
  `country_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `year` YEAR NOT NULL,
  `consumption` DOUBLE NOT NULL,
  `source_id` INT NOT NULL,
  PRIMARY KEY (`country_id`, `category_id`, `year`),
  INDEX `fk_energy_consumption_countries1_idx` (`country_id` ASC) VISIBLE,
  INDEX `fk_energy_consumption_sources1_idx` (`source_id` ASC) VISIBLE,
  INDEX `fk_energy_consumption_categories1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_energy_consumption_countries1`
    FOREIGN KEY (`country_id`)
    REFERENCES `renewables`.`countries` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_energy_consumption_sources1`
    FOREIGN KEY (`source_id`)
    REFERENCES `renewables`.`sources` (`source_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_energy_consumption_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `renewables`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
