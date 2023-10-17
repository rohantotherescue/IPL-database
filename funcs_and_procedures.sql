-- to find the total wins of a team
DELIMITER $$
CREATE FUNCTION total_wins(Team_Name varchar(255))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE win int;
SELECT COUNT(*) INTO win FROM game
WHERE Team_Name= Winner;
RETURN win;
END $$

DELIMITER;

SELECT TeamID, TeamName, total_wins(TeamName) FROM team;
-----------------------------------------------------------------------
-- to check if a player is a captain or not
DELIMITER $$
CREATE PROCEDURE is_captain(IN player_id INT(11), OUT msg VARCHAR(255))
BEGIN
DECLARE tid INT(11);
DECLARE capn VARCHAR(255);
DECLARE pfname VARCHAR(255);
DECLARE plname VARCHAR(255);
SELECT LastName into plname from player WHERE PlayerID = player_id;
SELECT FirstName into pfname from player WHERE PlayerID = player_id;
SELECT p.TeamID INTO tid FROM player as p
WHERE p.PlayerID= player_id;
SELECT t.Captain INTO capn FROM team as t
WHERE t.TeamID= tid;


IF capn= (pfname+" "+plname) THEN
SET msg = "Yes";
ELSE 
SET msg = "No";
END IF;
END $$

DELIMITER;

SELECT * FROM player;

--yes
SET @n = 12;
CALL is_captain(@n, @m);
SELECT @m;
--NO

---------------------------------------------------------------------------
-- to find players of a particular batting style
DELIMITER $$
CREATE PROCEDURE batting_style(IN bat_style VARCHAR(255), OUT pid INT(11))
BEGIN
SELECT p.PlayerID INTO pid FROM player as p
WHERE p.Bats= bat_style;
END $$

DELIMITER;

-------------------------------------------------------------------------------------
-- to update the number of wickets taken
DELIMITER $$
CREATE PROCEDURE howzaat(IN player_id INT(11))
BEGIN
UPDATE player SET Wickets= Wickets+1 WHERE player_id= PlayerID;
END $$

DELIMITER;

CALL howzaat(14);