CREATE TABLE [dbo].[DimSite] (
    [SiteID]            INT              IDENTITY (1, 1) NOT NULL,
    [SiteName]          NVARCHAR (255)   NULL,
    [RosterSiteID]      INT              NULL,
    [Active]            BIT              NULL,
    [FirstSeason]       INT              NULL,
    [LastSeason]        INT              NULL,
    [SiteProjectCode]   VARCHAR (255)    NULL,
    [CountryID]         INT              NULL,
    [CountryCode]       NVARCHAR (8)     NULL,
    [CountryName]       NVARCHAR (20)    NULL,
    [Program]           NVARCHAR (20)    NULL,
    [RegionID]          INT              NULL,
    [RegionName]        VARCHAR (100)    NULL,
    [DistrictID]        INT              NULL,
    [DistrictName]      NVARCHAR (50)    NULL,
    [RosterDistrictID]  INT              NULL,
    [SectorID]          INT              NULL,
    [SectorName]        NVARCHAR (50)    NULL,
    [RosterSectorID]    INT              NULL,
    [RowGuid]           UNIQUEIDENTIFIER NULL,
    [RosterFirstSeason] INT              NULL,
    [RosterLastSeason]  INT              NULL,
    [Coordinates]       VARBINARY (MAX)  NULL,
    [Latitude]          FLOAT (53)       NULL,
    [Longitude]         FLOAT (53)       NULL,
    [RosterEmployeeID]  INT              NULL,
    [FirstName]         VARCHAR (255)    NULL,
    [LastName]          VARCHAR (255)    NULL,
    [DistrictCode]      NVARCHAR (10)    NULL,
    [WebPortalSiteID]   INT              NULL,
    [IsDeleted]         INT              DEFAULT ((0)) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [DimSite_SiteID]
    ON [dbo].[DimSite]([SiteID] ASC);

