USE EC_IT143_DA;
GO

-- Q: How many players are on each team?

-- A: Let's count the players in MyFC.dbo.tblPlayerDim and group them by team, using tblTeamDim for the team code...

EXEC dbo.usp_myfc_players_per_team_load;
