-- Triggers

DELIMITER $$
CREATE TRIGGER player_plus_one
AFTER INSERT
ON player FOR EACH ROW
BEGIN
UPDATE team
SET No_of_players= No_of_players+1
WHERE new.TeamID = team.TeamID;
END $$

DELIMITER;

INSERT INTO player VALUES (69, 'Virat', 'Kohli', 'Royal Challengers Bnagalore',2700,20,'1985-09-13','Left-Handed', 'Right-arm fast',61, 1);
---------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER insert_player BEFORE INSERT
ON player FOR EACH ROW
BEGIN
	DECLARE error_msg VARCHAR(255);
	SET error_msg = ('Team cannot have more than 20 players');
	if (SELECT T.No_of_players FROM TEAM AS T WHERE T.TeamID= new.TeamID) > 19 then 
	  SIGNAL SQLSTATE '45000';
	  SET MESSAGE_TEXT = error_msg;
	END IF;
END$$
DELIMITER ;

INSERT INTO player VALUES (611, 'Virat', 'Kohli', 'Royal Challenore',2700,20,'1985-09-13','Left-Handed', 'Right-arm fast',61, 5);

---------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER player_minus_one
AFTER DELETE
ON player FOR EACH ROW
BEGIN
UPDATE team
SET No_of_players= No_of_players-1
WHERE old.TeamID = team.TeamID;
END $$

DELIMITER; 

---------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER win_percent_calculator
AFTER INSERT
ON game FOR EACH ROW
BEGIN
UPDATE team
SET Win_percent= ((SELECT COUNT(*) from game where team.TeamName= game.Winner)/(SELECT COUNT(*) from game))*100
WHERE new.Winner = team.TeamName;
END $$

INSERT INTO game VALUES(10, 'DFGHJKLKJHGF', 17:00:00, 'FGHJKLJHGF', 'Royal Challengers Bangalore',2022-05-13, 10,8);

DELIMITER;
-----------------------------------------------------------------------

-- CURSOR

CREATE TABLE SENIOR_PLAYER
(
  PlayerID INT NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255),
  Team_Name VARCHAR(255),
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

DELIMITER $$
CREATE PROCEDURE insert_senior_players(pid INT(11))
 BEGIN
 DECLARE done INT default 0;
 DECLARE player_id INT;
 DECLARE fName VARCHAR(255);
 DECLARE lName VARCHAR(255);
 DECLARE team_name_var VARCHAR(255);
 DECLARE runs_var INT;
 DECLARE wickets_var INT;
 DECLARE d_o_b DATE;
 DECLARE bat_style VARCHAR(255);
 DECLARE bowl_style VARCHAR(255);
 DECLARE no_of_matches_var INT;
 DECLARE team_id INT;
 DECLARE cur CURSOR FOR SELECT
 PlayerID, FirstName, LastName,Team_Name, Runs, Wickets, DOB, Bats, Bowls, No_of_Matches, TeamID
 FROM player WHERE PlayerID=pid;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

 OPEN cur;
 FETCH cur INTO player_id, fName, lName,team_name_var, runs_var, wickets_var, d_o_b, bat_style, bowl_style, no_of_matches_var, team_id;
 INSERT INTO SENIOR_PLAYER VALUES(player_id, fName, lName,team_name_var, runs_var, wickets_var, d_o_b, bat_style, bowl_style, no_of_matches_var,team_id); 
 CLOSE cur;
 END$$

 DELIMITER $$
 CREATE TRIGGER boomer_players_detector
 AFTER INSERT
 ON player FOR EACH ROW
 BEGIN

 IF (new.DOB < '1985-12-31')
 THEN CALL insert_senior_players(new.PlayerID);
 END IF;
 END$$

 DELIMITLER;

INSERT INTO player(PlayerID, FirstName, LastName, Team_Name, Runs, Wickets, DOB, Bats, Bowls, No_of_Matches, TeamID) VALUES (99, 'Shane', 'Warne','Rajasthan Royals', 3000, 100, '1969-12-24', 'Right-Handed', 'Right-arm off spin', 136, 7);
