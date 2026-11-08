USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_myfc_players_per_team_load;
GO

CREATE VIEW dbo.v_myfc_players_per_team_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_myfc_players_per_team_load
PURPOSE: MyFC Players per Team - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/08/2026   RREYES        1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

    SELECT t.t_id AS team_id
         , t.t_code AS team_code
         , COUNT(p.pl_id) AS player_count
      FROM MyFC.dbo.tblTeamDim AS t
           LEFT JOIN MyFC.dbo.tblPlayerDim AS p ON p.t_id = t.t_id
     GROUP BY t.t_id
            , t.t_code;
GO
