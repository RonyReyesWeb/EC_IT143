USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_myfc_players_per_team;
GO

CREATE TABLE dbo.t_myfc_players_per_team
(
    team_id      INT NOT NULL,
    team_code    VARCHAR(25) NOT NULL,
    player_count INT NOT NULL
                 DEFAULT 0,
    CONSTRAINT PK_t_myfc_players_per_team PRIMARY KEY CLUSTERED(team_id ASC)
);
GO
