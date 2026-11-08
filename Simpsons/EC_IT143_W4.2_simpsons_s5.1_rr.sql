USE EC_IT143_DA;
GO

-- Q: How much has each family member spent on the Planet Express card?

-- A: Let's add up the Amount column in Simpsons.dbo.Planet_Express for each Card_Member...

SELECT v.card_member
     , v.transaction_count
     , v.total_spent
  INTO dbo.t_simpsons_planet_express_spending
  FROM dbo.v_simpsons_planet_express_spending_load AS v;
