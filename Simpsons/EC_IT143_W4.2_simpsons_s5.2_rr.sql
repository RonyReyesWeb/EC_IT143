USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_simpsons_planet_express_spending;
GO

CREATE TABLE dbo.t_simpsons_planet_express_spending
(
    card_member       NVARCHAR(100) NOT NULL,
    transaction_count INT NOT NULL
                      DEFAULT 0,
    total_spent       DECIMAL(12, 2) NOT NULL
                      DEFAULT 0,
    CONSTRAINT PK_t_simpsons_planet_express_spending PRIMARY KEY CLUSTERED(card_member ASC)
);
GO
