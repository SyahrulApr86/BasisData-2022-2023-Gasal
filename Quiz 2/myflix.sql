CREATE SCHEMA myflix;

SET search_path TO myflix;

CREATE TABLE users (
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(12) NOT NULL,
    PhoneNum VARCHAR(13) NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Birthyear integer NOT NULL,
	PRIMARY KEY (Email));

CREATE TABLE genre (
    Id integer NOT NULL,
    Type VARCHAR(50) NOT NULL,
	PRIMARY KEY (Id)
);

	
CREATE TABLE favorite_genre (
    UId VARCHAR(100) NOT NULL,
    GId INT NOT NULL,
	PRIMARY KEY (UId, GId),
	FOREIGN KEY (GId) REFERENCES genre(Id) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (UId) REFERENCES users(Email) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE movie (
    Id integer NOT NULL,
    Title VARCHAR(50) NOT NULL,
    Description text NOT NULL,
    ReleasedYear integer NOT NULL,
    Duration TIME,
    GId integer NOT NULL,
    ViewerAgeLimit integer NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (GId) REFERENCES genre(Id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE episode (
    MId integer NOT NULL,
    Season integer NOT NULL,
    EpisodeNum integer NOT NULL,
    ETitle VARCHAR(100),
    EDuration TIME,
	PRIMARY KEY (MId, Season, EpisodeNum),
	FOREIGN KEY (MId) REFERENCES movie(Id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE watch_history (
	Id INT NOT NULL,
    UId VARCHAR(100) NOT NULL,
    MId INT NOT NULL,
    Season INT,
    EpisodeNum INT,
	DatetimeWatch TIMESTAMP NOT NULL,
    Duration TIME NOT NULL,
    Recommended VARCHAR(3) NOT NULL,
	PRIMARY KEY (Id),
	FOREIGN KEY (UId) REFERENCES users(Email) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY(MId, Season, EpisodeNum) REFERENCES episode(MId, Season, EpisodeNum) ON DELETE RESTRICT ON UPDATE CASCADE
);


INSERT INTO users VALUES
('ab@gmail.com', 'Fx0$57ex@s#8', '0812345678901', 'Andrew', 1990), 
('browneyenancy@gmail.com', 'Lz63nd5!M^Ya', '0812345678910', 'Nancy', 2014), 
('karedo.mebrown@gmail.com', '9E6d$3%to1tW', '0812345678909', 'Karina', 2015),
('katakana@gmail.com', 'zQ09u5g%uo#b', '0812345678904', 'Haruka', 2008),
('kinosuke@gmail.com', 'Xs833@Av3ry8', '0812345678905', 'Kinosuke', 2008),
('mamdu@gmail.com', 'nH302$$fIA5%', '0812345678911', 'Monalisa', 2012),
('mipo@gmail.com', '0qN&7jWcTf80', '0812345678908', 'Nate', 2013),
('myme@gmail.com', 'oV$6q74AsUS9', '0812345678902', 'Darcy', 1991),
('nobita@gmail.com', 'Tr6*xB43qHK5', '0812345678906', 'Nobita', 2007);

INSERT INTO genre VALUES 
(1, 'Medical TV Shows'),
(2, 'Comedies'),
(3, 'Drama'),
(4, 'Teen Movies'),
(5, 'Family Movie'),
(6, 'Thriller');

INSERT INTO favorite_genre VALUES
('ab@gmail.com', 1),
('ab@gmail.com', 2),
('browneyenancy@gmail.com', 6),
('karedo.mebrown@gmail.com', 1),
('katakana@gmail.com', 2),
('kinosuke@gmail.com', 1),
('kinosuke@gmail.com', 3),
('mamdu@gmail.com', 5),
('mipo@gmail.com', 2),
('myme@gmail.com', 2),
('nobita@gmail.com', 4),
('nobita@gmail.com', 6);

INSERT INTO movie VALUES
(1, 'Cells at Work', 'One newcomer red blood cell just wants to do her job. Between bacteria incursions and meeting a certain white blood cell, she has got a lot to learn', 2021, NULL, 1, 16),
(2, 'Imperfect', 'As a cosmetics company employee deals with insecurities about her body image, she consider a transformation for a chance at a promotion.', 2019, '1:52:00', 2, 13),
(3, 'Habibie and Ainun', 'In this biopic, a medical student challenges societal norms to become a physician and eventually serves as first lady of Indonesia', 2019, '2:00:20', 3, 13),
(4, 'Feel the Beat', 'After blowing a Broadway audition, a self-centered dancer reluctatly returns home and agress to coach a squad of young hopefuls for a big competition.', 2020, '1:50:00', 4, 7),
(5, 'Yes Day', 'A mom and dad who usually say no decide to say yes to their kids wildest requests with a few ground rules on a whirlwind day of fun and adventure.', 2021, '1:29:00', 5, 7),
(6, 'A Cinderella Story', 'A teen meets the boy of her dreams at a dance before returning to toil in her stepmother dinner. Can her lost cell phone bring them together?', 2004, '1:35:00', 2, 7),
(7, 'The Chalk Line', 'After a couple finds a traumatized child of unknown origins, wife Paula must decipher the girl strange behaviours to unlock her identity and dark past.', 2022, '1:47:00', 6, 16),
(8, 'Cleaning Up', 'Three cleaning ladies at an investment firm get their hands on insider stock information and take a chance on a scheme that could change their lives', 2022, NULL, 6, 13),
(9, 'Through the Darkness', 'A team of tenacious detectives study the minds of murderers at a time when Korea first serial murders terrorized the nation. Based on true events.', 2022, NULL, 6, 16),
(10, 'Kungfu Panda the Dragon Knight', 'Legendary warrior Po teams up with an elite English knight on a global quest to rescue magical weapons, restore his reputation -- and save the world!', 2022, NULL, 2, 7);

INSERT INTO episode VALUES
(1, 1, 1, 'Pneumococcus', '0:23:00'),
(1, 1, 2, 'Scrape Wound', '0:23:00'),
(1, 1, 3, 'Influenza', '0:23:00'),
(1, 1, 4, 'Food Poisoning', '0:23:00'),
(1, 1, 5, 'Cedar Pollen Allergy', '0:23:00'),
(1, 2, 1, 'Erythroblasts and Myelocytes', '1:23:00'),
(1, 2, 2, 'Cancer Cells', '0:23:00'),
(1, 2, 3, 'The Circulatory System', '0:23:00'),
(1, 2, 4, 'Thymocytes', '0:23:00'),
(1, 2, 5, 'Staphylococcus aureus', '0:23:00'),
(8, 1, 1, 'Episode 1', '1:09:00'),
(8, 1, 2, 'Episode 2', '1:00:00'),
(8, 1, 3, 'Episode 3', '1:08:00'),
(8, 1, 4, 'Episode 4', '1:09:00'),
(9, 1, 1, 'Episode 1', '1:09:00'),
(9, 1, 2, 'Episode 2', '1:00:00'),
(9, 1, 3, 'Episode 3', '1:08:00'),
(9, 1, 4, 'Episode 4', '1:09:00'),
(9, 1, 5, 'Episode 5', '1:03:00'),
(9, 1, 6, 'Episode 6', '1:01:00'),
(10, 1, 1, 'A cause for the Paws', '0:24:00'),
(10, 1, 2, 'The Knights Code', '1:30:00'),
(10, 1, 3, 'The Lotus', '0:24:00'),
(10, 1, 4, 'The Legend of Master Longtooth', '0:24:00');

INSERT INTO watch_history VALUES
(1, 'ab@gmail.com', 1, 2, 1, '2020-10-1 5:00', '0:23:00', 'YES'),
(2, 'ab@gmail.com', 1, 2, 2, '2020-10-2 6:00', '0:10:00', 'NO'),
(3, 'ab@gmail.com', 1, 2, 1, '2020-10-2 6:10', '1:08:00', 'YES'),
(4, 'browneyenancy@gmail.com', 10, 1, 2, '2020-10-5 20:00', '0:24:00', 'NO'),
(5, 'katakana@gmail.com', 8, 1, 1, '2020-10-11 19:00', '0:09:00', 'NO'),
(6, 'myme@gmail.com', 9, 1, 4, '2020-10-21 15:00', '1:09:00', 'NO'),
(7, 'myme@gmail.com', 10, 1, 3, '2020-10-23 17:00', '0:15:00', 'YES'),
(8, 'nobita@gmail.com', 10, 1, 2, '2020-10-24 15:00', '0:24:00', 'NO'),
(9, 'mipo@gmail.com', 10, 1, 2, '2020-10-27 10:00', '1:10:00', 'YES'),
(10, 'mipo@gmail.com', 10, 1, 2, '2020-10-28 10:00', '1:30:00', 'YES');

