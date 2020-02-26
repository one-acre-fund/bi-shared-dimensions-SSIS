CREATE TABLE [dbo].[SFPosition] (
    [Id]                 INT            NULL,
    [Code]               NVARCHAR (20)  NULL,
    [EffectiveStartDate] DATETIME2 (7)  NULL,
    [LastModifiedDate]   DATETIME2 (7)  NULL,
    [CreatedDate]        DATETIME2 (7)  NULL,
    [JobTitle]           NVARCHAR (100) NULL,
    [JobGradeCode]       NVARCHAR (30)  NULL,
    [Division]           NVARCHAR (50)  NULL,
    [CostCenter]         NVARCHAR (50)  NULL,
    [EffectiveStatus]    NVARCHAR (20)  NULL,
    [EffectiveEndDate]   DATETIME2 (7)  NULL,
    [PositionTitle]      NVARCHAR (100) NULL,
    [PayGrade]           NVARCHAR (20)  NULL,
    [Company]            NVARCHAR (50)  NULL,
    [Department]         NVARCHAR (20)  NULL,
    [Location]           NVARCHAR (20)  NULL
);

