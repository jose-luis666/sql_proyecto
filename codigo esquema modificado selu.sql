-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema archivos_videoclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema archivos_videoclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `archivos_videoclub3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `archivos_videoclub3` ;

-- -----------------------------------------------------
-- Table `archivos_videoclub3`.`INVENTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivos_videoclub3`.`INVENTORY` (
  `inventory_id` INT NOT NULL,
  `title_id` INT NULL DEFAULT NULL,
FOREIGN KEY (`FILMS_title_id`)
FOREIGN KEY (`FILMS_title_id`)
  PRIMARY KEY (`inventory_id`))

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivos_videoclub`.`FILMS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivos_videoclub`.`FILMS` (
  `title_id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(5000) NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` FLOAT NULL DEFAULT NULL,
`actors` VARCHAR(5000) NULL DEFAULT NULL

  PRIMARY KEY (`title_id`)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivos_videoclub`.`RENTAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivos_videoclub`.`RENTAL` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivos_videoclub`.`CLIENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivos_videoclub`.`CLIENTS` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(500) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
