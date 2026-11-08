USE EC_IT143_DA;
GO

DROP VIEW IF EXISTS dbo.v_simpsons_planet_express_spending_load;
GO

CREATE VIEW dbo.v_simpsons_planet_express_spending_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_simpsons_planet_express_spending_load
PURPOSE: Simpsons Planet Express Spending - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/08/2026   RREYES        1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

    SELECT pe.Card_Member AS card_member
         , COUNT(*) AS transaction_count
         , ROUND(SUM(pe.Amount), 2) AS total_spent
      FROM Simpsons.dbo.Planet_Express AS pe
     WHERE pe.Card_Member IS NOT NULL
     GROUP BY pe.Card_Member;
GO
