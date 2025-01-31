-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema car_dealershop_lab
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_dealershop_lab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_dealershop_lab` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema fifa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fifa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fifa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema fifawc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fifawc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fifawc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_dealershop_lab` ;

-- -----------------------------------------------------
-- Table `car_dealershop_lab`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealershop_lab`.`customers` (
  `id_cus` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` INT NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state/province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `zip/postal_code` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cus`),
  UNIQUE INDEX `id_cus_UNIQUE` (`id_cus` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealershop_lab`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealershop_lab`.`salespersons` (
  `id_staff` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_staff`),
  UNIQUE INDEX `id_staff_UNIQUE` (`id_staff` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealershop_lab`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealershop_lab`.`invoices` (
  `id_in_number` INT NOT NULL,
  `date` DATE NULL DEFAULT NULL,
  `salespersons_id_staff` INT NOT NULL,
  `customers_id_cus` INT NOT NULL,
  PRIMARY KEY (`id_in_number`),
  UNIQUE INDEX `id_in_number_UNIQUE` (`id_in_number` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_id_staff` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_id_cus` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_id_cus`)
    REFERENCES `car_dealershop_lab`.`customers` (`id_cus`),
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_id_staff`)
    REFERENCES `car_dealershop_lab`.`salespersons` (`id_staff`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealershop_lab`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealershop_lab`.`cars` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vin` INT NOT NULL,
  `manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `year` YEAR NULL DEFAULT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `invoices_id_in_number` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_vin_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `vin_UNIQUE` (`vin` ASC) VISIBLE,
  INDEX `fk_cars_invoices1_idx` (`invoices_id_in_number` ASC) VISIBLE,
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_id_in_number`)
    REFERENCES `car_dealershop_lab`.`invoices` (`id_in_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `fifa` ;

-- -----------------------------------------------------
-- Table `fifa`.`wc_to_sql`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fifa`.`wc_to_sql` (
  `year_id` INT NOT NULL,
  `Country` TEXT NULL DEFAULT NULL,
  `Winner` TEXT NULL DEFAULT NULL,
  `Runners-Up` TEXT NULL DEFAULT NULL,
  `Third` TEXT NULL DEFAULT NULL,
  `Fourth` TEXT NULL DEFAULT NULL,
  `GoalsScored` INT NULL DEFAULT NULL,
  `QualifiedTeams` INT NULL DEFAULT NULL,
  `MatchesPlayed` INT NULL DEFAULT NULL,
  `Attendance` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`year_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fifa`.`matches_to_sql`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fifa`.`matches_to_sql` (
  `MatchID` INT NOT NULL,
  `year_id` INT NULL DEFAULT NULL,
  `RoundID` DOUBLE NULL DEFAULT NULL,
  `Datetime` TEXT NULL DEFAULT NULL,
  `Stage` TEXT NULL DEFAULT NULL,
  `Stadium` TEXT NULL DEFAULT NULL,
  `City` TEXT NULL DEFAULT NULL,
  `Home Team Name` TEXT NULL DEFAULT NULL,
  `Home Team Goals` DOUBLE NULL DEFAULT NULL,
  `Away Team Goals` DOUBLE NULL DEFAULT NULL,
  `Away Team Name` TEXT NULL DEFAULT NULL,
  `Win conditions` TEXT NULL DEFAULT NULL,
  `Attendance` DOUBLE NULL DEFAULT NULL,
  `Half-time Home Goals` DOUBLE NULL DEFAULT NULL,
  `Half-time Away Goals` DOUBLE NULL DEFAULT NULL,
  `Referee` TEXT NULL DEFAULT NULL,
  `Assistant 1` TEXT NULL DEFAULT NULL,
  `Assistant 2` TEXT NULL DEFAULT NULL,
  `Home Team Initials` TEXT NULL DEFAULT NULL,
  `Away Team Initials` TEXT NULL DEFAULT NULL,
  `wc_to_sql_year_id` INT NULL,
  `wc_to_sql_year_id1` INT NOT NULL,
  PRIMARY KEY (`MatchID`, `wc_to_sql_year_id1`),
  UNIQUE INDEX `MatchID_UNIQUE` (`MatchID` ASC) VISIBLE,
  INDEX `fk_matches_to_sql_wc_to_sql_idx` (`wc_to_sql_year_id1` ASC) VISIBLE,
  CONSTRAINT `fk_matches_to_sql_wc_to_sql`
    FOREIGN KEY (`wc_to_sql_year_id1`)
    REFERENCES `fifa`.`wc_to_sql` (`year_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fifa`.`players_to_sql`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fifa`.`players_to_sql` (
  `player_id` INT NOT NULL,
  `RoundID` INT NULL DEFAULT NULL,
  `MatchID` INT NULL DEFAULT NULL,
  `Team Initials` TEXT NULL DEFAULT NULL,
  `Coach Name` TEXT NULL DEFAULT NULL,
  `Line-up` TEXT NULL DEFAULT NULL,
  `Player Name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE INDEX `player_id_UNIQUE` (`player_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `fifawc` ;

-- -----------------------------------------------------
-- Table `fifawc`.`wc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fifawc`.`wc` (
  `year_id` INT NOT NULL,
  `Country` TEXT NULL DEFAULT NULL,
  `Winner` TEXT NULL DEFAULT NULL,
  `Runners-Up` TEXT NULL DEFAULT NULL,
  `Third` TEXT NULL DEFAULT NULL,
  `Fourth` TEXT NULL DEFAULT NULL,
  `GoalsScored` INT NULL DEFAULT NULL,
  `QualifiedTeams` INT NULL DEFAULT NULL,
  `MatchesPlayed` INT NULL DEFAULT NULL,
  `Attendance` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`year_id`),
  UNIQUE INDEX `year_id_UNIQUE` (`year_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fifawc`.`matches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fifawc`.`matches` (
  `MatchID` INT NOT NULL,
  `year_id` INT NULL DEFAULT NULL,
  `RoundID` INT NULL DEFAULT NULL,
  `Datetime` TEXT NULL DEFAULT NULL,
  `Stage` TEXT NULL DEFAULT NULL,
  `Stadium` TEXT NULL DEFAULT NULL,
  `City` TEXT NULL DEFAULT NULL,
  `Home Team Name` TEXT NULL DEFAULT NULL,
  `Home Team Goals` DOUBLE NULL DEFAULT NULL,
  `Away Team Goals` DOUBLE NULL DEFAULT NULL,
  `Away Team Name` TEXT NULL DEFAULT NULL,
  `Win conditions` TEXT NULL DEFAULT NULL,
  `Attendance` INT NULL DEFAULT NULL,
  `Half-time Home Goals` DOUBLE NULL DEFAULT NULL,
  `Half-time Away Goals` DOUBLE NULL DEFAULT NULL,
  `Referee` TEXT NULL DEFAULT NULL,
  `Assistant 1` TEXT NULL DEFAULT NULL,
  `Assistant 2` TEXT NULL DEFAULT NULL,
  `Home Team Initials` TEXT NULL DEFAULT NULL,
  `Away Team Initials` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`MatchID`),
  UNIQUE INDEX `MatchID_UNIQUE` (`MatchID` ASC) VISIBLE,
  INDEX `fk_year_id` (`year_id` ASC) VISIBLE,
  CONSTRAINT `fk_year_id`
    FOREIGN KEY (`year_id`)
    REFERENCES `fifawc`.`wc` (`year_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fifawc`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fifawc`.`players` (
  `player_id` INT NOT NULL,
  `RoundID` INT NULL DEFAULT NULL,
  `MatchID` INT NULL DEFAULT NULL,
  `Team Initials` TEXT NULL DEFAULT NULL,
  `Coach Name` TEXT NULL DEFAULT NULL,
  `Line-up` TEXT NULL DEFAULT NULL,
  `Player Name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE INDEX `player_id_UNIQUE` (`player_id` ASC) VISIBLE,
  INDEX `fk_match_id` (`MatchID` ASC) VISIBLE,
  CONSTRAINT `fk_match_id`
    FOREIGN KEY (`MatchID`)
    REFERENCES `fifawc`.`matches` (`MatchID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
