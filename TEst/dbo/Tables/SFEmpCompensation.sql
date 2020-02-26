CREATE TABLE [dbo].[SFEmpCompensation] (
    [Id]                   INT            NULL,
    [StartDate]            DATETIME2 (7)  NULL,
    [SeqNumber]            INT            NULL,
    [UserId]               INT            NULL,
    [EndDate]              DATETIME2 (7)  NULL,
    [LastModifiedDate]     DATETIME2 (7)  NULL,
    [CreatedDateTime]      DATETIME2 (7)  NULL,
    [MMcarrier]            NVARCHAR (150) NULL,
    [MMName]               NVARCHAR (150) NULL,
    [EventReason]          NVARCHAR (150) NULL,
    [LastModifiedOn]       DATETIME2 (7)  NULL,
    [MMNumber]             NVARCHAR (30)  NULL,
    [PayGrade]             NVARCHAR (30)  NULL,
    [LastModifiedDateTime] DATETIME       NULL
);

