CREATE TABLE [dbo].[DimLocations] (
    [LocationID]          INT              IDENTITY (1, 1) NOT NULL,
    [LocationCode]        NVARCHAR (10)    NULL,
    [LocationName]        NVARCHAR (50)    NULL,
    [CountryID]           INT              NULL,
    [CountryCode]         NVARCHAR (8)     NULL,
    [CountryName]         NVARCHAR (20)    NULL,
    [Program]             NVARCHAR (20)    NULL,
    [RegionID]            INT              NULL,
    [RosterRegionID]      INT              NULL,
    [RegionName]          VARCHAR (100)    NULL,
    [RosterDistrictID]    INT              NULL,
    [RosterActive]        BIT              NULL,
    [SAPActive]           BIT              NULL,
    [WebPortalLocationID] INT              NULL,
    [RowGuid]             UNIQUEIDENTIFIER NULL
);

