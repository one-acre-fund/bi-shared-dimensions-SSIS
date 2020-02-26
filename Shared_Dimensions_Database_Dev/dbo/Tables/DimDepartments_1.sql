CREATE TABLE [dbo].[DimDepartments] (
    [DepartmentID]          INT           IDENTITY (1, 1) NOT NULL,
    [DepartmentCode]        NVARCHAR (8)  NULL,
    [DepartmentName]        NVARCHAR (30) NULL,
    [CountryId]             INT           NULL,
    [Active]                VARCHAR (1)   NULL,
    [SAPActive]             VARCHAR (1)   NULL,
    [RosterActive]          INT           NULL,
    [ValidFrom]             DATETIME      NULL,
    [ValidTo]               DATETIME      NULL,
    [WebPortalDepartmentId] INT           NULL,
    [DepartmentType]        NVARCHAR (50) NULL
);

