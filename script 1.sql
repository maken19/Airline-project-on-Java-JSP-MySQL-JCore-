CREATE DATABASE IF NOT EXISTS airlines CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE airlines;

CREATE TABLE IF NOT EXISTS trips (
	tripId INT NOT NULL AUTO_INCREMENT,
	tripDate DATE NOT NULL,
    tripName VARCHAR(255) NOT NULL,
	status ENUM('WAITING', 'PERFORMED', 'DONE') NOT NULL DEFAULT 'WAITING',
	PRIMARY KEY ( tripId ),
	UNIQUE ( tripId )
);

CREATE TABLE IF NOT EXISTS brigades (
	brigadeId INT NOT NULL AUTO_INCREMENT,
    brigadeName VARCHAR(255) NOT NULL,
    /*memberName VARCHAR(255) NOT NULL,
    memberSurname VARCHAR(255) NOT NULL,
    status ENUM('PILOT', 'NAVIGATOR', 'RADIOOPERATOR', 'STEWARDESS', 'ADMINISTRATOR', 'DISPETCHER') NOT NULL DEFAULT 'STEWARDESS',*/
	/*pilotName VARCHAR(255) NOT NULL,
    navigatorsName VARCHAR(255) NOT NULL,
    radiooperatorName VARCHAR(255) NOT NULL,
    stewardessName VARCHAR(255) NOT NULL,*/
	PRIMARY KEY ( brigadeId ),
	UNIQUE ( brigadeId )
    /*UNIQUE ( memberName ),
    UNIQUE ( memberSurname )*/
);

CREATE TABLE IF NOT EXISTS employees (
	employeeId INT NOT NULL AUTO_INCREMENT,
	employeeName VARCHAR(255) NOT NULL,
    employeeSurname VARCHAR(255) NOT NULL,
	status ENUM('PILOT', 'NAVIGATOR', 'RADIOOPERATOR', 'STEWARDESS', 'ADMINISTRATOR', 'DISPETCHER') NOT NULL DEFAULT 'STEWARDESS',
    login VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    /*isWorkerOfPlane TINYINT NOT NULL DEFAULT 1,*/
    idBrigade INT NULL,
	PRIMARY KEY ( employeeId ),
	UNIQUE ( employeeId )
   /* UNIQUE ( idBrigade )
    CONSTRAINT FK_Employee_Brigade FOREIGN KEY (idBrigade)
        REFERENCES airlines.brigades (brigadeId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        UNIQUE ( idBrigade ),
    CONSTRAINT FK_Employee_Brigade FOREIGN KEY (idBrigade)
        REFERENCES airlines.brigades (brigadeId)
        ON DELETE CASCADE
        ON UPDATE CASCADE*/
);

CREATE TABLE IF NOT EXISTS aircrafts (
	aircraftId INT NOT NULL AUTO_INCREMENT,
    aircraftName VARCHAR(255) NOT NULL,
	status ENUM('WAITING', 'PERFORMED', 'DONE') NOT NULL DEFAULT 'WAITING',
    capacity REAL NOT NULL,
    idTrip INT  NULL,
/*brigades_brigadeId INT NULL,*/
  PRIMARY KEY (`aircraftId`),
  UNIQUE INDEX `aircraftId` (`aircraftId` ASC) VISIBLE,
  INDEX `fk_aircrafts_brigades1_idx` (`aircraftId` ASC) VISIBLE,
  CONSTRAINT `fk_aircrafts_brigades1`
    FOREIGN KEY (`aircraftId`)
    REFERENCES `airlines`.`brigades` (`brigadeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
      /*CONSTRAINT `fk_aircrafts_brigades1`
    FOREIGN KEY (`brigadeId`)
    REFERENCES `airlines`.`brigades` (`brigadeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION*/
);

/*CREATE TABLE IF NOT EXISTS administrators (
	administratorId INT NOT NULL AUTO_INCREMENT,
	administratorName VARCHAR(255) NOT NULL,
	administratorSurname VARCHAR(255) NOT NULL,
	PRIMARY KEY ( administratorId ),
	UNIQUE ( administratorId )
);

CREATE TABLE IF NOT EXISTS dispetchers (
	dispetcherId INT NOT NULL AUTO_INCREMENT,
	dispetcherName VARCHAR(255) NOT NULL,
	dispetcherSurname VARCHAR(255) NOT NULL,
	PRIMARY KEY ( dispetcherId ),
	UNIQUE ( dispetcherId )
);*/

ALTER TABLE trips CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
ALTER TABLE brigades CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
ALTER TABLE employees CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
ALTER TABLE aircrafts CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
/*ALTER TABLE administrators CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
ALTER TABLE dispetchers CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;*/

/*INSERT INTO `airlines`.aircrafts (aircraftId, aircraftName, status, capacity) VALUES (0, 'Boeing - 767', 1, 70);
INSERT INTO `airlines`.aircrafts (aircraftName, status, capacity) VALUES ('Boeing - 777', 2, 75);
INSERT INTO `airlines`.aircrafts (aircraftName, status, capacity) VALUES ('Tu - 204', 3, 80);

INSERT INTO `airlines`.administrators (administratorId, administratorName, administratorSurname) VALUES (0, 'Владимир', 'Львович');
INSERT INTO `airlines`.administrators (administratorName, administratorSurname) VALUES ('Олег', 'Владимирович');

INSERT INTO `airlines`.dispetchers (dispetcherId, dispetcherName, dispetcherSurname) VALUES (0, 'Казимир', 'Станиславович');
INSERT INTO `airlines`.dispetchers (dispetcherName, dispetcherSurname) VALUES ('Константин', 'Дмитриевич');*/



/*INSERT INTO `airlines`.brigades (brigadeId, brigadeName) VALUES (1, 'Первая');
INSERT INTO `airlines`.brigades (brigadeId, brigadeName) VALUES (2, 'Вторая');
INSERT INTO `airlines`.brigades (brigadeId, brigadeName) VALUES (3, 'Третья');
INSERT INTO `airlines`.brigades (brigadeId, brigadeName) VALUES (4, 'Четвертая');
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();
INSERT INTO `airlines`.brigades (brigadeId) VALUES ();*/


/*INSERT INTO `airlines`.employees (employeeId, employeeName, employeeSurname, status, login, password, idBrigade) VALUES (0, 'Денис', 'qwert', 1, 'qwds', 'qw213', 1);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Лев', 'zxcv', 1, 'zxcasd', 'sdfw213', 2);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Владислав', 'asdf', 1, 'vsdvsf', 'qw232113', 3);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Максим', 'vbnn', 1, 'ghd', 'qasdw213', 4);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Иван', 'fghhj', 2, 'zxcv412', 'qwbfdva213', 1);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Дмитрий', 'hjkk', 2, 'zxcv12', 'q123w213', 2);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Павел', 'uiop', 2, 'zxcvvad', '123qw213', 3);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Максим', 'rtyu', 2, 'zxcv4123123', '213qw213', 4);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Николай', 'dfgh', 3, 'zxcv4', 'qwbvc213', 1);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Александр', 'nnmb', 3, 'zxcva', '123qw213', 2);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Дмитрий', 'ghja', 3, 'zxcvvscv123', '1234qw213', 3);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Иннокентий', 'tyuu', 3, 'zvsdxcv', 'ntheqw213', 4);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Лариса', 'xmxv', 4, 'zxcv123sfv', '123fhbeqw213', 1);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Татьяна', 'qwert', 4, 'zxcasdv', 'qw213124dgs', 2);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Ирина', 'vbnm', 4, 'zxcv345t1', 'wer21s2qw213', 3);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password, idBrigade) VALUES ('Ксения', 'asdfg', 4, 'zxcbdadv', 'qw21312dgds', 4);
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password) VALUES ('Казимир', 'ytuie', 5, 'zxc34fdscv', '14dvvaqw213');
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password) VALUES ('Константин', 'vlska', 5, 'zxcqw12v', 'qw21dsf3');
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password) VALUES ('Владимир', 'vlkad', 6, 'zdv1r4txcv', 'qasf321w213');
INSERT INTO `airlines`.employees (employeeName, employeeSurname, status, login, password) VALUES ('Олег', 'oiiew', 6, 'zxcv124gd', 'qw214tvarf13');

INSERT INTO `airlines`.trips (tripId, tripDate, tripName, status) VALUES (0, '2019-07-01','Гомель - Москва', 1);
INSERT INTO `airlines`.trips (tripDate, tripName, status) VALUES ('2019-07-02','Гомель - Киев', 1);
INSERT INTO `airlines`.trips (tripDate, tripName, status) VALUES ('2019-07-03','Гомель - Варшава', 1);*/



