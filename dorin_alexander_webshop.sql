-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dorin_alexander_webshop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dorin_alexander_webshop` ;

-- -----------------------------------------------------
-- Schema dorin_alexander_webshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dorin_alexander_webshop` DEFAULT CHARACTER SET utf8 ;
USE `dorin_alexander_webshop` ;

-- -----------------------------------------------------
-- Table `dorin_alexander_webshop`.`accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dorin_alexander_webshop`.`accounts` (
  `account_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `second_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `zip` INT NOT NULL,
  `district` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE INDEX `account_id` (`account_id` ASC) VISIBLE,
  UNIQUE INDEX `phone_number` (`phone_number` ASC) VISIBLE,
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dorin_alexander_webshop`.`types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dorin_alexander_webshop`.`types` (
  `type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE INDEX `type_id` (`type_id` ASC) VISIBLE,
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dorin_alexander_webshop`.`listings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dorin_alexander_webshop`.`listings` (
  `listing_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `item_condition` VARCHAR(10) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `price` VARCHAR(10) NOT NULL,
  `date` DATE NULL DEFAULT NULL,
  `contactinfo` VARCHAR(140) NOT NULL,
  `type_id` INT UNSIGNED NULL DEFAULT NULL,
  `account_id` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`listing_id`),
  UNIQUE INDEX `listing_id` (`listing_id` ASC) VISIBLE,
  INDEX `account_id_fk` (`account_id` ASC) VISIBLE,
  INDEX `type_id_fk` (`type_id` ASC) VISIBLE,
  CONSTRAINT `account_id_fk`
    FOREIGN KEY (`account_id`)
    REFERENCES `dorin_alexander_webshop`.`accounts` (`account_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `type_id_fk`
    FOREIGN KEY (`type_id`)
    REFERENCES `dorin_alexander_webshop`.`types` (`type_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `dorin_alexander_webshop`.`accounts`
-- -----------------------------------------------------
START TRANSACTION;
USE `dorin_alexander_webshop`;
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (1, 'Alexandru', 'Gabriel', '(+40) 753 768 301', 'alex_hates_email@yahoo.com', 2700, 'Brønshøj', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (2, 'Dorin', 'Moldovan', '(+45) 11 22 63 44', 'not_what_you_think@gmail.com', 2100, 'Østerbro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (3, 'Sorin', 'Daniel', '(+45) 58 65 23 74', 'IwillMarryDorin@wish.com', 2700, 'Brønshøj', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (4, 'Arturo', 'Mora', '(+45) 88 66 55 77', 'terror.from.Madrid@yahoo.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (5, 'Marianne', 'Nielsen', '(+45) 44 55 66 77', 'theBestemailIS@gmail.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (6, 'Tomas', 'Pesek', '(+45) 25 64 87 95', 'spaghettiMonster@gmail.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (7, 'Erik', 'Leth', '(+45) 36 36 66 13', 'unbreakable87@gmail.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (8, 'Elias', 'Martidis', '(+45) 45 45 45 54', 'TheUnforgiveable@yahoo.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (9, 'Ástþór', 'Arnar', '(+45) 12 13 14 15', 'IceIceBaby@iceland.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (10, 'Remi', 'Foss', '(+45) 78 79 74 75', 'brexitISnotCOOL@domino.uk', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (11, 'Radu', 'Cazacu', '(+45) 13 13 13 31', 'ImissHOME@moldova.md', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (12, 'Nesrin', 'Saxeide', '(+45) 56 45 12 32', 'howImetYOURmother@family.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (13, 'David', 'Haring', '(+45) 85 85 65 35', 'USEafacemask@gmail.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (14, 'Alex', 'Sandrovschii', '(+45) 44 55 22 44', 'IalsoMISShome@moldova.md', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (15, 'Jan', 'Zakrzewski', '(+45) 36 36 63 63', 'makePolandGreatAgain@gmail.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (16, 'Justė', 'Dilytė', '(+45) 11 22 33 44', 'oneMoreGlass@wine.com', 2400, 'Nørrebro', 'Copenhagen');
INSERT INTO `dorin_alexander_webshop`.`accounts` (`account_id`, `first_name`, `second_name`, `phone_number`, `email`, `zip`, `district`, `city`) VALUES (17, 'Thomas', 'Hansen', '(+45) 00 01 02 03', 'mmmDoritos@yahoo.com', 2400, 'Nørrebro', 'Copenhagen');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dorin_alexander_webshop`.`types`
-- -----------------------------------------------------
START TRANSACTION;
USE `dorin_alexander_webshop`;
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (10, 'Adapters_and_Connectors');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (14, 'Cables');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (23, 'Compact_Disk');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (28, 'Cooler');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (15, 'Cooling_Pads');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (19, 'CPU');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (1, 'Desktop');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (12, 'DVD_Writer');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (11, 'External Storage');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (24, 'Floppy_Disk');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (13, 'Floppy_Disk_Drive');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (20, 'GPU');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (21, 'Hard_Drive');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (7, 'Headset');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (4, 'Keyboard');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (2, 'Laptop');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (17, 'Laptop_Bag');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (30, 'Licensed_Software');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (8, 'Microphone');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (3, 'Monitor_and_Screen');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (26, 'Mother_Board');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (5, 'Mouse');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (9, 'Mousepad');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (27, 'Network_Card');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (29, 'Operating_System');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (33, 'Other');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (16, 'PC_Case');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (32, 'Power_Supply_Unit');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (25, 'RAM');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (22, 'Solid_State_Drive');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (6, 'Speakers');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (18, 'Thermal_Compounds');
INSERT INTO `dorin_alexander_webshop`.`types` (`type_id`, `name`) VALUES (31, 'Wi_Fi_Card');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dorin_alexander_webshop`.`listings`
-- -----------------------------------------------------
START TRANSACTION;
USE `dorin_alexander_webshop`;
INSERT INTO `dorin_alexander_webshop`.`listings` (`listing_id`, `title`, `item_condition`, `description`, `price`, `date`, `contactinfo`, `type_id`, `account_id`) VALUES (1, 'Nvidia RTX 2080Ti', 'used', 'Bought 1 year ago, is in good shape, selling it because I have upgraded', '1500 DKK', '2020-08-26', '+459752410', 20, 14);
INSERT INTO `dorin_alexander_webshop`.`listings` (`listing_id`, `title`, `item_condition`, `description`, `price`, `date`, `contactinfo`, `type_id`, `account_id`) VALUES (2, 'Steel pc case', 'used', 'Steel PC case for sale, contains 5 HDD slots, lower PSU mount', '500 DKK', '2019-07-25', '+459724110', 16, 6);
INSERT INTO `dorin_alexander_webshop`.`listings` (`listing_id`, `title`, `item_condition`, `description`, `price`, `date`, `contactinfo`, `type_id`, `account_id`) VALUES (3, 'HyperX Cloud II', 'new', 'I have bought these headphones from POWER new and I can not return them, case is sealed, the product is off the shelf unopened', '899 DKK', '2020-09-11', '+455122410', 7, 9);

COMMIT;

