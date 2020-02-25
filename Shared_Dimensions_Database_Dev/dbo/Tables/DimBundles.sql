CREATE TABLE [dbo].[DimBundles] (
    [BundleID]                INT              IDENTITY (1, 1) NOT NULL,
    [RosterDistrictID]        INT              NULL,
    [RosterBundleID]          INT              NULL,
    [BundleName]              VARCHAR (50)     NULL,
    [BundleQuantityIncrement] NUMERIC (18, 3)  NULL,
    [BundleCost_PerBundle]    NUMERIC (18, 2)  NULL,
    [BundleCost_Fixed]        NUMERIC (18, 2)  NULL,
    [BundleUnitTypeID]        VARCHAR (10)     NULL,
    [AcceptableQuantityList]  VARCHAR (8000)   NULL,
    [UpperBoundquantity]      INT              NULL,
    [ConfigName]              VARCHAR (1024)   NULL,
    [BundleType]              INT              NULL,
    [CreditOptionID]          SMALLINT         NULL,
    [OrderTypeID]             SMALLINT         NULL,
    [CRUDLocationTypeID]      INT              NULL,
    [CRUDLocationChangeDate]  DATETIME         NULL,
    [RowGuid]                 UNIQUEIDENTIFIER NULL,
    [DimCountryID]            INT              NULL,
    [DimRegionID]             INT              NULL,
    [DimDistrictID]           INT              NULL
);


GO
CREATE NONCLUSTERED INDEX [DimBundles_BundleID]
    ON [dbo].[DimBundles]([BundleID] ASC)
    INCLUDE([BundleName]);


GO
CREATE NONCLUSTERED INDEX [DimBundles_DimCountryID]
    ON [dbo].[DimBundles]([DimCountryID] ASC)
    INCLUDE([RosterDistrictID], [RosterBundleID], [BundleName], [BundleUnitTypeID], [CreditOptionID], [DimDistrictID]);

