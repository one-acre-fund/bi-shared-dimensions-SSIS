CREATE TABLE [dbo].[SFCostCenter] (
    [Id]                   INT            NULL,
    [StartDate]            DATETIME2 (7)  NULL,
    [ExternalId]           NVARCHAR (30)  NULL,
    [Parent]               NVARCHAR (30)  NULL,
    [LastModifiedDatte]    DATETIME2 (7)  NULL,
    [LocalName]            NVARCHAR (100) NULL,
    [Description]          NVARCHAR (100) NULL,
    [LocalDescription]     NVARCHAR (100) NULL,
    [CostCenterExternalID] NVARCHAR (30)  NULL,
    [Name]                 NVARCHAR (100) NULL,
    [Status]               NVARCHAR (30)  NULL,
    [DescriptionDefault]   NVARCHAR (100) NULL,
    [LastModifiedDateTime] DATETIME       NULL
);

