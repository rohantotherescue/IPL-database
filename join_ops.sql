-- Display all players who play for teamid 1
SELECT P.FirstName, P.Bats, P.Bowls, P.No_of_Matches FROM player AS P NATURAL JOIN team AS T WHERE P.TeamID=1;

----------------------------------

-- display the medics and coaches of the same team
SELECT M.TeamID, M.LastName, M.Specialization , C.LastName, C.Coaching_style
FROM medic as M
INNER JOIN coach as C
ON M.TeamID = C.TeamID;

-----------------------------------

-- display the players and coaches of the same team
SELECT P.FirstName, P.LastName, C.FirstName, C.LastName, P.Team_Name
FROM player AS P
RIGHT JOIN coach as C
ON C.TeamID = P.TeamID;

-------------------------------------
-- display all the sponsors of the teams
SELECT S.Name, T.TeamName FROM sponsor AS S LEFT JOIN team AS T ON S.TeamID = T.TeamID;
