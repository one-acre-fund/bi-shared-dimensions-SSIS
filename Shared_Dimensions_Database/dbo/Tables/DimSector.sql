CREATE TABLE [dbo].[DimSector] (
    [SectorID]          INT              IDENTITY (1, 1) NOT NULL,
    [SectorName]        NVARCHAR (50)    NULL,
    [Active]            BIT              NULL,
    [RosterSectorID]    INT              NULL,
    [RosterFirstSeason] INT              NULL,
    [RosterLastSeason]  INT              NULL,
    [CountryID]         INT              NULL,
    [CountryCode]       NVARCHAR (8)     NULL,
    [CountryName]       NVARCHAR (20)    NULL,
    [Program]           NVARCHAR (20)    NULL,
    [RegionID]          INT              NULL,
    [RegionName]        VARCHAR (100)    NULL,
    [DistrictID]        INT              NULL,
    [DistrictName]      NVARCHAR (50)    NULL,
    [RosterDistrictId]  INT              NULL,
    [GovDistrictId]     INT              NULL,
    [RowGuid]           UNIQUEIDENTIFIER NULL,
    [FirstSeason]       INT              NULL,
    [LastSeason]        INT              NULL
);

