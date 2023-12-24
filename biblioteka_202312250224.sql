﻿--
-- Script was generated by Devart dbForge Studio for MySQL, Version 10.0.60.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 25.12.2023 2:25:00
-- Server version: 5.5.25
--

--
-- Disable foreign keys
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

--
-- Set SQL mode
--
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE biblioteka;

--
-- Drop table `popolnenie_fonda`
--
DROP TABLE IF EXISTS popolnenie_fonda;

--
-- Drop table `tip_literatyre`
--
DROP TABLE IF EXISTS tip_literatyre;

--
-- Drop table `сotrudniki`
--
DROP TABLE IF EXISTS сotrudniki;

--
-- Drop table `biblioteki`
--
DROP TABLE IF EXISTS biblioteki;

--
-- Set default database
--
USE biblioteka;

--
-- Create table `biblioteki`
--
CREATE TABLE biblioteki (
  id_fond int(11) NOT NULL AUTO_INCREMENT,
  nazvanie_fonda varchar(45) DEFAULT NULL,
  biblioteka varchar(45) DEFAULT NULL,
  `kol-vo_knig` int(11) DEFAULT NULL,
  `kol-vo_jurnalov` int(11) DEFAULT NULL,
  `kol-vo_gazet` int(11) DEFAULT NULL,
  `kol-vo_cbornicov` int(11) DEFAULT NULL,
  `kol-vo_diccertauiy` int(11) DEFAULT NULL,
  `kol-vo_referatov` int(11) DEFAULT NULL,
  PRIMARY KEY (id_fond)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create index `UK_biblioteki_biblioteka` on table `biblioteki`
--
ALTER TABLE biblioteki
ADD UNIQUE INDEX UK_biblioteki_biblioteka (biblioteka);

--
-- Create table `сotrudniki`
--
CREATE TABLE сotrudniki (
  id_cotrydnika int(11) NOT NULL,
  fio varchar(45) DEFAULT NULL,
  biblioteka varchar(45) DEFAULT NULL,
  dolzhnost varchar(45) DEFAULT NULL,
  god_rozhdeniya year(4) DEFAULT NULL,
  god_poctypleniya_na_raboty year(4) DEFAULT NULL,
  obrazovanie varchar(45) DEFAULT NULL,
  zarplata int(11) DEFAULT NULL,
  PRIMARY KEY (id_cotrydnika)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create foreign key
--
ALTER TABLE сotrudniki
ADD CONSTRAINT FK_сotrudniki_biblioteka FOREIGN KEY (biblioteka)
REFERENCES biblioteki (biblioteka) ON DELETE NO ACTION;

--
-- Create table `tip_literatyre`
--
CREATE TABLE tip_literatyre (
  id_tip_literatyre int(11) NOT NULL,
  nazvanie_tipa_literatyre varchar(45) NOT NULL,
  PRIMARY KEY (id_tip_literatyre)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create table `popolnenie_fonda`
--
CREATE TABLE popolnenie_fonda (
  id_fond int(11) NOT NULL,
  id_cotrydnika int(11) NOT NULL,
  id_tip_literatyre int(11) NOT NULL,
  data date DEFAULT NULL,
  nazvanie_istochnika_literature varchar(45) DEFAULT NULL,
  izdatelctvo varchar(45) DEFAULT NULL,
  data_izdanya date DEFAULT NULL,
  `kol-vo_ekzemplyarovl` int(11) DEFAULT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create foreign key
--
ALTER TABLE popolnenie_fonda
ADD CONSTRAINT FK_popolnenie_fonda_id_fond FOREIGN KEY (id_fond)
REFERENCES biblioteki (id_fond) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE popolnenie_fonda
ADD CONSTRAINT FK_popolnenie_fonda_id_cotrydnika FOREIGN KEY (id_cotrydnika)
REFERENCES сotrudniki (id_cotrydnika) ON DELETE NO ACTION;

--
-- Create foreign key
--
ALTER TABLE popolnenie_fonda
ADD CONSTRAINT FK_popolnenie_fonda_id_tip_literatyre FOREIGN KEY (id_tip_literatyre)
REFERENCES tip_literatyre (id_tip_literatyre) ON DELETE NO ACTION;

-- 
-- Dumping data for table biblioteki
--
INSERT INTO biblioteki VALUES
(1, 'фонд один', 'библиотека один', 1, 0, 0, 0, 0, 0),
(2, 'фонд два', 'библиотека два', 1, 0, 0, 0, 0, 0);

-- 
-- Dumping data for table сotrudniki
--
INSERT INTO сotrudniki VALUES
(0, 'Синтюрин Егор Дмитриевич ', 'библиотека один', 'Библиотекарь', 2005, 2023, 'Кодер', 50000),
(1, 'Имя Фамилия Отчество', 'библиотека два', 'Библиотекарь', 2000, 2023, 'Образование', 10000);

-- 
-- Dumping data for table tip_literatyre
--
INSERT INTO tip_literatyre VALUES
(0, 'Постапокалиптика'),
(1, 'Боевая фантастика');

-- 
-- Dumping data for table popolnenie_fonda
--
INSERT INTO popolnenie_fonda VALUES
(1, 0, 1, '2023-12-25', 'поставщик книг', 'АСТ', '2007-08-07', 1),
(2, 1, 0, '2023-12-25', 'поставщик книг', 'АСТ', '2021-12-03', 1);

--
-- Restore previous SQL mode
--
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

--
-- Enable foreign keys
--
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;