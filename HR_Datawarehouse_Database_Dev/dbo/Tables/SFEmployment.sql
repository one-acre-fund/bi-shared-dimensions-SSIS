CREATE TABLE [dbo].[SFEmployment] (
    [Id]                   INT           NULL,
    [PersonId]             NVARCHAR (30) NULL,
    [UserId]               NVARCHAR (30) NULL,
    [LastModifiedDateTime] DATETIME2 (7) NULL,
    [EndDate]              DATETIME2 (7) NULL,
    [CreatedDateTime]      DATETIME2 (7) NULL,
    [StartDate]            DATETIME2 (7) NULL,
    [PrevEmployeeId]       NVARCHAR (50) NULL,
    [OriginalStartDate]    DATETIME2 (7) NULL
);

