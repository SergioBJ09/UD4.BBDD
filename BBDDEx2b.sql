-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex2.b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex2.b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex2.b` ;
USE `Ex2.b` ;

-- -----------------------------------------------------
-- Table `Ex2.b`.`Tipo Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2.b`.`Tipo Tarifa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2.b`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2.b`.`Cine` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Nº Salas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2.b`.`Entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2.b`.`Entrada` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Fecha` VARCHAR(45) NOT NULL,
  `Tipo Tarifa_ID` INT NOT NULL,
  `Cine_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Entrada_Tipo Tarifa_idx` (`Tipo Tarifa_ID` ASC) VISIBLE,
  INDEX `fk_Entrada_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_Entrada_Tipo Tarifa`
    FOREIGN KEY (`Tipo Tarifa_ID`)
    REFERENCES `Ex2.b`.`Tipo Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrada_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `Ex2.b`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2.b`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2.b`.`Pelicula` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NOT NULL,
  `Dirigido a` VARCHAR(45) NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2.b`.`Proyecciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2.b`.`Proyecciones` (
  `Dia` INT NOT NULL,
  `Dia` VARCHAR(45) NOT NULL,
  `Cine_ID` INT NOT NULL,
  `Pelicula_ID` INT NOT NULL,
  PRIMARY KEY (`Dia`),
  INDEX `fk_Proyecciones_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  INDEX `fk_Proyecciones_Pelicula1_idx` (`Pelicula_ID` ASC) VISIBLE,
  UNIQUE INDEX `Dia_UNIQUE` (`Dia` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecciones_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `Ex2.b`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecciones_Pelicula1`
    FOREIGN KEY (`Pelicula_ID`)
    REFERENCES `Ex2.b`.`Pelicula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
