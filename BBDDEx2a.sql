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
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paciente` (
  `Nº Seguridad Social` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Correu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nº Seguridad Social`),
  UNIQUE INDEX `Nº Seguridad Social_UNIQUE` (`Nº Seguridad Social` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medico` (
  `Certificado Escuela de Medicos` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Certificado Escuela de Medicos`),
  UNIQUE INDEX `Certificado Escuela de Medicos_UNIQUE` (`Certificado Escuela de Medicos` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `ID Consulta` INT NOT NULL AUTO_INCREMENT,
  `Consultacol` VARCHAR(45) NULL,
  `Paciente_Nº Seguridad Social` INT NOT NULL,
  `Medico_Certificado Escuela de Medicos` INT NOT NULL,
  PRIMARY KEY (`ID Consulta`),
  INDEX `fk_Consulta_Paciente_idx` (`Paciente_Nº Seguridad Social` ASC) VISIBLE,
  INDEX `fk_Consulta_Medico1_idx` (`Medico_Certificado Escuela de Medicos` ASC) VISIBLE,
  UNIQUE INDEX `ID Consulta_UNIQUE` (`ID Consulta` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Paciente`
    FOREIGN KEY (`Paciente_Nº Seguridad Social`)
    REFERENCES `mydb`.`Paciente` (`Nº Seguridad Social`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Medico1`
    FOREIGN KEY (`Medico_Certificado Escuela de Medicos`)
    REFERENCES `mydb`.`Medico` (`Certificado Escuela de Medicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
