USE LifeSimulationGame;
GO

/*NOTE: MAKE ANOTHER SUPERNATURAL VALUE: HUMAN AND ASSIGN THAT INSTEAD OF NULL. STUDENT IS ALSO PROBLEMATIC*/
/*
MODIFYING DATABASE FOR BETTER MANAGEMENT: problem with relationship: tables dont appaer
ALTER TABLE Community DROP CONSTRAINT FK__Community__TownI__403A8C7D;
ALTER TABLE Community DROP COLUMN TownID;
ALTER TABLE Residential DROP CONSTRAINT FK__Residenti__TownI__440B1D61;
ALTER TABLE Residential DROP COLUMN TownID;
ALTER TABLE Residential DROP COLUMN NumOfTenant; 
ALTER TABLE Student ALTER COLUMN Grade VARCHAR(30);
ALTER TABLE Student ALTER COLUMN Performance VARCHAR(3);
ALTER TABLE Student ALTER COLUMN Club VARCHAR(40); 
ALTER TABLE Motive DROP CONSTRAINT FK__Motive__SimID__30F848ED;
ALTER TABLE Motive DROP COLUMN SimID; 
ALTER TABLE Motive DROP CONSTRAINT FK__Motive__PetID__31EC6D26;
ALTER TABLE Motive DROP COLUMN PetID;
ALTER TABLE Skill DROP CONSTRAINT FK__Skill__PetID__35BCFE0A;
ALTER TABLE Skill DROP COLUMN PetID;
ALTER TABLE Skill DROP CONSTRAINT FK__Skill__SimID__34C8D9D1;
ALTER TABLE Skill DROP COLUMN SimID;
ALTER TABLE Supernatural DROP CONSTRAINT FK__Supernatu__SimID__5629CD9C;
ALTER TABLE Supernatural DROP COLUMN SimID;
ALTER TABLE Job DROP COLUMN Employer;
ALTER TABLE Relationship ADD InRelationshipWithSim INT NOT NULL;
ALTER TABLE Relationship ADD CONSTRAINT FK_InRelationshipWithSim FOREIGN KEY (InRelationshipWithSim) REFERENCES Sim(SimID);
ALTER TABLE Sim ADD Supernatural INT NOT NULL;
ALTER TABLE Sim ADD CONSTRAINT FK_Supernatural FOREIGN KEY (Supernatural) REFERENCES Supernatural(SupernaturalID); 
ALTER TABLE Relationship DROP CONSTRAINT FK__Relations__NPCID__398D8EEE;
ALTER TABLE Relationship DROP COLUMN NPCID;
DROP TABLE Pet; 
ALTER TABLE Skill DROP COLUMN SkillLevel; 
ALTER TABLE Property ALTER COLUMN SimID INT;
ALTER TABLE Sim ALTER COLUMN Supernatural INT;
ALTER TABLE Job ALTER COLUMN BusinessID INT NULL;
*/
/*
/*Skills. Similar to motives. SAME APPROACH WITH MOTIVES*/
INSERT INTO Skill(SkillID, SkillName) VALUES
(1, 'Acting'),
(2, 'Archaeology'),
(3, 'Baking'),
(4, 'Bowling'),
(5, 'Charisma'),
(6, 'Comedy'),
(7, 'Cooking'),
(8, 'DJ Mixing'),
(9, 'Dancing'),
(10, 'Fishing'),
(11, 'Fitness'),
(12, 'Flower Arranging'),
(13, 'Gardening'),
(14, 'Gourmet Cooking'),
(15, 'Guitar'),
(16, 'Handiness'),
(17, 'Herbalism'),
(18, 'Logic'),
(19, 'Media Production'),
(20, 'Mischief'),
(21, 'Mixology'),
(22, 'Painting'),
(23, 'Parenting'),
(24, 'Pet Training'),
(25, 'Photography'),
(26, 'Piano'),
(27, 'Pipe Organ'),
(28, 'Programming'),
(29, 'Rocket Science'),
(30, 'Selvadoradian Culture'),
(31, 'Singing'),
(32, 'Vampiric Lore'),
(33, 'Veterinarian'),
(34, 'Video Gaming'),
(35, 'Violin'),
(36, 'Wellness'),
(37, 'Writing'),
(38, 'Alchemy'),
(39, 'Magick'),
(40, 'Telepathy'),
(41, 'Fairy Special Skill'),
(42, 'Gardening'),
(43, 'Flexibility'),
(44, 'Fitness');

/*34 Sims: ALL sims and NPCs have motives and there are 6 motives only. Might drop fk. Create a second table SimMotive NPCMotive to avoid duplicates
DROP FK, CREATE ANOTHER TABLE SIMMOTIVE WITH FKS MOTIVE, Sim and NPC*/
INSERT INTO Motive(MotiveID, MotiveName, MotiveLevel) VALUES 
(1,'Hunger', 10),
(2,'Bladder', 10),
(3,'Hygiene', 10),
(4,'Fun', 10),
(5,'Social', 10),
(6,'Energy', 10);

CREATE TABLE SimMotive(
ID INT NOT NULL PRIMARY KEY,
SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID),
MotiveID INT NOT NULL FOREIGN KEY REFERENCES Motive(MotiveID),
);
*/
/*
INSERT INTO SimMotive(ID, SimID, MotiveID) VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,1,5),
(6,1,6),
(7,2,1),
(8,2,2),
(9,2,3),
(10,2,4),
(11,2,5),
(12,2,6),
(13,3,1),
(14,3,2),
(15,3,3),
(16,3,4),
(17,3,5),
(18,3,6),
(19,4,1),
(20,4,2),
(21,4,3),
(22,4,4),
(23,4,5),
(24,4,6),
(25,5,1),
(26,5,2),
(27,5,3),
(28,5,4),
(29,5,5),
(30,5,6),
(31,6,1),
(32,6,2),
(33,6,3),
(34,6,4),
(35,6,5),
(36,6,6),
(37,7,1),
(38,7,2),
(39,7,3),
(40,7,4),
(41,7,5),
(42,7,6),
(43,8,1),
(44,8,2),
(45,8,3),
(46,8,4),
(47,8,5),
(48,8,6),
(49,9,1),
(50,9,2),
(51,9,3),
(52,9,4),
(53,9,5),
(54,9,6),
(55,10,1),
(56,10,2),
(57,10,3),
(58,10,4),
(59,10,5),
(60,10,6),
(61,11,1),
(62,11,2),
(63,11,3),
(64,11,4),
(65,11,5),
(66,11,6),
(67,12,1),
(68,12,2),
(69,12,3),
(70,12,4),
(71,12,5),
(72,12,6),
(73,13,1),
(74,13,2),
(75,13,3),
(76,13,4),
(77,13,5),
(78,13,6),
(79,14,1),
(80,14,2),
(81,14,3),
(82,14,4),
(83,14,5),
(84,14,6),
(85,15,1),
(86,15,2),
(87,15,3),
(88,15,4),
(89,15,5),
(90,15,6),
(91,16,1),
(92,16,2),
(93,16,3),
(94,16,4),
(95,16,5),
(96,16,6),
(97,17,1),
(98,17,2),
(99,17,3),
(100,17,4),
(101,17,5),
(102,17,6),
(103,18,1),
(104,18,2),
(105,18,3),
(106,18,4),
(107,18,5),
(108,18,6),
(109,19,1),
(110,19,2),
(111,19,3),
(112,19,4),
(113,19,5),
(114,19,6),
(115,20,1),
(116,20,2),
(117,20,3),
(118,20,4),
(119,20,5),
(120,20,6),
(121,21,1),
(122,21,2),
(123,21,3),
(124,21,4),
(125,21,5),
(126,21,6),
(127,22,1),
(128,22,2),
(129,22,3),
(130,22,4),
(131,22,5),
(132,22,6),
(133,23,1),
(134,23,2),
(135,23,3),
(136,23,4),
(137,23,5),
(138,23,6),
(139,24,1),
(140,24,2),
(141,24,3),
(142,24,4),
(143,24,5),
(144,24,6),
(145,25,1),
(146,25,2),
(147,25,3),
(148,25,4),
(149,25,5),
(150,25,6),
(151,26,1),
(152,26,2),
(153,26,3),
(154,26,4),
(155,26,5),
(156,26,6),
(157,27,1),
(158,27,2),
(159,27,3),
(160,27,4),
(161,27,5),
(162,27,6),
(163,28,1),
(164,28,2),
(165,28,3),
(166,28,4),
(167,28,5),
(168,28,6),
(169,29,1),
(170,29,2),
(171,29,3),
(172,29,4),
(173,29,5),
(174,29,6),
(175,30,1),
(176,30,2),
(177,30,3),
(178,30,4),
(179,30,5),
(180,30,6),
(181,31,1),
(182,31,2),
(183,31,3),
(184,31,4),
(185,31,5),
(186,31,6),
(187,32,1),
(188,32,2),
(189,32,3),
(190,32,4),
(191,32,5),
(192,32,6),
(193,33,1),
(194,33,2),
(195,33,3),
(196,33,4),
(197,33,5),
(198,33,6),
(199,34,1),
(200,34,2),
(201,34,3),
(202,34,4),
(203,34,5),
(204,34,6);

/*
CREATE TABLE SimSkill(
ID INT NOT NULL PRIMARY KEY,
Level INT NOT NULL,
SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID),
SkillID INT NOT NULL FOREIGN KEY REFERENCES Skill(SkillID),
);
*/

INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 1, 8, SimID, SkillID FROM Sim, Skill WHERE Name = 'Emmit Phelipeau' AND SkillName = 'Cooking';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 2, 10, SimID, SkillID FROM Sim, Skill WHERE Name = 'Charissa Bownass' AND SkillName = 'Dancing';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 3, 6, SimID, SkillID FROM Sim, Skill WHERE Name = 'Branden Pigot' AND SkillName = 'Handiness';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 4, 4, SimID, SkillID FROM Sim, Skill WHERE Name = 'Torrie Phelipeau' AND SkillName = 'Gardening';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 5, 6, SimID, SkillID FROM Sim, Skill WHERE Name = 'Teodorico Scotts' AND SkillName = 'Fitness';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 6, 5, SimID, SkillID FROM Sim, Skill WHERE Name = 'Morna McAughtrie' AND SkillName = 'Comedy';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 7, 8, SimID, SkillID FROM Sim, Skill WHERE Name = 'Mikael Axston' AND SkillName = 'Painting';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 8, 3, SimID, SkillID FROM Sim, Skill WHERE Name = 'Kaylyn Peak' AND SkillName = 'Mixology';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 9, 8, SimID, SkillID FROM Sim, Skill WHERE Name = 'Vincents Patesel' AND SkillName = 'Singing';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 10, 4, SimID, SkillID FROM Sim, Skill WHERE Name = 'Padraig Pechold' AND SkillName = 'Acting';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 11, 6, SimID, SkillID FROM Sim, Skill WHERE Name = 'Kylynn Scotts' AND SkillName = 'Acting';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 12, 7, SimID, SkillID FROM Sim, Skill WHERE Name = 'Esmaria Villar' AND SkillName = 'Telepathy';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 13, 3, SimID, SkillID FROM Sim, Skill WHERE Name = 'Geordie Peplow' AND SkillName = 'Violin';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 14, 5, SimID, SkillID FROM Sim, Skill WHERE Name = 'Holly-anne Gildea' AND SkillName = 'Alchemy';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 15, 7, SimID, SkillID FROM Sim, Skill WHERE Name = 'Wat Violett' AND SkillName = 'Piano';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 16, 8, SimID, SkillID FROM Sim, Skill WHERE Name = 'Kristyn Bickford' AND SkillName = 'Baking';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 17, 3, SimID, SkillID FROM Sim, Skill WHERE Name = 'Russ Bickford' AND SkillName = 'Archaeology';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 18, 8, SimID, SkillID FROM Sim, Skill WHERE Name = 'Lavena Savins' AND SkillName = 'Mischief';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 19, 10, SimID, SkillID FROM Sim, Skill WHERE Name = 'Karlis Schoenrock' AND SkillName = 'Parenting';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 20, 5, SimID, SkillID FROM Sim, Skill WHERE Name = 'Thebault Schoenrock' AND SkillName = 'Bowling';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 21, 7, SimID, SkillID FROM Sim, Skill WHERE Name = 'Odetta Acreman' AND SkillName = 'Charisma';
INSERT INTO SimSkill(ID,Level, SimID, SkillID) SELECT 22, 6, SimID, SkillID FROM Sim, Skill WHERE Name = 'Elvera Axston' AND SkillName = 'Fishing';

INSERT INTO Supernatural(SupernaturalID, SupernaturalKind) VALUES
(1,'Plantsim'),
(2,'Vampire'),
(3,'Witch'),
(4,'Fairy'),
(5,'Werewolf'),
(6,'Alien'),
(7,'Bigfoot'),
(8,'Ghost'),
(9,'Genie'),
(10,'Elf');

INSERT INTO Town(TownID, TownName, MonthID) SELECT 1, 'Pleasantview', MonthID FROM Months WHERE MonthName = 'January';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 2, 'Strangetown', MonthID FROM Months WHERE MonthName = 'March';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 3, 'Veronaville', MonthID FROM Months WHERE MonthName = 'June';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 4, 'Riverblossom Hills', MonthID FROM Months WHERE MonthName = 'April';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 5, 'Desiderata Valley',  MonthID FROM Months WHERE MonthName = 'May';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 6, 'Sunset Valley',  MonthID FROM Months WHERE MonthName = 'February';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 7, 'Belladonna Cove',  MonthID FROM Months WHERE MonthName = 'December';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 8, 'Riverview',  MonthID FROM Months WHERE MonthName = 'July';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 18, 'Sunlit Tides',  MonthID FROM Months WHERE MonthName = 'October';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 19, 'Roaring Heights',  MonthID FROM Months WHERE MonthName = 'September';
INSERT INTO Town(TownID, TownName, MonthID) SELECT 20, 'Lucky Palms', MonthID FROM Months WHERE MonthName = 'November';

INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 1, 100000, 'Phelipeau', 1, TownID FROM Town WHERE TownName = 'Lucky Palms';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 2, 30000, 'Pechold',5, TownID FROM Town WHERE TownName = 'Riverview';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 3, 50000, 'McAughtrie',4,TownID FROM Town WHERE TownName = 'Isla Paradiso';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 4,32500, 'Scotts',3,TownID FROM Town WHERE TownName = 'Sunset Valley';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 5,45689,'Axston',1,TownID FROM Town WHERE TownName = 'Twinbrook';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 6,3446,'Villar',4,TownID FROM Town WHERE TownName = 'Belladonna Cove';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 7,799995,'McDugal',4,TownID FROM Town WHERE TownName = 'Appaloosa Plains';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 8,120000,'Varnam',4,TownID FROM Town WHERE TownName = 'Starlight Shores';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 9,43666,'Acreman',2,TownID FROM Town WHERE TownName = 'Barnacle Bay';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 10,54789,'Bickford',3,TownID FROM Town WHERE TownName = 'Roaring Heights';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 11,49940,'Savins',1,TownID FROM Town WHERE TownName = 'Strangetown';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 12,943984,'Schoenrock',4,TownID FROM Town WHERE TownName = 'Veronaville';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 13,946809,'Rontsch',2,TownID FROM Town WHERE TownName = 'Pleasantview';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 14,1000000,'Patesel',3,TownID FROM Town WHERE TownName = 'Desiderata Valley';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 15,43590,'Peak',5,TownID FROM Town WHERE TownName = 'Riverblossom Hills';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 16,93958,'Peplow',3,TownID FROM Town WHERE TownName = 'Dragon Valley';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 17,38795,'Gildea',4,TownID FROM Town WHERE TownName = 'Sunlit Tides';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 18,500000,'Pigot',6,TownID FROM Town WHERE TownName = 'Hidden Springs';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 19, 60000,'Bownass',2,TownID FROM Town WHERE TownName = 'Lunar Lakes';
INSERT INTO Household(HouseholdID, Wealth, FamilyName, DifficultyLevel, TownID) SELECT 20,980454,'Violett',2,TownID FROM Town WHERE TownName = 'Roaring Heights';

INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID, Supernatural) SELECT 1, 'Sylvester Phelipeau', 'Male', 17, 'Ambitious, Glutton, Squeamish','None', HouseholdID, NULL FROM Household WHERE FamilyName = 'Phelipeau';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 2, 'Emmit Phelipeau', 'Male', 30, 'Vegetarian,Family-oriented,Insider','Faithful',HouseholdID, NULL FROM Household WHERE FamilyName = 'Phelipeau';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID, Supernatural) SELECT 3, 'Torrie Phelipeau', 'Female', 33,'Mean, Self-Absorbed, Paranoid','Natasha',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Phelipeau' AND SupernaturalKind = 'Fairy';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 4, 'Padraig Pechold', 'Male', 75,'Hates Children, Outgoing, Geek','Player',HouseholdID, NULL FROM Household WHERE FamilyName = 'Pechold';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 5, 'Nealson Pechold', 'Male', 68,'Art Lover, Perfectionist, Loves Outdoors','Faithful',HouseholdID, NULL FROM Household WHERE FamilyName = 'Pechold';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 6, 'Winnie Pigot', 'Male', 16,'Wild, Silly, Inquisitive','None',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Pigot' AND SupernaturalKind = 'Fairy';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 7, 'Charissa Bownass', 'Male', 44,'Snob, Jealous, Self-Assured','Exploring Options',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Bownass' AND SupernaturalKind = 'Vampire';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 8, 'Branden Pigot', 'Male', 33,'Dog Lover, Kleptomaniac, Materialistic', 'None',HouseholdID, NULL FROM Household WHERE FamilyName = 'Pigot';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 9, 'Morna McAughtrie', 'Female', 20,'Romantic, Active, Erratic','Manipulator',HouseholdID, NULL FROM Household WHERE FamilyName = 'McAughtrie';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 10,'Teodorico Scotts', 'Male', 50,'Alluring, Materialistic,Lazy','Casanova',HouseholdID, NULL FROM Household WHERE FamilyName = 'Scotts';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 11, 'Kylynn Scotts', 'Female', 48,'Neat, Dance Machine, Childish','Heartbreaker',HouseholdID, NULL FROM Household WHERE FamilyName = 'Scotts';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 12, 'Wat Violett', 'Male',50,'Clumsy,Absent-minded,Bookworm','Don Juan',HouseholdID, NULL FROM Household WHERE FamilyName = 'Violett';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 13, 'Elvera Axston', 'Female',42,'Hot-Headed, Goofball, Unflirty','None',HouseholdID, NULL FROM Household WHERE FamilyName = 'Axston';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 14, 'Mikael Axston', 'Male', 25,'Creative, Cheerful, Green Fiend','Faithful',HouseholdID, NULL FROM Household WHERE FamilyName = 'Axston';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 15, 'Holly-anne Gildea', 'Female', 24,'Slob, Vegetarian, Good','Faithful',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Gildea' AND SupernaturalKind = 'Ghost';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 16, 'Esmaria Villar', 'Female', 30,'Noncommittal, Insider, Evil','Dirtbag',HouseholdID, NULL FROM Household WHERE FamilyName = 'Villar';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 17, 'Gearard Villar', 'Male', 16,'Bro, Freegan, Child of the Ocean','Exploring Options',HouseholdID, NULL FROM Household WHERE FamilyName = 'Villar';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 18, 'Darrelle McDugal', 'Female',26,'Music Lover, Gloomy, Genius ','Naughty',HouseholdID, NULL FROM Household WHERE FamilyName = 'McDugal';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 19, 'Imogene McDugal', 'Female', 13,'Independent, Fussy, Charmer','None',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'McDugal' AND SupernaturalKind = 'Genie';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 20, 'Ximenez Varnam', 'Male', 26,'Cat Lover, Maker, Muser','Exploring Options',HouseholdID, NULL FROM Household WHERE FamilyName = 'Varnam';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 21, 'Terri Acreman', 'Male', 20,'Business Savvy, Materialistic, Collector','Heartbreaker',HouseholdID, NULL FROM Household WHERE FamilyName = 'Acreman';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 22, 'Leonelle Acreman', 'Female', 38,'Gregarious,	Home Turf, Good','Faithful',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Acreman' AND SupernaturalKind = 'Plantsim';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 23, 'Odetta Acreman', 'Female', 56,'Jealous, Romantic, Mean','Heartbreaker',HouseholdID, NULL FROM Household WHERE FamilyName = 'Acreman';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 24, 'Kristyn Bickford', 'Female', 60,'Outgoing, Loner, Loves Outdoors','Cheater',HouseholdID, NULL FROM Household WHERE FamilyName = 'Bickford';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 25, 'Russ Bickford', 'Male', 77,'Master Crafter, Bookworm, Creative','Naughty',HouseholdID, NULL FROM Household WHERE FamilyName = 'Bickford';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 26, 'Lavena Savins', 'Female', 34,'Mean, Neat, Goofball','Faithful',HouseholdID, NULL FROM Household WHERE FamilyName = 'Savins';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 27, 'Finley Savins', 'Male', 22,'Snob, Self-Absorbed, Self-Assured','Slimeball',HouseholdID, NULL FROM Household WHERE FamilyName = 'Savins';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 28, 'Karlis Schoenrock', 'Male', 24,'Recycle Disciple, Glutton, Foodie','Player',HouseholdID, NULL FROM Household WHERE FamilyName = 'Schoenrock';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 29, 'Thebault Schoenrock', 'Male', 32,'Art Lover, Active, Perfectionist','Faithful',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Schoenrock' AND SupernaturalKind = 'Werewolf';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 30, 'Linea Rontsch', 'Female', 21,'Genius, Romantic, Ambitious','Faithful',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Rontsch' AND SupernaturalKind = 'Vampire';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 31, 'Vivyanne Rontsch', 'Female', 23,'Clumsy, Childish, Goofball','Natasha',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Rontsch' AND SupernaturalKind = 'Vampire';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 32, 'Vincents Patesel', 'Male', 22,'Erratic, Paranoid, Dance Machine','Exploring Options',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Patesel' AND SupernaturalKind = 'Witch';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 33, 'Kaylyn Peak', 'Female',27,'Diva, Social Butterfly,Snob','Naughty',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Peak' AND SupernaturalKind = 'Fairy';
INSERT INTO Sim(SimID, Name, Gender, Age, PersonalInfo,Reputation, HouseholdID,Supernatural) SELECT 34, 'Geordie Peplow', 'Male',34,'Neurotic, Computer Whiz, Creative','Exploring Options',HouseholdID, SupernaturalID FROM Household, Supernatural WHERE FamilyName = 'Peplow' AND SupernaturalKind = 'Alien';

/*Relationships: Add another SimID and PetID foreign key in relationship with OR Change table name Pet and make it NPC. Or JOIN tables with Sim and Pet. Or drop Petor just enter NULL to pet*/
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 1,'Friend',50, s1.SimID, s2.SimID FROM Sim s1 INNER JOIN Sim s2 ON s1.SimID = s2.SimID WHERE s1.Name = 'Emmit Phelipeau' AND s2.Name = 'Morna McAughtrie';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 2,'Good Friend',50, SimID, SimID FROM Sim WHERE Name = 'Sylvester Phelipeau' AND Name = 'Gearard Villar';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 3,'Spouse',100, SimID, SimID FROM Sim WHERE Name = 'Emmit Phelipeau' AND Name = 'Torrie Phelipeau';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 4,'Spouse',80, SimID, SimID FROM Sim WHERE Name = 'Padraig Pechold' AND Name = 'Nealson Pechold';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 5,'Romantic Interest',98, SimID, SimID FROM Sim WHERE Name = 'Winnie Pigot' AND Name = 'Imogene McDugal';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 6,'Partner',76, SimID, SimID FROM Sim WHERE Name = 'Charissa Bownass' AND Name = 'Branden Pigot';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 7,'Fiance',88, SimID, SimID FROM Sim WHERE Name = 'Morna McAughtrie' AND Name = 'Wat Violett';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 8,'Ex-Spouse',1, SimID, SimID FROM Sim WHERE Name = 'Teodorico Scotts' AND Name = 'Kylynn Scotts';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 9,'Good Friend',70, SimID, SimID FROM Sim WHERE Name = 'Elvera Axston' AND Name = 'Mikael Axston';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 10,'Ex',0, SimID, SimID FROM Sim WHERE Name = 'Holly-anne Gildea' AND Name = 'Ximenez Varnam';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 11,'Best Friends',80, SimID, SimID FROM Sim WHERE Name = 'Esmaria Villar' AND Name = 'Gearard Villar';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 12,'Old Enemies',10, SimID, SimID FROM Sim WHERE Name = 'Darrelle McDugal' AND Name = 'Ximenez Varnam';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 13,'Friend',40, SimID, SimID FROM Sim WHERE Name = 'Terri Acreman' AND Name = 'Leonelle Acreman';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 14,'Enemy',0, SimID, SimID FROM Sim WHERE Name = 'Odetta Acreman' AND Name = 'Kristyn Bickford';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 15,'Acquaintance',20, SimID, SimID FROM Sim WHERE Name = 'Russ Bickford' AND Name = 'Lavena Savins';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 16,'Distant Friend',30, SimID, SimID FROM Sim WHERE Name = 'Finley Savins' AND Name = 'Karlis Schoenrock';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 17,'Enemy',0, SimID, SimID FROM Sim WHERE Name = 'Thebault Schoenrock' AND Name = 'Kaylyn Peak';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 18,'Partner',96, SimID, SimID FROM Sim WHERE Name = 'Linea Rontsch' AND Name = 'Vivyanne Rontsch';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 19,'Friend',50, SimID, SimID FROM Sim WHERE Name = 'Vincents Patesel' AND Name = 'Kaylyn Peak';
INSERT INTO Relationship(RelationshipID,RelationshipTitle, RelationshipLevel, SimID, InRelationshipWithSim) SELECT 20,'Stranger',2, SimID, SimID FROM Sim WHERE Name = 'Geordie Peplow' AND Name = 'Esmaria Villar';

/*Property: Residential and Community*/
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 1,0,0,'50000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Torrie Phelipeau' AND TownName = 'Lucky Palms';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 2,0,0,'250000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Padraig Pechold' AND TownName = 'Riverview';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 3,0,0,'100000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Winnie Pigot' AND TownName = 'Hidden Springs';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 4,0,0,'40000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Elvera Axston' AND TownName = 'Twinbrook';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 5,0,0,'80000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Gearard Villar' AND TownName = 'Belladonna Cove';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 6,0,0,'95000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Ximenez Varnam' AND TownName = 'Starlight Shores';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 7,0,0,'60000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Terri Acreman' AND TownName = 'Barnacle Bay';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 8,0,0,'73500',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Kristyn Bickford' AND TownName = 'Roaring Heights';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 9,0,0,'56800',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Lavena Savins' AND TownName = 'Strangetown';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 10,0,0,'96200',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Teodorico Scotts' AND TownName = 'Sunset Valley';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 11,0,0,'39844',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Vincents Patesel' AND TownName = 'Desiderata Valley';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 12,0,0,'58000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Branden Pigot' AND TownName = 'Hidden Springs';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 13,0,0,'69999',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Charissa Bownass' AND TownName = 'Lunar Lakes';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 14, 0,0,'88508',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Wat Violett' AND TownName = 'Roaring Heights';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 15,0,0,'48895',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Holly-anne Gildea' AND TownName = 'Sunlit Tides';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 16,0,0,'88474',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Esmaria Villar' AND TownName = 'Belladonna Cove';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 17,0,0,'39780',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Darrelle McDugal' AND TownName = 'Appaloosa Plains';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 18,0,0,'300000',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Ximenez Varnam' AND TownName = 'Starlight Shores';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 19,0,0,'58888',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Thebault Schoenrock' AND TownName = 'Veronaville';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 20,0,0,'79555',Sim.Name, SimID, TownID FROM Sim, Town WHERE Sim.Name = 'Kaylyn Peak' AND TownName = 'Riverblossom Hills';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 21,0,0,'49777',NULL, NULL, TownID FROM Town WHERE TownName = 'Lucky Palms';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 22,0,0,'54888',NULL, NULL, TownID FROM Town WHERE TownName = 'Riverview';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 23,0,0,'38988',NULL, NULL, TownID FROM Town WHERE TownName = 'Hidden Springs';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 24,0,0,'78544',NULL, NULL, TownID FROM Town WHERE TownName = 'Twinbrook';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 25,0,0,'78444',NULL, NULL, TownID FROM Town WHERE TownName = 'Belladonna Cove';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 26,0,0,'68944',NULL, NULL, TownID FROM Town WHERE TownName = 'Starlight Shores';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 27,0,0,'58068',NULL, NULL, TownID FROM Town WHERE TownName = 'Barnacle Bay';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 28,0,0,'49308',NULL, NULL, TownID FROM Town WHERE TownName = 'Roaring Heights';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 29,0,0,'35898',NULL, NULL, TownID FROM Town WHERE TownName = 'Strangetown';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 30,0,0,'39068',NULL, NULL, TownID FROM Town WHERE TownName = 'Sunset Valley';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 31,0,0,'57568',NULL, NULL, TownID FROM Town WHERE TownName = 'Desiderata Valley';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 32,0,0,'54745',NULL, NULL, TownID FROM Town WHERE TownName = 'Hidden Springs';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 33,0,0,'47674',NULL, NULL, TownID FROM Town WHERE TownName = 'Lunar Lakes';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 34, 0,0,'34566',NULL, NULL, TownID FROM Town WHERE TownName = 'Roaring Heights';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 35,0,0,'68794',NULL, NULL, TownID FROM Town WHERE TownName = 'Sunlit Tides';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 36,0,0,'34098',NULL, NULL, TownID FROM Town WHERE TownName = 'Belladonna Cove';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 37,0,0,'34896',NULL, NULL, TownID FROM Town WHERE TownName = 'Appaloosa Plains';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 38,0,0,'43980',NULL, NULL, TownID FROM Town WHERE TownName = 'Starlight Shores';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 39,0,0,'87555',NULL, NULL, TownID FROM Town WHERE TownName = 'Veronaville';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 40,0,0,'86797',NULL, NULL, TownID FROM Town WHERE TownName = 'Riverblossom Hills';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 41,0,0,'103333',NULL, NULL, TownID FROM Town WHERE TownName = 'Pleasantview';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 42,0,0,'103333',NULL, NULL, TownID FROM Town WHERE TownName = 'Pleasantview';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 43,0,0,'103333',NULL, NULL, TownID FROM Town WHERE TownName = 'Pleasantview';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 44,0,0,'103333',NULL, NULL, TownID FROM Town WHERE TownName = 'Pleasantview';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 45,0,0,'103333',NULL, NULL, TownID FROM Town WHERE TownName = 'Pleasantview';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 46,0,0,'103333',NULL, NULL, TownID FROM Town WHERE TownName = 'Pleasantview';
INSERT INTO Property(PropertyID, PropertyValue, AreaSize, PropertyAddress, OwnerName, SimID, TownID) SELECT 47,0,0,'103333',NULL, NULL, TownID FROM Town WHERE TownName = 'Pleasantview';

/*Drop TownID*/
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 1,'Brittlebush Academy','School', PropertyID FROM Property WHERE PropertyID = 21; 
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 2,'Admit One Cinema','Entertainment', PropertyID FROM Property WHERE PropertyID = 22;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 3,'A Restaurant For Glimmerbrook','Restuarant', PropertyID FROM Property WHERE PropertyID = 23;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 4,'Flowers On The Roof Park','Park', PropertyID FROM Property WHERE PropertyID = 24;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 5,'Celestial Community School','School', PropertyID FROM Property WHERE PropertyID = 25; 
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 6,'StrangerVille Shipping Container Food Market','Market', PropertyID FROM Property WHERE PropertyID = 26;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 7,'Scuola Simatica','School', PropertyID FROM Property WHERE PropertyID = 27;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 8,'Mojito Mosquito','Bar/Pub/Cafe', PropertyID FROM Property WHERE PropertyID = 28;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 9,'Pleasant Pupil Academy','School', PropertyID FROM Property WHERE PropertyID = 29;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 10,'The Ruby Ramses','Nightclub',PropertyID FROM Property WHERE PropertyID = 30;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 11,'The Island Academy','School',PropertyID FROM Property WHERE PropertyID = 31;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 12,'Alpine Community School','School',PropertyID FROM Property WHERE PropertyID = 32; 
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 13,'South Square Library','Library',PropertyID FROM Property WHERE PropertyID = 33;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 14,'Club Vegas','Nightclub',PropertyID FROM Property WHERE PropertyID = 34;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 15,'SDK Shopping Center','Shopping Mall',PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 16,'Rave Royale','Nightclub',PropertyID FROM Property WHERE PropertyID = 36;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 18,'School of Hard Knocks','School',PropertyID FROM Property WHERE PropertyID = 37; 
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 19,'Hotel Del Luna','Hotel',PropertyID FROM Property WHERE PropertyID = 38;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 20,'Bravo Fitness Center','Fitness Center',PropertyID FROM Property WHERE PropertyID = 39;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 21,'Dahlia Gift Shop','Souvenir Store',PropertyID FROM Property WHERE PropertyID = 40;
INSERT INTO Community(CommunityID, LotName, CommunityType, PropertyID) SELECT 22,'Truelong Community School','School',PropertyID FROM Property WHERE PropertyID = 41;


INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 1,1,1,5600,'Apartment',PropertyID FROM Property WHERE PropertyID = 1; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 2,1,0,0,'Villa',PropertyID FROM Property WHERE PropertyID = 2; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 3,0,1,3500,'Condo',PropertyID FROM Property WHERE PropertyID = 3 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 4,0,0,2300,'Bungalow',PropertyID FROM Property WHERE PropertyID = 4; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 5,1,0,0,'Mansion',PropertyID FROM Property WHERE PropertyID = 5; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 6,1,0,0,'Duplex',PropertyID FROM Property WHERE PropertyID = 6; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 7,0,1,1200,'Apartment',PropertyID FROM Property WHERE PropertyID = 7; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 8,0,0,6800,'Townhouse',PropertyID FROM Property WHERE PropertyID = 8; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 9,1,1,0,'Art Deco',PropertyID FROM Property WHERE PropertyID = 9; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 10,1,1,0,'Colonial',PropertyID FROM Property WHERE PropertyID = 10; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 11,1,1,0,'MidCentury',PropertyID FROM Property WHERE PropertyID = 11; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 12,0,0,4500,'Cabin',PropertyID FROM Property WHERE PropertyID = 12; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 13,0,0,3200,'Chalet',PropertyID FROM Property WHERE PropertyID = 13; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 14,1,0,0,'Cottage',PropertyID FROM Property WHERE PropertyID = 14; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 15,0,0,800,'Studio',PropertyID FROM Property WHERE PropertyID = 15; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 16,1,0,750,'Mobile',PropertyID FROM Property WHERE PropertyID = 16; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 17,1,1,0,'Santa Fe',PropertyID FROM Property WHERE PropertyID = 17; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 18,1,0,4300,'Craftsman',PropertyID FROM Property WHERE PropertyID = 18; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 19,1,1,5400,'Rambler',PropertyID FROM Property WHERE PropertyID = 19; 
INSERT INTO Residential(ResidentialID, PetsAllowed, isFurnitured, RentPrice, ResidentialType, PropertyID) SELECT 20,1,1,4700,'Tudor',PropertyID FROM Property WHERE PropertyID = 20; 

INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 1,80000,10,CommunityID FROM Community WHERE CommunityID = 7 ;
INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 2,15000,10,CommunityID FROM Community WHERE CommunityID = 1 ;
INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 3,5000,7,CommunityID FROM Community WHERE CommunityID = 12 ;
INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 4,NULL,8,CommunityID FROM Community WHERE CommunityID = 9 ;
INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 5,NULL,0,CommunityID FROM Community WHERE CommunityID = 22 ;
INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 6,NULL,9,CommunityID FROM Community WHERE CommunityID = 11 ;
INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 7,NULL,5,CommunityID FROM Community WHERE CommunityID = 18 ;
INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 8,8000,3,CommunityID FROM Community WHERE CommunityID = 5 ;
INSERT INTO School(SchoolCode, Tutition, QualityLevel, CommunityID) SELECT 9,50000,7,CommunityID FROM Community WHERE CommunityID = 18 ;

INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 1, 0,'College Sophomore','Jock','Basketball',10,'C', SimID, SchoolCode FROM Sim, School WHERE Name = 'Terri Acreman' AND SchoolCode = 1;
INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 2,0,'Highschool Senior','Nerd','Video Game',9,'D', SimID, SchoolCode FROM Sim, School WHERE Name = 'Sylvester Phelipeau' AND SchoolCode = 2;
INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 3,0,'Highschool Junior','Nerd','Science Fiction & Fantasy',3,'A', SimID, SchoolCode FROM Sim, School WHERE Name = 'Winnie Pigot' AND SchoolCode = 3;
INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 4,0,'College Senior','Rebel','Poetry',4,'Very B', SimID, SchoolCode FROM Sim, School WHERE Name = 'Finley Savins' AND SchoolCode = 4;
INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 5,0,'College Junior','Rebel','Rock n Roll',9,'C', SimID, SchoolCode FROM Sim, School WHERE Name = 'Linea Rontsch' AND SchoolCode = 5;
INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 6,0,'College Senior','Nerd','Coding',1,'A', SimID, SchoolCode FROM Sim, School WHERE Name = 'Vivyanne Rontsch' AND SchoolCode = 6;
INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 7,0,'College Freshman','Rebel','Chess', 2,'A', SimID, SchoolCode FROM Sim, School WHERE Name = 'Vincents Patesel' AND SchoolCode = 7;
INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 8 ,0,'Highschool Freshman','Rebel','Drama',8,'B', SimID, SchoolCode FROM Sim, School WHERE Name = 'Imogene McDugal' AND SchoolCode = 9;
INSERT INTO Student(StudentID, GPA, Grade, SocialGroup, Club, Popularity, Performance, SimID, SchoolCode) SELECT 9,0,'Highschool Junior','Jock','Student Government',10,'A', SimID, SchoolCode FROM Sim, School WHERE Name = 'Gearard Villar' AND SchoolCode = 8;

INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 1, 'Entertainment', 0, 0, PropertyID FROM Property WHERE PropertyID = 22;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 2,'Restuarant', 0, 0, PropertyID FROM Property WHERE PropertyID = 23;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 3,'Market', 0, 0, PropertyID FROM Property WHERE PropertyID = 26;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 4,'Bar/Pub/Cafe', 0, 0, PropertyID FROM Property WHERE PropertyID = 28;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 5,'Nightclub', 0, 0, PropertyID FROM Property WHERE PropertyID = 30;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 6,'Hotel', 0, 0, PropertyID FROM Property WHERE PropertyID = 38;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 7,'Fitness Center', 0, 0, PropertyID FROM Property WHERE PropertyID = 39;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 8,'Souvenir Store', 0, 0, PropertyID FROM Property WHERE PropertyID = 40; 
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 9,'Shopping Mall', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 10,'Hairdresser', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 11,'Cosmetics Store', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 12,'Musical Instrument Store', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 13,'Bookstore', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 14,'Cinema', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 15,'Entertainment Center', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 16,'Clothes Store', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 17,'Spa and Wellness Center', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 18,'Restuarant', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 19,'Souvenir  Store', 0, 0, PropertyID FROM Property WHERE PropertyID = 35;
INSERT INTO Business(BusinessID, BusinessType, CustomerSatisfaction, StockPrice, PropertyID) SELECT 20,'Grocery Market', 0, 0, PropertyID FROM Property WHERE PropertyID =35;

INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 1,'Hair Dresser','1st Shift','Very Good',30, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 10 AND Name = 'Emmit Phelipeau';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 2,'Cashier','2nd Shift','Average',23, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 3 AND Name = 'Charissa Bownass';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 3,'Makeup Artist','Full-Time','Bad',43, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 11 AND Name = 'Branden Pigot';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 4,'Chef','2nd Shift','Excellent',50, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 2 AND Name = 'Torrie Phelipeau';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 5,'Server','Full-Time','Good',20, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 2 AND Name = 'Teodorico Scotts';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 6,'Cashier','1st Shift','Good',20, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 8 AND Name = 'Morna McAughtrie';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 7,'Bellhop','2nd Shift','Average',14, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 6 AND Name = 'Mikael Axston';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 8,'Manager','Full-Time','Very Good',60, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 6 AND Name = 'Kaylyn Peak';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 9,'Sales Associate','Full-time','Bad',30, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 8 AND Name = 'Vincents Patesel';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 10,'Crafter','Full-Time','Excellent',40, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 19 AND Name = 'Nealson Pechold';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 11,'Actor','Full-Time','Bad',80, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 1 AND Name = 'Padraig Pechold';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 12,'Actress','Full-Time','Very Good',90, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 1 AND Name = 'Kylynn Scotts';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 13,'Freelance Singer','Full-time','Good',65, NULL, SimID FROM Sim WHERE Name = 'Esmaria Villar';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 15,'Freelance Programmer','Full-time','Very Good',90, NULL, SimID FROM Sim WHERE Name = 'Geordie Peplow';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 16,'Freelance Model','Full-time','Excellent',60, NULL, SimID FROM Sim WHERE Name = 'Holly-anne Gildea';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 17,'Dishwasher','Part-Time','Good',15, BusinessID, SimID FROM Business, Sim WHERE BusinessID = 18 AND Name = 'Wat Violett';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 18,'Police Officer','Full-Time','Bad',60, NULL,SimID FROM Sim WHERE Name = 'Kristyn Bickford';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 19,'Investigator','Full-Time','Good',70, NULL,SimID FROM Sim WHERE Name = 'Russ Bickford';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 20,'Doctor','Full-Time','Good',199, NULL,SimID FROM Sim WHERE Name = 'Lavena Savins';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 21,'Nurse','Full-Time','Excellent',98, NULL,SimID FROM Sim WHERE Name = 'Karlis Schoenrock';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 22,'Firefighter','Full-Time','Very Good', 50,NULL,SimID FROM Sim WHERE Name = 'Thebault Schoenrock';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 23,'Mayor','Full-Time','Very Bad',200, NULL,SimID FROM Sim WHERE Name = 'Odetta Acreman';
INSERT INTO Job(JobID,Position, JobShift, Performance, Wage, BusinessID,SimID) SELECT 24,'Manager','Full-Time','Bad',80,NULL,SimID FROM Sim WHERE Name = 'Elvera Axston';

*/
/*SELECT * FROM Months;
SELECT * FROM Pet;*/
/*UPDATE Months
SET Weather = 'Clear'
WHERE MonthID = 5;*/
/*ALTER TABLE Months
ADD SeasonName VARCHAR(10) NOT NULL;*/
/*
INSERT INTO Months (MonthID, NumOfDays, MonthName, Weather, Temperature, SeasonName) VALUES
(1, 31,'January', 'Snow', 27, 'Winter'),
(2, 28,'February', 'Blizzard',34, 'Winter'),
(3, 31,'March', 'Rain',44, 'Spring'),
(4, 30,'April', 'Cloudy',56, 'Spring'),
(5, 31,'May', 'Clear', 68,'Spring'),
(6, 30,'June', 'Windy', 72,'Summer'),
(7, 31,'July', 'Clear', 90,'Summer'),
(8, 31,'August', 'Clear',85, 'Summer'),
(9, 30,'September', 'Rain',60, 'Fall'),
(10, 31,'October', 'Windy', 54,'Fall'),
(11, 30,'November', 'Stormy', 44, 'Fall'),
(12, 31,'December', 'Overcast',42, 'Winter');
*/
