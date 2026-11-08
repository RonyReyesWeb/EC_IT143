USE EC_IT143_DA;
GO

-- Q: How much has each family member spent on the Planet Express card?

-- A: Let's add up the Amount column in Simpsons.dbo.Planet_Express for each Card_Member...

SELECT pe.Card_Member AS card_member
     , COUNT(*) AS transaction_count
     , ROUND(SUM(pe.Amount), 2) AS total_spent
  FROM Simpsons.dbo.Planet_Express AS pe
 WHERE pe.Card_Member IS NOT NULL
 GROUP BY pe.Card_Member
 ORDER BY total_spent DESC;
