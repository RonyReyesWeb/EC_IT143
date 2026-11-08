USE EC_IT143_DA;
GO

-- Q: How many players are on each team?

-- A: Let's count the players in MyFC.dbo.tblPlayerDim and group them by team, using tblTeamDim for the team code...

SELECT v.team_id
     , v.team_code
     , v.player_count
  INTO dbo.t_myfc_players_per_team
  FROM dbo.v_myfc_players_per_team_load AS v;
