-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex6` ;
USE `Ex6` ;

-- -----------------------------------------------------
-- Table `Ex6`.`Pasajero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6`.`Pasajero` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Pasaporte` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex6`.`Avión`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6`.`Avión` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Num_Asientos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex6`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6`.`Vuelo` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Avión_ID` INT NOT NULL,
  `Origen` VARCHAR(45) NOT NULL,
  `Destino` VARCHAR(45) NOT NULL,
  `Dia_Salida` DATE NOT NULL,
  `Hora_Salida` DATETIME NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Vuelo_Avión1_idx` (`Avión_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_Avión1`
    FOREIGN KEY (`Avión_ID`)
    REFERENCES `Ex6`.`Avión` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6`.`Reserva` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Importe` VARCHAR(45) NOT NULL,
  `Pasajero_DNI` VARCHAR(10) NOT NULL,
  `Vuelo_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Reserva_Pasajero_idx` (`Pasajero_DNI` ASC) VISIBLE,
  INDEX `fk_Reserva_Vuelo1_idx` (`Vuelo_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Pasajero`
    FOREIGN KEY (`Pasajero_DNI`)
    REFERENCES `Ex6`.`Pasajero` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vuelo1`
    FOREIGN KEY (`Vuelo_ID`)
    REFERENCES `Ex6`.`Vuelo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
