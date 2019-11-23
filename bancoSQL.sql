-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bibliografia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bibliografia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bibliografia` DEFAULT CHARACTER SET utf8 ;
USE `bibliografia` ;

-- -----------------------------------------------------
-- Table `bibliografia`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`paises` (
  `id` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `nome_pt` VARCHAR(60) NOT NULL,
  `sigla` VARCHAR(2) NOT NULL,
  `bancen` INT(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`estados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(75) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `ibge` INT(2) NOT NULL,
  `pais` INT NOT NULL,
  `ddd` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_estados_paises1_idx` (`pais` ASC),
  CONSTRAINT `fk_estados_paises1`
    FOREIGN KEY (`pais`)
    REFERENCES `bibliografia`.`paises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `uf` INT NOT NULL,
  `ibge` INT(7) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cidade_estados1_idx` (`uf` ASC),
  CONSTRAINT `fk_cidade_estados1`
    FOREIGN KEY (`uf`)
    REFERENCES `bibliografia`.`estados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`filmes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`filmes` (
  `idfilmes` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `popularidade` VARCHAR(45) NOT NULL,
  `data_lancamento` DATE NOT NULL,
  `diretorio_poster` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `votos` INT NOT NULL,
  `media_votos` DOUBLE NOT NULL,
  PRIMARY KEY (`idfilmes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`generos` (
  `idgeneros` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idgeneros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`filmes_has_generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`filmes_has_generos` (
  `filmes_idfilmes` INT NOT NULL,
  `generos_idgeneros` INT NOT NULL,
  PRIMARY KEY (`filmes_idfilmes`, `generos_idgeneros`),
  INDEX `fk_filmes_has_generos_generos1_idx` (`generos_idgeneros` ASC),
  INDEX `fk_filmes_has_generos_filmes1_idx` (`filmes_idfilmes` ASC),
  CONSTRAINT `fk_filmes_has_generos_filmes1`
    FOREIGN KEY (`filmes_idfilmes`)
    REFERENCES `bibliografia`.`filmes` (`idfilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filmes_has_generos_generos1`
    FOREIGN KEY (`generos_idgeneros`)
    REFERENCES `bibliografia`.`generos` (`idgeneros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`produtora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`produtora` (
  `idprodutora` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `cidade_sede` INT NOT NULL,
  `site` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprodutora`),
  INDEX `fk_produtora_cidade1_idx` (`cidade_sede` ASC),
  CONSTRAINT `fk_produtora_cidade1`
    FOREIGN KEY (`cidade_sede`)
    REFERENCES `bibliografia`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`filmes_has_produtora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`filmes_has_produtora` (
  `filmes_idfilmes` INT NOT NULL,
  `produtora_idprodutora` INT NOT NULL,
  PRIMARY KEY (`filmes_idfilmes`, `produtora_idprodutora`),
  INDEX `fk_filmes_has_produtora_produtora1_idx` (`produtora_idprodutora` ASC),
  INDEX `fk_filmes_has_produtora_filmes1_idx` (`filmes_idfilmes` ASC),
  CONSTRAINT `fk_filmes_has_produtora_filmes1`
    FOREIGN KEY (`filmes_idfilmes`)
    REFERENCES `bibliografia`.`filmes` (`idfilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filmes_has_produtora_produtora1`
    FOREIGN KEY (`produtora_idprodutora`)
    REFERENCES `bibliografia`.`produtora` (`idprodutora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`cidade_has_filmes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`cidade_has_filmes` (
  `cidade_idcidade` INT NOT NULL,
  `filmes_idfilmes` INT NOT NULL,
  PRIMARY KEY (`cidade_idcidade`, `filmes_idfilmes`),
  INDEX `fk_cidade_has_filmes_filmes1_idx` (`filmes_idfilmes` ASC),
  INDEX `fk_cidade_has_filmes_cidade1_idx` (`cidade_idcidade` ASC),
  CONSTRAINT `fk_cidade_has_filmes_cidade1`
    FOREIGN KEY (`cidade_idcidade`)
    REFERENCES `bibliografia`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cidade_has_filmes_filmes1`
    FOREIGN KEY (`filmes_idfilmes`)
    REFERENCES `bibliografia`.`filmes` (`idfilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`series` (
  `idseries` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `em_producao` TINYINT(1) NOT NULL,
  `ultima_temporada` DATE NOT NULL,
  `descricao` VARCHAR(300) NOT NULL,
  `poster` VARCHAR(40) NOT NULL,
  `populariadade` DOUBLE(2,1) NOT NULL,
  PRIMARY KEY (`idseries`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`temporadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`temporadas` (
  `idtemporadas` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `numero_epsodios` INT NOT NULL,
  `series_idseries` INT NOT NULL,
  `data_lancamento` DATE NOT NULL,
  `descricao` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idtemporadas`),
  INDEX `fk_temporadas_series1_idx` (`series_idseries` ASC),
  CONSTRAINT `fk_temporadas_series1`
    FOREIGN KEY (`series_idseries`)
    REFERENCES `bibliografia`.`series` (`idseries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`produtora_has_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`produtora_has_series` (
  `produtora_idprodutora` INT NOT NULL,
  `series_idseries` INT NOT NULL,
  PRIMARY KEY (`produtora_idprodutora`, `series_idseries`),
  INDEX `fk_produtora_has_series_series1_idx` (`series_idseries` ASC),
  INDEX `fk_produtora_has_series_produtora1_idx` (`produtora_idprodutora` ASC),
  CONSTRAINT `fk_produtora_has_series_produtora1`
    FOREIGN KEY (`produtora_idprodutora`)
    REFERENCES `bibliografia`.`produtora` (`idprodutora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtora_has_series_series1`
    FOREIGN KEY (`series_idseries`)
    REFERENCES `bibliografia`.`series` (`idseries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`generos_has_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`generos_has_series` (
  `generos_idgeneros` INT NOT NULL,
  `series_idseries` INT NOT NULL,
  PRIMARY KEY (`generos_idgeneros`, `series_idseries`),
  INDEX `fk_generos_has_series_series1_idx` (`series_idseries` ASC),
  INDEX `fk_generos_has_series_generos1_idx` (`generos_idgeneros` ASC),
  CONSTRAINT `fk_generos_has_series_generos1`
    FOREIGN KEY (`generos_idgeneros`)
    REFERENCES `bibliografia`.`generos` (`idgeneros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_generos_has_series_series1`
    FOREIGN KEY (`series_idseries`)
    REFERENCES `bibliografia`.`series` (`idseries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`servico_streaming`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`servico_streaming` (
  `idservico_streaming` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `site` VARCHAR(50) NULL,
  PRIMARY KEY (`idservico_streaming`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`filmes_has_servico_streaming`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`filmes_has_servico_streaming` (
  `filmes_idfilmes` INT NOT NULL,
  `servico_streaming_idservico_streaming` INT NOT NULL,
  PRIMARY KEY (`filmes_idfilmes`, `servico_streaming_idservico_streaming`),
  INDEX `fk_filmes_has_servico_streaming_servico_streaming1_idx` (`servico_streaming_idservico_streaming` ASC),
  INDEX `fk_filmes_has_servico_streaming_filmes1_idx` (`filmes_idfilmes` ASC),
  CONSTRAINT `fk_filmes_has_servico_streaming_filmes1`
    FOREIGN KEY (`filmes_idfilmes`)
    REFERENCES `bibliografia`.`filmes` (`idfilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filmes_has_servico_streaming_servico_streaming1`
    FOREIGN KEY (`servico_streaming_idservico_streaming`)
    REFERENCES `bibliografia`.`servico_streaming` (`idservico_streaming`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`series_has_servico_streaming`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`series_has_servico_streaming` (
  `series_idseries` INT NOT NULL,
  `servico_streaming_idservico_streaming` INT NOT NULL,
  PRIMARY KEY (`series_idseries`, `servico_streaming_idservico_streaming`),
  INDEX `fk_series_has_servico_streaming_servico_streaming1_idx` (`servico_streaming_idservico_streaming` ASC),
  INDEX `fk_series_has_servico_streaming_series1_idx` (`series_idseries` ASC),
  CONSTRAINT `fk_series_has_servico_streaming_series1`
    FOREIGN KEY (`series_idseries`)
    REFERENCES `bibliografia`.`series` (`idseries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_series_has_servico_streaming_servico_streaming1`
    FOREIGN KEY (`servico_streaming_idservico_streaming`)
    REFERENCES `bibliografia`.`servico_streaming` (`idservico_streaming`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`atores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`atores` (
  `idatores` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `biografia` VARCHAR(200) NOT NULL,
  `popularidade` DOUBLE(2,1) NOT NULL,
  `foto` VARCHAR(70) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`idatores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`elenco_filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`elenco_filme` (
  `atores_idatores` INT NOT NULL,
  `filmes_idfilmes` INT NOT NULL,
  PRIMARY KEY (`atores_idatores`, `filmes_idfilmes`),
  INDEX `fk_atores_has_filmes_filmes1_idx` (`filmes_idfilmes` ASC),
  INDEX `fk_atores_has_filmes_atores1_idx` (`atores_idatores` ASC),
  CONSTRAINT `fk_atores_has_filmes_atores1`
    FOREIGN KEY (`atores_idatores`)
    REFERENCES `bibliografia`.`atores` (`idatores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atores_has_filmes_filmes1`
    FOREIGN KEY (`filmes_idfilmes`)
    REFERENCES `bibliografia`.`filmes` (`idfilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`series_elenco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`series_elenco` (
  `series_idseries` INT NOT NULL,
  `atores_idatores` INT NOT NULL,
  PRIMARY KEY (`series_idseries`, `atores_idatores`),
  INDEX `fk_series_has_atores_atores1_idx` (`atores_idatores` ASC),
  INDEX `fk_series_has_atores_series1_idx` (`series_idseries` ASC),
  CONSTRAINT `fk_series_has_atores_series1`
    FOREIGN KEY (`series_idseries`)
    REFERENCES `bibliografia`.`series` (`idseries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_series_has_atores_atores1`
    FOREIGN KEY (`atores_idatores`)
    REFERENCES `bibliografia`.`atores` (`idatores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`producao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`producao` (
  `idproducao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `foto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproducao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`filmes_has_producao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`filmes_has_producao` (
  `filmes_idfilmes` INT NOT NULL,
  `producao_idproducao` INT NOT NULL,
  PRIMARY KEY (`filmes_idfilmes`, `producao_idproducao`),
  INDEX `fk_filmes_has_producao_producao1_idx` (`producao_idproducao` ASC),
  INDEX `fk_filmes_has_producao_filmes1_idx` (`filmes_idfilmes` ASC),
  CONSTRAINT `fk_filmes_has_producao_filmes1`
    FOREIGN KEY (`filmes_idfilmes`)
    REFERENCES `bibliografia`.`filmes` (`idfilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filmes_has_producao_producao1`
    FOREIGN KEY (`producao_idproducao`)
    REFERENCES `bibliografia`.`producao` (`idproducao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`producao_has_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`producao_has_series` (
  `producao_idproducao` INT NOT NULL,
  `series_idseries` INT NOT NULL,
  PRIMARY KEY (`producao_idproducao`, `series_idseries`),
  INDEX `fk_producao_has_series_series1_idx` (`series_idseries` ASC),
  INDEX `fk_producao_has_series_producao1_idx` (`producao_idproducao` ASC),
  CONSTRAINT `fk_producao_has_series_producao1`
    FOREIGN KEY (`producao_idproducao`)
    REFERENCES `bibliografia`.`producao` (`idproducao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producao_has_series_series1`
    FOREIGN KEY (`series_idseries`)
    REFERENCES `bibliografia`.`series` (`idseries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`epsodio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`epsodio` (
  `idepsodio` INT NOT NULL AUTO_INCREMENT,
  `temporadas` INT NOT NULL,
  `nome` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(300) NOT NULL,
  `popularidade` DOUBLE(2,1) NOT NULL,
  PRIMARY KEY (`idepsodio`),
  INDEX `fk_epsodio_temporadas1_idx` (`temporadas` ASC),
  CONSTRAINT `fk_epsodio_temporadas1`
    FOREIGN KEY (`temporadas`)
    REFERENCES `bibliografia`.`temporadas` (`idtemporadas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliografia`.`series_has_cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliografia`.`series_has_cidade` (
  `series_idseries` INT NOT NULL,
  `cidade_id` INT NOT NULL,
  PRIMARY KEY (`series_idseries`, `cidade_id`),
  INDEX `fk_series_has_cidade_cidade1_idx` (`cidade_id` ASC),
  INDEX `fk_series_has_cidade_series1_idx` (`series_idseries` ASC),
  CONSTRAINT `fk_series_has_cidade_series1`
    FOREIGN KEY (`series_idseries`)
    REFERENCES `bibliografia`.`series` (`idseries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_series_has_cidade_cidade1`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `bibliografia`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
