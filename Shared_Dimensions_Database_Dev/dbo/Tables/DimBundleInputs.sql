CREATE TABLE [dbo].[DimBundleInputs] (
    [BundleInputID]              INT              IDENTITY (1, 1) NOT NULL,
    [BundleName]                 VARCHAR (50)     NULL,
    [BundleID]                   INT              NULL,
    [BundleType]                 INT              NULL,
    [BundleTypeName]             VARCHAR (255)    NULL,
    [RosterBundleInputID]        INT              NULL,
    [SelectionGroup]             VARCHAR (50)     NULL,
    [BundleCost_PerBundle]       NUMERIC (18, 2)  NULL,
    [BundleCost_Fixed]           NUMERIC (18, 2)  NULL,
    [AcceptableQuantityList]     VARCHAR (8000)   NULL,
    [UpperBoundQuantity]         INT              NULL,
    [CostAdjustment_Fixed]       NUMERIC (18, 4)  NULL,
    [CostAdjustment_PerBundle]   NUMERIC (18, 4)  NULL,
    [NumberOfUnits_Fixed]        NUMERIC (18, 3)  NULL,
    [NumberOfUnits_PerBundle]    NUMERIC (18, 3)  NULL,
    [KgPerUnit]                  NUMERIC (18, 3)  NULL,
    [RosterInputID]              INT              NULL,
    [InputID]                    INT              NULL,
    [InputName]                  NVARCHAR (100)   NULL,
    [CountryID]                  INT              NULL,
    [CountryName]                NVARCHAR (30)    NULL,
    [RegionID]                   INT              NULL,
    [RegionName]                 NVARCHAR (50)    NULL,
    [RosterDistrictID]           INT              NULL,
    [DistrictID]                 INT              NULL,
    [DistrictName]               NVARCHAR (30)    NULL,
    [rowguid]                    UNIQUEIDENTIFIER NULL,
    [BundleUnitTypeID]           VARCHAR (10)     NULL,
    [RequiredBundleInputID]      INT              NULL,
    [RequiredBundleQuantityFrom] NUMERIC (18, 3)  NULL,
    [RequiredBundleQuantityTo]   NUMERIC (18, 3)  NULL,
    [Isdeleted]                  INT              DEFAULT ((0)) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [BundleInputs_Index]
    ON [dbo].[DimBundleInputs]([BundleID] ASC, [RosterDistrictID] ASC)
    INCLUDE([RosterInputID]);

