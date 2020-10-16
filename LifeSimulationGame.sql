/*CREATE DATABASE LifeSimulationGame;
GO*/

USE LifeSimulationGame;
GO

/*EXEC sp_rename 'Season', 'Months'; 
EXEC sp_rename 'Property.PopertyValue', 'PropertyValue', 'COLUMN';
EXEC sp_rename 'Months.SeasonID', 'MonthID', 'COLUMN'; 
EXEC sp_rename 'Months.SeasonName', 'MonthName', 'COLUMN'; 
EXEC sp_rename 'Town.SeasonID', 'MonthID';*/
/*ALTER TABLE Months

ADD SeasonName VARCHAR(10) NOT NULL;*/

/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table. 
2nd Normal Form: The table is in 2NF: The table meets 1NF requirements; In this table,
each season has a unique season id, and each non-key attribute is fully dependent on
the SeasonID. Therefore, there are no repetation.
3rd Normal Form: The table is in 3rd Normal Form because there are no transitive dependencies:
a non-key attribute is not functionally dependent on another non-key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/

/*CREATE TABLE Season (
	SeasonID INT NOT NULL PRIMARY KEY,
	NumOfDays INT NOT NULL,
	SeasonName VARCHAR(10) NOT NULL,
	Weather VARCHAR(10) NOT NULL,
	Temperature DECIMAL(5,2) NOT NULL,
);*/

/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table. Every Town
is unique.
2nd Normal Form: The table is in 2NF: The table meets 1NF requirements; TownName is unique to
Town and Season Combination, so there are no repetations.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a non key
attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/

/*CREATE TABLE Town(
	TownID INT NOT NULL PRIMARY KEY,
	TownName VARCHAR(30) NOT NULL,
	SeasonID INT NOT NULL FOREIGN KEY REFERENCES Season(SeasonID),
);*/

/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table.
Wealth, FamilyName, and DifficultyLevel depends on Town which is referenced through foreign key. 
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; FamilyName,
Wealth, and Difficultylevel is unique to Household and Town combination. Towns can
have many households. There cannot be same families (households) in the same town,
even though there can be sims with same last/family name, but those would be living
in separate households. 
3rd Normal Form: The table is in 3NF: There are no transitive dependencies
because a non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/

/*CREATE TABLE Household(
	HouseholdID INT NOT NULL PRIMARY KEY,
	Wealth MONEY NOT NULL,
	FamilyName VARCHAR(50) NOT NULL,
	DifficultyLevel INT NOT NULL,
	TownID INT NOT NULL FOREIGN KEY REFERENCES Town(TownID),
);*/

/*
1st Normal Form: The table is in 1NF: There are no repeated valuesi in this table.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; Name, Gender,
Age, Personal info and reputation are unqiue to the Sim and Household. Every sim is
unqiue like every individual is unique in real life. It is strictly not possible to
have duplicate sims. Even though some sims can have the same names, same genders or
even same age, their identities are absolutely unique. 
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because
a non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/

/*
CREATE TABLE Sim(
	SimID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	Age INT NOT NULL,
	PersonalInfo VARCHAR(200) NOT NULL,
	Reputation VARCHAR(20),
	HouseholdID INT NOT NULL FOREIGN KEY REFERENCES Household(HouseholdID),
	/*Sim does not have TownID as an FK because a sim can always travel to different Towns*/
); */

/*
1st Normal Form: The table is in 1NF: There are no repeated valuesi in this table.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; This table
follows the same description as Sim.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a
non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/

/*
CREATE TABLE Pet(
	NPCID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	Age INT NOT NULL,
	PersonalInfo VARCHAR(200) NOT NULL, 
);*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table. Motivename
and motiveLevel depends on Sim and Pet but they are referenced through the foreign key.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; Each Sim and pet
have one and only one of the 6 motives which are Hunger, Bladder, Fun, Energy, Social, Hygiene,
(or other motive since motives may change depending on if the sim is supernatural or not.
For example, vampires do not have hunger. Instead, vampires need plasma. They need blood.
Plantsims need hydration and sun, etc.)
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a non
key attribute does not depend on another non key attribute. MotiveLevel, and MotiveName
depends on MotiveID which is a primary key, and SimID and NPCID which are foreign keys
referenced through Sim and Pet..
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE Motive(
	MotiveID INT NOT NULL PRIMARY KEY,
	MotiveName VARCHAR(10) NOT NULL,
	MotiveLevel INT NOT NULL,
	SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID),
	PetID INT NOT NULL FOREIGN KEY REFERENCES Pet(NPCID),
);
*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table. SkillName
and SkillLevel depends on Sim and Pet but they are referenced through the foreign key.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; Each Sim and pet
can have one and only one type of skill. There cannot be duplicate skills and each skill is unique
3rd Normal Form: The table is in 3NF:  There are no transitive dependencies because a non
key attribute does not depend on another non key attribute. SkillLevel depends on SkillID
which is a primary key, and SimID and NPCID which are foreign keys referenced through Sim and Pet.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE Skill( /*this entity is not an attribute of sim because a sim does not have to have any skills*/
	SkillID INT NOT NULL PRIMARY KEY,
	SkillName VARCHAR(20) NOT NULL,
	SkillLevel INT NOT NULL,
	SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID),
	PetID INT NOT NULL FOREIGN KEY REFERENCES Pet(NPCID),
);
*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table.
RelationshipTitle and RelationshipLevel depends on Sims and Pet but they are referenced
through foreign keys.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; Relationships
are unique for every sim. However, a sim or pet can have more than one relatonship title.
For example, A sim can be both a best friend and a spouse or both enemy and a sibling.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a
non key attribute does not depend on another non key attribute. Relationship Level does
not depend on Relationship title. Relationship level and relationship title depends on
RelationshipID which is a primarykey and Sim and Pet which are foreign keys. Relationship
title does not depend on relationship level. For example, a person can have a very low
relationship level with another sim (they might dislike/hate each other) but that does
not change the fact that they are siblings as in relationship title.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE Relationship( 
	RelationshipID INT NOT NULL PRIMARY KEY,
	RelationshipTitle VARCHAR(20) NOT NULL,
	RelationshipLevel INT NOT NULL,
	SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID), /*simid foreign key referencing sim*/
	NPCID INT NOT NULL FOREIGN KEY REFERENCES Pet(NPCID),
);
*/
/*
1st Normal Form: The table is in 1NF:  There are no repeated values in this table.
Property value, area size, property address, and owner name depends on Sim and Town
which are referenced through foreign keys
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; Properties
may have only one owner. A sim and the town can have many properties. Therefore, it is
appropiate to put Sim and Town as foreign keys into the Property table, which would avoid
duplicate values for propertyID. 
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a
non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE Property(
	PropertyID INT NOT NULL PRIMARY KEY,
	PopertyValue MONEY NOT NULL,
	AreaSize INT NOT NULL,
	PropertyAddress VARCHAR(80) NOT NULL,
	OwnerName VARCHAR(30), /*can be null because does not have to have an owner*/
	SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID), /*owner is a sim*/
	TownID INT NOT NULL FOREIGN KEY REFERENCES Town(TownID),
);
*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table.
LotName, CommunityType depends on Town and Property which are referenced through foreign keys
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; A community
is a property in the town. LotName and CommunityType are unqiue to the Town/Property
combination. Therefore, there are no repetation.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a
non key attribute does not depend on another non key attribute. Thr LotName and CommunityType
depends on the primary key CommunityID.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE Community(
	CommunityID INT NOT NULL PRIMARY KEY,
	LotName VARCHAR(40) NOT NULL,
	CommunityType VARCHAR(30) NOT NULL,
	TownID INT NOT NULL FOREIGN KEY REFERENCES Town(TownID),
	PropertyID INT NOT NULL FOREIGN KEY REFERENCES Property(PropertyID),
);
*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table. PetsAllowed,
isFurnitured, NumOfTenant, RentPrice, ResidentialType depend on Town and Property which are
referenced through foreign keys.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; There are no
repetations in this table and all non-key attributes (PetsAllowed, isFurnitured, NumOfTenant,
RentPrice, and ResidentialType) in this table are unqiue to the Town/property combination.
There are Residential properties in the Town.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a
non key attribute does not depend on another non key attribute. PetsAllowed, isFurnitured,
NumOfTenant, RentPrice, and ResidentialType depend on the primary key ResidentialID.
Boyce-Codd Normal Form: The table is in B-C NF: There are no dependencies.
*/
/*
CREATE TABLE Residential(
	ResidentialID INT NOT NULL PRIMARY KEY,
	PetsAllowed INT NOT NULL, /*boolean value*/
	isFurnitured INT NOT NULL,/*boolean value*/
	NumOfTenant INT, /*can be null because house might not be for rental*/
	RentPrice MONEY,
	ResidentialType VARCHAR(30) NOT NULL,
	TownID INT NOT NULL FOREIGN KEY REFERENCES Town(TownID),
	PropertyID INT NOT NULL FOREIGN KEY REFERENCES Property(PropertyID),
);
*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table. Tuition,
QualityLevel depend on Community and Town which are referenced through foreign keys.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; There are no
repetations in this table; tuition and QualityLevel are unqiue to the Community/Town combination.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a
non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE School( 
	SchoolCode INT NOT NULL PRIMARY KEY,
	Tutition MONEY NOT NULL, /*No cost schools can have $0 tuition*/
	QualityLevel INT NOT NULL,
	CommunityID INT NOT NULL FOREIGN KEY REFERENCES Community(CommunityID), /*propertid foreign key referencing property*/
	TownID INT NOT NULL FOREIGN KEY REFERENCES Town(TownID),
);
*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table. GPA, Grade,
SocialGroup, Club, Popularity, Performance depend on Sim and School which are referenced through
foreign keys.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; Each student is a sim
and a school can have many students. There are no duplicate values of Student and only the
foreign key School repeats since a school can have many since a school can have many students.
Therefore, There are no repetations in this table.Each non-key attribute is unique to the
Sim/School combination.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because a
non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies. 
*/
/*
CREATE TABLE Student (
	StudentID INT NOT NULL PRIMARY KEY,
	GPA DECIMAL(3,2) NOT NULL, 
	Grade VARCHAR(2) NOT NULL,
	SocialGroup VARCHAR(30) NOT NULL, 
	Club VARCHAR(20) NOT NULL,
	Popularity INT NOT NULL, /*the amount of popularity is defined by a numeric value*/
	Performance VARCHAR(20) NOT NULL,
	SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID),
	SchoolCode INT NOT NULL FOREIGN KEY REFERENCES School(SchoolCode),
);
*/
/*
1st Normal Form: The table is in 1NFB: There are no repeated values in this table;
BusinessType, CustomerSatisfaction, and StockPrice depends on Property which
is referenced through foreign key. 
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements;
A business is in a property, and a property can have many businesses.
There cannot be duplicate businesses in a property and BusinessType,
CustomerSatisfaction, and StockPrice are unique to the Property/Business combination.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies
because a non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE Business(
	BusinessID INT NOT NULL PRIMARY KEY,
	BusinessType VARCHAR(30) NOT NULL,
	CustomerSatisfaction VARCHAR(10) NOT NULL,
	StockPrice MONEY NOT NULL,
	PropertyID INT NOT NULL FOREIGN KEY REFERENCES Property(PropertyID),
);
*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table;
Position, Employer, JobShift, Performance, Wage depends on Business and Sim which
are referenced through foreign keys.
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements; Businesses
can have multiple Jobs, and a Sim can have at most 2 jobs. There are no repeations
in the Job attributes. All Job attributes are unique to the Sim/Business combination.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies because
a non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE Job( 
	JobID INT NOT NULL PRIMARY KEY,
	Position VARCHAR(30) NOT NULL,
	Employer VARCHAR(50) NOT NULL,
	JobShift VARCHAR(20) NOT NULL,
	Performance VARCHAR(20) NOT NULL,
	Wage MONEY NOT NULL,
	BusinessID INT NOT NULL FOREIGN KEY REFERENCES Business(BusinessID),
	SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID),
);
*/
/*
1st Normal Form: The table is in 1NF: There are no repeated values in this table;
SupernaturalKind, SupernaturalSkill depends on Sim which is referenced through foreign key. 
2nd Normal Form:  The table is in 2NF: The table meets 1NF requirements;
A sim can have many supernatural powers. For example, a sim can be both a
mermaid and a witch. There are no repetations in Supernatural table, and
all attributes are unique. Only the foreign key Sim can be duplicated for
having many supernatural powers.
3rd Normal Form: The table is in 3NF: There are no transitive dependencies
because a non key attribute does not depend on another non key attribute.
Boyce-Codd Normal Form: The table is in Boyce-Codd Normal Form since there are no functional dependencies.
*/
/*
CREATE TABLE Supernatural(
	SupernaturalID INT NOT NULL PRIMARY KEY,
	SupernaturalKind VARCHAR(30),
	SupernaturalSkill VARCHAR(20),
	SimID INT NOT NULL FOREIGN KEY REFERENCES Sim(SimID)
);
*/
