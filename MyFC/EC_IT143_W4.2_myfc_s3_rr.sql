USE EC_IT143_DA;
GO

-- Q: How many players are on each team?

-- A: Let's count the players in MyFC.dbo.tblPlayerDim and group them by team, using tblTeamDim for the team code...

SELECT t.t_id AS team_id
     , t.t_code AS team_code
     , COUNT(p.pl_id) AS player_count
  FROM MyFC.dbo.tblTeamDim AS t
       LEFT JOIN MyFC.dbo.tblPlayerDim AS p ON p.t_id = t.t_id
 GROUP BY t.t_id
        , t.t_code
 ORDER BY t.t_id;
