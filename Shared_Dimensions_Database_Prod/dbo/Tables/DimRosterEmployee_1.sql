CREATE TABLE [dbo].[DimRosterEmployee] (
    [EmployeeId]       INT              IDENTITY (1, 1) NOT NULL,
    [SiteEmployeeID]   INT              NULL,
    [RosterSiteID]     INT              NULL,
    [RosterEmployeeID] INT              NULL,
    [RosterDistrictID] INT              NULL,
    [DimDistrictID]    INT              NULL,
    [DimSiteID]        INT              NULL,
    [StartDate]        DATE             NULL,
    [EndDate]          DATE             NULL,
    [FirstName]        VARCHAR (255)    NULL,
    [LastName]         VARCHAR (255)    NULL,
    [PayrollID]        VARCHAR (20)     NULL,
    [RowGuid]          UNIQUEIDENTIFIER NULL,
    [DimCountryID]     INT              NULL,
    [DimRegionID]      INT              NULL,
    [DimSectorID]      INT              NULL,
    [HREmployeeID]     INT              NULL,
    [AccountType]      VARCHAR (20)     NULL,
    [Active]           INT              NULL,
    [EmployeeType]     VARCHAR (10)     NULL,
    [RosterSectorID]   INT              NULL
);

