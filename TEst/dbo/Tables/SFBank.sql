CREATE TABLE [dbo].[SFBank] (
    [Id]                     INT            NULL,
    [BankBranch]             NVARCHAR (30)  NULL,
    [BankCountry]            NVARCHAR (100) NULL,
    [BankName]               NVARCHAR (100) NULL,
    [BusinessIdentifierCode] NVARCHAR (450) NULL,
    [City]                   NVARCHAR (100) NULL,
    [CreatedDateTime]        DATETIME2 (7)  NULL,
    [SwiftCode]              NVARCHAR (30)  NULL,
    [BankId]                 NVARCHAR (100) NULL,
    [LastModified]           DATETIME       NULL
);

