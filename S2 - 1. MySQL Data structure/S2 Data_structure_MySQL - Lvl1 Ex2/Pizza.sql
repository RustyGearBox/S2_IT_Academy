-- MySQL Workbench Synchronization
-- Generated: 2024-11-18 12:02
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: formacio

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;

CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `category_id` INT(11) NOT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `client_id` INT(11) NOT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `surname` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(20) NULL DEFAULT NULL,
  `postal_code` VARCHAR(20) NULL DEFAULT NULL,
  `telephone` VARCHAR(20) NULL DEFAULT NULL,
  `locality_locality_id` INT(11) NOT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_client_locality1_idx` (`locality_locality_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_locality1`
    FOREIGN KEY (`locality_locality_id`)
    REFERENCES `mydb`.`locality` (`locality_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`delivery` (
  `delivery_id` INT(11) NOT NULL,
  `date_time` DATETIME NULL DEFAULT NULL,
  `employee_employee_id` INT(11) NOT NULL,
  `order_order_id` INT(11) NOT NULL,
  PRIMARY KEY (`delivery_id`),
  INDEX `fk_delivery_employee1_idx` (`employee_employee_id` ASC) VISIBLE,
  INDEX `fk_delivery_order1_idx` (`order_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_delivery_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `mydb`.`employee` (`employee_id`),
  CONSTRAINT `fk_delivery_order1`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `mydb`.`order` (`order_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `employee_id` INT(11) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(20) NOT NULL,
  `nif` VARCHAR(20) NULL DEFAULT NULL,
  `phone_number` VARCHAR(20) NULL DEFAULT NULL,
  `type` VARCHAR(20) NOT NULL,
  `store_store_id` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_store1_idx` (`store_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_store1`
    FOREIGN KEY (`store_store_id`)
    REFERENCES `mydb`.`store` (`store_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`locality` (
  `locality_id` INT(11) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `province_province_id` INT(11) NOT NULL,
  PRIMARY KEY (`locality_id`),
  INDEX `fk_locality_province1_idx` (`province_province_id` ASC) VISIBLE,
  CONSTRAINT `fk_locality_province1`
    FOREIGN KEY (`province_province_id`)
    REFERENCES `mydb`.`province` (`province_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `num_pizza` VARCHAR(20) NULL DEFAULT NULL,
  `num_drink` VARCHAR(20) NULL DEFAULT NULL,
  `num_burguer` VARCHAR(20) NULL DEFAULT NULL,
  `total_price` VARCHAR(20) NOT NULL,
  `client_client_id` INT(11) NOT NULL,
  `store_store_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_client1_idx` (`client_client_id` ASC) VISIBLE,
  INDEX `fk_order_store1_idx` (`store_store_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_client1`
    FOREIGN KEY (`client_client_id`)
    REFERENCES `mydb`.`client` (`client_id`),
  CONSTRAINT `fk_order_store1`
    FOREIGN KEY (`store_store_id`)
    REFERENCES `mydb`.`store` (`store_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`order_product` (
  `order_product_id` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `order_order_id` INT(11) NOT NULL,
  `product_product_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_product_id`),
  INDEX `fk_order_product_order_idx` (`order_order_id` ASC) VISIBLE,
  INDEX `fk_order_product_product1_idx` (`product_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_product_order`
    FOREIGN KEY (`order_order_id`)
    REFERENCES `mydb`.`order` (`order_id`),
  CONSTRAINT `fk_order_product_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `mydb`.`product` (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`pizza` (
  `pizza_id` INT(11) NOT NULL,
  `product_product_id` INT(11) NOT NULL,
  `category_category_id` INT(11) NOT NULL,
  PRIMARY KEY (`pizza_id`),
  INDEX `fk_pizza_product1_idx` (`product_product_id` ASC) VISIBLE,
  INDEX `fk_pizza_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizza_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `mydb`.`category` (`category_id`),
  CONSTRAINT `fk_pizza_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `mydb`.`product` (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `product_id` INT(11) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(20) NULL DEFAULT NULL,
  `image` BLOB NULL DEFAULT NULL,
  `price` INT(11) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`province` (
  `province_id` INT(11) NOT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`province_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `mydb`.`store` (
  `store_id` INT(11) NOT NULL,
  `address` VARCHAR(20) NULL DEFAULT NULL,
  `postal_code` VARCHAR(20) NULL DEFAULT NULL,
  `locality_locality_id` INT(11) NOT NULL,
  PRIMARY KEY (`store_id`),
  INDEX `fk_store_locality1_idx` (`locality_locality_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_locality1`
    FOREIGN KEY (`locality_locality_id`)
    REFERENCES `mydb`.`locality` (`locality_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
