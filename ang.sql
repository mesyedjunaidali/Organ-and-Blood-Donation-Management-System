-- MySQL Workbench Synchronization
-- Generated: 2022-06-06 22:42
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: syed2

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `seva_aangse` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `seva_aangse`.`organ_donor_card` (
  `donor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `phone_number` INT(11) NOT NULL,
  `blood_group` VARCHAR(10) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(6) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `district` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `pincode` INT(6) NOT NULL,
  PRIMARY KEY (`donor_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`donor_id` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `seva_aangse`.`funding` (
  `transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `account_number` INT(11) NOT NULL,
  `donation_amount` INT(11) NOT NULL,
  `transaction_status` VARCHAR(45) NOT NULL,
  `timestamp` TIMESTAMP GENERATED ALWAYS AS (current_timestamp()) VIRTUAL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE INDEX `transaction_id_UNIQUE` (`transaction_id` ASC) VISIBLE,
  UNIQUE INDEX `account_number_UNIQUE` (`account_number` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `seva_aangse`.`blood_donation` (
  `donor_b_id` INT(11) NOT NULL AUTO_INCREMENT,
  `requirement_id` INT(11) NOT NULL,
  `timestamp` TIMESTAMP GENERATED ALWAYS AS () VIRTUAL,
  `blood_quantity` INT(11) NOT NULL,
  `blood_group` VARCHAR(2) NOT NULL,
  `rh_factor` VARCHAR(8) NOT NULL,
  `blood_compatibility` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`donor_b_id`),
  UNIQUE INDEX `donor_b_id_UNIQUE` (`donor_b_id` ASC) VISIBLE,
  UNIQUE INDEX `process_id_UNIQUE` (`requirement_id` ASC) VISIBLE,
  CONSTRAINT `requirement_id`
    FOREIGN KEY (`requirement_id`)
    REFERENCES `seva_aangse`.`notification_automation_system` (`requirement_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `seva_aangse`.`notification_automation_system` (
  `requirement_id` INT(11) NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NOT NULL,
  `phone_number` INT(11) NOT NULL,
  `time_limit` DATETIME NOT NULL,
  `current_status` VARCHAR(45) NOT NULL,
  `blood_group` VARCHAR(10) NOT NULL,
  `requirement` VARCHAR(45) NOT NULL,
  `reciever_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`requirement_id`),
  UNIQUE INDEX `requirement_id_UNIQUE` (`requirement_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `seva_aangse`.`organ_donation` (
  `donor_o_id` INT(11) GENERATED ALWAYS AS () VIRTUAL,
  `requirement_id` INT(11) NOT NULL,
  `organ_required` VARCHAR(10) NOT NULL,
  `blood_group` VARCHAR(2) NOT NULL,
  `rh_factor` VARCHAR(8) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  `compatibility` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`donor_o_id`),
  UNIQUE INDEX `donor_b_id_UNIQUE` (`donor_o_id` ASC) VISIBLE,
  UNIQUE INDEX `process_id_UNIQUE` (`requirement_id` ASC) VISIBLE,
  CONSTRAINT `requirement_id`
    FOREIGN KEY (`requirement_id`)
    REFERENCES `seva_aangse`.`notification_automation_system` (`requirement_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
