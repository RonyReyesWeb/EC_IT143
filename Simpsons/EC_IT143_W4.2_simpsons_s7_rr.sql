USE EC_IT143_DA;
GO

DROP PROCEDURE IF EXISTS dbo.usp_simpsons_planet_express_spending_load;
GO

CREATE PROCEDURE dbo.usp_simpsons_planet_express_spending_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_simpsons_planet_express_spending_load
PURPOSE: Simpsons Planet Express Spending - Load user stored procedure

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

        TRUNCATE TABLE dbo.t_simpsons_planet_express_spending;

        INSERT INTO dbo.t_simpsons_planet_express_spending
               (card_member, transaction_count, total_spent)
               SELECT v.card_member
                    , v.transaction_count
                    , v.total_spent
                 FROM dbo.v_simpsons_planet_express_spending_load AS v;

        -- 2) Review results

        SELECT t.*
          FROM dbo.t_simpsons_planet_express_spending AS t;

    END;
GO
