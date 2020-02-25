CREATE TABLE [dbo].[DimSeasons] (
    [SeasonID]        INT            IDENTITY (1, 1) NOT NULL,
    [RosterSeasonID]  INT            NULL,
    [SeasonName]      NVARCHAR (100) NULL,
    [SAPSeasonCode]   NVARCHAR (50)  NULL,
    [RosterActive]    VARCHAR (3)    NULL,
    [SAPActive]       VARCHAR (3)    NULL,
    [CountryId]       INT            NULL,
    [OperationalYear] INT            NULL,
    [Active]          BIT            NULL,
    [CountryCode]     NVARCHAR (5)   NULL,
    [IsDeleted]       INT            DEFAULT ((0)) NOT NULL,
    [SAPSeasonID]     NVARCHAR (10)  NULL
);

