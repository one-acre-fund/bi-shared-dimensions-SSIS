CREATE TABLE [dbo].[SFPersonalInfo] (
    [Id]                INT            NULL,
    [EndDate]           DATETIME2 (7)  NULL,
    [CreatedDateTime]   DATETIME2 (7)  NULL,
    [StartDate]         DATETIME2 (7)  NULL,
    [ExternalId]        NVARCHAR (30)  NULL,
    [PreferredName]     NVARCHAR (150) NULL,
    [SecondNationality] NVARCHAR (50)  NULL,
    [LastName]          NVARCHAR (150) NULL,
    [FirstName]         NVARCHAR (150) NULL,
    [MiddleName]        NVARCHAR (30)  NULL,
    [Gender]            NVARCHAR (30)  NULL,
    [LastModifiedDate]  DATETIME2 (7)  NULL,
    [MaritalStatus]     NVARCHAR (30)  NULL,
    [Title]             NVARCHAR (100) NULL
);

