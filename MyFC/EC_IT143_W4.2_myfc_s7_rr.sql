USE EC_IT143_DA;
GO

DROP PROCEDURE IF EXISTS dbo.usp_myfc_players_per_team_load;
GO

CREATE PROCEDURE dbo.usp_myfc_players_per_team_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_myfc_players_per_team_load
PURPOSE: MyFC Players per Team - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/08/2026   RREYES        1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

    BEGIN

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

    END;
GO
