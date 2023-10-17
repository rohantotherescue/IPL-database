CREATE TABLE TEAM
(
  TeamID INT NOT NULL,
  TeamName VARCHAR(255) NOT NULL,
  Owner VARCHAR(255) NOT NULL,
  Net_Worth INT NOT NULL,
  Year_formed INT NOT NULL,
  Captain VARCHAR(255) NOT NULL,
  Win_percent INT NOT NULL,
  Fairplay_points INT NOT NULL,
  No_of_players INT NOT NULL,
  Table_Rank INT NOT NULL,
  Head_coach VARCHAR(255) NOT NULL,
  PRIMARY KEY (TeamID)
);

----------------------------------------------------------------------------------------------------------

CREATE TABLE GAME
(
  MatchID INT NOT NULL,
  Location VARCHAR(255) NOT NULL,
  StartTime TIME NOT NULL,
  Commentator VARCHAR(255) NOT NULL,
  Winner VARCHAR(255) NOT NULL,
  Date DATE NOT NULL,
  TeamID_1 INT NOT NULL,
  TeamID_2 INT NOT NULL,
  PRIMARY KEY (MatchID),
  FOREIGN KEY (TeamID_1) REFERENCES TEAM(TeamID),
  FOREIGN KEY (TeamID_2) REFERENCES TEAM(TeamID)
);

----------------------------------------------------------------------------------------------------------

CREATE TABLE PLAYER
(
  PlayerID INT NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255),
  Team_Name VARCHAR(255) NOT NULL,
  Runs INT NOT NULL,
  Wickets INT NOT NULL,
  DOB DATE NOT NULL,
  Bats VARCHAR(255) NOT NULL,
  Bowls VARCHAR(255) NOT NULL,
  No_of_Matches INT NOT NULL,
  TeamID INT NOT NULL,
  PRIMARY KEY (PlayerID),
  FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID)
);

----------------------------------------------------------------------------------------------------------

CREATE TABLE COACH
(
  CoachID INT NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255),
  Years_of_Exp INT NOT NULL,
  DOB DATE NOT NULL,
  Coaching_style VARCHAR(255) NOT NULL,
  TeamID INT NOT NULL,
  PRIMARY KEY (CoachID),
  FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID)
);

----------------------------------------------------------------------------------------------------------

CREATE TABLE MEDIC
(
  MedID INT NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255),
  Specialization VARCHAR(255) NOT NULL,
  Hospital VARCHAR(255) NOT NULL,
  Years_of_Exp INT,
  TeamID INT NOT NULL,
  PRIMARY KEY (MedID),
  FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID)
);

----------------------------------------------------------------------------------------------------------

CREATE TABLE INVENTORY
(
  Name INT NOT NULL,
  Quantity INT NOT NULL,
  InventoryID INT NOT NULL,
  TeamID INT NOT NULL,
  PRIMARY KEY (InventoryID),
  FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID)
);

----------------------------------------------------------------------------------------------------------

CREATE TABLE SPONSOR
(
  Amount INT NOT NULL,
  Name INT NOT NULL,
  TeamID INT NOT NULL,
  PRIMARY KEY (Name),
  FOREIGN KEY (TeamID) REFERENCES TEAM(TeamID)
);