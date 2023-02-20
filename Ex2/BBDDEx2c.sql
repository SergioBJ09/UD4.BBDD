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
-- Table `mydb`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumnos` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignaturas` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Creditos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamentos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Modulos Ciclo_Nombre` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Departamentos_Modulos Ciclo1_idx` (`Modulos Ciclo_Nombre` ASC) VISIBLE,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_Departamentos_Modulos Ciclo1`
    FOREIGN KEY (`Modulos Ciclo_Nombre`)
    REFERENCES `mydb`.`Asignaturas` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesor` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Titulacion` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Departamentos_Nombre` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  INDEX `fk_Profesor_Departamentos1_idx` (`Departamentos_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_Profesor_Departamentos1`
    FOREIGN KEY (`Departamentos_Nombre`)
    REFERENCES `mydb`.`Departamentos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Fecha` VARCHAR(45) NOT NULL,
  `Alumnos_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Matricula_Alumnos1_idx` (`Alumnos_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumnos1`
    FOREIGN KEY (`Alumnos_DNI`)
    REFERENCES `mydb`.`Alumnos` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matrticula/Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matrticula/Asignatura` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Modulos Ciclo_Nombre` INT NOT NULL,
  `Profesor_DNI` INT NOT NULL,
  `Matricula_ID` INT NOT NULL,
  INDEX `fk_Matrticula/Modulo_Matricula1_idx` (`Matricula_ID` ASC) VISIBLE,
  INDEX `fk_Matrticula/Modulo_Modulos Ciclo1_idx` (`Modulos Ciclo_Nombre` ASC) VISIBLE,
  INDEX `fk_Matrticula/Modulo_Profesor1_idx` (`Profesor_DNI` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_Matrticula/Modulo_Matricula1`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `mydb`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matrticula/Modulo_Modulos Ciclo1`
    FOREIGN KEY (`Modulos Ciclo_Nombre`)
    REFERENCES `mydb`.`Asignaturas` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matrticula/Modulo_Profesor1`
    FOREIGN KEY (`Profesor_DNI`)
    REFERENCES `mydb`.`Profesor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
