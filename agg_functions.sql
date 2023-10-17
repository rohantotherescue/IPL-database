-- display the maximum, minimum and average runs of each player
SELECT MAX(Runs), MIN(Runs), AVG(Runs) FROM player;

------------------------------------------------------
-- display the teamid, team name and the captain name of all the teams whose win_percent is above average
SELECT TeamID, TeamName, Captain FROM team WHERE Win_percent > (SELECT AVG(Win_percent) FROM team);

-----------------------------------------------------
-- display the number of players in each team
SELECT Team_Name, COUNT(*) FROM player GROUP BY Team_Name;

------------------------------------------------------
-- display the average amount sponsored by the sponsor
SELECT TeamID, AVG(Amount) FROM sponsor GROUP BY TeamID;