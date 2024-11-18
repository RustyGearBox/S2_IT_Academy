-- MySQL Workbench Synchronization
-- Generated: 2024-11-18 11:46
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: formacio

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optical_store` DEFAULT CHARACTER SET utf8mb3 ;

CREATE TABLE IF NOT EXISTS `optical_store`.`address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `city` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `street` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `building` INT(11) NULL DEFAULT NULL,
  `floor` INT(11) NULL DEFAULT NULL,
  `door` INT(11) NULL DEFAULT NULL,
  `post_code` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `optical_store`.`brand` (
  `brand_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `supplier_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE INDEX `supplier_id_UNIQUE` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `supplier_id`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `optical_store`.`supplier` (`supplier_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `optical_store`.`client` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `telephone` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `reg_date` DATE NULL DEFAULT NULL,
  `client_recommend_id` INT(11) NULL DEFAULT NULL,
  `client_address_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `client_recommend_id_idx` (`client_recommend_id` ASC) VISIBLE,
  INDEX `client_address_id_idx` (`client_address_id` ASC) VISIBLE,
  CONSTRAINT `client_address_id`
    FOREIGN KEY (`client_address_id`)
    REFERENCES `optical_store`.`address` (`address_id`),
  CONSTRAINT `client_recommend_id`
    FOREIGN KEY (`client_recommend_id`)
    REFERENCES `optical_store`.`client` (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `optical_store`.`glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `brand_id` INT(11) NULL DEFAULT NULL,
  `graduation_R` DECIMAL(10,0) NULL DEFAULT NULL,
  `graduation_L` DECIMAL(10,0) NULL DEFAULT NULL,
  `frame_type` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `frame_color` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `color_R` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `color_L` VARCHAR(45) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `price` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `brand_id_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `optical_store`.`brand` (`brand_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `optical_store`.`sale` (
  `id_sale` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11) NULL DEFAULT NULL,
  `glasses_id` INT(11) NULL DEFAULT NULL,
  `seller_id` INT(11) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_sale`),
  INDEX `client_id_idx` (`client_id` ASC) VISIBLE,
  INDEX `glasses_id_idx` (`glasses_id` ASC) VISIBLE,
  INDEX `seller_id_idx` (`seller_id` ASC) VISIBLE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `optical_store`.`client` (`client_id`),
  CONSTRAINT `glasses_id`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `optical_store`.`glasses` (`glasses_id`),
  CONSTRAINT `seller_id`
    FOREIGN KEY (`seller_id`)
    REFERENCES `optical_store`.`seller` (`id_seller`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `optical_store`.`seller` (
  `id_seller` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  PRIMARY KEY (`id_seller`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `optical_store`.`supplier` (
  `supplier_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `phone_number` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `fax` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `nif` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `address_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE,
  UNIQUE INDEX `fax_UNIQUE` (`fax` ASC) VISIBLE,
  INDEX `address_id_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `optical_store`.`address` (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
