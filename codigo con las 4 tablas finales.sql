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
CREATE SCHEMA IF NOT EXISTS `archivos_videoclub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `archivos_videoclub` ;

-- -----------------------------------------------------
-- Table `archivos_videoclub`.`INVENTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivos_videoclub`.`INVENTORY` (
  `inventory_id` INT NOT NULL,
  `title_id` INT NULL DEFAULT NULL,
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
  `release_year` INT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `rental_duration` FLOAT NULL DEFAULT NULL,
  `rental_rate` DECIMAL(10,0) NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` FLOAT NULL DEFAULT NULL,
  `rating` VARCHAR(45) NULL DEFAULT NULL,
  `special_features` VARCHAR(500) NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `INVENTORY_inventory_id` INT NOT NULL,
  `INVENTORY_RENTAL_rental_id` INT NOT NULL,
  PRIMARY KEY (`title_id`, `INVENTORY_inventory_id`, `INVENTORY_RENTAL_rental_id`),
  INDEX `fk_FILMS_INVENTORY1_idx` (`INVENTORY_inventory_id` ASC, `INVENTORY_RENTAL_rental_id` ASC) VISIBLE,
  CONSTRAINT `fk_FILMS_INVENTORY1`
    FOREIGN KEY (`INVENTORY_inventory_id`)
    REFERENCES `archivos_videoclub`.`INVENTORY` (`inventory_id`))
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
  `staff_id` INT NULL DEFAULT NULL,
  `last_update` VARCHAR(45) NULL DEFAULT NULL,
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
