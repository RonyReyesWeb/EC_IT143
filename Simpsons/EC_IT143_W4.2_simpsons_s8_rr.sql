USE EC_IT143_DA;
GO

-- Q: How much has each family member spent on the Planet Express card?

-- A: Let's add up the Amount column in Simpsons.dbo.Planet_Express for each Card_Member...

EXEC dbo.usp_simpsons_planet_express_spending_load;
