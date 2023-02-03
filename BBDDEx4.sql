-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `VIP` TINYINT NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo Poliza` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `ID_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Poliza` (
  `Nº Poliza` VARCHAR(45) NOT NULL,
  `Cliente_DNI` VARCHAR(10) NOT NULL,
  `Importe` VARCHAR(45) NOT NULL,
  `Fecha de Inicio` DATE NOT NULL,
  `Fecha de Fin` DATE NOT NULL,
  `Tipo de Pago` VARCHAR(45) NOT NULL,
  `Tipo Poliza_ID` INT NOT NULL,
  `Vendedor_DNI` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Nº Poliza`),
  UNIQUE INDEX `ID_UNIQUE` (`Nº Poliza` ASC) VISIBLE,
  INDEX `fk_Poliza_Cliente_idx` (`Cliente_DNI` ASC) VISIBLE,
  INDEX `fk_Poliza_Tipo Poliza1_idx` (`Tipo Poliza_ID` ASC) VISIBLE,
  INDEX `fk_Poliza_Vendedor1_idx` (`Vendedor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Poliza_Cliente`
    FOREIGN KEY (`Cliente_DNI`)
    REFERENCES `mydb`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Tipo Poliza1`
    FOREIGN KEY (`Tipo Poliza_ID`)
    REFERENCES `mydb`.`Tipo Poliza` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Vendedor1`
    FOREIGN KEY (`Vendedor_DNI`)
    REFERENCES `mydb`.`Vendedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
