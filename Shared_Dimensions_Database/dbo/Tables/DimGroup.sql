CREATE TABLE [dbo].[DimGroup] (
    [GroupID]           INT              IDENTITY (1, 1) NOT NULL,
    [GroupName]         NVARCHAR (50)    NULL,
    [RosterGroupID]     INT              NULL,
    [Active]            BIT              NULL,
    [RosterFirstSeason] INT              NULL,
    [RosterLastSeason]  INT              NULL,
    [CountryId]         INT              NULL,
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
    [SiteID]            INT              NULL,
    [SiteName]          NVARCHAR (255)   NULL,
    [RosterSiteID]      INT              NULL,
    [RowGuid]           UNIQUEIDENTIFIER NULL,
    [FirstSeason]       INT              NULL,
    [LastSeason]        INT              NULL,
    [SiteEmployeeID]    INT              NULL,
    [firstname]         VARCHAR (255)    NULL,
    [lastname]          VARCHAR (255)    NULL,
    [payrollid]         VARCHAR (20)     NULL,
    [IsDeleted]         INT              DEFAULT ((0)) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [DimGroup_GroupID]
    ON [dbo].[DimGroup]([GroupID] ASC);


GO
CREATE NONCLUSTERED INDEX [DimGroup_CountryName_DistrictName]
    ON [dbo].[DimGroup]([CountryName] ASC, [DistrictName] ASC)
    INCLUDE([GroupID], [GroupName], [RegionName], [SectorName], [SiteName], [FirstSeason], [LastSeason], [firstname], [lastname]);

