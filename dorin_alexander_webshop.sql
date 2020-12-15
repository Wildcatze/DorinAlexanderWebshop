SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS `dorin_alexander_webshop`;
CREATE SCHEMA IF NOT EXISTS `dorin_alexander_webshop` DEFAULT CHARACTER SET utf8 ;
USE `dorin_alexander_webshop` ;

CREATE TABLE IF NOT EXISTS `dorin_alexander_webshop`.`Category` (
  `category_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dorin_alexander_webshop`.`Accounts` (
  `account_id` INT UNSIGNED PRIMARY KEY UNIQUE AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `second_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL UNIQUE,
  `email` VARCHAR(60) NOT NULL UNIQUE,
  `zip` INT(6) NOT NULL,
  `district` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL UNIQUE,
  `password` VARCHAR(45) NOT NULL,
  `category_id` INT DEFAULT 1,
	CONSTRAINT `category_id_fk` FOREIGN KEY (`category_id`)
	REFERENCES `dorin_alexander_webshop`.`Category` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dorin_alexander_webshop`.`Types` (
  `type_id` INT UNSIGNED PRIMARY KEY UNIQUE AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL UNIQUE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dorin_alexander_webshop`.`Listings` (
  `listing_id` INT UNSIGNED PRIMARY KEY UNIQUE AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `item_condition` VARCHAR(10) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `price` VARCHAR(10) NOT NULL,
  `date` DATE,
  `contactinfo` VARCHAR(140) NOT NULL,
  `type_id` INT UNSIGNED NULL DEFAULT NULL,
  `account_id` INT UNSIGNED NULL DEFAULT NULL,
	CONSTRAINT `type_id_fk` FOREIGN KEY (`type_id`)
	REFERENCES `dorin_alexander_webshop`.`Types` (`type_id`) ON DELETE SET NULL ON UPDATE CASCADE,
		CONSTRAINT `account_id_fk` FOREIGN KEY (`account_id`)
		REFERENCES `dorin_alexander_webshop`.`Accounts` (`account_id`) ON DELETE SET NULL ON UPDATE CASCADE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

	INSERT INTO `dorin_alexander_webshop`.`Category` VALUES
    (1, 'Basic User'),
    (2, 'Employee'),
    (3, 'Administrator');
    
	INSERT INTO `dorin_alexander_webshop`.`Accounts` VALUES
    (1, 'Alexandru', 'Gabriel', '(+40) 753 768 301', 'alex_hates_email@yahoo.com', 2700, 'Brønshøj', 'Copenhagen', 'al_gab', 'passwordISforTHEweak', 3),
    (2, 'Dorin', 'Moldovan', '(+45) 11 22 63 44', 'not_what_you_think@gmail.com', 2100, 'Østerbro', 'Copenhagen', 'do_mol', 'hotWheelscoldHeart<3', 3),
    (3, 'Sorin', 'Daniel', '(+45) 58 65 23 74', 'IwillMarryDorin@wish.com', 2700, 'Brønshøj', 'Copenhagen', 'so_dan', 'WHOneedsPASSWORDS?', 1),
    (4, 'Arturo', 'Mora', '(+45) 88 66 55 77', 'terror.from.Madrid@yahoo.com', 2400, 'Nørrebro', 'Copenhagen', 'ar_mor', 'OnePasswordToRuleThemAll', 1),
    (5, 'Marianne', 'Nielsen', '(+45) 44 55 66 77', 'theBestemailIS@gmail.com', 2400, 'Nørrebro', 'Copenhagen', 'ma_nie', 'No.password.can.contain.me', 1),
    (6, 'Tomas', 'Pesek', '(+45) 25 64 87 95', 'spaghettiMonster@gmail.com', 2400, 'Nørrebro', 'Copenhagen', 'to_pes', 'passwords.areAn.illusion', 1),
    (7, 'Erik', 'Leth', '(+45) 36 36 66 13', 'unbreakable87@gmail.com', 2400, 'Nørrebro', 'Copenhagen', 'er_let', 'whateverPa$$word', 1),
    (8, 'Elias', 'Martidis', '(+45) 45 45 45 54', 'TheUnforgiveable@yahoo.com', 2400, 'Nørrebro', 'Copenhagen', 'el_mar', 'withThePowerOfZeus', 1),
    (9, 'Ástþór', 'Arnar', '(+45) 12 13 14 15', 'IceIceBaby@iceland.com', 2400, 'Nørrebro', 'Copenhagen', 'as_arn', 'dowereallyneedpasswords?', 1),
    (10, 'Remi', 'Foss', '(+45) 78 79 74 75', 'brexitISnotCOOL@domino.uk', 2400, 'Nørrebro', 'Copenhagen', 're_fos', 'Idontlikethis', 1),
    (11, 'Radu', 'Cazacu', '(+45) 13 13 13 31', 'ImissHOME@moldova.md', 2400, 'Nørrebro', 'Copenhagen', 'ra_caz', 'Idontlikethiseither', 1),
    (12, 'Nesrin', 'Saxeide', '(+45) 56 45 12 32', 'howImetYOURmother@family.com', 2400, 'Nørrebro', 'Copenhagen', 'ne_sax', 'itlookedbetterfromtheoutside', 1),
    (13, 'David', 'Haring', '(+45) 85 85 65 35', 'USEafacemask@gmail.com', 2400, 'Nørrebro', 'Copenhagen', 'da_har', 'fakeituntillYOUmakeit', 1),
    (14, 'Alex', 'Sandrovschii', '(+45) 44 55 22 44', 'IalsoMISShome@moldova.md', 2400, 'Nørrebro', 'Copenhagen', 'al_san', 'giveMEdonut', 1),
    (15, 'Jan', 'Zakrzewski', '(+45) 36 36 63 63', 'makePolandGreatAgain@gmail.com', 2400, 'Nørrebro', 'Copenhagen', 'ja_zak', 'IdontgiveyouNOdonut', 1),
    (16, 'Justė', 'Dilytė', '(+45) 11 22 33 44', 'oneMoreGlass@wine.com', 2400, 'Nørrebro', 'Copenhagen', 'ju_dil', 'lastoneisAlooser', 1),
    (17, 'Thomas', 'Hansen', '(+45) 00 01 02 03', 'mmmDoritos@yahoo.com', 2400, 'Nørrebro', 'Copenhagen', 'th_han', 'Juste!BeNice', 1);
    
    INSERT INTO `dorin_alexander_webshop`.`Types` VALUES
    (1, 'Desktop'),
    (2, 'Laptop'),
    (3, 'Monitor_and_Screen'),
    (4, 'Keyboard'),
    (5, 'Mouse'),
    (6, 'Speakers'),
    (7, 'Headset'),
    (8, 'Microphone'),
    (9, 'Mousepad'),
    (10, 'Adapters_and_Connectors'),
    (11, 'External Storage'),
    (12, 'DVD_Writer'),
    (13, 'Floppy_Disk_Drive'),
    (14, 'Cables'),
    (15, 'Cooling_Pads'),
    (16, 'PC_Case'),
    (17, 'Laptop_Bag'),
    (18, 'Thermal_Compounds'),
    (19, 'CPU'),
    (20, 'GPU'),
    (21, 'Hard_Drive'),
    (22, 'Solid_State_Drive'),
    (23, 'Compact_Disk'),
    (24, 'Floppy_Disk'),
    (25, 'RAM'),
    (26, 'Mother_Board'),
    (27, 'Network_Card'),
    (28, 'Cooler'),
    (29, 'Operating_System'),
    (30, 'Licensed_Software'),
    (31, 'Wi_Fi_Card'),
    (32, 'Power_Supply_Unit'),
    (33, 'Other');
    
    INSERT INTO `dorin_alexander_webshop`.`Listings` VALUES
    (1, 'Nvidia RTX 2080Ti', 'used', 'Bought 1 year ago, is in good shape, selling it because I have upgraded', '1500 DKK', '2020-08-26','+459752410', 20, 14),
    (2, 'Steel pc case', 'used', 'Steel PC case for sale, contains 5 HDD slots, lower PSU mount', '500 DKK', '2019-07-25','+459724110', 16, 6),
    (3, 'HyperX Cloud II', 'new', 'I have bought these headphones from POWER new and I can not return them, case is sealed, the product is off the shelf unopened', '899 DKK', '2020-09-11','+455122410', 7, 9);