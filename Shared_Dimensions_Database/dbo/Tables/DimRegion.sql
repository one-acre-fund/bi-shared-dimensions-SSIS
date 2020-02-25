CREATE TABLE [dbo].[DimRegion] (
    [RegionID]          INT              IDENTITY (1, 1) NOT NULL,
    [RegionName]        VARCHAR (100)    NULL,
    [RegionType]        VARCHAR (255)    NULL,
    [WebPortalRegionId] INT              NULL,
    [RosterRegionId]    INT              NULL,
    [ProgramId]         INT              NULL,
    [Program]           NVARCHAR (20)    NULL,
    [CountryID]         INT              NULL,
    [CountryCode]       NVARCHAR (8)     NULL,
    [CountryName]       NVARCHAR (20)    NULL,
    [GMT]               VARCHAR (6)      NULL,
    [RowGuid]           UNIQUEIDENTIFIER NULL
);

