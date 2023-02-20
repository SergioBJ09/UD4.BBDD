-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex7` ;
USE `Ex7` ;

-- -----------------------------------------------------
-- Table `Ex7`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ex7`.`Empleado` ;

CREATE TABLE IF NOT EXISTS `Ex7`.`Empleado` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Edad` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7`.`Ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ex7`.`Ticket` ;

CREATE TABLE IF NOT EXISTS `Ex7`.`Ticket` (
  `ID` INT NOT NULL,
  `Nº_Factura` VARCHAR(45) NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Precio_IVA_Incluido` VARCHAR(45) NOT NULL,
  `Empleado_DNI` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Ticket_Empleado1_idx` (`Empleado_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Empleado1`
    FOREIGN KEY (`Empleado_DNI`)
    REFERENCES `Ex7`.`Empleado` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ex7`.`Producto` ;

CREATE TABLE IF NOT EXISTS `Ex7`.`Producto` (
  `Codigo_Interno` INT NOT NULL,
  `Codigo_Barras` VARCHAR(45) NOT NULL,
  `Precio_Unitario` VARCHAR(45) NOT NULL,
  `IVA` VARCHAR(45) NOT NULL,
  `Precio_Final` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codigo_Interno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7`.`Linea Ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ex7`.`Linea Ticket` ;

CREATE TABLE IF NOT EXISTS `Ex7`.`Linea Ticket` (
  `ID` INT NOT NULL,
  `Descripción_Producto` VARCHAR(45) NOT NULL,
  `Unidades_Descuento` VARCHAR(45) NOT NULL,
  `Precio_Total` VARCHAR(45) NOT NULL,
  `Precio_Unitario_IVA` VARCHAR(45) NOT NULL,
  `Ticket_ID` INT NOT NULL,
  `Producto_Codigo_Interno` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Linea Ticket_Ticket1_idx` (`Ticket_ID` ASC) VISIBLE,
  INDEX `fk_Linea Ticket_Producto1_idx` (`Producto_Codigo_Interno` ASC) VISIBLE,
  CONSTRAINT `fk_Linea Ticket_Ticket1`
    FOREIGN KEY (`Ticket_ID`)
    REFERENCES `Ex7`.`Ticket` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linea Ticket_Producto1`
    FOREIGN KEY (`Producto_Codigo_Interno`)
    REFERENCES `Ex7`.`Producto` (`Codigo_Interno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
