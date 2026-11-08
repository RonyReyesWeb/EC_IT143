USE EC_IT143_DA;
GO

-- Q: How many players are on each team?

-- A: Let's count the players in MyFC.dbo.tblPlayerDim and group them by team, using tblTeamDim for the team code...


-- 1) Reload data

TRUNCATE TABLE dbo.t_myfc_players_per_team;

INSERT INTO dbo.t_myfc_players_per_team
       (team_id, team_code, player_count)
       SELECT v.team_id
            , v.team_code
            , v.player_count
         FROM dbo.v_myfc_players_per_team_load AS v;

-- 2) Review results

SELECT t.*
  FROM dbo.t_myfc_players_per_team AS t;
