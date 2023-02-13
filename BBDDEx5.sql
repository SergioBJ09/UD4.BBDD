-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex5` ;
USE `Ex5` ;

-- -----------------------------------------------------
-- Table `Ex5`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5`.`Cliente` (
  `Usuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Población` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Nº Vehiculos` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  UNIQUE INDEX `Usuario_UNIQUE` (`Usuario` ASC) VISIBLE,
  PRIMARY KEY (`Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex5`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5`.`Vehiculo` (
  `Matricula` VARCHAR(45) NOT NULL,
  `Tipo Vehiculo` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5`.`Cita` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Dia` DATE NOT NULL,
  `Hora` DATETIME NOT NULL,
  `Cliente_Usuario` VARCHAR(45) NOT NULL,
  `Vehiculo_Matricula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Cita_Cliente1_idx` (`Cliente_Usuario` ASC) VISIBLE,
  INDEX `fk_Cita_Vehiculo1_idx` (`Vehiculo_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Cliente1`
    FOREIGN KEY (`Cliente_Usuario`)
    REFERENCES `Ex5`.`Cliente` (`Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Vehiculo1`
    FOREIGN KEY (`Vehiculo_Matricula`)
    REFERENCES `Ex5`.`Vehiculo` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
