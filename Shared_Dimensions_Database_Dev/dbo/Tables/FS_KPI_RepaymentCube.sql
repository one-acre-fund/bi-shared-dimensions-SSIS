CREATE TABLE [dbo].[FS_KPI_RepaymentCube] (
    [DimClientID]   INT             NULL,
    [DimGroupID]    INT             NULL,
    [DimDistrictID] INT             NULL,
    [DimRegionID]   INT             NULL,
    [DimSiteID]     INT             NULL,
    [DimSectorID]   INT             NULL,
    [DimSeasonID]   INT             NULL,
    [RepaidDate]    DATETIME        NULL,
    [RepaymentDate] INT             NULL,
    [Amount]        MONEY           NOT NULL,
    [TotalCredit]   DECIMAL (18, 5) NULL
);

