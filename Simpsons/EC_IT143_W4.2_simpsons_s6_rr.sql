USE EC_IT143_DA;
GO

-- Q: How much has each family member spent on the Planet Express card?

-- A: Let's add up the Amount column in Simpsons.dbo.Planet_Express for each Card_Member...


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
