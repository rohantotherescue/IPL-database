-- display the players and coaches of RCB
SELECT P.FirstName , P.LastName FROM player as P
WHERE P.Team_Name= "Royal Challengers Bangalore"
UNION 
SELECT C.FirstName, C.LastName FROM coach as C
WHERE C.TeamID= 1;
-------------------------------------------------------------------------

-- no medic assignned
SELECT TeamName FROM team as T
WHERE NOT EXISTS (SELECT MedID FROM medic as M WHERE M.TeamID= T.TeamID);
------------------------------------------------------------------------------
-- NET WORTH ABOVE 500 INVESTMENT ABOVE 200
SELECT TeamID FROM team
WHERE Net_Worth > 500
INTERSECT
SELECT TeamID FROM sponsor
WHERE Amount > 200;
----------------------------------------------------------------------
-- LEFT HANDED BATSMAN
SELECT FirstName, LastName, Team_Name FROM player
WHERE Bats= 'Left-Handed'
INTERSECT
SELECT FirstName, LastName, Team_Name FROM player
WHERE TeamID=5;

-----------------------------