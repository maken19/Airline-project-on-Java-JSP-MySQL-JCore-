CREATE TABLE IF NOT EXISTS `airlines`.`aircrafts` (
  `aircraftId` INT(11) NOT NULL AUTO_INCREMENT,
  `aircraftName` VARCHAR(255) NOT NULL,
  `status` ENUM('WAITING', 'PERFORMED', 'DONE') NOT NULL DEFAULT 'WAITING',
  `capacity` DOUBLE NOT NULL,
  `idTrip` INT(11) NULL DEFAULT NULL,
  `brigades_brigadeId` INT(11) NOT NULL,
  PRIMARY KEY (`aircraftId`, `brigades_brigadeId`),
  UNIQUE INDEX `aircraftId` (`aircraftId` ASC) VISIBLE,
  INDEX `FK_Aircr_Trip_idx` (`idTrip` ASC) VISIBLE,
  INDEX `fk_aircrafts_brigades1_idx` (`brigades_brigadeId` ASC) VISIBLE,
  CONSTRAINT `FK_Aircr_Trip`
    FOREIGN KEY (`idTrip`)
    REFERENCES `airlines`.`trips` (`tripId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_aircrafts_brigades1`
    FOREIGN KEY (`brigades_brigadeId`)
    REFERENCES `airlines`.`brigades` (`brigadeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4

CREATE TABLE IF NOT EXISTS `airlines`.`aircrafts` (
  `aircraftId` INT(11) NOT NULL AUTO_INCREMENT,
  `aircraftName` VARCHAR(255) NOT NULL,
  `status` ENUM('WAITING', 'PERFORMED', 'DONE') NOT NULL DEFAULT 'WAITING',
  `capacity` DOUBLE NOT NULL,
  `brigades_brigadeId` INT(11) NOT NULL,
  PRIMARY KEY (`aircraftId`),
  UNIQUE INDEX `aircraftId` (`aircraftId` ASC) VISIBLE,
  INDEX `fk_aircrafts_brigades1_idx` (`brigades_brigadeId` ASC) VISIBLE,
  CONSTRAINT `fk_aircrafts_brigades1`
    FOREIGN KEY (`aircraftId`)
    REFERENCES `airlines`.`brigades` (`brigadeId`)
    ON DELETE cascade
    ON UPDATE NO cascade)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4