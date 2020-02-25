CREATE TABLE [dbo].[dbo.DimItem_Old] (
    [ItemID]      INT            NULL,
    [Item_Code]   NVARCHAR (60)  NULL,
    [ItemName]    NVARCHAR (100) NULL,
    [ItmsGrpCod]  SMALLINT       NULL,
    [ItmsGrpNam]  NVARCHAR (20)  NULL,
    [SellItem]    VARCHAR (1)    NULL,
    [InvntItem]   VARCHAR (1)    NULL,
    [DfltWH]      NVARCHAR (8)   NULL,
    [BuyUnitMsr]  NVARCHAR (100) NULL,
    [SalUnitMsr]  NVARCHAR (100) NULL,
    [InvntryUom]  NVARCHAR (100) NULL,
    [U_SUB_GR]    NVARCHAR (40)  NULL,
    [Status]      VARCHAR (8)    NULL,
    [CountryCode] NVARCHAR (10)  NULL,
    [CountryName] NVARCHAR (MAX) NULL
);

