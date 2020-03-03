CREATE TABLE [dbo].[DimRosterSeason] (
    [DateAdded]               INT             NOT NULL,
    [RosterSeasonID]          INT             NOT NULL,
    [DistrictID]              INT             NOT NULL,
    [SeasonName]              VARCHAR (50)    NOT NULL,
    [SeasonStartDate]         INT             NULL,
    [SeasonEndDate]           INT             NULL,
    [USDSeasonalExchangeRate] DECIMAL (18, 2) NULL,
    [OAFOperationalYear]      INT             NULL,
    [DimRosterSeasonID]       INT             IDENTITY (1, 1) NOT NULL
);

